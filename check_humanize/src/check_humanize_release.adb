with Ada.Command_Line;
with Ada.Directories;
with Ada.Environment_Variables;
with Ada.Finalization;
with Ada.Calendar.Formatting;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

with GNAT.OS_Lib; use GNAT.OS_Lib;

with Check_Humanize_Policy_Config;
with Project_Tools.Alire;
with Project_Tools.Alire_Manifests;
with Project_Tools.Files;
with Project_Tools.Processes;
with Project_Tools.Release_Checks;

package body Check_Humanize_Release is
   use Ada.Text_IO;

   package Config renames Check_Humanize_Policy_Config;

   Sibling_Build_Preflight_Failed : Boolean := False;

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
   begin
      return Project_Tools.Release_Checks.Nonempty_Stderr_Files
        ([To_Unbounded_String (Root & "/obj"),
          To_Unbounded_String (Root & "/tests/obj"),
          To_Unbounded_String (Root & "/check_humanize/obj")]);
   end Compiler_Stderr_Diagnostics;

   function Concurrent_Build_Processes return String is
   begin
      return Project_Tools.Release_Checks.Ada_Build_Processes;
   end Concurrent_Build_Processes;

   function Sibling_I18N_Build_Processes (Root : String) return String is
      I18N_Root : constant String :=
        Ada.Directories.Full_Name (Root & "/../i18n");
   begin
      return Project_Tools.Release_Checks.Ada_Build_Processes (I18N_Root);
   end Sibling_I18N_Build_Processes;

   function Sibling_I18N_Build_Wait_Seconds return Natural is
      Name : constant String := "HUMANIZE_WAIT_FOR_I18N_BUILD_SECONDS";
   begin
      if Ada.Environment_Variables.Exists (Name) then
         return Natural'Value (Ada.Environment_Variables.Value (Name));
      else
         return 0;
      end if;
   exception
      when Constraint_Error =>
         return 0;
   end Sibling_I18N_Build_Wait_Seconds;

   function Workspace_Build_Lock_Path (Root : String) return String is
      type Hash_Value is mod 2 ** 32;

      function Hash_Image (Text : String) return String is
         Hex    : constant String := "0123456789abcdef";
         Hash   : Hash_Value := 2_166_136_261;
         Value  : Hash_Value;
         Result : String (1 .. 8);
      begin
         for Ch of Text loop
            Hash := (Hash xor Hash_Value (Character'Pos (Ch))) * 16_777_619;
         end loop;

         Value := Hash;
         for Index in reverse Result'Range loop
            Result (Index) := Hex (Integer (Value mod 16) + 1);
            Value := Value / 16;
         end loop;

         return Result;
      end Hash_Image;

      function Sanitized_Tail
        (Text      : String;
         Max_Chars : Positive)
         return String
      is
         Sanitized : Unbounded_String := Null_Unbounded_String;
      begin
         for Ch of Text loop
            if Ch in 'A' .. 'Z'
              or else Ch in 'a' .. 'z'
              or else Ch in '0' .. '9'
              or else Ch in '.' | '-' | '_'
            then
               Append (Sanitized, Ch);
            else
               Append (Sanitized, '_');
            end if;
         end loop;

         declare
            Value : constant String := To_String (Sanitized);
         begin
            if Value'Length <= Max_Chars then
               return Value;
            else
               return Value (Value'Last - Max_Chars + 1 .. Value'Last);
            end if;
         end;
      end Sanitized_Tail;

      I18N_Root : constant String :=
        Ada.Directories.Full_Name (Root & "/../i18n");
      Slug : constant String := Sanitized_Tail (I18N_Root, 48);
   begin
      return "/tmp/humanize-i18n-build-"
        & Slug & "-" & Hash_Image (I18N_Root) & ".lock";
   end Workspace_Build_Lock_Path;

   function Current_Process_Id return Integer is
      function Getpid return Integer;
      pragma Import (C, Getpid, "getpid");
   begin
      return Getpid;
   end Current_Process_Id;

   function Command_Line_Image return String is
      Result : Unbounded_String :=
        To_Unbounded_String (Ada.Command_Line.Command_Name);
   begin
      for Index in 1 .. Ada.Command_Line.Argument_Count loop
         Append (Result, " ");
         Append (Result, Ada.Command_Line.Argument (Index));
      end loop;

      return To_String (Result);
   end Command_Line_Image;

   function Workspace_Build_Lock_Owner (Root : String) return String is
      Lock_Path : constant String := Workspace_Build_Lock_Path (Root);
   begin
      return
        "owner=humanize release validation" & ASCII.LF
        & "pid=" & Ada.Strings.Fixed.Trim
          (Integer'Image (Current_Process_Id), Ada.Strings.Left) & ASCII.LF
        & "started_at="
        & Ada.Calendar.Formatting.Image (Ada.Calendar.Clock) & ASCII.LF
        & "workspace=" & Ada.Directories.Full_Name (Root) & ASCII.LF
        & "i18n_workspace="
        & Ada.Directories.Full_Name (Root & "/../i18n") & ASCII.LF
        & "lock_path=" & Lock_Path & ASCII.LF
        & "command=" & Command_Line_Image;
   end Workspace_Build_Lock_Owner;

   function Workspace_Build_Lock_Details (Root : String) return String is
      Lock_Path  : constant String := Workspace_Build_Lock_Path (Root);
      Owner_Path : constant String := Lock_Path & "/owner";
   begin
      if Project_Tools.Files.File_Exists (Owner_Path) then
         return Project_Tools.Files.Read_Raw_File (Owner_Path);
      elsif Project_Tools.Files.Exists (Lock_Path) then
         return "lock_path=" & Lock_Path & ASCII.LF & "owner=<missing>";
      else
         return "lock_path=" & Lock_Path & ASCII.LF & "owner=<cleared>";
      end if;
   exception
      when Ada.Directories.Name_Error | Ada.Directories.Use_Error =>
         return "lock_path=" & Lock_Path & ASCII.LF & "owner=<unreadable>";
   end Workspace_Build_Lock_Details;

   function Acquire_Workspace_Build_Lock
     (Root   : String;
      Errors : in out Natural)
      return Boolean
   is
      Lock_Path : constant String := Workspace_Build_Lock_Path (Root);
   begin
      Project_Tools.Release_Checks.Wait_For_Workspace_Build_Lock
        (Lock_Path, Sibling_I18N_Build_Wait_Seconds, Quiet => True);
      Project_Tools.Release_Checks.Create_Workspace_Build_Lock
        (Lock_Path, Workspace_Build_Lock_Owner (Root), Quiet => True);
      return True;
   exception
      when Program_Error =>
         Error
           (Errors,
            "workspace build lock is active; release builds require exclusive "
            & "linking access");
         Put_Line (Standard_Error, "active workspace build lock details:");
         Put_Line
           (Standard_Error,
            Ada.Strings.Fixed.Trim
              (Workspace_Build_Lock_Details (Root), Ada.Strings.Both));
         Put_Line
           (Standard_Error,
            "hint: wait for the lock to clear or rerun with "
            & "HUMANIZE_WAIT_FOR_I18N_BUILD_SECONDS=<seconds>");
         return False;
   end Acquire_Workspace_Build_Lock;

   type Workspace_Build_Lock_Guard is
     new Ada.Finalization.Limited_Controlled with record
      Lock_Path : String (1 .. 4096);
      Last      : Natural := 0;
      Active    : Boolean := False;
   end record;

   pragma Warnings (Off, "not dispatching*");
   procedure Finalize
     (Guard : in out Workspace_Build_Lock_Guard);
   pragma Warnings (On, "not dispatching*");

   pragma Warnings (Off, "not dispatching*");
   procedure Arm_Workspace_Build_Lock_Guard
     (Guard : in out Workspace_Build_Lock_Guard;
      Root  : String);
   pragma Warnings (On, "not dispatching*");

   pragma Warnings (Off, "not dispatching*");
   procedure Finalize
     (Guard : in out Workspace_Build_Lock_Guard)
   is
   begin
      if Guard.Active and then Guard.Last > 0 then
         Project_Tools.Release_Checks.Remove_Workspace_Build_Lock
           (Guard.Lock_Path (1 .. Guard.Last), Quiet => True);
         Guard.Active := False;
      end if;
   end Finalize;
   pragma Warnings (On, "not dispatching*");

   procedure Arm_Workspace_Build_Lock_Guard
     (Guard : in out Workspace_Build_Lock_Guard;
      Root  : String)
   is
      Path : constant String := Workspace_Build_Lock_Path (Root);
   begin
      if Path'Length > Guard.Lock_Path'Length then
         raise Constraint_Error;
      end if;

      Guard.Lock_Path (1 .. Path'Length) := Path;
      Guard.Last := Path'Length;
      Guard.Active := True;
   end Arm_Workspace_Build_Lock_Guard;

   function Local_Release_Builds_Are_Isolated
     (Root   : String;
      Errors : in out Natural)
      return Boolean
   is
      Wait_Seconds  : constant Natural := Sibling_I18N_Build_Wait_Seconds;
      Poll_Seconds  : constant Natural := 5;
      Waited_Seconds : Natural := 0;
   begin
      loop
         declare
            Processes : constant String := Sibling_I18N_Build_Processes (Root);
         begin
            if Processes = "" then
               if Waited_Seconds > 0 then
                  Put_Line
                    ("sibling i18n workspace is idle after waiting"
                     & Natural'Image (Waited_Seconds) & " second(s)");
               end if;

               return True;
            elsif Waited_Seconds = 0
              and then Wait_Seconds > 0
              and then not Sibling_Build_Preflight_Failed
            then
               Put_Line
                 (Standard_Error,
                  "waiting up to" & Natural'Image (Wait_Seconds)
                  & " second(s) for sibling i18n builds to finish");
            elsif Waited_Seconds >= Wait_Seconds
              or else Sibling_Build_Preflight_Failed
            then
               if Sibling_Build_Preflight_Failed then
                  return False;
               end if;

               Sibling_Build_Preflight_Failed := True;
               Put_Line
                 (Standard_Error,
                  "active sibling i18n build processes can rewrite ../i18n/lib while "
                  & "local public API consumers are linking:");
               Put_Line
                 (Standard_Error,
                  Ada.Strings.Fixed.Trim (Processes, Ada.Strings.Both));
               Error
                 (Errors,
                  "local release builds require an idle sibling i18n workspace");
               Put_Line
                 (Standard_Error,
                  "hint: rerun staged release validation with "
                  & "HUMANIZE_WAIT_FOR_I18N_BUILD_SECONDS=<seconds> "
                  & "./bin/check_humanize --staged-release-only");
               return False;
            end if;
         end;

         declare
            Remaining : constant Natural := Wait_Seconds - Waited_Seconds;
            Sleep_For : constant Natural := Natural'Min (Poll_Seconds, Remaining);
         begin
            delay Duration (Sleep_For);
            Waited_Seconds := Waited_Seconds + Sleep_For;
         end;
      end loop;
   end Local_Release_Builds_Are_Isolated;

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
        Project_Tools.Alire.Noninteractive_Exec_Args
          ([new String'("gprbuild"), new String'("-P"),
            new String'("tests.gpr")]);
      Exec_Tests_Stage_Args : constant Argument_List :=
        Project_Tools.Alire.Noninteractive_Exec_Args
          ([1 => new String'("./bin/tests")]);
      Exec_Perf_Smoke_Stage_Args : constant Argument_List :=
        Project_Tools.Alire.Noninteractive_Exec_Args
          ([1 => new String'("./bin/perf_smoke")]);
      Build_Examples_Stage_Args : constant Argument_List :=
        Project_Tools.Alire.Noninteractive_Exec_Args
          ([new String'("gprbuild"), new String'("-P"),
            new String'("examples/examples.gpr")]);
      Build_Public_API_Consumer_Stage_Args : constant Argument_List :=
        Project_Tools.Alire.Noninteractive_Exec_Args
          ([new String'("gprbuild"), new String'("-P"),
            new String'("tests/public_api_consumer/public_api_consumer.gpr")]);
      Exec_Public_API_Consumer_Stage_Args : constant Argument_List :=
        Project_Tools.Alire.Noninteractive_Exec_Args
          ([1 => new String'("./tests/public_api_consumer/bin/public_api_consumer")]);
      Exec_Public_API_Formatting_Consumer_Stage_Args : constant Argument_List :=
        Project_Tools.Alire.Noninteractive_Exec_Args
          ([1 => new String'("./tests/public_api_consumer/bin/public_api_formatting_consumer")]);
      Exec_Public_API_Parsing_Consumer_Stage_Args : constant Argument_List :=
        Project_Tools.Alire.Noninteractive_Exec_Args
          ([1 => new String'("./tests/public_api_consumer/bin/public_api_parsing_consumer")]);
      Exec_Public_API_Color_Consumer_Stage_Args : constant Argument_List :=
        Project_Tools.Alire.Noninteractive_Exec_Args
          ([1 => new String'("./tests/public_api_consumer/bin/public_api_color_consumer")]);
      Exec_Public_API_Domain_Consumer_Stage_Args : constant Argument_List :=
        Project_Tools.Alire.Noninteractive_Exec_Args
          ([1 => new String'("./tests/public_api_consumer/bin/public_api_domain_consumer")]);
      Exec_Public_API_Bounded_Consumer_Stage_Args : constant Argument_List :=
        Project_Tools.Alire.Noninteractive_Exec_Args
          ([1 => new String'("./tests/public_api_consumer/bin/public_api_bounded_consumer")]);
      Alr_Staged_Build_Args : constant Argument_List :=
        Project_Tools.Alire.Noninteractive_Build_Args;
      Alr_Staged_Update_Args : constant Argument_List :=
        Project_Tools.Alire.Noninteractive_Update_Args;

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

         type Env_Restore_Guard is
           new Ada.Finalization.Limited_Controlled with null record;

         overriding procedure Finalize (Guard : in out Env_Restore_Guard);

         overriding procedure Finalize (Guard : in out Env_Restore_Guard) is
            pragma Unreferenced (Guard);
         begin
            if Had_Env then
               Ada.Environment_Variables.Set (Env_Name, Old_Env);
            end if;
         exception
            when Constraint_Error | Program_Error =>
               null;
         end Finalize;

         Guard : Env_Restore_Guard;
         pragma Unreferenced (Guard);
      begin
         if Had_Env then
            Ada.Environment_Variables.Clear (Env_Name);
         end if;

         Run_Check (Root, Errors, Label, Dir, Program, Args);
      end Run_Staged_Check;
   begin
      if not Local_Release_Builds_Are_Isolated (Root, Errors) then
         return;
      end if;
      if not Acquire_Workspace_Build_Lock (Root, Errors) then
         return;
      end if;

      declare
         Lock_Guard : Workspace_Build_Lock_Guard;
      begin
         Arm_Workspace_Build_Lock_Guard (Lock_Guard, Root);
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
            [1 => To_Unbounded_String
              ("i18n = { path = """ & I18N_Root & """ }")],
            Quiet => True);
         Project_Tools.Alire_Manifests.Activate_Build_Manifest
           (Stage_Root, Quiet => True);

         Run_Staged_Check
           ("update staged release dependencies",
            Stage_Root, Alr_Path, Alr_Staged_Update_Args);
         Run_Staged_Check
           ("build staged release library",
            Stage_Root, Alr_Path, Alr_Staged_Build_Args);
         Run_Staged_Check
           ("update staged release test dependencies",
            Stage_Root & "/tests", Alr_Path, Alr_Staged_Update_Args);
         --  The staged tree is a fresh copy, so tests/config/tests_config.gpr
         --  does not exist yet; a raw gprbuild against tests.gpr cannot import
         --  it. Let Alire generate it first.
         Run_Staged_Check
           ("configure staged release tests",
            Stage_Root & "/tests", Alr_Path, Alr_Staged_Build_Args);
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
            Exec_Public_API_Formatting_Consumer_Stage_Args);
         Run_Staged_Check
           ("run staged public API parsing consumer",
            Stage_Root, Alr_Path,
            Exec_Public_API_Parsing_Consumer_Stage_Args);
         Run_Staged_Check
           ("run staged public API color consumer",
            Stage_Root, Alr_Path,
            Exec_Public_API_Color_Consumer_Stage_Args);
         Run_Staged_Check
           ("run staged public API domain consumer",
            Stage_Root, Alr_Path,
            Exec_Public_API_Domain_Consumer_Stage_Args);
         Run_Staged_Check
           ("run staged public API bounded consumer",
            Stage_Root, Alr_Path,
            Exec_Public_API_Bounded_Consumer_Stage_Args);
         Check_Example_Output (Stage_Root, Errors);
      end;
   exception
      when Program_Error =>
         Error (Errors, "staged pin-free release tree verification failed");
   end Check_Staged_Release_Tree;

   procedure Run_Release_Builds
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      if not Local_Release_Builds_Are_Isolated (Root, Errors) then
         return;
      end if;
      if not Acquire_Workspace_Build_Lock (Root, Errors) then
         return;
      end if;

      declare
         Lock_Guard : Workspace_Build_Lock_Guard;
      begin
         Arm_Workspace_Build_Lock_Guard (Lock_Guard, Root);
         Run_Check
           (Root, Errors, "build humanize library",
            Root, Alr_Path, Alr_Build_Args);
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
      end;
   end Run_Release_Builds;
end Check_Humanize_Release;
