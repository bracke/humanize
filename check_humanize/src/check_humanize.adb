with Ada.Command_Line;
with Ada.Directories;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

with GNAT.OS_Lib;

with Project_Tools.Alire_Manifests;
with Project_Tools.AUnit_Checks;
with Project_Tools.Processes;
with Project_Tools.Release_Checks;
with Project_Tools.Text;
with Project_Tools.Tree_Checks;

--  Release guard for the humanize crate. Mirrors check_i18n but adapted for a
--  crate that depends on i18n (development path pin) and ships no SPARK units.
procedure Check_Humanize is
   use Ada.Text_IO;
   use GNAT.OS_Lib;

   Alr_Build_Args : constant Argument_List :=
     (1 => new String'("build"));
   Alr_Test_Args : constant Argument_List :=
     (1 => new String'("test"));
   Build_Tests_Args : constant Argument_List :=
     (1 => new String'("exec"),
      2 => new String'("--"),
      3 => new String'("gprbuild"),
      4 => new String'("-P"),
      5 => new String'("tests.gpr"));
   Exec_Tests_Args : constant Argument_List :=
     (1 => new String'("exec"),
      2 => new String'("--"),
      3 => new String'("./bin/tests"));
   Build_Examples_Args : constant Argument_List :=
     (1 => new String'("exec"),
      2 => new String'("--"),
      3 => new String'("gprbuild"),
      4 => new String'("-P"),
      5 => new String'("examples/examples.gpr"));
   Gnatdoc_Args : constant Argument_List :=
     (1 => new String'("exec"),
      2 => new String'("--"),
      3 => new String'("gnatdoc"),
      4 => new String'("-P"),
      5 => new String'("humanize.gpr"));

   function Root_Directory return String is
      Current : constant String := Ada.Directories.Current_Directory;
   begin
      if Ada.Directories.Exists (Current & "/humanize.gpr") then
         return Current;
      elsif Ada.Directories.Exists (Current & "/../humanize.gpr") then
         return Ada.Directories.Full_Name (Current & "/..");
      else
         Put_Line (Standard_Error, "humanize root not found from " & Current);
         Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
         raise Program_Error;
      end if;
   end Root_Directory;

   Root   : constant String := Root_Directory;
   Checks : constant Project_Tools.Release_Checks.Checker :=
     Project_Tools.Release_Checks.Create (Root);
   Errors : Natural := 0;

   procedure Error (Message : String) is
   begin
      Errors := Errors + 1;
      Put_Line (Standard_Error, "error: " & Message);
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   end Error;

   function Alr_Path return String is
   begin
      return Project_Tools.Processes.Locate_Command ("alr");
   end Alr_Path;

   procedure Run_Check
     (Label   : String;
      Dir     : String;
      Program : String;
      Args    : Argument_List)
   is
   begin
      Project_Tools.Release_Checks.Run
        (Label   => Label,
         Dir     => Dir,
         Program => Program,
         Args    => Args,
         Quiet   => False);
   exception
      when Program_Error =>
         Error (Label & " failed");
   end Run_Check;

   procedure Require_Text (Relative_Path : String; Pattern : String; Message : String) is
   begin
      Project_Tools.Release_Checks.Require_Text (Checks, Relative_Path, Pattern);
   exception
      when Program_Error =>
         Error (Message);
   end Require_Text;

   procedure Require_File (Relative_Path : String) is
   begin
      Project_Tools.Release_Checks.Require_File (Checks, Relative_Path);
   exception
      when Program_Error =>
         Error ("missing required file: " & Relative_Path);
   end Require_File;

   procedure Check_Manifest is
   begin
      Project_Tools.Alire_Manifests.Require_Release_Dependency
        (Root & "/alire.toml", "i18n");
      Project_Tools.Alire_Manifests.Require_Workspace_Pin
        (Root & "/alire.toml", "i18n", "../i18n");
   exception
      when Program_Error =>
         Error ("humanize manifest must depend on and pin i18n");
   end Check_Manifest;

   procedure Check_AUnit_Metrics is
      Search  : Ada.Directories.Search_Type;
      Item    : Ada.Directories.Directory_Entry_Type;
      Metrics : Project_Tools.AUnit_Checks.Suite_Metrics;
   begin
      Ada.Directories.Start_Search
        (Search    => Search,
         Directory => Root & "/tests/src",
         Pattern   => "humanize-tests-*.adb",
         Filter    => [Ada.Directories.Ordinary_File => True, others => False]);

      while Ada.Directories.More_Entries (Search) loop
         Ada.Directories.Get_Next_Entry (Search, Item);
         declare
            Text : constant String :=
              To_String
                (Project_Tools.Text.Read_Text_File
                   (Ada.Directories.Full_Name (Item)));
         begin
            Metrics.Section_Count := Metrics.Section_Count + 1;
            Metrics.Registration_Count :=
              Metrics.Registration_Count
              + Project_Tools.AUnit_Checks.Registration_Count (Text);
            Metrics.Assertion_Count :=
              Metrics.Assertion_Count
              + Project_Tools.AUnit_Checks.Assertion_Count (Text);
            Metrics.Test_Body_Count :=
              Metrics.Test_Body_Count
              + Project_Tools.AUnit_Checks.Test_Body_Count (Text);
         end;
      end loop;
      Ada.Directories.End_Search (Search);

      if Metrics.Section_Count < 6 then
         Error ("expected at least 6 Humanize AUnit section bodies");
      end if;
      if Metrics.Registration_Count < 35 then
         Error ("expected at least 35 registered Humanize AUnit tests");
      end if;
      if Metrics.Assertion_Count < 35 then
         Error ("expected at least 35 Humanize AUnit assertions");
      end if;
   exception
      when others =>
         if Ada.Directories.More_Entries (Search) then
            Ada.Directories.End_Search (Search);
         end if;
         raise;
   end Check_AUnit_Metrics;

   procedure Check_Generated_Artifacts is
      Hygiene_Errors : Natural := 0;
   begin
      Project_Tools.Tree_Checks.Check_No_Generated_Python
        (Hygiene_Errors, Root & "/src");
      Project_Tools.Tree_Checks.Check_No_Generated_Python
        (Hygiene_Errors, Root & "/tests/src");
      Project_Tools.Tree_Checks.Check_No_Generated_Python
        (Hygiene_Errors, Root & "/examples");
      Project_Tools.Tree_Checks.Check_No_Generated_Python
        (Hygiene_Errors, Root & "/docs");
      Errors := Errors + Hygiene_Errors;
   end Check_Generated_Artifacts;

   procedure Run_Release_Builds is
   begin
      Run_Check ("build humanize library", Root, Alr_Path, Alr_Build_Args);
      Run_Check ("build humanize tests", Root & "/tests", Alr_Path, Build_Tests_Args);
      Run_Check ("run humanize tests", Root & "/tests", Alr_Path, Exec_Tests_Args);
      Run_Check ("build humanize examples", Root, Alr_Path, Build_Examples_Args);
      Run_Check ("build humanize through alr test action", Root, Alr_Path, Alr_Test_Args);
      Run_Check ("generate humanize GNATdoc", Root, Alr_Path, Gnatdoc_Args);
   end Run_Release_Builds;

begin
   Project_Tools.Processes.Require_Command
     ("alr", "alr executable not found on PATH");
   Project_Tools.Processes.Require_Command
     ("gprbuild", "gprbuild executable not found on PATH");

   Check_Manifest;

   Require_File ("README.md");
   Require_File ("LICENSE");
   Require_File ("humanize.gpr");
   Require_File ("docs/specification.md");
   Require_File ("docs/RELEASE_VERIFICATION.md");
   Require_File ("tests/tests.gpr");
   Require_File ("examples/examples.gpr");

   Require_Text
     ("README.md",
      "docs/RELEASE_VERIFICATION.md",
      "README must point maintainers to release verification");
   Require_Text
     ("README.md",
      "check_humanize",
      "README must mention the check_humanize release guard");
   Require_Text
     ("docs/RELEASE_VERIFICATION.md",
      "check_humanize",
      "release verification must include check_humanize");
   Require_Text
     ("docs/RELEASE_VERIFICATION.md",
      "examples/examples.gpr",
      "release verification must include the examples project build");
   Require_Text
     ("docs/RELEASE_VERIFICATION.md",
      "alr test",
      "release verification must include the Alire test action");
   Require_Text
     ("alire.toml",
      "type = ""test""",
      "Alire manifest must define a test action");

   Check_AUnit_Metrics;
   Check_Generated_Artifacts;
   Run_Release_Builds;

   if Errors = 0 then
      Put_Line ("humanize checks passed");
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
   else
      Put_Line
        (Standard_Error,
         "humanize checks failed:" & Natural'Image (Errors) & " error(s)");
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   end if;
exception
   when Program_Error =>
      null;
end Check_Humanize;
