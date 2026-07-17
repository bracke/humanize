private package Humanize.Parsing.Implementation.Scalar_Text_Helpers is
   function Parse_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result;
   function Scan_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result;
   function Parse_Frequency
     (Text : String)
      return Frequency_Parse_Result;
   function Scan_Frequency
     (Text : String)
      return Frequency_Parse_Result;
   function Parse_Rate
     (Text : String)
      return Rate_Parse_Result;
   function Scan_Rate
     (Text : String)
      return Rate_Parse_Result;
   function Parse_List
     (Text : String)
      return List_Parse_Result;
   function Scan_List
     (Text : String)
      return List_Parse_Result;
   function Parse_Percent
     (Text : String)
      return Number_Parse_Result;
   function Scan_Percent
     (Text : String)
      return Number_Parse_Result;
   function Parse_Ordinal
     (Text : String)
      return Number_Parse_Result;
   function Scan_Ordinal
     (Text : String)
      return Number_Parse_Result;
   function Parse_Roman
     (Text : String)
      return Number_Parse_Result;
   function Scan_Roman
     (Text : String)
      return Number_Parse_Result;
   function Parse_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result;
   function Scan_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result;
end Humanize.Parsing.Implementation.Scalar_Text_Helpers;
