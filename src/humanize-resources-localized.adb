with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Resources.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Utilization_Band_Label
      (Context : Humanize.Contexts.Context;
       Band    : Utilization_Band)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Resources.Utilization_Band_Label (Band => Band);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.resources.utilization_band_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "band", Lower (Utilization_Band'Image (Band)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Utilization_Band_Label;

   procedure Utilization_Band_Label_Into
      (Context : Humanize.Contexts.Context;
       Band    : Utilization_Band;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Utilization_Band_Label (Context, Band), Target, Written, Status);
   end Utilization_Band_Label_Into;

end Humanize.Resources.Localized;
