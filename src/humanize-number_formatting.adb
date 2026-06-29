with Ada.Strings.Unbounded;

package body Humanize.Number_Formatting is

   use Ada.Strings.Unbounded;

   function Lower (C : Character) return Character is
   begin
      if C in 'A' .. 'Z' then
         return Character'Val (Character'Pos (C) + 32);
      end if;
      return C;
   end Lower;

   --  Two-letter language subtag (text before the first '-'), lowercased.
   function Subtag (Locale : String) return String is
      Last : Natural := Locale'Last;
   begin
      for Index in Locale'Range loop
         if Locale (Index) = '-' then
            Last := Index - 1;
            exit;
         end if;
      end loop;

      declare
         Raw : constant String := Locale (Locale'First .. Last);
      begin
         if Raw'Length /= 2 then
            return "";
         end if;
         return [Lower (Raw (Raw'First)), Lower (Raw (Raw'First + 1))];
      end;
   end Subtag;

   function Symbols_For (Locale : String) return Number_Symbols is
      Code : constant String := Subtag (Locale);
   begin
      if Code = "de" or else Code = "da"
        or else Code = "es" or else Code = "it" or else Code = "pt"
      then
         return (Decimal => ',', Grouping => '.', Group => True);
      elsif Code = "fr" then
         return (Decimal => ',', Grouping => ' ', Group => True);
      else
         --  en and the root convention.
         return (Decimal => '.', Grouping => ',', Group => True);
      end if;
   end Symbols_For;

   --  Insert Sep between every third digit of Source, counting from the right.
   function Group_Digits (Source : String; Sep : Character) return String is
      Result : Unbounded_String;
      Count  : constant Natural := Source'Length;
   begin
      for Position in 1 .. Count loop
         if Position > 1 and then (Count - Position + 1) mod 3 = 0 then
            Append (Result, Sep);
         end if;
         Append (Result, Source (Source'First + Position - 1));
      end loop;
      return To_String (Result);
   end Group_Digits;

   function Localize (Value : String; Symbols : Number_Symbols) return String is
      First    : Natural := Value'First;
      Sign     : constant String :=
        (if Value'Length > 0 and then Value (Value'First) = '-'
         then "-" else "");
      Dot      : Natural := 0;
   begin
      if Sign'Length = 1 then
         First := First + 1;
      end if;

      for Index in First .. Value'Last loop
         if Value (Index) = '.' then
            Dot := Index;
            exit;
         end if;
      end loop;

      declare
         Integer_Part : constant String :=
           (if Dot = 0 then Value (First .. Value'Last)
            else Value (First .. Dot - 1));
         Fraction     : constant String :=
           (if Dot = 0 then "" else Value (Dot + 1 .. Value'Last));
         Grouped      : constant String :=
           (if Symbols.Group
            then Group_Digits (Integer_Part, Symbols.Grouping)
            else Integer_Part);
      begin
         if Fraction'Length = 0 then
            return Sign & Grouped;
         end if;
         return Sign & Grouped & Symbols.Decimal & Fraction;
      end;
   end Localize;

   --  Decimal image without the 'Image leading space.
   function No_Space (Image : String) return String is
     (if Image'Length > 0 and then Image (Image'First) = ' '
      then Image (Image'First + 1 .. Image'Last)
      else Image);

   function Decimal_Image
     (Value                  : Long_Float;
      Max_Digits             : Natural;
      Suppress_Trailing_Zero : Boolean := True)
      return String
   is
      Sign  : constant String := (if Value < 0.0 then "-" else "");
      Scale : Long_Long_Integer := 1;
   begin
      for Count in 1 .. Max_Digits loop
         Scale := Scale * 10;
      end loop;

      declare
         Scaled    : constant Long_Long_Integer :=
           Long_Long_Integer
             (Long_Float'Rounding (abs Value * Long_Float (Scale)));
         Int_Part  : constant Long_Long_Integer := Scaled / Scale;
         Frac_Part : constant Long_Long_Integer := Scaled mod Scale;
         Int_Img   : constant String :=
           No_Space (Long_Long_Integer'Image (Int_Part));
      begin
         if Max_Digits = 0 then
            return Sign & Int_Img;
         end if;

         declare
            Raw_Frac : constant String :=
              No_Space (Long_Long_Integer'Image (Frac_Part));
            Padded   : String (1 .. Max_Digits) := [others => '0'];
            Last     : Natural := Max_Digits;
         begin
            --  Right-align the fraction digits, zero-padded on the left.
            Padded (Max_Digits - Raw_Frac'Length + 1 .. Max_Digits) := Raw_Frac;
            if Suppress_Trailing_Zero then
               while Last >= 1 and then Padded (Last) = '0' loop
                  Last := Last - 1;
               end loop;
            end if;
            if Last = 0 then
               return Sign & Int_Img;
            end if;
            return Sign & Int_Img & "." & Padded (1 .. Last);
         end;
      end;
   end Decimal_Image;

end Humanize.Number_Formatting;
