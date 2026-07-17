with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Parsing.Support is
   function B (Hex : String) return String
      renames Humanize.Bounded_Text.Hex_Bytes;

   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Starts_At (Text : String; Index : Natural; Pattern : String)
      return Boolean
   is
   begin
      return Index in Text'Range
        and then Index + Pattern'Length - 1 <= Text'Last
        and then Text (Index .. Index + Pattern'Length - 1) = Pattern;
   end Starts_At;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Normalize_Native_Digits (Text : String) return String is
      Result : Unbounded_String;
      Index  : Natural := Text'First;

      procedure Append_Digit
        (Prefix : String;
         Base   : Character;
         Width  : Natural)
      is
      begin
         for Digit in 0 .. 9 loop
            declare
               Candidate : constant String :=
                 Prefix & Character'Val (Character'Pos (Base) + Digit);
            begin
               if Starts_At (Text, Index, Candidate) then
                  Append (Result, Character'Val (Character'Pos ('0') + Digit));
                  Index := Index + Width;
                  return;
               end if;
            end;
         end loop;
         Append (Result, Text (Index));
         Index := Index + 1;
      end Append_Digit;
   begin
      while Index <= Text'Last loop
         if Starts_At (Text, Index, B ("D9AB")) then
            Append (Result, '.');
            Index := Index + 2;
         elsif Starts_At (Text, Index, B ("D9AC")) then
            Index := Index + 2;
         elsif Starts_At (Text, Index, B ("D9")) then
            Append_Digit (B ("D9"), Character'Val (16#A0#), 2);
         elsif Starts_At (Text, Index, B ("DB")) then
            Append_Digit (B ("DB"), Character'Val (16#B0#), 2);
         elsif Starts_At (Text, Index, B ("E0A5")) then
            Append_Digit (B ("E0A5"), Character'Val (16#A6#), 3);
         else
            Append (Result, Text (Index));
            Index := Index + 1;
         end if;
      end loop;
      return To_String (Result);
   end Normalize_Native_Digits;

   function Has_Decimal_Comma (Text : String) return Boolean is
      Normalized : constant String := Normalize_Native_Digits (Text);
      Comma : Natural := 0;
      Dot   : Natural := 0;
      After : Natural := 0;
   begin
      for Index in Normalized'Range loop
         if Normalized (Index) = ',' then
            Comma := Index;
         elsif Normalized (Index) = '.' then
            Dot := Index;
         end if;
      end loop;

      if Comma = 0 or else Dot /= 0 then
         return False;
      end if;

      for Index in Comma + 1 .. Normalized'Last loop
         if Is_Digit (Normalized (Index)) then
            After := After + 1;
         end if;
      end loop;

      return After /= 3;
   end Has_Decimal_Comma;

   function Numeric_Value (Text : String; Value : out Long_Float) return Boolean is
      Normalized : constant String := Normalize_Native_Digits (Text);
      Clean : String (1 .. Normalized'Length);
      Last  : Natural := 0;
      Use_Comma_Decimal : constant Boolean := Has_Decimal_Comma (Normalized);
   begin
      for Ch of Normalized loop
         if Ch = '_' or else Ch = ' ' then
            null;
         elsif Ch = ',' then
            if Use_Comma_Decimal then
               Last := Last + 1;
               Clean (Last) := '.';
            end if;
         elsif Is_Digit (Ch) or else Ch = '.' or else Ch = '-' or else Ch = '+'
         then
            Last := Last + 1;
            Clean (Last) := Ch;
         else
            return False;
         end if;
      end loop;

      if Last = 0 then
         return False;
      end if;

      Value := Long_Float'Value (Clean (1 .. Last));
      return True;
   exception
      when others =>
         return False;
   end Numeric_Value;

   function Rounded_Nonnegative (Value : Long_Float) return Long_Long_Integer is
   begin
      if Value < 0.0 then
         return -1;
      end if;
      return Long_Long_Integer (Long_Float'Rounding (Value));
   exception
      when others =>
         return -1;
   end Rounded_Nonnegative;

   function Split_Number_Unit
     (Text        : String;
      Number_Text : out Natural;
      Unit_Start  : out Natural)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Last : Natural := Item'First - 1;
   begin
      Number_Text := 0;
      Unit_Start := 0;
      if Item'Length = 0 then
         return False;
      end if;

      for Index in Item'Range loop
         if Is_Digit (Item (Index))
           or else Item (Index) = '.'
           or else Item (Index) = ','
           or else Item (Index) = '_'
           or else Item (Index) = '+'
           or else Item (Index) = '-'
         then
            Last := Index;
         else
            exit;
         end if;
      end loop;

      if Last < Item'First then
         return False;
      end if;

      Number_Text := Last;
      Unit_Start := Last + 1;
      while Unit_Start <= Item'Last and then Item (Unit_Start) = ' ' loop
         Unit_Start := Unit_Start + 1;
      end loop;
      return Unit_Start <= Item'Last;
   end Split_Number_Unit;

   function Scan_End (Text : String) return Natural is
   begin
      for Index in Text'Range loop
         if Text (Index) = ';' or else Text (Index) = '('
           or else Text (Index) = ')' or else Text (Index) = ASCII.LF
         then
            return Index - 1;
         end if;
      end loop;
      return Text'Last;
   end Scan_End;

   function Scan_Number_End (Text : String) return Natural is
   begin
      for Index in Text'Range loop
         if Text (Index) = ';' or else Text (Index) = '('
           or else Text (Index) = ')' or else Text (Index) = ASCII.LF
           or else Text (Index) = ' '
         then
            return Index - 1;
         end if;
      end loop;
      return Text'Last;
   end Scan_Number_End;
end Humanize.Parsing.Support;
