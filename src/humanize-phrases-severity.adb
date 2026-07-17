with Humanize.Phrases.Support;

package body Humanize.Phrases.Severity is
   package Shared renames Humanize.Phrases.Support;

   function Severity_Label
     (Severity : Phrase_Severity)
      return Humanize.Status.Text_Result renames Shared.Severity_Label;

   function Tone_For_Severity
     (Severity : Phrase_Severity)
      return Phrase_Tone renames Shared.Tone_For_Severity;

   function Tone_Label
     (Tone : Phrase_Tone)
      return Humanize.Status.Text_Result renames Shared.Tone_Label;

   procedure Severity_Label_Into
     (Severity : Phrase_Severity;
      Target   : in out String;
      Written  : out Natural;
      Code     : out Humanize.Status.Status_Code) renames Shared.Severity_Label_Into;

   procedure Tone_Label_Into
     (Tone    : Phrase_Tone;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Tone_Label_Into;

   function Status_Severity
     (Status : UI_Status)
      return Phrase_Severity renames Shared.Status_Severity;

   function Security_Severity
     (Status : Security_Status)
      return Phrase_Severity renames Shared.Security_Severity;

   function Health_Severity
     (Status : Health_Status)
      return Phrase_Severity renames Shared.Health_Severity;

   function Task_Severity
     (Status : Task_Status)
      return Phrase_Severity renames Shared.Task_Severity;

   function CI_Severity
     (Status : CI_Status)
      return Phrase_Severity renames Shared.CI_Severity;

   function Ticket_Severity
     (Status : Ticket_Status)
      return Phrase_Severity renames Shared.Ticket_Severity;

   function Payment_Lifecycle_Severity
     (Status : Payment_Lifecycle_Status)
      return Phrase_Severity renames Shared.Payment_Lifecycle_Severity;

   function Backup_Severity
     (Status : Backup_Status)
      return Phrase_Severity renames Shared.Backup_Severity;

   function Incident_Severity
     (Status : Incident_Status)
      return Phrase_Severity renames Shared.Incident_Severity;

   function Release_Severity
     (Status : Release_Status)
      return Phrase_Severity renames Shared.Release_Severity;

   function Audit_Severity (Status : Audit_Status) return Phrase_Severity renames Shared.Audit_Severity;

   function Feature_Flag_Severity
     (Status : Feature_Flag_Status) return Phrase_Severity renames Shared.Feature_Flag_Severity;

   function Webhook_Severity (Status : Webhook_Status) return Phrase_Severity renames Shared.Webhook_Severity;

   function API_Key_Severity (Status : API_Key_Status) return Phrase_Severity renames Shared.API_Key_Severity;

   function Quota_Severity (Status : Quota_Status) return Phrase_Severity renames Shared.Quota_Severity;

   function Invoice_Severity (Status : Invoice_Status) return Phrase_Severity renames Shared.Invoice_Severity;

   function Database_Severity
     (Status : Database_Status)
      return Phrase_Severity renames Shared.Database_Severity;
end Humanize.Phrases.Severity;
