package Humanize.Parsing.Results is
   subtype Parse_Error_Kind is Humanize.Parsing.Parse_Error_Kind;
   subtype Scheduling_Phrase_Kind is Humanize.Parsing.Scheduling_Phrase_Kind;
   subtype Parse_Value_Family is Humanize.Parsing.Parse_Value_Family;
   subtype Comparison_Direction is Humanize.Parsing.Comparison_Direction;
   subtype Operational_Phrase_Domain is Humanize.Parsing.Operational_Phrase_Domain;
   subtype Field_State_Change_Kind is Humanize.Parsing.Field_State_Change_Kind;
   subtype Validation_Severity_Label is Humanize.Parsing.Validation_Severity_Label;
   subtype Selection_Summary_Kind is Humanize.Parsing.Selection_Summary_Kind;
   subtype Collection_Display_Kind is Humanize.Parsing.Collection_Display_Kind;
   subtype Business_Calendar_Parse_Kind is Humanize.Parsing.Business_Calendar_Parse_Kind;
   subtype Recurrence_Parse_Kind is Humanize.Parsing.Recurrence_Parse_Kind;

   subtype Parse_Success_Explanation is Humanize.Parsing.Parse_Success_Explanation;
   subtype Byte_Parse_Result is Humanize.Parsing.Byte_Parse_Result;
   subtype Duration_Parse_Result is Humanize.Parsing.Duration_Parse_Result;
   subtype Scheduling_Phrase_Result is Humanize.Parsing.Scheduling_Phrase_Result;
   subtype Precise_Duration_Parse_Result is Humanize.Parsing.Precise_Duration_Parse_Result;
   subtype Number_Parse_Result is Humanize.Parsing.Number_Parse_Result;
   subtype Float_Parse_Result is Humanize.Parsing.Float_Parse_Result;
   subtype Currency_Parse_Result is Humanize.Parsing.Currency_Parse_Result;
   subtype Change_Parse_Result is Humanize.Parsing.Change_Parse_Result;
   subtype Comparison_Parse_Result is Humanize.Parsing.Comparison_Parse_Result;
   subtype Date_Comparison_Parse_Result is Humanize.Parsing.Date_Comparison_Parse_Result;
   subtype Palette_Contrast_Matrix_Parse_Result is
     Humanize.Parsing.Palette_Contrast_Matrix_Parse_Result;
   subtype Palette_Metadata_Parse_Result is Humanize.Parsing.Palette_Metadata_Parse_Result;
   subtype APCA_Label_Parse_Result is Humanize.Parsing.APCA_Label_Parse_Result;
   subtype Color_Vision_Deficiency_Parse_Result is
     Humanize.Parsing.Color_Vision_Deficiency_Parse_Result;
   subtype Color_Accessibility_Parse_Result is
     Humanize.Parsing.Color_Accessibility_Parse_Result;
   subtype Color_Label_Parse_Result is Humanize.Parsing.Color_Label_Parse_Result;
   subtype Color_Model_Label_Parse_Result is Humanize.Parsing.Color_Model_Label_Parse_Result;
   subtype Color_Bucket_Label_Parse_Result is Humanize.Parsing.Color_Bucket_Label_Parse_Result;
   subtype Color_Description_Parse_Result is Humanize.Parsing.Color_Description_Parse_Result;
   subtype Palette_Summary_Parse_Result is Humanize.Parsing.Palette_Summary_Parse_Result;
   subtype Palette_Roles_Parse_Result is Humanize.Parsing.Palette_Roles_Parse_Result;
   subtype Palette_Mood_Parse_Result is Humanize.Parsing.Palette_Mood_Parse_Result;
   subtype Palette_Contrast_Suggestion_Parse_Result is
     Humanize.Parsing.Palette_Contrast_Suggestion_Parse_Result;
   subtype Palette_Accessibility_Label_Parse_Result is
     Humanize.Parsing.Palette_Accessibility_Label_Parse_Result;
   subtype Color_Difference_Label_Parse_Result is
     Humanize.Parsing.Color_Difference_Label_Parse_Result;
   subtype Contrast_Remediation_Parse_Result is
     Humanize.Parsing.Contrast_Remediation_Parse_Result;
   subtype Domain_Summary_Parse_Result is Humanize.Parsing.Domain_Summary_Parse_Result;
   subtype Phrase_Severity_Parse_Result is Humanize.Parsing.Phrase_Severity_Parse_Result;
   subtype Phrase_Tone_Parse_Result is Humanize.Parsing.Phrase_Tone_Parse_Result;
   subtype Phrase_Domain_Parse_Result is Humanize.Parsing.Phrase_Domain_Parse_Result;
   subtype Phrase_State_Parse_Result is Humanize.Parsing.Phrase_State_Parse_Result;
   subtype Phrase_Key_Parse_Result is Humanize.Parsing.Phrase_Key_Parse_Result;
   subtype Phrase_Pack_Summary_Parse_Result is
     Humanize.Parsing.Phrase_Pack_Summary_Parse_Result;
   subtype Phrase_Locales_Parse_Result is Humanize.Parsing.Phrase_Locales_Parse_Result;
   subtype Operational_Phrase_Parse_Result is
     Humanize.Parsing.Operational_Phrase_Parse_Result;
   subtype Field_Change_Summary_Parse_Result is
     Humanize.Parsing.Field_Change_Summary_Parse_Result;
   subtype Field_State_Summary_Parse_Result is
     Humanize.Parsing.Field_State_Summary_Parse_Result;
   subtype Queue_Summary_Parse_Result is Humanize.Parsing.Queue_Summary_Parse_Result;
   subtype Cache_Summary_Parse_Result is Humanize.Parsing.Cache_Summary_Parse_Result;
   subtype File_Size_Summary_Parse_Result is
     Humanize.Parsing.File_Size_Summary_Parse_Result;
   subtype Transfer_Remaining_Parse_Result is
     Humanize.Parsing.Transfer_Remaining_Parse_Result;
   subtype Disk_Usage_Parse_Result is Humanize.Parsing.Disk_Usage_Parse_Result;
   subtype Validation_Summary_Parse_Result is
     Humanize.Parsing.Validation_Summary_Parse_Result;
   subtype Field_Problem_Parse_Result is Humanize.Parsing.Field_Problem_Parse_Result;
   subtype Selection_Summary_Parse_Result is
     Humanize.Parsing.Selection_Summary_Parse_Result;
   subtype More_Count_Parse_Result is Humanize.Parsing.More_Count_Parse_Result;
   subtype Pagination_Range_Parse_Result is
     Humanize.Parsing.Pagination_Range_Parse_Result;
   subtype Collection_Display_Parse_Result is
     Humanize.Parsing.Collection_Display_Parse_Result;
   subtype Text_Count_Summary_Parse_Result is
     Humanize.Parsing.Text_Count_Summary_Parse_Result;
   subtype Text_Time_Parse_Result is Humanize.Parsing.Text_Time_Parse_Result;
   subtype Text_Summary_Parse_Result is Humanize.Parsing.Text_Summary_Parse_Result;
   subtype Boolean_Label_Parse_Result is Humanize.Parsing.Boolean_Label_Parse_Result;
   subtype Ternary_Label_Parse_Result is Humanize.Parsing.Ternary_Label_Parse_Result;
   subtype String_Label_Parse_Result is Humanize.Parsing.String_Label_Parse_Result;
   subtype Initials_Parse_Result is Humanize.Parsing.Initials_Parse_Result;
   subtype Possessive_Parse_Result is Humanize.Parsing.Possessive_Parse_Result;
   subtype Identifier_Label_Parse_Result is Humanize.Parsing.Identifier_Label_Parse_Result;
   subtype Filename_Label_Parse_Result is Humanize.Parsing.Filename_Label_Parse_Result;
   subtype File_Mode_Parse_Result is Humanize.Parsing.File_Mode_Parse_Result;
   subtype Email_Local_Part_Parse_Result is Humanize.Parsing.Email_Local_Part_Parse_Result;
   subtype Cleanup_Label_Parse_Result is Humanize.Parsing.Cleanup_Label_Parse_Result;
   subtype Mask_Parse_Result is Humanize.Parsing.Mask_Parse_Result;
   subtype Grouped_Token_Parse_Result is Humanize.Parsing.Grouped_Token_Parse_Result;
   subtype Highlight_Parse_Result is Humanize.Parsing.Highlight_Parse_Result;
   subtype Excerpt_Parse_Result is Humanize.Parsing.Excerpt_Parse_Result;
   subtype Person_List_Parse_Result is Humanize.Parsing.Person_List_Parse_Result;
   subtype Inflection_Source_Parse_Result is
     Humanize.Parsing.Inflection_Source_Parse_Result;
   subtype Duration_Range_Parse_Result is Humanize.Parsing.Duration_Range_Parse_Result;
   subtype Number_Range_Parse_Result is Humanize.Parsing.Number_Range_Parse_Result;
   subtype Decimal_Range_Parse_Result is Humanize.Parsing.Decimal_Range_Parse_Result;
   subtype Uncertainty_Parse_Result is Humanize.Parsing.Uncertainty_Parse_Result;
   subtype Proportion_Parse_Result is Humanize.Parsing.Proportion_Parse_Result;
   subtype Frequency_Parse_Result is Humanize.Parsing.Frequency_Parse_Result;
   subtype Rate_Parse_Result is Humanize.Parsing.Rate_Parse_Result;
   subtype List_Parse_Result is Humanize.Parsing.List_Parse_Result;
   subtype Counted_Noun_Parse_Result is Humanize.Parsing.Counted_Noun_Parse_Result;
   subtype Unit_Parse_Result is Humanize.Parsing.Unit_Parse_Result;
   subtype Aspect_Ratio_Parse_Result is Humanize.Parsing.Aspect_Ratio_Parse_Result;
   subtype Compound_Unit_Parse_Result is Humanize.Parsing.Compound_Unit_Parse_Result;
   subtype Date_Parse_Result is Humanize.Parsing.Date_Parse_Result;
   subtype Natural_Date_Time_Parse_Result is
     Humanize.Parsing.Natural_Date_Time_Parse_Result;
   subtype Date_Range_Parse_Result is Humanize.Parsing.Date_Range_Parse_Result;
   subtype Business_Calendar_Parse_Result is
     Humanize.Parsing.Business_Calendar_Parse_Result;
   subtype Business_Calendar_Rules_Parse_Result is
     Humanize.Parsing.Business_Calendar_Rules_Parse_Result;
   subtype Recurrence_Parse_Result is Humanize.Parsing.Recurrence_Parse_Result;
end Humanize.Parsing.Results;
