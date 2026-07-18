with Ada.Command_Line;
with Ada.Directories;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

with Check_Humanize_Policy;
with Check_Humanize_Policy_Config;
with Check_Humanize_Release;
with GNAT.OS_Lib;
with Project_Tools.Files;
with Project_Tools.Processes;
with Project_Tools.Release_Checks;

--  Release guard for the humanize crate. The entry point handles command-line
--  modes and delegates concrete checks to focused local packages.
procedure Check_Humanize is
   use Ada.Text_IO;

   Stage_Root : constant String := "/tmp/humanize-release-stage";

   function Root_Directory return String is
      Current : constant String := Ada.Directories.Current_Directory;
      Root    : constant String :=
        Project_Tools.Files.Find_Root_Upward (Current, "humanize.gpr");
   begin
      if Root = "" then
         Put_Line (Standard_Error, "humanize root not found from " & Current);
         Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
         raise Program_Error;
      else
         return Root;
      end if;
   end Root_Directory;

   Root   : constant String := Root_Directory;
   Errors : Natural := 0;

   procedure Error (Message : String) is
   begin
      Errors := Errors + 1;
      Put_Line (Standard_Error, "error: " & Message);
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   end Error;

   procedure Check_Clean_Git_Worktree
     (Label : String;
      Path  : String)
   is
   begin
      Project_Tools.Release_Checks.Require_Clean_Git_Worktree
        (Label => Label,
         Path  => Path,
         Quiet => True);
   exception
      when Program_Error =>
         Error (Label & " worktree must be clean for --release-strict");
   end Check_Clean_Git_Worktree;

   procedure Check_Strict_Dependency_State is
   begin
      Check_Clean_Git_Worktree ("i18n", Root & "/../i18n");
      Check_Clean_Git_Worktree ("project_tools", Root & "/../project_tools");
   end Check_Strict_Dependency_State;

   procedure Check_Required_Release_Surface is
   begin
      Check_Humanize_Policy.Check_Required_Files (Root, Errors);
      Check_Humanize_Policy.Check_Required_Text (Root, Errors);
   end Check_Required_Release_Surface;

   procedure Require_Alire_GNAT_15 is
      Args   : constant GNAT.OS_Lib.Argument_List :=
        (1 => new String'("exec"),
         2 => new String'("--"),
         3 => new String'("gnatls"),
         4 => new String'("--version"));
      Output : Unbounded_String;
      Status : Integer;
   begin
      Status :=
        Project_Tools.Processes.Run_Status
          (Label   => "GNAT 15 version check",
           Dir     => Root,
           Program => Project_Tools.Processes.Locate_Command ("alr"),
           Args    => Args,
           Output  => Output,
           Quiet   => True);

      if Status /= 0 then
         Error ("could not run `alr exec -- gnatls --version`");
         raise Program_Error;
      elsif Ada.Strings.Fixed.Index
        (To_String (Output), Check_Humanize_Policy_Config.Expected_GNATLS_Prefix)
        = 0
      then
         Error
           ("wrong Ada compiler: manifests must pin "
            & Check_Humanize_Policy_Config.Required_GNAT_Native_Pin
            & " and validation must run an Alire-selected GNATLS 15.2.x "
            & "executable. The gnat_native crate patch may differ from the "
            & "`gnatls --version` patch string; got: "
            & To_String (Output));
         raise Program_Error;
      end if;
   end Require_Alire_GNAT_15;

   procedure Run_Locale_Audit_Report is
      Build_Tests_Args : constant GNAT.OS_Lib.Argument_List :=
        (1 => new String'("exec"),
         2 => new String'("--"),
         3 => new String'("gprbuild"),
         4 => new String'("-P"),
         5 => new String'("tests.gpr"));
      Exec_Audit_Args : constant GNAT.OS_Lib.Argument_List :=
        (1 => new String'("exec"),
         2 => new String'("--"),
         3 => new String'("./bin/locale_audit"));
      Alr_Path : constant String := Project_Tools.Processes.Locate_Command ("alr");

      function Run_Audit_Command
        (Label : String;
         Dir   : String;
         Args  : GNAT.OS_Lib.Argument_List)
         return Boolean
      is
         Output : Unbounded_String;
         Status : Integer;
      begin
         Status :=
           Project_Tools.Processes.Run_Status
             (Label   => Label,
              Dir     => Dir,
              Program => Alr_Path,
              Args    => Args,
              Output  => Output,
              Quiet   => False);

         if Status /= 0 then
            Error (Label & " failed with status" & Integer'Image (Status));
            return False;
         end if;

         return True;
      end Run_Audit_Command;
   begin
      if not Run_Audit_Command
        (Label   => "build locale audit executable",
         Dir     => Root & "/tests",
         Args    => Build_Tests_Args)
      then
         return;
      end if;

      if not Run_Audit_Command
        (Label   => "run locale audit report",
         Dir     => Root & "/tests",
         Args    => Exec_Audit_Args)
      then
         return;
      end if;
   end Run_Locale_Audit_Report;

   procedure Print_Result
     (Success_Message : String;
      Failure_Message : String)
   is
   begin
      if Errors = 0 then
         Put_Line (Success_Message);
         Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
      else
         Put_Line
           (Standard_Error,
            Failure_Message & Natural'Image (Errors) & " error(s)");
         Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
      end if;
   end Print_Result;

   procedure Print_Check_Context is
   begin
      Put_Line
        ("humanize check context: root=" & Root
         & "; i18n=../i18n; project_tools=../project_tools; generated_docs="
         & "docs/GENERATED_DOCS.toml");
   end Print_Check_Context;

   procedure Run_Source_Policy_Guards
     (Check_AUnit       : Boolean;
      Check_Deep_Static : Boolean;
      Check_Builds      : Boolean;
      Check_Staged      : Boolean)
   is
   begin
      Check_Humanize_Policy.Check_Manifest (Root, Errors);
      Print_Check_Context;
      Check_Required_Release_Surface;

      if Check_AUnit then
         Check_Humanize_Policy.Check_AUnit_Metrics (Root, Errors);
         Check_Humanize_Policy.Check_Generated_Artifacts (Root, Errors);
      end if;

      Check_Humanize_Policy.Check_Source_Tree_Artifacts (Root, Errors);
      Check_Humanize_Policy.Check_Tooling_Boundary (Root, Errors);
      Check_Humanize_Policy.Check_Public_Documentation (Root, Errors);
      Check_Humanize_Policy.Check_Examples_Inventory (Root, Errors);

      if Check_AUnit then
         Check_Humanize_Policy.Check_Quality_Guards (Root, Errors);
      end if;

      if Check_Deep_Static then
         Check_Humanize_Policy.Check_Deep_Static (Root, Errors);
      end if;

      if Check_Builds then
         Check_Humanize_Release.Run_Release_Builds (Root, Errors);
      end if;

      if Check_Staged then
         Check_Humanize_Release.Check_Staged_Release_Tree
           (Root, Stage_Root, Errors);
      end if;

      if Check_Builds then
         Check_Humanize_Policy.Check_Compiler_Stderr (Root, Errors);
      end if;
   end Run_Source_Policy_Guards;
begin
   Project_Tools.Processes.Require_Command
     ("alr", "alr executable not found on PATH");
   Require_Alire_GNAT_15;

   if Project_Tools.Processes.Has_Argument ("--release-strict") then
      Check_Strict_Dependency_State;
      if Errors > 0 then
         Print_Result
           ("humanize strict release checks passed",
            "humanize strict release checks failed:");
         return;
      end if;
   end if;

   if Project_Tools.Processes.Has_Argument ("--staged-release-only") then
      Check_Humanize_Policy.Check_Manifest (Root, Errors);
      Check_Humanize_Release.Check_Staged_Release_Tree
        (Root, Stage_Root, Errors);
      Print_Result
        ("humanize staged release checks passed: " & Stage_Root,
         "humanize staged release checks failed:");
      return;
   end if;

   if Project_Tools.Processes.Has_Argument ("--release-fast") then
      Run_Source_Policy_Guards
        (Check_AUnit       => True,
         Check_Deep_Static => False,
         Check_Builds      => True,
         Check_Staged      => False);
      Print_Result
        ("humanize fast release checks passed",
         "humanize fast release checks failed:");
      return;
   end if;

   if Project_Tools.Processes.Has_Argument ("--locale-audit") then
      Run_Locale_Audit_Report;
      Print_Result
        ("humanize locale audit passed",
         "humanize locale audit failed:");
      return;
   end if;

   if Project_Tools.Processes.Has_Argument ("--policy-only") then
      Run_Source_Policy_Guards
        (Check_AUnit       => True,
         Check_Deep_Static => False,
         Check_Builds      => False,
         Check_Staged      => False);
      Print_Result
        ("humanize policy checks passed",
         "humanize policy checks failed:");
      return;
   end if;

   if Project_Tools.Processes.Has_Argument ("--deep-static") then
      Run_Source_Policy_Guards
        (Check_AUnit       => False,
         Check_Deep_Static => True,
         Check_Builds      => False,
         Check_Staged      => False);
      Print_Result
        ("humanize deep static checks passed",
         "humanize deep static checks failed:");
      return;
   end if;

   if Project_Tools.Processes.Has_Argument ("--print-generated-data-manifest") then
      Check_Humanize_Policy.Print_Generated_Data_Manifest (Root);
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
      return;
   end if;

   if Project_Tools.Processes.Has_Argument ("--print-public-api-index") then
      Check_Humanize_Policy.Print_Public_API_Index (Root);
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
      return;
   end if;

   if Project_Tools.Processes.Has_Argument ("--print-public-api-classes") then
      Check_Humanize_Policy.Print_Public_API_Classes (Root);
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
      return;
   end if;

   if Project_Tools.Processes.Has_Argument ("--print-public-api-coverage") then
      Check_Humanize_Policy.Print_Public_API_Coverage (Root);
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
      return;
   end if;

   if Project_Tools.Processes.Has_Argument ("--print-public-api-unit-coverage") then
      Check_Humanize_Policy.Print_Public_API_Unit_Coverage (Root);
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
      return;
   end if;

   Run_Source_Policy_Guards
     (Check_AUnit       => True,
      Check_Deep_Static => False,
      Check_Builds      => True,
      Check_Staged      => True);

   Print_Result ("humanize checks passed", "humanize checks failed:");
exception
   when Program_Error =>
      null;
end Check_Humanize;
