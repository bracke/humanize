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

   function Nordic_Slavic_Locale_Catalogs return String is separate;

   function Additional_Latin_Locale_Catalogs return String is separate;

   function Native_Script_Locale_Catalogs return String is separate;

   function New_Locale_Catalogs return String is
   begin
      return
        Nordic_Slavic_Locale_Catalogs
        & Additional_Latin_Locale_Catalogs
        & Native_Script_Locale_Catalogs;
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
