with Humanize.Parsing.Implementation.Date_Time_Text_Helpers;
with Humanize.Parsing.Implementation.Scheduling_Text_Helpers;

package body Humanize.Parsing.Implementation.Date_Times is
   package Dates renames Humanize.Parsing.Implementation.Date_Time_Text_Helpers;
   package Scheduling renames Humanize.Parsing.Implementation.Scheduling_Text_Helpers;

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result renames Dates.Parse_Natural_Date;

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result renames Dates.Parse_Natural_Date;

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result renames Dates.Scan_Natural_Date;

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result renames Dates.Scan_Natural_Date;

   function Parse_Natural_Date_Time
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Natural_Date_Time_Parse_Result renames Dates.Parse_Natural_Date_Time;

   function Scan_Natural_Date_Time
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Natural_Date_Time_Parse_Result renames Dates.Scan_Natural_Date_Time;

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result renames Dates.Parse_Natural_Date_Range;

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result renames Dates.Parse_Natural_Date_Range;

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result renames Dates.Scan_Natural_Date_Range;

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result renames Dates.Scan_Natural_Date_Range;

   function Parse_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result renames Dates.Parse_Business_Calendar;

   function Scan_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result renames Dates.Scan_Business_Calendar;

   function Apply_Business_Calendar_Rule
     (Rules : in out Humanize.Durations.Business_Calendar_Rules;
      Rule  : Business_Calendar_Parse_Result)
      return Humanize.Status.Status_Code renames Dates.Apply_Business_Calendar_Rule;

   function Parse_Business_Calendar_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Rules_Parse_Result renames Dates.Parse_Business_Calendar_Rules;

   function Parse_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result renames Dates.Parse_Date_Comparison;

   function Scan_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result renames Dates.Scan_Date_Comparison;

   function Classify_Scheduling_Phrase
     (Text : String)
      return Scheduling_Phrase_Result renames Scheduling.Classify_Scheduling_Phrase;
end Humanize.Parsing.Implementation.Date_Times;
