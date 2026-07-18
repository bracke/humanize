with Ada.Directories;

with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;

package body Check_Humanize_Policy_Requirements is
   Manifest_Path : constant String := "docs/POLICY_REQUIREMENTS.toml";

   function Manifest (Root : String) return String is
     (Read_File (Root, Manifest_Path));

   procedure Require_Manifest (Root : String; Errors : in out Natural) is
   begin
      if not Ada.Directories.Exists (Root & "/" & Manifest_Path) then
         Error (Errors, "missing required file: " & Manifest_Path);
      end if;
   end Require_Manifest;

   procedure Check_Required_Files
     (Root   : String;
      Errors : in out Natural)
   is
      Data     : constant String := Manifest (Root);
      Count    : Natural := 0;

      procedure Check_Entry (Entry_Pos : Positive) is
         Path : constant String :=
           Manifest_String_Value_After (Data, "path = ", Entry_Pos);
      begin
         if Path = "" then
            Error (Errors, "required-file manifest entry is incomplete");
         else
            Require_File (Root, Errors, Path);
            Count := Count + 1;
         end if;
      end Check_Entry;

      procedure Check_Entries is new Iterate_Manifest_Section (Check_Entry);
   begin
      Require_Manifest (Root, Errors);
      Check_Entries (Data, "required_file");

      Require_Minimum
        (Root, Errors, "required_file_min_entries", Count,
         "required-file manifest has too few entries");
   end Check_Required_Files;

   procedure Check_Required_Text
     (Root   : String;
      Errors : in out Natural)
   is
      Data     : constant String := Manifest (Root);
      Count    : Natural := 0;

      procedure Check_Entry (Entry_Pos : Positive) is
         Path : constant String :=
           Manifest_String_Value_After (Data, "path = ", Entry_Pos);
         Pattern : constant String :=
           Manifest_String_Value_After (Data, "pattern = ", Entry_Pos);
         Message : constant String :=
           Manifest_String_Value_After (Data, "message = ", Entry_Pos);
      begin
         if Path = "" or else Pattern = "" or else Message = "" then
            Error (Errors, "required-text manifest entry is incomplete");
         else
            Require_Text (Root, Errors, Path, Pattern, Message);
            Count := Count + 1;
         end if;
      end Check_Entry;

      procedure Check_Entries is new Iterate_Manifest_Section (Check_Entry);
   begin
      Require_Manifest (Root, Errors);
      Check_Entries (Data, "required_text");

      Require_Minimum
        (Root, Errors, "required_text_min_entries", Count,
         "required-text manifest has too few entries");
   end Check_Required_Text;
end Check_Humanize_Policy_Requirements;
