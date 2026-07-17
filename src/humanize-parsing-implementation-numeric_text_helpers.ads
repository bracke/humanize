with Ada.Strings.Unbounded;

private package Humanize.Parsing.Implementation.Numeric_Text_Helpers is
   function Parse_Two_Naturals
     (Left_Text  : String;
      Right_Text : String;
      Left       : out Natural;
      Right      : out Natural)
      return Boolean;
   function Parse_Digit_Word
     (Text  : String;
      Digit : out Natural)
      return Boolean;
   function Parse_Fraction_Denominator_Word
     (Text        : String;
      Denominator : out Natural)
      return Boolean;
   procedure Store
     (Source : String;
      Target : out String;
      Length : out Natural);
   function Number_Token_End (Text : String) return Natural;
   function Parse_Number_And_Tail
     (Text   : String;
      Value  : out Long_Float;
      Tail   : out Ada.Strings.Unbounded.Unbounded_String)
      return Boolean;
   function Strip_Grouping (Text : String) return String;
   function Singular_Unit (Text : String) return String;
   function Parse_Natural_Field
     (Text  : String;
      Value : out Natural)
      return Boolean;
   function Parse_Other_Count_From_Details (Text : String) return Natural;
   function Roman_Digit (Ch : Character) return Natural;
   function Is_Roman_Character (Ch : Character) return Boolean;
end Humanize.Parsing.Implementation.Numeric_Text_Helpers;
