with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Locales;

package body Humanize.Numbers.Spellout_Data is

   --  Provenance: generated from Humanize spellout tables and reviewed as
   --  checked-in Ada source. Keep currentness notes in docs/QUALITY_GUARDS.md.

   --  Data boundary: this body intentionally holds spellout word tables and
   --  locale fragments. Keep formatting/parsing behavior in the caller
   --  packages; do not move table data into public facades to reduce size.

   U_A_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A1#);
   U_A_Ring : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A5#);
   U_A_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A4#);
   U_A_Tilde : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A3#);
   U_C_Cedilla : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A7#);
   U_E_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A9#);
   U_E_Circumflex : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AA#);
   U_E_Grave : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A8#);
   U_E_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AB#);
   U_I_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AD#);
   U_I_Dotless : constant String :=
     Character'Val (16#C4#) & Character'Val (16#B1#);
   U_O_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B3#);
   U_O_Tilde : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B5#);
   U_O_Slash : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B8#);
   U_O_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B6#);
   U_Sharp_S : constant String :=
     Character'Val (16#C3#) & Character'Val (16#9F#);
   U_S_Cedilla : constant String :=
     Character'Val (16#C5#) & Character'Val (16#9F#);
   U_U_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#BA#);
   U_U_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#BC#);

   function U (Code : Natural) return String
      renames Humanize.Bounded_Text.UTF8_Code_Point;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Under_Thousand (Value : Natural) return String is
      function Ones (Item : Natural) return String is
      begin
         case Item is
            when 0 => return "zero";
            when 1 => return "one";
            when 2 => return "two";
            when 3 => return "three";
            when 4 => return "four";
            when 5 => return "five";
            when 6 => return "six";
            when 7 => return "seven";
            when 8 => return "eight";
            when 9 => return "nine";
            when 10 => return "ten";
            when 11 => return "eleven";
            when 12 => return "twelve";
            when 13 => return "thirteen";
            when 14 => return "fourteen";
            when 15 => return "fifteen";
            when 16 => return "sixteen";
            when 17 => return "seventeen";
            when 18 => return "eighteen";
            when others => return "nineteen";
         end case;
      end Ones;

      function Tens (Item : Natural) return String is
      begin
         case Item is
            when 2 => return "twenty";
            when 3 => return "thirty";
            when 4 => return "forty";
            when 5 => return "fifty";
            when 6 => return "sixty";
            when 7 => return "seventy";
            when 8 => return "eighty";
            when others => return "ninety";
         end case;
      end Tens;

      Hundreds : constant Natural := Value / 100;
      Rest     : constant Natural := Value mod 100;
   begin
      if Value < 20 then
         return Ones (Value);
      elsif Value < 100 then
         if Value mod 10 = 0 then
            return Tens (Value / 10);
         else
            return Tens (Value / 10) & "-" & Ones (Value mod 10);
         end if;
      elsif Rest = 0 then
         return Ones (Hundreds) & " hundred";
      else
         return Ones (Hundreds) & " hundred " & Under_Thousand (Rest);
      end if;
   end Under_Thousand;

   function Cardinal_Text (Value : Natural) return String is
      Thousands : constant Natural := Value / 1_000;
      Rest      : constant Natural := Value mod 1_000;
   begin
      if Value < 1_000 then
         return Under_Thousand (Value);
      elsif Value < 1_000_000 then
         if Rest = 0 then
            return Under_Thousand (Thousands) & " thousand";
         else
            return Under_Thousand (Thousands) & " thousand "
              & Under_Thousand (Rest);
         end if;
      else
         return Natural_Text (Value);
      end if;
   end Cardinal_Text;

   function Scale_Name (Index : Positive) return String is
   begin
      case Index is
         when 1 => return "thousand";
         when 2 => return "million";
         when 3 => return "billion";
         when 4 => return "trillion";
         when 5 => return "quadrillion";
         when others => return "quintillion";
      end case;
   end Scale_Name;

   function Has_Generated_Spellout (Locale : String) return Boolean is
      Language : constant String := Humanize.Locales.Language_Code (Locale);
   begin
      return
        Language = "sv" or else Humanize.Locales.Is_Norwegian (Language)
        or else Language = "fi"
        or else Language = "tr" or else Language = "pl"
        or else Language = "cs" or else Language = "ru"
        or else Language = "uk" or else Humanize.Locales.Is_CJK (Language)
        or else Language = "ar" or else Language = "hi"
        or else Language = "ro" or else Language = "lt"
        or else Language = "sl" or else Language = "id"
        or else Language = "ms" or else Language = "eo"
        or else Language = "vi" or else Language = "sw"
        or else Language = "af" or else Language = "hu"
        or else Language = "sk";
   end Has_Generated_Spellout;

   --  Generated multilingual spellout tables are intentionally encoded as
   --  codepoint fragments to keep the source ASCII and deterministic.
   pragma Style_Checks (Off);

   function Small_Locale_Word
     (Locale : String;
      Value  : Natural)
      return String
      is separate;

   function Locale_Tens_Word
     (Locale : String;
      Tens   : Natural)
      return String
      is separate;

   function Locale_Word_99
     (Locale : String;
      Value  : Natural)
      return String
      is separate;

   function Locale_Hundred_Word
     (Locale : String;
      Value  : Natural)
      return String
      is separate;

   function Locale_Scale_Word
     (Locale : String;
      Scale  : Positive;
      Count  : Natural := 2)
      return String
      is separate;

   function Locale_CJK_Group_Word
     (Locale : String;
      Value  : Natural)
      return String
   is
      Thousands : constant Natural := Value / 1_000;
      Remainder : constant Natural := Value mod 1_000;
      Result    : Unbounded_String;
   begin
      if Value <= 999 then
         return Locale_Hundred_Word (Locale, Value);
      elsif Value > 9_999 then
         return "";
      end if;

      if Thousands = 1 then
         Append (Result, Locale_Scale_Word (Locale, 1, 1));
      else
         Append (Result, Small_Locale_Word (Locale, Thousands));
         Append (Result, Locale_Scale_Word (Locale, 1, Thousands));
      end if;

      if Remainder > 0 then
         Append (Result, Locale_Hundred_Word (Locale, Remainder));
      end if;

      return To_String (Result);
   end Locale_CJK_Group_Word;

   function Locale_CJK_Myriad_Scale_Word
     (Locale : String;
      Scale  : Positive)
      return String is
   begin
      case Scale is
         when 1 =>
            return (if Locale = "ko" then U (16#B9CC#) else U (16#4E07#));
         when 2 =>
            return
              (if Locale = "ko" then U (16#C5B5#)
               elsif Locale = "zh" then U (16#4EBF#)
               else U (16#5104#));
         when 3 =>
            return (if Locale = "ko" then U (16#C870#) else U (16#5146#));
         when others =>
            return "";
      end case;
   end Locale_CJK_Myriad_Scale_Word;

   function Locale_Long_Word
     (Locale : String;
      Value  : Long_Long_Integer)
      return String
      is separate;

   function Ordinal_Under_Thousand (Value : Natural) return String is
      function Direct (Item : Natural) return String is
      begin
         case Item is
            when 0 => return "zeroth";
            when 1 => return "first";
            when 2 => return "second";
            when 3 => return "third";
            when 4 => return "fourth";
            when 5 => return "fifth";
            when 6 => return "sixth";
            when 7 => return "seventh";
            when 8 => return "eighth";
            when 9 => return "ninth";
            when 10 => return "tenth";
            when 11 => return "eleventh";
            when 12 => return "twelfth";
            when 13 => return "thirteenth";
            when 14 => return "fourteenth";
            when 15 => return "fifteenth";
            when 16 => return "sixteenth";
            when 17 => return "seventeenth";
            when 18 => return "eighteenth";
            when others => return "nineteenth";
         end case;
      end Direct;

      Tens_Value : constant Natural := Value / 10;
      Ones_Value : constant Natural := Value mod 10;
      Hundreds : constant Natural := Value / 100;
      Rest : constant Natural := Value mod 100;
   begin
      if Value < 20 then
         return Direct (Value);
      elsif Value < 100 then
         if Ones_Value = 0 then
            case Tens_Value is
               when 2 => return "twentieth";
               when 3 => return "thirtieth";
               when 4 => return "fortieth";
               when 5 => return "fiftieth";
               when 6 => return "sixtieth";
               when 7 => return "seventieth";
               when 8 => return "eightieth";
               when others => return "ninetieth";
            end case;
         else
            return Under_Thousand (Tens_Value * 10) & "-"
              & Ordinal_Under_Thousand (Ones_Value);
         end if;
      elsif Rest = 0 then
         return Under_Thousand (Hundreds) & " hundredth";
      else
         return Under_Thousand (Hundreds) & " hundred "
           & Ordinal_Under_Thousand (Rest);
      end if;
   end Ordinal_Under_Thousand;

   function Ordinal_Words_Text (Value : Natural) return String is
      Thousands : constant Natural := Value / 1_000;
      Rest      : constant Natural := Value mod 1_000;
   begin
      if Value < 1_000 then
         return Ordinal_Under_Thousand (Value);
      elsif Value < 1_000_000 then
         if Rest = 0 then
            return Under_Thousand (Thousands) & " thousandth";
         else
            return Under_Thousand (Thousands) & " thousand "
              & Ordinal_Under_Thousand (Rest);
         end if;
      else
         return Cardinal_Text (Value);
      end if;
   end Ordinal_Words_Text;

   function Locale_Ordinal_Words_Text
     (Locale : String;
      Value  : Natural)
      return String
      is separate;

   function Scale_Value (Scale : Positive) return Long_Long_Integer is
      Result : Long_Long_Integer := 1;
   begin
      for Index in 1 .. Scale loop
         Result := Result * 1_000;
      end loop;
      return Result;
   end Scale_Value;

   function CJK_Scale_Value (Scale : Positive) return Long_Long_Integer is
      Result : Long_Long_Integer := 1;
   begin
      for Index in 1 .. Scale loop
         Result := Result * 10_000;
      end loop;
      return Result;
   end CJK_Scale_Value;

end Humanize.Numbers.Spellout_Data;
