with Humanize.Contexts;
with Humanize.Status;

--  CSS color parsing and labeling helpers for hex, rgb, hsl, and named colors.
package Humanize.Colors.CSS is

   function Parse_Hex_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code;
   --  @param Text CSS hex color text such as "#336699" or "336699".
   --  @param Color Parsed RGB color when the result is Ok.
   --  @return Ok when Text is a valid hex color; otherwise an error status.

   function Parse_Named_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code;
   --  @param Text CSS named color such as "red" or "rebeccapurple".
   --  @param Color Parsed RGB color when the result is Ok.
   --  @return Ok when Text is a supported CSS color name.

   function Parse_CSS_Color
     (Text  : String;
      Color : out CSS_Color)
      return Humanize.Status.Status_Code;
   --  @param Text CSS color text such as a named, hex, rgb, hsl, or hwb value.
   --  @param Color Parsed CSS color when the result is Ok.
   --  @return Ok when Text is a supported CSS color form.

   function Hex_Color
     (Color   : RGB_Color;
      Prefix  : Boolean := True;
      Lowercase : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color to render.
   --  @param Prefix Include the leading "#" when True.
   --  @param Lowercase Render hexadecimal digits in lowercase when True.
   --  @return Hex color label such as "#336699".

   function Hex_Color
     (Red     : Color_Channel;
      Green   : Color_Channel;
      Blue    : Color_Channel;
      Prefix  : Boolean := True;
      Lowercase : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Red Red channel.
   --  @param Green Green channel.
   --  @param Blue Blue channel.
   --  @param Prefix Include the leading "#" when True.
   --  @param Lowercase Render hexadecimal digits in lowercase when True.
   --  @return Hex color label such as "#336699".

   function RGB_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color to render.
   --  @return CSS rgb() label for Color.

   function RGBA_Label
     (Color   : RGB_Color;
      Opacity : Long_Float)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color to render.
   --  @param Opacity Alpha channel as a fraction from 0.0 to 1.0.
   --  @return CSS rgba() label for Color and Opacity.

   function CSS_Color_Label
     (Color : CSS_Color)
      return Humanize.Status.Text_Result;
   --  @param Color CSS color value to render.
   --  @return Deterministic CSS color label for Color.

   procedure Hex_Color_Into
     (Color     : RGB_Color;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Prefix    : Boolean := True;
      Lowercase : Boolean := False);
   --  @param Color RGB color to render.
   --  @param Target Caller-owned output buffer.
   --  @param Written Number of characters written to Target.
   --  @param Status Ok, Buffer_Too_Small, or another rendering status.
   --  @param Prefix Include the leading "#" when True.
   --  @param Lowercase Render hexadecimal digits in lowercase when True.

   procedure RGB_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color to render.
   --  @param Target Caller-owned output buffer.
   --  @param Written Number of characters written to Target.
   --  @param Status Ok, Buffer_Too_Small, or another rendering status.

   procedure RGBA_Label_Into
     (Color   : RGB_Color;
      Opacity : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color to render.
   --  @param Opacity Alpha channel as a fraction from 0.0 to 1.0.
   --  @param Target Caller-owned output buffer.
   --  @param Written Number of characters written to Target.
   --  @param Status Ok, Buffer_Too_Small, or another rendering status.

   procedure CSS_Color_Label_Into
     (Color   : CSS_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color CSS color value to render.
   --  @param Target Caller-owned output buffer.
   --  @param Written Number of characters written to Target.
   --  @param Status Ok, Buffer_Too_Small, or another rendering status.
end Humanize.Colors.CSS;
