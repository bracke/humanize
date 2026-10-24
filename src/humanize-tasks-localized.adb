with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Tasks.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Assignment_Label
      (Context  : Humanize.Contexts.Context;
       Assignee : String;
       State    : Assignment_State := Assigned)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Assignment_Label (Assignee => Assignee, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.assignment_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "assignee", Humanize.Bounded_Text.Clean (Assignee));
      Selection := Sel.With_Arg (Selection, "state", Lower (Assignment_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Assignment_Label;

   function Assignment_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Assignment_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Assignment_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.assignment_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Assignment_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Assignment_State_Label;

   function Backlog_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Backlog_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.backlog_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Backlog_Label;

   function Blocker_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Blocker_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.blocker_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Blocker_Label;

   function Complete_Action_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Complete_Action_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.complete_action_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Complete_Action_Label;

   function Completed_Task_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Completed_Task_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.completed_task_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Completed_Task_Count_Label;

   function Due_Label
      (Context  : Humanize.Contexts.Context;
       Due_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Due_Label (Due_Text => Due_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.due_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "due_text", Humanize.Bounded_Text.Clean (Due_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Due_Label;

   function Estimate_Label
      (Context       : Humanize.Contexts.Context;
       Estimate_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Estimate_Label (Estimate_Text => Estimate_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.estimate_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "estimate_text", Humanize.Bounded_Text.Clean (Estimate_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Estimate_Label;

   function Open_Task_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Open_Task_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.open_task_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Open_Task_Count_Label;

   function Overdue_Label
      (Context  : Humanize.Contexts.Context;
       Due_Text : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Overdue_Label (Due_Text => Due_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.overdue_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "due_text", Humanize.Bounded_Text.Clean (Due_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Overdue_Label;

   function Recurring_Task_Label
      (Context       : Humanize.Contexts.Context;
       Schedule_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Recurring_Task_Label (Schedule_Text => Schedule_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.recurring_task_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "schedule_text", Humanize.Bounded_Text.Clean (Schedule_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Recurring_Task_Label;

   function Reopen_Action_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Reopen_Action_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.reopen_action_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Reopen_Action_Label;

   function Sprint_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Sprint_Label (Name => Name, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.sprint_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Sprint_Label;

   function Subtask_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Subtask_Label (Name => Name, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.subtask_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Subtask_Label;

   function Task_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Task_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.task_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Task_Count_Label;

   function Task_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       State    : Task_State := Open_Task;
       Priority : Task_Priority := No_Priority)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Task_Label (Name => Name, State => State, Priority => Priority);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.task_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "state", Lower (Task_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "priority", Lower (Task_Priority'Image (Priority)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Task_Label;

   function Task_Priority_Label
      (Context  : Humanize.Contexts.Context;
       Priority : Task_Priority)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Task_Priority_Label (Priority => Priority);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.task_priority_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "priority", Lower (Task_Priority'Image (Priority)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Task_Priority_Label;

   function Task_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Task_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tasks.Task_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tasks.task_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Task_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Task_State_Label;

   procedure Assignment_Label_Into
      (Context  : Humanize.Contexts.Context;
       Assignee : String;
       State    : Assignment_State := Assigned;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Assignment_Label (Context, Assignee, State), Target, Written, Status);
   end Assignment_Label_Into;

   procedure Assignment_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Assignment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Assignment_State_Label (Context, State), Target, Written, Status);
   end Assignment_State_Label_Into;

   procedure Backlog_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Backlog_Label (Context, Count), Target, Written, Status);
   end Backlog_Label_Into;

   procedure Blocker_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Blocker_Label (Context, Name), Target, Written, Status);
   end Blocker_Label_Into;

   procedure Complete_Action_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Complete_Action_Label (Context, Count), Target, Written, Status);
   end Complete_Action_Label_Into;

   procedure Completed_Task_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Completed_Task_Count_Label (Context, Count), Target, Written, Status);
   end Completed_Task_Count_Label_Into;

   procedure Due_Label_Into
      (Context  : Humanize.Contexts.Context;
       Due_Text : String;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Due_Label (Context, Due_Text), Target, Written, Status);
   end Due_Label_Into;

   procedure Estimate_Label_Into
      (Context       : Humanize.Contexts.Context;
       Estimate_Text : String;
       Target        : in out String;
       Written       : out Natural;
       Status        : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Estimate_Label (Context, Estimate_Text), Target, Written, Status);
   end Estimate_Label_Into;

   procedure Open_Task_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Open_Task_Count_Label (Context, Count), Target, Written, Status);
   end Open_Task_Count_Label_Into;

   procedure Overdue_Label_Into
      (Context  : Humanize.Contexts.Context;
       Due_Text : String := "";
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Overdue_Label (Context, Due_Text), Target, Written, Status);
   end Overdue_Label_Into;

   procedure Recurring_Task_Label_Into
      (Context       : Humanize.Contexts.Context;
       Schedule_Text : String;
       Target        : in out String;
       Written       : out Natural;
       Status        : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Recurring_Task_Label (Context, Schedule_Text), Target, Written, Status);
   end Recurring_Task_Label_Into;

   procedure Reopen_Action_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Reopen_Action_Label (Context, Count), Target, Written, Status);
   end Reopen_Action_Label_Into;

   procedure Sprint_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Sprint_Label (Context, Name, Count), Target, Written, Status);
   end Sprint_Label_Into;

   procedure Subtask_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Subtask_Label (Context, Name, Count), Target, Written, Status);
   end Subtask_Label_Into;

   procedure Task_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Task_Count_Label (Context, Count), Target, Written, Status);
   end Task_Count_Label_Into;

   procedure Task_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       State    : Task_State := Open_Task;
       Priority : Task_Priority := No_Priority;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Task_Label (Context, Name, State, Priority), Target, Written, Status);
   end Task_Label_Into;

   procedure Task_Priority_Label_Into
      (Context  : Humanize.Contexts.Context;
       Priority : Task_Priority;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Task_Priority_Label (Context, Priority), Target, Written, Status);
   end Task_Priority_Label_Into;

   procedure Task_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Task_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Task_State_Label (Context, State), Target, Written, Status);
   end Task_State_Label_Into;

end Humanize.Tasks.Localized;
