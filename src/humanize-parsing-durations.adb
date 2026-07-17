with Humanize.Parsing.Implementation.Durations;

package body Humanize.Parsing.Durations is
   package Impl renames Humanize.Parsing.Implementation.Durations;

   function Parse_Duration
     (Text : String)
      return Duration_Parse_Result renames Impl.Parse_Duration;

   function Scan_Duration
     (Text : String)
      return Duration_Parse_Result renames Impl.Scan_Duration;

   function Parse_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result renames Impl.Parse_Lenient_Duration;

   function Scan_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result renames Impl.Scan_Lenient_Duration;

   function Parse_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result renames Impl.Parse_Duration_Range;

   function Scan_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result renames Impl.Scan_Duration_Range;

   function Parse_Countdown
     (Text : String)
      return Duration_Parse_Result renames Impl.Parse_Countdown;

   function Parse_SLA_Window
     (Text : String)
      return Duration_Parse_Result renames Impl.Parse_SLA_Window;

   function Parse_Age
     (Text : String)
      return Duration_Parse_Result renames Impl.Parse_Age;

   function Parse_Modified_Ago
     (Text : String)
      return Duration_Parse_Result renames Impl.Parse_Modified_Ago;

   function Parse_Progress
     (Text : String)
      return Proportion_Parse_Result renames Impl.Parse_Progress;

   function Parse_Result_Count
     (Text : String)
      return List_Parse_Result renames Impl.Parse_Result_Count;

   function Parse_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result renames Impl.Parse_Counted_Noun;

   function Scan_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result renames Impl.Scan_Counted_Noun;

   function Parse_Showing_Count
     (Text : String)
      return Proportion_Parse_Result renames Impl.Parse_Showing_Count;

   function Parse_Page_Count
     (Text : String)
      return Proportion_Parse_Result renames Impl.Parse_Page_Count;

   function Parse_ETA
     (Text : String)
      return Duration_Parse_Result renames Impl.Parse_ETA;

   function Scan_ETA
     (Text : String)
      return Duration_Parse_Result renames Impl.Scan_ETA;

   function Parse_Retry_In
     (Text : String)
      return Duration_Parse_Result renames Impl.Parse_Retry_In;

   function Scan_Retry_In
     (Text : String)
      return Duration_Parse_Result renames Impl.Scan_Retry_In;

   function Parse_Step_Count
     (Text : String)
      return Proportion_Parse_Result renames Impl.Parse_Step_Count;

   function Scan_Step_Count
     (Text : String)
      return Proportion_Parse_Result renames Impl.Scan_Step_Count;

   function Parse_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result renames Impl.Parse_Attempt_Count;

   function Scan_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result renames Impl.Scan_Attempt_Count;

   function Parse_Business_Days
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Business_Days;

   function Scan_Business_Days
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Business_Days;

   function Parse_Working_Hours
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Working_Hours;

   function Scan_Working_Hours
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Working_Hours;

   function Parse_Recurrence
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Recurrence;

   function Parse_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result renames Impl.Parse_Recurrence_Detail;

   function Parse_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result renames Impl.Parse_Cron_Schedule;

   function Scan_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result renames Impl.Scan_Cron_Schedule;

   function Scan_Recurrence
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Recurrence;

   function Scan_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result renames Impl.Scan_Recurrence_Detail;

   function Parse_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result renames Impl.Parse_Throughput_Remaining;

   function Scan_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result renames Impl.Scan_Throughput_Remaining;

   function Parse_Progress_Bar
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Progress_Bar;

   function Scan_Progress_Bar
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Progress_Bar;

   function Parse_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result renames Impl.Parse_Precise_Duration;

   function Scan_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result renames Impl.Scan_Precise_Duration;
end Humanize.Parsing.Durations;
