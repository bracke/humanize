with Humanize.Bytes;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Locales;
with Humanize.Numbers;
with Humanize.Status;

package Humanize.Phrases.Support is

   function Severity_Label
     (Severity : Phrase_Severity)
      return Humanize.Status.Text_Result;

   function Tone_For_Severity
     (Severity : Phrase_Severity)
      return Phrase_Tone;

   function Tone_Label
     (Tone : Phrase_Tone)
      return Humanize.Status.Text_Result;

   procedure Severity_Label_Into
     (Severity : Phrase_Severity;
      Target   : in out String;
      Written  : out Natural;
      Code     : out Humanize.Status.Status_Code);

   procedure Tone_Label_Into
     (Tone    : Phrase_Tone;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   function Phrase_Pack_Summary
     return Humanize.Status.Text_Result;

   function Domain_Label
     (Domain : Summary_Domain)
      return Humanize.Status.Text_Result;

   function Summary_State_Label
     (State : Summary_State)
      return Humanize.Status.Text_Result;

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

   function Queue_Summary
     (Context   : Humanize.Contexts.Context;
      Queued    : Natural;
      Running   : Natural;
      Failed    : Natural := 0;
      Completed : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result;

   function Cache_Summary
     (Context : Humanize.Contexts.Context;
      Hits    : Natural;
      Misses  : Natural)
      return Humanize.Status.Text_Result;

   function Sync_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result;

   function Import_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result;

   function Export_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result;

   function File_Size_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Humanize.Bytes.Byte_Count;
      Baseline       : Humanize.Bytes.Byte_Count;
      Current_Label  : String := "file";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Bytes.Byte_Options :=
        Humanize.Bytes.Default_Byte_Options)
      return Humanize.Status.Text_Result;

   function Date_Comparison
     (Context        : Humanize.Contexts.Context;
      Value          : Humanize.Datetimes.Civil_Date_Time;
      Reference      : Humanize.Datetimes.Civil_Date_Time;
      Value_Label    : String := "date";
      Reference_Label : String := "reference";
      Options        : Humanize.Datetimes.Calendar_Difference_Options :=
        Humanize.Datetimes.Default_Calendar_Difference_Options)
      return Humanize.Status.Text_Result;

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

   function Percent_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String := "value";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;

   function Status_Severity
     (Status : UI_Status)
      return Phrase_Severity;

   function Security_Severity
     (Status : Security_Status)
      return Phrase_Severity;

   function Health_Severity
     (Status : Health_Status)
      return Phrase_Severity;

   function Task_Severity
     (Status : Task_Status)
      return Phrase_Severity;

   function CI_Severity
     (Status : CI_Status)
      return Phrase_Severity;

   function Ticket_Severity
     (Status : Ticket_Status)
      return Phrase_Severity;

   function Payment_Lifecycle_Severity
     (Status : Payment_Lifecycle_Status)
      return Phrase_Severity;

   function Backup_Severity
     (Status : Backup_Status)
      return Phrase_Severity;

   function Incident_Severity
     (Status : Incident_Status)
      return Phrase_Severity;

   function Release_Severity
     (Status : Release_Status)
      return Phrase_Severity;

   function Audit_Severity (Status : Audit_Status) return Phrase_Severity;

   function Feature_Flag_Severity
     (Status : Feature_Flag_Status) return Phrase_Severity;

   function Webhook_Severity (Status : Webhook_Status) return Phrase_Severity;

   function API_Key_Severity (Status : API_Key_Status) return Phrase_Severity;

   function Quota_Severity (Status : Quota_Status) return Phrase_Severity;

   function Invoice_Severity (Status : Invoice_Status) return Phrase_Severity;

   function Database_Severity
     (Status : Database_Status)
      return Phrase_Severity;

   function Phrase_Locales return Phrase_Locale_List;

   function Generated_Phrase_Locales return Generated_Phrase_Locale_List;

   function Is_Supported_Phrase_Locale (Locale : String) return Boolean;

   function Is_Generated_Phrase_Locale (Locale : String) return Boolean;

   function Supported_Phrase_Locales
     return Humanize.Status.Text_Result;

   function Status_Key
     (Status : UI_Status)
      return Humanize.Status.Text_Result;

   function CI_Key
     (Status : CI_Status)
      return Humanize.Status.Text_Result;

   function Ticket_Key
     (Status : Ticket_Status)
      return Humanize.Status.Text_Result;

   function Payment_Lifecycle_Key
     (Status : Payment_Lifecycle_Status)
      return Humanize.Status.Text_Result;

   function Backup_Key
     (Status : Backup_Status)
      return Humanize.Status.Text_Result;

   function Incident_Key
     (Status : Incident_Status)
      return Humanize.Status.Text_Result;

   function Release_Key
     (Status : Release_Status)
      return Humanize.Status.Text_Result;

   function Audit_Key
     (Status : Audit_Status)
      return Humanize.Status.Text_Result;

   function Feature_Flag_Key
     (Status : Feature_Flag_Status)
      return Humanize.Status.Text_Result;

   function Webhook_Key
     (Status : Webhook_Status)
      return Humanize.Status.Text_Result;

   function API_Key_Key
     (Status : API_Key_Status)
      return Humanize.Status.Text_Result;

   function Quota_Key
     (Status : Quota_Status)
      return Humanize.Status.Text_Result;

   function Invoice_Key
     (Status : Invoice_Status)
      return Humanize.Status.Text_Result;

   function Status_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : UI_Status)
      return Humanize.Status.Text_Result;

   function CI_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : CI_Status)
      return Humanize.Status.Text_Result;

   function Ticket_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Ticket_Status)
      return Humanize.Status.Text_Result;

   function Payment_Lifecycle_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Payment_Lifecycle_Status)
      return Humanize.Status.Text_Result;

   function Backup_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Backup_Status)
      return Humanize.Status.Text_Result;

   function Incident_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Incident_Status)
      return Humanize.Status.Text_Result;

   function Release_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Release_Status)
      return Humanize.Status.Text_Result;

   function Audit_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Audit_Status)
      return Humanize.Status.Text_Result;

   function Feature_Flag_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Feature_Flag_Status)
      return Humanize.Status.Text_Result;

   function Webhook_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Webhook_Status)
      return Humanize.Status.Text_Result;

   function API_Key_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : API_Key_Status)
      return Humanize.Status.Text_Result;

   function Quota_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Quota_Status)
      return Humanize.Status.Text_Result;

   function Invoice_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Invoice_Status)
      return Humanize.Status.Text_Result;

   function Database_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Database_Status)
      return Humanize.Status.Text_Result;

   function Field_Change_Summary
     (Context  : Humanize.Contexts.Context;
      Changed  : Natural;
      Added    : Natural;
      Removed  : Natural;
      Singular : String := "field";
      Plural   : String := "fields")
      return Humanize.Status.Text_Result;

   function Field_Diff_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Before  : String;
      After   : String)
      return Humanize.Status.Text_Result;

   function Field_Added_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result;

   function Field_Removed_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result;

   function Field_Unchanged_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result;

   procedure Status_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : UI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure CI_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : CI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Ticket_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Ticket_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Payment_Lifecycle_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Payment_Lifecycle_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Backup_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Backup_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Incident_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Incident_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Release_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Release_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Audit_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Audit_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Feature_Flag_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Feature_Flag_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Webhook_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Webhook_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure API_Key_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : API_Key_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Quota_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Quota_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Invoice_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Invoice_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Database_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Database_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

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

   procedure Field_Diff_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Before  : String;
      After   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Field_Added_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Field_Removed_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Field_Unchanged_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Supported_Phrase_Locales_Into
     (Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Phrase_Pack_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Domain_Label_Into
     (Domain  : Summary_Domain;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Summary_State_Label_Into
     (State   : Summary_State;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

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

   procedure Cache_Summary_Into
     (Context : Humanize.Contexts.Context;
      Hits    : Natural;
      Misses  : Natural;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

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

   procedure Status_Key_Into
     (Status  : UI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure CI_Key_Into
     (Status  : CI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Ticket_Key_Into
     (Status  : Ticket_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Payment_Lifecycle_Key_Into
     (Status  : Payment_Lifecycle_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Backup_Key_Into
     (Status  : Backup_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Incident_Key_Into
     (Status  : Incident_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Release_Key_Into
     (Status  : Release_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   function File_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : File_Status)
      return Humanize.Status.Text_Result;

   function Validation_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Validation_Status)
      return Humanize.Status.Text_Result;

   function Empty_State_Phrase
     (Context : Humanize.Contexts.Context;
      State   : Empty_State)
      return Humanize.Status.Text_Result;

   function Network_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Network_Status)
      return Humanize.Status.Text_Result;

   function Auth_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Auth_Status)
      return Humanize.Status.Text_Result;

   function Billing_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Billing_Status)
      return Humanize.Status.Text_Result;

   function Workflow_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Workflow_Status)
      return Humanize.Status.Text_Result;

   function Queue_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Queue_Status)
      return Humanize.Status.Text_Result;

   function Security_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Security_Status)
      return Humanize.Status.Text_Result;

   function Deployment_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Deployment_Status)
      return Humanize.Status.Text_Result;

   function Health_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Health_Status)
      return Humanize.Status.Text_Result;

   function Notification_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Notification_Status)
      return Humanize.Status.Text_Result;

   function Form_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Form_Status)
      return Humanize.Status.Text_Result;

   function Access_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Access_Status)
      return Humanize.Status.Text_Result;

   function Sync_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Sync_Status)
      return Humanize.Status.Text_Result;

   function Transfer_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Transfer_Status)
      return Humanize.Status.Text_Result;

   function Search_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Search_Status)
      return Humanize.Status.Text_Result;

   function Collaboration_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Collaboration_Status)
      return Humanize.Status.Text_Result;

   function Issue_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Issue_Status)
      return Humanize.Status.Text_Result;

   function Task_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Task_Status)
      return Humanize.Status.Text_Result;

   procedure File_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : File_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Validation_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Validation_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Empty_State_Phrase_Into
     (Context : Humanize.Contexts.Context;
      State   : Empty_State;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Network_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Network_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Auth_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Auth_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Billing_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Billing_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Workflow_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Workflow_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Queue_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Queue_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Security_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Security_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Deployment_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Deployment_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Health_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Health_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Notification_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Notification_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Form_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Form_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Access_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Access_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Sync_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Sync_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Transfer_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Transfer_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Search_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Search_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Collaboration_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Collaboration_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Issue_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Issue_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Task_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Task_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
end Humanize.Phrases.Support;
