with Ada.Command_Line;
with Ada.Directories;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

with GNAT.OS_Lib; use GNAT.OS_Lib;

with Project_Tools.Alire_Manifests;
with Project_Tools.Files;
with Project_Tools.Processes;
with Project_Tools.Release_Checks;

package body Check_Humanize_Release is
   use Ada.Text_IO;

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

   procedure Error
     (Errors  : in out Natural;
      Message : String)
   is
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
     (Root    : String;
      Errors  : in out Natural;
      Label   : String;
      Dir     : String;
      Program : String;
      Args    : Argument_List)
   is
      pragma Unreferenced (Root);
   begin
      Project_Tools.Release_Checks.Run
        (Label   => Label,
         Dir     => Dir,
         Program => Program,
         Args    => Args,
         Quiet   => False);
   exception
      when Program_Error =>
         Error (Errors, Label & " failed");
   end Run_Check;

   procedure Check_Example_Output
     (Root   : String;
      Errors : in out Natural)
   is
      Args : Argument_List (1 .. 0);
   begin
      Project_Tools.Release_Checks.Require_Program_Output_Matches_Fenced_Text
        (Expected_File => Root & "/examples/EXPECTED_OUTPUT.md",
         Fence_Label   => "text",
         Dir           => Root,
         Program       => Root & "/examples/bin/humanize_demo",
         Args          => Args,
         Label         => "run humanize demo for expected output",
         Quiet         => True);
   exception
      when Program_Error =>
         Error (Errors, "humanize_demo expected-output check failed");
   end Check_Example_Output;

   procedure Check_Staged_Release_Tree
     (Root       : String;
      Stage_Root : String;
      Errors     : in out Natural)
   is
      I18N_Root : constant String :=
        Ada.Directories.Full_Name (Root & "/../i18n");
      Stage_Pins : constant String :=
        "[[pins]]" & ASCII.LF
        & "i18n = { path = """ & I18N_Root & """ }" & ASCII.LF;
      Build_Tests_Stage_Args : constant Argument_List :=
        (1 => new String'("exec"),
         2 => new String'("--"),
         3 => new String'("gprbuild"),
         4 => new String'("-P"),
         5 => new String'("tests.gpr"));
      Exec_Tests_Stage_Args : constant Argument_List :=
        (1 => new String'("exec"),
         2 => new String'("--"),
         3 => new String'("./bin/tests"));
      Build_Examples_Stage_Args : constant Argument_List :=
        (1 => new String'("exec"),
         2 => new String'("--"),
         3 => new String'("gprbuild"),
         4 => new String'("-P"),
         5 => new String'("examples/examples.gpr"));
      Empty_Args : Argument_List (1 .. 0);
   begin
      Project_Tools.Files.Delete_Tree (Stage_Root);
      Project_Tools.Files.Copy_Release_Source_Tree
        (Source_Dir   => Root,
         Target_Dir   => Stage_Root,
         Skip_Entries =>
           [To_Unbounded_String (".git"),
            To_Unbounded_String ("alire"),
            To_Unbounded_String ("check_humanize"),
            To_Unbounded_String ("lib"),
            To_Unbounded_String ("obj")],
         Skip_Files   =>
           [To_Unbounded_String ("alire.lock"),
            To_Unbounded_String ("alire.build.toml")],
         Quiet        => True);
      Project_Tools.Alire_Manifests.Copy_Release_Manifest
        (Template => Root & "/alire.release.toml",
         Target   => Stage_Root & "/alire.toml",
         Quiet    => True);
      Project_Tools.Alire_Manifests.Require_Staged_Crate_Source
        (Stage_Root, "humanize", "humanize.gpr", Quiet => True);
      Project_Tools.Alire_Manifests.Require_No_Local_Pins
        (Stage_Root & "/alire.toml", Quiet => True);
      Project_Tools.Release_Checks.Require_Absolute_Directory
        (I18N_Root, Quiet => True);
      Project_Tools.Alire_Manifests.Write_Build_Manifest_Overlay
        (Template => Stage_Root & "/alire.toml",
         Target   => Stage_Root & "/alire.build.toml",
         Pins     => Stage_Pins,
         Quiet    => True);
      Project_Tools.Alire_Manifests.Require_Build_Overlay
        (Stage_Root & "/alire.build.toml",
         Stage_Root & "/alire.toml",
         [1 => To_Unbounded_String ("i18n = { path = """ & I18N_Root & """ }")],
         Quiet => True);
      Project_Tools.Alire_Manifests.Activate_Build_Manifest
        (Stage_Root, Quiet => True);

      Run_Check
        (Root, Errors, "build staged release library",
         Stage_Root, Alr_Path, Alr_Build_Args);
      Run_Check
        (Root, Errors, "build staged release tests",
         Stage_Root & "/tests", Alr_Path, Build_Tests_Stage_Args);
      Run_Check
        (Root, Errors, "run staged release tests",
         Stage_Root & "/tests", Alr_Path, Exec_Tests_Stage_Args);
      Run_Check
        (Root, Errors, "build staged release examples",
         Stage_Root, Alr_Path, Build_Examples_Stage_Args);
      Project_Tools.Release_Checks.Require_Program_Output_Matches_Fenced_Text
        (Expected_File => Stage_Root & "/examples/EXPECTED_OUTPUT.md",
         Fence_Label   => "text",
         Dir           => Stage_Root,
         Program       => Stage_Root & "/examples/bin/humanize_demo",
         Args          => Empty_Args,
         Label         => "run staged humanize demo for expected output",
         Quiet         => True);
   exception
      when Program_Error =>
         Error (Errors, "staged pin-free release tree verification failed");
   end Check_Staged_Release_Tree;

   procedure Run_Release_Builds
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Run_Check (Root, Errors, "build humanize library", Root, Alr_Path, Alr_Build_Args);
      Run_Check
        (Root, Errors, "build humanize tests",
         Root & "/tests", Alr_Path, Build_Tests_Args);
      Run_Check
        (Root, Errors, "run humanize tests",
         Root & "/tests", Alr_Path, Exec_Tests_Args);
      Run_Check
        (Root, Errors, "build humanize examples",
         Root, Alr_Path, Build_Examples_Args);
      Check_Example_Output (Root, Errors);
      Run_Check
        (Root, Errors, "build humanize through alr test action",
         Root, Alr_Path, Alr_Test_Args);
      Run_Check
        (Root, Errors, "generate humanize GNATdoc",
         Root, Alr_Path, Gnatdoc_Args);
   end Run_Release_Builds;
end Check_Humanize_Release;
