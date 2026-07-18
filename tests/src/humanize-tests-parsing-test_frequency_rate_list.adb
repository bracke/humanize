separate (Humanize.Tests.Parsing)
   procedure Test_Frequency_Rate_List
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Frequency : constant Humanize.Parsing.Frequency_Parse_Result :=
        Humanize.Parsing.Parse_Frequency ("4 times");
      Rate : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Parse_Rate ("approximately 4 times per week");
      Rate_Alias : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Parse_Rate ("approximately 4 times per weeks");
      Less : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Parse_Rate ("less than once per day");
      List : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Parse_List ("Ada, SPARK and Alire");
      Bad_Rate : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Parse_Rate ("per day");
      Single : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Parse_List ("Ada");
      German_List : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Parse_List ("Ada, SPARK und Alire");
      Japanese_List : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Parse_List
          ("Ada " & B ("E381A8") & " SPARK");
      Localized_Frequency : constant Humanize.Parsing.Frequency_Parse_Result :=
        Humanize.Parsing.Parse_Frequency
          ("2 " & B ("D180D0B0D0B7D0B0"));
      Localized_Rate : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Parse_Rate
          (B ("756E676566C3A472") & " 2 gange per uge");
      Percent : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Percent ("12.5%");
      Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Ordinal ("21st");
      Word_Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Cardinal ("twenty one");
      Word_Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Ordinal ("twenty first");
      German_Word_Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Cardinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Locale_Cardinal
                (Humanize.Tests.Support.De, 42)));
      Finnish_Word_Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Cardinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Locale_Cardinal
                (Humanize.Tests.Support.Locale ("fi"), 2_345)));
      French_Large_Word_Cardinal :
        constant Humanize.Parsing.Number_Parse_Result :=
          Humanize.Parsing.Parse_Cardinal
            (Humanize.Tests.Support.Text
               (Humanize.Numbers.Locale_Cardinal
                  (Humanize.Tests.Support.Fr, 2_000_000_001)));
      Japanese_Word_Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Cardinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Locale_Cardinal
                (Humanize.Tests.Support.Locale ("ja"), 2_345)));
      Korean_Word_Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Cardinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Locale_Cardinal
                (Humanize.Tests.Support.Locale ("ko"), 2_345)));
      Chinese_Word_Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Cardinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Locale_Cardinal
                (Humanize.Tests.Support.Locale ("zh"), 2_345)));
      Polish_Word_Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Ordinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Ordinal_Words
                (Humanize.Tests.Support.Locale ("pl"), 121)));
      Polish_Thousands_Word_Ordinal :
        constant Humanize.Parsing.Number_Parse_Result :=
          Humanize.Parsing.Parse_Ordinal
            (Humanize.Tests.Support.Text
               (Humanize.Numbers.Ordinal_Words
                  (Humanize.Tests.Support.Locale ("pl"), 2_345)));
      Japanese_Word_Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Ordinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Ordinal_Words
                (Humanize.Tests.Support.Locale ("ja"), 12)));
      Korean_Word_Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Ordinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Ordinal_Words
                (Humanize.Tests.Support.Locale ("ko"), 12)));
      Chinese_Word_Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Ordinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Ordinal_Words
                (Humanize.Tests.Support.Locale ("zh"), 12)));
      Japanese_Thousands_Word_Ordinal :
        constant Humanize.Parsing.Number_Parse_Result :=
          Humanize.Parsing.Parse_Ordinal
            (Humanize.Tests.Support.Text
               (Humanize.Numbers.Ordinal_Words
                  (Humanize.Tests.Support.Locale ("ja"), 2_345)));
      Scientific : constant Humanize.Parsing.Float_Parse_Result :=
        Humanize.Parsing.Parse_Scientific_Number ("1.23e6");
      Duration_Range : constant Humanize.Parsing.Duration_Range_Parse_Result :=
        Humanize.Parsing.Parse_Duration_Range ("1 hour-2 hours");
      Countdown : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Countdown ("1 minute remaining");
      SLA : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_SLA_Window ("within 1 day");
      Age : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Age ("3 days old");
      Modified : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Modified_Ago ("modified 2 hours ago");
      Parsed_Progress : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Progress ("3 of 10 complete");
      Results : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Parse_Result_Count ("24 results");
      Counted : constant Humanize.Parsing.Counted_Noun_Parse_Result :=
        Humanize.Parsing.Parse_Counted_Noun ("no files");
      Article_Count : constant Humanize.Parsing.Counted_Noun_Parse_Result :=
        Humanize.Parsing.Parse_Counted_Noun ("an item");
      Compact_Count : constant Humanize.Parsing.Counted_Noun_Parse_Result :=
        Humanize.Parsing.Parse_Counted_Noun ("1.2K files");
      Word_Count : constant Humanize.Parsing.Counted_Noun_Parse_Result :=
        Humanize.Parsing.Parse_Counted_Noun ("twenty one entries");
      Scanned_Count : constant Humanize.Parsing.Counted_Noun_Parse_Result :=
        Humanize.Parsing.Scan_Counted_Noun ("3 boxes; cached");
      Showing : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Showing_Count ("showing 20 of 153 results");
      Page : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Page_Count ("page 2 of 8");
      ETA : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_ETA ("ETA 5 minutes");
      Retry : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Retry_In ("retrying in 10 seconds");
      Step : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Step_Count ("step 2 of 5");
      Attempt : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Attempt_Count ("attempt 2 of 3");
      Business : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Business_Days ("3 business days");
      Working : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Working_Hours ("1 working hour");
      Recurrence : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence ("every 2 days");
      Other_Tuesday : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0), "every other Tuesday");
      Weekday_Schedule : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "every weekday at 09:00");
      First_Monday : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "first Monday of each month at 9:30");
      Last_Business : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0), "last business day");
      Every_Last_Weekday : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0), "every last weekday");
      Second_Business : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "second business day of each month at 10:15");
      Cron_Weekday : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Cron_Schedule ("0 9 * * 1-5");
      Cron_Monthly : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Cron_Schedule ("30 8 15 * *");
      Scanned_Cron : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Scan_Cron_Schedule ("0 9 * * 1-5; cached");
      Cron_Step_Minute : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Cron_Schedule ("*/15 * * * *");
      Cron_Step_Hour : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Cron_Schedule ("0 */2 * * *");
      Cron_Named_List : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Cron_Schedule ("30 9 ? * mon,wed,fri");
      Cron_Yearly : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Cron_Schedule ("30 8 15 jan *");
      Italian_Ordinal_Schedule :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Recurrence_Detail
            (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
             "primo luned" & B ("C3AC") & " di ogni mese alle 09:30");
      Finnish_Rendered_Cron :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule
            ("p" & B ("C3A4") & "iv" & B ("C3A4")
             & " 15 joka kuukausi klo 08:30");
      Polish_Rendered_Cron :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule
            ("15. dzie" & B ("C584") & " ka" & B ("C5BC")
             & "dego miesi" & B ("C485") & "ca o 08:30");
      Cron_Quartz_Weekday :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("0 0 9 ? * MON-FRI");
      Cron_Quartz_Year :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("30 15 8 15 JAN ? 2027");
      Cron_Last_Day :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("0 0 9 L * ?");
      Cron_Nearest_Weekday :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("0 0 9 15W * ?");
      Cron_Last_Friday :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("0 0 9 ? * 5L");
      Cron_Second_Monday :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("0 0 9 ? * MON#2");
      Danish_Rendered_Weekday :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("hver hverdag kl. 09:00");
      Until_Weeks : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "every 2 weeks until 2026-12-31");
      Windowed : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "every 2 weeks from 2026-01-01 until 2026-12-31 for 5 times");
      Windowed_Time : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "every 15 minutes between 09:00 and 17:00");
      Weekday_Except_Friday :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Recurrence_Detail
            (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
             "every weekday except Friday");
      Throughput : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Throughput_Remaining
          ("120 items remaining at 4 item/s");
      Progress_Bar : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Progress_Bar ("[###-------] 30%");
      Scanned_ETA : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Scan_ETA ("ETA 5 minutes; cached");
      Scanned_Retry : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Scan_Retry_In ("retrying in 10 seconds; cached");
      Scanned_Step : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Scan_Step_Count ("step 2 of 5; cached");
      Scanned_Attempt : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Scan_Attempt_Count ("attempt 2 of 3; cached");
      Scanned_Business : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Business_Days ("3 business days; cached");
      Scanned_Working : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Working_Hours ("1 working hour; cached");
      Scanned_Recurrence : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Recurrence ("every 2 days; cached");
      Scanned_Recurrence_Detail :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Scan_Recurrence_Detail
            (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
             "every other Tuesday; cached");
      Scanned_Throughput : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Scan_Throughput_Remaining
          ("120 items remaining at 4 item/s; cached");
      Scanned_Bar : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Progress_Bar ("[###-------] 30%; cached");
      Number_Range : constant Humanize.Parsing.Number_Range_Parse_Result :=
        Humanize.Parsing.Parse_Number_Range ("between 3 and 7");
      Scanned_Range : constant Humanize.Parsing.Number_Range_Parse_Result :=
        Humanize.Parsing.Scan_Number_Range ("about 10-20 selected");
      Decimal_Range : constant Humanize.Parsing.Decimal_Range_Parse_Result :=
        Humanize.Parsing.Parse_Decimal_Range ("1.25 to 3.5");
      Decimal_Range_Words :
        constant Humanize.Parsing.Decimal_Range_Parse_Result :=
          Humanize.Parsing.Parse_Decimal_Range_Words
            ("one point two five to three point five zero");
      Editorial_Number : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Editorial_Number ("1,200%");
      Currency_Words : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency_Words
          ("twelve dollars and fifty cents");
      Fraction_Words : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Fraction_Words ("three quarters");
      Percent_Words : constant Humanize.Parsing.Float_Parse_Result :=
        Humanize.Parsing.Parse_Percent_Words ("twelve point five percent");
      Scanned_Decimal_Range :
        constant Humanize.Parsing.Decimal_Range_Parse_Result :=
          Humanize.Parsing.Scan_Decimal_Range ("1.25 to 3.5 measured");
      Operational_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("backup stale");
      Backup_Phrase_Case_Running :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("backup running");
      Backup_Phrase_Case_Completed :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("backup completed");
      Backup_Phrase_Case_Failed :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("backup failed");
      Payment_Authorized_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("payment authorized");
      Payment_Captured_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("payment captured");
      Payment_Refunded_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("payment refunded");
      Payment_Disputed_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("payment disputed");
      Payment_Requires_Action_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("payment requires action");
      Payment_Expired_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("payment expired");
      Incident_Phrase_Created :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("investigating incident");
      Audit_Created_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("audit entry created");
      Audit_Updated_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("audit entry updated");
      Audit_Deleted_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("audit entry deleted");
      Audit_Restored_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("audit entry restored");
      Feature_Flag_Enabled_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("feature flag enabled");
      Feature_Flag_Disabled_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("feature flag disabled");
      Feature_Flag_Rolling_Out_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("feature flag rolling out");
      Feature_Flag_Rolled_Back_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("feature flag rolled back");
      Webhook_Pending_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("webhook pending");
      Webhook_Delivered_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("webhook delivered");
      Webhook_Failed_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("webhook failed");
      Webhook_Retrying_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("webhook retrying");
      API_Key_Active_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("api key active");
      API_Key_Revoked_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("api key revoked");
      API_Key_Expired_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("api key expired");
      API_Key_Rotated_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("api key rotated");
      Quota_Available_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("quota available");
      Quota_Near_Limit_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("quota near limit");
      Quota_Exceeded_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("quota exceeded");
      Quota_Reset_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("quota reset");
      Invoice_Draft_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("invoice draft");
      Invoice_Sent_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("invoice sent");
      Invoice_Paid_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("invoice paid");
      Invoice_Refunded_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("invoice refunded");
      Invoice_Overdue_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("invoice overdue");
      Invoice_Refund_Failed_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("refund failed");
      Database_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("database replication lagging");
      Database_Backup_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("database backup failed");
      Database_Online_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("database online");
      Database_Offline_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("database offline");
      Database_Degraded_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("database degraded");
      Database_Migrating_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("database migrating");
      Database_Migration_Failed_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("database migration failed");
      Database_Replicating_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("database replicating");
      Database_Backup_Running_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("database backup running");
      Database_Backup_Failed_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("database backup failed");
      Field_Change :
        constant Humanize.Parsing.Field_Change_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Field_Change_Summary
            ("4 fields: 2 changed, 1 added, 1 removed");
      Field_Added :
        constant Humanize.Parsing.Field_State_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Field_State_Summary
            ("title added as final");
      Field_Removed :
        constant Humanize.Parsing.Field_State_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Field_State_Summary
            ("title removed (was draft)");
      Field_Unchanged :
        constant Humanize.Parsing.Field_State_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Field_State_Summary
            ("status unchanged at open");
      Uncertainty : constant Humanize.Parsing.Uncertainty_Parse_Result :=
        Humanize.Parsing.Parse_Uncertainty_Label ("12.3 +/- 0.4");
      Uncertainty_Words :
        constant Humanize.Parsing.Uncertainty_Parse_Result :=
          Humanize.Parsing.Parse_Uncertainty_Words
            ("twelve point three plus or minus zero point four");
      Parenthesized_Uncertainty :
        constant Humanize.Parsing.Uncertainty_Parse_Result :=
          Humanize.Parsing.Parse_Uncertainty_Label ("12.3 (+/- 0.4)");
      Interval_Uncertainty :
        constant Humanize.Parsing.Uncertainty_Parse_Result :=
          Humanize.Parsing.Parse_Uncertainty_Label ("11.9 to 12.7");
      Scanned_Uncertainty :
        constant Humanize.Parsing.Uncertainty_Parse_Result :=
          Humanize.Parsing.Scan_Uncertainty_Label ("12.3 +/- 0.4 measured");
      Proportion : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Proportion ("3 out of 10");
      Scanned_Proportion : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Scan_Proportion ("1 in 4; sampled");
      Unit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit ("5 km");
      Localized_Unit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit
          ("5 " & B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180D18B"));
      Ratio : constant Humanize.Parsing.Aspect_Ratio_Parse_Result :=
        Humanize.Parsing.Parse_Aspect_Ratio ("16:9");
      CSS : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_CSS_Length ("1.5 rem");
      Compound : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Compound_Unit ("2.5 ms");
      Database_Throughput : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Database_Throughput ("12.5 k ops/s");
      Scanned_Database_Throughput :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Scan_Database_Throughput
            ("12.5 k ops/s; cached");
      Data_Rate : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Data_Rate ("1.5 MB/s");
      Scanned_Bit_Rate : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Scan_Bit_Rate ("1.5 Mbit/s; cached");
      Binary_Data_Rate :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Binary_Data_Rate ("1.5 GiB/s");
      Memory_Bandwidth :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Memory_Bandwidth ("12.5 GB/s");
      Scanned_Latency :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Scan_Latency ("2.5 ms; cached");
      IOPS : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_IOPS ("42 k IOPS");
      Scanned_IOPS : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Scan_IOPS ("42 k IOPS; cached");
      Density : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Density ("12.5 kg/m3");
      Acceleration : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Acceleration ("9.8 m/s2");
      Torque : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Torque ("12 N m");
      Fuel_Economy : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Fuel_Economy ("5.5 L/100 km");
      Flow_Rate : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Scan_Flow_Rate ("500 mL/s; cached");
      Electric_Current :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Electric_Current ("500 mA");
      Voltage : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Voltage ("1.2 kV");
      Pixel_Density : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Pixel_Density ("326 ppi");
      Electric_Resistance :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Electric_Resistance ("4.7 Mohm");
      Electric_Capacitance :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Electric_Capacitance ("4.7 nF");
      Electric_Inductance :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Electric_Inductance ("4.7 H");
      Concentration : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Concentration ("2.5 mol/L");
      Fuel_Efficiency_MPG :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Fuel_Efficiency_MPG ("30 mpg");
      CPU_Load : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_CPU_Load ("82.5 % CPU");
      Battery : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Battery ("37 % battery");
      Screen_Size : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Screen_Size ("13 in screen");
      Typography_Size : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Typography_Size ("12 pt");
      Audio_Level : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Audio_Level ("-6 dB");
      Signal_Strength : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Signal_Strength ("-67 dBm");
      Storage_Endurance :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Storage_Endurance ("600 TBW");
      Refresh_Rate : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Refresh_Rate ("144 Hz refresh");
      Luminance : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Luminance ("1000 nits");
      Print_Resolution : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Print_Resolution ("300 dpi");
      Acre : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit ("2 acres");
      Pounds : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit ("2 lbs");
      Fahrenheit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit ("350 degrees Fahrenheit");
      Bad_Unit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit ("2 widgets");
      Scanned_Unit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Scan_Unit ("5 km (planned)");
      Scanned_Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Scan_Bytes ("1.5 KiB; cached");
      Scanned_Precise : constant Humanize.Parsing.Precise_Duration_Parse_Result :=
        Humanize.Parsing.Scan_Precise_Duration ("1 second, 5 ms (work)");
      Scanned_Compact : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Compact_Number ("1.2K; cached");
      Scanned_Bounded : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Bounded_Number ("100+ selected");
      Scanned_Frequency : constant Humanize.Parsing.Frequency_Parse_Result :=
        Humanize.Parsing.Scan_Frequency ("4 times; cached");
      Scanned_Rate : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Scan_Rate ("less than once per day (low)");
      Scanned_List : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Scan_List ("Ada, SPARK and Alire; done");
      Scanned_Percent : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Percent ("12.5% selected");
      Scanned_Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Ordinal ("21st place");
      Roman : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Roman ("MMXXVI");
      Lower_Roman : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Roman ("cmxliv");
      Bad_Roman : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Roman ("IIII");
      Scanned_Roman : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Roman ("MMXXVI edition");
      Normal_Unit : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Normalize_Unit_Text ("  Kilometers-per-Hour ");
      Normal_List : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Normalize_List_Text ("Ada, SPARK und Alire");
      Ref_Date : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2024, 1, 1, 0.0);
      Tomorrow : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "tomorrow");
      Russian_Today : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, B ("D181D0B5D0B3D0BED0B4D0BDD18F"));
      Danish_In_Weeks : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "om 2 uger");
      Russian_Ago : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "2 " & B ("D0B4D0BDD18F20D0BDD0B0D0B7D0B0D0B4"));
      Next_Fri : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "next friday");
      Friday_After_Next : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "friday after next");
      Next_Fri_Afternoon : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next friday afternoon");
      Next_Fri_At_1730 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next friday at 17:30");
      Next_Fri_At_1730_TZ : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next friday at 17:30+02:00");
      Next_Fri_At_1730_CEST : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next friday at 17:30 CEST");
      Tomorrow_At_5pm_TZ_Name : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow at 5pm CET");
      Tomorrow_At_5_PM_TZ_Name : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow at 5 pm CET");
      Tomorrow_At_5pm_UTC_Plus2 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow at 5pm UTC+2");
      Tomorrow_At_5pm_UTC_Plus2_NoSpace :
        constant Humanize.Parsing.Date_Parse_Result :=
          Humanize.Parsing.Parse_Natural_Date
            (Ref_Date, "tomorrow at 5pmUTC+2");
      Tomorrow_At_5pm_GMT_Minus2 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow at 5pm GMT-2:00");
      Tonight_At_5pm_TZ : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tonight at 5pm-0700");
      Tomorrow_At_5pm_TZ : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow at 5 pm+00");
      Tomorrow_At_5pm_TZ_NoSpace : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow at 5pm+00");
      Tonight : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "tonight");
      Tomorrow_At_5 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "tomorrow at 5pm");
      Tomorrow_Around_Noon : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow around noon");
      End_Next_Business_Month :
        constant Humanize.Parsing.Date_Parse_Result :=
          Humanize.Parsing.Parse_Natural_Date
            (Ref_Date, "end of next business month");
      Next_Month_Third : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next month on the 3rd");
      Later_Today : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ada.Calendar.Time_Of (2024, 1, 1, 12.0 * 3_600.0),
           "later today");
      Scanned_Tonight : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "tonight; cached");
      Scanned_Fri_Afternoon : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "next friday afternoon; cached");
      Scanned_Tonight_TZ : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "tonight at 5pm+0200; cached");
      Scanned_Tonight_TZ_Name : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "tomorrow at 5pm CET; cached");
      Scanned_Tonight_TZ_Name_With_Space : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "tomorrow at 5 pm CET; cached");
      Scanned_Tomorrow_At_5pm_UTC_Plus2 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "tomorrow at 5pm UTC+2; cached");
      Scanned_Tomorrow_At_5pm_GMT_Minus2 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "tomorrow at 5pmGMT-2:00; cached");
      Scanned_Date : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date (Ref_Date, "in 3 days; cached");
      ISO_Date : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "2024-02-29");
      ISO_Ordinal_Date : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "2024-060");
      ISO_Week_Date : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "2024-W09-4");
      ISO_Week_Start : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "2024-W01");
      Scanned_ISO_Week : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date (Ref_Date, "2024-W09-4; cached");
      Month_Name : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "February 2 2024");
      Month_Day_Ordinal : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "Jan 1st");
      Weekday_Ordinal : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "Wednesday the 3rd");
      Scanned_Month_Day_Ordinal : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date (Ref_Date, "Jan 1st; cached");
      In_Weeks : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "in 2 weeks");
      In_Few_Days : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "in a few days");
      In_A_Couple_Of_Weeks : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "in a couple of weeks");
      In_A_Fortnight : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "in a fortnight");
      Fortnight_Ago : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "a fortnight ago");
      Month_Ago : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "1 month ago");
      This_Fri : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "this friday");
      Last_Fri : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "last friday");
      Two_Fridays : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "two fridays from now");
      Friday_Before_Next : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "Friday before next");
      End_Next_Month : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "end of next month");
      Start_Q3 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "start of q3");
      End_Next_Quarter : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "end of next quarter");
      Second_Tuesday_March : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "second tuesday in march");
      Last_Friday_March_2024 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "last friday of march 2024");
      Next_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "next business day");
      Next_Business_Friday : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next business friday");
      Three_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "3 business days from now");
      Several_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "several business days from now");
      Before_Month_End : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "two business days before month end");
      Before_Next_Quarter_End : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "2 business days before end of next quarter");
      Week_32_Start : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "week 32");
      This_Week : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "this week");
      Next_Two_Weeks : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "next 2 weeks");
      Last_Three_Months : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "last 3 months");
      Q3_Range : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "q3 2024");
      Fiscal_Q2 : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "fy2025 q2");
      Fiscal_Year : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "FY2027");
      Fiscal_Half : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "FY2027 H1");
      Semester_2 : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "S2 2026");
      Half_Year_2 : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "H2 2026");
      Scanned_Fiscal_Half : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date_Range
          (Ref_Date, "FY2027 H1; cached");
      Early_Next_Week : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "early next week");
      Mid_March : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "mid-March");
      Late_Q2 : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "late Q2");
      Mid_Next_Quarter : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "mid next quarter");
      First_Half_2026 : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "first half of 2026");
      End_FY2027 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "end of FY2027");
      Week_32_Range : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "week 32");
      ISO_Week_Range : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "2024-W09");
      This_Weekend : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "this weekend");
      Next_Weekend : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "next weekend");
      Last_Weekend : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "last weekend");
      Next_Business_Week :
        constant Humanize.Parsing.Date_Range_Parse_Result :=
          Humanize.Parsing.Parse_Natural_Date_Range
            (Ref_Date, "next business week");
      Scanned_Weekend : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date_Range
          (Ref_Date, "this weekend; cached");
      Between_Dates : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "between today and next friday");
      Scanned_Range_Date : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date_Range
          (Ref_Date, "next 2 weeks; cached");
      Holiday_Rules : constant
        Humanize.Parsing.Business_Calendar_Rules_Parse_Result :=
          Humanize.Parsing.Parse_Business_Calendar_Rules
            (Ref_Date, "holiday 2024-01-02");
      Recurring_Rules : constant
        Humanize.Parsing.Business_Calendar_Rules_Parse_Result :=
          Humanize.Parsing.Parse_Business_Calendar_Rules
            (Ref_Date, "recurring holiday january 2");
      Shutdown_Rules : constant
        Humanize.Parsing.Business_Calendar_Rules_Parse_Result :=
          Humanize.Parsing.Parse_Business_Calendar_Rules
            (Ref_Date, "shutdown 2024-01-02 to 2024-01-03");
      Rule_Next_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next business day", Holiday_Rules.Rules);
      Rule_Three_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "3 business days from now", Holiday_Rules.Rules);
      Rule_Before_Month_End : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "two business days before month end",
           Holiday_Rules.Rules);
      Rule_Last_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
           "last business day", Holiday_Rules.Rules);
      Rule_Recurring_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next business day", Recurring_Rules.Rules);
      Rule_Shutdown_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next business day", Shutdown_Rules.Rules);
      Rule_Scanned_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "next business day; cached", Holiday_Rules.Rules);
      Rule_Range_Business : constant
        Humanize.Parsing.Date_Range_Parse_Result :=
          Humanize.Parsing.Parse_Natural_Date_Range
            (Ref_Date, "between today and next business day",
             Holiday_Rules.Rules);
      One_Off_Holiday : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ref_Date, "holiday 2026-07-06");
      Recurring_Holiday : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ref_Date, "recurring holiday december 25");
      Half_Day : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ref_Date, "half-day 2026-12-24 until 12");
      Shutdown : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ref_Date, "shutdown 2026-12-24 to 2026-12-31");
      Business_Hours : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ref_Date, "business hours monday 9-17");
      Next_Open : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ada.Calendar.Time_Of (2026, 7, 3, 18.0 * 3_600.0),
           "next open business hour");
      Scanned_Business_Calendar :
        constant Humanize.Parsing.Business_Calendar_Parse_Result :=
          Humanize.Parsing.Scan_Business_Calendar
            (Ref_Date, "business hours friday 10-15; cached");
      Parsed_Rules : constant
        Humanize.Parsing.Business_Calendar_Rules_Parse_Result :=
          Humanize.Parsing.Parse_Business_Calendar_Rules
            (Ref_Date,
             "recurring holiday december 25; "
             & "half-day 2026-12-24 until 12; "
             & "shutdown 2026-12-28 to 2026-12-29; "
             & "business hours monday 8-16");
      Rules_Result : constant Ada.Calendar.Time :=
        Humanize.Durations.Add_Business_Hours
          (Ada.Calendar.Time_Of (2026, 12, 24, 11.0 * 3_600.0),
           2,
           Parsed_Rules.Rules);
      Diag_Message : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Diagnostic_Message
          (Humanize.Parsing.Expected_Number, 4);
   begin
      AUnit.Assertions.Assert
        (Frequency.Status = Humanize.Status.Ok and then Frequency.Count = 4,
         "parse frequency");
      AUnit.Assertions.Assert
        (Rate.Status = Humanize.Status.Ok and then Rate.Count = 4
         and then Rate.Period = Humanize.Rates.Per_Week
         and then not Rate.Less_Than,
         "parse rate");
      AUnit.Assertions.Assert
        (Rate_Alias.Status = Humanize.Status.Ok
         and then Rate_Alias.Period = Humanize.Rates.Per_Week,
         "parse rate period alias");
      AUnit.Assertions.Assert
        (Less.Status = Humanize.Status.Ok and then Less.Count = 1
         and then Less.Period = Humanize.Rates.Per_Day
         and then Less.Less_Than,
         "parse less-than rate");
      AUnit.Assertions.Assert
        (List.Status = Humanize.Status.Ok and then List.Count = 3,
         "parse list count");
      AUnit.Assertions.Assert
        (Bad_Rate.Status = Humanize.Status.Invalid_Argument,
         "reject malformed rate");
      AUnit.Assertions.Assert
        (Single.Status = Humanize.Status.Ok and then Single.Count = 1,
         "parse single-item list count");
      AUnit.Assertions.Assert
        (German_List.Status = Humanize.Status.Ok and then German_List.Count = 3,
         "parse localized list count");
      AUnit.Assertions.Assert
        (Japanese_List.Status = Humanize.Status.Ok
         and then Japanese_List.Count = 2,
         "parse CJK localized list count");
      AUnit.Assertions.Assert
        (Localized_Frequency.Status = Humanize.Status.Ok
         and then Localized_Frequency.Count = 2,
         "parse localized frequency unit");
      AUnit.Assertions.Assert
        (Localized_Rate.Status = Humanize.Status.Ok
         and then Localized_Rate.Count = 2
         and then Localized_Rate.Period = Humanize.Rates.Per_Week,
         "parse localized rate");
      AUnit.Assertions.Assert
        (Percent.Status = Humanize.Status.Ok and then Percent.Value = 13
         and then not Percent.Exact,
         "parse percent");
      AUnit.Assertions.Assert
        (Ordinal.Status = Humanize.Status.Ok and then Ordinal.Value = 21,
         "parse ordinal");
      AUnit.Assertions.Assert
        (Word_Cardinal.Status = Humanize.Status.Ok
         and then Word_Cardinal.Value = 21,
         "parse word cardinal");
      AUnit.Assertions.Assert
        (Word_Ordinal.Status = Humanize.Status.Ok
         and then Word_Ordinal.Value = 21,
         "parse word ordinal");
      AUnit.Assertions.Assert
        (German_Word_Cardinal.Status = Humanize.Status.Ok
         and then German_Word_Cardinal.Value = 42,
         "parse localized German cardinal spellout");
      AUnit.Assertions.Assert
        (Finnish_Word_Cardinal.Status = Humanize.Status.Ok
         and then Finnish_Word_Cardinal.Value = 2_345,
         "parse localized Finnish cardinal spellout");
      AUnit.Assertions.Assert
        (French_Large_Word_Cardinal.Status = Humanize.Status.Ok
         and then French_Large_Word_Cardinal.Value = 2_000_000_001,
         "parse localized French large cardinal spellout");
      AUnit.Assertions.Assert
        (Japanese_Word_Cardinal.Status = Humanize.Status.Ok
         and then Japanese_Word_Cardinal.Value = 2_345,
         "parse localized Japanese cardinal spellout");
      AUnit.Assertions.Assert
        (Korean_Word_Cardinal.Status = Humanize.Status.Ok
         and then Korean_Word_Cardinal.Value = 2_345,
         "parse localized Korean cardinal spellout");
      AUnit.Assertions.Assert
        (Chinese_Word_Cardinal.Status = Humanize.Status.Ok
         and then Chinese_Word_Cardinal.Value = 2_345,
         "parse localized Chinese cardinal spellout");
      AUnit.Assertions.Assert
        (Polish_Word_Ordinal.Status = Humanize.Status.Ok
         and then Polish_Word_Ordinal.Value = 121,
         "parse localized Polish ordinal spellout");
      AUnit.Assertions.Assert
        (Polish_Thousands_Word_Ordinal.Status = Humanize.Status.Ok
         and then Polish_Thousands_Word_Ordinal.Value = 2_345,
         "parse localized Polish thousands ordinal spellout");
      AUnit.Assertions.Assert
        (Japanese_Word_Ordinal.Status = Humanize.Status.Ok
         and then Japanese_Word_Ordinal.Value = 12,
         "parse localized Japanese ordinal spellout");
      AUnit.Assertions.Assert
        (Korean_Word_Ordinal.Status = Humanize.Status.Ok
         and then Korean_Word_Ordinal.Value = 12,
         "parse localized Korean ordinal spellout");
      AUnit.Assertions.Assert
        (Chinese_Word_Ordinal.Status = Humanize.Status.Ok
         and then Chinese_Word_Ordinal.Value = 12,
         "parse localized Chinese ordinal spellout");
      AUnit.Assertions.Assert
        (Japanese_Thousands_Word_Ordinal.Status = Humanize.Status.Ok
         and then Japanese_Thousands_Word_Ordinal.Value = 2_345,
         "parse localized Japanese thousands ordinal spellout");
      AUnit.Assertions.Assert
        (Scientific.Status = Humanize.Status.Ok
         and then Scientific.Value = 1_230_000.0,
         "parse scientific number");
      AUnit.Assertions.Assert
        (Duration_Range.Status = Humanize.Status.Ok
         and then Duration_Range.Low = 3_600
         and then Duration_Range.High = 7_200,
         "parse duration range");
      AUnit.Assertions.Assert
        (Countdown.Status = Humanize.Status.Ok and then Countdown.Value = 60,
         "parse countdown");
      AUnit.Assertions.Assert
        (SLA.Status = Humanize.Status.Ok and then SLA.Value = 86_400,
         "parse SLA window");
      AUnit.Assertions.Assert
        (Age.Status = Humanize.Status.Ok and then Age.Value = 259_200,
         "parse age phrase");
      AUnit.Assertions.Assert
        (Modified.Status = Humanize.Status.Ok and then Modified.Value = 7_200,
         "parse modified-ago phrase");
      AUnit.Assertions.Assert
        (Parsed_Progress.Status = Humanize.Status.Ok
         and then Parsed_Progress.Count = 3
         and then Parsed_Progress.Total = 10,
         "parse progress phrase");
      AUnit.Assertions.Assert
        (Results.Status = Humanize.Status.Ok and then Results.Count = 24,
         "parse result count");
      AUnit.Assertions.Assert
        (Counted.Status = Humanize.Status.Ok
         and then Counted.Count = 0
         and then Counted.Noun (1 .. Counted.Noun_Length) = "files",
         "parse counted noun zero");
      AUnit.Assertions.Assert
        (Article_Count.Status = Humanize.Status.Ok
         and then Article_Count.Count = 1
         and then Article_Count.Noun (1 .. Article_Count.Noun_Length) = "item",
         "parse counted noun article");
      AUnit.Assertions.Assert
        (Compact_Count.Status = Humanize.Status.Ok
         and then Compact_Count.Count = 1_200
         and then Compact_Count.Noun (1 .. Compact_Count.Noun_Length) = "files",
         "parse counted noun compact count");
      AUnit.Assertions.Assert
        (Word_Count.Status = Humanize.Status.Ok
         and then Word_Count.Count = 21
         and then Word_Count.Noun (1 .. Word_Count.Noun_Length) = "entries",
         "parse counted noun word count");
      AUnit.Assertions.Assert
        (Scanned_Count.Status = Humanize.Status.Ok
         and then Scanned_Count.Count = 3
         and then Scanned_Count.Noun (1 .. Scanned_Count.Noun_Length) = "boxes"
         and then Scanned_Count.Consumed = 7,
         "scan counted noun prefix");
      AUnit.Assertions.Assert
        (Showing.Status = Humanize.Status.Ok
         and then Showing.Count = 20
         and then Showing.Total = 153,
         "parse showing count");
      AUnit.Assertions.Assert
        (Page.Status = Humanize.Status.Ok
         and then Page.Count = 2
         and then Page.Total = 8,
         "parse page count");
      AUnit.Assertions.Assert
        (ETA.Status = Humanize.Status.Ok and then ETA.Value = 300,
         "parse ETA phrase");
      AUnit.Assertions.Assert
        (Retry.Status = Humanize.Status.Ok and then Retry.Value = 10,
         "parse retry phrase");
      AUnit.Assertions.Assert
        (Step.Status = Humanize.Status.Ok
         and then Step.Count = 2
         and then Step.Total = 5,
         "parse step count");
      AUnit.Assertions.Assert
        (Attempt.Status = Humanize.Status.Ok
         and then Attempt.Count = 2
         and then Attempt.Total = 3,
         "parse attempt count");
      AUnit.Assertions.Assert
        (Business.Status = Humanize.Status.Ok and then Business.Value = 3,
         "parse business days");
      AUnit.Assertions.Assert
        (Working.Status = Humanize.Status.Ok and then Working.Value = 1,
         "parse working hours");
      AUnit.Assertions.Assert
        (Recurrence.Status = Humanize.Status.Ok and then Recurrence.Value = 2,
         "parse recurrence");
      AUnit.Assertions.Assert
        (Other_Tuesday.Status = Humanize.Status.Ok
         and then Other_Tuesday.Kind = Humanize.Parsing.Recurrence_Weekday
         and then Other_Tuesday.Every = 2
         and then Other_Tuesday.Unit = Humanize.Durations.Every_Week
         and then Other_Tuesday.Weekday = 2,
         "parse every-other weekday recurrence");
      AUnit.Assertions.Assert
        (Weekday_Schedule.Status = Humanize.Status.Ok
         and then Weekday_Schedule.Kind =
           Humanize.Parsing.Recurrence_Weekday_Set
         and then Weekday_Schedule.Weekdays = Humanize.Durations.Weekdays
         and then Weekday_Schedule.Has_Time
         and then Weekday_Schedule.Hour = 9
         and then Weekday_Schedule.Minute = 0,
         "parse weekday schedule recurrence");
      AUnit.Assertions.Assert
        (First_Monday.Status = Humanize.Status.Ok
         and then First_Monday.Kind =
           Humanize.Parsing.Recurrence_Ordinal_Weekday
         and then First_Monday.Unit = Humanize.Durations.Every_Month
         and then First_Monday.Ordinal = 1
         and then First_Monday.Weekday = 1
         and then First_Monday.Has_Time
         and then First_Monday.Hour = 9
         and then First_Monday.Minute = 30,
         "parse ordinal weekday recurrence");
      AUnit.Assertions.Assert
        (Cron_Weekday.Status = Humanize.Status.Ok
         and then Cron_Weekday.Kind = Humanize.Parsing.Recurrence_Weekday_Set
         and then Cron_Weekday.Weekdays = Humanize.Durations.Weekdays
         and then Cron_Weekday.Has_Time
         and then Cron_Weekday.Hour = 9
         and then Cron_Weekday.Minute = 0,
         "parse cron weekday schedule");
      AUnit.Assertions.Assert
        (Cron_Monthly.Status = Humanize.Status.Ok
         and then Cron_Monthly.Unit = Humanize.Durations.Every_Month
         and then Cron_Monthly.Day_Of_Month = 15
         and then Cron_Monthly.Has_Time
         and then Cron_Monthly.Hour = 8
         and then Cron_Monthly.Minute = 30,
         "parse cron monthly schedule");
      AUnit.Assertions.Assert
        (Scanned_Cron.Status = Humanize.Status.Ok
         and then Scanned_Cron.Kind = Humanize.Parsing.Recurrence_Weekday_Set
         and then Scanned_Cron.Weekdays = Humanize.Durations.Weekdays
         and then Scanned_Cron.Has_Time
         and then Scanned_Cron.Hour = 9
         and then Scanned_Cron.Consumed = 11,
         "scan cron weekday schedule");
      AUnit.Assertions.Assert
        (Cron_Step_Minute.Status = Humanize.Status.Ok
         and then Cron_Step_Minute.Every = 15
         and then Cron_Step_Minute.Unit = Humanize.Durations.Every_Minute,
         "parse cron stepped minute schedule");
      AUnit.Assertions.Assert
        (Cron_Step_Hour.Status = Humanize.Status.Ok
         and then Cron_Step_Hour.Every = 2
         and then Cron_Step_Hour.Unit = Humanize.Durations.Every_Hour
         and then Cron_Step_Hour.Has_Time
         and then Cron_Step_Hour.Minute = 0,
         "parse cron stepped hour schedule");
      AUnit.Assertions.Assert
        (Cron_Named_List.Status = Humanize.Status.Ok
         and then Cron_Named_List.Kind =
           Humanize.Parsing.Recurrence_Weekday_Set
         and then Cron_Named_List.Weekdays (1)
         and then Cron_Named_List.Weekdays (3)
         and then Cron_Named_List.Weekdays (5)
         and then not Cron_Named_List.Weekdays (2)
         and then Cron_Named_List.Has_Time
         and then Cron_Named_List.Hour = 9
         and then Cron_Named_List.Minute = 30,
         "parse cron named weekday list");
      AUnit.Assertions.Assert
        (Cron_Yearly.Status = Humanize.Status.Ok
         and then Cron_Yearly.Unit = Humanize.Durations.Every_Year
         and then Cron_Yearly.Month_Of_Year = 1
         and then Cron_Yearly.Day_Of_Month = 15
         and then Cron_Yearly.Has_Time
         and then Cron_Yearly.Hour = 8
         and then Cron_Yearly.Minute = 30,
         "parse cron named month yearly schedule");
      AUnit.Assertions.Assert
        (Cron_Quartz_Weekday.Status = Humanize.Status.Ok
         and then Cron_Quartz_Weekday.Kind =
           Humanize.Parsing.Recurrence_Weekday_Set
         and then Cron_Quartz_Weekday.Has_Second
         and then Cron_Quartz_Weekday.Second = 0
         and then Cron_Quartz_Weekday.Has_Time
         and then Cron_Quartz_Weekday.Hour = 9
         and then Cron_Quartz_Weekday.Minute = 0
         and then Cron_Quartz_Weekday.Weekdays =
           Humanize.Durations.Weekdays,
         "parse quartz cron weekday schedule");
      AUnit.Assertions.Assert
        (Cron_Quartz_Year.Status = Humanize.Status.Ok
         and then Cron_Quartz_Year.Unit = Humanize.Durations.Every_Year
         and then Cron_Quartz_Year.Has_Second
         and then Cron_Quartz_Year.Second = 30
         and then Cron_Quartz_Year.Has_Year
         and then Cron_Quartz_Year.Year = 2027
         and then Cron_Quartz_Year.Month_Of_Year = 1
         and then Cron_Quartz_Year.Day_Of_Month = 15
         and then Cron_Quartz_Year.Hour = 8
         and then Cron_Quartz_Year.Minute = 15,
         "parse quartz cron year field");
      AUnit.Assertions.Assert
        (Cron_Last_Day.Status = Humanize.Status.Ok
         and then Cron_Last_Day.Unit = Humanize.Durations.Every_Month
         and then Cron_Last_Day.Is_Last_Day_Of_Month,
         "parse quartz cron last day of month");
      AUnit.Assertions.Assert
        (Cron_Nearest_Weekday.Status = Humanize.Status.Ok
         and then Cron_Nearest_Weekday.Unit = Humanize.Durations.Every_Month
         and then Cron_Nearest_Weekday.Day_Of_Month = 15
         and then Cron_Nearest_Weekday.Is_Nearest_Weekday,
         "parse quartz cron nearest weekday");
      AUnit.Assertions.Assert
        (Cron_Last_Friday.Status = Humanize.Status.Ok
         and then Cron_Last_Friday.Kind =
           Humanize.Parsing.Recurrence_Ordinal_Weekday
         and then Cron_Last_Friday.Is_Last_Weekday
         and then Cron_Last_Friday.Ordinal = -1
         and then Cron_Last_Friday.Weekday = 5,
         "parse quartz cron last weekday");
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
      AUnit.Assertions.Assert
        (Database_Phrase.Status = Humanize.Status.Ok
         and then Database_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Phrase.Database_Status =
           Humanize.Phrases.Database_Replication_Lagging
         and then Database_Backup_Phrase.Status = Humanize.Status.Ok
         and then Database_Backup_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Backup_Phrase.Database_Status =
           Humanize.Phrases.Database_Backup_Failed,
         "parse database phrases");
      AUnit.Assertions.Assert
        (Database_Online_Phrase.Status = Humanize.Status.Ok
         and then Database_Online_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Online_Phrase.Database_Status =
           Humanize.Phrases.Database_Online
         and then Database_Offline_Phrase.Status = Humanize.Status.Ok
         and then Database_Offline_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Offline_Phrase.Database_Status =
           Humanize.Phrases.Database_Offline
         and then Database_Degraded_Phrase.Status = Humanize.Status.Ok
         and then Database_Degraded_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Degraded_Phrase.Database_Status =
           Humanize.Phrases.Database_Degraded
         and then Database_Migrating_Phrase.Status = Humanize.Status.Ok
         and then Database_Migrating_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Migrating_Phrase.Database_Status =
           Humanize.Phrases.Database_Migrating
         and then Database_Migration_Failed_Phrase.Status = Humanize.Status.Ok
         and then Database_Migration_Failed_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Migration_Failed_Phrase.Database_Status =
           Humanize.Phrases.Database_Migration_Failed
         and then Database_Replicating_Phrase.Status = Humanize.Status.Ok
         and then Database_Replicating_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Replicating_Phrase.Database_Status =
           Humanize.Phrases.Database_Replicating
         and then Database_Backup_Running_Phrase.Status = Humanize.Status.Ok
         and then Database_Backup_Running_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Backup_Running_Phrase.Database_Status =
           Humanize.Phrases.Database_Backup_Running
         and then Database_Backup_Failed_Phrase.Status = Humanize.Status.Ok
         and then Database_Backup_Failed_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Backup_Failed_Phrase.Database_Status =
           Humanize.Phrases.Database_Backup_Failed,
         "parse all database phrases");
      AUnit.Assertions.Assert
        (Field_Change.Status = Humanize.Status.Ok
         and then Field_Change.Total = 4
         and then Field_Change.Changed = 2
         and then Field_Change.Added = 1
         and then Field_Change.Removed = 1
         and then Field_Change.Unit (1 .. Field_Change.Unit_Length) = "fields",
         "parse field change summary");
      AUnit.Assertions.Assert
        (Field_Added.Status = Humanize.Status.Ok
         and then Field_Added.Kind = Humanize.Parsing.Field_State_Added
         and then Field_Added.Field (1 .. Field_Added.Field_Length) = "title"
         and then Field_Added.Value (1 .. Field_Added.Value_Length) = "final",
         "parse field added summary");
      AUnit.Assertions.Assert
        (Field_Removed.Status = Humanize.Status.Ok
         and then Field_Removed.Kind = Humanize.Parsing.Field_State_Removed
         and then Field_Removed.Field (1 .. Field_Removed.Field_Length) =
           "title"
         and then Field_Removed.Value (1 .. Field_Removed.Value_Length) =
           "draft",
         "parse field removed summary");
      AUnit.Assertions.Assert
        (Field_Unchanged.Status = Humanize.Status.Ok
         and then Field_Unchanged.Kind =
           Humanize.Parsing.Field_State_Unchanged
         and then Field_Unchanged.Field
           (1 .. Field_Unchanged.Field_Length) = "status"
         and then Field_Unchanged.Value
           (1 .. Field_Unchanged.Value_Length) = "open",
         "parse field unchanged summary");
      AUnit.Assertions.Assert
        (Uncertainty.Status = Humanize.Status.Ok
         and then abs (Uncertainty.Value - 12.3) < 0.0001
         and then abs (Uncertainty.Uncertainty - 0.4) < 0.0001
         and then Uncertainty.Style =
           Humanize.Numbers.Plus_Minus_Uncertainty,
         "parse plus-minus uncertainty");
      AUnit.Assertions.Assert
        (Uncertainty_Words.Status = Humanize.Status.Ok
         and then abs (Uncertainty_Words.Value - 12.3) < 0.0001
         and then abs (Uncertainty_Words.Uncertainty - 0.4) < 0.0001
         and then Uncertainty_Words.Style =
           Humanize.Numbers.Plus_Minus_Uncertainty,
         "parse worded uncertainty");
      AUnit.Assertions.Assert
        (Parenthesized_Uncertainty.Status = Humanize.Status.Ok
         and then abs (Parenthesized_Uncertainty.Value - 12.3) < 0.0001
         and then abs (Parenthesized_Uncertainty.Uncertainty - 0.4) < 0.0001
         and then Parenthesized_Uncertainty.Style =
           Humanize.Numbers.Parenthesized_Uncertainty,
         "parse parenthesized uncertainty");
      AUnit.Assertions.Assert
        (Interval_Uncertainty.Status = Humanize.Status.Ok
         and then abs (Interval_Uncertainty.Value - 12.3) < 0.0001
         and then abs (Interval_Uncertainty.Uncertainty - 0.4) < 0.0001
         and then abs (Interval_Uncertainty.Low - 11.9) < 0.0001
         and then abs (Interval_Uncertainty.High - 12.7) < 0.0001
         and then Interval_Uncertainty.Style =
           Humanize.Numbers.Interval_Uncertainty,
         "parse interval uncertainty");
      AUnit.Assertions.Assert
        (Scanned_Uncertainty.Status = Humanize.Status.Ok
         and then Scanned_Uncertainty.Consumed = 12,
         "scan uncertainty prefix");
      AUnit.Assertions.Assert
        (Proportion.Status = Humanize.Status.Ok
         and then Proportion.Count = 3
         and then Proportion.Total = 10,
         "parse proportion");
      AUnit.Assertions.Assert
        (Scanned_Proportion.Status = Humanize.Status.Ok
         and then Scanned_Proportion.Count = 1
         and then Scanned_Proportion.Total = 4
         and then Scanned_Proportion.Consumed = 6,
         "scan proportion prefix");
      AUnit.Assertions.Assert
        (Ratio.Status = Humanize.Status.Ok
         and then Ratio.Width = 16 and then Ratio.Height = 9,
         "parse aspect ratio");
      AUnit.Assertions.Assert
        (CSS.Status = Humanize.Status.Ok
         and then CSS.Value = 1.5
         and then CSS.Unit (1 .. CSS.Unit_Length) = "rem",
         "parse CSS length");
      AUnit.Assertions.Assert
        (Compound.Status = Humanize.Status.Ok
         and then Compound.Value = 2.5
         and then Compound.Unit (1 .. Compound.Unit_Length) = "ms",
         "parse compound unit");
      AUnit.Assertions.Assert
        (Database_Throughput.Status = Humanize.Status.Ok
         and then Database_Throughput.Value = 12.5
         and then Database_Throughput.Unit
           (1 .. Database_Throughput.Unit_Length) = "k ops/s",
         "parse database throughput");
      AUnit.Assertions.Assert
        (Scanned_Database_Throughput.Status = Humanize.Status.Ok
         and then Scanned_Database_Throughput.Value = 12.5
         and then Scanned_Database_Throughput.Unit
           (1 .. Scanned_Database_Throughput.Unit_Length) = "k ops/s"
         and then Scanned_Database_Throughput.Consumed = 12,
         "scan database throughput");
      AUnit.Assertions.Assert
        (Data_Rate.Status = Humanize.Status.Ok
         and then Data_Rate.Value = 1.5
         and then Data_Rate.Unit (1 .. Data_Rate.Unit_Length) = "mb/s",
         "parse data rate");
      AUnit.Assertions.Assert
        (Scanned_Bit_Rate.Status = Humanize.Status.Ok
         and then Scanned_Bit_Rate.Value = 1.5
         and then Scanned_Bit_Rate.Unit
           (1 .. Scanned_Bit_Rate.Unit_Length) = "mbit/s"
         and then Scanned_Bit_Rate.Consumed = 10,
         "scan bit rate");
      AUnit.Assertions.Assert
        (Binary_Data_Rate.Status = Humanize.Status.Ok
         and then Binary_Data_Rate.Value = 1.5
         and then Binary_Data_Rate.Unit
           (1 .. Binary_Data_Rate.Unit_Length) = "gib/s",
         "parse binary data rate");
      AUnit.Assertions.Assert
        (Memory_Bandwidth.Status = Humanize.Status.Ok
         and then Memory_Bandwidth.Value = 12.5
         and then Memory_Bandwidth.Unit
           (1 .. Memory_Bandwidth.Unit_Length) = "gb/s",
         "parse memory bandwidth");
      AUnit.Assertions.Assert
        (Scanned_Latency.Status = Humanize.Status.Ok
         and then Scanned_Latency.Value = 2.5
         and then Scanned_Latency.Unit
           (1 .. Scanned_Latency.Unit_Length) = "ms"
         and then Scanned_Latency.Consumed = 6,
         "scan latency");
      AUnit.Assertions.Assert
        (IOPS.Status = Humanize.Status.Ok
         and then IOPS.Value = 42.0
         and then IOPS.Unit (1 .. IOPS.Unit_Length) = "k iops",
         "parse IOPS");
      AUnit.Assertions.Assert
        (Scanned_IOPS.Status = Humanize.Status.Ok
         and then Scanned_IOPS.Value = 42.0
         and then Scanned_IOPS.Unit (1 .. Scanned_IOPS.Unit_Length) = "k iops"
         and then Scanned_IOPS.Consumed = 9,
         "scan IOPS");
      AUnit.Assertions.Assert
        (Density.Status = Humanize.Status.Ok
         and then Density.Unit (1 .. Density.Unit_Length) = "kg/m3",
         "parse density");
      AUnit.Assertions.Assert
        (Acceleration.Status = Humanize.Status.Ok
         and then Acceleration.Unit
           (1 .. Acceleration.Unit_Length) = "m/s2",
         "parse acceleration");
      AUnit.Assertions.Assert
        (Torque.Status = Humanize.Status.Ok
         and then Torque.Unit (1 .. Torque.Unit_Length) = "n m",
         "parse torque");
      AUnit.Assertions.Assert
        (Fuel_Economy.Status = Humanize.Status.Ok
         and then Fuel_Economy.Unit
           (1 .. Fuel_Economy.Unit_Length) = "l/100 km",
         "parse fuel economy");
      AUnit.Assertions.Assert
        (Flow_Rate.Status = Humanize.Status.Ok
         and then Flow_Rate.Unit (1 .. Flow_Rate.Unit_Length) = "ml/s"
         and then Flow_Rate.Consumed = 8,
         "scan flow rate");
      AUnit.Assertions.Assert
        (Electric_Current.Status = Humanize.Status.Ok
         and then Electric_Current.Unit
           (1 .. Electric_Current.Unit_Length) = "ma",
         "parse electric current");
      AUnit.Assertions.Assert
        (Voltage.Status = Humanize.Status.Ok
         and then Voltage.Unit (1 .. Voltage.Unit_Length) = "kv",
         "parse voltage");
      AUnit.Assertions.Assert
        (Pixel_Density.Status = Humanize.Status.Ok
         and then Pixel_Density.Unit
           (1 .. Pixel_Density.Unit_Length) = "ppi",
         "parse pixel density");
      AUnit.Assertions.Assert
        (Electric_Resistance.Status = Humanize.Status.Ok
         and then Electric_Resistance.Unit
           (1 .. Electric_Resistance.Unit_Length) = "mohm",
         "parse electric resistance");
      AUnit.Assertions.Assert
        (Electric_Capacitance.Status = Humanize.Status.Ok
         and then Electric_Capacitance.Unit
           (1 .. Electric_Capacitance.Unit_Length) = "nf",
         "parse electric capacitance");
      AUnit.Assertions.Assert
        (Electric_Inductance.Status = Humanize.Status.Ok
         and then Electric_Inductance.Unit
           (1 .. Electric_Inductance.Unit_Length) = "h",
         "parse electric inductance");
      AUnit.Assertions.Assert
        (Concentration.Status = Humanize.Status.Ok
         and then Concentration.Unit
           (1 .. Concentration.Unit_Length) = "mol/l",
         "parse concentration");
      AUnit.Assertions.Assert
        (Fuel_Efficiency_MPG.Status = Humanize.Status.Ok
         and then Fuel_Efficiency_MPG.Unit
           (1 .. Fuel_Efficiency_MPG.Unit_Length) = "mpg",
         "parse fuel efficiency mpg");
      AUnit.Assertions.Assert
        (CPU_Load.Status = Humanize.Status.Ok
         and then CPU_Load.Unit (1 .. CPU_Load.Unit_Length) = "% cpu",
         "parse CPU load");
      AUnit.Assertions.Assert
        (Battery.Status = Humanize.Status.Ok
         and then Battery.Unit (1 .. Battery.Unit_Length) = "% battery",
         "parse battery");
      AUnit.Assertions.Assert
        (Screen_Size.Status = Humanize.Status.Ok
         and then Screen_Size.Unit
           (1 .. Screen_Size.Unit_Length) = "in screen",
         "parse screen size");
      AUnit.Assertions.Assert
        (Typography_Size.Status = Humanize.Status.Ok
         and then Typography_Size.Unit
           (1 .. Typography_Size.Unit_Length) = "pt",
         "parse typography size");
      AUnit.Assertions.Assert
        (Audio_Level.Status = Humanize.Status.Ok
         and then Audio_Level.Value = -6.0
         and then Audio_Level.Unit
           (1 .. Audio_Level.Unit_Length) = "db",
         "parse audio level");
      AUnit.Assertions.Assert
        (Signal_Strength.Status = Humanize.Status.Ok
         and then Signal_Strength.Value = -67.0
         and then Signal_Strength.Unit
           (1 .. Signal_Strength.Unit_Length) = "dbm",
         "parse signal strength");
      AUnit.Assertions.Assert
        (Storage_Endurance.Status = Humanize.Status.Ok
         and then Storage_Endurance.Unit
           (1 .. Storage_Endurance.Unit_Length) = "tbw",
         "parse storage endurance");
      AUnit.Assertions.Assert
        (Refresh_Rate.Status = Humanize.Status.Ok
         and then Refresh_Rate.Unit
           (1 .. Refresh_Rate.Unit_Length) = "hz refresh",
         "parse refresh rate");
      AUnit.Assertions.Assert
        (Luminance.Status = Humanize.Status.Ok
         and then Luminance.Unit (1 .. Luminance.Unit_Length) = "nits",
         "parse luminance");
      AUnit.Assertions.Assert
        (Print_Resolution.Status = Humanize.Status.Ok
         and then Print_Resolution.Unit
           (1 .. Print_Resolution.Unit_Length) = "dpi",
         "parse print resolution");
      AUnit.Assertions.Assert
        (Unit.Status = Humanize.Status.Ok
         and then Unit.Unit = Humanize.Units.Kilometer
         and then Unit.Value = 5.0,
         "parse unit quantity");
      AUnit.Assertions.Assert
        (Localized_Unit.Status = Humanize.Status.Ok
         and then Localized_Unit.Unit = Humanize.Units.Kilometer
         and then Localized_Unit.Value = 5.0,
         "parse localized unit quantity");
      AUnit.Assertions.Assert
        (Acre.Status = Humanize.Status.Ok
         and then Acre.Unit = Humanize.Units.Acre
         and then Acre.Value = 2.0,
         "parse expanded unit alias");
      AUnit.Assertions.Assert
        (Pounds.Status = Humanize.Status.Ok
         and then Pounds.Unit = Humanize.Units.Pound,
         "parse plural abbreviation unit alias");
      AUnit.Assertions.Assert
        (Fahrenheit.Status = Humanize.Status.Ok
         and then Fahrenheit.Unit = Humanize.Units.Fahrenheit,
         "parse temperature unit alias");
      AUnit.Assertions.Assert
        (Bad_Unit.Status = Humanize.Status.Invalid_Argument
         and then Bad_Unit.Error_Position = 3,
         "parse unit diagnostic position");
      AUnit.Assertions.Assert
        (Scanned_Unit.Status = Humanize.Status.Ok
         and then Scanned_Unit.Unit = Humanize.Units.Kilometer
         and then Scanned_Unit.Consumed = 4,
         "scan unit prefix");
      AUnit.Assertions.Assert
        (Scanned_Bytes.Status = Humanize.Status.Ok
         and then Scanned_Bytes.Value = 1536
         and then Scanned_Bytes.Consumed = 7,
         "scan byte prefix");
      AUnit.Assertions.Assert
        (Scanned_Precise.Status = Humanize.Status.Ok
         and then Scanned_Precise.Value = 1_005_000
         and then Scanned_Precise.Consumed = 14,
         "scan precise duration prefix");
      AUnit.Assertions.Assert
        (Scanned_Compact.Status = Humanize.Status.Ok
         and then Scanned_Compact.Value = 1_200
         and then Scanned_Compact.Consumed = 4,
         "scan compact number prefix");
      AUnit.Assertions.Assert
        (Scanned_Bounded.Status = Humanize.Status.Ok
         and then Scanned_Bounded.Value = 100
         and then Scanned_Bounded.Consumed = 4,
         "scan bounded number prefix");
      AUnit.Assertions.Assert
        (Scanned_Frequency.Status = Humanize.Status.Ok
         and then Scanned_Frequency.Count = 4
         and then Scanned_Frequency.Consumed = 7,
         "scan frequency prefix");
      AUnit.Assertions.Assert
        (Scanned_Rate.Status = Humanize.Status.Ok
         and then Scanned_Rate.Less_Than
         and then Scanned_Rate.Period = Humanize.Rates.Per_Day,
         "scan rate prefix");
      AUnit.Assertions.Assert
        (Scanned_List.Status = Humanize.Status.Ok
         and then Scanned_List.Count = 3
         and then Scanned_List.Consumed = 20,
         "scan list prefix");
      AUnit.Assertions.Assert
        (Scanned_Percent.Status = Humanize.Status.Ok
         and then Scanned_Percent.Value = 13
         and then Scanned_Percent.Consumed = 5,
         "scan percent prefix");
      AUnit.Assertions.Assert
        (Scanned_Ordinal.Status = Humanize.Status.Ok
         and then Scanned_Ordinal.Value = 21
         and then Scanned_Ordinal.Consumed = 4,
         "scan ordinal prefix");
      AUnit.Assertions.Assert
        (Roman.Status = Humanize.Status.Ok and then Roman.Value = 2026,
         "parse Roman numeral");
      AUnit.Assertions.Assert
        (Lower_Roman.Status = Humanize.Status.Ok
         and then Lower_Roman.Value = 944,
         "parse lowercase Roman numeral");
      AUnit.Assertions.Assert
        (Bad_Roman.Status = Humanize.Status.Invalid_Argument,
         "reject noncanonical Roman numeral");
      AUnit.Assertions.Assert
        (Scanned_Roman.Status = Humanize.Status.Ok
         and then Scanned_Roman.Value = 2026
         and then Scanned_Roman.Consumed = 6,
         "scan Roman numeral");
      AUnit.Assertions.Assert
        (Normal_Unit.Status = Humanize.Status.Ok
         and then Humanize.Tests.Support.Text (Normal_Unit)
           = "kilometers per hour",
         "normalize unit text");
      AUnit.Assertions.Assert
        (Normal_List.Status = Humanize.Status.Ok
         and then Humanize.Tests.Support.Text (Normal_List)
           = "ada, spark and alire",
         "normalize list text");
      AUnit.Assertions.Assert
        (Tomorrow.Status = Humanize.Status.Ok
         and then Tomorrow.Value = Ref_Date + 86_400.0,
         "parse natural date tomorrow");
      AUnit.Assertions.Assert
        (Russian_Today.Status = Humanize.Status.Ok
         and then Russian_Today.Value = Ref_Date,
         "parse localized natural date today");
      AUnit.Assertions.Assert
        (Danish_In_Weeks.Status = Humanize.Status.Ok
         and then Danish_In_Weeks.Value = Ref_Date + 14.0 * 86_400.0,
         "parse localized relative natural date");
      AUnit.Assertions.Assert
        (Russian_Ago.Status = Humanize.Status.Ok
         and then Russian_Ago.Value = Ref_Date - 2.0 * 86_400.0,
         "parse localized natural date ago");
      AUnit.Assertions.Assert
        (Next_Fri.Status = Humanize.Status.Ok
         and then Next_Fri.Value = Ref_Date + 4.0 * 86_400.0,
         "parse natural next weekday");
      AUnit.Assertions.Assert
        (Friday_After_Next.Status = Humanize.Status.Ok
         and then Friday_After_Next.Value = Ref_Date + 11.0 * 86_400.0,
         "parse natural weekday after next");
      AUnit.Assertions.Assert
        (Next_Fri_Afternoon.Status = Humanize.Status.Ok
         and then Next_Fri_Afternoon.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 13.0 * 3_600.0),
         "parse natural weekday with time-of-day");
      AUnit.Assertions.Assert
        (Next_Fri_At_1730.Status = Humanize.Status.Ok
         and then Next_Fri_At_1730.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 17.0 * 3_600.0 + 30.0 * 60.0),
         "parse natural weekday with clock time");
      AUnit.Assertions.Assert
        (Next_Fri_At_1730_TZ.Status = Humanize.Status.Ok
         and then Next_Fri_At_1730_TZ.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 15.0 * 3_600.0 + 30.0 * 60.0),
         "parse natural weekday with clock time and timezone");
      AUnit.Assertions.Assert
        (Next_Fri_At_1730_CEST.Status = Humanize.Status.Ok
         and then Next_Fri_At_1730_CEST.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 15.0 * 3_600.0 + 30.0 * 60.0),
         "parse natural weekday with clock time and timezone name");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_TZ_Name.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_TZ_Name.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 16.0 * 3_600.0),
         "parse natural date with timezone name");
      AUnit.Assertions.Assert
        (Tomorrow_At_5_PM_TZ_Name.Status = Humanize.Status.Ok
         and then Tomorrow_At_5_PM_TZ_Name.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 16.0 * 3_600.0),
         "parse natural date with timezone name and split am/pm");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_UTC_Plus2.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_UTC_Plus2.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 15.0 * 3_600.0),
         "parse natural date with UTC timezone offset -- status="
         & Humanize.Status.Status_Code'Image (Tomorrow_At_5pm_UTC_Plus2.Status)
         & ", value="
         & Ada.Calendar.Formatting.Image (Tomorrow_At_5pm_UTC_Plus2.Value));
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_UTC_Plus2_NoSpace.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_UTC_Plus2_NoSpace.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 15.0 * 3_600.0),
         "parse natural date with UTC timezone offset without space");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_GMT_Minus2.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_GMT_Minus2.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 19.0 * 3_600.0),
         "parse natural date with GMT timezone offset");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_TZ_NoSpace.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_TZ_NoSpace.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 17.0 * 3_600.0),
         "parse natural date with no-space time and timezone suffix");
      AUnit.Assertions.Assert
        (Tonight_At_5pm_TZ.Status = Humanize.Status.Ok
         and then Tonight_At_5pm_TZ.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 0.0),
         "parse natural date with pm timezone suffix");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_TZ.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_TZ.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 17.0 * 3_600.0),
         "parse natural date with timezone suffix and space: status="
         & Humanize.Status.Status_Code'Image (Tomorrow_At_5pm_TZ.Status)
         & " value="
         & Ada.Calendar.Formatting.Image (Tomorrow_At_5pm_TZ.Value)
         & " error-pos="
         & Integer'Image (Tomorrow_At_5pm_TZ.Error_Position));
      AUnit.Assertions.Assert
        (Tonight.Status = Humanize.Status.Ok
         and then Tonight.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 21.0 * 3_600.0),
         "parse tonight");
      AUnit.Assertions.Assert
        (Later_Today.Status = Humanize.Status.Ok
         and then Later_Today.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 13.0 * 3_600.0),
         "parse later today");
      AUnit.Assertions.Assert
        (Scanned_Tonight.Status = Humanize.Status.Ok
         and then Scanned_Tonight.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 21.0 * 3_600.0)
         and then Scanned_Tonight.Consumed = 7,
         "scan tonight");
      AUnit.Assertions.Assert
        (Scanned_Fri_Afternoon.Status = Humanize.Status.Ok
         and then Scanned_Fri_Afternoon.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 13.0 * 3_600.0)
         and then Scanned_Fri_Afternoon.Consumed = 21,
         "scan natural weekday with time-of-day");
      AUnit.Assertions.Assert
        (Scanned_Tonight_TZ.Status = Humanize.Status.Ok
         and then Scanned_Tonight_TZ.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 15.0 * 3_600.0)
         and then Scanned_Tonight_TZ.Consumed = 19,
         "scan natural weekday with clock time and timezone");
      AUnit.Assertions.Assert
        (Scanned_Tonight_TZ_Name.Status = Humanize.Status.Ok
         and then Scanned_Tonight_TZ_Name.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 16.0 * 3_600.0)
         and then Scanned_Tonight_TZ_Name.Consumed = 19,
         "scan natural date with timezone name");
      AUnit.Assertions.Assert
        (Scanned_Tonight_TZ_Name_With_Space.Status = Humanize.Status.Ok
         and then Scanned_Tonight_TZ_Name_With_Space.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 16.0 * 3_600.0),
         "scan natural date with timezone name and split am/pm");
      AUnit.Assertions.Assert
        (Scanned_Tomorrow_At_5pm_UTC_Plus2.Status = Humanize.Status.Ok
         and then Scanned_Tomorrow_At_5pm_UTC_Plus2.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 15.0 * 3_600.0)
         and then Scanned_Tomorrow_At_5pm_UTC_Plus2.Consumed = 21,
         "scan natural date with UTC timezone offset");
      AUnit.Assertions.Assert
        (Scanned_Tomorrow_At_5pm_GMT_Minus2.Status = Humanize.Status.Ok
         and then Scanned_Tomorrow_At_5pm_GMT_Minus2.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 19.0 * 3_600.0)
         and then Scanned_Tomorrow_At_5pm_GMT_Minus2.Consumed = 23,
         "scan natural date with GMT timezone offset");
      AUnit.Assertions.Assert
        (Scanned_Date.Status = Humanize.Status.Ok
         and then Scanned_Date.Value = Ref_Date + 3.0 * 86_400.0
         and then Scanned_Date.Consumed = 9,
         "scan natural date");
      AUnit.Assertions.Assert
        (In_A_Couple_Of_Weeks.Status = Humanize.Status.Ok
         and then In_A_Couple_Of_Weeks.Value =
           Ada.Calendar.Time_Of (2024, 1, 15, 0.0),
         "parse natural date couple of weeks");
      AUnit.Assertions.Assert
        (In_A_Fortnight.Status = Humanize.Status.Ok
         and then In_A_Fortnight.Value =
           Ada.Calendar.Time_Of (2024, 1, 15, 0.0),
         "parse natural date fortnight");
      AUnit.Assertions.Assert
        (Fortnight_Ago.Status = Humanize.Status.Ok
         and then Fortnight_Ago.Value =
           Ada.Calendar.Time_Of (2023, 12, 18, 0.0),
         "parse natural date fortnight ago");
      AUnit.Assertions.Assert
        (Tomorrow_At_5.Status = Humanize.Status.Ok
         and then Tomorrow_At_5.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 17.0 * 3_600.0),
         "parse natural date with clock time");
      AUnit.Assertions.Assert
        (Tomorrow_Around_Noon.Status = Humanize.Status.Ok
         and then Tomorrow_Around_Noon.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 12.0 * 3_600.0),
         "parse natural date around noon");
      AUnit.Assertions.Assert
        (End_Next_Business_Month.Status = Humanize.Status.Ok
         and then End_Next_Business_Month.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse end of next business month");
      AUnit.Assertions.Assert
        (Next_Month_Third.Status = Humanize.Status.Ok
         and then Next_Month_Third.Value =
           Ada.Calendar.Time_Of (2024, 2, 3, 0.0),
         "parse next month ordinal date");
      AUnit.Assertions.Assert
        (ISO_Date.Status = Humanize.Status.Ok
         and then ISO_Date.Value = Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse ISO natural date");
      AUnit.Assertions.Assert
        (ISO_Ordinal_Date.Status = Humanize.Status.Ok
         and then ISO_Ordinal_Date.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse ISO ordinal date");
      AUnit.Assertions.Assert
        (ISO_Week_Date.Status = Humanize.Status.Ok
         and then ISO_Week_Date.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse ISO week date");
      AUnit.Assertions.Assert
        (ISO_Week_Start.Status = Humanize.Status.Ok
         and then ISO_Week_Start.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
         "parse ISO week start date");
      AUnit.Assertions.Assert
        (Scanned_ISO_Week.Status = Humanize.Status.Ok
         and then Scanned_ISO_Week.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0)
         and then Scanned_ISO_Week.Consumed = 10,
         "scan ISO week date");
      AUnit.Assertions.Assert
        (Month_Name.Status = Humanize.Status.Ok
         and then Month_Name.Value = Ada.Calendar.Time_Of (2024, 2, 2, 0.0),
         "parse month-name natural date");
      AUnit.Assertions.Assert
        (Month_Day_Ordinal.Status = Humanize.Status.Ok
         and then Month_Day_Ordinal.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
         "parse month-day ordinal date");
      AUnit.Assertions.Assert
        (Weekday_Ordinal.Status = Humanize.Status.Ok
         and then Weekday_Ordinal.Value =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
         "parse weekday ordinal date");
      AUnit.Assertions.Assert
        (Scanned_Month_Day_Ordinal.Status = Humanize.Status.Ok
         and then Scanned_Month_Day_Ordinal.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0)
         and then Scanned_Month_Day_Ordinal.Consumed = 7,
         "scan month-day ordinal date");
      AUnit.Assertions.Assert
        (In_Weeks.Status = Humanize.Status.Ok
         and then In_Weeks.Value = Ref_Date + 14.0 * 86_400.0,
         "parse relative weeks");
      AUnit.Assertions.Assert
        (In_Few_Days.Status = Humanize.Status.Ok
         and then In_Few_Days.Value = Ada.Calendar.Time_Of (2024, 1, 4, 0.0),
         "parse fuzzy relative days");
      AUnit.Assertions.Assert
        (Month_Ago.Status = Humanize.Status.Ok
         and then Month_Ago.Value = Ada.Calendar.Time_Of (2023, 12, 1, 0.0),
         "parse relative months ago");
      AUnit.Assertions.Assert
        (This_Fri.Status = Humanize.Status.Ok
         and then This_Fri.Value = Ref_Date + 4.0 * 86_400.0,
         "parse this weekday");
      AUnit.Assertions.Assert
        (Last_Fri.Status = Humanize.Status.Ok
         and then Last_Fri.Value = Ref_Date - 3.0 * 86_400.0,
         "parse last weekday");
      AUnit.Assertions.Assert
        (Two_Fridays.Status = Humanize.Status.Ok
         and then Two_Fridays.Value = Ref_Date + 11.0 * 86_400.0,
         "parse repeated weekday from now");
      AUnit.Assertions.Assert
        (Friday_Before_Next.Status = Humanize.Status.Ok
         and then Friday_Before_Next.Value =
           Ada.Calendar.Time_Of (2023, 12, 29, 0.0),
         "parse weekday before next");
      AUnit.Assertions.Assert
        (End_Next_Month.Status = Humanize.Status.Ok
         and then End_Next_Month.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse end of next month");
      AUnit.Assertions.Assert
        (Start_Q3.Status = Humanize.Status.Ok
         and then Start_Q3.Value = Ada.Calendar.Time_Of (2024, 7, 1, 0.0),
         "parse start of quarter");
      AUnit.Assertions.Assert
        (End_Next_Quarter.Status = Humanize.Status.Ok
         and then End_Next_Quarter.Value =
           Ada.Calendar.Time_Of (2024, 6, 30, 0.0),
         "parse end of next quarter");
      AUnit.Assertions.Assert
        (Second_Tuesday_March.Status = Humanize.Status.Ok
         and then Second_Tuesday_March.Value =
           Ada.Calendar.Time_Of (2024, 3, 12, 0.0),
         "parse ordinal weekday in month");
      AUnit.Assertions.Assert
        (Last_Friday_March_2024.Status = Humanize.Status.Ok
         and then Last_Friday_March_2024.Value =
           Ada.Calendar.Time_Of (2024, 3, 29, 0.0),
         "parse last weekday in explicit month");
      AUnit.Assertions.Assert
        (Next_Business.Status = Humanize.Status.Ok
         and then Next_Business.Value = Ref_Date + 86_400.0,
         "parse next business day");
      AUnit.Assertions.Assert
        (Next_Business_Friday.Status = Humanize.Status.Ok
         and then Next_Business_Friday.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 0.0),
         "parse next business weekday");
      AUnit.Assertions.Assert
        (Three_Business.Status = Humanize.Status.Ok
         and then Three_Business.Value = Ref_Date + 3.0 * 86_400.0,
         "parse business days from now");
      AUnit.Assertions.Assert
        (Several_Business.Status = Humanize.Status.Ok
         and then Several_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 10, 0.0),
         "parse fuzzy business days from now");
      AUnit.Assertions.Assert
        (Before_Month_End.Status = Humanize.Status.Ok
         and then Before_Month_End.Value =
           Ada.Calendar.Time_Of (2024, 1, 29, 0.0),
         "parse business days before month end");
      AUnit.Assertions.Assert
        (Before_Next_Quarter_End.Status = Humanize.Status.Ok
         and then Before_Next_Quarter_End.Value =
           Ada.Calendar.Time_Of (2024, 6, 27, 0.0),
         "parse business days before next quarter end");
      AUnit.Assertions.Assert
        (Rule_Next_Business.Status = Humanize.Status.Ok
         and then Rule_Next_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
         "parse next business day with one-off holiday rules");
      AUnit.Assertions.Assert
        (Rule_Three_Business.Status = Humanize.Status.Ok
         and then Rule_Three_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 0.0),
         "parse business days from now with one-off holiday rules");
      AUnit.Assertions.Assert
        (Rule_Before_Month_End.Status = Humanize.Status.Ok
         and then Rule_Before_Month_End.Value =
           Ada.Calendar.Time_Of (2024, 1, 29, 0.0),
         "parse business days before boundary with rules");
      AUnit.Assertions.Assert
        (Rule_Last_Business.Status = Humanize.Status.Ok
         and then Rule_Last_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
         "parse previous business day with one-off holiday rules");
      AUnit.Assertions.Assert
        (Rule_Recurring_Business.Status = Humanize.Status.Ok
         and then Rule_Recurring_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
         "parse next business day with recurring holiday rules");
      AUnit.Assertions.Assert
        (Rule_Shutdown_Business.Status = Humanize.Status.Ok
         and then Rule_Shutdown_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 4, 0.0),
         "parse next business day with shutdown rules");
      AUnit.Assertions.Assert
        (Rule_Scanned_Business.Status = Humanize.Status.Ok
         and then Rule_Scanned_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0)
         and then Rule_Scanned_Business.Consumed = 17,
         "scan business day with business calendar rules");
      AUnit.Assertions.Assert
        (Rule_Range_Business.Status = Humanize.Status.Ok
         and then Rule_Range_Business.Low =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0)
         and then Rule_Range_Business.High =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
         "parse nested business date range with business calendar rules");
      AUnit.Assertions.Assert
        (Week_32_Start.Status = Humanize.Status.Ok
         and then Week_32_Start.Value =
           Ada.Calendar.Time_Of (2024, 8, 5, 0.0),
         "parse week-number start");
      AUnit.Assertions.Assert
        (ISO_Week_Range.Status = Humanize.Status.Ok
         and then ISO_Week_Range.Low =
           Ada.Calendar.Time_Of (2024, 2, 26, 0.0)
         and then ISO_Week_Range.High =
           Ada.Calendar.Time_Of (2024, 3, 4, 0.0),
         "parse ISO week date range");
      AUnit.Assertions.Assert
        (This_Week.Status = Humanize.Status.Ok
         and then This_Week.Low = Ref_Date
         and then This_Week.High = Ref_Date + 7.0 * 86_400.0,
         "parse this week range");
      AUnit.Assertions.Assert
        (Next_Two_Weeks.Status = Humanize.Status.Ok
         and then Next_Two_Weeks.Low = Ref_Date
         and then Next_Two_Weeks.High = Ref_Date + 14.0 * 86_400.0,
         "parse next two weeks range");
      AUnit.Assertions.Assert
        (Last_Three_Months.Status = Humanize.Status.Ok
         and then Last_Three_Months.Low =
           Ada.Calendar.Time_Of (2023, 10, 1, 0.0)
         and then Last_Three_Months.High = Ref_Date,
         "parse last three months range");
      AUnit.Assertions.Assert
        (Q3_Range.Status = Humanize.Status.Ok
         and then Q3_Range.Low = Ada.Calendar.Time_Of (2024, 7, 1, 0.0)
         and then Q3_Range.High = Ada.Calendar.Time_Of (2024, 10, 1, 0.0),
         "parse quarter range");
      AUnit.Assertions.Assert
        (Fiscal_Q2.Status = Humanize.Status.Ok
         and then Fiscal_Q2.Low = Ada.Calendar.Time_Of (2025, 4, 1, 0.0)
         and then Fiscal_Q2.High = Ada.Calendar.Time_Of (2025, 7, 1, 0.0),
         "parse fiscal quarter label range");
      AUnit.Assertions.Assert
        (Fiscal_Year.Status = Humanize.Status.Ok
         and then Fiscal_Year.Low = Ada.Calendar.Time_Of (2027, 1, 1, 0.0)
         and then Fiscal_Year.High = Ada.Calendar.Time_Of (2028, 1, 1, 0.0),
         "parse fiscal year label range");
      AUnit.Assertions.Assert
        (Fiscal_Half.Status = Humanize.Status.Ok
         and then Fiscal_Half.Low = Ada.Calendar.Time_Of (2027, 1, 1, 0.0)
         and then Fiscal_Half.High = Ada.Calendar.Time_Of (2027, 7, 1, 0.0),
         "parse fiscal half label range");
      AUnit.Assertions.Assert
        (Semester_2.Status = Humanize.Status.Ok
         and then Semester_2.Low = Ada.Calendar.Time_Of (2026, 7, 1, 0.0)
         and then Semester_2.High = Ada.Calendar.Time_Of (2027, 1, 1, 0.0),
         "parse semester label range");
      AUnit.Assertions.Assert
        (Half_Year_2.Status = Humanize.Status.Ok
         and then Half_Year_2.Low = Ada.Calendar.Time_Of (2026, 7, 1, 0.0)
         and then Half_Year_2.High = Ada.Calendar.Time_Of (2027, 1, 1, 0.0),
         "parse half-year label range");
      AUnit.Assertions.Assert
        (Scanned_Fiscal_Half.Status = Humanize.Status.Ok
         and then Scanned_Fiscal_Half.Low =
           Ada.Calendar.Time_Of (2027, 1, 1, 0.0)
         and then Scanned_Fiscal_Half.High =
           Ada.Calendar.Time_Of (2027, 7, 1, 0.0)
         and then Scanned_Fiscal_Half.Consumed = 9,
         "scan fiscal half label range");
      AUnit.Assertions.Assert
        (Early_Next_Week.Status = Humanize.Status.Ok
         and then Early_Next_Week.Low =
           Ada.Calendar.Time_Of (2024, 1, 8, 0.0)
         and then Early_Next_Week.High =
           Ada.Calendar.Time_Of (2024, 1, 11, 0.0),
         "parse early next week range");
      AUnit.Assertions.Assert
        (Mid_March.Status = Humanize.Status.Ok
         and then Mid_March.Low =
           Ada.Calendar.Time_Of (2024, 3, 12, 0.0)
         and then Mid_March.High =
           Ada.Calendar.Time_Of (2024, 3, 22, 0.0),
         "parse mid-month range");
      AUnit.Assertions.Assert
        (Late_Q2.Status = Humanize.Status.Ok
         and then Late_Q2.Low =
           Ada.Calendar.Time_Of (2024, 6, 1, 0.0)
         and then Late_Q2.High =
           Ada.Calendar.Time_Of (2024, 7, 1, 0.0),
         "parse late quarter range");
      AUnit.Assertions.Assert
        (Mid_Next_Quarter.Status = Humanize.Status.Ok
         and then Mid_Next_Quarter.Low =
           Ada.Calendar.Time_Of (2024, 5, 2, 0.0)
         and then Mid_Next_Quarter.High =
           Ada.Calendar.Time_Of (2024, 6, 1, 0.0),
         "parse mid next quarter range");
      AUnit.Assertions.Assert
        (First_Half_2026.Status = Humanize.Status.Ok
         and then First_Half_2026.Low =
           Ada.Calendar.Time_Of (2026, 1, 1, 0.0)
         and then First_Half_2026.High =
           Ada.Calendar.Time_Of (2026, 7, 1, 0.0),
         "parse first half phrase range");
      AUnit.Assertions.Assert
        (End_FY2027.Status = Humanize.Status.Ok
         and then End_FY2027.Value =
           Ada.Calendar.Time_Of (2027, 12, 31, 0.0),
         "parse fiscal year end boundary");
      AUnit.Assertions.Assert
        (Week_32_Range.Status = Humanize.Status.Ok
         and then Week_32_Range.Low = Ada.Calendar.Time_Of (2024, 8, 5, 0.0)
         and then Week_32_Range.High = Ada.Calendar.Time_Of (2024, 8, 12, 0.0),
         "parse week-number range");
      AUnit.Assertions.Assert
        (This_Weekend.Status = Humanize.Status.Ok
         and then This_Weekend.Low = Ada.Calendar.Time_Of (2024, 1, 6, 0.0)
         and then This_Weekend.High = Ada.Calendar.Time_Of (2024, 1, 8, 0.0),
         "parse this weekend range");
      AUnit.Assertions.Assert
        (Next_Weekend.Status = Humanize.Status.Ok
         and then Next_Weekend.Low = Ada.Calendar.Time_Of (2024, 1, 13, 0.0)
         and then Next_Weekend.High = Ada.Calendar.Time_Of (2024, 1, 15, 0.0),
         "parse next weekend range");
      AUnit.Assertions.Assert
        (Last_Weekend.Status = Humanize.Status.Ok
         and then Last_Weekend.Low = Ada.Calendar.Time_Of (2023, 12, 30, 0.0)
         and then Last_Weekend.High = Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
         "parse last weekend range");
      AUnit.Assertions.Assert
        (Next_Business_Week.Status = Humanize.Status.Ok
         and then Next_Business_Week.Low =
           Ada.Calendar.Time_Of (2024, 1, 8, 0.0)
         and then Next_Business_Week.High =
           Ada.Calendar.Time_Of (2024, 1, 13, 0.0),
         "parse next business week range");
      AUnit.Assertions.Assert
        (Scanned_Weekend.Status = Humanize.Status.Ok
         and then Scanned_Weekend.Low = Ada.Calendar.Time_Of (2024, 1, 6, 0.0)
         and then Scanned_Weekend.High = Ada.Calendar.Time_Of (2024, 1, 8, 0.0)
         and then Scanned_Weekend.Consumed = 12,
         "scan weekend range");
      AUnit.Assertions.Assert
        (Between_Dates.Status = Humanize.Status.Ok
         and then Between_Dates.Low = Ref_Date
         and then Between_Dates.High = Ref_Date + 4.0 * 86_400.0,
         "parse between natural date range");
      AUnit.Assertions.Assert
        (Scanned_Range_Date.Status = Humanize.Status.Ok
         and then Scanned_Range_Date.Consumed = 12
         and then Scanned_Range_Date.High = Ref_Date + 14.0 * 86_400.0,
         "scan natural date range");
      AUnit.Assertions.Assert
        (One_Off_Holiday.Status = Humanize.Status.Ok
         and then One_Off_Holiday.Kind =
           Humanize.Parsing.Business_One_Off_Holiday
         and then One_Off_Holiday.Date =
           Ada.Calendar.Time_Of (2026, 7, 6, 0.0),
         "parse one-off business holiday");
      AUnit.Assertions.Assert
        (Recurring_Holiday.Status = Humanize.Status.Ok
         and then Recurring_Holiday.Kind =
           Humanize.Parsing.Business_Recurring_Holiday
         and then Recurring_Holiday.Month = 12
         and then Recurring_Holiday.Day = 25,
         "parse recurring business holiday");
      AUnit.Assertions.Assert
        (Half_Day.Status = Humanize.Status.Ok
         and then Half_Day.Kind = Humanize.Parsing.Business_Half_Day
         and then Half_Day.Date = Ada.Calendar.Time_Of (2026, 12, 24, 0.0)
         and then Half_Day.End_Hour = 12,
         "parse business half-day");
      AUnit.Assertions.Assert
        (Shutdown.Status = Humanize.Status.Ok
         and then Shutdown.Kind = Humanize.Parsing.Business_Shutdown
         and then Shutdown.Date = Ada.Calendar.Time_Of (2026, 12, 24, 0.0)
         and then Shutdown.End_Date =
           Ada.Calendar.Time_Of (2026, 12, 31, 0.0),
         "parse business shutdown");
      AUnit.Assertions.Assert
        (Business_Hours.Status = Humanize.Status.Ok
         and then Business_Hours.Kind = Humanize.Parsing.Business_Hour_Range
         and then Business_Hours.Weekday = 1
         and then Business_Hours.Start_Hour = 9
         and then Business_Hours.End_Hour = 17,
         "parse business hour range");
      AUnit.Assertions.Assert
        (Next_Open.Status = Humanize.Status.Ok
         and then Next_Open.Kind = Humanize.Parsing.Business_Next_Open_Hour
         and then Next_Open.Date = Ada.Calendar.Time_Of (2026, 7, 6, 0.0)
         and then Next_Open.Start_Hour = 9
         and then Next_Open.End_Hour = 10,
         "parse next open business hour");
      AUnit.Assertions.Assert
        (Scanned_Business_Calendar.Status = Humanize.Status.Ok
         and then Scanned_Business_Calendar.Kind =
           Humanize.Parsing.Business_Hour_Range
         and then Scanned_Business_Calendar.Weekday = 5
         and then Scanned_Business_Calendar.Start_Hour = 10
         and then Scanned_Business_Calendar.End_Hour = 15
         and then Scanned_Business_Calendar.Consumed = 27,
         "scan business calendar phrase");
      AUnit.Assertions.Assert
        (Parsed_Rules.Status = Humanize.Status.Ok
         and then Parsed_Rules.Rules.Recurring_Holiday_Count = 1
         and then Parsed_Rules.Rules.Half_Day_Count = 1
         and then Parsed_Rules.Rules.Shutdown_Count = 1
         and then Parsed_Rules.Rules.Options.Weekday_Hours.Monday_Start = 8
         and then Parsed_Rules.Rules.Options.Weekday_Hours.Monday_End = 16,
         "parse executable business calendar rules");
      AUnit.Assertions.Assert
        (Rules_Result = Ada.Calendar.Time_Of (2026, 12, 30, 10.0 * 3_600.0),
         "apply parsed business calendar rules to business-hour arithmetic");
   end Test_Frequency_Rate_List;
