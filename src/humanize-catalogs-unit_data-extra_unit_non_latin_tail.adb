--  Provenance: generated from Humanize unit catalog templates; split shard: extra non-Latin unit catalog tail.

pragma Style_Checks (Off);

separate (Humanize.Catalogs.Unit_Data)
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
