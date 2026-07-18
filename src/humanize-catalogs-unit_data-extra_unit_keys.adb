--  Provenance: generated from Humanize unit catalog templates; split shard: extra unit catalog keys.

pragma Style_Checks (Off);

separate (Humanize.Catalogs.Unit_Data)
function Extra_Unit_Keys (Locale : String) return String is
begin
   if Locale = "da" then
      return
        Unit_Line (Locale, "nautical_mile", B ("73C3B86D696C"), B ("73C3B86D696C"))
        & Unit_Line (Locale, "acre", "acre", "acres")
        & Unit_Line (Locale, "square_kilometer", "kvadratkilometer", "kvadratkilometer")
        & Unit_Line (Locale, "cubic_meter", "kubikmeter", "kubikmeter")
        & Unit_Line (Locale, "teaspoon", "teske", "teskeer")
        & Unit_Line (Locale, "tablespoon", "spiseske", "spiseskeer")
        & Unit_Line (Locale, "cup", "kop", "kopper")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "ton", "ton")
        & Unit_Line (Locale, "ton", "ton", "ton");
   elsif Locale = "de" then
      return
        Unit_Line (Locale, "nautical_mile", "Seemeile", "Seemeilen")
        & Unit_Line (Locale, "acre", "Acre", "Acres")
        & Unit_Line (Locale, "square_kilometer", "Quadratkilometer", "Quadratkilometer")
        & Unit_Line (Locale, "cubic_meter", "Kubikmeter", "Kubikmeter")
        & Unit_Line (Locale, "teaspoon", B ("5465656CC3B66666656C"), B ("5465656CC3B66666656C"))
        & Unit_Line (Locale, "tablespoon", B ("4573736CC3B66666656C"), B ("4573736CC3B66666656C"))
        & Unit_Line (Locale, "cup", "Tasse", "Tassen")
        & Unit_Line (Locale, "stone", "Stone", "Stone")
        & Unit_Line (Locale, "tonne", "Tonne", "Tonnen")
        & Unit_Line (Locale, "ton", "Tonne", "Tonnen");
   elsif Locale = "fr" then
      return
        Unit_Line (Locale, "nautical_mile", "mille marin", "milles marins")
        & Unit_Line (Locale, "acre", "acre", "acres")
        & Unit_Line
          (Locale, "square_kilometer",
           B ("6B696C6F6DC3A87472652063617272C3A9"),
           B ("6B696C6F6DC3A8747265732063617272C3A973"))
        & Unit_Line
          (Locale, "cubic_meter", B ("6DC3A87472652063756265"),
           B ("6DC3A874726573206375626573"))
        & Unit_Line
          (Locale, "teaspoon",
           B ("6375696C6CC3A8726520C3A020636166C3A9"),
           B ("6375696C6CC3A872657320C3A020636166C3A9"))
        & Unit_Line
          (Locale, "tablespoon",
           B ("6375696C6CC3A8726520C3A020736F757065"),
           B ("6375696C6CC3A872657320C3A020736F757065"))
        & Unit_Line (Locale, "cup", "tasse", "tasses")
        & Unit_Line (Locale, "stone", "stone", "stones")
        & Unit_Line (Locale, "tonne", "tonne", "tonnes")
        & Unit_Line (Locale, "ton", "tonne courte", "tonnes courtes");
   elsif Locale = "es" then
      return
        Unit_Line
          (Locale, "nautical_mile",
           B ("6D696C6C61206EC3A17574696361"),
           B ("6D696C6C6173206EC3A1757469636173"))
        & Unit_Line (Locale, "acre", "acre", "acres")
        & Unit_Line
          (Locale, "square_kilometer",
           B ("6B696CC3B36D6574726F20637561647261646F"),
           B ("6B696CC3B36D6574726F7320637561647261646F73"))
        & Unit_Line
          (Locale, "cubic_meter", B ("6D6574726F2063C3BA6269636F"),
           B ("6D6574726F732063C3BA6269636F73"))
        & Unit_Line (Locale, "teaspoon", "cucharadita", "cucharaditas")
        & Unit_Line (Locale, "tablespoon", "cucharada", "cucharadas")
        & Unit_Line (Locale, "cup", "taza", "tazas")
        & Unit_Line (Locale, "stone", "stone", "stones")
        & Unit_Line (Locale, "tonne", "tonelada", "toneladas")
        & Unit_Line (Locale, "ton", "tonelada corta", "toneladas cortas");
   elsif Locale = "it" then
      return
        Unit_Line (Locale, "nautical_mile", "miglio nautico", "miglia nautiche")
        & Unit_Line (Locale, "acre", "acro", "acri")
        & Unit_Line (Locale, "square_kilometer", "chilometro quadrato", "chilometri quadrati")
        & Unit_Line (Locale, "cubic_meter", "metro cubo", "metri cubi")
        & Unit_Line (Locale, "teaspoon", "cucchiaino", "cucchiaini")
        & Unit_Line (Locale, "tablespoon", "cucchiaio", "cucchiai")
        & Unit_Line (Locale, "cup", "tazza", "tazze")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "tonnellata", "tonnellate")
        & Unit_Line (Locale, "ton", "tonnellata corta", "tonnellate corte");
   elsif Locale = "pt" then
      return
        Unit_Line
          (Locale, "nautical_mile",
           B ("6D696C6861206EC3A17574696361"),
           B ("6D696C686173206EC3A1757469636173"))
        & Unit_Line (Locale, "acre", "acre", "acres")
        & Unit_Line
          (Locale, "square_kilometer",
           B ("7175696CC3B46D6574726F20717561647261646F"),
           B ("7175696CC3B46D6574726F7320717561647261646F73"))
        & Unit_Line
          (Locale, "cubic_meter", B ("6D6574726F2063C3BA6269636F"),
           B ("6D6574726F732063C3BA6269636F73"))
        & Unit_Line
          (Locale, "teaspoon", B ("636F6C686572206465206368C3A1"),
           B ("636F6C6865726573206465206368C3A1"))
        & Unit_Line (Locale, "tablespoon", "colher de sopa", "colheres de sopa")
        & Unit_Line (Locale, "cup", B ("78C3AD63617261"), B ("78C3AD6361726173"))
        & Unit_Line (Locale, "stone", "stone", "stones")
        & Unit_Line (Locale, "tonne", "tonelada", "toneladas")
        & Unit_Line (Locale, "ton", "tonelada curta", "toneladas curtas");
   elsif Locale = "nl" then
      return
        Unit_Line (Locale, "nautical_mile", "zeemijl", "zeemijl")
        & Unit_Line (Locale, "acre", "acre", "acres")
        & Unit_Line (Locale, "square_kilometer", "vierkante kilometer", "vierkante kilometer")
        & Unit_Line (Locale, "cubic_meter", "kubieke meter", "kubieke meter")
        & Unit_Line (Locale, "teaspoon", "theelepel", "theelepels")
        & Unit_Line (Locale, "tablespoon", "eetlepel", "eetlepels")
        & Unit_Line (Locale, "cup", "kop", "koppen")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "ton", "ton")
        & Unit_Line (Locale, "ton", "short ton", "short tons");
   elsif Locale = "sv" then
      return
        Unit_Line (Locale, "nautical_mile",
          B ("736AC3B66D696C"), B ("736AC3B66D696C"))
        & Unit_Line (Locale, "acre", "acre", "acre")
        & Unit_Line (Locale, "square_kilometer", "kvadratkilometer", "kvadratkilometer")
        & Unit_Line (Locale, "cubic_meter", "kubikmeter", "kubikmeter")
        & Unit_Line (Locale, "teaspoon", "tesked", "teskedar")
        & Unit_Line (Locale, "tablespoon", "matsked", "matskedar")
        & Unit_Line (Locale, "cup", "kopp", "koppar")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "ton", "ton")
        & Unit_Line (Locale, "ton", "kort ton", "korta ton");
   elsif Humanize.Locales.Is_Norwegian (Locale) then
      return
        Unit_Line (Locale, "nautical_mile", "nautisk mil", "nautiske mil")
        & Unit_Line (Locale, "acre", "acre", "acre")
        & Unit_Line (Locale, "square_kilometer", "kvadratkilometer", "kvadratkilometer")
        & Unit_Line (Locale, "cubic_meter", "kubikkmeter", "kubikkmeter")
        & Unit_Line (Locale, "teaspoon", "teskje", "teskjeer")
        & Unit_Line (Locale, "tablespoon", "spiseskje", "spiseskjeer")
        & Unit_Line (Locale, "cup", "kopp", "kopper")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "tonn", "tonn")
        & Unit_Line (Locale, "ton", "kort tonn", "korte tonn");
   elsif Locale = "fi" then
      return
        Unit_Line (Locale, "nautical_mile", "meripeninkulma", "meripeninkulmaa")
        & Unit_Line (Locale, "acre", "eekkeri", B ("65656B6B657269C3A4"))
        & Unit_Line
            (Locale, "square_kilometer",
             B ("6E656C69C3B66B696C6F6D65747269"),
             B ("6E656C69C3B66B696C6F6D65747269C3A4"))
        & Unit_Line
            (Locale, "cubic_meter", "kuutiometri",
             B ("6B757574696F6D65747269C3A4"))
        & Unit_Line (Locale, "teaspoon", "teelusikka", "teelusikkaa")
        & Unit_Line (Locale, "tablespoon", "ruokalusikka", "ruokalusikkaa")
        & Unit_Line (Locale, "cup", "kuppi", "kuppia")
        & Unit_Line (Locale, "stone", "stone", "stonea")
        & Unit_Line (Locale, "tonne", "tonni", "tonnia")
        & Unit_Line
            (Locale, "ton", "lyhyt tonni",
             B ("6C7968797474C3A420746F6E6E6961"));
   elsif Locale = "pl" then
      return
        Unit_Line (Locale, "nautical_mile", "mila morska", "mile morskie")
        & Unit_Line (Locale, "acre", "akr", "akry")
        & Unit_Line (Locale, "square_kilometer", "kilometr kwadratowy", "kilometry kwadratowe")
        & Unit_Line
            (Locale, "cubic_meter",
             B ("6D65747220737A65C59B6369656E6E79"),
             B ("6D6574727920737A65C59B6369656E6E65"))
        & Unit_Line
            (Locale, "teaspoon",
             B ("C58279C5BC65637A6B61"),
             B ("C58279C5BC65637A6B69"))
        & Unit_Line
            (Locale, "tablespoon",
             B ("C58279C5BC6B612073746FC5826F7761"),
             B ("C58279C5BC6B692073746FC5826F7765"))
        & Unit_Line
            (Locale, "cup",
             B ("66696C69C5BC616E6B61"),
             B ("66696C69C5BC616E6B69"))
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "tona", "tony")
        & Unit_Line
            (Locale, "ton",
             B ("746F6E61206B72C3B3746B61"),
             B ("746F6E79206B72C3B3746B6965"));
   elsif Locale = "cs" then
      return
        Unit_Line
          (Locale, "nautical_mile",
           B ("6EC3A16D6FC5996EC3AD206DC3AD6C65"),
           B ("6EC3A16D6FC5996EC3AD206DC3AD6C65"))
        & Unit_Line (Locale, "acre", "akr", "akry")
        & Unit_Line
            (Locale, "square_kilometer",
             B ("6B696C6F6D65747220C48D7476657265C48D6EC3BD"),
             B ("6B696C6F6D6574727920C48D7476657265C48D6EC3A9"))
        & Unit_Line
            (Locale, "cubic_meter",
             B ("6D657472206B727963686C6F76C3BD"),
             B ("6D65747279206B727963686C6F76C3A9"))
        & Unit_Line
            (Locale, "teaspoon",
             B ("C48D616A6F76C3A1206CC5BE69C48D6B61"),
             B ("C48D616A6F76C3A9206CC5BE69C48D6B79"))
        & Unit_Line
            (Locale, "tablespoon",
             B ("706F6CC3A9766B6F76C3A1206CC5BE696365"),
             B ("706F6CC3A9766B6F76C3A9206CC5BE696365"))
        & Unit_Line (Locale, "cup", B ("C5A1C3A16C656B"), B ("C5A1C3A16C6B79"))
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "tuna", "tuny")
        & Unit_Line
            (Locale, "ton",
             B ("6B72C3A1746BC3A12074756E61"),
             B ("6B72C3A1746BC3A92074756E79"));
   elsif Locale = "tr" then
      return
        Unit_Line (Locale, "nautical_mile", "deniz mili", "deniz mili")
        & Unit_Line (Locale, "acre", "akr", "akr")
        & Unit_Line (Locale, "square_kilometer", "kilometrekare", "kilometrekare")
        & Unit_Line
            (Locale, "cubic_meter",
             B ("6D657472656BC3BC70"),
             B ("6D657472656BC3BC70"))
        & Unit_Line
            (Locale, "teaspoon",
             B ("C3A76179206B61C59FC4B1C49FC4B1"),
             B ("C3A76179206B61C59FC4B1C49FC4B1"))
        & Unit_Line
            (Locale, "tablespoon",
             B ("79656D656B206B61C59FC4B1C49FC4B1"),
             B ("79656D656B206B61C59FC4B1C49FC4B1"))
        & Unit_Line (Locale, "cup", "bardak", "bardak")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "ton", "ton")
        & Unit_Line
            (Locale, "ton",
             B ("6BC4B1736120746F6E"),
             B ("6BC4B1736120746F6E"));
   elsif Locale = "ru" then
      return
        Extra_Unit_Keys_With_Tail
          (Locale,
           B ("D187D0B0D0B9D0BDD0B0D18F20D0BBD0BED0B6D0BAD0B0"),
           B ("D187D0B0D0B9D0BDD18BD0B520D0BBD0BED0B6D0BAD0B8"));
   elsif Locale = "uk" then
      return
        Extra_Unit_Keys_With_Tail
          (Locale,
           B ("D187D0B0D0B9D0BDD0B020D0BBD0BED0B6D0BAD0B0"),
           B ("D187D0B0D0B9D0BDD19620D0BBD0BED0B6D0BAD0B8"));
   elsif Locale = "ja" then
      return
        Extra_Unit_Keys_With_Tail
          (Locale, B ("E5B08FE38195E38198"), B ("E5B08FE38195E38198"));
   elsif Locale = "ko" then
      return
        Extra_Unit_Keys_With_Tail
          (Locale, B ("ED8BB0EC8AA4ED91BC"), B ("ED8BB0EC8AA4ED91BC"));
   elsif Locale = "zh" then
      return
        Extra_Unit_Keys_With_Tail
          (Locale, B ("E88CB6E58C99"), B ("E88CB6E58C99"));
   elsif Locale = "ar" then
      return
        Extra_Unit_Keys_With_Tail
          (Locale,
           B ("D985D984D8B9D982D8A920D8B5D8BAD98AD8B1D8A9"),
           B ("D985D984D8A7D8B9D98220D8B5D8BAD98AD8B1D8A9"));
   elsif Locale = "hi" then
      return
        Extra_Unit_Keys_With_Tail
          (Locale,
           B ("E0A49AE0A4AEE0A58DE0A4AEE0A49A"),
           B ("E0A49AE0A4AEE0A58DE0A4AEE0A49A"));
   elsif Locale = "ro" then
      return
        Unit_Line (Locale, "nautical_mile", "mila nautica", "mile nautice")
        & Unit_Line (Locale, "acre", "acru", "acri")
        & Unit_Line (Locale, "square_kilometer", "kilometru patrat", "kilometri patrati")
        & Unit_Line (Locale, "cubic_meter", "metru cub", "metri cubi")
        & Unit_Line (Locale, "teaspoon", "lingurita", "lingurite")
        & Unit_Line (Locale, "tablespoon", "lingura", "linguri")
        & Unit_Line (Locale, "cup", "cana", "cani")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "tona", "tone")
        & Unit_Line (Locale, "ton", "tona scurta", "tone scurte");
   elsif Locale = "lt" then
      return
        Unit_Line (Locale, "nautical_mile", "jurmyli", "jurmyles")
        & Unit_Line (Locale, "acre", "akras", "akrai")
        & Unit_Line (Locale, "square_kilometer", "kvadratinis kilometras", "kvadratiniai kilometrai")
        & Unit_Line (Locale, "cubic_meter", "kubinis metras", "kubiniai metrai")
        & Unit_Line (Locale, "teaspoon", "arbatinis saukstelis", "arbatiniai sauksteliai")
        & Unit_Line (Locale, "tablespoon", "valgomasis saukstas", "valgomieji saukstai")
        & Unit_Line (Locale, "cup", "puodelis", "puodeliai")
        & Unit_Line (Locale, "stone", "stounas", "stounai")
        & Unit_Line (Locale, "tonne", "tona", "tonos")
        & Unit_Line (Locale, "ton", "trumpoji tona", "trumposios tonos");
   elsif Locale = "sl" then
      return
        Unit_Line (Locale, "nautical_mile", "navticna milja", "navticne milje")
        & Unit_Line (Locale, "acre", "aker", "akri")
        & Unit_Line (Locale, "square_kilometer", "kvadratni kilometer", "kvadratni kilometri")
        & Unit_Line (Locale, "cubic_meter", "kubicni meter", "kubicni metri")
        & Unit_Line (Locale, "teaspoon", "cajna zlicka", "cajne zlicke")
        & Unit_Line (Locale, "tablespoon", "jedilna zlica", "jedilne zlice")
        & Unit_Line (Locale, "cup", "skodelica", "skodelice")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "tona", "tone")
        & Unit_Line (Locale, "ton", "kratka tona", "kratke tone");
   elsif Locale = "id" or else Locale = "ms" then
      return
        Unit_Line (Locale, "nautical_mile", "mil laut", "mil laut")
        & Unit_Line (Locale, "acre", "ekar", "ekar")
        & Unit_Line (Locale, "square_kilometer", "kilometer persegi", "kilometer persegi")
        & Unit_Line (Locale, "cubic_meter", "meter kubik", "meter kubik")
        & Unit_Line (Locale, "teaspoon", "sendok teh", "sendok teh")
        & Unit_Line (Locale, "tablespoon", "sendok makan", "sendok makan")
        & Unit_Line (Locale, "cup", "cangkir", "cangkir")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "ton metrik", "ton metrik")
        & Unit_Line (Locale, "ton", "ton pendek", "ton pendek");
   elsif Locale = "eo" then
      return
        Unit_Line (Locale, "nautical_mile", "nautika mejlo", "nautikaj mejloj")
        & Unit_Line (Locale, "acre", "akreo", "akreoj")
        & Unit_Line (Locale, "square_kilometer", "kvadrata kilometro", "kvadrataj kilometroj")
        & Unit_Line (Locale, "cubic_meter", "kuba metro", "kubaj metroj")
        & Unit_Line (Locale, "teaspoon", "tekulero", "tekuleroj")
        & Unit_Line (Locale, "tablespoon", "supkulero", "supkuleroj")
        & Unit_Line (Locale, "cup", "taso", "tasoj")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "tuno", "tunoj")
        & Unit_Line (Locale, "ton", "mallonga tuno", "mallongaj tunoj");
   elsif Locale = "vi" then
      return
        Unit_Line (Locale, "nautical_mile", "hai ly", "hai ly")
        & Unit_Line (Locale, "acre", "mau Anh", "mau Anh")
        & Unit_Line (Locale, "square_kilometer", "kilomet vuong", "kilomet vuong")
        & Unit_Line (Locale, "cubic_meter", "met khoi", "met khoi")
        & Unit_Line (Locale, "teaspoon", "thia ca phe", "thia ca phe")
        & Unit_Line (Locale, "tablespoon", "thia canh", "thia canh")
        & Unit_Line (Locale, "cup", "coc", "coc")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "tan", "tan")
        & Unit_Line (Locale, "ton", "tan ngan", "tan ngan");
   elsif Locale = "sw" then
      return
        Unit_Line (Locale, "nautical_mile", "maili ya baharini", "maili za baharini")
        & Unit_Line (Locale, "acre", "ekari", "ekari")
        & Unit_Line (Locale, "square_kilometer", "kilomita ya mraba", "kilomita za mraba")
        & Unit_Line (Locale, "cubic_meter", "mita ya ujazo", "mita za ujazo")
        & Unit_Line (Locale, "teaspoon", "kijiko cha chai", "vijiko vya chai")
        & Unit_Line (Locale, "tablespoon", "kijiko cha chakula", "vijiko vya chakula")
        & Unit_Line (Locale, "cup", "kikombe", "vikombe")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "tani", "tani")
        & Unit_Line (Locale, "ton", "tani fupi", "tani fupi");
   elsif Locale = "af" then
      return
        Unit_Line (Locale, "nautical_mile", "seemyl", "seemyl")
        & Unit_Line (Locale, "acre", "akker", "akker")
        & Unit_Line (Locale, "square_kilometer", "vierkante kilometer", "vierkante kilometer")
        & Unit_Line (Locale, "cubic_meter", "kubieke meter", "kubieke meter")
        & Unit_Line (Locale, "teaspoon", "teelepel", "teelepels")
        & Unit_Line (Locale, "tablespoon", "eetlepel", "eetlepels")
        & Unit_Line (Locale, "cup", "koppie", "koppies")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "ton", "ton")
        & Unit_Line (Locale, "ton", "kort ton", "kort ton");
   elsif Locale = "hu" then
      return
        Unit_Line (Locale, "nautical_mile", "tengeri merfold", "tengeri merfold")
        & Unit_Line (Locale, "acre", "acre", "acre")
        & Unit_Line (Locale, "square_kilometer", "negyzetkilometer", "negyzetkilometer")
        & Unit_Line (Locale, "cubic_meter", "kobmeter", "kobmeter")
        & Unit_Line (Locale, "teaspoon", "teaskanal", "teaskanal")
        & Unit_Line (Locale, "tablespoon", "evokanal", "evokanal")
        & Unit_Line (Locale, "cup", "csesze", "csesze")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "tonna", "tonna")
        & Unit_Line (Locale, "ton", "rovid tonna", "rovid tonna");
   elsif Locale = "sk" then
      return
        Unit_Line (Locale, "nautical_mile", "namorna mila", "namorne mile")
        & Unit_Line (Locale, "acre", "aker", "akre")
        & Unit_Line (Locale, "square_kilometer", "stvorcovy kilometer", "stvorcove kilometre")
        & Unit_Line (Locale, "cubic_meter", "kubicky meter", "kubicke metre")
        & Unit_Line (Locale, "teaspoon", "cajova lyzicka", "cajove lyzicky")
        & Unit_Line (Locale, "tablespoon", "polievkova lyzica", "polievkove lyzice")
        & Unit_Line (Locale, "cup", "salku", "salky")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "tona", "tony")
        & Unit_Line (Locale, "ton", "kratka tona", "kratke tony");
   else
      return
        Unit_Line (Locale, "nautical_mile", "nautical mile", "nautical miles")
        & Unit_Line (Locale, "acre", "acre", "acres")
        & Unit_Line
            (Locale, "square_kilometer",
             "square kilometer", "square kilometers")
        & Unit_Line (Locale, "cubic_meter", "cubic meter", "cubic meters")
        & Unit_Line (Locale, "teaspoon", "teaspoon", "teaspoons")
        & Unit_Line (Locale, "tablespoon", "tablespoon", "tablespoons")
        & Unit_Line (Locale, "cup", "cup", "cups")
        & Unit_Line (Locale, "stone", "stone", "stone")
        & Unit_Line (Locale, "tonne", "tonne", "tonnes")
        & Unit_Line (Locale, "ton", "ton", "tons");
   end if;
end Extra_Unit_Keys;
