private package Humanize.Parsing.Implementation.Count_Text_Helpers is
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
   function Parse_Progress_Bar
     (Text : String)
      return Number_Parse_Result;
   function Scan_Progress_Bar
     (Text : String)
      return Number_Parse_Result;
end Humanize.Parsing.Implementation.Count_Text_Helpers;
