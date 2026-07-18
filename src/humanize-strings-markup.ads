--  Markup-oriented string helpers for tags, links, headings, and plain text.
package Humanize.Strings.Markup is
   function NL_To_BR
     (Text : String)
      return Humanize.Status.Text_Result;

   function BR_To_NL
     (Text : String)
      return Humanize.Status.Text_Result;

   function Escape_HTML
     (Text : String)
      return Humanize.Status.Text_Result;

   function Preserve_Separator
     (Text      : String;
      Separator : Character)
      return Humanize.Status.Text_Result;

   function Normalize_Whitespace
     (Text : String)
      return Humanize.Status.Text_Result;

   function Squish
     (Text : String)
      return Humanize.Status.Text_Result;

   function Strip_Tags
     (Text : String)
      return Humanize.Status.Text_Result;

   procedure NL_To_BR_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure BR_To_NL_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Escape_HTML_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Preserve_Separator_Into
     (Text      : String;
      Separator : Character;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);

   procedure Normalize_Whitespace_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Squish_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Strip_Tags_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
end Humanize.Strings.Markup;
