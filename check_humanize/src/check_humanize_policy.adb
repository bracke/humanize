with Ada.Command_Line;
with Ada.Directories;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

with Project_Tools.Ada_Source;
with Project_Tools.Alire_Manifests;
with Project_Tools.AUnit_Checks;
with Project_Tools.Files;
with Project_Tools.Release_Checks;
with Project_Tools.Text;
with Project_Tools.Tree_Checks;

package body Check_Humanize_Policy is
   use Ada.Text_IO;

   procedure Error
     (Errors  : in out Natural;
      Message : String)
   is
   begin
      Errors := Errors + 1;
      Put_Line (Standard_Error, "error: " & Message);
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   end Error;

   procedure Require_Text
     (Root          : String;
      Errors        : in out Natural;
      Relative_Path : String;
      Pattern       : String;
      Message       : String)
   is
      Checks : constant Project_Tools.Release_Checks.Checker :=
        Project_Tools.Release_Checks.Create (Root);
   begin
      Project_Tools.Release_Checks.Require_Text (Checks, Relative_Path, Pattern);
   exception
      when Program_Error =>
         Error (Errors, Message);
   end Require_Text;

   procedure Require_File
     (Root          : String;
      Errors        : in out Natural;
      Relative_Path : String)
   is
      Checks : constant Project_Tools.Release_Checks.Checker :=
        Project_Tools.Release_Checks.Create (Root);
   begin
      Project_Tools.Release_Checks.Require_File (Checks, Relative_Path);
   exception
      when Program_Error =>
         Error (Errors, "missing required file: " & Relative_Path);
   end Require_File;

   procedure Check_Manifest
     (Root   : String;
      Errors : in out Natural)
   is
      Release_Dependencies : constant Project_Tools.Alire_Manifests.String_List :=
        [1 => To_Unbounded_String ("i18n = { path = ""../i18n"" }")];
   begin
      Project_Tools.Files.Require_Contains
        (Root & "/alire.toml", "i18n = "">=1.1.0""",
         "humanize development manifest must require i18n >= 1.1.0");
      Project_Tools.Alire_Manifests.Require_Workspace_Pin
        (Root & "/alire.toml", "i18n", "../i18n");
      Project_Tools.Alire_Manifests.Require_No_Local_Pins
        (Root & "/alire.release.toml");
      Project_Tools.Files.Require_Contains
        (Root & "/alire.release.toml", "i18n = "">=1.1.0""",
         "humanize release manifest must require i18n >= 1.1.0");
      Project_Tools.Alire_Manifests.Require_Build_Overlay
        (Root & "/alire.build.toml", Root & "/alire.release.toml",
         Release_Dependencies);
   exception
      when Program_Error =>
         Error (Errors, "humanize manifests must separate release metadata from local pins");
   end Check_Manifest;

   procedure Check_Required_Files
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Require_File (Root, Errors, "README.md");
      Require_File (Root, Errors, "LICENSE");
      Require_File (Root, Errors, "alire.release.toml");
      Require_File (Root, Errors, "alire.build.toml");
      Require_File (Root, Errors, "humanize.gpr");
      Require_File (Root, Errors, "docs/specification.md");
      Require_File (Root, Errors, "docs/RELEASE_VERIFICATION.md");
      Require_File (Root, Errors, "tests/tests.gpr");
      Require_File (Root, Errors, "examples/examples.gpr");
      Require_File (Root, Errors, "examples/README.md");
      Require_File (Root, Errors, "examples/EXPECTED_OUTPUT.md");
   end Check_Required_Files;

   procedure Check_Required_Text
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Require_Text
        (Root, Errors, "README.md", "docs/RELEASE_VERIFICATION.md",
         "README must point maintainers to release verification");
      Require_Text
        (Root, Errors, "README.md", "check_humanize",
         "README must mention the check_humanize release guard");
      Require_Text
        (Root, Errors, "docs/RELEASE_VERIFICATION.md", "check_humanize",
         "release verification must include check_humanize");
      Require_Text
        (Root, Errors, "docs/RELEASE_VERIFICATION.md", "examples/examples.gpr",
         "release verification must include the examples project build");
      Require_Text
        (Root, Errors, "docs/RELEASE_VERIFICATION.md", "alr test",
         "release verification must include the Alire test action");
      Require_Text
        (Root, Errors, "docs/RELEASE_VERIFICATION.md", "alire.release.toml",
         "release verification must describe the pin-free release manifest");
      Require_Text
        (Root, Errors, "examples/README.md", "humanize_demo",
         "examples README must document humanize_demo");
      Require_Text
        (Root, Errors, "examples/EXPECTED_OUTPUT.md", "duration 90s : 1 minute",
         "examples expected output must include humanize_demo output");
      Require_Text
        (Root, Errors, "alire.toml", "type = ""test""",
         "Alire manifest must define a test action");
   end Check_Required_Text;

   procedure Check_AUnit_Metrics
     (Root   : String;
      Errors : in out Natural)
   is
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

      if Metrics.Section_Count < 8 then
         Error (Errors, "expected at least 8 Humanize AUnit section bodies");
      end if;
      if Metrics.Registration_Count < 65 then
         Error (Errors, "expected at least 65 registered Humanize AUnit tests");
      end if;
      if Metrics.Assertion_Count < 65 then
         Error (Errors, "expected at least 65 Humanize AUnit assertions");
      end if;
      if Metrics.Test_Body_Count < 60 then
         Error (Errors, "expected at least 60 Humanize AUnit test bodies");
      end if;
   exception
      when others =>
         if Ada.Directories.More_Entries (Search) then
            Ada.Directories.End_Search (Search);
         end if;
         raise;
   end Check_AUnit_Metrics;

   procedure Check_Generated_Artifacts
     (Root   : String;
      Errors : in out Natural)
   is
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

   procedure Check_Tooling_Boundary
     (Root   : String;
      Errors : in out Natural)
   is
      Boundary_Errors : Natural := 0;
      Tooling_Tokens  : constant Project_Tools.Tree_Checks.Text_List :=
        [1 => To_Unbounded_String ("Project_Tools")];
      I18N_Private_Tokens : constant Project_Tools.Tree_Checks.Text_List :=
        [To_Unbounded_String ("I18N.AST"),
         To_Unbounded_String ("I18N.Buffer"),
         To_Unbounded_String ("I18N.Cache"),
         To_Unbounded_String ("I18N.Compiled"),
         To_Unbounded_String ("I18N.Compiler"),
         To_Unbounded_String ("I18N.CLDR_Data"),
         To_Unbounded_String ("I18N.Currency"),
         To_Unbounded_String ("I18N.Date_Time_Format"),
         To_Unbounded_String ("I18N.Errors"),
         To_Unbounded_String ("I18N.Extra_Format"),
         To_Unbounded_String ("I18N.Fast_Render"),
         To_Unbounded_String ("I18N.Number_Format"),
         To_Unbounded_String ("I18N.Parser"),
         To_Unbounded_String ("I18N.Render"),
         To_Unbounded_String ("I18N.Runtime_Data"),
         To_Unbounded_String ("I18N.Validation")];
      Localized_Code_Tokens : constant Project_Tools.Ada_Source.String_List :=
        [To_Unbounded_String ("yesterday"),
         To_Unbounded_String ("tomorrow"),
         To_Unbounded_String (" ago"),
         To_Unbounded_String ("siden"),
         To_Unbounded_String ("sekund")];

      procedure Check_Allowed_I18N_Imports
        (Source_Name      : String;
         Allows_Arguments : Boolean := False;
         Allows_Locales   : Boolean := False;
         Allows_Result    : Boolean := False;
         Allows_Runtime   : Boolean := False)
      is
         Path : constant String := Root & "/src/" & Source_Name;
         Allowed_Count : constant Natural :=
           Boolean'Pos (Allows_Arguments)
           + Boolean'Pos (Allows_Locales)
           + Boolean'Pos (Allows_Result)
           + Boolean'Pos (Allows_Runtime);
         Allowed : Project_Tools.Ada_Source.String_List (1 .. Allowed_Count);
         Next    : Positive := Allowed'First;
      begin
         if Allows_Arguments then
            Allowed (Next) := To_Unbounded_String ("I18N.Arguments");
            Next := Next + 1;
         end if;
         if Allows_Locales then
            Allowed (Next) := To_Unbounded_String ("I18N.Locales");
            Next := Next + 1;
         end if;
         if Allows_Result then
            Allowed (Next) := To_Unbounded_String ("I18N.Result");
            Next := Next + 1;
         end if;
         if Allows_Runtime then
            Allowed (Next) := To_Unbounded_String ("I18N.Runtime");
         end if;

         Project_Tools.Ada_Source.Require_Only_Allowed_With_Clauses
           (Path, "I18N.", Allowed);
      exception
         when Program_Error =>
            Error (Errors, "src/" & Source_Name & " imports an unexpected I18N unit");
      end Check_Allowed_I18N_Imports;

      procedure Check_All_I18N_Imports is
         Search      : Ada.Directories.Search_Type;
         Search_Open : Boolean := False;
         Item        : Ada.Directories.Directory_Entry_Type;
      begin
         Ada.Directories.Start_Search
           (Search    => Search,
            Directory => Root & "/src",
            Pattern   => "*.ad?",
            Filter    => [Ada.Directories.Ordinary_File => True, others => False]);
         Search_Open := True;

         while Ada.Directories.More_Entries (Search) loop
            Ada.Directories.Get_Next_Entry (Search, Item);
            declare
               Name : constant String := Ada.Directories.Simple_Name (Item);
            begin
               if Name = "humanize-catalogs.ads"
                 or else Name = "humanize-catalogs.adb"
               then
                  Check_Allowed_I18N_Imports
                    (Name, Allows_Runtime => True);
               elsif Name = "humanize-contexts.ads" then
                  Check_Allowed_I18N_Imports
                    (Name, Allows_Locales => True, Allows_Runtime => True);
               elsif Name = "humanize-contexts.adb" then
                  Check_Allowed_I18N_Imports
                    (Name, Allows_Locales => True);
               elsif Name = "humanize-i18n_rendering.adb" then
                  Check_Allowed_I18N_Imports
                    (Name,
                     Allows_Arguments => True,
                     Allows_Result    => True,
                     Allows_Runtime   => True);
               else
                  Check_Allowed_I18N_Imports (Name);
               end if;
            end;
         end loop;

         Ada.Directories.End_Search (Search);
         Search_Open := False;
      exception
         when others =>
            if Search_Open then
               Ada.Directories.End_Search (Search);
            end if;
            raise;
      end Check_All_I18N_Imports;

      procedure Check_Classifier_Text_Boundary is
      begin
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/src/humanize-datetime_classification.adb",
            Localized_Code_Tokens);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/src/humanize-duration_classification.adb",
            Localized_Code_Tokens);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/src/humanize-byte_classification.adb",
            Localized_Code_Tokens);
      exception
         when Program_Error =>
            Error (Errors, "Humanize classifiers must not embed localized text");
      end Check_Classifier_Text_Boundary;

      procedure Check_Message_Key_Mapping is
      begin
         Project_Tools.Ada_Source.Require_Unique_String_Returns
           (Root & "/src/humanize-messages.adb",
            "Key",
            Allow_Empty => True);
      exception
         when Program_Error =>
            Error (Errors, "Humanize message keys must be unique string returns");
      end Check_Message_Key_Mapping;
   begin
      Project_Tools.Tree_Checks.Check_No_Forbidden_Tokens
        (Boundary_Errors, Root & "/src", Tooling_Tokens,
         "humanize library sources");
      Project_Tools.Tree_Checks.Check_No_Forbidden_Tokens
        (Boundary_Errors, Root & "/tests/src", Tooling_Tokens,
         "humanize test sources");
      Project_Tools.Tree_Checks.Check_No_Forbidden_Tokens
        (Boundary_Errors, Root & "/examples", Tooling_Tokens,
         "humanize examples");
      Project_Tools.Tree_Checks.Check_No_Forbidden_Tokens
        (Boundary_Errors, Root & "/src", I18N_Private_Tokens,
         "humanize library sources");
      Errors := Errors + Boundary_Errors;

      Check_All_I18N_Imports;
      Check_Classifier_Text_Boundary;
      Check_Message_Key_Mapping;
   end Check_Tooling_Boundary;

   procedure Check_Public_Documentation
     (Root   : String;
      Errors : in out Natural)
   is
      Public_Specs : constant Project_Tools.Files.Path_List :=
        [To_Unbounded_String ("humanize-status.ads"),
         To_Unbounded_String ("humanize-messages.ads"),
         To_Unbounded_String ("humanize-contexts.ads"),
         To_Unbounded_String ("humanize-catalogs.ads"),
         To_Unbounded_String ("humanize-capabilities.ads"),
         To_Unbounded_String ("humanize-datetimes.ads"),
         To_Unbounded_String ("humanize-durations.ads"),
         To_Unbounded_String ("humanize-bytes.ads"),
         To_Unbounded_String ("humanize-colors.ads"),
         To_Unbounded_String ("humanize-numbers.ads"),
         To_Unbounded_String ("humanize-units.ads"),
         To_Unbounded_String ("humanize-lists.ads"),
         To_Unbounded_String ("humanize-frequencies.ads"),
         To_Unbounded_String ("humanize-rates.ads"),
         To_Unbounded_String ("humanize-strings.ads"),
         To_Unbounded_String ("humanize-parsing.ads"),
         To_Unbounded_String ("humanize-phrases.ads"),
         To_Unbounded_String ("humanize-styles.ads")];
   begin
      for Spec of Public_Specs loop
         Project_Tools.Ada_Source.Require_Public_GNATdoc_Tags
           (Root & "/src/" & To_String (Spec), Tags_Before => False);
      end loop;
   exception
      when Program_Error =>
         Error (Errors, "public Humanize specs must carry GNATdoc @param/@return tags");
   end Check_Public_Documentation;

   procedure Check_Examples_Inventory
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Project_Tools.Release_Checks.Require_GPR_Main_Inventory
        (Project_File       => Root & "/examples/examples.gpr",
         Documentation_File => Root & "/README.md",
         Source_Directory   => Root & "/examples");
   exception
      when Program_Error =>
         Error (Errors, "examples project mains must have source and documentation");
   end Check_Examples_Inventory;

   procedure Check_Compiler_Stderr
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Project_Tools.Tree_Checks.Require_No_Nonempty_Stderr (Root & "/obj");
      Project_Tools.Tree_Checks.Require_No_Nonempty_Stderr (Root & "/tests/obj");
      Project_Tools.Tree_Checks.Require_No_Nonempty_Stderr
        (Root & "/check_humanize/obj");
   exception
      when Program_Error =>
         Error (Errors, "compiler stderr logs must be empty");
   end Check_Compiler_Stderr;
end Check_Humanize_Policy;
