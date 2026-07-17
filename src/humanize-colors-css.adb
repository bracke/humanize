with Humanize.Colors.Support;

package body Humanize.Colors.CSS is
   package Shared renames Humanize.Colors.Support;

   function Parse_Hex_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code renames Shared.Parse_Hex_Color;

   function Parse_Named_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code renames Shared.Parse_Named_Color;

   function Parse_CSS_Color
     (Text  : String;
      Color : out CSS_Color)
      return Humanize.Status.Status_Code renames Shared.Parse_CSS_Color;

   function Hex_Color
     (Color   : RGB_Color;
      Prefix  : Boolean := True;
      Lowercase : Boolean := False)
      return Humanize.Status.Text_Result renames Shared.Hex_Color;

   function Hex_Color
     (Red     : Color_Channel;
      Green   : Color_Channel;
      Blue    : Color_Channel;
      Prefix  : Boolean := True;
      Lowercase : Boolean := False)
      return Humanize.Status.Text_Result renames Shared.Hex_Color;

   function RGB_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.RGB_Label;

   function RGBA_Label
     (Color   : RGB_Color;
      Opacity : Long_Float)
      return Humanize.Status.Text_Result renames Shared.RGBA_Label;

   function CSS_Color_Label
     (Color : CSS_Color)
      return Humanize.Status.Text_Result renames Shared.CSS_Color_Label;

   procedure Hex_Color_Into
     (Color     : RGB_Color;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Prefix    : Boolean := True;
      Lowercase : Boolean := False) renames Shared.Hex_Color_Into;

   procedure RGB_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.RGB_Label_Into;

   procedure RGBA_Label_Into
     (Color   : RGB_Color;
      Opacity : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.RGBA_Label_Into;

   procedure CSS_Color_Label_Into
     (Color   : CSS_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.CSS_Color_Label_Into;
end Humanize.Colors.CSS;
