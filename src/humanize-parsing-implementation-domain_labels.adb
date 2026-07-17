with Humanize.Parsing.Implementation.Domain_Label_Text_Helpers;

package body Humanize.Parsing.Implementation.Domain_Labels is
   package Impl renames Humanize.Parsing.Implementation.Domain_Label_Text_Helpers;

   function Parse_Domain_Summary
     (Text : String)
      return Domain_Summary_Parse_Result renames Impl.Parse_Domain_Summary;

   function Parse_Phrase_Severity_Label
     (Text : String)
      return Phrase_Severity_Parse_Result renames Impl.Parse_Phrase_Severity_Label;

   function Parse_Phrase_Tone_Label
     (Text : String)
      return Phrase_Tone_Parse_Result renames Impl.Parse_Phrase_Tone_Label;

   function Parse_Phrase_Domain_Label
     (Text : String)
      return Phrase_Domain_Parse_Result renames Impl.Parse_Phrase_Domain_Label;

   function Parse_Phrase_State_Label
     (Text : String)
      return Phrase_State_Parse_Result renames Impl.Parse_Phrase_State_Label;

   function Parse_Phrase_Key
     (Text : String)
      return Phrase_Key_Parse_Result renames Impl.Parse_Phrase_Key;

   function Parse_Phrase_Pack_Summary
     (Text : String)
      return Phrase_Pack_Summary_Parse_Result renames Impl.Parse_Phrase_Pack_Summary;

   function Parse_Supported_Phrase_Locales
     (Text : String)
      return Phrase_Locales_Parse_Result renames Impl.Parse_Supported_Phrase_Locales;

   function Parse_Operational_Phrase
     (Text : String)
      return Operational_Phrase_Parse_Result renames Impl.Parse_Operational_Phrase;

   function Parse_Field_Change_Summary
     (Text : String)
      return Field_Change_Summary_Parse_Result renames Impl.Parse_Field_Change_Summary;

   function Parse_Field_State_Summary
     (Text : String)
      return Field_State_Summary_Parse_Result renames Impl.Parse_Field_State_Summary;

   function Parse_Sync_Summary
     (Text : String)
      return Domain_Summary_Parse_Result renames Impl.Parse_Sync_Summary;

   function Parse_Import_Summary
     (Text : String)
      return Domain_Summary_Parse_Result renames Impl.Parse_Import_Summary;

   function Parse_Export_Summary
     (Text : String)
      return Domain_Summary_Parse_Result renames Impl.Parse_Export_Summary;

   function Parse_Queue_Summary
     (Text : String)
      return Queue_Summary_Parse_Result renames Impl.Parse_Queue_Summary;

   function Parse_Cache_Summary
     (Text : String)
      return Cache_Summary_Parse_Result renames Impl.Parse_Cache_Summary;

   function Parse_File_Size_Summary
     (Text : String)
      return File_Size_Summary_Parse_Result renames Impl.Parse_File_Size_Summary;

   function Parse_Transfer_Remaining
     (Text : String)
      return Transfer_Remaining_Parse_Result renames Impl.Parse_Transfer_Remaining;

   function Parse_Disk_Usage
     (Text : String)
      return Disk_Usage_Parse_Result renames Impl.Parse_Disk_Usage;

   function Parse_Validation_Summary
     (Text : String)
      return Validation_Summary_Parse_Result renames Impl.Parse_Validation_Summary;

   function Parse_Field_Problem_Summary
     (Text : String)
      return Field_Problem_Parse_Result renames Impl.Parse_Field_Problem_Summary;

   function Parse_Selection_Summary
     (Text : String)
      return Selection_Summary_Parse_Result renames Impl.Parse_Selection_Summary;

   function Parse_More_Count
     (Text : String)
      return More_Count_Parse_Result renames Impl.Parse_More_Count;

   function Parse_Pagination_Range
     (Text : String)
      return Pagination_Range_Parse_Result renames Impl.Parse_Pagination_Range;

   function Parse_Collection_Display
     (Text : String)
      return Collection_Display_Parse_Result renames Impl.Parse_Collection_Display;

   function Parse_Boolean_Label
     (Text : String)
      return Boolean_Label_Parse_Result renames Impl.Parse_Boolean_Label;

   function Scan_Boolean_Label
     (Text : String)
      return Boolean_Label_Parse_Result renames Impl.Scan_Boolean_Label;

   function Parse_Ternary_Label
     (Text : String)
      return Ternary_Label_Parse_Result renames Impl.Parse_Ternary_Label;

   function Scan_Ternary_Label
     (Text : String)
      return Ternary_Label_Parse_Result renames Impl.Scan_Ternary_Label;
end Humanize.Parsing.Implementation.Domain_Labels;
