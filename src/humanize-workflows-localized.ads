with Humanize.Contexts;

--  Workflows labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Workflows.Localized is

   function Approval_Label
      (Context  : Humanize.Contexts.Context;
       Approver : String := "";
       Waiting  : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Approver As for the parent's Approval_Label.
   --  @param Waiting As for the parent's Approval_Label.
   --  @return The label in Context's locale.

   function Attempt_Label
      (Context : Humanize.Contexts.Context;
       Attempt : Positive;
       Limit   : Positive)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Attempt As for the parent's Attempt_Label.
   --  @param Limit As for the parent's Attempt_Label.
   --  @return The label in Context's locale.

   function Blocker_Label
      (Context : Humanize.Contexts.Context;
       Reason  : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Reason As for the parent's Blocker_Label.
   --  @return The label in Context's locale.

   function Dependency_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Dependency_Label.
   --  @return The label in Context's locale.

   function Handoff_Label
      (Context : Humanize.Contexts.Context;
       From    : String;
       To      : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param From As for the parent's Handoff_Label.
   --  @param To As for the parent's Handoff_Label.
   --  @return The label in Context's locale.

   function Milestone_Label
      (Context : Humanize.Contexts.Context;
       Current : Natural;
       Total   : Natural;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Current As for the parent's Milestone_Label.
   --  @param Total As for the parent's Milestone_Label.
   --  @param Name As for the parent's Milestone_Label.
   --  @return The label in Context's locale.

   function Milestone_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Milestone_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Milestone_State_Label.
   --  @return The label in Context's locale.

   function Milestone_Status_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Milestone_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Milestone_Status_Label.
   --  @param State As for the parent's Milestone_Status_Label.
   --  @return The label in Context's locale.

   function Milestone_Status_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Milestone_State;
       Options : Workflow_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Milestone_Status_Label.
   --  @param State As for the parent's Milestone_Status_Label.
   --  @param Options As for the parent's Milestone_Status_Label.
   --  @return The label in Context's locale.

   function Next_Action_Label
      (Context : Humanize.Contexts.Context;
       Action  : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Action As for the parent's Next_Action_Label.
   --  @return The label in Context's locale.

   function Owner_Label
      (Context : Humanize.Contexts.Context;
       Owner   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Owner As for the parent's Owner_Label.
   --  @return The label in Context's locale.

   function Queue_Position_Label
      (Context  : Humanize.Contexts.Context;
       Position : Positive;
       Total    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Position As for the parent's Queue_Position_Label.
   --  @param Total As for the parent's Queue_Position_Label.
   --  @return The label in Context's locale.

   function Resume_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Resume_Label.
   --  @return The label in Context's locale.

   function Step_Label
      (Context : Humanize.Contexts.Context;
       Current : Positive;
       Total   : Positive;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Current As for the parent's Step_Label.
   --  @param Total As for the parent's Step_Label.
   --  @param Name As for the parent's Step_Label.
   --  @return The label in Context's locale.

   function Step_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Step_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Step_State_Label.
   --  @return The label in Context's locale.

   function Step_Status_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Step_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Step_Status_Label.
   --  @param State As for the parent's Step_Status_Label.
   --  @return The label in Context's locale.

   function Step_Status_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Step_State;
       Options : Workflow_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Step_Status_Label.
   --  @param State As for the parent's Step_Status_Label.
   --  @param Options As for the parent's Step_Status_Label.
   --  @return The label in Context's locale.

   function Waiting_Label
      (Context : Humanize.Contexts.Context;
       Reason  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Reason As for the parent's Waiting_Label.
   --  @return The label in Context's locale.

   function Workflow_Progress_Label
      (Context   : Humanize.Contexts.Context;
       Completed : Natural;
       Total     : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Completed As for the parent's Workflow_Progress_Label.
   --  @param Total As for the parent's Workflow_Progress_Label.
   --  @return The label in Context's locale.

   function Workflow_Result_Label
      (Context : Humanize.Contexts.Context;
       State   : Workflow_State;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Workflow_Result_Label.
   --  @param Name As for the parent's Workflow_Result_Label.
   --  @return The label in Context's locale.

   function Workflow_Result_Label
      (Context : Humanize.Contexts.Context;
       State   : Workflow_State;
       Options : Workflow_Label_Options;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Workflow_Result_Label.
   --  @param Options As for the parent's Workflow_Result_Label.
   --  @param Name As for the parent's Workflow_Result_Label.
   --  @return The label in Context's locale.

   function Workflow_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Workflow_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Workflow_State_Label.
   --  @return The label in Context's locale.

   function Workflow_Summary_Label
      (Context   : Humanize.Contexts.Context;
       Total     : Natural;
       Completed : Natural := 0;
       Active    : Natural := 0;
       Blocked   : Natural := 0;
       Failed    : Natural := 0;
       Skipped   : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Total As for the parent's Workflow_Summary_Label.
   --  @param Completed As for the parent's Workflow_Summary_Label.
   --  @param Active As for the parent's Workflow_Summary_Label.
   --  @param Blocked As for the parent's Workflow_Summary_Label.
   --  @param Failed As for the parent's Workflow_Summary_Label.
   --  @param Skipped As for the parent's Workflow_Summary_Label.
   --  @return The label in Context's locale.

   procedure Approval_Label_Into
      (Context  : Humanize.Contexts.Context;
       Approver : String := "";
       Waiting  : Boolean := True;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Approver As for the parent's Approval_Label.
   --  @param Waiting As for the parent's Approval_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attempt_Label_Into
      (Context : Humanize.Contexts.Context;
       Attempt : Positive;
       Limit   : Positive;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Attempt As for the parent's Attempt_Label.
   --  @param Limit As for the parent's Attempt_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Blocker_Label_Into
      (Context : Humanize.Contexts.Context;
       Reason  : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Reason As for the parent's Blocker_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Dependency_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Dependency_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Handoff_Label_Into
      (Context : Humanize.Contexts.Context;
       From    : String;
       To      : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param From As for the parent's Handoff_Label.
   --  @param To As for the parent's Handoff_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Milestone_Label_Into
      (Context : Humanize.Contexts.Context;
       Current : Natural;
       Total   : Natural;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Current As for the parent's Milestone_Label.
   --  @param Total As for the parent's Milestone_Label.
   --  @param Name As for the parent's Milestone_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Milestone_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Milestone_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Milestone_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Milestone_Status_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Milestone_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Milestone_Status_Label.
   --  @param State As for the parent's Milestone_Status_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Milestone_Status_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Milestone_State;
       Options : Workflow_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Milestone_Status_Label.
   --  @param State As for the parent's Milestone_Status_Label.
   --  @param Options As for the parent's Milestone_Status_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Next_Action_Label_Into
      (Context : Humanize.Contexts.Context;
       Action  : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Action As for the parent's Next_Action_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Owner_Label_Into
      (Context : Humanize.Contexts.Context;
       Owner   : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Owner As for the parent's Owner_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Queue_Position_Label_Into
      (Context  : Humanize.Contexts.Context;
       Position : Positive;
       Total    : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Position As for the parent's Queue_Position_Label.
   --  @param Total As for the parent's Queue_Position_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Resume_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Resume_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Step_Label_Into
      (Context : Humanize.Contexts.Context;
       Current : Positive;
       Total   : Positive;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Current As for the parent's Step_Label.
   --  @param Total As for the parent's Step_Label.
   --  @param Name As for the parent's Step_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Step_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Step_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Step_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Step_Status_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Step_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Step_Status_Label.
   --  @param State As for the parent's Step_Status_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Step_Status_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Step_State;
       Options : Workflow_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Step_Status_Label.
   --  @param State As for the parent's Step_Status_Label.
   --  @param Options As for the parent's Step_Status_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Waiting_Label_Into
      (Context : Humanize.Contexts.Context;
       Reason  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Reason As for the parent's Waiting_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Workflow_Progress_Label_Into
      (Context   : Humanize.Contexts.Context;
       Completed : Natural;
       Total     : Natural;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Completed As for the parent's Workflow_Progress_Label.
   --  @param Total As for the parent's Workflow_Progress_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Workflow_Result_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Workflow_State;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Workflow_Result_Label.
   --  @param Name As for the parent's Workflow_Result_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Workflow_Result_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Workflow_State;
       Options : Workflow_Label_Options;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Workflow_Result_Label.
   --  @param Options As for the parent's Workflow_Result_Label.
   --  @param Name As for the parent's Workflow_Result_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Workflow_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Workflow_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Workflow_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Workflow_Summary_Label_Into
      (Context   : Humanize.Contexts.Context;
       Total     : Natural;
       Completed : Natural := 0;
       Active    : Natural := 0;
       Blocked   : Natural := 0;
       Failed    : Natural := 0;
       Skipped   : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Total As for the parent's Workflow_Summary_Label.
   --  @param Completed As for the parent's Workflow_Summary_Label.
   --  @param Active As for the parent's Workflow_Summary_Label.
   --  @param Blocked As for the parent's Workflow_Summary_Label.
   --  @param Failed As for the parent's Workflow_Summary_Label.
   --  @param Skipped As for the parent's Workflow_Summary_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Workflows.Localized;
