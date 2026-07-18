with Ada.Directories;
with Ada.Strings.Fixed;
with Ada.Text_IO;

with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;
with Project_Tools.Tree_Checks;

package body Check_Humanize_Policy_Generated is
   use Ada.Text_IO;

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

   procedure Check_Generated_Data_Manifest
     (Root   : String;
      Errors : in out Natural)
   is
      Manifest : constant String := Read_File (Root, "docs/GENERATED_DATA.toml");
      Count    : Natural := 0;

      procedure Check_Entry (Entry_Pos : Positive) is
         Path : constant String :=
           Manifest_String_Value_After (Manifest, "path = ", Entry_Pos);
         Owner : constant String :=
           Manifest_String_Value_After (Manifest, "owner = ", Entry_Pos);
         Source : constant String :=
           Manifest_String_Value_After (Manifest, "source = ", Entry_Pos);
         Currentness : constant String :=
           Manifest_String_Value_After
             (Manifest, "currentness = ", Entry_Pos);
         Marker : constant String :=
           Manifest_String_Value_After (Manifest, "marker = ", Entry_Pos);
         Expected_Lines : constant Natural :=
           Natural_Value_After (Manifest, "line_count = ", Entry_Pos);
         SHA256 : constant String :=
           Manifest_String_Value_After (Manifest, "sha256 = ", Entry_Pos);
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
                  Error (Errors, "generated-data marker missing from " & Path);
               end if;
               if Line_Count (Source_Text) /= Expected_Lines then
                  Error (Errors, "generated-data line count changed for " & Path);
               end if;
               if SHA256_Hex (Source_Text) /= SHA256 then
                  Error
                    (Errors,
                     "generated-data SHA-256 snapshot changed for " & Path);
               end if;
            end;
            Count := Count + 1;
         end if;
      end Check_Entry;

      procedure Check_Entries is new Iterate_Manifest_Section (Check_Entry);
   begin
      Check_Entries (Manifest, "artifact");

      Require_Exact
        (Root, Errors, "generated_data_exact_artifacts", Count,
         "generated-data manifest artifact count is wrong");
   end Check_Generated_Data_Manifest;

   procedure Check_Generated_Docs_Manifest
     (Root   : String;
      Errors : in out Natural)
   is
      Manifest : constant String := Read_File (Root, "docs/GENERATED_DOCS.toml");
      Checker  : constant String :=
        Read_File (Root, "check_humanize/src/check_humanize.adb");
      Count    : Natural := 0;

      procedure Check_Entry (Entry_Pos : Positive) is
         Path : constant String :=
           Manifest_String_Value_After (Manifest, "path = ", Entry_Pos);
         Command : constant String :=
           Manifest_String_Value_After (Manifest, "command = ", Entry_Pos);
         Owner : constant String :=
           Manifest_String_Value_After (Manifest, "owner = ", Entry_Pos);
         Source : constant String :=
           Manifest_String_Value_After (Manifest, "source = ", Entry_Pos);
      begin
         if Path = "" or else Command = "" or else Owner = ""
           or else Source = ""
         then
            Error (Errors, "generated-docs manifest entry is incomplete");
         else
            Require_File (Root, Errors, Path);
            if not Contains (Command, "./check_humanize/bin/check_humanize") then
               Error
                 (Errors,
                  "generated-docs command must use check_humanize: " & Path);
            end if;
            if Contains (Command, "--")
              and then not Contains
                (Checker,
                 Command
                   (Ada.Strings.Fixed.Index (Command, "--") .. Command'Last))
            then
               Error
                 (Errors,
                  "generated-docs command is not exposed by checker: "
                  & Command);
            end if;
            Count := Count + 1;
         end if;
      end Check_Entry;

      procedure Check_Entries is new Iterate_Manifest_Section (Check_Entry);
   begin
      Check_Entries (Manifest, "doc");

      Require_Minimum
        (Root, Errors, "generated_docs_min_docs", Count,
         "generated-docs manifest must cover generated docs");
   end Check_Generated_Docs_Manifest;

   procedure Print_Generated_Data_Manifest (Root : String) is
      Manifest : constant String := Read_File (Root, "docs/GENERATED_DATA.toml");

      procedure Print_Entry (Entry_Pos : Positive) is
         Path : constant String :=
           Manifest_String_Value_After (Manifest, "path = ", Entry_Pos);
         Owner : constant String :=
           Manifest_String_Value_After (Manifest, "owner = ", Entry_Pos);
         Source : constant String :=
           Manifest_String_Value_After (Manifest, "source = ", Entry_Pos);
         Currentness : constant String :=
           Manifest_String_Value_After
             (Manifest, "currentness = ", Entry_Pos);
         Coverage : constant String :=
           Manifest_String_Value_After (Manifest, "coverage = ", Entry_Pos);
         Marker : constant String :=
           Manifest_String_Value_After (Manifest, "marker = ", Entry_Pos);
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
      end Print_Entry;

      procedure Print_Entries is new Iterate_Manifest_Section (Print_Entry);
   begin
      Put_Line ("# Generated-data provenance and currentness manifest.");
      Put_Line ("# Refresh with: ./check_humanize/bin/check_humanize --print-generated-data-manifest");
      New_Line;
      Print_Entries (Manifest, "artifact");
   end Print_Generated_Data_Manifest;
end Check_Humanize_Policy_Generated;
