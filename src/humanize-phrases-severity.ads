with Humanize.Bytes;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Locales;
with Humanize.Numbers;
with Humanize.Status;

--  Severity phrase helpers for alerts, diagnostics, and operational status.
package Humanize.Phrases.Severity is

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
end Humanize.Phrases.Severity;
