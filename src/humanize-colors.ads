with Humanize.Contexts;
with Humanize.Status;

--  Color value types and facade helpers for labels, contrast, CSS, and
--  palette-oriented formatting.
package Humanize.Colors is
   --  Facade map:
   --  * Humanize.Colors.Contrast: contrast ratios, APCA, accessibility, and remediation helpers.
   --  * Humanize.Colors.CSS: CSS color parsing and rendering helpers.
   --  * Humanize.Colors.Models: color-model conversion helpers.
   --  * Humanize.Colors.Names: color name and description helpers.
   --  * Humanize.Colors.Palettes: palette analysis, role, and mood helpers.

   --  Facade section: shared color types, metadata, labels, and bounded output adapters.
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

   type Contrast_Target is
     (Target_Large_Text,
      Target_Normal_Text,
      Target_Enhanced_Text);

   type Color_Remediation_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Color  : RGB_Color := (others => 0);
      Ratio  : Long_Float := 1.0;
   end record;

   type Contrast_Level is
     (Contrast_Fail,
      Contrast_Large_Text,
      Contrast_Normal_Text,
      Contrast_Enhanced_Text);

   type Contrast_Metadata is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Ratio  : Long_Float := 1.0;
      Level  : Contrast_Level := Contrast_Fail;
      Passes_Large_Text : Boolean := False;
      Passes_Normal_Text : Boolean := False;
      Passes_Enhanced_Text : Boolean := False;
   end record;

   type Palette_Metadata is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Color_Count : Natural := 0;
      Pair_Count : Natural := 0;
      Failing_Pairs : Natural := 0;
      Large_Text_Pairs : Natural := 0;
      Normal_Text_Pairs : Natural := 0;
      Enhanced_Text_Pairs : Natural := 0;
      Best_Contrast_Ratio : Long_Float := 1.0;
      Worst_Contrast_Ratio : Long_Float := 1.0;
   end record;

   type Color_Vision_Deficiency is
     (Protanopia,
      Deuteranopia,
      Tritanopia,
      Achromatopsia);

   type Perceptual_Difference_Method is
     (Perceptual_CIE76,
      Perceptual_CIE94_Graphic_Arts,
      Perceptual_CIE94_Textiles,
      Perceptual_CIEDE2000,
      Perceptual_OKLab);

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

   function Hue_Family_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color RGB color.
   --  @return Localized hue family label such as "blue" or "neutral".

   function Saturation_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Saturation bucket such as "muted" or "vivid".

   function Saturation_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color RGB color.
   --  @return Localized saturation bucket such as "muted" or "vivid".

   function Temperature_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Warm/cool/neutral color-temperature label.

   function Temperature_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color RGB color.
   --  @return Localized warm/cool/neutral color-temperature label.

   function Chroma_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Chroma style label such as "pastel" or "vivid".

   function Chroma_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color RGB color.
   --  @return Localized chroma style label such as "pastel" or "vivid".

   function Color_Description
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Combined perceptual color description.

   function Color_Description
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color RGB color.
   --  @return Localized combined perceptual color description.

   function Nearest_Color_Name
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Nearest basic CSS color name by RGB distance.

   function Descriptive_Color_Name
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Color RGB color.
   --  @return Rich deterministic color name from tone, temperature, and nearest color.

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

   function Palette_Metadata_For
     (Colors : Color_List)
      return Palette_Metadata;
   --  @param Colors Palette colors.
   --  @return Structured contrast metadata for all palette pairs.

   function Palette_Metadata_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Colors Palette colors.
   --  @return Deterministic summary of structured palette contrast metadata.

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

   function Brightness_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color RGB color.
   --  @return Localized brightness bucket such as "dark" or "very light".

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

   function Composite
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return RGB_Color;
   --  @param Foreground Source foreground color.
   --  @param Background Destination background color.
   --  @param Alpha Foreground opacity, clamped to 0.0 through 1.0.
   --  @return RGB result after alpha compositing over Background.

   function Alpha_Contrast_Ratio
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return Long_Float;
   --  @param Foreground Source foreground color.
   --  @param Background Destination background color.
   --  @param Alpha Foreground opacity, clamped to 0.0 through 1.0.
   --  @return WCAG contrast ratio after compositing Foreground over Background.

   function Alpha_Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return Humanize.Status.Text_Result;
   --  @param Foreground Source foreground color.
   --  @param Background Destination background color.
   --  @param Alpha Foreground opacity, clamped to 0.0 through 1.0.
   --  @return Ratio and contrast level label after alpha compositing.

   function Contrast_Level_For
     (Ratio : Long_Float)
      return Contrast_Level;
   --  @param Ratio WCAG contrast ratio.
   --  @return Contrast level bucket.

   function Contrast_Metadata_For
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Contrast_Metadata;
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @return Machine-readable contrast ratio and pass-level metadata.

   function Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @return Ratio and contrast level label.

   function Contrast_Label
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @return Ratio and localized contrast level label.

   function Readability_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @return Text-readability summary for the color pair.

   function Readability_Label
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Foreground Foreground color.
   --  @param Background Background color.
   --  @return Localized text-readability summary for the color pair.

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

   function Accessible_Foreground
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : Contrast_Target := Target_Normal_Text)
      return Color_Remediation_Result;
   --  @param Foreground Starting foreground color.
   --  @param Background Background color.
   --  @param Target WCAG contrast target.
   --  @return Adjusted foreground and contrast ratio.

   function Contrast_Remediation_Label
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : Contrast_Target := Target_Normal_Text)
      return Humanize.Status.Text_Result;
   --  @param Foreground Starting foreground color.
   --  @param Background Background color.
   --  @param Target WCAG contrast target.
   --  @return Suggestion for meeting the target contrast.

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

   function CIE94_Difference
     (Left     : RGB_Color;
      Right    : RGB_Color;
      Textiles : Boolean := False)
      return Long_Float;
   --  @param Left First color.
   --  @param Right Second color.
   --  @param Textiles Use the textile weighting variant when true.
   --  @return CIE94 Delta-E difference.

   function CIEDE2000_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float;
   --  @param Left First color.
   --  @param Right Second color.
   --  @return CIEDE2000 Delta-E difference.

   function OK_Perceptual_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float;
   --  @param Left First color.
   --  @param Right Second color.
   --  @return OKLab Euclidean difference scaled to Delta-E style units.

   function Perceptual_Difference
     (Left   : RGB_Color;
      Right  : RGB_Color;
      Method : Perceptual_Difference_Method)
      return Long_Float;
   --  @param Left First color.
   --  @param Right Second color.
   --  @param Method Perceptual difference algorithm.
   --  @return Difference in the selected perceptual metric.

   function Perceptual_Difference_Label
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Left First color.
   --  @param Right Second color.
   --  @return Human label for perceptual color difference.

   function Perceptual_Difference_Label
     (Left   : RGB_Color;
      Right  : RGB_Color;
      Method : Perceptual_Difference_Method)
      return Humanize.Status.Text_Result;
   --  @param Left First color.
   --  @param Right Second color.
   --  @param Method Perceptual difference algorithm.
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

   procedure Hue_Family_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
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

   procedure Saturation_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
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

   procedure Temperature_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
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

   procedure Chroma_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
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

   procedure Color_Description_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
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

   procedure Palette_Metadata_Label_Into
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

   procedure Brightness_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
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

   procedure Alpha_Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Foreground Source foreground color.
   --  @param Background Destination background color.
   --  @param Alpha Foreground opacity, clamped to 0.0 through 1.0.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Contrast_Label_Into
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
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

   procedure Readability_Label_Into
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
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

   procedure Contrast_Remediation_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Goal       : Contrast_Target := Target_Normal_Text);
   --  @param Foreground Starting foreground color.
   --  @param Background Background color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Goal WCAG contrast target.

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

   procedure Perceptual_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Method  : Perceptual_Difference_Method;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Left First color.
   --  @param Right Second color.
   --  @param Method Perceptual difference algorithm.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Descriptive_Color_Name_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Color RGB color.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Colors;
