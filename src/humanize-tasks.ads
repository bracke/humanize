with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for tasks, todos, checklist items, and assignments.
package Humanize.Tasks is

   type Task_Output_Mode is (Task_Detailed, Task_Compact,
                             Task_Accessible, Task_Log);
   --  Output style for task labels with domain metadata.

   type Task_Label_Options is record
      Mode             : Task_Output_Mode := Task_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Caller-selected metadata included around task labels.

   Default_Task_Label_Options : constant Task_Label_Options :=
     (Mode             => Task_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Task_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Task_State is
     (Open_Task,
      In_Progress_Task,
      Blocked_Task,
      Done_Task,
      Canceled_Task,
      Deferred_Task,
      Overdue_Task);
   --  Caller-supplied task state.

   type Task_Priority is
     (No_Priority,
      Low_Priority,
      Medium_Priority,
      High_Priority,
      Critical_Priority);
   --  Caller-supplied task priority.

   type Assignment_State is
     (Unassigned,
      Assigned,
      Reassigned,
      Watching,
      Owned);
   --  Caller-supplied task assignment state.

   function Task_State_Label
     (State : Task_State)
      return Humanize.Status.Text_Result;
   --  @param State Task state.
   --  @return Human-readable task-state label.

   function Task_Priority_Label
     (Priority : Task_Priority)
      return Humanize.Status.Text_Result;
   --  @param Priority Task priority.
   --  @return Human-readable task-priority label.

   function Assignment_State_Label
     (State : Assignment_State)
      return Humanize.Status.Text_Result;
   --  @param State Task assignment state.
   --  @return Human-readable assignment-state label.

   function Task_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Task count.
   --  @return Human-readable task count label.

   function Open_Task_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Open task count.
   --  @return Human-readable open-task count label.

   function Completed_Task_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Completed task count.
   --  @return Human-readable completed-task count label.

   function Task_Label
     (Name     : String;
      State    : Task_State := Open_Task;
      Priority : Task_Priority := No_Priority)
      return Humanize.Status.Text_Result;
   --  @param Name Task name.
   --  @param State Task state.
   --  @param Priority Task priority.
   --  @return Human-readable task label.

   function Task_Label
     (Name     : String;
      State    : Task_State;
      Priority : Task_Priority;
      Options  : Task_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Task name.
   --  @param State Task state.
   --  @param Priority Task priority.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable task label with optional metadata.

   function Assignment_Label
     (Assignee : String;
      State    : Assignment_State := Assigned)
      return Humanize.Status.Text_Result;
   --  @param Assignee Assignee display name.
   --  @param State Task assignment state.
   --  @return Human-readable assignment label.

   function Assignment_Label
     (Assignee : String;
      State    : Assignment_State;
      Options  : Task_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Assignee Assignee display name.
   --  @param State Task assignment state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable assignment label with optional metadata.

   function Task_State_Metadata
     (State : Task_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Task state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Task_Priority_Metadata
     (Priority : Task_Priority)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Priority Task priority.
   --  @return Severity, tone, and final/actionable metadata for Priority.

   function Assignment_State_Metadata
     (State : Assignment_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Assignment state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Parse_Task_Label
     (Text     : String;
      State    : Task_State;
      Priority : Task_Priority := No_Priority)
      return Task_Label_Parse_Result;
   --  @param Text Label in rendered task-label form.
   --  @param State Expected task state.
   --  @param Priority Expected task priority.
   --  @return Parsed task name span, state span, metadata, and consumed length.

   function Scan_Task_Label
     (Text     : String;
      State    : Task_State;
      Priority : Task_Priority := No_Priority)
      return Task_Label_Parse_Result;
   --  @param Text Text beginning with a task label.
   --  @param State Expected task state.
   --  @param Priority Expected task priority.
   --  @return Parsed label span and consumed prefix length.

   function Parse_Assignment_Label
     (Text  : String;
      State : Assignment_State)
      return Task_Label_Parse_Result;
   --  @param Text Label in rendered assignment-label form.
   --  @param State Expected assignment state.
   --  @return Parsed assignee span, state span, metadata, and consumed length.

   function Scan_Assignment_Label
     (Text  : String;
      State : Assignment_State)
      return Task_Label_Parse_Result;
   --  @param Text Text beginning with an assignment label.
   --  @param State Expected assignment state.
   --  @return Parsed label span and consumed prefix length.

   function Due_Label
     (Due_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Due_Text Caller-supplied due date/time/distance label.
   --  @return Human-readable task due label.

   function Overdue_Label
     (Due_Text : String := "")
      return Humanize.Status.Text_Result;
   --  @param Due_Text Optional caller-supplied due date/time/distance label.
   --  @return Human-readable overdue task label.

   function Checklist_Label
     (Done  : Natural;
      Total : Natural)
      return Humanize.Status.Text_Result;
   --  @param Done Completed checklist item count.
   --  @param Total Total checklist item count.
   --  @return Human-readable checklist progress label.

   function Blocker_Label
     (Name : String)
      return Humanize.Status.Text_Result;
   --  @param Name Task blocker name.
   --  @return Human-readable task blocker label.

   function Subtask_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Parent task name.
   --  @param Count Subtask count.
   --  @return Human-readable subtask label.

   function Complete_Action_Label
     (Count : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Count Task count to complete.
   --  @return Human-readable complete-task action label.

   function Reopen_Action_Label
     (Count : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Count Task count to reopen.
   --  @return Human-readable reopen-task action label.

   function Estimate_Label
     (Estimate_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Estimate_Text Caller-supplied time/effort estimate label.
   --  @return Human-readable task estimate label.

   function Recurring_Task_Label
     (Schedule_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Schedule_Text Caller-supplied recurring schedule label.
   --  @return Human-readable recurring task label.

   function Backlog_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Backlog task count.
   --  @return Human-readable backlog label.

   function Sprint_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Sprint or iteration name.
   --  @param Count Task count in the sprint.
   --  @return Human-readable sprint task label.

   procedure Task_State_Label_Into
     (State   : Task_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Task state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Task_Priority_Label_Into
     (Priority : Task_Priority;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Priority Task priority.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Assignment_State_Label_Into
     (State   : Assignment_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Task assignment state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Task_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Task count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Open_Task_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Open task count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Completed_Task_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Completed task count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Task_Label_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      State    : Task_State := Open_Task;
      Priority : Task_Priority := No_Priority);
   --  @param Name Task name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Task state.
   --  @param Priority Task priority.

   procedure Task_Label_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      State    : Task_State;
      Priority : Task_Priority;
      Options  : Task_Label_Options);
   --  @param Name Task name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Task state.
   --  @param Priority Task priority.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Assignment_Label_Into
     (Assignee : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      State    : Assignment_State := Assigned);
   --  @param Assignee Assignee display name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Task assignment state.

   procedure Assignment_Label_Into
     (Assignee : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      State    : Assignment_State;
      Options  : Task_Label_Options);
   --  @param Assignee Assignee display name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Task assignment state.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Due_Label_Into
     (Due_Text : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Due_Text Caller-supplied due date/time/distance label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Overdue_Label_Into
     (Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Due_Text : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Due_Text Optional caller-supplied due date/time/distance label.

   procedure Checklist_Label_Into
     (Done    : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Done Completed checklist item count.
   --  @param Total Total checklist item count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Blocker_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Task blocker name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Subtask_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Parent task name.
   --  @param Count Subtask count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Complete_Action_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 1);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Count Task count to complete.

   procedure Reopen_Action_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 1);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Count Task count to reopen.

   procedure Estimate_Label_Into
     (Estimate_Text : String;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code);
   --  @param Estimate_Text Caller-supplied time/effort estimate label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Recurring_Task_Label_Into
     (Schedule_Text : String;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code);
   --  @param Schedule_Text Caller-supplied recurring schedule label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Backlog_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Backlog task count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sprint_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Sprint or iteration name.
   --  @param Count Task count in the sprint.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Tasks;
