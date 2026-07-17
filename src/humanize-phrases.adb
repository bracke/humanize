with Humanize.Phrases.Severity;
with Humanize.Phrases.Locales;
with Humanize.Phrases.Summaries;
with Humanize.Phrases.Keys;
with Humanize.Phrases.Statuses;
with Humanize.Phrases.Fields;

package body Humanize.Phrases is
   package Phrase_Sev renames Humanize.Phrases.Severity;
   package Phrase_Loc renames Humanize.Phrases.Locales;
   package Phrase_Sum renames Humanize.Phrases.Summaries;
   package Phrase_Key_Pkg renames Humanize.Phrases.Keys;
   package Phrase_Stat renames Humanize.Phrases.Statuses;
   package Phrase_Fld renames Humanize.Phrases.Fields;

   function Severity_Label
     (Severity : Phrase_Severity)
      return Humanize.Status.Text_Result renames Phrase_Sev.Severity_Label;

   function Tone_For_Severity
     (Severity : Phrase_Severity)
      return Phrase_Tone renames Phrase_Sev.Tone_For_Severity;

   function Tone_Label
     (Tone : Phrase_Tone)
      return Humanize.Status.Text_Result renames Phrase_Sev.Tone_Label;

   procedure Severity_Label_Into
     (Severity : Phrase_Severity;
      Target   : in out String;
      Written  : out Natural;
      Code     : out Humanize.Status.Status_Code) renames Phrase_Sev.Severity_Label_Into;

   procedure Tone_Label_Into
     (Tone    : Phrase_Tone;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Sev.Tone_Label_Into;

   function Phrase_Pack_Summary
     return Humanize.Status.Text_Result renames Phrase_Loc.Phrase_Pack_Summary;

   function Domain_Label
     (Domain : Summary_Domain)
      return Humanize.Status.Text_Result renames Phrase_Sum.Domain_Label;

   function Summary_State_Label
     (State : Summary_State)
      return Humanize.Status.Text_Result renames Phrase_Sum.Summary_State_Label;

   function Domain_Summary
     (Context   : Humanize.Contexts.Context;
      Domain    : Summary_Domain;
      State     : Summary_State;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result renames Phrase_Sum.Domain_Summary;

   function Queue_Summary
     (Context   : Humanize.Contexts.Context;
      Queued    : Natural;
      Running   : Natural;
      Failed    : Natural := 0;
      Completed : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result renames Phrase_Sum.Queue_Summary;

   function Cache_Summary
     (Context : Humanize.Contexts.Context;
      Hits    : Natural;
      Misses  : Natural)
      return Humanize.Status.Text_Result renames Phrase_Sum.Cache_Summary;

   function Sync_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result renames Phrase_Sum.Sync_Summary;

   function Import_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result renames Phrase_Sum.Import_Summary;

   function Export_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result renames Phrase_Sum.Export_Summary;

   function File_Size_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Humanize.Bytes.Byte_Count;
      Baseline       : Humanize.Bytes.Byte_Count;
      Current_Label  : String := "file";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Bytes.Byte_Options :=
        Humanize.Bytes.Default_Byte_Options)
      return Humanize.Status.Text_Result renames Phrase_Sum.File_Size_Comparison;

   function Date_Comparison
     (Context        : Humanize.Contexts.Context;
      Value          : Humanize.Datetimes.Civil_Date_Time;
      Reference      : Humanize.Datetimes.Civil_Date_Time;
      Value_Label    : String := "date";
      Reference_Label : String := "reference";
      Options        : Humanize.Datetimes.Calendar_Difference_Options :=
        Humanize.Datetimes.Default_Calendar_Difference_Options)
      return Humanize.Status.Text_Result renames Phrase_Sum.Date_Comparison;

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
      return Humanize.Status.Text_Result renames Phrase_Sum.Number_Comparison;

   function Percent_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String := "value";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result renames Phrase_Sum.Percent_Comparison;

   function Status_Severity
     (Status : UI_Status)
      return Phrase_Severity renames Phrase_Sev.Status_Severity;

   function Security_Severity
     (Status : Security_Status)
      return Phrase_Severity renames Phrase_Sev.Security_Severity;

   function Health_Severity
     (Status : Health_Status)
      return Phrase_Severity renames Phrase_Sev.Health_Severity;

   function Task_Severity
     (Status : Task_Status)
      return Phrase_Severity renames Phrase_Sev.Task_Severity;

   function CI_Severity
     (Status : CI_Status)
      return Phrase_Severity renames Phrase_Sev.CI_Severity;

   function Ticket_Severity
     (Status : Ticket_Status)
      return Phrase_Severity renames Phrase_Sev.Ticket_Severity;

   function Payment_Lifecycle_Severity
     (Status : Payment_Lifecycle_Status)
      return Phrase_Severity renames Phrase_Sev.Payment_Lifecycle_Severity;

   function Backup_Severity
     (Status : Backup_Status)
      return Phrase_Severity renames Phrase_Sev.Backup_Severity;

   function Incident_Severity
     (Status : Incident_Status)
      return Phrase_Severity renames Phrase_Sev.Incident_Severity;

   function Release_Severity
     (Status : Release_Status)
      return Phrase_Severity renames Phrase_Sev.Release_Severity;

   function Audit_Severity (Status : Audit_Status) return Phrase_Severity renames Phrase_Sev.Audit_Severity;

   function Feature_Flag_Severity
     (Status : Feature_Flag_Status) return Phrase_Severity renames Phrase_Sev.Feature_Flag_Severity;

   function Webhook_Severity (Status : Webhook_Status) return Phrase_Severity renames Phrase_Sev.Webhook_Severity;

   function API_Key_Severity (Status : API_Key_Status) return Phrase_Severity renames Phrase_Sev.API_Key_Severity;

   function Quota_Severity (Status : Quota_Status) return Phrase_Severity renames Phrase_Sev.Quota_Severity;

   function Invoice_Severity (Status : Invoice_Status) return Phrase_Severity renames Phrase_Sev.Invoice_Severity;

   function Database_Severity
     (Status : Database_Status)
      return Phrase_Severity renames Phrase_Sev.Database_Severity;

   function Phrase_Locales return Phrase_Locale_List renames Phrase_Loc.Phrase_Locales;

   function Generated_Phrase_Locales return Generated_Phrase_Locale_List renames Phrase_Loc.Generated_Phrase_Locales;

   function Is_Supported_Phrase_Locale (Locale : String) return Boolean renames Phrase_Loc.Is_Supported_Phrase_Locale;

   function Is_Generated_Phrase_Locale (Locale : String) return Boolean renames Phrase_Loc.Is_Generated_Phrase_Locale;

   function Supported_Phrase_Locales
     return Humanize.Status.Text_Result renames Phrase_Loc.Supported_Phrase_Locales;

   function Status_Key
     (Status : UI_Status)
      return Humanize.Status.Text_Result renames Phrase_Key_Pkg.Status_Key;

   function CI_Key
     (Status : CI_Status)
      return Humanize.Status.Text_Result renames Phrase_Key_Pkg.CI_Key;

   function Ticket_Key
     (Status : Ticket_Status)
      return Humanize.Status.Text_Result renames Phrase_Key_Pkg.Ticket_Key;

   function Payment_Lifecycle_Key
     (Status : Payment_Lifecycle_Status)
      return Humanize.Status.Text_Result renames Phrase_Key_Pkg.Payment_Lifecycle_Key;

   function Backup_Key
     (Status : Backup_Status)
      return Humanize.Status.Text_Result renames Phrase_Key_Pkg.Backup_Key;

   function Incident_Key
     (Status : Incident_Status)
      return Humanize.Status.Text_Result renames Phrase_Key_Pkg.Incident_Key;

   function Release_Key
     (Status : Release_Status)
      return Humanize.Status.Text_Result renames Phrase_Key_Pkg.Release_Key;

   function Audit_Key
     (Status : Audit_Status)
      return Humanize.Status.Text_Result renames Phrase_Key_Pkg.Audit_Key;

   function Feature_Flag_Key
     (Status : Feature_Flag_Status)
      return Humanize.Status.Text_Result renames Phrase_Key_Pkg.Feature_Flag_Key;

   function Webhook_Key
     (Status : Webhook_Status)
      return Humanize.Status.Text_Result renames Phrase_Key_Pkg.Webhook_Key;

   function API_Key_Key
     (Status : API_Key_Status)
      return Humanize.Status.Text_Result renames Phrase_Key_Pkg.API_Key_Key;

   function Quota_Key
     (Status : Quota_Status)
      return Humanize.Status.Text_Result renames Phrase_Key_Pkg.Quota_Key;

   function Invoice_Key
     (Status : Invoice_Status)
      return Humanize.Status.Text_Result renames Phrase_Key_Pkg.Invoice_Key;

   function Status_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : UI_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Status_Phrase;

   function CI_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : CI_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.CI_Phrase;

   function Ticket_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Ticket_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Ticket_Phrase;

   function Payment_Lifecycle_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Payment_Lifecycle_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Payment_Lifecycle_Phrase;

   function Backup_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Backup_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Backup_Phrase;

   function Incident_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Incident_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Incident_Phrase;

   function Release_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Release_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Release_Phrase;

   function Audit_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Audit_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Audit_Phrase;

   function Feature_Flag_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Feature_Flag_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Feature_Flag_Phrase;

   function Webhook_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Webhook_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Webhook_Phrase;

   function API_Key_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : API_Key_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.API_Key_Phrase;

   function Quota_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Quota_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Quota_Phrase;

   function Invoice_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Invoice_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Invoice_Phrase;

   function Database_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Database_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Database_Phrase;

   function Field_Change_Summary
     (Context  : Humanize.Contexts.Context;
      Changed  : Natural;
      Added    : Natural;
      Removed  : Natural;
      Singular : String := "field";
      Plural   : String := "fields")
      return Humanize.Status.Text_Result renames Phrase_Fld.Field_Change_Summary;

   function Field_Diff_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Before  : String;
      After   : String)
      return Humanize.Status.Text_Result renames Phrase_Fld.Field_Diff_Summary;

   function Field_Added_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result renames Phrase_Fld.Field_Added_Summary;

   function Field_Removed_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result renames Phrase_Fld.Field_Removed_Summary;

   function Field_Unchanged_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result renames Phrase_Fld.Field_Unchanged_Summary;

   procedure Status_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : UI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Status_Phrase_Into;

   procedure CI_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : CI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.CI_Phrase_Into;

   procedure Ticket_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Ticket_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Ticket_Phrase_Into;

   procedure Payment_Lifecycle_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Payment_Lifecycle_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Payment_Lifecycle_Phrase_Into;

   procedure Backup_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Backup_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Backup_Phrase_Into;

   procedure Incident_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Incident_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Incident_Phrase_Into;

   procedure Release_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Release_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Release_Phrase_Into;

   procedure Audit_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Audit_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Audit_Phrase_Into;

   procedure Feature_Flag_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Feature_Flag_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Feature_Flag_Phrase_Into;

   procedure Webhook_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Webhook_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Webhook_Phrase_Into;

   procedure API_Key_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : API_Key_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.API_Key_Phrase_Into;

   procedure Quota_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Quota_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Quota_Phrase_Into;

   procedure Invoice_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Invoice_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Invoice_Phrase_Into;

   procedure Database_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Database_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Database_Phrase_Into;

   procedure Field_Change_Summary_Into
     (Context  : Humanize.Contexts.Context;
      Changed  : Natural;
      Added    : Natural;
      Removed  : Natural;
      Singular : String;
      Plural   : String;
      Target   : in out String;
      Written  : out Natural;
      Code     : out Humanize.Status.Status_Code) renames Phrase_Fld.Field_Change_Summary_Into;

   procedure Field_Diff_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Before  : String;
      After   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Fld.Field_Diff_Summary_Into;

   procedure Field_Added_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Fld.Field_Added_Summary_Into;

   procedure Field_Removed_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Fld.Field_Removed_Summary_Into;

   procedure Field_Unchanged_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Fld.Field_Unchanged_Summary_Into;

   procedure Supported_Phrase_Locales_Into
     (Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Loc.Supported_Phrase_Locales_Into;

   procedure Phrase_Pack_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Loc.Phrase_Pack_Summary_Into;

   procedure Domain_Label_Into
     (Domain  : Summary_Domain;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Sum.Domain_Label_Into;

   procedure Summary_State_Label_Into
     (State   : Summary_State;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Sum.Summary_State_Label_Into;

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
      Code      : out Humanize.Status.Status_Code) renames Phrase_Sum.Domain_Summary_Into;

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
      Code      : out Humanize.Status.Status_Code) renames Phrase_Sum.Queue_Summary_Into;

   procedure Cache_Summary_Into
     (Context : Humanize.Contexts.Context;
      Hits    : Natural;
      Misses  : Natural;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Sum.Cache_Summary_Into;

   procedure Sync_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code) renames Phrase_Sum.Sync_Summary_Into;

   procedure Import_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code) renames Phrase_Sum.Import_Summary_Into;

   procedure Export_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code) renames Phrase_Sum.Export_Summary_Into;

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
        Humanize.Bytes.Default_Byte_Options) renames Phrase_Sum.File_Size_Comparison_Into;

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
        Humanize.Datetimes.Default_Calendar_Difference_Options) renames Phrase_Sum.Date_Comparison_Into;

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
        Humanize.Numbers.Default_Number_Options) renames Phrase_Sum.Number_Comparison_Into;

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
        Humanize.Numbers.Default_Number_Options) renames Phrase_Sum.Percent_Comparison_Into;

   procedure Status_Key_Into
     (Status  : UI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Key_Pkg.Status_Key_Into;

   procedure CI_Key_Into
     (Status  : CI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Key_Pkg.CI_Key_Into;

   procedure Ticket_Key_Into
     (Status  : Ticket_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Key_Pkg.Ticket_Key_Into;

   procedure Payment_Lifecycle_Key_Into
     (Status  : Payment_Lifecycle_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Key_Pkg.Payment_Lifecycle_Key_Into;

   procedure Backup_Key_Into
     (Status  : Backup_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Key_Pkg.Backup_Key_Into;

   procedure Incident_Key_Into
     (Status  : Incident_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Key_Pkg.Incident_Key_Into;

   procedure Release_Key_Into
     (Status  : Release_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Key_Pkg.Release_Key_Into;

   function File_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : File_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.File_Phrase;

   function Validation_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Validation_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Validation_Phrase;

   function Empty_State_Phrase
     (Context : Humanize.Contexts.Context;
      State   : Empty_State)
      return Humanize.Status.Text_Result renames Phrase_Stat.Empty_State_Phrase;

   function Network_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Network_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Network_Phrase;

   function Auth_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Auth_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Auth_Phrase;

   function Billing_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Billing_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Billing_Phrase;

   function Workflow_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Workflow_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Workflow_Phrase;

   function Queue_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Queue_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Queue_Phrase;

   function Security_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Security_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Security_Phrase;

   function Deployment_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Deployment_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Deployment_Phrase;

   function Health_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Health_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Health_Phrase;

   function Notification_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Notification_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Notification_Phrase;

   function Form_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Form_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Form_Phrase;

   function Access_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Access_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Access_Phrase;

   function Sync_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Sync_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Sync_Phrase;

   function Transfer_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Transfer_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Transfer_Phrase;

   function Search_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Search_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Search_Phrase;

   function Collaboration_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Collaboration_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Collaboration_Phrase;

   function Issue_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Issue_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Issue_Phrase;

   function Task_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Task_Status)
      return Humanize.Status.Text_Result renames Phrase_Stat.Task_Phrase;

   procedure File_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : File_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.File_Phrase_Into;

   procedure Validation_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Validation_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Validation_Phrase_Into;

   procedure Empty_State_Phrase_Into
     (Context : Humanize.Contexts.Context;
      State   : Empty_State;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Empty_State_Phrase_Into;

   procedure Network_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Network_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Network_Phrase_Into;

   procedure Auth_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Auth_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Auth_Phrase_Into;

   procedure Billing_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Billing_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Billing_Phrase_Into;

   procedure Workflow_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Workflow_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Workflow_Phrase_Into;

   procedure Queue_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Queue_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Queue_Phrase_Into;

   procedure Security_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Security_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Security_Phrase_Into;

   procedure Deployment_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Deployment_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Deployment_Phrase_Into;

   procedure Health_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Health_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Health_Phrase_Into;

   procedure Notification_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Notification_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Notification_Phrase_Into;

   procedure Form_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Form_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Form_Phrase_Into;

   procedure Access_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Access_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Access_Phrase_Into;

   procedure Sync_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Sync_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Sync_Phrase_Into;

   procedure Transfer_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Transfer_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Transfer_Phrase_Into;

   procedure Search_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Search_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Search_Phrase_Into;

   procedure Collaboration_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Collaboration_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Collaboration_Phrase_Into;

   procedure Issue_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Issue_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Issue_Phrase_Into;

   procedure Task_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Task_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Phrase_Stat.Task_Phrase_Into;
end Humanize.Phrases;
