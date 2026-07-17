with Humanize.Contexts;
with Humanize.Status;

package Humanize.Colors.CSS is

   function Parse_Hex_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code;

   function Parse_Named_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code;

   function Parse_CSS_Color
     (Text  : String;
      Color : out CSS_Color)
      return Humanize.Status.Status_Code;

   function Hex_Color
     (Color   : RGB_Color;
      Prefix  : Boolean := True;
      Lowercase : Boolean := False)
      return Humanize.Status.Text_Result;

   function Hex_Color
     (Red     : Color_Channel;
      Green   : Color_Channel;
      Blue    : Color_Channel;
      Prefix  : Boolean := True;
      Lowercase : Boolean := False)
      return Humanize.Status.Text_Result;

   function RGB_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;

   function RGBA_Label
     (Color   : RGB_Color;
      Opacity : Long_Float)
      return Humanize.Status.Text_Result;

   function CSS_Color_Label
     (Color : CSS_Color)
      return Humanize.Status.Text_Result;

   procedure Hex_Color_Into
     (Color     : RGB_Color;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Prefix    : Boolean := True;
      Lowercase : Boolean := False);

   procedure RGB_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure RGBA_Label_Into
     (Color   : RGB_Color;
      Opacity : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure CSS_Color_Label_Into
     (Color   : CSS_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
end Humanize.Colors.CSS;
