with Humanize.Colors.Support;

package body Humanize.Colors.Models is
   package Shared renames Humanize.Colors.Support;

   function HSL
     (Color : RGB_Color)
      return HSL_Color renames Shared.HSL;

   function HSV
     (Color : RGB_Color)
      return HSV_Color renames Shared.HSV;

   function HSL_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.HSL_Label;

   function HSV_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.HSV_Label;

   function Lab
     (Color : RGB_Color)
      return Lab_Color renames Shared.Lab;

   function OKLab
     (Color : RGB_Color)
      return OKLab_Color renames Shared.OKLab;

   function Brightness
     (Color : RGB_Color)
      return Long_Float renames Shared.Brightness;

   function Brightness_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Brightness_Label;

   function Brightness_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Brightness_Label;

   function Relative_Luminance
     (Color : RGB_Color)
      return Long_Float renames Shared.Relative_Luminance;

   function Color_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float renames Shared.Color_Difference;

   function Color_Difference_Label
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Color_Difference_Label;

   function Perceptual_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float renames Shared.Perceptual_Difference;

   function CIE94_Difference
     (Left     : RGB_Color;
      Right    : RGB_Color;
      Textiles : Boolean := False)
      return Long_Float renames Shared.CIE94_Difference;

   function CIEDE2000_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float renames Shared.CIEDE2000_Difference;

   function OK_Perceptual_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float renames Shared.OK_Perceptual_Difference;

   function Perceptual_Difference
     (Left   : RGB_Color;
      Right  : RGB_Color;
      Method : Perceptual_Difference_Method)
      return Long_Float renames Shared.Perceptual_Difference;

   function Perceptual_Difference_Label
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Perceptual_Difference_Label;

   function Perceptual_Difference_Label
     (Left   : RGB_Color;
      Right  : RGB_Color;
      Method : Perceptual_Difference_Method)
      return Humanize.Status.Text_Result renames Shared.Perceptual_Difference_Label;

   procedure HSL_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.HSL_Label_Into;

   procedure HSV_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.HSV_Label_Into;

   procedure Brightness_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Brightness_Label_Into;

   procedure Brightness_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Brightness_Label_Into;

   procedure Color_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Color_Difference_Label_Into;

   procedure Perceptual_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Perceptual_Difference_Label_Into;

   procedure Perceptual_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Method  : Perceptual_Difference_Method;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Perceptual_Difference_Label_Into;
end Humanize.Colors.Models;
