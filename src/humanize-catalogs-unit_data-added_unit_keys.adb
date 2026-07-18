--  Provenance: generated from Humanize unit catalog templates; split shard: added unit catalog keys.

pragma Style_Checks (Off);

separate (Humanize.Catalogs.Unit_Data)
function Added_Unit_Keys (Locale : String) return String is
begin
   if Locale = "da" then
      return
        Unit_Line (Locale, "celsius", "grad Celsius", "grader Celsius")
        & Unit_Line (Locale, "fahrenheit", "grad Fahrenheit", "grader Fahrenheit")
        & Unit_Line (Locale, "square_meter", "kvadratmeter", "kvadratmeter")
        & Unit_Line (Locale, "hectare", "hektar", "hektar")
        & Unit_Line (Locale, "kilometer_per_hour", "kilometer i timen", "kilometer i timen")
        & Unit_Line (Locale, "meter_per_second", "meter i sekundet", "meter i sekundet")
        & Unit_Line (Locale, "pascal", "pascal", "pascal")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
        & Unit_Line (Locale, "joule", "joule", "joule")
        & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoule")
        & Unit_Line (Locale, "watt", "watt", "watt")
        & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatt")
        & Unit_Line (Locale, "hertz", "hertz", "hertz")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
        & Unit_Line (Locale, "degree", "grad", "grader")
        & Unit_Line (Locale, "mile", "mile", "miles")
        & Unit_Line (Locale, "yard", "yard", "yards")
        & Unit_Line (Locale, "foot", "fod", "fod")
        & Unit_Line (Locale, "inch", "tomme", "tommer")
        & Unit_Line (Locale, "gallon", "gallon", "gallons")
        & Unit_Line (Locale, "pound", "pund", "pund")
        & Unit_Line (Locale, "ounce", "ounce", "ounces");
   elsif Locale = "de" then
      return
        Unit_Line (Locale, "celsius", "Grad Celsius", "Grad Celsius")
        & Unit_Line (Locale, "fahrenheit", "Grad Fahrenheit", "Grad Fahrenheit")
        & Unit_Line (Locale, "square_meter", "Quadratmeter", "Quadratmeter")
        & Unit_Line (Locale, "hectare", "Hektar", "Hektar")
        & Unit_Line (Locale, "kilometer_per_hour", "Kilometer pro Stunde", "Kilometer pro Stunde")
        & Unit_Line (Locale, "meter_per_second", "Meter pro Sekunde", "Meter pro Sekunde")
        & Unit_Line (Locale, "pascal", "Pascal", "Pascal")
        & Unit_Line (Locale, "kilopascal", "Kilopascal", "Kilopascal")
        & Unit_Line (Locale, "joule", "Joule", "Joule")
        & Unit_Line (Locale, "kilojoule", "Kilojoule", "Kilojoule")
        & Unit_Line (Locale, "watt", "Watt", "Watt")
        & Unit_Line (Locale, "kilowatt", "Kilowatt", "Kilowatt")
        & Unit_Line (Locale, "hertz", "Hertz", "Hertz")
        & Unit_Line (Locale, "kilohertz", "Kilohertz", "Kilohertz")
        & Unit_Line (Locale, "degree", "Grad", "Grad")
        & Unit_Line (Locale, "mile", "Meile", "Meilen")
        & Unit_Line (Locale, "yard", "Yard", "Yards")
        & Unit_Line (Locale, "foot", B ("4675C39F"), B ("4675C39F"))
        & Unit_Line (Locale, "inch", "Zoll", "Zoll")
        & Unit_Line (Locale, "gallon", "Gallone", "Gallonen")
        & Unit_Line (Locale, "pound", "Pfund", "Pfund")
        & Unit_Line (Locale, "ounce", "Unze", "Unzen");
   elsif Locale = "fr" then
      return
        Unit_Line
          (Locale, "celsius", B ("64656772C3A92043656C73697573"),
           B ("64656772C3A9732043656C73697573"))
        & Unit_Line
          (Locale, "fahrenheit",
           B ("64656772C3A92046616872656E68656974"),
           B ("64656772C3A9732046616872656E68656974"))
        & Unit_Line
          (Locale, "square_meter",
           B ("6DC3A87472652063617272C3A9"),
           B ("6DC3A8747265732063617272C3A973"))
        & Unit_Line (Locale, "hectare", "hectare", "hectares")
        & Unit_Line
          (Locale, "kilometer_per_hour",
           B ("6B696C6F6DC3A874726520706172206865757265"),
           B ("6B696C6F6DC3A87472657320706172206865757265"))
        & Unit_Line
          (Locale, "meter_per_second",
           B ("6DC3A874726520706172207365636F6E6465"),
           B ("6DC3A87472657320706172207365636F6E6465"))
        & Unit_Line (Locale, "pascal", "pascal", "pascals")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascals")
        & Unit_Line (Locale, "joule", "joule", "joules")
        & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoules")
        & Unit_Line (Locale, "watt", "watt", "watts")
        & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatts")
        & Unit_Line (Locale, "hertz", "hertz", "hertz")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
        & Unit_Line
          (Locale, "degree", B ("64656772C3A9"),
           B ("64656772C3A973"))
        & Unit_Line (Locale, "mile", "mille", "milles")
        & Unit_Line (Locale, "yard", "yard", "yards")
        & Unit_Line (Locale, "foot", "pied", "pieds")
        & Unit_Line (Locale, "inch", "pouce", "pouces")
        & Unit_Line (Locale, "gallon", "gallon", "gallons")
        & Unit_Line (Locale, "pound", "livre", "livres")
        & Unit_Line (Locale, "ounce", "once", "onces");
   elsif Locale = "es" then
      return
        Unit_Line (Locale, "celsius", "grado Celsius", "grados Celsius")
        & Unit_Line (Locale, "fahrenheit", "grado Fahrenheit", "grados Fahrenheit")
        & Unit_Line (Locale, "square_meter", "metro cuadrado", "metros cuadrados")
        & Unit_Line
          (Locale, "hectare", B ("68656374C3A1726561"),
           B ("68656374C3A172656173"))
        & Unit_Line
          (Locale, "kilometer_per_hour",
           B ("6B696CC3B36D6574726F20706F7220686F7261"),
           B ("6B696CC3B36D6574726F7320706F7220686F7261"))
        & Unit_Line (Locale, "meter_per_second", "metro por segundo", "metros por segundo")
        & Unit_Line (Locale, "pascal", "pascal", "pascales")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascales")
        & Unit_Line (Locale, "joule", "julio", "julios")
        & Unit_Line (Locale, "kilojoule", "kilojulio", "kilojulios")
        & Unit_Line (Locale, "watt", "vatio", "vatios")
        & Unit_Line (Locale, "kilowatt", "kilovatio", "kilovatios")
        & Unit_Line (Locale, "hertz", "hercio", "hercios")
        & Unit_Line (Locale, "kilohertz", "kilohercio", "kilohercios")
        & Unit_Line (Locale, "degree", "grado", "grados")
        & Unit_Line (Locale, "mile", "milla", "millas")
        & Unit_Line (Locale, "yard", "yarda", "yardas")
        & Unit_Line (Locale, "foot", "pie", "pies")
        & Unit_Line (Locale, "inch", "pulgada", "pulgadas")
        & Unit_Line (Locale, "gallon", "galon", "galones")
        & Unit_Line (Locale, "pound", "libra", "libras")
        & Unit_Line (Locale, "ounce", "onza", "onzas");
   elsif Locale = "it" then
      return
        Unit_Line (Locale, "celsius", "grado Celsius", "gradi Celsius")
        & Unit_Line (Locale, "fahrenheit", "grado Fahrenheit", "gradi Fahrenheit")
        & Unit_Line (Locale, "square_meter", "metro quadrato", "metri quadrati")
        & Unit_Line (Locale, "hectare", "ettaro", "ettari")
        & Unit_Line (Locale, "kilometer_per_hour", "chilometro all'ora", "chilometri all'ora")
        & Unit_Line (Locale, "meter_per_second", "metro al secondo", "metri al secondo")
        & Unit_Line (Locale, "pascal", "pascal", "pascal")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
        & Unit_Line (Locale, "joule", "joule", "joule")
        & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoule")
        & Unit_Line (Locale, "watt", "watt", "watt")
        & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatt")
        & Unit_Line (Locale, "hertz", "hertz", "hertz")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
        & Unit_Line (Locale, "degree", "grado", "gradi")
        & Unit_Line (Locale, "mile", "miglio", "miglia")
        & Unit_Line (Locale, "yard", "iarda", "iarde")
        & Unit_Line (Locale, "foot", "piede", "piedi")
        & Unit_Line (Locale, "inch", "pollice", "pollici")
        & Unit_Line (Locale, "gallon", "gallone", "galloni")
        & Unit_Line (Locale, "pound", "libbra", "libbre")
        & Unit_Line (Locale, "ounce", "oncia", "once");
   elsif Locale = "pt" then
      return
        Unit_Line (Locale, "celsius", "grau Celsius", "graus Celsius")
        & Unit_Line (Locale, "fahrenheit", "grau Fahrenheit", "graus Fahrenheit")
        & Unit_Line (Locale, "square_meter", "metro quadrado", "metros quadrados")
        & Unit_Line (Locale, "hectare", "hectare", "hectares")
        & Unit_Line
          (Locale, "kilometer_per_hour",
           B ("7175696CC3B46D6574726F20706F7220686F7261"),
           B ("7175696CC3B46D6574726F7320706F7220686F7261"))
        & Unit_Line (Locale, "meter_per_second", "metro por segundo", "metros por segundo")
        & Unit_Line (Locale, "pascal", "pascal", "pascais")
        & Unit_Line (Locale, "kilopascal", "quilopascal", "quilopascais")
        & Unit_Line (Locale, "joule", "joule", "joules")
        & Unit_Line (Locale, "kilojoule", "quilojoule", "quilojoules")
        & Unit_Line (Locale, "watt", "watt", "watts")
        & Unit_Line (Locale, "kilowatt", "quilowatt", "quilowatts")
        & Unit_Line (Locale, "hertz", "hertz", "hertz")
        & Unit_Line (Locale, "kilohertz", "quilohertz", "quilohertz")
        & Unit_Line (Locale, "degree", "grau", "graus")
        & Unit_Line (Locale, "mile", "milha", "milhas")
        & Unit_Line (Locale, "yard", "jarda", "jardas")
        & Unit_Line (Locale, "foot", B ("70C3A9"), B ("70C3A973"))
        & Unit_Line (Locale, "inch", "polegada", "polegadas")
        & Unit_Line (Locale, "gallon", B ("67616CC3A36F"), B ("67616CC3B56573"))
        & Unit_Line (Locale, "pound", "libra", "libras")
        & Unit_Line (Locale, "ounce", B ("6F6EC3A761"), B ("6F6EC3A76173"));
   elsif Locale = "sv" then
      return
        Unit_Line (Locale, "celsius", "grad Celsius", "grader Celsius")
        & Unit_Line (Locale, "fahrenheit", "grad Fahrenheit", "grader Fahrenheit")
        & Unit_Line (Locale, "square_meter", "kvadratmeter", "kvadratmeter")
        & Unit_Line (Locale, "hectare", "hektar", "hektar")
        & Unit_Line (Locale, "kilometer_per_hour", "kilometer i timmen", "kilometer i timmen")
        & Unit_Line (Locale, "meter_per_second", "meter per sekund", "meter per sekund")
        & Unit_Line (Locale, "pascal", "pascal", "pascal")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
        & Unit_Line (Locale, "joule", "joule", "joule")
        & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoule")
        & Unit_Line (Locale, "watt", "watt", "watt")
        & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatt")
        & Unit_Line (Locale, "hertz", "hertz", "hertz")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
        & Unit_Line (Locale, "degree", "grad", "grader")
        & Unit_Line (Locale, "mile", "mile", "miles")
        & Unit_Line (Locale, "yard", "yard", "yards")
        & Unit_Line (Locale, "foot", "fot", B ("66C3B674746572"))
        & Unit_Line (Locale, "inch", "tum", "tum")
        & Unit_Line (Locale, "gallon", "gallon", "gallon")
        & Unit_Line (Locale, "pound", "pund", "pund")
        & Unit_Line (Locale, "ounce", "uns", "uns");
   elsif Humanize.Locales.Is_Norwegian (Locale) then
      return
        Unit_Line (Locale, "celsius", "grad Celsius", "grader Celsius")
        & Unit_Line (Locale, "fahrenheit", "grad Fahrenheit", "grader Fahrenheit")
        & Unit_Line (Locale, "square_meter", "kvadratmeter", "kvadratmeter")
        & Unit_Line (Locale, "hectare", "hektar", "hektar")
        & Unit_Line (Locale, "kilometer_per_hour", "kilometer i timen", "kilometer i timen")
        & Unit_Line (Locale, "meter_per_second", "meter per sekund", "meter per sekund")
        & Unit_Line (Locale, "pascal", "pascal", "pascal")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
        & Unit_Line (Locale, "joule", "joule", "joule")
        & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoule")
        & Unit_Line (Locale, "watt", "watt", "watt")
        & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatt")
        & Unit_Line (Locale, "hertz", "hertz", "hertz")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
        & Unit_Line (Locale, "degree", "grad", "grader")
        & Unit_Line (Locale, "mile", "mile", "miles")
        & Unit_Line (Locale, "yard", "yard", "yards")
        & Unit_Line (Locale, "foot", "fot", B ("66C3B874746572"))
        & Unit_Line (Locale, "inch", "tomme", "tommer")
        & Unit_Line (Locale, "gallon", "gallon", "gallon")
        & Unit_Line (Locale, "pound", "pund", "pund")
        & Unit_Line (Locale, "ounce", "unse", "unser");
   elsif Locale = "fi" then
      return
        Unit_Line (Locale, "celsius", "celsiusaste", "celsiusastetta")
        & Unit_Line (Locale, "fahrenheit", "fahrenheitaste", "fahrenheitastetta")
        & Unit_Line
            (Locale, "square_meter",
             B ("6E656C69C3B66D65747269"),
             B ("6E656C69C3B66D65747269C3A4"))
        & Unit_Line (Locale, "hectare", "hehtaari", "hehtaaria")
        & Unit_Line
            (Locale, "kilometer_per_hour", "kilometri tunnissa",
             B ("6B696C6F6D65747269C3A42074756E6E69737361"))
        & Unit_Line
            (Locale, "meter_per_second", "metri sekunnissa",
             B ("6D65747269C3A42073656B756E6E69737361"))
        & Unit_Line (Locale, "pascal", "pascal", "pascalia")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascalia")
        & Unit_Line (Locale, "joule", "joule", "joulea")
        & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoulea")
        & Unit_Line (Locale, "watt", "watti", "wattia")
        & Unit_Line (Locale, "kilowatt", "kilowatti", "kilowattia")
        & Unit_Line (Locale, "hertz", "hertsi", B ("686572747369C3A4"))
        & Unit_Line
            (Locale, "kilohertz", "kilohertsi",
             B ("6B696C6F686572747369C3A4"))
        & Unit_Line (Locale, "degree", "aste", "astetta")
        & Unit_Line (Locale, "mile", "maili", "mailia")
        & Unit_Line (Locale, "yard", "jaardi", "jaardia")
        & Unit_Line (Locale, "foot", "jalka", "jalkaa")
        & Unit_Line (Locale, "inch", "tuuma", "tuumaa")
        & Unit_Line (Locale, "gallon", "gallona", "gallonaa")
        & Unit_Line (Locale, "pound", "pauna", "paunaa")
        & Unit_Line (Locale, "ounce", "unssi", "unssia");
   elsif Locale = "pl" then
      return
        Unit_Line (Locale, "celsius", "stopien Celsjusza", "stopnie Celsjusza")
        & Unit_Line (Locale, "fahrenheit", "stopien Fahrenheita", "stopnie Fahrenheita")
        & Unit_Line (Locale, "square_meter", "metr kwadratowy", "metry kwadratowe")
        & Unit_Line (Locale, "hectare", "hektar", "hektary")
        & Unit_Line
            (Locale, "kilometer_per_hour",
             B ("6B696C6F6D657472206E6120676F647A696EC499"),
             B ("6B696C6F6D65747279206E6120676F647A696EC499"))
        & Unit_Line
            (Locale, "meter_per_second",
             B ("6D657472206E612073656B756E64C499"),
             B ("6D65747279206E612073656B756E64C499"))
        & Unit_Line (Locale, "pascal", "paskal", "paskale")
        & Unit_Line (Locale, "kilopascal", "kilopaskal", "kilopaskale")
        & Unit_Line (Locale, "joule", B ("64C5BC756C"), B ("64C5BC756C65"))
        & Unit_Line (Locale, "kilojoule", B ("6B696C6F64C5BC756C"), B ("6B696C6F64C5BC756C65"))
        & Unit_Line (Locale, "watt", "wat", "waty")
        & Unit_Line (Locale, "kilowatt", "kilowat", "kilowaty")
        & Unit_Line (Locale, "hertz", "herc", "herce")
        & Unit_Line (Locale, "kilohertz", "kiloherc", "kiloherce")
        & Unit_Line (Locale, "degree", B ("73746F706965C584"), "stopnie")
        & Unit_Line (Locale, "mile", "mila", "mile")
        & Unit_Line (Locale, "yard", "jard", "jardy")
        & Unit_Line (Locale, "foot", "stopa", "stopy")
        & Unit_Line (Locale, "inch", "cal", "cale")
        & Unit_Line (Locale, "gallon", "galon", "galony")
        & Unit_Line (Locale, "pound", "funt", "funty")
        & Unit_Line (Locale, "ounce", "uncja", "uncje");
   elsif Locale = "cs" then
      return
        Unit_Line
          (Locale, "celsius",
           B ("7374757065C5882043656C736961"),
           B ("737475706EC49B2043656C736961"))
        & Unit_Line
            (Locale, "fahrenheit",
             B ("7374757065C5882046616872656E6865697461"),
             B ("737475706EC49B2046616872656E6865697461"))
        & Unit_Line
            (Locale, "square_meter",
             B ("6D65747220C48D7476657265C48D6EC3BD"),
             B ("6D6574727920C48D7476657265C48D6EC3A9"))
        & Unit_Line (Locale, "hectare", "hektar", "hektary")
        & Unit_Line (Locale, "kilometer_per_hour", "kilometr za hodinu", "kilometry za hodinu")
        & Unit_Line (Locale, "meter_per_second", "metr za sekundu", "metry za sekundu")
        & Unit_Line (Locale, "pascal", "pascal", "pascaly")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascaly")
        & Unit_Line (Locale, "joule", "joule", "jouly")
        & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojouly")
        & Unit_Line (Locale, "watt", "watt", "watty")
        & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatty")
        & Unit_Line (Locale, "hertz", "hertz", "hertzy")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertzy")
        & Unit_Line (Locale, "degree", B ("7374757065C588"), B ("737475706EC49B"))
        & Unit_Line (Locale, "mile", B ("6DC3AD6C65"), B ("6DC3AD6C65"))
        & Unit_Line (Locale, "yard", "yard", "yardy")
        & Unit_Line (Locale, "foot", "stopa", "stopy")
        & Unit_Line (Locale, "inch", "palec", "palce")
        & Unit_Line (Locale, "gallon", "galon", "galony")
        & Unit_Line (Locale, "pound", "libra", "libry")
        & Unit_Line (Locale, "ounce", "unce", "unce");
   elsif Locale = "tr" then
      return
        Unit_Line (Locale, "celsius", "santigrat derece", "santigrat derece")
        & Unit_Line (Locale, "fahrenheit", "fahrenhayt derece", "fahrenhayt derece")
        & Unit_Line (Locale, "square_meter", "metrekare", "metrekare")
        & Unit_Line (Locale, "hectare", "hektar", "hektar")
        & Unit_Line (Locale, "kilometer_per_hour", "saatte kilometre", "saatte kilometre")
        & Unit_Line (Locale, "meter_per_second", "saniyede metre", "saniyede metre")
        & Unit_Line (Locale, "pascal", "paskal", "paskal")
        & Unit_Line (Locale, "kilopascal", "kilopaskal", "kilopaskal")
        & Unit_Line (Locale, "joule", "jul", "jul")
        & Unit_Line (Locale, "kilojoule", "kilojul", "kilojul")
        & Unit_Line (Locale, "watt", "vat", "vat")
        & Unit_Line (Locale, "kilowatt", "kilovat", "kilovat")
        & Unit_Line (Locale, "hertz", "hertz", "hertz")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
        & Unit_Line (Locale, "degree", "derece", "derece")
        & Unit_Line (Locale, "mile", "mil", "mil")
        & Unit_Line (Locale, "yard", "yarda", "yarda")
        & Unit_Line (Locale, "foot", "fit", "fit")
        & Unit_Line (Locale, "inch", "inc", "inc")
        & Unit_Line (Locale, "gallon", "galon", "galon")
        & Unit_Line (Locale, "pound", "pound", "pound")
        & Unit_Line (Locale, "ounce", "ons", "ons");
   elsif Locale = "ru" then
      return
        Added_Unit_Keys_With_Tail
          (Locale,
           B ("D0B3D180D0B0D0B4D183D18120D0A6D0B5D0BBD18CD181D0B8D18F"),
           B ("D0B3D180D0B0D0B4D183D181D18B20D0A6D0B5D0BBD18CD181D0B8D18F"),
           B ("D0B3D180D0B0D0B4D183D18120D0A4D0B0D180D0B5D0BDD0B3D0B5D0B9D182D0B0"),
           B ("D0B3D180D0B0D0B4D183D181D18B20D0A4D0B0D180D0B5D0BDD0B3D0B5D0B9D182D0B0"),
           B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD18BD0B920D0BCD0B5D182D180"),
           B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD18BD0B520D0BCD0B5D182D180D18B"),
           B ("D0B3D0B5D0BAD182D0B0D180"),
           B ("D0B3D0B5D0BAD182D0B0D180D18B"),
           B ("D0BAD0B8D0BBD0BED0BCD0B5D182D18020D0B220D187D0B0D181"),
           B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180D18B20D0B220D187D0B0D181"),
           B ("D0BCD0B5D182D18020D0B220D181D0B5D0BAD183D0BDD0B4D183"),
           B ("D0BCD0B5D182D180D18B20D0B220D181D0B5D0BAD183D0BDD0B4D183"));
   elsif Locale = "uk" then
      return
        Added_Unit_Keys_With_Tail
          (Locale,
           B ("D0B3D180D0B0D0B4D183D18120D0A6D0B5D0BBD18CD181D196D18F"),
           B ("D0B3D180D0B0D0B4D183D181D0B820D0A6D0B5D0BBD18CD181D196D18F"),
           B ("D0B3D180D0B0D0B4D183D18120D0A4D0B0D180D0B5D0BDD0B3D0B5D0B9D182D0B0"),
           B ("D0B3D180D0B0D0B4D183D181D0B820D0A4D0B0D180D0B5D0BDD0B3D0B5D0B9D182D0B0"),
           B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD0B8D0B920D0BCD0B5D182D180"),
           B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD19620D0BCD0B5D182D180D0B8"),
           B ("D0B3D0B5D0BAD182D0B0D180"),
           B ("D0B3D0B5D0BAD182D0B0D180D0B8"),
           B ("D0BAD196D0BBD0BED0BCD0B5D182D18020D0B7D0B020D0B3D0BED0B4D0B8D0BDD183"),
           B ("D0BAD196D0BBD0BED0BCD0B5D182D180D0B820D0B7D0B020D0B3D0BED0B4D0B8D0BDD183"),
           B ("D0BCD0B5D182D18020D0B7D0B020D181D0B5D0BAD183D0BDD0B4D183"),
           B ("D0BCD0B5D182D180D0B820D0B7D0B020D181D0B5D0BAD183D0BDD0B4D183"));
   elsif Locale = "ja" then
      return
        Added_Unit_Keys_With_Tail
          (Locale, B ("E382BBE383ABE382B7E382A6E382B9E5BAA6"),
           B ("E382BBE383ABE382B7E382A6E382B9E5BAA6"),
           B ("E88FAFE6B08FE5BAA6"), B ("E88FAFE6B08FE5BAA6"),
           B ("E5B9B3E696B9E383A1E383BCE38388E383AB"),
           B ("E5B9B3E696B9E383A1E383BCE38388E383AB"),
           B ("E38398E382AFE382BFE383BCE383AB"),
           B ("E38398E382AFE382BFE383BCE383AB"),
           B ("E382ADE383ADE383A1E383BCE38388E383ABE6AF8EE69982"),
           B ("E382ADE383ADE383A1E383BCE38388E383ABE6AF8EE69982"),
           B ("E383A1E383BCE38388E383ABE6AF8EE7A792"),
           B ("E383A1E383BCE38388E383ABE6AF8EE7A792"));
   elsif Locale = "ko" then
      return
        Added_Unit_Keys_With_Tail
          (Locale, B ("EC84ADEC94A8EB8F84"), B ("EC84ADEC94A8EB8F84"),
           B ("ED9994EC94A8EB8F84"), B ("ED9994EC94A8EB8F84"),
           B ("ECA09CEAB3B1EBAFB8ED84B0"),
           B ("ECA09CEAB3B1EBAFB8ED84B0"),
           B ("ED97A5ED8380EBA5B4"), B ("ED97A5ED8380EBA5B4"),
           B ("EC8B9CEAB084EB8BB920ED82ACEBA19CEBAFB8ED84B0"),
           B ("EC8B9CEAB084EB8BB920ED82ACEBA19CEBAFB8ED84B0"),
           B ("ECB488EB8BB920EBAFB8ED84B0"),
           B ("ECB488EB8BB920EBAFB8ED84B0"));
   elsif Locale = "zh" then
      return
        Added_Unit_Keys_With_Tail
          (Locale, B ("E69184E6B08FE5BAA6"), B ("E69184E6B08FE5BAA6"),
           B ("E58D8EE6B08FE5BAA6"), B ("E58D8EE6B08FE5BAA6"),
           B ("E5B9B3E696B9E7B1B3"), B ("E5B9B3E696B9E7B1B3"),
           B ("E585ACE9A1B7"), B ("E585ACE9A1B7"),
           B ("E58D83E7B1B3E6AF8FE5B08FE697B6"),
           B ("E58D83E7B1B3E6AF8FE5B08FE697B6"),
           B ("E7B1B3E6AF8FE7A792"), B ("E7B1B3E6AF8FE7A792"));
   elsif Locale = "ar" then
      return
        Added_Unit_Keys_With_Tail
          (Locale, B ("D8AFD8B1D8ACD8A920D985D8A6D988D98AD8A9"),
           B ("D8AFD8B1D8ACD8A7D8AA20D985D8A6D988D98AD8A9"),
           B ("D8AFD8B1D8ACD8A920D981D987D8B1D986D987D8A7D98AD8AA"),
           B ("D8AFD8B1D8ACD8A7D8AA20D981D987D8B1D986D987D8A7D98AD8AA"),
           B ("D985D8AAD8B120D985D8B1D8A8D8B9"),
           B ("D8A3D985D8AAD8A7D8B120D985D8B1D8A8D8B9D8A9"),
           B ("D987D983D8AAD8A7D8B1"), B ("D987D983D8AAD8A7D8B1D8A7D8AA"),
           B ("D983D98AD984D988D985D8AAD8B120D981D98A20D8A7D984D8B3D8A7D8B9D8A9"),
           B ("D983D98AD984D988D985D8AAD8B1D8A7D8AA20D981D98A20D8A7D984D8B3D8A7D8B9D8A9"),
           B ("D985D8AAD8B120D981D98A20D8A7D984D8ABD8A7D986D98AD8A9"),
           B ("D8A3D985D8AAD8A7D8B120D981D98A20D8A7D984D8ABD8A7D986D98AD8A9"));
   elsif Locale = "hi" then
      return
        Added_Unit_Keys_With_Tail
          (Locale,
           B ("E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A58020E0A4B8E0A587E0A4B2E0A58DE0A4B8E0A4BFE0A4AFE0A4B8"),
           B ("E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A58020E0A4B8E0A587E0A4B2E0A58DE0A4B8E0A4BFE0A4AFE0A4B8"),
           B ("E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A58020E0A4ABE0A4BEE0A4B0E0A587E0A4A8E0A4B9E0A4BEE0A487E0A49F"),
           B ("E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A58020E0A4ABE0A4BEE0A4B0E0A587E0A4A8E0A4B9E0A4BEE0A487E0A49F"),
           B ("E0A4B5E0A4B0E0A58DE0A49720E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A4B5E0A4B0E0A58DE0A49720E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A4B9E0A587E0A495E0A58DE0A49FE0A587E0A4AFE0A4B0"),
           B ("E0A4B9E0A587E0A495E0A58DE0A49FE0A587E0A4AFE0A4B0"),
           B ("E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"
              & "20E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A498E0A482E0A49FE0A4BE"),
           B ("E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"
              & "20E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A498E0A482E0A49FE0A4BE"),
           B ("E0A4AEE0A580E0A49FE0A4B020E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4B8E0A587E0A495E0A482E0A4A1"),
           B ("E0A4AEE0A580E0A49FE0A4B020E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4B8E0A587E0A495E0A482E0A4A1"));
   elsif Locale = "ro" then
      return
        Unit_Line (Locale, "celsius", "grad Celsius", "grade Celsius")
        & Unit_Line (Locale, "fahrenheit", "grad Fahrenheit", "grade Fahrenheit")
        & Unit_Line (Locale, "square_meter", "metru patrat", "metri patrati")
        & Unit_Line (Locale, "hectare", "hectar", "hectare")
        & Unit_Line (Locale, "kilometer_per_hour", "kilometru pe ora", "kilometri pe ora")
        & Unit_Line (Locale, "meter_per_second", "metru pe secunda", "metri pe secunda")
        & Unit_Line (Locale, "pascal", "pascal", "pascali")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascali")
        & Unit_Line (Locale, "joule", "joule", "jouli")
        & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojouli")
        & Unit_Line (Locale, "watt", "watt", "wati")
        & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowati")
        & Unit_Line (Locale, "hertz", "hertz", "hertzi")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertzi")
        & Unit_Line (Locale, "degree", "grad", "grade")
        & Unit_Line (Locale, "mile", "mila", "mile")
        & Unit_Line (Locale, "yard", "yard", "yarzi")
        & Unit_Line (Locale, "foot", "picior", "picioare")
        & Unit_Line (Locale, "inch", "tol", "toli")
        & Unit_Line (Locale, "gallon", "galon", "galoane")
        & Unit_Line (Locale, "pound", "livra", "livre")
        & Unit_Line (Locale, "ounce", "uncie", "uncii");
   elsif Locale = "lt" then
      return
        Unit_Line (Locale, "celsius", "Celsijaus laipsnis", "Celsijaus laipsniai")
        & Unit_Line (Locale, "fahrenheit", "Farenheito laipsnis", "Farenheito laipsniai")
        & Unit_Line (Locale, "square_meter", "kvadratinis metras", "kvadratiniai metrai")
        & Unit_Line (Locale, "hectare", "hektaras", "hektarai")
        & Unit_Line (Locale, "kilometer_per_hour", "kilometras per valanda", "kilometrai per valanda")
        & Unit_Line (Locale, "meter_per_second", "metras per sekunde", "metrai per sekunde")
        & Unit_Line (Locale, "pascal", "paskalis", "paskaliai")
        & Unit_Line (Locale, "kilopascal", "kilopaskalis", "kilopaskaliai")
        & Unit_Line (Locale, "joule", "dziulis", "dziuliai")
        & Unit_Line (Locale, "kilojoule", "kilodziulis", "kilodziuliai")
        & Unit_Line (Locale, "watt", "vatas", "vatai")
        & Unit_Line (Locale, "kilowatt", "kilovatas", "kilovatai")
        & Unit_Line (Locale, "hertz", "hercas", "hercai")
        & Unit_Line (Locale, "kilohertz", "kilohercas", "kilohercai")
        & Unit_Line (Locale, "degree", "laipsnis", "laipsniai")
        & Unit_Line (Locale, "mile", "mylia", "mylios")
        & Unit_Line (Locale, "yard", "jardas", "jardai")
        & Unit_Line (Locale, "foot", "peda", "pedos")
        & Unit_Line (Locale, "inch", "colis", "coliai")
        & Unit_Line (Locale, "gallon", "galonas", "galonai")
        & Unit_Line (Locale, "pound", "svaras", "svarai")
        & Unit_Line (Locale, "ounce", "uncija", "uncijos");
   elsif Locale = "sl" then
      return
        Unit_Line (Locale, "celsius", "stopinja Celzija", "stopinje Celzija")
        & Unit_Line (Locale, "fahrenheit", "stopinja Fahrenheita", "stopinje Fahrenheita")
        & Unit_Line (Locale, "square_meter", "kvadratni meter", "kvadratni metri")
        & Unit_Line (Locale, "hectare", "hektar", "hektarji")
        & Unit_Line (Locale, "kilometer_per_hour", "kilometer na uro", "kilometri na uro")
        & Unit_Line (Locale, "meter_per_second", "meter na sekundo", "metri na sekundo")
        & Unit_Line (Locale, "pascal", "paskal", "paskali")
        & Unit_Line (Locale, "kilopascal", "kilopaskal", "kilopaskali")
        & Unit_Line (Locale, "joule", "dzul", "dzuli")
        & Unit_Line (Locale, "kilojoule", "kilodzul", "kilodzuli")
        & Unit_Line (Locale, "watt", "vat", "vati")
        & Unit_Line (Locale, "kilowatt", "kilovat", "kilovati")
        & Unit_Line (Locale, "hertz", "herc", "herci")
        & Unit_Line (Locale, "kilohertz", "kiloherc", "kiloherci")
        & Unit_Line (Locale, "degree", "stopinja", "stopinje")
        & Unit_Line (Locale, "mile", "milja", "milje")
        & Unit_Line (Locale, "yard", "jard", "jardi")
        & Unit_Line (Locale, "foot", "cevelj", "cevlji")
        & Unit_Line (Locale, "inch", "palec", "palci")
        & Unit_Line (Locale, "gallon", "galona", "galone")
        & Unit_Line (Locale, "pound", "funt", "funti")
        & Unit_Line (Locale, "ounce", "unca", "unce");
   elsif Locale = "id" or else Locale = "ms" then
      return
        Unit_Line (Locale, "celsius", "derajat Celsius", "derajat Celsius")
        & Unit_Line (Locale, "fahrenheit", "derajat Fahrenheit", "derajat Fahrenheit")
        & Unit_Line (Locale, "square_meter", "meter persegi", "meter persegi")
        & Unit_Line (Locale, "hectare", "hektare", "hektare")
        & Unit_Line (Locale, "kilometer_per_hour", "kilometer per jam", "kilometer per jam")
        & Unit_Line (Locale, "meter_per_second", "meter per detik", "meter per detik")
        & Unit_Line (Locale, "pascal", "pascal", "pascal")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
        & Unit_Line (Locale, "joule", "joule", "joule")
        & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoule")
        & Unit_Line (Locale, "watt", "watt", "watt")
        & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatt")
        & Unit_Line (Locale, "hertz", "hertz", "hertz")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
        & Unit_Line (Locale, "degree", "derajat", "derajat")
        & Unit_Line (Locale, "mile", "mil", "mil")
        & Unit_Line (Locale, "yard", "yard", "yard")
        & Unit_Line (Locale, "foot", "kaki", "kaki")
        & Unit_Line (Locale, "inch", "inci", "inci")
        & Unit_Line (Locale, "gallon", "galon", "galon")
        & Unit_Line (Locale, "pound", "pon", "pon")
        & Unit_Line (Locale, "ounce", "ons", "ons");
   elsif Locale = "eo" then
      return
        Unit_Line (Locale, "celsius", "celsia grado", "celsiaj gradoj")
        & Unit_Line (Locale, "fahrenheit", "farenhejta grado", "farenhejtaj gradoj")
        & Unit_Line (Locale, "square_meter", "kvadrata metro", "kvadrataj metroj")
        & Unit_Line (Locale, "hectare", "hektaro", "hektaroj")
        & Unit_Line (Locale, "kilometer_per_hour", "kilometro hore", "kilometroj hore")
        & Unit_Line (Locale, "meter_per_second", "metro sekunde", "metroj sekunde")
        & Unit_Line (Locale, "pascal", "paskalo", "paskaloj")
        & Unit_Line (Locale, "kilopascal", "kilopaskalo", "kilopaskaloj")
        & Unit_Line (Locale, "joule", "julo", "juloj")
        & Unit_Line (Locale, "kilojoule", "kilojulo", "kilojuloj")
        & Unit_Line (Locale, "watt", "vato", "vatoj")
        & Unit_Line (Locale, "kilowatt", "kilovato", "kilovatoj")
        & Unit_Line (Locale, "hertz", "herco", "hercoj")
        & Unit_Line (Locale, "kilohertz", "kiloherco", "kilohercoj")
        & Unit_Line (Locale, "degree", "grado", "gradoj")
        & Unit_Line (Locale, "mile", "mejlo", "mejloj")
        & Unit_Line (Locale, "yard", "jardo", "jardoj")
        & Unit_Line (Locale, "foot", "futo", "futoj")
        & Unit_Line (Locale, "inch", "colo", "coloj")
        & Unit_Line (Locale, "gallon", "galjono", "galjonoj")
        & Unit_Line (Locale, "pound", "funto", "funtoj")
        & Unit_Line (Locale, "ounce", "unco", "uncoj");
   elsif Locale = "vi" then
      return
        Unit_Line (Locale, "celsius", "do Celsius", "do Celsius")
        & Unit_Line (Locale, "fahrenheit", "do Fahrenheit", "do Fahrenheit")
        & Unit_Line (Locale, "square_meter", "met vuong", "met vuong")
        & Unit_Line (Locale, "hectare", "hecta", "hecta")
        & Unit_Line (Locale, "kilometer_per_hour", "kilomet moi gio", "kilomet moi gio")
        & Unit_Line (Locale, "meter_per_second", "met moi giay", "met moi giay")
        & Unit_Line (Locale, "pascal", "pascal", "pascal")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
        & Unit_Line (Locale, "joule", "jun", "jun")
        & Unit_Line (Locale, "kilojoule", "kilojun", "kilojun")
        & Unit_Line (Locale, "watt", "oat", "oat")
        & Unit_Line (Locale, "kilowatt", "kilooat", "kilooat")
        & Unit_Line (Locale, "hertz", "hertz", "hertz")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
        & Unit_Line (Locale, "degree", "do", "do")
        & Unit_Line (Locale, "mile", "dam", "dam")
        & Unit_Line (Locale, "yard", "yard", "yard")
        & Unit_Line (Locale, "foot", "foot", "foot")
        & Unit_Line (Locale, "inch", "inch", "inch")
        & Unit_Line (Locale, "gallon", "gallon", "gallon")
        & Unit_Line (Locale, "pound", "pound", "pound")
        & Unit_Line (Locale, "ounce", "ounce", "ounce");
   elsif Locale = "sw" then
      return
        Unit_Line (Locale, "celsius", "digrii Selsiasi", "digrii Selsiasi")
        & Unit_Line (Locale, "fahrenheit", "digrii Farenhaiti", "digrii Farenhaiti")
        & Unit_Line (Locale, "square_meter", "mita ya mraba", "mita za mraba")
        & Unit_Line (Locale, "hectare", "hekta", "hekta")
        & Unit_Line (Locale, "kilometer_per_hour", "kilomita kwa saa", "kilomita kwa saa")
        & Unit_Line (Locale, "meter_per_second", "mita kwa sekunde", "mita kwa sekunde")
        & Unit_Line (Locale, "pascal", "paskali", "paskali")
        & Unit_Line (Locale, "kilopascal", "kilopaskali", "kilopaskali")
        & Unit_Line (Locale, "joule", "juli", "juli")
        & Unit_Line (Locale, "kilojoule", "kilojuli", "kilojuli")
        & Unit_Line (Locale, "watt", "wati", "wati")
        & Unit_Line (Locale, "kilowatt", "kilowati", "kilowati")
        & Unit_Line (Locale, "hertz", "hertzi", "hertzi")
        & Unit_Line (Locale, "kilohertz", "kilohertzi", "kilohertzi")
        & Unit_Line (Locale, "degree", "digrii", "digrii")
        & Unit_Line (Locale, "mile", "maili", "maili")
        & Unit_Line (Locale, "yard", "yadi", "yadi")
        & Unit_Line (Locale, "foot", "futi", "futi")
        & Unit_Line (Locale, "inch", "inchi", "inchi")
        & Unit_Line (Locale, "gallon", "galoni", "galoni")
        & Unit_Line (Locale, "pound", "pauni", "pauni")
        & Unit_Line (Locale, "ounce", "aunsi", "aunsi");
   elsif Locale = "af" then
      return
        Unit_Line (Locale, "celsius", "graad Celsius", "grade Celsius")
        & Unit_Line (Locale, "fahrenheit", "graad Fahrenheit", "grade Fahrenheit")
        & Unit_Line (Locale, "square_meter", "vierkante meter", "vierkante meter")
        & Unit_Line (Locale, "hectare", "hektaar", "hektaar")
        & Unit_Line (Locale, "kilometer_per_hour", "kilometer per uur", "kilometer per uur")
        & Unit_Line (Locale, "meter_per_second", "meter per sekonde", "meter per sekonde")
        & Unit_Line (Locale, "pascal", "pascal", "pascal")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
        & Unit_Line (Locale, "joule", "joule", "joule")
        & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoule")
        & Unit_Line (Locale, "watt", "watt", "watt")
        & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatt")
        & Unit_Line (Locale, "hertz", "hertz", "hertz")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
        & Unit_Line (Locale, "degree", "graad", "grade")
        & Unit_Line (Locale, "mile", "myl", "myl")
        & Unit_Line (Locale, "yard", "jaart", "jaart")
        & Unit_Line (Locale, "foot", "voet", "voet")
        & Unit_Line (Locale, "inch", "duim", "duim")
        & Unit_Line (Locale, "gallon", "gelling", "gellings")
        & Unit_Line (Locale, "pound", "pond", "pond")
        & Unit_Line (Locale, "ounce", "ons", "ons");
   elsif Locale = "hu" then
      return
        Unit_Line (Locale, "celsius", "Celsius-fok", "Celsius-fok")
        & Unit_Line (Locale, "fahrenheit", "Fahrenheit-fok", "Fahrenheit-fok")
        & Unit_Line (Locale, "square_meter", "negyzetmeter", "negyzetmeter")
        & Unit_Line (Locale, "hectare", "hektar", "hektar")
        & Unit_Line (Locale, "kilometer_per_hour", "kilometer per ora", "kilometer per ora")
        & Unit_Line (Locale, "meter_per_second", "meter per masodperc", "meter per masodperc")
        & Unit_Line (Locale, "pascal", "pascal", "pascal")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
        & Unit_Line (Locale, "joule", "joule", "joule")
        & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoule")
        & Unit_Line (Locale, "watt", "watt", "watt")
        & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatt")
        & Unit_Line (Locale, "hertz", "hertz", "hertz")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
        & Unit_Line (Locale, "degree", "fok", "fok")
        & Unit_Line (Locale, "mile", "merfold", "merfold")
        & Unit_Line (Locale, "yard", "yard", "yard")
        & Unit_Line (Locale, "foot", "lab", "lab")
        & Unit_Line (Locale, "inch", "huvelyk", "huvelyk")
        & Unit_Line (Locale, "gallon", "gallon", "gallon")
        & Unit_Line (Locale, "pound", "font", "font")
        & Unit_Line (Locale, "ounce", "uncia", "uncia");
   elsif Locale = "sk" then
      return
        Unit_Line (Locale, "celsius", "stupen Celzia", "stupne Celzia")
        & Unit_Line (Locale, "fahrenheit", "stupen Fahrenheita", "stupne Fahrenheita")
        & Unit_Line (Locale, "square_meter", "stvorcovy meter", "stvorcove metre")
        & Unit_Line (Locale, "hectare", "hektar", "hektare")
        & Unit_Line (Locale, "kilometer_per_hour", "kilometer za hodinu", "kilometre za hodinu")
        & Unit_Line (Locale, "meter_per_second", "meter za sekundu", "metre za sekundu")
        & Unit_Line (Locale, "pascal", "pascal", "pascaly")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascaly")
        & Unit_Line (Locale, "joule", "joule", "jouly")
        & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojouly")
        & Unit_Line (Locale, "watt", "watt", "watty")
        & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatty")
        & Unit_Line (Locale, "hertz", "hertz", "hertze")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertze")
        & Unit_Line (Locale, "degree", "stupen", "stupne")
        & Unit_Line (Locale, "mile", "mila", "mile")
        & Unit_Line (Locale, "yard", "yard", "yardy")
        & Unit_Line (Locale, "foot", "stopa", "stopy")
        & Unit_Line (Locale, "inch", "palec", "palce")
        & Unit_Line (Locale, "gallon", "galon", "galony")
        & Unit_Line (Locale, "pound", "libra", "libry")
        & Unit_Line (Locale, "ounce", "unca", "unce");
   else
      return
        Unit_Line (Locale, "celsius", "degree Celsius", "degrees Celsius")
        & Unit_Line (Locale, "fahrenheit", "degree Fahrenheit", "degrees Fahrenheit")
        & Unit_Line (Locale, "square_meter", "square meter", "square meters")
        & Unit_Line (Locale, "hectare", "hectare", "hectares")
        & Unit_Line (Locale, "kilometer_per_hour", "kilometer per hour", "kilometers per hour")
        & Unit_Line (Locale, "meter_per_second", "meter per second", "meters per second")
        & Unit_Line (Locale, "pascal", "pascal", "pascals")
        & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascals")
        & Unit_Line (Locale, "joule", "joule", "joules")
        & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoules")
        & Unit_Line (Locale, "watt", "watt", "watts")
        & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatts")
        & Unit_Line (Locale, "hertz", "hertz", "hertz")
        & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
        & Unit_Line (Locale, "degree", "degree", "degrees")
        & Unit_Line (Locale, "mile", "mile", "miles")
        & Unit_Line (Locale, "yard", "yard", "yards")
        & Unit_Line (Locale, "foot", "foot", "feet")
        & Unit_Line (Locale, "inch", "inch", "inches")
        & Unit_Line (Locale, "gallon", "gallon", "gallons")
        & Unit_Line (Locale, "pound", "pound", "pounds")
        & Unit_Line (Locale, "ounce", "ounce", "ounces");
   end if;
end Added_Unit_Keys;
