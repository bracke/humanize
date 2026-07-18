with Ada.Directories;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;
with Project_Tools.Ada_Source;
with Project_Tools.Tree_Checks;

package body Check_Humanize_Policy_Boundaries is
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

      procedure Check_Locale_Metadata_Boundary is
         Catalog_Import : constant Project_Tools.Ada_Source.String_List :=
           [1 => To_Unbounded_String ("with Humanize.Catalogs")];
         Local_Generated_Phrase_Metadata : constant
           Project_Tools.Ada_Source.String_List :=
             [1 => To_Unbounded_String ("Locale in ""da""")];
         Local_Locale_Metadata : constant Project_Tools.Ada_Source.String_List :=
           [To_Unbounded_String ("type Locale_Code"),
            To_Unbounded_String ("type Locale_Index"),
            To_Unbounded_String ("function Base_Locale"),
            To_Unbounded_String ("function Locale_Name"),
            To_Unbounded_String ("for Code in Locale_Code"),
            To_Unbounded_String ("for Locale in Locale_Index")];
         Local_Regional_Locale_Metadata : constant
           Project_Tools.Ada_Source.String_List :=
             [To_Unbounded_String ("sv-SE"),
              To_Unbounded_String ("nb-NO"),
              To_Unbounded_String ("ja-JP"),
              To_Unbounded_String ("ar-EG")];
         Runtime_Local_Locale_Families : constant
           Project_Tools.Ada_Source.String_List :=
             [To_Unbounded_String ("function Locale_Prefix"),
              To_Unbounded_String ("function Is_Norwegian"),
              To_Unbounded_String ("function Is_CJK")];
         Runtime_Direct_Locale_Prefix : constant
           Project_Tools.Ada_Source.String_List :=
             [To_Unbounded_String
                ("Locale (Locale'First .. Locale'First + 1)"),
              To_Unbounded_String ("Locale'Length >= 2")];
         Runtime_Direct_Context_Locale_Prefix : constant
           Project_Tools.Ada_Source.String_List :=
             [To_Unbounded_String
                ("Locale_Prefix (Humanize.Contexts.Locale (Context))"),
              To_Unbounded_String ("Locale_Prefix (Locale (Context))")];
         Runtime_Direct_Context_Qualified_Locale_Prefix : constant
           Project_Tools.Ada_Source.String_List :=
             [To_Unbounded_String
                ("Humanize.Locales.Locale_Prefix (Humanize.Contexts.Locale (Context))"),
              To_Unbounded_String
                ("Humanize.Locales.Locale_Prefix (Locale (Context))")];
         Runtime_Context_Locale_Files : constant
           Project_Tools.Ada_Source.String_List :=
             [To_Unbounded_String ("humanize-byte_classification.adb"),
              To_Unbounded_String ("humanize-bytes.adb"),
              To_Unbounded_String ("humanize-capabilities.adb"),
              To_Unbounded_String ("humanize-catalogs.adb"),
              To_Unbounded_String ("humanize-colors.adb"),
              To_Unbounded_String ("humanize-contexts.adb"),
              To_Unbounded_String ("humanize-datetime_classification.adb"),
              To_Unbounded_String ("humanize-datetimes.adb"),
              To_Unbounded_String ("humanize-decimal_images.adb"),
              To_Unbounded_String ("humanize-duration_classification.adb"),
              To_Unbounded_String ("humanize-durations.adb"),
              To_Unbounded_String ("humanize-frequencies.adb"),
              To_Unbounded_String ("humanize-i18n_rendering.adb"),
              To_Unbounded_String ("humanize-lists.adb"),
              To_Unbounded_String ("humanize-messages.adb"),
              To_Unbounded_String ("humanize-number_classification.adb"),
              To_Unbounded_String ("humanize-numbers.adb"),
              To_Unbounded_String ("humanize-parsing.adb"),
              To_Unbounded_String ("humanize-phrases.adb"),
              To_Unbounded_String ("humanize-rates.adb"),
              To_Unbounded_String ("humanize-selections.adb"),
              To_Unbounded_String ("humanize-status.adb"),
              To_Unbounded_String ("humanize-strings.adb"),
              To_Unbounded_String ("humanize-styles.adb"),
              To_Unbounded_String ("humanize-unit_classification.adb"),
              To_Unbounded_String ("humanize-units.adb")];
         Classifier_Direct_Locale_Prefix : constant
           Project_Tools.Ada_Source.String_List :=
             [To_Unbounded_String
                ("Locale (Locale'First .. Locale'First + 2)"),
              To_Unbounded_String ("Locale'Length > 3"),
              To_Unbounded_String ("Locale'Length >= 4")];
         Runtime_Local_Language_Metadata : constant
           Project_Tools.Ada_Source.String_List :=
             [To_Unbounded_String ("function Language (Context"),
              To_Unbounded_String ("Last   : Natural := Locale'Last"),
              To_Unbounded_String ("Locale (Locale'First .. Last)")];
         Runtime_Direct_Region_Metadata : constant
           Project_Tools.Ada_Source.String_List :=
             [To_Unbounded_String ("Locale (Locale'First + 2)"),
              To_Unbounded_String ("Locale (Locale'First + 3 .. Locale'First + 4)")];
      begin
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/src/humanize-numbers.adb", Catalog_Import);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/src/humanize-parsing.adb", Catalog_Import);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/src/humanize-phrases.ads", Catalog_Import);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/src/humanize-phrases.adb", Catalog_Import);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/src/humanize-phrases.adb",
            Local_Generated_Phrase_Metadata);
         for Runtime_File of Runtime_Context_Locale_Files loop
            Project_Tools.Ada_Source.Require_No_Code_Tokens
              (Root & "/src/" & To_String (Runtime_File),
               Runtime_Local_Locale_Families);
            Project_Tools.Ada_Source.Require_No_Code_Tokens
              (Root & "/src/" & To_String (Runtime_File),
               Runtime_Direct_Locale_Prefix);
            Project_Tools.Ada_Source.Require_No_Code_Tokens
              (Root & "/src/" & To_String (Runtime_File),
               Runtime_Direct_Context_Locale_Prefix);
            Project_Tools.Ada_Source.Require_No_Code_Tokens
              (Root & "/src/" & To_String (Runtime_File),
               Runtime_Direct_Context_Qualified_Locale_Prefix);
            Project_Tools.Ada_Source.Require_No_Code_Tokens
              (Root & "/src/" & To_String (Runtime_File),
               Runtime_Local_Language_Metadata);
            Project_Tools.Ada_Source.Require_No_Code_Tokens
              (Root & "/src/" & To_String (Runtime_File),
               Runtime_Direct_Region_Metadata);
         end loop;
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/src/humanize-number_classification.adb",
            Classifier_Direct_Locale_Prefix);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/tests/src/humanize-tests-compatibility.adb",
            Local_Locale_Metadata);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/tests/src/humanize-tests-rendering.adb",
            Local_Locale_Metadata);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/tests/src/humanize-tests-rendering.adb",
            Local_Regional_Locale_Metadata);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/tests/src/humanize-tests-parsing.adb",
            Local_Locale_Metadata);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/tests/src/humanize-tests-numbers.adb",
            Local_Locale_Metadata);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/tests/src/humanize-tests-architecture.adb",
            Local_Locale_Metadata);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/tests/src/humanize-tests-numbers.adb",
            Local_Regional_Locale_Metadata);
         Project_Tools.Ada_Source.Require_No_Code_Tokens
           (Root & "/tests/src/locale_audit.adb",
            Local_Locale_Metadata);
      exception
         when Program_Error =>
            Error
              (Errors,
               "Humanize metadata users must use Humanize.Locales, not duplicate locale lists");
      end Check_Locale_Metadata_Boundary;
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
      Check_Locale_Metadata_Boundary;
   end Check_Tooling_Boundary;
end Check_Humanize_Policy_Boundaries;
