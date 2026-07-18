with Ada.Command_Line;
with Ada.Directories;
with Ada.Environment_Variables;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

with GNAT.OS_Lib; use GNAT.OS_Lib;

with Check_Humanize_Policy_Config;
with Project_Tools.Alire_Manifests;
with Project_Tools.Files;
with Project_Tools.Processes;
with Project_Tools.Release_Checks;

package body Check_Humanize_Release is
   use Ada.Text_IO;

   package Config renames Check_Humanize_Policy_Config;

   Alr_Build_Args : constant Argument_List :=
     (1 => new String'("build"));
   Alr_Update_Args : constant Argument_List :=
     (1 => new String'("update"));
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
   Exec_Perf_Smoke_Args : constant Argument_List :=
     (1 => new String'("exec"),
      2 => new String'("--"),
      3 => new String'("./bin/perf_smoke"));
   Build_Examples_Args : constant Argument_List :=
     (1 => new String'("exec"),
      2 => new String'("--"),
      3 => new String'("gprbuild"),
      4 => new String'("-P"),
      5 => new String'("examples/examples.gpr"));
   Build_Public_API_Consumer_Args : constant Argument_List :=
     (1 => new String'("exec"),
      2 => new String'("--"),
      3 => new String'("gprbuild"),
      4 => new String'("-P"),
      5 => new String'("tests/public_api_consumer/public_api_consumer.gpr"));
   Exec_Public_API_Consumer_Args : constant Argument_List :=
     (1 => new String'("exec"),
      2 => new String'("--"),
      3 => new String'("./tests/public_api_consumer/bin/public_api_consumer"));
   Exec_Public_API_Formatting_Consumer_Args : constant Argument_List :=
     (1 => new String'("exec"),
      2 => new String'("--"),
      3 => new String'("./tests/public_api_consumer/bin/public_api_formatting_consumer"));
   Exec_Public_API_Parsing_Consumer_Args : constant Argument_List :=
     (1 => new String'("exec"),
      2 => new String'("--"),
      3 => new String'("./tests/public_api_consumer/bin/public_api_parsing_consumer"));
   Exec_Public_API_Color_Consumer_Args : constant Argument_List :=
     (1 => new String'("exec"),
      2 => new String'("--"),
      3 => new String'("./tests/public_api_consumer/bin/public_api_color_consumer"));
   Exec_Public_API_Domain_Consumer_Args : constant Argument_List :=
     (1 => new String'("exec"),
      2 => new String'("--"),
      3 => new String'("./tests/public_api_consumer/bin/public_api_domain_consumer"));
   Exec_Public_API_Bounded_Consumer_Args : constant Argument_List :=
     (1 => new String'("exec"),
      2 => new String'("--"),
      3 => new String'("./tests/public_api_consumer/bin/public_api_bounded_consumer"));
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

   function Compiler_Stderr_Diagnostics (Root : String) return String is
      Command : constant String :=
        "find "
        & Project_Tools.Processes.Shell_Quote (Root & "/obj") & " "
        & Project_Tools.Processes.Shell_Quote (Root & "/tests/obj") & " "
        & Project_Tools.Processes.Shell_Quote (Root & "/check_humanize/obj")
        & " -type f -name '*.stderr' -size +0c -print";
   begin
      return Project_Tools.Processes.Shell_Output (Command);
   end Compiler_Stderr_Diagnostics;

   function Concurrent_Build_Processes return String is
      Command : constant String :=
        "ps -eo pid,ppid,stat,etime,comm,args"
        & " | grep -E '(^|/| )(alr|gprbuild|gcc|gnat1|gnatbind|gnatlink)( |$)'"
        & " | grep -v grep";
   begin
      return Project_Tools.Processes.Shell_Output (Command);
   end Concurrent_Build_Processes;

   procedure Report_Failed_Command
     (Root   : String;
      Label  : String;
      Status : Integer)
   is
      Diagnostics : constant String := Compiler_Stderr_Diagnostics (Root);
      Processes   : constant String := Concurrent_Build_Processes;
   begin
      Put_Line
        (Standard_Error,
         Label & " failed with status" & Integer'Image (Status));

      if Diagnostics /= "" then
         Put_Line
           (Standard_Error,
            "nonempty compiler stderr logs were present after the failure:");
         Put_Line (Standard_Error, Ada.Strings.Fixed.Trim (Diagnostics, Ada.Strings.Both));
      else
         Put_Line
           (Standard_Error,
            "no nonempty compiler .stderr logs were present after the failure");
      end if;

      if Processes /= "" then
         Put_Line
           (Standard_Error,
            "active Alire/GPR/GNAT-related processes at failure time:");
         Put_Line (Standard_Error, Ada.Strings.Fixed.Trim (Processes, Ada.Strings.Both));
      else
         Put_Line
           (Standard_Error,
            "no other active Alire/GPR/GNAT-related processes were visible");
      end if;

      if Status < 0 and then Diagnostics = "" then
         Put_Line
           (Standard_Error,
            "negative status without compiler diagnostics usually points to "
            & "an interrupted child process or resource-related termination");
      end if;
   end Report_Failed_Command;

   procedure Run_Check
     (Root    : String;
      Errors  : in out Natural;
      Label   : String;
      Dir     : String;
      Program : String;
      Args    : Argument_List)
   is
      Status : Integer;
   begin
      Status :=
        Project_Tools.Processes.Run_Status
          (Label   => Label,
           Dir     => Dir,
           Program => Program,
           Args    => Args,
           Quiet   => False);

      if Status /= 0 then
         Report_Failed_Command (Root, Label, Status);
         Error (Errors, Label & " failed");
      end if;
   exception
      when Program_Error =>
         Report_Failed_Command (Root, Label, -1);
         Error (Errors, Label & " failed");
   end Run_Check;

   procedure Check_Example_Output
     (Root   : String;
      Errors : in out Natural)
   is
      Args : Argument_List (1 .. 0);
      type Example_Output_Check is record
         Program     : access constant String;
         Fence_Label : access constant String;
         Label       : access constant String;
      end record;
      Checks : constant array (Positive range <>) of Example_Output_Check :=
        [(Program     => new String'("humanize_demo"),
          Fence_Label => new String'("humanize-demo-output"),
          Label       => new String'("run humanize demo for expected output")),
         (Program     => new String'("system_status_demo"),
          Fence_Label => new String'("system-status-demo-output"),
          Label       => new String'("run system status demo for expected output")),
         (Program     => new String'("ui_labels_demo"),
          Fence_Label => new String'("ui-labels-demo-output"),
          Label       => new String'("run UI labels demo for expected output")),
         (Program     => new String'("security_data_demo"),
          Fence_Label => new String'("security-data-demo-output"),
         Label       => new String'("run security/data demo for expected output")),
         (Program     => new String'("workflow_ops_demo"),
          Fence_Label => new String'("workflow-ops-demo-output"),
          Label       => new String'("run workflow/operations demo for expected output")),
         (Program     => new String'("product_details_demo"),
          Fence_Label => new String'("product-details-demo-output"),
          Label       => new String'("run product/details demo for expected output")),
         (Program     => new String'("public_surface_demo"),
          Fence_Label => new String'("public-surface-demo-output"),
          Label       => new String'("run public surface demo for expected output"))];
   begin
      for Check of Checks loop
         Project_Tools.Release_Checks.Require_Program_Output_Matches_Fenced_Text
           (Expected_File => Root & "/examples/EXPECTED_OUTPUT.md",
            Fence_Label   => Check.Fence_Label.all,
            Dir           => Root,
            Program       => Root & "/examples/bin/" & Check.Program.all,
            Args          => Args,
            Label         => Check.Label.all,
            Quiet         => True);
      end loop;
   exception
      when Program_Error =>
         Error (Errors, "example expected-output check failed");
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
      Exec_Perf_Smoke_Stage_Args : constant Argument_List :=
        (1 => new String'("exec"),
         2 => new String'("--"),
         3 => new String'("./bin/perf_smoke"));
      Build_Examples_Stage_Args : constant Argument_List :=
        (1 => new String'("exec"),
         2 => new String'("--"),
         3 => new String'("gprbuild"),
         4 => new String'("-P"),
         5 => new String'("examples/examples.gpr"));
      Build_Public_API_Consumer_Stage_Args : constant Argument_List :=
        (1 => new String'("exec"),
         2 => new String'("--"),
         3 => new String'("gprbuild"),
         4 => new String'("-P"),
         5 => new String'("tests/public_api_consumer/public_api_consumer.gpr"));
      Exec_Public_API_Consumer_Stage_Args : constant Argument_List :=
        (1 => new String'("exec"),
         2 => new String'("--"),
         3 => new String'("./tests/public_api_consumer/bin/public_api_consumer"));

      procedure Run_Staged_Check
        (Label   : String;
         Dir     : String;
         Program : String;
         Args    : Argument_List)
      is
         Env_Name : constant String := "HUMANIZE_ALIRE_PREFIX";
         Had_Env  : constant Boolean :=
           Ada.Environment_Variables.Exists (Env_Name);
         Old_Env  : constant String :=
           (if Had_Env then Ada.Environment_Variables.Value (Env_Name) else "");
      begin
         if Had_Env then
            Ada.Environment_Variables.Clear (Env_Name);
         end if;

         Run_Check (Root, Errors, Label, Dir, Program, Args);

         if Had_Env then
            Ada.Environment_Variables.Set (Env_Name, Old_Env);
         end if;
      exception
         when others => --  defensive recovery
            if Had_Env then
               Ada.Environment_Variables.Set (Env_Name, Old_Env);
            end if;
            raise;
      end Run_Staged_Check;
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
            To_Unbounded_String (Config.Build_Overlay_File)],
         Quiet        => True);
      Project_Tools.Alire_Manifests.Copy_Release_Manifest
        (Template => Root & Config.Humanize_Release_Manifest,
         Target   => Stage_Root & Config.Humanize_Development_Manifest,
         Quiet    => True);
      Project_Tools.Alire_Manifests.Require_Staged_Crate_Source
        (Stage_Root, "humanize", "humanize.gpr", Quiet => True);
      Project_Tools.Alire_Manifests.Require_No_Local_Pins
        (Stage_Root & Config.Humanize_Development_Manifest, Quiet => True);
      Project_Tools.Release_Checks.Require_Absolute_Directory
        (I18N_Root, Quiet => True);
      Project_Tools.Alire_Manifests.Write_Build_Manifest_Overlay
        (Template => Stage_Root & Config.Humanize_Development_Manifest,
         Target   => Stage_Root & Config.Humanize_Build_Overlay,
         Pins     => Stage_Pins,
         Quiet    => True);
      Project_Tools.Alire_Manifests.Require_Build_Overlay
        (Stage_Root & Config.Humanize_Build_Overlay,
         Stage_Root & Config.Humanize_Development_Manifest,
         [1 => To_Unbounded_String ("i18n = { path = """ & I18N_Root & """ }")],
         Quiet => True);
      Project_Tools.Alire_Manifests.Activate_Build_Manifest
        (Stage_Root, Quiet => True);

      Run_Staged_Check
        ("update staged release dependencies",
         Stage_Root, Alr_Path, Alr_Update_Args);
      Run_Staged_Check
        ("build staged release library",
         Stage_Root, Alr_Path, Alr_Build_Args);
      Run_Staged_Check
        ("update staged release test dependencies",
         Stage_Root & "/tests", Alr_Path, Alr_Update_Args);
      Run_Staged_Check
        ("build staged release tests",
         Stage_Root & "/tests", Alr_Path, Build_Tests_Stage_Args);
      Run_Staged_Check
        ("run staged release tests",
         Stage_Root & "/tests", Alr_Path, Exec_Tests_Stage_Args);
      Run_Staged_Check
        ("run staged release performance smoke",
         Stage_Root & "/tests", Alr_Path, Exec_Perf_Smoke_Stage_Args);
      Run_Staged_Check
        ("build staged release examples",
         Stage_Root, Alr_Path, Build_Examples_Stage_Args);
      Run_Staged_Check
        ("build staged public API consumer",
         Stage_Root, Alr_Path,
         Build_Public_API_Consumer_Stage_Args);
      Run_Staged_Check
        ("run staged public API consumer",
         Stage_Root, Alr_Path,
         Exec_Public_API_Consumer_Stage_Args);
      Run_Staged_Check
        ("run staged public API formatting consumer",
         Stage_Root, Alr_Path,
         Exec_Public_API_Formatting_Consumer_Args);
      Run_Staged_Check
        ("run staged public API parsing consumer",
         Stage_Root, Alr_Path,
         Exec_Public_API_Parsing_Consumer_Args);
      Run_Staged_Check
        ("run staged public API color consumer",
         Stage_Root, Alr_Path,
         Exec_Public_API_Color_Consumer_Args);
      Run_Staged_Check
        ("run staged public API domain consumer",
         Stage_Root, Alr_Path,
         Exec_Public_API_Domain_Consumer_Args);
      Run_Staged_Check
        ("run staged public API bounded consumer",
         Stage_Root, Alr_Path,
         Exec_Public_API_Bounded_Consumer_Args);
      Check_Example_Output (Stage_Root, Errors);
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
        (Root, Errors, "run humanize performance smoke",
         Root & "/tests", Alr_Path, Exec_Perf_Smoke_Args);
      Run_Check
        (Root, Errors, "build humanize examples",
         Root, Alr_Path, Build_Examples_Args);
      Run_Check
        (Root, Errors, "build public API consumer",
         Root, Alr_Path, Build_Public_API_Consumer_Args);
      Run_Check
        (Root, Errors, "run public API consumer",
         Root, Alr_Path,
         Exec_Public_API_Consumer_Args);
      Run_Check
        (Root, Errors, "run public API formatting consumer",
         Root, Alr_Path,
         Exec_Public_API_Formatting_Consumer_Args);
      Run_Check
        (Root, Errors, "run public API parsing consumer",
         Root, Alr_Path,
         Exec_Public_API_Parsing_Consumer_Args);
      Run_Check
        (Root, Errors, "run public API color consumer",
         Root, Alr_Path,
         Exec_Public_API_Color_Consumer_Args);
      Run_Check
        (Root, Errors, "run public API domain consumer",
         Root, Alr_Path,
         Exec_Public_API_Domain_Consumer_Args);
      Run_Check
        (Root, Errors, "run public API bounded consumer",
         Root, Alr_Path,
         Exec_Public_API_Bounded_Consumer_Args);
      Check_Example_Output (Root, Errors);
      Run_Check
        (Root, Errors, "build humanize through alr test action",
         Root, Alr_Path, Alr_Test_Args);
      Run_Check
        (Root, Errors, "generate humanize GNATdoc",
         Root, Alr_Path, Gnatdoc_Args);
   end Run_Release_Builds;
end Check_Humanize_Release;
