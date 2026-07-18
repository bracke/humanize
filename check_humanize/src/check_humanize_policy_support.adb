with Ada.Command_Line;
with Ada.Directories;
with Ada.Streams;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

with CryptoLib.Hashes;

with Project_Tools.Release_Checks;
with Project_Tools.Text;
with Project_Tools.TOML;

package body Check_Humanize_Policy_Support is
   use type Project_Tools.TOML.Natural_Parse_Status;

   Policy_Thresholds_Path : constant String := "docs/POLICY_THRESHOLDS.toml";

   procedure Error
     (Errors  : in out Natural;
      Message : String)
   is
   begin
      Errors := Errors + 1;
      Ada.Text_IO.Put_Line (Ada.Text_IO.Standard_Error, "error: " & Message);
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

   function Read_File
     (Root          : String;
      Relative_Path : String)
      return String
   is
     (To_String
        (Project_Tools.Text.Read_Text_File (Root & "/" & Relative_Path)));

   function Contains (Text, Pattern : String) return Boolean is
     (Ada.Strings.Fixed.Index (Text, Pattern) /= 0);

   function Starts_With (Text, Prefix : String) return Boolean is
     (Text'Length >= Prefix'Length
      and then Text (Text'First .. Text'First + Prefix'Length - 1) = Prefix);

   function Ends_With (Text, Suffix : String) return Boolean is
     (Text'Length >= Suffix'Length
      and then Text (Text'Last - Suffix'Length + 1 .. Text'Last) = Suffix);

   function Line_Count (Text : String) return Natural is
      Count : Natural := 0;
   begin
      for Ch of Text loop
         if Ch = ASCII.LF then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Line_Count;

   function SHA256_Hex (Text : String) return String is
      Hex    : constant String := "0123456789abcdef";
      Data   : Ada.Streams.Stream_Element_Array
        (1 .. Ada.Streams.Stream_Element_Offset (Text'Length));
      Digest : CryptoLib.Hashes.SHA256_Digest;
      Result : String (1 .. 64);
      Cursor : Positive := Result'First;
   begin
      for Index in Text'Range loop
         Data
           (Ada.Streams.Stream_Element_Offset
              (Index - Text'First + 1)) :=
           Ada.Streams.Stream_Element (Character'Pos (Text (Index)));
      end loop;

      Digest := CryptoLib.Hashes.SHA256 (Data);

      for Byte of Digest loop
         declare
            Value : constant Natural := Natural (Byte);
         begin
            Result (Cursor) := Hex (Value / 16 + 1);
            Result (Cursor + 1) := Hex (Value mod 16 + 1);
            Cursor := Cursor + 2;
         end;
      end loop;

      return Result;
   end SHA256_Hex;

   function Parse_Natural_After
     (Text : String;
      Key  : String;
      From : Positive)
      return Natural_Parse_Result
   is
     (Project_Tools.TOML.Parse_Natural_After (Text, Key, From));

   function Natural_Value_After
     (Text : String;
      Key  : String;
      From : Positive)
      return Natural
   is
     (Project_Tools.TOML.Natural_Value_After (Text, Key, From));

   function Manifest_String_Value_After
     (Text : String;
      Key  : String;
      From : Positive)
      return String
   is
     (Project_Tools.TOML.String_Value_After (Text, Key, From));

   function Parse_String_After
     (Text : String;
      Key  : String;
      From : Positive)
      return String_Parse_Result
   is
     (Project_Tools.TOML.Parse_String_After (Text, Key, From));

   function Policy_Threshold
     (Root : String;
      Key  : String)
      return Natural
   is
      Data  : constant String := Read_File (Root, Policy_Thresholds_Path);
      Parsed : constant Natural_Parse_Result :=
        Parse_Natural_After (Data, Key & " = ", Data'First);
   begin
      if Key = "" or else Parsed.Status /= Parsed_Natural then
         raise Program_Error;
      end if;

      return Parsed.Value;
   end Policy_Threshold;

   procedure Require_Minimum
     (Root    : String;
      Errors  : in out Natural;
      Key     : String;
      Actual  : Natural;
      Message : String)
   is
      Minimum : Natural := 0;
   begin
      begin
         Minimum := Policy_Threshold (Root, Key);
      exception
         when Program_Error =>
            Error (Errors, "missing policy threshold: " & Key);
            return;
      end;

      if Actual < Minimum then
         Error (Errors, Message);
      end if;
   end Require_Minimum;

   procedure Require_Exact
     (Root    : String;
      Errors  : in out Natural;
      Key     : String;
      Actual  : Natural;
      Message : String)
   is
      Expected : Natural := 0;
   begin
      begin
         Expected := Policy_Threshold (Root, Key);
      exception
         when Program_Error =>
            Error (Errors, "missing policy threshold: " & Key);
            return;
      end;

      if Actual /= Expected then
         Error (Errors, Message);
      end if;
   end Require_Exact;

   procedure Require_Maximum
     (Root    : String;
      Errors  : in out Natural;
      Key     : String;
      Actual  : Natural;
      Message : String)
   is
      Maximum : Natural := 0;
   begin
      begin
         Maximum := Policy_Threshold (Root, Key);
      exception
         when Program_Error =>
            Error (Errors, "missing policy threshold: " & Key);
            return;
      end;

      if Actual > Maximum then
         Error (Errors, Message);
      end if;
   end Require_Maximum;

   procedure Check_Policy_Threshold_Keys
     (Root   : String;
      Errors : in out Natural)
   is
      Data : constant String := Read_File (Root, Policy_Thresholds_Path);

      procedure Require_Key (Key : String) is
         Parsed : constant Natural_Parse_Result :=
           Parse_Natural_After (Data, Key & " = ", Data'First);
      begin
         case Parsed.Status is
            when Parsed_Natural =>
               null;
            when Missing_Natural =>
               Error (Errors, "policy threshold key is missing: " & Key);
            when Malformed_Natural =>
               Error (Errors, "policy threshold key is malformed: " & Key);
         end case;
      end Require_Key;
   begin
      Require_Key ("aunit_min_sections");
      Require_Key ("aunit_min_registrations");
      Require_Key ("aunit_min_assertions");
      Require_Key ("aunit_min_test_bodies");
      Require_Key ("required_file_min_entries");
      Require_Key ("required_text_min_entries");
      Require_Key ("public_documentation_min_root_specs");
      Require_Key ("public_api_min_units");
      Require_Key ("generated_data_exact_artifacts");
      Require_Key ("structural_baseline_min_bodies");
      Require_Key ("structural_baseline_min_lines");
      Require_Key ("example_coverage_min_major_tasks");
      Require_Key ("example_coverage_min_public_api_families");
      Require_Key ("generated_docs_min_docs");
      Require_Key ("public_facade_budget_min_entries");
      Require_Key ("domain_min_public_packages");
      Require_Key ("domain_min_example_covered_units");
      Require_Key ("performance_root_min_paths");
      Require_Key ("performance_formatting_min_paths");
      Require_Key ("performance_parsing_min_paths");
      Require_Key ("performance_text_min_paths");
      Require_Key ("performance_domain_min_paths");
      Require_Key ("performance_public_api_min_mappings");
      Require_Key ("performance_public_api_min_areas");
      Require_Key ("performance_exempt_max_family_child_facade");
      Require_Key ("performance_exempt_max_parser_wrapper");
      Require_Key ("performance_exempt_max_phrase_wrapper");
      Require_Key ("performance_exempt_max_pure_type_package");
      Require_Key ("performance_exempt_max_root_facade");
      Require_Key ("performance_exempt_max_support_facade");
      Require_Key ("performance_exempt_max_trivial_label_facade");
      Require_Key ("exception_marker_max_parse_failure_normalization");
      Require_Key ("exception_marker_max_defensive_recovery");
      Require_Key ("exception_marker_max_intentional_silent_recovery");
      Require_Key ("tooling_exception_marker_max_parse_failure_normalization");
      Require_Key ("tooling_exception_marker_max_defensive_recovery");
      Require_Key ("tooling_exception_marker_max_intentional_silent_recovery");
      Require_Key ("test_source_budget_min_entries");
   end Check_Policy_Threshold_Keys;

   procedure Iterate_Manifest_Section
     (Text    : String;
      Section : String)
   is
      Marker   : constant String := "[[" & Section & "]]";
      Position : Positive := Text'First;
   begin
      if Text = "" or else Section = "" then
         return;
      end if;

      loop
         declare
            Entry_Pos : constant Natural :=
              Ada.Strings.Fixed.Index (Text, Marker, From => Position);
         begin
            exit when Entry_Pos = 0;
            Process (Entry_Pos);

            exit when Entry_Pos = Text'Last;
            Position := Entry_Pos + 1;
         end;
      end loop;
   end Iterate_Manifest_Section;

   function Count_Files_With_Prefix
     (Root   : String;
      Prefix : String)
      return Natural
   is
      Slash : Natural := 0;
   begin
      for Index in reverse Prefix'Range loop
         if Prefix (Index) = '/' then
            Slash := Index;
            exit;
         end if;
      end loop;

      if Slash = 0 then
         return 0;
      end if;

      declare
         Dir       : constant String :=
           Root & "/" & Prefix (Prefix'First .. Slash - 1);
         Stem      : constant String := Prefix (Slash + 1 .. Prefix'Last);
         Search    : Ada.Directories.Search_Type;
         Dir_Entry : Ada.Directories.Directory_Entry_Type;
         Count     : Natural := 0;
      begin
         Ada.Directories.Start_Search
           (Search,
            Directory => Dir,
            Pattern   => Stem & "*.adb",
            Filter    => [Ada.Directories.Ordinary_File => True,
                          others => False]);
         while Ada.Directories.More_Entries (Search) loop
            Ada.Directories.Get_Next_Entry (Search, Dir_Entry);
            declare
               Name : constant String := Ada.Directories.Simple_Name (Dir_Entry);
            begin
               if Starts_With (Name, Stem) and then Ends_With (Name, ".adb") then
                  Count := Count + 1;
               end if;
            end;
         end loop;
         Ada.Directories.End_Search (Search);
         return Count;
      exception
         when Ada.Directories.Name_Error | Ada.Directories.Use_Error =>
            if Ada.Directories.More_Entries (Search) then
               Ada.Directories.End_Search (Search);
            end if;
            return 0;
      end;
   end Count_Files_With_Prefix;

   function Quoted_Value_After
     (Text : String;
      Key  : String;
      From : Positive)
      return String
   is
     (Project_Tools.TOML.Quoted_Value_After (Text, Key, From));
end Check_Humanize_Policy_Support;
