separate (Humanize.Tests.Compatibility)
   procedure Test_Common_Datetime_And_Duration
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Reference : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 3, 21, 43_200.0);
   begin
      Check
        (Humanize.Datetimes.Relative
           (Support.En, Reference, Reference),
         "now",
         "relative now");
      Check
        (Humanize.Datetimes.Relative
           (Support.En, Reference - Duration (3_600.0), Reference),
         "1 hour ago",
         "relative past hour");
      Check
        (Humanize.Datetimes.Relative
           (Support.En, Reference + Duration (86_400.0), Reference),
         "tomorrow",
         "relative tomorrow");
      Check
        (Humanize.Datetimes.Relative
           (Support.En,
            Reference - Duration (5_400.0),
            Reference,
            (Style => Humanize.Datetimes.Elapsed,
             Now_Threshold_Seconds => 0,
             Use_Calendar_Words => False,
             Prefer_Weeks => True,
             Prefer_Months => True,
             Rounding => Humanize.Datetimes.Round_Down,
             Max_Units => 2,
             Calendar_Words_Only => False)),
         "1 hour and 30 minutes ago",
         "relative two-unit elapsed");
      Check
        (Humanize.Durations.Format (Support.En, 90),
         "1 minute",
         "duration largest unit");
      Check
        (Humanize.Durations.Format_Components (Support.En, 3_661, 3),
         "1 hour, 1 minute and 1 second",
         "duration multi-unit");
      Check
        (Humanize.Durations.Format_Compact (Support.En, 5_405, 2),
         "1h 30m",
         "duration compact");
      Check
        (Humanize.Durations.Format_Clock (Support.En, 5_405),
         "01:30:05",
         "duration clock");
      Check
        (Humanize.Durations.Natural_Duration (Support.En, 1_800),
         "half an hour",
         "natural duration");
   end Test_Common_Datetime_And_Duration;
