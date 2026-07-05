with Humanize.Status;

package Humanize.Colors is
   subtype Color_Channel is Natural range 0 .. 255;

   type RGB_Color is record
      Red   : Color_Channel := 0;
      Green : Color_Channel := 0;
      Blue  : Color_Channel := 0;
   end record;

   type CSS_Color is record
      Color       : RGB_Color := (others => 0);
      Opacity     : Long_Float := 1.0;
      Has_Opacity : Boolean := False;
      Is_Current  : Boolean := False;
   end record;

   type HSL_Color is record
      Hue        : Long_Float := 0.0;
      Saturation : Long_Float := 0.0;
      Lightness  : Long_Float := 0.0;
   end record;

   type HSV_Color is record
      Hue        : Long_Float := 0.0;
      Saturation : Long_Float := 0.0;
      Value      : Long_Float := 0.0;
   end record;

   type Lab_Color is record
      Lightness : Long_Float := 0.0;
      A         : Long_Float := 0.0;
      B         : Long_Float := 0.0;
   end record;

   type OKLab_Color is record
      Lightness : Long_Float := 0.0;
      A         : Long_Float := 0.0;
      B         : Long_Float := 0.0;
   end record;

   type Color_List is array (Positive range <>) of RGB_Color;

   type Contrast_Level is
     (Contrast_Fail,
      Contrast_Large_Text,
      Contrast_Normal_Text,
      Contrast_Enhanced_Text);

   type Color_Vision_Deficiency is
     (Protanopia,
      Deuteranopia,
      Tritanopia,
      Achromatopsia);

   function Parse_Hex_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code;
   --  @param Text Hex color text with or without '#', using RGB or RRGGBB.
   --  @param Color Parsed RGB color when the result is Ok.
   --  @return Ok for valid hex text, otherwise Invalid_Value.

   function Parse_Named_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code;
   --  @param Text CSS color name such as "rebeccapurple".
   --  @param Color Parsed RGB color when the result is Ok.
   --  @return Ok for a known name, otherwise Invalid_Value.

   function Parse_CSS_Color
     (Text  : String;
      Color : out CSS_Color)
      return Humanize.Status.Status_Code;
   --  @param Text CSS color text: named, currentColor, hex, rgb, hsl, hwb,
   --  lab, lch, oklab, oklch, or color().
   --  @param Color Parsed color and optional opacity.
   --  @return Ok for supported CSS color text, otherwise Invalid_Value.

   function Hex_Color
     (Color   : RGB_Color;
      Prefix  : Boolean := True;
      Lowercase : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @param Prefix True to include '#'.
   --  @param Lowercase True to use lowercase hex digits.
   --  @return Normalized hex label such as "#336699".

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
   --  @param Prefix True to include '#'.
   --  @param Lowercase True to use lowercase hex digits.
   --  @return Normalized hex label such as "#336699".

   function RGB_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return CSS-style RGB label such as "rgb(51, 102, 153)".

   function RGBA_Label
     (Color   : RGB_Color;
      Opacity : Long_Float)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @param Opacity Alpha value, clamped to 0.0 through 1.0.
   --  @return CSS-style RGBA label.

   function CSS_Color_Label
     (Color : CSS_Color)
      return Humanize.Status.Text_Result;
   --  @param Color CSS color with optional opacity.
   --  @return Normalized rgb() or rgba() label.

   function HSL
     (Color : RGB_Color)
      return HSL_Color;
   --  @param Color RGB color.
   --  @return HSL components with saturation/lightness in 0.0 through 1.0.

   function HSV
     (Color : RGB_Color)
      return HSV_Color;
   --  @param Color RGB color.
   --  @return HSV components with saturation/value in 0.0 through 1.0.

   function HSL_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return CSS-style HSL label such as "hsl(210, 50%, 40%)".

   function HSV_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Deterministic HSV label.

   function Lab
     (Color : RGB_Color)
      return Lab_Color;
   --  @param Color RGB color.
   --  @return CIE Lab components using D50 reference white.

   function OKLab
     (Color : RGB_Color)
      return OKLab_Color;
   --  @param Color RGB color.
   --  @return OKLab perceptual components.

   function Hue_Family_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Hue family label such as "blue" or "neutral".

   function Saturation_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Saturation bucket such as "muted" or "vivid".

   function Temperature_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Warm/cool/neutral color-temperature label.

   function Chroma_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Chroma style label such as "pastel" or "vivid".

   function Color_Description
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Combined perceptual color description.

   function Nearest_Color_Name
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Nearest basic CSS color name by RGB distance.

   function Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Colors Palette colors.
   --  @return Count, nearest dominant color name, and brightness spread.

   function Palette_Roles
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Colors Palette colors.
   --  @return Background/accent/text role suggestion.

   function Palette_Harmony_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Colors Palette colors.
   --  @return Harmony label such as monochrome or complementary.

   function Palette_Contrast_Suggestion
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Colors Palette colors.
   --  @return Best contrast pair suggestion.

   function Palette_Accessibility_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Colors Palette colors.
   --  @return Accessibility coverage warning or pass label.

   function Palette_Contrast_Matrix_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Colors Palette colors.
   --  @return Pair-count summary across fail, large, normal, and enhanced text.

   function Palette_Mood_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Colors Palette colors.
   --  @return Palette mood label.

   function Advanced_Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Colors Palette colors.
   --  @return Combined harmony, mood, roles, and accessibility summary.

   function Color_Summary
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Combined hex and RGB summary.

   function Brightness
     (Color : RGB_Color)
      return Long_Float;
   --  @param Color RGB color.
   --  @return Perceived brightness from 0.0 through 1.0.

   function Brightness_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Brightness bucket such as "dark" or "very light".

   function Opacity_Label
     (Opacity : Long_Float)
      return Humanize.Status.Text_Result;
   --  @param Opacity Opacity value, clamped to 0.0 through 1.0.
   --  @return Label such as "50% translucent" or "100% opaque".

   function Relative_Luminance
     (Color : RGB_Color)
      return Long_Float;
   --  @param Color RGB color.
   --  @return WCAG relative luminance.

   function Contrast_Ratio
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Long_Float;
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @return WCAG contrast ratio, 1.0 through 21.0.

   function Contrast_Level_For
     (Ratio : Long_Float)
      return Contrast_Level;
   --  @param Ratio WCAG contrast ratio.
   --  @return Contrast level bucket.

   function Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @return Ratio and contrast level label.

   function Readability_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @return Text-readability summary for the color pair.

   function APCA_Contrast
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Long_Float;
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @return Deterministic APCA-style lightness contrast, signed by polarity.

   function APCA_Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @return APCA-style contrast strength and polarity label.

   function Color_Vision_Deficiency_Label
     (Left       : RGB_Color;
      Right      : RGB_Color;
      Deficiency : Color_Vision_Deficiency)
      return Humanize.Status.Text_Result;
   --  @param Left First color.
   --  @param Right Second color.
   --  @param Deficiency Color-vision-deficiency simulation to summarize.
   --  @return Risk label for distinguishing the pair under the deficiency.

   function Color_Accessibility_Summary
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @return Combined WCAG, APCA-style, and CVD risk summary.

   function Color_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float;
   --  @param Left First color.
   --  @param Right Second color.
   --  @return Euclidean RGB distance normalized to 0.0 through 100.0.

   function Color_Difference_Label
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Left First color.
   --  @param Right Second color.
   --  @return Human label for the color difference.

   function Perceptual_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float;
   --  @param Left First color.
   --  @param Right Second color.
   --  @return CIE76 Delta-E style difference in Lab space.

   function OK_Perceptual_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float;
   --  @param Left First color.
   --  @param Right Second color.
   --  @return OKLab Euclidean difference scaled to Delta-E style units.

   function Perceptual_Difference_Label
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Left First color.
   --  @param Right Second color.
   --  @return Human label for perceptual color difference.

   procedure Hex_Color_Into
     (Color     : RGB_Color;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Prefix    : Boolean := True;
      Lowercase : Boolean := False);
   --  @param Color RGB color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Prefix True to include '#'.
   --  @param Lowercase True to use lowercase hex digits.

   procedure RGB_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure RGBA_Label_Into
     (Color   : RGB_Color;
      Opacity : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color.
   --  @param Opacity Alpha value, clamped to 0.0 through 1.0.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure CSS_Color_Label_Into
     (Color   : CSS_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color CSS color with optional opacity.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure HSL_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure HSV_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Hue_Family_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Saturation_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Temperature_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Chroma_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Color_Description_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Nearest_Color_Name_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Colors Palette colors.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Roles_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Colors Palette colors.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Harmony_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Colors Palette colors.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Contrast_Suggestion_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Colors Palette colors.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Accessibility_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Colors Palette colors.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Contrast_Matrix_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Colors Palette colors.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Mood_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Colors Palette colors.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Advanced_Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Colors Palette colors.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Color_Summary_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Brightness_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Opacity_Label_Into
     (Opacity : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Opacity Opacity value, clamped to 0.0 through 1.0.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Readability_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure APCA_Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Color_Vision_Deficiency_Label_Into
     (Left       : RGB_Color;
      Right      : RGB_Color;
      Deficiency : Color_Vision_Deficiency;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Left First color.
   --  @param Right Second color.
   --  @param Deficiency Color-vision-deficiency simulation to summarize.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Color_Accessibility_Summary_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Color_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Left First color.
   --  @param Right Second color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Perceptual_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Left First color.
   --  @param Right Second color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Colors;
