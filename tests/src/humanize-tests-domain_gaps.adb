with AUnit.Assertions;

with Humanize.Accounts;
with Humanize.Attachments;
with Humanize.Badges;
with Humanize.Builds;
with Humanize.Comments;
with Humanize.Comparisons;
with Humanize.Cross_Domain;
with Humanize.Data_Quality;
with Humanize.Deployments;
with Humanize.Domain_Details;
with Humanize.Events;
with Humanize.Forms;
with Humanize.Media;
with Humanize.Moderation;
with Humanize.Navigation;
with Humanize.Notification_Preferences;
with Humanize.Notifications;
with Humanize.Operations;
with Humanize.Payments;
with Humanize.Permissions;
with Humanize.Search;
with Humanize.Status;
with Humanize.Tasks;
with Humanize.Tests.Support;

package body Humanize.Tests.Domain_Gaps is
   use Humanize.Status;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_Operations_And_Comparisons
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use type Humanize.Operations.Operation_State;
      Buffer  : String (1 .. 14);
      Written : Natural;
      Code    : Status_Code;
      Log_Progress : constant Text_Result :=
        Humanize.Operations.Progress_Summary
          ("sync", Humanize.Operations.Running, 8, 10,
           Failed => 1, Skipped => 1, Retried => 0, Canceled => 0,
           Singular => "item", Plural => "items",
           Options =>
             (Mode => Humanize.Operations.Operation_Log,
              Include_Extras => True));
      Compact_Progress : constant Text_Result :=
        Humanize.Operations.Progress_Summary
          ("sync", Humanize.Operations.Running, 8, 10,
           Failed => 1, Skipped => 1, Retried => 0, Canceled => 0,
           Singular => "item", Plural => "items",
           Options =>
             (Mode => Humanize.Operations.Operation_Compact,
              Include_Extras => True));
      No_Extras_Progress : constant Text_Result :=
        Humanize.Operations.Progress_Summary
          ("sync", Humanize.Operations.Running, 8, 10,
           Failed => 1, Skipped => 1, Retried => 1, Canceled => 1,
           Singular => "item", Plural => "items",
           Options =>
             (Mode => Humanize.Operations.Operation_Detailed,
              Include_Extras => False));
      Parsed_Progress : constant Humanize.Operations.Operation_Progress_Parse_Result :=
        Humanize.Operations.Parse_Progress_Summary
          ("sync running: 8 of 10 items complete, 1 item failed");
      Parsed_Log : constant Humanize.Operations.Operation_Progress_Parse_Result :=
        Humanize.Operations.Parse_Progress_Summary
          (Support.Text (Log_Progress));
      Scanned_Log : constant Humanize.Operations.Operation_Progress_Parse_Result :=
        Humanize.Operations.Scan_Progress_Summary
          (Support.Text (Log_Progress) & " trailing context");
      Comparison_Log : constant Text_Result :=
        Humanize.Comparisons.Multi_Value_Summary
          ("settings", 3, 7, 10,
           (Mode => Humanize.Comparisons.Comparison_Log));
      Comparison_Compact : constant Text_Result :=
        Humanize.Comparisons.Multi_Value_Summary
          ("settings", 3, 7, 10,
           (Mode => Humanize.Comparisons.Comparison_Compact));
      Parsed_Comparison :
        constant Humanize.Comparisons.Multi_Value_Parse_Result :=
          Humanize.Comparisons.Parse_Multi_Value_Summary
            ("settings: 3 changed, 7 unchanged, 10 total");
      Parsed_Comparison_Log :
        constant Humanize.Comparisons.Multi_Value_Parse_Result :=
          Humanize.Comparisons.Parse_Multi_Value_Summary
            (Support.Text (Comparison_Log));
      Scanned_Comparison :
        constant Humanize.Comparisons.Multi_Value_Parse_Result :=
          Humanize.Comparisons.Scan_Multi_Value_Summary
            (Support.Text (Comparison_Log) & " trailing context");
   begin
      Check
        (Humanize.Operations.Progress_Summary
           ("sync", Humanize.Operations.Running, 8, 10,
            Failed => 1, Skipped => 1),
         "sync running: 8 of 10 items complete, 1 item failed, 1 item skipped",
         "operation progress");
      Check
        (Humanize.Operations.Unknown_Total_Summary
           ("import", Humanize.Operations.Retrying, 12, Failed => 2,
            Singular => "record", Plural => "records"),
         "import retrying: 12 records complete, 2 records failed",
         "operation unknown total");
      Check
        (Humanize.Operations.Next_Retry_Label ("sync", "in 5 minutes"),
         "sync next retry in 5 minutes", "operation retry");
      AUnit.Assertions.Assert
        (Humanize.Operations.Progress_Summary
           ("sync", Humanize.Operations.Running, 11, 10).Status =
         Invalid_Argument,
         "invalid operation progress");
      Check
        (Compact_Progress,
         "sync 8/10 running, 1 failed, 1 skipped",
         "operation compact progress");
      Check
        (Log_Progress,
         "sync state=running completed=8 total=10 failed=1 skipped=1 retried=0 canceled=0",
         "operation log progress");
      Check
        (No_Extras_Progress,
         "sync running: 8 of 10 items complete",
         "operation options suppress extras");
      AUnit.Assertions.Assert
        (Parsed_Progress.Status = Ok
         and then Parsed_Progress.State = Humanize.Operations.Running
         and then Parsed_Progress.Completed = 8
         and then Parsed_Progress.Total = 10,
         "parse detailed operation progress");
      AUnit.Assertions.Assert
        (Parsed_Log.Status = Ok
         and then Parsed_Log.State = Humanize.Operations.Running
         and then Parsed_Log.Completed = 8
         and then Parsed_Log.Total = 10
         and then Parsed_Log.Failed = 1
         and then Parsed_Log.Skipped = 1,
         "parse log operation progress");
      AUnit.Assertions.Assert
        (Scanned_Log.Status = Ok
         and then Scanned_Log.Consumed = Support.Text (Log_Progress)'Length,
         "scan operation progress prefix");

      Check
        (Humanize.Comparisons.Tolerance_Label
           ("latency", "12 ms", "5 ms", Humanize.Comparisons.Outside_Tolerance),
         "latency outside tolerance by 12 ms, tolerance 5 ms",
         "comparison tolerance");
      Check
        (Humanize.Comparisons.Baseline_Label
           ("throughput", Humanize.Comparisons.Baseline_Unavailable),
         "throughput baseline unavailable", "comparison baseline");
      Check
        (Humanize.Comparisons.Multi_Value_Summary ("settings", 3, 7, 10),
         "settings: 3 changed, 7 unchanged, 10 total",
         "comparison multi value");
      Check
        (Comparison_Compact,
         "settings 3/10 changed",
         "comparison compact multi value");
      Check
        (Comparison_Log,
         "settings changed=3 unchanged=7 total=10",
         "comparison log multi value");
      AUnit.Assertions.Assert
        (Parsed_Comparison.Status = Ok
         and then Parsed_Comparison.Changed = 3
         and then Parsed_Comparison.Unchanged = 7
         and then Parsed_Comparison.Total = 10,
         "parse detailed comparison multi value");
      AUnit.Assertions.Assert
        (Parsed_Comparison_Log.Status = Ok
         and then Parsed_Comparison_Log.Changed = 3
         and then Parsed_Comparison_Log.Unchanged = 7
         and then Parsed_Comparison_Log.Total = 10,
         "parse log comparison multi value");
      AUnit.Assertions.Assert
        (Scanned_Comparison.Status = Ok
         and then Scanned_Comparison.Consumed =
           Support.Text (Comparison_Log)'Length,
         "scan comparison multi value prefix");
      Humanize.Comparisons.Baseline_Label_Into
        ("throughput", Humanize.Comparisons.Baseline_Unavailable,
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 14
         and then Buffer = "throughput bas",
         "bounded comparison overflow");
   end Test_Operations_And_Comparisons;

   procedure Test_Review_Accounts_Deployments
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      use type Humanize.Domain_Details.Domain_Surface;
      Review_Detailed : constant Text_Result :=
        Humanize.Moderation.Review_Label
          ("comment 42", Humanize.Moderation.Rejected,
           (Mode             => Humanize.Moderation.Moderation_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Review :
        constant Humanize.Moderation.Moderation_Label_Parse_Result :=
          Humanize.Moderation.Parse_Review_Label
            ("comment 42 rejected", Humanize.Moderation.Rejected);
      Scanned_Moderation :
        constant Humanize.Moderation.Moderation_Label_Parse_Result :=
          Humanize.Moderation.Scan_Moderation_Label
            ("post hidden by moderator trailing", Humanize.Moderation.Hidden);
      Account_Detailed : constant Text_Result :=
        Humanize.Accounts.Account_Label
          ("Ada", Humanize.Accounts.Locked_Account,
           (Mode             => Humanize.Accounts.Account_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Account_Accessible : constant Text_Result :=
        Humanize.Accounts.Account_Label
          ("Ada", Humanize.Accounts.Active_Account,
           (Mode             => Humanize.Accounts.Account_Accessible,
            Include_Surface  => False,
            Include_Severity => False,
            Include_Tone     => False));
      Parsed_Account :
        constant Humanize.Accounts.Account_Label_Parse_Result :=
          Humanize.Accounts.Parse_Account_Label
            ("Ada locked account", Humanize.Accounts.Locked_Account);
      Scanned_Account :
        constant Humanize.Accounts.Account_Label_Parse_Result :=
          Humanize.Accounts.Scan_Account_Label
            ("Ada locked account trailing", Humanize.Accounts.Locked_Account);
      Deployment_Detailed : constant Text_Result :=
        Humanize.Deployments.Deployment_Label
          ("release 1.2", "production", Humanize.Deployments.Deployed,
           (Mode             => Humanize.Deployments.Deployment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Deployment :
        constant Humanize.Deployments.Deployment_Label_Parse_Result :=
          Humanize.Deployments.Parse_Deployment_Label
            ("release 1.2 to production deployed",
             Humanize.Deployments.Deployed);
   begin
      Check
        (Humanize.Moderation.Review_Label
           ("comment 42", Humanize.Moderation.Needs_Changes),
         "comment 42 needs changes", "review label");
      Check
        (Humanize.Moderation.Moderation_Label
           ("post", Humanize.Moderation.Hidden),
         "post hidden by moderator", "moderation label");
      Check
        (Humanize.Moderation.Moderation_Queue_Label (4, 1),
         "4 pending review, 1 escalated", "moderation queue");
      Check
        (Review_Detailed,
         "[moderation danger] comment 42 rejected",
         "review option metadata");
      AUnit.Assertions.Assert
        (Parsed_Review.Status = Ok
         and then Parsed_Review.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Review.Name_Length = 10,
         "parse review label");
      AUnit.Assertions.Assert
        (Scanned_Moderation.Status = Ok
         and then Scanned_Moderation.Consumed = 24,
         "scan moderation label");

      Check
        (Humanize.Accounts.Account_Label
           ("Ada", Humanize.Accounts.Locked_Account),
         "Ada locked account", "account label");
      Check
        (Humanize.Accounts.Last_Active_Label ("Ada", "2 hours ago"),
         "Ada last active 2 hours ago", "last active");
      Check
        (Humanize.Accounts.MFA_State_Label
           (Humanize.Accounts.MFA_Reset_Required),
         "MFA reset required", "mfa label");
      Check
        (Account_Detailed,
         "[accounts danger] Ada locked account",
         "account option metadata");
      Check
        (Account_Accessible,
         "Ada active account",
         "account accessible option");
      AUnit.Assertions.Assert
        (Parsed_Account.Status = Ok
         and then Parsed_Account.Surface =
           Humanize.Domain_Details.Accounts_Surface
         and then Parsed_Account.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Account.Name_Length = 3
         and then Parsed_Account.State_Length = 14,
         "parse account label");
      AUnit.Assertions.Assert
        (Scanned_Account.Status = Ok
         and then Scanned_Account.Consumed = 18,
         "scan account label");

      Check
        (Humanize.Deployments.Deployment_Label
           ("release 1.2", "production", Humanize.Deployments.Deployed),
         "release 1.2 to production deployed", "deployment label");
      Check
        (Humanize.Deployments.Rollout_Label ("checkout", "25%"),
         "checkout rollout 25%", "rollout label");
      Check
        (Humanize.Deployments.Promotion_Label ("release 1.2", "staging", "production"),
         "release 1.2 promoted from staging to production",
         "promotion label");
      Check
        (Deployment_Detailed,
         "[deployments success] release 1.2 to production deployed",
         "deployment option metadata");
      AUnit.Assertions.Assert
        (Parsed_Deployment.Status = Ok
         and then Parsed_Deployment.Name_Length = 25
         and then Parsed_Deployment.State_Length = 8,
         "parse deployment label");
   end Test_Review_Accounts_Deployments;

   procedure Test_Data_Media_Notification_Permissions_Builds
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Data_Detailed : constant Text_Result :=
        Humanize.Data_Quality.Import_Result_Label
          ("customers.csv", Humanize.Data_Quality.Import_Partial, 98, 2,
           (Mode             => Humanize.Data_Quality.Data_Quality_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Data :
        constant Humanize.Data_Quality.Data_Quality_Label_Parse_Result :=
          Humanize.Data_Quality.Parse_Import_Result_Label
            ("customers.csv partial import: 98 accepted, 2 rejected",
             Humanize.Data_Quality.Import_Partial, 98, 2);
      Media_Detailed : constant Text_Result :=
        Humanize.Media.Media_Summary
          ("manual.pdf", Humanize.Media.PDF_Document,
           Humanize.Media.Metadata_Missing,
           (Mode             => Humanize.Media.Media_Accessible,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Media : constant Humanize.Media.Media_Label_Parse_Result :=
        Humanize.Media.Parse_Media_Summary
          ("manual.pdf PDF document metadata missing",
           Humanize.Media.PDF_Document, Humanize.Media.Metadata_Missing);
      Permission_Detailed : constant Text_Result :=
        Humanize.Permissions.Permission_Label
          ("Ada", "deploy", Humanize.Permissions.Requires_Approval,
           (Mode             => Humanize.Permissions.Permission_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Permission :
        constant Humanize.Permissions.Permission_Label_Parse_Result :=
          Humanize.Permissions.Parse_Permission_Label
            ("Ada deploy requires approval",
             Humanize.Permissions.Requires_Approval);
      Build_Detailed : constant Text_Result :=
        Humanize.Builds.Build_Label
          ("release", Humanize.Builds.Build_Failed,
           (Mode             => Humanize.Builds.Build_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Build : constant Humanize.Builds.Build_Label_Parse_Result :=
        Humanize.Builds.Parse_Build_Label
          ("release build failed", Humanize.Builds.Build_Failed);
      Notification_Detailed : constant Text_Result :=
        Humanize.Notification_Preferences.Channel_Preference_Label
          ("email", Humanize.Notification_Preferences.Preference_Required,
           (Mode => Humanize.Notification_Preferences
              .Notification_Preference_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Notification : constant
        Humanize.Notification_Preferences
          .Notification_Preference_Label_Parse_Result :=
            Humanize.Notification_Preferences.Parse_Channel_Preference_Label
              ("email notifications required",
               Humanize.Notification_Preferences.Preference_Required);
      Inbox_Notification_Detailed : constant Text_Result :=
        Humanize.Notifications.Notification_Label
          ("Ada", Humanize.Notifications.Alert_Event,
           Humanize.Notifications.Unread_State,
           (Mode             => Humanize.Notifications.Notification_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Inbox_Notification : constant
        Humanize.Notifications.Notification_Label_Parse_Result :=
          Humanize.Notifications.Parse_Notification_Label
            ("Ada alert unread", Humanize.Notifications.Alert_Event,
             Humanize.Notifications.Unread_State);
      Delivery_Detailed : constant Text_Result :=
        Humanize.Notifications.Delivery_Label
          (Humanize.Notifications.Email_Channel,
           Humanize.Notifications.Failed_Delivery,
           (Mode             => Humanize.Notifications.Notification_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Delivery : constant
        Humanize.Notifications.Notification_Label_Parse_Result :=
          Humanize.Notifications.Parse_Delivery_Label
            ("email notification failed", Humanize.Notifications.Email_Channel,
             Humanize.Notifications.Failed_Delivery);
      Task_Detailed : constant Text_Result :=
        Humanize.Tasks.Task_Label
          ("ship release", Humanize.Tasks.Blocked_Task,
           Humanize.Tasks.Critical_Priority,
           (Mode             => Humanize.Tasks.Task_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Task : constant Humanize.Tasks.Task_Label_Parse_Result :=
        Humanize.Tasks.Parse_Task_Label
          ("ship release blocked task, critical priority",
           Humanize.Tasks.Blocked_Task,
           Humanize.Tasks.Critical_Priority);
      Payment_Detailed : constant Text_Result :=
        Humanize.Payments.Payment_Label
          ("$42.00", Humanize.Payments.Failed_Payment,
           (Mode             => Humanize.Payments.Payment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Payment : constant Humanize.Payments.Payment_Label_Parse_Result :=
        Humanize.Payments.Parse_Payment_Label
          ("$42.00 failed payment", Humanize.Payments.Failed_Payment);
      Invoice_Detailed : constant Text_Result :=
        Humanize.Payments.Invoice_Label
          ("INV-42", Humanize.Payments.Overdue_Invoice,
           (Mode             => Humanize.Payments.Payment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Invoice : constant Humanize.Payments.Payment_Label_Parse_Result :=
        Humanize.Payments.Parse_Invoice_Label
          ("invoice INV-42 overdue", Humanize.Payments.Overdue_Invoice);
      Attachment_Detailed : constant Text_Result :=
        Humanize.Attachments.Attachment_Label
          ("contract.pdf", Humanize.Attachments.Document_Attachment,
           Humanize.Attachments.Failed_Attachment,
           (Mode             => Humanize.Attachments.Attachment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Attachment : constant
        Humanize.Attachments.Attachment_Label_Parse_Result :=
          Humanize.Attachments.Parse_Attachment_Label
            ("contract.pdf document failed",
             Humanize.Attachments.Document_Attachment,
             Humanize.Attachments.Failed_Attachment);
      Attachment_Scan_Detailed : constant Text_Result :=
        Humanize.Attachments.Scan_Result_Label
          ("contract.pdf", Humanize.Attachments.Infected,
           (Mode             => Humanize.Attachments.Attachment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Attachment_Scan : constant
        Humanize.Attachments.Attachment_Label_Parse_Result :=
          Humanize.Attachments.Parse_Scan_Result_Label
            ("contract.pdf scan infected", Humanize.Attachments.Infected);
      Event_Detailed : constant Text_Result :=
        Humanize.Events.Event_Label
          ("launch", Humanize.Events.Canceled_Event,
           (Mode             => Humanize.Events.Event_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Event : constant Humanize.Events.Event_Label_Parse_Result :=
        Humanize.Events.Parse_Event_Label
          ("launch canceled event", Humanize.Events.Canceled_Event);
      RSVP_Detailed : constant Text_Result :=
        Humanize.Events.RSVP_Label
          (Humanize.Events.Declined,
           (Mode             => Humanize.Events.Event_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_RSVP : constant Humanize.Events.Event_Label_Parse_Result :=
        Humanize.Events.Parse_RSVP_Label
          ("RSVP declined", Humanize.Events.Declined);
      Badge_Detailed : constant Text_Result :=
        Humanize.Badges.Badge_Label
          ("beta", Humanize.Badges.Warning_Tone,
           Humanize.Badges.Deprecated_Badge,
           (Mode             => Humanize.Badges.Badge_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Badge : constant Humanize.Badges.Badge_Label_Parse_Result :=
        Humanize.Badges.Parse_Badge_Label
          ("beta warning deprecated badge", Humanize.Badges.Warning_Tone,
           Humanize.Badges.Deprecated_Badge);
      Comment_Detailed : constant Text_Result :=
        Humanize.Comments.Comment_Label
          ("Ada", Humanize.Comments.Hidden_Comment,
           (Mode             => Humanize.Comments.Comment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Comment : constant Humanize.Comments.Comment_Label_Parse_Result :=
        Humanize.Comments.Parse_Comment_Label
          ("Ada hidden comment", Humanize.Comments.Hidden_Comment);
      Thread_Detailed : constant Text_Result :=
        Humanize.Comments.Thread_Label
          ("release", Humanize.Comments.Locked_Thread, 2,
           (Mode             => Humanize.Comments.Comment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Thread : constant Humanize.Comments.Comment_Label_Parse_Result :=
        Humanize.Comments.Parse_Thread_Label
          ("release locked thread, 2 comments",
           Humanize.Comments.Locked_Thread, 2);
      Field_Detailed : constant Text_Result :=
        Humanize.Forms.Field_State_Label
          ("email", Humanize.Forms.Invalid_Input,
           (Mode             => Humanize.Forms.Form_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Field : constant Humanize.Forms.Form_Label_Parse_Result :=
        Humanize.Forms.Parse_Field_State_Label
          ("email invalid", Humanize.Forms.Invalid_Input);
      Nav_Detailed : constant Text_Result :=
        Humanize.Navigation.Navigation_Item_Label
          ("settings", Humanize.Navigation.Tab_Item,
           Humanize.Navigation.Disabled_Item,
           (Mode             => Humanize.Navigation.Navigation_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Nav : constant Humanize.Navigation.Navigation_Label_Parse_Result :=
        Humanize.Navigation.Parse_Navigation_Item_Label
          ("settings tab disabled", Humanize.Navigation.Tab_Item,
           Humanize.Navigation.Disabled_Item);
      Search_Detailed : constant Text_Result :=
        Humanize.Search.Filter_Label
          ("status", "open", Humanize.Search.Excluded_Filter,
           (Mode             => Humanize.Search.Search_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Search : constant Humanize.Search.Search_Label_Parse_Result :=
        Humanize.Search.Parse_Filter_Label
          ("status: open excluded filter", Humanize.Search.Excluded_Filter);
   begin
      Check
        (Humanize.Data_Quality.Issue_Count_Label
           (Humanize.Data_Quality.Duplicate_Record, 2),
         "2 duplicate records", "data issue count");
      Check
        (Humanize.Data_Quality.Row_Issue_Label
           (12, Humanize.Data_Quality.Skipped_Record),
         "row 12 skipped record", "row issue");
      Check
        (Humanize.Data_Quality.Import_Result_Label
           ("customers.csv", Humanize.Data_Quality.Import_Partial, 98, 2),
         "customers.csv partial import: 98 accepted, 2 rejected",
         "import result");
      Check
        (Data_Detailed,
         "[data-quality warning] customers.csv partial import: 98 accepted, 2 rejected",
         "data quality option metadata");
      AUnit.Assertions.Assert
        (Parsed_Data.Status = Ok
         and then Parsed_Data.Metadata.Severity =
           Humanize.Domain_Details.Warning_Severity
         and then Parsed_Data.Name_Length = 13,
         "parse import result");

      Check
        (Humanize.Media.Media_Summary
           ("trailer.mp4", Humanize.Media.Video_Media,
            Humanize.Media.Transcoding_Media),
         "trailer.mp4 video transcoding", "media summary");
      Check
        (Media_Detailed,
         "[media danger] manual.pdf P D F document metadata missing",
         "media option metadata");
      AUnit.Assertions.Assert
        (Parsed_Media.Status = Ok
         and then Parsed_Media.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Media.Name_Length = 10,
         "parse media summary");
      Check (Humanize.Media.Resolution_Label (1920, 1080), "1920x1080", "resolution");
      Check (Humanize.Media.Page_Count_Label (12), "12 pages", "page count");

      Check
        (Humanize.Notification_Preferences.Channel_Preference_Label
           ("email", Humanize.Notification_Preferences.Preference_Enabled),
         "email notifications enabled", "channel preference");
      Check
        (Humanize.Notification_Preferences.Quiet_Hours_Label ("22:00-07:00"),
         "quiet hours 22:00-07:00", "quiet hours");
      Check
        (Humanize.Notification_Preferences.Alert_Level_Label
           (Humanize.Notification_Preferences.Critical_Alerts_Only),
         "critical alerts only", "alert level");
      Check
        (Notification_Detailed,
         "[notification-preferences warning] email notifications required",
         "notification preference option metadata");
      AUnit.Assertions.Assert
        (Parsed_Notification.Status = Ok
         and then Parsed_Notification.Metadata.Severity =
           Humanize.Domain_Details.Warning_Severity
         and then Parsed_Notification.Name_Length = 5,
         "parse channel preference");

      Check
        (Inbox_Notification_Detailed,
         "[notifications info] Ada alert unread",
         "notification option metadata");
      AUnit.Assertions.Assert
        (Parsed_Inbox_Notification.Status = Ok
         and then Parsed_Inbox_Notification.Name_Length = 3,
         "parse notification label");
      Check
        (Delivery_Detailed,
         "[notifications danger] email notification failed",
         "delivery option metadata");
      AUnit.Assertions.Assert
        (Parsed_Delivery.Status = Ok
         and then Parsed_Delivery.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Delivery.Name_Length = 18,
         "parse delivery label");

      Check
        (Task_Detailed,
         "[tasks danger] ship release blocked task, critical priority",
         "task option metadata");
      AUnit.Assertions.Assert
        (Parsed_Task.Status = Ok
         and then Parsed_Task.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Task.Name_Length = 12,
         "parse task label");

      Check
        (Payment_Detailed,
         "[payments danger] $42.00 failed payment",
         "payment option metadata");
      AUnit.Assertions.Assert
        (Parsed_Payment.Status = Ok
         and then Parsed_Payment.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Payment.Name_Length = 6,
         "parse payment label");
      Check
        (Invoice_Detailed,
         "[payments danger] invoice INV-42 overdue",
         "invoice option metadata");
      AUnit.Assertions.Assert
        (Parsed_Invoice.Status = Ok
         and then Parsed_Invoice.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Invoice.Name_Length = 14,
         "parse invoice label");

      Check
        (Attachment_Detailed,
         "[attachments danger] contract.pdf document failed",
         "attachment option metadata");
      AUnit.Assertions.Assert
        (Parsed_Attachment.Status = Ok
         and then Parsed_Attachment.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Attachment.Name_Length = 12,
         "parse attachment label");
      Check
        (Attachment_Scan_Detailed,
         "[attachments danger] contract.pdf scan infected",
         "attachment scan option metadata");
      AUnit.Assertions.Assert
        (Parsed_Attachment_Scan.Status = Ok
         and then Parsed_Attachment_Scan.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Attachment_Scan.Name_Length = 12,
         "parse attachment scan label");

      Check
        (Event_Detailed,
         "[events info] launch canceled event",
         "event option metadata");
      AUnit.Assertions.Assert
        (Parsed_Event.Status = Ok
         and then Parsed_Event.Name_Length = 6,
         "parse event label");
      Check
        (RSVP_Detailed,
         "[events info] RSVP declined",
         "RSVP option metadata");
      AUnit.Assertions.Assert
        (Parsed_RSVP.Status = Ok
         and then Parsed_RSVP.Name_Length = 4,
         "parse RSVP label");

      Check
        (Badge_Detailed,
         "[badges warning] beta warning deprecated badge",
         "badge option metadata");
      AUnit.Assertions.Assert
        (Parsed_Badge.Status = Ok
         and then Parsed_Badge.Metadata.Severity =
           Humanize.Domain_Details.Warning_Severity
         and then Parsed_Badge.Name_Length = 4,
         "parse badge label");
      Check
        (Comment_Detailed,
         "[comments info] Ada hidden comment",
         "comment option metadata");
      AUnit.Assertions.Assert
        (Parsed_Comment.Status = Ok
         and then Parsed_Comment.Name_Length = 3,
         "parse comment label");
      Check
        (Thread_Detailed,
         "[comments danger] release locked thread, 2 comments",
         "thread option metadata");
      AUnit.Assertions.Assert
        (Parsed_Thread.Status = Ok
         and then Parsed_Thread.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Thread.Name_Length = 7,
         "parse thread label");
      Check
        (Field_Detailed,
         "[forms danger] email invalid",
         "field option metadata");
      AUnit.Assertions.Assert
        (Parsed_Field.Status = Ok
         and then Parsed_Field.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Field.Name_Length = 5,
         "parse field label");
      Check
        (Nav_Detailed,
         "[navigation info] settings tab disabled",
         "navigation option metadata");
      AUnit.Assertions.Assert
        (Parsed_Nav.Status = Ok
         and then Parsed_Nav.Name_Length = 8,
         "parse navigation label");
      Check
        (Search_Detailed,
         "[search info] status: open excluded filter",
         "search option metadata");
      AUnit.Assertions.Assert
        (Parsed_Search.Status = Ok
         and then Parsed_Search.Name_Length = 12,
         "parse search filter label");

      Check
        (Humanize.Permissions.Permission_Label
           ("Ada", "deploy", Humanize.Permissions.Requires_Approval),
         "Ada deploy requires approval", "permission label");
      Check
        (Humanize.Permissions.Access_Expiry_Label ("Ada", "tomorrow"),
         "Ada access expires tomorrow", "access expiry");
      Check
        (Humanize.Permissions.Grant_Label
           ("Ada", Humanize.Permissions.Owner_Role),
         "Ada granted owner", "grant label");
      Check
        (Permission_Detailed,
         "[permissions warning] Ada deploy requires approval",
         "permission option metadata");
      AUnit.Assertions.Assert
        (Parsed_Permission.Status = Ok
         and then Parsed_Permission.Metadata.Severity =
           Humanize.Domain_Details.Warning_Severity
         and then Parsed_Permission.Name_Length = 10,
         "parse permission label");

      Check
        (Humanize.Builds.Test_Count_Label
           (2, Humanize.Builds.Flaky_Test),
         "2 tests flaky", "flaky tests");
      Check (Humanize.Builds.Coverage_Label ("81%"), "coverage 81%", "coverage");
      Check
        (Humanize.Builds.Benchmark_Label ("parser", "regressed by 12%"),
         "parser benchmark regressed by 12%", "benchmark");
      Check
        (Humanize.Builds.Gate_State_Label (Humanize.Builds.Gate_Failed),
         "release gate failed", "gate state");
      Check
        (Build_Detailed,
         "[builds danger] release build failed",
         "build option metadata");
      AUnit.Assertions.Assert
        (Parsed_Build.Status = Ok
         and then Parsed_Build.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Build.Name_Length = 7,
         "parse build label");
   end Test_Data_Media_Notification_Permissions_Builds;

   procedure Test_Domain_Details
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use Humanize.Domain_Details;

      Metadata : constant Domain_Label_Metadata :=
        (Surface    => Deployments_Surface,
         Severity   => Warning_Severity,
         Tone       => Caution_Tone,
         Final      => False,
         Actionable => True);
      Detailed : constant Text_Result :=
        Domain_Label
          ("release 1.2 deployed to production",
           Metadata,
           (Mode             => Detailed_Output,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => True));
      Accessible : constant Text_Result :=
        Accessible_Label
          ("MFA enabled, image 1920x1080, 3/10 complete",
           (Surface    => Accounts_Surface,
            Severity   => Success_Severity,
            Tone       => Positive_Tone,
            Final      => True,
            Actionable => False));
      Cross : constant Text_Result :=
        Cross_Domain_Summary
          ("release 1.2 deployed",
           "2 release gates failed",
           Metadata);
      Three : constant Text_Result :=
        Three_Part_Summary
          ("Ada suspended account",
           "MFA reset required",
           "3 active sessions",
           (Surface    => Accounts_Surface,
            Severity   => Danger_Severity,
            Tone       => Critical_Tone,
            Final      => False,
            Actionable => True));
      Parsed : constant Domain_Label_Parse_Result :=
        Parse_Domain_Label
          ("[deployments warning caution] release 1.2 deployed");
      State_Meta : constant Domain_Label_Metadata :=
        State_Metadata (Builds_Surface, "release gate failed");
      Deployment_Build : constant Text_Result :=
        Deployment_Build_Summary
          ("release 1.2 deployed",
           "build passed",
           "release gate failed",
           (Mode             => Detailed_Output,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Account_Permission : constant Text_Result :=
        Account_Permission_Summary
          ("Ada suspended account",
           "Ada deploy requires approval",
           "3 active sessions");
      Operation_Status : constant Text_Result :=
        Operation_Status_Summary
          ("sync running: 8 of 10 items complete",
           "API HTTP 503 service unavailable");
      Data_Import : constant Text_Result :=
        Data_Import_Summary
          ("2 duplicate records",
           "customers.csv partial import: 98 accepted, 2 rejected");
      Rich_Accessible : constant Text_Result :=
        Accessible_Label
          ("CI API PDF SQLSTATE ETA SLA xfail xpass",
           (Surface    => Builds_Surface,
            Severity   => Info_Severity,
            Tone       => Plain_Tone,
            Final      => False,
            Actionable => False));
      Log_Field : constant Log_Field_Parse_Result :=
        Parse_Log_Field ("state=running");
      Scanned_Log_Field : constant Log_Field_Parse_Result :=
        Scan_Log_Field ("completed=8 total=10");
      Narrative : constant Text_Result :=
        Narrative_Summary
          ("deployment", "finished", "failed",
           "rollback available", Metadata);
      Event : constant Text_Result :=
        Event_Summary
          ("deployment", "failed", "Ada", "after 3 minutes", Metadata);
      Parts : constant Text_Result :=
        Label_Parts_Summary
          ([Make_Label_Part (Primary_Part, "3"),
            Make_Label_Part (Unit_Part, "files"),
            Make_Label_Part (Qualifier_Part, "remaining")]);
      Diff : constant Text_Result :=
        Diff_Summary ("title", Changed_Diff, "Draft", "Published");
      Text_Diff : constant Text_Result :=
        Text_Diff_Summary (Lines_Added => 3, Lines_Removed => 1,
                           Words_Changed => 2);
      Profile : constant Text_Result :=
        Output_Profile_Label
          ((Mode => Detailed_Output, Include_Metadata => True,
            Accessible => False, Log_Safe => True, Compact => False,
            Terminal_Width => 80));
      Aggregate : constant Text_Result :=
        Aggregate_Summary ("job", 12, Success => 9, Warning => 2,
                           Failure => 1);
      Top_Item : constant Text_Result :=
        Top_Item_Summary ("issue", "missing label", 4);
      Combined : constant Text_Result :=
        Combined_Metadata_Label
          (Metadata,
           (Surface => Diagnostics_Surface, Severity => Danger_Severity,
            Tone => Critical_Tone, Final => True, Actionable => False));
      Validation : constant Text_Result :=
        Validation_Report_Label
          ("profile form", Errors => 2, Warnings => 1, Missing => 3,
           Hint => "review required fields");
      Stability : constant Text_Result :=
        Stability_Metadata_Label
          ((Round_Trippable => True, Lossless => True, Approximate => False,
            Locale_Dependent => False, Privacy_Safe => True,
            Stable_For_Logs => True, Bounded_Available => True));
      Example : constant Example_Case :=
        Example_Case_For
          (Deployments_Surface, "deploy-fail", "status=failed",
           "deployment failed",
           (Round_Trippable => True, Lossless => True, Approximate => False,
            Locale_Dependent => False, Privacy_Safe => True,
            Stable_For_Logs => True, Bounded_Available => True));
      Buffer  : String (1 .. 18);
      Written : Natural;
      Code    : Status_Code;
   begin
      Check (Surface_Label (Deployments_Surface), "deployments", "surface label");
      Check (Output_Mode_Label (Accessible_Output), "accessible", "mode label");
      Check (Severity_Label (Danger_Severity), "danger", "severity label");
      Check (Tone_Label (Critical_Tone), "critical", "tone label");
      Check
        (Detailed,
         "[deployments warning caution] release 1.2 deployed to production",
         "domain label with metadata");
      Check
        (Accessible,
         "multi-factor authentication enabled, image 1920 by 1080, 3 of 10 complete",
         "accessible domain label");
      Check
        (Cross,
         "release 1.2 deployed, 2 release gates failed",
         "cross domain summary");
      Check
        (Three,
         "Ada suspended account, MFA reset required, 3 active sessions",
         "three part summary");
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Has_Surface
         and then Parsed.Surface = Deployments_Surface
         and then Parsed.Has_Severity
         and then Parsed.Severity = Warning_Severity
         and then Parsed.Has_Tone
         and then Parsed.Tone = Caution_Tone,
         "parse domain metadata");
      AUnit.Assertions.Assert
        (Parsed.Body_Length = 20,
         "parse domain body length");
      AUnit.Assertions.Assert
        (Log_Field.Status = Ok
         and then Log_Field.Key_Length = 5
         and then Log_Field.Value_Length = 7
         and then Log_Field.Consumed = 13,
         "parse log field");
      AUnit.Assertions.Assert
        (Scanned_Log_Field.Status = Ok
         and then Scanned_Log_Field.Key_Length = 9
         and then Scanned_Log_Field.Value_Length = 1
         and then Scanned_Log_Field.Consumed = 11,
         "scan log field");
      AUnit.Assertions.Assert
        (State_Meta.Severity = Danger_Severity
         and then State_Meta.Tone = Critical_Tone
         and then State_Meta.Actionable,
         "state metadata infers danger");
      Check
        (Deployment_Build,
         "[deployments danger] release 1.2 deployed, build passed, release gate failed",
         "deployment build summary");
      Check
        (Account_Permission,
         "Ada suspended account, Ada deploy requires approval, 3 active sessions",
         "account permission summary");
      Check
        (Operation_Status,
         "sync running: 8 of 10 items complete, API HTTP 503 service unavailable",
         "operation status summary");
      Check
        (Data_Import,
         "2 duplicate records, customers.csv partial import: 98 accepted, 2 rejected",
         "data import summary");
      Check
        (Rich_Accessible,
         "continuous integration A P I P D F S Q L state "
         & "estimated time of arrival service level agreement "
         & "expected failure unexpected pass",
         "rich accessible abbreviations");
      Check
        (Metadata_Summary_Label (Metadata),
         "metadata surface=deployments severity=warning tone=caution not final actionable",
         "metadata summary label");
      Check
        (Narrative,
         "deployment finished: failed; rollback available",
         "narrative summary");
      Check
        (Event,
         "deployment completed with: failed; by Ada, after 3 minutes",
         "event summary");
      Check
        (Parts,
         "parts: primary=3 unit=files qualifier=remaining -> 3 files remaining",
         "label parts summary");
      Check
        (Diff,
         "title changed from Draft to Published",
         "diff summary");
      Check
        (Text_Diff,
         "3 lines added, 1 line removed, 2 words changed",
         "text diff summary");
      Check
        (Profile,
         "profile mode=log metadata=yes log-safe=yes width=80",
         "output profile label");
      Check
        (Aggregate,
         "12 jobs: 9 succeeded, 2 warnings, 1 failed",
         "aggregate summary");
      Check
        (Top_Item,
         "top issue: missing label (4)",
         "top item summary");
      Check
        (Combined,
         "metadata surface=deployments severity=danger tone=critical not final actionable",
         "combined metadata label");
      Check
        (Validation,
         "profile form validation: 2 errors, 1 warning, "
         & "3 missing required items; review required fields",
         "validation report label");
      Check
        (Stability,
         "stability round-trip=yes lossless=yes approximate=no "
         & "locale-dependent=no privacy-safe=yes log-stable=yes bounded=yes",
         "stability metadata label");
      Check
        (Example_Case_Label (Example),
         "example deployments.deploy-fail: input=status=failed "
         & "expected=deployment failed",
         "example case label");
      declare
         Parsed_Narrative : constant Composition_Label_Parse_Result :=
           Parse_Narrative_Summary
             ("deployment finished: failed; rollback available");
         Scanned_Narrative : constant Composition_Label_Parse_Result :=
           Scan_Narrative_Summary
             ("deployment finished: failed; rollback available"
              & ASCII.LF & "next");
         Parsed_Event : constant Composition_Label_Parse_Result :=
           Parse_Event_Summary
             ("deployment completed with: failed; by Ada, after 3 minutes");
         Parsed_Diff : constant Diff_Label_Parse_Result :=
           Parse_Diff_Summary ("title changed from Draft to Published");
         Parsed_Text_Diff : constant Count_Label_Parse_Result :=
           Parse_Text_Diff_Summary
             ("3 lines added, 1 line removed, 2 words changed");
         Parsed_Aggregate : constant Count_Label_Parse_Result :=
           Parse_Aggregate_Summary
             ("12 jobs: 9 succeeded, 2 warnings, 1 failed");
         Parsed_Validation : constant Count_Label_Parse_Result :=
           Parse_Validation_Report_Label
             ("profile form validation: 2 errors, 1 warning, "
              & "3 missing required items; review required fields");
         Parsed_Singular_Validation : constant Count_Label_Parse_Result :=
           Parse_Validation_Report_Label
             ("field validation: 1 error, 0 warnings, "
              & "0 missing required items");
         Parsed_Valid_Validation : constant Count_Label_Parse_Result :=
           Parse_Validation_Report_Label ("field valid");
         Parsed_Stability : constant Stability_Label_Parse_Result :=
           Parse_Stability_Metadata_Label
             ("stability round-trip=yes lossless=yes approximate=no "
              & "locale-dependent=no privacy-safe=yes log-stable=yes bounded=yes");
         Parsed_Example : constant Example_Case_Parse_Result :=
           Parse_Example_Case_Label
             ("example deployments.deploy-fail: input=status=failed "
              & "expected=deployment failed");
      begin
         AUnit.Assertions.Assert
           (Parsed_Narrative.Status = Ok
            and then Parsed_Narrative.Subject_Length = 10
            and then Parsed_Narrative.Action_Length = 8
            and then Parsed_Narrative.Result_Length = 6
            and then Parsed_Narrative.Detail_Length = 18,
            "parse narrative summary");
         AUnit.Assertions.Assert
           (Scanned_Narrative.Status = Ok
            and then Scanned_Narrative.Consumed = 47,
            "scan narrative summary");
         AUnit.Assertions.Assert
           (Parsed_Event.Status = Ok
            and then Parsed_Event.Action_Length = 14
            and then Parsed_Event.Detail_Length = 23,
            "parse event summary");
         AUnit.Assertions.Assert
           (Parsed_Diff.Status = Ok
            and then Parsed_Diff.Kind = Changed_Diff
            and then Parsed_Diff.Field_Length = 5
            and then Parsed_Diff.Old_Value_Length = 5
            and then Parsed_Diff.New_Value_Length = 9,
            "parse diff summary");
         AUnit.Assertions.Assert
           (Parsed_Text_Diff.Status = Ok
            and then Parsed_Text_Diff.Lines_Added = 3
            and then Parsed_Text_Diff.Lines_Removed = 1
            and then Parsed_Text_Diff.Words_Changed = 2,
            "parse text diff summary");
         AUnit.Assertions.Assert
           (Parsed_Aggregate.Status = Ok
            and then Parsed_Aggregate.Total = 12
            and then Parsed_Aggregate.Success = 9
            and then Parsed_Aggregate.Warning = 2
            and then Parsed_Aggregate.Failure = 1,
            "parse aggregate summary");
         AUnit.Assertions.Assert
           (Parsed_Validation.Status = Ok
            and then Parsed_Validation.Subject_Length = 12
            and then Parsed_Validation.Failure = 2
            and then Parsed_Validation.Warning = 1
            and then Parsed_Validation.Total = 3,
            "parse validation report label");
         AUnit.Assertions.Assert
           (Parsed_Singular_Validation.Status = Ok
            and then Parsed_Singular_Validation.Subject_Length = 5
            and then Parsed_Singular_Validation.Failure = 1
            and then Parsed_Singular_Validation.Warning = 0
            and then Parsed_Singular_Validation.Total = 0,
            "parse singular validation report label");
         AUnit.Assertions.Assert
           (Parsed_Valid_Validation.Status = Ok
            and then Parsed_Valid_Validation.Subject_Length = 5
            and then Parsed_Valid_Validation.Failure = 0
            and then Parsed_Valid_Validation.Warning = 0
            and then Parsed_Valid_Validation.Total = 0,
            "parse valid validation report label");
         AUnit.Assertions.Assert
           (Parsed_Stability.Status = Ok
            and then Parsed_Stability.Metadata.Round_Trippable
            and then Parsed_Stability.Metadata.Lossless
            and then not Parsed_Stability.Metadata.Approximate
            and then Parsed_Stability.Metadata.Bounded_Available,
            "parse stability metadata label");
         AUnit.Assertions.Assert
           (Parsed_Example.Status = Ok
            and then Parsed_Example.Area = Deployments_Surface
            and then Parsed_Example.Name_Length = 11
            and then Parsed_Example.Input_Length = 13
            and then Parsed_Example.Expected_Length = 17,
            "parse example case label");
      end;
      declare
         Narrative_Input : Narrative_Summary_Input;
         Diff_Input : Diff_Summary_Input;
         Aggregate_Input : Aggregate_Summary_Input;
         Validation_Input : Validation_Report_Input;
      begin
         Narrative_Input.Subject (1 .. 10) := "deployment";
         Narrative_Input.Subject_Length := 10;
         Narrative_Input.Action (1 .. 8) := "finished";
         Narrative_Input.Action_Length := 8;
         Narrative_Input.Result (1 .. 6) := "failed";
         Narrative_Input.Result_Length := 6;
         Narrative_Input.Detail (1 .. 18) := "rollback available";
         Narrative_Input.Detail_Length := 18;
         Check
           (Narrative_Summary (Narrative_Input),
            "deployment finished: failed; rollback available",
            "structured narrative summary");

         Diff_Input.Field_Name (1 .. 5) := "title";
         Diff_Input.Field_Length := 5;
         Diff_Input.Kind := Redacted_Diff;
         Diff_Input.Redacted := True;
         Check
           (Diff_Summary (Diff_Input),
            "title changed; values redacted",
            "structured redacted diff summary");

         Aggregate_Input.Subject (1 .. 3) := "job";
         Aggregate_Input.Subject_Length := 3;
         Aggregate_Input.Total := 12;
         Aggregate_Input.Success := 9;
         Aggregate_Input.Warning := 2;
         Aggregate_Input.Failure := 1;
         Check
           (Aggregate_Summary (Aggregate_Input),
            "12 jobs: 9 succeeded, 2 warnings, 1 failed",
            "structured aggregate summary");

         Validation_Input.Subject (1 .. 12) := "profile form";
         Validation_Input.Subject_Length := 12;
         Validation_Input.Errors := 2;
         Validation_Input.Warnings := 1;
         Validation_Input.Missing := 3;
         Validation_Input.Hint (1 .. 22) := "review required fields";
         Validation_Input.Hint_Length := 22;
         Check
           (Validation_Report_Label (Validation_Input),
            "profile form validation: 2 errors, 1 warning, "
            & "3 missing required items; review required fields",
            "structured validation report");
      end;
      Check
        (Privacy_Aware_Label_Parts_Summary
           ([Make_Label_Part (Primary_Part, "token"),
             Make_Label_Part (Safe_Value_Part, "abcd1234")],
            Redact_All => True),
         "parts: primary=token safe-value=redacted -> token redacted",
         "privacy-aware label parts");
      Check
        (Aggregate_Metadata_Label
           ([(Surface => Deployments_Surface, Severity => Warning_Severity,
              Tone => Caution_Tone, Final => False, Actionable => True),
             (Surface => Diagnostics_Surface, Severity => Danger_Severity,
              Tone => Critical_Tone, Final => True, Actionable => False)]),
         "metadata surface=deployments severity=danger tone=critical not final actionable",
         "aggregate metadata label");
      Check
        (Remediation_Summary_Label
           ("fix required fields", "retry submission", Count => 3),
         "fix 3 findings: fix required fields, then retry submission",
         "remediation summary label");
      Check
        (Composition_Diagnostic_Label
           ("Narrative_Summary", "subject", "must not be empty"),
         "Narrative_Summary subject: must not be empty",
         "composition diagnostic label");
      Check
        (Example_Case_Label (Example_Case_For_Area (Forms_Surface)),
         "example forms.forms-basic: input=status=ok expected=forms ok",
         "example case for area");
      declare
         Parsed_Metadata : constant Domain_Label_Parse_Result :=
           Parse_Metadata_Summary_Label
             ("metadata surface=deployments severity=warning tone=caution not final actionable");
         Scanned_Metadata : constant Domain_Label_Parse_Result :=
           Scan_Metadata_Summary_Label
             ("metadata surface=deployments severity=warning tone=caution not final actionable"
              & ASCII.LF & "next");
      begin
         AUnit.Assertions.Assert
           (Parsed_Metadata.Status = Ok
            and then Parsed_Metadata.Has_Surface
            and then Parsed_Metadata.Surface = Deployments_Surface
            and then Parsed_Metadata.Has_Severity
            and then Parsed_Metadata.Severity = Warning_Severity
            and then Parsed_Metadata.Has_Tone
            and then Parsed_Metadata.Tone = Caution_Tone,
            "parse metadata summary label");
         AUnit.Assertions.Assert
           (Scanned_Metadata.Status = Ok
            and then Scanned_Metadata.Consumed = 79,
            "scan metadata summary label");
      end;
      Domain_Label_Into
        ("release 1.2 deployed to production",
         Metadata, Buffer, Written, Code,
         (Mode             => Detailed_Output,
          Include_Surface  => True,
          Include_Severity => False,
          Include_Tone     => False));
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "[deployments] rele",
         "bounded domain label overflow");
      Metadata_Summary_Label_Into (Metadata, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "metadata surface=d",
         "bounded metadata summary overflow");
      Narrative_Summary_Into
        ("deployment", "finished", "failed", Buffer, Written, Code,
         Detail => "rollback available");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "deployment finishe",
         "bounded narrative summary overflow");
      Validation_Report_Label_Into
        ("profile form", Buffer, Written, Code, Errors => 2, Missing => 1);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "profile form valid",
         "bounded validation report overflow");
      Event_Summary_Into
        ("deployment", "failed", Buffer, Written, Code,
         Actor_Label => "Ada", Time_Label => "after 3 minutes");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "deployment complet",
         "bounded event summary overflow");
      Label_Parts_Summary_Into
        ([Make_Label_Part (Primary_Part, "3"),
          Make_Label_Part (Unit_Part, "files")],
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "parts: primary=3 u",
         "bounded label parts overflow");
      Diff_Summary_Into
        ("title", Changed_Diff, Buffer, Written, Code,
         Old_Value => "Draft", New_Value => "Published");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "title changed from",
         "bounded diff summary overflow");
      Text_Diff_Summary_Into
        (Buffer, Written, Code, Lines_Added => 3, Lines_Removed => 1);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "3 lines added, 1 l",
         "bounded text diff summary overflow");
      Output_Profile_Label_Into
        ((Mode => Detailed_Output, Include_Metadata => True,
          Accessible => False, Log_Safe => True, Compact => False,
          Terminal_Width => 80),
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "profile mode=log m",
         "bounded output profile overflow");
      Aggregate_Summary_Into
        ("job", 12, Buffer, Written, Code, Success => 9, Warning => 2,
         Failure => 1);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "12 jobs: 9 succeed",
         "bounded aggregate summary overflow");
      Top_Item_Summary_Into
        ("issue", "missing label", 4, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "top issue: missing",
         "bounded top item summary overflow");
      Combined_Metadata_Label_Into
        (Metadata,
         (Surface => Diagnostics_Surface, Severity => Danger_Severity,
          Tone => Critical_Tone, Final => True, Actionable => False),
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "metadata surface=d",
         "bounded combined metadata overflow");
      Stability_Metadata_Label_Into
        ((Round_Trippable => True, Lossless => True, Approximate => False,
          Locale_Dependent => False, Privacy_Safe => True,
          Stable_For_Logs => True, Bounded_Available => True),
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "stability round-tr",
         "bounded stability metadata overflow");
      Example_Case_Label_Into (Example, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "example deployment",
         "bounded example case overflow");
      AUnit.Assertions.Assert
        (Domain_Label ("", Metadata).Status = Invalid_Argument,
         "empty domain label invalid");
   end Test_Domain_Details;

   procedure Test_Cross_Domain_Features
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use Humanize.Cross_Domain;
      use Humanize.Domain_Details;
      Parsed : constant Feature_Label_Parse_Result :=
        Parse_Feature_Label
          ("progress import: 3 of 5 complete (60%), running");
      Scanned : constant Feature_Label_Parse_Result :=
        Scan_Feature_Label
          ("identifier uuid: 550e84...4000" & ASCII.LF & "next");
      Domain_Profile : constant Metadata_Profile :=
        Domain_Metadata_Profile
          ((Surface => Secrets_Surface, Severity => Warning_Severity,
            Tone => Caution_Tone, Final => False, Actionable => True));
      UUID_Class : constant Identifier_Classification :=
        Identifier_Kind_Of ("550e8400-e29b-41d4-a716-446655440000");
      Contact_Class : constant Contact_Profile :=
        Contact_Profile_Of ("+45 12 34 56 78");
      File_Class : constant File_Metadata_Classification :=
        File_Metadata_Kind_Of
          ("release.tar.gz", "application/gzip",
           Checksum => Checksum_Valid);
      Enum_Metadata : constant Enum_State_Metadata :=
        Enum_State_Metadata_Of ("FAILED_PAYMENT");
      Label_Profile : constant Metadata_Profile :=
        Label_Family_Profile ("contact");
      Product_Parse : constant Product_Code_Parse_Result :=
        Parse_Product_Code_Label
          ("product code ISBN-13: 978-1-4028-9462-6, checksum valid");
      Product_Scan : constant Product_Code_Parse_Result :=
        Scan_Product_Code_Label
          ("product code SKU: SKU-ABC-123, checksum not checked"
           & ASCII.LF & "next");
      Validation_Parse : constant Validation_Constraint_Parse_Result :=
        Parse_Validation_Constraint_Label
          ("validation age: must be at least 18, got 16");
      Validation_Scan : constant Validation_Constraint_Parse_Result :=
        Scan_Validation_Constraint_Label
          ("validation age: must be at least 18, got 16" & ASCII.LF
           & "trailing");
      File_Parse : constant File_Metadata_Parse_Result :=
        Parse_File_Metadata_Label
          ("file photo.png: image, 120 KB, checksum missing");
      File_Scan : constant File_Metadata_Parse_Result :=
        Scan_File_Metadata_Label
          ("file photo.png: image, 120 KB, checksum missing" & ASCII.LF
           & "next");
      Network_Parse : constant Network_Diagnostic_Parse_Result :=
        Parse_Network_Diagnostic_Label
          ("network diagnostic example.com: TLS certificate failed, "
           & "certificate expired");
      Network_Scan : constant Network_Diagnostic_Parse_Result :=
        Scan_Network_Diagnostic_Label
          ("network diagnostic example.com: TLS certificate failed, "
           & "certificate expired" & ASCII.LF & "next");
      Diff_Tree_Parse : constant Diff_Tree_Parse_Result :=
        Parse_Structured_Diff_Tree_Label
          ("diff tree settings: 3 fields changed, 1 item added, "
           & "2 items removed, 1 redacted change");
      Diff_Tree_Scan : constant Diff_Tree_Parse_Result :=
        Scan_Structured_Diff_Tree_Label
          ("diff tree settings: 3 fields changed, 1 item added, "
           & "2 items removed, 1 redacted change" & ASCII.LF & "next");
      Coverage : constant Metadata_Coverage_Summary :=
        Metadata_Coverage
          ([(Family => [others => ' '], Length => 10,
             Profile =>
               (Log_Safe => True, Privacy_Safe => True, Parseable => True,
                Bounded_Available => True, Stable => True,
                Approximate => False, Lossless => True)),
            (Family => [others => ' '], Length => 0,
             Profile =>
               (Log_Safe => True, Privacy_Safe => False, Parseable => False,
                Bounded_Available => True, Stable => True,
                Approximate => True, Lossless => False))]);
      Buffer  : String (1 .. 16);
      Written : Natural;
      Code    : Status_Code;
   begin
      Check
        (Time_Zone_Label
           (Named_Zone, "Europe/Copenhagen", 120, Has_DST => True),
         "time zone: Europe/Copenhagen (UTC+02:00), observes daylight saving",
         "time-zone label");
      Check
        (Zoned_Time_Label
           ("2026-07-13 09:30", "CEST", 120, Ambiguous => True),
         "zoned time: 2026-07-13 09:30 CEST (UTC+02:00), "
         & "ambiguous local time",
         "zoned-time label");
      Check
        (Resolve_Time_Zone_Label
           ("Europe/Copenhagen", "2026-03-29 02:30",
            (Kind => Named_Zone, Offset_Minutes => 60, Ambiguous => False,
             Skipped => True, Has_DST => True)),
         "time zone resolution: 2026-03-29 02:30 Europe/Copenhagen => "
         & "UTC+01:00, skipped local time, daylight saving",
         "resolved time-zone label");
      Check
        (Time_Zone_Resolution_Label
           ("Europe/Copenhagen",
            (Kind => Named_Zone, Offset_Minutes => 120, Ambiguous => True,
             Skipped => False, Has_DST => True)),
         "time zone metadata Europe/Copenhagen: offset=UTC+02:00 "
         & "ambiguous=yes skipped=no dst=yes",
         "time-zone resolution metadata label");
      Check
        (Identifier_Label
           (UUID_Identifier, "550e8400-e29b-41d4-a716-446655440000"),
         "identifier uuid: 550e84...0000",
         "identifier label");
      AUnit.Assertions.Assert
        (UUID_Class.Kind = UUID_Identifier
         and then UUID_Class.Valid_Shape
         and then UUID_Class.Entropy_Hint = 122,
         "identifier classifier");
      Check
        (Auto_Identifier_Label ("01J7Y3W4S5N6P7Q8R9T0V1W2X3"),
         "identifier ulid: 01J7Y3...W2X3",
         "auto identifier label");
      Check
        (Contact_Label (Email_Contact, "ada@example.com"),
         "contact email: hidden@example.com",
         "contact label");
      AUnit.Assertions.Assert
        (Contact_Class.Kind = Phone_Contact
         and then Contact_Class.Valid_Shape
         and then Contact_Class.Visible_Tail = 4,
         "contact classifier");
      Check
        (Auto_Contact_Label ("Ada Lovelace, London"),
         "contact address: ...ndon",
         "auto contact label");
      AUnit.Assertions.Assert
        (Product_Code_Kind_Of ("978-1-4028-9462-6") = EAN_13_Code,
         "product-code classifier");
      Check
         (Product_Code_Label
           ("SKU-ABC-123", SKU_Code, Checksum => Checksum_Valid),
         "product code SKU: SKU-ABC-123, checksum valid",
         "product-code label");
      AUnit.Assertions.Assert
        (Product_Code_Checksum ("978-1-4028-9462-6", ISBN_13_Code)
           = Checksum_Valid
         and then Product_Code_Checksum ("978-1-4028-9462-0", ISBN_13_Code)
           = Checksum_Mismatch,
         "product-code checksum");
      AUnit.Assertions.Assert
        (Machine_Checksum ("79927398713", Luhn_Checksum) = Checksum_Valid
         and then Machine_Checksum ("79927398710", Luhn_Checksum)
           = Checksum_Mismatch
         and then Machine_Checksum ("GB82 WEST 1234 5698 7654 32",
                                    IBAN_Checksum) = Checksum_Valid
         and then Machine_Checksum ("US0378331005", ISIN_Checksum)
           = Checksum_Valid
         and then Machine_Checksum ("1M8GDM9AXKP042788", VIN_Checksum)
           = Checksum_Valid,
         "machine identifier checksum");
      Check
        (Machine_Checksum_Label ("GB82 WEST 1234 5698 7654 32", IBAN_Checksum),
         "machine checksum IBAN: GB82 W...4 32, checksum valid",
         "machine checksum label");
      AUnit.Assertions.Assert
        (Product_Parse.Status = Ok
         and then Product_Parse.Kind = ISBN_13_Code
         and then Product_Parse.Checksum = Checksum_Valid
         and then Product_Parse.Value_Length = 17,
         "parse product-code label");
      AUnit.Assertions.Assert
        (Product_Scan.Status = Ok
         and then Product_Scan.Consumed = 51
         and then Product_Scan.Kind = SKU_Code,
         "scan product-code label");
      Check
        (Progress_Label ("import", 3, 5),
         "progress import: 3 of 5 complete (60%), running",
         "progress label");
      Check
        (Progress_Bar_Label (3, 5, Width => 10),
         "progress bar: [######----] 60%",
         "progress bar label");
      Check
        (Collection_Summary_Label
           ("events", Total => 12, Unique => 9, Duplicates => 3,
            Outliers => 1),
         "collection events: 12 items, 9 unique values, 3 duplicates, "
         & "1 outlier",
         "collection summary label");
      Check
        (Top_Frequency_Label ("status", "failed", 4),
         "top status: failed (4 times)",
         "top frequency label");
      Check
        (Enum_Label ("HTTP_TOO_MANY_REQUESTS", Strip_Prefix => "HTTP_"),
         "enum: too many requests",
         "enum label");
      Check
        (Structured_Diff_Label
           ("settings.quota", "10 GB", "20 GB"),
         "diff settings.quota: changed from 10 GB to 20 GB",
         "structured diff label");
      Check
        (Structured_Diff_Label
           ("password", "old", "new", Redacted => True),
         "diff password: changed; values redacted",
         "redacted structured diff label");
      Check
        (Validation_Problem_Label
           ("password", Minimum_Problem, "at least 8 characters"),
         "validation password: is below minimum (at least 8 characters)",
         "validation problem label");
      Check
        (Validation_Constraint_Label
           ("age", Greater_Or_Equal, "18", Actual => "16"),
         "validation age: must be at least 18, got 16",
         "validation constraint label");
      Check
        (Validation_Result_Label
           ((Fields => 3, Errors => 2, Warnings => 1, Required => 1,
             Choices => 1, Dependencies => 0, Hidden => 1)),
         "validation result: 3 fields, 2 errors, 1 warning, "
         & "1 required field, 1 hidden problem",
         "validation result label");
      AUnit.Assertions.Assert
        (Validation_Parse.Status = Ok
         and then Validation_Parse.Relation = Greater_Or_Equal
         and then Validation_Parse.Field_Length = 3
         and then Validation_Parse.Value_Length = 2
         and then Validation_Parse.Actual_Length = 2,
         "parse validation constraint label");
      AUnit.Assertions.Assert
        (Validation_Scan.Status = Ok
         and then Validation_Scan.Consumed = 43,
         "scan validation constraint label");
      Check
        (Validation_Choice_Label
           ("role", "admin, editor, viewer", Actual => "owner"),
         "validation role: allowed values admin, editor, viewer, got owner",
         "validation choice label");
      Check
        (File_Metadata_Label
           ("release.tar.gz", Archive_File, "4.2 MB",
            "91fe1234567890"),
         "file release.tar.gz: archive, 4.2 MB, checksum 91fe12...7890",
         "file metadata label");
      AUnit.Assertions.Assert
        (File_Class.Kind = Compressed_File
         and then File_Class.Archive
         and then File_Class.Compressed
         and then File_Class.Checksum_Verified = Checksum_Valid,
         "file metadata classifier");
      Check
         (Auto_File_Metadata_Label
           ("photo.png", "image/png", "120 KB", Checksum => Checksum_Missing),
         "file photo.png: image, 120 KB, checksum missing",
         "auto file metadata label");
      Check
        (File_Signature_Label ("photo.jpg", Image_File, Plain_File),
         "file signature photo.jpg: extension says image, "
         & "content looks like file",
         "file signature label");
      AUnit.Assertions.Assert
        (File_Parse.Status = Ok
         and then File_Parse.Kind = Image_File
         and then File_Parse.Checksum = Checksum_Missing
         and then File_Parse.Name_Length = 9,
         "parse file metadata label");
      AUnit.Assertions.Assert
        (File_Scan.Status = Ok
         and then File_Scan.Consumed = 47,
         "scan file metadata label");
      Check
        (Network_Session_Label
           ("example.com", Retrying_Network, "HTTP 429", "5 seconds"),
         "network example.com: retrying, HTTP 429, retry in 5 seconds",
         "network session label");
      Check
        (Network_Diagnostic_Label
           ("example.com", TLS_Diagnostic, "certificate expired",
            "1 hour"),
         "network diagnostic example.com: TLS certificate failed, "
         & "certificate expired, retry in 1 hour",
         "network diagnostic label");
      AUnit.Assertions.Assert
        (Network_Event_Kind_Of (429) = Rate_Limited_Network
         and then Network_Event_Kind_Of (0, TLS_Failed => True)
           = TLS_Failed_Network,
         "network event classifier");
      AUnit.Assertions.Assert
        (Network_Diagnostic_Kind_Of ("DNS NXDOMAIN") = DNS_Diagnostic
         and then Network_Parse.Status = Ok
         and then Network_Parse.Kind = TLS_Diagnostic
         and then Network_Parse.Endpoint_Length = 11
         and then Network_Parse.Detail_Length = 19,
         "parse network diagnostic label");
      AUnit.Assertions.Assert
        (Network_Scan.Status = Ok
         and then Network_Scan.Consumed = 75,
         "scan network diagnostic label");
      Check
        (Terminal_Column_Label ("status", 12, Align_Right),
         "terminal column status: width 12, right aligned",
         "terminal column label");
      Check
        (Terminal_Row_Label (3, 48, Truncated => True),
         "terminal row: 3 cells, width 48, truncated",
         "terminal row label");
      Check
        (Terminal_Table_Layout_Label
           (Columns => 3, Rows => 12, Width => 80, Truncated_Cells => 2),
         "terminal table: 3 columns, 12 rows, width 80, 2 truncated cells",
         "terminal table layout label");
      Check
        (Terminal_Table_Render_Label
           ((Columns => 3, Rows => 12, Width => 80, Header => True,
             Wrapped_Cells => 1, Truncated_Cells => 2, ANSI_Aware => True)),
         "terminal render: 3 columns, 12 rows, width 80, header=yes, "
         & "ansi-aware=yes, 1 wrapped cell, 2 truncated cells",
         "terminal table render label");
      Check
        (Metadata_Profile_Label
           ("identifier",
            (Log_Safe => True, Privacy_Safe => True, Parseable => True,
             Bounded_Available => True, Stable => True, Approximate => False,
             Lossless => False)),
         "metadata identifier: log-safe=yes privacy-safe=yes parseable=yes "
         & "bounded=yes stable=yes approximate=no lossless=no",
         "metadata profile label");
      AUnit.Assertions.Assert
        (Label_Profile.Privacy_Safe
         and then Label_Profile.Approximate
         and then not Label_Profile.Lossless,
         "label family profile");
      Check
        (Metadata_Coverage_Label
           ((Total_Families => 12, Metadata_Families => 10,
             Parseable_Families => 9, Bounded_Families => 11,
             Privacy_Safe_Families => 8)),
         "metadata coverage: 10 of 12 families expose metadata, 9 parseable, "
         & "11 bounded, 8 privacy-safe",
         "metadata coverage label");
      AUnit.Assertions.Assert
        (Coverage.Total_Families = 2
         and then Coverage.Metadata_Families = 1
         and then Coverage.Parseable_Families = 1
         and then Coverage.Bounded_Families = 2
         and then Coverage.Privacy_Safe_Families = 1,
         "metadata coverage aggregation");
      AUnit.Assertions.Assert
        (Enum_Metadata.Category = Failure_State
         and then Enum_Metadata.Final
         and then Enum_Metadata.Actionable
         and then Enum_Metadata.Severity = Danger_Severity,
         "enum state metadata");
      Check
        (Enum_State_Metadata_Label ("PENDING_APPROVAL"),
         "enum metadata pending approval: category=pending final=no "
         & "actionable=no",
         "enum state metadata label");
      Check
        (Structured_Diff_Tree_Label
           ("settings", Changed_Fields => 3, Added_Items => 1,
            Removed_Items => 2, Redacted_Items => 1),
         "diff tree settings: 3 fields changed, 1 item added, "
         & "2 items removed, 1 redacted change",
         "structured diff tree label");
      Check
        (Diff_Tree_Metadata_Label
           ((Nodes => 4, Field_Nodes => 2, Object_Nodes => 1,
             List_Nodes => 1, Redacted => 1)),
         "diff metadata: 4 nodes, 2 field nodes, 1 object node, "
         & "1 list node, 1 redacted node",
         "diff tree metadata label");
      AUnit.Assertions.Assert
        (Diff_Tree_Parse.Status = Ok
         and then Diff_Tree_Parse.Root_Length = 8
         and then Diff_Tree_Parse.Changed = 3
         and then Diff_Tree_Parse.Added = 1
         and then Diff_Tree_Parse.Removed = 2
         and then Diff_Tree_Parse.Redacted = 1,
         "parse structured diff tree label");
      AUnit.Assertions.Assert
        (Diff_Tree_Scan.Status = Ok
         and then Diff_Tree_Scan.Consumed = 86,
         "scan structured diff tree label");
      Check
        (Diff_Node_Label ("roles", List_Node, 4),
         "diff node roles: list, 4 changes",
         "diff node label");
      Check
        (Contact_Field_Label
           ((Has_Name => True, Has_Email => True, Has_Phone => False,
             Has_Address => True, Has_City => False,
             Has_Postal_Code => False, Has_Country => True)),
         "contact fields: 4 fields present, 3 fields missing",
         "contact field label");
      Check
        (Contact_Field_Label
           ((Has_Name => True, Has_Email => True, Has_Phone => False,
             Has_Address => True, Has_City => False,
             Has_Postal_Code => False, Has_Country => True),
            Missing_Only => True),
         "contact fields: 3 fields missing",
         "missing contact field label");
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Kind_Length = 15
         and then Parsed.Body_Length = 30
         and then Parsed.First_Count = 3
         and then Parsed.Second_Count = 5
         and then Parsed.Percent = 60,
         "parse cross-domain feature label");
      AUnit.Assertions.Assert
        (Scanned.Status = Ok
         and then Scanned.Consumed = 30
         and then Scanned.Kind_Length = 15,
         "scan cross-domain feature label");
      AUnit.Assertions.Assert
        (not Domain_Profile.Privacy_Safe
         and then Domain_Profile.Parseable
         and then not Domain_Profile.Lossless,
         "domain metadata profile inference");
      Time_Zone_Label_Into
        (Named_Zone, Buffer, Written, Code,
         Name => "Europe/Copenhagen", Offset_Minutes => 120);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "time zone: Europ",
         "bounded time-zone label");
      Identifier_Label_Into
        (Trace_Identifier, "abcdef1234567890", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "identifier trace",
         "bounded identifier label");
      Progress_Label_Into
        ("import", 3, 5, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "progress import:",
         "bounded progress label");
      Metadata_Profile_Label_Into
        ("id",
         (Log_Safe => True, Privacy_Safe => True, Parseable => True,
          Bounded_Available => True, Stable => True, Approximate => False,
          Lossless => True),
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "metadata id: log",
         "bounded metadata profile label");
      Product_Code_Label_Into
        ("SKU-ABC-123", Buffer, Written, Code, SKU_Code, Checksum_Valid);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "product code SKU",
         "bounded product-code label");
      Network_Diagnostic_Label_Into
        ("example.com", TLS_Diagnostic, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "network diagnost",
         "bounded network diagnostic label");
      Validation_Constraint_Label_Into
        ("age", Greater_Or_Equal, "18", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "validation age: ",
         "bounded validation constraint label");
      Terminal_Table_Render_Label_Into
        ((Columns => 3, Rows => 12, Width => 80, Header => True,
          Wrapped_Cells => 1, Truncated_Cells => 2, ANSI_Aware => True),
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "terminal render:",
         "bounded terminal table render label");
   end Test_Cross_Domain_Features;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize domain gap tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine
        (T, Test_Operations_And_Comparisons'Access,
         "operations and comparisons");
      Register_Routine
        (T, Test_Review_Accounts_Deployments'Access,
         "review accounts and deployments");
      Register_Routine
        (T, Test_Data_Media_Notification_Permissions_Builds'Access,
         "data media notification permissions and builds");
      Register_Routine
        (T, Test_Domain_Details'Access,
         "domain details metadata options and parsing");
      Register_Routine
        (T, Test_Cross_Domain_Features'Access,
         "cross-domain missing feature labels");
   end Register_Tests;
end Humanize.Tests.Domain_Gaps;
