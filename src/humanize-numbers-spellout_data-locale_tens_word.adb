--  Provenance: generated from Humanize spellout tables; split shard: locale tens spellout words.

separate (Humanize.Numbers.Spellout_Data)
function Locale_Tens_Word
     (Locale : String;
      Tens   : Natural)
      return String
   is
   begin
      if Locale = "de" then
         case Tens is
            when 2 => return "zwanzig";
            when 3 => return "drei" & U_Sharp_S & "ig";
            when 4 => return "vierzig";
            when 5 => return "f" & U_U_Umlaut & "nfzig";
            when 6 => return "sechzig";
            when 7 => return "siebzig";
            when 8 => return "achtzig";
            when 9 => return "neunzig";
            when others => return "";
         end case;
      elsif Locale = "fr" then
         case Tens is
            when 2 => return "vingt";
            when 3 => return "trente";
            when 4 => return "quarante";
            when 5 => return "cinquante";
            when 6 => return "soixante";
            when 7 => return "soixante-dix";
            when 8 => return "quatre-vingt";
            when 9 => return "quatre-vingt-dix";
            when others => return "";
         end case;
      elsif Locale = "da" then
         case Tens is
            when 2 => return "tyve";
            when 3 => return "tredive";
            when 4 => return "fyrre";
            when 5 => return "halvtreds";
            when 6 => return "tres";
            when 7 => return "halvfjerds";
            when 8 => return "firs";
            when 9 => return "halvfems";
            when others => return "";
         end case;
      elsif Locale = "es" then
         case Tens is
            when 2 => return "veinte";
            when 3 => return "treinta";
            when 4 => return "cuarenta";
            when 5 => return "cincuenta";
            when 6 => return "sesenta";
            when 7 => return "setenta";
            when 8 => return "ochenta";
            when 9 => return "noventa";
            when others => return "";
         end case;
      elsif Locale = "it" then
         case Tens is
            when 2 => return "venti";
            when 3 => return "trenta";
            when 4 => return "quaranta";
            when 5 => return "cinquanta";
            when 6 => return "sessanta";
            when 7 => return "settanta";
            when 8 => return "ottanta";
            when 9 => return "novanta";
            when others => return "";
         end case;
      elsif Locale = "pt" then
         case Tens is
            when 2 => return "vinte";
            when 3 => return "trinta";
            when 4 => return "quarenta";
            when 5 => return "cinquenta";
            when 6 => return "sessenta";
            when 7 => return "setenta";
            when 8 => return "oitenta";
            when 9 => return "noventa";
            when others => return "";
         end case;
      elsif Locale = "nl" then
         case Tens is
            when 2 => return "twintig";
            when 3 => return "dertig";
            when 4 => return "veertig";
            when 5 => return "vijftig";
            when 6 => return "zestig";
            when 7 => return "zeventig";
            when 8 => return "tachtig";
            when 9 => return "negentig";
            when others => return "";
         end case;
      elsif Locale = "sv" then
         case Tens is
            when 2 => return "tjugo";
            when 3 => return "trettio";
            when 4 => return "fyrtio";
            when 5 => return "femtio";
            when 6 => return "sextio";
            when 7 => return "sjuttio";
            when 8 => return U_A_Ring & "ttio";
            when 9 => return "nittio";
            when others => return "";
         end case;
      elsif Humanize.Locales.Is_Norwegian (Locale) then
         case Tens is
            when 2 => return "tjue";
            when 3 => return "tretti";
            when 4 => return "f" & U_O_Slash & "rti";
            when 5 => return "femti";
            when 6 => return "seksti";
            when 7 => return "sytti";
            when 8 => return U_A_Ring & "tti";
            when 9 => return "nitti";
            when others => return "";
         end case;
      elsif Locale = "fi" then
         case Tens is
            when 2 => return "kaksikymment" & U_A_Umlaut;
            when 3 => return "kolmekymment" & U_A_Umlaut;
            when 4 => return "nelj" & U_A_Umlaut & "kymment" & U_A_Umlaut;
            when 5 => return "viisikymment" & U_A_Umlaut;
            when 6 => return "kuusikymment" & U_A_Umlaut;
            when 7 => return "seitsem" & U_A_Umlaut & "nkymment" & U_A_Umlaut;
            when 8 => return "kahdeksankymment" & U_A_Umlaut;
            when 9 => return "yhdeks" & U_A_Umlaut & "nkymment" & U_A_Umlaut;
            when others => return "";
         end case;
      elsif Locale = "tr" then
         case Tens is
            when 2 => return "yirmi";
            when 3 => return "otuz";
            when 4 => return "k" & U_I_Dotless & "rk";
            when 5 => return "elli";
            when 6 => return "altm" & U_I_Dotless & U_S_Cedilla;
            when 7 => return "yetmi" & U_S_Cedilla;
            when 8 => return "seksen";
            when 9 => return "doksan";
            when others => return "";
         end case;
      elsif Locale = "pl" then
         case Tens is
            when 2 => return "dwadzie" & U (16#15B#) & "cia";
            when 3 => return "trzydzie" & U (16#15B#) & "ci";
            when 4 => return "czterdzie" & U (16#15B#) & "ci";
            when 5 => return "pi" & U (16#119#) & U (16#107#) & "dziesi" & U (16#105#) & "t";
            when 6 => return "sze" & U (16#15B#) & U (16#107#) & "dziesi" & U (16#105#) & "t";
            when 7 => return "siedemdziesi" & U (16#105#) & "t";
            when 8 => return "osiemdziesi" & U (16#105#) & "t";
            when 9 => return "dziewi" & U (16#119#) & U (16#107#) & "dziesi" & U (16#105#) & "t";
            when others => return "";
         end case;
      elsif Locale = "cs" then
         case Tens is
            when 2 => return "dvacet";
            when 3 => return "t" & U (16#159#) & "icet";
            when 4 => return U (16#10D#) & "ty" & U (16#159#) & "icet";
            when 5 => return "pades" & U (16#E1#) & "t";
            when 6 => return U (16#161#) & "edes" & U (16#E1#) & "t";
            when 7 => return "sedmdes" & U (16#E1#) & "t";
            when 8 => return "osmdes" & U (16#E1#) & "t";
            when 9 => return "devades" & U (16#E1#) & "t";
            when others => return "";
         end case;
      elsif Locale = "ru" then
         case Tens is
            when 2 => return Small_Locale_Word (Locale, 20);
            when 3 => return U (16#442#) & U (16#440#) & U (16#438#) & U (16#434#) & U (16#446#) & U (16#430#) & U (16#442#) & U (16#44C#);
            when 4 => return U (16#441#) & U (16#43E#) & U (16#440#) & U (16#43E#) & U (16#43A#);
            when 5 => return U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#44C#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 6 => return U (16#448#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#44C#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 7 => return U (16#441#) & U (16#435#) & U (16#43C#) & U (16#44C#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 8 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#435#) & U (16#43C#) & U (16#44C#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 9 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#44F#) & U (16#43D#) & U (16#43E#) & U (16#441#) & U (16#442#) & U (16#43E#);
            when others => return "";
         end case;
      elsif Locale = "uk" then
         case Tens is
            when 2 => return Small_Locale_Word (Locale, 20);
            when 3 => return U (16#442#) & U (16#440#) & U (16#438#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 4 => return U (16#441#) & U (16#43E#) & U (16#440#) & U (16#43E#) & U (16#43A#);
            when 5 => return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 6 => return U (16#448#) & U (16#456#) & U (16#441#) & U (16#442#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 7 => return U (16#441#) & U (16#456#) & U (16#43C#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 8 => return U (16#432#) & U (16#456#) & U (16#441#) & U (16#456#) & U (16#43C#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 9 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#43D#) & U (16#43E#) & U (16#441#) & U (16#442#) & U (16#43E#);
            when others => return "";
         end case;
      elsif Locale = "ar" then
         case Tens is
            when 2 => return Small_Locale_Word (Locale, 20);
            when 3 => return U (16#62B#) & U (16#644#) & U (16#627#) & U (16#62B#) & U (16#648#) & U (16#646#);
            when 4 => return U (16#623#) & U (16#631#) & U (16#628#) & U (16#639#) & U (16#648#) & U (16#646#);
            when 5 => return U (16#62E#) & U (16#645#) & U (16#633#) & U (16#648#) & U (16#646#);
            when 6 => return U (16#633#) & U (16#62A#) & U (16#648#) & U (16#646#);
            when 7 => return U (16#633#) & U (16#628#) & U (16#639#) & U (16#648#) & U (16#646#);
            when 8 => return U (16#62B#) & U (16#645#) & U (16#627#) & U (16#646#) & U (16#648#) & U (16#646#);
            when 9 => return U (16#62A#) & U (16#633#) & U (16#639#) & U (16#648#) & U (16#646#);
            when others => return "";
         end case;
      elsif Locale = "hi" then
         case Tens is
            when 2 => return Small_Locale_Word (Locale, 20);
            when 3 => return U (16#924#) & U (16#940#) & U (16#938#);
            when 4 => return U (16#91A#) & U (16#93E#) & U (16#932#) & U (16#940#) & U (16#938#);
            when 5 => return U (16#92A#) & U (16#91A#) & U (16#93E#) & U (16#938#);
            when 6 => return U (16#938#) & U (16#93E#) & U (16#920#);
            when 7 => return U (16#938#) & U (16#924#) & U (16#94D#) & U (16#924#) & U (16#930#);
            when 8 => return U (16#905#) & U (16#938#) & U (16#94D#) & U (16#938#) & U (16#940#);
            when 9 => return U (16#928#) & U (16#92C#) & U (16#94D#) & U (16#92C#) & U (16#947#);
            when others => return "";
         end case;
      elsif Locale = "ro" then
         case Tens is
            when 2 => return "douazeci";
            when 3 => return "treizeci";
            when 4 => return "patruzeci";
            when 5 => return "cincizeci";
            when 6 => return "saizeci";
            when 7 => return "saptezeci";
            when 8 => return "optzeci";
            when 9 => return "nouazeci";
            when others => return "";
         end case;
      elsif Locale = "lt" then
         case Tens is
            when 2 => return "dvidesimt";
            when 3 => return "trisdesimt";
            when 4 => return "keturiasdesimt";
            when 5 => return "penkiasdesimt";
            when 6 => return "sesiasdesimt";
            when 7 => return "septyniasdesimt";
            when 8 => return "astuoniasdesimt";
            when 9 => return "devyniasdesimt";
            when others => return "";
         end case;
      elsif Locale = "sl" then
         case Tens is
            when 2 => return "dvajset";
            when 3 => return "trideset";
            when 4 => return "stirideset";
            when 5 => return "petdeset";
            when 6 => return "sestdeset";
            when 7 => return "sedemdeset";
            when 8 => return "osemdeset";
            when 9 => return "devetdeset";
            when others => return "";
         end case;
      elsif Locale = "id" or else Locale = "ms" then
         case Tens is
            when 2 => return "dua puluh";
            when 3 => return "tiga puluh";
            when 4 => return "empat puluh";
            when 5 => return "lima puluh";
            when 6 => return "enam puluh";
            when 7 => return "tujuh puluh";
            when 8 => return (if Locale = "ms" then "lapan puluh" else "delapan puluh");
            when 9 => return "sembilan puluh";
            when others => return "";
         end case;
      elsif Locale = "eo" then
         case Tens is
            when 2 => return "dudek";
            when 3 => return "tridek";
            when 4 => return "kvardek";
            when 5 => return "kvindek";
            when 6 => return "sesdek";
            when 7 => return "sepdek";
            when 8 => return "okdek";
            when 9 => return "naudek";
            when others => return "";
         end case;
      elsif Locale = "vi" then
         case Tens is
            when 2 => return "hai muoi";
            when 3 => return "ba muoi";
            when 4 => return "bon muoi";
            when 5 => return "nam muoi";
            when 6 => return "sau muoi";
            when 7 => return "bay muoi";
            when 8 => return "tam muoi";
            when 9 => return "chin muoi";
            when others => return "";
         end case;
      elsif Locale = "sw" then
         case Tens is
            when 2 => return "ishirini";
            when 3 => return "thelathini";
            when 4 => return "arobaini";
            when 5 => return "hamsini";
            when 6 => return "sitini";
            when 7 => return "sabini";
            when 8 => return "themanini";
            when 9 => return "tisini";
            when others => return "";
         end case;
      elsif Locale = "af" then
         case Tens is
            when 2 => return "twintig";
            when 3 => return "dertig";
            when 4 => return "veertig";
            when 5 => return "vyftig";
            when 6 => return "sestig";
            when 7 => return "sewentig";
            when 8 => return "tagtig";
            when 9 => return "negentig";
            when others => return "";
         end case;
      elsif Locale = "hu" then
         case Tens is
            when 2 => return "husz";
            when 3 => return "harminc";
            when 4 => return "negyven";
            when 5 => return "otven";
            when 6 => return "hatvan";
            when 7 => return "hetven";
            when 8 => return "nyolcvan";
            when 9 => return "kilencven";
            when others => return "";
         end case;
      elsif Locale = "sk" then
         case Tens is
            when 2 => return "dvadsat";
            when 3 => return "tridsat";
            when 4 => return "styridsat";
            when 5 => return "patdesiat";
            when 6 => return "sestdesiat";
            when 7 => return "sedemdesiat";
            when 8 => return "osemdesiat";
            when 9 => return "devatdesiat";
            when others => return "";
         end case;
      else
         return Under_Thousand (Tens * 10);
      end if;
   end Locale_Tens_Word;
