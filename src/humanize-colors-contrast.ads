with Humanize.Contexts;
with Humanize.Status;

package Humanize.Colors.Contrast is

   function Opacity_Label
     (Opacity : Long_Float)
      return Humanize.Status.Text_Result;

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
end Humanize.Colors.Contrast;
