package Humanize.Durations.Schedule_Data is

   function Is_Norwegian (Locale : String) return Boolean;

   function Weekday_Name
     (Locale  : String;
      Weekday : Natural)
      return String;

   function Ordinal_Name
     (Locale  : String;
      Ordinal : Integer)
      return String;

   function Time_Label
     (Hour        : Natural;
      Minute      : Natural;
      Use_12_Hour : Boolean)
      return String;

   function Every_Phrase
     (Locale : String;
      Label  : String)
      return String;

   function Schedule_Conjunction (Locale : String) return String;

   function Business_Day_Label (Locale : String) return String;

   function Schedule_Unit_Name
     (Locale : String;
      Unit   : Recurrence_Unit;
      Count  : Positive)
      return String;

end Humanize.Durations.Schedule_Data;
