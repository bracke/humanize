with Humanize.Contexts;

--  Tasks labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"): each
--  is the parent's function of the same name with a Context first, and that function itself in English, where the
--  locale has no translation, and for every input the parent rejects.
package Humanize.Tasks.Localized is

   function Assignment_Label
      (Context  : Humanize.Contexts.Context;
       Assignee : String;
       State    : Assignment_State := Assigned)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Assignee As for the parent's Assignment_Label.
   --  @param State As for the parent's Assignment_Label.
   --  @return The label in Context's locale.

   function Assignment_Label
      (Context  : Humanize.Contexts.Context;
       Assignee : String;
       State    : Assignment_State;
       Options  : Task_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Assignee As for the parent's Assignment_Label.
   --  @param State As for the parent's Assignment_Label.
   --  @param Options As for the parent's Assignment_Label.
   --  @return The label in Context's locale.

   function Assignment_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Assignment_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Assignment_State_Label.
   --  @return The label in Context's locale.

   function Backlog_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Backlog_Label.
   --  @return The label in Context's locale.

   function Blocker_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Blocker_Label.
   --  @return The label in Context's locale.

   function Checklist_Label
      (Context : Humanize.Contexts.Context;
       Done    : Natural;
       Total   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Done As for the parent's Checklist_Label.
   --  @param Total As for the parent's Checklist_Label.
   --  @return The label in Context's locale.

   function Complete_Action_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Complete_Action_Label.
   --  @return The label in Context's locale.

   function Completed_Task_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Completed_Task_Count_Label.
   --  @return The label in Context's locale.

   function Due_Label
      (Context  : Humanize.Contexts.Context;
       Due_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Due_Text As for the parent's Due_Label.
   --  @return The label in Context's locale.

   function Estimate_Label
      (Context       : Humanize.Contexts.Context;
       Estimate_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Estimate_Text As for the parent's Estimate_Label.
   --  @return The label in Context's locale.

   function Open_Task_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Open_Task_Count_Label.
   --  @return The label in Context's locale.

   function Overdue_Label
      (Context  : Humanize.Contexts.Context;
       Due_Text : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Due_Text As for the parent's Overdue_Label.
   --  @return The label in Context's locale.

   function Recurring_Task_Label
      (Context       : Humanize.Contexts.Context;
       Schedule_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Schedule_Text As for the parent's Recurring_Task_Label.
   --  @return The label in Context's locale.

   function Reopen_Action_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Reopen_Action_Label.
   --  @return The label in Context's locale.

   function Sprint_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Sprint_Label.
   --  @param Count As for the parent's Sprint_Label.
   --  @return The label in Context's locale.

   function Subtask_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Subtask_Label.
   --  @param Count As for the parent's Subtask_Label.
   --  @return The label in Context's locale.

   function Task_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Task_Count_Label.
   --  @return The label in Context's locale.

   function Task_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       State    : Task_State := Open_Task;
       Priority : Task_Priority := No_Priority)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Task_Label.
   --  @param State As for the parent's Task_Label.
   --  @param Priority As for the parent's Task_Label.
   --  @return The label in Context's locale.

   function Task_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       State    : Task_State;
       Priority : Task_Priority;
       Options  : Task_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Task_Label.
   --  @param State As for the parent's Task_Label.
   --  @param Priority As for the parent's Task_Label.
   --  @param Options As for the parent's Task_Label.
   --  @return The label in Context's locale.

   function Task_Priority_Label
      (Context  : Humanize.Contexts.Context;
       Priority : Task_Priority)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Priority As for the parent's Task_Priority_Label.
   --  @return The label in Context's locale.

   function Task_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Task_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Task_State_Label.
   --  @return The label in Context's locale.

   procedure Assignment_Label_Into
      (Context  : Humanize.Contexts.Context;
       Assignee : String;
       State    : Assignment_State := Assigned;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Assignee As for the parent's Assignment_Label.
   --  @param State As for the parent's Assignment_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Assignment_Label_Into
      (Context  : Humanize.Contexts.Context;
       Assignee : String;
       State    : Assignment_State;
       Options  : Task_Label_Options;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Assignee As for the parent's Assignment_Label.
   --  @param State As for the parent's Assignment_Label.
   --  @param Options As for the parent's Assignment_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Assignment_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Assignment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Assignment_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Backlog_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Backlog_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Blocker_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Blocker_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Checklist_Label_Into
      (Context : Humanize.Contexts.Context;
       Done    : Natural;
       Total   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Done As for the parent's Checklist_Label.
   --  @param Total As for the parent's Checklist_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Complete_Action_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Complete_Action_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Completed_Task_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Completed_Task_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Due_Label_Into
      (Context  : Humanize.Contexts.Context;
       Due_Text : String;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Due_Text As for the parent's Due_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Estimate_Label_Into
      (Context       : Humanize.Contexts.Context;
       Estimate_Text : String;
       Target        : in out String;
       Written       : out Natural;
       Status        : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Estimate_Text As for the parent's Estimate_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Open_Task_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Open_Task_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Overdue_Label_Into
      (Context  : Humanize.Contexts.Context;
       Due_Text : String := "";
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Due_Text As for the parent's Overdue_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Recurring_Task_Label_Into
      (Context       : Humanize.Contexts.Context;
       Schedule_Text : String;
       Target        : in out String;
       Written       : out Natural;
       Status        : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Schedule_Text As for the parent's Recurring_Task_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Reopen_Action_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Reopen_Action_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sprint_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Sprint_Label.
   --  @param Count As for the parent's Sprint_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Subtask_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Subtask_Label.
   --  @param Count As for the parent's Subtask_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Task_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Task_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Task_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       State    : Task_State := Open_Task;
       Priority : Task_Priority := No_Priority;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Task_Label.
   --  @param State As for the parent's Task_Label.
   --  @param Priority As for the parent's Task_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Task_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       State    : Task_State;
       Priority : Task_Priority;
       Options  : Task_Label_Options;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Task_Label.
   --  @param State As for the parent's Task_Label.
   --  @param Priority As for the parent's Task_Label.
   --  @param Options As for the parent's Task_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Task_Priority_Label_Into
      (Context  : Humanize.Contexts.Context;
       Priority : Task_Priority;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Priority As for the parent's Task_Priority_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Task_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Task_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Task_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Tasks.Localized;
