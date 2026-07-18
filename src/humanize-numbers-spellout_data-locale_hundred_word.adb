--  Provenance: generated from Humanize spellout tables; split shard: locale spellout hundred words.

separate (Humanize.Numbers.Spellout_Data)
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
