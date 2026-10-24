with Humanize.Bounded_Text;
with Humanize.Label_Values;

package body Humanize.Colors.Models.Localized is

   function Brightness_Label
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Models.Brightness_Label (Color => Color);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.models.brightness_label", English);
   end Brightness_Label;

   function Color_Difference_Label
      (Context : Humanize.Contexts.Context;
       Left    : RGB_Color;
       Right   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Models.Color_Difference_Label (Left => Left, Right => Right);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.models.color_difference_label", English);
   end Color_Difference_Label;

   function Perceptual_Difference_Label
      (Context : Humanize.Contexts.Context;
       Left    : RGB_Color;
       Right   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Models.Perceptual_Difference_Label (Left => Left, Right => Right);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.models.perceptual_difference_label", English);
   end Perceptual_Difference_Label;

   function Perceptual_Difference_Label
      (Context : Humanize.Contexts.Context;
       Left    : RGB_Color;
       Right   : RGB_Color;
       Method  : Perceptual_Difference_Method)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Models.Perceptual_Difference_Label (Left => Left, Right => Right, Method => Method);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.models.perceptual_difference_label", English);
   end Perceptual_Difference_Label;

   procedure Brightness_Label_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Brightness_Label (Context, Color => Color), Target, Written, Status);
   end Brightness_Label_Into;

   procedure Color_Difference_Label_Into
      (Context : Humanize.Contexts.Context;
       Left    : RGB_Color;
       Right   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Color_Difference_Label (Context, Left => Left, Right => Right),
         Target, Written, Status);
   end Color_Difference_Label_Into;

   procedure Perceptual_Difference_Label_Into
      (Context : Humanize.Contexts.Context;
       Left    : RGB_Color;
       Right   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Perceptual_Difference_Label (Context, Left => Left, Right => Right),
         Target, Written, Status);
   end Perceptual_Difference_Label_Into;

   procedure Perceptual_Difference_Label_Into
      (Context : Humanize.Contexts.Context;
       Left    : RGB_Color;
       Right   : RGB_Color;
       Method  : Perceptual_Difference_Method;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Perceptual_Difference_Label (Context, Left => Left, Right => Right, Method => Method),
         Target, Written, Status);
   end Perceptual_Difference_Label_Into;

end Humanize.Colors.Models.Localized;
