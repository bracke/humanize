with Ada.Directories;

with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;
with Project_Tools.Generated_Artifacts;
with Project_Tools.Generated_Docs;
with Project_Tools.Tree_Checks;

package body Check_Humanize_Policy_Generated is
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
      when Constraint_Error
         | Ada.Directories.Name_Error
         | Ada.Directories.Use_Error =>
         if Open then
            Ada.Directories.End_Search (Search);
         end if;
         Error (Errors, "could not scan source root for generated artifacts");
   end Check_Source_Tree_Artifacts;

   procedure Check_Generated_Data_Manifest
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Project_Tools.Generated_Artifacts.Check_Data_Manifest
        (Errors         => Errors,
         Root           => Root,
         Manifest_Path  => "docs/GENERATED_DATA.toml",
         Expected_Count =>
           Policy_Threshold (Root, "generated_data_exact_artifacts"),
         Hash           => SHA256_Hex'Access,
         Allowed_Kinds  =>
           [new String'("humanize-owned-catalog"),
            new String'("generated-catalog"),
            new String'("reviewed-native-catalog"),
            new String'("reviewed-native-catalog-shard"),
            new String'("generated-spellout"),
            new String'("generated-spellout-shard"),
            new String'("humanize-owned-metadata"),
            new String'("humanize-owned-inventory"),
            new String'("delegated-inventory")],
         Max_Shard_Lines => 1000);
   end Check_Generated_Data_Manifest;

   procedure Check_Generated_Docs_Manifest
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Project_Tools.Generated_Docs.Check_Docs_Manifest
        (Errors                  => Errors,
         Root                    => Root,
         Manifest_Path           => "docs/GENERATED_DOCS.toml",
         Checker_Source_Path     => "check_humanize/src/check_humanize.adb",
         Required_Command_Prefix => "./check_humanize/bin/check_humanize",
         Minimum_Entries         =>
           Policy_Threshold (Root, "generated_docs_min_docs"));
   end Check_Generated_Docs_Manifest;

   procedure Print_Generated_Data_Manifest (Root : String) is
   begin
      Project_Tools.Generated_Artifacts.Print_Data_Manifest
        (Root          => Root,
         Manifest_Path => "docs/GENERATED_DATA.toml",
         Header        =>
           "# Machine-readable generated/native data provenance for Humanize."
           & ASCII.LF
           & "# `check_humanize --policy-only` validates these entries by text marker and"
           & ASCII.LF
           & "# matching source-file provenance comments.",
         Hash          => SHA256_Hex'Access);
   end Print_Generated_Data_Manifest;
end Check_Humanize_Policy_Generated;
