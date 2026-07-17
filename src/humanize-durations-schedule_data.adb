with Humanize.Bounded_Text;

package body Humanize.Durations.Schedule_Data is

   --  Provenance: Humanize-owned deterministic schedule metadata maintained
   --  in source. Keep currentness notes in docs/QUALITY_GUARDS.md.

   function No_Space (Image : String) return String
      renames Humanize.Bounded_Text.No_Space;

   function U (Code : Natural) return String
      renames Humanize.Bounded_Text.UTF8_Code_Point;

   function Two_Digits (Value : Natural) return String is
      Tens : constant Natural := (Value / 10) mod 10;
      Ones : constant Natural := Value mod 10;
   begin
      return
        String'
          (1 => Character'Val (Character'Pos ('0') + Tens),
           2 => Character'Val (Character'Pos ('0') + Ones));
   end Two_Digits;

   function Is_Norwegian (Locale : String) return Boolean is
     (Locale = "no" or else Locale = "nb");

   pragma Style_Checks (Off);

   function Weekday_Name
     (Locale  : String;
      Weekday : Natural)
      return String
   is
   begin
      if Locale = "da" or else Is_Norwegian (Locale) then
         case Weekday is
            when 1 => return "mandag";
            when 2 => return "tirsdag";
            when 3 => return "onsdag";
            when 4 => return "torsdag";
            when 5 => return "fredag";
            when 6 => return "l" & U (16#F8#) & "rdag";
            when 7 => return "s" & U (16#F8#) & "ndag";
            when others => return "";
         end case;
      elsif Locale = "de" then
         case Weekday is
            when 1 => return "Montag";
            when 2 => return "Dienstag";
            when 3 => return "Mittwoch";
            when 4 => return "Donnerstag";
            when 5 => return "Freitag";
            when 6 => return "Samstag";
            when 7 => return "Sonntag";
            when others => return "";
         end case;
      elsif Locale = "fr" then
         case Weekday is
            when 1 => return "lundi";
            when 2 => return "mardi";
            when 3 => return "mercredi";
            when 4 => return "jeudi";
            when 5 => return "vendredi";
            when 6 => return "samedi";
            when 7 => return "dimanche";
            when others => return "";
         end case;
      elsif Locale = "es" then
         case Weekday is
            when 1 => return "lunes";
            when 2 => return "martes";
            when 3 => return "mi" & U (16#E9#) & "rcoles";
            when 4 => return "jueves";
            when 5 => return "viernes";
            when 6 => return "s" & U (16#E1#) & "bado";
            when 7 => return "domingo";
            when others => return "";
         end case;
      elsif Locale = "it" then
         case Weekday is
            when 1 => return "luned" & U (16#EC#);
            when 2 => return "marted" & U (16#EC#);
            when 3 => return "mercoled" & U (16#EC#);
            when 4 => return "gioved" & U (16#EC#);
            when 5 => return "venerd" & U (16#EC#);
            when 6 => return "sabato";
            when 7 => return "domenica";
            when others => return "";
         end case;
      elsif Locale = "pt" then
         case Weekday is
            when 1 => return "segunda-feira";
            when 2 => return "ter" & U (16#E7#) & "a-feira";
            when 3 => return "quarta-feira";
            when 4 => return "quinta-feira";
            when 5 => return "sexta-feira";
            when 6 => return "s" & U (16#E1#) & "bado";
            when 7 => return "domingo";
            when others => return "";
         end case;
      elsif Locale = "nl" then
         case Weekday is
            when 1 => return "maandag";
            when 2 => return "dinsdag";
            when 3 => return "woensdag";
            when 4 => return "donderdag";
            when 5 => return "vrijdag";
            when 6 => return "zaterdag";
            when 7 => return "zondag";
            when others => return "";
         end case;
      elsif Locale = "sv" then
         case Weekday is
            when 1 => return "m" & U (16#E5#) & "ndag";
            when 2 => return "tisdag";
            when 3 => return "onsdag";
            when 4 => return "torsdag";
            when 5 => return "fredag";
            when 6 => return "l" & U (16#F6#) & "rdag";
            when 7 => return "s" & U (16#F6#) & "ndag";
            when others => return "";
         end case;
      elsif Locale = "fi" then
         case Weekday is
            when 1 => return "maanantai";
            when 2 => return "tiistai";
            when 3 => return "keskiviikko";
            when 4 => return "torstai";
            when 5 => return "perjantai";
            when 6 => return "lauantai";
            when 7 => return "sunnuntai";
            when others => return "";
         end case;
      elsif Locale = "pl" then
         case Weekday is
            when 1 => return "poniedzia" & U (16#142#) & "ek";
            when 2 => return "wtorek";
            when 3 => return U (16#15B#) & "roda";
            when 4 => return "czwartek";
            when 5 => return "pi" & U (16#105#) & "tek";
            when 6 => return "sobota";
            when 7 => return "niedziela";
            when others => return "";
         end case;
      elsif Locale = "cs" then
         case Weekday is
            when 1 => return "pond" & U (16#11B#) & "l" & U (16#ED#);
            when 2 => return U (16#FA#) & "ter" & U (16#FD#);
            when 3 => return "st" & U (16#159#) & "eda";
            when 4 => return U (16#10D#) & "tvrtek";
            when 5 => return "p" & U (16#E1#) & "tek";
            when 6 => return "sobota";
            when 7 => return "ned" & U (16#11B#) & "le";
            when others => return "";
         end case;
      elsif Locale = "tr" then
         case Weekday is
            when 1 => return "Pazartesi";
            when 2 => return "Sal" & U (16#131#);
            when 3 => return U (16#C7#) & "ar" & U (16#15F#) & "amba";
            when 4 => return "Per" & U (16#15F#) & "embe";
            when 5 => return "Cuma";
            when 6 => return "Cumartesi";
            when 7 => return "Pazar";
            when others => return "";
         end case;
      elsif Locale = "ru" then
         case Weekday is
            when 1 => return U (16#43F#) & U (16#43E#) & U (16#43D#) & U (16#435#) & U (16#434#) & U (16#435#) & U (16#43B#) & U (16#44C#) & U (16#43D#) & U (16#438#) & U (16#43A#);
            when 2 => return U (16#432#) & U (16#442#) & U (16#43E#) & U (16#440#) & U (16#43D#) & U (16#438#) & U (16#43A#);
            when 3 => return U (16#441#) & U (16#440#) & U (16#435#) & U (16#434#) & U (16#430#);
            when 4 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#432#) & U (16#435#) & U (16#440#) & U (16#433#);
            when 5 => return U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#43D#) & U (16#438#) & U (16#446#) & U (16#430#);
            when 6 => return U (16#441#) & U (16#443#) & U (16#431#) & U (16#431#) & U (16#43E#) & U (16#442#) & U (16#430#);
            when 7 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#43A#) & U (16#440#) & U (16#435#) & U (16#441#) & U (16#435#) & U (16#43D#) & U (16#44C#) & U (16#435#);
            when others => return "";
         end case;
      elsif Locale = "uk" then
         case Weekday is
            when 1 => return U (16#43F#) & U (16#43E#) & U (16#43D#) & U (16#435#) & U (16#434#) & U (16#456#) & U (16#43B#) & U (16#43E#) & U (16#43A#);
            when 2 => return U (16#432#) & U (16#456#) & U (16#432#) & U (16#442#) & U (16#43E#) & U (16#440#) & U (16#43E#) & U (16#43A#);
            when 3 => return U (16#441#) & U (16#435#) & U (16#440#) & U (16#435#) & U (16#434#) & U (16#430#);
            when 4 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#432#) & U (16#435#) & U (16#440#);
            when 5 => return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#43D#) & U (16#438#) & U (16#446#) & U (16#44F#);
            when 6 => return U (16#441#) & U (16#443#) & U (16#431#) & U (16#43E#) & U (16#442#) & U (16#430#);
            when 7 => return U (16#43D#) & U (16#435#) & U (16#434#) & U (16#456#) & U (16#43B#) & U (16#44F#);
            when others => return "";
         end case;
      elsif Locale = "ja" then
         case Weekday is
            when 1 => return U (16#6708#) & U (16#66DC#) & U (16#65E5#);
            when 2 => return U (16#706B#) & U (16#66DC#) & U (16#65E5#);
            when 3 => return U (16#6C34#) & U (16#66DC#) & U (16#65E5#);
            when 4 => return U (16#6728#) & U (16#66DC#) & U (16#65E5#);
            when 5 => return U (16#91D1#) & U (16#66DC#) & U (16#65E5#);
            when 6 => return U (16#571F#) & U (16#66DC#) & U (16#65E5#);
            when 7 => return U (16#65E5#) & U (16#66DC#) & U (16#65E5#);
            when others => return "";
         end case;
      elsif Locale = "ko" then
         case Weekday is
            when 1 => return U (16#C6D4#) & U (16#C694#) & U (16#C77C#);
            when 2 => return U (16#D654#) & U (16#C694#) & U (16#C77C#);
            when 3 => return U (16#C218#) & U (16#C694#) & U (16#C77C#);
            when 4 => return U (16#BAA9#) & U (16#C694#) & U (16#C77C#);
            when 5 => return U (16#AE08#) & U (16#C694#) & U (16#C77C#);
            when 6 => return U (16#D1A0#) & U (16#C694#) & U (16#C77C#);
            when 7 => return U (16#C77C#) & U (16#C694#) & U (16#C77C#);
            when others => return "";
         end case;
      elsif Locale = "zh" then
         case Weekday is
            when 1 => return U (16#661F#) & U (16#671F#) & U (16#4E00#);
            when 2 => return U (16#661F#) & U (16#671F#) & U (16#4E8C#);
            when 3 => return U (16#661F#) & U (16#671F#) & U (16#4E09#);
            when 4 => return U (16#661F#) & U (16#671F#) & U (16#56DB#);
            when 5 => return U (16#661F#) & U (16#671F#) & U (16#4E94#);
            when 6 => return U (16#661F#) & U (16#671F#) & U (16#516D#);
            when 7 => return U (16#661F#) & U (16#671F#) & U (16#65E5#);
            when others => return "";
         end case;
      elsif Locale = "ar" then
         case Weekday is
            when 1 => return U (16#627#) & U (16#644#) & U (16#627#) & U (16#62B#) & U (16#646#) & U (16#64A#) & U (16#646#);
            when 2 => return U (16#627#) & U (16#644#) & U (16#62B#) & U (16#644#) & U (16#627#) & U (16#62B#) & U (16#627#) & U (16#621#);
            when 3 => return U (16#627#) & U (16#644#) & U (16#623#) & U (16#631#) & U (16#628#) & U (16#639#) & U (16#627#) & U (16#621#);
            when 4 => return U (16#627#) & U (16#644#) & U (16#62E#) & U (16#645#) & U (16#64A#) & U (16#633#);
            when 5 => return U (16#627#) & U (16#644#) & U (16#62C#) & U (16#645#) & U (16#639#) & U (16#629#);
            when 6 => return U (16#627#) & U (16#644#) & U (16#633#) & U (16#628#) & U (16#62A#);
            when 7 => return U (16#627#) & U (16#644#) & U (16#623#) & U (16#62D#) & U (16#62F#);
            when others => return "";
         end case;
      elsif Locale = "hi" then
         case Weekday is
            when 1 => return U (16#938#) & U (16#94B#) & U (16#92E#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when 2 => return U (16#92E#) & U (16#902#) & U (16#917#) & U (16#932#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when 3 => return U (16#92C#) & U (16#941#) & U (16#927#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when 4 => return U (16#917#) & U (16#941#) & U (16#930#) & U (16#941#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when 5 => return U (16#936#) & U (16#941#) & U (16#915#) & U (16#94D#) & U (16#930#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when 6 => return U (16#936#) & U (16#928#) & U (16#93F#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when 7 => return U (16#930#) & U (16#935#) & U (16#93F#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when others => return "";
         end case;
      else
         case Weekday is
            when 1 => return "Monday";
            when 2 => return "Tuesday";
            when 3 => return "Wednesday";
            when 4 => return "Thursday";
            when 5 => return "Friday";
            when 6 => return "Saturday";
            when 7 => return "Sunday";
            when others => return "";
         end case;
      end if;
   end Weekday_Name;

   pragma Style_Checks (On);

   function Ordinal_Name
     (Locale  : String;
      Ordinal : Integer)
      return String
   is
   begin
      if Locale = "da" or else Is_Norwegian (Locale) then
         case Ordinal is
            when -1 => return "sidste";
            when 1 => return "f" & U (16#F8#) & "rste";
            when 2 => return "anden";
            when 3 => return "tredje";
            when 4 => return "fjerde";
            when 5 => return "femte";
            when others => return "";
         end case;
      elsif Locale = "de" then
         case Ordinal is
            when -1 => return "letzter";
            when 1 => return "erster";
            when 2 => return "zweiter";
            when 3 => return "dritter";
            when 4 => return "vierter";
            when 5 => return "f" & U (16#FC#) & "nfter";
            when others => return "";
         end case;
      elsif Locale = "fr" then
         case Ordinal is
            when -1 => return "dernier";
            when 1 => return "premier";
            when 2 => return "deuxi" & U (16#E8#) & "me";
            when 3 => return "troisi" & U (16#E8#) & "me";
            when 4 => return "quatri" & U (16#E8#) & "me";
            when 5 => return "cinqui" & U (16#E8#) & "me";
            when others => return "";
         end case;
      elsif Locale = "es" then
         case Ordinal is
            when -1 => return U (16#FA#) & "ltimo";
            when 1 => return "primer";
            when 2 => return "segundo";
            when 3 => return "tercer";
            when 4 => return "cuarto";
            when 5 => return "quinto";
            when others => return "";
         end case;
      elsif Locale = "it" then
         case Ordinal is
            when -1 => return "ultimo";
            when 1 => return "primo";
            when 2 => return "secondo";
            when 3 => return "terzo";
            when 4 => return "quarto";
            when 5 => return "quinto";
            when others => return "";
         end case;
      elsif Locale = "pt" then
         case Ordinal is
            when -1 => return U (16#FA#) & "ltimo";
            when 1 => return "primeiro";
            when 2 => return "segundo";
            when 3 => return "terceiro";
            when 4 => return "quarto";
            when 5 => return "quinto";
            when others => return "";
         end case;
      elsif Locale = "nl" then
         case Ordinal is
            when -1 => return "laatste";
            when 1 => return "eerste";
            when 2 => return "tweede";
            when 3 => return "derde";
            when 4 => return "vierde";
            when 5 => return "vijfde";
            when others => return "";
         end case;
      elsif Locale = "sv" then
         case Ordinal is
            when -1 => return "sista";
            when 1 => return "f" & U (16#F6#) & "rsta";
            when 2 => return "andra";
            when 3 => return "tredje";
            when 4 => return "fj" & U (16#E4#) & "rde";
            when 5 => return "femte";
            when others => return "";
         end case;
      elsif Locale = "fi" then
         case Ordinal is
            when -1 => return "viimeinen";
            when 1 => return "ensimm" & U (16#E4#) & "inen";
            when 2 => return "toinen";
            when 3 => return "kolmas";
            when 4 => return "nelj" & U (16#E4#) & "s";
            when 5 => return "viides";
            when others => return "";
         end case;
      elsif Locale = "pl" then
         case Ordinal is
            when -1 => return "ostatni";
            when 1 => return "pierwszy";
            when 2 => return "drugi";
            when 3 => return "trzeci";
            when 4 => return "czwarty";
            when 5 => return "pi" & U (16#105#) & "ty";
            when others => return "";
         end case;
      elsif Locale = "cs" then
         case Ordinal is
            when -1 => return "posledn" & U (16#ED#);
            when 1 => return "prvn" & U (16#ED#);
            when 2 => return "druh" & U (16#FD#);
            when 3 => return "t" & U (16#159#) & "et" & U (16#ED#);
            when 4 => return U (16#10D#) & "tvrt" & U (16#FD#);
            when 5 => return "p" & U (16#E1#) & "t" & U (16#FD#);
            when others => return "";
         end case;
      elsif Locale = "tr" then
         case Ordinal is
            when -1 => return "son";
            when 1 => return "birinci";
            when 2 => return "ikinci";
            when 3 => return U (16#FC#) & U (16#E7#) & U (16#FC#) & "nc" & U (16#FC#);
            when 4 => return "d" & U (16#F6#) & "rd" & U (16#FC#) & "nc" & U (16#FC#);
            when 5 => return "be" & U (16#15F#) & "inci";
            when others => return "";
         end case;
      elsif Locale = "ja" or else Locale = "zh" then
         if Ordinal = -1 then
            return U (16#6700#) & U (16#5F8C#);
         elsif Ordinal in 1 .. 5 then
            return U (16#7B2C#) & No_Space (Integer'Image (Ordinal));
         else
            return "";
         end if;
      elsif Locale = "ko" then
         if Ordinal = -1 then
            return U (16#B9C8#) & U (16#C9C0#) & U (16#B9C9#);
         elsif Ordinal in 1 .. 5 then
            return No_Space (Integer'Image (Ordinal)) & U (16#BC88#) & U (16#C9F8#);
         else
            return "";
         end if;
      elsif Locale = "ar" then
         case Ordinal is
            when -1 => return U (16#627#) & U (16#644#) & U (16#623#) & U (16#62E#) & U (16#64A#) & U (16#631#);
            when 1 => return U (16#627#) & U (16#644#) & U (16#623#) & U (16#648#) & U (16#644#);
            when 2 => return U (16#627#) & U (16#644#) & U (16#62B#) & U (16#627#) & U (16#646#) & U (16#64A#);
            when 3 => return U (16#627#) & U (16#644#) & U (16#62B#) & U (16#627#) & U (16#644#) & U (16#62B#);
            when 4 => return U (16#627#) & U (16#644#) & U (16#631#) & U (16#627#) & U (16#628#) & U (16#639#);
            when 5 => return U (16#627#) & U (16#644#) & U (16#62E#) & U (16#627#) & U (16#645#) & U (16#633#);
            when others => return "";
         end case;
      elsif Locale = "hi" then
         case Ordinal is
            when -1 => return U (16#905#) & U (16#902#) & U (16#924#) & U (16#93F#) & U (16#92E#);
            when 1 => return U (16#92A#) & U (16#939#) & U (16#932#) & U (16#93E#);
            when 2 => return U (16#926#) & U (16#942#) & U (16#938#) & U (16#930#) & U (16#93E#);
            when 3 => return U (16#924#) & U (16#940#) & U (16#938#) & U (16#930#) & U (16#93E#);
            when 4 => return U (16#91A#) & U (16#94C#) & U (16#925#) & U (16#93E#);
            when 5 =>
               return U (16#92A#) & U (16#93E#) & U (16#901#)
                 & U (16#91A#) & U (16#935#) & U (16#93E#)
                 & U (16#901#);
            when others => return "";
         end case;
      end if;

      case Ordinal is
         when -1 => return "last";
         when 1 => return "first";
         when 2 => return "second";
         when 3 => return "third";
         when 4 => return "fourth";
         when 5 => return "fifth";
         when others => return "";
      end case;
   end Ordinal_Name;

   function Time_Label
     (Hour        : Natural;
      Minute      : Natural;
      Use_12_Hour : Boolean)
      return String
   is
   begin
      if Use_12_Hour then
         declare
            PM : constant Boolean := Hour >= 12;
            H  : constant Natural :=
              (if Hour mod 12 = 0 then 12 else Hour mod 12);
         begin
            return No_Space (Natural'Image (H)) & ":" & Two_Digits (Minute)
              & (if PM then " PM" else " AM");
         end;
      end if;

      return Two_Digits (Hour) & ":" & Two_Digits (Minute);
   end Time_Label;

   function Every_Phrase
     (Locale : String;
      Label  : String)
      return String
   is
   begin
      if Locale = "da" then
         return "hver " & Label;
      elsif Locale = "de" then
         return "jeden " & Label;
      elsif Locale = "fr" then
         return "chaque " & Label;
      elsif Locale = "es" or else Locale = "pt" then
         return "cada " & Label;
      elsif Locale = "it" then
         return "ogni " & Label;
      elsif Locale = "nl" then
         return "elke " & Label;
      elsif Locale = "sv" then
         return "varje " & Label;
      elsif Is_Norwegian (Locale) then
         return "hver " & Label;
      elsif Locale = "fi" then
         return "joka " & Label;
      elsif Locale = "pl" then
         return "ka" & U (16#17C#) & "dy " & Label;
      elsif Locale = "cs" then
         return "ka" & U (16#17E#) & "d" & U (16#FD#) & " " & Label;
      elsif Locale = "tr" then
         return "her " & Label;
      elsif Locale = "ro" then
         return "fiecare " & Label;
      elsif Locale = "lt" then
         return "kiekviena " & Label;
      elsif Locale = "sl" then
         return "vsak " & Label;
      elsif Locale = "id" or else Locale = "ms" then
         return "setiap " & Label;
      elsif Locale = "eo" then
         return "cxiu " & Label;
      elsif Locale = "vi" then
         return "moi " & Label;
      elsif Locale = "sw" then
         return "kila " & Label;
      elsif Locale = "af" then
         return "elke " & Label;
      elsif Locale = "hu" then
         return "minden " & Label;
      elsif Locale = "sk" then
         return "kazdy " & Label;
      elsif Locale = "ru" then
         return U (16#43A#) & U (16#430#) & U (16#436#) & U (16#434#) & U (16#44B#) & U (16#439#) & " " & Label;
      elsif Locale = "uk" then
         return U (16#43A#) & U (16#43E#) & U (16#436#) & U (16#435#) & U (16#43D#) & " " & Label;
      elsif Locale = "ja" or else Locale = "zh" then
         return U (16#6BCE#) & Label;
      elsif Locale = "ko" then
         return U (16#B9E4#) & U (16#C8FC#) & " " & Label;
      elsif Locale = "ar" then
         return U (16#643#) & U (16#644#) & " " & Label;
      elsif Locale = "hi" then
         return U (16#939#) & U (16#930#) & " " & Label;
      else
         return "every " & Label;
      end if;
   end Every_Phrase;

   function Schedule_Conjunction (Locale : String) return String is
   begin
      if Locale = "da" or else Is_Norwegian (Locale) then
         return "og";
      elsif Locale = "de" or else Locale = "nl" then
         return "und";
      elsif Locale = "fr" then
         return "et";
      elsif Locale = "es" then
         return "y";
      elsif Locale = "it" then
         return "e";
      elsif Locale = "pt" then
         return "e";
      elsif Locale = "sv" then
         return "och";
      elsif Locale = "fi" then
         return "ja";
      elsif Locale = "pl" then
         return "i";
      elsif Locale = "cs" then
         return "a";
      elsif Locale = "tr" then
         return "ve";
      elsif Locale = "ro" then
         return "si";
      elsif Locale = "lt" then
         return "ir";
      elsif Locale = "sl" then
         return "in";
      elsif Locale = "id" or else Locale = "ms" then
         return "dan";
      elsif Locale = "eo" then
         return "kaj";
      elsif Locale = "vi" then
         return "va";
      elsif Locale = "sw" then
         return "na";
      elsif Locale = "af" then
         return "en";
      elsif Locale = "hu" then
         return "es";
      elsif Locale = "sk" then
         return "a";
      elsif Locale = "ru" then
         return U (16#438#);
      elsif Locale = "uk" then
         return U (16#456#);
      elsif Locale = "ja" or else Locale = "zh" then
         return U (16#3068#);
      elsif Locale = "ko" then
         return U (16#BC0F#);
      elsif Locale = "ar" then
         return U (16#648#);
      elsif Locale = "hi" then
         return U (16#914#) & U (16#930#);
      else
         return "and";
      end if;
   end Schedule_Conjunction;

   function Business_Day_Label (Locale : String) return String is
   begin
      if Locale = "da" then
         return "hverdag";
      elsif Locale = "de" then
         return "Wochentag";
      elsif Locale = "fr" then
         return "jour ouvrable";
      elsif Locale = "es" then
         return "d" & U (16#ED#) & "a laborable";
      elsif Locale = "it" then
         return "giorno feriale";
      elsif Locale = "pt" then
         return "dia " & U (16#FA#) & "til";
      elsif Locale = "nl" then
         return "werkdag";
      elsif Locale = "sv" then
         return "vardag";
      elsif Is_Norwegian (Locale) then
         return "virkedag";
      elsif Locale = "fi" then
         return "arkip" & U (16#E4#) & "iv" & U (16#E4#);
      elsif Locale = "pl" then
         return "dzie" & U (16#144#) & " roboczy";
      elsif Locale = "cs" then
         return "pracovn" & U (16#ED#) & " den";
      elsif Locale = "tr" then
         return "i" & U (16#15F#) & " g" & U (16#FC#) & "n"
           & U (16#FC#);
      elsif Locale = "ro" then
         return "zi lucratoare";
      elsif Locale = "lt" then
         return "darbo diena";
      elsif Locale = "sl" then
         return "delovni dan";
      elsif Locale = "id" or else Locale = "ms" then
         return "hari kerja";
      elsif Locale = "eo" then
         return "labortago";
      elsif Locale = "vi" then
         return "ngay lam viec";
      elsif Locale = "sw" then
         return "siku ya kazi";
      elsif Locale = "af" then
         return "werksdag";
      elsif Locale = "hu" then
         return "munkanap";
      elsif Locale = "sk" then
         return "pracovny den";
      elsif Locale = "ru" then
         return U (16#440#) & U (16#430#) & U (16#431#)
           & U (16#43E#) & U (16#447#) & U (16#438#)
           & U (16#439#) & " " & U (16#434#) & U (16#435#)
           & U (16#43D#) & U (16#44C#);
      elsif Locale = "uk" then
         return U (16#440#) & U (16#43E#) & U (16#431#)
           & U (16#43E#) & U (16#447#) & U (16#438#)
           & U (16#439#) & " " & U (16#434#) & U (16#435#)
           & U (16#43D#) & U (16#44C#);
      elsif Locale = "ja" then
         return U (16#55B6#) & U (16#696D#) & U (16#65E5#);
      elsif Locale = "ko" then
         return U (16#C601#) & U (16#C5C5#) & U (16#C77C#);
      elsif Locale = "zh" then
         return U (16#5DE5#) & U (16#4F5C#) & U (16#65E5#);
      elsif Locale = "ar" then
         return U (16#64A#) & U (16#648#) & U (16#645#) & " " & U (16#639#) & U (16#645#) & U (16#644#);
      elsif Locale = "hi" then
         return U (16#915#) & U (16#93E#) & U (16#930#)
           & U (16#94D#) & U (16#92F#) & U (16#926#)
           & U (16#93F#) & U (16#935#) & U (16#938#);
      else
         return "business day";
      end if;
   end Business_Day_Label;

   pragma Style_Checks (Off);

   function Schedule_Unit_Name
     (Locale : String;
      Unit   : Recurrence_Unit;
      Count  : Positive)
      return String
   is
      pragma Unreferenced (Count);
   begin
      if Locale = "da" then
         case Unit is
            when Every_Second => return "sekund";
            when Every_Minute => return "minut";
            when Every_Hour => return "time";
            when Every_Day => return "dag";
            when Every_Week => return "uge";
            when Every_Month => return "m" & U (16#E5#) & "ned";
            when Every_Quarter => return "kvartal";
            when Every_Year => return U (16#E5#) & "r";
         end case;
      elsif Locale = "de" then
         case Unit is
            when Every_Second => return "Sekunde";
            when Every_Minute => return "Minute";
            when Every_Hour => return "Stunde";
            when Every_Day => return "Tag";
            when Every_Week => return "Woche";
            when Every_Month => return "Monat";
            when Every_Quarter => return "Quartal";
            when Every_Year => return "Jahr";
         end case;
      elsif Locale = "fr" then
         case Unit is
            when Every_Second => return "seconde";
            when Every_Minute => return "minute";
            when Every_Hour => return "heure";
            when Every_Day => return "jour";
            when Every_Week => return "semaine";
            when Every_Month => return "mois";
            when Every_Quarter => return "trimestre";
            when Every_Year => return "an";
         end case;
      elsif Locale = "es" then
         case Unit is
            when Every_Second => return "segundo";
            when Every_Minute => return "minuto";
            when Every_Hour => return "hora";
            when Every_Day => return "d" & U (16#ED#) & "a";
            when Every_Week => return "semana";
            when Every_Month => return "mes";
            when Every_Quarter => return "trimestre";
            when Every_Year => return "a" & U (16#F1#) & "o";
         end case;
      elsif Locale = "it" then
         case Unit is
            when Every_Second => return "secondo";
            when Every_Minute => return "minuto";
            when Every_Hour => return "ora";
            when Every_Day => return "giorno";
            when Every_Week => return "settimana";
            when Every_Month => return "mese";
            when Every_Quarter => return "trimestre";
            when Every_Year => return "anno";
         end case;
      elsif Locale = "pt" then
         case Unit is
            when Every_Second => return "segundo";
            when Every_Minute => return "minuto";
            when Every_Hour => return "hora";
            when Every_Day => return "dia";
            when Every_Week => return "semana";
            when Every_Month => return "m" & U (16#EA#) & "s";
            when Every_Quarter => return "trimestre";
            when Every_Year => return "ano";
         end case;
      elsif Locale = "nl" then
         case Unit is
            when Every_Second => return "seconde";
            when Every_Minute => return "minuut";
            when Every_Hour => return "uur";
            when Every_Day => return "dag";
            when Every_Week => return "week";
            when Every_Month => return "maand";
            when Every_Quarter => return "kwartaal";
            when Every_Year => return "jaar";
         end case;
      elsif Locale = "sv" or else Is_Norwegian (Locale) then
         case Unit is
            when Every_Second => return "sekund";
            when Every_Minute => return "minut";
            when Every_Hour => return "time";
            when Every_Day => return "dag";
            when Every_Week => return "uke";
            when Every_Month => return "m" & U (16#E5#) & "ned";
            when Every_Quarter => return "kvartal";
            when Every_Year => return U (16#E5#) & "r";
         end case;
      elsif Locale = "fi" then
         case Unit is
            when Every_Second => return "sekunti";
            when Every_Minute => return "minuutti";
            when Every_Hour => return "tunti";
            when Every_Day => return "p" & U (16#E4#) & "iv" & U (16#E4#);
            when Every_Week => return "viikko";
            when Every_Month => return "kuukausi";
            when Every_Quarter => return "nelj" & U (16#E4#) & "nnes";
            when Every_Year => return "vuosi";
         end case;
      elsif Locale = "pl" then
         case Unit is
            when Every_Second => return "sekunda";
            when Every_Minute => return "minuta";
            when Every_Hour => return "godzina";
            when Every_Day => return "dzie" & U (16#144#);
            when Every_Week => return "tydzie" & U (16#144#);
            when Every_Month => return "miesi" & U (16#105#) & "c";
            when Every_Quarter => return "kwarta" & U (16#142#);
            when Every_Year => return "rok";
         end case;
      elsif Locale = "cs" then
         case Unit is
            when Every_Second => return "sekunda";
            when Every_Minute => return "minuta";
            when Every_Hour => return "hodina";
            when Every_Day => return "den";
            when Every_Week => return "t" & U (16#FD#) & "den";
            when Every_Month => return "m" & U (16#11B#) & "s" & U (16#ED#) & "c";
            when Every_Quarter => return U (16#10D#) & "tvrtlet" & U (16#ED#);
            when Every_Year => return "rok";
         end case;
      elsif Locale = "tr" then
         case Unit is
            when Every_Second => return "saniye";
            when Every_Minute => return "dakika";
            when Every_Hour => return "saat";
            when Every_Day => return "g" & U (16#FC#) & "n";
            when Every_Week => return "hafta";
            when Every_Month => return "ay";
            when Every_Quarter => return U (16#E7#) & "eyrek";
            when Every_Year => return "y" & U (16#131#) & "l";
         end case;
      elsif Locale = "ru" then
         case Unit is
            when Every_Second => return U (16#441#) & U (16#435#) & U (16#43A#) & U (16#443#) & U (16#43D#) & U (16#434#) & U (16#430#);
            when Every_Minute => return U (16#43C#) & U (16#438#) & U (16#43D#) & U (16#443#) & U (16#442#) & U (16#430#);
            when Every_Hour => return U (16#447#) & U (16#430#) & U (16#441#);
            when Every_Day => return U (16#434#) & U (16#435#) & U (16#43D#) & U (16#44C#);
            when Every_Week => return U (16#43D#) & U (16#435#) & U (16#434#) & U (16#435#) & U (16#43B#) & U (16#44F#);
            when Every_Month => return U (16#43C#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#446#);
            when Every_Quarter => return U (16#43A#) & U (16#432#) & U (16#430#) & U (16#440#) & U (16#442#) & U (16#430#) & U (16#43B#);
            when Every_Year => return U (16#433#) & U (16#43E#) & U (16#434#);
         end case;
      elsif Locale = "uk" then
         case Unit is
            when Every_Second => return U (16#441#) & U (16#435#) & U (16#43A#) & U (16#443#) & U (16#43D#) & U (16#434#) & U (16#430#);
            when Every_Minute => return U (16#445#) & U (16#432#) & U (16#438#) & U (16#43B#) & U (16#438#) & U (16#43D#) & U (16#430#);
            when Every_Hour => return U (16#433#) & U (16#43E#) & U (16#434#) & U (16#438#) & U (16#43D#) & U (16#430#);
            when Every_Day => return U (16#434#) & U (16#435#) & U (16#43D#) & U (16#44C#);
            when Every_Week => return U (16#442#) & U (16#438#) & U (16#436#) & U (16#434#) & U (16#435#) & U (16#43D#) & U (16#44C#);
            when Every_Month => return U (16#43C#) & U (16#456#) & U (16#441#) & U (16#44F#) & U (16#446#) & U (16#44C#);
            when Every_Quarter => return U (16#43A#) & U (16#432#) & U (16#430#) & U (16#440#) & U (16#442#) & U (16#430#) & U (16#43B#);
            when Every_Year => return U (16#440#) & U (16#456#) & U (16#43A#);
         end case;
      elsif Locale = "ja" then
         case Unit is
            when Every_Second => return U (16#79D2#);
            when Every_Minute => return U (16#5206#);
            when Every_Hour => return U (16#6642#) & U (16#9593#);
            when Every_Day => return U (16#65E5#);
            when Every_Week => return U (16#9031#);
            when Every_Month => return U (16#6708#);
            when Every_Quarter => return U (16#56DB#) & U (16#534A#) & U (16#671F#);
            when Every_Year => return U (16#5E74#);
         end case;
      elsif Locale = "ko" then
         case Unit is
            when Every_Second => return U (16#CD08#);
            when Every_Minute => return U (16#BD84#);
            when Every_Hour => return U (16#C2DC#) & U (16#AC04#);
            when Every_Day => return U (16#C77C#);
            when Every_Week => return U (16#C8FC#);
            when Every_Month => return U (16#C6D4#);
            when Every_Quarter => return U (16#BD84#) & U (16#AE30#);
            when Every_Year => return U (16#B144#);
         end case;
      elsif Locale = "zh" then
         case Unit is
            when Every_Second => return U (16#79D2#);
            when Every_Minute => return U (16#5206#) & U (16#949F#);
            when Every_Hour => return U (16#5C0F#) & U (16#65F6#);
            when Every_Day => return U (16#5929#);
            when Every_Week => return U (16#5468#);
            when Every_Month => return U (16#6708#);
            when Every_Quarter => return U (16#5B63#) & U (16#5EA6#);
            when Every_Year => return U (16#5E74#);
         end case;
      elsif Locale = "ar" then
         case Unit is
            when Every_Second => return U (16#62B#) & U (16#627#) & U (16#646#) & U (16#64A#) & U (16#629#);
            when Every_Minute => return U (16#62F#) & U (16#642#) & U (16#64A#) & U (16#642#) & U (16#629#);
            when Every_Hour => return U (16#633#) & U (16#627#) & U (16#639#) & U (16#629#);
            when Every_Day => return U (16#64A#) & U (16#648#) & U (16#645#);
            when Every_Week => return U (16#623#) & U (16#633#) & U (16#628#) & U (16#648#) & U (16#639#);
            when Every_Month => return U (16#634#) & U (16#647#) & U (16#631#);
            when Every_Quarter => return U (16#631#) & U (16#628#) & U (16#639#);
            when Every_Year => return U (16#633#) & U (16#646#) & U (16#629#);
         end case;
      elsif Locale = "hi" then
         case Unit is
            when Every_Second => return U (16#938#) & U (16#947#) & U (16#915#) & U (16#902#) & U (16#921#);
            when Every_Minute => return U (16#92E#) & U (16#93F#) & U (16#928#) & U (16#91F#);
            when Every_Hour => return U (16#918#) & U (16#902#) & U (16#91F#) & U (16#93E#);
            when Every_Day => return U (16#926#) & U (16#93F#) & U (16#928#);
            when Every_Week => return U (16#938#) & U (16#92A#) & U (16#94D#) & U (16#924#) & U (16#93E#) & U (16#939#);
            when Every_Month => return U (16#92E#) & U (16#939#) & U (16#940#) & U (16#928#) & U (16#93E#);
            when Every_Quarter => return U (16#924#) & U (16#93F#) & U (16#92E#) & U (16#93E#) & U (16#939#) & U (16#940#);
            when Every_Year => return U (16#935#) & U (16#930#) & U (16#94D#) & U (16#937#);
         end case;
      else
         case Unit is
            when Every_Second => return "second";
            when Every_Minute => return "minute";
            when Every_Hour => return "hour";
            when Every_Day => return "day";
            when Every_Week => return "week";
            when Every_Month => return "month";
            when Every_Quarter => return "quarter";
            when Every_Year => return "year";
         end case;
      end if;
   end Schedule_Unit_Name;

   pragma Style_Checks (On);

end Humanize.Durations.Schedule_Data;
