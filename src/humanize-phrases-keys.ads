with Humanize.Bytes;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Locales;
with Humanize.Numbers;
with Humanize.Status;

--  Key and identifier phrase helpers for settings, shortcuts, and maps.
package Humanize.Phrases.Keys is

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
end Humanize.Phrases.Keys;
