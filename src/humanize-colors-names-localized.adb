with Humanize.Bounded_Text;
with Humanize.Colors.Models;
with Humanize.Colors.Models.Localized;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Colors.Names.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Chroma_Label
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Names.Chroma_Label (Color => Color);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.names.chroma_label", English);
   end Chroma_Label;

   function Color_Description
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Names.Color_Description (Color => Color);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.names.color_description");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "brightness", Humanize.Label_Values.Text_Of
        (Humanize.Colors.Models.Localized.Brightness_Label (Context, Color)));
      Selection := Sel.With_Arg (Selection, "saturation", Humanize.Label_Values.Text_Of (Saturation_Label (Context,
        Color)));
      Selection := Sel.With_Arg (Selection, "hue", Humanize.Label_Values.Text_Of (Hue_Family_Label (Context, Color)));
      Selection := Sel.With_Arg (Selection, "temperature", Humanize.Label_Values.Text_Of (Temperature_Label (Context,
        Color)));
      Selection := Sel.With_Arg (Selection, "chroma", Humanize.Label_Values.Text_Of (Chroma_Label (Context, Color)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Color_Description;

   function Descriptive_Color_Name
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Names.Descriptive_Color_Name (Color => Color);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.names.descriptive_color_name");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "brightness", Humanize.Label_Values.Text_Of
        (Humanize.Colors.Models.Localized.Brightness_Label (Context, Color)));
      Selection := Sel.With_Arg (Selection, "chroma", Humanize.Label_Values.Text_Of (Chroma_Label (Context, Color)));
      Selection := Sel.With_Arg (Selection, "temperature", Humanize.Label_Values.Text_Of (Temperature_Label (Context,
        Color)));
      Selection := Sel.With_Arg (Selection, "base", (if Humanize.Label_Values.Text_Of (Names.Hue_Family_Label (Color))
        = "red" and then Humanize.Label_Values.Text_Of (Humanize.Colors.Models.Brightness_Label (Color)) in "light" |
        "very light" and then Humanize.Label_Values.Text_Of (Names.Chroma_Label (Color)) = "pastel" then "pink" else
        "hue"));
      Selection := Sel.With_Arg (Selection, "hue", Humanize.Label_Values.Text_Of (Hue_Family_Label (Context, Color)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Descriptive_Color_Name;

   function Hue_Family_Label
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Names.Hue_Family_Label (Color => Color);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.names.hue_family_label", English);
   end Hue_Family_Label;

   function Nearest_Color_Name
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Names.Nearest_Color_Name (Color => Color);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.names.nearest_color_name", English);
   end Nearest_Color_Name;

   function Saturation_Label
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Names.Saturation_Label (Color => Color);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.names.saturation_label", English);
   end Saturation_Label;

   function Temperature_Label
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Names.Temperature_Label (Color => Color);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.names.temperature_label", English);
   end Temperature_Label;

   procedure Chroma_Label_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Chroma_Label (Context, Color => Color), Target, Written, Status);
   end Chroma_Label_Into;

   procedure Color_Description_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Color_Description (Context, Color => Color), Target, Written, Status);
   end Color_Description_Into;

   procedure Descriptive_Color_Name_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Descriptive_Color_Name (Context, Color => Color), Target, Written, Status);
   end Descriptive_Color_Name_Into;

   procedure Hue_Family_Label_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Hue_Family_Label (Context, Color => Color), Target, Written, Status);
   end Hue_Family_Label_Into;

   procedure Nearest_Color_Name_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Nearest_Color_Name (Context, Color => Color), Target, Written, Status);
   end Nearest_Color_Name_Into;

   procedure Saturation_Label_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Saturation_Label (Context, Color => Color), Target, Written, Status);
   end Saturation_Label_Into;

   procedure Temperature_Label_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Temperature_Label (Context, Color => Color), Target, Written, Status);
   end Temperature_Label_Into;

end Humanize.Colors.Names.Localized;
