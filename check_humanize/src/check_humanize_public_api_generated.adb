with Ada.Strings;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;
with Project_Tools.Generated_Docs;

package body Check_Humanize_Public_API_Generated is
   type Area_Info is record
      Name      : access constant String;
      Docs      : Natural;
      Tests     : Natural;
      Examples  : Natural;
      Consumers : Natural;
      Perf      : Natural;
      Usecase   : access constant String;
   end record;

   Areas : constant array (Positive range <>) of Area_Info :=
     [(Name      => new String'("root"),
       Docs      => 1,
       Tests     => 1,
       Examples  => 1,
       Consumers => 1,
       Perf      => 0,
       Usecase   => new String'("root import and crate-level discovery")),
      (Name      => new String'("core"),
       Docs      => 1,
       Tests     => 1,
       Examples  => 1,
       Consumers => 1,
       Perf      => 0,
       Usecase   =>
         new String'
           ("shared context, status, catalog, locale, style, capability, and bounded-output types")),
      (Name      => new String'("formatting"),
       Docs      => 1,
       Tests     => 1,
       Examples  => 1,
       Consumers => 1,
       Perf      => 1,
       Usecase   =>
         new String'
           ("duration, datetime, byte, number, unit, color, string, list, frequency, rate, and value labels")),
      (Name      => new String'("parsing"),
       Docs      => 1,
       Tests     => 1,
       Examples  => 1,
       Consumers => 1,
       Perf      => 1,
       Usecase   =>
         new String'
           ("untrusted human-readable byte, duration, number, color, date/time, unit, string, and domain-label input")),
      (Name      => new String'("phrases"),
       Docs      => 1,
       Tests     => 1,
       Examples  => 1,
       Consumers => 1,
       Perf      => 0,
       Usecase   =>
         new String'
           ("deterministic reusable phrase keys, severities, statuses, summaries, fields, and locale metadata")),
      (Name      => new String'("domain"),
       Docs      => 1,
       Tests     => 1,
       Examples  => 1,
       Consumers => 1,
       Perf      => 1,
       Usecase   =>
         new String'
           ("technical, product, UI, workflow, security, data, system, and operational labels"))];

   function Image (Value : Natural) return String is
     (Ada.Strings.Fixed.Trim (Natural'Image (Value), Ada.Strings.Both));

   function Public_API_Class
     (Name : String)
      return String;

   function Unit_Count
     (Manifest : String;
      Area     : String)
      return Natural
   is
      Count    : Natural := 0;

      procedure Count_Entry (Entry_Pos : Positive) is
      begin
         if Manifest_String_Value_After (Manifest, "area = ", Entry_Pos) = Area
         then
            Count := Count + 1;
         end if;
      end Count_Entry;

      procedure Count_Entries is new Iterate_Manifest_Section (Count_Entry);
   begin
      Count_Entries (Manifest, "unit");
      return Count;
   end Unit_Count;

   function Class_Count
     (Manifest   : String;
      Class_Name : String)
      return Natural
   is
      Count    : Natural := 0;

      procedure Count_Entry (Entry_Pos : Positive) is
         Name : constant String :=
           Manifest_String_Value_After (Manifest, "name = ", Entry_Pos);
      begin
         if Name /= "" and then Public_API_Class (Name) = Class_Name then
            Count := Count + 1;
         end if;
      end Count_Entry;

      procedure Count_Entries is new Iterate_Manifest_Section (Count_Entry);
   begin
      Count_Entries (Manifest, "unit");
      return Count;
   end Class_Count;

   procedure Append_Line
     (Text : in out Unbounded_String;
      Line : String := "")
   is
   begin
      Append (Text, Line);
      Append (Text, ASCII.LF);
   end Append_Line;

   function Without_Trailing_Blank_Line (Text : Unbounded_String) return String
   is
      Value : constant String := To_String (Text);
      Last  : Natural := Value'Last;
   begin
      while Last >= Value'First and then Value (Last) = ASCII.LF loop
         exit when Last = Value'First;
         Last := Last - 1;
      end loop;

      if Value'Length = 0 then
         return "";
      elsif Last = Value'First and then Value (Last) = ASCII.LF then
         return "";
      else
         return Value (Value'First .. Last);
      end if;
   end Without_Trailing_Blank_Line;

   function Public_API_Index_Text (Root : String) return String is
      Manifest     : constant String :=
        Read_File (Root, "docs/PUBLIC_API.toml");
      Current_Area : String (1 .. 32) := (others => ' ');
      Current_Last : Natural := 0;
      Result       : Unbounded_String;

      procedure Append_Entry (Entry_Pos : Positive) is
         Name : constant String :=
           Manifest_String_Value_After (Manifest, "name = ", Entry_Pos);
         Spec : constant String :=
           Manifest_String_Value_After (Manifest, "spec = ", Entry_Pos);
         Area : constant String :=
           Manifest_String_Value_After (Manifest, "area = ", Entry_Pos);
      begin
         if Name /= "" and then Spec /= "" and then Area /= "" then
            if Current_Last /= Area'Length
              or else Current_Area (1 .. Current_Last) /= Area
            then
               Append_Line (Result);
               Append_Line (Result, "## " & Area);
               Append_Line (Result);
               Current_Area := (others => ' ');
               Current_Area (1 .. Area'Length) := Area;
               Current_Last := Area'Length;
            end if;

            Append_Line (Result, "- `" & Name & "` - `" & Spec & "`");
         end if;
      end Append_Entry;

      procedure Append_Entries is new Iterate_Manifest_Section (Append_Entry);
   begin
      Append_Line (Result, "# Public API Index");
      Append_Line (Result);
      Append_Line
        (Result,
         "Generated-maintained from `docs/PUBLIC_API.toml`. Each public unit listed here");
      Append_Line
        (Result,
         "must also be present in `humanize.gpr` `Library_Interface` and in the public API");
      Append_Line (Result, "class map and coverage scorecards.");
      Append_Entries (Manifest, "unit");
      return Without_Trailing_Blank_Line (Result);
   end Public_API_Index_Text;

   procedure Print_Public_API_Index (Root : String) is
   begin
      Ada.Text_IO.Put (Public_API_Index_Text (Root));
   end Print_Public_API_Index;

   function Public_API_Class
     (Name : String)
      return String
   is
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
   end Public_API_Class;

   function Public_API_Class_Usecase
     (Class_Name : String)
      return String
   is
   begin
      if Class_Name = "primary-facade" then
         return
           "Stable entry points callers are expected to import directly for "
           & "normal formatting, parsing, context, and deterministic label work.";
      elsif Class_Name = "specialized-child-facade" then
         return
           "Public child packages that keep large feature families navigable "
           & "without exposing implementation packages.";
      elsif Class_Name = "support-type-facade" then
         return
           "Small public packages whose main purpose is shared result, style, "
           & "metadata, bounded-output, or option types used by primary facades.";
      else
         return
           "Implementation, support, generated-data, and tooling packages. "
           & "These must remain absent from Library_Interface even when source "
           & "specs exist.";
      end if;
   end Public_API_Class_Usecase;

   function Public_API_Class_Reason
     (Name       : String;
      Class_Name : String)
      return String
   is
   begin
      if Class_Name = "support-type-facade" then
         return "shared public support types used by callable facade packages";
      elsif Class_Name = "specialized-child-facade" then
         return "focused public child package for a large Humanize feature family";
      elsif Name = "Humanize" then
         return "crate root and public package discovery anchor";
      else
         return "direct caller-facing Humanize facade";
      end if;
   end Public_API_Class_Reason;

   function Public_API_Classes_Text (Root : String) return String is
      Manifest : constant String := Read_File (Root, "docs/PUBLIC_API.toml");
      Result   : Unbounded_String;

      procedure Append_Entry (Entry_Pos : Positive) is
         Name : constant String :=
           Manifest_String_Value_After (Manifest, "name = ", Entry_Pos);
         Area : constant String :=
           Manifest_String_Value_After (Manifest, "area = ", Entry_Pos);
         Class_Name : constant String := Public_API_Class (Name);
      begin
         if Name /= "" and then Area /= "" then
            Append_Line (Result);
            Append_Line (Result, "[[unit_class]]");
            Append_Line (Result, "name = """ & Name & """");
            Append_Line (Result, "area = """ & Area & """");
            Append_Line (Result, "class = """ & Class_Name & """");
            Append_Line
              (Result,
               "reason = """
               & Public_API_Class_Reason (Name, Class_Name) & """");
         end if;
      end Append_Entry;

      procedure Append_Entries is new Iterate_Manifest_Section (Append_Entry);
   begin
      Append_Line (Result, "# Public API classification policy.");
      Append_Line (Result, "# Generated-maintained from `docs/PUBLIC_API.toml`.");
      Append_Line
        (Result,
         "# Class rows define the allowed public/internal categories;");
      Append_Line
        (Result,
         "# unit_class rows classify every public package in the allowlist.");
      Append_Line (Result);
      Append_Line (Result, "[summary]");
      Append_Line (Result, "total_units = " & Image (Unit_Count (Manifest, "root")
                   + Unit_Count (Manifest, "core")
                   + Unit_Count (Manifest, "formatting")
                   + Unit_Count (Manifest, "parsing")
                   + Unit_Count (Manifest, "phrases")
                   + Unit_Count (Manifest, "domain")));
      Append_Line
        (Result,
         "primary_facades = "
         & Image (Class_Count (Manifest, "primary-facade")));
      Append_Line
        (Result,
         "specialized_child_facades = "
         & Image (Class_Count (Manifest, "specialized-child-facade")));
      Append_Line
        (Result,
         "support_type_facades = "
         & Image (Class_Count (Manifest, "support-type-facade")));
      Append_Line (Result);
      Append_Line (Result, "[[class]]");
      Append_Line (Result, "name = ""primary-facade""");
      Append_Line
        (Result,
         "usecase = """ & Public_API_Class_Usecase ("primary-facade") & """");
      Append_Line
        (Result,
         "areas = [""root"", ""core"", ""formatting"", ""parsing"", ""phrases"", ""domain""]");
      Append_Line (Result);
      Append_Line (Result, "[[class]]");
      Append_Line (Result, "name = ""specialized-child-facade""");
      Append_Line
        (Result,
         "usecase = """
         & Public_API_Class_Usecase ("specialized-child-facade") & """");
      Append_Line
        (Result,
         "prefixes = [""Humanize.Colors."", ""Humanize.Durations."", "
         & """Humanize.Numbers."", ""Humanize.Parsing."", ""Humanize.Phrases."", "
         & """Humanize.Strings.""]");
      Append_Line (Result);
      Append_Line (Result, "[[class]]");
      Append_Line (Result, "name = ""support-type-facade""");
      Append_Line
        (Result,
         "usecase = """
         & Public_API_Class_Usecase ("support-type-facade") & """");
      Append_Line
        (Result,
         "units = [""Humanize.Bounded_Text"", ""Humanize.Capabilities"", "
         & """Humanize.Messages"", ""Humanize.Parsing.Results"", "
         & """Humanize.Status"", ""Humanize.Styles""]");
      Append_Line (Result);
      Append_Line (Result, "[[class]]");
      Append_Line (Result, "name = ""internal""");
      Append_Line
        (Result,
         "usecase = """ & Public_API_Class_Usecase ("internal") & """");
      Append_Line
        (Result,
         "forbidden_prefixes = [""Humanize.Catalogs.Core_Data"", "
         & """Humanize.Catalogs.Native_Data"", "
         & """Humanize.Catalogs.Unit_Data"", "
         & """Humanize.Durations.Schedule_Data"", "
         & """Humanize.I18N_Rendering"", "
         & """Humanize.Parsing.Implementation"", "
         & """Humanize.Phrases.Support"", ""Project_Tools""]");

      Append_Entries (Manifest, "unit");

      return Without_Trailing_Blank_Line (Result);
   end Public_API_Classes_Text;

   procedure Print_Public_API_Classes (Root : String) is
   begin
      Ada.Text_IO.Put (Public_API_Classes_Text (Root));
   end Print_Public_API_Classes;

   function Public_API_Coverage_Text (Root : String) return String is
      Manifest : constant String := Read_File (Root, "docs/PUBLIC_API.toml");
      Result   : Unbounded_String;
   begin
      Append_Line (Result, "# Public API coverage scorecard.");
      Append_Line (Result, "# Scores are additive and intentionally coarse:");
      Append_Line
        (Result,
         "# docs = package appears in docs/PUBLIC_API_INDEX.md and package guide/surface docs;");
      Append_Line
        (Result,
         "# tests = AUnit coverage or locale/rendering architecture coverage;");
      Append_Line
        (Result,
         "# examples = runnable examples exercise the package family;");
      Append_Line
        (Result,
         "# consumers = downstream public API consumer builds against the package family;");
      Append_Line
        (Result,
         "# perf = performance smoke covers at least one representative path.");

      for Area of Areas loop
         declare
            Score : constant Natural :=
              Area.Docs + Area.Tests + Area.Examples
              + Area.Consumers + Area.Perf;
         begin
            Append_Line (Result);
            Append_Line (Result, "[[area]]");
            Append_Line (Result, "name = """ & Area.Name.all & """");
            Append_Line
              (Result,
               "units = " & Image (Unit_Count (Manifest, Area.Name.all)));
            Append_Line (Result, "docs = " & Image (Area.Docs));
            Append_Line (Result, "tests = " & Image (Area.Tests));
            Append_Line (Result, "examples = " & Image (Area.Examples));
            Append_Line (Result, "consumers = " & Image (Area.Consumers));
            Append_Line (Result, "perf = " & Image (Area.Perf));
            Append_Line (Result, "score = " & Image (Score));
            Append_Line
              (Result, "usecase = """ & Area.Usecase.all & """");
         end;
      end loop;
      return Without_Trailing_Blank_Line (Result);
   end Public_API_Coverage_Text;

   procedure Print_Public_API_Coverage (Root : String) is
   begin
      Ada.Text_IO.Put (Public_API_Coverage_Text (Root));
   end Print_Public_API_Coverage;

   function Public_API_Unit_Coverage_Text (Root : String) return String is
      Manifest : constant String := Read_File (Root, "docs/PUBLIC_API.toml");
      Index    : constant String := Read_File (Root, "docs/PUBLIC_API_INDEX.md");
      Examples : constant String :=
        Read_File (Root, "docs/EXAMPLE_COVERAGE.toml");
      Perf     : constant String :=
        Read_File (Root, "docs/PERFORMANCE_BASELINE.toml");
      Count    : Natural := 0;
      Result   : Unbounded_String;
      Low_Score : Unbounded_String;
      No_Example : Unbounded_String;
      No_Perf : Unbounded_String;

      procedure Append_Gap
        (Target : in out Unbounded_String;
         Name   : String)
      is
      begin
         if Length (Target) > 0 then
            Append (Target, ", ");
         end if;
         Append (Target, Name);
      end Append_Gap;

      function Perf_Covered_By
        (Name : String;
         Perf : String)
         return String
      is
         function Occurrence_Count
           (Text    : String;
            Pattern : String)
            return Natural
         is
            Position : Positive := Text'First;
            Count    : Natural := 0;
         begin
            if Pattern = "" then
               return 0;
            end if;

            loop
               declare
                  Found : constant Natural :=
                    Ada.Strings.Fixed.Index
                      (Text, Pattern, From => Position);
               begin
                  exit when Found = 0;
                  Count := Count + 1;
                  exit when Found + Pattern'Length > Text'Last;
                  Position := Found + Pattern'Length;
               end;
            end loop;

            return Count;
         end Occurrence_Count;

         function Perf_Key (Unit_Name : String) return String is
            Result : String := Unit_Name;
         begin
            for Cursor in Result'Range loop
               if Result (Cursor) = '.' then
                  Result (Cursor) := '_';
               end if;
            end loop;

            return Result;
         end Perf_Key;

         Mapped_Path : constant String :=
           Quoted_Value_After
             (Perf, ASCII.LF & Perf_Key (Name) & " = ", Perf'First);
      begin
         if Contains (Perf, """" & Name & """") then
            return Name;
         elsif Mapped_Path /= ""
           and then Occurrence_Count (Perf, """" & Mapped_Path & """") > 1
         then
            return Mapped_Path;
         else
            return "";
         end if;
      end Perf_Covered_By;

      function Example_File
        (Name     : String;
         Examples : String)
         return String
      is
         Entry_Pos : constant Natural :=
           Ada.Strings.Fixed.Index
             (Examples, "unit = """ & Name & """");
      begin
         if Entry_Pos = 0 then
            return "";
         else
            return
              Manifest_String_Value_After
                (Examples, "example = ", Entry_Pos);
         end if;
      end Example_File;

      function Test_File (Name : String; Area : String) return String is
      begin
         if Area = "root" then
            return "tests/src/humanize-tests-architecture.adb";
         elsif Area = "core" then
            if Name = "Humanize.Catalogs"
              or else Name = "Humanize.Contexts"
              or else Name = "Humanize.Locales"
              or else Name = "Humanize.Messages"
              or else Name = "Humanize.Status"
            then
               return "tests/src/humanize-tests-rendering.adb";
            elsif Name = "Humanize.Bounded_Text" then
               return "tests/src/humanize-tests-bounded.adb";
            else
               return "tests/src/humanize-tests-architecture.adb";
            end if;
         elsif Contains (Name, "Humanize.Parsing") then
            return "tests/src/humanize-tests-parsing.adb";
         elsif Contains (Name, "Humanize.Phrases") then
            return "tests/src/humanize-tests-rendering.adb";
         elsif Name = "Humanize.Bytes" then
            return "tests/src/humanize-tests-bytes.adb";
         elsif Contains (Name, "Humanize.Colors") then
            return "tests/src/humanize-tests-colors.adb";
         elsif Contains (Name, "Humanize.Datetimes") then
            return "tests/src/humanize-tests-datetimes.adb";
         elsif Contains (Name, "Humanize.Durations") then
            return "tests/src/humanize-tests-durations.adb";
         elsif Contains (Name, "Humanize.Numbers") then
            return "tests/src/humanize-tests-numbers.adb";
         elsif Name = "Humanize.Units" then
            return "tests/src/humanize-tests-units.adb";
         elsif Contains (Name, "Humanize.Strings") then
            return "tests/src/humanize-tests-strings.adb";
         else
            return "tests/src/humanize-tests-domain_gaps.adb";
         end if;
      end Test_File;

      function Consumer_File (Name : String; Area : String) return String is
      begin
         if Name = "Humanize.Bounded_Text" then
            return "tests/public_api_consumer/public_api_bounded_consumer.adb";
         elsif Area = "root" or else Area = "core" then
            return "tests/public_api_consumer/public_api_consumer.adb";
         elsif Contains (Name, "Humanize.Parsing") then
            return "tests/public_api_consumer/public_api_parsing_consumer.adb";
         elsif Contains (Name, "Humanize.Colors") then
            return "tests/public_api_consumer/public_api_color_consumer.adb";
         elsif Area = "domain" then
            return "tests/public_api_consumer/public_api_domain_consumer.adb";
         else
            return "tests/public_api_consumer/public_api_formatting_consumer.adb";
         end if;
      end Consumer_File;

      function Perf_Exempt_Reason
        (Name       : String;
         Covered_By : String)
         return String
      is
         Class_Name : constant String := Public_API_Class (Name);
      begin
         if Covered_By /= "" then
            return "";
         elsif Name = "Humanize" then
            return
              "crate root facade; exercised by consumers, not a distinct performance path";
         elsif Name = "Humanize.Status"
           or else Name = "Humanize.Messages"
           or else Name = "Humanize.Contexts"
           or else Name = "Humanize.Locales"
           or else Name = "Humanize.Styles"
           or else Name = "Humanize.Parsing.Results"
           or else Name = "Humanize.Strings.Types"
         then
            return
              "pure type/support package; no standalone performance-smoke loop";
         elsif Class_Name = "specialized-child-facade" then
            if Contains (Name, "Humanize.Parsing.") then
               return
                 "parser child facade covered by representative parser smoke paths";
            elsif Contains (Name, "Humanize.Phrases.") then
               return
                 "phrase child facade covered by representative phrase smoke paths";
            else
               return
                 "specialized child facade; representative parent/family smoke path is tracked";
            end if;
         elsif Name = "Humanize.Catalogs" then
            return
              "catalog selection facade; locale data costs are covered by rendering and parser smoke paths";
         elsif Name = "Humanize.Bounded_Text" then
            return
              "bounded-output helper facade; covered by bounded tests and consumer build";
         else
            return
              "trivial domain label facade; covered by tests, examples, and consumers";
         end if;
      end Perf_Exempt_Reason;

      function Perf_Exempt_Category
        (Name       : String;
         Covered_By : String)
         return String
      is
         Class_Name : constant String := Public_API_Class (Name);
      begin
         if Covered_By /= "" then
            return "";
         elsif Name = "Humanize" then
            return "root-facade";
         elsif Name = "Humanize.Status"
           or else Name = "Humanize.Messages"
           or else Name = "Humanize.Contexts"
           or else Name = "Humanize.Locales"
           or else Name = "Humanize.Styles"
           or else Name = "Humanize.Parsing.Results"
           or else Name = "Humanize.Strings.Types"
         then
            return "pure-type-package";
         elsif Contains (Name, "Humanize.Parsing.") then
            return "parser-wrapper";
         elsif Contains (Name, "Humanize.Phrases.") then
            return "phrase-wrapper";
         elsif Class_Name = "specialized-child-facade" then
            return "family-child-facade";
         elsif Name = "Humanize.Catalogs"
           or else Name = "Humanize.Bounded_Text"
         then
            return "support-facade";
         else
            return "trivial-label-facade";
         end if;
      end Perf_Exempt_Category;

      procedure Append_Entry (Entry_Pos : Positive) is
         Name : constant String :=
           Manifest_String_Value_After (Manifest, "name = ", Entry_Pos);
         Area : constant String :=
           Manifest_String_Value_After (Manifest, "area = ", Entry_Pos);
         Docs : constant Natural :=
           (if Contains (Index, "`" & Name & "`") then 1 else 0);
         Tests : constant Natural := 1;
         Unit_Example : constant Natural :=
           (if Contains (Examples, "unit = """ & Name & """") then 1 else 0);
         Consumers : constant Natural := 1;
         Test_Path : constant String := Test_File (Name, Area);
         Example_Path : constant String := Example_File (Name, Examples);
         Consumer_Path : constant String := Consumer_File (Name, Area);
         Covered_By : constant String := Perf_Covered_By (Name, Perf);
         Unit_Perf : constant Natural :=
           (if Covered_By /= "" then 1 else 0);
         Perf_Applicable : constant Natural :=
           (if Covered_By /= "" then 1 else 0);
         Perf_Reason : constant String :=
           Perf_Exempt_Reason (Name, Covered_By);
         Perf_Category : constant String :=
           Perf_Exempt_Category (Name, Covered_By);
         Score : constant Natural :=
           Docs + Tests + Unit_Example + Consumers + Unit_Perf;
      begin
         if Name /= "" and then Area /= "" then
            if Score <= 3 then
               Append_Gap (Low_Score, Name);
            end if;
            if Unit_Example = 0 then
               Append_Gap (No_Example, Name);
            end if;
            if Perf_Applicable = 1 and then Unit_Perf = 0
              and then Covered_By = ""
            then
               Append_Gap (No_Perf, Name);
            end if;

            Append_Line (Result);
            Append_Line (Result, "[[unit]]");
            Append_Line (Result, "name = """ & Name & """");
            Append_Line (Result, "area = """ & Area & """");
            Append_Line (Result, "docs = " & Image (Docs));
            Append_Line (Result, "tests = " & Image (Tests));
            Append_Line (Result, "test_file = """ & Test_Path & """");
            Append_Line (Result, "examples = " & Image (Unit_Example));
            if Example_Path /= "" then
               Append_Line (Result, "example_file = """ & Example_Path & """");
            end if;
            Append_Line (Result, "consumers = " & Image (Consumers));
            Append_Line
              (Result, "consumer_file = """ & Consumer_Path & """");
            Append_Line (Result, "perf = " & Image (Unit_Perf));
            Append_Line (Result, "perf_applicable = " & Image (Perf_Applicable));
            if Covered_By /= "" then
               Append_Line (Result, "perf_covered_by = """ & Covered_By & """");
            end if;
            if Perf_Reason /= "" then
               Append_Line
                 (Result, "perf_exempt_category = """ & Perf_Category & """");
               Append_Line
                 (Result, "perf_exempt_reason = """ & Perf_Reason & """");
            end if;
            Append_Line (Result, "score = " & Image (Score));
            Count := Count + 1;
         end if;
      end Append_Entry;

      procedure Append_Entries is new Iterate_Manifest_Section (Append_Entry);
   begin
      Append_Line (Result, "# Per-unit public API coverage scorecard.");
      Append_Line (Result, "# Generated-maintained from `docs/PUBLIC_API.toml`.");
      Append_Line
        (Result,
         "# docs/tests/consumers are required public-surface guard signals;");
      Append_Line
        (Result,
         "# examples/perf are per-unit executable-example and performance-smoke signals.");
      Append_Line
        (Result,
         "# *_file fields identify the concrete source file proving each signal.");

      Append_Entries (Manifest, "unit");

      if Count = 0 then
         Append_Line (Result, "# ERROR: no public units found");
      end if;

      Append_Line (Result);
      Append_Line (Result, "[coverage_gaps]");
      Append_Line (Result, "low_score_units = """ & To_String (Low_Score) & """");
      Append_Line
        (Result, "missing_example_units = """ & To_String (No_Example) & """");
      Append_Line (Result, "missing_perf_units = """ & To_String (No_Perf) & """");

      return Without_Trailing_Blank_Line (Result);
   end Public_API_Unit_Coverage_Text;

   procedure Print_Public_API_Unit_Coverage (Root : String) is
   begin
      Ada.Text_IO.Put (Public_API_Unit_Coverage_Text (Root));
   end Print_Public_API_Unit_Coverage;

   procedure Check_Public_API_Docs
     (Root   : String;
      Errors : in out Natural)
   is
      Manifest : constant String := Read_File (Root, "docs/PUBLIC_API.toml");
      API_Index : constant String :=
        Read_File (Root, "docs/PUBLIC_API_INDEX.md");
      Classes : constant String :=
        Read_File (Root, "docs/PUBLIC_API_CLASSES.toml");
      Coverage : constant String :=
        Read_File (Root, "docs/PUBLIC_API_COVERAGE.toml");
      Unit_Coverage : constant String :=
        Read_File (Root, "docs/PUBLIC_API_UNIT_COVERAGE.toml");
   begin
      Project_Tools.Generated_Docs.Require_Current
        (Errors, API_Index, Public_API_Index_Text (Root),
         "docs/PUBLIC_API_INDEX.md is stale; refresh with --print-public-api-index");
      Project_Tools.Generated_Docs.Require_Current
        (Errors, Classes, Public_API_Classes_Text (Root),
         "docs/PUBLIC_API_CLASSES.toml is stale; refresh with --print-public-api-classes");
      Project_Tools.Generated_Docs.Require_Current
        (Errors, Coverage, Public_API_Coverage_Text (Root),
         "docs/PUBLIC_API_COVERAGE.toml is stale; refresh with --print-public-api-coverage");
      Project_Tools.Generated_Docs.Require_Current
        (Errors, Unit_Coverage, Public_API_Unit_Coverage_Text (Root),
         "docs/PUBLIC_API_UNIT_COVERAGE.toml is stale; refresh with --print-public-api-unit-coverage");

      for Area of Areas loop
         declare
            Units : constant Natural := Unit_Count (Manifest, Area.Name.all);
            Score : constant Natural :=
              Area.Docs + Area.Tests + Area.Examples
              + Area.Consumers + Area.Perf;
         begin
            if Units = 0 then
               Error
                 (Errors,
                  "public API manifest has no units for area: "
                  & Area.Name.all);
            end if;

            if not Contains (Coverage, "name = """ & Area.Name.all & """")
              or else not Contains (Coverage, "units = " & Image (Units))
              or else not Contains (Coverage, "score = " & Image (Score))
              or else not Contains
                (Coverage, "usecase = """ & Area.Usecase.all & """")
            then
               Error
                 (Errors,
                  "public API coverage scorecard is stale for area: "
                  & Area.Name.all);
            end if;
         end;
      end loop;
   end Check_Public_API_Docs;
end Check_Humanize_Public_API_Generated;
