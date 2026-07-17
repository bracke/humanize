with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Status;

package body Humanize.Strings.Paths is
   function Is_Alnum (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Alphanumeric;

   function Lower (C : Character) return Character
      renames Humanize.Bounded_Text.Lower_Char;

   function Upper (C : Character) return Character
      renames Humanize.Bounded_Text.Upper_Char;

   function Digit_Value (C : Character) return Natural
      renames Humanize.Bounded_Text.Digit_Value;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text (Result : Humanize.Status.Text_Result) return String
      renames Humanize.Bounded_Text.Result_Text;

   procedure Copy_Into
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Last_Index
     (Text : String;
      Ch   : Character)
      return Natural
   is
   begin
      for Index in reverse Text'Range loop
         if Text (Index) = Ch then
            return Index;
         end if;
      end loop;
      return 0;
   end Last_Index;

   function Is_Path_Separator (Ch : Character) return Boolean is
     (Ch = '/' or else Ch = '\');

   function Apply_Case
     (Ch   : Character;
      Mode : Filename_Case_Mode)
      return Character
   is
   begin
      case Mode is
         when Preserve_Filename_Case =>
            return Ch;
         when Lowercase_Filename =>
            return Lower (Ch);
         when Uppercase_Filename =>
            return Upper (Ch);
      end case;
   end Apply_Case;

   function Is_Reserved_Filename_Stem (Stem : String) return Boolean
   is
      Upper_Stem : Unbounded_String;
   begin
      for Ch of Stem loop
         Append (Upper_Stem, Upper (Ch));
      end loop;

      declare
         Name : constant String := To_String (Upper_Stem);
      begin
         if Name = "CON" or else Name = "PRN" or else Name = "AUX"
           or else Name = "NUL"
         then
            return True;
         elsif Name'Length = 4
           and then (Name (Name'First .. Name'First + 2) = "COM"
                     or else Name (Name'First .. Name'First + 2) = "LPT")
           and then Name (Name'Last) in '1' .. '9'
         then
            return True;
         else
            return False;
         end if;
      end;
   end Is_Reserved_Filename_Stem;

   function Extension_Start
     (Name                : String;
      Hidden_File_Extends : Boolean := False)
      return Natural
   is
      Dot : constant Natural := Last_Index (Name, '.');
   begin
      if Dot = 0 or else Dot = Name'Last then
         return 0;
      elsif Dot = Name'First and then not Hidden_File_Extends then
         return 0;
      else
         return Dot;
      end if;
   end Extension_Start;

   procedure Append_Safe_Chars
     (Source    : String;
      Result    : in out Unbounded_String;
      Options   : Safe_Filename_Options;
      Allow_Dot : Boolean)
   is
      Pending : Boolean := False;

      procedure Append_Separator is
      begin
         if Length (Result) > 0
           and then Element (Result, Length (Result)) /= Options.Separator
           and then Element (Result, Length (Result)) /= '.'
         then
            Append (Result, Options.Separator);
         end if;
      end Append_Separator;
   begin
      for Ch of Source loop
         if Is_Alnum (Ch) then
            if Pending then
               Append_Separator;
               Pending := False;
            end if;
            Append (Result, Apply_Case (Ch, Options.Case_Mode));
         elsif Ch = '.' and then Allow_Dot then
            if Length (Result) > 0
              and then Element (Result, Length (Result)) /= Options.Separator
              and then Element (Result, Length (Result)) /= '.'
            then
               Append (Result, '.');
            end if;
            Pending := False;
         elsif Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF
           or else Ch = ASCII.CR or else Ch = '_' or else Ch = '-'
           or else Is_Path_Separator (Ch)
         then
            Pending := Length (Result) > 0;
         else
            Pending := Length (Result) > 0;
         end if;
      end loop;
   end Append_Safe_Chars;

   procedure Trim_Safe_Tail
     (Text      : in out Unbounded_String;
      Separator : Character)
   is
   begin
      while Length (Text) > 0
        and then (Element (Text, Length (Text)) = Separator
                  or else Element (Text, Length (Text)) = '.')
      loop
         Delete (Text, Length (Text), Length (Text));
      end loop;
   end Trim_Safe_Tail;

   function Safe_Filename
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result
   is
      Options : Safe_Filename_Options := Default_Safe_Filename_Options;
   begin
      Options.Separator := Separator;
      return Safe_Filename (Text, Options);
   end Safe_Filename;

   function Safe_Filename
     (Text    : String;
      Options : Safe_Filename_Options)
      return Humanize.Status.Text_Result
   is
      Source : constant String :=
        (if Options.Hidden_Mode = Drop_Hidden_Dot
           and then Text'Length > 1
           and then Text (Text'First) = '.'
         then Text (Text'First + 1 .. Text'Last)
         else Text);
      Dot    : constant Natural :=
        (if Options.Preserve_Extension and then Source'Length > 0
         then Extension_Start
           (Source, Options.Hidden_Mode = Preserve_Hidden_File)
         else 0);
      Stem_Source : constant String :=
        (if Dot = 0 then Source else Source (Source'First .. Dot - 1));
      Ext_Source : constant String :=
        (if Dot = 0 then "" else Source (Dot + 1 .. Source'Last));
      Stem   : Unbounded_String;
      Ext    : Unbounded_String;
      Result : Unbounded_String;
   begin
      if Options.Hidden_Mode = Preserve_Hidden_File
        and then Text'Length > 1
        and then Text (Text'First) = '.'
      then
         Append (Stem, '.');
      end if;

      Append_Safe_Chars
        (Stem_Source, Stem, Options, not Options.Preserve_Extension);
      Trim_Safe_Tail (Stem, Options.Separator);

      if Length (Stem) = 0
        or else (Length (Stem) = 1 and then Element (Stem, 1) = '.')
      then
         Append (Stem, Options.Empty_Fallback);
      end if;

      if Options.Max_Stem_Length > 0
        and then Length (Stem) > Natural (Options.Max_Stem_Length)
      then
         Delete
           (Stem, Natural (Options.Max_Stem_Length) + 1, Length (Stem));
         Trim_Safe_Tail (Stem, Options.Separator);
      end if;

      if Is_Reserved_Filename_Stem (To_String (Stem)) then
         Append (Stem, Options.Reserved_Name_Fallback);
      end if;

      if Dot /= 0 then
         Append_Safe_Chars (Ext_Source, Ext, Options, False);
         Trim_Safe_Tail (Ext, Options.Separator);
      end if;

      Append (Result, To_String (Stem));
      if Length (Ext) > 0 then
         Append (Result, '.');
         Append (Result, To_String (Ext));
      end if;
      return Ok_Text (To_String (Result));
   end Safe_Filename;

   function Last_Path_Separator
     (Path      : String;
      Separator : Character := ASCII.NUL)
      return Natural
   is
   begin
      for Index in reverse Path'Range loop
         if (Separator /= ASCII.NUL and then Path (Index) = Separator)
           or else (Separator = ASCII.NUL and then Is_Path_Separator (Path (Index)))
         then
            return Index;
         end if;
      end loop;
      return 0;
   end Last_Path_Separator;

   function Path_Basename
     (Path : String)
      return Humanize.Status.Text_Result
   is
      Last : Natural := Path'Last;
      Sep  : Natural;
   begin
      if Path'Length = 0 then
         return Ok_Text ("");
      end if;

      while Last >= Path'First and then Is_Path_Separator (Path (Last)) loop
         exit when Last = Path'First;
         Last := Last - 1;
      end loop;

      if Last = Path'First and then Is_Path_Separator (Path (Last)) then
         return Ok_Text ("");
      end if;

      Sep := Last_Path_Separator (Path (Path'First .. Last));
      if Sep = 0 then
         return Ok_Text (Path (Path'First .. Last));
      else
         return Ok_Text (Path (Sep + 1 .. Last));
      end if;
   end Path_Basename;

   function Path_Title
     (Path : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Path_Title (Path, Default_Path_Title_Options);
   end Path_Title;

   function Path_Title
     (Path    : String;
      Options : Path_Title_Options)
      return Humanize.Status.Text_Result
   is
      Base_Result : constant Humanize.Status.Text_Result := Path_Basename (Path);
      Raw_Base    : constant String := Result_Text (Base_Result);
      Base        : constant String :=
        (if Options.Hidden_Mode = Drop_Hidden_Dot
           and then Raw_Base'Length > 1
           and then Raw_Base (Raw_Base'First) = '.'
         then Raw_Base (Raw_Base'First + 1 .. Raw_Base'Last)
         else Raw_Base);
      Dot         : constant Natural :=
        (if Base'Length = 0 or else Options.Include_Extension
         then 0
         else Extension_Start
           (Base, Options.Hidden_Mode = Preserve_Hidden_File));
      Stem        : constant String :=
        (if Dot = 0 then Base else Base (Base'First .. Dot - 1));
      Words       : Unbounded_String;
      Pending     : Boolean := False;
      Limit       : constant Natural := Natural (Options.Max_Stem_Length);
   begin
      for Ch of Stem loop
         exit when Limit > 0 and then Length (Words) >= Limit;
         if Is_Alnum (Ch) then
            if Pending and then Length (Words) > 0 then
               Append (Words, " ");
            end if;
            Append (Words, Ch);
            Pending := False;
         else
            Pending := Length (Words) > 0;
         end if;
      end loop;

      if Length (Words) = 0 then
         return Ok_Text ([1 => Options.Empty_Text]);
      else
         return Title_Case_With_Options (To_String (Words), Options.Title);
      end if;
   end Path_Title;

   function Extension_Label
     (Path : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Extension_Label (Path, Default_Extension_Label_Options);
   end Extension_Label;

   function Extension_Label
     (Path    : String;
      Options : Extension_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base_Result : constant Humanize.Status.Text_Result := Path_Basename (Path);
      Base        : constant String := Result_Text (Base_Result);
      Dot         : constant Natural :=
        (if Base'Length = 0 then 0
         else Extension_Start (Base, Options.Hidden_File_Extends));
      Result      : Unbounded_String;
   begin
      if Dot = 0 then
         case Options.Missing_Label is
            when Generic_File_Label =>
               return Ok_Text ("file");
            when No_Extension_Label =>
               return Ok_Text ("no extension");
            when Empty_Extension_Label =>
               return Ok_Text ("");
         end case;
      end if;

      for Index in Dot + 1 .. Base'Last loop
         Append (Result, Apply_Case (Base (Index), Options.Case_Mode));
      end loop;
      return Ok_Text (To_String (Result));
   end Extension_Label;

   function Shorten_Basename_Preserving_Extension
     (Base     : String;
      Max      : Natural;
      Ellipsis : Character)
      return String
   is
      Dot : constant Natural := Extension_Start (Base);
   begin
      if Dot = 0 or else Max <= 1 then
         return [1 => Ellipsis] & Base (Base'Last - (Max - 2) .. Base'Last);
      end if;

      declare
         Ext_Length  : constant Natural := Base'Last - Dot + 1;
         Stem_Length : constant Natural := Dot - Base'First;
      begin
         if Max <= Ext_Length + 1 then
            return [1 => Ellipsis] & Base (Base'Last - (Max - 2) .. Base'Last);
         end if;

         declare
            Keep : constant Natural := Natural'Min
              (Stem_Length, Max - Ext_Length - 1);
         begin
            return
              [1 => Ellipsis]
              & Base (Dot - Keep .. Dot - 1)
              & Base (Dot .. Base'Last);
         end;
      end;
   end Shorten_Basename_Preserving_Extension;

   function Shorten_Path
     (Path    : String;
      Options : Path_Shorten_Options := Default_Path_Shorten_Options)
      return Humanize.Status.Text_Result
   is
      Max      : constant Natural := Natural (Options.Max_Chars);
      Base     : constant String := Result_Text (Path_Basename (Path));
      Sep      : constant Natural := Last_Path_Separator (Path, Options.Separator);
      Prefix_Last : Natural := (if Sep = 0 then Path'First - 1 else Sep - 1);
   begin
      if Path'Length <= Max then
         return Ok_Text (Path);
      elsif Max = 0 then
         return Ok_Text ("");
      elsif Max = 1 then
         return Ok_Text ([1 => Options.Ellipsis]);
      elsif Base'Length + 1 >= Max then
         if Options.Preserve_Extension then
            return Ok_Text (Shorten_Basename_Preserving_Extension
                 (Base, Max, Options.Ellipsis));
         else
            return Ok_Text ([1 => Options.Ellipsis]
               & Base (Base'Last - (Max - 2) .. Base'Last));
         end if;
      end if;

      declare
         Prefix_Keep : constant Natural := Max - Base'Length - 2;
      begin
         if Prefix_Last < Path'First then
            Prefix_Last := Path'First + Prefix_Keep - 1;
         else
            Prefix_Last := Natural'Min
              (Prefix_Last, Path'First + Prefix_Keep - 1);
         end if;

         return Ok_Text (Path (Path'First .. Prefix_Last)
           & Options.Ellipsis & Options.Separator & Base);
      end;
   end Shorten_Path;

   function Kind_Char (Kind : File_Mode_Kind) return Character is
   begin
      case Kind is
         when Mode_Only =>
            return ASCII.NUL;
         when Regular_File =>
            return '-';
         when Directory_File =>
            return 'd';
         when Symlink_File =>
            return 'l';
         when Character_Device =>
            return 'c';
         when Block_Device =>
            return 'b';
         when FIFO_File =>
            return 'p';
         when Socket_File =>
            return 's';
      end case;
   end Kind_Char;

   function Kind_Label (Kind : File_Mode_Kind) return String is
   begin
      case Kind is
         when Mode_Only =>
            return "";
         when Regular_File =>
            return "file";
         when Directory_File =>
            return "directory";
         when Symlink_File =>
            return "symlink";
         when Character_Device =>
            return "character device";
         when Block_Device =>
            return "block device";
         when FIFO_File =>
            return "FIFO";
         when Socket_File =>
            return "socket";
      end case;
   end Kind_Label;

   function Symbolic_File_Mode
     (Mode : File_Mode_Value;
      Kind : File_Mode_Kind := Mode_Only)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;

      function Has_Bit (Bit : Natural) return Boolean is
        ((Natural (Mode) / Bit) mod 2 = 1);

      procedure Append_Triplet
        (Read_Bit    : Natural;
         Write_Bit   : Natural;
         Execute_Bit : Natural;
         Special_Bit : Natural;
         Special_Exec : Character;
         Special_No_Exec : Character)
      is
         Has_Execute : constant Boolean := Has_Bit (Execute_Bit);
      begin
         Append (Result, (if Has_Bit (Read_Bit) then 'r' else '-'));
         Append (Result, (if Has_Bit (Write_Bit) then 'w' else '-'));
         if Has_Bit (Special_Bit) then
            Append (Result, (if Has_Execute then Special_Exec else Special_No_Exec));
         else
            Append (Result, (if Has_Execute then 'x' else '-'));
         end if;
      end Append_Triplet;
   begin
      if Kind /= Mode_Only then
         Append (Result, Kind_Char (Kind));
      end if;

      Append_Triplet (8#0400#, 8#0200#, 8#0100#, 8#4000#, 's', 'S');
      Append_Triplet (8#0040#, 8#0020#, 8#0010#, 8#2000#, 's', 'S');
      Append_Triplet (8#0004#, 8#0002#, 8#0001#, 8#1000#, 't', 'T');
      return Ok_Text (To_String (Result));
   end Symbolic_File_Mode;

   function Octal_Digit (Value : Natural) return Character is
     (Character'Val (Character'Pos ('0') + Value));

   function Octal_File_Mode
     (Mode            : File_Mode_Value;
      Include_Special : Boolean := False;
      Prefix          : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Special : constant Natural := Mode / 8#1000#;
      Owner   : constant Natural := (Mode / 8#0100#) mod 8;
      Group   : constant Natural := (Mode / 8#0010#) mod 8;
      Other   : constant Natural := Mode mod 8;
      Result  : Unbounded_String;
   begin
      if Prefix and then (Special /= 0 or else not Include_Special) then
         Append (Result, "0");
      end if;
      if Include_Special or else Special /= 0 then
         Append (Result, Octal_Digit (Special));
      end if;
      Append (Result, Octal_Digit (Owner));
      Append (Result, Octal_Digit (Group));
      Append (Result, Octal_Digit (Other));
      return Ok_Text (To_String (Result));
   end Octal_File_Mode;

   procedure Append_Permission_List
     (Result      : in out Unbounded_String;
      Mode        : File_Mode_Value;
      Read_Bit    : Natural;
      Write_Bit   : Natural;
      Execute_Bit : Natural)
   is
      Have : Boolean := False;

      function Has_Bit (Bit : Natural) return Boolean is
        ((Natural (Mode) / Bit) mod 2 = 1);

      procedure Add (Text : String) is
      begin
         if Have then
            Append (Result, "/");
         end if;
         Append (Result, Text);
         Have := True;
      end Add;
   begin
      if Has_Bit (Read_Bit) then
         Add ("read");
      end if;
      if Has_Bit (Write_Bit) then
         Add ("write");
      end if;
      if Has_Bit (Execute_Bit) then
         Add ("execute");
      end if;
      if not Have then
         Append (Result, "no access");
      end if;
   end Append_Permission_List;

   function File_Mode_Summary
     (Mode : File_Mode_Value;
      Kind : File_Mode_Kind := Mode_Only)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;

      function Has_Bit (Bit : Natural) return Boolean is
        ((Natural (Mode) / Bit) mod 2 = 1);
   begin
      if Kind /= Mode_Only then
         Append (Result, Kind_Label (Kind));
         Append (Result, ", ");
      end if;

      Append (Result, "owner ");
      Append_Permission_List (Result, Mode, 8#0400#, 8#0200#, 8#0100#);
      Append (Result, "; group ");
      Append_Permission_List (Result, Mode, 8#0040#, 8#0020#, 8#0010#);
      Append (Result, "; others ");
      Append_Permission_List (Result, Mode, 8#0004#, 8#0002#, 8#0001#);

      if Has_Bit (8#4000#) then
         Append (Result, "; setuid");
      end if;
      if Has_Bit (8#2000#) then
         Append (Result, "; setgid");
      end if;
      if Has_Bit (8#1000#) then
         Append (Result, "; sticky");
      end if;

      return Ok_Text (To_String (Result));
   end File_Mode_Summary;

   function Kind_From_Char
     (Ch   : Character;
      Kind : out File_Mode_Kind)
      return Boolean
   is
   begin
      case Ch is
         when '-' =>
            Kind := Regular_File;
         when 'd' =>
            Kind := Directory_File;
         when 'l' =>
            Kind := Symlink_File;
         when 'c' =>
            Kind := Character_Device;
         when 'b' =>
            Kind := Block_Device;
         when 'p' =>
            Kind := FIFO_File;
         when 's' =>
            Kind := Socket_File;
         when others =>
            return False;
      end case;
      return True;
   end Kind_From_Char;

   function Parse_Octal_File_Mode
     (Text : String;
      Mode : out File_Mode_Value)
      return Boolean
   is
      Value : Natural := 0;
      First : Natural := Text'First;
   begin
      if Text'Length = 0 then
         return False;
      end if;
      if (Text'Length in 4 | 5) and then Text (Text'First) = '0' then
         First := Text'First + 1;
      end if;
      if Text'Last - First + 1 not in 3 | 4 then
         return False;
      end if;
      for Index in First .. Text'Last loop
         if Text (Index) not in '0' .. '7' then
            return False;
         end if;
         Value := Value * 8 + Digit_Value (Text (Index));
      end loop;
      if Value > File_Mode_Value'Last then
         return False;
      end if;
      Mode := File_Mode_Value (Value);
      return True;
   end Parse_Octal_File_Mode;

   function Parse_Symbolic_File_Mode
     (Text : String;
      Mode : out File_Mode_Value;
      Kind : out File_Mode_Kind)
      return Boolean
   is
      Offset : Natural := 0;
      Value  : Natural := 0;

      function Has (Index : Natural; Ch : Character) return Boolean is
        (Text (Index) = Ch);

      function Parse_Execute
        (Index       : Natural;
         Execute_Bit : Natural;
         Special_Bit : Natural;
         Lower       : Character;
         Upper       : Character)
         return Boolean
      is
      begin
         case Text (Index) is
            when 'x' =>
               Value := Value + Execute_Bit;
            when '-' =>
               null;
            when others =>
               if Text (Index) = Lower then
                  Value := Value + Execute_Bit + Special_Bit;
               elsif Text (Index) = Upper then
                  Value := Value + Special_Bit;
               else
                  return False;
               end if;
         end case;
         return True;
      end Parse_Execute;
   begin
      Kind := Mode_Only;
      if Text'Length = 10 then
         if not Kind_From_Char (Text (Text'First), Kind) then
            return False;
         end if;
         Offset := 1;
      elsif Text'Length /= 9 then
         return False;
      end if;

      if Has (Text'First + Offset, 'r') then
         Value := Value + 8#0400#;
      elsif not Has (Text'First + Offset, '-') then
         return False;
      end if;
      if Has (Text'First + Offset + 1, 'w') then
         Value := Value + 8#0200#;
      elsif not Has (Text'First + Offset + 1, '-') then
         return False;
      end if;
      if not Parse_Execute
        (Text'First + Offset + 2, 8#0100#, 8#4000#, 's', 'S')
      then
         return False;
      end if;

      if Has (Text'First + Offset + 3, 'r') then
         Value := Value + 8#0040#;
      elsif not Has (Text'First + Offset + 3, '-') then
         return False;
      end if;
      if Has (Text'First + Offset + 4, 'w') then
         Value := Value + 8#0020#;
      elsif not Has (Text'First + Offset + 4, '-') then
         return False;
      end if;
      if not Parse_Execute
        (Text'First + Offset + 5, 8#0010#, 8#2000#, 's', 'S')
      then
         return False;
      end if;

      if Has (Text'First + Offset + 6, 'r') then
         Value := Value + 8#0004#;
      elsif not Has (Text'First + Offset + 6, '-') then
         return False;
      end if;
      if Has (Text'First + Offset + 7, 'w') then
         Value := Value + 8#0002#;
      elsif not Has (Text'First + Offset + 7, '-') then
         return False;
      end if;
      if not Parse_Execute
        (Text'First + Offset + 8, 8#0001#, 8#1000#, 't', 'T')
      then
         return False;
      end if;

      Mode := File_Mode_Value (Value);
      return True;
   end Parse_Symbolic_File_Mode;

   function Parse_File_Mode
     (Text : String;
      Mode : out File_Mode_Value;
      Kind : out File_Mode_Kind)
      return Humanize.Status.Status_Code
   is
   begin
      Mode := 0;
      Kind := Mode_Only;
      if Parse_Octal_File_Mode (Text, Mode) then
         return Humanize.Status.Ok;
      elsif Parse_Symbolic_File_Mode (Text, Mode, Kind) then
         return Humanize.Status.Ok;
      else
         return Humanize.Status.Invalid_Value;
      end if;
   end Parse_File_Mode;

   procedure Safe_Filename_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-')
   is
   begin
      Copy_Into (Safe_Filename (Text, Separator), Target, Written, Status);
   end Safe_Filename_Into;

   procedure Safe_Filename_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Safe_Filename_Options)
   is
   begin
      Copy_Into (Safe_Filename (Text, Options), Target, Written, Status);
   end Safe_Filename_Into;

   procedure Path_Basename_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Path_Basename (Path), Target, Written, Status);
   end Path_Basename_Into;

   procedure Path_Title_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Path_Title (Path), Target, Written, Status);
   end Path_Title_Into;

   procedure Path_Title_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Path_Title_Options)
   is
   begin
      Copy_Into (Path_Title (Path, Options), Target, Written, Status);
   end Path_Title_Into;

   procedure Extension_Label_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Extension_Label (Path), Target, Written, Status);
   end Extension_Label_Into;

   procedure Extension_Label_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Extension_Label_Options)
   is
   begin
      Copy_Into (Extension_Label (Path, Options), Target, Written, Status);
   end Extension_Label_Into;

   procedure Shorten_Path_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Path_Shorten_Options := Default_Path_Shorten_Options)
   is
   begin
      Copy_Into (Shorten_Path (Path, Options), Target, Written, Status);
   end Shorten_Path_Into;

   procedure Symbolic_File_Mode_Into
     (Mode    : File_Mode_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : File_Mode_Kind := Mode_Only)
   is
   begin
      Copy_Into (Symbolic_File_Mode (Mode, Kind), Target, Written, Status);
   end Symbolic_File_Mode_Into;

   procedure Octal_File_Mode_Into
     (Mode            : File_Mode_Value;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Include_Special : Boolean := False;
      Prefix          : Boolean := False)
   is
   begin
      Copy_Into
        (Octal_File_Mode (Mode, Include_Special, Prefix),
         Target, Written, Status);
   end Octal_File_Mode_Into;

   procedure File_Mode_Summary_Into
     (Mode    : File_Mode_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : File_Mode_Kind := Mode_Only)
   is
   begin
      Copy_Into (File_Mode_Summary (Mode, Kind), Target, Written, Status);
   end File_Mode_Summary_Into;

end Humanize.Strings.Paths;
