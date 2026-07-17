with Humanize.Phrases.Support;

package body Humanize.Phrases.Statuses is
   package Shared renames Humanize.Phrases.Support;

   function Status_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : UI_Status)
      return Humanize.Status.Text_Result renames Shared.Status_Phrase;

   function CI_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : CI_Status)
      return Humanize.Status.Text_Result renames Shared.CI_Phrase;

   function Ticket_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Ticket_Status)
      return Humanize.Status.Text_Result renames Shared.Ticket_Phrase;

   function Payment_Lifecycle_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Payment_Lifecycle_Status)
      return Humanize.Status.Text_Result renames Shared.Payment_Lifecycle_Phrase;

   function Backup_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Backup_Status)
      return Humanize.Status.Text_Result renames Shared.Backup_Phrase;

   function Incident_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Incident_Status)
      return Humanize.Status.Text_Result renames Shared.Incident_Phrase;

   function Release_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Release_Status)
      return Humanize.Status.Text_Result renames Shared.Release_Phrase;

   function Audit_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Audit_Status)
      return Humanize.Status.Text_Result renames Shared.Audit_Phrase;

   function Feature_Flag_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Feature_Flag_Status)
      return Humanize.Status.Text_Result renames Shared.Feature_Flag_Phrase;

   function Webhook_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Webhook_Status)
      return Humanize.Status.Text_Result renames Shared.Webhook_Phrase;

   function API_Key_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : API_Key_Status)
      return Humanize.Status.Text_Result renames Shared.API_Key_Phrase;

   function Quota_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Quota_Status)
      return Humanize.Status.Text_Result renames Shared.Quota_Phrase;

   function Invoice_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Invoice_Status)
      return Humanize.Status.Text_Result renames Shared.Invoice_Phrase;

   function Database_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Database_Status)
      return Humanize.Status.Text_Result renames Shared.Database_Phrase;

   procedure Status_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : UI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Status_Phrase_Into;

   procedure CI_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : CI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.CI_Phrase_Into;

   procedure Ticket_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Ticket_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Ticket_Phrase_Into;

   procedure Payment_Lifecycle_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Payment_Lifecycle_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Payment_Lifecycle_Phrase_Into;

   procedure Backup_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Backup_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Backup_Phrase_Into;

   procedure Incident_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Incident_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Incident_Phrase_Into;

   procedure Release_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Release_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Release_Phrase_Into;

   procedure Audit_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Audit_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Audit_Phrase_Into;

   procedure Feature_Flag_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Feature_Flag_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Feature_Flag_Phrase_Into;

   procedure Webhook_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Webhook_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Webhook_Phrase_Into;

   procedure API_Key_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : API_Key_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.API_Key_Phrase_Into;

   procedure Quota_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Quota_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Quota_Phrase_Into;

   procedure Invoice_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Invoice_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Invoice_Phrase_Into;

   procedure Database_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Database_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Database_Phrase_Into;

   function File_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : File_Status)
      return Humanize.Status.Text_Result renames Shared.File_Phrase;

   function Validation_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Validation_Status)
      return Humanize.Status.Text_Result renames Shared.Validation_Phrase;

   function Empty_State_Phrase
     (Context : Humanize.Contexts.Context;
      State   : Empty_State)
      return Humanize.Status.Text_Result renames Shared.Empty_State_Phrase;

   function Network_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Network_Status)
      return Humanize.Status.Text_Result renames Shared.Network_Phrase;

   function Auth_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Auth_Status)
      return Humanize.Status.Text_Result renames Shared.Auth_Phrase;

   function Billing_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Billing_Status)
      return Humanize.Status.Text_Result renames Shared.Billing_Phrase;

   function Workflow_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Workflow_Status)
      return Humanize.Status.Text_Result renames Shared.Workflow_Phrase;

   function Queue_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Queue_Status)
      return Humanize.Status.Text_Result renames Shared.Queue_Phrase;

   function Security_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Security_Status)
      return Humanize.Status.Text_Result renames Shared.Security_Phrase;

   function Deployment_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Deployment_Status)
      return Humanize.Status.Text_Result renames Shared.Deployment_Phrase;

   function Health_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Health_Status)
      return Humanize.Status.Text_Result renames Shared.Health_Phrase;

   function Notification_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Notification_Status)
      return Humanize.Status.Text_Result renames Shared.Notification_Phrase;

   function Form_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Form_Status)
      return Humanize.Status.Text_Result renames Shared.Form_Phrase;

   function Access_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Access_Status)
      return Humanize.Status.Text_Result renames Shared.Access_Phrase;

   function Sync_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Sync_Status)
      return Humanize.Status.Text_Result renames Shared.Sync_Phrase;

   function Transfer_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Transfer_Status)
      return Humanize.Status.Text_Result renames Shared.Transfer_Phrase;

   function Search_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Search_Status)
      return Humanize.Status.Text_Result renames Shared.Search_Phrase;

   function Collaboration_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Collaboration_Status)
      return Humanize.Status.Text_Result renames Shared.Collaboration_Phrase;

   function Issue_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Issue_Status)
      return Humanize.Status.Text_Result renames Shared.Issue_Phrase;

   function Task_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Task_Status)
      return Humanize.Status.Text_Result renames Shared.Task_Phrase;

   procedure File_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : File_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.File_Phrase_Into;

   procedure Validation_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Validation_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Validation_Phrase_Into;

   procedure Empty_State_Phrase_Into
     (Context : Humanize.Contexts.Context;
      State   : Empty_State;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Empty_State_Phrase_Into;

   procedure Network_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Network_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Network_Phrase_Into;

   procedure Auth_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Auth_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Auth_Phrase_Into;

   procedure Billing_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Billing_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Billing_Phrase_Into;

   procedure Workflow_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Workflow_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Workflow_Phrase_Into;

   procedure Queue_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Queue_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Queue_Phrase_Into;

   procedure Security_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Security_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Security_Phrase_Into;

   procedure Deployment_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Deployment_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Deployment_Phrase_Into;

   procedure Health_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Health_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Health_Phrase_Into;

   procedure Notification_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Notification_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Notification_Phrase_Into;

   procedure Form_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Form_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Form_Phrase_Into;

   procedure Access_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Access_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Access_Phrase_Into;

   procedure Sync_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Sync_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Sync_Phrase_Into;

   procedure Transfer_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Transfer_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Transfer_Phrase_Into;

   procedure Search_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Search_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Search_Phrase_Into;

   procedure Collaboration_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Collaboration_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Collaboration_Phrase_Into;

   procedure Issue_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Issue_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Issue_Phrase_Into;

   procedure Task_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Task_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Task_Phrase_Into;
end Humanize.Phrases.Statuses;
