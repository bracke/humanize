with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Workflows.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Approval_Label
      (Context  : Humanize.Contexts.Context;
       Approver : String := "";
       Waiting  : Boolean := True)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Approval_Label (Approver => Approver, Waiting => Waiting);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.approval_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "approver", Humanize.Bounded_Text.Clean (Approver));
      Selection := Sel.With_Arg (Selection, "waiting", Lower (Boolean'Image (Waiting)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Approval_Label;

   function Attempt_Label
      (Context : Humanize.Contexts.Context;
       Attempt : Positive;
       Limit   : Positive)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Attempt_Label (Attempt => Attempt, Limit => Limit);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.attempt_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "attempt", Long_Long_Integer (Attempt));
      Selection := Sel.With_Arg (Selection, "limit", Long_Long_Integer (Limit));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Attempt_Label;

   function Blocker_Label
      (Context : Humanize.Contexts.Context;
       Reason  : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Blocker_Label (Reason => Reason);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.blocker_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "reason", Humanize.Bounded_Text.Clean (Reason));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Blocker_Label;

   function Dependency_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Dependency_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.dependency_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Dependency_Label;

   function Handoff_Label
      (Context : Humanize.Contexts.Context;
       From    : String;
       To      : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Handoff_Label (From => From, To => To);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.handoff_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "from", Humanize.Bounded_Text.Clean (From));
      Selection := Sel.With_Arg (Selection, "to", Humanize.Bounded_Text.Clean (To));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Handoff_Label;

   function Milestone_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Milestone_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Milestone_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.milestone_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Milestone_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Milestone_State_Label;

   function Milestone_Status_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Milestone_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Milestone_Status_Label (Name => Name, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.milestone_status_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "state", Lower (Milestone_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Milestone_Status_Label;

   function Next_Action_Label
      (Context : Humanize.Contexts.Context;
       Action  : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Next_Action_Label (Action => Action);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.next_action_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "action", Humanize.Bounded_Text.Clean (Action));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Next_Action_Label;

   function Owner_Label
      (Context : Humanize.Contexts.Context;
       Owner   : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Owner_Label (Owner => Owner);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.owner_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "owner", Humanize.Bounded_Text.Clean (Owner));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Owner_Label;

   function Resume_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Resume_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.resume_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Resume_Label;

   function Step_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Step_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Step_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.step_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Step_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Step_State_Label;

   function Step_Status_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Step_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Step_Status_Label (Name => Name, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.step_status_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "state", Lower (Step_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Step_Status_Label;

   function Waiting_Label
      (Context : Humanize.Contexts.Context;
       Reason  : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Waiting_Label (Reason => Reason);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.waiting_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "reason", Humanize.Bounded_Text.Clean (Reason));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Waiting_Label;

   function Workflow_Result_Label
      (Context : Humanize.Contexts.Context;
       State   : Workflow_State;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Workflow_Result_Label (State => State, Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.workflow_result_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Workflow_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Workflow_Result_Label;

   function Workflow_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Workflow_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Workflows.Workflow_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.workflows.workflow_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Workflow_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Workflow_State_Label;

   procedure Approval_Label_Into
      (Context  : Humanize.Contexts.Context;
       Approver : String := "";
       Waiting  : Boolean := True;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Approval_Label (Context, Approver, Waiting), Target, Written, Status);
   end Approval_Label_Into;

   procedure Attempt_Label_Into
      (Context : Humanize.Contexts.Context;
       Attempt : Positive;
       Limit   : Positive;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Attempt_Label (Context, Attempt, Limit), Target, Written, Status);
   end Attempt_Label_Into;

   procedure Blocker_Label_Into
      (Context : Humanize.Contexts.Context;
       Reason  : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Blocker_Label (Context, Reason), Target, Written, Status);
   end Blocker_Label_Into;

   procedure Dependency_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Dependency_Label (Context, Count), Target, Written, Status);
   end Dependency_Label_Into;

   procedure Handoff_Label_Into
      (Context : Humanize.Contexts.Context;
       From    : String;
       To      : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Handoff_Label (Context, From, To), Target, Written, Status);
   end Handoff_Label_Into;

   procedure Milestone_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Milestone_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Milestone_State_Label (Context, State), Target, Written, Status);
   end Milestone_State_Label_Into;

   procedure Milestone_Status_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Milestone_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Milestone_Status_Label (Context, Name, State), Target, Written, Status);
   end Milestone_Status_Label_Into;

   procedure Next_Action_Label_Into
      (Context : Humanize.Contexts.Context;
       Action  : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Next_Action_Label (Context, Action), Target, Written, Status);
   end Next_Action_Label_Into;

   procedure Owner_Label_Into
      (Context : Humanize.Contexts.Context;
       Owner   : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Owner_Label (Context, Owner), Target, Written, Status);
   end Owner_Label_Into;

   procedure Resume_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Resume_Label (Context, Name), Target, Written, Status);
   end Resume_Label_Into;

   procedure Step_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Step_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Step_State_Label (Context, State), Target, Written, Status);
   end Step_State_Label_Into;

   procedure Step_Status_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Step_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Step_Status_Label (Context, Name, State), Target, Written, Status);
   end Step_Status_Label_Into;

   procedure Waiting_Label_Into
      (Context : Humanize.Contexts.Context;
       Reason  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Waiting_Label (Context, Reason), Target, Written, Status);
   end Waiting_Label_Into;

   procedure Workflow_Result_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Workflow_State;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Workflow_Result_Label (Context, State, Name), Target, Written, Status);
   end Workflow_Result_Label_Into;

   procedure Workflow_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Workflow_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Workflow_State_Label (Context, State), Target, Written, Status);
   end Workflow_State_Label_Into;

end Humanize.Workflows.Localized;
