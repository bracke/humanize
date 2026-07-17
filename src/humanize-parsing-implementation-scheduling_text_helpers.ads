with Ada.Calendar;

private package Humanize.Parsing.Implementation.Scheduling_Text_Helpers is
   function Parse_Recurrence
     (Text : String)
      return Number_Parse_Result;
   function Scan_Recurrence
     (Text : String)
      return Number_Parse_Result;
   function Parse_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result;
   function Scan_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result;
   function Parse_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result;
   function Scan_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result;
   function Parse_Business_Days
     (Text : String)
      return Number_Parse_Result;
   function Scan_Business_Days
     (Text : String)
      return Number_Parse_Result;
   function Parse_Working_Hours
     (Text : String)
      return Number_Parse_Result;
   function Scan_Working_Hours
     (Text : String)
      return Number_Parse_Result;
   function Parse_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result;
   function Scan_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result;
   function Classify_Scheduling_Phrase
     (Text : String)
      return Scheduling_Phrase_Result;
end Humanize.Parsing.Implementation.Scheduling_Text_Helpers;
