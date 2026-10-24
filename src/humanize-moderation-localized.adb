with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Moderation.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Appeal_Label
      (Context : Humanize.Contexts.Context;
       Item    : String;
       State   : Report_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Moderation.Appeal_Label (Item => Item, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.moderation.appeal_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "item", Humanize.Bounded_Text.Clean (Item));
      Selection := Sel.With_Arg (Selection, "state", Lower (Report_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Appeal_Label;

   function Moderation_Action_Label
      (Context : Humanize.Contexts.Context;
       Action  : Moderation_Action)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Moderation.Moderation_Action_Label (Action => Action);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.moderation.moderation_action_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "action", Lower (Moderation_Action'Image (Action)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Moderation_Action_Label;

   function Moderation_Label
      (Context : Humanize.Contexts.Context;
       Item    : String;
       Action  : Moderation_Action)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Moderation.Moderation_Label (Item => Item, Action => Action);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.moderation.moderation_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "item", Humanize.Bounded_Text.Clean (Item));
      Selection := Sel.With_Arg (Selection, "action", Lower (Moderation_Action'Image (Action)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Moderation_Label;

   function Moderation_Queue_Label
      (Context   : Humanize.Contexts.Context;
       Pending   : Natural;
       Escalated : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Moderation.Moderation_Queue_Label (Pending => Pending, Escalated => Escalated);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.moderation.moderation_queue_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "pending", Long_Long_Integer (Pending));
      Selection := Sel.With_Arg (Selection, "escalated", Long_Long_Integer (Escalated));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Moderation_Queue_Label;

   function Report_Label
      (Context : Humanize.Contexts.Context;
       Item    : String;
       State   : Report_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Moderation.Report_Label (Item => Item, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.moderation.report_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "item", Humanize.Bounded_Text.Clean (Item));
      Selection := Sel.With_Arg (Selection, "state", Lower (Report_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Report_Label;

   function Report_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Report_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Moderation.Report_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.moderation.report_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Report_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Report_State_Label;

   function Review_Label
      (Context : Humanize.Contexts.Context;
       Item    : String;
       State   : Review_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Moderation.Review_Label (Item => Item, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.moderation.review_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "item", Humanize.Bounded_Text.Clean (Item));
      Selection := Sel.With_Arg (Selection, "state", Lower (Review_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Review_Label;

   function Review_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Review_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Moderation.Review_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.moderation.review_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Review_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Review_State_Label;

   procedure Appeal_Label_Into
      (Context : Humanize.Contexts.Context;
       Item    : String;
       State   : Report_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Appeal_Label (Context, Item, State), Target, Written, Status);
   end Appeal_Label_Into;

   procedure Moderation_Action_Label_Into
      (Context : Humanize.Contexts.Context;
       Action  : Moderation_Action;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Moderation_Action_Label (Context, Action), Target, Written, Status);
   end Moderation_Action_Label_Into;

   procedure Moderation_Label_Into
      (Context : Humanize.Contexts.Context;
       Item    : String;
       Action  : Moderation_Action;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Moderation_Label (Context, Item, Action), Target, Written, Status);
   end Moderation_Label_Into;

   procedure Moderation_Queue_Label_Into
      (Context   : Humanize.Contexts.Context;
       Pending   : Natural;
       Escalated : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Moderation_Queue_Label (Context, Pending, Escalated), Target, Written, Status);
   end Moderation_Queue_Label_Into;

   procedure Report_Label_Into
      (Context : Humanize.Contexts.Context;
       Item    : String;
       State   : Report_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Report_Label (Context, Item, State), Target, Written, Status);
   end Report_Label_Into;

   procedure Report_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Report_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Report_State_Label (Context, State), Target, Written, Status);
   end Report_State_Label_Into;

   procedure Review_Label_Into
      (Context : Humanize.Contexts.Context;
       Item    : String;
       State   : Review_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Review_Label (Context, Item, State), Target, Written, Status);
   end Review_Label_Into;

   procedure Review_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Review_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Review_State_Label (Context, State), Target, Written, Status);
   end Review_State_Label_Into;

end Humanize.Moderation.Localized;
