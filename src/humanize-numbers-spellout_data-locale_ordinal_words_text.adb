--  Provenance: generated from Humanize spellout tables; split shard: locale ordinal spellout words.

separate (Humanize.Numbers.Spellout_Data)
function Locale_Ordinal_Words_Text
     (Locale : String;
      Value  : Natural)
      return String
   is
      function Direct return String is
      begin
         if Locale = "de" then
            case Value is
               when 0 => return "nullte";
               when 1 => return "erste";
               when 2 => return "zweite";
               when 3 => return "dritte";
               when 4 => return "vierte";
               when 5 => return "f" & U_U_Umlaut & "nfte";
               when 6 => return "sechste";
               when 7 => return "siebte";
               when 8 => return "achte";
               when 9 => return "neunte";
               when 10 => return "zehnte";
               when 11 => return "elfte";
               when 12 => return "zw" & U_O_Umlaut & "lfte";
               when 13 => return "dreizehnte";
               when 14 => return "vierzehnte";
               when 15 => return "f" & U_U_Umlaut & "nfzehnte";
               when 16 => return "sechzehnte";
               when 17 => return "siebzehnte";
               when 18 => return "achtzehnte";
               when 19 => return "neunzehnte";
               when others => return "";
            end case;
         elsif Locale = "fr" then
            case Value is
               when 0 => return "z" & U_E_Acute & "roi" & U_E_Grave & "me";
               when 1 => return "premier";
               when 2 => return "deuxi" & U_E_Grave & "me";
               when 3 => return "troisi" & U_E_Grave & "me";
               when 4 => return "quatri" & U_E_Grave & "me";
               when 5 => return "cinqui" & U_E_Grave & "me";
               when 6 => return "sixi" & U_E_Grave & "me";
               when 7 => return "septi" & U_E_Grave & "me";
               when 8 => return "huiti" & U_E_Grave & "me";
               when 9 => return "neuvi" & U_E_Grave & "me";
               when 10 => return "dixi" & U_E_Grave & "me";
               when 11 => return "onzi" & U_E_Grave & "me";
               when 12 => return "douzi" & U_E_Grave & "me";
               when 13 => return "treizi" & U_E_Grave & "me";
               when 14 => return "quatorzi" & U_E_Grave & "me";
               when 15 => return "quinzi" & U_E_Grave & "me";
               when 16 => return "seizi" & U_E_Grave & "me";
               when 17 => return "dix-septi" & U_E_Grave & "me";
               when 18 => return "dix-huiti" & U_E_Grave & "me";
               when 19 => return "dix-neuvi" & U_E_Grave & "me";
               when 20 => return "vingti" & U_E_Grave & "me";
               when others => return "";
            end case;
         elsif Locale = "da" then
            case Value is
               when 0 => return "nulte";
               when 1 => return "f" & U_O_Slash & "rste";
               when 2 => return "anden";
               when 3 => return "tredje";
               when 4 => return "fjerde";
               when 5 => return "femte";
               when 6 => return "sjette";
               when 7 => return "syvende";
               when 8 => return "ottende";
               when 9 => return "niende";
               when 10 => return "tiende";
               when 11 => return "ellevte";
               when 12 => return "tolvte";
               when 13 => return "trettende";
               when 14 => return "fjortende";
               when 15 => return "femtende";
               when 16 => return "sekstende";
               when 17 => return "syttende";
               when 18 => return "attende";
               when 19 => return "nittende";
               when 20 => return "tyvende";
               when others => return "";
            end case;
         elsif Locale = "es" then
            case Value is
               when 0 => return "cero";
               when 1 => return "primero";
               when 2 => return "segundo";
               when 3 => return "tercero";
               when 4 => return "cuarto";
               when 5 => return "quinto";
               when 6 => return "sexto";
               when 7 => return "s" & U_E_Acute & "ptimo";
               when 8 => return "octavo";
               when 9 => return "noveno";
               when 10 => return "d" & U_E_Acute & "cimo";
               when 11 => return "und" & U_E_Acute & "cimo";
               when 12 => return "duod" & U_E_Acute & "cimo";
               when 13 => return "decimotercero";
               when 14 => return "decimocuarto";
               when 15 => return "decimoquinto";
               when 16 => return "decimosexto";
               when 17 => return "decimos" & U_E_Acute & "ptimo";
               when 18 => return "decimoctavo";
               when 19 => return "decimonoveno";
               when 20 => return "vig" & U_E_Acute & "simo";
               when others => return "";
            end case;
         elsif Locale = "it" then
            case Value is
               when 0 => return "zeresimo";
               when 1 => return "primo";
               when 2 => return "secondo";
               when 3 => return "terzo";
               when 4 => return "quarto";
               when 5 => return "quinto";
               when 6 => return "sesto";
               when 7 => return "settimo";
               when 8 => return "ottavo";
               when 9 => return "nono";
               when 10 => return "decimo";
               when 11 => return "undicesimo";
               when 12 => return "dodicesimo";
               when 13 => return "tredicesimo";
               when 14 => return "quattordicesimo";
               when 15 => return "quindicesimo";
               when 16 => return "sedicesimo";
               when 17 => return "diciassettesimo";
               when 18 => return "diciottesimo";
               when 19 => return "diciannovesimo";
               when 20 => return "ventesimo";
               when others => return "";
            end case;
         elsif Locale = "pt" then
            case Value is
               when 0 => return "zero";
               when 1 => return "primeiro";
               when 2 => return "segundo";
               when 3 => return "terceiro";
               when 4 => return "quarto";
               when 5 => return "quinto";
               when 6 => return "sexto";
               when 7 => return "s" & U_E_Acute & "timo";
               when 8 => return "oitavo";
               when 9 => return "nono";
               when 10 => return "d" & U_E_Acute & "cimo";
               when 11 => return "d" & U_E_Acute & "cimo primeiro";
               when 12 => return "d" & U_E_Acute & "cimo segundo";
               when 13 => return "d" & U_E_Acute & "cimo terceiro";
               when 14 => return "d" & U_E_Acute & "cimo quarto";
               when 15 => return "d" & U_E_Acute & "cimo quinto";
               when 16 => return "d" & U_E_Acute & "cimo sexto";
               when 17 => return "d" & U_E_Acute & "cimo s" & U_E_Acute & "timo";
               when 18 => return "d" & U_E_Acute & "cimo oitavo";
               when 19 => return "d" & U_E_Acute & "cimo nono";
               when 20 => return "vig" & U_E_Acute & "simo";
               when others => return "";
            end case;
         elsif Locale = "nl" then
            case Value is
               when 0 => return "nulde";
               when 1 => return "eerste";
               when 2 => return "tweede";
               when 3 => return "derde";
               when 4 => return "vierde";
               when 5 => return "vijfde";
               when 6 => return "zesde";
               when 7 => return "zevende";
               when 8 => return "achtste";
               when 9 => return "negende";
               when 10 => return "tiende";
               when 11 => return "elfde";
               when 12 => return "twaalfde";
               when 13 => return "dertiende";
               when 14 => return "veertiende";
               when 15 => return "vijftiende";
               when 16 => return "zestiende";
               when 17 => return "zeventiende";
               when 18 => return "achttiende";
               when 19 => return "negentiende";
               when 20 => return "twintigste";
               when others => return "";
            end case;
         elsif Locale = "sv" then
            case Value is
               when 0 => return "nollte";
               when 1 => return "f" & U_O_Umlaut & "rsta";
               when 2 => return "andra";
               when 3 => return "tredje";
               when 4 => return "fj" & U_A_Umlaut & "rde";
               when 5 => return "femte";
               when 6 => return "sj" & U_A_Umlaut & "tte";
               when 7 => return "sjunde";
               when 8 => return U_A_Ring & "ttonde";
               when 9 => return "nionde";
               when 10 => return "tionde";
               when 11 => return "elfte";
               when 12 => return "tolfte";
               when 13 => return "trettonde";
               when 14 => return "fjortonde";
               when 15 => return "femtonde";
               when 16 => return "sextonde";
               when 17 => return "sjuttonde";
               when 18 => return "artonde";
               when 19 => return "nittonde";
               when 20 => return "tjugonde";
               when others => return "";
            end case;
         elsif Humanize.Locales.Is_Norwegian (Locale) then
            case Value is
               when 0 => return "nullte";
               when 1 => return "f" & U_O_Slash & "rste";
               when 2 => return "andre";
               when 3 => return "tredje";
               when 4 => return "fjerde";
               when 5 => return "femte";
               when 6 => return "sjette";
               when 7 => return "sjuende";
               when 8 => return U_A_Ring & "ttende";
               when 9 => return "niende";
               when 10 => return "tiende";
               when 11 => return "ellevte";
               when 12 => return "tolvte";
               when 13 => return "trettende";
               when 14 => return "fjortende";
               when 15 => return "femtende";
               when 16 => return "sekstende";
               when 17 => return "syttende";
               when 18 => return "attende";
               when 19 => return "nittende";
               when 20 => return "tjuende";
               when others => return "";
            end case;
         elsif Locale = "fi" then
            case Value is
               when 0 => return "nollas";
               when 1 => return "ensimm" & U_A_Umlaut & "inen";
               when 2 => return "toinen";
               when 3 => return "kolmas";
               when 4 => return "nelj" & U_A_Umlaut & "s";
               when 5 => return "viides";
               when 6 => return "kuudes";
               when 7 => return "seitsem" & U_A_Umlaut & "s";
               when 8 => return "kahdeksas";
               when 9 => return "yhdeks" & U_A_Umlaut & "s";
               when 10 => return "kymmenes";
               when 11 => return "yhdestoista";
               when 12 => return "kahdestoista";
               when 13 => return "kolmastoista";
               when 14 => return "nelj" & U_A_Umlaut & "stoista";
               when 15 => return "viidestoista";
               when 16 => return "kuudestoista";
               when 17 => return "seitsem" & U_A_Umlaut & "stoista";
               when 18 => return "kahdeksastoista";
               when 19 => return "yhdeks" & U_A_Umlaut & "stoista";
               when 20 => return "kahdeskymmenes";
               when others => return "";
            end case;
         elsif Locale = "tr" then
            case Value is
               when 0 => return "s" & U_I_Dotless & "f" & U_I_Dotless & "r" & U_I_Dotless & "nc" & U_I_Dotless;
               when 1 => return "birinci";
               when 2 => return "ikinci";
               when 3 => return U_U_Umlaut & U_C_Cedilla & U_U_Umlaut & "nc" & U_U_Umlaut;
               when 4 => return "d" & U_O_Umlaut & "rd" & U_U_Umlaut & "nc" & U_U_Umlaut;
               when 5 => return "be" & U_S_Cedilla & "inci";
               when 6 => return "alt" & U_I_Dotless & "nc" & U_I_Dotless;
               when 7 => return "yedinci";
               when 8 => return "sekizinci";
               when 9 => return "dokuzuncu";
               when 10 => return "onuncu";
               when 11 => return "on birinci";
               when 12 => return "on ikinci";
               when 13 => return "on " & U_U_Umlaut & U_C_Cedilla & U_U_Umlaut & "nc" & U_U_Umlaut;
               when 14 => return "on d" & U_O_Umlaut & "rd" & U_U_Umlaut & "nc" & U_U_Umlaut;
               when 15 => return "on be" & U_S_Cedilla & "inci";
               when 16 => return "on alt" & U_I_Dotless & "nc" & U_I_Dotless;
               when 17 => return "on yedinci";
               when 18 => return "on sekizinci";
               when 19 => return "on dokuzuncu";
               when 20 => return "yirminci";
               when others => return "";
            end case;
         elsif Locale = "pl" then
            case Value is
               when 0 => return "zerowy";
               when 1 => return "pierwszy";
               when 2 => return "drugi";
               when 3 => return "trzeci";
               when 4 => return "czwarty";
               when 5 => return "pi" & U (16#105#) & "ty";
               when 6 => return "sz" & U (16#F3#) & "sty";
               when 7 => return "si" & U (16#F3#) & "dmy";
               when 8 => return U (16#F3#) & "smy";
               when 9 => return "dziewi" & U (16#105#) & "ty";
               when 10 => return "dziesi" & U (16#105#) & "ty";
               when 11 => return "jedenasty";
               when 12 => return "dwunasty";
               when 13 => return "trzynasty";
               when 14 => return "czternasty";
               when 15 => return "pi" & U (16#119#) & "tnasty";
               when 16 => return "szesnasty";
               when 17 => return "siedemnasty";
               when 18 => return "osiemnasty";
               when 19 => return "dziewi" & U (16#119#) & "tnasty";
               when 20 => return "dwudziesty";
               when others => return "";
            end case;
         elsif Locale = "cs" then
            case Value is
               when 0 => return "nult" & U (16#FD#);
               when 1 => return "prvn" & U (16#ED#);
               when 2 => return "druh" & U (16#FD#);
               when 3 => return "t" & U (16#159#) & "et" & U (16#ED#);
               when 4 => return U (16#10D#) & "tvrt" & U (16#FD#);
               when 5 => return "p" & U (16#E1#) & "t" & U (16#FD#);
               when 6 => return U (16#161#) & "est" & U (16#FD#);
               when 7 => return "sedm" & U (16#FD#);
               when 8 => return "osm" & U (16#FD#);
               when 9 => return "dev" & U (16#E1#) & "t" & U (16#FD#);
               when 10 => return "des" & U (16#E1#) & "t" & U (16#FD#);
               when 11 => return "jeden" & U (16#E1#) & "ct" & U (16#FD#);
               when 12 => return "dvan" & U (16#E1#) & "ct" & U (16#FD#);
               when 13 => return "t" & U (16#159#) & "in" & U (16#E1#) & "ct" & U (16#FD#);
               when 14 => return U (16#10D#) & "trn" & U (16#E1#) & "ct" & U (16#FD#);
               when 15 => return "patn" & U (16#E1#) & "ct" & U (16#FD#);
               when 16 => return U (16#161#) & "estn" & U (16#E1#) & "ct" & U (16#FD#);
               when 17 => return "sedmn" & U (16#E1#) & "ct" & U (16#FD#);
               when 18 => return "osmn" & U (16#E1#) & "ct" & U (16#FD#);
               when 19 => return "devaten" & U (16#E1#) & "ct" & U (16#FD#);
               when 20 => return "dvac" & U (16#E1#) & "t" & U (16#FD#);
               when others => return "";
            end case;
         elsif Locale = "ru" then
            case Value is
               when 0 => return Small_Locale_Word (Locale, 0);
               when 1 => return U (16#43F#) & U (16#435#) & U (16#440#) & U (16#432#) & U (16#44B#) & U (16#439#);
               when 2 => return U (16#432#) & U (16#442#) & U (16#43E#) & U (16#440#) & U (16#43E#) & U (16#439#);
               when 3 => return U (16#442#) & U (16#440#) & U (16#435#) & U (16#442#) & U (16#438#) & U (16#439#);
               when 4 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#432#) & U (16#451#) & U (16#440#) & U (16#442#) & U (16#44B#) & U (16#439#);
               when 5 => return U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#44B#) & U (16#439#);
               when 6 => return U (16#448#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#43E#) & U (16#439#);
               when 7 => return U (16#441#) & U (16#435#) & U (16#434#) & U (16#44C#) & U (16#43C#) & U (16#43E#) & U (16#439#);
               when 8 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#44C#) & U (16#43C#) & U (16#43E#) & U (16#439#);
               when 9 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#44F#) & U (16#442#) & U (16#44B#) & U (16#439#);
               when 10 => return U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#) & U (16#44B#) & U (16#439#);
               when others => return "";
            end case;
         elsif Locale = "uk" then
            case Value is
               when 0 => return Small_Locale_Word (Locale, 0);
               when 1 => return U (16#43F#) & U (16#435#) & U (16#440#) & U (16#448#) & U (16#438#) & U (16#439#);
               when 2 => return U (16#434#) & U (16#440#) & U (16#443#) & U (16#433#) & U (16#438#) & U (16#439#);
               when 3 => return U (16#442#) & U (16#440#) & U (16#435#) & U (16#442#) & U (16#456#) & U (16#439#);
               when 4 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#432#) & U (16#435#) & U (16#440#) & U (16#442#) & U (16#438#) & U (16#439#);
               when 5 => return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#438#) & U (16#439#);
               when 6 => return U (16#448#) & U (16#43E#) & U (16#441#) & U (16#442#) & U (16#438#) & U (16#439#);
               when 7 => return U (16#441#) & U (16#44C#) & U (16#43E#) & U (16#43C#) & U (16#438#) & U (16#439#);
               when 8 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#44C#) & U (16#43C#) & U (16#438#) & U (16#439#);
               when 9 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#438#) & U (16#439#);
               when 10 => return U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#) & U (16#438#) & U (16#439#);
               when others => return "";
            end case;
         elsif Locale = "ar" then
            case Value is
               when 0 => return Small_Locale_Word (Locale, 0);
               when 1 => return U (16#627#) & U (16#644#) & U (16#623#) & U (16#648#) & U (16#644#);
               when 2 => return U (16#627#) & U (16#644#) & U (16#62B#) & U (16#627#) & U (16#646#) & U (16#64A#);
               when 3 => return U (16#627#) & U (16#644#) & U (16#62B#) & U (16#627#) & U (16#644#) & U (16#62B#);
               when 4 => return U (16#627#) & U (16#644#) & U (16#631#) & U (16#627#) & U (16#628#) & U (16#639#);
               when 5 => return U (16#627#) & U (16#644#) & U (16#62E#) & U (16#627#) & U (16#645#) & U (16#633#);
               when 6 => return U (16#627#) & U (16#644#) & U (16#633#) & U (16#627#) & U (16#62F#) & U (16#633#);
               when 7 => return U (16#627#) & U (16#644#) & U (16#633#) & U (16#627#) & U (16#628#) & U (16#639#);
               when 8 => return U (16#627#) & U (16#644#) & U (16#62B#) & U (16#627#) & U (16#645#) & U (16#646#);
               when 9 => return U (16#627#) & U (16#644#) & U (16#62A#) & U (16#627#) & U (16#633#) & U (16#639#);
               when 10 => return U (16#627#) & U (16#644#) & U (16#639#) & U (16#627#) & U (16#634#) & U (16#631#);
               when others => return "";
            end case;
         elsif Locale = "hi" then
            case Value is
               when 0 => return Small_Locale_Word (Locale, 0);
               when 1 => return U (16#92A#) & U (16#939#) & U (16#932#) & U (16#93E#);
               when 2 => return U (16#926#) & U (16#942#) & U (16#938#) & U (16#930#) & U (16#93E#);
               when 3 => return U (16#924#) & U (16#940#) & U (16#938#) & U (16#930#) & U (16#93E#);
               when 4 => return U (16#91A#) & U (16#94C#) & U (16#925#) & U (16#93E#);
               when 5 => return U (16#92A#) & U (16#93E#) & U (16#901#) & U (16#91A#) & U (16#935#) & U (16#93E#) & U (16#901#);
               when 6 => return U (16#91B#) & U (16#920#) & U (16#93E#);
               when 7 => return U (16#938#) & U (16#93E#) & U (16#924#) & U (16#935#) & U (16#93E#) & U (16#901#);
               when 8 => return U (16#906#) & U (16#920#) & U (16#935#) & U (16#93E#) & U (16#901#);
               when 9 => return U (16#928#) & U (16#94C#) & U (16#935#) & U (16#93E#) & U (16#901#);
               when 10 => return U (16#926#) & U (16#938#) & U (16#935#) & U (16#93E#) & U (16#901#);
               when others => return "";
            end case;
         elsif Locale = "ro" then
            case Value is
               when 0 => return "zero";
               when 1 => return "primul";
               when 2 => return "al doilea";
               when 3 => return "al treilea";
               when 4 => return "al patrulea";
               when 5 => return "al cincilea";
               when 6 => return "al saselea";
               when 7 => return "al saptelea";
               when 8 => return "al optulea";
               when 9 => return "al noualea";
               when 10 => return "al zecelea";
               when others => return "";
            end case;
         elsif Locale = "lt" then
            case Value is
               when 0 => return "nulinis";
               when 1 => return "pirmas";
               when 2 => return "antras";
               when 3 => return "trecias";
               when 4 => return "ketvirtas";
               when 5 => return "penktas";
               when 6 => return "sestas";
               when 7 => return "septintas";
               when 8 => return "astuntas";
               when 9 => return "devintas";
               when 10 => return "desimtas";
               when others => return "";
            end case;
         elsif Locale = "sl" then
            case Value is
               when 0 => return "nicelni";
               when 1 => return "prvi";
               when 2 => return "drugi";
               when 3 => return "tretji";
               when 4 => return "cetrti";
               when 5 => return "peti";
               when 6 => return "sesti";
               when 7 => return "sedmi";
               when 8 => return "osmi";
               when 9 => return "deveti";
               when 10 => return "deseti";
               when others => return "";
            end case;
         elsif Locale = "id" or else Locale = "ms" then
            case Value is
               when 0 => return Small_Locale_Word (Locale, 0);
               when 1 => return "pertama";
               when 2 => return "kedua";
               when 3 => return "ketiga";
               when 4 => return "keempat";
               when 5 => return "kelima";
               when 6 => return "keenam";
               when 7 => return "ketujuh";
               when 8 => return "kedelapan";
               when 9 => return "kesembilan";
               when 10 => return "kesepuluh";
               when others => return "";
            end case;
         elsif Locale = "eo" then
            case Value is
               when 0 => return "nula";
               when 1 => return "unua";
               when 2 => return "dua";
               when 3 => return "tria";
               when 4 => return "kvara";
               when 5 => return "kvina";
               when 6 => return "sesa";
               when 7 => return "sepa";
               when 8 => return "oka";
               when 9 => return "naua";
               when 10 => return "deka";
               when others => return "";
            end case;
         elsif Locale = "vi" then
            case Value is
               when 0 => return "thu khong";
               when 1 => return "thu nhat";
               when 2 => return "thu hai";
               when 3 => return "thu ba";
               when 4 => return "thu tu";
               when 5 => return "thu nam";
               when 6 => return "thu sau";
               when 7 => return "thu bay";
               when 8 => return "thu tam";
               when 9 => return "thu chin";
               when 10 => return "thu muoi";
               when others => return "";
            end case;
         elsif Locale = "sw" then
            case Value is
               when 0 => return "sifuri";
               when 1 => return "kwanza";
               when 2 => return "pili";
               when 3 => return "tatu";
               when 4 => return "nne";
               when 5 => return "tano";
               when 6 => return "sita";
               when 7 => return "saba";
               when 8 => return "nane";
               when 9 => return "tisa";
               when 10 => return "kumi";
               when others => return "";
            end case;
         elsif Locale = "af" then
            case Value is
               when 0 => return "nulde";
               when 1 => return "eerste";
               when 2 => return "tweede";
               when 3 => return "derde";
               when 4 => return "vierde";
               when 5 => return "vyfde";
               when 6 => return "sesde";
               when 7 => return "sewende";
               when 8 => return "agtste";
               when 9 => return "negende";
               when 10 => return "tiende";
               when others => return "";
            end case;
         elsif Locale = "hu" then
            case Value is
               when 0 => return "nulladik";
               when 1 => return "elso";
               when 2 => return "masodik";
               when 3 => return "harmadik";
               when 4 => return "negyedik";
               when 5 => return "otodik";
               when 6 => return "hatodik";
               when 7 => return "hetedik";
               when 8 => return "nyolcadik";
               when 9 => return "kilencedik";
               when 10 => return "tizedik";
               when others => return "";
            end case;
         elsif Locale = "sk" then
            case Value is
               when 0 => return "nulty";
               when 1 => return "prvy";
               when 2 => return "druhy";
               when 3 => return "treti";
               when 4 => return "stvrty";
               when 5 => return "piaty";
               when 6 => return "siesty";
               when 7 => return "siedmy";
               when 8 => return "osmy";
               when 9 => return "deviaty";
               when 10 => return "desiaty";
               when others => return "";
            end case;
         else
            return "";
         end if;
      end Direct;

      Direct_Text : constant String := Direct;
      Base        : constant String := Locale_Long_Word
        (Locale, Long_Long_Integer (Value));
      Ones        : constant Natural := Value mod 10;
      Tens        : constant Natural := Value - Ones;
      Rest_1000   : constant Natural := Value mod 1_000;

      function Turkish_Ordinal_Ending return String is
      begin
         case Value mod 100 is
            when 20 => return "nci";
            when 30 => return "uncu";
            when 40 => return U_I_Dotless & "nc" & U_I_Dotless;
            when 50 => return "nci";
            when 60 => return U_I_Dotless & "nc" & U_I_Dotless;
            when 70 => return "inci";
            when 80 => return "inci";
            when 90 => return U_I_Dotless & "nc" & U_I_Dotless;
            when others => return "inci";
         end case;
      end Turkish_Ordinal_Ending;

      function Generated_Exact_Tens_Ordinal return String is
      begin
         if Locale = "sv" then
            case Value mod 100 is
               when 30 => return "trettionde";
               when 40 => return "fyrtionde";
               when 50 => return "femtionde";
               when 60 => return "sextionde";
               when 70 => return "sjuttionde";
               when 80 => return U_A_Ring & "ttionde";
               when 90 => return "nittionde";
               when others => return "";
            end case;
         elsif Humanize.Locales.Is_Norwegian (Locale) then
            case Value mod 100 is
               when 30 => return "trettiende";
               when 40 => return "f" & U_O_Slash & "rtiende";
               when 50 => return "femtiende";
               when 60 => return "sekstiende";
               when 70 => return "syttiende";
               when 80 => return U_A_Ring & "ttiende";
               when 90 => return "nittiende";
               when others => return "";
            end case;
         elsif Locale = "pl" then
            case Value mod 100 is
               when 30 => return "trzydziesty";
               when 40 => return "czterdziesty";
               when 50 => return "pi" & U (16#119#) & U (16#107#) & "dziesi" & U (16#105#) & "ty";
               when 60 => return "sze" & U (16#15B#) & U (16#107#) & "dziesi" & U (16#105#) & "ty";
               when 70 => return "siedemdziesi" & U (16#105#) & "ty";
               when 80 => return "osiemdziesi" & U (16#105#) & "ty";
               when 90 => return "dziewi" & U (16#119#) & U (16#107#) & "dziesi" & U (16#105#) & "ty";
               when others => return "";
            end case;
         elsif Locale = "cs" then
            case Value mod 100 is
               when 30 => return "t" & U (16#159#) & "ic" & U (16#E1#) & "t" & U (16#FD#);
               when 40 => return U (16#10D#) & "ty" & U (16#159#) & "ic" & U (16#E1#) & "t" & U (16#FD#);
               when 50 => return "pades" & U (16#E1#) & "t" & U (16#FD#);
               when 60 => return U (16#161#) & "edes" & U (16#E1#) & "t" & U (16#FD#);
               when 70 => return "sedmdes" & U (16#E1#) & "t" & U (16#FD#);
               when 80 => return "osmdes" & U (16#E1#) & "t" & U (16#FD#);
               when 90 => return "devades" & U (16#E1#) & "t" & U (16#FD#);
               when others => return "";
            end case;
         elsif Locale = "ro" then
            case Value mod 100 is
               when 30 => return "al treizecilea";
               when 40 => return "al patruzecilea";
               when 50 => return "al cincizecilea";
               when 60 => return "al saizecilea";
               when 70 => return "al saptezecilea";
               when 80 => return "al optzecilea";
               when 90 => return "al nouazecilea";
               when others => return "";
            end case;
         elsif Locale = "lt" then
            case Value mod 100 is
               when 20 => return "dvidesimtas";
               when 30 => return "trisdesimtas";
               when 40 => return "keturiasdesimtas";
               when 50 => return "penkiasdesimtas";
               when 60 => return "sesiasdesimtas";
               when 70 => return "septyniasdesimtas";
               when 80 => return "astuoniasdesimtas";
               when 90 => return "devyniasdesimtas";
               when others => return "";
            end case;
         elsif Locale = "sl" then
            case Value mod 100 is
               when 20 => return "dvajseti";
               when 30 => return "trideseti";
               when 40 => return "stirideseti";
               when 50 => return "petdeseti";
               when 60 => return "sestdeseti";
               when 70 => return "sedemdeseti";
               when 80 => return "osemdeseti";
               when 90 => return "devetdeseti";
               when others => return "";
            end case;
         elsif Locale = "id" or else Locale = "ms" then
            case Value mod 100 is
               when 20 => return "kedua puluh";
               when 30 => return "ketiga puluh";
               when 40 => return "keempat puluh";
               when 50 => return "kelima puluh";
               when 60 => return "keenam puluh";
               when 70 => return "ketujuh puluh";
               when 80 => return "kedelapan puluh";
               when 90 => return "kesembilan puluh";
               when others => return "";
            end case;
         elsif Locale = "eo" then
            case Value mod 100 is
               when 20 => return "dudeka";
               when 30 => return "trideka";
               when 40 => return "kvardeka";
               when 50 => return "kvindeka";
               when 60 => return "sesdeka";
               when 70 => return "sepdeka";
               when 80 => return "okdeka";
               when 90 => return "naudeka";
               when others => return "";
            end case;
         elsif Locale = "vi" then
            case Value mod 100 is
               when 20 => return "thu hai muoi";
               when 30 => return "thu ba muoi";
               when 40 => return "thu bon muoi";
               when 50 => return "thu nam muoi";
               when 60 => return "thu sau muoi";
               when 70 => return "thu bay muoi";
               when 80 => return "thu tam muoi";
               when 90 => return "thu chin muoi";
               when others => return "";
            end case;
         elsif Locale = "sw" then
            case Value mod 100 is
               when 20 => return "ishirini";
               when 30 => return "thelathini";
               when 40 => return "arobaini";
               when 50 => return "hamsini";
               when 60 => return "sitini";
               when 70 => return "sabini";
               when 80 => return "themanini";
               when 90 => return "tisini";
               when others => return "";
            end case;
         elsif Locale = "af" then
            case Value mod 100 is
               when 20 => return "twintigste";
               when 30 => return "dertigste";
               when 40 => return "veertigste";
               when 50 => return "vyftigste";
               when 60 => return "sestigste";
               when 70 => return "sewentigste";
               when 80 => return "tagtigste";
               when 90 => return "negentigste";
               when others => return "";
            end case;
         elsif Locale = "hu" then
            case Value mod 100 is
               when 20 => return "huszadik";
               when 30 => return "harmincadik";
               when 40 => return "negyvenedik";
               when 50 => return "otvenedik";
               when 60 => return "hatvanadik";
               when 70 => return "hetvenedik";
               when 80 => return "nyolcvanadik";
               when 90 => return "kilencvenedik";
               when others => return "";
            end case;
         elsif Locale = "sk" then
            case Value mod 100 is
               when 20 => return "dvadsaty";
               when 30 => return "tridsiaty";
               when 40 => return "styridsiaty";
               when 50 => return "patdesiaty";
               when 60 => return "sestdesiaty";
               when 70 => return "sedemdesiaty";
               when 80 => return "osemdesiaty";
               when 90 => return "devatdesiaty";
               when others => return "";
            end case;
         else
            return "";
         end if;
      end Generated_Exact_Tens_Ordinal;

      Exact_Tens_Text : constant String := Generated_Exact_Tens_Ordinal;
   begin
      if Locale = "en" then
         return Ordinal_Words_Text (Value);
      elsif Direct_Text'Length > 0 then
         return Direct_Text;
      elsif Base'Length = 0 then
         return Ordinal_Words_Text (Value);
      elsif Locale /= "en"
        and then not Humanize.Locales.Is_CJK (Locale)
        and then Value < 1_000_000
        and then Rest_1000 /= 0
        and then Value >= 1_000
      then
         return Locale_Long_Word
             (Locale, Long_Long_Integer (Value - Rest_1000))
           & " " & Locale_Ordinal_Words_Text (Locale, Rest_1000);
      elsif Has_Generated_Spellout (Locale)
        and then not Humanize.Locales.Is_CJK (Locale)
        and then Value < 1_000
        and then Value mod 100 /= 0
        and then Value >= 100
      then
         return Locale_Long_Word
             (Locale, Long_Long_Integer (Value - (Value mod 100)))
           & " " & Locale_Ordinal_Words_Text (Locale, Value mod 100);
      elsif Has_Generated_Spellout (Locale)
        and then not Humanize.Locales.Is_CJK (Locale)
        and then Value < 100
        and then Ones /= 0
      then
         return Locale_Long_Word (Locale, Long_Long_Integer (Tens)) & " "
           & Locale_Ordinal_Words_Text (Locale, Ones);
      elsif Exact_Tens_Text'Length > 0 then
         return Exact_Tens_Text;
      elsif Locale = "de" then
         return Base & (if Value mod 100 in 1 .. 19 then "te" else "ste");
      elsif Locale = "fr" then
         return Base & "i" & U_E_Grave & "me";
      elsif Locale = "da" then
         return Base & "ende";
      elsif Locale = "es" then
         return Base & "avo";
      elsif Locale = "it" then
         return Base & U_E_Acute & "simo";
      elsif Locale = "pt" then
         return Base & U_E_Acute & "simo";
      elsif Locale = "nl" then
         return Base & "ste";
      elsif Locale = "sv" then
         if Value mod 10 = 1 or else Value mod 10 = 2 then
            return Base & "a";
         else
            return Base & "de";
         end if;
      elsif Humanize.Locales.Is_Norwegian (Locale) then
         return Base & "ende";
      elsif Locale = "fi" then
         return Base & "s";
      elsif Locale = "tr" then
         return Base & Turkish_Ordinal_Ending;
      elsif Humanize.Locales.Is_CJK (Locale) then
         if Locale = "ko" then
            return Base & U (16#BC88#) & U (16#C9F8#);
         else
            return U (16#7B2C#) & Base;
         end if;
      elsif Locale = "pl" then
         return Base & "y";
      elsif Locale = "cs" then
         return Base & U (16#FD#);
      elsif Locale = "ru" then
         return Base & "-" & U (16#439#);
      elsif Locale = "uk" then
         return Base & "-" & U (16#439#);
      elsif Locale = "ar" then
         return U (16#627#) & U (16#644#) & Base;
      elsif Locale = "hi" then
         return Base & U (16#935#) & U (16#93E#) & U (16#901#);
      elsif Has_Generated_Spellout (Locale) then
         return Base;
      else
         return Ordinal_Words_Text (Value);
      end if;
   end Locale_Ordinal_Words_Text;
