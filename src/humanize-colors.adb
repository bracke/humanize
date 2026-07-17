with Humanize.Colors.CSS;
with Humanize.Colors.Models;
with Humanize.Colors.Names;
with Humanize.Colors.Contrast;
with Humanize.Colors.Palettes;

package body Humanize.Colors is
   package Color_CSS renames Humanize.Colors.CSS;
   package Color_Models renames Humanize.Colors.Models;
   package Color_Names renames Humanize.Colors.Names;
   package Color_Contrast renames Humanize.Colors.Contrast;
   package Color_Palettes renames Humanize.Colors.Palettes;

   function Parse_Hex_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code renames Color_CSS.Parse_Hex_Color;

   function Parse_Named_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code renames Color_CSS.Parse_Named_Color;

   function Parse_CSS_Color
     (Text  : String;
      Color : out CSS_Color)
      return Humanize.Status.Status_Code renames Color_CSS.Parse_CSS_Color;

   function Hex_Color
     (Color   : RGB_Color;
      Prefix  : Boolean := True;
      Lowercase : Boolean := False)
      return Humanize.Status.Text_Result renames Color_CSS.Hex_Color;

   function Hex_Color
     (Red     : Color_Channel;
      Green   : Color_Channel;
      Blue    : Color_Channel;
      Prefix  : Boolean := True;
      Lowercase : Boolean := False)
      return Humanize.Status.Text_Result renames Color_CSS.Hex_Color;

   function RGB_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Color_CSS.RGB_Label;

   function RGBA_Label
     (Color   : RGB_Color;
      Opacity : Long_Float)
      return Humanize.Status.Text_Result renames Color_CSS.RGBA_Label;

   function CSS_Color_Label
     (Color : CSS_Color)
      return Humanize.Status.Text_Result renames Color_CSS.CSS_Color_Label;

   function HSL
     (Color : RGB_Color)
      return HSL_Color renames Color_Models.HSL;

   function HSV
     (Color : RGB_Color)
      return HSV_Color renames Color_Models.HSV;

   function HSL_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Models.HSL_Label;

   function HSV_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Models.HSV_Label;

   function Lab
     (Color : RGB_Color)
      return Lab_Color renames Color_Models.Lab;

   function OKLab
     (Color : RGB_Color)
      return OKLab_Color renames Color_Models.OKLab;

   function Hue_Family_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Names.Hue_Family_Label;

   function Hue_Family_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Names.Hue_Family_Label;

   function Saturation_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Names.Saturation_Label;

   function Saturation_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Names.Saturation_Label;

   function Temperature_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Names.Temperature_Label;

   function Temperature_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Names.Temperature_Label;

   function Chroma_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Names.Chroma_Label;

   function Chroma_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Names.Chroma_Label;

   function Color_Description
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Names.Color_Description;

   function Color_Description
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Names.Color_Description;

   function Nearest_Color_Name
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Names.Nearest_Color_Name;

   function Descriptive_Color_Name
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Names.Descriptive_Color_Name;

   function Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Color_Palettes.Palette_Summary;

   function Palette_Roles
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Color_Palettes.Palette_Roles;

   function Palette_Harmony_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Color_Palettes.Palette_Harmony_Label;

   function Palette_Contrast_Suggestion
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Color_Palettes.Palette_Contrast_Suggestion;

   function Palette_Accessibility_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Color_Palettes.Palette_Accessibility_Label;

   function Palette_Contrast_Matrix_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Color_Palettes.Palette_Contrast_Matrix_Label;

   function Palette_Metadata_For
     (Colors : Color_List)
      return Palette_Metadata renames Color_Palettes.Palette_Metadata_For;

   function Palette_Metadata_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Color_Palettes.Palette_Metadata_Label;

   function Palette_Mood_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Color_Palettes.Palette_Mood_Label;

   function Advanced_Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Color_Palettes.Advanced_Palette_Summary;

   function Color_Summary
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Names.Color_Summary;

   function Brightness
     (Color : RGB_Color)
      return Long_Float renames Color_Models.Brightness;

   function Brightness_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Models.Brightness_Label;

   function Brightness_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Models.Brightness_Label;

   function Opacity_Label
     (Opacity : Long_Float)
      return Humanize.Status.Text_Result renames Color_Contrast.Opacity_Label;

   function Relative_Luminance
     (Color : RGB_Color)
      return Long_Float renames Color_Models.Relative_Luminance;

   function Contrast_Ratio
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Long_Float renames Color_Contrast.Contrast_Ratio;

   function Composite
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return RGB_Color renames Color_Contrast.Composite;

   function Alpha_Contrast_Ratio
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return Long_Float renames Color_Contrast.Alpha_Contrast_Ratio;

   function Alpha_Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return Humanize.Status.Text_Result renames Color_Contrast.Alpha_Contrast_Label;

   function Contrast_Level_For
     (Ratio : Long_Float)
      return Contrast_Level renames Color_Contrast.Contrast_Level_For;

   function Contrast_Metadata_For
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Contrast_Metadata renames Color_Contrast.Contrast_Metadata_For;

   function Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Contrast.Contrast_Label;

   function Contrast_Label
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Contrast.Contrast_Label;

   function Readability_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Contrast.Readability_Label;

   function Readability_Label
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Contrast.Readability_Label;

   function APCA_Contrast
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Long_Float renames Color_Contrast.APCA_Contrast;

   function APCA_Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Contrast.APCA_Contrast_Label;

   function Color_Vision_Deficiency_Label
     (Left       : RGB_Color;
      Right      : RGB_Color;
      Deficiency : Color_Vision_Deficiency)
      return Humanize.Status.Text_Result renames Color_Contrast.Color_Vision_Deficiency_Label;

   function Color_Accessibility_Summary
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Contrast.Color_Accessibility_Summary;

   function Accessible_Foreground
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : Contrast_Target := Target_Normal_Text)
      return Color_Remediation_Result renames Color_Contrast.Accessible_Foreground;

   function Contrast_Remediation_Label
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : Contrast_Target := Target_Normal_Text)
      return Humanize.Status.Text_Result renames Color_Contrast.Contrast_Remediation_Label;

   function Color_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float renames Color_Models.Color_Difference;

   function Color_Difference_Label
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Models.Color_Difference_Label;

   function Perceptual_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float renames Color_Models.Perceptual_Difference;

   function CIE94_Difference
     (Left     : RGB_Color;
      Right    : RGB_Color;
      Textiles : Boolean := False)
      return Long_Float renames Color_Models.CIE94_Difference;

   function CIEDE2000_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float renames Color_Models.CIEDE2000_Difference;

   function OK_Perceptual_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float renames Color_Models.OK_Perceptual_Difference;

   function Perceptual_Difference
     (Left   : RGB_Color;
      Right  : RGB_Color;
      Method : Perceptual_Difference_Method)
      return Long_Float renames Color_Models.Perceptual_Difference;

   function Perceptual_Difference_Label
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Humanize.Status.Text_Result renames Color_Models.Perceptual_Difference_Label;

   function Perceptual_Difference_Label
     (Left   : RGB_Color;
      Right  : RGB_Color;
      Method : Perceptual_Difference_Method)
      return Humanize.Status.Text_Result renames Color_Models.Perceptual_Difference_Label;

   procedure Hex_Color_Into
     (Color     : RGB_Color;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Prefix    : Boolean := True;
      Lowercase : Boolean := False) renames Color_CSS.Hex_Color_Into;

   procedure RGB_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_CSS.RGB_Label_Into;

   procedure RGBA_Label_Into
     (Color   : RGB_Color;
      Opacity : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_CSS.RGBA_Label_Into;

   procedure CSS_Color_Label_Into
     (Color   : CSS_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_CSS.CSS_Color_Label_Into;

   procedure HSL_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Models.HSL_Label_Into;

   procedure HSV_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Models.HSV_Label_Into;

   procedure Hue_Family_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Names.Hue_Family_Label_Into;

   procedure Hue_Family_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Names.Hue_Family_Label_Into;

   procedure Saturation_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Names.Saturation_Label_Into;

   procedure Saturation_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Names.Saturation_Label_Into;

   procedure Temperature_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Names.Temperature_Label_Into;

   procedure Temperature_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Names.Temperature_Label_Into;

   procedure Chroma_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Names.Chroma_Label_Into;

   procedure Chroma_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Names.Chroma_Label_Into;

   procedure Color_Description_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Names.Color_Description_Into;

   procedure Color_Description_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Names.Color_Description_Into;

   procedure Nearest_Color_Name_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Names.Nearest_Color_Name_Into;

   procedure Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Palettes.Palette_Summary_Into;

   procedure Palette_Roles_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Palettes.Palette_Roles_Into;

   procedure Palette_Harmony_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Palettes.Palette_Harmony_Label_Into;

   procedure Palette_Contrast_Suggestion_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Palettes.Palette_Contrast_Suggestion_Into;

   procedure Palette_Accessibility_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Palettes.Palette_Accessibility_Label_Into;

   procedure Palette_Contrast_Matrix_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Palettes.Palette_Contrast_Matrix_Label_Into;

   procedure Palette_Metadata_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Palettes.Palette_Metadata_Label_Into;

   procedure Palette_Mood_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Palettes.Palette_Mood_Label_Into;

   procedure Advanced_Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Palettes.Advanced_Palette_Summary_Into;

   procedure Color_Summary_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Names.Color_Summary_Into;

   procedure Brightness_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Models.Brightness_Label_Into;

   procedure Brightness_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Models.Brightness_Label_Into;

   procedure Opacity_Label_Into
     (Opacity : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Contrast.Opacity_Label_Into;

   procedure Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code) renames Color_Contrast.Contrast_Label_Into;

   procedure Alpha_Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code) renames Color_Contrast.Alpha_Contrast_Label_Into;

   procedure Contrast_Label_Into
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code) renames Color_Contrast.Contrast_Label_Into;

   procedure Readability_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code) renames Color_Contrast.Readability_Label_Into;

   procedure Readability_Label_Into
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code) renames Color_Contrast.Readability_Label_Into;

   procedure APCA_Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code) renames Color_Contrast.APCA_Contrast_Label_Into;

   procedure Color_Vision_Deficiency_Label_Into
     (Left       : RGB_Color;
      Right      : RGB_Color;
      Deficiency : Color_Vision_Deficiency;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code) renames Color_Contrast.Color_Vision_Deficiency_Label_Into;

   procedure Color_Accessibility_Summary_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code) renames Color_Contrast.Color_Accessibility_Summary_Into;

   procedure Contrast_Remediation_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Goal       : Contrast_Target := Target_Normal_Text) renames Color_Contrast.Contrast_Remediation_Label_Into;

   procedure Color_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Models.Color_Difference_Label_Into;

   procedure Perceptual_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Models.Perceptual_Difference_Label_Into;

   procedure Perceptual_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Method  : Perceptual_Difference_Method;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Models.Perceptual_Difference_Label_Into;

   procedure Descriptive_Color_Name_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Color_Names.Descriptive_Color_Name_Into;
end Humanize.Colors;
