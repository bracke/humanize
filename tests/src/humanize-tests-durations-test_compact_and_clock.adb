separate (Humanize.Tests.Durations)
   procedure Test_Compact_And_Clock
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Compact : constant Text_Result := Format_Compact (Support.En, 5_405, 2);
      Long_Compact : constant Text_Result :=
        Format_Compact (Support.En, 400 * 86_400, 2);
      Clock : constant Text_Result := Format_Clock (Support.En, 5_405);
      Short_Clock : constant Text_Result :=
        Format_Clock (Support.En, 1_805, Always_Hours => False);
      Range_Text : constant Text_Result :=
        Format_Range (Support.En, 3_600, 7_200);
      Countdown_Text : constant Text_Result :=
        Countdown (Support.En, 90);
      SLA : constant Text_Result :=
        SLA_Window (Support.En, 86_400);
      Natural_Interval : constant Text_Result :=
        Interval (Support.En, 3_600, 7_200);
      Compact_Interval : constant Text_Result :=
        Interval (Support.En, 3_600, 7_200,
                  Phrase => (Style => Compact_Label));
      Upcoming : constant Text_Result :=
        Next_Window (Support.En, 172_800);
      Old : constant Text_Result :=
        Age (Support.En, 259_200);
      Stale : constant Text_Result :=
        Stale_For (Support.En, 3_600);
      Expiry : constant Text_Result :=
        Expires_In (Support.En, 3_600);
      Modified : constant Text_Result :=
        Modified_Ago (Support.En, 7_200);
      Synced : constant Text_Result :=
        Synced_Ago (Support.En, 0);
      Backup : constant Text_Result :=
        Backup_Age (Support.En, 86_400);
      Progress : constant Text_Result :=
        Complete_Count (Support.En, 3, 10);
      Percent : constant Text_Result :=
        Percent_Complete (Support.En, 75.0);
      Retry : constant Text_Result :=
        Retry_In (Support.En, 10);
      Step : constant Text_Result := Step_Count (Support.En, 2, 5);
      Attempt : constant Text_Result := Attempt_Count (Support.En, 2, 3);
      ETA_Text : constant Text_Result := ETA (Support.En, 300);
      Throughput : constant Text_Result :=
        Throughput_Remaining (Support.En, 120, 4, "item");
      Bar : constant Text_Result := Progress_Bar (Support.En, 3, 10, 10);
      Business : constant Text_Result := Business_Days (Support.En, 3);
      Working : constant Text_Result := Working_Hours (Support.En, 1);
      EOW : constant Text_Result := End_Of_Week (Support.En);
      Repeat : constant Text_Result := Recurrence (Support.En, 2, Every_Day);
      Holidays : constant Holiday_List :=
        [1 => Ada.Calendar.Time_Of (2026, 7, 6, 0.0)];
      Business_Date : constant Text_Result :=
        Business_Date_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 7, 3, 0.0),
           1);
      Holiday_Date : constant Text_Result :=
        Business_Date_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 7, 3, 0.0),
           1,
           Holidays);
      Business_Hour : constant Text_Result :=
        Business_Hour_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 7, 3, 16.0 * 3_600.0),
           2);
      Calendar_Hour : constant Text_Result :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 7, 3, 11.0 * 3_600.0),
           6,
           Holidays,
           (Hours => Default_Business_Hour_Options,
            Break_Start_Hour => 12,
            Break_End_Hour => 13));
      Inert_Holidays : constant Holiday_List :=
        [1 => Ada.Calendar.Time_Of (2099, 1, 1, 0.0)];
      Inert_Recurring : constant Recurring_Holiday_List :=
        [1 => (Month => 1, Day => 1)];
      Inert_Half_Days : constant Half_Day_List :=
        [1 => (Date => Ada.Calendar.Time_Of (2099, 1, 2, 0.0),
               End_Hour => 12)];
      Inert_Shutdowns : constant Shutdown_Period_List :=
        [1 => (First_Date => Ada.Calendar.Time_Of (2099, 1, 3, 0.0),
               Last_Date  => Ada.Calendar.Time_Of (2099, 1, 4, 0.0))];
      Saturday_Hour : constant Text_Result :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 7, 3, 16.0 * 3_600.0),
           2,
           Inert_Holidays,
           Inert_Recurring,
           Inert_Half_Days,
           Inert_Shutdowns,
           (Weekday_Hours =>
              (Monday_Start => 9, Monday_End => 17,
               Tuesday_Start => 9, Tuesday_End => 17,
               Wednesday_Start => 9, Wednesday_End => 17,
               Thursday_Start => 9, Thursday_End => 17,
               Friday_Start => 9, Friday_End => 17,
               Saturday_Start => 9, Saturday_End => 12,
               Sunday_Start => 0, Sunday_End => 0),
            Break_Start_Hour => 0,
            Break_End_Hour => 0));
      Advanced_Hour : constant Text_Result :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 12, 24, 15.0 * 3_600.0),
           8,
           Inert_Holidays,
           [1 => (Month => 12, Day => 25)],
           [1 => (Date => Ada.Calendar.Time_Of (2026, 12, 24, 0.0),
                  End_Hour => 12)],
           [1 => (First_Date => Ada.Calendar.Time_Of (2026, 12, 28, 0.0),
                  Last_Date  => Ada.Calendar.Time_Of (2026, 12, 29, 0.0))]);
      Closed_Advanced_Hour : constant Text_Result :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 7, 3, 16.0 * 3_600.0),
           1,
           Inert_Holidays,
           Inert_Recurring,
           Inert_Half_Days,
           Inert_Shutdowns,
           (Weekday_Hours =>
              (Monday_Start => 0, Monday_End => 0,
               Tuesday_Start => 0, Tuesday_End => 0,
               Wednesday_Start => 0, Wednesday_End => 0,
               Thursday_Start => 0, Thursday_End => 0,
               Friday_Start => 0, Friday_End => 0,
               Saturday_Start => 0, Saturday_End => 0,
               Sunday_Start => 0, Sunday_End => 0),
            Break_Start_Hour => 0,
            Break_End_Hour => 0));
      Extended_Weekday_Hour : constant Text_Result :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 7, 3, 16.0 * 3_600.0),
           1,
           Inert_Holidays,
           Inert_Recurring,
           Inert_Half_Days,
           Inert_Shutdowns,
           Business_Calendar_Options_For (Business_Extended_Weekdays));
      Weekend_Preset_Hour : constant Text_Result :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 7, 4, 15.0 * 3_600.0),
           1,
           Inert_Holidays,
           Inert_Recurring,
           Inert_Half_Days,
           Inert_Shutdowns,
           Business_Calendar_Options_For (Business_Seven_Days));
      Closed_Preset_Rules : constant Business_Calendar_Rules :=
        Business_Calendar_Rules_For (Business_Closed);
      Closed_Preset_Hour : constant Text_Result :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 7, 3, 16.0 * 3_600.0),
           1,
           Closed_Preset_Rules);
      Observed_Rules : Business_Calendar_Rules;
      Nth_Weekday_Rules : Business_Calendar_Rules;
      US_Federal_Rules : constant Business_Calendar_Rules :=
        US_Federal_Business_Calendar_Rules (2026);
      TARGET2_Rules : constant Business_Calendar_Rules :=
        TARGET2_Business_Calendar_Rules (2026);
      UK_Rules : constant Business_Calendar_Rules :=
        UK_England_Wales_Business_Calendar_Rules (2026);
      Canada_Rules : constant Business_Calendar_Rules :=
        Canada_Federal_Business_Calendar_Rules (2026);
      Germany_Rules : constant Business_Calendar_Rules :=
        Germany_Business_Calendar_Rules (2026);
      France_Rules : constant Business_Calendar_Rules :=
        France_Business_Calendar_Rules (2026);
      NYSE_Rules : constant Business_Calendar_Rules :=
        NYSE_Business_Calendar_Rules (2026);
      ASX_Rules : constant Business_Calendar_Rules :=
        ASX_Business_Calendar_Rules (2026);
      JPX_Rules : constant Business_Calendar_Rules :=
        JPX_Business_Calendar_Rules (2026);
      SIX_Rules : constant Business_Calendar_Rules :=
        SIX_Business_Calendar_Rules (2026);
      SGX_Rules : constant Business_Calendar_Rules :=
        SGX_Business_Calendar_Rules (2026);
      HKEX_Rules : constant Business_Calendar_Rules :=
        HKEX_Business_Calendar_Rules (2026);
      NSE_Rules : constant Business_Calendar_Rules :=
        NSE_Business_Calendar_Rules (2026);
      B3_Rules : constant Business_Calendar_Rules :=
        B3_Business_Calendar_Rules (2026);
      BMV_Rules : constant Business_Calendar_Rules :=
        BMV_Business_Calendar_Rules (2026);
      Australia_Rules : constant Business_Calendar_Rules :=
        Australia_National_Business_Calendar_Rules (2026);
      Japan_Rules : constant Business_Calendar_Rules :=
        Japan_Business_Calendar_Rules (2026);
      Switzerland_Rules : constant Business_Calendar_Rules :=
        Switzerland_Business_Calendar_Rules (2026);
      Singapore_Rules : constant Business_Calendar_Rules :=
        Singapore_Business_Calendar_Rules (2026);
      Observed_Date : Text_Result;
      Nth_Weekday_Date : Text_Result;
      US_Federal_Date : Text_Result;
      TARGET2_Date : Text_Result;
      UK_Date : Text_Result;
      Canada_Date : Text_Result;
      Germany_Date : Text_Result;
      France_Date : Text_Result;
      NYSE_Date : Text_Result;
      ASX_Date : Text_Result;
      JPX_Date : Text_Result;
      SIX_Date : Text_Result;
      SGX_Date : Text_Result;
      HKEX_Date : Text_Result;
      NSE_Date : Text_Result;
      B3_Date : Text_Result;
      BMV_Date : Text_Result;
      Australia_Date : Text_Result;
      Japan_Date : Text_Result;
      Switzerland_Date : Text_Result;
      Singapore_Date : Text_Result;
      Rule_Status : Status_Code;
      Buffer : String (1 .. 32);
      Written : Natural;
      Code : Status_Code;
   begin
      Rule_Status := Add_Observed_Holiday (Observed_Rules, 2026, 7, 4);
      AUnit.Assertions.Assert
        (Rule_Status = Ok,
         "add observed fixed-date holiday");
      Observed_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 7, 2, 16.0 * 3_600.0),
           2,
           Observed_Rules);
      Rule_Status :=
        Add_Nth_Weekday_Holiday (Nth_Weekday_Rules, 2026, 11, 4, 4);
      AUnit.Assertions.Assert
        (Rule_Status = Ok,
         "add nth weekday holiday");
      Nth_Weekday_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 11, 25, 16.0 * 3_600.0),
           2,
           Nth_Weekday_Rules);
      US_Federal_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 7, 2, 16.0 * 3_600.0),
           2,
           US_Federal_Rules);
      TARGET2_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 4, 2, 16.0 * 3_600.0),
           2,
           TARGET2_Rules);
      UK_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 12, 24, 16.0 * 3_600.0),
           2,
           UK_Rules);
      Canada_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 6, 30, 16.0 * 3_600.0),
           2,
           Canada_Rules);
      Germany_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 4, 2, 16.0 * 3_600.0),
           2,
           Germany_Rules);
      France_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 5, 7, 16.0 * 3_600.0),
           2,
           France_Rules);
      NYSE_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 11, 25, 16.0 * 3_600.0),
           2,
           NYSE_Rules);
      ASX_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 6, 5, 16.0 * 3_600.0),
           2,
           ASX_Rules);
      JPX_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 1, 1, 16.0 * 3_600.0),
           2,
           JPX_Rules);
      SIX_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 1, 1, 16.0 * 3_600.0),
           2,
           SIX_Rules);
      SGX_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 8, 7, 16.0 * 3_600.0),
           2,
           SGX_Rules);
      HKEX_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 6, 30, 16.0 * 3_600.0),
           2,
           HKEX_Rules);
      NSE_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 1, 23, 16.0 * 3_600.0),
           2,
           NSE_Rules);
      B3_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 9, 4, 16.0 * 3_600.0),
           2,
           B3_Rules);
      BMV_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 9, 15, 16.0 * 3_600.0),
           2,
           BMV_Rules);
      Australia_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 1, 23, 16.0 * 3_600.0),
           2,
           Australia_Rules);
      Japan_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 5, 1, 16.0 * 3_600.0),
           2,
           Japan_Rules);
      Switzerland_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 4, 2, 16.0 * 3_600.0),
           2,
           Switzerland_Rules);
      Singapore_Date :=
        Business_Calendar_Label
          (Support.En,
           Ada.Calendar.Time_Of (2026, 8, 7, 16.0 * 3_600.0),
           2,
           Singapore_Rules);
      AUnit.Assertions.Assert
        (Compact.Status = Ok and then Support.Text (Compact) = "1h 30m",
         "compact duration");
      AUnit.Assertions.Assert
        (Long_Compact.Status = Ok and then Support.Text (Long_Compact) = "1y 1mo",
         "compact long duration units");
      AUnit.Assertions.Assert
        (Clock.Status = Ok and then Support.Text (Clock) = "01:30:05",
         "clock duration");
      AUnit.Assertions.Assert
        (Short_Clock.Status = Ok
         and then Support.Text (Short_Clock) = "30:05",
         "clock duration without hours");
      Format_Compact_Into (Support.En, 90, 2, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1m 30s",
         "bounded compact duration");
      AUnit.Assertions.Assert
        (Range_Text.Status = Ok
         and then Support.Text (Range_Text) = "1 hour-2 hours",
         "duration range");
      AUnit.Assertions.Assert
        (Countdown_Text.Status = Ok
         and then Support.Text (Countdown_Text) = "1 minute remaining",
         "countdown duration");
      AUnit.Assertions.Assert
        (SLA.Status = Ok and then Support.Text (SLA) = "within 1 day",
         "SLA window duration");
      AUnit.Assertions.Assert
        (Natural_Interval.Status = Ok
         and then Support.Text (Natural_Interval)
           = "between 1 hour and 2 hours",
         "natural interval duration");
      AUnit.Assertions.Assert
        (Compact_Interval.Status = Ok
         and then Support.Text (Compact_Interval) = "1 hour-2 hours",
         "compact interval option");
      AUnit.Assertions.Assert
        (Upcoming.Status = Ok and then Support.Text (Upcoming) = "next 2 days",
         "next window duration");
      AUnit.Assertions.Assert
        (Old.Status = Ok and then Support.Text (Old) = "3 days old",
         "age phrase");
      AUnit.Assertions.Assert
        (Stale.Status = Ok and then Support.Text (Stale) = "stale for 1 hour",
         "stale phrase");
      AUnit.Assertions.Assert
        (Expiry.Status = Ok and then Support.Text (Expiry) = "expires in 1 hour",
         "expiry phrase");
      AUnit.Assertions.Assert
        (Modified.Status = Ok
         and then Support.Text (Modified) = "modified 2 hours ago",
         "modified freshness phrase");
      AUnit.Assertions.Assert
        (Synced.Status = Ok and then Support.Text (Synced) = "synced just now",
         "synced freshness phrase");
      AUnit.Assertions.Assert
        (Backup.Status = Ok and then Support.Text (Backup) = "backup is 1 day old",
         "backup freshness phrase");
      AUnit.Assertions.Assert
        (Progress.Status = Ok and then Support.Text (Progress) = "3 of 10 complete",
         "completion count phrase");
      AUnit.Assertions.Assert
        (Percent.Status = Ok and then Support.Text (Percent) = "75% complete",
         "percent complete phrase");
      AUnit.Assertions.Assert
        (Retry.Status = Ok and then Support.Text (Retry) = "retrying in 10 seconds",
         "retry phrase");
      AUnit.Assertions.Assert
        (Step.Status = Ok and then Support.Text (Step) = "step 2 of 5",
         "step progress phrase");
      AUnit.Assertions.Assert
        (Attempt.Status = Ok and then Support.Text (Attempt) = "attempt 2 of 3",
         "attempt progress phrase");
      AUnit.Assertions.Assert
        (ETA_Text.Status = Ok and then Support.Text (ETA_Text) = "ETA 5 minutes",
         "ETA phrase");
      AUnit.Assertions.Assert
        (Throughput.Status = Ok
         and then Support.Text (Throughput)
           = "120 items remaining at 4 item/s",
         "throughput remaining phrase");
      AUnit.Assertions.Assert
        (Bar.Status = Ok and then Support.Text (Bar) = "[###-------] 30%",
         "progress bar phrase");
      AUnit.Assertions.Assert
        (Business.Status = Ok and then Support.Text (Business) = "3 business days",
         "business days phrase");
      AUnit.Assertions.Assert
        (Working.Status = Ok and then Support.Text (Working) = "1 working hour",
         "working hours phrase");
      AUnit.Assertions.Assert
        (EOW.Status = Ok and then Support.Text (EOW) = "end of week",
         "end-of-week phrase");
      AUnit.Assertions.Assert
        (Repeat.Status = Ok and then Support.Text (Repeat) = "every 2 days",
         "recurrence phrase");
      AUnit.Assertions.Assert
        (Business_Date.Status = Ok
         and then Support.Text (Business_Date) = "2026-07-06",
         "business-day arithmetic skips weekends");
      AUnit.Assertions.Assert
        (Holiday_Date.Status = Ok
         and then Support.Text (Holiday_Date) = "2026-07-07",
         "business-day arithmetic skips configured holidays");
      AUnit.Assertions.Assert
        (Observed_Date.Status = Ok
         and then Support.Text (Observed_Date) = "2026-07-06",
         "observed fixed-date holiday skips observed weekday");
      AUnit.Assertions.Assert
        (Nth_Weekday_Date.Status = Ok
         and then Support.Text (Nth_Weekday_Date) = "2026-11-27",
         "nth weekday holiday skips configured weekday");
      AUnit.Assertions.Assert
        (US_Federal_Rules.Holiday_Count = 11
         and then US_Federal_Date.Status = Ok
         and then Support.Text (US_Federal_Date) = "2026-07-06",
         "US federal calendar skips observed holidays");
      AUnit.Assertions.Assert
        (TARGET2_Rules.Holiday_Count = 6
         and then TARGET2_Date.Status = Ok
         and then Support.Text (TARGET2_Date) = "2026-04-07",
         "TARGET2 calendar skips Easter closing days");
      AUnit.Assertions.Assert
        (UK_Rules.Holiday_Count = 8
         and then UK_Date.Status = Ok
         and then Support.Text (UK_Date) = "2026-12-29",
         "UK England/Wales calendar skips bank holidays");
      AUnit.Assertions.Assert
        (Canada_Rules.Holiday_Count = 9
         and then Canada_Date.Status = Ok
         and then Support.Text (Canada_Date) = "2026-07-02",
         "Canada federal calendar skips Canada Day");
      AUnit.Assertions.Assert
        (Germany_Rules.Holiday_Count = 9
         and then Germany_Date.Status = Ok
         and then Support.Text (Germany_Date) = "2026-04-07",
         "Germany calendar skips Easter holidays");
      AUnit.Assertions.Assert
        (France_Rules.Holiday_Count = 11
         and then France_Date.Status = Ok
         and then Support.Text (France_Date) = "2026-05-11",
         "France calendar skips May holidays");
      AUnit.Assertions.Assert
        (NYSE_Rules.Holiday_Count = 10
         and then NYSE_Date.Status = Ok
         and then Support.Text (NYSE_Date) = "2026-11-27",
         "NYSE calendar skips Thanksgiving");
      AUnit.Assertions.Assert
        (ASX_Rules.Holiday_Count >= Australia_Rules.Holiday_Count + 1
         and then ASX_Date.Status = Ok
         and then Support.Text (ASX_Date) = "2026-06-09",
         "ASX calendar skips common market holidays");
      AUnit.Assertions.Assert
        (JPX_Rules.Holiday_Count >= Japan_Rules.Holiday_Count + 3
         and then JPX_Date.Status = Ok,
         "JPX calendar skips common year-end market holidays");
      AUnit.Assertions.Assert
        (SIX_Rules.Holiday_Count >= Switzerland_Rules.Holiday_Count + 1
         and then SIX_Date.Status = Ok
         and then Support.Text (SIX_Date) = "2026-01-05",
         "SIX calendar skips common exchange holidays");
      AUnit.Assertions.Assert
        (SGX_Rules.Holiday_Count = Singapore_Rules.Holiday_Count
         and then SGX_Date.Status = Ok
         and then Support.Text (SGX_Date) = "2026-08-11",
         "SGX calendar skips common Singapore holidays");
      AUnit.Assertions.Assert
        (HKEX_Rules.Holiday_Count >= 8
         and then HKEX_Rules.Half_Day_Count >= 2
         and then HKEX_Date.Status = Ok
         and then Support.Text (HKEX_Date) = "2026-07-02",
         "HKEX calendar skips common Hong Kong market holidays and tracks half days");
      AUnit.Assertions.Assert
        (NSE_Rules.Holiday_Count >= 6
         and then NSE_Date.Status = Ok
         and then Support.Text (NSE_Date) = "2026-01-27",
         "NSE calendar skips common India market holidays");
      AUnit.Assertions.Assert
        (B3_Rules.Holiday_Count >= 14
         and then B3_Date.Status = Ok
         and then Support.Text (B3_Date) = "2026-09-08",
         "B3 calendar skips common Brazil market and year-end holidays");
      AUnit.Assertions.Assert
        (BMV_Rules.Holiday_Count >= 7
         and then BMV_Date.Status = Ok
         and then Support.Text (BMV_Date) = "2026-09-17",
         "BMV calendar skips common Mexico market holidays");
      AUnit.Assertions.Assert
        (Australia_Rules.Holiday_Count >= 7
         and then Australia_Date.Status = Ok
         and then Support.Text (Australia_Date) = "2026-01-27",
         "Australia calendar skips national holidays");
      AUnit.Assertions.Assert
        (Japan_Rules.Holiday_Count >= 15
         and then Japan_Date.Status = Ok
         and then Support.Text (Japan_Date) = "2026-05-07",
         "Japan calendar skips Golden Week holidays");
      AUnit.Assertions.Assert
        (Switzerland_Rules.Holiday_Count >= 8
         and then Switzerland_Date.Status = Ok
         and then Support.Text (Switzerland_Date) = "2026-04-07",
         "Switzerland calendar skips Easter holidays");
      AUnit.Assertions.Assert
        (Singapore_Rules.Holiday_Count >= 5
         and then Singapore_Date.Status = Ok
         and then Support.Text (Singapore_Date) = "2026-08-11",
         "Singapore calendar skips observed National Day");
      AUnit.Assertions.Assert
        (Business_Hour.Status = Ok
         and then Support.Text (Business_Hour) = "2026-07-06",
         "business-hour arithmetic respects workday window");
      AUnit.Assertions.Assert
        (Calendar_Hour.Status = Ok
         and then Support.Text (Calendar_Hour) = "2026-07-07",
         "calendar-hour arithmetic respects breaks and holidays");
      AUnit.Assertions.Assert
        (Saturday_Hour.Status = Ok
         and then Support.Text (Saturday_Hour) = "2026-07-04",
         "advanced calendar supports per-weekday Saturday hours");
      AUnit.Assertions.Assert
        (Advanced_Hour.Status = Ok
         and then Support.Text (Advanced_Hour) = "2026-12-30",
         "advanced calendar respects recurring holidays half-days shutdowns");
      AUnit.Assertions.Assert
        (Closed_Advanced_Hour.Status = Invalid_Options,
         "advanced calendar rejects fully closed schedules");
      AUnit.Assertions.Assert
        (Extended_Weekday_Hour.Status = Ok
         and then Support.Text (Extended_Weekday_Hour) = "2026-07-03",
         "extended weekday preset keeps late weekday hours open");
      AUnit.Assertions.Assert
        (Weekend_Preset_Hour.Status = Ok
         and then Support.Text (Weekend_Preset_Hour) = "2026-07-04",
         "seven-day preset keeps weekends open");
      AUnit.Assertions.Assert
        (Closed_Preset_Hour.Status = Invalid_Options,
         "closed business calendar preset has no open hours");
      Business_Calendar_Label_Into
        (Support.En,
         Ada.Calendar.Time_Of (2026, 12, 24, 15.0 * 3_600.0),
         8,
         Inert_Holidays,
         [1 => (Month => 12, Day => 25)],
         [1 => (Date => Ada.Calendar.Time_Of (2026, 12, 24, 0.0),
                End_Hour => 12)],
         [1 => (First_Date => Ada.Calendar.Time_Of (2026, 12, 28, 0.0),
                Last_Date  => Ada.Calendar.Time_Of (2026, 12, 29, 0.0))],
         Buffer,
         Written,
         Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "2026-12-30",
         "bounded advanced calendar respects exclusions");
      Business_Calendar_Label_Into
        (Support.En,
         Ada.Calendar.Time_Of (2026, 4, 2, 16.0 * 3_600.0),
         2,
         TARGET2_Rules,
         Buffer,
         Written,
         Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "2026-04-07",
         "bounded business calendar rules overload");
      Retry_In_Into (Support.En, 10, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "retrying in 10 seconds",
         "bounded retry phrase");
      Schedule_Into
        (Support.En,
         (Kind        => Schedule_Weekday_Set,
          Every       => 1,
          Unit        => Every_Week,
          Weekday     => 0,
          Weekdays    => Weekdays,
          Ordinal     => 0,
          Has_Time    => True,
          Hour        => 9,
          Minute      => 0,
          Use_12_Hour => False),
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "every weekday at 09:00",
         "bounded schedule phrase");
      Last_Business_Day_Schedule_Into
        (Support.En, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) = "last business day of each month",
         "bounded last business day schedule phrase");
      Business_Day_Schedule_Into
        (Support.En, 2, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow
         and then Buffer (1 .. Written) = "second business day of each mont",
         "bounded ordinal business day schedule phrase");
   end Test_Compact_And_Clock;
