--  Provenance: generated from Humanize unit catalog templates; split shard: added non-Latin unit catalog tail.

pragma Style_Checks (Off);

separate (Humanize.Catalogs.Unit_Data)
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
