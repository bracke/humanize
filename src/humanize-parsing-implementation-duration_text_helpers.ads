private package Humanize.Parsing.Implementation.Duration_Text_Helpers is
   function Unit_Seconds (Unit : String) return Long_Long_Integer;
   function Unit_Microseconds (Unit : String) return Long_Long_Integer;
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
   function Parse_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result;
   function Scan_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result;
end Humanize.Parsing.Implementation.Duration_Text_Helpers;
