with Ada.Command_Line;
with Ada.Directories;
with Ada.Streams;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

with CryptoLib.Hashes;

with Project_Tools.Ada_Source;
with Project_Tools.Alire_Manifests;
with Project_Tools.AUnit_Checks;
with Project_Tools.Files;
with Project_Tools.Release_Checks;
with Project_Tools.Text;
with Project_Tools.Tree_Checks;

package body Check_Humanize_Policy is
   use Ada.Text_IO;
   use type Ada.Directories.File_Size;

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

   function Natural_Value_After
     (Text : String;
      Key  : String;
      From : Positive)
      return Natural
   is
      Key_Pos : constant Natural :=
        Ada.Strings.Fixed.Index (Text, Key, From => From);
   begin
      if Key_Pos = 0 then
         return 0;
      end if;

      declare
         First : Natural := Key_Pos + Key'Length;
         Last  : Natural := First;
      begin
         while First <= Text'Last and then Text (First) = ' ' loop
            First := First + 1;
         end loop;
         Last := First;
         while Last <= Text'Last and then Text (Last) in '0' .. '9' loop
            Last := Last + 1;
         end loop;
         if Last = First then
            return 0;
         else
            return Natural'Value (Text (First .. Last - 1));
         end if;
      end;
   exception
      when others =>
         return 0;
   end Natural_Value_After;

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
         Dir    : constant String := Root & "/" & Prefix (Prefix'First .. Slash - 1);
         Stem   : constant String := Prefix (Slash + 1 .. Prefix'Last);
         Search : Ada.Directories.Search_Type;
         Dir_Entry : Ada.Directories.Directory_Entry_Type;
         Count  : Natural := 0;
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
         when others =>
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
      Key_Pos : constant Natural :=
        Ada.Strings.Fixed.Index (Text, Key, From => From);
   begin
      if Key_Pos = 0 then
         return "";
      end if;

      declare
         First_Quote : constant Natural :=
           Ada.Strings.Fixed.Index
             (Text, """", From => Key_Pos + Key'Length);
      begin
         if First_Quote = 0 then
            return "";
         end if;

         declare
            Last_Quote : constant Natural :=
              Ada.Strings.Fixed.Index (Text, """", From => First_Quote + 1);
         begin
            if Last_Quote = 0 or else Last_Quote = First_Quote + 1 then
               return "";
            end if;

            return Text (First_Quote + 1 .. Last_Quote - 1);
         end;
      end;
   end Quoted_Value_After;

   procedure Check_Manifest
     (Root   : String;
      Errors : in out Natural)
   is
      Release_Dependencies : constant Project_Tools.Alire_Manifests.String_List :=
        [1 => To_Unbounded_String ("i18n = { path = ""../i18n"" }")];
   begin
      Project_Tools.Files.Require_Contains
        (Root & "/alire.toml", "gnat_native = ""=15.2.1""",
         "humanize development manifest must pin Alire GNAT 15");
      Project_Tools.Files.Require_Contains
        (Root & "/alire.release.toml", "gnat_native = ""=15.2.1""",
         "humanize release manifest must pin Alire GNAT 15");
      Project_Tools.Files.Require_Contains
        (Root & "/alire.build.toml", "gnat_native = ""=15.2.1""",
         "humanize build overlay must pin Alire GNAT 15");
      Project_Tools.Files.Require_Contains
        (Root & "/tests/alire.toml", "gnat_native = ""=15.2.1""",
         "humanize tests manifest must pin Alire GNAT 15");
      Project_Tools.Files.Require_Contains
        (Root & "/check_humanize/alire.toml", "gnat_native = ""=15.2.1""",
         "humanize tooling manifest must pin Alire GNAT 15");
      Project_Tools.Files.Require_Contains
        (Root & "/check_humanize/alire.toml", "cryptolib = ""*""",
         "humanize tooling manifest must depend on cryptolib for hash checks");
      Project_Tools.Alire_Manifests.Require_Workspace_Pin
        (Root & "/check_humanize/alire.toml", "cryptolib", "../../cryptolib");
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
      Require_File (Root, Errors, "docs/INTERNAL_STRUCTURE.md");
      Require_File (Root, Errors, "docs/RELEASE_VERIFICATION.md");
      Require_File (Root, Errors, "docs/QUALITY_GUARDS.md");
      Require_File (Root, Errors, "docs/API_SURFACE.md");
      Require_File (Root, Errors, "docs/TASK_GUIDE.md");
      Require_File (Root, Errors, "docs/GENERATED_DATA.toml");
      Require_File (Root, Errors, "docs/PUBLIC_API.toml");
      Require_File (Root, Errors, "docs/PUBLIC_API_INDEX.md");
      Require_File (Root, Errors, "docs/PUBLIC_API_COVERAGE.toml");
      Require_File (Root, Errors, "docs/EXAMPLE_COVERAGE.toml");
      Require_File (Root, Errors, "docs/PERFORMANCE_BASELINE.toml");
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
        (Root, Errors, "README.md", "Humanize.Locales",
         "README must document the neutral locale metadata package");
      Require_Text
        (Root, Errors, "README.md", "Language_Code",
         "README must document the locale language helper");
      Require_Text
        (Root, Errors, "README.md", "Region_Code",
         "README must document the locale region helper");
      Require_Text
        (Root, Errors, "README.md", "Is_Norwegian",
         "README must document shared locale family predicates");
      Require_Text
        (Root, Errors, "README.md", "Is_CJK",
         "README must document shared CJK locale predicate");
      Require_Text
        (Root, Errors, "README.md", "gnat_native = ""=15.2.1""",
         "README must document the pinned Alire GNAT 15 toolchain");
      Require_Text
        (Root, Errors, "docs/RELEASE_VERIFICATION.md", "gnat_native = ""=15.2.1""",
         "release verification must document the pinned Alire GNAT 15 toolchain");
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
        (Root, Errors, "docs/INTERNAL_STRUCTURE.md", "Humanize.Parsing.Support",
         "internal structure map must define parsing extraction boundaries");
      Require_Text
        (Root, Errors, "docs/INTERNAL_STRUCTURE.md", "Humanize.Numbers.Spellout_Data",
         "internal structure map must define number data extraction boundaries");
      Require_Text
        (Root, Errors, "docs/INTERNAL_STRUCTURE.md", "Humanize.Durations.Business_Calendars",
         "internal structure map must define duration extraction boundaries");
      Require_Text
        (Root, Errors, "docs/INTERNAL_STRUCTURE.md", "Humanize.Catalogs.Core_Data",
         "internal structure map must define catalog core-data boundary");
      Require_Text
        (Root, Errors, "docs/INTERNAL_STRUCTURE.md", "Humanize.Catalogs.Unit_Data",
         "internal structure map must define generated unit catalog boundary");
      Require_Text
        (Root, Errors, "docs/INTERNAL_STRUCTURE.md", "Humanize.Catalogs.Native_Data",
         "internal structure map must define native catalog boundary");
      Require_Text
        (Root, Errors, "docs/INTERNAL_STRUCTURE.md", "Humanize.Catalogs.Loader",
         "internal structure map must define catalog extraction boundaries");
      Require_Text
        (Root, Errors, "docs/INTERNAL_STRUCTURE.md", "Humanize.Colors.CSS",
         "internal structure map must define color extraction boundaries");
      Require_Text
        (Root, Errors, "docs/specification.md", "Humanize.Locales",
         "specification must document neutral locale metadata");
      Require_Text
        (Root, Errors, "docs/specification.md", "Language_Code",
         "specification must document the locale language helper");
      Require_Text
        (Root, Errors, "docs/specification.md", "Region_Code",
         "specification must document the locale region helper");
      Require_Text
        (Root, Errors, "docs/specification.md", "Is_Norwegian",
         "specification must document shared locale family predicates");
      Require_Text
        (Root, Errors, "docs/specification.md", "Is_CJK",
         "specification must document shared CJK locale predicate");
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

   procedure Check_Source_Tree_Artifacts
     (Root   : String;
      Errors : in out Natural)
   is
      Search : Ada.Directories.Search_Type;
      Open   : Boolean := False;

      function Has_Suffix (Text : String; Suffix : String) return Boolean is
        (Text'Length >= Suffix'Length
         and then Text (Text'Last - Suffix'Length + 1 .. Text'Last) = Suffix);

      function Is_Forbidden_Root_File (Name : String) return Boolean is
        (Has_Suffix (Name, ".ali")
         or else Has_Suffix (Name, ".o")
         or else Name = "check_colors"
         or else Name = "color_accessibility_check"
         or else Name = "debug_color"
         or else Name = "debug_humanize_parse");
   begin
      Ada.Directories.Start_Search
        (Search    => Search,
         Directory => Root,
         Pattern   => "*",
         Filter    =>
           [Ada.Directories.Ordinary_File => True, others => False]);
      Open := True;

      while Ada.Directories.More_Entries (Search) loop
         declare
            Item : Ada.Directories.Directory_Entry_Type;
         begin
            Ada.Directories.Get_Next_Entry (Search, Item);
            declare
               Name : constant String := Ada.Directories.Simple_Name (Item);
            begin
               if Is_Forbidden_Root_File (Name) then
                  Error
                    (Errors,
                     "source root contains generated build/debug artifact: "
                     & Name);
               end if;
            end;
         end;
      end loop;

      Ada.Directories.End_Search (Search);
      Open := False;
   exception
      when others =>
         if Open then
            Ada.Directories.End_Search (Search);
         end if;
         Error (Errors, "could not scan source root for generated artifacts");
   end Check_Source_Tree_Artifacts;

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

   procedure Check_Public_Documentation
     (Root   : String;
      Errors : in out Natural)
   is
      Public_Specs : constant Project_Tools.Files.Path_List :=
        [To_Unbounded_String ("humanize-status.ads"),
         To_Unbounded_String ("humanize-messages.ads"),
         To_Unbounded_String ("humanize-contexts.ads"),
         To_Unbounded_String ("humanize-locales.ads"),
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
         To_Unbounded_String ("humanize-values.ads"),
         To_Unbounded_String ("humanize-endpoints.ads"),
         To_Unbounded_String ("humanize-resources.ads"),
         To_Unbounded_String ("humanize-versions.ads"),
         To_Unbounded_String ("humanize-geo.ads"),
         To_Unbounded_String ("humanize-markup.ads"),
         To_Unbounded_String ("humanize-secrets.ads"),
         To_Unbounded_String ("humanize-schema.ads"),
         To_Unbounded_String ("humanize-diagnostics.ads"),
         To_Unbounded_String ("humanize-thresholds.ads"),
         To_Unbounded_String ("humanize-workflows.ads"),
         To_Unbounded_String ("humanize-changes.ads"),
         To_Unbounded_String ("humanize-tables.ads"),
         To_Unbounded_String ("humanize-forms.ads"),
         To_Unbounded_String ("humanize-navigation.ads"),
         To_Unbounded_String ("humanize-badges.ads"),
         To_Unbounded_String ("humanize-notifications.ads"),
         To_Unbounded_String ("humanize-search.ads"),
         To_Unbounded_String ("humanize-comments.ads"),
         To_Unbounded_String ("humanize-tasks.ads"),
         To_Unbounded_String ("humanize-attachments.ads"),
         To_Unbounded_String ("humanize-events.ads"),
         To_Unbounded_String ("humanize-payments.ads"),
         To_Unbounded_String ("humanize-system_status.ads"),
         To_Unbounded_String ("humanize-operations.ads"),
         To_Unbounded_String ("humanize-comparisons.ads"),
         To_Unbounded_String ("humanize-moderation.ads"),
         To_Unbounded_String ("humanize-accounts.ads"),
         To_Unbounded_String ("humanize-deployments.ads"),
         To_Unbounded_String ("humanize-data_quality.ads"),
         To_Unbounded_String ("humanize-media.ads"),
         To_Unbounded_String ("humanize-notification_preferences.ads"),
         To_Unbounded_String ("humanize-permissions.ads"),
         To_Unbounded_String ("humanize-builds.ads"),
         To_Unbounded_String ("humanize-domain_details.ads"),
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
      Position : Positive := Manifest'First;
      Count    : Natural := 0;
   begin
      if not Contains (GPR, "for Library_Interface use") then
         Error (Errors, "humanize.gpr must declare an explicit Library_Interface");
      end if;

      loop
         declare
            Unit_Pos : constant Natural :=
              Ada.Strings.Fixed.Index (Manifest, "[[unit]]", From => Position);
         begin
            exit when Unit_Pos = 0;

            declare
               Name : constant String :=
                 Quoted_Value_After (Manifest, "name = ", Unit_Pos);
               Spec : constant String :=
                 Quoted_Value_After (Manifest, "spec = ", Unit_Pos);
               Area : constant String :=
                 Quoted_Value_After (Manifest, "area = ", Unit_Pos);
            begin
               if Name = "" or else Spec = "" or else Area = "" then
                  Error (Errors, "public API manifest entry is incomplete");
               else
                  Require_File (Root, Errors, Spec);
                  if Starts_With (Read_File (Root, Spec), "private package") then
                     Error
                       (Errors,
                        "public API manifest exposes private child spec: "
                        & Spec);
                  end if;
                  if not Contains (GPR, """" & Name & """") then
                     Error
                       (Errors,
                        "Library_Interface missing public unit: " & Name);
                  end if;
                  if not Contains (API_Doc, Spec) then
                     Error
                       (Errors,
                        "API surface documentation missing public spec: "
                        & Spec);
                  end if;
                  if not Contains (API_Index, "`" & Name & "`")
                    or else not Contains (API_Index, "`" & Spec & "`")
                  then
                     Error
                       (Errors,
                        "public API index missing manifest entry: " & Name);
                  end if;
                  if not Contains (Coverage, "name = """ & Area & """") then
                     Error
                       (Errors,
                        "public API coverage scorecard missing area: " & Area);
                  end if;
                  Count := Count + 1;
               end if;

               if Unit_Pos = Manifest'Last then
                  exit;
               else
                  Position := Unit_Pos + 1;
               end if;
            end;
         end;
      end loop;

      if Count < 85 then
         Error (Errors, "public API manifest has too few units");
      end if;

      if not Contains (Classes, "primary-facade")
        or else not Contains (Classes, "specialized-child-facade")
        or else not Contains (Classes, "support-type-facade")
        or else not Contains (Classes, "internal")
      then
         Error (Errors, "public API classes must define all public/internal classes");
      end if;

      if not Contains (API_Index, "Generated-maintained from `docs/PUBLIC_API.toml`")
        or else not Contains (Coverage, "Public API coverage scorecard")
        or else not Contains (Coverage, "score = 5")
      then
         Error
           (Errors,
            "public API index and scorecard must document manifest-derived coverage");
      end if;

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

   procedure Check_Generated_Data_Manifest
     (Root   : String;
      Errors : in out Natural)
   is
      Manifest : constant String := Read_File (Root, "docs/GENERATED_DATA.toml");
      type Path_List is array (Positive range <>) of Unbounded_String;
      Generated_Candidates : constant Path_List :=
        [To_Unbounded_String ("src/humanize-catalogs-core_data.adb"),
         To_Unbounded_String ("src/humanize-catalogs-native_data.adb"),
         To_Unbounded_String ("src/humanize-catalogs-unit_data.adb"),
         To_Unbounded_String ("src/humanize-durations-schedule_data.adb"),
         To_Unbounded_String ("src/humanize-locales.adb"),
         To_Unbounded_String ("src/humanize-numbers-spellout_data.adb"),
         To_Unbounded_String ("src/humanize-phrases-locales.adb")];
      Position : Positive := Manifest'First;
      Count    : Natural := 0;
   begin
      loop
         declare
            Artifact_Pos : constant Natural :=
              Ada.Strings.Fixed.Index
                (Manifest, "[[artifact]]", From => Position);
         begin
            exit when Artifact_Pos = 0;

            declare
               Path : constant String :=
                 Quoted_Value_After (Manifest, "path = ", Artifact_Pos);
               Owner : constant String :=
                 Quoted_Value_After (Manifest, "owner = ", Artifact_Pos);
               Source : constant String :=
                 Quoted_Value_After (Manifest, "source = ", Artifact_Pos);
               Currentness : constant String :=
                 Quoted_Value_After
                   (Manifest, "currentness = ", Artifact_Pos);
               Marker : constant String :=
                 Quoted_Value_After (Manifest, "marker = ", Artifact_Pos);
               Expected_Lines : constant Natural :=
                 Natural_Value_After (Manifest, "line_count = ", Artifact_Pos);
               SHA256 : constant String :=
                 Quoted_Value_After (Manifest, "sha256 = ", Artifact_Pos);
            begin
               if Path = "" or else Owner = "" or else Source = ""
                 or else Currentness = "" or else Marker = ""
                 or else Expected_Lines = 0 or else SHA256 = ""
               then
                  Error (Errors, "generated-data manifest entry is incomplete");
               else
                  Require_File (Root, Errors, Path);
                  declare
                     Source_Text : constant String := Read_File (Root, Path);
                  begin
                     if not Contains (Source_Text, Marker) then
                        Error
                          (Errors,
                           "generated-data marker missing from " & Path);
                     end if;
                     if Line_Count (Source_Text) /= Expected_Lines then
                        Error
                          (Errors,
                           "generated-data line count changed for " & Path);
                     end if;
                     if SHA256_Hex (Source_Text) /= SHA256 then
                        Error
                          (Errors,
                           "generated-data SHA-256 snapshot changed for "
                           & Path);
                     end if;
                  end;
                  Count := Count + 1;
               end if;

               if Artifact_Pos = Manifest'Last then
                  exit;
               else
                  Position := Artifact_Pos + 1;
               end if;
            end;
         end;
      end loop;

      if Count /= 7 then
         Error (Errors, "generated-data manifest must contain exactly 7 artifacts");
      end if;

      for Candidate of Generated_Candidates loop
         declare
            Path : constant String := To_String (Candidate);
         begin
            Require_File (Root, Errors, Path);
            if not Contains (Manifest, "path = """ & Path & """") then
               Error
                 (Errors,
                  "generated-data manifest scan missing candidate " & Path);
            end if;
         end;
      end loop;
   end Check_Generated_Data_Manifest;

   procedure Print_Generated_Data_Manifest (Root : String) is
      Manifest : constant String := Read_File (Root, "docs/GENERATED_DATA.toml");
      Position : Positive := Manifest'First;
   begin
      Put_Line ("# Generated-data provenance and currentness manifest.");
      Put_Line ("# Refresh with: ./check_humanize/bin/check_humanize --print-generated-data-manifest");
      New_Line;

      loop
         declare
            Artifact_Pos : constant Natural :=
              Ada.Strings.Fixed.Index
                (Manifest, "[[artifact]]", From => Position);
         begin
            exit when Artifact_Pos = 0;

            declare
               Path : constant String :=
                 Quoted_Value_After (Manifest, "path = ", Artifact_Pos);
               Owner : constant String :=
                 Quoted_Value_After (Manifest, "owner = ", Artifact_Pos);
               Source : constant String :=
                 Quoted_Value_After (Manifest, "source = ", Artifact_Pos);
               Currentness : constant String :=
                 Quoted_Value_After
                   (Manifest, "currentness = ", Artifact_Pos);
               Coverage : constant String :=
                 Quoted_Value_After (Manifest, "coverage = ", Artifact_Pos);
               Marker : constant String :=
                 Quoted_Value_After (Manifest, "marker = ", Artifact_Pos);
            begin
               if Path /= "" then
                  declare
                     Source_Text : constant String := Read_File (Root, Path);
                  begin
                     Put_Line ("[[artifact]]");
                     Put_Line ("path = """ & Path & """");
                     Put_Line ("owner = """ & Owner & """");
                     Put_Line ("source = """ & Source & """");
                     Put_Line ("currentness = """ & Currentness & """");
                     Put_Line ("coverage = """ & Coverage & """");
                     Put_Line ("marker = """ & Marker & """");
                     Put_Line
                       ("line_count = " & Natural'Image (Line_Count (Source_Text)));
                     Put_Line ("sha256 = """ & SHA256_Hex (Source_Text) & """");
                     New_Line;
                  end;
               end if;

               if Artifact_Pos = Manifest'Last then
                  exit;
               else
                  Position := Artifact_Pos + 1;
               end if;
            end;
         end;
      end loop;
   end Print_Generated_Data_Manifest;

   procedure Check_Structural_Baseline
     (Root   : String;
      Errors : in out Natural)
   is
      Manifest : constant String :=
        Read_File (Root, "docs/STRUCTURAL_BASELINE.toml");
      Position : Positive := Manifest'First;
      Count    : Natural := 0;
   begin
      loop
         declare
            Body_Pos : constant Natural :=
              Ada.Strings.Fixed.Index (Manifest, "[[body]]", From => Position);
         begin
            exit when Body_Pos = 0;

            declare
               Path : constant String :=
                 Quoted_Value_After (Manifest, "path = ", Body_Pos);
               Prefix : constant String :=
                 Quoted_Value_After (Manifest, "split_prefix = ", Body_Pos);
               Max_Bytes : constant Natural :=
                 Natural_Value_After (Manifest, "max_bytes = ", Body_Pos);
               Min_Splits : constant Natural :=
                 Natural_Value_After (Manifest, "min_split_bodies = ", Body_Pos);
               Usecase : constant String :=
                 Quoted_Value_After (Manifest, "usecase = ", Body_Pos);
            begin
               if Path = "" or else Prefix = "" or else Max_Bytes = 0
                 or else Usecase = ""
               then
                  Error (Errors, "structural baseline entry is incomplete");
               else
                  Require_File (Root, Errors, Path);
                  if Ada.Directories.Size (Root & "/" & Path)
                    > Ada.Directories.File_Size (Max_Bytes)
                  then
                     Error (Errors, "structural baseline exceeded for " & Path);
                  end if;
                  if Count_Files_With_Prefix (Root, Prefix) < Min_Splits then
                     Error
                       (Errors,
                        "structural split inventory too small for " & Path);
                  end if;
                  Count := Count + 1;
               end if;

               if Body_Pos = Manifest'Last then
                  exit;
               else
                  Position := Body_Pos + 1;
               end if;
            end;
         end;
      end loop;

      if Count < 6 then
         Error (Errors, "structural baseline must cover major large bodies");
      end if;
   end Check_Structural_Baseline;

   procedure Check_Example_Coverage_Manifest
     (Root   : String;
      Errors : in out Natural)
   is
      Manifest   : constant String :=
        Read_File (Root, "docs/EXAMPLE_COVERAGE.toml");
      Public_API : constant String := Read_File (Root, "docs/PUBLIC_API.toml");
      Position   : Positive := Manifest'First;
      Count      : Natural := 0;
   begin
      loop
         declare
            Coverage_Pos : constant Natural :=
              Ada.Strings.Fixed.Index
                (Manifest, "[[coverage]]", From => Position);
         begin
            exit when Coverage_Pos = 0;

            declare
               Area : constant String :=
                 Quoted_Value_After (Manifest, "area = ", Coverage_Pos);
               Unit_Name : constant String :=
                 Quoted_Value_After (Manifest, "unit = ", Coverage_Pos);
               Example : constant String :=
                 Quoted_Value_After (Manifest, "example = ", Coverage_Pos);
               Usecase : constant String :=
                 Quoted_Value_After (Manifest, "usecase = ", Coverage_Pos);
            begin
               if Area = "" or else Unit_Name = "" or else Example = ""
                 or else Usecase = ""
               then
                  Error (Errors, "example coverage manifest entry is incomplete");
               else
                  Require_File (Root, Errors, Example);
                  if not Contains (Public_API, "name = """ & Unit_Name & """") then
                     Error
                       (Errors,
                        "example coverage references non-public unit: "
                        & Unit_Name);
                  end if;
                  Count := Count + 1;
               end if;

               if Coverage_Pos = Manifest'Last then
                  exit;
               else
                  Position := Coverage_Pos + 1;
               end if;
            end;
         end;
      end loop;

      if Count < 9 then
         Error (Errors, "example coverage manifest must cover major API tasks");
      end if;

      if Count < 40 then
         Error
           (Errors,
            "example coverage manifest must cover expanded public API families");
      end if;

      if not Contains (Manifest, "examples/parse_demo.adb")
        or else not Contains (Manifest, "examples/bounded_demo.adb")
        or else not Contains (Manifest, "examples/color_demo.adb")
        or else not Contains (Manifest, "examples/domain_demo.adb")
        or else not Contains (Manifest, "examples/system_status_demo.adb")
        or else not Contains (Manifest, "examples/ui_labels_demo.adb")
        or else not Contains (Manifest, "examples/security_data_demo.adb")
        or else not Contains (Manifest, "examples/workflow_ops_demo.adb")
        or else not Contains (Manifest, "examples/product_details_demo.adb")
      then
         Error (Errors, "example coverage manifest must include focused examples");
      end if;
   end Check_Example_Coverage_Manifest;

   procedure Check_Performance_Baseline
     (Root   : String;
      Errors : in out Natural)
   is
      type Path_List is array (Positive range <>) of Unbounded_String;

      Baseline : constant String :=
        Read_File (Root, "docs/PERFORMANCE_BASELINE.toml");
      Smoke : constant String := Read_File (Root, "tests/src/perf_smoke.adb");
      Paths : constant Path_List :=
        [To_Unbounded_String ("Humanize.Bytes.Format"),
         To_Unbounded_String ("Humanize.Durations.Format"),
         To_Unbounded_String ("Humanize.Numbers.Compact"),
         To_Unbounded_String ("Humanize.Parsing.Parse_Bytes"),
         To_Unbounded_String ("Humanize.Parsing.Parse_Duration"),
         To_Unbounded_String ("Humanize.Parsing.Parse_Cardinal"),
         To_Unbounded_String ("Humanize.Strings.Title_Case_Smart"),
         To_Unbounded_String ("Humanize.Strings.Truncate_Words"),
         To_Unbounded_String ("Humanize.Colors.CSS.CSS_Color_Label"),
         To_Unbounded_String ("Humanize.System_Status.HTTP_Status_Label"),
         To_Unbounded_String ("Humanize.Operations.Progress_Summary"),
         To_Unbounded_String ("Humanize.Diagnostics.Issue_Summary_Label"),
         To_Unbounded_String ("Humanize.Search.Search_Result_Summary_Label")];
   begin
      if not Contains (Baseline, "iterations = 2000")
        or else not Contains (Smoke, "Iterations : constant Positive := 2_000")
      then
         Error (Errors, "performance baseline iteration count is out of sync");
      end if;

      if not Contains (Baseline, "max_seconds = 30.0")
        or else not Contains (Smoke, "Max_Seconds : constant Duration := 30.0")
      then
         Error (Errors, "performance baseline threshold is out of sync");
      end if;

      if not Contains (Baseline, "[perf_smoke.formatting]")
        or else not Contains (Baseline, "max_seconds = 12.0")
        or else not Contains
          (Smoke, "Max_Format_Seconds : constant Duration := 12.0")
      then
         Error (Errors, "formatting performance baseline is out of sync");
      end if;

      if not Contains (Baseline, "[perf_smoke.parsing]")
        or else not Contains (Baseline, "max_seconds = 18.0")
        or else not Contains
          (Smoke, "Max_Parse_Seconds : constant Duration := 18.0")
      then
         Error (Errors, "parsing performance baseline is out of sync");
      end if;

      if not Contains (Baseline, "[perf_smoke.text]")
        or else not Contains (Baseline, "max_seconds = 10.0")
        or else not Contains
          (Smoke, "Max_Text_Seconds : constant Duration := 10.0")
        or else not Contains (Smoke, "perf smoke text")
      then
         Error (Errors, "text performance baseline is out of sync");
      end if;

      if not Contains (Baseline, "[perf_smoke.domain]")
        or else not Contains
          (Smoke, "Max_Domain_Seconds : constant Duration := 10.0")
        or else not Contains (Smoke, "perf smoke domain")
      then
         Error (Errors, "domain performance baseline is out of sync");
      end if;

      for Pattern of Paths loop
         if not Contains (Baseline, To_String (Pattern)) then
            Error
              (Errors,
               "performance baseline missing path " & To_String (Pattern));
         end if;
      end loop;
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

   procedure Check_Public_Spec_Size_Guards
     (Root   : String;
      Errors : in out Natural)
   is
      type Spec_Guard is record
         Path      : Unbounded_String;
         Max_Bytes : Natural;
      end record;
      type Spec_Guard_List is array (Positive range <>) of Spec_Guard;
      Guards : constant Spec_Guard_List :=
        [(To_Unbounded_String ("src/humanize-parsing.ads"), 130_000),
         (To_Unbounded_String ("src/humanize-strings.ads"), 120_000),
         (To_Unbounded_String ("src/humanize-durations.ads"), 95_000),
         (To_Unbounded_String ("src/humanize-phrases.ads"), 75_000)];
   begin
      for Guard of Guards loop
         declare
            Path : constant String := To_String (Guard.Path);
         begin
            Require_File (Root, Errors, Path);
            if Ada.Directories.Size (Root & "/" & Path)
              > Ada.Directories.File_Size (Guard.Max_Bytes)
            then
               Error (Errors, "public facade size guard exceeded for " & Path);
            end if;
         end;
      end loop;
   end Check_Public_Spec_Size_Guards;

   procedure Check_Domain_Package_Consistency
     (Root   : String;
      Errors : in out Natural)
   is
      type Unit_List is array (Positive range <>) of Unbounded_String;
      Specs : constant Unit_List :=
        [To_Unbounded_String ("humanize-endpoints.ads"),
         To_Unbounded_String ("humanize-resources.ads"),
         To_Unbounded_String ("humanize-versions.ads"),
         To_Unbounded_String ("humanize-geo.ads"),
         To_Unbounded_String ("humanize-markup.ads"),
         To_Unbounded_String ("humanize-secrets.ads"),
         To_Unbounded_String ("humanize-schema.ads"),
         To_Unbounded_String ("humanize-diagnostics.ads"),
         To_Unbounded_String ("humanize-thresholds.ads"),
         To_Unbounded_String ("humanize-workflows.ads"),
         To_Unbounded_String ("humanize-changes.ads"),
         To_Unbounded_String ("humanize-tables.ads"),
         To_Unbounded_String ("humanize-forms.ads"),
         To_Unbounded_String ("humanize-navigation.ads"),
         To_Unbounded_String ("humanize-badges.ads"),
         To_Unbounded_String ("humanize-notifications.ads"),
         To_Unbounded_String ("humanize-search.ads"),
         To_Unbounded_String ("humanize-comments.ads"),
         To_Unbounded_String ("humanize-tasks.ads"),
         To_Unbounded_String ("humanize-attachments.ads"),
         To_Unbounded_String ("humanize-events.ads"),
         To_Unbounded_String ("humanize-payments.ads"),
         To_Unbounded_String ("humanize-system_status.ads"),
         To_Unbounded_String ("humanize-operations.ads"),
         To_Unbounded_String ("humanize-comparisons.ads"),
         To_Unbounded_String ("humanize-cross_domain.ads"),
         To_Unbounded_String ("humanize-moderation.ads"),
         To_Unbounded_String ("humanize-accounts.ads"),
         To_Unbounded_String ("humanize-deployments.ads"),
         To_Unbounded_String ("humanize-data_quality.ads"),
         To_Unbounded_String ("humanize-media.ads"),
         To_Unbounded_String ("humanize-notification_preferences.ads"),
         To_Unbounded_String ("humanize-permissions.ads"),
         To_Unbounded_String ("humanize-builds.ads"),
         To_Unbounded_String ("humanize-domain_details.ads")];
      Example_Coverage : constant String :=
        Read_File (Root, "docs/EXAMPLE_COVERAGE.toml");
      Representative_Units : constant Unit_List :=
        [To_Unbounded_String ("Humanize.System_Status"),
         To_Unbounded_String ("Humanize.Forms"),
         To_Unbounded_String ("Humanize.Secrets"),
         To_Unbounded_String ("Humanize.Operations"),
         To_Unbounded_String ("Humanize.Accounts"),
         To_Unbounded_String ("Humanize.Domain_Details")];
   begin
      for Spec of Specs loop
         declare
            Path : constant String := "src/" & To_String (Spec);
            Text : constant String := Read_File (Root, Path);
         begin
            if not Contains (Text, "return Humanize.Status.Text_Result") then
               Error (Errors, "domain package lacks Text_Result labels: " & Path);
            end if;
            if not Contains (Text, "_Into") then
               Error (Errors, "domain package lacks bounded _Into forms: " & Path);
            end if;
         end;
      end loop;

      for Unit of Representative_Units loop
         if not Contains (Example_Coverage, "unit = """ & To_String (Unit) & """") then
            Error
              (Errors,
               "domain example coverage missing representative unit: "
               & To_String (Unit));
         end if;
      end loop;
   end Check_Domain_Package_Consistency;

   procedure Check_Quality_Guards
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Require_File (Root, Errors, "docs/QUALITY_GUARDS.md");
      Require_File (Root, Errors, "docs/API_SURFACE.md");
      Require_File (Root, Errors, "docs/TASK_GUIDE.md");
      Require_File (Root, Errors, "docs/GENERATED_DATA.toml");
      Require_File (Root, Errors, "docs/PUBLIC_API.toml");
      Require_File (Root, Errors, "docs/PUBLIC_API_CLASSES.toml");
      Require_File (Root, Errors, "docs/PUBLIC_API_INDEX.md");
      Require_File (Root, Errors, "docs/PUBLIC_API_COVERAGE.toml");
      Require_File (Root, Errors, "docs/STRUCTURAL_BASELINE.toml");
      Require_File (Root, Errors, "docs/PACKAGE_GUIDE.md");
      Require_File (Root, Errors, "docs/EXAMPLE_COVERAGE.toml");
      Require_File (Root, Errors, "docs/PERFORMANCE_BASELINE.toml");
      Require_File
        (Root, Errors, "tests/public_api_consumer/public_api_consumer.gpr");
      Require_File
        (Root, Errors, "tests/public_api_consumer/public_api_consumer.adb");
      Require_File
        (Root, Errors, "tests/public_api_consumer/public_api_formatting_consumer.adb");
      Require_File
        (Root, Errors, "tests/public_api_consumer/public_api_parsing_consumer.adb");
      Require_File
        (Root, Errors, "tests/public_api_consumer/public_api_color_consumer.adb");
      Require_File
        (Root, Errors, "tests/public_api_consumer/public_api_domain_consumer.adb");
      Require_File
        (Root, Errors, "tests/public_api_consumer/public_api_bounded_consumer.adb");

      Check_Public_API_Surface (Root, Errors);
      Check_Generated_Data_Manifest (Root, Errors);
      Check_Structural_Baseline (Root, Errors);
      Check_Example_Coverage_Manifest (Root, Errors);
      Check_Performance_Baseline (Root, Errors);
      Check_Parser_Diagnostic_Defaults (Root, Errors);
      Check_Public_Spec_Size_Guards (Root, Errors);
      Check_Domain_Package_Consistency (Root, Errors);

      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "Parser/property test expansion",
         "quality guards must document parser/property coverage");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "Performance/size baseline smoke checks",
         "quality guards must document performance/size smoke coverage");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "tests/src/perf_smoke.adb",
         "quality guards must document the executable performance smoke");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "API consistency checks",
         "quality guards must document API consistency coverage");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "Task-oriented docs/examples",
         "quality guards must document task-oriented examples");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "Generated-data provenance/currentness checks",
         "quality guards must document generated-data provenance");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "docs/GENERATED_DATA.toml",
         "quality guards must document the generated-data manifest");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "docs/PUBLIC_API.toml",
         "quality guards must document the public API manifest");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "docs/PUBLIC_API_INDEX.md",
         "quality guards must document the generated public API index");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "docs/PUBLIC_API_COVERAGE.toml",
         "quality guards must document the public API coverage scorecard");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "docs/EXAMPLE_COVERAGE.toml",
         "quality guards must document the example coverage manifest");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "docs/PERFORMANCE_BASELINE.toml",
         "quality guards must document the performance baseline manifest");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "Humanize-side locale coverage audit",
         "quality guards must document locale audit coverage");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "Public API surface guardrail",
         "quality guards must document public API surface coverage");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "Structural baselines",
         "quality guards must document structural baselines");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "Domain package consistency",
         "quality guards must document domain package consistency checks");
      Require_Text
        (Root, Errors, "docs/QUALITY_GUARDS.md",
         "line-count and SHA-256 snapshots",
         "quality guards must document generated-data snapshots");

      Require_Text
        (Root, Errors, "docs/API_SURFACE.md",
         "Public API surface snapshot",
         "API surface guardrail must define a public API snapshot");
      Require_Text
        (Root, Errors, "docs/API_SURFACE.md",
         "Public API classes",
         "API surface guardrail must document public API classes");
      Require_Text
        (Root, Errors, "docs/API_SURFACE.md",
         "Internal packages",
         "API surface guardrail must document internal packages");
      Require_Text
        (Root, Errors, "docs/API_SURFACE.md",
         "Library_Interface",
         "API surface guardrail must document compiler-enforced API boundary");
      Require_Text
        (Root, Errors, "docs/API_SURFACE.md",
         "Source-extracted public spec inventory",
         "API surface guardrail must document source-extracted spec inventory");
      Require_Text
        (Root, Errors, "docs/API_SURFACE.md",
         "docs/PUBLIC_API.toml",
         "API surface guardrail must document the machine-readable API allowlist");
      Require_Text
        (Root, Errors, "docs/API_SURFACE.md",
         "docs/PUBLIC_API_INDEX.md",
         "API surface guardrail must document the generated public API index");
      Require_Text
        (Root, Errors, "docs/API_SURFACE.md",
         "docs/PUBLIC_API_COVERAGE.toml",
         "API surface guardrail must document the public API coverage scorecard");
      Require_Text
        (Root, Errors, "docs/API_SURFACE.md",
         "src/humanize-parsing.ads",
         "API surface guardrail must include the parsing facade");
      Require_Text
        (Root, Errors, "docs/API_SURFACE.md",
         "src/humanize-values.ads",
         "API surface guardrail must include deterministic value labels");
      Require_Text
        (Root, Errors, "docs/API_SURFACE.md",
         "Text_Result/_Into pairing",
         "API surface guardrail must document owned/bounded API pairing");
      Require_Text
        (Root, Errors, "docs/API_SURFACE.md",
         "src/humanize-colors-css.ads",
         "API surface guardrail must include public child facade examples");

      Require_Text
        (Root, Errors, "docs/TASK_GUIDE.md",
         "Parsing untrusted human input",
         "task guide must cover parsing use cases");
      Require_Text
        (Root, Errors, "docs/TASK_GUIDE.md",
         "Rendering without allocation",
         "task guide must cover bounded rendering use cases");
      Require_Text
        (Root, Errors, "docs/TASK_GUIDE.md",
         "Auditing locale coverage",
         "task guide must cover locale audit use cases");
      Require_Text
        (Root, Errors, "docs/TASK_GUIDE.md",
         "--locale",
         "task guide must document locale audit filtering");
      Require_Text
        (Root, Errors, "docs/TASK_GUIDE.md",
         "perf_smoke",
         "task guide must document performance smoke usage");
      Require_Text
        (Root, Errors, "docs/TASK_GUIDE.md",
         "docs/PACKAGE_GUIDE.md",
         "task guide must point users to the package guide");
      Require_Text
        (Root, Errors, "docs/PACKAGE_GUIDE.md",
         "Humanize.Parsing",
         "package guide must document the parsing facade");
      Require_Text
        (Root, Errors, "docs/PACKAGE_GUIDE.md",
         "Humanize.Cross_Domain",
         "package guide must document cross-domain labels");

      Require_Text
        (Root, Errors, "tests/src/humanize-tests-parsing.adb",
         "Test_Parser_Malformed_Input_Matrix",
         "parser tests must include a malformed-input matrix");
      Require_Text
        (Root, Errors, "tests/src/humanize-tests-parsing.adb",
         "Test_Parser_Smoke_Baseline",
         "parser tests must include a representative smoke baseline");
      Require_Text
        (Root, Errors, "tests/src/humanize-tests-compatibility.adb",
         "Test_Render_Parse_Roundtrip_Corpus",
         "compatibility tests must include a render/parse roundtrip corpus");
      Require_Text
        (Root, Errors, "tests/src/humanize-tests-compatibility.adb",
         "Check_Scanner_Roundtrips",
         "compatibility tests must include scanner consumed-length roundtrips");
      Require_Text
        (Root, Errors, "tests/src/humanize-tests-compatibility.adb",
         "Check_Deterministic_Helper_Roundtrips",
         "compatibility tests must include deterministic helper roundtrips");
      Require_Text
        (Root, Errors, "tests/src/perf_smoke.adb",
         "Max_Format_Seconds",
         "tests project must include a bounded performance smoke executable");
      Require_Text
        (Root, Errors, "tests/src/perf_smoke.adb",
         "perf smoke parse",
         "performance smoke must report per-operation groups");
      Require_Text
        (Root, Errors, "tests/src/perf_smoke.adb",
         "perf smoke text",
         "performance smoke must report text helper timing");
      Require_Text
        (Root, Errors, "tests/src/perf_smoke.adb",
         "perf smoke domain",
         "performance smoke must report domain helper timing");
      Require_Text
        (Root, Errors, "tests/src/perf_baseline_report.adb",
         "bytes-format",
         "tests project must include optional per-operation performance report");
      Require_Text
        (Root, Errors, "tests/src/perf_baseline_report.adb",
         "system-status-http",
         "optional performance report must include expanded domain paths");
      Require_Text
        (Root, Errors, "check_humanize/src/check_humanize_release.adb",
         "public API consumer",
         "release checker must build and run a downstream public API consumer");
      Require_Text
        (Root, Errors, "check_humanize/src/check_humanize_release.adb",
         "public API formatting consumer",
         "release checker must run focused public API consumers");
      Require_Text
        (Root, Errors, "tests/tests.gpr",
         "perf_smoke.adb",
         "tests project must build the performance smoke executable");
      Require_Text
        (Root, Errors, "tests/tests.gpr",
         "perf_baseline_report.adb",
         "tests project must build the optional performance report executable");
      Require_Text
        (Root, Errors, "tests/src/humanize-tests-architecture.adb",
         "Test_Public_API_Consistency",
         "architecture tests must include public API consistency checks");
      Require_Text
        (Root, Errors, "tests/src/humanize-tests-architecture.adb",
         "Check_Area",
         "architecture tests must include per-area capability checks");
      Require_Text
        (Root, Errors, "tests/src/locale_audit.adb",
         "for Locale_Access of Humanize.Locales.Shipped_Locales loop",
         "locale audit must iterate Humanize-owned shipped locale metadata");
      Require_Text
        (Root, Errors, "tests/src/locale_audit.adb",
         "Audit_Deterministic_Schedule_Spellout",
         "locale audit must include deterministic schedule/spellout checks");
      Require_Text
        (Root, Errors, "tests/src/locale_audit.adb",
         "Summary_Only",
         "locale audit must support summary mode");
      Require_Text
        (Root, Errors, "tests/src/locale_audit.adb",
         "Locale_Filter",
         "locale audit must support locale filtering");
      Require_Text
        (Root, Errors, "tests/src/locale_audit.adb",
         "Generated_Core_Expectations",
         "locale audit must keep repeated core expectations data-driven");
      Require_Text
        (Root, Errors, "tests/src/locale_audit.adb",
         "U (""fi"")",
         "locale audit generated-core table must include Finnish");
      Require_Text
        (Root, Errors, "tests/src/locale_audit.adb",
         "U (""tr"")",
         "locale audit generated-core table must include Turkish");

      Require_Text
        (Root, Errors, "docs/GENERATED_DATA.toml",
         "path = ""src/humanize-catalogs-core_data.adb""",
         "generated-data manifest must include core catalog data");
      Require_Text
        (Root, Errors, "docs/GENERATED_DATA.toml",
         "path = ""src/humanize-catalogs-unit_data.adb""",
         "generated-data manifest must include unit catalog data");
      Require_Text
        (Root, Errors, "docs/GENERATED_DATA.toml",
         "path = ""src/humanize-catalogs-native_data.adb""",
         "generated-data manifest must include native catalog data");
      Require_Text
        (Root, Errors, "docs/GENERATED_DATA.toml",
         "path = ""src/humanize-numbers-spellout_data.adb""",
         "generated-data manifest must include spellout data");
      Require_Text
        (Root, Errors, "docs/GENERATED_DATA.toml",
         "path = ""src/humanize-durations-schedule_data.adb""",
         "generated-data manifest must include schedule data");
      Require_Text
        (Root, Errors, "docs/GENERATED_DATA.toml",
         "path = ""src/humanize-locales.adb""",
         "generated-data manifest must include locale inventory");
      Require_Text
        (Root, Errors, "docs/GENERATED_DATA.toml",
         "path = ""src/humanize-phrases-locales.adb""",
         "generated-data manifest must include phrase locale inventory");

      Require_Text
        (Root, Errors, "src/humanize-catalogs-core_data.adb",
         "Provenance: Humanize-owned catalog data",
         "core catalog data must carry provenance/currentness text");
      Require_Text
        (Root, Errors, "src/humanize-catalogs-unit_data.adb",
         "Provenance: generated from Humanize unit catalog templates",
         "unit catalog data must carry provenance/currentness text");
      Require_Text
        (Root, Errors, "src/humanize-catalogs-native_data.adb",
         "Provenance: generated from reviewed native catalog fragments",
         "native catalog data must carry provenance/currentness text");
      Require_Text
        (Root, Errors, "src/humanize-numbers-spellout_data.adb",
         "Provenance: generated from Humanize spellout tables",
         "spellout data must carry provenance/currentness text");
      Require_Text
        (Root, Errors, "src/humanize-durations-schedule_data.adb",
         "Provenance: Humanize-owned deterministic schedule metadata",
         "schedule data must carry provenance/currentness text");
      Require_Text
        (Root, Errors, "src/humanize-locales.adb",
         "Provenance: Humanize-owned shipped locale inventory",
         "locale inventory must carry provenance/currentness text");
      Require_Text
        (Root, Errors, "src/humanize-phrases-locales.adb",
         "Provenance: delegates to Humanize.Phrases.Support locale metadata",
         "phrase locale inventory must carry provenance/currentness text");
      Require_Text
        (Root, Errors, "docs/RELEASE_VERIFICATION.md",
         "docs/QUALITY_GUARDS.md",
         "release verification must link to quality guard documentation");
      Require_Text
        (Root, Errors, "docs/RELEASE_VERIFICATION.md",
         "perf_smoke",
         "release verification must include performance smoke");
   end Check_Quality_Guards;

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
