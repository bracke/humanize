with Ada.Calendar;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with AUnit.Assertions;

with Humanize.Bytes;
with Humanize.Colors;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Durations;
with Humanize.Frequencies;
with Humanize.Lists;
with Humanize.Numbers;
with Humanize.Parsing;
with Humanize.Phrases;
with Humanize.Rates;
with Humanize.Status;
with Humanize.Strings;
with Humanize.Tests.Support;
with Humanize.Units;

package body Humanize.Tests.Compatibility is

   use Humanize.Status;
   use type Ada.Calendar.Time;
   use type Humanize.Bytes.Byte_Count;
   use type Humanize.Colors.RGB_Color;
   use type Humanize.Durations.Duration_Microseconds;
   use type Humanize.Durations.Duration_Seconds;
   use type Humanize.Frequencies.Occurrence_Count;
   use type Humanize.Parsing.Selection_Summary_Kind;
   use type Humanize.Parsing.Validation_Severity_Label;
   use type Humanize.Phrases.Phrase_Severity;
   use type Humanize.Phrases.Phrase_Tone;
   use type Humanize.Phrases.Summary_Domain;
   use type Humanize.Phrases.Summary_State;
   use type Humanize.Rates.Rate_Period;
   use type Humanize.Strings.Inflection_Source;
   use type Humanize.Units.Unit_Kind;

   package Support renames Humanize.Tests.Support;

   type Locale_Code is
     (L_En, L_Da, L_De, L_Fr, L_Es, L_It, L_Pt, L_Nl, L_Sv, L_No, L_Nb,
      L_Fi, L_Pl, L_Cs, L_Tr, L_Ru, L_Uk, L_Ja, L_Ko, L_Zh, L_Ar, L_Hi);

   function Locale_Name (Code : Locale_Code) return String is
   begin
      case Code is
         when L_En => return "en";
         when L_Da => return "da";
         when L_De => return "de";
         when L_Fr => return "fr";
         when L_Es => return "es";
         when L_It => return "it";
         when L_Pt => return "pt";
         when L_Nl => return "nl";
         when L_Sv => return "sv";
         when L_No => return "no";
         when L_Nb => return "nb";
         when L_Fi => return "fi";
         when L_Pl => return "pl";
         when L_Cs => return "cs";
         when L_Tr => return "tr";
         when L_Ru => return "ru";
         when L_Uk => return "uk";
         when L_Ja => return "ja";
         when L_Ko => return "ko";
         when L_Zh => return "zh";
         when L_Ar => return "ar";
         when L_Hi => return "hi";
      end case;
   end Locale_Name;

   function Locale_Context
     (Code : Locale_Code)
      return Humanize.Contexts.Context
   is
   begin
      return Support.Locale (Locale_Name (Code));
   end Locale_Context;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Label    : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Label & " expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status "
         & Status_Image (Result.Status));
   end Check;

   procedure Check_Status
     (Result   : Text_Result;
      Expected : Status_Code;
      Label    : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Expected,
         Label & " expected status " & Status_Image (Expected)
         & " got " & Status_Image (Result.Status));
   end Check_Status;

   function Rendered
     (Result : Text_Result;
      Label  : String)
      return String
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok,
         Label & " render status " & Status_Image (Result.Status));
      return Support.Text (Result);
   end Rendered;

   procedure Check_Duration_Roundtrip
     (Context  : Humanize.Contexts.Context;
      Locale   : String;
      Seconds  : Humanize.Durations.Duration_Seconds;
      Label    : String)
   is
      Text : constant String :=
        Rendered (Humanize.Durations.Format (Context, Seconds), Label);
      Parsed : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration (Text);
   begin
      AUnit.Assertions.Assert
        (Parsed.Status = Ok and then Parsed.Value = Seconds,
         Locale & " " & Label & " roundtrip [" & Text & "]");
   end Check_Duration_Roundtrip;

   procedure Check_Duration_Components_Roundtrip
     (Context  : Humanize.Contexts.Context;
      Locale   : String;
      Seconds  : Humanize.Durations.Duration_Seconds;
      Label    : String)
   is
      Text : constant String :=
        Rendered
          (Humanize.Durations.Format_Components (Context, Seconds, 3),
           Label);
      Parsed : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration (Text);
   begin
      AUnit.Assertions.Assert
        (Parsed.Status = Ok and then Parsed.Value = Seconds,
         Locale & " " & Label & " components roundtrip [" & Text & "]");
   end Check_Duration_Components_Roundtrip;

   procedure Check_Bytes_Roundtrip
     (Context : Humanize.Contexts.Context;
      Locale  : String;
      Bytes   : Humanize.Bytes.Byte_Count;
      Label   : String)
   is
      Text : constant String :=
        Rendered (Humanize.Bytes.Format (Context, Bytes), Label);
      Parsed : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes (Text);
   begin
      AUnit.Assertions.Assert
        (Parsed.Status = Ok and then Parsed.Value = Bytes,
         Locale & " " & Label & " bytes roundtrip [" & Text & "]");
   end Check_Bytes_Roundtrip;

   procedure Check_Compact_Roundtrip
     (Context : Humanize.Contexts.Context;
      Locale  : String;
      Value   : Long_Long_Integer;
      Label   : String)
   is
      Text : constant String :=
        Rendered (Humanize.Numbers.Compact (Context, Value), Label);
      Parsed : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Compact_Number (Text);
   begin
      AUnit.Assertions.Assert
        (Parsed.Status = Ok and then Parsed.Value = Value,
         Locale & " " & Label & " compact roundtrip [" & Text & "]");
   end Check_Compact_Roundtrip;

   procedure Check_Percent_Roundtrip
     (Context : Humanize.Contexts.Context;
      Locale  : String;
      Value   : Long_Float;
      Rounded : Long_Long_Integer;
      Label   : String)
   is
      Text : constant String :=
        Rendered (Humanize.Numbers.Percent (Context, Value), Label);
      Parsed : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Percent (Text);
   begin
      AUnit.Assertions.Assert
        (Parsed.Status = Ok and then Parsed.Value = Rounded,
         Locale & " " & Label & " percent roundtrip [" & Text & "]");
   end Check_Percent_Roundtrip;

   procedure Check_Frequency_Roundtrip
     (Context : Humanize.Contexts.Context;
      Locale  : String;
      Count   : Humanize.Frequencies.Occurrence_Count;
      Label   : String)
   is
      Text : constant String :=
        Rendered (Humanize.Frequencies.Times (Context, Count), Label);
      Parsed : constant Humanize.Parsing.Frequency_Parse_Result :=
        Humanize.Parsing.Parse_Frequency (Text);
   begin
      AUnit.Assertions.Assert
        (Parsed.Status = Ok and then Parsed.Count = Count,
         Locale & " " & Label & " frequency roundtrip [" & Text & "]");
   end Check_Frequency_Roundtrip;

   procedure Check_Rate_Roundtrip
     (Context : Humanize.Contexts.Context;
      Locale  : String;
      Count   : Humanize.Frequencies.Occurrence_Count;
      Period  : Humanize.Rates.Rate_Period;
      Label   : String)
   is
      Text : constant String :=
        Rendered (Humanize.Rates.Pace_Approximate (Context, Count, Period),
                  Label);
      Parsed : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Parse_Rate (Text);
   begin
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Count = Count
         and then Parsed.Period = Period,
         Locale & " " & Label & " rate roundtrip [" & Text & "]");
   end Check_Rate_Roundtrip;

   procedure Check_Unit_Roundtrip
     (Context : Humanize.Contexts.Context;
      Locale  : String;
      Value   : Natural;
      Unit    : Humanize.Units.Unit_Kind;
      Label   : String)
   is
      Text : constant String :=
        Rendered (Humanize.Units.Format (Context, Value, Unit), Label);
      Parsed : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Text);
   begin
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Value = Long_Float (Value)
         and then Parsed.Unit = Unit,
         Locale & " " & Label & " unit roundtrip [" & Text & "]");
   end Check_Unit_Roundtrip;

   procedure Check_List_Roundtrip
     (Context : Humanize.Contexts.Context;
      Locale  : String)
   is
      Items : constant Humanize.Lists.Text_List :=
        [To_Unbounded_String ("alpha"),
         To_Unbounded_String ("beta"),
         To_Unbounded_String ("gamma")];
      Text : constant String :=
        Rendered (Humanize.Lists.Format (Context, Items),
                  Locale & " list render");
      Parsed : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Parse_List (Text);
   begin
      AUnit.Assertions.Assert
        (Parsed.Status = Ok and then Parsed.Count = 3,
         Locale & " list roundtrip [" & Text & "]");
   end Check_List_Roundtrip;

   procedure Check_Precise_Duration_Roundtrip
     (Micros : Humanize.Durations.Duration_Microseconds;
      Label  : String)
   is
      Text : constant String :=
        Rendered
          (Humanize.Durations.Format_Precise (Support.En, Micros, 2), Label);
      Parsed : constant Humanize.Parsing.Precise_Duration_Parse_Result :=
        Humanize.Parsing.Parse_Precise_Duration (Text);
   begin
      AUnit.Assertions.Assert
        (Parsed.Status = Ok and then Parsed.Value = Micros,
         Label & " precise duration roundtrip [" & Text & "]");
   end Check_Precise_Duration_Roundtrip;

   procedure Check_Duration_Phrase_Roundtrips is
      Range_Text : constant String :=
        Rendered
          (Humanize.Durations.Format_Range (Support.En, 3_600, 7_200),
           "duration range");
      Range_Result : constant Humanize.Parsing.Duration_Range_Parse_Result :=
        Humanize.Parsing.Parse_Duration_Range (Range_Text);
      Compact_Interval_Text : constant String :=
        Rendered
          (Humanize.Durations.Interval
             (Support.En,
              3_600,
              7_200,
              Phrase => (Style => Humanize.Durations.Compact_Label)),
           "compact duration interval");
      Compact_Interval :
        constant Humanize.Parsing.Duration_Range_Parse_Result :=
          Humanize.Parsing.Parse_Duration_Range (Compact_Interval_Text);
      Countdown_Text : constant String :=
        Rendered
          (Humanize.Durations.Countdown (Support.En, 60), "countdown");
      Countdown : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Countdown (Countdown_Text);
      SLA_Text : constant String :=
        Rendered
          (Humanize.Durations.SLA_Window (Support.En, 86_400), "SLA window");
      SLA : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_SLA_Window (SLA_Text);
      Age_Text : constant String :=
        Rendered (Humanize.Durations.Age (Support.En, 259_200), "age");
      Age : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Age (Age_Text);
      Modified_Text : constant String :=
        Rendered
          (Humanize.Durations.Modified_Ago (Support.En, 7_200),
           "modified ago");
      Modified : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Modified_Ago (Modified_Text);
      Modified_Now_Text : constant String :=
        Rendered
          (Humanize.Durations.Modified_Ago (Support.En, 0),
           "modified just now");
      Modified_Now : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Modified_Ago (Modified_Now_Text);
      ETA_Text : constant String :=
        Rendered (Humanize.Durations.ETA (Support.En, 300), "ETA");
      ETA : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_ETA (ETA_Text);
      Retry_Text : constant String :=
        Rendered (Humanize.Durations.Retry_In (Support.En, 10), "retry");
      Retry : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Retry_In (Retry_Text);
   begin
      AUnit.Assertions.Assert
        (Range_Result.Status = Ok
         and then Range_Result.Low = 3_600
         and then Range_Result.High = 7_200,
         "duration range roundtrip [" & Range_Text & "]");
      AUnit.Assertions.Assert
        (Compact_Interval.Status = Ok
         and then Compact_Interval.Low = 3_600
         and then Compact_Interval.High = 7_200,
         "compact interval roundtrip [" & Compact_Interval_Text & "]");
      AUnit.Assertions.Assert
        (Countdown.Status = Ok and then Countdown.Value = 60,
         "countdown roundtrip [" & Countdown_Text & "]");
      AUnit.Assertions.Assert
        (SLA.Status = Ok and then SLA.Value = 86_400,
         "SLA window roundtrip [" & SLA_Text & "]");
      AUnit.Assertions.Assert
        (Age.Status = Ok and then Age.Value = 259_200,
         "age roundtrip [" & Age_Text & "]");
      AUnit.Assertions.Assert
        (Modified.Status = Ok and then Modified.Value = 7_200,
         "modified ago roundtrip [" & Modified_Text & "]");
      AUnit.Assertions.Assert
        (Modified_Now.Status = Ok and then Modified_Now.Value = 0,
         "modified just-now roundtrip [" & Modified_Now_Text & "]");
      AUnit.Assertions.Assert
        (ETA.Status = Ok and then ETA.Value = 300,
         "ETA roundtrip [" & ETA_Text & "]");
      AUnit.Assertions.Assert
        (Retry.Status = Ok and then Retry.Value = 10,
         "retry roundtrip [" & Retry_Text & "]");
   end Check_Duration_Phrase_Roundtrips;

   procedure Check_Progress_Roundtrips is
      Complete_Text : constant String :=
        Rendered
          (Humanize.Durations.Complete_Count (Support.En, 3, 10),
           "complete count");
      Complete : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Progress (Complete_Text);
      Step_Text : constant String :=
        Rendered (Humanize.Durations.Step_Count (Support.En, 2, 5), "step");
      Step : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Step_Count (Step_Text);
      Attempt_Text : constant String :=
        Rendered
          (Humanize.Durations.Attempt_Count (Support.En, 2, 3), "attempt");
      Attempt : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Attempt_Count (Attempt_Text);
      Business_Text : constant String :=
        Rendered
          (Humanize.Durations.Business_Days (Support.En, 3),
           "business days");
      Business : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Business_Days (Business_Text);
      Working_Text : constant String :=
        Rendered
          (Humanize.Durations.Working_Hours (Support.En, 6),
           "working hours");
      Working : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Working_Hours (Working_Text);
      Recurrence_Text : constant String :=
        Rendered
          (Humanize.Durations.Recurrence
             (Support.En, 2, Humanize.Durations.Every_Day),
           "recurrence");
      Recurrence : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence (Recurrence_Text);
      Throughput_Text : constant String :=
        Rendered
          (Humanize.Durations.Throughput_Remaining
             (Support.En, 120, 4, "item"),
           "throughput remaining");
      Throughput : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Throughput_Remaining (Throughput_Text);
      Bar_Text : constant String :=
        Rendered
          (Humanize.Durations.Progress_Bar (Support.En, 3, 10),
           "progress bar");
      Bar : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Progress_Bar (Bar_Text);
      Percent_Text : constant String :=
        Rendered
          (Humanize.Durations.Percent_Complete (Support.En, 87.5),
           "percent complete");
      Percent : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Percent (Percent_Text);
      Accessible_Text : constant String :=
        Rendered
          (Humanize.Durations.Accessible_Progress (Support.En, 3, 10),
           "accessible progress");
      Accessible : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Progress (Accessible_Text);
   begin
      AUnit.Assertions.Assert
        (Complete.Status = Ok
         and then Complete.Count = 3
         and then Complete.Total = 10,
         "complete count roundtrip [" & Complete_Text & "]");
      AUnit.Assertions.Assert
        (Step.Status = Ok and then Step.Count = 2 and then Step.Total = 5,
         "step count roundtrip [" & Step_Text & "]");
      AUnit.Assertions.Assert
        (Attempt.Status = Ok
         and then Attempt.Count = 2
         and then Attempt.Total = 3,
         "attempt count roundtrip [" & Attempt_Text & "]");
      AUnit.Assertions.Assert
        (Business.Status = Ok and then Business.Value = 3,
         "business days roundtrip [" & Business_Text & "]");
      AUnit.Assertions.Assert
        (Working.Status = Ok and then Working.Value = 6,
         "working hours roundtrip [" & Working_Text & "]");
      AUnit.Assertions.Assert
        (Recurrence.Status = Ok and then Recurrence.Value = 2,
         "recurrence roundtrip [" & Recurrence_Text & "]");
      AUnit.Assertions.Assert
        (Throughput.Status = Ok
         and then Throughput.Count = 120
         and then Throughput.Total = 4,
         "throughput remaining roundtrip [" & Throughput_Text & "]");
      AUnit.Assertions.Assert
        (Bar.Status = Ok and then Bar.Value = 30,
         "progress bar roundtrip [" & Bar_Text & "]");
      AUnit.Assertions.Assert
        (Percent.Status = Ok and then Percent.Value = 88,
         "percent complete scan roundtrip [" & Percent_Text & "]");
      AUnit.Assertions.Assert
        (Accessible.Status = Ok
         and then Accessible.Count = 3
         and then Accessible.Total = 10,
         "accessible progress roundtrip [" & Accessible_Text & "]");
   end Check_Progress_Roundtrips;

   procedure Check_List_Count_Roundtrips is
      Counted_Text : constant String :=
        Rendered
          (Humanize.Lists.Counted_Noun (Support.En, 1_200, "file"),
           "counted noun");
      Counted : constant Humanize.Parsing.Counted_Noun_Parse_Result :=
        Humanize.Parsing.Parse_Counted_Noun (Counted_Text);
      Result_Text : constant String :=
        Rendered
          (Humanize.Lists.Result_Count (Support.En, 24), "result count");
      Results : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Parse_Result_Count (Result_Text);
      Showing_Text : constant String :=
        Rendered
          (Humanize.Lists.Showing_Count (Support.En, 20, 153),
           "showing count");
      Showing : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Showing_Count (Showing_Text);
      Page_Text : constant String :=
        Rendered
          (Humanize.Lists.Page_Count (Support.En, 2, 8), "page count");
      Page : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Page_Count (Page_Text);
   begin
      AUnit.Assertions.Assert
        (Counted.Status = Ok
         and then Counted.Count = 1_200
         and then Counted.Noun (1 .. Counted.Noun_Length) = "files",
         "counted noun roundtrip [" & Counted_Text & "]");
      AUnit.Assertions.Assert
        (Results.Status = Ok and then Results.Count = 24,
         "result count roundtrip [" & Result_Text & "]");
      AUnit.Assertions.Assert
        (Showing.Status = Ok
         and then Showing.Count = 20
         and then Showing.Total = 153,
         "showing count roundtrip [" & Showing_Text & "]");
      AUnit.Assertions.Assert
        (Page.Status = Ok and then Page.Count = 2 and then Page.Total = 8,
         "page count roundtrip [" & Page_Text & "]");
   end Check_List_Count_Roundtrips;

   procedure Check_Number_Roundtrips is
      Cardinal_Text : constant String :=
        Rendered (Humanize.Numbers.Cardinal (Support.En, 42), "cardinal");
      Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Cardinal (Cardinal_Text);
      Ordinal_Text : constant String :=
        Rendered (Humanize.Numbers.Ordinal (Support.En, 21), "ordinal");
      Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Ordinal (Ordinal_Text);
      Bounded_Text : constant String :=
        Rendered
          (Humanize.Numbers.Bounded_Number (Support.En, 110, 100),
           "bounded number");
      Bounded : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Bounded_Number (Bounded_Text);
      Range_Text : constant String :=
        Rendered
          (Humanize.Numbers.Number_Range (Support.En, 3, 7),
           "number range");
      Range_Result : constant Humanize.Parsing.Number_Range_Parse_Result :=
        Humanize.Parsing.Parse_Number_Range (Range_Text);
      Spaced_Range_Text : constant String :=
        Rendered
          (Humanize.Numbers.Number_Range
             (Support.En,
              10,
              20,
              (Separator => '-',
               Spaces_Around => True)),
           "spaced number range");
      Spaced_Range : constant Humanize.Parsing.Number_Range_Parse_Result :=
        Humanize.Parsing.Parse_Number_Range (Spaced_Range_Text);
      Approx_Range_Text : constant String :=
        Rendered
          (Humanize.Numbers.Approximate_Range (Support.En, 10, 20),
           "approximate range");
      Approx_Range : constant Humanize.Parsing.Number_Range_Parse_Result :=
        Humanize.Parsing.Parse_Number_Range (Approx_Range_Text);
      Under_Text : constant String :=
        Rendered (Humanize.Numbers.Under_Number (Support.En, 5), "under");
      Under : constant Humanize.Parsing.Number_Range_Parse_Result :=
        Humanize.Parsing.Parse_Number_Range (Under_Text);
      Up_To_Text : constant String :=
        Rendered (Humanize.Numbers.Up_To (Support.En, 100), "up to");
      Up_To : constant Humanize.Parsing.Number_Range_Parse_Result :=
        Humanize.Parsing.Parse_Number_Range (Up_To_Text);
      Between_Text : constant String :=
        Rendered (Humanize.Numbers.Between (Support.En, 3, 7), "between");
      Between : constant Humanize.Parsing.Number_Range_Parse_Result :=
        Humanize.Parsing.Parse_Number_Range (Between_Text);
      One_In_Text : constant String :=
        Rendered (Humanize.Numbers.One_In (Support.En, 4), "one in");
      One_In : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Proportion (One_In_Text);
      Out_Of_Text : constant String :=
        Rendered (Humanize.Numbers.Out_Of (Support.En, 3, 10), "out of");
      Out_Of : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Proportion (Out_Of_Text);
      Ratio_Text : constant String :=
        Rendered (Humanize.Numbers.Ratio (Support.En, 16, 9), "ratio");
      Ratio : constant Humanize.Parsing.Aspect_Ratio_Parse_Result :=
        Humanize.Parsing.Parse_Aspect_Ratio (Ratio_Text);
      Roman_Text : constant String :=
        Rendered (Humanize.Numbers.Roman (2026), "Roman numeral");
      Roman : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Roman (Roman_Text);
      Scientific_Text : constant String :=
        Rendered
          (Humanize.Numbers.Scientific_Notation
             (Support.En,
              1_230_000.0,
              (Maximum_Fraction_Digits => 2,
               Suppress_Trailing_Zero  => True)),
           "scientific notation");
      Scientific : constant Humanize.Parsing.Float_Parse_Result :=
        Humanize.Parsing.Parse_Scientific_Number (Scientific_Text);
   begin
      AUnit.Assertions.Assert
        (Cardinal.Status = Ok and then Cardinal.Value = 42,
         "cardinal roundtrip [" & Cardinal_Text & "]");
      AUnit.Assertions.Assert
        (Ordinal.Status = Ok and then Ordinal.Value = 21,
         "ordinal roundtrip [" & Ordinal_Text & "]");
      AUnit.Assertions.Assert
        (Bounded.Status = Ok and then Bounded.Value = 100,
         "bounded number roundtrip [" & Bounded_Text & "]");
      AUnit.Assertions.Assert
        (Range_Result.Status = Ok
         and then Range_Result.Low = 3
         and then Range_Result.High = 7,
         "number range roundtrip [" & Range_Text & "]");
      AUnit.Assertions.Assert
        (Spaced_Range.Status = Ok
         and then Spaced_Range.Low = 10
         and then Spaced_Range.High = 20,
         "spaced number range roundtrip [" & Spaced_Range_Text & "]");
      AUnit.Assertions.Assert
        (Approx_Range.Status = Ok
         and then Approx_Range.Low = 10
         and then Approx_Range.High = 20,
         "approximate range roundtrip [" & Approx_Range_Text & "]");
      AUnit.Assertions.Assert
        (Under.Status = Ok and then Under.Low = 0 and then Under.High = 5,
         "under-number range roundtrip [" & Under_Text & "]");
      AUnit.Assertions.Assert
        (Up_To.Status = Ok and then Up_To.Low = 0 and then Up_To.High = 100,
         "up-to range roundtrip [" & Up_To_Text & "]");
      AUnit.Assertions.Assert
        (Between.Status = Ok
         and then Between.Low = 3
         and then Between.High = 7,
         "between range roundtrip [" & Between_Text & "]");
      AUnit.Assertions.Assert
        (One_In.Status = Ok
         and then One_In.Count = 1
         and then One_In.Total = 4,
         "one-in proportion roundtrip [" & One_In_Text & "]");
      AUnit.Assertions.Assert
        (Out_Of.Status = Ok
         and then Out_Of.Count = 3
         and then Out_Of.Total = 10,
         "out-of proportion roundtrip [" & Out_Of_Text & "]");
      AUnit.Assertions.Assert
        (Ratio.Status = Ok and then Ratio.Width = 16 and then Ratio.Height = 9,
         "ratio/aspect roundtrip [" & Ratio_Text & "]");
      AUnit.Assertions.Assert
        (Roman.Status = Ok and then Roman.Value = 2026,
         "Roman numeral roundtrip [" & Roman_Text & "]");
      AUnit.Assertions.Assert
        (Scientific.Status = Ok
         and then Scientific.Value > 1_229_999.0
         and then Scientific.Value < 1_230_001.0,
         "scientific notation roundtrip [" & Scientific_Text & "]");
   end Check_Number_Roundtrips;

   procedure Check_Unit_Compound_Roundtrips is
      function Close
        (Left  : Long_Float;
         Right : Long_Float)
         return Boolean
      is
      begin
         return abs (Left - Right) < 0.000_001;
      end Close;

      procedure Check_Compound
        (Result        : Text_Result;
         Expected_Value : Long_Float;
         Expected_Unit  : String;
         Label          : String)
      is
         Text : constant String := Rendered (Result, Label);
         Parsed : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
           Humanize.Parsing.Parse_Compound_Unit (Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Ok
            and then Close (Parsed.Value, Expected_Value)
            and then Parsed.Unit (1 .. Parsed.Unit_Length) = Expected_Unit,
            Label & " compound roundtrip [" & Text & "]");
      end Check_Compound;

      Aspect_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Aspect_Ratio (Support.En, 1_920, 1_080),
           "aspect ratio");
      Aspect : constant Humanize.Parsing.Aspect_Ratio_Parse_Result :=
        Humanize.Parsing.Parse_Aspect_Ratio (Aspect_Text);
      CSS_Text : constant String :=
        Rendered
          (Humanize.Units.Format_CSS_Length (Support.En, 1.5, "rem"),
           "CSS length");
      CSS : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_CSS_Length (CSS_Text);
      Compound_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Latency (Support.En, 2_500.0),
           "compound unit");
      Compound : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Compound_Unit (Compound_Text);
      Length_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Length (Support.En, 1_500.0),
           "auto length");
      Length : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Length_Text);
      Mass_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Mass (Support.En, 1_500.0),
           "auto mass");
      Mass : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Mass_Text);
      Volume_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Volume (Support.En, 0.25),
           "auto volume");
      Volume : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Volume_Text);
      Speed_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Speed (Support.En, 20.0),
           "auto speed");
      Speed : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Speed_Text);
      Area_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Area (Support.En, 2_000_000.0),
           "auto area");
      Area : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Area_Text);
      Pressure_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Pressure (Support.En, 2_500.0),
           "auto pressure");
      Pressure : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Pressure_Text);
      Fahrenheit_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Cooking_Temperature (Support.En, 350.0),
           "cooking temperature");
      Fahrenheit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Fahrenheit_Text);
      Data_Rate_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Data_Rate (Support.En, 1_500.0),
           "data rate");
      Data_Rate : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Compound_Unit (Data_Rate_Text);
      Bit_Rate_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Bit_Rate (Support.En, 1_500_000.0),
           "bit rate");
      Bit_Rate : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Compound_Unit (Bit_Rate_Text);
      IOPS_Text : constant String :=
        Rendered
          (Humanize.Units.Format_IOPS (Support.En, 42_000.0),
           "IOPS");
      IOPS : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Compound_Unit (IOPS_Text);
   begin
      AUnit.Assertions.Assert
        (Aspect.Status = Ok
         and then Aspect.Width = 16
         and then Aspect.Height = 9,
         "aspect ratio roundtrip [" & Aspect_Text & "]");
      AUnit.Assertions.Assert
        (CSS.Status = Ok
         and then CSS.Value = 1.5
         and then CSS.Unit (1 .. CSS.Unit_Length) = "rem",
         "CSS length roundtrip [" & CSS_Text & "]");
      AUnit.Assertions.Assert
        (Compound.Status = Ok
         and then Compound.Value = 2.5
         and then Compound.Unit (1 .. Compound.Unit_Length) = "ms",
         "compound unit roundtrip [" & Compound_Text & "]");
      AUnit.Assertions.Assert
        (Length.Status = Ok
         and then Close (Length.Value, 1.5)
         and then Length.Unit = Humanize.Units.Kilometer,
         "auto length unit roundtrip [" & Length_Text & "]");
      AUnit.Assertions.Assert
        (Mass.Status = Ok
         and then Close (Mass.Value, 1.5)
         and then Mass.Unit = Humanize.Units.Kilogram,
         "auto mass unit roundtrip [" & Mass_Text & "]");
      AUnit.Assertions.Assert
        (Volume.Status = Ok
         and then Close (Volume.Value, 250.0)
         and then Volume.Unit = Humanize.Units.Milliliter,
         "auto volume unit roundtrip [" & Volume_Text & "]");
      AUnit.Assertions.Assert
        (Speed.Status = Ok
         and then Close (Speed.Value, 72.0)
         and then Speed.Unit = Humanize.Units.Kilometer_Per_Hour,
         "auto speed unit roundtrip [" & Speed_Text & "]");
      AUnit.Assertions.Assert
        (Area.Status = Ok
         and then Close (Area.Value, 2.0)
         and then Area.Unit = Humanize.Units.Square_Kilometer,
         "auto area unit roundtrip [" & Area_Text & "]");
      AUnit.Assertions.Assert
        (Pressure.Status = Ok
         and then Close (Pressure.Value, 2.5)
         and then Pressure.Unit = Humanize.Units.Kilopascal,
         "auto pressure unit roundtrip [" & Pressure_Text & "]");
      AUnit.Assertions.Assert
        (Fahrenheit.Status = Ok
         and then Close (Fahrenheit.Value, 350.0)
         and then Fahrenheit.Unit = Humanize.Units.Fahrenheit,
         "Fahrenheit unit roundtrip [" & Fahrenheit_Text & "]");
      AUnit.Assertions.Assert
        (Data_Rate.Status = Ok
         and then Close (Data_Rate.Value, 1.5)
         and then Data_Rate.Unit (1 .. Data_Rate.Unit_Length) = "kb/s",
         "data-rate compound roundtrip [" & Data_Rate_Text & "]");
      AUnit.Assertions.Assert
        (Bit_Rate.Status = Ok
         and then Close (Bit_Rate.Value, 1.5)
         and then Bit_Rate.Unit (1 .. Bit_Rate.Unit_Length) = "mbit/s",
         "bit-rate compound roundtrip [" & Bit_Rate_Text & "]");
      AUnit.Assertions.Assert
        (IOPS.Status = Ok
         and then Close (IOPS.Value, 42.0)
         and then IOPS.Unit (1 .. IOPS.Unit_Length) = "k iops",
         "IOPS compound roundtrip [" & IOPS_Text & "]");

      Check_Compound
        (Humanize.Units.Format_Bits (Support.En, 1_500_000.0),
         1.5, "mbit", "bit quantity");
      Check_Compound
        (Humanize.Units.Format_Binary_Data_Rate (Support.En, 1_572_864.0),
         1.5, "mib/s", "binary data rate");
      Check_Compound
        (Humanize.Units.Format_Density (Support.En, 997.0),
         997.0, "kg/m3", "density");
      Check_Compound
        (Humanize.Units.Format_Acceleration (Support.En, 9.8),
         9.8, "m/s2", "acceleration");
      Check_Compound
        (Humanize.Units.Format_Torque (Support.En, 250.0),
         250.0, "n m", "torque");
      Check_Compound
        (Humanize.Units.Format_Fuel_Economy (Support.En, 5.5),
         5.5, "l/100 km", "fuel economy");
      Check_Compound
        (Humanize.Units.Format_Flow_Rate (Support.En, 0.25),
         250.0, "ml/s", "flow rate");
      Check_Compound
        (Humanize.Units.Format_Electric_Current (Support.En, 0.5),
         500.0, "ma", "electric current");
      Check_Compound
        (Humanize.Units.Format_Voltage (Support.En, 1_200.0),
         1.2, "kv", "voltage");
      Check_Compound
        (Humanize.Units.Format_Pixel_Density (Support.En, 326.0),
         326.0, "ppi", "pixel density");
      Check_Compound
        (Humanize.Units.Format_Electric_Resistance (Support.En, 2_200.0),
         2.2, "kohm", "electric resistance");
      Check_Compound
        (Humanize.Units.Format_Electric_Capacitance
           (Support.En, 0.000_004_7),
         4.7, "uf", "electric capacitance");
      Check_Compound
        (Humanize.Units.Format_Electric_Inductance (Support.En, 0.0022),
         2.2, "mh", "electric inductance");
      Check_Compound
        (Humanize.Units.Format_Concentration (Support.En, 0.5),
         0.5, "mol/l", "concentration");
      Check_Compound
        (Humanize.Units.Format_Fuel_Efficiency_MPG (Support.En, 32.5),
         32.5, "mpg", "fuel efficiency MPG");
      Check_Compound
        (Humanize.Units.Format_Memory_Bandwidth
           (Support.En, 1_500_000_000.0),
         1.5, "gb/s", "memory bandwidth");
      Check_Compound
        (Humanize.Units.Format_CPU_Load (Support.En, 87.5),
         87.5, "% cpu", "CPU load");
      Check_Compound
        (Humanize.Units.Format_Battery (Support.En, 45.0),
         45.0, "% battery", "battery");
      Check_Compound
        (Humanize.Units.Format_Screen_Size (Support.En, 13.3),
         13.3, "in screen", "screen size");
      Check_Compound
        (Humanize.Units.Format_Typography_Size (Support.En, 12.0),
         12.0, "pt", "typography size");
      Check_Compound
        (Humanize.Units.Format_Audio_Level (Support.En, -12.5),
         -12.5, "db", "audio level");
      Check_Compound
        (Humanize.Units.Format_Signal_Strength (Support.En, -67.0),
         -67.0, "dbm", "signal strength");
      Check_Compound
        (Humanize.Units.Format_Storage_Endurance (Support.En, 600.0),
         600.0, "tbw", "storage endurance");
      Check_Compound
        (Humanize.Units.Format_Refresh_Rate (Support.En, 144.0),
         144.0, "hz refresh", "refresh rate");
      Check_Compound
        (Humanize.Units.Format_Luminance (Support.En, 1_000.0),
         1_000.0, "nits", "luminance");
      Check_Compound
        (Humanize.Units.Format_Print_Resolution (Support.En, 300.0),
         300.0, "dpi", "print resolution");
   end Check_Unit_Compound_Roundtrips;

   procedure Check_Scanner_Roundtrips is
      Items : constant Humanize.Lists.Text_List :=
        [To_Unbounded_String ("alpha"),
         To_Unbounded_String ("beta"),
         To_Unbounded_String ("gamma")];

      procedure Check_Bytes_Scan
        (Result : Text_Result;
         Bytes  : Humanize.Bytes.Byte_Count;
         Label  : String)
      is
         Text : constant String := Rendered (Result, Label);
         Parsed : constant Humanize.Parsing.Byte_Parse_Result :=
           Humanize.Parsing.Scan_Bytes (Text & "; tail");
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Ok
            and then Parsed.Value = Bytes
            and then Parsed.Consumed = Text'Length,
            Label & " scan roundtrip [" & Text & "]");
      end Check_Bytes_Scan;

      procedure Check_Duration_Scan
        (Result  : Text_Result;
         Seconds : Humanize.Durations.Duration_Seconds;
         Label   : String)
      is
         Text : constant String := Rendered (Result, Label);
         Parsed : constant Humanize.Parsing.Duration_Parse_Result :=
           Humanize.Parsing.Scan_Duration (Text & "; tail");
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Ok
            and then Parsed.Value = Seconds
            and then Parsed.Consumed = Text'Length,
            Label & " scan roundtrip [" & Text & "]");
      end Check_Duration_Scan;

      procedure Check_Number_Scan
        (Result : Text_Result;
         Value  : Long_Long_Integer;
         Label  : String)
      is
         Text : constant String := Rendered (Result, Label);
         Parsed : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Scan_Compact_Number (Text & "; tail");
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Ok
            and then Parsed.Value = Value
            and then Parsed.Consumed = Text'Length,
            Label & " compact scan roundtrip [" & Text & "]");
      end Check_Number_Scan;

      Duration_Range_Text : constant String :=
        Rendered
          (Humanize.Durations.Format_Range (Support.En, 3_600, 7_200),
           "duration range scan");
      Duration_Range :
        constant Humanize.Parsing.Duration_Range_Parse_Result :=
          Humanize.Parsing.Scan_Duration_Range
            (Duration_Range_Text & "; tail");
      Precise_Text : constant String :=
        Rendered
          (Humanize.Durations.Format_Precise (Support.En, 1_005_000, 2),
           "precise scan");
      Precise : constant Humanize.Parsing.Precise_Duration_Parse_Result :=
        Humanize.Parsing.Scan_Precise_Duration (Precise_Text & "; tail");
      Bounded_Text : constant String :=
        Rendered
          (Humanize.Numbers.Bounded_Number (Support.En, 110, 100),
           "bounded scan");
      Bounded : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Bounded_Number (Bounded_Text & " selected");
      Range_Text : constant String :=
        Rendered
          (Humanize.Numbers.Number_Range (Support.En, 10, 20),
           "number range scan");
      Range_Result : constant Humanize.Parsing.Number_Range_Parse_Result :=
        Humanize.Parsing.Scan_Number_Range (Range_Text & " selected");
      Proportion_Text : constant String :=
        Rendered (Humanize.Numbers.One_In (Support.En, 4), "proportion scan");
      Proportion : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Scan_Proportion (Proportion_Text & "; tail");
      Frequency_Text : constant String :=
        Rendered (Humanize.Frequencies.Times (Support.En, 4), "frequency scan");
      Frequency : constant Humanize.Parsing.Frequency_Parse_Result :=
        Humanize.Parsing.Scan_Frequency (Frequency_Text & "; tail");
      Rate_Text : constant String :=
        Rendered
          (Humanize.Rates.Pace_Approximate
             (Support.En, 4, Humanize.Rates.Per_Week),
           "rate scan");
      Rate : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Scan_Rate (Rate_Text & "; tail");
      List_Text : constant String :=
        Rendered (Humanize.Lists.Format (Support.En, Items), "list scan");
      List : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Scan_List (List_Text & "; tail");
      Percent_Text : constant String :=
        Rendered (Humanize.Numbers.Percent (Support.En, 12.5), "percent scan");
      Percent : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Percent (Percent_Text & " selected");
      Ordinal_Text : constant String :=
        Rendered (Humanize.Numbers.Ordinal (Support.En, 21), "ordinal scan");
      Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Ordinal (Ordinal_Text & " place");
      Roman_Text : constant String :=
        Rendered (Humanize.Numbers.Roman (2026), "Roman scan");
      Roman : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Roman (Roman_Text & " edition");
      Unit_Text : constant String :=
        Rendered
          (Humanize.Units.Format
             (Support.En, 5, Humanize.Units.Kilometer),
           "unit scan");
      Unit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Scan_Unit (Unit_Text & " planned");
      CSS_Text : constant String :=
        Rendered
          (Humanize.Units.Format_CSS_Length (Support.En, 1.5, "rem"),
           "CSS scan");
      CSS : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Scan_CSS_Length (CSS_Text & "; tail");
      Compound_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Latency (Support.En, 2_500.0),
           "compound scan");
      Compound : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Scan_Compound_Unit (Compound_Text & "; tail");
      Aspect_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Aspect_Ratio (Support.En, 1_920, 1_080),
           "aspect scan");
      Aspect : constant Humanize.Parsing.Aspect_Ratio_Parse_Result :=
        Humanize.Parsing.Scan_Aspect_Ratio (Aspect_Text & "; tail");
   begin
      Check_Bytes_Scan
        (Humanize.Bytes.Format (Support.En, 1_536), 1_536, "bytes");
      Check_Duration_Scan
        (Humanize.Durations.Format_Compact (Support.En, 5_405, 2),
         5_400,
         "compact duration");
      Check_Number_Scan
        (Humanize.Numbers.Compact (Support.En, 1_200), 1_200, "compact");

      AUnit.Assertions.Assert
        (Duration_Range.Status = Ok
         and then Duration_Range.Low = 3_600
         and then Duration_Range.High = 7_200
         and then Duration_Range.Consumed = Duration_Range_Text'Length,
         "duration range scan roundtrip [" & Duration_Range_Text & "]");
      AUnit.Assertions.Assert
        (Precise.Status = Ok
         and then Precise.Value = 1_005_000
         and then Precise.Consumed = Precise_Text'Length,
         "precise duration scan roundtrip [" & Precise_Text & "]");
      AUnit.Assertions.Assert
        (Bounded.Status = Ok
         and then Bounded.Value = 100
         and then Bounded.Consumed = Bounded_Text'Length,
         "bounded number scan roundtrip [" & Bounded_Text & "]");
      AUnit.Assertions.Assert
        (Range_Result.Status = Ok
         and then Range_Result.Low = 10
         and then Range_Result.High = 20
         and then Range_Result.Consumed = Range_Text'Length,
         "number range scan roundtrip [" & Range_Text & "]");
      AUnit.Assertions.Assert
        (Proportion.Status = Ok
         and then Proportion.Count = 1
         and then Proportion.Total = 4
         and then Proportion.Consumed = Proportion_Text'Length,
         "proportion scan roundtrip [" & Proportion_Text & "]");
      AUnit.Assertions.Assert
        (Frequency.Status = Ok
         and then Frequency.Count = 4
         and then Frequency.Consumed = Frequency_Text'Length,
         "frequency scan roundtrip [" & Frequency_Text & "]");
      AUnit.Assertions.Assert
        (Rate.Status = Ok
         and then Rate.Count = 4
         and then Rate.Period = Humanize.Rates.Per_Week
         and then Rate.Consumed = Rate_Text'Length,
         "rate scan roundtrip [" & Rate_Text & "]");
      AUnit.Assertions.Assert
        (List.Status = Ok
         and then List.Count = 3
         and then List.Consumed = List_Text'Length,
         "list scan roundtrip [" & List_Text & "]");
      AUnit.Assertions.Assert
        (Percent.Status = Ok
         and then Percent.Value = 13
         and then Percent.Consumed = Percent_Text'Length,
         "percent scan roundtrip [" & Percent_Text & "]");
      AUnit.Assertions.Assert
        (Ordinal.Status = Ok
         and then Ordinal.Value = 21
         and then Ordinal.Consumed = Ordinal_Text'Length,
         "ordinal scan roundtrip [" & Ordinal_Text & "]");
      AUnit.Assertions.Assert
        (Roman.Status = Ok
         and then Roman.Value = 2026
         and then Roman.Consumed = Roman_Text'Length,
         "Roman scan roundtrip [" & Roman_Text & "]");
      AUnit.Assertions.Assert
        (Unit.Status = Ok
         and then Unit.Unit = Humanize.Units.Kilometer
         and then Unit.Consumed = Unit_Text'Length,
         "unit scan roundtrip [" & Unit_Text & "]");
      AUnit.Assertions.Assert
        (CSS.Status = Ok
         and then CSS.Unit (1 .. CSS.Unit_Length) = "rem"
         and then CSS.Consumed = CSS_Text'Length,
         "CSS scan roundtrip [" & CSS_Text & "]");
      AUnit.Assertions.Assert
        (Compound.Status = Ok
         and then Compound.Unit (1 .. Compound.Unit_Length) = "ms"
         and then Compound.Consumed = Compound_Text'Length,
         "compound scan roundtrip [" & Compound_Text & "]");
      AUnit.Assertions.Assert
        (Aspect.Status = Ok
         and then Aspect.Width = 16
         and then Aspect.Height = 9
         and then Aspect.Consumed = Aspect_Text'Length,
         "aspect scan roundtrip [" & Aspect_Text & "]");
   end Check_Scanner_Roundtrips;

   procedure Check_Natural_Day_Roundtrip
     (Context  : Humanize.Contexts.Context;
      Locale   : String;
      Value    : Humanize.Datetimes.Civil_Date_Time;
      Expected : Ada.Calendar.Time;
      Label    : String)
   is
      Reference : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, others => 0);
      Ref_Time : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 3, 21, 0.0);
      Text : constant String :=
        Rendered
          (Humanize.Datetimes.Natural_Day (Context, Value, Reference), Label);
      Parsed : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Time, Text);
   begin
      AUnit.Assertions.Assert
        (Parsed.Status = Ok and then Parsed.Value = Expected,
         Locale & " " & Label & " natural day roundtrip [" & Text & "]");
   end Check_Natural_Day_Roundtrip;

   procedure Check_Directional_Natural_Day_Roundtrips
     (Context   : Humanize.Contexts.Context;
      Locale    : String;
      Tomorrow  : Humanize.Datetimes.Civil_Date_Time;
      Yesterday : Humanize.Datetimes.Civil_Date_Time)
   is
      Reference : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, others => 0);
      Tomorrow_Text : constant String :=
        Rendered
          (Humanize.Datetimes.Natural_Day (Context, Tomorrow, Reference),
           "natural day tomorrow ambiguity check");
      Yesterday_Text : constant String :=
        Rendered
          (Humanize.Datetimes.Natural_Day (Context, Yesterday, Reference),
           "natural day yesterday ambiguity check");
   begin
      if Tomorrow_Text = Yesterday_Text then
         return;
      end if;

      Check_Natural_Day_Roundtrip
        (Context, Locale, Tomorrow,
         Ada.Calendar.Time_Of (2026, 3, 22, 0.0),
         "natural day tomorrow");
      Check_Natural_Day_Roundtrip
        (Context, Locale, Yesterday,
         Ada.Calendar.Time_Of (2026, 3, 20, 0.0),
         "natural day yesterday");
   end Check_Directional_Natural_Day_Roundtrips;

   procedure Check_Deterministic_Helper_Roundtrips is
      Color : constant Humanize.Colors.RGB_Color :=
        (Red => 16#33#, Green => 16#66#, Blue => 16#99#);
      Black : constant Humanize.Colors.RGB_Color :=
        (Red => 0, Green => 0, Blue => 0);
      White : constant Humanize.Colors.RGB_Color :=
        (Red => 255, Green => 255, Blue => 255);
      Palette : constant Humanize.Colors.Color_List :=
        [1 => Color, 2 => Black, 3 => White];
      Validation_Issues : constant Humanize.Lists.Text_List :=
        [1 => To_Unbounded_String ("email is invalid"),
         2 => To_Unbounded_String ("password is too short")];
      Field_Issues : constant Humanize.Lists.Text_List :=
        [1 => To_Unbounded_String ("is invalid")];

      RGB_Text : constant String :=
        Rendered (Humanize.Colors.RGB_Label (Color), "RGB label");
      RGB : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGB_Label (RGB_Text);
      RGBA_Text : constant String :=
        Rendered (Humanize.Colors.RGBA_Label (Color, 0.5), "RGBA label");
      RGBA : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGBA_Label (RGBA_Text);
      Summary_Text : constant String :=
        Rendered (Humanize.Colors.Color_Summary (Color), "color summary");
      Summary : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_Color_Summary (Summary_Text);
      HSL_Text : constant String :=
        Rendered (Humanize.Colors.HSL_Label (Color), "HSL label");
      HSL : constant Humanize.Parsing.Color_Model_Label_Parse_Result :=
        Humanize.Parsing.Parse_HSL_Label (HSL_Text);
      HSV_Text : constant String :=
        Rendered (Humanize.Colors.HSV_Label (Color), "HSV label");
      HSV : constant Humanize.Parsing.Color_Model_Label_Parse_Result :=
        Humanize.Parsing.Parse_HSV_Label (HSV_Text);
      Description_Text : constant String :=
        Rendered
          (Humanize.Colors.Color_Description (Color), "color description");
      Description : constant Humanize.Parsing.Color_Description_Parse_Result :=
        Humanize.Parsing.Parse_Color_Description (Description_Text);
      Palette_Text : constant String :=
        Rendered (Humanize.Colors.Palette_Summary (Palette),
                  "palette summary");
      Palette_Result : constant Humanize.Parsing.Palette_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Palette_Summary (Palette_Text);
      Accessibility_Text : constant String :=
        Rendered (Humanize.Colors.Color_Accessibility_Summary (Black, White),
                  "color accessibility summary");
      Accessibility : constant
        Humanize.Parsing.Color_Accessibility_Parse_Result :=
          Humanize.Parsing.Parse_Color_Accessibility_Summary
            (Accessibility_Text);
      Difference_Text : constant String :=
        Rendered (Humanize.Colors.Color_Difference_Label (Black, White),
                  "color difference");
      Difference : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Color_Difference_Label (Difference_Text);

      Filename_Text : constant String :=
        Rendered (Humanize.Strings.Safe_Filename ("Hello, Ada!.txt"),
                  "safe filename");
      Filename : constant Humanize.Parsing.Filename_Label_Parse_Result :=
        Humanize.Parsing.Parse_Safe_Filename (Filename_Text);
      Basename_Text : constant String :=
        Rendered
          (Humanize.Strings.Path_Basename ("/tmp/report-final.pdf"),
           "path basename");
      Basename : constant Humanize.Parsing.Filename_Label_Parse_Result :=
        Humanize.Parsing.Parse_Path_Basename (Basename_Text);
      Title_Text : constant String :=
        Rendered
          (Humanize.Strings.Path_Title ("/tmp/report-final.pdf"),
           "path title");
      Title : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Path_Title (Title_Text);
      Extension_Text : constant String :=
        Rendered
          (Humanize.Strings.Extension_Label ("/tmp/report-final.pdf"),
           "extension label");
      Extension : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Extension_Label (Extension_Text);
      Handle_Text : constant String :=
        Rendered (Humanize.Strings.Handle_Label ("ada"), "handle label");
      Handle : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Handle_Label (Handle_Text);
      Initials_Text : constant String :=
        Rendered (Humanize.Strings.Person_Initials ("Ada Lovelace"),
                  "person initials");
      Initials : constant Humanize.Parsing.Initials_Parse_Result :=
        Humanize.Parsing.Parse_Person_Initials (Initials_Text);
      Possessive_Text : constant String :=
        Rendered (Humanize.Strings.Possessive_Name ("Ada"),
                  "possessive name");
      Possessive : constant Humanize.Parsing.Possessive_Parse_Result :=
        Humanize.Parsing.Parse_Possessive_Name (Possessive_Text);
      Token_Text : constant String :=
        Rendered (Humanize.Strings.Group_Token ("ABCDEF123456"),
                  "group token");
      Token : constant Humanize.Parsing.Grouped_Token_Parse_Result :=
        Humanize.Parsing.Parse_Grouped_Token (Token_Text);
      Mask_Text : constant String :=
        Rendered (Humanize.Strings.Mask ("secret-token", 4), "mask text");
      Mask : constant Humanize.Parsing.Mask_Parse_Result :=
        Humanize.Parsing.Parse_Mask (Mask_Text);
      Text_Summary_Text : constant String :=
        Rendered
          (Humanize.Strings.Text_Summary
             ("Ada writes tests. Bob reads them."),
           "text summary");
      Text_Summary : constant Humanize.Parsing.Text_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Text_Summary (Text_Summary_Text);
      Parameterized_Text : constant String :=
        Rendered (Humanize.Strings.Parameterize ("Ada Lovelace"),
                  "parameterize label");
      Parameterized : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Parameterize_Label (Parameterized_Text);
      Dasherized_Text : constant String :=
        Rendered (Humanize.Strings.Dasherize ("ada_lovelace"),
                  "dasherize label");
      Dasherized : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Dasherize_Label (Dasherized_Text);
      Underscore_Text : constant String :=
        Rendered (Humanize.Strings.Underscore ("AdaLovelace"),
                  "underscore label");
      Underscore : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Underscore_Label (Underscore_Text);
      Camel_Text : constant String :=
        Rendered (Humanize.Strings.Camelize ("ada_lovelace"),
                  "camelize label");
      Camel : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Camelize_Label (Camel_Text);
      Inflection_Text : constant String :=
        Rendered
          (Humanize.Strings.Inflection_Source_Label
             (Humanize.Strings.Pluralize_Source ("child")),
           "inflection source label");
      Inflection : constant Humanize.Parsing.Inflection_Source_Parse_Result :=
        Humanize.Parsing.Parse_Inflection_Source_Label (Inflection_Text);

      File_Size_Text : constant String :=
        Rendered
          (Humanize.Bytes.File_Size_Summary (Support.En, 3, 1_536),
           "file-size summary");
      File_Size : constant Humanize.Parsing.File_Size_Summary_Parse_Result :=
        Humanize.Parsing.Parse_File_Size_Summary (File_Size_Text);
      Transfer_Text : constant String :=
        Rendered
          (Humanize.Bytes.Transfer_Remaining_Label
             (Support.En, 1_536, 512),
           "transfer remaining");
      Transfer : constant Humanize.Parsing.Transfer_Remaining_Parse_Result :=
        Humanize.Parsing.Parse_Transfer_Remaining (Transfer_Text);
      Disk_Text : constant String :=
        Rendered
          (Humanize.Bytes.Disk_Usage_Label (Support.En, 1_536, 3_072),
           "disk usage");
      Disk : constant Humanize.Parsing.Disk_Usage_Parse_Result :=
        Humanize.Parsing.Parse_Disk_Usage (Disk_Text);

      Validation_Text : constant String :=
        Rendered
          (Humanize.Lists.Validation_Summary
             (Support.En, Validation_Issues),
           "validation summary");
      Validation : constant Humanize.Parsing.Validation_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Validation_Summary (Validation_Text);
      Field_Text : constant String :=
        Rendered
          (Humanize.Lists.Field_Problem_Summary
             (Support.En, "email", Field_Issues),
           "field problem summary");
      Field : constant Humanize.Parsing.Field_Problem_Parse_Result :=
        Humanize.Parsing.Parse_Field_Problem_Summary (Field_Text);
      Selection_Text : constant String :=
        Rendered
          (Humanize.Lists.Selection_Summary
             (Support.En, 3, 5, "item"),
           "selection summary");
      Selection : constant Humanize.Parsing.Selection_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Selection_Summary (Selection_Text);
      More_Text : constant String :=
        Rendered
          (Humanize.Lists.More_Count (Support.En, 3, 4),
           "more count");
      More : constant Humanize.Parsing.More_Count_Parse_Result :=
        Humanize.Parsing.Parse_More_Count (More_Text);
      Pagination_Text : constant String :=
        Rendered
          (Humanize.Lists.Pagination_Range
             (Support.En, 21, 40, 153),
           "pagination range");
      Pagination : constant Humanize.Parsing.Pagination_Range_Parse_Result :=
        Humanize.Parsing.Parse_Pagination_Range (Pagination_Text);
      Collection_Text : constant String :=
        Rendered
          (Humanize.Lists.Collection_Display (Support.En, 3, 4),
           "collection display");
      Collection : constant Humanize.Parsing.Collection_Display_Parse_Result :=
        Humanize.Parsing.Parse_Collection_Display (Collection_Text);

      Severity_Text : constant String :=
        Rendered
          (Humanize.Phrases.Severity_Label
             (Humanize.Phrases.Danger_Severity),
           "phrase severity label");
      Severity : constant Humanize.Parsing.Phrase_Severity_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Severity_Label (Severity_Text);
      Tone_Text : constant String :=
        Rendered
          (Humanize.Phrases.Tone_Label (Humanize.Phrases.Critical_Tone),
           "phrase tone label");
      Tone : constant Humanize.Parsing.Phrase_Tone_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Tone_Label (Tone_Text);
      Domain_Label_Text : constant String :=
        Rendered
          (Humanize.Phrases.Domain_Label (Humanize.Phrases.Sync_Domain),
           "phrase domain label");
      Domain_Label : constant Humanize.Parsing.Phrase_Domain_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Domain_Label (Domain_Label_Text);
      State_Label_Text : constant String :=
        Rendered
          (Humanize.Phrases.Summary_State_Label
             (Humanize.Phrases.Summary_Running),
           "phrase state label");
      State_Label : constant Humanize.Parsing.Phrase_State_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_State_Label (State_Label_Text);
      Key_Text : constant String :=
        Rendered
          (Humanize.Phrases.CI_Key (Humanize.Phrases.Pipeline_Failed),
           "phrase key");
      Key : constant Humanize.Parsing.Phrase_Key_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Key (Key_Text);
      Pack_Text : constant String :=
        Rendered (Humanize.Phrases.Phrase_Pack_Summary,
                  "phrase pack summary");
      Pack : constant Humanize.Parsing.Phrase_Pack_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Pack_Summary (Pack_Text);
      Locales_Text : constant String :=
        Rendered (Humanize.Phrases.Supported_Phrase_Locales,
                  "supported phrase locales");
      Locales : constant Humanize.Parsing.Phrase_Locales_Parse_Result :=
        Humanize.Parsing.Parse_Supported_Phrase_Locales (Locales_Text);

      Domain_Text : constant String :=
        Rendered
          (Humanize.Phrases.Domain_Summary
             (Support.En, Humanize.Phrases.Job_Domain,
              Humanize.Phrases.Summary_Running, 3, 10, 1,
              "task", "tasks"),
           "domain summary");
      Domain : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Domain_Summary (Domain_Text);
      Queue_Text : constant String :=
        Rendered
          (Humanize.Phrases.Queue_Summary
             (Support.En, 4, 2, 1, 3, "job", "jobs"),
           "queue summary");
      Queue : constant Humanize.Parsing.Queue_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Queue_Summary (Queue_Text);
      Cache_Text : constant String :=
        Rendered
          (Humanize.Phrases.Cache_Summary (Support.En, 8, 2),
           "cache summary");
      Cache : constant Humanize.Parsing.Cache_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Cache_Summary (Cache_Text);
      Sync_Text : constant String :=
        Rendered
          (Humanize.Phrases.Sync_Summary
             (Support.En, 3, 5, 1, "file", "files"),
           "sync summary");
      Sync : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Sync_Summary (Sync_Text);
      Import_Text : constant String :=
        Rendered
          (Humanize.Phrases.Import_Summary
             (Support.En, 2, 4, 0, "row", "rows"),
           "import summary");
      Import : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Import_Summary (Import_Text);
      Export_Text : constant String :=
        Rendered
          (Humanize.Phrases.Export_Summary
             (Support.En, 6, 6, 0, "file", "files"),
           "export summary");
      Export : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Export_Summary (Export_Text);
   begin
      AUnit.Assertions.Assert
        (RGB.Status = Ok and then RGB.Color = Color,
         "RGB formatter/parser roundtrip [" & RGB_Text & "]");
      AUnit.Assertions.Assert
        (RGBA.Status = Ok and then RGBA.Color = Color
         and then RGBA.Has_Opacity,
         "RGBA formatter/parser roundtrip [" & RGBA_Text & "]");
      AUnit.Assertions.Assert
        (Summary.Status = Ok and then Summary.Color = Color,
         "color summary formatter/parser roundtrip [" & Summary_Text & "]");
      AUnit.Assertions.Assert
        (HSL.Status = Ok and then HSL.Exact,
         "HSL formatter/parser roundtrip [" & HSL_Text & "]");
      AUnit.Assertions.Assert
        (HSV.Status = Ok and then HSV.Exact,
         "HSV formatter/parser roundtrip [" & HSV_Text & "]");
      AUnit.Assertions.Assert
        (Description.Status = Ok and then Description.Hue_Length > 0,
         "color description formatter/parser roundtrip ["
         & Description_Text & "]");
      AUnit.Assertions.Assert
        (Palette_Result.Status = Ok and then Palette_Result.Count = 3,
         "palette summary formatter/parser roundtrip [" & Palette_Text & "]");
      AUnit.Assertions.Assert
        (Accessibility.Status = Ok
         and then Accessibility.Contrast_Ratio >= 21.0,
         "color accessibility formatter/parser roundtrip ["
         & Accessibility_Text & "]");
      AUnit.Assertions.Assert
        (Difference.Status = Ok and then Difference.Value > 0.0,
         "color difference formatter/parser roundtrip ["
         & Difference_Text & "]");

      AUnit.Assertions.Assert
        (Filename.Status = Ok and then Filename.Looks_Safe
         and then Filename.Has_Extension,
         "safe filename formatter/parser roundtrip [" & Filename_Text & "]");
      AUnit.Assertions.Assert
        (Basename.Status = Ok and then Basename.Has_Extension,
         "path basename formatter/parser roundtrip [" & Basename_Text & "]");
      AUnit.Assertions.Assert
        (Title.Status = Ok and then Title.Title_Case,
         "path title formatter/parser roundtrip [" & Title_Text & "]");
      AUnit.Assertions.Assert
        (Extension.Status = Ok and then Extension.Uppercase,
         "extension formatter/parser roundtrip [" & Extension_Text & "]");
      AUnit.Assertions.Assert
        (Handle.Status = Ok and then Handle.Looks_Handle,
         "handle formatter/parser roundtrip [" & Handle_Text & "]");
      AUnit.Assertions.Assert
        (Initials.Status = Ok and then Initials.Initial_Count = 2,
         "initials formatter/parser roundtrip [" & Initials_Text & "]");
      AUnit.Assertions.Assert
        (Possessive.Status = Ok and then Possessive.Owner_Length = 3,
         "possessive formatter/parser roundtrip [" & Possessive_Text & "]");
      AUnit.Assertions.Assert
        (Token.Status = Ok and then Token.Group_Count = 3,
         "token formatter/parser roundtrip [" & Token_Text & "]");
      AUnit.Assertions.Assert
        (Mask.Status = Ok and then Mask.Visible_Count = 4,
         "mask formatter/parser roundtrip [" & Mask_Text & "]");
      AUnit.Assertions.Assert
        (Text_Summary.Status = Ok
         and then Text_Summary.Has_Words
         and then Text_Summary.Has_Sentences,
         "text summary formatter/parser roundtrip ["
         & Text_Summary_Text & "]");
      AUnit.Assertions.Assert
        (Parameterized.Status = Ok
         and then Parameterized.Has_Separator
         and then Parameterized.Separator = '-',
         "parameterize formatter/parser roundtrip ["
         & Parameterized_Text & "]");
      AUnit.Assertions.Assert
        (Dasherized.Status = Ok
         and then Dasherized.Has_Separator
         and then Dasherized.Separator = '-',
         "dasherize formatter/parser roundtrip [" & Dasherized_Text & "]");
      AUnit.Assertions.Assert
        (Underscore.Status = Ok
         and then Underscore.Has_Separator
         and then Underscore.Separator = '_',
         "underscore formatter/parser roundtrip [" & Underscore_Text & "]");
      AUnit.Assertions.Assert
        (Camel.Status = Ok and then Camel.Camel_Case,
         "camelize formatter/parser roundtrip [" & Camel_Text & "]");
      AUnit.Assertions.Assert
        (Inflection.Status = Ok
         and then Inflection.Source = Humanize.Strings.Irregular_Inflection,
         "inflection source formatter/parser roundtrip ["
         & Inflection_Text & "]");

      AUnit.Assertions.Assert
        (File_Size.Status = Ok
         and then File_Size.File_Count = 3
         and then File_Size.Total = 1_536,
         "file-size formatter/parser roundtrip [" & File_Size_Text & "]");
      AUnit.Assertions.Assert
        (Transfer.Status = Ok
         and then Transfer.Remaining = 1_536
         and then Transfer.Has_Rate
         and then Transfer.Bytes_Per_Second = 512,
         "transfer formatter/parser roundtrip [" & Transfer_Text & "]");
      AUnit.Assertions.Assert
        (Disk.Status = Ok
         and then Disk.Used = 1_536
         and then Disk.Total = 3_072
         and then Disk.Percent_Used = 50,
         "disk formatter/parser roundtrip [" & Disk_Text & "]");

      AUnit.Assertions.Assert
        (Validation.Status = Ok
         and then Validation.Count = 2
         and then Validation.Severity =
           Humanize.Parsing.Parsed_Validation_Error,
         "validation formatter/parser roundtrip [" & Validation_Text & "]");
      AUnit.Assertions.Assert
        (Field.Status = Ok
         and then Field.Field_Length = 5
         and then Field.Summary.Count = 1,
         "field problem formatter/parser roundtrip [" & Field_Text & "]");
      AUnit.Assertions.Assert
        (Selection.Status = Ok
         and then Selection.Kind = Humanize.Parsing.Selection_Partial
         and then Selection.Selected = 3
         and then Selection.Total = 5,
         "selection formatter/parser roundtrip [" & Selection_Text & "]");
      AUnit.Assertions.Assert
        (More.Status = Ok
         and then More.Visible = 3
         and then More.Remaining = 4,
         "more-count formatter/parser roundtrip [" & More_Text & "]");
      AUnit.Assertions.Assert
        (Pagination.Status = Ok
         and then Pagination.First = 21
         and then Pagination.Last = 40
         and then Pagination.Total = 153,
         "pagination formatter/parser roundtrip [" & Pagination_Text & "]");
      AUnit.Assertions.Assert
        (Collection.Status = Ok
         and then Collection.Visible = 3
         and then Collection.Remaining = 4,
         "collection formatter/parser roundtrip [" & Collection_Text & "]");

      AUnit.Assertions.Assert
        (Severity.Status = Ok
         and then Severity.Severity = Humanize.Phrases.Danger_Severity,
         "phrase severity formatter/parser roundtrip [" & Severity_Text & "]");
      AUnit.Assertions.Assert
        (Tone.Status = Ok
         and then Tone.Tone = Humanize.Phrases.Critical_Tone,
         "phrase tone formatter/parser roundtrip [" & Tone_Text & "]");
      AUnit.Assertions.Assert
        (Domain_Label.Status = Ok
         and then Domain_Label.Domain = Humanize.Phrases.Sync_Domain,
         "phrase domain formatter/parser roundtrip ["
         & Domain_Label_Text & "]");
      AUnit.Assertions.Assert
        (State_Label.Status = Ok
         and then State_Label.State = Humanize.Phrases.Summary_Running,
         "phrase state formatter/parser roundtrip ["
         & State_Label_Text & "]");
      AUnit.Assertions.Assert
        (Key.Status = Ok
         and then Key.Prefix_Length = 2
         and then Key.Name_Length > 0,
         "phrase key formatter/parser roundtrip [" & Key_Text & "]");
      AUnit.Assertions.Assert
        (Pack.Status = Ok
         and then Pack.Pack_Count > 0
         and then Pack.Has_Summaries,
         "phrase pack formatter/parser roundtrip [" & Pack_Text & "]");
      AUnit.Assertions.Assert
        (Locales.Status = Ok
         and then Locales.Locale_Count > 8
         and then Locales.Has_Generated_Locales,
         "phrase locales formatter/parser roundtrip [" & Locales_Text & "]");

      AUnit.Assertions.Assert
        (Domain.Status = Ok
         and then Domain.Completed = 3
         and then Domain.Total = 10
         and then Domain.Failed = 1,
         "domain summary formatter/parser roundtrip [" & Domain_Text & "]");
      AUnit.Assertions.Assert
        (Queue.Status = Ok
         and then Queue.Queued = 4
         and then Queue.Running = 2
         and then Queue.Failed = 1
         and then Queue.Completed = 3,
         "queue summary formatter/parser roundtrip [" & Queue_Text & "]");
      AUnit.Assertions.Assert
        (Cache.Status = Ok
         and then Cache.Hits = 8
         and then Cache.Misses = 2
         and then Cache.Hit_Rate = 80,
         "cache summary formatter/parser roundtrip [" & Cache_Text & "]");
      AUnit.Assertions.Assert
        (Sync.Status = Ok
         and then Sync.Completed = 3
         and then Sync.Total = 5
         and then Sync.Failed = 1,
         "sync summary formatter/parser roundtrip [" & Sync_Text & "]");
      AUnit.Assertions.Assert
        (Import.Status = Ok
         and then Import.Completed = 2
         and then Import.Total = 4,
         "import summary formatter/parser roundtrip [" & Import_Text & "]");
      AUnit.Assertions.Assert
        (Export.Status = Ok
         and then Export.Completed = 6
         and then Export.Total = 6,
         "export summary formatter/parser roundtrip [" & Export_Text & "]");
   end Check_Deterministic_Helper_Roundtrips;

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

   procedure Test_Common_Bytes_Numbers_Units
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check
        (Humanize.Bytes.Format (Support.En, 1_536),
         "1.5 KiB",
         "binary byte size");
      Check
        (Humanize.Bytes.Format
           (Support.En, 1_500, Humanize.Bytes.Decimal_Byte_Options),
         "1.5 kB",
         "decimal byte size");
      Check
        (Humanize.Bytes.File_Size_Summary (Support.En, 3, 1_536),
         "3 files, 1.5 KiB",
         "file size summary");
      Check
        (Humanize.Numbers.Ordinal (Support.En, 21),
         "21st",
         "ordinal");
      Check
        (Humanize.Numbers.Compact (Support.En, 1_200_000),
         "1.2M",
         "compact number");
      Check
        (Humanize.Numbers.Percent (Support.En, 12.5),
         "12.5%",
         "percent number");
      Check
        (Humanize.Numbers.Between (Support.En, 3, 7),
         "between 3 and 7",
         "between range");
      Check
        (Humanize.Numbers.Qualified_Range (Support.En, 3, 7),
         "3 to 7 inclusive",
         "qualified range");
      Check
        (Humanize.Numbers.Ratio_Per (Support.En, 2, 1, "error", "file"),
         "2 errors per file",
         "ratio with nouns");
      Check
        (Humanize.Numbers.Percent_Change (Support.En, -12.5),
         "down 12.5%",
         "percent change");
      Check
        (Humanize.Units.Format (Support.En, 5, Humanize.Units.Kilometer),
         "5 kilometers",
         "unit quantity");
      Check
        (Humanize.Units.Format_Aspect_Ratio (Support.En, 1_920, 1_080),
         "16:9",
         "aspect ratio");
   end Test_Common_Bytes_Numbers_Units;

   procedure Test_Common_Lists_Strings_And_Text
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Items : constant Humanize.Lists.Text_List :=
        [To_Unbounded_String ("alpha"),
         To_Unbounded_String ("beta"),
         To_Unbounded_String ("gamma")];
   begin
      Check
        (Humanize.Lists.Format (Support.En, Items),
         "alpha, beta and gamma",
         "list conjunction");
      Check
        (Humanize.Lists.More_Count (Support.En, 3, 4),
         "3 shown, +4 more",
         "more count");
      Check
        (Humanize.Lists.Selection_Summary (Support.En, 3, 5, "item"),
         "3 of 5 items selected",
         "selection summary");
      Check
        (Humanize.Frequencies.Times (Support.En, 4),
         "4 times",
         "frequency times");
      Check
        (Humanize.Rates.Pace_Approximate
           (Support.En, 4, Humanize.Rates.Per_Week),
         "approximately 4 times per week",
         "rate pace");
      Check
        (Humanize.Strings.Truncate ("abcdef", 4),
         "a...",
         "truncate");
      Check
        (Humanize.Strings.Title_Case ("hello world"),
         "Hello World",
         "title case");
      Check
        (Humanize.Strings.Display_Name ("Ada Lovelace", "ada_lovelace"),
         "Ada Lovelace",
         "display name");
      Check
        (Humanize.Strings.Safe_Filename ("Hello, Ada!.txt"),
         "hello-ada.txt",
         "safe filename");
      Check
        (Humanize.Strings.Mask ("secret-token", 4),
         "********oken",
         "mask text");
   end Test_Common_Lists_Strings_And_Text;

   procedure Test_Common_Phrases_Summaries_And_Comparisons
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check
        (Humanize.Phrases.Status_Phrase (Support.En, Humanize.Phrases.Loading),
         "loading",
         "status phrase");
      Check
        (Humanize.Phrases.Domain_Summary
           (Support.En, Humanize.Phrases.Job_Domain,
            Humanize.Phrases.Summary_Running, 3, 10, 1, "task", "tasks"),
         "job running: 3 of 10 tasks complete, 1 failed",
         "domain summary");
      Check
        (Humanize.Phrases.Cache_Summary (Support.En, 8, 2),
         "cache: 8 hits, 2 misses, 80% hit rate",
         "cache summary");
      Check
        (Humanize.Phrases.File_Size_Comparison
           (Support.En, 3_900_000, 1_600_000, "file A", "file B",
            Humanize.Bytes.Decimal_Byte_Options),
         "file A is 2.3 MB larger than file B",
         "file size comparison");
      Check
        (Humanize.Phrases.Date_Comparison
           (Support.En,
            (Year => 2026, Month => 3, Day => 18, others => 0),
            (Year => 2026, Month => 3, Day => 21, others => 0),
            "updated", "release"),
         "updated is 3 days before release",
         "date comparison");
      Check
        (Humanize.Phrases.Percent_Comparison
           (Support.En, 88.0, 100.0, "score", "baseline"),
         "score is 12% lower than baseline",
         "percent comparison");
      Check
        (Humanize.Colors.Color_Summary
           ((Red => 16#33#, Green => 16#66#, Blue => 16#99#)),
         "#336699 rgb(51, 102, 153)",
         "color summary");
      Check
        (Humanize.Colors.Contrast_Label
           ((Red => 0, Green => 0, Blue => 0),
            (Red => 255, Green => 255, Blue => 255)),
         "21:1 enhanced contrast",
         "contrast summary");
   end Test_Common_Phrases_Summaries_And_Comparisons;

   procedure Test_Common_Parsing_And_Invalid_Edges
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Scan_Bytes ("42 kB");
      Duration_Result : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Scan_Duration ("1h 30m");
      Percent_Result : constant Humanize.Parsing.Number_Parse_Result :=
         Humanize.Parsing.Scan_Percent ("12.5%");
   begin
      AUnit.Assertions.Assert
        (Bytes.Status = Ok
         and then Bytes.Value = 42_000
         and then Bytes.Consumed = 5,
         "parse byte size corpus case");
      AUnit.Assertions.Assert
        (Duration_Result.Status = Ok
         and then Duration_Result.Value = 5_400
         and then Duration_Result.Consumed = 6,
         "parse duration corpus case");
      AUnit.Assertions.Assert
         (Percent_Result.Status = Ok
         and then Percent_Result.Value = 13
         and then Percent_Result.Consumed = 5,
         "parse percent corpus case");
      Check_Status
        (Humanize.Numbers.Between (Support.En, 7, 3),
         Invalid_Value,
         "invalid reversed numeric range");
      Check_Status
        (Humanize.Phrases.Percent_Comparison
           (Support.En, 12.0, 0.0, "score", "baseline"),
         Invalid_Value,
         "invalid zero-baseline percent comparison");
      AUnit.Assertions.Assert
        (Humanize.Parsing.Scan_Bytes ("nope").Status = Invalid_Argument,
         "invalid byte parse corpus case");
   end Test_Common_Parsing_And_Invalid_Edges;

   procedure Test_Render_Parse_Roundtrip_Corpus
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Today : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, others => 0);
      Tomorrow : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 22, others => 0);
      Yesterday : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 20, others => 0);
   begin
      Check_Precise_Duration_Roundtrip
        (1_500_000, "precise duration seconds milliseconds");
      Check_Duration_Phrase_Roundtrips;
      Check_Progress_Roundtrips;
      Check_List_Count_Roundtrips;
      Check_Number_Roundtrips;
      Check_Unit_Compound_Roundtrips;
      Check_Scanner_Roundtrips;
      Check_Deterministic_Helper_Roundtrips;

      for Code in Locale_Code loop
         declare
            Locale  : constant String := Locale_Name (Code);
            Context : constant Humanize.Contexts.Context :=
              Locale_Context (Code);
         begin
            Check_Duration_Roundtrip
              (Context, Locale, 2, "duration seconds");
            Check_Duration_Roundtrip
              (Context, Locale, 120, "duration minutes");
            Check_Duration_Roundtrip
              (Context, Locale, 7_200, "duration hours");
            Check_Duration_Roundtrip
              (Context, Locale, 172_800, "duration days");
            Check_Duration_Components_Roundtrip
              (Context, Locale, 3_661, "duration components");

            Check_Bytes_Roundtrip
              (Context, Locale, 1_536, "bytes binary");
            Check_Compact_Roundtrip
              (Context, Locale, 1_200, "compact thousand");
            Check_Compact_Roundtrip
              (Context, Locale, 1_200_000, "compact million");
            Check_Percent_Roundtrip
              (Context, Locale, 12.5, 13, "percent decimal");

            Check_Frequency_Roundtrip
              (Context, Locale, 0, "frequency never");
            Check_Frequency_Roundtrip
              (Context, Locale, 1, "frequency once");
            Check_Frequency_Roundtrip
              (Context, Locale, 2, "frequency twice");
            Check_Frequency_Roundtrip
              (Context, Locale, 4, "frequency count");
            Check_Rate_Roundtrip
              (Context, Locale, 4, Humanize.Rates.Per_Week, "rate week");

            Check_Unit_Roundtrip
              (Context, Locale, 5, Humanize.Units.Meter, "unit meter");
            Check_Unit_Roundtrip
              (Context, Locale, 5, Humanize.Units.Kilometer,
               "unit kilometer");
            Check_Unit_Roundtrip
              (Context, Locale, 5, Humanize.Units.Kilogram,
               "unit kilogram");
            Check_Unit_Roundtrip
              (Context, Locale, 5, Humanize.Units.Liter, "unit liter");
            Check_List_Roundtrip (Context, Locale);

            Check_Natural_Day_Roundtrip
              (Context, Locale, Today,
               Ada.Calendar.Time_Of (2026, 3, 21, 0.0),
               "natural day today");
            Check_Directional_Natural_Day_Roundtrips
              (Context, Locale, Tomorrow, Yesterday);
         end;
      end loop;
   end Test_Render_Parse_Roundtrip_Corpus;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize compatibility corpus tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine
        (T, Test_Common_Datetime_And_Duration'Access,
         "common datetime and duration corpus");
      Register_Routine
        (T, Test_Common_Bytes_Numbers_Units'Access,
         "common bytes numbers and units corpus");
      Register_Routine
        (T, Test_Common_Lists_Strings_And_Text'Access,
         "common lists strings and text corpus");
      Register_Routine
        (T, Test_Common_Phrases_Summaries_And_Comparisons'Access,
         "common phrases summaries and comparisons corpus");
      Register_Routine
        (T, Test_Common_Parsing_And_Invalid_Edges'Access,
         "common parsing and invalid edge corpus");
      Register_Routine
        (T, Test_Render_Parse_Roundtrip_Corpus'Access,
         "render parse roundtrip corpus");
   end Register_Tests;

end Humanize.Tests.Compatibility;
