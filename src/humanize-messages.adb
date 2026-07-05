package body Humanize.Messages is

   function Key
     (Id : Message_Id)
      return String
   is
   begin
      case Id is
         when No_Message =>
            return "";

         when Datetime_Now =>
            return "humanize.datetime.now";
         when Datetime_Day_Previous =>
            return "humanize.datetime.day.previous";
         when Datetime_Day_Current =>
            return "humanize.datetime.day.current";
         when Datetime_Day_Next =>
            return "humanize.datetime.day.next";

         when Datetime_Relative_Second_Past =>
            return "humanize.datetime.relative.second.past";
         when Datetime_Relative_Second_Future =>
            return "humanize.datetime.relative.second.future";
         when Datetime_Relative_Minute_Past =>
            return "humanize.datetime.relative.minute.past";
         when Datetime_Relative_Minute_Future =>
            return "humanize.datetime.relative.minute.future";
         when Datetime_Relative_Hour_Past =>
            return "humanize.datetime.relative.hour.past";
         when Datetime_Relative_Hour_Future =>
            return "humanize.datetime.relative.hour.future";
         when Datetime_Relative_Day_Past =>
            return "humanize.datetime.relative.day.past";
         when Datetime_Relative_Day_Future =>
            return "humanize.datetime.relative.day.future";
         when Datetime_Relative_Week_Past =>
            return "humanize.datetime.relative.week.past";
         when Datetime_Relative_Week_Future =>
            return "humanize.datetime.relative.week.future";
         when Datetime_Relative_Month_Past =>
            return "humanize.datetime.relative.month.past";
         when Datetime_Relative_Month_Future =>
            return "humanize.datetime.relative.month.future";
         when Datetime_Relative_Year_Past =>
            return "humanize.datetime.relative.year.past";
         when Datetime_Relative_Year_Future =>
            return "humanize.datetime.relative.year.future";

         when Duration_Unit_Second =>
            return "humanize.duration.unit.second";
         when Duration_Unit_Millisecond =>
            return "humanize.duration.unit.millisecond";
         when Duration_Unit_Microsecond =>
            return "humanize.duration.unit.microsecond";
         when Duration_Unit_Minute =>
            return "humanize.duration.unit.minute";
         when Duration_Unit_Hour =>
            return "humanize.duration.unit.hour";
         when Duration_Unit_Day =>
            return "humanize.duration.unit.day";
         when Duration_Unit_Week =>
            return "humanize.duration.unit.week";
         when Duration_Unit_Month =>
            return "humanize.duration.unit.month";
         when Duration_Unit_Year =>
            return "humanize.duration.unit.year";

         when Bytes_Byte =>
            return "humanize.bytes.byte";
         when Bytes_KB =>
            return "humanize.bytes.kb";
         when Bytes_MB =>
            return "humanize.bytes.mb";
         when Bytes_GB =>
            return "humanize.bytes.gb";
         when Bytes_TB =>
            return "humanize.bytes.tb";
         when Bytes_KiB =>
            return "humanize.bytes.kib";
         when Bytes_MiB =>
            return "humanize.bytes.mib";
         when Bytes_GiB =>
            return "humanize.bytes.gib";
         when Bytes_TiB =>
            return "humanize.bytes.tib";

         when Number_Ordinal =>
            return "humanize.number.ordinal";
         when Number_Ordinal_Feminine =>
            return "humanize.number.ordinal.feminine";
         when Number_Compact_Plain =>
            return "humanize.number.compact.plain";
         when Number_Compact_Thousand =>
            return "humanize.number.compact.thousand";
         when Number_Compact_Million =>
            return "humanize.number.compact.million";
         when Number_Compact_Billion =>
            return "humanize.number.compact.billion";
         when Number_Compact_Trillion =>
            return "humanize.number.compact.trillion";

         when Number_Compact_Long_Thousand =>
            return "humanize.number.compact.long.thousand";
         when Number_Compact_Long_Million =>
            return "humanize.number.compact.long.million";
         when Number_Compact_Long_Billion =>
            return "humanize.number.compact.long.billion";
         when Number_Compact_Long_Trillion =>
            return "humanize.number.compact.long.trillion";

         when Number_Percent =>
            return "humanize.number.percent";
         when Number_Bounded =>
            return "humanize.number.bounded";

         when Unit_Meter =>
            return "humanize.unit.meter";
         when Unit_Kilometer =>
            return "humanize.unit.kilometer";
         when Unit_Centimeter =>
            return "humanize.unit.centimeter";
         when Unit_Millimeter =>
            return "humanize.unit.millimeter";
         when Unit_Gram =>
            return "humanize.unit.gram";
         when Unit_Kilogram =>
            return "humanize.unit.kilogram";
         when Unit_Milligram =>
            return "humanize.unit.milligram";
         when Unit_Liter =>
            return "humanize.unit.liter";
         when Unit_Milliliter =>
            return "humanize.unit.milliliter";
         when Unit_Celsius =>
            return "humanize.unit.celsius";
         when Unit_Fahrenheit =>
            return "humanize.unit.fahrenheit";
         when Unit_Square_Meter =>
            return "humanize.unit.square_meter";
         when Unit_Hectare =>
            return "humanize.unit.hectare";
         when Unit_Kilometer_Per_Hour =>
            return "humanize.unit.kilometer_per_hour";
         when Unit_Meter_Per_Second =>
            return "humanize.unit.meter_per_second";
         when Unit_Pascal =>
            return "humanize.unit.pascal";
         when Unit_Kilopascal =>
            return "humanize.unit.kilopascal";
         when Unit_Joule =>
            return "humanize.unit.joule";
         when Unit_Kilojoule =>
            return "humanize.unit.kilojoule";
         when Unit_Watt =>
            return "humanize.unit.watt";
         when Unit_Kilowatt =>
            return "humanize.unit.kilowatt";
         when Unit_Hertz =>
            return "humanize.unit.hertz";
         when Unit_Kilohertz =>
            return "humanize.unit.kilohertz";
         when Unit_Degree =>
            return "humanize.unit.degree";
         when Unit_Mile =>
            return "humanize.unit.mile";
         when Unit_Yard =>
            return "humanize.unit.yard";
         when Unit_Foot =>
            return "humanize.unit.foot";
         when Unit_Inch =>
            return "humanize.unit.inch";
         when Unit_Nautical_Mile =>
            return "humanize.unit.nautical_mile";
         when Unit_Acre =>
            return "humanize.unit.acre";
         when Unit_Square_Kilometer =>
            return "humanize.unit.square_kilometer";
         when Unit_Cubic_Meter =>
            return "humanize.unit.cubic_meter";
         when Unit_Teaspoon =>
            return "humanize.unit.teaspoon";
         when Unit_Tablespoon =>
            return "humanize.unit.tablespoon";
         when Unit_Cup =>
            return "humanize.unit.cup";
         when Unit_Gallon =>
            return "humanize.unit.gallon";
         when Unit_Pound =>
            return "humanize.unit.pound";
         when Unit_Ounce =>
            return "humanize.unit.ounce";
         when Unit_Stone =>
            return "humanize.unit.stone";
         when Unit_Tonne =>
            return "humanize.unit.tonne";
         when Unit_Ton =>
            return "humanize.unit.ton";

         when List_And =>
            return "humanize.list.and";
         when List_Other =>
            return "humanize.list.other";
         when List_Others =>
            return "humanize.list.others";

         when Frequency_Never =>
            return "humanize.frequency.never";
         when Frequency_Once =>
            return "humanize.frequency.once";
         when Frequency_Twice =>
            return "humanize.frequency.twice";
         when Frequency_Times =>
            return "humanize.frequency.times";

         when Rate_Per_Second =>
            return "humanize.rate.per.second";
         when Rate_Per_Minute =>
            return "humanize.rate.per.minute";
         when Rate_Per_Hour =>
            return "humanize.rate.per.hour";
         when Rate_Per_Day =>
            return "humanize.rate.per.day";
         when Rate_Per_Week =>
            return "humanize.rate.per.week";
         when Rate_Less_Than_Per_Second =>
            return "humanize.rate.less_than.per.second";
         when Rate_Less_Than_Per_Minute =>
            return "humanize.rate.less_than.per.minute";
         when Rate_Less_Than_Per_Hour =>
            return "humanize.rate.less_than.per.hour";
         when Rate_Less_Than_Per_Day =>
            return "humanize.rate.less_than.per.day";
         when Rate_Less_Than_Per_Week =>
            return "humanize.rate.less_than.per.week";
      end case;
   end Key;

end Humanize.Messages;
