with Ada.Calendar;

with Humanize.Bytes;
with Humanize.Colors;
with Humanize.Durations;
with Humanize.Frequencies;
with Humanize.Numbers;
with Humanize.Phrases;
with Humanize.Rates;
with Humanize.Status;
with Humanize.Strings;
with Humanize.Units;
with Humanize.Values;

package Humanize.Parsing.Implementation.Strings is

   function Parse_Text_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result;

   function Parse_Word_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result;

   function Parse_Sentence_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result;

   function Parse_Paragraph_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result;

   function Parse_Text_Time_Label
     (Text : String)
      return Text_Time_Parse_Result;

   function Parse_Reading_Time
     (Text : String)
      return Text_Time_Parse_Result;

   function Parse_Speaking_Time
     (Text : String)
      return Text_Time_Parse_Result;

   function Parse_Text_Summary
     (Text : String)
      return Text_Summary_Parse_Result;

   function Parse_Mask
     (Text : String;
      Mask_Char : Character := '*')
      return Mask_Parse_Result;

   function Parse_Grouped_Token
     (Text : String;
      Separator : Character := '-')
      return Grouped_Token_Parse_Result;

   function Parse_Masked_Token
     (Text : String;
      Separator : Character := '-';
      Mask_Char : Character := '*')
      return Grouped_Token_Parse_Result;

   function Parse_String_Label
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Path_Label
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Path_Basename
     (Text : String)
      return Filename_Label_Parse_Result;

   function Parse_Path_Title
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Extension_Label
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Shortened_Path
     (Text : String)
      return Excerpt_Parse_Result;

   function Parse_File_Mode_Label
     (Text : String)
      return File_Mode_Parse_Result;

   function Parse_Handle_Label
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Name_Label
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Clean_Name
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Display_Name
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Name_Part
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Initials
     (Text : String)
      return Initials_Parse_Result;

   function Parse_Person_Initials
     (Text : String)
      return Initials_Parse_Result;

   function Parse_Possessive_Label
     (Text : String)
      return Possessive_Parse_Result;

   function Parse_Possessive_Name
     (Text : String)
      return Possessive_Parse_Result;

   function Parse_Email_Local_Part
     (Text : String)
      return Email_Local_Part_Parse_Result;

   function Parse_Safe_Filename
     (Text : String)
      return Filename_Label_Parse_Result;

   function Parse_Search_Key
     (Text : String)
      return Identifier_Label_Parse_Result;

   function Parse_Natural_Sort_Key
     (Text : String)
      return Identifier_Label_Parse_Result;

   function Parse_Identifier_Label
     (Text : String;
      Separator : Character := '_')
      return Identifier_Label_Parse_Result;

   function Parse_Parameterize_Label
     (Text : String;
      Separator : Character := '-')
      return Identifier_Label_Parse_Result;

   function Parse_Dasherize_Label
     (Text : String)
      return Identifier_Label_Parse_Result;

   function Parse_Underscore_Label
     (Text : String)
      return Identifier_Label_Parse_Result;

   function Parse_Camelize_Label
     (Text : String)
      return Identifier_Label_Parse_Result;

   function Parse_Transliteration_Label
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Casefold_Label
     (Text : String)
      return Identifier_Label_Parse_Result;

   function Parse_Escaped_HTML
     (Text : String)
      return Cleanup_Label_Parse_Result;

   function Parse_NL_To_BR
     (Text : String)
      return Cleanup_Label_Parse_Result;

   function Parse_BR_To_NL
     (Text : String)
      return Cleanup_Label_Parse_Result;

   function Parse_Normalized_Whitespace
     (Text : String)
      return Cleanup_Label_Parse_Result;

   function Parse_Squished
     (Text : String)
      return Cleanup_Label_Parse_Result;

   function Parse_Stripped_Tags
     (Text : String)
      return Cleanup_Label_Parse_Result;

   function Parse_Preserved_Separator
     (Text      : String;
      Separator : Character)
      return Cleanup_Label_Parse_Result;

   function Parse_Pluralized_Word
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Singularized_Word
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Person_List
     (Text : String)
      return Person_List_Parse_Result;

   function Parse_Excerpt
     (Text : String;
      Ellipsis : String := "...")
      return Excerpt_Parse_Result;

   function Parse_Highlight
     (Text   : String;
      Before : String := "<mark>";
      After  : String := "</mark>")
      return Highlight_Parse_Result;

   function Parse_Highlighted_Excerpt
     (Text     : String;
      Ellipsis : String := "...";
      Before   : String := "<mark>";
      After    : String := "</mark>")
      return Highlight_Parse_Result;

   function Parse_Inflection_Source_Label
     (Text : String)
      return Inflection_Source_Parse_Result;
end Humanize.Parsing.Implementation.Strings;
