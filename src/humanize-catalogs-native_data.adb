with Humanize.Catalogs.Encoding;
with Humanize.Catalogs.Unit_Data;

package body Humanize.Catalogs.Native_Data is

   --  Provenance: generated from reviewed native catalog fragments and
   --  checked in as Ada source. Keep currentness notes in docs/QUALITY_GUARDS.md.

   --  Data boundary: this body intentionally holds native catalog fragments.
   --  Loader behavior belongs in Humanize.Catalogs.Loader and byte helpers
   --  belong in Humanize.Catalogs.Encoding.

   LF : constant String := [1 => ASCII.LF];

   AA     : String renames Humanize.Catalogs.Encoding.AA;
   ECIRC  : String renames Humanize.Catalogs.Encoding.ECIRC;
   IACUTE : String renames Humanize.Catalogs.Encoding.IACUTE;
   NTILDE : String renames Humanize.Catalogs.Encoding.NTILDE;

   function B (Hex : String) return String
      renames Humanize.Catalogs.Encoding.B;

   function Added_Unit_Keys (Locale : String) return String
      renames Humanize.Catalogs.Unit_Data.Added_Unit_Keys;

   function Extra_Unit_Keys (Locale : String) return String
      renames Humanize.Catalogs.Unit_Data.Extra_Unit_Keys;

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

   function Added_Keys (Locale : String) return String is
   begin
      return
        Locale & ".humanize.duration.unit.millisecond = "
        & "{count, plural, one {{value, number} millisecond} other {{value, number} milliseconds}}" & LF
        & Locale & ".humanize.duration.unit.microsecond = "
        & "{count, plural, one {{value, number} microsecond} other {{value, number} microseconds}}" & LF
        & Locale & ".humanize.duration.unit.week = "
        & "{count, plural, one {{value, number} week} other {{value, number} weeks}}" & LF
        & Locale & ".humanize.duration.unit.month = "
        & "{count, plural, one {{value, number} month} other {{value, number} months}}" & LF
        & Locale & ".humanize.duration.unit.year = "
        & "{count, plural, one {{value, number} year} other {{value, number} years}}" & LF
        & Locale & ".humanize.frequency.never = never" & LF
        & Locale & ".humanize.frequency.once = once" & LF
        & Locale & ".humanize.frequency.twice = twice" & LF
        & Locale & ".humanize.frequency.times = "
        & "{count, plural, one {{value, number} time} other {{value, number} times}}" & LF
        & Locale & ".humanize.rate.per.second = approximately {value} per second" & LF
        & Locale & ".humanize.rate.per.minute = approximately {value} per minute" & LF
        & Locale & ".humanize.rate.per.hour = approximately {value} per hour" & LF
        & Locale & ".humanize.rate.per.day = approximately {value} per day" & LF
        & Locale & ".humanize.rate.per.week = approximately {value} per week" & LF
        & Locale & ".humanize.rate.less_than.per.second = less than {value} per second" & LF
        & Locale & ".humanize.rate.less_than.per.minute = less than {value} per minute" & LF
        & Locale & ".humanize.rate.less_than.per.hour = less than {value} per hour" & LF
        & Locale & ".humanize.rate.less_than.per.day = less than {value} per day" & LF
        & Locale & ".humanize.rate.less_than.per.week = less than {value} per week" & LF
        & Locale & ".humanize.number.bounded = {value, number}{suffix}" & LF
        & Added_Unit_Keys (Locale)
        & Extra_Unit_Keys (Locale)
        & Locale & ".humanize.list.other = {value, number} other" & LF
        & Locale & ".humanize.list.others = {value, number} others" & LF;
   end Added_Keys;

   function Dutch_Added_Keys return String is
   begin
      return
        "nl.humanize.duration.unit.millisecond = "
        & "{count, plural, one {{value, number} milliseconde} other {{value, number} milliseconden}}" & LF
        & "nl.humanize.duration.unit.microsecond = "
        & "{count, plural, one {{value, number} microseconde} other {{value, number} microseconden}}" & LF
        & "nl.humanize.duration.unit.week = "
        & "{count, plural, one {{value, number} week} other {{value, number} weken}}" & LF
        & "nl.humanize.duration.unit.month = "
        & "{count, plural, one {{value, number} maand} other {{value, number} maanden}}" & LF
        & "nl.humanize.duration.unit.year = "
        & "{count, plural, one {{value, number} jaar} other {{value, number} jaar}}" & LF
        & "nl.humanize.frequency.never = nooit" & LF
        & "nl.humanize.frequency.once = eenmaal" & LF
        & "nl.humanize.frequency.twice = tweemaal" & LF
        & "nl.humanize.frequency.times = "
        & "{count, plural, one {{value, number} keer} other {{value, number} keer}}" & LF
        & "nl.humanize.rate.per.second = ongeveer {value} per seconde" & LF
        & "nl.humanize.rate.per.minute = ongeveer {value} per minuut" & LF
        & "nl.humanize.rate.per.hour = ongeveer {value} per uur" & LF
        & "nl.humanize.rate.per.day = ongeveer {value} per dag" & LF
        & "nl.humanize.rate.per.week = ongeveer {value} per week" & LF
        & "nl.humanize.rate.less_than.per.second = minder dan {value} per seconde" & LF
        & "nl.humanize.rate.less_than.per.minute = minder dan {value} per minuut" & LF
        & "nl.humanize.rate.less_than.per.hour = minder dan {value} per uur" & LF
        & "nl.humanize.rate.less_than.per.day = minder dan {value} per dag" & LF
        & "nl.humanize.rate.less_than.per.week = minder dan {value} per week" & LF
        & "nl.humanize.number.bounded = {value, number}{suffix}" & LF
        & "nl.humanize.unit.celsius = "
        & "{count, plural, one {{value, number} graad Celsius} "
        & "other {{value, number} graden Celsius}}" & LF
        & "nl.humanize.unit.fahrenheit = "
        & "{count, plural, one {{value, number} graad Fahrenheit} "
        & "other {{value, number} graden Fahrenheit}}" & LF
        & "nl.humanize.unit.square_meter = "
        & "{count, plural, one {{value, number} vierkante meter} "
        & "other {{value, number} vierkante meter}}" & LF
        & "nl.humanize.unit.hectare = "
        & "{count, plural, one {{value, number} hectare} "
        & "other {{value, number} hectares}}" & LF
        & "nl.humanize.unit.kilometer_per_hour = "
        & "{count, plural, one {{value, number} kilometer per uur} "
        & "other {{value, number} kilometer per uur}}" & LF
        & "nl.humanize.unit.meter_per_second = "
        & "{count, plural, one {{value, number} meter per seconde} "
        & "other {{value, number} meter per seconde}}" & LF
        & "nl.humanize.unit.pascal = "
        & "{count, plural, one {{value, number} pascal} "
        & "other {{value, number} pascals}}" & LF
        & "nl.humanize.unit.kilopascal = "
        & "{count, plural, one {{value, number} kilopascal} "
        & "other {{value, number} kilopascals}}" & LF
        & "nl.humanize.unit.joule = "
        & "{count, plural, one {{value, number} joule} "
        & "other {{value, number} joules}}" & LF
        & "nl.humanize.unit.kilojoule = "
        & "{count, plural, one {{value, number} kilojoule} "
        & "other {{value, number} kilojoules}}" & LF
        & "nl.humanize.unit.watt = "
        & "{count, plural, one {{value, number} watt} "
        & "other {{value, number} watts}}" & LF
        & "nl.humanize.unit.kilowatt = "
        & "{count, plural, one {{value, number} kilowatt} "
        & "other {{value, number} kilowatts}}" & LF
        & "nl.humanize.unit.hertz = "
        & "{count, plural, one {{value, number} hertz} "
        & "other {{value, number} hertz}}" & LF
        & "nl.humanize.unit.kilohertz = "
        & "{count, plural, one {{value, number} kilohertz} "
        & "other {{value, number} kilohertz}}" & LF
        & "nl.humanize.unit.degree = "
        & "{count, plural, one {{value, number} graad} "
        & "other {{value, number} graden}}" & LF
        & "nl.humanize.unit.mile = "
        & "{count, plural, one {{value, number} mijl} "
        & "other {{value, number} mijl}}" & LF
        & "nl.humanize.unit.yard = "
        & "{count, plural, one {{value, number} yard} "
        & "other {{value, number} yards}}" & LF
        & "nl.humanize.unit.foot = "
        & "{count, plural, one {{value, number} voet} "
        & "other {{value, number} voet}}" & LF
        & "nl.humanize.unit.inch = "
        & "{count, plural, one {{value, number} inch} "
        & "other {{value, number} inches}}" & LF
        & "nl.humanize.unit.gallon = "
        & "{count, plural, one {{value, number} gallon} "
        & "other {{value, number} gallons}}" & LF
        & "nl.humanize.unit.pound = "
        & "{count, plural, one {{value, number} pond} "
        & "other {{value, number} pond}}" & LF
        & "nl.humanize.unit.ounce = "
        & "{count, plural, one {{value, number} ounce} "
        & "other {{value, number} ounce}}" & LF
        & Extra_Unit_Keys ("nl")
        & "nl.humanize.list.other = {value, number} andere" & LF
        & "nl.humanize.list.others = {value, number} anderen" & LF;
   end Dutch_Added_Keys;

   function Slavic_Many_Form
     (Locale   : String;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      if Locale = "pl" then
         if Singular = "godzina" then
            return "godzin";
         elsif Singular = "metr" then
            return B ("6D657472C3B377");
         elsif Singular = "kilogram" then
            return B ("6B696C6F6772616DC3B377");
         elsif Singular = "sekunda"
           or else Singular = "milisekunda"
           or else Singular = "mikrosekunda"
         then
            return "sekund";
         elsif Singular = "minuta" then
            return "minut";
         elsif Singular = "raz" then
            return "razy";
         end if;
      elsif Locale = "cs" then
         if Singular = "hodina" then
            return "hodin";
         elsif Singular = "metr" then
            return B ("6D657472C5AF");
         elsif Singular = "kilogram" then
            return B ("6B696C6F6772616DC5AF");
         elsif Singular = "sekunda"
           or else Singular = "milisekunda"
           or else Singular = "mikrosekunda"
         then
            return "sekund";
         elsif Singular = "minuta" then
            return "minut";
         elsif Singular = B ("6B72C3A174") then
            return B ("6B72C3A174");
         end if;
      elsif Locale = "ru" then
         if Singular = B ("D187D0B0D181") then
            return B ("D187D0B0D181D0BED0B2");
         elsif Singular = B ("D0BCD0B5D182D180") then
            return B ("D0BCD0B5D182D180D0BED0B2");
         elsif Singular = B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BC") then
            return B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BCD0BED0B2");
         elsif Singular = B ("D181D0B5D0BAD183D0BDD0B4D0B0") then
            return B ("D181D0B5D0BAD183D0BDD0B4");
         elsif Singular = B ("D0BCD0B8D0BDD183D182D0B0") then
            return B ("D0BCD0B8D0BDD183D182");
         elsif Singular = B ("D180D0B0D0B7") then
            return B ("D180D0B0D0B7");
         end if;
      elsif Locale = "uk" then
         if Singular = B ("D0B3D0BED0B4D0B8D0BDD0B0") then
            return B ("D0B3D0BED0B4D0B8D0BD");
         elsif Singular = B ("D0BCD0B5D182D180") then
            return B ("D0BCD0B5D182D180D196D0B2");
         elsif Singular = B ("D0BAD196D0BBD0BED0B3D180D0B0D0BC") then
            return B ("D0BAD196D0BBD0BED0B3D180D0B0D0BCD196D0B2");
         elsif Singular = B ("D181D0B5D0BAD183D0BDD0B4D0B0") then
            return B ("D181D0B5D0BAD183D0BDD0B4");
         elsif Singular = B ("D185D0B2D0B8D0BBD0B8D0BDD0B0") then
            return B ("D185D0B2D0B8D0BBD0B8D0BD");
         elsif Singular = B ("D180D0B0D0B7") then
            return B ("D180D0B0D0B7D196D0B2");
         end if;
      elsif Locale = "sk" then
         if Singular = "hodina" then
            return "hodin";
         elsif Singular = "sekunda"
           or else Singular = "milisekunda"
           or else Singular = "mikrosekunda"
         then
            return "sekund";
         elsif Singular = "minuta" then
            return "minut";
         elsif Singular = "tyzden" then
            return "tyzdnov";
         elsif Singular = "mesiac" then
            return "mesiacov";
         elsif Singular = "rok" then
            return "rokov";
         elsif Singular = "bajt" then
            return "bajtov";
         elsif Singular = "meter" then
            return "metrov";
         elsif Singular = "kilometer" then
            return "kilometrov";
         elsif Singular = "gram" then
            return "gramov";
         elsif Singular = "kilogram" then
            return "kilogramov";
         elsif Singular = "liter" then
            return "litrov";
         elsif Singular = "centimeter" then
            return "centimetrov";
         elsif Singular = "milimeter" then
            return "milimetrov";
         elsif Singular = "miligram" then
            return "miligramov";
         elsif Singular = "mililiter" then
            return "mililitrov";
         end if;
      elsif Locale = "sl" then
         if Singular = "ura" then
            return "ur";
         elsif Singular = "sekunda"
           or else Singular = "milisekunda"
           or else Singular = "mikrosekunda"
         then
            return "sekund";
         elsif Singular = "minuta" then
            return "minut";
         elsif Singular = "teden" then
            return "tednov";
         elsif Singular = "mesec" then
            return "mesecev";
         elsif Singular = "leto" then
            return "let";
         elsif Singular = "bajt" then
            return "bajtov";
         elsif Singular = "meter" then
            return "metrov";
         elsif Singular = "kilometer" then
            return "kilometrov";
         elsif Singular = "gram" then
            return "gramov";
         elsif Singular = "kilogram" then
            return "kilogramov";
         elsif Singular = "liter" then
            return "litrov";
         elsif Singular = "centimeter" then
            return "centimetrov";
         elsif Singular = "milimeter" then
            return "milimetrov";
         elsif Singular = "miligram" then
            return "miligramov";
         elsif Singular = "mililiter" then
            return "mililitrov";
         end if;
      end if;

      return Plural;
   end Slavic_Many_Form;

   function Count_Line
     (Locale   : String;
      Key      : String;
      Singular : String;
      Plural   : String)
      return String
   is
      Many : constant String := Slavic_Many_Form (Locale, Singular, Plural);
   begin
      if Locale = "pl"
        or else Locale = "cs"
        or else Locale = "ru"
        or else Locale = "uk"
        or else Locale = "sk"
      then
         return
           Locale & "." & Key & " = "
           & "{count, plural, one {{value, number} " & Singular & "} "
           & "few {{value, number} " & Plural & "} "
           & "many {{value, number} "
           & Many & "} "
           & "other {{value, number} "
           & (if Locale = "sk" then Many else Plural)
           & "}}" & LF;
      end if;

      return
        Locale & "." & Key & " = "
        & "{count, plural, one {{value, number} " & Singular & "} "
        & "other {{value, number} " & Plural & "}}" & LF;
   end Count_Line;

   function Relative_Line
     (Locale   : String;
      Key      : String;
      Singular : String;
      Plural   : String;
      Prefix   : String;
      Suffix   : String)
      return String
   is
      Many : constant String := Slavic_Many_Form (Locale, Singular, Plural);
   begin
      if Locale = "pl"
        or else Locale = "cs"
        or else Locale = "ru"
        or else Locale = "uk"
        or else Locale = "sk"
      then
         return
           Locale & "." & Key & " = "
           & "{count, plural, one {" & Prefix & "{value, number} "
           & Singular & Suffix & "} few {" & Prefix & "{value, number} "
           & Plural & Suffix & "} many {" & Prefix & "{value, number} "
           & Many & Suffix
           & "} other {" & Prefix & "{value, number} "
           & (if Locale = "sk" then Many else Plural)
           & Suffix
           & "}}" & LF;
      end if;

      return
        Locale & "." & Key & " = "
        & "{count, plural, one {" & Prefix & "{value, number} "
        & Singular & Suffix & "} other {" & Prefix & "{value, number} "
        & Plural & Suffix & "}}" & LF;
   end Relative_Line;

   function Core_Locale_Catalog
     (Locale            : String;
      Now_Text          : String;
      Yesterday_Text    : String;
      Today_Text        : String;
      Tomorrow_Text     : String;
      Past_Suffix       : String;
      Future_Prefix     : String;
      Second_Singular   : String;
      Second_Plural     : String;
      Minute_Singular   : String;
      Minute_Plural     : String;
      Hour_Singular     : String;
      Hour_Plural       : String;
      Day_Singular      : String;
      Day_Plural        : String;
      Week_Singular     : String;
      Week_Plural       : String;
      Month_Singular    : String;
      Month_Plural      : String;
      Year_Singular     : String;
      Year_Plural       : String;
      Byte_Singular     : String;
      Byte_Plural       : String;
      Thousand_Short    : String;
      Million_Short     : String;
      Billion_Short     : String;
      Trillion_Short    : String;
      Thousand_Long     : String;
      Million_Long      : String;
      Billion_Long      : String;
      Trillion_Long     : String;
      Meter_Singular    : String;
      Meter_Plural      : String;
      Kilometer_Sing    : String;
      Kilometer_Plural  : String;
      Gram_Singular     : String;
      Gram_Plural       : String;
      Kilogram_Sing     : String;
      Kilogram_Plural   : String;
      Liter_Singular    : String;
      Liter_Plural      : String;
      Centimeter_Sing   : String;
      Centimeter_Plural : String;
      Millimeter_Sing   : String;
      Millimeter_Plural : String;
      Milligram_Sing    : String;
      Milligram_Plural  : String;
      Milliliter_Sing   : String;
      Milliliter_Plural : String;
      And_Text          : String)
      return String
   is
   begin
      return
        Locale & ".humanize.datetime.now = " & Now_Text & LF
        & Locale & ".humanize.datetime.day.previous = " & Yesterday_Text & LF
        & Locale & ".humanize.datetime.day.current = " & Today_Text & LF
        & Locale & ".humanize.datetime.day.next = " & Tomorrow_Text & LF
        & Relative_Line
            (Locale, "humanize.datetime.relative.second.past",
             Second_Singular, Second_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.second.future",
             Second_Singular, Second_Plural, Future_Prefix, "")
        & Relative_Line
            (Locale, "humanize.datetime.relative.minute.past",
             Minute_Singular, Minute_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.minute.future",
             Minute_Singular, Minute_Plural, Future_Prefix, "")
        & Relative_Line
            (Locale, "humanize.datetime.relative.hour.past",
             Hour_Singular, Hour_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.hour.future",
             Hour_Singular, Hour_Plural, Future_Prefix, "")
        & Relative_Line
            (Locale, "humanize.datetime.relative.day.past",
             Day_Singular, Day_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.day.future",
             Day_Singular, Day_Plural, Future_Prefix, "")
        & Relative_Line
            (Locale, "humanize.datetime.relative.week.past",
             Week_Singular, Week_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.week.future",
             Week_Singular, Week_Plural, Future_Prefix, "")
        & Relative_Line
            (Locale, "humanize.datetime.relative.month.past",
             Month_Singular, Month_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.month.future",
             Month_Singular, Month_Plural, Future_Prefix, "")
        & Relative_Line
            (Locale, "humanize.datetime.relative.year.past",
             Year_Singular, Year_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.year.future",
             Year_Singular, Year_Plural, Future_Prefix, "")
        & Count_Line
            (Locale, "humanize.duration.unit.second",
             Second_Singular, Second_Plural)
        & Count_Line
            (Locale, "humanize.duration.unit.minute",
             Minute_Singular, Minute_Plural)
        & Count_Line
            (Locale, "humanize.duration.unit.hour",
             Hour_Singular, Hour_Plural)
        & Count_Line
            (Locale, "humanize.duration.unit.day", Day_Singular, Day_Plural)
        & Count_Line (Locale, "humanize.bytes.byte", Byte_Singular, Byte_Plural)
        & Locale & ".humanize.bytes.kb = {value, number} kB" & LF
        & Locale & ".humanize.bytes.mb = {value, number} MB" & LF
        & Locale & ".humanize.bytes.gb = {value, number} GB" & LF
        & Locale & ".humanize.bytes.tb = {value, number} TB" & LF
        & Locale & ".humanize.bytes.kib = {value, number} KiB" & LF
        & Locale & ".humanize.bytes.mib = {value, number} MiB" & LF
        & Locale & ".humanize.bytes.gib = {value, number} GiB" & LF
        & Locale & ".humanize.bytes.tib = {value, number} TiB" & LF
        & Locale & ".humanize.number.ordinal = {value, number}." & LF
        & Locale & ".humanize.number.ordinal.feminine = {value, number}." & LF
        & Locale & ".humanize.number.compact.plain = {value, number}" & LF
        & Locale & ".humanize.number.compact.thousand = {value, number}"
        & Thousand_Short & LF
        & Locale & ".humanize.number.compact.million = {value, number}"
        & Million_Short & LF
        & Locale & ".humanize.number.compact.billion = {value, number}"
        & Billion_Short & LF
        & Locale & ".humanize.number.compact.trillion = {value, number}"
        & Trillion_Short & LF
        & Count_Line
            (Locale, "humanize.number.compact.long.thousand",
             Thousand_Long, Thousand_Long)
        & Count_Line
            (Locale, "humanize.number.compact.long.million",
             Million_Long, Million_Long)
        & Count_Line
            (Locale, "humanize.number.compact.long.billion",
             Billion_Long, Billion_Long)
        & Count_Line
            (Locale, "humanize.number.compact.long.trillion",
             Trillion_Long, Trillion_Long)
        & Unit_Line (Locale, "meter", Meter_Singular, Meter_Plural)
        & Unit_Line (Locale, "kilometer", Kilometer_Sing, Kilometer_Plural)
        & Unit_Line (Locale, "gram", Gram_Singular, Gram_Plural)
        & Unit_Line (Locale, "kilogram", Kilogram_Sing, Kilogram_Plural)
        & Unit_Line (Locale, "liter", Liter_Singular, Liter_Plural)
        & Locale & ".humanize.number.percent = {value, number}%" & LF
        & Unit_Line (Locale, "centimeter", Centimeter_Sing, Centimeter_Plural)
        & Unit_Line (Locale, "millimeter", Millimeter_Sing, Millimeter_Plural)
        & Unit_Line (Locale, "milligram", Milligram_Sing, Milligram_Plural)
        & Unit_Line (Locale, "milliliter", Milliliter_Sing, Milliliter_Plural)
        & Locale & ".humanize.list.and = " & And_Text & LF;
   end Core_Locale_Catalog;

   function Added_Core_Locale_Catalog
     (Locale              : String;
      Millisecond_Sing    : String;
      Millisecond_Plural  : String;
      Microsecond_Sing    : String;
      Microsecond_Plural  : String;
      Week_Singular       : String;
      Week_Plural         : String;
      Month_Singular      : String;
      Month_Plural        : String;
      Year_Singular       : String;
      Year_Plural         : String;
      Never_Text          : String;
      Once_Text           : String;
      Twice_Text          : String;
      Time_Singular       : String;
      Time_Plural         : String;
      Approx_Text         : String;
      Less_Than_Text      : String;
      Per_Second_Text     : String;
      Per_Minute_Text     : String;
      Per_Hour_Text       : String;
      Per_Day_Text        : String;
      Per_Week_Text       : String;
      Other_Singular      : String;
      Other_Plural        : String)
      return String
   is
   begin
      return
        Count_Line
          (Locale, "humanize.duration.unit.millisecond",
           Millisecond_Sing, Millisecond_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.microsecond",
           Microsecond_Sing, Microsecond_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.week", Week_Singular, Week_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.month",
           Month_Singular, Month_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.year", Year_Singular, Year_Plural)
        & Locale & ".humanize.frequency.never = " & Never_Text & LF
        & Locale & ".humanize.frequency.once = " & Once_Text & LF
        & Locale & ".humanize.frequency.twice = " & Twice_Text & LF
        & Count_Line
          (Locale, "humanize.frequency.times", Time_Singular, Time_Plural)
        & Locale & ".humanize.rate.per.second = " & Approx_Text
        & " {value} " & Per_Second_Text & LF
        & Locale & ".humanize.rate.per.minute = " & Approx_Text
        & " {value} " & Per_Minute_Text & LF
        & Locale & ".humanize.rate.per.hour = " & Approx_Text
        & " {value} " & Per_Hour_Text & LF
        & Locale & ".humanize.rate.per.day = " & Approx_Text
        & " {value} " & Per_Day_Text & LF
        & Locale & ".humanize.rate.per.week = " & Approx_Text
        & " {value} " & Per_Week_Text & LF
        & Locale & ".humanize.rate.less_than.per.second = " & Less_Than_Text
        & " {value} " & Per_Second_Text & LF
        & Locale & ".humanize.rate.less_than.per.minute = " & Less_Than_Text
        & " {value} " & Per_Minute_Text & LF
        & Locale & ".humanize.rate.less_than.per.hour = " & Less_Than_Text
        & " {value} " & Per_Hour_Text & LF
        & Locale & ".humanize.rate.less_than.per.day = " & Less_Than_Text
        & " {value} " & Per_Day_Text & LF
        & Locale & ".humanize.rate.less_than.per.week = " & Less_Than_Text
        & " {value} " & Per_Week_Text & LF
        & Locale & ".humanize.number.bounded = {value, number}{suffix}" & LF
        & Added_Unit_Keys (Locale)
        & Extra_Unit_Keys (Locale)
        & Locale & ".humanize.list.other = {value, number} "
        & Other_Singular & LF
        & Locale & ".humanize.list.others = {value, number} "
        & Other_Plural & LF;
   end Added_Core_Locale_Catalog;

   function Native_Added_Keys
     (Locale              : String;
      Millisecond_Sing    : String;
      Millisecond_Plural  : String;
      Microsecond_Sing    : String;
      Microsecond_Plural  : String;
      Week_Singular       : String;
      Week_Plural         : String;
      Month_Singular      : String;
      Month_Plural        : String;
      Year_Singular       : String;
      Year_Plural         : String;
      Never_Text          : String;
      Once_Text           : String;
      Twice_Text          : String;
      Time_Singular       : String;
      Time_Plural         : String;
      Approx_Text         : String;
      Less_Than_Text      : String;
      Per_Second_Text     : String;
      Per_Minute_Text     : String;
      Per_Hour_Text       : String;
      Per_Day_Text        : String;
      Per_Week_Text       : String;
      Other_Singular      : String;
      Other_Plural        : String)
      return String
   is
   begin
      return
        Count_Line
          (Locale, "humanize.duration.unit.millisecond",
           Millisecond_Sing, Millisecond_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.microsecond",
           Microsecond_Sing, Microsecond_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.week", Week_Singular, Week_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.month",
           Month_Singular, Month_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.year", Year_Singular, Year_Plural)
        & Locale & ".humanize.frequency.never = " & Never_Text & LF
        & Locale & ".humanize.frequency.once = " & Once_Text & LF
        & Locale & ".humanize.frequency.twice = " & Twice_Text & LF
        & Count_Line
          (Locale, "humanize.frequency.times", Time_Singular, Time_Plural)
        & Locale & ".humanize.rate.per.second = " & Approx_Text
        & " {value} " & Per_Second_Text & LF
        & Locale & ".humanize.rate.per.minute = " & Approx_Text
        & " {value} " & Per_Minute_Text & LF
        & Locale & ".humanize.rate.per.hour = " & Approx_Text
        & " {value} " & Per_Hour_Text & LF
        & Locale & ".humanize.rate.per.day = " & Approx_Text
        & " {value} " & Per_Day_Text & LF
        & Locale & ".humanize.rate.per.week = " & Approx_Text
        & " {value} " & Per_Week_Text & LF
        & Locale & ".humanize.rate.less_than.per.second = " & Less_Than_Text
        & " {value} " & Per_Second_Text & LF
        & Locale & ".humanize.rate.less_than.per.minute = " & Less_Than_Text
        & " {value} " & Per_Minute_Text & LF
        & Locale & ".humanize.rate.less_than.per.hour = " & Less_Than_Text
        & " {value} " & Per_Hour_Text & LF
        & Locale & ".humanize.rate.less_than.per.day = " & Less_Than_Text
        & " {value} " & Per_Day_Text & LF
        & Locale & ".humanize.rate.less_than.per.week = " & Less_Than_Text
        & " {value} " & Per_Week_Text & LF
        & Locale & ".humanize.number.bounded = {value, number}{suffix}" & LF
        & Added_Unit_Keys (Locale)
        & Extra_Unit_Keys (Locale)
        & Locale & ".humanize.list.other = {value, number} "
        & Other_Singular & LF
        & Locale & ".humanize.list.others = {value, number} "
        & Other_Plural & LF;
   end Native_Added_Keys;

   function Dutch_Core_Catalog return String is
   begin
      return
        Core_Locale_Catalog
          ("nl",
           "nu",
           "gisteren",
           "vandaag",
           "morgen",
           " geleden",
           "over ",
           "seconde",
           "seconden",
           "minuut",
           "minuten",
           "uur",
           "uur",
           "dag",
           "dagen",
           "week",
           "weken",
           "maand",
           "maanden",
           "jaar",
           "jaar",
           "byte",
           "bytes",
           "K",
           " mln.",
           " mld.",
           " bln.",
           "duizend",
           "miljoen",
           "miljard",
           "biljoen",
           "meter",
           "meters",
           "kilometer",
           "kilometer",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "liter",
           "liter",
           "centimeter",
           "centimeter",
           "millimeter",
           "millimeter",
           "milligram",
           "milligram",
           "milliliter",
           "milliliter",
           "en");
   end Dutch_Core_Catalog;

   function New_Locale_Catalogs return String is
   begin
      return
        Core_Locale_Catalog
          ("sv",
           "nu",
           B ("6967C3A572"),
           "idag",
           "imorgon",
           " sedan",
           "om ",
           "sekund",
           "sekunder",
           "minut",
           "minuter",
           "timme",
           "timmar",
           "dag",
           "dagar",
           "vecka",
           "veckor",
           B ("6DC3A56E6164"),
           B ("6DC3A56E61646572"),
           B ("C3A572"),
           B ("C3A572"),
           "byte",
           "byte",
           " tn",
           " mn",
           " md",
           " bn",
           "tusen",
           "miljon",
           "miljard",
           "biljon",
           "meter",
           "meter",
           "kilometer",
           "kilometer",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "liter",
           "liter",
           "centimeter",
           "centimeter",
           "millimeter",
           "millimeter",
           "milligram",
           "milligram",
           "milliliter",
           "milliliter",
           "och")
        & Added_Core_Locale_Catalog
          ("sv",
           "millisekund",
           "millisekunder",
           "mikrosekund",
           "mikrosekunder",
           "vecka",
           "veckor",
           B ("6DC3A56E6164"),
           B ("6DC3A56E61646572"),
           B ("C3A572"),
           B ("C3A572"),
           "aldrig",
           B ("656E2067C3A56E67"),
           B ("7476C3A52067C3A56E676572"),
           B ("67C3A56E67"),
           B ("67C3A56E676572"),
           B ("756E676566C3A472"),
           B ("6D696E64726520C3A46E"),
           "per sekund",
           "per minut",
           "per timme",
           "per dag",
           "per vecka",
           "annan",
           "andra")
        & Core_Locale_Catalog
          ("no",
           B ("6EC3A5"),
           B ("692067C3A572"),
           "i dag",
           "i morgen",
           " siden",
           "om ",
           "sekund",
           "sekunder",
           "minutt",
           "minutter",
           "time",
           "timer",
           "dag",
           "dager",
           "uke",
           "uker",
           B ("6DC3A56E6564"),
           B ("6DC3A56E65646572"),
           B ("C3A572"),
           B ("C3A572"),
           "byte",
           "byte",
           " k",
           " mill.",
           " mrd.",
           " bill.",
           "tusen",
           "million",
           "milliard",
           "billion",
           "meter",
           "meter",
           "kilometer",
           "kilometer",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "liter",
           "liter",
           "centimeter",
           "centimeter",
           "millimeter",
           "millimeter",
           "milligram",
           "milligram",
           "milliliter",
           "milliliter",
           "og")
        & Added_Core_Locale_Catalog
          ("no",
           "millisekund",
           "millisekunder",
           "mikrosekund",
           "mikrosekunder",
           "uke",
           "uker",
           B ("6DC3A56E6564"),
           B ("6DC3A56E65646572"),
           B ("C3A572"),
           B ("C3A572"),
           "aldri",
           "en gang",
           "to ganger",
           "gang",
           "ganger",
           "omtrent",
           "mindre enn",
           "per sekund",
           "per minutt",
           "per time",
           "per dag",
           "per uke",
           "annen",
           "andre")
        & Core_Locale_Catalog
          ("nb",
           B ("6EC3A5"),
           B ("692067C3A572"),
           "i dag",
           "i morgen",
           " siden",
           "om ",
           "sekund",
           "sekunder",
           "minutt",
           "minutter",
           "time",
           "timer",
           "dag",
           "dager",
           "uke",
           "uker",
           B ("6DC3A56E6564"),
           B ("6DC3A56E65646572"),
           B ("C3A572"),
           B ("C3A572"),
           "byte",
           "byte",
           " k",
           " mill.",
           " mrd.",
           " bill.",
           "tusen",
           "million",
           "milliard",
           "billion",
           "meter",
           "meter",
           "kilometer",
           "kilometer",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "liter",
           "liter",
           "centimeter",
           "centimeter",
           "millimeter",
           "millimeter",
           "milligram",
           "milligram",
           "milliliter",
           "milliliter",
           "og")
        & Added_Core_Locale_Catalog
          ("nb",
           "millisekund",
           "millisekunder",
           "mikrosekund",
           "mikrosekunder",
           "uke",
           "uker",
           B ("6DC3A56E6564"),
           B ("6DC3A56E65646572"),
           B ("C3A572"),
           B ("C3A572"),
           "aldri",
           "en gang",
           "to ganger",
           "gang",
           "ganger",
           "omtrent",
           "mindre enn",
           "per sekund",
           "per minutt",
           "per time",
           "per dag",
           "per uke",
           "annen",
           "andre")
        & Core_Locale_Catalog
          ("fi",
           "nyt",
           "eilen",
           B ("74C3A46EC3A4C3A46E"),
           "huomenna",
           " sitten",
           "",
           "sekunti",
           "sekuntia",
           "minuutti",
           "minuuttia",
           "tunti",
           "tuntia",
           B ("70C3A46976C3A4"),
           B ("70C3A46976C3A4C3A4"),
           "viikko",
           "viikkoa",
           "kuukausi",
           "kuukautta",
           "vuosi",
           "vuotta",
           "tavu",
           "tavua",
           " t",
           " milj.",
           " mrd.",
           " bilj.",
           "tuhatta",
           "miljoonaa",
           "miljardia",
           "biljoonaa",
           "metri",
           B ("6D65747269C3A4"),
           "kilometri",
           B ("6B696C6F6D65747269C3A4"),
           "gramma",
           "grammaa",
           "kilogramma",
           "kilogrammaa",
           "litra",
           "litraa",
           "senttimetri",
           B ("73656E7474696D65747269C3A4"),
           "millimetri",
           B ("6D696C6C696D65747269C3A4"),
           "milligramma",
           "milligrammaa",
           "millilitra",
           "millilitraa",
           "ja")
        & Added_Core_Locale_Catalog
          ("fi",
           "millisekunti",
           "millisekuntia",
           "mikrosekunti",
           "mikrosekuntia",
           "viikko",
           "viikkoa",
           "kuukausi",
           "kuukautta",
           "vuosi",
           "vuotta",
           "ei koskaan",
           "kerran",
           "kahdesti",
           "kerta",
           "kertaa",
           "noin",
           "alle",
           "sekunnissa",
           "minuutissa",
           "tunnissa",
           B ("70C3A46976C3A47373C3A4"),
           "viikossa",
           "muu",
           "muuta")
        & Core_Locale_Catalog
          ("pl",
           "teraz",
           "wczoraj",
           B ("647A69C59B"),
           "jutro",
           " temu",
           "za ",
           "sekunda",
           "sekundy",
           "minuta",
           "minuty",
           "godzina",
           "godziny",
           B ("647A6965C584"),
           "dni",
           B ("7479647A6965C584"),
           "tygodnie",
           B ("6D69657369C48563"),
           B ("6D69657369C4856365"),
           "rok",
           "lata",
           "bajt",
           "bajty",
           " tys.",
           " mln",
           " mld",
           " bln",
           B ("74797369C48563"),
           "milion",
           "miliard",
           "bilion",
           "metr",
           "metry",
           "kilometr",
           "kilometry",
           "gram",
           "gramy",
           "kilogram",
           "kilogramy",
           "litr",
           "litry",
           "centymetr",
           "centymetry",
           "milimetr",
           "milimetry",
           "miligram",
           "miligramy",
           "mililitr",
           "mililitry",
           "i")
        & Added_Core_Locale_Catalog
          ("pl",
           "milisekunda",
           "milisekundy",
           "mikrosekunda",
           "mikrosekundy",
           B ("7479647A6965C584"),
           "tygodnie",
           B ("6D69657369C48563"),
           B ("6D69657369C4856365"),
           "rok",
           "lata",
           "nigdy",
           "raz",
           "dwa razy",
           "raz",
           "razy",
           B ("6F6B6FC5826F"),
           B ("6D6E69656A206E69C5BC"),
           B ("6E612073656B756E64C499"),
           B ("6E61206D696E7574C499"),
           B ("6E6120676F647A696EC499"),
           B ("6E6120647A6965C584"),
           B ("6E61207479647A6965C584"),
           "inny",
           "inne")
        & Core_Locale_Catalog
          ("cs",
           B ("6E796EC3AD"),
           B ("76C48D657261"),
           "dnes",
           B ("7AC3AD747261"),
           B ("207A70C49B74"),
           "za ",
           "sekunda",
           "sekundy",
           "minuta",
           "minuty",
           "hodina",
           "hodiny",
           "den",
           "dny",
           B ("74C3BD64656E"),
           B ("74C3BD646E79"),
           B ("6DC49B73C3AD63"),
           B ("6DC49B73C3AD6365"),
           "rok",
           "roky",
           "bajt",
           "bajty",
           " tis.",
           " mil.",
           " mld.",
           " bil.",
           B ("746973C3AD63"),
           "milion",
           "miliarda",
           "bilion",
           "metr",
           "metry",
           "kilometr",
           "kilometry",
           "gram",
           "gramy",
           "kilogram",
           "kilogramy",
           "litr",
           "litry",
           "centimetr",
           "centimetry",
           "milimetr",
           "milimetry",
           "miligram",
           "miligramy",
           "mililitr",
           "mililitry",
           "a")
        & Added_Core_Locale_Catalog
          ("cs",
           "milisekunda",
           "milisekundy",
           "mikrosekunda",
           "mikrosekundy",
           B ("74C3BD64656E"),
           B ("74C3BD646E79"),
           B ("6DC49B73C3AD63"),
           B ("6DC49B73C3AD6365"),
           "rok",
           "roky",
           "nikdy",
           "jednou",
           B ("6476616B72C3A174"),
           B ("6B72C3A174"),
           B ("6B72C3A174"),
           B ("70C59969626C69C5BE6EC49B"),
           B ("6DC3A96EC49B206E65C5BE"),
           "za sekundu",
           "za minutu",
           "za hodinu",
           "za den",
           B ("7A612074C3BD64656E"),
           B ("6A696EC3BD"),
           B ("6A696EC3A9"))
        & Core_Locale_Catalog
          ("tr",
           B ("C59F696D6469"),
           B ("64C3BC6E"),
           B ("627567C3BC6E"),
           B ("796172C4B16E"),
           B ("20C3B66E6365"),
           "",
           "saniye",
           "saniye",
           "dakika",
           "dakika",
           "saat",
           "saat",
           B ("67C3BC6E"),
           B ("67C3BC6E"),
           "hafta",
           "hafta",
           "ay",
           "ay",
           B ("79C4B16C"),
           B ("79C4B16C"),
           "bayt",
           "bayt",
           " B",
           " Mn",
           " Mr",
           " Tn",
           "bin",
           "milyon",
           "milyar",
           "trilyon",
           "metre",
           "metre",
           "kilometre",
           "kilometre",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "litre",
           "litre",
           "santimetre",
           "santimetre",
           "milimetre",
           "milimetre",
           "miligram",
           "miligram",
           "mililitre",
           "mililitre",
           "ve")
        & Added_Core_Locale_Catalog
          ("tr",
           "milisaniye",
           "milisaniye",
           "mikrosaniye",
           "mikrosaniye",
           "hafta",
           "hafta",
           "ay",
           "ay",
           B ("79C4B16C"),
           B ("79C4B16C"),
           "asla",
           "bir kez",
           "iki kez",
           "kez",
           "kez",
           B ("79616B6C61C59FC4B16B"),
           "daha az",
           "saniyede",
           "dakikada",
           "saatte",
           B ("67C3BC6E6465"),
           "haftada",
           B ("6469C49F6572"),
           B ("6469C49F6572"))
        & Core_Locale_Catalog
          ("ro",
           "acum",
           "ieri",
           B ("617374C4837A69"),
           B ("6DC3A2696E65"),
           B ("20C3AE6E2075726DC483"),
           B ("C3AE6E20"),
           B ("736563756E64C483"),
           "secunde",
           "minut",
           "minute",
           B ("6F72C483"),
           "ore",
           "zi",
           "zile",
           B ("73C4837074C4836DC3A26EC483"),
           B ("73C4837074C4836DC3A26E69"),
           B ("6C756EC483"),
           "luni",
           "an",
           "ani",
           "octet",
           B ("6F637465C89B69"),
           " mii",
           " mil.",
           " mld.",
           " bln.",
           "mii",
           "milioane",
           "miliarde",
           "bilioane",
           "metru",
           "metri",
           "kilometru",
           "kilometri",
           "gram",
           "grame",
           "kilogram",
           "kilograme",
           "litru",
           "litri",
           "centimetru",
           "centimetri",
           "milimetru",
           "milimetri",
           "miligram",
           "miligrame",
           "mililitru",
           "mililitri",
           B ("C89969"))
        & Added_Core_Locale_Catalog
          ("ro",
           B ("6D696C69736563756E64C483"),
           "milisecunde",
           B ("6D6963726F736563756E64C483"),
           "microsecunde",
           B ("73C4837074C4836DC3A26EC483"),
           B ("73C4837074C4836DC3A26E69"),
           B ("6C756EC483"),
           "luni",
           "an",
           "ani",
           B ("6E6963696F646174C483"),
           B ("6F20646174C483"),
           B ("646520646F75C483206F7269"),
           B ("646174C483"),
           "ori",
           "aproximativ",
           B ("6D6169207075C89B696E20646563C3A274"),
           B ("706520736563756E64C483"),
           "pe minut",
           B ("7065206F72C483"),
           "pe zi",
           B ("70652073C4837074C4836DC3A26EC483"),
           "altul",
           B ("616CC89B6969"))
        & Core_Locale_Catalog
          ("lt",
           "dabar",
           "vakar",
           B ("C5A169616E6469656E"),
           "rytoj",
           B ("2070726965C5A1"),
           "po ",
           B ("73656B756E64C497"),
           B ("73656B756E64C49773"),
           B ("6D696E7574C497"),
           B ("6D696E7574C49773"),
           "valanda",
           "valandos",
           "diena",
           "dienos",
           B ("736176616974C497"),
           B ("736176616974C49773"),
           B ("6DC4976E756F"),
           B ("6DC4976E6573696169"),
           "metai",
           "metai",
           "baitas",
           "baitai",
           B ("20C5AB6B7374"),
           " mln.",
           " mlrd.",
           " trln.",
           B ("74C5AB6B7374616E746973"),
           "milijonas",
           "milijardas",
           "trilijonas",
           "metras",
           "metrai",
           "kilometras",
           "kilometrai",
           "gramas",
           "gramai",
           "kilogramas",
           "kilogramai",
           "litras",
           "litrai",
           "centimetras",
           "centimetrai",
           "milimetras",
           "milimetrai",
           "miligramas",
           "miligramai",
           "mililitras",
           "mililitrai",
           "ir")
        & Added_Core_Locale_Catalog
          ("lt",
           B ("6D696C6973656B756E64C497"),
           B ("6D696C6973656B756E64C49773"),
           B ("6D696B726F73656B756E64C497"),
           B ("6D696B726F73656B756E64C49773"),
           B ("736176616974C497"),
           B ("736176616974C49773"),
           B ("6DC4976E756F"),
           B ("6DC4976E6573696169"),
           "metai",
           "metai",
           "niekada",
           B ("7669656EC485206B617274C485"),
           "du kartus",
           "kartas",
           "kartai",
           "apie",
           B ("6D61C5BE696175206E6569"),
           B ("7065722073656B756E64C499"),
           B ("706572206D696E7574C499"),
           B ("7065722076616C616E64C485"),
           B ("706572206469656EC485"),
           B ("70657220736176616974C499"),
           "kitas",
           "kiti")
        & Core_Locale_Catalog
          ("sl",
           "zdaj",
           B ("76636572616A"),
           "danes",
           "jutri",
           " nazaj",
           B ("C48D657A20"),
           "sekunda",
           "sekunde",
           "minuta",
           "minute",
           "ura",
           "ure",
           "dan",
           "dni",
           "teden",
           "tedni",
           "mesec",
           "meseci",
           "leto",
           "leta",
           "bajt",
           "bajti",
           " tis.",
           " mio.",
           " mrd.",
           " bln.",
           B ("7469736FC48D"),
           "milijon",
           "milijarda",
           "bilijon",
           "meter",
           "metri",
           "kilometer",
           "kilometri",
           "gram",
           "grami",
           "kilogram",
           "kilogrami",
           "liter",
           "litri",
           "centimeter",
           "centimetri",
           "milimeter",
           "milimetri",
           "miligram",
           "miligrami",
           "mililiter",
           "mililitri",
           "in")
        & Added_Core_Locale_Catalog
          ("sl",
           "milisekunda",
           "milisekunde",
           "mikrosekunda",
           "mikrosekunde",
           "teden",
           "tedni",
           "mesec",
           "meseci",
           "leto",
           "leta",
           "nikoli",
           "enkrat",
           "dvakrat",
           "krat",
           "krat",
           "priblizno",
           "manj kot",
           "na sekundo",
           "na minuto",
           "na uro",
           "na dan",
           "na teden",
           "drug",
           "drugi")
        & Core_Locale_Catalog
          ("id",
           "sekarang",
           "kemarin",
           "hari ini",
           "besok",
           " yang lalu",
           "dalam ",
           "detik",
           "detik",
           "menit",
           "menit",
           "jam",
           "jam",
           "hari",
           "hari",
           "minggu",
           "minggu",
           "bulan",
           "bulan",
           "tahun",
           "tahun",
           "byte",
           "byte",
           " rb",
           " jt",
           " M",
           " T",
           "ribu",
           "juta",
           "miliar",
           "triliun",
           "meter",
           "meter",
           "kilometer",
           "kilometer",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "liter",
           "liter",
           "sentimeter",
           "sentimeter",
           "milimeter",
           "milimeter",
           "miligram",
           "miligram",
           "mililiter",
           "mililiter",
           "dan")
        & Added_Core_Locale_Catalog
          ("id",
           "milidetik",
           "milidetik",
           "mikrodetik",
           "mikrodetik",
           "minggu",
           "minggu",
           "bulan",
           "bulan",
           "tahun",
           "tahun",
           "tidak pernah",
           "sekali",
           "dua kali",
           "kali",
           "kali",
           "sekitar",
           "kurang dari",
           "per detik",
           "per menit",
           "per jam",
           "per hari",
           "per minggu",
           "lain",
           "lainnya")
        & Core_Locale_Catalog
          ("ms",
           "sekarang",
           "semalam",
           "hari ini",
           "esok",
           " yang lalu",
           "dalam ",
           "detik",
           "detik",
           "minit",
           "minit",
           "jam",
           "jam",
           "hari",
           "hari",
           "minggu",
           "minggu",
           "bulan",
           "bulan",
           "tahun",
           "tahun",
           "bait",
           "bait",
           " rb",
           " jt",
           " B",
           " T",
           "ribu",
           "juta",
           "bilion",
           "trilion",
           "meter",
           "meter",
           "kilometer",
           "kilometer",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "liter",
           "liter",
           "sentimeter",
           "sentimeter",
           "milimeter",
           "milimeter",
           "miligram",
           "miligram",
           "mililiter",
           "mililiter",
           "dan")
        & Added_Core_Locale_Catalog
          ("ms",
           "milidetik",
           "milidetik",
           "mikrodetik",
           "mikrodetik",
           "minggu",
           "minggu",
           "bulan",
           "bulan",
           "tahun",
           "tahun",
           "tidak pernah",
           "sekali",
           "dua kali",
           "kali",
           "kali",
           "kira-kira",
           "kurang daripada",
           "sesaat",
           "seminit",
           "sejam",
           "sehari",
           "seminggu",
           "lain",
           "lain-lain")
        & Core_Locale_Catalog
          ("eo",
           "nun",
           B ("68696572C485AD"),
           B ("686F646961C5AD"),
           B ("6D6F726761C5AD"),
           B ("20616E7461C5AD65"),
           "post ",
           "sekundo",
           "sekundoj",
           "minuto",
           "minutoj",
           "horo",
           "horoj",
           "tago",
           "tagoj",
           "semajno",
           "semajnoj",
           "monato",
           "monatoj",
           "jaro",
           "jaroj",
           "bajto",
           "bajtoj",
           " mil",
           " mln",
           " mld",
           " bln",
           "mil",
           "miliono",
           "miliardo",
           "biliono",
           "metro",
           "metroj",
           "kilometro",
           "kilometroj",
           "gramo",
           "gramoj",
           "kilogramo",
           "kilogramoj",
           "litro",
           "litroj",
           "centimetro",
           "centimetroj",
           "milimetro",
           "milimetroj",
           "miligramo",
           "miligramoj",
           "mililitro",
           "mililitroj",
           "kaj")
        & Added_Core_Locale_Catalog
          ("eo",
           "milisekundo",
           "milisekundoj",
           "mikrosekundo",
           "mikrosekundoj",
           "semajno",
           "semajnoj",
           "monato",
           "monatoj",
           "jaro",
           "jaroj",
           "neniam",
           "unufoje",
           "dufoje",
           "fojo",
           "fojoj",
           "proksimume",
           "malpli ol",
           "po sekundo",
           "po minuto",
           "po horo",
           "po tago",
           "po semajno",
           "alia",
           "aliaj")
        & Core_Locale_Catalog
          ("vi",
           "bay gio",
           "hom qua",
           "hom nay",
           "ngay mai",
           " truoc",
           "trong ",
           "giay",
           "giay",
           "phut",
           "phut",
           "gio",
           "gio",
           "ngay",
           "ngay",
           "tuan",
           "tuan",
           "thang",
           "thang",
           "nam",
           "nam",
           "byte",
           "byte",
           " nghin",
           " tr",
           " ty",
           " nghin ty",
           "nghin",
           "trieu",
           "ty",
           "nghin ty",
           "met",
           "met",
           "kilomet",
           "kilomet",
           "gam",
           "gam",
           "kilogam",
           "kilogam",
           "lit",
           "lit",
           "xentimet",
           "xentimet",
           "milimet",
           "milimet",
           "miligam",
           "miligam",
           "mililit",
           "mililit",
           "va")
        & Added_Core_Locale_Catalog
          ("vi",
           "mili giay",
           "mili giay",
           "micro giay",
           "micro giay",
           "tuan",
           "tuan",
           "thang",
           "thang",
           "nam",
           "nam",
           "khong bao gio",
           "mot lan",
           "hai lan",
           "lan",
           "lan",
           "khoang",
           "it hon",
           "moi giay",
           "moi phut",
           "moi gio",
           "moi ngay",
           "moi tuan",
           "khac",
           "khac")
        & Core_Locale_Catalog
          ("sw",
           "sasa",
           "jana",
           "leo",
           "kesho",
           " iliyopita",
           "baada ya ",
           "sekunde",
           "sekunde",
           "dakika",
           "dakika",
           "saa",
           "saa",
           "siku",
           "siku",
           "wiki",
           "wiki",
           "mwezi",
           "miezi",
           "mwaka",
           "miaka",
           "baiti",
           "baiti",
           " elfu",
           " mln",
           " bln",
           " tril",
           "elfu",
           "milioni",
           "bilioni",
           "trilioni",
           "mita",
           "mita",
           "kilomita",
           "kilomita",
           "gramu",
           "gramu",
           "kilogramu",
           "kilogramu",
           "lita",
           "lita",
           "sentimita",
           "sentimita",
           "milimita",
           "milimita",
           "miligramu",
           "miligramu",
           "mililita",
           "mililita",
           "na")
        & Added_Core_Locale_Catalog
          ("sw",
           "milisekunde",
           "milisekunde",
           "mikrosekunde",
           "mikrosekunde",
           "wiki",
           "wiki",
           "mwezi",
           "miezi",
           "mwaka",
           "miaka",
           "kamwe",
           "mara moja",
           "mara mbili",
           "mara",
           "mara",
           "takriban",
           "chini ya",
           "kwa sekunde",
           "kwa dakika",
           "kwa saa",
           "kwa siku",
           "kwa wiki",
           "nyingine",
           "nyingine")
        & Core_Locale_Catalog
          ("af",
           "nou",
           "gister",
           "vandag",
           "more",
           " gelede",
           "oor ",
           "sekonde",
           "sekondes",
           "minuut",
           "minute",
           "uur",
           "ure",
           "dag",
           "dae",
           "week",
           "weke",
           "maand",
           "maande",
           "jaar",
           "jaar",
           "greep",
           "grepe",
           " k",
           " mln",
           " mld",
           " bln",
           "duisend",
           "miljoen",
           "miljard",
           "biljoen",
           "meter",
           "meters",
           "kilometer",
           "kilometers",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "liter",
           "liter",
           "sentimeter",
           "sentimeters",
           "millimeter",
           "millimeters",
           "milligram",
           "milligram",
           "milliliter",
           "milliliter",
           "en")
        & Added_Core_Locale_Catalog
          ("af",
           "millisekonde",
           "millisekondes",
           "mikrosekonde",
           "mikrosekondes",
           "week",
           "weke",
           "maand",
           "maande",
           "jaar",
           "jaar",
           "nooit",
           "een keer",
           "twee keer",
           "keer",
           "keer",
           "ongeveer",
           "minder as",
           "per sekonde",
           "per minuut",
           "per uur",
           "per dag",
           "per week",
           "ander",
           "ander")
        & Core_Locale_Catalog
          ("hu",
           "most",
           "tegnap",
           "ma",
           "holnap",
           " ezelott",
           "ennyi ido mulva: ",
           "masodperc",
           "masodperc",
           "perc",
           "perc",
           "ora",
           "ora",
           "nap",
           "nap",
           "het",
           "het",
           "honap",
           "honap",
           "ev",
           "ev",
           "bajt",
           "bajt",
           " e",
           " M",
           " Mrd",
           " B",
           "ezer",
           "millio",
           "milliard",
           "billio",
           "meter",
           "meter",
           "kilometer",
           "kilometer",
           "gramm",
           "gramm",
           "kilogramm",
           "kilogramm",
           "liter",
           "liter",
           "centimeter",
           "centimeter",
           "millimeter",
           "millimeter",
           "milligramm",
           "milligramm",
           "milliliter",
           "milliliter",
           "es")
        & Added_Core_Locale_Catalog
          ("hu",
           "ezredmasodperc",
           "ezredmasodperc",
           "mikromasodperc",
           "mikromasodperc",
           "het",
           "het",
           "honap",
           "honap",
           "ev",
           "ev",
           "soha",
           "egyszer",
           "ketszer",
           "alkalom",
           "alkalom",
           "korulbelul",
           "kevesebb mint",
           "masodpercenkent",
           "percenkent",
           "orankent",
           "naponta",
           "hetente",
           "masik",
           "masik")
        & Core_Locale_Catalog
          ("sk",
           "teraz",
           "vcera",
           "dnes",
           "zajtra",
           " dozadu",
           "o ",
           "sekunda",
           "sekundy",
           "minuta",
           "minuty",
           "hodina",
           "hodiny",
           "den",
           "dni",
           "tyzden",
           "tyzdne",
           "mesiac",
           "mesiace",
           "rok",
           "roky",
           "bajt",
           "bajty",
           " tis.",
           " mil.",
           " mld.",
           " bil.",
           "tisic",
           "milion",
           "miliarda",
           "bilion",
           "meter",
           "metre",
           "kilometer",
           "kilometre",
           "gram",
           "gramy",
           "kilogram",
           "kilogramy",
           "liter",
           "litre",
           "centimeter",
           "centimetre",
           "milimeter",
           "milimetre",
           "miligram",
           "miligramy",
           "mililiter",
           "mililitre",
           "a")
        & Added_Core_Locale_Catalog
          ("sk",
           "milisekunda",
           "milisekundy",
           "mikrosekunda",
           "mikrosekundy",
           "tyzden",
           "tyzdne",
           "mesiac",
           "mesiace",
           "rok",
           "roky",
           "nikdy",
           "raz",
           "dvakrat",
           "raz",
           "krat",
           "priblizne",
           "menej ako",
           "za sekundu",
           "za minutu",
           "za hodinu",
           "za den",
           "za tyzden",
           "iny",
           "ine")
        & Core_Locale_Catalog
          ("ru",
           B ("D181D0B5D0B9D187D0B0D181"),
           B ("D0B2D187D0B5D180D0B0"),
           B ("D181D0B5D0B3D0BED0B4D0BDD18F"),
           B ("D0B7D0B0D0B2D182D180D0B0"),
           B ("20D0BDD0B0D0B7D0B0D0B4"),
           B ("D187D0B5D180D0B5D0B720"),
           B ("D181D0B5D0BAD183D0BDD0B4D0B0"),
           B ("D181D0B5D0BAD183D0BDD0B4D18B"),
           B ("D0BCD0B8D0BDD183D182D0B0"),
           B ("D0BCD0B8D0BDD183D182D18B"),
           B ("D187D0B0D181"),
           B ("D187D0B0D181D0B0"),
           B ("D0B4D0B5D0BDD18C"),
           B ("D0B4D0BDD18F"),
           B ("D0BDD0B5D0B4D0B5D0BBD18F"),
           B ("D0BDD0B5D0B4D0B5D0BBD0B8"),
           B ("D0BCD0B5D181D18FD186"),
           B ("D0BCD0B5D181D18FD186D0B0"),
           B ("D0B3D0BED0B4"),
           B ("D0B3D0BED0B4D0B0"),
           B ("D0B1D0B0D0B9D182"),
           B ("D0B1D0B0D0B9D182D0B0"),
           B ("20D182D18BD1812E"),
           B ("20D0BCD0BBD0BD"),
           B ("20D0BCD0BBD180D0B4"),
           B ("20D182D180D0BBD0BD"),
           B ("D182D18BD181D18FD187D0B0"),
           B ("D0BCD0B8D0BBD0BBD0B8D0BED0BD"),
           B ("D0BCD0B8D0BBD0BBD0B8D0B0D180D0B4"),
           B ("D182D180D0B8D0BBD0BBD0B8D0BED0BD"),
           B ("D0BCD0B5D182D180"),
           B ("D0BCD0B5D182D180D0B0"),
           B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180"),
           B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180D0B0"),
           B ("D0B3D180D0B0D0BCD0BC"),
           B ("D0B3D180D0B0D0BCD0BCD0B0"),
           B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BC"),
           B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BCD0B0"),
           B ("D0BBD0B8D182D180"),
           B ("D0BBD0B8D182D180D0B0"),
           B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180"),
           B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0B0"),
           B ("D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180"),
           B ("D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180D0B0"),
           B ("D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BC"),
           B ("D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BCD0B0"),
           B ("D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180"),
           B ("D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180D0B0"),
           B ("D0B8"))
        & Added_Core_Locale_Catalog
          ("ru",
           B ("D0BCD0B8D0BBD0BBD0B8D181D0B5D0BAD183D0BDD0B4D0B0"),
           B ("D0BCD0B8D0BBD0BBD0B8D181D0B5D0BAD183D0BDD0B4D18B"),
           B ("D0BCD0B8D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D0B0"),
           B ("D0BCD0B8D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D18B"),
           B ("D0BDD0B5D0B4D0B5D0BBD18F"),
           B ("D0BDD0B5D0B4D0B5D0BBD0B8"),
           B ("D0BCD0B5D181D18FD186"),
           B ("D0BCD0B5D181D18FD186D0B0"),
           B ("D0B3D0BED0B4"),
           B ("D0B3D0BED0B4D0B0"),
           B ("D0BDD0B8D0BAD0BED0B3D0B4D0B0"),
           B ("D0BED0B4D0B8D0BD20D180D0B0D0B7"),
           B ("D0B4D0B2D0B020D180D0B0D0B7D0B0"),
           B ("D180D0B0D0B7"),
           B ("D180D0B0D0B7D0B0"),
           B ("D0BFD180D0B8D0BCD0B5D180D0BDD0BE"),
           B ("D0BCD0B5D0BDD18CD188D0B520D187D0B5D0BC"),
           B ("D0B220D181D0B5D0BAD183D0BDD0B4D183"),
           B ("D0B220D0BCD0B8D0BDD183D182D183"),
           B ("D0B220D187D0B0D181"),
           B ("D0B220D0B4D0B5D0BDD18C"),
           B ("D0B220D0BDD0B5D0B4D0B5D0BBD18E"),
           B ("D0B4D180D183D0B3D0BED0B9"),
           B ("D0B4D180D183D0B3D0B8D0B5"))
        & Core_Locale_Catalog
          ("uk",
           B ("D0B7D0B0D180D0B0D0B7"),
           B ("D0B2D187D0BED180D0B0"),
           B ("D181D18CD0BED0B3D0BED0B4D0BDD196"),
           B ("D0B7D0B0D0B2D182D180D0B0"),
           B ("20D182D0BED0BCD183"),
           B ("D187D0B5D180D0B5D0B720"),
           B ("D181D0B5D0BAD183D0BDD0B4D0B0"),
           B ("D181D0B5D0BAD183D0BDD0B4D0B8"),
           B ("D185D0B2D0B8D0BBD0B8D0BDD0B0"),
           B ("D185D0B2D0B8D0BBD0B8D0BDD0B8"),
           B ("D0B3D0BED0B4D0B8D0BDD0B0"),
           B ("D0B3D0BED0B4D0B8D0BDD0B8"),
           B ("D0B4D0B5D0BDD18C"),
           B ("D0B4D0BDD196"),
           B ("D182D0B8D0B6D0B4D0B5D0BDD18C"),
           B ("D182D0B8D0B6D0BDD196"),
           B ("D0BCD196D181D18FD186D18C"),
           B ("D0BCD196D181D18FD186D196"),
           B ("D180D196D0BA"),
           B ("D180D0BED0BAD0B8"),
           B ("D0B1D0B0D0B9D182"),
           B ("D0B1D0B0D0B9D182D0B8"),
           B ("20D182D0B8D1812E"),
           B ("20D0BCD0BBD0BD"),
           B ("20D0BCD0BBD180D0B4"),
           B ("20D182D180D0BBD0BD"),
           B ("D182D0B8D181D18FD187D0B0"),
           B ("D0BCD196D0BBD18CD0B9D0BED0BD"),
           B ("D0BCD196D0BBD18CD18FD180D0B4"),
           B ("D182D180D0B8D0BBD18CD0B9D0BED0BD"),
           B ("D0BCD0B5D182D180"),
           B ("D0BCD0B5D182D180D0B8"),
           B ("D0BAD196D0BBD0BED0BCD0B5D182D180"),
           B ("D0BAD196D0BBD0BED0BCD0B5D182D180D0B8"),
           B ("D0B3D180D0B0D0BC"),
           B ("D0B3D180D0B0D0BCD0B8"),
           B ("D0BAD196D0BBD0BED0B3D180D0B0D0BC"),
           B ("D0BAD196D0BBD0BED0B3D180D0B0D0BCD0B8"),
           B ("D0BBD196D182D180"),
           B ("D0BBD196D182D180D0B8"),
           B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180"),
           B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0B8"),
           B ("D0BCD196D0BBD196D0BCD0B5D182D180"),
           B ("D0BCD196D0BBD196D0BCD0B5D182D180D0B8"),
           B ("D0BCD196D0BBD196D0B3D180D0B0D0BC"),
           B ("D0BCD196D0BBD196D0B3D180D0B0D0BCD0B8"),
           B ("D0BCD196D0BBD196D0BBD196D182D180"),
           B ("D0BCD196D0BBD196D0BBD196D182D180D0B8"),
           B ("D196"))
        & Added_Core_Locale_Catalog
          ("uk",
           B ("D0BCD196D0BBD196D181D0B5D0BAD183D0BDD0B4D0B0"),
           B ("D0BCD196D0BBD196D181D0B5D0BAD183D0BDD0B4D0B8"),
           B ("D0BCD196D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D0B0"),
           B ("D0BCD196D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D0B8"),
           B ("D182D0B8D0B6D0B4D0B5D0BDD18C"),
           B ("D182D0B8D0B6D0BDD196"),
           B ("D0BCD196D181D18FD186D18C"),
           B ("D0BCD196D181D18FD186D196"),
           B ("D180D196D0BA"),
           B ("D180D0BED0BAD0B8"),
           B ("D0BDD196D0BAD0BED0BBD0B8"),
           B ("D0BED0B4D0B8D0BD20D180D0B0D0B7"),
           B ("D0B4D0B2D0B020D180D0B0D0B7D0B8"),
           B ("D180D0B0D0B7"),
           B ("D180D0B0D0B7D0B8"),
           B ("D0BFD180D0B8D0B1D0BBD0B8D0B7D0BDD0BE"),
           B ("D0BCD0B5D0BDD188D0B520D0BDD196D0B6"),
           B ("D0B7D0B020D181D0B5D0BAD183D0BDD0B4D183"),
           B ("D0B7D0B020D185D0B2D0B8D0BBD0B8D0BDD183"),
           B ("D0B7D0B020D0B3D0BED0B4D0B8D0BDD183"),
           B ("D0B7D0B020D0B4D0B5D0BDD18C"),
           B ("D0B7D0B020D182D0B8D0B6D0B4D0B5D0BDD18C"),
           B ("D196D0BDD188D0B8D0B9"),
           B ("D196D0BDD188D196"))
        & Core_Locale_Catalog
          ("ja",
           B ("E4BB8A"),
           B ("E698A8E697A5"),
           B ("E4BB8AE697A5"),
           B ("E6988EE697A5"),
           B ("E5898D"),
           B ("E38182E381A820"),
           B ("E7A792"),
           B ("E7A792"),
           B ("E58886"),
           B ("E58886"),
           B ("E69982E99693"),
           B ("E69982E99693"),
           B ("E697A5"),
           B ("E697A5"),
           B ("E980B1"),
           B ("E980B1"),
           B ("E3818BE69C88"),
           B ("E3818BE69C88"),
           B ("E5B9B4"),
           B ("E5B9B4"),
           B ("E38390E382A4E38388"),
           B ("E38390E382A4E38388"),
           B ("20E58D83"),
           B ("20E4B887"),
           B ("20E58484"),
           B ("20E58586"),
           B ("E58D83"),
           B ("E799BEE4B887"),
           B ("E58D81E58484"),
           B ("E4B880E58586"),
           B ("E383A1E383BCE38388E383AB"),
           B ("E383A1E383BCE38388E383AB"),
           B ("E382ADE383ADE383A1E383BCE38388E383AB"),
           B ("E382ADE383ADE383A1E383BCE38388E383AB"),
           B ("E382B0E383A9E383A0"),
           B ("E382B0E383A9E383A0"),
           B ("E382ADE383ADE382B0E383A9E383A0"),
           B ("E382ADE383ADE382B0E383A9E383A0"),
           B ("E383AAE38383E38388E383AB"),
           B ("E383AAE38383E38388E383AB"),
           B ("E382BBE383B3E38381E383A1E383BCE38388E383AB"),
           B ("E382BBE383B3E38381E383A1E383BCE38388E383AB"),
           B ("E3839FE383AAE383A1E383BCE38388E383AB"),
           B ("E3839FE383AAE383A1E383BCE38388E383AB"),
           B ("E3839FE383AAE382B0E383A9E383A0"),
           B ("E3839FE383AAE382B0E383A9E383A0"),
           B ("E3839FE383AAE383AAE38383E38388E383AB"),
           B ("E3839FE383AAE383AAE38383E38388E383AB"),
           B ("E381A8"))
        & Added_Core_Locale_Catalog
          ("ja",
           B ("E3839FE383AAE7A792"),
           B ("E3839FE383AAE7A792"),
           B ("E3839EE382A4E382AFE383ADE7A792"),
           B ("E3839EE382A4E382AFE383ADE7A792"),
           B ("E980B1"),
           B ("E980B1"),
           B ("E3818BE69C88"),
           B ("E3818BE69C88"),
           B ("E5B9B4"),
           B ("E5B9B4"),
           B ("E381AAE38197"),
           B ("31E59B9E"),
           B ("32E59B9E"),
           B ("E59B9E"),
           B ("E59B9E"),
           B ("E7B484"),
           B ("E69CAAE6BA80"),
           B ("E6AF8EE7A792"),
           B ("E6AF8EE58886"),
           B ("E6AF8EE69982"),
           B ("E6AF8EE697A5"),
           B ("E6AF8EE980B1"),
           B ("E3819DE381AEE4BB96"),
           B ("E3819DE381AEE4BB96"))
        & Core_Locale_Catalog
          ("ko",
           B ("ECA780EAB888"),
           B ("EC96B4ECA09C"),
           B ("EC98A4EB8A98"),
           B ("EB82B4EC9DBC"),
           B ("20ECA084"),
           B ("ED9B8420"),
           B ("ECB488"),
           B ("ECB488"),
           B ("EBB684"),
           B ("EBB684"),
           B ("EC8B9CEAB084"),
           B ("EC8B9CEAB084"),
           B ("EC9DBC"),
           B ("EC9DBC"),
           B ("ECA3BC"),
           B ("ECA3BC"),
           B ("EAB09CEC9B94"),
           B ("EAB09CEC9B94"),
           B ("EB8584"),
           B ("EB8584"),
           B ("EBB094EC9DB4ED8AB8"),
           B ("EBB094EC9DB4ED8AB8"),
           B ("20ECB29C"),
           B ("20EBB0B1EBA78C"),
           B ("20EC8BADEC96B5"),
           B ("20ECA1B0"),
           B ("ECB29C"),
           B ("EBB0B1EBA78C"),
           B ("EC8BADEC96B5"),
           B ("ECA1B0"),
           B ("EBAFB8ED84B0"),
           B ("EBAFB8ED84B0"),
           B ("ED82ACEBA19CEBAFB8ED84B0"),
           B ("ED82ACEBA19CEBAFB8ED84B0"),
           B ("EAB7B8EB9EA8"),
           B ("EAB7B8EB9EA8"),
           B ("ED82ACEBA19CEAB7B8EB9EA8"),
           B ("ED82ACEBA19CEAB7B8EB9EA8"),
           B ("EBA6ACED84B0"),
           B ("EBA6ACED84B0"),
           B ("EC84BCED8BB0EBAFB8ED84B0"),
           B ("EC84BCED8BB0EBAFB8ED84B0"),
           B ("EBB080EBA6ACEBAFB8ED84B0"),
           B ("EBB080EBA6ACEBAFB8ED84B0"),
           B ("EBB080EBA6ACEAB7B8EB9EA8"),
           B ("EBB080EBA6ACEAB7B8EB9EA8"),
           B ("EBB080EBA6ACEBA6ACED84B0"),
           B ("EBB080EBA6ACEBA6ACED84B0"),
           B ("EBB08F"))
        & Added_Core_Locale_Catalog
          ("ko",
           B ("EBB080EBA6ACECB488"),
           B ("EBB080EBA6ACECB488"),
           B ("EBA788EC9DB4ED81ACEBA19CECB488"),
           B ("EBA788EC9DB4ED81ACEBA19CECB488"),
           B ("ECA3BC"),
           B ("ECA3BC"),
           B ("EAB09CEC9B94"),
           B ("EAB09CEC9B94"),
           B ("EB8584"),
           B ("EB8584"),
           B ("EC9786EC9D8C"),
           B ("ED959C20EBB288"),
           B ("EB919020EBB288"),
           B ("EBB288"),
           B ("EBB288"),
           B ("EC95BD"),
           B ("EBAFB8EBA78C"),
           B ("ECB488EBA788EB8BA4"),
           B ("EBB684EBA788EB8BA4"),
           B ("EC8B9CEAB084EBA788EB8BA4"),
           B ("EC9DBCEBA788EB8BA4"),
           B ("ECA3BCEBA788EB8BA4"),
           B ("EAB8B0ED8380"),
           B ("EAB8B0ED8380"))
        & Core_Locale_Catalog
          ("zh",
           B ("E78EB0E59CA8"),
           B ("E698A8E5A4A9"),
           B ("E4BB8AE5A4A9"),
           B ("E6988EE5A4A9"),
           B ("E5898D"),
           B ("E5868DE8BF8720"),
           B ("E7A792"),
           B ("E7A792"),
           B ("E58886E9929F"),
           B ("E58886E9929F"),
           B ("E5B08FE697B6"),
           B ("E5B08FE697B6"),
           B ("E5A4A9"),
           B ("E5A4A9"),
           B ("E591A8"),
           B ("E591A8"),
           B ("E69C88"),
           B ("E69C88"),
           B ("E5B9B4"),
           B ("E5B9B4"),
           B ("E5AD97E88A82"),
           B ("E5AD97E88A82"),
           B ("20E58D83"),
           B ("20E799BEE4B887"),
           B ("20E58D81E4BABF"),
           B ("20E4B887E4BABF"),
           B ("E58D83"),
           B ("E799BEE4B887"),
           B ("E58D81E4BABF"),
           B ("E4B887E4BABF"),
           B ("E7B1B3"),
           B ("E7B1B3"),
           B ("E58D83E7B1B3"),
           B ("E58D83E7B1B3"),
           B ("E5858B"),
           B ("E5858B"),
           B ("E58D83E5858B"),
           B ("E58D83E5858B"),
           B ("E58D87"),
           B ("E58D87"),
           B ("E58E98E7B1B3"),
           B ("E58E98E7B1B3"),
           B ("E6AFABE7B1B3"),
           B ("E6AFABE7B1B3"),
           B ("E6AFABE5858B"),
           B ("E6AFABE5858B"),
           B ("E6AFABE58D87"),
           B ("E6AFABE58D87"),
           B ("E5928C"))
        & Added_Core_Locale_Catalog
          ("zh",
           B ("E6AFABE7A792"),
           B ("E6AFABE7A792"),
           B ("E5BEAEE7A792"),
           B ("E5BEAEE7A792"),
           B ("E591A8"),
           B ("E591A8"),
           B ("E4B8AAE69C88"),
           B ("E4B8AAE69C88"),
           B ("E5B9B4"),
           B ("E5B9B4"),
           B ("E4BB8EE4B88D"),
           B ("E4B880E6ACA1"),
           B ("E4B8A4E6ACA1"),
           B ("E6ACA1"),
           B ("E6ACA1"),
           B ("E7BAA6"),
           B ("E5B091E4BA8E"),
           B ("E6AF8FE7A792"),
           B ("E6AF8FE58886E9929F"),
           B ("E6AF8FE5B08FE697B6"),
           B ("E6AF8FE5A4A9"),
           B ("E6AF8FE591A8"),
           B ("E585B6E4BB96"),
           B ("E585B6E4BB96"))
        & Core_Locale_Catalog
          ("ar",
           B ("D8A7D984D8A2D986"),
           B ("D8A3D985D8B3"),
           B ("D8A7D984D98AD988D985"),
           B ("D8BAD8AFD98BD8A7"),
           B ("20D985D986D8B0"),
           B ("D8AED984D8A7D98420"),
           B ("D8ABD8A7D986D98AD8A9"),
           B ("D8ABD988D8A7D986D98D"),
           B ("D8AFD982D98AD982D8A9"),
           B ("D8AFD982D8A7D8A6D982"),
           B ("D8B3D8A7D8B9D8A9"),
           B ("D8B3D8A7D8B9D8A7D8AA"),
           B ("D98AD988D985"),
           B ("D8A3D98AD8A7D985"),
           B ("D8A3D8B3D8A8D988D8B9"),
           B ("D8A3D8B3D8A7D8A8D98AD8B9"),
           B ("D8B4D987D8B1"),
           B ("D8A3D8B4D987D8B1"),
           B ("D8B3D986D8A9"),
           B ("D8B3D986D988D8A7D8AA"),
           B ("D8A8D8A7D98AD8AA"),
           B ("D8A8D8A7D98AD8AAD8A7D8AA"),
           B ("20D8A3D984D981"),
           B ("20D985D984D98AD988D986"),
           B ("20D985D984D98AD8A7D8B1"),
           B ("20D8AAD8B1D98AD984D98AD988D986"),
           B ("D8A3D984D981"),
           B ("D985D984D98AD988D986"),
           B ("D985D984D98AD8A7D8B1"),
           B ("D8AAD8B1D98AD984D98AD988D986"),
           B ("D985D8AAD8B1"),
           B ("D8A3D985D8AAD8A7D8B1"),
           B ("D983D98AD984D988D985D8AAD8B1"),
           B ("D983D98AD984D988D985D8AAD8B1D8A7D8AA"),
           B ("D8BAD8B1D8A7D985"),
           B ("D8BAD8B1D8A7D985D8A7D8AA"),
           B ("D983D98AD984D988D8BAD8B1D8A7D985"),
           B ("D983D98AD984D988D8BAD8B1D8A7D985D8A7D8AA"),
           B ("D984D8AAD8B1"),
           B ("D984D8AAD8B1D8A7D8AA"),
           B ("D8B3D986D8AAD98AD985D8AAD8B1"),
           B ("D8B3D986D8AAD98AD985D8AAD8B1D8A7D8AA"),
           B ("D985D984D98AD985D8AAD8B1"),
           B ("D985D984D98AD985D8AAD8B1D8A7D8AA"),
           B ("D985D984D98AD8BAD8B1D8A7D985"),
           B ("D985D984D98AD8BAD8B1D8A7D985D8A7D8AA"),
           B ("D985D984D98AD984D8AAD8B1"),
           B ("D985D984D98AD984D8AAD8B1D8A7D8AA"),
           B ("D988"))
        & Added_Core_Locale_Catalog
          ("ar",
           B ("D985D984D984D98A20D8ABD8A7D986D98AD8A9"),
           B ("D985D984D984D98A20D8ABD988D8A7D986D98D"),
           B ("D985D98AD983D8B1D988D8ABD8A7D986D98AD8A9"),
           B ("D985D98AD983D8B1D988D8ABD988D8A7D986D98D"),
           B ("D8A3D8B3D8A8D988D8B9"),
           B ("D8A3D8B3D8A7D8A8D98AD8B9"),
           B ("D8B4D987D8B1"),
           B ("D8A3D8B4D987D8B1"),
           B ("D8B3D986D8A9"),
           B ("D8B3D986D988D8A7D8AA"),
           B ("D8A3D8A8D8AFD98BD8A7"),
           B ("D985D8B1D8A920D988D8A7D8ADD8AFD8A9"),
           B ("D985D8B1D8AAD98AD986"),
           B ("D985D8B1D8A9"),
           B ("D985D8B1D8A7D8AA"),
           B ("D8AAD982D8B1D98AD8A8D98BD8A7"),
           B ("D8A3D982D98420D985D986"),
           B ("D981D98A20D8A7D984D8ABD8A7D986D98AD8A9"),
           B ("D981D98A20D8A7D984D8AFD982D98AD982D8A9"),
           B ("D981D98A20D8A7D984D8B3D8A7D8B9D8A9"),
           B ("D981D98A20D8A7D984D98AD988D985"),
           B ("D981D98A20D8A7D984D8A3D8B3D8A8D988D8B9"),
           B ("D8A2D8AED8B1"),
           B ("D8A3D8AED8B1D989"))
        & Core_Locale_Catalog
          ("hi",
           B ("E0A485E0A4ADE0A580"),
           B ("E0A495E0A4B2"),
           B ("E0A486E0A49C"),
           B ("E0A495E0A4B2"),
           B ("20E0A4AAE0A4B9E0A4B2E0A587"),
           "",
           B ("E0A4B8E0A587E0A495E0A482E0A4A1"),
           B ("E0A4B8E0A587E0A495E0A482E0A4A1"),
           B ("E0A4AEE0A4BFE0A4A8E0A49F"),
           B ("E0A4AEE0A4BFE0A4A8E0A49F"),
           B ("E0A498E0A482E0A49FE0A4BE"),
           B ("E0A498E0A482E0A49FE0A587"),
           B ("E0A4A6E0A4BFE0A4A8"),
           B ("E0A4A6E0A4BFE0A4A8"),
           B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9"),
           B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9"),
           B ("E0A4AEE0A4B9E0A580E0A4A8E0A4BE"),
           B ("E0A4AEE0A4B9E0A580E0A4A8E0A587"),
           B ("E0A4B8E0A4BEE0A4B2"),
           B ("E0A4B8E0A4BEE0A4B2"),
           B ("E0A4ACE0A4BEE0A487E0A49F"),
           B ("E0A4ACE0A4BEE0A487E0A49F"),
           B ("20E0A4B9E0A49CE0A4BCE0A4BEE0A4B0"),
           B ("20E0A4B2E0A4BEE0A496"),
           B ("20E0A495E0A4B0E0A58BE0A4A1E0A4BC"),
           B ("20E0A496E0A4B0E0A4AC"),
           B ("E0A4B9E0A49CE0A4BCE0A4BEE0A4B0"),
           B ("E0A4B2E0A4BEE0A496"),
           B ("E0A495E0A4B0E0A58BE0A4A1E0A4BC"),
           B ("E0A496E0A4B0E0A4AC"),
           B ("E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A497E0A58DE0A4B0E0A4BEE0A4AE"),
           B ("E0A497E0A58DE0A4B0E0A4BEE0A4AE"),
           B ("E0A495E0A4BFE0A4B2E0A58BE0A497E0A58DE0A4B0E0A4BEE0A4AE"),
           B ("E0A495E0A4BFE0A4B2E0A58BE0A497E0A58DE0A4B0E0A4BEE0A4AE"),
           B ("E0A4B2E0A580E0A49FE0A4B0"),
           B ("E0A4B2E0A580E0A49FE0A4B0"),
           B ("E0A4B8E0A587E0A482E0A49FE0A580E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A4B8E0A587E0A482E0A49FE0A580E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A497E0A58DE0A4B0E0A4BEE0A4AE"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A497E0A58DE0A4B0E0A4BEE0A4AE"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A4B2E0A580E0A49FE0A4B0"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A4B2E0A580E0A49FE0A4B0"),
           B ("E0A494E0A4B0"))
        & Added_Core_Locale_Catalog
          ("hi",
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A4B8E0A587E0A495E0A482E0A4A1"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A4B8E0A587E0A495E0A482E0A4A1"),
           B ("E0A4AEE0A4BEE0A487E0A495E0A58DE0A4B0E0A58BE0A4B8E0A587E0A495E0A4"
              & "82E0A4A1"),
           B ("E0A4AEE0A4BEE0A487E0A495E0A58DE0A4B0E0A58BE0A4B8E0A587E0A495E0A4"
              & "82E0A4A1"),
           B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9"),
           B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9"),
           B ("E0A4AEE0A4B9E0A580E0A4A8E0A4BE"),
           B ("E0A4AEE0A4B9E0A580E0A4A8E0A587"),
           B ("E0A4B8E0A4BEE0A4B2"),
           B ("E0A4B8E0A4BEE0A4B2"),
           B ("E0A495E0A4ADE0A58020E0A4A8E0A4B9E0A580E0A482"),
           B ("E0A48FE0A49520E0A4ACE0A4BEE0A4B0"),
           B ("E0A4A6E0A58B20E0A4ACE0A4BEE0A4B0"),
           B ("E0A4ACE0A4BEE0A4B0"),
           B ("E0A4ACE0A4BEE0A4B0"),
           B ("E0A4B2E0A497E0A4ADE0A497"),
           B ("E0A4B8E0A58720E0A495E0A4AE"),
           B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4B8E0A587E0A495E0A482E0A4A1"),
           B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4AEE0A4BFE0A4A8E0A49F"),
           B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A498E0A482E0A49FE0A4BE"),
           B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4A6E0A4BFE0A4A8"),
           B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9"),
           B ("E0A485E0A4A8E0A58DE0A4AF"),
           B ("E0A485E0A4A8E0A58DE0A4AF"));
   end New_Locale_Catalogs;

   function Default_Catalog return String is
   begin
      return
        Added_Keys ("en")
        & Native_Added_Keys
          ("da", "millisekund", "millisekunder",
           "mikrosekund", "mikrosekunder",
           "uge", "uger", "m" & AA & "ned", "m" & AA & "neder",
           AA & "r", AA & "r", "aldrig", "en gang", "to gange",
           "gang", "gange", "cirka", "mindre end", "per sekund",
           "per minut", "per time", "per dag", "per uge",
           "anden", "andre")
        & Native_Added_Keys
          ("de", "Millisekunde", "Millisekunden",
           "Mikrosekunde", "Mikrosekunden",
           "Woche", "Wochen", "Monat", "Monate",
           "Jahr", "Jahre", "nie", "einmal", "zweimal",
           "Mal", "Mal", "ungefaehr", "weniger als", "pro Sekunde",
           "pro Minute", "pro Stunde", "pro Tag", "pro Woche",
           "andere", "andere")
        & Native_Added_Keys
          ("fr", "milliseconde", "millisecondes",
           "microseconde", "microsecondes",
           "semaine", "semaines", "mois", "mois",
           "an", "ans", "jamais", "une fois", "deux fois",
           "fois", "fois", "environ", "moins de", "par seconde",
           "par minute", "par heure", "par jour", "par semaine",
           "autre", "autres")
        & Native_Added_Keys
          ("es", "milisegundo", "milisegundos",
           "microsegundo", "microsegundos",
           "semana", "semanas", "mes", "meses",
           "a" & NTILDE & "o", "a" & NTILDE & "os",
           "nunca", "una vez", "dos veces", "vez", "veces",
           "aproximadamente", "menos de", "por segundo", "por minuto",
           "por hora", "por d" & IACUTE & "a", "por semana",
           "otro", "otros")
        & Native_Added_Keys
          ("it", "millisecondo", "millisecondi",
           "microsecondo", "microsecondi",
           "settimana", "settimane", "mese", "mesi",
           "anno", "anni", "mai", "una volta", "due volte",
           "volta", "volte", "circa", "meno di", "al secondo",
           "al minuto", "all'ora", "al giorno", "alla settimana",
           "altro", "altri")
        & Native_Added_Keys
          ("pt", "milissegundo", "milissegundos",
           "microssegundo", "microssegundos",
           "semana", "semanas", "m" & ECIRC & "s", "meses",
           "ano", "anos", "nunca", "uma vez", "duas vezes",
           "vez", "vezes", "aproximadamente", "menos de",
           "por segundo", "por minuto", "por hora", "por dia",
           "por semana", "outro", "outros")
        & Dutch_Core_Catalog
        & Dutch_Added_Keys
        & New_Locale_Catalogs;
   end Default_Catalog;

end Humanize.Catalogs.Native_Data;
