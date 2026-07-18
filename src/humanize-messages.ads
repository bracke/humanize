--  Stable semantic message identifiers and catalog keys shared by public
--  humanizers and the internal I18N rendering bridge.
package Humanize.Messages is
   pragma Preelaborate;

   --  Stable semantic message identifiers used by Humanize classifiers.
   --
   --  The enum gives internal type safety. Key returns the stable public
   --  catalog key string rendered through I18N.
   type Message_Id is
     (No_Message,

      Datetime_Now,
      Datetime_Day_Previous,
      Datetime_Day_Current,
      Datetime_Day_Next,

      Datetime_Relative_Second_Past,
      Datetime_Relative_Second_Future,
      Datetime_Relative_Minute_Past,
      Datetime_Relative_Minute_Future,
      Datetime_Relative_Hour_Past,
      Datetime_Relative_Hour_Future,
      Datetime_Relative_Day_Past,
      Datetime_Relative_Day_Future,
      Datetime_Relative_Week_Past,
      Datetime_Relative_Week_Future,
      Datetime_Relative_Month_Past,
      Datetime_Relative_Month_Future,
      Datetime_Relative_Year_Past,
      Datetime_Relative_Year_Future,

      Duration_Unit_Second,
      Duration_Unit_Millisecond,
      Duration_Unit_Microsecond,
      Duration_Unit_Minute,
      Duration_Unit_Hour,
      Duration_Unit_Day,
      Duration_Unit_Week,
      Duration_Unit_Month,
      Duration_Unit_Year,

      Bytes_Byte,
      Bytes_KB,
      Bytes_MB,
      Bytes_GB,
      Bytes_TB,
      Bytes_KiB,
      Bytes_MiB,
      Bytes_GiB,
      Bytes_TiB,

      Number_Ordinal,
      Number_Ordinal_Feminine,
      Number_Compact_Plain,
      Number_Compact_Thousand,
      Number_Compact_Million,
      Number_Compact_Billion,
      Number_Compact_Trillion,

      Number_Compact_Long_Thousand,
      Number_Compact_Long_Million,
      Number_Compact_Long_Billion,
      Number_Compact_Long_Trillion,

      Number_Percent,
      Number_Bounded,

      Unit_Meter,
      Unit_Kilometer,
      Unit_Centimeter,
      Unit_Millimeter,
      Unit_Gram,
      Unit_Kilogram,
      Unit_Milligram,
      Unit_Liter,
      Unit_Milliliter,
      Unit_Celsius,
      Unit_Fahrenheit,
      Unit_Square_Meter,
      Unit_Hectare,
      Unit_Kilometer_Per_Hour,
      Unit_Meter_Per_Second,
      Unit_Pascal,
      Unit_Kilopascal,
      Unit_Joule,
      Unit_Kilojoule,
      Unit_Watt,
      Unit_Kilowatt,
      Unit_Hertz,
      Unit_Kilohertz,
      Unit_Degree,
      Unit_Mile,
      Unit_Yard,
      Unit_Foot,
      Unit_Inch,
      Unit_Nautical_Mile,
      Unit_Acre,
      Unit_Square_Kilometer,
      Unit_Cubic_Meter,
      Unit_Teaspoon,
      Unit_Tablespoon,
      Unit_Cup,
      Unit_Gallon,
      Unit_Pound,
      Unit_Ounce,
      Unit_Stone,
      Unit_Tonne,
      Unit_Ton,

      List_And,
      List_Other,
      List_Others,

      Frequency_Never,
      Frequency_Once,
      Frequency_Twice,
      Frequency_Times,

      Rate_Per_Second,
      Rate_Per_Minute,
      Rate_Per_Hour,
      Rate_Per_Day,
      Rate_Per_Week,
      Rate_Less_Than_Per_Second,
      Rate_Less_Than_Per_Minute,
      Rate_Less_Than_Per_Hour,
      Rate_Less_Than_Per_Day,
      Rate_Less_Than_Per_Week);

   --  Return the stable catalog key for Id.
   --
   --  No_Message returns the empty string. Every other Message_Id maps to
   --  exactly one non-empty "humanize.*" key.
   function Key
     (Id : Message_Id)
      return String;
   --  @param Id Semantic message identifier.
   --  @return Stable catalog key for Id, or the empty string for No_Message.

end Humanize.Messages;
