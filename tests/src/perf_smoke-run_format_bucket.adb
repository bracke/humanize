with Ada.Calendar;

with Humanize.Bytes;
with Humanize.Colors;
with Humanize.Colors.Contrast;
with Humanize.Datetimes;
with Humanize.Durations;
with Humanize.Durations.Formatting;
with Humanize.Numbers;
with Humanize.Numbers.Editorial;
with Humanize.Numbers.Ranges;
with Humanize.Numbers.Scales;
with Humanize.Numbers.Spellout;
with Humanize.Numbers.Statistics;
with Humanize.Units;

separate (Perf_Smoke)
   procedure Run_Format_Bucket
     (Context : Humanize.Contexts.Context;
      Started : out Ada.Calendar.Time;
      Stopped : out Ada.Calendar.Time)
   is
   begin
      Started := Ada.Calendar.Clock;
      for I in 1 .. Iterations loop
         declare
            Bytes : constant Humanize.Status.Text_Result :=
              Humanize.Bytes.Format (Context, 1_536);
            Duration_Text : constant Humanize.Status.Text_Result :=
              Humanize.Durations.Format (Context, 90);
            Duration_Compact : constant Humanize.Status.Text_Result :=
              Humanize.Durations.Formatting.Format_Compact
                (Context, 5_430, Max_Components => 3);
            Duration_Clock : constant Humanize.Status.Text_Result :=
              Humanize.Durations.Formatting.Format_Clock (Context, 5_430);
            Number_Text : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Compact (Context, 1_200_000);
            Editorial_Text : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Editorial.Editorial_Number (Context, 9);
            Range_Text : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Ranges.Between (Context, 3, 7);
            Scale_Text : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Scales.SI_Prefix (Context, 1_500.0, "m");
            Spellout_Text : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Spellout.Ordinal_Words (Context, 21);
            Stats_Text : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Statistics.Outlier_Summary_Label (2, 100);
            Reference : constant Ada.Calendar.Time :=
              Ada.Calendar.Time_Of (2026, 7, 18, 12.0 * 3_600.0);
            Relative_Text : constant Humanize.Status.Text_Result :=
              Humanize.Datetimes.Relative
                (Context, Reference - 3_600.0, Reference);
            Black : constant Humanize.Colors.RGB_Color :=
              (Red => 0, Green => 0, Blue => 0);
            White : constant Humanize.Colors.RGB_Color :=
              (Red => 255, Green => 255, Blue => 255);
            Contrast_Text : constant Humanize.Status.Text_Result :=
              Humanize.Colors.Contrast.Contrast_Label
                (Context, Black, White);
            Unit_Length : constant Humanize.Status.Text_Result :=
              Humanize.Units.Format_Length (Context, 1_500.0);
            Unit_CSS : constant Humanize.Status.Text_Result :=
              Humanize.Units.Format_CSS_Length (Context, 1.5, "rem");
         begin
            Check_Status (Bytes.Status, "bytes format");
            Check_Status (Duration_Text.Status, "duration format");
            Check_Status (Duration_Compact.Status, "duration compact format");
            Check_Status (Duration_Clock.Status, "duration clock format");
            Check_Status (Number_Text.Status, "compact format");
            Check_Status (Editorial_Text.Status, "editorial number format");
            Check_Status (Range_Text.Status, "number range format");
            Check_Status (Scale_Text.Status, "number scale format");
            Check_Status (Spellout_Text.Status, "number spellout format");
            Check_Status (Stats_Text.Status, "number statistics format");
            Check_Status (Relative_Text.Status, "relative datetime format");
            Check_Status (Contrast_Text.Status, "contrast label format");
            Check_Status (Unit_Length.Status, "unit length format");
            Check_Status (Unit_CSS.Status, "unit css length format");
            Total := Total + I mod 3;
         end;
      end loop;
      Stopped := Ada.Calendar.Clock;
   end Run_Format_Bucket;
