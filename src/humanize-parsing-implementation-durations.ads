with Ada.Calendar;

with Humanize.Bytes;
with Humanize.Colors;
with Humanize.Durations;
with Humanize.Frequencies;
with Humanize.Numbers;
with Humanize.Phrases;
with Humanize.Rates;
with Humanize.Status;
with Humanize.Strings;
with Humanize.Units;
with Humanize.Values;

package Humanize.Parsing.Implementation.Durations is

   function Parse_Duration
     (Text : String)
      return Duration_Parse_Result;

   function Scan_Duration
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result;

   function Scan_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result;

   function Scan_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result;

   function Parse_Countdown
     (Text : String)
      return Duration_Parse_Result;

   function Parse_SLA_Window
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Age
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Modified_Ago
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Progress
     (Text : String)
      return Proportion_Parse_Result;

   function Parse_Result_Count
     (Text : String)
      return List_Parse_Result;

   function Parse_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result;

   function Scan_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result;

   function Parse_Showing_Count
     (Text : String)
      return Proportion_Parse_Result;

   function Parse_Page_Count
     (Text : String)
      return Proportion_Parse_Result;

   function Parse_ETA
     (Text : String)
      return Duration_Parse_Result;

   function Scan_ETA
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Retry_In
     (Text : String)
      return Duration_Parse_Result;

   function Scan_Retry_In
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Step_Count
     (Text : String)
      return Proportion_Parse_Result;

   function Scan_Step_Count
     (Text : String)
      return Proportion_Parse_Result;

   function Parse_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result;

   function Scan_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result;

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

   function Parse_Recurrence
     (Text : String)
      return Number_Parse_Result;

   function Parse_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result;

   function Parse_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result;

   function Scan_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result;

   function Scan_Recurrence
     (Text : String)
      return Number_Parse_Result;

   function Scan_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result;

   function Parse_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result;

   function Scan_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result;

   function Parse_Progress_Bar
     (Text : String)
      return Number_Parse_Result;

   function Scan_Progress_Bar
     (Text : String)
      return Number_Parse_Result;

   function Parse_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result;

   function Scan_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result;
end Humanize.Parsing.Implementation.Durations;
