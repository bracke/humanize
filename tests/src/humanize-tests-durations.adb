with AUnit.Assertions;

with Ada.Calendar;

with Humanize.Contexts;
with Humanize.Durations;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Durations is

   use Humanize.Durations;
   use Humanize.Status;

   procedure Check
     (Seconds  : Duration_Seconds;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Format (Support.En, Seconds);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Check_Status
     (Seconds  : Duration_Seconds;
      Options  : Duration_Options;
      Expected : Status_Code;
      Message  : String)
   is
      Result : constant Text_Result := Format (Support.En, Seconds, Options);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Expected,
         Message & " -> expected status " & Status_Image (Expected)
         & " got " & Status_Image (Result.Status));
   end Check_Status;

   procedure Test_Negative (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Status (-1, Default_Duration_Options, Invalid_Value,
                    "negative duration");
   end Test_Negative;

   procedure Test_Whole_Units (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (0, "0 seconds", "zero");
      Check (1, "1 second", "one second");
      Check (2, "2 seconds", "two seconds");
      Check (59, "59 seconds", "59 seconds");
      Check (60, "1 minute", "60 seconds is 1 minute");
      Check (90, "1 minute", "90 seconds is 1 minute");
      Check (3600, "1 hour", "3600 seconds is 1 hour");
      Check (3661, "1 hour", "3661 seconds is 1 hour");
      Check (86_400, "1 day", "86400 seconds is 1 day");
      Check (7 * 86_400, "1 week", "7 days is 1 week");
      Check (30 * 86_400, "1 month", "30 days is 1 month");
      Check (365 * 86_400, "1 year", "365 days is 1 year");
   end Test_Whole_Units;

   procedure Check_Multi
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Expected       : String;
      Message        : String)
   is
      Result : constant Text_Result :=
        Format_Components (Context, Seconds, Max_Components);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check_Multi;

   procedure Test_Multi_Unit (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Multi (Support.En, 3661, 2, "1 hour and 1 minute", "two components");
      Check_Multi (Support.En, 90, 2, "1 minute and 30 seconds",
                   "minute+second");
      Check_Multi (Support.En, 3661, 3, "1 hour, 1 minute and 1 second",
                   "three components");
      Check_Multi (Support.En, 60, 1, "1 minute", "single component");
      Check_Multi (Support.En, 0, 2, "0 seconds", "zero stays single");
      Check_Multi
        (Support.En, 400 * 86_400, 3, "1 year, 1 month and 5 days",
         "year month day components");
      Check_Multi (Support.De, 3661, 2, "1 Stunde und 1 Minute", "German multi");
      Check_Multi (Support.Fr, 3661, 2, "1 heure et 1 minute", "French multi");
   end Test_Multi_Unit;

   procedure Test_Multi_Unit_Errors (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Result : constant Text_Result :=
        Format_Components (Support.En, -1, 2);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Invalid_Value,
         "negative multi-unit duration is Invalid_Value");
   end Test_Multi_Unit_Errors;

   procedure Test_Multi_Bounded (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 32);
      Written : Natural;
      Code    : Status_Code;
   begin
      Format_Components_Into (Support.En, 3661, 2, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1 hour and 1 minute",
         "bounded multi-unit, status " & Status_Image (Code));
   end Test_Multi_Bounded;

   procedure Test_Invalid_Options (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Opts : constant Duration_Options :=
        (Largest_Unit => Second, Smallest_Unit => Day);
   begin
      Check_Status (100, Opts, Invalid_Options,
                    "Largest_Unit < Smallest_Unit");
   end Test_Invalid_Options;

   procedure Test_Precise (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Result : constant Text_Result :=
        Format_Precise (Support.En, 3_633_123_000, 4, Millisecond);
      Tiny : constant Text_Result :=
        Format_Precise (Support.En, 4, 2, Microsecond);
      Suppressed : constant Text_Result :=
        Format_Precise
          (Support.En, 3_633_000_000, 3,
           (Minimum_Unit     => Precise_Second,
            Suppressed_Units => [Precise_Minute => True, others => False]));
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok
         and then Support.Text (Result)
           = "1 hour, 33 seconds and 123 milliseconds",
         "precise duration with milliseconds");
      AUnit.Assertions.Assert
        (Tiny.Status = Ok and then Support.Text (Tiny) = "4 microseconds",
         "precise duration with microseconds");
      AUnit.Assertions.Assert
        (Suppressed.Status = Ok
         and then Support.Text (Suppressed) = "1 hour and 33 seconds",
         "precise duration suppresses minutes");
   end Test_Precise;

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
      Natural_Text : constant Text_Result :=
        Natural_Duration (Support.En, 30);
      Half_Text : constant Text_Result :=
        Natural_Duration (Support.En, 1_800);
      Brief_Text : constant Text_Result :=
        Natural_Duration
          (Support.En, 3_900, (Style => Brief_Duration));
      Precise_Brief : constant Text_Result :=
        Natural_Duration
          (Support.En, 3_930, (Style => Brief_Precise_Duration));
      Almost_Text : constant Text_Result :=
        Natural_Duration (Support.En, 7_100, (Style => Almost_Duration));
      Almost_Strict : constant Text_Result :=
        Natural_Duration
          (Support.En, 3_901, (Style => Almost_Duration),
           (Round_Up_Threshold_Percent => 75,
            Larger_Unit_Threshold_Percent => 70));
      Over_Text : constant Text_Result :=
        Natural_Duration (Support.En, 3_901, (Style => Over_Duration));
      Just_Over_Weeks : constant Text_Result :=
        Natural_Duration
          (Support.En, 22 * 86_400, (Style => Just_Over_Duration));
      Little_Under_Month : constant Text_Result :=
        Natural_Duration
          (Support.En, 29 * 86_400, (Style => Little_Under_Duration));
      Little_Under_Custom : constant Text_Result :=
        Natural_Duration
          (Support.En, 20 * 86_400, (Style => Little_Under_Duration),
           (Round_Up_Threshold_Percent => 1,
            Larger_Unit_Threshold_Percent => 50));
      Little_Under_Strict : constant Text_Result :=
        Natural_Duration
          (Support.En, 29 * 86_400, (Style => Little_Under_Duration),
           (Round_Up_Threshold_Percent => 1,
            Larger_Unit_Threshold_Percent => 99));
      Approx_Half : constant Text_Result :=
        Natural_Duration (Support.En, 1_800, (Style => Approximate_Duration));
      Few_Text : constant Text_Result :=
        Natural_Duration (Support.En, 45, (Style => Few_Duration));
      Approx_Month : constant Text_Result :=
        Natural_Duration
          (Support.En, 75 * 86_400, (Style => Approximate_Duration));
      Detailed_Text : constant Text_Result :=
        Natural_Duration_Detailed
          (Support.En, 3_930,
           (Max_Components => 2,
            Round_To_Minutes => True,
            Prefix => Approximate_Duration));
      Accessible : constant Text_Result :=
        Accessible_Progress (Support.En, 3, 10);
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
      Buffer : String (1 .. 32);
      Written : Natural;
      Code : Status_Code;
   begin
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
        (Natural_Text.Status = Ok
         and then Support.Text (Natural_Text) = "less than a minute",
         "natural less-than duration");
      AUnit.Assertions.Assert
        (Half_Text.Status = Ok and then Support.Text (Half_Text) = "half an hour",
         "natural half-hour duration");
      AUnit.Assertions.Assert
        (Brief_Text.Status = Ok and then Support.Text (Brief_Text) = "1 hr 05 min",
         "brief natural duration");
      AUnit.Assertions.Assert
        (Precise_Brief.Status = Ok
         and then Support.Text (Precise_Brief) = "1 hr 05 min 30 sec",
         "precise brief natural duration");
      AUnit.Assertions.Assert
        (Almost_Text.Status = Ok
         and then Support.Text (Almost_Text) = "almost 2 hours",
         "almost natural duration");
      AUnit.Assertions.Assert
        (Almost_Strict.Status = Ok
         and then Support.Text (Almost_Strict) = "almost 1 hour",
         "almost natural duration with strict round-up threshold");
      AUnit.Assertions.Assert
        (Over_Text.Status = Ok
         and then Support.Text (Over_Text) = "over 1 hour",
         "over natural duration");
      AUnit.Assertions.Assert
        (Just_Over_Weeks.Status = Ok
         and then Support.Text (Just_Over_Weeks) = "just over 3 weeks",
         "just-over natural duration");
      AUnit.Assertions.Assert
        (Little_Under_Month.Status = Ok
         and then Support.Text (Little_Under_Month) = "a little under 1 month",
         "little-under natural duration");
      AUnit.Assertions.Assert
        (Little_Under_Custom.Status = Ok
         and then Support.Text (Little_Under_Custom) = "a little under 1 month",
         "little-under natural duration with custom larger-unit threshold");
      AUnit.Assertions.Assert
        (Little_Under_Strict.Status = Ok
         and then Support.Text (Little_Under_Strict) = "a little under 5 weeks",
         "little-under natural duration with strict larger-unit threshold");
      AUnit.Assertions.Assert
        (Approx_Half.Status = Ok
         and then Support.Text (Approx_Half) = "about half an hour",
         "approximate half-hour duration");
      AUnit.Assertions.Assert
        (Few_Text.Status = Ok and then Support.Text (Few_Text) = "a few seconds",
         "few natural duration");
      AUnit.Assertions.Assert
        (Approx_Month.Status = Ok
         and then Support.Text (Approx_Month) = "about 2 months",
         "approximate natural duration with months");
      AUnit.Assertions.Assert
        (Detailed_Text.Status = Ok
         and then Support.Text (Detailed_Text) = "about 1 hour and 6 minutes",
         "detailed natural duration");
      AUnit.Assertions.Assert
        (Accessible.Status = Ok
         and then Support.Text (Accessible) = "3 of 10 complete, 30 percent",
         "accessible progress phrase");
      AUnit.Assertions.Assert
        (Business_Date.Status = Ok
         and then Support.Text (Business_Date) = "2026-07-06",
         "business-day arithmetic skips weekends");
      AUnit.Assertions.Assert
        (Holiday_Date.Status = Ok
         and then Support.Text (Holiday_Date) = "2026-07-07",
         "business-day arithmetic skips configured holidays");
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
      Retry_In_Into (Support.En, 10, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "retrying in 10 seconds",
         "bounded retry phrase");
      Natural_Duration_Into (Support.En, 30, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "less than a minute",
         "bounded natural duration");
      Natural_Duration_Into
        (Support.En, 20 * 86_400, Buffer, Written, Code,
         (Style => Little_Under_Duration),
         (Round_Up_Threshold_Percent => 1,
          Larger_Unit_Threshold_Percent => 50));
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "a little under 1 month",
         "bounded natural duration with custom approximation thresholds");
   end Test_Compact_And_Clock;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize duration tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Negative'Access, "negative -> Invalid_Value");
      Register_Routine (T, Test_Whole_Units'Access, "single largest unit");
      Register_Routine (T, Test_Multi_Unit'Access, "multi-unit components");
      Register_Routine (T, Test_Multi_Unit_Errors'Access,
        "multi-unit validation");
      Register_Routine (T, Test_Multi_Bounded'Access, "bounded multi-unit");
      Register_Routine (T, Test_Invalid_Options'Access,
        "invalid unit combination -> Invalid_Options");
      Register_Routine (T, Test_Precise'Access,
        "precise subsecond durations");
      Register_Routine (T, Test_Compact_And_Clock'Access,
        "compact and clock durations");
   end Register_Tests;

end Humanize.Tests.Durations;
