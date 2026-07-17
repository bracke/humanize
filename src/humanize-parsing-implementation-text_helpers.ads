private package Humanize.Parsing.Implementation.Text_Helpers is
   function First_Alphabetic_Token_Last (Text : String) return Natural;
   function Is_Alnum (Item : Character) return Boolean;
   function Is_Lower_Alnum_Or
     (Item      : Character;
      Separator : Character)
      return Boolean;
   function Word_Count (Text : String) return Natural;
   function Count_Words (Text : String) return Natural;
   function Lowercase_Label (Text : String) return Boolean;
   function Uppercase_Label (Text : String) return Boolean;
   function Title_Case_Label (Text : String) return Boolean;
   function ASCII_Only_Label (Text : String) return Boolean;
   function Has_Spaced_Token (Text, Token : String) return Boolean;
   function Starts_At
     (Text    : String;
      Index   : Natural;
      Pattern : String)
      return Boolean;
   function Parse_Text_Count_Summary
     (Text : String)
      return Humanize.Parsing.Text_Count_Summary_Parse_Result;
   function Parse_Word_Count_Summary
     (Text : String)
      return Humanize.Parsing.Text_Count_Summary_Parse_Result;
   function Parse_Sentence_Count_Summary
     (Text : String)
      return Humanize.Parsing.Text_Count_Summary_Parse_Result;
   function Parse_Paragraph_Count_Summary
     (Text : String)
      return Humanize.Parsing.Text_Count_Summary_Parse_Result;
   function Parse_Mask
     (Text : String;
      Mask_Char : Character := '*')
      return Humanize.Parsing.Mask_Parse_Result;
   function Parse_Grouped_Token
     (Text : String;
      Separator : Character := '-')
      return Humanize.Parsing.Grouped_Token_Parse_Result;
   function Parse_Masked_Token
     (Text : String;
      Separator : Character := '-';
      Mask_Char : Character := '*')
      return Humanize.Parsing.Grouped_Token_Parse_Result;
   function Parse_Initials
     (Text : String)
      return Humanize.Parsing.Initials_Parse_Result;
   function Parse_Person_Initials
     (Text : String)
      return Humanize.Parsing.Initials_Parse_Result;
   function Parse_Possessive_Label
     (Text : String)
      return Humanize.Parsing.Possessive_Parse_Result;
   function Parse_Possessive_Name
     (Text : String)
      return Humanize.Parsing.Possessive_Parse_Result;
end Humanize.Parsing.Implementation.Text_Helpers;
