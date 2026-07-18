--  Identifier formatting helpers for code-like names, slugs, and labels.
package Humanize.Strings.Identifiers is
   function Parameterize
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result;

   function Dasherize
     (Text : String)
      return Humanize.Status.Text_Result;

   function Underscore
     (Text : String)
      return Humanize.Status.Text_Result;

   function Camelize
     (Text        : String;
      Upper_First : Boolean := True)
      return Humanize.Status.Text_Result;

   function Humanize_String
     (Text : String)
      return Humanize.Status.Text_Result;

   function Deconstantize
     (Text : String)
      return Humanize.Status.Text_Result;

   function Demodulize
     (Text : String)
      return Humanize.Status.Text_Result;

   function Tableize
     (Text : String)
      return Humanize.Status.Text_Result;

   function Classify
     (Text : String)
      return Humanize.Status.Text_Result;

   function Foreign_Key
     (Text             : String;
      Separate_Class_Id : Boolean := True)
      return Humanize.Status.Text_Result;

   function Acronym
     (Text    : String;
      Options : Identifier_Options := Default_Identifier_Options)
      return Humanize.Status.Text_Result;

   function Search_Key
     (Text : String)
      return Humanize.Status.Text_Result;

   function Natural_Sort_Key
     (Text : String)
      return Humanize.Status.Text_Result;

   function Natural_Less
     (Left  : String;
      Right : String)
      return Boolean;

   function Transliterate_ASCII
     (Text : String)
      return Humanize.Status.Text_Result;

   function Casefold_ASCII
     (Text : String)
      return Humanize.Status.Text_Result;

   function Slug
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result;

   procedure Parameterize_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-');

   procedure Dasherize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Underscore_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Camelize_Into
     (Text        : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Upper_First : Boolean := True);

   procedure Humanize_String_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Deconstantize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Demodulize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Tableize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Classify_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Foreign_Key_Into
     (Text             : String;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Separate_Class_Id : Boolean := True);

   procedure Acronym_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Identifier_Options := Default_Identifier_Options);

   procedure Search_Key_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Natural_Sort_Key_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Transliterate_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Casefold_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Slug_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-');
end Humanize.Strings.Identifiers;
