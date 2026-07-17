separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Parse_Operational_Phrase
     (Text : String)
      return Operational_Phrase_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Empty_Input,
                 others => <>);
      elsif Item = "backup running" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Backup_Phrase_Domain,
            Backup_Status => Humanize.Phrases.Backup_Running,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "backup completed" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Backup_Phrase_Domain,
            Backup_Status => Humanize.Phrases.Backup_Completed,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "backup failed" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Backup_Phrase_Domain,
            Backup_Status => Humanize.Phrases.Backup_Failed,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "backup stale" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Backup_Phrase_Domain,
            Backup_Status => Humanize.Phrases.Backup_Stale,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "investigating incident" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Incident_Phrase_Domain,
            Incident_Status => Humanize.Phrases.Incident_Investigating,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "incident identified" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Incident_Phrase_Domain,
            Incident_Status => Humanize.Phrases.Incident_Identified,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "incident mitigated" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Incident_Phrase_Domain,
            Incident_Status => Humanize.Phrases.Incident_Mitigated,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "incident resolved" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Incident_Phrase_Domain,
            Incident_Status => Humanize.Phrases.Incident_Resolved,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "release drafting" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Release_Phrase_Domain,
            Release_Status => Humanize.Phrases.Release_Drafting,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "release ready" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Release_Phrase_Domain,
            Release_Status => Humanize.Phrases.Release_Ready,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "release published" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Release_Phrase_Domain,
            Release_Status => Humanize.Phrases.Release_Published,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "release rolled back" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Release_Phrase_Domain,
            Release_Status => Humanize.Phrases.Release_Rolled_Back,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "payment authorized" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Payment_Lifecycle_Phrase_Domain,
            Payment_Lifecycle_Status =>
              Humanize.Phrases.Payment_Authorized,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "payment captured" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Payment_Lifecycle_Phrase_Domain,
            Payment_Lifecycle_Status =>
              Humanize.Phrases.Payment_Captured,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "payment refunded" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Payment_Lifecycle_Phrase_Domain,
            Payment_Lifecycle_Status =>
              Humanize.Phrases.Payment_Refunded,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "payment disputed" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Payment_Lifecycle_Phrase_Domain,
            Payment_Lifecycle_Status =>
              Humanize.Phrases.Payment_Disputed,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "payment requires action" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Payment_Lifecycle_Phrase_Domain,
            Payment_Lifecycle_Status =>
              Humanize.Phrases.Payment_Requires_Action,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "payment expired" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Payment_Lifecycle_Phrase_Domain,
            Payment_Lifecycle_Status =>
              Humanize.Phrases.Payment_Expired,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "audit entry created" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Audit_Phrase_Domain,
            Audit_Status => Humanize.Phrases.Audit_Created,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "audit entry updated" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Audit_Phrase_Domain,
            Audit_Status => Humanize.Phrases.Audit_Updated,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "audit entry deleted" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Audit_Phrase_Domain,
            Audit_Status => Humanize.Phrases.Audit_Deleted,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "audit entry restored" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Audit_Phrase_Domain,
            Audit_Status => Humanize.Phrases.Audit_Restored,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "feature flag enabled" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Feature_Flag_Phrase_Domain,
            Feature_Flag_Status => Humanize.Phrases.Flag_Enabled,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "feature flag disabled" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Feature_Flag_Phrase_Domain,
            Feature_Flag_Status => Humanize.Phrases.Flag_Disabled,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "feature flag rolling out" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Feature_Flag_Phrase_Domain,
            Feature_Flag_Status => Humanize.Phrases.Flag_Rolling_Out,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "feature flag rolled back" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Feature_Flag_Phrase_Domain,
            Feature_Flag_Status => Humanize.Phrases.Flag_Rolled_Back,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "webhook pending" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Webhook_Phrase_Domain,
            Webhook_Status => Humanize.Phrases.Webhook_Pending,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "webhook delivered" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Webhook_Phrase_Domain,
            Webhook_Status => Humanize.Phrases.Webhook_Delivered,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "webhook failed" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Webhook_Phrase_Domain,
            Webhook_Status => Humanize.Phrases.Webhook_Failed,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "webhook retrying" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Webhook_Phrase_Domain,
            Webhook_Status => Humanize.Phrases.Webhook_Retrying,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "api key active" then
         return
           (Status => Humanize.Status.Ok,
            Domain => API_Key_Phrase_Domain,
            API_Key_Status => Humanize.Phrases.API_Key_Active,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "api key revoked" then
         return
           (Status => Humanize.Status.Ok,
            Domain => API_Key_Phrase_Domain,
            API_Key_Status => Humanize.Phrases.API_Key_Revoked,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "api key expired" then
         return
           (Status => Humanize.Status.Ok,
            Domain => API_Key_Phrase_Domain,
            API_Key_Status => Humanize.Phrases.API_Key_Expired,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "api key rotated" then
         return
           (Status => Humanize.Status.Ok,
            Domain => API_Key_Phrase_Domain,
            API_Key_Status => Humanize.Phrases.API_Key_Rotated,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "quota available" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Quota_Phrase_Domain,
            Quota_Status => Humanize.Phrases.Quota_Available,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "quota near limit" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Quota_Phrase_Domain,
            Quota_Status => Humanize.Phrases.Quota_Near_Limit,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "quota exceeded" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Quota_Phrase_Domain,
            Quota_Status => Humanize.Phrases.Quota_Exceeded,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "quota reset" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Quota_Phrase_Domain,
            Quota_Status => Humanize.Phrases.Quota_Reset,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "invoice draft" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Invoice_Phrase_Domain,
            Invoice_Status => Humanize.Phrases.Invoice_Draft,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "invoice sent" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Invoice_Phrase_Domain,
            Invoice_Status => Humanize.Phrases.Invoice_Sent,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "invoice paid" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Invoice_Phrase_Domain,
            Invoice_Status => Humanize.Phrases.Invoice_Paid,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "invoice refunded" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Invoice_Phrase_Domain,
            Invoice_Status => Humanize.Phrases.Invoice_Refunded,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "invoice overdue" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Invoice_Phrase_Domain,
            Invoice_Status => Humanize.Phrases.Invoice_Overdue,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "refund failed" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Invoice_Phrase_Domain,
            Invoice_Status => Humanize.Phrases.Refund_Failed,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "database online" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Database_Phrase_Domain,
            Database_Status => Humanize.Phrases.Database_Online,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "database offline" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Database_Phrase_Domain,
            Database_Status => Humanize.Phrases.Database_Offline,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "database degraded" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Database_Phrase_Domain,
            Database_Status => Humanize.Phrases.Database_Degraded,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "database migrating" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Database_Phrase_Domain,
            Database_Status => Humanize.Phrases.Database_Migrating,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "database migration failed" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Database_Phrase_Domain,
            Database_Status => Humanize.Phrases.Database_Migration_Failed,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "database replicating" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Database_Phrase_Domain,
            Database_Status => Humanize.Phrases.Database_Replicating,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "database replication lagging" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Database_Phrase_Domain,
            Database_Status => Humanize.Phrases.Database_Replication_Lagging,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "database backup running" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Database_Phrase_Domain,
            Database_Status => Humanize.Phrases.Database_Backup_Running,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Item = "database backup failed" then
         return
           (Status => Humanize.Status.Ok,
            Domain => Database_Phrase_Domain,
            Database_Status => Humanize.Phrases.Database_Backup_Failed,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 Error_Position => Text'First,
                 others => <>);
      end if;
end Parse_Operational_Phrase;
