with Ada.Command_Line;
with Ada.Directories;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;
with Check_Humanize_Policy_Exception_Handlers;
with Check_Humanize_Policy_Public_Surface;
with Check_Humanize_Policy_Public_Facades;
with Check_Humanize_Policy_Performance;
with Check_Humanize_Policy_Requirements;
with Check_Humanize_Policy_Config;
with Check_Humanize_Policy_Generated;
with Check_Humanize_Policy_Examples;
with Check_Humanize_Policy_Boundaries;
with Check_Humanize_Policy_Non_Goals;
with Check_Humanize_Policy_Test_Sources;
with Check_Humanize_Public_API;
with Project_Tools.Ada_Source;
with Project_Tools.Alire_Manifests;
with Project_Tools.AUnit_Checks;
with Project_Tools.Files;
with Project_Tools.Source_Budgets;
with Project_Tools.Text;
with Project_Tools.Tree_Checks;

package body Check_Humanize_Policy is
   use type Ada.Directories.File_Size;

   package Config renames Check_Humanize_Policy_Config;

   procedure Check_Manifest
     (Root   : String;
      Errors : in out Natural)
   is
      Release_Dependencies : constant Project_Tools.Alire_Manifests.String_List :=
        [1 => To_Unbounded_String (Config.Development_I18N_Pin)];
   begin
      Project_Tools.Files.Require_Contains
        (Root & Config.Humanize_Development_Manifest,
         Config.Required_GNAT_Native_Pin,
         "humanize development manifest must pin Alire GNAT 15");
      Project_Tools.Files.Require_Contains
        (Root & Config.Humanize_Release_Manifest,
         Config.Required_GNAT_Native_Pin,
         "humanize release manifest must pin Alire GNAT 15");
      Project_Tools.Files.Require_Contains
        (Root & Config.Humanize_Build_Overlay,
         Config.Required_GNAT_Native_Pin,
         "humanize build overlay must pin Alire GNAT 15");
      Project_Tools.Files.Require_Contains
        (Root & Config.Humanize_Tests_Manifest,
         Config.Required_GNAT_Native_Pin,
         "humanize tests manifest must pin Alire GNAT 15");
      Project_Tools.Files.Require_Contains
        (Root & Config.Humanize_Tooling_Manifest,
         Config.Required_GNAT_Native_Pin,
         "humanize tooling manifest must pin Alire GNAT 15");
      Project_Tools.Files.Require_Contains
        (Root & Config.Humanize_Tooling_Manifest, "cryptolib = ""*""",
         "humanize tooling manifest must depend on cryptolib for hash checks");
      Project_Tools.Alire_Manifests.Require_Workspace_Pin
        (Root & Config.Humanize_Tooling_Manifest, "cryptolib", "../../cryptolib");
      Project_Tools.Files.Require_Contains
        (Root & Config.Humanize_Development_Manifest,
         Config.Required_I18N_Constraint,
         "humanize development manifest must require i18n >= 1.1.0");
      Project_Tools.Alire_Manifests.Require_Workspace_Pin
        (Root & Config.Humanize_Development_Manifest, "i18n", "../i18n");
      Project_Tools.Alire_Manifests.Require_No_Local_Pins
        (Root & Config.Humanize_Release_Manifest);
      Project_Tools.Files.Require_Contains
        (Root & Config.Humanize_Release_Manifest,
         Config.Required_I18N_Constraint,
         "humanize release manifest must require i18n >= 1.1.0");
      Project_Tools.Alire_Manifests.Require_Build_Overlay
        (Root & Config.Humanize_Build_Overlay,
         Root & Config.Humanize_Release_Manifest,
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
      Check_Policy_Threshold_Keys (Root, Errors);
      Check_Humanize_Policy_Requirements.Check_Required_Files
        (Root, Errors);
   end Check_Required_Files;

   procedure Check_Required_Text
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Check_Humanize_Policy_Requirements.Check_Required_Text
        (Root, Errors);
   end Check_Required_Text;

   procedure Check_AUnit_Metrics
     (Root   : String;
      Errors : in out Natural)
   is
      Search      : Ada.Directories.Search_Type;
      Search_Open : Boolean := False;
      Item        : Ada.Directories.Directory_Entry_Type;
      Metrics     : Project_Tools.AUnit_Checks.Suite_Metrics;
   begin
      Ada.Directories.Start_Search
        (Search    => Search,
         Directory => Root & "/tests/src",
         Pattern   => "humanize-tests-*.adb",
         Filter    => [Ada.Directories.Ordinary_File => True, others => False]);
      Search_Open := True;

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
      Search_Open := False;

      Require_Minimum
        (Root, Errors, "aunit_min_sections", Metrics.Section_Count,
         "Humanize AUnit section body inventory is too small");
      Require_Minimum
        (Root, Errors, "aunit_min_registrations", Metrics.Registration_Count,
         "Humanize AUnit registered test inventory is too small");
      Require_Minimum
        (Root, Errors, "aunit_min_assertions", Metrics.Assertion_Count,
         "Humanize AUnit assertion inventory is too small");
      Require_Minimum
        (Root, Errors, "aunit_min_test_bodies", Metrics.Test_Body_Count,
         "Humanize AUnit test body inventory is too small");
   exception
      when Constraint_Error
         | Ada.Directories.Name_Error
         | Ada.Directories.Use_Error =>
         if Search_Open then
            Ada.Directories.End_Search (Search);
         end if;
         raise;
   end Check_AUnit_Metrics;

   procedure Check_Generated_Artifacts
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Check_Humanize_Policy_Generated.Check_Generated_Artifacts
        (Root, Errors);
   end Check_Generated_Artifacts;

   procedure Check_Source_Tree_Artifacts
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Check_Humanize_Policy_Generated.Check_Source_Tree_Artifacts
        (Root, Errors);
   end Check_Source_Tree_Artifacts;

   procedure Check_Tooling_Boundary
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Check_Humanize_Policy_Boundaries.Check_Tooling_Boundary (Root, Errors);
   end Check_Tooling_Boundary;

   procedure Check_Public_Documentation
     (Root   : String;
      Errors : in out Natural)
   is
      Manifest : constant String := Read_File (Root, "docs/PUBLIC_API.toml");
      Count    : Natural := 0;

      function Is_Root_Facade (Name : String) return Boolean is
         Dot_Count : Natural := 0;
      begin
         for Ch of Name loop
            if Ch = '.' then
               Dot_Count := Dot_Count + 1;
            end if;
         end loop;

         return Dot_Count <= 1;
      end Is_Root_Facade;

      function Enforces_GNATdoc_Tags
        (Name : String;
         Spec : String)
         return Boolean is
        (Is_Root_Facade (Name)
         and then Spec /= "src/humanize-bounded_text.ads");

      procedure Check_Entry (Entry_Pos : Positive) is
         Name : constant String :=
           Manifest_String_Value_After (Manifest, "name = ", Entry_Pos);
         Spec : constant String :=
           Manifest_String_Value_After (Manifest, "spec = ", Entry_Pos);
      begin
         if Name = "" or else Spec = "" then
            Error (Errors, "public API manifest entry missing spec path");
         elsif Enforces_GNATdoc_Tags (Name, Spec) then
            Project_Tools.Ada_Source.Require_Public_GNATdoc_Tags
              (Root & "/" & Spec, Tags_Before => False);
            Count := Count + 1;
         end if;
      end Check_Entry;

      procedure Check_Entries is new Iterate_Manifest_Section (Check_Entry);
   begin
      Check_Entries (Manifest, "unit");

      Require_Minimum
        (Root, Errors, "public_documentation_min_root_specs", Count,
         "public API manifest has too few documented specs");
   exception
      when Program_Error =>
         Error (Errors, "public Humanize specs must carry GNATdoc @param/@return tags");
   end Check_Public_Documentation;

   procedure Check_Examples_Inventory
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Check_Humanize_Policy_Examples.Check_Examples_Inventory (Root, Errors);
   end Check_Examples_Inventory;

   procedure Check_Public_API_Surface
     (Root   : String;
      Errors : in out Natural)
   is
      Manifest : constant String := Read_File (Root, "docs/PUBLIC_API.toml");
      Classes  : constant String :=
        Read_File (Root, "docs/PUBLIC_API_CLASSES.toml");
      GPR      : constant String := Read_File (Root, "humanize.gpr");
      API_Doc  : constant String := Read_File (Root, "docs/API_SURFACE.md");
      API_Index : constant String := Read_File (Root, "docs/PUBLIC_API_INDEX.md");
      Coverage : constant String := Read_File (Root, "docs/PUBLIC_API_COVERAGE.toml");
      Unit_Coverage : constant String :=
        Read_File (Root, "docs/PUBLIC_API_UNIT_COVERAGE.toml");
      Count    : Natural := 0;

      function Parent_Unit (Name : String) return String is
      begin
         for Index in reverse Name'Range loop
            if Name (Index) = '.' then
               return Name (Name'First .. Index - 1);
            end if;
         end loop;
         return "";
      end Parent_Unit;

      function Expected_Class (Name : String) return String is
      begin
         if Name = "Humanize.Bounded_Text"
           or else Name = "Humanize.Capabilities"
           or else Name = "Humanize.Messages"
           or else Name = "Humanize.Parsing.Results"
           or else Name = "Humanize.Status"
           or else Name = "Humanize.Styles"
         then
            return "support-type-facade";
         elsif Contains (Name, "Humanize.Colors.")
           or else Contains (Name, "Humanize.Durations.")
           or else Contains (Name, "Humanize.Numbers.")
           or else Contains (Name, "Humanize.Parsing.")
           or else Contains (Name, "Humanize.Phrases.")
           or else Contains (Name, "Humanize.Strings.")
         then
            return "specialized-child-facade";
         else
            return "primary-facade";
         end if;
      end Expected_Class;

      procedure Check_Entry (Entry_Pos : Positive) is
         Name : constant String :=
           Manifest_String_Value_After (Manifest, "name = ", Entry_Pos);
         Spec : constant String :=
           Manifest_String_Value_After (Manifest, "spec = ", Entry_Pos);
         Area : constant String :=
           Manifest_String_Value_After (Manifest, "area = ", Entry_Pos);
         Class_Name : constant String := Expected_Class (Name);
      begin
         if Name = "" or else Spec = "" or else Area = "" then
            Error (Errors, "public API manifest entry is incomplete");
         else
            Require_File (Root, Errors, Spec);
            if Starts_With (Read_File (Root, Spec), "private package") then
               Error
                 (Errors,
                  "public API manifest exposes private child spec: " & Spec);
            end if;
            if not Contains (GPR, """" & Name & """") then
               Error (Errors, "Library_Interface missing public unit: " & Name);
            end if;
            if not Contains (API_Doc, Spec) then
               Error
                 (Errors,
                  "API surface documentation missing public spec: " & Spec);
            end if;
            if not Contains (API_Index, "`" & Name & "`")
              or else not Contains (API_Index, "`" & Spec & "`")
            then
               Error (Errors, "public API index missing manifest entry: " & Name);
            end if;
            if not Contains (Coverage, "name = """ & Area & """") then
               Error
                 (Errors,
                  "public API coverage scorecard missing area: " & Area);
            end if;
            if not Contains (Unit_Coverage, "name = """ & Name & """")
              or else not Contains (Unit_Coverage, "area = """ & Area & """")
            then
               Error
                 (Errors,
                  "public API unit coverage missing manifest entry: " & Name);
            end if;
            if not Contains (Classes, "name = """ & Name & """")
              or else not Contains (Classes, "area = """ & Area & """")
              or else not Contains (Classes, "class = """ & Class_Name & """")
            then
               Error
                 (Errors,
                  "public API classes missing computed class for: " & Name);
            end if;
            if Class_Name = "specialized-child-facade"
              and then not Contains
                (Manifest, "name = """ & Parent_Unit (Name) & """")
            then
               Error
                 (Errors,
                  "specialized public child lacks public parent facade: "
                  & Name);
            end if;
            Count := Count + 1;
         end if;
      end Check_Entry;

      procedure Check_Entries is new Iterate_Manifest_Section (Check_Entry);
   begin
      if not Contains (GPR, "for Library_Interface use") then
         Error (Errors, "humanize.gpr must declare an explicit Library_Interface");
      end if;

      Check_Entries (Manifest, "unit");

      Require_Minimum
        (Root, Errors, "public_api_min_units", Count,
         "public API manifest has too few units");

      if not Contains (Classes, "primary-facade")
        or else not Contains (Classes, "specialized-child-facade")
        or else not Contains (Classes, "support-type-facade")
        or else not Contains (Classes, "internal")
        or else not Contains (Classes, "primary_facades = ")
        or else not Contains (Classes, "specialized_child_facades = ")
        or else not Contains (Classes, "support_type_facades = ")
      then
         Error
           (Errors,
            "public API classes must define class summaries and all classes");
      end if;

      if not Contains (API_Index, "Generated-maintained from `docs/PUBLIC_API.toml`")
        or else not Contains (Coverage, "Public API coverage scorecard")
        or else not Contains
          (Unit_Coverage, "Per-unit public API coverage scorecard")
        or else not Contains (Coverage, "score = 5")
        or else not Contains (Unit_Coverage, "score = 5")
      then
         Error
           (Errors,
           "public API index and scorecards must document manifest-derived coverage");
      end if;

      Check_Humanize_Public_API.Check_Public_API_Docs (Root, Errors);

      if not Contains (Classes, """Humanize.Colors.""")
        or else not Contains (Classes, """Humanize.Parsing.""")
        or else not Contains (Classes, """Humanize.Strings.""")
        or else not Contains (Classes, """Humanize.Cross_Domain""")
      then
         Error
           (Errors,
            "public API classes must classify child facades and cross-domain facade");
      end if;

      if Contains (GPR, "Humanize.Parsing.Implementation")
        or else Contains (GPR, "Humanize.I18N_Rendering")
        or else Contains (GPR, "Humanize.Catalogs.Core_Data")
        or else Contains (GPR, "Humanize.Catalogs.Unit_Data")
        or else Contains (GPR, "Humanize.Catalogs.Native_Data")
        or else Contains (GPR, "Humanize.Durations.Schedule_Data")
        or else Contains (GPR, "Humanize.Numbers.Spellout_Data")
      then
         Error
           (Errors,
            "Library_Interface must not expose implementation or generated-data units");
      end if;
   end Check_Public_API_Surface;

   procedure Print_Generated_Data_Manifest (Root : String) is
   begin
      Check_Humanize_Policy_Generated.Print_Generated_Data_Manifest (Root);
   end Print_Generated_Data_Manifest;

   procedure Print_Public_API_Index (Root : String) is
   begin
      Check_Humanize_Public_API.Print_Public_API_Index (Root);
   end Print_Public_API_Index;

   procedure Print_Public_API_Classes (Root : String) is
   begin
      Check_Humanize_Public_API.Print_Public_API_Classes (Root);
   end Print_Public_API_Classes;

   procedure Print_Public_API_Coverage (Root : String) is
   begin
      Check_Humanize_Public_API.Print_Public_API_Coverage (Root);
   end Print_Public_API_Coverage;

   procedure Print_Public_API_Unit_Coverage (Root : String) is
   begin
      Check_Humanize_Public_API.Print_Public_API_Unit_Coverage (Root);
   end Print_Public_API_Unit_Coverage;

   procedure Check_Structural_Baseline
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Project_Tools.Source_Budgets.Check_Structural_Baseline
        (Errors          => Errors,
         Root            => Root,
         Manifest_Path   => "docs/STRUCTURAL_BASELINE.toml",
         Minimum_Entries =>
           Policy_Threshold (Root, "structural_baseline_min_bodies"),
         Purpose         => "structural baseline");
      Project_Tools.Source_Budgets.Check_Large_Source_Budget_Coverage
        (Errors        => Errors,
         Root          => Root,
         Manifest_Path => "docs/STRUCTURAL_BASELINE.toml",
         Source_Dir    => "src",
         Minimum_Lines =>
           Policy_Threshold (Root, "structural_baseline_min_lines"),
         Secondary_Manifest_Path => "docs/PUBLIC_FACADE_BUDGETS.toml",
         Secondary_Section       => "facade",
         Tertiary_Manifest_Path  => "docs/GENERATED_DATA.toml",
         Tertiary_Section        => "artifact",
         Purpose       => "structural baseline coverage");
   end Check_Structural_Baseline;

   procedure Check_Performance_Baseline
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Check_Humanize_Policy_Performance.Check_Performance_Baseline
        (Root, Errors);
   end Check_Performance_Baseline;

   procedure Check_Parser_Diagnostic_Defaults
     (Root   : String;
      Errors : in out Natural)
   is
      Spec : constant String := Read_File (Root, "src/humanize-parsing.ads");
   begin
      if not Contains (Spec, "Error : Parse_Error_Kind := Unsupported_Form") then
         Error
           (Errors,
            "parse result records must default non-success diagnostics to Unsupported_Form");
      end if;
      if not Contains (Spec, "Error          : Parse_Error_Kind := No_Parse_Error") then
         Error
           (Errors,
            "scheduling phrase classifier must retain a no-error default");
      end if;
   end Check_Parser_Diagnostic_Defaults;

   procedure Check_Domain_Package_Consistency
     (Root   : String;
      Errors : in out Natural)
   is
      Public_API : constant String := Read_File (Root, "docs/PUBLIC_API.toml");
      Example_Coverage : constant String :=
        Read_File (Root, "docs/EXAMPLE_COVERAGE.toml");
      Domain_Count : Natural := 0;
      Covered_Domain_Count : Natural := 0;

      procedure Check_Entry (Entry_Pos : Positive) is
         Unit_Name : constant String :=
           Manifest_String_Value_After (Public_API, "name = ", Entry_Pos);
         Path : constant String :=
           Manifest_String_Value_After (Public_API, "spec = ", Entry_Pos);
         Area : constant String :=
           Manifest_String_Value_After (Public_API, "area = ", Entry_Pos);
      begin
         if Area = "domain" then
            if Unit_Name = "" or else Path = "" then
               Error (Errors, "domain public API manifest entry is incomplete");
            else
               declare
                  Text : constant String := Read_File (Root, Path);
               begin
                  if not Contains (Text, "return Humanize.Status.Text_Result")
                  then
                     Error
                       (Errors,
                        "domain package lacks Text_Result labels: " & Path);
                  end if;
                  if not Contains (Text, "_Into") then
                     Error
                       (Errors,
                        "domain package lacks bounded _Into forms: " & Path);
                  end if;
                  if Contains (Example_Coverage, "unit = """ & Unit_Name & """")
                  then
                     Covered_Domain_Count := Covered_Domain_Count + 1;
                  end if;
                  Domain_Count := Domain_Count + 1;
               end;
            end if;
         end if;
      end Check_Entry;

      procedure Check_Entries is new Iterate_Manifest_Section (Check_Entry);
   begin
      Check_Entries (Public_API, "unit");

      Require_Minimum
        (Root, Errors, "domain_min_public_packages", Domain_Count,
         "public API manifest has too few domain packages");
      Require_Minimum
        (Root, Errors, "domain_min_example_covered_units",
         Covered_Domain_Count,
         "domain example coverage must include representative domain units");
   end Check_Domain_Package_Consistency;

   procedure Check_Quality_Guards
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Check_Humanize_Policy_Requirements.Check_Required_Files
        (Root, Errors);

      Check_Public_API_Surface (Root, Errors);
      Check_Humanize_Policy_Public_Surface.Check_Public_Spec_Purpose_Comments
        (Root, Errors);
      Check_Humanize_Policy_Public_Surface.Check_Public_API_Unit_Coverage_Gaps
        (Root, Errors);
      Check_Humanize_Policy_Generated.Check_Generated_Docs_Manifest
        (Root, Errors);
      Check_Humanize_Policy_Generated.Check_Generated_Data_Manifest
        (Root, Errors);
      Check_Structural_Baseline (Root, Errors);
      Check_Humanize_Policy_Examples.Check_Example_Coverage_Manifest
        (Root, Errors);
      Check_Performance_Baseline (Root, Errors);
      Check_Parser_Diagnostic_Defaults (Root, Errors);
      Check_Humanize_Policy_Exception_Handlers
        .Check_Intentional_Silent_Recovery (Root, Errors);
      Check_Humanize_Policy_Test_Sources.Check_Test_Source_Size_Guards
        (Root, Errors);
      Check_Humanize_Policy_Public_Facades.Check_Public_Facade_Budgets
        (Root, Errors);
      Check_Domain_Package_Consistency (Root, Errors);
      Check_Humanize_Policy_Non_Goals.Check_Non_Goals (Root, Errors);
   end Check_Quality_Guards;

   procedure Check_Deep_Static
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Check_Quality_Guards (Root, Errors);
      Check_Compiler_Stderr (Root, Errors);
   end Check_Deep_Static;

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
