with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Colors.Palettes.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Advanced_Palette_Summary
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Palettes.Advanced_Palette_Summary (Colors => Colors);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.palettes.advanced_palette_summary");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "harmony", Humanize.Label_Values.Text_Of (Palette_Harmony_Label (Context,
        Colors)));
      Selection := Sel.With_Arg (Selection, "mood", Humanize.Label_Values.Text_Of (Palette_Mood_Label (Context,
        Colors)));
      Selection := Sel.With_Arg (Selection, "accessibility", Humanize.Label_Values.Text_Of
        (Palette_Accessibility_Label (Context, Colors)));
      Selection := Sel.With_Arg (Selection, "roles", Humanize.Label_Values.Text_Of (Palette_Roles (Context, Colors)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Advanced_Palette_Summary;

   function Palette_Accessibility_Label
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Palettes.Palette_Accessibility_Label (Colors => Colors);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.palettes.palette_accessibility_label", English);
   end Palette_Accessibility_Label;

   function Palette_Contrast_Matrix_Label
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Palettes.Palette_Contrast_Matrix_Label (Colors => Colors);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.palettes.palette_contrast_matrix_label", English);
   end Palette_Contrast_Matrix_Label;

   function Palette_Contrast_Suggestion
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Palettes.Palette_Contrast_Suggestion (Colors => Colors);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.palettes.palette_contrast_suggestion", English);
   end Palette_Contrast_Suggestion;

   function Palette_Harmony_Label
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Palettes.Palette_Harmony_Label (Colors => Colors);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.palettes.palette_harmony_label", English);
   end Palette_Harmony_Label;

   function Palette_Metadata_Label
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Palettes.Palette_Metadata_Label (Colors => Colors);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.palettes.palette_metadata_label", English);
   end Palette_Metadata_Label;

   function Palette_Mood_Label
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Palettes.Palette_Mood_Label (Colors => Colors);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.palettes.palette_mood_label", English, ", ");
   end Palette_Mood_Label;

   function Palette_Roles
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Palettes.Palette_Roles (Colors => Colors);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.palettes.palette_roles", English);
   end Palette_Roles;

   function Palette_Summary
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Palettes.Palette_Summary (Colors => Colors);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.palettes.palette_summary", English, ", ");
   end Palette_Summary;

   procedure Advanced_Palette_Summary_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Advanced_Palette_Summary (Context, Colors => Colors), Target, Written, Status);
   end Advanced_Palette_Summary_Into;

   procedure Palette_Accessibility_Label_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Palette_Accessibility_Label (Context, Colors => Colors),
         Target, Written, Status);
   end Palette_Accessibility_Label_Into;

   procedure Palette_Contrast_Matrix_Label_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Palette_Contrast_Matrix_Label (Context, Colors => Colors),
         Target, Written, Status);
   end Palette_Contrast_Matrix_Label_Into;

   procedure Palette_Contrast_Suggestion_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Palette_Contrast_Suggestion (Context, Colors => Colors),
         Target, Written, Status);
   end Palette_Contrast_Suggestion_Into;

   procedure Palette_Harmony_Label_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Palette_Harmony_Label (Context, Colors => Colors), Target, Written, Status);
   end Palette_Harmony_Label_Into;

   procedure Palette_Metadata_Label_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Palette_Metadata_Label (Context, Colors => Colors), Target, Written, Status);
   end Palette_Metadata_Label_Into;

   procedure Palette_Mood_Label_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Palette_Mood_Label (Context, Colors => Colors), Target, Written, Status);
   end Palette_Mood_Label_Into;

   procedure Palette_Roles_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Palette_Roles (Context, Colors => Colors), Target, Written, Status);
   end Palette_Roles_Into;

   procedure Palette_Summary_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Palette_Summary (Context, Colors => Colors), Target, Written, Status);
   end Palette_Summary_Into;

end Humanize.Colors.Palettes.Localized;
