with AUnit.Assertions;

with Ada.Calendar;

with Humanize.Contexts;
with Humanize.Durations;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Durations is

   use Humanize.Durations;
   use Humanize.Status;

   U_A_Grave : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A0#);

   function U (Code : Natural) return String is
   begin
      if Code <= 16#7F# then
         return String'(1 => Character'Val (Code));
      elsif Code <= 16#7FF# then
         return Character'Val (16#C0# + Code / 64)
           & Character'Val (16#80# + Code mod 64);
      elsif Code <= 16#FFFF# then
         return Character'Val (16#E0# + Code / 4_096)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      else
         return Character'Val (16#F0# + Code / 262_144)
           & Character'Val (16#80# + (Code / 4_096) mod 64)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      end if;
   end U;

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
      Info : constant Duration_Render_Metadata := Format_Metadata (3_661);
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
      AUnit.Assertions.Assert
        (Info.Status = Ok
         and then Info.Hours = 1
         and then Info.Minutes = 1
         and then Info.Seconds = 1
         and then Info.Component_Count = 3,
         "duration render metadata");
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
      Weekday_Schedule : constant Text_Result :=
        Schedule
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
            Use_12_Hour => False));
      Danish_Weekday_Schedule : constant Text_Result :=
        Schedule
          (Support.Da,
           (Kind        => Schedule_Weekday_Set,
            Every       => 1,
            Unit        => Every_Week,
            Weekday     => 0,
            Weekdays    => Weekdays,
            Ordinal     => 0,
            Has_Time    => True,
            Hour        => 9,
            Minute      => 0,
            Use_12_Hour => False));
      German_Ordinal_Schedule : constant Text_Result :=
        Schedule
          (Support.De,
           (Kind        => Schedule_Ordinal_Weekday,
            Every       => 1,
            Unit        => Every_Month,
            Weekday     => 1,
            Weekdays    => Every_Day_Set,
            Ordinal     => 1,
            Has_Time    => True,
            Hour        => 9,
            Minute      => 30,
            Use_12_Hour => False));
      German_Regional_Ordinal_Schedule : constant Text_Result :=
        Schedule
          (Support.Locale ("DE_at"),
           (Kind        => Schedule_Ordinal_Weekday,
            Every       => 1,
            Unit        => Every_Month,
            Weekday     => 1,
            Weekdays    => Every_Day_Set,
            Ordinal     => 1,
            Has_Time    => True,
            Hour        => 9,
            Minute      => 30,
            Use_12_Hour => False));
      Italian_Ordinal_Schedule : constant Text_Result :=
        Schedule
          (Support.It,
           (Kind        => Schedule_Ordinal_Weekday,
            Every       => 1,
            Unit        => Every_Month,
            Weekday     => 1,
            Weekdays    => Every_Day_Set,
            Ordinal     => 1,
            Has_Time    => True,
            Hour        => 9,
            Minute      => 30,
            Use_12_Hour => False));
      Swedish_Custom_Weekdays : constant Text_Result :=
        Schedule
          (Support.Locale ("sv"),
           (Kind        => Schedule_Weekday_Set,
            Every       => 1,
            Unit        => Every_Week,
            Weekday     => 0,
            Weekdays    =>
              [1 => True, 2 => False, 3 => True, 4 => False,
               5 => False, 6 => False, 7 => False],
            Ordinal     => 0,
            Has_Time    => False,
            Hour        => 0,
            Minute      => 0,
            Use_12_Hour => False));
      French_Weekday_Schedule : constant Text_Result :=
        Cron_Schedule (Support.Fr, "0", "9", "*", "*", "1-5");
      French_Regional_Weekday_Schedule : constant Text_Result :=
        Cron_Schedule (Support.Locale ("FR_ca"), "0", "9", "*", "*", "1-5");
      Spanish_Weekday_Schedule : constant Text_Result :=
        Cron_Schedule (Support.Es, "0", "9", "*", "*", "1-5");
      Ordinal_Schedule : constant Text_Result :=
        Schedule
          (Support.En,
           (Kind        => Schedule_Ordinal_Weekday,
            Every       => 1,
            Unit        => Every_Month,
            Weekday     => 1,
            Weekdays    => Every_Day_Set,
            Ordinal     => 1,
            Has_Time    => True,
            Hour        => 9,
            Minute      => 30,
            Use_12_Hour => False));
      Cron_Minutely : constant Text_Result :=
        Cron_Schedule (Support.En, "*", "*", "*", "*", "*");
      Cron_Daily : constant Text_Result :=
        Cron_Schedule (Support.En, "0", "9", "*", "*", "*");
      Cron_Hourly : constant Text_Result :=
        Cron_Schedule (Support.En, "15", "*", "*", "*", "*");
      Cron_Weekday : constant Text_Result :=
        Cron_Schedule (Support.En, "0", "9", "*", "*", "1-5");
      Biweekly_Monday : constant Text_Result :=
        Schedule
          (Support.En,
           (Kind        => Schedule_Weekday,
            Every       => 2,
            Unit        => Every_Week,
            Weekday     => 1,
            Weekdays    => Every_Day_Set,
            Ordinal     => 0,
            Has_Time    => True,
            Hour        => 9,
            Minute      => 0,
            Use_12_Hour => False));
      Weekly_Helper : constant Text_Result :=
        Weekly_Schedule
          (Support.En,
           [1 => True, 2 => False, 3 => True, 4 => False,
            5 => False, 6 => False, 7 => False],
           Every => 2);
      Every_Other_Helper : constant Text_Result :=
        Every_Other_Weekday_Schedule
          (Support.En, 1, Has_Time => True, Hour => 9, Minute => 0);
      Monthly_Day_Helper : constant Text_Result :=
        Monthly_Day_Schedule
          (Support.En, 15, Has_Time => True, Hour => 8, Minute => 30);
      Finnish_Regional_Monthly_Day : constant Text_Result :=
        Monthly_Day_Schedule
          (Support.Locale ("FI_fi"), 15, Has_Time => True, Hour => 8, Minute => 30);
      Last_Business_Helper : constant Text_Result :=
        Last_Business_Day_Schedule
          (Support.En, Has_Time => True, Hour => 17, Minute => 0);
      Second_Business_Helper : constant Text_Result :=
        Business_Day_Schedule
          (Support.En, 2, Has_Time => True, Hour => 10, Minute => 15);
      Invalid_Business_Helper : constant Text_Result :=
        Business_Day_Schedule (Support.En, 0);
      Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.En, "30", "8", "15", "*", "*");
      Finnish_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("fi"), "30", "8", "15", "*", "*");
      Polish_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("pl"), "30", "8", "15", "*", "*");
      Japanese_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("ja"), "30", "8", "15", "*", "*");
      Japanese_Regional_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("JA_jp"), "30", "8", "15", "*", "*");
      Korean_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("ko"), "30", "8", "15", "*", "*");
      Korean_Regional_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("KO_kr"), "30", "8", "15", "*", "*");
      Chinese_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("zh"), "30", "8", "15", "*", "*");
      Chinese_Regional_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("ZH_cn"), "30", "8", "15", "*", "*");
      Natural_Text : constant Text_Result :=
        Natural_Duration (Support.En, 30);
      Rails_Text : constant Text_Result :=
        Natural_Duration (Support.En, 20, Threshold_Rails);
      Conversational_Text : constant Text_Result :=
        Natural_Duration (Support.En, 59 * 60, Threshold_Conversational);
      Distance_Past : constant Text_Result :=
        Duration_Distance
          (Support.En, 3 * 86_400, Duration_Distance_Past,
           Threshold_Django);
      Distance_Future : constant Text_Result :=
        Duration_Distance
          (Support.En, 400 * 86_400, Duration_Distance_Future,
           Threshold_Rails);
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
        (Weekday_Schedule.Status = Ok
         and then Support.Text (Weekday_Schedule) = "every weekday at 09:00",
         "weekday schedule phrase");
      AUnit.Assertions.Assert
        (Danish_Weekday_Schedule.Status = Ok
         and then Support.Text (Danish_Weekday_Schedule)
           = "hver hverdag kl. 09:00",
         "localized Danish weekday schedule phrase");
      AUnit.Assertions.Assert
        (German_Ordinal_Schedule.Status = Ok
         and then Support.Text (German_Ordinal_Schedule)
           = "erster Montag jedes Monats um 09:30",
         "localized German ordinal weekday schedule phrase");
      AUnit.Assertions.Assert
        (German_Regional_Ordinal_Schedule.Status = Ok
         and then Support.Text (German_Regional_Ordinal_Schedule)
           = "erster Montag jedes Monats um 09:30",
         "regional German schedule uses language-code fallback");
      AUnit.Assertions.Assert
        (Italian_Ordinal_Schedule.Status = Ok
         and then Support.Text (Italian_Ordinal_Schedule)
           = "primo luned" & Character'Val (16#C3#) & Character'Val (16#AC#)
             & " di ogni mese alle 09:30",
         "localized Italian ordinal weekday schedule phrase");
      AUnit.Assertions.Assert
        (Swedish_Custom_Weekdays.Status = Ok
         and then Support.Text (Swedish_Custom_Weekdays)
           = "varje m" & Character'Val (16#C3#) & Character'Val (16#A5#)
             & "ndag och onsdag",
         "localized Swedish custom weekday conjunction");
      AUnit.Assertions.Assert
        (French_Weekday_Schedule.Status = Ok
         and then Support.Text (French_Weekday_Schedule)
           = "chaque jour ouvrable " & U_A_Grave & " 09:00",
         "localized French cron weekday schedule phrase");
      AUnit.Assertions.Assert
        (French_Regional_Weekday_Schedule.Status = Ok
         and then Support.Text (French_Regional_Weekday_Schedule)
           = "chaque jour ouvrable " & U_A_Grave & " 09:00",
         "regional French cron schedule uses language-code fallback");
      AUnit.Assertions.Assert
        (Spanish_Weekday_Schedule.Status = Ok
         and then Support.Text (Spanish_Weekday_Schedule)
           = "cada d" & Character'Val (16#C3#) & Character'Val (16#AD#)
             & "a laborable a las 09:00",
         "localized Spanish cron weekday schedule phrase");
      AUnit.Assertions.Assert
        (Ordinal_Schedule.Status = Ok
         and then Support.Text (Ordinal_Schedule)
           = "first Monday of each month at 09:30",
         "ordinal weekday schedule phrase");
      AUnit.Assertions.Assert
        (Cron_Minutely.Status = Ok
         and then Support.Text (Cron_Minutely) = "every minute",
         "cron minutely schedule phrase");
      AUnit.Assertions.Assert
        (Cron_Daily.Status = Ok
         and then Support.Text (Cron_Daily) = "every day at 09:00",
         "cron daily schedule phrase");
      AUnit.Assertions.Assert
        (Cron_Hourly.Status = Ok
         and then Support.Text (Cron_Hourly) = "every hour at minute 15",
         "cron hourly schedule phrase");
      AUnit.Assertions.Assert
        (Cron_Weekday.Status = Ok
         and then Support.Text (Cron_Weekday) = "every weekday at 09:00",
         "cron weekday schedule phrase");
      AUnit.Assertions.Assert
        (Biweekly_Monday.Status = Ok
         and then Support.Text (Biweekly_Monday)
           = "every 2 weeks on Monday at 09:00",
         "biweekly weekday schedule phrase");
      AUnit.Assertions.Assert
        (Weekly_Helper.Status = Ok
         and then Support.Text (Weekly_Helper)
           = "every 2 weeks on Monday and Wednesday",
         "weekly helper schedule phrase");
      AUnit.Assertions.Assert
        (Every_Other_Helper.Status = Ok
         and then Support.Text (Every_Other_Helper)
           = "every 2 weeks on Monday at 09:00",
         "every-other weekday helper schedule phrase");
      AUnit.Assertions.Assert
        (Monthly_Day_Helper.Status = Ok
         and then Support.Text (Monthly_Day_Helper)
           = "day 15 of each month at 08:30",
         "monthly day helper schedule phrase");
      AUnit.Assertions.Assert
        (Finnish_Regional_Monthly_Day.Status = Ok
         and then Support.Text (Finnish_Regional_Monthly_Day)
           = "p" & Character'Val (16#C3#) & Character'Val (16#A4#)
             & "iv" & Character'Val (16#C3#) & Character'Val (16#A4#)
             & " 15 joka kuukausi klo 08:30",
         "regional Finnish monthly schedule uses language-code fallback");
      AUnit.Assertions.Assert
        (Last_Business_Helper.Status = Ok
         and then Support.Text (Last_Business_Helper)
           = "last business day of each month at 17:00",
         "last business day helper schedule phrase");
      AUnit.Assertions.Assert
        (Second_Business_Helper.Status = Ok
         and then Support.Text (Second_Business_Helper)
           = "second business day of each month at 10:15",
         "ordinal business day helper schedule phrase");
      AUnit.Assertions.Assert
        (Invalid_Business_Helper.Status = Invalid_Argument,
         "invalid ordinal business day helper");
      AUnit.Assertions.Assert
        (Cron_Monthly.Status = Ok
         and then Support.Text (Cron_Monthly)
           = "day 15 of each month at 08:30",
         "cron monthly schedule phrase");
      AUnit.Assertions.Assert
        (Finnish_Cron_Monthly.Status = Ok
         and then Support.Text (Finnish_Cron_Monthly)
           = "p" & Character'Val (16#C3#) & Character'Val (16#A4#)
             & "iv" & Character'Val (16#C3#) & Character'Val (16#A4#)
             & " 15 joka kuukausi klo 08:30",
         "localized Finnish cron monthly schedule phrase");
      AUnit.Assertions.Assert
        (Polish_Cron_Monthly.Status = Ok
         and then Support.Text (Polish_Cron_Monthly)
           = "15. dzie" & U (16#144#) & " ka" & U (16#17C#)
             & "dego miesi" & U (16#105#) & "ca o 08:30",
         "localized Polish cron monthly schedule phrase");
      AUnit.Assertions.Assert
        (Japanese_Cron_Monthly.Status = Ok
         and then Japanese_Regional_Cron_Monthly.Status = Ok
         and then Support.Text (Japanese_Regional_Cron_Monthly) =
           Support.Text (Japanese_Cron_Monthly),
         "regional Japanese cron schedule uses normalized CJK time branch");
      AUnit.Assertions.Assert
        (Korean_Cron_Monthly.Status = Ok
         and then Korean_Regional_Cron_Monthly.Status = Ok
         and then Support.Text (Korean_Regional_Cron_Monthly) =
           Support.Text (Korean_Cron_Monthly),
         "regional Korean cron schedule uses normalized CJK time branch");
      AUnit.Assertions.Assert
        (Chinese_Cron_Monthly.Status = Ok
         and then Chinese_Regional_Cron_Monthly.Status = Ok
         and then Support.Text (Chinese_Regional_Cron_Monthly) =
           Support.Text (Chinese_Cron_Monthly),
         "regional Chinese cron schedule uses normalized CJK time branch");
      AUnit.Assertions.Assert
        (Natural_Text.Status = Ok
         and then Support.Text (Natural_Text) = "less than a minute",
         "natural less-than duration");
      AUnit.Assertions.Assert
        (Rails_Text.Status = Ok
         and then Support.Text (Rails_Text) = "a few seconds",
         "Rails-style short natural duration");
      AUnit.Assertions.Assert
        (Conversational_Text.Status = Ok
         and then Support.Text (Conversational_Text)
           = "a little under 1 hour",
         "conversational under-threshold duration");
      AUnit.Assertions.Assert
        (Distance_Past.Status = Ok
         and then Support.Text (Distance_Past) = "3 days ago",
         "past duration distance");
      AUnit.Assertions.Assert
        (Distance_Future.Status = Ok
         and then Support.Text (Distance_Future) = "in over 1 year",
         "future duration distance");
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
      Natural_Duration_Into
        (Support.En, 20, Buffer, Written, Code, Threshold_Rails);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "a few seconds",
         "bounded threshold preset natural duration");
      Duration_Distance_Into
        (Support.En, 3 * 86_400, Buffer, Written, Code,
         Duration_Distance_Past, Threshold_Django);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "3 days ago",
         "bounded duration distance");
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
