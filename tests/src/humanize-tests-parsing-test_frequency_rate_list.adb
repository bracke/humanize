separate (Humanize.Tests.Parsing)
   procedure Test_Frequency_Rate_List
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
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
      procedure Check_Basic_Number_Duration_And_Cron_Parsers is separate;
      procedure Check_Schedule_Operational_And_Invoice_Parsers is separate;
      procedure Check_Database_Summary_Color_And_Scan_Parsers is separate;
      procedure Check_List_Number_String_And_Timezone_Scans is separate;
      procedure Check_Natural_Date_Range_And_Business_Calendar_Parsers is separate;
   begin
      Check_Basic_Number_Duration_And_Cron_Parsers;
      Check_Schedule_Operational_And_Invoice_Parsers;
      Check_Database_Summary_Color_And_Scan_Parsers;
      Check_List_Number_String_And_Timezone_Scans;
      Check_Natural_Date_Range_And_Business_Calendar_Parsers;
   end Test_Frequency_Rate_List;
