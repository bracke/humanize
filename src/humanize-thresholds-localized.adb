with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Thresholds.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Threshold_Direction_Label
      (Context   : Humanize.Contexts.Context;
       Direction : Threshold_Direction)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Threshold_Direction_Label (Direction => Direction);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.threshold_direction_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "direction", Lower (Threshold_Direction'Image (Direction)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Threshold_Direction_Label;

   function Threshold_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Threshold_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Threshold_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.threshold_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Threshold_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Threshold_State_Label;

   procedure Threshold_Direction_Label_Into
      (Context   : Humanize.Contexts.Context;
       Direction : Threshold_Direction;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Threshold_Direction_Label (Context, Direction), Target, Written, Status);
   end Threshold_Direction_Label_Into;

   procedure Threshold_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Threshold_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Threshold_State_Label (Context, State), Target, Written, Status);
   end Threshold_State_Label_Into;

end Humanize.Thresholds.Localized;
