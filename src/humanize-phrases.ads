with Humanize.Bytes;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Locales;
with Humanize.Numbers;
with Humanize.Status;

--  Deterministic UI/status phrase helpers.
package Humanize.Phrases is
   --  Facade map:
   --  * Humanize.Phrases.Fields: field and state labels.
   --  * Humanize.Phrases.Keys: stable phrase-key metadata.
   --  * Humanize.Phrases.Locales: phrase locale metadata.
   --  * Humanize.Phrases.Severity: severity/tone labels.
   --  * Humanize.Phrases.Statuses: reusable status phrase labels.
   --  * Humanize.Phrases.Summaries: reusable summary labels.
   --  New phrase families should prefer a child facade and keep this root
   --  package as the compatibility import surface.

   --  Facade section: status, severity, and summary types.

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

   type Backup_Status is
     (Backup_Running,
      Backup_Completed,
      Backup_Failed,
      Backup_Stale);

   type Incident_Status is
     (Incident_Investigating,
      Incident_Identified,
      Incident_Mitigated,
      Incident_Resolved);

   type Release_Status is
     (Release_Drafting,
      Release_Ready,
      Release_Published,
      Release_Rolled_Back);

   type Audit_Status is
     (Audit_Created,
      Audit_Updated,
      Audit_Deleted,
      Audit_Restored);

   type Feature_Flag_Status is
     (Flag_Enabled,
      Flag_Disabled,
      Flag_Rolling_Out,
      Flag_Rolled_Back);

   type Webhook_Status is
     (Webhook_Pending,
      Webhook_Delivered,
      Webhook_Failed,
      Webhook_Retrying);

   type API_Key_Status is
     (API_Key_Active,
      API_Key_Revoked,
      API_Key_Expired,
      API_Key_Rotated);

   type Quota_Status is
     (Quota_Available,
      Quota_Near_Limit,
      Quota_Exceeded,
      Quota_Reset);

   type Invoice_Status is
     (Invoice_Draft,
      Invoice_Sent,
      Invoice_Paid,
      Invoice_Refunded,
      Invoice_Overdue,
      Refund_Failed);

   type Database_Status is
     (Database_Online,
      Database_Offline,
      Database_Degraded,
      Database_Migrating,
      Database_Migration_Failed,
      Database_Replicating,
      Database_Replication_Lagging,
      Database_Backup_Running,
      Database_Backup_Failed);

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

   --  Facade section: severity, tone, and summary labels.

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

   function Backup_Severity
     (Status : Backup_Status)
      return Phrase_Severity;
   --  @param Status Backup phrase.
   --  @return Stable severity category for the phrase.

   function Incident_Severity
     (Status : Incident_Status)
      return Phrase_Severity;
   --  @param Status Incident phrase.
   --  @return Stable severity category for the phrase.

   function Release_Severity
     (Status : Release_Status)
      return Phrase_Severity;
   --  @param Status Release phrase.
   --  @return Stable severity category for the phrase.

   function Audit_Severity (Status : Audit_Status) return Phrase_Severity;
   --  @param Status Audit phrase.
   --  @return Stable severity category for the phrase.

   function Feature_Flag_Severity
     (Status : Feature_Flag_Status) return Phrase_Severity;
   --  @param Status Feature-flag phrase.
   --  @return Stable severity category for the phrase.

   function Webhook_Severity (Status : Webhook_Status) return Phrase_Severity;
   --  @param Status Webhook phrase.
   --  @return Stable severity category for the phrase.

   function API_Key_Severity (Status : API_Key_Status) return Phrase_Severity;
   --  @param Status API-key phrase.
   --  @return Stable severity category for the phrase.

   function Quota_Severity (Status : Quota_Status) return Phrase_Severity;
   --  @param Status Quota phrase.
   --  @return Stable severity category for the phrase.

   function Invoice_Severity (Status : Invoice_Status) return Phrase_Severity;
   --  @param Status Invoice/refund phrase.
   --  @return Stable severity category for the phrase.

   function Database_Severity
     (Status : Database_Status)
      return Phrase_Severity;
   --  @param Status Database/storage phrase.
   --  @return Stable severity category for the phrase.

   --  Facade section: locale and phrase-key metadata.

   Phrase_Locale_Count : constant Positive := 22;

   Generated_Phrase_Locale_Count : constant Positive := 19;

   subtype Phrase_Locale_List is
     Humanize.Locales.Locale_Code_Array (1 .. Phrase_Locale_Count);

   subtype Generated_Phrase_Locale_List is
     Humanize.Locales.Locale_Code_Array (1 .. Generated_Phrase_Locale_Count);

   function Phrase_Locales return Phrase_Locale_List;
   --  @return Locale prefixes with Humanize-owned phrase-pack text.

   function Generated_Phrase_Locales return Generated_Phrase_Locale_List;
   --  @return Locale prefixes whose phrase-pack text is generated.

   function Is_Supported_Phrase_Locale (Locale : String) return Boolean;
   --  @param Locale Locale prefix or tag, such as "en" or "ja-JP".
   --  @return True when Humanize.Phrases has phrase-pack text for Locale.

   function Is_Generated_Phrase_Locale (Locale : String) return Boolean;
   --  @param Locale Locale prefix or tag, such as "sv" or "ar-EG".
   --  @return True when Locale uses generated-source phrase-pack text.

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

   function Backup_Key
     (Status : Backup_Status)
      return Humanize.Status.Text_Result;
   --  @param Status Backup phrase.
   --  @return Stable machine key for the phrase.

   function Incident_Key
     (Status : Incident_Status)
      return Humanize.Status.Text_Result;
   --  @param Status Incident phrase.
   --  @return Stable machine key for the phrase.

   function Release_Key
     (Status : Release_Status)
      return Humanize.Status.Text_Result;
   --  @param Status Release phrase.
   --  @return Stable machine key for the phrase.

   function Audit_Key
     (Status : Audit_Status)
      return Humanize.Status.Text_Result;
   --  @param Status Audit phrase.
   --  @return Stable machine key for the phrase.

   function Feature_Flag_Key
     (Status : Feature_Flag_Status)
      return Humanize.Status.Text_Result;
   --  @param Status Feature-flag phrase.
   --  @return Stable machine key for the phrase.

   function Webhook_Key
     (Status : Webhook_Status)
      return Humanize.Status.Text_Result;
   --  @param Status Webhook phrase.
   --  @return Stable machine key for the phrase.

   function API_Key_Key
     (Status : API_Key_Status)
      return Humanize.Status.Text_Result;
   --  @param Status API-key phrase.
   --  @return Stable machine key for the phrase.

   function Quota_Key
     (Status : Quota_Status)
      return Humanize.Status.Text_Result;
   --  @param Status Quota phrase.
   --  @return Stable machine key for the phrase.

   function Invoice_Key
     (Status : Invoice_Status)
      return Humanize.Status.Text_Result;
   --  @param Status Invoice/refund phrase.
   --  @return Stable machine key for the phrase.

   --  Facade section: status phrase renderers.

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

   function Backup_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Backup_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Backup phrase to render.
   --  @return Deterministic phrase text.

   function Incident_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Incident_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Incident phrase to render.
   --  @return Deterministic phrase text.

   function Release_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Release_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Release phrase to render.
   --  @return Deterministic phrase text.

   function Audit_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Audit_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Audit phrase to render.
   --  @return Deterministic phrase text.

   function Feature_Flag_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Feature_Flag_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Feature-flag phrase to render.
   --  @return Deterministic phrase text.

   function Webhook_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Webhook_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Webhook phrase to render.
   --  @return Deterministic phrase text.

   function API_Key_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : API_Key_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status API-key phrase to render.
   --  @return Deterministic phrase text.

   function Quota_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Quota_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Quota phrase to render.
   --  @return Deterministic phrase text.

   function Invoice_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Invoice_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Invoice/refund phrase to render.
   --  @return Deterministic phrase text.

   function Database_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Database_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status Database/storage phrase to render.
   --  @return Deterministic phrase text.

   --  Facade section: field and comparison summaries.

   function Field_Change_Summary
     (Context  : Humanize.Contexts.Context;
      Changed  : Natural;
      Added    : Natural;
      Removed  : Natural;
      Singular : String := "field";
      Plural   : String := "fields")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Changed Count of modified fields.
   --  @param Added Count of added fields.
   --  @param Removed Count of removed fields.
   --  @param Singular Singular unit label.
   --  @param Plural Plural unit label.
   --  @return Compact deterministic change summary.

   function Field_Diff_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Before  : String;
      After   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field Field name.
   --  @param Before Previous value label.
   --  @param After New value label.
   --  @return Deterministic field-level change summary.

   function Field_Added_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field Field name.
   --  @param Value Added value label.
   --  @return Deterministic field-added summary.

   function Field_Removed_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field Field name.
   --  @param Value Removed value label.
   --  @return Deterministic field-removed summary.

   function Field_Unchanged_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field Field name.
   --  @param Value Current value label.
   --  @return Deterministic unchanged-field summary.

   --  Facade section: bounded output adapters.

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

   procedure Backup_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Backup_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Backup phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Incident_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Incident_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Incident phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Release_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Release_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Release phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Audit_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Audit_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Audit phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Feature_Flag_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Feature_Flag_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Feature-flag phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Webhook_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Webhook_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Webhook phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure API_Key_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : API_Key_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status API-key phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Quota_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Quota_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Quota phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Invoice_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Invoice_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Invoice/refund phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Database_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Database_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Status Database/storage phrase to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Field_Change_Summary_Into
     (Context  : Humanize.Contexts.Context;
      Changed  : Natural;
      Added    : Natural;
      Removed  : Natural;
      Singular : String;
      Plural   : String;
      Target   : in out String;
      Written  : out Natural;
      Code     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Changed Count of modified fields.
   --  @param Added Count of added fields.
   --  @param Removed Count of removed fields.
   --  @param Singular Singular unit label.
   --  @param Plural Plural unit label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Field_Diff_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Before  : String;
      After   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field Field name.
   --  @param Before Previous value label.
   --  @param After New value label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Field_Added_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field Field name.
   --  @param Value Added value label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Field_Removed_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field Field name.
   --  @param Value Removed value label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Field_Unchanged_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field Field name.
   --  @param Value Current value label.
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

   procedure Backup_Key_Into
     (Status  : Backup_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Status Backup phrase.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Incident_Key_Into
     (Status  : Incident_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Status Incident phrase.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   procedure Release_Key_Into
     (Status  : Release_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
   --  @param Status Release phrase.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.

   --  Facade section: compatibility status-family phrase renderers.

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
