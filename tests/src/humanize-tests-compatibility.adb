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
with Humanize.Locales;
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

   procedure Check_Duration_Phrase_Roundtrips is separate;

   procedure Check_Progress_Roundtrips is separate;

   procedure Check_List_Count_Roundtrips is separate;

   procedure Check_Number_Roundtrips is separate;

   procedure Check_Unit_Compound_Roundtrips is separate;

   procedure Check_Scanner_Roundtrips is separate;

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

   procedure Check_Deterministic_Helper_Roundtrips is separate;

   procedure Test_Common_Datetime_And_Duration
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Common_Bytes_Numbers_Units
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Common_Lists_Strings_And_Text
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Common_Phrases_Summaries_And_Comparisons
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Common_Parsing_And_Invalid_Edges
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Render_Parse_Roundtrip_Corpus
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

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
