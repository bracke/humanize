with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Colors.Contrast.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function APCA_Contrast_Label
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Contrast.APCA_Contrast_Label (Foreground => Foreground, Background => Background);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.contrast.apca_contrast_label", English);
   end APCA_Contrast_Label;

   function Alpha_Contrast_Label
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Alpha      : Long_Float)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Contrast.Alpha_Contrast_Label (Foreground => Foreground, Background => Background, Alpha => Alpha);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.contrast.alpha_contrast_label", English);
   end Alpha_Contrast_Label;

   function Color_Accessibility_Summary
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Contrast.Color_Accessibility_Summary (Foreground => Foreground, Background => Background);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.contrast.color_accessibility_summary", English, "; ");
   end Color_Accessibility_Summary;

   function Color_Vision_Deficiency_Label
      (Context    : Humanize.Contexts.Context;
       Left       : RGB_Color;
       Right      : RGB_Color;
       Deficiency : Color_Vision_Deficiency)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Contrast.Color_Vision_Deficiency_Label (Left => Left, Right => Right, Deficiency => Deficiency);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.contrast.color_vision_deficiency_label", English);
   end Color_Vision_Deficiency_Label;

   function Contrast_Label
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Contrast.Contrast_Label (Foreground => Foreground, Background => Background);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.contrast.contrast_label", English);
   end Contrast_Label;

   function Contrast_Remediation_Label
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Target     : Contrast_Target := Target_Normal_Text)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Contrast.Contrast_Remediation_Label
          (Foreground => Foreground,
           Background => Background,
           Target => Target);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.contrast.contrast_remediation_label", English);
   end Contrast_Remediation_Label;

   function Opacity_Label
      (Context : Humanize.Contexts.Context;
       Opacity : Long_Float)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Contrast.Opacity_Label (Opacity => Opacity);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.contrast.opacity_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "percent", Humanize.Label_Values.Percent (Context,
        Humanize.Label_Values.Clamp (Opacity) * 100.0));
      Selection := Sel.With_Arg (Selection, "state", (if Humanize.Label_Values.Clamp (Opacity) = 0.0 then
        "transparent" elsif Humanize.Label_Values.Clamp (Opacity) < 0.25 then "mostly_transparent" elsif
        Humanize.Label_Values.Clamp (Opacity) < 0.75 then "translucent" elsif Humanize.Label_Values.Clamp (Opacity) <
        1.0 then "mostly_opaque" else "opaque"));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Opacity_Label;

   function Readability_Label
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Contrast.Readability_Label (Foreground => Foreground, Background => Background);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.contrast.readability_label", English);
   end Readability_Label;

   procedure APCA_Contrast_Label_Into
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (APCA_Contrast_Label (Context, Foreground => Foreground, Background => Background),
         Target, Written, Status);
   end APCA_Contrast_Label_Into;

   procedure Alpha_Contrast_Label_Into
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Alpha      : Long_Float;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Alpha_Contrast_Label (Context, Foreground => Foreground, Background => Background, Alpha => Alpha),
         Target, Written, Status);
   end Alpha_Contrast_Label_Into;

   procedure Color_Accessibility_Summary_Into
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Color_Accessibility_Summary (Context, Foreground => Foreground, Background => Background),
         Target, Written, Status);
   end Color_Accessibility_Summary_Into;

   procedure Color_Vision_Deficiency_Label_Into
      (Context    : Humanize.Contexts.Context;
       Left       : RGB_Color;
       Right      : RGB_Color;
       Deficiency : Color_Vision_Deficiency;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Color_Vision_Deficiency_Label (Context, Left => Left, Right => Right, Deficiency => Deficiency),
         Target, Written, Status);
   end Color_Vision_Deficiency_Label_Into;

   procedure Contrast_Label_Into
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Contrast_Label (Context, Foreground => Foreground, Background => Background),
         Target, Written, Status);
   end Contrast_Label_Into;

   procedure Opacity_Label_Into
      (Context : Humanize.Contexts.Context;
       Opacity : Long_Float;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Opacity_Label (Context, Opacity => Opacity), Target, Written, Status);
   end Opacity_Label_Into;

   procedure Readability_Label_Into
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Readability_Label (Context, Foreground => Foreground, Background => Background),
         Target, Written, Status);
   end Readability_Label_Into;

end Humanize.Colors.Contrast.Localized;
