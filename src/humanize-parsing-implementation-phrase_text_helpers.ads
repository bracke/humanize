private package Humanize.Parsing.Implementation.Phrase_Text_Helpers is
   function Parse_Phrase_Severity_Label
     (Text : String)
      return Humanize.Parsing.Phrase_Severity_Parse_Result;
   function Parse_Phrase_Tone_Label
     (Text : String)
      return Humanize.Parsing.Phrase_Tone_Parse_Result;
   function Parse_Phrase_Domain_Label
     (Text : String)
      return Humanize.Parsing.Phrase_Domain_Parse_Result;
   function Parse_Phrase_State_Label
     (Text : String)
      return Humanize.Parsing.Phrase_State_Parse_Result;
   function Contains_Word
     (Text : String;
      Word : String)
      return Boolean;
   function Parse_Phrase_Pack_Summary
     (Text : String)
      return Humanize.Parsing.Phrase_Pack_Summary_Parse_Result;
end Humanize.Parsing.Implementation.Phrase_Text_Helpers;
