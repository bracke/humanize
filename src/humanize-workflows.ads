with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for workflow steps, states, and milestones.
package Humanize.Workflows is
   type Workflow_Output_Mode is
     (Workflow_Detailed,
      Workflow_Compact,
      Workflow_Accessible,
      Workflow_Log);

   type Workflow_Label_Options is record
      Mode             : Workflow_Output_Mode := Workflow_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;

   Default_Workflow_Label_Options : constant Workflow_Label_Options :=
     (Mode             => Workflow_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Workflow_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Workflow_State is
     (Not_Started_State,
      In_Progress_State,
      Waiting_State,
      Waiting_Approval_State,
      Blocked_State,
      Completed_State,
      Failed_State,
      Cancelled_State,
      Skipped_State,
      Paused_State);
   --  Caller-supplied workflow state.

   type Step_State is
     (Pending_Step,
      Active_Step,
      Waiting_Step,
      Blocked_Step,
      Done_Step,
      Failed_Step,
      Skipped_Step);
   --  Caller-supplied step state.

   type Milestone_State is
     (Upcoming_Milestone,
      Current_Milestone,
      Complete_Milestone,
      Missed_Milestone,
      Blocked_Milestone);
   --  Caller-supplied milestone state.

   function Workflow_State_Label
     (State : Workflow_State)
      return Humanize.Status.Text_Result;
   --  @param State Workflow state.
   --  @return Human-readable workflow state label.

   function Step_State_Label
     (State : Step_State)
      return Humanize.Status.Text_Result;
   --  @param State Step state.
   --  @return Human-readable step state label.

   function Milestone_State_Label
     (State : Milestone_State)
      return Humanize.Status.Text_Result;
   --  @param State Milestone state.
   --  @return Human-readable milestone state label.

   function Step_Label
     (Current : Positive;
      Total   : Positive;
      Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Current Current 1-based step number.
   --  @param Total Total step count.
   --  @param Name Optional step name.
   --  @return Human-readable step label.

   function Step_Status_Label
     (Name  : String;
      State : Step_State)
      return Humanize.Status.Text_Result;
   --  @param Name Step name.
   --  @param State Step state.
   --  @return Human-readable step status label.

   function Step_Status_Label
     (Name    : String;
      State   : Step_State;
      Options : Workflow_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Step name.
   --  @param State Step state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable step status label with optional metadata.

   function Milestone_Label
     (Current : Natural;
      Total   : Natural;
      Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Current Completed/current milestone count.
   --  @param Total Total milestone count.
   --  @param Name Optional milestone name.
   --  @return Human-readable milestone progress label.

   function Milestone_Status_Label
     (Name  : String;
      State : Milestone_State)
      return Humanize.Status.Text_Result;
   --  @param Name Milestone name.
   --  @param State Milestone state.
   --  @return Human-readable milestone status label.

   function Milestone_Status_Label
     (Name    : String;
      State   : Milestone_State;
      Options : Workflow_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Milestone name.
   --  @param State Milestone state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable milestone status label with optional metadata.

   function Workflow_Summary_Label
     (Total     : Natural;
      Completed : Natural := 0;
      Active    : Natural := 0;
      Blocked   : Natural := 0;
      Failed    : Natural := 0;
      Skipped   : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Total Total workflow item count.
   --  @param Completed Completed item count.
   --  @param Active Active item count.
   --  @param Blocked Blocked item count.
   --  @param Failed Failed item count.
   --  @param Skipped Skipped item count.
   --  @return Compact workflow item summary.

   function Workflow_Progress_Label
     (Completed : Natural;
      Total     : Natural)
      return Humanize.Status.Text_Result;
   --  @param Completed Completed item count.
   --  @param Total Total item count.
   --  @return Human-readable workflow progress label.

   function Approval_Label
     (Approver : String := "";
      Waiting  : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Approver Optional approver label.
   --  @param Waiting Whether the workflow is waiting for approval.
   --  @return Human-readable approval status label.

   function Blocker_Label
     (Reason : String)
      return Humanize.Status.Text_Result;
   --  @param Reason Caller-provided blocker reason.
   --  @return Human-readable blocker label.

   function Next_Action_Label
     (Action : String)
      return Humanize.Status.Text_Result;
   --  @param Action Caller-provided next action.
   --  @return Human-readable next-action label.

   function Queue_Position_Label
     (Position : Positive;
      Total    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Position 1-based queue position.
   --  @param Total Optional total queue length.
   --  @return Human-readable queue position label.

   function Waiting_Label
     (Reason : String := "")
      return Humanize.Status.Text_Result;
   --  @param Reason Optional caller-provided waiting reason.
   --  @return Human-readable waiting label.

   function Owner_Label
     (Owner : String)
      return Humanize.Status.Text_Result;
   --  @param Owner Caller-provided owner/assignee label.
   --  @return Human-readable owner label.

   function Handoff_Label
     (From : String;
      To   : String)
      return Humanize.Status.Text_Result;
   --  @param From Previous owner/team label.
   --  @param To Next owner/team label.
   --  @return Human-readable handoff label.

   function Dependency_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Blocking dependency count.
   --  @return Human-readable dependency label.

   function Attempt_Label
     (Attempt : Positive;
      Limit   : Positive)
      return Humanize.Status.Text_Result;
   --  @param Attempt Current attempt number.
   --  @param Limit Maximum attempt count.
   --  @return Human-readable attempt label.

   function Workflow_Result_Label
     (State : Workflow_State;
      Name  : String := "")
      return Humanize.Status.Text_Result;
   --  @param State Final/current workflow state.
   --  @param Name Optional workflow name.
   --  @return Human-readable workflow result label.

   function Workflow_Result_Label
     (State   : Workflow_State;
      Options : Workflow_Label_Options;
      Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param State Final/current workflow state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Name Optional workflow name.
   --  @return Human-readable workflow result label with optional metadata.

   function Workflow_State_Metadata
     (State : Workflow_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Workflow state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Step_State_Metadata
     (State : Step_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Step state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Milestone_State_Metadata
     (State : Milestone_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Milestone state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Parse_Workflow_Result_Label
     (Text  : String;
      State : Workflow_State)
      return Workflow_Label_Parse_Result;
   --  @param Text Label in rendered workflow-result form.
   --  @param State Expected workflow state.
   --  @return Parsed workflow name span, state span, metadata, and consumed length.

   function Scan_Workflow_Result_Label
     (Text  : String;
      State : Workflow_State)
      return Workflow_Label_Parse_Result;
   --  @param Text Text beginning with a workflow-result label.
   --  @param State Expected workflow state.
   --  @return Parsed workflow-result prefix and consumed length.

   function Parse_Step_Status_Label
     (Text  : String;
      State : Step_State)
      return Workflow_Label_Parse_Result;
   --  @param Text Label in rendered step-status form.
   --  @param State Expected step state.
   --  @return Parsed step name span, state span, metadata, and consumed length.

   function Scan_Step_Status_Label
     (Text  : String;
      State : Step_State)
      return Workflow_Label_Parse_Result;
   --  @param Text Text beginning with a step-status label.
   --  @param State Expected step state.
   --  @return Parsed step-status prefix and consumed length.

   function Parse_Milestone_Status_Label
     (Text  : String;
      State : Milestone_State)
      return Workflow_Label_Parse_Result;
   --  @param Text Label in rendered milestone-status form.
   --  @param State Expected milestone state.
   --  @return Parsed milestone name span, state span, metadata, and consumed length.

   function Scan_Milestone_Status_Label
     (Text  : String;
      State : Milestone_State)
      return Workflow_Label_Parse_Result;
   --  @param Text Text beginning with a milestone-status label.
   --  @param State Expected milestone state.
   --  @return Parsed milestone-status prefix and consumed length.

   function Resume_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional workflow name.
   --  @return Human-readable resume label.

   procedure Step_Label_Into
     (Current : Positive;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Current Current 1-based step number.
   --  @param Total Total step count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional step name.

   procedure Workflow_Summary_Label_Into
     (Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Completed : Natural := 0;
      Active    : Natural := 0;
      Blocked   : Natural := 0;
      Failed    : Natural := 0;
      Skipped   : Natural := 0);
   --  @param Total Total workflow item count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Completed Completed item count.
   --  @param Active Active item count.
   --  @param Blocked Blocked item count.
   --  @param Failed Failed item count.
   --  @param Skipped Skipped item count.

   procedure Next_Action_Label_Into
     (Action  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Action Caller-provided next action.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Step_Status_Label_Into
     (Name    : String;
      State   : Step_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Workflow_Label_Options);
   --  @param Name Step name.
   --  @param State Step state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Milestone_Status_Label_Into
     (Name    : String;
      State   : Milestone_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Workflow_Label_Options);
   --  @param Name Milestone name.
   --  @param State Milestone state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Workflow_Result_Label_Into
     (State   : Workflow_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Workflow_Label_Options;
      Name    : String := "");
   --  @param State Final/current workflow state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Name Optional workflow name.

end Humanize.Workflows;
