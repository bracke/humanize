with Humanize.Catalogs.Encoding;

package body Humanize.Catalogs.Unit_Data is

   --  Provenance: generated from Humanize unit catalog templates and reviewed
   --  as checked-in Ada source. Keep currentness notes in docs/QUALITY_GUARDS.md.

   --  Data boundary: this body intentionally holds generated unit catalog
   --  fragments. Keep behavioral lookup/loader logic outside this table unit.

   LF : constant String := [1 => ASCII.LF];

   AA     : String renames Humanize.Catalogs.Encoding.AA;
   ECIRC  : String renames Humanize.Catalogs.Encoding.ECIRC;
   IACUTE : String renames Humanize.Catalogs.Encoding.IACUTE;
   NTILDE : String renames Humanize.Catalogs.Encoding.NTILDE;

   function B (Hex : String) return String
      renames Humanize.Catalogs.Encoding.B;

   function Unit_Line
     (Locale   : String;
      Key      : String;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      return
        Locale & ".humanize.unit." & Key & " = "
        & "{count, plural, one {{value, number} " & Singular & "} "
        & "other {{value, number} " & Plural & "}}" & LF;
   end Unit_Line;

   function Added_Unit_Non_Latin_Tail (Locale : String) return String;

   function Extra_Unit_Non_Latin_Tail
     (Locale          : String;
      Teaspoon_Sing   : String;
      Teaspoon_Plural : String)
      return String;

   function Added_Unit_Keys_With_Tail
     (Locale                    : String;
      Celsius_Sing              : String;
      Celsius_Plural            : String;
      Fahrenheit_Sing           : String;
      Fahrenheit_Plural         : String;
      Square_Meter_Sing         : String;
      Square_Meter_Plural       : String;
      Hectare_Sing              : String;
      Hectare_Plural            : String;
      Kilometer_Per_Hour_Sing   : String;
      Kilometer_Per_Hour_Plural : String;
      Meter_Per_Second_Sing     : String;
      Meter_Per_Second_Plural   : String)
      return String
   is
   begin
      return
        Unit_Line (Locale, "celsius", Celsius_Sing, Celsius_Plural)
        & Unit_Line
            (Locale, "fahrenheit", Fahrenheit_Sing, Fahrenheit_Plural)
        & Unit_Line
            (Locale, "square_meter", Square_Meter_Sing, Square_Meter_Plural)
        & Unit_Line (Locale, "hectare", Hectare_Sing, Hectare_Plural)
        & Unit_Line
            (Locale, "kilometer_per_hour",
             Kilometer_Per_Hour_Sing, Kilometer_Per_Hour_Plural)
        & Unit_Line
            (Locale, "meter_per_second",
             Meter_Per_Second_Sing, Meter_Per_Second_Plural)
        & Added_Unit_Non_Latin_Tail (Locale);
   end Added_Unit_Keys_With_Tail;

   function Extra_Unit_Keys_With_Tail
     (Locale          : String;
      Teaspoon_Sing   : String;
      Teaspoon_Plural : String)
      return String
   is
   begin
      return Extra_Unit_Non_Latin_Tail
        (Locale, Teaspoon_Sing, Teaspoon_Plural);
   end Extra_Unit_Keys_With_Tail;

   pragma Style_Checks (Off);

   function Added_Unit_Non_Latin_Tail (Locale : String) return String is
   begin
      if Locale = "ru" then
         return
           Unit_Line (Locale, "pascal", B ("D0BFD0B0D181D0BAD0B0D0BBD18C"), B ("D0BFD0B0D181D0BAD0B0D0BBD0B8"))
           & Unit_Line (Locale, "kilopascal", B ("D0BAD0B8D0BBD0BED0BFD0B0D181D0BAD0B0D0BBD18C"), B ("D0BAD0B8D0BBD0BED0BFD0B0D181D0BAD0B0D0BBD0B8"))
           & Unit_Line (Locale, "joule", B ("D0B4D0B6D0BED183D0BBD18C"), B ("D0B4D0B6D0BED183D0BBD0B8"))
           & Unit_Line (Locale, "kilojoule", B ("D0BAD0B8D0BBD0BED0B4D0B6D0BED183D0BBD18C"), B ("D0BAD0B8D0BBD0BED0B4D0B6D0BED183D0BBD0B8"))
           & Unit_Line (Locale, "watt", B ("D0B2D0B0D182D182"), B ("D0B2D0B0D182D182D18B"))
           & Unit_Line (Locale, "kilowatt", B ("D0BAD0B8D0BBD0BED0B2D0B0D182D182"), B ("D0BAD0B8D0BBD0BED0B2D0B0D182D182D18B"))
           & Unit_Line (Locale, "hertz", B ("D0B3D0B5D180D186"), B ("D0B3D0B5D180D186D18B"))
           & Unit_Line (Locale, "kilohertz", B ("D0BAD0B8D0BBD0BED0B3D0B5D180D186"), B ("D0BAD0B8D0BBD0BED0B3D0B5D180D186D18B"))
           & Unit_Line (Locale, "degree", B ("D0B3D180D0B0D0B4D183D181"), B ("D0B3D180D0B0D0B4D183D181D18B"))
           & Unit_Line (Locale, "mile", B ("D0BCD0B8D0BBD18F"), B ("D0BCD0B8D0BBD0B8"))
           & Unit_Line (Locale, "yard", B ("D18FD180D0B4"), B ("D18FD180D0B4D18B"))
           & Unit_Line (Locale, "foot", B ("D184D183D182"), B ("D184D183D182D18B"))
           & Unit_Line (Locale, "inch", B ("D0B4D18ED0B9D0BC"), B ("D0B4D18ED0B9D0BCD18B"))
           & Unit_Line (Locale, "gallon", B ("D0B3D0B0D0BBD0BBD0BED0BD"), B ("D0B3D0B0D0BBD0BBD0BED0BDD18B"))
           & Unit_Line (Locale, "pound", B ("D184D183D0BDD182"), B ("D184D183D0BDD182D18B"))
           & Unit_Line (Locale, "ounce", B ("D183D0BDD186D0B8D18F"), B ("D183D0BDD186D0B8D0B8"));
      elsif Locale = "uk" then
         return
           Unit_Line (Locale, "pascal", B ("D0BFD0B0D181D0BAD0B0D0BBD18C"), B ("D0BFD0B0D181D0BAD0B0D0BBD196"))
           & Unit_Line (Locale, "kilopascal", B ("D0BAD196D0BBD0BED0BFD0B0D181D0BAD0B0D0BBD18C"), B ("D0BAD196D0BBD0BED0BFD0B0D181D0BAD0B0D0BBD196"))
           & Unit_Line (Locale, "joule", B ("D0B4D0B6D0BED183D0BBD18C"), B ("D0B4D0B6D0BED183D0BBD196"))
           & Unit_Line (Locale, "kilojoule", B ("D0BAD196D0BBD0BED0B4D0B6D0BED183D0BBD18C"), B ("D0BAD196D0BBD0BED0B4D0B6D0BED183D0BBD196"))
           & Unit_Line (Locale, "watt", B ("D0B2D0B0D182"), B ("D0B2D0B0D182D0B8"))
           & Unit_Line (Locale, "kilowatt", B ("D0BAD196D0BBD0BED0B2D0B0D182"), B ("D0BAD196D0BBD0BED0B2D0B0D182D0B8"))
           & Unit_Line (Locale, "hertz", B ("D0B3D0B5D180D186"), B ("D0B3D0B5D180D186D0B8"))
           & Unit_Line (Locale, "kilohertz", B ("D0BAD196D0BBD0BED0B3D0B5D180D186"), B ("D0BAD196D0BBD0BED0B3D0B5D180D186D0B8"))
           & Unit_Line (Locale, "degree", B ("D0B3D180D0B0D0B4D183D181"), B ("D0B3D180D0B0D0B4D183D181D0B8"))
           & Unit_Line (Locale, "mile", B ("D0BCD0B8D0BBD18F"), B ("D0BCD0B8D0BBD196"))
           & Unit_Line (Locale, "yard", B ("D18FD180D0B4"), B ("D18FD180D0B4D0B8"))
           & Unit_Line (Locale, "foot", B ("D184D183D182"), B ("D184D183D182D0B8"))
           & Unit_Line (Locale, "inch", B ("D0B4D18ED0B9D0BC"), B ("D0B4D18ED0B9D0BCD0B8"))
           & Unit_Line (Locale, "gallon", B ("D0B3D0B0D0BBD0BED0BD"), B ("D0B3D0B0D0BBD0BED0BDD0B8"))
           & Unit_Line (Locale, "pound", B ("D184D183D0BDD182"), B ("D184D183D0BDD182D0B8"))
           & Unit_Line (Locale, "ounce", B ("D183D0BDD186D196D18F"), B ("D183D0BDD186D196D197"));
      elsif Locale = "ja" then
         return
           Unit_Line (Locale, "pascal", B ("E38391E382B9E382ABE383AB"), B ("E38391E382B9E382ABE383AB"))
           & Unit_Line (Locale, "kilopascal", B ("E382ADE383ADE38391E382B9E382ABE383AB"), B ("E382ADE383ADE38391E382B9E382ABE383AB"))
           & Unit_Line (Locale, "joule", B ("E382B8E383A5E383BCE383AB"), B ("E382B8E383A5E383BCE383AB"))
           & Unit_Line (Locale, "kilojoule", B ("E382ADE383ADE382B8E383A5E383BCE383AB"), B ("E382ADE383ADE382B8E383A5E383BCE383AB"))
           & Unit_Line (Locale, "watt", B ("E383AFE38383E38388"), B ("E383AFE38383E38388"))
           & Unit_Line (Locale, "kilowatt", B ("E382ADE383ADE383AFE38383E38388"), B ("E382ADE383ADE383AFE38383E38388"))
           & Unit_Line (Locale, "hertz", B ("E38398E383ABE38384"), B ("E38398E383ABE38384"))
           & Unit_Line (Locale, "kilohertz", B ("E382ADE383ADE38398E383ABE38384"), B ("E382ADE383ADE38398E383ABE38384"))
           & Unit_Line (Locale, "degree", B ("E5BAA6"), B ("E5BAA6"))
           & Unit_Line (Locale, "mile", B ("E3839EE382A4E383AB"), B ("E3839EE382A4E383AB"))
           & Unit_Line (Locale, "yard", B ("E383A4E383BCE38389"), B ("E383A4E383BCE38389"))
           & Unit_Line (Locale, "foot", B ("E38395E382A3E383BCE38388"), B ("E38395E382A3E383BCE38388"))
           & Unit_Line (Locale, "inch", B ("E382A4E383B3E38381"), B ("E382A4E383B3E38381"))
           & Unit_Line (Locale, "gallon", B ("E382ACE383ADE383B3"), B ("E382ACE383ADE383B3"))
           & Unit_Line (Locale, "pound", B ("E3839DE383B3E38389"), B ("E3839DE383B3E38389"))
           & Unit_Line (Locale, "ounce", B ("E382AAE383B3E382B9"), B ("E382AAE383B3E382B9"));
      elsif Locale = "ko" then
         return
           Unit_Line (Locale, "pascal", B ("ED8C8CEC8AA4ECB9BC"), B ("ED8C8CEC8AA4ECB9BC"))
           & Unit_Line (Locale, "kilopascal", B ("ED82ACEBA19CED8C8CEC8AA4ECB9BC"), B ("ED82ACEBA19CED8C8CEC8AA4ECB9BC"))
           & Unit_Line (Locale, "joule", B ("ECA484"), B ("ECA484"))
           & Unit_Line (Locale, "kilojoule", B ("ED82ACEBA19CECA484"), B ("ED82ACEBA19CECA484"))
           & Unit_Line (Locale, "watt", B ("EC9980ED8AB8"), B ("EC9980ED8AB8"))
           & Unit_Line (Locale, "kilowatt", B ("ED82ACEBA19CEC9980ED8AB8"), B ("ED82ACEBA19CEC9980ED8AB8"))
           & Unit_Line (Locale, "hertz", B ("ED97A4EBA5B4ECB8A0"), B ("ED97A4EBA5B4ECB8A0"))
           & Unit_Line (Locale, "kilohertz", B ("ED82ACEBA19CED97A4EBA5B4ECB8A0"), B ("ED82ACEBA19CED97A4EBA5B4ECB8A0"))
           & Unit_Line (Locale, "degree", B ("EB8F84"), B ("EB8F84"))
           & Unit_Line (Locale, "mile", B ("EBA788EC9DBC"), B ("EBA788EC9DBC"))
           & Unit_Line (Locale, "yard", B ("EC95BCEB939C"), B ("EC95BCEB939C"))
           & Unit_Line (Locale, "foot", B ("ED94BCED8AB8"), B ("ED94BCED8AB8"))
           & Unit_Line (Locale, "inch", B ("EC9DB8ECB998"), B ("EC9DB8ECB998"))
           & Unit_Line (Locale, "gallon", B ("EAB0A4EB9FB0"), B ("EAB0A4EB9FB0"))
           & Unit_Line (Locale, "pound", B ("ED8C8CEC9AB4EB939C"), B ("ED8C8CEC9AB4EB939C"))
           & Unit_Line (Locale, "ounce", B ("EC98A8EC8AA4"), B ("EC98A8EC8AA4"));
      elsif Locale = "zh" then
         return
           Unit_Line (Locale, "pascal", B ("E5B895E696AFE58DA1"), B ("E5B895E696AFE58DA1"))
           & Unit_Line (Locale, "kilopascal", B ("E58D83E5B895"), B ("E58D83E5B895"))
           & Unit_Line (Locale, "joule", B ("E784A6E880B3"), B ("E784A6E880B3"))
           & Unit_Line (Locale, "kilojoule", B ("E58D83E784A6"), B ("E58D83E784A6"))
           & Unit_Line (Locale, "watt", B ("E793A6E789B9"), B ("E793A6E789B9"))
           & Unit_Line (Locale, "kilowatt", B ("E58D83E793A6"), B ("E58D83E793A6"))
           & Unit_Line (Locale, "hertz", B ("E8B5ABE585B9"), B ("E8B5ABE585B9"))
           & Unit_Line (Locale, "kilohertz", B ("E58D83E8B5AB"), B ("E58D83E8B5AB"))
           & Unit_Line (Locale, "degree", B ("E5BAA6"), B ("E5BAA6"))
           & Unit_Line (Locale, "mile", B ("E88BB1E9878C"), B ("E88BB1E9878C"))
           & Unit_Line (Locale, "yard", B ("E7A081"), B ("E7A081"))
           & Unit_Line (Locale, "foot", B ("E88BB1E5B0BA"), B ("E88BB1E5B0BA"))
           & Unit_Line (Locale, "inch", B ("E88BB1E5AFB8"), B ("E88BB1E5AFB8"))
           & Unit_Line (Locale, "gallon", B ("E58AA0E4BB91"), B ("E58AA0E4BB91"))
           & Unit_Line (Locale, "pound", B ("E7A385"), B ("E7A385"))
           & Unit_Line (Locale, "ounce", B ("E79B8EE58FB8"), B ("E79B8EE58FB8"));
      elsif Locale = "ar" then
         return
           Unit_Line (Locale, "pascal", B ("D8A8D8A7D8B3D983D8A7D984"), B ("D8A8D8A7D8B3D983D8A7D984"))
           & Unit_Line (Locale, "kilopascal", B ("D983D98AD984D988D8A8D8A7D8B3D983D8A7D984"), B ("D983D98AD984D988D8A8D8A7D8B3D983D8A7D984"))
           & Unit_Line (Locale, "joule", B ("D8ACD988D984"), B ("D8ACD988D984D8A7D8AA"))
           & Unit_Line (Locale, "kilojoule", B ("D983D98AD984D988D8ACD988D984"), B ("D983D98AD984D988D8ACD988D984D8A7D8AA"))
           & Unit_Line (Locale, "watt", B ("D988D8A7D8B7"), B ("D988D8A7D8B7D8A7D8AA"))
           & Unit_Line (Locale, "kilowatt", B ("D983D98AD984D988D988D8A7D8B7"), B ("D983D98AD984D988D988D8A7D8B7D8A7D8AA"))
           & Unit_Line (Locale, "hertz", B ("D987D8B1D8AAD8B2"), B ("D987D8B1D8AAD8B2"))
           & Unit_Line (Locale, "kilohertz", B ("D983D98AD984D988D987D8B1D8AAD8B2"), B ("D983D98AD984D988D987D8B1D8AAD8B2"))
           & Unit_Line (Locale, "degree", B ("D8AFD8B1D8ACD8A9"), B ("D8AFD8B1D8ACD8A7D8AA"))
           & Unit_Line (Locale, "mile", B ("D985D98AD984"), B ("D8A3D985D98AD8A7D984"))
           & Unit_Line (Locale, "yard", B ("D98AD8A7D8B1D8AFD8A9"), B ("D98AD8A7D8B1D8AFD8A7D8AA"))
           & Unit_Line (Locale, "foot", B ("D982D8AFD985"), B ("D8A3D982D8AFD8A7D985"))
           & Unit_Line (Locale, "inch", B ("D8A8D988D8B5D8A9"), B ("D8A8D988D8B5D8A7D8AA"))
           & Unit_Line (Locale, "gallon", B ("D8BAD8A7D984D988D986"), B ("D8BAD8A7D984D988D986D8A7D8AA"))
           & Unit_Line (Locale, "pound", B ("D8B1D8B7D984"), B ("D8A3D8B1D8B7D8A7D984"))
           & Unit_Line (Locale, "ounce", B ("D8A3D988D986D8B5D8A9"), B ("D8A3D988D986D8B5D8A7D8AA"));
      elsif Locale = "hi" then
         return
           Unit_Line (Locale, "pascal", B ("E0A4AAE0A4BEE0A4B8E0A58DE0A495E0A4B2"), B ("E0A4AAE0A4BEE0A4B8E0A58DE0A495E0A4B2"))
           & Unit_Line (Locale, "kilopascal", B ("E0A495E0A4BFE0A4B2E0A58BE0A4AAE0A4BEE0A4B8E0A58DE0A495E0A4B2"), B ("E0A495E0A4BFE0A4B2E0A58BE0A4AAE0A4BEE0A4B8E0A58DE0A495E0A4B2"))
           & Unit_Line (Locale, "joule", B ("E0A49CE0A582E0A4B2"), B ("E0A49CE0A582E0A4B2"))
           & Unit_Line (Locale, "kilojoule", B ("E0A495E0A4BFE0A4B2E0A58BE0A49CE0A582E0A4B2"), B ("E0A495E0A4BFE0A4B2E0A58BE0A49CE0A582E0A4B2"))
           & Unit_Line (Locale, "watt", B ("E0A4B5E0A4BEE0A49F"), B ("E0A4B5E0A4BEE0A49F"))
           & Unit_Line (Locale, "kilowatt", B ("E0A495E0A4BFE0A4B2E0A58BE0A4B5E0A4BEE0A49F"), B ("E0A495E0A4BFE0A4B2E0A58BE0A4B5E0A4BEE0A49F"))
           & Unit_Line (Locale, "hertz", B ("E0A4B9E0A4B0E0A58DE0A49FE0A58DE0A49C"), B ("E0A4B9E0A4B0E0A58DE0A49FE0A58DE0A49C"))
           & Unit_Line (Locale, "kilohertz", B ("E0A495E0A4BFE0A4B2E0A58BE0A4B9E0A4B0E0A58DE0A49FE0A58DE0A49C"), B ("E0A495E0A4BFE0A4B2E0A58BE0A4B9E0A4B0E0A58DE0A49FE0A58DE0A49C"))
           & Unit_Line (Locale, "degree", B ("E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A580"), B ("E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A580"))
           & Unit_Line (Locale, "mile", B ("E0A4AEE0A580E0A4B2"), B ("E0A4AEE0A580E0A4B2"))
           & Unit_Line (Locale, "yard", B ("E0A497E0A49C"), B ("E0A497E0A49C"))
           & Unit_Line (Locale, "foot", B ("E0A4ABE0A581E0A49F"), B ("E0A4ABE0A581E0A49F"))
           & Unit_Line (Locale, "inch", B ("E0A487E0A482E0A49A"), B ("E0A487E0A482E0A49A"))
           & Unit_Line (Locale, "gallon", B ("E0A497E0A588E0A4B2E0A4A8"), B ("E0A497E0A588E0A4B2E0A4A8"))
           & Unit_Line (Locale, "pound", B ("E0A4AAE0A4BEE0A489E0A482E0A4A1"), B ("E0A4AAE0A4BEE0A489E0A482E0A4A1"))
           & Unit_Line (Locale, "ounce", B ("E0A494E0A482E0A4B8"), B ("E0A494E0A482E0A4B8"));
      else
         return
           Unit_Line (Locale, "pascal", "pascal", "pascals")
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
   end Added_Unit_Non_Latin_Tail;

   function Extra_Unit_Non_Latin_Tail
     (Locale          : String;
      Teaspoon_Sing   : String;
      Teaspoon_Plural : String)
      return String
   is
   begin
      if Locale = "ru" then
         return
           Unit_Line (Locale, "nautical_mile", B ("D0BCD0BED180D181D0BAD0B0D18F20D0BCD0B8D0BBD18F"), B ("D0BCD0BED180D181D0BAD0B8D0B520D0BCD0B8D0BBD0B8"))
           & Unit_Line (Locale, "acre", B ("D0B0D0BAD180"), B ("D0B0D0BAD180D18B"))
           & Unit_Line (Locale, "square_kilometer", B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD18BD0B920D0BAD0B8D0BBD0BED0BCD0B5D182D180"), B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD18BD0B520D0BAD0B8D0BBD0BED0BCD0B5D182D180D18B"))
           & Unit_Line (Locale, "cubic_meter", B ("D0BAD183D0B1D0B8D187D0B5D181D0BAD0B8D0B920D0BCD0B5D182D180"), B ("D0BAD183D0B1D0B8D187D0B5D181D0BAD0B8D0B520D0BCD0B5D182D180D18B"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("D181D182D0BED0BBD0BED0B2D0B0D18F20D0BBD0BED0B6D0BAD0B0"), B ("D181D182D0BED0BBD0BED0B2D18BD0B520D0BBD0BED0B6D0BAD0B8"))
           & Unit_Line (Locale, "cup", B ("D187D0B0D188D0BAD0B0"), B ("D187D0B0D188D0BAD0B8"))
           & Unit_Line (Locale, "stone", B ("D181D182D0BED183D0BD"), B ("D181D182D0BED183D0BDD18B"))
           & Unit_Line (Locale, "tonne", B ("D182D0BED0BDD0BDD0B0"), B ("D182D0BED0BDD0BDD18B"))
           & Unit_Line (Locale, "ton", B ("D182D0BED0BDD0BDD0B0"), B ("D182D0BED0BDD0BDD18B"));
      elsif Locale = "uk" then
         return
           Unit_Line (Locale, "nautical_mile", B ("D0BCD0BED180D181D18CD0BAD0B020D0BCD0B8D0BBD18F"), B ("D0BCD0BED180D181D18CD0BAD19620D0BCD0B8D0BBD196"))
           & Unit_Line (Locale, "acre", B ("D0B0D0BAD180"), B ("D0B0D0BAD180D0B8"))
           & Unit_Line (Locale, "square_kilometer", B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD0B8D0B920D0BAD196D0BBD0BED0BCD0B5D182D180"), B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD19620D0BAD196D0BBD0BED0BCD0B5D182D180D0B8"))
           & Unit_Line (Locale, "cubic_meter", B ("D0BAD183D0B1D196D187D0BDD0B8D0B920D0BCD0B5D182D180"), B ("D0BAD183D0B1D196D187D0BDD19620D0BCD0B5D182D180D0B8"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("D181D182D0BED0BBD0BED0B2D0B020D0BBD0BED0B6D0BAD0B0"), B ("D181D182D0BED0BBD0BED0B2D19620D0BBD0BED0B6D0BAD0B8"))
           & Unit_Line (Locale, "cup", B ("D187D0B0D188D0BAD0B0"), B ("D187D0B0D188D0BAD0B8"))
           & Unit_Line (Locale, "stone", B ("D181D182D0BED183D0BD"), B ("D181D182D0BED183D0BDD0B8"))
           & Unit_Line (Locale, "tonne", B ("D182D0BED0BDD0BDD0B0"), B ("D182D0BED0BDD0BDD0B8"))
           & Unit_Line (Locale, "ton", B ("D182D0BED0BDD0BDD0B0"), B ("D182D0BED0BDD0BDD0B8"));
      elsif Locale = "ja" then
         return
           Unit_Line (Locale, "nautical_mile", B ("E6B5B7E9878C"), B ("E6B5B7E9878C"))
           & Unit_Line (Locale, "acre", B ("E382A8E383BCE382ABE383BC"), B ("E382A8E383BCE382ABE383BC"))
           & Unit_Line (Locale, "square_kilometer", B ("E5B9B3E696B9E382ADE383ADE383A1E383BCE38388E383AB"), B ("E5B9B3E696B9E382ADE383ADE383A1E383BCE38388E383AB"))
           & Unit_Line (Locale, "cubic_meter", B ("E7AB8BE696B9E383A1E383BCE38388E383AB"), B ("E7AB8BE696B9E383A1E383BCE38388E383AB"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("E5A4A7E38195E38198"), B ("E5A4A7E38195E38198"))
           & Unit_Line (Locale, "cup", B ("E382ABE38383E38397"), B ("E382ABE38383E38397"))
           & Unit_Line (Locale, "stone", B ("E382B9E38388E383BCE383B3"), B ("E382B9E38388E383BCE383B3"))
           & Unit_Line (Locale, "tonne", B ("E38388E383B3"), B ("E38388E383B3"))
           & Unit_Line (Locale, "ton", B ("E382B7E383A7E383BCE38388E38388E383B3"), B ("E382B7E383A7E383BCE38388E38388E383B3"));
      elsif Locale = "ko" then
         return
           Unit_Line (Locale, "nautical_mile", B ("ED95B4EBA6AC"), B ("ED95B4EBA6AC"))
           & Unit_Line (Locale, "acre", B ("EC9790EC9DB4ECBBA4"), B ("EC9790EC9DB4ECBBA4"))
           & Unit_Line (Locale, "square_kilometer", B ("ECA09CEAB3B1ED82ACEBA19CEBAFB8ED84B0"), B ("ECA09CEAB3B1ED82ACEBA19CEBAFB8ED84B0"))
           & Unit_Line (Locale, "cubic_meter", B ("EC84B8ECA09CEAB3B1EBAFB8ED84B0"), B ("EC84B8ECA09CEAB3B1EBAFB8ED84B0"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("ED858CEC9DB4EBB894EC8AA4ED91BC"), B ("ED858CEC9DB4EBB894EC8AA4ED91BC"))
           & Unit_Line (Locale, "cup", B ("ECBBB5"), B ("ECBBB5"))
           & Unit_Line (Locale, "stone", B ("EC8AA4ED86A4"), B ("EC8AA4ED86A4"))
           & Unit_Line (Locale, "tonne", B ("ED86A4"), B ("ED86A4"))
           & Unit_Line (Locale, "ton", B ("EC87BCED8AB8ED86A4"), B ("EC87BCED8AB8ED86A4"));
      elsif Locale = "zh" then
         return
           Unit_Line (Locale, "nautical_mile", B ("E6B5B7E9878C"), B ("E6B5B7E9878C"))
           & Unit_Line (Locale, "acre", B ("E88BB1E4BAA9"), B ("E88BB1E4BAA9"))
           & Unit_Line (Locale, "square_kilometer", B ("E5B9B3E696B9E58D83E7B1B3"), B ("E5B9B3E696B9E58D83E7B1B3"))
           & Unit_Line (Locale, "cubic_meter", B ("E7AB8BE696B9E7B1B3"), B ("E7AB8BE696B9E7B1B3"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("E6B1A4E58C99"), B ("E6B1A4E58C99"))
           & Unit_Line (Locale, "cup", B ("E69DAF"), B ("E69DAF"))
           & Unit_Line (Locale, "stone", B ("E88BB1E79FB3"), B ("E88BB1E79FB3"))
           & Unit_Line (Locale, "tonne", B ("E590A8"), B ("E590A8"))
           & Unit_Line (Locale, "ton", B ("E79FADE590A8"), B ("E79FADE590A8"));
      elsif Locale = "ar" then
         return
           Unit_Line (Locale, "nautical_mile", B ("D985D98AD98420D8A8D8ADD8B1D98A"), B ("D8A3D985D98AD8A7D98420D8A8D8ADD8B1D98AD8A9"))
           & Unit_Line (Locale, "acre", B ("D981D8AFD8A7D986"), B ("D8A3D981D8AFD986D8A9"))
           & Unit_Line (Locale, "square_kilometer", B ("D983D98AD984D988D985D8AAD8B120D985D8B1D8A8D8B9"), B ("D983D98AD984D988D985D8AAD8B1D8A7D8AA20D985D8B1D8A8D8B9D8A9"))
           & Unit_Line (Locale, "cubic_meter", B ("D985D8AAD8B120D985D983D8B9D8A8"), B ("D8A3D985D8AAD8A7D8B120D985D983D8B9D8A8D8A9"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("D985D984D8B9D982D8A920D983D8A8D98AD8B1D8A9"), B ("D985D984D8A7D8B9D98220D983D8A8D98AD8B1D8A9"))
           & Unit_Line (Locale, "cup", B ("D983D988D8A8"), B ("D8A3D983D988D8A7D8A8"))
           & Unit_Line (Locale, "stone", B ("D8B3D8AAD988D986"), B ("D8B3D8AAD988D986"))
           & Unit_Line (Locale, "tonne", B ("D8B7D98620D985D8AAD8B1D98A"), B ("D8A3D8B7D986D8A7D98620D985D8AAD8B1D98AD8A9"))
           & Unit_Line (Locale, "ton", B ("D8B7D986"), B ("D8A3D8B7D986D8A7D986"));
      elsif Locale = "hi" then
         return
           Unit_Line (Locale, "nautical_mile", B ("E0A4B8E0A4AEE0A581E0A4A6E0A58DE0A4B0E0A58020E0A4AEE0A580E0A4B2"), B ("E0A4B8E0A4AEE0A581E0A4A6E0A58DE0A4B0E0A58020E0A4AEE0A580E0A4B2"))
           & Unit_Line (Locale, "acre", B ("E0A48FE0A495E0A4A1E0A4BC"), B ("E0A48FE0A495E0A4A1E0A4BC"))
           & Unit_Line (Locale, "square_kilometer", B ("E0A4B5E0A4B0E0A58DE0A49720E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"), B ("E0A4B5E0A4B0E0A58DE0A49720E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"))
           & Unit_Line (Locale, "cubic_meter", B ("E0A498E0A4A820E0A4AEE0A580E0A49FE0A4B0"), B ("E0A498E0A4A820E0A4AEE0A580E0A49FE0A4B0"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("E0A4ACE0A4A1E0A4BCE0A4BE20E0A49AE0A4AEE0A58DE0A4AEE0A49A"), B ("E0A4ACE0A4A1E0A4BCE0A58720E0A49AE0A4AEE0A58DE0A4AEE0A49A"))
           & Unit_Line (Locale, "cup", B ("E0A495E0A4AA"), B ("E0A495E0A4AA"))
           & Unit_Line (Locale, "stone", B ("E0A4B8E0A58DE0A49FE0A58BE0A4A8"), B ("E0A4B8E0A58DE0A49FE0A58BE0A4A8"))
           & Unit_Line (Locale, "tonne", B ("E0A49FE0A4A8"), B ("E0A49FE0A4A8"))
           & Unit_Line (Locale, "ton", B ("E0A49BE0A58BE0A49FE0A4BE20E0A49FE0A4A8"), B ("E0A49BE0A58BE0A49FE0A58720E0A49FE0A4A8"));
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
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", "tablespoon", "tablespoons")
           & Unit_Line (Locale, "cup", "cup", "cups")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tonne", "tonnes")
           & Unit_Line (Locale, "ton", "ton", "tons");
      end if;
   end Extra_Unit_Non_Latin_Tail;

   pragma Style_Checks (On);

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

end Humanize.Catalogs.Unit_Data;
