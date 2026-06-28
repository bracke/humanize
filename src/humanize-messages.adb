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
         when Duration_Unit_Minute =>
            return "humanize.duration.unit.minute";
         when Duration_Unit_Hour =>
            return "humanize.duration.unit.hour";
         when Duration_Unit_Day =>
            return "humanize.duration.unit.day";

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
      end case;
   end Key;

end Humanize.Messages;
