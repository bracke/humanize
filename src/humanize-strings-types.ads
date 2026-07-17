package Humanize.Strings.Types is
   subtype Name_Item is Humanize.Strings.Name_Item;
   subtype Name_List is Humanize.Strings.Name_List;

   subtype Title_Case_Options is Humanize.Strings.Title_Case_Options;
   subtype Editorial_Title_Style is Humanize.Strings.Editorial_Title_Style;
   subtype Identifier_Options is Humanize.Strings.Identifier_Options;
   subtype Token_Case_Mode is Humanize.Strings.Token_Case_Mode;
   subtype Token_Grouping_Direction is Humanize.Strings.Token_Grouping_Direction;
   subtype Token_Group_Size is Humanize.Strings.Token_Group_Size;
   subtype Token_Group_Options is Humanize.Strings.Token_Group_Options;
   subtype Path_Length_Limit is Humanize.Strings.Path_Length_Limit;
   subtype Filename_Case_Mode is Humanize.Strings.Filename_Case_Mode;
   subtype Hidden_File_Mode is Humanize.Strings.Hidden_File_Mode;
   subtype Extension_Missing_Label is Humanize.Strings.Extension_Missing_Label;
   subtype Safe_Filename_Options is Humanize.Strings.Safe_Filename_Options;
   subtype Path_Title_Options is Humanize.Strings.Path_Title_Options;
   subtype Extension_Label_Options is Humanize.Strings.Extension_Label_Options;
   subtype Path_Shorten_Options is Humanize.Strings.Path_Shorten_Options;
   subtype Terminal_Output_Mode is Humanize.Strings.Terminal_Output_Mode;
   subtype Terminal_Layout_Options is Humanize.Strings.Terminal_Layout_Options;
   subtype Prose_List_Options is Humanize.Strings.Prose_List_Options;
   subtype Range_Boundary is Humanize.Strings.Range_Boundary;
   subtype Generic_Range_Options is Humanize.Strings.Generic_Range_Options;
   subtype Text_Change_Kind is Humanize.Strings.Text_Change_Kind;
   subtype Text_Change_Metadata is Humanize.Strings.Text_Change_Metadata;
   subtype Address_Fields is Humanize.Strings.Address_Fields;
   subtype Data_Shape_Kind is Humanize.Strings.Data_Shape_Kind;
   subtype Data_Shape_Metadata is Humanize.Strings.Data_Shape_Metadata;
   subtype Label_Coverage_Metadata is Humanize.Strings.Label_Coverage_Metadata;
   subtype File_Mode_Value is Humanize.Strings.File_Mode_Value;
   subtype File_Mode_Kind is Humanize.Strings.File_Mode_Kind;
   subtype Inflection_Source is Humanize.Strings.Inflection_Source;
   subtype Inflection_Rule_Order is Humanize.Strings.Inflection_Rule_Order;
   subtype Inflection_Language is Humanize.Strings.Inflection_Language;
   subtype Inflection_Options is Humanize.Strings.Inflection_Options;
   subtype Name_Display_Style is Humanize.Strings.Name_Display_Style;
   subtype Name_Order is Humanize.Strings.Name_Order;
   subtype Initial_Count_Limit is Humanize.Strings.Initial_Count_Limit;
   subtype Person_Name_Options is Humanize.Strings.Person_Name_Options;
   subtype Words_Per_Minute is Humanize.Strings.Words_Per_Minute;
   subtype Text_Time_Options is Humanize.Strings.Text_Time_Options;
   subtype Text_Summary_Options is Humanize.Strings.Text_Summary_Options;
   subtype Text_Summary_Field is Humanize.Strings.Text_Summary_Field;
   subtype Text_Summary_Field_Count is Humanize.Strings.Text_Summary_Field_Count;
   subtype Text_Summary_Field_Index is Humanize.Strings.Text_Summary_Field_Index;
   subtype Text_Summary_Field_List is Humanize.Strings.Text_Summary_Field_List;
   subtype Text_Summary_Label_Style is Humanize.Strings.Text_Summary_Label_Style;
   subtype Text_Summary_Composition_Options is
     Humanize.Strings.Text_Summary_Composition_Options;
   subtype Text_Metrics_Result is Humanize.Strings.Text_Metrics_Result;
   subtype Match_Case_Mode is Humanize.Strings.Match_Case_Mode;
   subtype Match_Boundary_Mode is Humanize.Strings.Match_Boundary_Mode;
   subtype Match_Count_Mode is Humanize.Strings.Match_Count_Mode;
   subtype Match_Options is Humanize.Strings.Match_Options;
   subtype Highlight_Options is Humanize.Strings.Highlight_Options;

   Default_Title_Case_Options : Title_Case_Options
      renames Humanize.Strings.Default_Title_Case_Options;
   Default_Identifier_Options : Identifier_Options
      renames Humanize.Strings.Default_Identifier_Options;
   Default_Token_Group_Options : Token_Group_Options
      renames Humanize.Strings.Default_Token_Group_Options;
   Default_Safe_Filename_Options : Safe_Filename_Options
      renames Humanize.Strings.Default_Safe_Filename_Options;
   Default_Path_Title_Options : Path_Title_Options
      renames Humanize.Strings.Default_Path_Title_Options;
   Default_Extension_Label_Options : Extension_Label_Options
      renames Humanize.Strings.Default_Extension_Label_Options;
   Default_Terminal_Layout_Options : Terminal_Layout_Options
      renames Humanize.Strings.Default_Terminal_Layout_Options;
   Default_Prose_List_Options : Prose_List_Options
      renames Humanize.Strings.Default_Prose_List_Options;
   Default_Path_Shorten_Options : Path_Shorten_Options
      renames Humanize.Strings.Default_Path_Shorten_Options;
   Default_Inflection_Options : Inflection_Options
      renames Humanize.Strings.Default_Inflection_Options;
   Default_Person_Name_Options : Person_Name_Options
      renames Humanize.Strings.Default_Person_Name_Options;
   Default_Text_Time_Options : Text_Time_Options
      renames Humanize.Strings.Default_Text_Time_Options;
   Default_Text_Summary_Options : Text_Summary_Options
      renames Humanize.Strings.Default_Text_Summary_Options;
   Default_Text_Summary_Composition_Options :
     Text_Summary_Composition_Options
      renames Humanize.Strings.Default_Text_Summary_Composition_Options;
   Default_Match_Options : Match_Options
      renames Humanize.Strings.Default_Match_Options;
   Default_Highlight_Options : Highlight_Options
      renames Humanize.Strings.Default_Highlight_Options;
end Humanize.Strings.Types;
