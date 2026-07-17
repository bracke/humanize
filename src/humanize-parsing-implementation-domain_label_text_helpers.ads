private package Humanize.Parsing.Implementation.Domain_Label_Text_Helpers is

   function Parse_Domain_Summary
     (Text : String)
      return Domain_Summary_Parse_Result;

   function Parse_Phrase_Severity_Label
     (Text : String)
      return Phrase_Severity_Parse_Result;

   function Parse_Phrase_Tone_Label
     (Text : String)
      return Phrase_Tone_Parse_Result;

   function Parse_Phrase_Domain_Label
     (Text : String)
      return Phrase_Domain_Parse_Result;

   function Parse_Phrase_State_Label
     (Text : String)
      return Phrase_State_Parse_Result;

   function Parse_Phrase_Key
     (Text : String)
      return Phrase_Key_Parse_Result;

   function Parse_Phrase_Pack_Summary
     (Text : String)
      return Phrase_Pack_Summary_Parse_Result;

   function Parse_Supported_Phrase_Locales
     (Text : String)
      return Phrase_Locales_Parse_Result;

   function Parse_Operational_Phrase
     (Text : String)
      return Operational_Phrase_Parse_Result;

   function Parse_Field_Change_Summary
     (Text : String)
      return Field_Change_Summary_Parse_Result;

   function Parse_Field_State_Summary
     (Text : String)
      return Field_State_Summary_Parse_Result;

   function Parse_Sync_Summary
     (Text : String)
      return Domain_Summary_Parse_Result;

   function Parse_Import_Summary
     (Text : String)
      return Domain_Summary_Parse_Result;

   function Parse_Export_Summary
     (Text : String)
      return Domain_Summary_Parse_Result;

   function Parse_Queue_Summary
     (Text : String)
      return Queue_Summary_Parse_Result;

   function Parse_Cache_Summary
     (Text : String)
      return Cache_Summary_Parse_Result;

   function Parse_File_Size_Summary
     (Text : String)
      return File_Size_Summary_Parse_Result;

   function Parse_Transfer_Remaining
     (Text : String)
      return Transfer_Remaining_Parse_Result;

   function Parse_Disk_Usage
     (Text : String)
      return Disk_Usage_Parse_Result;

   function Parse_Validation_Summary
     (Text : String)
      return Validation_Summary_Parse_Result;

   function Parse_Field_Problem_Summary
     (Text : String)
      return Field_Problem_Parse_Result;

   function Parse_Selection_Summary
     (Text : String)
      return Selection_Summary_Parse_Result;

   function Parse_More_Count
     (Text : String)
      return More_Count_Parse_Result;

   function Parse_Pagination_Range
     (Text : String)
      return Pagination_Range_Parse_Result;

   function Parse_Collection_Display
     (Text : String)
      return Collection_Display_Parse_Result;

   function Parse_Boolean_Label
     (Text : String)
      return Boolean_Label_Parse_Result;

   function Scan_Boolean_Label
     (Text : String)
      return Boolean_Label_Parse_Result;

   function Parse_Ternary_Label
     (Text : String)
      return Ternary_Label_Parse_Result;

   function Scan_Ternary_Label
     (Text : String)
      return Ternary_Label_Parse_Result;
end Humanize.Parsing.Implementation.Domain_Label_Text_Helpers;
