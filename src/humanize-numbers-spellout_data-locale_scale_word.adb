--  Provenance: generated from Humanize spellout tables; split shard: locale spellout scale words.

separate (Humanize.Numbers.Spellout_Data)
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
