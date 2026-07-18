separate (Humanize.Tests.Parsing.Test_Frequency_Rate_List)
   procedure Check_Schedule_Operational_And_Invoice_Parsers is
   begin
      AUnit.Assertions.Assert
        (Cron_Second_Monday.Status = Humanize.Status.Ok
         and then Cron_Second_Monday.Kind =
           Humanize.Parsing.Recurrence_Ordinal_Weekday
         and then Cron_Second_Monday.Nth_Weekday = 2
         and then Cron_Second_Monday.Ordinal = 2
         and then Cron_Second_Monday.Weekday = 1,
         "parse quartz cron nth weekday");
      AUnit.Assertions.Assert
        (Italian_Ordinal_Schedule.Status = Humanize.Status.Ok
         and then Italian_Ordinal_Schedule.Kind =
           Humanize.Parsing.Recurrence_Ordinal_Weekday
         and then Italian_Ordinal_Schedule.Ordinal = 1
         and then Italian_Ordinal_Schedule.Weekday = 1
         and then Italian_Ordinal_Schedule.Has_Time
         and then Italian_Ordinal_Schedule.Hour = 9
         and then Italian_Ordinal_Schedule.Minute = 30,
         "parse localized rendered ordinal schedule");
      AUnit.Assertions.Assert
        (Finnish_Rendered_Cron.Status = Humanize.Status.Ok
         and then Finnish_Rendered_Cron.Unit = Humanize.Durations.Every_Month
         and then Finnish_Rendered_Cron.Day_Of_Month = 15
         and then Finnish_Rendered_Cron.Has_Time
         and then Finnish_Rendered_Cron.Hour = 8
         and then Finnish_Rendered_Cron.Minute = 30,
         "parse Finnish rendered cron schedule");
      AUnit.Assertions.Assert
        (Polish_Rendered_Cron.Status = Humanize.Status.Ok
         and then Polish_Rendered_Cron.Unit = Humanize.Durations.Every_Month
         and then Polish_Rendered_Cron.Day_Of_Month = 15
         and then Polish_Rendered_Cron.Has_Time
         and then Polish_Rendered_Cron.Hour = 8
         and then Polish_Rendered_Cron.Minute = 30,
         "parse Polish rendered cron schedule");
      AUnit.Assertions.Assert
        (Danish_Rendered_Weekday.Status = Humanize.Status.Ok
         and then Danish_Rendered_Weekday.Kind =
           Humanize.Parsing.Recurrence_Weekday_Set
         and then Danish_Rendered_Weekday.Weekdays =
           Humanize.Durations.Weekdays
         and then Danish_Rendered_Weekday.Has_Time
         and then Danish_Rendered_Weekday.Hour = 9
         and then Danish_Rendered_Weekday.Minute = 0,
         "parse Danish rendered weekday schedule");
      AUnit.Assertions.Assert
        (Last_Business.Status = Humanize.Status.Ok
         and then Last_Business.Kind =
           Humanize.Parsing.Recurrence_Business_Day
         and then Last_Business.Ordinal = -1
         and then Last_Business.Unit = Humanize.Durations.Every_Month,
         "parse last business day recurrence");
      AUnit.Assertions.Assert
        (Every_Last_Weekday.Status = Humanize.Status.Ok
         and then Every_Last_Weekday.Kind =
           Humanize.Parsing.Recurrence_Business_Day
         and then Every_Last_Weekday.Ordinal = -1
         and then Every_Last_Weekday.Unit = Humanize.Durations.Every_Month,
         "parse every last weekday recurrence");
      AUnit.Assertions.Assert
        (Second_Business.Status = Humanize.Status.Ok
         and then Second_Business.Kind =
           Humanize.Parsing.Recurrence_Business_Day
         and then Second_Business.Ordinal = 2
         and then Second_Business.Unit = Humanize.Durations.Every_Month
         and then Second_Business.Has_Time
         and then Second_Business.Hour = 10
         and then Second_Business.Minute = 15,
         "parse ordinal business day recurrence");
      AUnit.Assertions.Assert
        (Until_Weeks.Status = Humanize.Status.Ok
         and then Until_Weeks.Every = 2
         and then Until_Weeks.Unit = Humanize.Durations.Every_Week
         and then Until_Weeks.Has_End_Date
         and then Until_Weeks.End_Date =
           Ada.Calendar.Time_Of (2026, 12, 31, 0.0),
         "parse recurrence until date");
      AUnit.Assertions.Assert
        (Windowed.Status = Humanize.Status.Ok
         and then Windowed.Has_Start_Date
         and then Windowed.Start_Date =
           Ada.Calendar.Time_Of (2026, 1, 1, 0.0)
         and then Windowed.Has_End_Date
         and then Windowed.End_Date =
           Ada.Calendar.Time_Of (2026, 12, 31, 0.0)
         and then Windowed.Has_Occurrences
         and then Windowed.Occurrences = 5,
         "parse recurrence start/end/count window");
      AUnit.Assertions.Assert
        (Windowed_Time.Status = Humanize.Status.Ok
         and then Windowed_Time.Every = 15
         and then Windowed_Time.Unit = Humanize.Durations.Every_Minute
         and then Windowed_Time.Has_Time_Window
         and then Windowed_Time.Window_Start_Hour = 9
         and then Windowed_Time.Window_Start_Minute = 0
         and then Windowed_Time.Window_End_Hour = 17
         and then Windowed_Time.Window_End_Minute = 0,
         "parse recurrence time window metadata");
      AUnit.Assertions.Assert
        (Weekday_Except_Friday.Status = Humanize.Status.Ok
         and then Weekday_Except_Friday.Kind =
           Humanize.Parsing.Recurrence_Weekday_Set
         and then Weekday_Except_Friday.Has_Excluded_Weekdays
         and then Weekday_Except_Friday.Excluded_Weekdays (5)
         and then not Weekday_Except_Friday.Weekdays (5),
         "parse recurrence weekday exclusion metadata");
      AUnit.Assertions.Assert
        (Throughput.Status = Humanize.Status.Ok
         and then Throughput.Count = 120
         and then Throughput.Total = 4,
         "parse throughput phrase");
      AUnit.Assertions.Assert
        (Progress_Bar.Status = Humanize.Status.Ok
         and then Progress_Bar.Value = 30,
         "parse progress bar");
      AUnit.Assertions.Assert
        (Scanned_ETA.Status = Humanize.Status.Ok
         and then Scanned_ETA.Value = 300
         and then Scanned_ETA.Consumed = 13,
         "scan ETA phrase");
      AUnit.Assertions.Assert
        (Scanned_Retry.Status = Humanize.Status.Ok
         and then Scanned_Retry.Value = 10
         and then Scanned_Retry.Consumed = 22,
         "scan retry phrase");
      AUnit.Assertions.Assert
        (Scanned_Step.Status = Humanize.Status.Ok
         and then Scanned_Step.Count = 2
         and then Scanned_Step.Total = 5
         and then Scanned_Step.Consumed = 11,
         "scan step phrase");
      AUnit.Assertions.Assert
        (Scanned_Attempt.Status = Humanize.Status.Ok
         and then Scanned_Attempt.Count = 2
         and then Scanned_Attempt.Total = 3
         and then Scanned_Attempt.Consumed = 14,
         "scan attempt phrase");
      AUnit.Assertions.Assert
        (Scanned_Business.Status = Humanize.Status.Ok
         and then Scanned_Business.Value = 3
         and then Scanned_Business.Consumed = 15,
         "scan business-days phrase");
      AUnit.Assertions.Assert
        (Scanned_Working.Status = Humanize.Status.Ok
         and then Scanned_Working.Value = 1
         and then Scanned_Working.Consumed = 14,
         "scan working-hours phrase");
      AUnit.Assertions.Assert
        (Scanned_Recurrence.Status = Humanize.Status.Ok
         and then Scanned_Recurrence.Value = 2
         and then Scanned_Recurrence.Consumed = 12,
         "scan recurrence phrase");
      AUnit.Assertions.Assert
        (Scanned_Recurrence_Detail.Status = Humanize.Status.Ok
         and then Scanned_Recurrence_Detail.Kind =
           Humanize.Parsing.Recurrence_Weekday
         and then Scanned_Recurrence_Detail.Consumed = 19,
         "scan detailed recurrence phrase");
      AUnit.Assertions.Assert
        (Scanned_Throughput.Status = Humanize.Status.Ok
         and then Scanned_Throughput.Count = 120
         and then Scanned_Throughput.Total = 4,
         "scan throughput phrase");
      AUnit.Assertions.Assert
        (Scanned_Bar.Status = Humanize.Status.Ok
         and then Scanned_Bar.Value = 30,
         "scan progress bar");
      AUnit.Assertions.Assert
        (Humanize.Parsing.Diagnostic
           (Humanize.Status.Invalid_Argument, 1)
         = Humanize.Parsing.Expected_Number,
         "parser diagnostic category");
      AUnit.Assertions.Assert
        (Diag_Message.Status = Humanize.Status.Ok
         and then Humanize.Tests.Support.Text (Diag_Message)
           = "expected a number at position 4",
         "parser diagnostic message");
      AUnit.Assertions.Assert
        (Number_Range.Status = Humanize.Status.Ok
         and then Number_Range.Low = 3
         and then Number_Range.High = 7,
         "parse number range");
      AUnit.Assertions.Assert
        (Scanned_Range.Status = Humanize.Status.Ok
         and then Scanned_Range.Low = 10
         and then Scanned_Range.High = 20
         and then Scanned_Range.Consumed = 11,
         "scan number range prefix");
      AUnit.Assertions.Assert
        (Decimal_Range.Status = Humanize.Status.Ok
         and then abs (Decimal_Range.Low - 1.25) < 0.0001
         and then abs (Decimal_Range.High - 3.5) < 0.0001,
         "parse decimal range");
      AUnit.Assertions.Assert
        (Decimal_Range_Words.Status = Humanize.Status.Ok
         and then abs (Decimal_Range_Words.Low - 1.25) < 0.0001
         and then abs (Decimal_Range_Words.High - 3.5) < 0.0001,
         "parse worded decimal range");
      AUnit.Assertions.Assert
        (Editorial_Number.Status = Humanize.Status.Ok
         and then Editorial_Number.Value = 1_200
         and then Editorial_Number.Consumed = 6,
         "parse editorial grouped number");
      AUnit.Assertions.Assert
        (Currency_Words.Status = Humanize.Status.Ok
         and then abs (Currency_Words.Amount - 12.5) < 0.0001
         and then Currency_Words.Code
           (1 .. Currency_Words.Code_Length) = "dollar",
         "parse worded currency");
      AUnit.Assertions.Assert
        (Fraction_Words.Status = Humanize.Status.Ok
         and then Fraction_Words.Count = 3
         and then Fraction_Words.Total = 4,
         "parse worded fraction");
      AUnit.Assertions.Assert
        (Percent_Words.Status = Humanize.Status.Ok
         and then abs (Percent_Words.Value - 12.5) < 0.0001,
         "parse worded percent");
      AUnit.Assertions.Assert
        (Scanned_Decimal_Range.Status = Humanize.Status.Ok
         and then abs (Scanned_Decimal_Range.Low - 1.25) < 0.0001
         and then abs (Scanned_Decimal_Range.High - 3.5) < 0.0001,
         "scan decimal range prefix");
      AUnit.Assertions.Assert
        (Operational_Phrase.Status = Humanize.Status.Ok
         and then Operational_Phrase.Domain =
           Humanize.Parsing.Backup_Phrase_Domain
         and then Operational_Phrase.Backup_Status =
           Humanize.Phrases.Backup_Stale,
         "parse operational phrase");
      AUnit.Assertions.Assert
        (Backup_Phrase_Case_Running.Status = Humanize.Status.Ok
         and then Backup_Phrase_Case_Running.Domain =
           Humanize.Parsing.Backup_Phrase_Domain
         and then Backup_Phrase_Case_Running.Backup_Status =
           Humanize.Phrases.Backup_Running
         and then Backup_Phrase_Case_Completed.Status = Humanize.Status.Ok
         and then Backup_Phrase_Case_Completed.Domain =
           Humanize.Parsing.Backup_Phrase_Domain
         and then Backup_Phrase_Case_Completed.Backup_Status =
           Humanize.Phrases.Backup_Completed
         and then Backup_Phrase_Case_Failed.Status = Humanize.Status.Ok
         and then Backup_Phrase_Case_Failed.Domain =
           Humanize.Parsing.Backup_Phrase_Domain
         and then Backup_Phrase_Case_Failed.Backup_Status =
           Humanize.Phrases.Backup_Failed,
         "parse all backup operational phrases");
      AUnit.Assertions.Assert
        (Incident_Phrase_Created.Status = Humanize.Status.Ok
         and then Incident_Phrase_Created.Domain =
           Humanize.Parsing.Incident_Phrase_Domain
         and then Incident_Phrase_Created.Incident_Status =
           Humanize.Phrases.Incident_Investigating
         and then Payment_Authorized_Phrase.Status = Humanize.Status.Ok
         and then Payment_Authorized_Phrase.Domain =
           Humanize.Parsing.Payment_Lifecycle_Phrase_Domain
         and then Payment_Authorized_Phrase.Payment_Lifecycle_Status =
           Humanize.Phrases.Payment_Authorized
         and then Payment_Captured_Phrase.Status = Humanize.Status.Ok
         and then Payment_Captured_Phrase.Domain =
           Humanize.Parsing.Payment_Lifecycle_Phrase_Domain
         and then Payment_Captured_Phrase.Payment_Lifecycle_Status =
           Humanize.Phrases.Payment_Captured
         and then Payment_Refunded_Phrase.Status = Humanize.Status.Ok
         and then Payment_Refunded_Phrase.Domain =
           Humanize.Parsing.Payment_Lifecycle_Phrase_Domain
         and then Payment_Refunded_Phrase.Payment_Lifecycle_Status =
           Humanize.Phrases.Payment_Refunded
         and then Payment_Disputed_Phrase.Status = Humanize.Status.Ok
         and then Payment_Disputed_Phrase.Domain =
           Humanize.Parsing.Payment_Lifecycle_Phrase_Domain
         and then Payment_Disputed_Phrase.Payment_Lifecycle_Status =
           Humanize.Phrases.Payment_Disputed
         and then Payment_Requires_Action_Phrase.Status = Humanize.Status.Ok
         and then Payment_Requires_Action_Phrase.Domain =
           Humanize.Parsing.Payment_Lifecycle_Phrase_Domain
         and then Payment_Requires_Action_Phrase.Payment_Lifecycle_Status =
           Humanize.Phrases.Payment_Requires_Action
         and then Payment_Expired_Phrase.Status = Humanize.Status.Ok
         and then Payment_Expired_Phrase.Domain =
           Humanize.Parsing.Payment_Lifecycle_Phrase_Domain
         and then Payment_Expired_Phrase.Payment_Lifecycle_Status =
           Humanize.Phrases.Payment_Expired,
         "parse payment lifecycle phrases");
      AUnit.Assertions.Assert
        (Audit_Created_Phrase.Status = Humanize.Status.Ok
         and then Audit_Created_Phrase.Domain =
           Humanize.Parsing.Audit_Phrase_Domain
         and then Audit_Created_Phrase.Audit_Status =
           Humanize.Phrases.Audit_Created
         and then Audit_Updated_Phrase.Status = Humanize.Status.Ok
         and then Audit_Updated_Phrase.Domain =
           Humanize.Parsing.Audit_Phrase_Domain
         and then Audit_Updated_Phrase.Audit_Status =
           Humanize.Phrases.Audit_Updated
         and then Audit_Deleted_Phrase.Status = Humanize.Status.Ok
         and then Audit_Deleted_Phrase.Domain =
           Humanize.Parsing.Audit_Phrase_Domain
         and then Audit_Deleted_Phrase.Audit_Status =
           Humanize.Phrases.Audit_Deleted
         and then Audit_Restored_Phrase.Status = Humanize.Status.Ok
         and then Audit_Restored_Phrase.Domain =
           Humanize.Parsing.Audit_Phrase_Domain
         and then Audit_Restored_Phrase.Audit_Status =
           Humanize.Phrases.Audit_Restored,
         "parse audit phrases");
      AUnit.Assertions.Assert
        (Feature_Flag_Enabled_Phrase.Status = Humanize.Status.Ok
         and then Feature_Flag_Enabled_Phrase.Domain =
           Humanize.Parsing.Feature_Flag_Phrase_Domain
         and then Feature_Flag_Enabled_Phrase.Feature_Flag_Status =
           Humanize.Phrases.Flag_Enabled
         and then Feature_Flag_Disabled_Phrase.Status = Humanize.Status.Ok
         and then Feature_Flag_Disabled_Phrase.Domain =
           Humanize.Parsing.Feature_Flag_Phrase_Domain
         and then Feature_Flag_Disabled_Phrase.Feature_Flag_Status =
           Humanize.Phrases.Flag_Disabled
         and then Feature_Flag_Rolling_Out_Phrase.Status = Humanize.Status.Ok
         and then Feature_Flag_Rolling_Out_Phrase.Domain =
           Humanize.Parsing.Feature_Flag_Phrase_Domain
         and then Feature_Flag_Rolling_Out_Phrase.Feature_Flag_Status =
           Humanize.Phrases.Flag_Rolling_Out
         and then Feature_Flag_Rolled_Back_Phrase.Status = Humanize.Status.Ok
         and then Feature_Flag_Rolled_Back_Phrase.Domain =
           Humanize.Parsing.Feature_Flag_Phrase_Domain
         and then Feature_Flag_Rolled_Back_Phrase.Feature_Flag_Status =
           Humanize.Phrases.Flag_Rolled_Back,
         "parse feature flag phrases");
      AUnit.Assertions.Assert
        (Webhook_Pending_Phrase.Status = Humanize.Status.Ok
         and then Webhook_Pending_Phrase.Domain =
           Humanize.Parsing.Webhook_Phrase_Domain
         and then Webhook_Pending_Phrase.Webhook_Status =
           Humanize.Phrases.Webhook_Pending
         and then Webhook_Delivered_Phrase.Status = Humanize.Status.Ok
         and then Webhook_Delivered_Phrase.Domain =
           Humanize.Parsing.Webhook_Phrase_Domain
         and then Webhook_Delivered_Phrase.Webhook_Status =
           Humanize.Phrases.Webhook_Delivered
         and then Webhook_Failed_Phrase.Status = Humanize.Status.Ok
         and then Webhook_Failed_Phrase.Domain =
           Humanize.Parsing.Webhook_Phrase_Domain
         and then Webhook_Failed_Phrase.Webhook_Status =
           Humanize.Phrases.Webhook_Failed
         and then Webhook_Retrying_Phrase.Status = Humanize.Status.Ok
         and then Webhook_Retrying_Phrase.Domain =
           Humanize.Parsing.Webhook_Phrase_Domain
         and then Webhook_Retrying_Phrase.Webhook_Status =
           Humanize.Phrases.Webhook_Retrying,
         "parse webhook phrases");
      AUnit.Assertions.Assert
        (API_Key_Active_Phrase.Status = Humanize.Status.Ok
         and then API_Key_Active_Phrase.Domain =
           Humanize.Parsing.API_Key_Phrase_Domain
         and then API_Key_Active_Phrase.API_Key_Status =
           Humanize.Phrases.API_Key_Active
         and then API_Key_Revoked_Phrase.Status = Humanize.Status.Ok
         and then API_Key_Revoked_Phrase.Domain =
           Humanize.Parsing.API_Key_Phrase_Domain
         and then API_Key_Revoked_Phrase.API_Key_Status =
           Humanize.Phrases.API_Key_Revoked
         and then API_Key_Expired_Phrase.Status = Humanize.Status.Ok
         and then API_Key_Expired_Phrase.Domain =
           Humanize.Parsing.API_Key_Phrase_Domain
         and then API_Key_Expired_Phrase.API_Key_Status =
           Humanize.Phrases.API_Key_Expired
         and then API_Key_Rotated_Phrase.Status = Humanize.Status.Ok
         and then API_Key_Rotated_Phrase.Domain =
           Humanize.Parsing.API_Key_Phrase_Domain
         and then API_Key_Rotated_Phrase.API_Key_Status =
           Humanize.Phrases.API_Key_Rotated,
         "parse API-key phrases");
      AUnit.Assertions.Assert
        (Quota_Available_Phrase.Status = Humanize.Status.Ok
         and then Quota_Available_Phrase.Domain =
           Humanize.Parsing.Quota_Phrase_Domain
         and then Quota_Available_Phrase.Quota_Status =
           Humanize.Phrases.Quota_Available
         and then Quota_Near_Limit_Phrase.Status = Humanize.Status.Ok
         and then Quota_Near_Limit_Phrase.Domain =
           Humanize.Parsing.Quota_Phrase_Domain
         and then Quota_Near_Limit_Phrase.Quota_Status =
           Humanize.Phrases.Quota_Near_Limit
         and then Quota_Exceeded_Phrase.Status = Humanize.Status.Ok
         and then Quota_Exceeded_Phrase.Domain =
           Humanize.Parsing.Quota_Phrase_Domain
         and then Quota_Exceeded_Phrase.Quota_Status =
           Humanize.Phrases.Quota_Exceeded
         and then Quota_Reset_Phrase.Status = Humanize.Status.Ok
         and then Quota_Reset_Phrase.Domain =
           Humanize.Parsing.Quota_Phrase_Domain
         and then Quota_Reset_Phrase.Quota_Status =
           Humanize.Phrases.Quota_Reset,
         "parse quota phrases");
      AUnit.Assertions.Assert
        (Invoice_Draft_Phrase.Status = Humanize.Status.Ok
         and then Invoice_Draft_Phrase.Domain =
           Humanize.Parsing.Invoice_Phrase_Domain
         and then Invoice_Draft_Phrase.Invoice_Status =
           Humanize.Phrases.Invoice_Draft
         and then Invoice_Sent_Phrase.Status = Humanize.Status.Ok
         and then Invoice_Sent_Phrase.Domain =
           Humanize.Parsing.Invoice_Phrase_Domain
         and then Invoice_Sent_Phrase.Invoice_Status =
           Humanize.Phrases.Invoice_Sent
         and then Invoice_Paid_Phrase.Status = Humanize.Status.Ok
         and then Invoice_Paid_Phrase.Domain =
           Humanize.Parsing.Invoice_Phrase_Domain
         and then Invoice_Paid_Phrase.Invoice_Status =
           Humanize.Phrases.Invoice_Paid
         and then Invoice_Refunded_Phrase.Status = Humanize.Status.Ok
         and then Invoice_Refunded_Phrase.Domain =
           Humanize.Parsing.Invoice_Phrase_Domain
         and then Invoice_Refunded_Phrase.Invoice_Status =
           Humanize.Phrases.Invoice_Refunded
         and then Invoice_Overdue_Phrase.Status = Humanize.Status.Ok
         and then Invoice_Overdue_Phrase.Domain =
           Humanize.Parsing.Invoice_Phrase_Domain
         and then Invoice_Overdue_Phrase.Invoice_Status =
           Humanize.Phrases.Invoice_Overdue
         and then Invoice_Refund_Failed_Phrase.Status = Humanize.Status.Ok
         and then Invoice_Refund_Failed_Phrase.Domain =
           Humanize.Parsing.Invoice_Phrase_Domain
         and then Invoice_Refund_Failed_Phrase.Invoice_Status =
           Humanize.Phrases.Refund_Failed,
         "parse invoice phrases");
   end Check_Schedule_Operational_And_Invoice_Parsers;
