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
      Duration_Unit_Minute,
      Duration_Unit_Hour,
      Duration_Unit_Day,

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
      Number_Compact_Plain,
      Number_Compact_Thousand,
      Number_Compact_Million,
      Number_Compact_Billion,
      Number_Compact_Trillion,

      List_And);

   --  Return the stable catalog key for Id.
   --
   --  No_Message returns the empty string. Every other Message_Id maps to
   --  exactly one non-empty "humanize.*" key.
   function Key
     (Id : Message_Id)
      return String;

end Humanize.Messages;
