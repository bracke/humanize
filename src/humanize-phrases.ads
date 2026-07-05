with Humanize.Bytes;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Numbers;
with Humanize.Status;

--  Deterministic UI/status phrase helpers.
package Humanize.Phrases is

   type Phrase_Severity is
     (Neutral_Severity,
      Success_Severity,
      Warning_Severity,
      Danger_Severity,
      Info_Severity);

   type Phrase_Tone is
     (Neutral_Tone,
      Positive_Tone,
      Attention_Tone,
      Critical_Tone,
      Informational_Tone);

   type UI_Status is
     (Empty,
      Loading,
      Saving,
      Saved,
      Unsaved,
      Retrying,
      Paused,
      Complete,
      Failed,
      Due_Soon,
      Overdue,
      Last_Seen,
      Updated_Just_Now);

   type File_Status is
     (Uploading,
      Downloading,
      Copying,
      Moving,
      Deleting,
      Deleted,
      Restoring,
      Synced);

   type Validation_Status is
     (Required,
      Optional,
      Invalid,
      Too_Short,
      Too_Long,
      Out_Of_Range,
      Already_Exists);

   type Empty_State is
     (No_Items,
      No_Results,
      No_Messages,
      No_Selection,
      Nothing_To_Show);

   type Network_Status is
     (Offline,
      Online,
      Connecting,
      Syncing,
      Sync_Failed,
      Permission_Denied,
      Read_Only);

   type Auth_Status is
     (Signed_In,
      Signed_Out,
      Session_Expired,
      Locked,
      Two_Factor_Required);

   type Billing_Status is
     (Trialing,
      Payment_Due,
      Payment_Failed,
      Paid,
      Past_Due,
      Canceled);

   type Workflow_Status is
     (Draft,
      In_Review,
      Approved,
      Rejected,
      Published,
      Archived);

   type Queue_Status is
     (Queued,
      Running,
      Waiting,
      Blocked,
      Canceled_Job,
      Completed_Job);

   type Security_Status is
     (Secure,
      Insecure,
      Vulnerable,
      Encrypted,
      Unencrypted,
      Token_Expired);

   type Deployment_Status is
     (Deploying,
      Deployed,
      Rolling_Back,
      Rolled_Back,
      Build_Failed,
      Checks_Passed);

   type Health_Status is
     (Healthy,
      Degraded,
      Unhealthy,
      Incident,
      Maintenance,
      Recovering);

   type Notification_Status is
     (Unread,
      Read,
      Muted,
      Snoozed,
      Sent,
      Delivered);

   type Form_Status is
     (Valid_Input,
      Invalid_Input,
      Dirty,
      Pristine,
      Submitted,
      Submission_Failed);

   type Access_Status is
     (Allowed,
      Denied,
      Owner,
      Admin,
      Viewer,
      Editor);

   type Sync_Status is
     (Sync_Idle,
      Syncing_Now,
      Sync_Queued,
      Sync_Conflict,
      Sync_Complete,
      Sync_Error);

   type Transfer_Status is
     (Importing,
      Imported,
      Import_Failed,
      Exporting,
      Exported,
      Export_Failed);

   type Search_Status is
     (Filtering,
      Filtered,
      No_Matches,
      Search_Ready,
      Search_Failed,
      Query_Too_Short);

   type Collaboration_Status is
     (Active_Now,
      Away,
      Do_Not_Disturb,
      Typing,
      Viewing,
      Editing);

   type Issue_Status is
     (Open,
      Closed,
      Reopened,
      Assigned,
      Unassigned,
      Merged);

   type Task_Status is
     (Todo,
      In_Progress,
      Done,
      Skipped,
      Blocked_Task,
      Waiting_On);

   type CI_Status is
     (Pipeline_Pending,
      Pipeline_Running,
      Pipeline_Passed,
      Pipeline_Failed,
      Review_Required,
      Deploy_Blocked);

   type Ticket_Status is
     (Ticket_New,
      Ticket_Open,
      Ticket_Waiting,
      Ticket_Escalated,
      Ticket_Resolved,
      Ticket_Closed);

   type Payment_Lifecycle_Status is
     (Payment_Authorized,
      Payment_Captured,
      Payment_Refunded,
      Payment_Disputed,
      Payment_Requires_Action,
      Payment_Expired);

   type Summary_Domain is
     (Queue_Domain,
      Job_Domain,
      Run_Domain,
      Cache_Domain,
      Sync_Domain,
      Import_Domain,
      Export_Domain);

   type Summary_State is
     (Summary_Queued,
      Summary_Running,
      Summary_Waiting,
      Summary_Paused,
      Summary_Complete,
      Summary_Failed,
      Summary_Stale,
      Summary_Skipped);

   function Severity_Label
     (Severity : Phrase_Severity)
      return Humanize.Status.Text_Result;
   --  @param Severity Stable phrase severity.
   --  @return Lowercase severity label.

   function Tone_For_Severity
     (Severity : Phrase_Severity)
      return Phrase_Tone;
   --  @param Severity Stable phrase severity.
   --  @return UI tone metadata for the severity.

   function Tone_Label
     (Tone : Phrase_Tone)
      return Humanize.Status.Text_Result;
   --  @param Tone UI tone metadata.
   --  @return Lowercase tone label.

   procedure Severity_Label_Into
     (Severity : Phrase_Severity;
      Target   : in out String;
      Written  : out Natural;
      Code     : out Humanize.Status.Status_Code);
   --  @param Severity Stable phrase severity.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Tone_Label_Into
     (Tone    : Phrase_Tone;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Tone UI tone metadata.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   function Phrase_Pack_Summary
     return Humanize.Status.Text_Result;
   --  @return Space-separated summary of deterministic phrase packs.

   function Domain_Label
     (Domain : Summary_Domain)
      return Humanize.Status.Text_Result;
   --  @param Domain Generic operational domain.
   --  @return Lowercase label for the domain.

   function Summary_State_Label
     (State : Summary_State)
      return Humanize.Status.Text_Result;
   --  @param State Generic operational state.
   --  @return Lowercase label for the state.

   function Domain_Summary
     (Context   : Humanize.Contexts.Context;
      Domain    : Summary_Domain;
      State     : Summary_State;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Domain Generic operational domain.
   --  @param State Current lifecycle state.
   --  @param Completed Number of completed units.
   --  @param Total Total number of units when known.
   --  @param Failed Number of failed units.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.
   --  @return Deterministic progress summary.

   function Queue_Summary
     (Context   : Humanize.Contexts.Context;
      Queued    : Natural;
      Running   : Natural;
      Failed    : Natural := 0;
      Completed : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Queued Number of queued units.
   --  @param Running Number of running units.
   --  @param Failed Number of failed units.
   --  @param Completed Number of completed units.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.
   --  @return Deterministic queue summary.

   function Cache_Summary
     (Context : Humanize.Contexts.Context;
      Hits    : Natural;
      Misses  : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Hits Number of cache hits.
   --  @param Misses Number of cache misses.
   --  @return Deterministic cache effectiveness summary.

   function Sync_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Completed Number of completed units.
   --  @param Total Total unit count.
   --  @param Failed Number of failed units.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.
   --  @return Deterministic sync progress summary.

   function Import_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Completed Number of completed units.
   --  @param Total Total unit count.
   --  @param Failed Number of failed units.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.
   --  @return Deterministic import progress summary.

   function Export_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Completed Number of completed units.
   --  @param Total Total unit count.
   --  @param Failed Number of failed units.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.
   --  @return Deterministic export progress summary.

   function File_Size_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Humanize.Bytes.Byte_Count;
      Baseline       : Humanize.Bytes.Byte_Count;
      Current_Label  : String := "file";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Bytes.Byte_Options :=
        Humanize.Bytes.Default_Byte_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Current Current file or byte-size value.
   --  @param Baseline Baseline file or byte-size value.
   --  @param Current_Label Label for the current value.
   --  @param Baseline_Label Label for the baseline value.
   --  @param Options Byte unit and fraction policy.
   --  @return Deterministic size comparison summary.

   function Date_Comparison
     (Context        : Humanize.Contexts.Context;
      Value          : Humanize.Datetimes.Civil_Date_Time;
      Reference      : Humanize.Datetimes.Civil_Date_Time;
      Value_Label    : String := "date";
      Reference_Label : String := "reference";
      Options        : Humanize.Datetimes.Calendar_Difference_Options :=
        Humanize.Datetimes.Default_Calendar_Difference_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Date being compared.
   --  @param Reference Reference date.
   --  @param Value_Label Label for Value.
   --  @param Reference_Label Label for Reference.
   --  @param Options Calendar-difference component policy.
   --  @return Deterministic date comparison summary.

   function Number_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String := "value";
      Baseline_Label : String := "baseline";
      Unit_Singular  : String := "";
      Unit_Plural    : String := "";
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Current Current numeric value.
   --  @param Baseline Baseline numeric value.
   --  @param Current_Label Label for the current value.
   --  @param Baseline_Label Label for the baseline value.
   --  @param Unit_Singular Optional singular unit noun.
   --  @param Unit_Plural Optional plural unit noun.
   --  @param Options Number formatting policy.
   --  @return Deterministic absolute numeric comparison summary.

   function Percent_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String := "value";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Current Current numeric value.
   --  @param Baseline Baseline numeric value.
   --  @param Current_Label Label for the current value.
   --  @param Baseline_Label Label for the baseline value.
   --  @param Options Percent formatting policy.
   --  @return Deterministic relative percent comparison summary.

   function Status_Severity
     (Status : UI_Status)
      return Phrase_Severity;
   --  @param Status UI/status phrase.
   --  @return Stable severity category for the phrase.

   function Security_Severity
     (Status : Security_Status)
      return Phrase_Severity;
   --  @param Status Security phrase.
   --  @return Stable severity category for the phrase.

   function Health_Severity
     (Status : Health_Status)
      return Phrase_Severity;
   --  @param Status Health phrase.
   --  @return Stable severity category for the phrase.

   function Task_Severity
     (Status : Task_Status)
      return Phrase_Severity;
   --  @param Status Task phrase.
   --  @return Stable severity category for the phrase.

   function CI_Severity
     (Status : CI_Status)
      return Phrase_Severity;
   --  @param Status CI/CD phrase.
   --  @return Stable severity category for the phrase.

   function Ticket_Severity
     (Status : Ticket_Status)
      return Phrase_Severity;
   --  @param Status Support-ticket phrase.
   --  @return Stable severity category for the phrase.

   function Payment_Lifecycle_Severity
     (Status : Payment_Lifecycle_Status)
      return Phrase_Severity;
   --  @param Status Payment lifecycle phrase.
   --  @return Stable severity category for the phrase.

   function Supported_Phrase_Locales
     return Humanize.Status.Text_Result;
   --  @return Space-separated shipped locale prefixes with phrase-pack text.

   function Status_Key
     (Status : UI_Status)
      return Humanize.Status.Text_Result;
   --  @param Status UI/status phrase.
   --  @return Stable machine key for the phrase.

   function CI_Key
     (Status : CI_Status)
      return Humanize.Status.Text_Result;
   --  @param Status CI/CD phrase.
   --  @return Stable machine key for the phrase.

   function Ticket_Key
     (Status : Ticket_Status)
      return Humanize.Status.Text_Result;
   --  @param Status Support-ticket phrase.
   --  @return Stable machine key for the phrase.

   function Payment_Lifecycle_Key
     (Status : Payment_Lifecycle_Status)
      return Humanize.Status.Text_Result;
   --  @param Status Payment lifecycle phrase.
   --  @return Stable machine key for the phrase.

   function Status_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : UI_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status UI/status phrase to render.
   --  @return Deterministic phrase text.

   function CI_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : CI_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status CI/CD phrase to render.
   --  @return Deterministic phrase text.

   function Ticket_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Ticket_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Support-ticket phrase to render.
   --  @return Deterministic phrase text.

   function Payment_Lifecycle_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Payment_Lifecycle_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Payment lifecycle phrase to render.
   --  @return Deterministic phrase text.

   procedure Status_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : UI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status UI/status phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure CI_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : CI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status CI/CD phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Ticket_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Ticket_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Support-ticket phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Payment_Lifecycle_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Payment_Lifecycle_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Payment lifecycle phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Supported_Phrase_Locales_Into
     (Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Phrase_Pack_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Domain_Label_Into
     (Domain  : Summary_Domain;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Domain Generic operational domain.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Summary_State_Label_Into
     (State   : Summary_State;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param State Generic operational state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Domain_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Domain    : Summary_Domain;
      State     : Summary_State;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Domain Generic operational domain.
   --  @param State Current lifecycle state.
   --  @param Completed Number of completed units.
   --  @param Total Total number of units when known.
   --  @param Failed Number of failed units.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Queue_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Queued    : Natural;
      Running   : Natural;
      Failed    : Natural;
      Completed : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Queued Number of queued units.
   --  @param Running Number of running units.
   --  @param Failed Number of failed units.
   --  @param Completed Number of completed units.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Cache_Summary_Into
     (Context : Humanize.Contexts.Context;
      Hits    : Natural;
      Misses  : Natural;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Hits Number of cache hits.
   --  @param Misses Number of cache misses.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Sync_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Completed Number of completed units.
   --  @param Total Total number of units when known.
   --  @param Failed Number of failed units.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Import_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Completed Number of completed units.
   --  @param Total Total number of units when known.
   --  @param Failed Number of failed units.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Export_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Completed Number of completed units.
   --  @param Total Total number of units when known.
   --  @param Failed Number of failed units.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure File_Size_Comparison_Into
     (Context        : Humanize.Contexts.Context;
      Current        : Humanize.Bytes.Byte_Count;
      Baseline       : Humanize.Bytes.Byte_Count;
      Current_Label  : String;
      Baseline_Label : String;
      Target         : in out String;
      Written        : out Natural;
      Code           : out Humanize.Status.Status_Code;
      Options        : Humanize.Bytes.Byte_Options :=
        Humanize.Bytes.Default_Byte_Options);
   --  @param Context Formatting context.
   --  @param Current Current file or byte-size value.
   --  @param Baseline Baseline file or byte-size value.
   --  @param Current_Label Label for the current value.
   --  @param Baseline_Label Label for the baseline value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.
   --  @param Options Byte unit and fraction policy.

   procedure Date_Comparison_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Humanize.Datetimes.Civil_Date_Time;
      Reference       : Humanize.Datetimes.Civil_Date_Time;
      Value_Label     : String;
      Reference_Label : String;
      Target          : in out String;
      Written         : out Natural;
      Code            : out Humanize.Status.Status_Code;
      Options         : Humanize.Datetimes.Calendar_Difference_Options :=
        Humanize.Datetimes.Default_Calendar_Difference_Options);
   --  @param Context Formatting context.
   --  @param Value Date being compared.
   --  @param Reference Reference date.
   --  @param Value_Label Label for Value.
   --  @param Reference_Label Label for Reference.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.
   --  @param Options Calendar-difference component policy.

   procedure Number_Comparison_Into
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String;
      Baseline_Label : String;
      Unit_Singular  : String;
      Unit_Plural    : String;
      Target         : in out String;
      Written        : out Natural;
      Code           : out Humanize.Status.Status_Code;
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Current Current numeric value.
   --  @param Baseline Baseline numeric value.
   --  @param Current_Label Label for the current value.
   --  @param Baseline_Label Label for the baseline value.
   --  @param Unit_Singular Optional singular unit noun.
   --  @param Unit_Plural Optional plural unit noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.
   --  @param Options Number formatting policy.

   procedure Percent_Comparison_Into
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String;
      Baseline_Label : String;
      Target         : in out String;
      Written        : out Natural;
      Code           : out Humanize.Status.Status_Code;
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Current Current numeric value.
   --  @param Baseline Baseline numeric value.
   --  @param Current_Label Label for the current value.
   --  @param Baseline_Label Label for the baseline value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.
   --  @param Options Percent formatting policy.

   procedure Status_Key_Into
     (Status  : UI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Status UI/status phrase.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure CI_Key_Into
     (Status  : CI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Status CI/CD phrase.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Ticket_Key_Into
     (Status  : Ticket_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Status Support-ticket phrase.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Payment_Lifecycle_Key_Into
     (Status  : Payment_Lifecycle_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Status Payment lifecycle phrase.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   function File_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : File_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status File-operation phrase to render.
   --  @return Deterministic phrase text.

   function Validation_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Validation_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Validation phrase to render.
   --  @return Deterministic phrase text.

   function Empty_State_Phrase
     (Context : Humanize.Contexts.Context;
      State   : Empty_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State Empty-state phrase to render.
   --  @return Deterministic phrase text.

   function Network_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Network_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Network/permission phrase to render.
   --  @return Deterministic phrase text.

   function Auth_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Auth_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Authentication/session phrase to render.
   --  @return Deterministic phrase text.

   function Billing_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Billing_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Billing/account phrase to render.
   --  @return Deterministic phrase text.

   function Workflow_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Workflow_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Workflow/review phrase to render.
   --  @return Deterministic phrase text.

   function Queue_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Queue_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Queue/job phrase to render.
   --  @return Deterministic phrase text.

   function Security_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Security_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Security phrase to render.
   --  @return Deterministic phrase text.

   function Deployment_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Deployment_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Deployment/build phrase to render.
   --  @return Deterministic phrase text.

   function Health_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Health_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Health-check phrase to render.
   --  @return Deterministic phrase text.

   function Notification_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Notification_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Notification phrase to render.
   --  @return Deterministic phrase text.

   function Form_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Form_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Form/input phrase to render.
   --  @return Deterministic phrase text.

   function Access_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Access_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Access/permission phrase to render.
   --  @return Deterministic phrase text.

   function Sync_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Sync_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Sync phrase to render.
   --  @return Deterministic phrase text.

   function Transfer_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Transfer_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Import/export phrase to render.
   --  @return Deterministic phrase text.

   function Search_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Search_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Search/filter phrase to render.
   --  @return Deterministic phrase text.

   function Collaboration_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Collaboration_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Collaboration/presence phrase to render.
   --  @return Deterministic phrase text.

   function Issue_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Issue_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Issue/PR phrase to render.
   --  @return Deterministic phrase text.

   function Task_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Task_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Task lifecycle phrase to render.
   --  @return Deterministic phrase text.

   procedure File_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : File_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status File-operation phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Validation_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Validation_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Validation phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Empty_State_Phrase_Into
     (Context : Humanize.Contexts.Context;
      State   : Empty_State;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State Empty-state phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Network_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Network_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Network/permission phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Auth_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Auth_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Authentication/session phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Billing_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Billing_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Billing/account phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Workflow_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Workflow_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Workflow/review phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Queue_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Queue_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Queue/job phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Security_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Security_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Security phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Deployment_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Deployment_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Deployment/build phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Health_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Health_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Health-check phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Notification_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Notification_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Notification phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Form_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Form_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Form/input phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Access_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Access_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Access/permission phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Sync_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Sync_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Sync phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Transfer_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Transfer_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Import/export phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Search_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Search_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Search/filter phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Collaboration_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Collaboration_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Collaboration/presence phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Issue_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Issue_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Issue/PR phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Task_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Task_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Task lifecycle phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

end Humanize.Phrases;
