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
   is
      Tens : constant Natural := Value / 10;
      Ones : constant Natural := Value mod 10;
      Ten  : constant String := Locale_Tens_Word (Locale, Tens);
      One  : constant String := Small_Locale_Word (Locale, Ones);
   begin
      if Humanize.Locales.Is_CJK (Locale) and then Value > 10 and then Value < 100 then
         declare
            Ten_Unit : constant String :=
              (if Locale = "ko" then U (16#C2ED#) else U (16#5341#));
         begin
            if Value < 20 then
               return Ten_Unit
                 & (if Ones = 0 then "" else Small_Locale_Word (Locale, Ones));
            elsif Ones = 0 then
               return Small_Locale_Word (Locale, Tens) & Ten_Unit;
            else
               return Small_Locale_Word (Locale, Tens) & Ten_Unit
                 & Small_Locale_Word (Locale, Ones);
            end if;
         end;
      elsif Value <= 20 then
         return Small_Locale_Word (Locale, Value);
      elsif Value < 100 then
         if Locale = "fr" then
            if Value < 70 then
               if Ones = 0 then
                  return Ten;
               elsif Ones = 1 then
                  return Ten & "-et-un";
               else
                  return Ten & "-" & One;
               end if;
            elsif Value < 80 then
               if Value = 71 then
                  return "soixante-et-onze";
               else
                  return "soixante-" & Small_Locale_Word (Locale, Value - 60);
               end if;
            elsif Value = 80 then
               return "quatre-vingts";
            else
               return "quatre-vingt-" & Small_Locale_Word (Locale, Value - 80);
            end if;
         elsif Locale = "es" and then Value in 21 .. 29 then
            case Value is
               when 21 => return "veintiuno";
               when 22 => return "veintid" & U_O_Acute & "s";
               when 23 => return "veintitr" & U_E_Acute & "s";
               when 24 => return "veinticuatro";
               when 25 => return "veinticinco";
               when 26 => return "veintis" & U_E_Acute & "is";
               when 27 => return "veintisiete";
               when 28 => return "veintiocho";
               when others => return "veintinueve";
            end case;
         end if;

         if Ones = 0 then
            return Ten;
         elsif Locale = "de" then
            return (if Ones = 1 then "ein" else One) & "und" & Ten;
         elsif Locale = "da" then
            return One & "og" & Ten;
         elsif Locale = "nl" then
            return
              (if Ones = 2 then "twee" & U_E_Umlaut
               elsif Ones = 3 then "drie" & U_E_Umlaut
               else One)
              & (if Ones = 2 or else Ones = 3 then "n" else "en") & Ten;
         elsif Locale = "es" then
            return Ten & " y " & One;
         elsif Locale = "pt" then
            return Ten & " e " & One;
         elsif Locale = "it" then
            if Ones = 1 or else Ones = 8 then
               return Ten (Ten'First .. Ten'Last - 1) & One;
            else
               return Ten & One;
            end if;
         elsif Locale = "fr" then
            return Ten & "-" & One;
         elsif Locale = "sv" or else Humanize.Locales.Is_Norwegian (Locale) or else Locale = "fi" then
            return Ten & One;
         elsif Locale = "tr" then
            return Ten & " " & One;
         elsif Locale = "ro" then
            return Ten & " si " & One;
         elsif Locale = "af" then
            return One & " en " & Ten;
         elsif Locale = "hu" then
            return Ten & One;
         elsif Locale = "sw" then
            return Ten & " na " & One;
         elsif Locale in "pl" | "cs" | "ru" | "uk" | "ar" | "hi"
           | "lt" | "sl" | "id" | "ms" | "eo" | "vi" | "sk"
         then
            return Ten & " " & One;
         else
            return Under_Thousand (Value);
         end if;
      else
         return "";
      end if;
   end Locale_Word_99;

   function Locale_Hundred_Word
     (Locale : String;
      Value  : Natural)
      return String
   is
      Hundreds : constant Natural := Value / 100;
      Rest     : constant Natural := Value mod 100;
      Prefix   : constant String :=
        (if Locale = "de" and then Hundreds = 1 then "ein"
         else Locale_Word_99 (Locale, Hundreds));

      function Spanish_Hundred return String is
      begin
         case Hundreds is
            when 1 => return (if Rest = 0 then "cien" else "ciento");
            when 2 => return "doscientos";
            when 3 => return "trescientos";
            when 4 => return "cuatrocientos";
            when 5 => return "quinientos";
            when 6 => return "seiscientos";
            when 7 => return "setecientos";
            when 8 => return "ochocientos";
            when others => return "novecientos";
         end case;
      end Spanish_Hundred;

      function Portuguese_Hundred return String is
      begin
         case Hundreds is
            when 1 => return (if Rest = 0 then "cem" else "cento");
            when 2 => return "duzentos";
            when 3 => return "trezentos";
            when 4 => return "quatrocentos";
            when 5 => return "quinhentos";
            when 6 => return "seiscentos";
            when 7 => return "setecentos";
            when 8 => return "oitocentos";
            when others => return "novecentos";
         end case;
      end Portuguese_Hundred;

      function Slavic_Hundred return String is
      begin
         if Locale = "pl" then
            case Hundreds is
               when 1 => return "sto";
               when 2 => return "dwie" & U (16#15B#) & "cie";
               when 3 => return "trzysta";
               when 4 => return "czterysta";
               when 5 => return "pi" & U (16#119#) & U (16#107#) & "set";
               when 6 => return "sze" & U (16#15B#) & U (16#107#) & "set";
               when 7 => return "siedemset";
               when 8 => return "osiemset";
               when others => return "dziewi" & U (16#119#) & U (16#107#) & "set";
            end case;
         elsif Locale = "cs" then
            case Hundreds is
               when 1 => return "sto";
               when 2 => return "dv" & U (16#11B#) & " st" & U (16#11B#);
               when 3 => return "t" & U (16#159#) & "i sta";
               when 4 => return U (16#10D#) & "ty" & U (16#159#) & "i sta";
               when 5 => return "p" & U (16#11B#) & "t set";
               when 6 => return U (16#161#) & "est set";
               when 7 => return "sedm set";
               when 8 => return "osm set";
               when others => return "dev" & U (16#11B#) & "t set";
            end case;
         elsif Locale = "ru" then
            case Hundreds is
               when 1 => return U (16#441#) & U (16#442#) & U (16#43E#);
               when 2 => return U (16#434#) & U (16#432#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#438#);
               when 3 => return U (16#442#) & U (16#440#) & U (16#438#) & U (16#441#) & U (16#442#) & U (16#430#);
               when 4 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#44B#) & U (16#440#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#430#);
               when 5 => return U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#44C#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when 6 => return U (16#448#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#44C#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when 7 => return U (16#441#) & U (16#435#) & U (16#43C#) & U (16#44C#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when 8 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#435#) & U (16#43C#) & U (16#44C#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when others => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#44F#) & U (16#442#) & U (16#44C#) & U (16#441#) & U (16#43E#) & U (16#442#);
            end case;
         elsif Locale = "uk" then
            case Hundreds is
               when 1 => return U (16#441#) & U (16#442#) & U (16#43E#);
               when 2 => return U (16#434#) & U (16#432#) & U (16#456#) & U (16#441#) & U (16#442#) & U (16#456#);
               when 3 => return U (16#442#) & U (16#440#) & U (16#438#) & U (16#441#) & U (16#442#) & U (16#430#);
               when 4 => return U (16#447#) & U (16#43E#) & U (16#442#) & U (16#438#) & U (16#440#) & U (16#438#) & U (16#441#) & U (16#442#) & U (16#430#);
               when 5 => return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when 6 => return U (16#448#) & U (16#456#) & U (16#441#) & U (16#442#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when 7 => return U (16#441#) & U (16#456#) & U (16#43C#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when 8 => return U (16#432#) & U (16#456#) & U (16#441#) & U (16#456#) & U (16#43C#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when others => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#441#) & U (16#43E#) & U (16#442#);
            end case;
         else
            return "";
         end if;
      end Slavic_Hundred;
   begin
      if Value < 100 then
         return Locale_Word_99 (Locale, Value);
      elsif Locale = "de" then
         return Prefix & "hundert"
           & (if Rest = 0 then "" else Locale_Word_99 (Locale, Rest));
      elsif Locale = "da" then
         return (if Hundreds = 1 then "et" else Prefix) & " hundrede"
           & (if Rest = 0 then "" else " og " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "es" then
         return Spanish_Hundred
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "it" then
         if Rest = 0 then
            return (if Hundreds = 1 then "" else Prefix) & "cento";
         elsif Rest in 80 .. 89 then
            return (if Hundreds = 1 then "" else Prefix) & "cent"
              & Locale_Word_99 (Locale, Rest);
         else
            return (if Hundreds = 1 then "" else Prefix) & "cento"
              & Locale_Word_99 (Locale, Rest);
         end if;
      elsif Locale = "pt" then
         return Portuguese_Hundred
           & (if Rest = 0 then "" else " e " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "nl" then
         return (if Hundreds = 1 then "" else Prefix) & "honderd"
           & (if Rest = 0 then "" else Locale_Word_99 (Locale, Rest));
      elsif Locale = "sv" then
         return (if Hundreds = 1 then "ett" else Prefix) & " hundra"
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Humanize.Locales.Is_Norwegian (Locale) then
         return (if Hundreds = 1 then "ett" else Prefix) & " hundre"
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "fi" then
         return (if Hundreds = 1 then "" else Prefix) & "sata"
           & (if Rest = 0 then "" else Locale_Word_99 (Locale, Rest));
      elsif Locale = "tr" then
         return (if Hundreds = 1 then "" else Prefix & " ") & "y" & U_U_Umlaut & "z"
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale in "pl" | "cs" | "ru" | "uk" then
         return Slavic_Hundred
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Humanize.Locales.Is_CJK (Locale) then
         declare
            Hundred_Unit : constant String :=
              (if Locale = "ko" then U (16#BC31#) else U (16#767E#));
         begin
            return
              (if Hundreds = 1 then "" else Small_Locale_Word (Locale, Hundreds))
              & Hundred_Unit
              & (if Rest = 0 then "" else Locale_Word_99 (Locale, Rest));
         end;
      elsif Locale = "ar" then
         declare
            Hundred : constant String :=
              (case Hundreds is
                  when 1 => U (16#645#) & U (16#626#) & U (16#629#),
                  when 2 => U (16#645#) & U (16#626#) & U (16#62A#) & U (16#627#) & U (16#646#),
                  when others => Small_Locale_Word (Locale, Hundreds) & " "
                    & U (16#645#) & U (16#626#) & U (16#629#));
         begin
            return Hundred
              & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
         end;
      elsif Locale = "hi" then
         return (if Hundreds = 1 then "" else Prefix & " ")
           & U (16#938#) & U (16#94C#)
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "ro" then
         return (if Hundreds = 1 then "o suta" else Prefix & " sute")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "lt" then
         return (if Hundreds = 1 then "simtas" else Prefix & " simtai")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "sl" then
         return (if Hundreds = 1 then "sto" else Prefix & "sto")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "id" or else Locale = "ms" then
         return (if Hundreds = 1 then "seratus" else Prefix & " ratus")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "eo" then
         return (if Hundreds = 1 then "cent" else Prefix & "cent")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "vi" then
         return Prefix & " tram"
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "sw" then
         return (if Hundreds = 1 then "mia moja" else "mia " & Prefix)
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "af" then
         return (if Hundreds = 1 then "een" else Prefix) & "honderd"
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "hu" then
         return (if Hundreds = 1 then "szaz" else Prefix & "szaz")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "sk" then
         return (if Hundreds = 1 then "sto" else Prefix & "sto")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Rest = 0 then
         if Locale = "fr" and then Hundreds > 1 then
            return Prefix & " cents";
         else
            return Prefix & " hundred";
         end if;
      else
         if Locale = "fr" and then Hundreds = 1 then
            return "cent " & Locale_Word_99 (Locale, Rest);
         elsif Locale = "fr" then
            return Prefix & " cent " & Locale_Word_99 (Locale, Rest);
         else
            return Prefix & " hundred " & Locale_Word_99 (Locale, Rest);
         end if;
      end if;
   end Locale_Hundred_Word;

   function Locale_Scale_Word
     (Locale : String;
      Scale  : Positive;
      Count  : Natural := 2)
      return String is
   begin
      case Scale is
         when 1 =>
            if Locale = "de" then
               return "tausend";
            elsif Locale = "fr" then
               return "mille";
            elsif Locale = "da" then
               return "tusind";
            elsif Locale = "es" then
               return "mil";
            elsif Locale = "it" then
               return (if Count = 1 then "mille" else "mila");
            elsif Locale = "pt" then
               return "mil";
            elsif Locale = "nl" then
               return "duizend";
            elsif Locale = "sv" then
               return (if Count = 1 then "tusen" else "tusen");
            elsif Humanize.Locales.Is_Norwegian (Locale) then
               return (if Count = 1 then "tusen" else "tusen");
            elsif Locale = "fi" then
               return (if Count = 1 then "tuhat" else "tuhatta");
            elsif Locale = "tr" then
               return "bin";
            elsif Locale = "pl" then
               return
                 (if Count = 1
                  then "tysi" & U (16#105#) & "c"
                  elsif Count in 2 .. 4
                  then "tysi" & U (16#105#) & "ce"
                  else "tysi" & U (16#119#) & "cy");
            elsif Locale = "cs" then
               return
                 (if Count = 1
                  then "tis" & U (16#ED#) & "c"
                  elsif Count in 2 .. 4
                  then "tis" & U (16#ED#) & "ce"
                  else "tis" & U (16#ED#) & "c");
            elsif Locale = "ru" then
               return
                 (if Count = 1
                  then U (16#442#) & U (16#44B#) & U (16#441#)
                    & U (16#44F#) & U (16#447#) & U (16#430#)
                  elsif Count in 2 .. 4
                  then U (16#442#) & U (16#44B#) & U (16#441#)
                    & U (16#44F#) & U (16#447#) & U (16#438#)
                  else U (16#442#) & U (16#44B#) & U (16#441#)
                    & U (16#44F#) & U (16#447#));
            elsif Locale = "uk" then
               return
                 (if Count = 1
                  then U (16#442#) & U (16#438#) & U (16#441#)
                    & U (16#44F#) & U (16#447#) & U (16#430#)
                  elsif Count in 2 .. 4
                  then U (16#442#) & U (16#438#) & U (16#441#)
                    & U (16#44F#) & U (16#447#) & U (16#456#)
                  else U (16#442#) & U (16#438#) & U (16#441#)
                    & U (16#44F#) & U (16#447#));
            elsif Locale = "ja" or else Locale = "zh" then
               return U (16#5343#);
            elsif Locale = "ko" then
               return U (16#CC9C#);
            elsif Locale = "ar" then
               return U (16#623#) & U (16#644#) & U (16#641#);
            elsif Locale = "hi" then
               return U (16#939#) & U (16#91C#) & U (16#93E#) & U (16#930#);
            elsif Locale in "ro" | "lt" | "sl" | "id" | "ms" | "eo"
              | "vi" | "sw" | "af" | "hu" | "sk"
            then
               return
                 (if Locale = "ro" then "mie"
                  elsif Locale = "lt" then "tukstantis"
                  elsif Locale = "sl" then "tisoc"
                  elsif Locale = "id" or else Locale = "ms" then "ribu"
                  elsif Locale = "eo" then "mil"
                  elsif Locale = "vi" then "nghin"
                  elsif Locale = "sw" then "elfu"
                  elsif Locale = "af" then "duisend"
                  elsif Locale = "hu" then "ezer"
                  else "tisic");
            else
               return "thousand";
            end if;
         when 2 =>
            if Locale = "de" then
               return (if Count = 1 then "Million" else "Millionen");
            elsif Locale = "fr" then
               return (if Count = 1 then "million" else "millions");
            elsif Locale = "da" then
               return (if Count = 1 then "million" else "millioner");
            elsif Locale = "es" then
               return (if Count = 1 then "mill" & U_O_Acute & "n" else "millones");
            elsif Locale = "it" then
               return (if Count = 1 then "milione" else "milioni");
            elsif Locale = "pt" then
               return
                 (if Count = 1
                  then "milh" & U_A_Tilde & "o"
                  else "milh" & U_O_Tilde & "es");
            elsif Locale = "nl" then
               return "miljoen";
            elsif Locale = "sv" then
               return (if Count = 1 then "miljon" else "miljoner");
            elsif Humanize.Locales.Is_Norwegian (Locale) then
               return (if Count = 1 then "million" else "millioner");
            elsif Locale = "fi" then
               return (if Count = 1 then "miljoona" else "miljoonaa");
            elsif Locale = "tr" then
               return "milyon";
            elsif Locale = "pl" then
               return (if Count = 1 then "milion" else "miliony");
            elsif Locale = "cs" then
               return (if Count = 1 then "milion" else "miliony");
            elsif Locale = "ru" then
               return U (16#43C#) & U (16#438#) & U (16#43B#) & U (16#43B#) & U (16#438#) & U (16#43E#) & U (16#43D#);
            elsif Locale = "uk" then
               return U (16#43C#) & U (16#456#) & U (16#43B#) & U (16#44C#) & U (16#439#) & U (16#43E#) & U (16#43D#);
            elsif Locale = "ja" or else Locale = "zh" then
               return U (16#767E#) & U (16#4E07#);
            elsif Locale = "ko" then
               return U (16#BC31#) & U (16#B9CC#);
            elsif Locale = "ar" then
               return U (16#645#) & U (16#644#) & U (16#64A#) & U (16#648#) & U (16#646#);
            elsif Locale = "hi" then
               return U (16#932#) & U (16#93E#) & U (16#916#);
            elsif Locale in "ro" | "lt" | "sl" | "id" | "ms" | "eo"
              | "vi" | "sw" | "af" | "hu" | "sk"
            then
               return
                 (if Locale = "ro" then (if Count = 1 then "milion" else "milioane")
                  elsif Locale = "lt" then (if Count = 1 then "milijonas" else "milijonai")
                  elsif Locale = "sl" then (if Count = 1 then "milijon" else "milijoni")
                  elsif Locale = "id" or else Locale = "ms" then "juta"
                  elsif Locale = "eo" then (if Count = 1 then "miliono" else "milionoj")
                  elsif Locale = "vi" then "trieu"
                  elsif Locale = "sw" then "milioni"
                  elsif Locale = "af" then "miljoen"
                  elsif Locale = "hu" then "millio"
                  else (if Count = 1 then "milion" else "miliony"));
            else
               return "million";
            end if;
         when 3 =>
            if Locale = "de" then
               return (if Count = 1 then "Milliarde" else "Milliarden");
            elsif Locale = "fr" then
               return (if Count = 1 then "milliard" else "milliards");
            elsif Locale = "da" then
               return (if Count = 1 then "milliard" else "milliarder");
            elsif Locale = "es" then
               return "mil millones";
            elsif Locale = "it" then
               return (if Count = 1 then "miliardo" else "miliardi");
            elsif Locale = "pt" then
               return
                 (if Count = 1
                  then "bilh" & U_A_Tilde & "o"
                  else "bilh" & U_O_Tilde & "es");
            elsif Locale = "nl" then
               return "miljard";
            elsif Locale = "sv" then
               return (if Count = 1 then "miljard" else "miljarder");
            elsif Humanize.Locales.Is_Norwegian (Locale) then
               return (if Count = 1 then "milliard" else "milliarder");
            elsif Locale = "fi" then
               return (if Count = 1 then "miljardi" else "miljardia");
            elsif Locale = "tr" then
               return "milyar";
            elsif Locale = "pl" then
               return (if Count = 1 then "miliard" else "miliardy");
            elsif Locale = "cs" then
               return (if Count = 1 then "miliarda" else "miliardy");
            elsif Locale = "ru" then
               return U (16#43C#) & U (16#438#) & U (16#43B#) & U (16#43B#) & U (16#438#) & U (16#430#) & U (16#440#) & U (16#434#);
            elsif Locale = "uk" then
               return U (16#43C#) & U (16#456#) & U (16#43B#) & U (16#44C#) & U (16#44F#) & U (16#440#) & U (16#434#);
            elsif Locale = "ja" or else Locale = "zh" then
               return U (16#5341#) & U (16#5104#);
            elsif Locale = "ko" then
               return U (16#C2ED#) & U (16#C5B5#);
            elsif Locale = "ar" then
               return U (16#645#) & U (16#644#) & U (16#64A#) & U (16#627#) & U (16#631#);
            elsif Locale = "hi" then
               return U (16#915#) & U (16#930#) & U (16#94B#) & U (16#921#);
            elsif Locale in "ro" | "lt" | "sl" | "id" | "ms" | "eo"
              | "vi" | "sw" | "af" | "hu" | "sk"
            then
               return
                 (if Locale = "ro" then (if Count = 1 then "miliard" else "miliarde")
                  elsif Locale = "lt" then (if Count = 1 then "milijardas" else "milijardai")
                  elsif Locale = "sl" then (if Count = 1 then "milijarda" else "milijarde")
                  elsif Locale = "id" or else Locale = "ms" then "miliar"
                  elsif Locale = "eo" then (if Count = 1 then "miliardo" else "miliardoj")
                  elsif Locale = "vi" then "ty"
                  elsif Locale = "sw" then "bilioni"
                  elsif Locale = "af" then "miljard"
                  elsif Locale = "hu" then "milliard"
                  else (if Count = 1 then "miliarda" else "miliardy"));
            else
               return "billion";
            end if;
         when 4 =>
            if Locale = "de" then
               return (if Count = 1 then "Billion" else "Billionen");
            elsif Locale = "fr" then
               return (if Count = 1 then "billion" else "billions");
            elsif Locale = "da" then
               return (if Count = 1 then "billion" else "billioner");
            elsif Locale = "es" then
               return (if Count = 1 then "bill" & U_O_Acute & "n" else "billones");
            elsif Locale = "it" then
               return (if Count = 1 then "bilione" else "bilioni");
            elsif Locale = "pt" then
               return
                 (if Count = 1
                  then "trilh" & U_A_Tilde & "o"
                  else "trilh" & U_O_Tilde & "es");
            elsif Locale = "nl" then
               return "biljoen";
            elsif Locale = "sv" then
               return (if Count = 1 then "biljon" else "biljoner");
            elsif Humanize.Locales.Is_Norwegian (Locale) then
               return (if Count = 1 then "billion" else "billioner");
            elsif Locale = "fi" then
               return (if Count = 1 then "biljoona" else "biljoonaa");
            elsif Locale = "tr" then
               return "trilyon";
            elsif Locale = "pl" then
               return (if Count = 1 then "bilion" else "biliony");
            elsif Locale = "cs" then
               return (if Count = 1 then "bilion" else "biliony");
            elsif Locale = "ru" then
               return U (16#442#) & U (16#440#) & U (16#438#) & U (16#43B#) & U (16#43B#) & U (16#438#) & U (16#43E#) & U (16#43D#);
            elsif Locale = "uk" then
               return U (16#442#) & U (16#440#) & U (16#438#) & U (16#43B#) & U (16#44C#) & U (16#439#) & U (16#43E#) & U (16#43D#);
            elsif Locale = "ja" or else Locale = "zh" then
               return U (16#5146#);
            elsif Locale = "ko" then
               return U (16#C870#);
            elsif Locale = "ar" then
               return U (16#62A#) & U (16#631#) & U (16#64A#) & U (16#644#) & U (16#64A#) & U (16#648#) & U (16#646#);
            elsif Locale = "hi" then
               return U (16#916#) & U (16#930#) & U (16#92C#);
            elsif Locale in "ro" | "lt" | "sl" | "id" | "ms" | "eo"
              | "vi" | "sw" | "af" | "hu" | "sk"
            then
               return
                 (if Locale = "ro" then (if Count = 1 then "bilion" else "bilioane")
                  elsif Locale = "lt" then (if Count = 1 then "bilijonas" else "bilijonai")
                  elsif Locale = "sl" then (if Count = 1 then "bilijon" else "bilijoni")
                  elsif Locale = "id" or else Locale = "ms" then "triliun"
                  elsif Locale = "eo" then (if Count = 1 then "duiliono" else "duilionoj")
                  elsif Locale = "vi" then "nghin ty"
                  elsif Locale = "sw" then "trilioni"
                  elsif Locale = "af" then "biljoen"
                  elsif Locale = "hu" then "billio"
                  else (if Count = 1 then "bilion" else "biliony"));
            else
               return "trillion";
            end if;
         when 5 =>
            if Locale = "de" then
               return (if Count = 1 then "Billiarde" else "Billiarden");
            elsif Locale = "fr" then
               return (if Count = 1 then "billiard" else "billiards");
            elsif Locale = "da" then
               return (if Count = 1 then "billiard" else "billiarder");
            elsif Locale = "es" then
               return "mil billones";
            elsif Locale = "it" then
               return (if Count = 1 then "biliardo" else "biliardi");
            elsif Locale = "pt" then
               return
                 (if Count = 1
                  then "quatrilh" & U_A_Tilde & "o"
                  else "quatrilh" & U_O_Tilde & "es");
            elsif Locale = "nl" then
               return "biljard";
            elsif Locale = "sv" then
               return (if Count = 1 then "biljard" else "biljarder");
            elsif Humanize.Locales.Is_Norwegian (Locale) then
               return (if Count = 1 then "billiard" else "billiarder");
            elsif Locale = "fi" then
               return (if Count = 1 then "biljardi" else "biljardia");
            elsif Locale = "tr" then
               return "katrilyon";
            else
               return "quadrillion";
            end if;
         when others =>
            return Scale_Name (Scale);
      end case;
   end Locale_Scale_Word;

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
   is
      type Segment_Array is array (Positive range <>) of Natural;
      Segments : Segment_Array (1 .. 6) := [others => 0];
      Length   : Natural := 0;
      Rest     : Long_Long_Integer := Value;
      Result   : Unbounded_String;
   begin
      if Humanize.Locales.Is_CJK (Locale) then
         declare
            type Segment_Array is array (Positive range <>) of Natural;
            Segments : Segment_Array (1 .. 3) := [others => 0];
            Length   : Natural := 0;
            Rest     : Long_Long_Integer := Value;
            Text     : Unbounded_String;
         begin
            if Value <= 9_999 then
               return Locale_CJK_Group_Word (Locale, Natural (Value));
            elsif Value > 999_999_999_999 then
               return "";
            end if;

            while Rest > 0 and then Length < Segments'Length loop
               Length := Length + 1;
               Segments (Length) := Natural (Rest mod 10_000);
               Rest := Rest / 10_000;
            end loop;

            for Index in reverse 1 .. Length loop
               if Segments (Index) /= 0 then
                  if Index > 1 and then Segments (Index) = 1 then
                     Append
                       (Text, Locale_CJK_Myriad_Scale_Word (Locale, Index - 1));
                  else
                     Append (Text, Locale_CJK_Group_Word (Locale, Segments (Index)));
                     if Index > 1 then
                        Append
                          (Text,
                           Locale_CJK_Myriad_Scale_Word (Locale, Index - 1));
                     end if;
                  end if;
               end if;
            end loop;

            return To_String (Text);
         end;
      end if;

      if Value <= 999 then
         return Locale_Hundred_Word (Locale, Natural (Value));
      elsif Value > 999_999_999_999_999_999 then
         return "";
      end if;

      while Rest > 0 and then Length < Segments'Length loop
         Length := Length + 1;
         Segments (Length) := Natural (Rest mod 1_000);
         Rest := Rest / 1_000;
      end loop;

      for Index in reverse 1 .. Length loop
         if Segments (Index) /= 0 then
            if Ada.Strings.Unbounded.Length (Result) > 0 then
               if Locale = "de" and then Index = 1
                 and then Length >= 2 and then Segments (2) /= 0
               then
                  null;
               else
                  Append (Result, " ");
               end if;
            end if;
            if Index = 2 and then Segments (Index) = 1
              and then
                (Locale in "de" | "fr" | "da" | "es" | "it" | "pt" | "nl"
                 or else Locale = "sv" or else Humanize.Locales.Is_Norwegian (Locale)
                 or else Locale = "fi" or else Locale = "tr"
                 or else Has_Generated_Spellout (Locale))
            then
               if Locale = "de" then
                  Append (Result, "eintausend");
               elsif Locale = "da" then
                  Append (Result, "et " & Locale_Scale_Word (Locale, 1, 1));
               elsif Locale = "sv" then
                  Append (Result, "ett " & Locale_Scale_Word (Locale, 1, 1));
               elsif Humanize.Locales.Is_Norwegian (Locale) then
                  Append (Result, "ett " & Locale_Scale_Word (Locale, 1, 1));
               elsif Locale = "fi" then
                  Append (Result, Locale_Scale_Word (Locale, 1, 1));
               elsif Locale = "tr" then
                  Append (Result, Locale_Scale_Word (Locale, 1, 1));
               elsif Has_Generated_Spellout (Locale) then
                  Append (Result, Locale_Scale_Word (Locale, 1, 1));
               elsif Locale = "fr" or else Locale = "es"
                 or else Locale = "it" or else Locale = "pt"
                 or else Locale = "nl"
               then
                  Append (Result, Locale_Scale_Word (Locale, 1, 1));
               end if;
            elsif Index > 2 and then Segments (Index) = 1
              and then Locale = "de"
            then
               Append (Result, "eine " & Locale_Scale_Word (Locale, Index - 1, 1));
            elsif Index > 2 and then Segments (Index) = 1
              and then Locale in "es" | "it"
            then
               Append
                 (Result,
                  (if Locale = "es" and then (Index - 1 = 3 or else Index - 1 = 5)
                   then ""
                   else "un ")
                  & Locale_Scale_Word (Locale, Index - 1, 1));
            elsif Index = 2 and then Locale in "de" | "it" | "nl" then
               Append
                 (Result,
                  Locale_Hundred_Word (Locale, Segments (Index))
                  & Locale_Scale_Word (Locale, 1, Segments (Index)));
            elsif Locale = "de" and then Index = 2 and then Segments (Index) = 1 then
               Append (Result, "eintausend");
            else
               Append (Result, Locale_Hundred_Word (Locale, Segments (Index)));
               if Index > 1 then
                  Append
                    (Result,
                     " " & Locale_Scale_Word
                       (Locale, Index - 1, Segments (Index)));
               end if;
            end if;
         end if;
      end loop;

      return To_String (Result);
   end Locale_Long_Word;

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
