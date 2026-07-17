with Humanize.Parsing.Implementation.String_Text_Helpers;

package body Humanize.Parsing.Implementation.Strings is
   package Impl renames Humanize.Parsing.Implementation.String_Text_Helpers;

   function Parse_Text_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result renames Impl.Parse_Text_Count_Summary;

   function Parse_Word_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result renames Impl.Parse_Word_Count_Summary;

   function Parse_Sentence_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result renames Impl.Parse_Sentence_Count_Summary;

   function Parse_Paragraph_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result renames Impl.Parse_Paragraph_Count_Summary;

   function Parse_Text_Time_Label
     (Text : String)
      return Text_Time_Parse_Result renames Impl.Parse_Text_Time_Label;

   function Parse_Reading_Time
     (Text : String)
      return Text_Time_Parse_Result renames Impl.Parse_Reading_Time;

   function Parse_Speaking_Time
     (Text : String)
      return Text_Time_Parse_Result renames Impl.Parse_Speaking_Time;

   function Parse_Text_Summary
     (Text : String)
      return Text_Summary_Parse_Result renames Impl.Parse_Text_Summary;

   function Parse_Mask
     (Text : String;
      Mask_Char : Character := '*')
      return Mask_Parse_Result renames Impl.Parse_Mask;

   function Parse_Grouped_Token
     (Text : String;
      Separator : Character := '-')
      return Grouped_Token_Parse_Result renames Impl.Parse_Grouped_Token;

   function Parse_Masked_Token
     (Text : String;
      Separator : Character := '-';
      Mask_Char : Character := '*')
      return Grouped_Token_Parse_Result renames Impl.Parse_Masked_Token;

   function Parse_String_Label
     (Text : String)
      return String_Label_Parse_Result renames Impl.Parse_String_Label;

   function Parse_Path_Label
     (Text : String)
      return String_Label_Parse_Result renames Impl.Parse_Path_Label;

   function Parse_Path_Basename
     (Text : String)
      return Filename_Label_Parse_Result renames Impl.Parse_Path_Basename;

   function Parse_Path_Title
     (Text : String)
      return String_Label_Parse_Result renames Impl.Parse_Path_Title;

   function Parse_Extension_Label
     (Text : String)
      return String_Label_Parse_Result renames Impl.Parse_Extension_Label;

   function Parse_Shortened_Path
     (Text : String)
      return Excerpt_Parse_Result renames Impl.Parse_Shortened_Path;

   function Parse_File_Mode_Label
     (Text : String)
      return File_Mode_Parse_Result renames Impl.Parse_File_Mode_Label;

   function Parse_Handle_Label
     (Text : String)
      return String_Label_Parse_Result renames Impl.Parse_Handle_Label;

   function Parse_Name_Label
     (Text : String)
      return String_Label_Parse_Result renames Impl.Parse_Name_Label;

   function Parse_Clean_Name
     (Text : String)
      return String_Label_Parse_Result renames Impl.Parse_Clean_Name;

   function Parse_Display_Name
     (Text : String)
      return String_Label_Parse_Result renames Impl.Parse_Display_Name;

   function Parse_Name_Part
     (Text : String)
      return String_Label_Parse_Result renames Impl.Parse_Name_Part;

   function Parse_Initials
     (Text : String)
      return Initials_Parse_Result renames Impl.Parse_Initials;

   function Parse_Person_Initials
     (Text : String)
      return Initials_Parse_Result renames Impl.Parse_Person_Initials;

   function Parse_Possessive_Label
     (Text : String)
      return Possessive_Parse_Result renames Impl.Parse_Possessive_Label;

   function Parse_Possessive_Name
     (Text : String)
      return Possessive_Parse_Result renames Impl.Parse_Possessive_Name;

   function Parse_Email_Local_Part
     (Text : String)
      return Email_Local_Part_Parse_Result renames Impl.Parse_Email_Local_Part;

   function Parse_Safe_Filename
     (Text : String)
      return Filename_Label_Parse_Result renames Impl.Parse_Safe_Filename;

   function Parse_Search_Key
     (Text : String)
      return Identifier_Label_Parse_Result renames Impl.Parse_Search_Key;

   function Parse_Natural_Sort_Key
     (Text : String)
      return Identifier_Label_Parse_Result renames Impl.Parse_Natural_Sort_Key;

   function Parse_Identifier_Label
     (Text : String;
      Separator : Character := '_')
      return Identifier_Label_Parse_Result renames Impl.Parse_Identifier_Label;

   function Parse_Parameterize_Label
     (Text : String;
      Separator : Character := '-')
      return Identifier_Label_Parse_Result renames Impl.Parse_Parameterize_Label;

   function Parse_Dasherize_Label
     (Text : String)
      return Identifier_Label_Parse_Result renames Impl.Parse_Dasherize_Label;

   function Parse_Underscore_Label
     (Text : String)
      return Identifier_Label_Parse_Result renames Impl.Parse_Underscore_Label;

   function Parse_Camelize_Label
     (Text : String)
      return Identifier_Label_Parse_Result renames Impl.Parse_Camelize_Label;

   function Parse_Transliteration_Label
     (Text : String)
      return String_Label_Parse_Result renames Impl.Parse_Transliteration_Label;

   function Parse_Casefold_Label
     (Text : String)
      return Identifier_Label_Parse_Result renames Impl.Parse_Casefold_Label;

   function Parse_Escaped_HTML
     (Text : String)
      return Cleanup_Label_Parse_Result renames Impl.Parse_Escaped_HTML;

   function Parse_NL_To_BR
     (Text : String)
      return Cleanup_Label_Parse_Result renames Impl.Parse_NL_To_BR;

   function Parse_BR_To_NL
     (Text : String)
      return Cleanup_Label_Parse_Result renames Impl.Parse_BR_To_NL;

   function Parse_Normalized_Whitespace
     (Text : String)
      return Cleanup_Label_Parse_Result renames Impl.Parse_Normalized_Whitespace;

   function Parse_Squished
     (Text : String)
      return Cleanup_Label_Parse_Result renames Impl.Parse_Squished;

   function Parse_Stripped_Tags
     (Text : String)
      return Cleanup_Label_Parse_Result renames Impl.Parse_Stripped_Tags;

   function Parse_Preserved_Separator
     (Text      : String;
      Separator : Character)
      return Cleanup_Label_Parse_Result renames Impl.Parse_Preserved_Separator;

   function Parse_Pluralized_Word
     (Text : String)
      return String_Label_Parse_Result renames Impl.Parse_Pluralized_Word;

   function Parse_Singularized_Word
     (Text : String)
      return String_Label_Parse_Result renames Impl.Parse_Singularized_Word;

   function Parse_Person_List
     (Text : String)
      return Person_List_Parse_Result renames Impl.Parse_Person_List;

   function Parse_Excerpt
     (Text : String;
      Ellipsis : String := "...")
      return Excerpt_Parse_Result renames Impl.Parse_Excerpt;

   function Parse_Highlight
     (Text   : String;
      Before : String := "<mark>";
      After  : String := "</mark>")
      return Highlight_Parse_Result renames Impl.Parse_Highlight;

   function Parse_Highlighted_Excerpt
     (Text     : String;
      Ellipsis : String := "...";
      Before   : String := "<mark>";
      After    : String := "</mark>")
      return Highlight_Parse_Result renames Impl.Parse_Highlighted_Excerpt;

   function Parse_Inflection_Source_Label
     (Text : String)
      return Inflection_Source_Parse_Result renames Impl.Parse_Inflection_Source_Label;
end Humanize.Parsing.Implementation.Strings;
