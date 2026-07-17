with Humanize.Contexts;
with Humanize.Status;

private package Humanize.Colors.Support.Backend is
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
   function HSL
     (Color : RGB_Color)
      return HSL_Color;
   function HSV
     (Color : RGB_Color)
      return HSV_Color;
   function HSL_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   function HSV_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   function Lab
     (Color : RGB_Color)
      return Lab_Color;
   function OKLab
     (Color : RGB_Color)
      return OKLab_Color;
   function Hue_Family_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   function Hue_Family_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   function Saturation_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   function Saturation_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   function Temperature_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   function Temperature_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   function Chroma_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   function Chroma_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   function Color_Description
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   function Color_Description
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   function Nearest_Color_Name
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   function Descriptive_Color_Name
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   function Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   function Palette_Roles
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   function Palette_Harmony_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   function Palette_Contrast_Suggestion
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   function Palette_Accessibility_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   function Palette_Contrast_Matrix_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   function Palette_Metadata_For
     (Colors : Color_List)
      return Palette_Metadata;
   function Palette_Metadata_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   function Palette_Mood_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   function Advanced_Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result;
   function Color_Summary
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   function Brightness
     (Color : RGB_Color)
      return Long_Float;
   function Brightness_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result;
   function Brightness_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   function Opacity_Label
     (Opacity : Long_Float)
      return Humanize.Status.Text_Result;
   function Relative_Luminance
     (Color : RGB_Color)
      return Long_Float;
   function Contrast_Ratio
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Long_Float;
   function Composite
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return RGB_Color;
   function Alpha_Contrast_Ratio
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return Long_Float;
   function Alpha_Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return Humanize.Status.Text_Result;
   function Contrast_Level_For
     (Ratio : Long_Float)
      return Contrast_Level;
   function Contrast_Metadata_For
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Contrast_Metadata;
   function Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   function Contrast_Label
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   function Readability_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   function Readability_Label
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   function APCA_Contrast
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Long_Float;
   function APCA_Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   function Color_Vision_Deficiency_Label
     (Left       : RGB_Color;
      Right      : RGB_Color;
      Deficiency : Color_Vision_Deficiency)
      return Humanize.Status.Text_Result;
   function Color_Accessibility_Summary
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result;
   function Accessible_Foreground
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : Contrast_Target := Target_Normal_Text)
      return Color_Remediation_Result;
   function Contrast_Remediation_Label
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : Contrast_Target := Target_Normal_Text)
      return Humanize.Status.Text_Result;
   function Color_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float;
   function Color_Difference_Label
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Humanize.Status.Text_Result;
   function Perceptual_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float;
   function CIE94_Difference
     (Left     : RGB_Color;
      Right    : RGB_Color;
      Textiles : Boolean := False)
      return Long_Float;
   function CIEDE2000_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float;
   function OK_Perceptual_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float;
   function Perceptual_Difference
     (Left   : RGB_Color;
      Right  : RGB_Color;
      Method : Perceptual_Difference_Method)
      return Long_Float;
   function Perceptual_Difference_Label
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Humanize.Status.Text_Result;
   function Perceptual_Difference_Label
     (Left   : RGB_Color;
      Right  : RGB_Color;
      Method : Perceptual_Difference_Method)
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
   procedure HSL_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure HSV_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Hue_Family_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Hue_Family_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Saturation_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Saturation_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Temperature_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Temperature_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Chroma_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Chroma_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Color_Description_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Color_Description_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Nearest_Color_Name_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Palette_Roles_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Palette_Harmony_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Palette_Contrast_Suggestion_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Palette_Accessibility_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Palette_Contrast_Matrix_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Palette_Metadata_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Palette_Mood_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Advanced_Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Color_Summary_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Brightness_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Brightness_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Opacity_Label_Into
     (Opacity : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   procedure Alpha_Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   procedure Contrast_Label_Into
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   procedure Readability_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   procedure Readability_Label_Into
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   procedure APCA_Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   procedure Color_Vision_Deficiency_Label_Into
     (Left       : RGB_Color;
      Right      : RGB_Color;
      Deficiency : Color_Vision_Deficiency;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   procedure Color_Accessibility_Summary_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   procedure Contrast_Remediation_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Goal       : Contrast_Target := Target_Normal_Text);
   procedure Color_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Perceptual_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Perceptual_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Method  : Perceptual_Difference_Method;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Descriptive_Color_Name_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
end Humanize.Colors.Support.Backend;
