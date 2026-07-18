with Humanize.Status;

--  Small bounded-string utilities used by public formatters that need stable
--  ASCII-safe text operations.
package Humanize.Bounded_Text is

   function Clean (Text : String) return String;

   function Lower_Text (Text : String) return String;

   function Upper_Text (Text : String) return String;

   function Lower_Char (Item : Character) return Character;

   function Upper_Char (Item : Character) return Character;

   function Clean_Lower_Text (Text : String) return String;

   function Starts_With (Text, Prefix : String) return Boolean;

   function Ends_With (Text, Suffix : String) return Boolean;

   function Contains_Text (Text, Pattern : String) return Boolean;

   function Index_Text (Text, Pattern : String) return Natural;

   function Is_Digit (Item : Character) return Boolean;

   function Digit_Value (Item : Character) return Natural;

   function Is_ASCII_Letter (Item : Character) return Boolean;

   function Is_ASCII_Uppercase (Item : Character) return Boolean;

   function Is_ASCII_Lowercase (Item : Character) return Boolean;

   function Is_ASCII_Alphanumeric (Item : Character) return Boolean;

   function Is_Alphanumeric (Item : Character) return Boolean;

   function Is_Hex_Digit (Item : Character) return Boolean;

   function Is_Space (Item : Character) return Boolean;

   function No_Space (Image : String) return String;

   function Zero_Padded
     (Text  : String;
      Width : Natural)
      return String;

   function Image (Value : Natural) return String;

   function Padded_Image
     (Value : Natural;
      Width : Natural)
      return String;

   function Signed_Image (Value : Integer) return String;

   function Image (Value : Long_Long_Integer) return String;

   function Padded_Image
     (Value : Long_Long_Integer;
      Width : Natural)
      return String;

   function Float_Image (Value : Long_Float) return String;

   function Plural_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String;

   function Count_Or_No_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String;

   function Nonempty_Text
     (Text    : String;
      Message : String)
      return Humanize.Status.Text_Result;

   function Nonempty_Label_Text
     (Text    : String;
      Message : String;
      Prefix  : String := "";
      Suffix  : String := "")
      return Humanize.Status.Text_Result;

   function Nonempty_Detail_Text
     (Text           : String;
      Message        : String;
      Relation       : String;
      Detail         : String;
      Detail_Message : String;
      Suffix         : String := "")
      return Humanize.Status.Text_Result;

   function Nonempty_Two_Details_Text
     (Text                  : String;
      Message               : String;
      First_Relation        : String;
      First_Detail          : String;
      First_Detail_Message  : String;
      Second_Relation       : String;
      Second_Detail         : String;
      Second_Detail_Message : String)
      return Humanize.Status.Text_Result;

   function Hex_Bytes (Hex : String) return String;

   function UTF8_Code_Point (Code : Natural) return String;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result;

   function Status_Text
     (Status : Humanize.Status.Status_Code;
      Text   : String)
      return Humanize.Status.Text_Result;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result;

   function Invalid_Value_Text return Humanize.Status.Text_Result;

   function Result_Text (Result : Humanize.Status.Text_Result) return String;

   function Result_Label_Text
     (Result : Humanize.Status.Text_Result;
      Prefix : String := "";
      Suffix : String := "")
      return String;

   function Result_Detail_Text
     (Result   : Humanize.Status.Text_Result;
      Relation : String;
      Detail   : Humanize.Status.Text_Result)
      return String;

   function Result_Detail_Text
     (Result   : Humanize.Status.Text_Result;
      Relation : String;
      Detail   : Humanize.Status.Text_Result;
      Suffix   : String)
      return String;

   function Result_Two_Details_Text
     (Result          : Humanize.Status.Text_Result;
      First_Relation  : String;
      First_Detail    : Humanize.Status.Text_Result;
      Second_Relation : String;
      Second_Detail   : Humanize.Status.Text_Result)
      return String;

   procedure Copy_Text
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Copy_Text
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

end Humanize.Bounded_Text;
