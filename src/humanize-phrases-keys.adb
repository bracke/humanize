with Humanize.Phrases.Support;

package body Humanize.Phrases.Keys is
   package Shared renames Humanize.Phrases.Support;

   function Status_Key
     (Status : UI_Status)
      return Humanize.Status.Text_Result renames Shared.Status_Key;

   function CI_Key
     (Status : CI_Status)
      return Humanize.Status.Text_Result renames Shared.CI_Key;

   function Ticket_Key
     (Status : Ticket_Status)
      return Humanize.Status.Text_Result renames Shared.Ticket_Key;

   function Payment_Lifecycle_Key
     (Status : Payment_Lifecycle_Status)
      return Humanize.Status.Text_Result renames Shared.Payment_Lifecycle_Key;

   function Backup_Key
     (Status : Backup_Status)
      return Humanize.Status.Text_Result renames Shared.Backup_Key;

   function Incident_Key
     (Status : Incident_Status)
      return Humanize.Status.Text_Result renames Shared.Incident_Key;

   function Release_Key
     (Status : Release_Status)
      return Humanize.Status.Text_Result renames Shared.Release_Key;

   function Audit_Key
     (Status : Audit_Status)
      return Humanize.Status.Text_Result renames Shared.Audit_Key;

   function Feature_Flag_Key
     (Status : Feature_Flag_Status)
      return Humanize.Status.Text_Result renames Shared.Feature_Flag_Key;

   function Webhook_Key
     (Status : Webhook_Status)
      return Humanize.Status.Text_Result renames Shared.Webhook_Key;

   function API_Key_Key
     (Status : API_Key_Status)
      return Humanize.Status.Text_Result renames Shared.API_Key_Key;

   function Quota_Key
     (Status : Quota_Status)
      return Humanize.Status.Text_Result renames Shared.Quota_Key;

   function Invoice_Key
     (Status : Invoice_Status)
      return Humanize.Status.Text_Result renames Shared.Invoice_Key;

   procedure Status_Key_Into
     (Status  : UI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Status_Key_Into;

   procedure CI_Key_Into
     (Status  : CI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.CI_Key_Into;

   procedure Ticket_Key_Into
     (Status  : Ticket_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Ticket_Key_Into;

   procedure Payment_Lifecycle_Key_Into
     (Status  : Payment_Lifecycle_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Payment_Lifecycle_Key_Into;

   procedure Backup_Key_Into
     (Status  : Backup_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Backup_Key_Into;

   procedure Incident_Key_Into
     (Status  : Incident_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Incident_Key_Into;

   procedure Release_Key_Into
     (Status  : Release_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Release_Key_Into;
end Humanize.Phrases.Keys;
