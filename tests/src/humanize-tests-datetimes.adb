with AUnit.Assertions;

with Ada.Calendar;
with I18N.Runtime;

with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Datetimes is

   use Ada.Calendar;
   use Humanize.Datetimes;
   use Humanize.Status;

   LF : constant String := [1 => ASCII.LF];

   --  Reference times.
   Noon     : constant Time := Time_Of (2026, 3, 21, Day_Duration (43_200));
   Late     : constant Time := Time_Of (2026, 3, 21, Day_Duration (85_800)); -- 23:50
   Early    : constant Time := Time_Of (2026, 3, 21, Day_Duration (600));    -- 00:10

   Elapsed_Opts : constant Datetime_Options :=
     (Style                 => Elapsed,
      Now_Threshold_Seconds => 0,
      Use_Calendar_Words    => False,
      Prefer_Weeks          => True,
      Prefer_Months         => True);

   --  Fallback fixture: a runtime that has the generic relative.day.past key
   --  but NOT the calendar day.previous key, so fallback must kick in.
   Fallback_Runtime : aliased I18N.Runtime.Instance;
   Fallback_Loaded  : Boolean := False;

   procedure Ensure_Fallback is
      Result : I18N.Runtime.Load_Result;
   begin
      if not Fallback_Loaded then
         I18N.Runtime.Load_Text
           (Fallback_Runtime, "partial",
            "en.humanize.datetime.relative.day.past = "
            & "{count, plural, one {# day ago} other {# days ago}}" & LF,
            Result);
         Fallback_Loaded := True;
      end if;
   end Ensure_Fallback;

   procedure Check
     (Context   : Humanize.Contexts.Context;
      Value     : Time;
      Reference : Time;
      Options   : Datetime_Options;
      Expected  : String;
      Message   : String)
   is
      Result : constant Text_Result := Relative (Context, Value, Reference, Options);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_Now (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Support.En, Noon - Duration (10), Noon,
             Default_Datetime_Options, "now", "10s within threshold is now");
   end Test_Now;

   procedure Test_Yesterday_Auto (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Value : constant Time := Time_Of (2026, 3, 20, Day_Duration (86_100)); -- 23:55
   begin
      Check (Support.En, Value, Early, Default_Datetime_Options,
             "yesterday", "Auto crossing midnight is yesterday");
   end Test_Yesterday_Auto;

   procedure Test_Tomorrow_Auto (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Value : constant Time := Time_Of (2026, 3, 22, Day_Duration (300));    -- 00:05
   begin
      Check (Support.En, Value, Late, Default_Datetime_Options,
             "tomorrow", "Auto crossing midnight forward is tomorrow");
   end Test_Tomorrow_Auto;

   procedure Test_Today_Calendar (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Value : constant Time := Time_Of (2026, 3, 21, Day_Duration (28_800)); -- 08:00
      Opts  : constant Datetime_Options :=
        (Style => Calendar, Now_Threshold_Seconds => 45,
         Use_Calendar_Words => True, Prefer_Weeks => True, Prefer_Months => True);
   begin
      Check (Support.En, Value, Noon, Opts, "today",
             "Calendar style same day is today");
   end Test_Today_Calendar;

   procedure Test_Same_Day_Hours_Ago_Auto (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Value : constant Time := Time_Of (2026, 3, 21, Day_Duration (28_800)); -- 08:00
   begin
      Check (Support.En, Value, Noon, Default_Datetime_Options,
             "4 hours ago", "Auto same-day non-now uses elapsed units");
   end Test_Same_Day_Hours_Ago_Auto;

   procedure Test_Elapsed_Disables_Calendar (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Value : constant Time := Time_Of (2026, 3, 20, Day_Duration (86_100)); -- 23:55
      Opts  : constant Datetime_Options :=
        (Style => Elapsed, Now_Threshold_Seconds => 45,
         Use_Calendar_Words => True, Prefer_Weeks => True, Prefer_Months => True);
   begin
      Check (Support.En, Value, Early, Opts, "15 minutes ago",
             "Elapsed style never uses yesterday");
   end Test_Elapsed_Disables_Calendar;

   procedure Test_Seconds (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Support.En, Noon - Duration (1), Noon, Elapsed_Opts,
             "1 second ago", "one-second plural");
      Check (Support.En, Noon - Duration (50), Noon, Elapsed_Opts,
             "50 seconds ago", "other-second plural");
   end Test_Seconds;

   procedure Test_Minutes (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Support.En, Noon - Duration (120), Noon, Elapsed_Opts,
             "2 minutes ago", "minutes past");
   end Test_Minutes;

   procedure Test_Hours (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Support.En, Noon - Duration (7_200), Noon, Elapsed_Opts,
             "2 hours ago", "hours past");
   end Test_Hours;

   procedure Test_Days (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Support.En, Noon - Duration (3 * 86_400), Noon, Elapsed_Opts,
             "3 days ago", "days past");
   end Test_Days;

   procedure Test_Weeks (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Support.En, Noon - Duration (14 * 86_400), Noon, Elapsed_Opts,
             "2 weeks ago", "weeks past");
   end Test_Weeks;

   procedure Test_Months (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Support.En, Noon - Duration (60 * 86_400), Noon, Elapsed_Opts,
             "2 months ago", "months past");
   end Test_Months;

   procedure Test_Years (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Support.En, Noon - Duration (800 * 86_400), Noon, Elapsed_Opts,
             "2 years ago", "years past");
   end Test_Years;

   procedure Test_Future (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Support.En, Noon + Duration (1), Noon, Elapsed_Opts,
             "in 1 second", "future seconds (one)");
      Check (Support.En, Noon + Duration (30), Noon, Elapsed_Opts,
             "in 30 seconds", "future seconds (other)");
      Check (Support.En, Noon + Duration (120), Noon, Elapsed_Opts,
             "in 2 minutes", "future minutes");
      Check (Support.En, Noon + Duration (7_200), Noon, Elapsed_Opts,
             "in 2 hours", "future hours");
      Check (Support.En, Noon + Duration (3 * 86_400), Noon, Elapsed_Opts,
             "in 3 days", "future days");
   end Test_Future;

   procedure Test_Determinism (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      A : constant Text_Result :=
        Relative (Support.En, Noon - Duration (7_200), Noon, Elapsed_Opts);
      B : constant Text_Result :=
        Relative (Support.En, Noon - Duration (7_200), Noon, Elapsed_Opts);
   begin
      AUnit.Assertions.Assert
        (Support.Text (A) = Support.Text (B) and then A.Status = B.Status,
         "explicit-reference rendering is deterministic");
   end Test_Determinism;

   procedure Test_Calendar_Fallback (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Value : constant Time := Time_Of (2026, 3, 20, Day_Duration (86_100)); -- 23:55
   begin
      Ensure_Fallback;
      declare
         Ctx : constant Humanize.Contexts.Context :=
           Humanize.Contexts.Create (Fallback_Runtime'Access, "en");
      begin
         Check (Ctx, Value, Early, Default_Datetime_Options, "1 day ago",
                "missing day.previous falls back to relative.day.past count 1");
      end;
   end Test_Calendar_Fallback;

   procedure Test_Civil (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Ref   : constant Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, Hour => 0, Minute => 10,
         Second => 0);
      Value : constant Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 20, Hour => 23, Minute => 55,
         Second => 0);
      Yesterday : constant Text_Result :=
        Relative_Civil (Support.En, Value, Ref, Default_Datetime_Options);
      Bad : constant Text_Result :=
        Relative_Civil
          (Support.En,
           (Year => 2026, Month => 2, Day => 30, others => 0),  -- no Feb 30
           Ref, Default_Datetime_Options);
   begin
      AUnit.Assertions.Assert
        (Yesterday.Status = Ok and then Support.Text (Yesterday) = "yesterday",
         "civil components humanize like the Ada.Calendar API");
      AUnit.Assertions.Assert
        (Bad.Status = Invalid_Value,
         "an impossible civil date is Invalid_Value, got "
         & Status_Image (Bad.Status));
   end Test_Civil;

   procedure Test_Civil_Into (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Now_Time : constant Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, others => 0);
      Buffer   : String (1 .. 16);
      Written  : Natural;
      Code     : Status_Code;
   begin
      Relative_Civil_Into
        (Support.En, Now_Time, Now_Time, Buffer, Written, Code,
         Default_Datetime_Options);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "now",
         "civil bounded render, status " & Status_Image (Code));
   end Test_Civil_Into;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize datetime tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Now'Access, "now threshold");
      Register_Routine (T, Test_Yesterday_Auto'Access, "yesterday (Auto)");
      Register_Routine (T, Test_Tomorrow_Auto'Access, "tomorrow (Auto)");
      Register_Routine (T, Test_Today_Calendar'Access, "today (Calendar)");
      Register_Routine (T, Test_Same_Day_Hours_Ago_Auto'Access,
        "same-day hours ago (Auto)");
      Register_Routine (T, Test_Elapsed_Disables_Calendar'Access,
        "Elapsed disables calendar words");
      Register_Routine (T, Test_Seconds'Access, "seconds ago");
      Register_Routine (T, Test_Minutes'Access, "minutes ago");
      Register_Routine (T, Test_Hours'Access, "hours ago");
      Register_Routine (T, Test_Days'Access, "days ago");
      Register_Routine (T, Test_Weeks'Access, "weeks ago");
      Register_Routine (T, Test_Months'Access, "months ago");
      Register_Routine (T, Test_Years'Access, "years ago");
      Register_Routine (T, Test_Future'Access, "future units");
      Register_Routine (T, Test_Determinism'Access, "explicit reference determinism");
      Register_Routine (T, Test_Calendar_Fallback'Access, "calendar semantic fallback");
      Register_Routine (T, Test_Civil'Access, "civil date/time components");
      Register_Routine (T, Test_Civil_Into'Access, "civil bounded render");
   end Register_Tests;

end Humanize.Tests.Datetimes;
