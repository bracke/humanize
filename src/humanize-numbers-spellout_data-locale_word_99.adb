--  Provenance: generated from Humanize spellout tables; split shard: locale spellout words below one hundred.

separate (Humanize.Numbers.Spellout_Data)
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
