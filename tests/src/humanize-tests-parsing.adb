with AUnit.Assertions;

with Ada.Calendar;
with Ada.Strings.Unbounded;

with Humanize.Bytes;
with Humanize.Colors;
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
with Ada.Calendar.Formatting;

package body Humanize.Tests.Parsing is
   use Ada.Strings.Unbounded;
   use type Humanize.Bytes.Byte_Count;
   use type Humanize.Colors.RGB_Color;
   use type Humanize.Colors.Color_Vision_Deficiency;
   use type Humanize.Durations.Duration_Microseconds;
   use type Humanize.Durations.Duration_Seconds;
   use type Humanize.Durations.Recurrence_Unit;
   use type Humanize.Durations.Weekday_Set;
   use type Humanize.Frequencies.Occurrence_Count;
   use type Humanize.Numbers.Approximation_Kind;
   use type Humanize.Numbers.Uncertainty_Style;
   use type Humanize.Parsing.Business_Calendar_Parse_Kind;
   use type Humanize.Parsing.Collection_Display_Kind;
   use type Humanize.Parsing.Comparison_Direction;
   use type Humanize.Parsing.Field_State_Change_Kind;
   use type Humanize.Parsing.Operational_Phrase_Domain;
   use type Humanize.Parsing.Parse_Error_Kind;
   use type Humanize.Parsing.Recurrence_Parse_Kind;
   use type Humanize.Parsing.Selection_Summary_Kind;
   use type Humanize.Parsing.Validation_Severity_Label;
   use type Humanize.Phrases.Phrase_Severity;
   use type Humanize.Phrases.Phrase_Tone;
   use type Humanize.Phrases.Backup_Status;
   use type Humanize.Phrases.Incident_Status;
   use type Humanize.Phrases.Payment_Lifecycle_Status;
   use type Humanize.Phrases.Audit_Status;
   use type Humanize.Phrases.Feature_Flag_Status;
   use type Humanize.Phrases.Webhook_Status;
   use type Humanize.Phrases.API_Key_Status;
   use type Humanize.Phrases.Quota_Status;
   use type Humanize.Phrases.Invoice_Status;
   use type Humanize.Phrases.Database_Status;
   use type Humanize.Phrases.Summary_Domain;
   use type Humanize.Phrases.Summary_State;
   use type Humanize.Rates.Rate_Period;
   use type Humanize.Status.Status_Code;
   use type Humanize.Strings.File_Mode_Kind;
   use type Humanize.Strings.Inflection_Source;
   use type Humanize.Units.Unit_Kind;
   use type Ada.Calendar.Time;

   function B (Hex : String) return String is
      Result : String (1 .. Hex'Length / 2);

      function Nibble (C : Character) return Natural is
      begin
         case C is
            when '0' .. '9' =>
               return Character'Pos (C) - Character'Pos ('0');
            when 'A' .. 'F' =>
               return 10 + Character'Pos (C) - Character'Pos ('A');
            when 'a' .. 'f' =>
               return 10 + Character'Pos (C) - Character'Pos ('a');
            when others =>
               return 0;
         end case;
      end Nibble;
   begin
      for I in Result'Range loop
         Result (I) :=
           Character'Val
             (Nibble (Hex (Hex'First + 2 * (I - Result'First))) * 16
              + Nibble (Hex (Hex'First + 2 * (I - Result'First) + 1)));
      end loop;

      return Result;
   end B;

   procedure Test_Bytes (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      KiB : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes ("1.5 KiB");
      MB  : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes ("2 MB");
      Bad : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes ("wat bytes");
   begin
      AUnit.Assertions.Assert
        (KiB.Status = Humanize.Status.Ok and then KiB.Value = 1536
         and then KiB.Consumed = 7,
         "parse binary byte size");
      AUnit.Assertions.Assert
        (MB.Status = Humanize.Status.Ok and then MB.Value = 2_000_000,
         "parse decimal byte size");
      AUnit.Assertions.Assert
        (Bad.Status = Humanize.Status.Invalid_Argument,
         "invalid byte size");
   end Test_Bytes;

   procedure Test_Durations (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Result : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("2 hours, 30 minutes and 5 seconds");
      Short : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("1.5 hours");
      Long_Units : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("2 weeks, 1 month and 1 year");
      ISO_Mixed : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("P1Y2M3DT4H5M6S");
      ISO_Weeks : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("P2W");
      ISO_Fractional : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("PT1.5S");
      Scanned_ISO : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Scan_Duration ("PT1H30M; cached");
      Lenient : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("in about 1.5hrs");
      Lenient_Almost : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("almost 2 hours");
      Lenient_Just_Over : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("just over 3 weeks");
      Lenient_Little_Under : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("a little under 1 month");
      Lenient_Half : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("about half an hour");
      Lenient_Couple : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("a couple of days");
      Fortnight : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("a fortnight");
      Scanned_Lenient : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Scan_Lenient_Duration ("~2m; cached");
      Precise : constant Humanize.Parsing.Precise_Duration_Parse_Result :=
        Humanize.Parsing.Parse_Precise_Duration
          ("1 second and 500 milliseconds");
      Precise_ISO : constant Humanize.Parsing.Precise_Duration_Parse_Result :=
        Humanize.Parsing.Parse_Precise_Duration ("PT1.5S");
      Scanned_Precise_ISO : constant
        Humanize.Parsing.Precise_Duration_Parse_Result :=
          Humanize.Parsing.Scan_Precise_Duration ("PT1.25S; cached");
      Localized : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("2 Stunden");
      Cyrillic : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration
          ("2 " & B ("D187D0B0D181D0B0"));
      CJK : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("2 " & B ("E7A792"));
   begin
      AUnit.Assertions.Assert
        (Result.Status = Humanize.Status.Ok and then Result.Value = 9_005,
         "parse multi-unit duration");
      AUnit.Assertions.Assert
        (Short.Status = Humanize.Status.Ok and then Short.Value = 5_400,
         "parse fractional duration");
      AUnit.Assertions.Assert
        (Long_Units.Status = Humanize.Status.Ok
         and then Long_Units.Value =
           Humanize.Durations.Duration_Seconds
             ((14 + 30 + 365) * 86_400),
         "parse week month year durations");
      AUnit.Assertions.Assert
        (ISO_Mixed.Status = Humanize.Status.Ok
         and then ISO_Mixed.Value =
           Humanize.Durations.Duration_Seconds
             ((365 + 60 + 3) * 86_400 + 4 * 3_600 + 5 * 60 + 6),
         "parse ISO mixed duration");
      AUnit.Assertions.Assert
        (ISO_Weeks.Status = Humanize.Status.Ok
         and then ISO_Weeks.Value =
           Humanize.Durations.Duration_Seconds (14 * 86_400),
         "parse ISO week duration");
      AUnit.Assertions.Assert
        (ISO_Fractional.Status = Humanize.Status.Ok
         and then ISO_Fractional.Value = 2,
         "parse ISO fractional duration");
      AUnit.Assertions.Assert
        (Scanned_ISO.Status = Humanize.Status.Ok
         and then Scanned_ISO.Value = 5_400
         and then Scanned_ISO.Consumed = 7,
         "scan ISO duration");
      AUnit.Assertions.Assert
        (Lenient.Status = Humanize.Status.Ok and then Lenient.Value = 5_400,
         "parse lenient duration");
      AUnit.Assertions.Assert
        (Lenient_Almost.Status = Humanize.Status.Ok
         and then Lenient_Almost.Value = 7_200,
         "parse almost duration");
      AUnit.Assertions.Assert
        (Lenient_Just_Over.Status = Humanize.Status.Ok
         and then Lenient_Just_Over.Value = 21 * 86_400,
         "parse just-over duration");
      AUnit.Assertions.Assert
        (Lenient_Little_Under.Status = Humanize.Status.Ok
         and then Lenient_Little_Under.Value = 30 * 86_400,
         "parse little-under duration");
      AUnit.Assertions.Assert
        (Lenient_Half.Status = Humanize.Status.Ok
         and then Lenient_Half.Value = 1_800,
         "parse approximate half-hour duration");
      AUnit.Assertions.Assert
        (Fortnight.Status = Humanize.Status.Ok
         and then Fortnight.Value = 14 * 86_400,
         "parse fortnight duration");
      AUnit.Assertions.Assert
        (Scanned_Lenient.Status = Humanize.Status.Ok
         and then Scanned_Lenient.Value = 120
         and then Scanned_Lenient.Consumed = 3,
         "scan lenient duration");
      AUnit.Assertions.Assert
        (Precise.Status = Humanize.Status.Ok
         and then Precise.Value = 1_500_000,
         "parse precise duration");
      AUnit.Assertions.Assert
        (Precise_ISO.Status = Humanize.Status.Ok
         and then Precise_ISO.Value = 1_500_000,
         "parse precise ISO duration");
      AUnit.Assertions.Assert
        (Scanned_Precise_ISO.Status = Humanize.Status.Ok
         and then Scanned_Precise_ISO.Value = 1_250_000
         and then Scanned_Precise_ISO.Consumed = 7,
         "scan precise ISO duration");
      AUnit.Assertions.Assert
        (Lenient_Couple.Status = Humanize.Status.Ok
         and then Lenient_Couple.Value = 172_800,
         "parse couple duration idiom");
      AUnit.Assertions.Assert
        (Localized.Status = Humanize.Status.Ok and then Localized.Value = 7_200,
         "parse localized duration unit alias");
      AUnit.Assertions.Assert
        (Cyrillic.Status = Humanize.Status.Ok and then Cyrillic.Value = 7_200,
         "parse Cyrillic duration unit alias");
      AUnit.Assertions.Assert
        (CJK.Status = Humanize.Status.Ok and then CJK.Value = 2,
         "parse CJK duration unit alias");
   end Test_Durations;

   procedure Test_Compact (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Short : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Compact_Number ("1.2K");
      Long  : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Compact_Number ("3.4 million");
      Plain : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Compact_Number ("1,234");
      Bounded : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Bounded_Number ("1,000+");
      Localized : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Compact_Number ("2 Millionen");
      CJK_Compact : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Compact_Number ("1.2 " & B ("E58D83"));
      Indic_Compact : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Compact_Number
          ("3 " & B ("E0A4B2E0A4BEE0A496"));
      Normal_Number : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Normalize_Number_Text ("1 234,5");
   begin
      AUnit.Assertions.Assert
        (Short.Status = Humanize.Status.Ok and then Short.Value = 1_200,
         "parse short compact number");
      AUnit.Assertions.Assert
        (Long.Status = Humanize.Status.Ok and then Long.Value = 3_400_000,
         "parse long compact number");
      AUnit.Assertions.Assert
        (Plain.Status = Humanize.Status.Ok and then Plain.Value = 1_234,
         "parse grouped plain number");
      AUnit.Assertions.Assert
        (Bounded.Status = Humanize.Status.Ok and then Bounded.Value = 1_000,
         "parse bounded number");
      AUnit.Assertions.Assert
        (Localized.Status = Humanize.Status.Ok
         and then Localized.Value = 2_000_000,
         "parse localized compact number");
      AUnit.Assertions.Assert
        (CJK_Compact.Status = Humanize.Status.Ok
         and then CJK_Compact.Value = 1_200,
         "parse CJK compact number");
      AUnit.Assertions.Assert
        (Indic_Compact.Status = Humanize.Status.Ok
         and then Indic_Compact.Value = 300_000,
         "parse Indic compact number");
      AUnit.Assertions.Assert
        (Normal_Number.Status = Humanize.Status.Ok
         and then Humanize.Tests.Support.Text (Normal_Number) = "1234.5",
         "normalize number text");
   end Test_Compact;

   procedure Test_Round_Trip_Parsers
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Localized_Render_Parse_Roundtrips
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Localized_Semantic_Parse_Roundtrips
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Diagnostics (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Frequency_Rate_List
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Natural_Date_Time_And_Diagnostics
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Parser_Malformed_Input_Matrix
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Parser_Smoke_Baseline
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize parsing tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Bytes'Access, "parse byte sizes");
      Register_Routine (T, Test_Durations'Access, "parse durations");
      Register_Routine (T, Test_Compact'Access, "parse compact numbers");
      Register_Routine (T, Test_Round_Trip_Parsers'Access,
        "parse formatter round trips");
      Register_Routine (T, Test_Localized_Render_Parse_Roundtrips'Access,
        "parse localized formatter round trips");
      Register_Routine (T, Test_Localized_Semantic_Parse_Roundtrips'Access,
        "parse localized semantic round trips");
      Register_Routine (T, Test_Diagnostics'Access, "parser diagnostics");
      Register_Routine (T, Test_Frequency_Rate_List'Access,
        "parse frequencies rates and lists");
      Register_Routine
        (T, Test_Natural_Date_Time_And_Diagnostics'Access,
         "parse natural date-time and diagnostics");
      Register_Routine
        (T, Test_Parser_Malformed_Input_Matrix'Access,
         "parser malformed input matrix");
      Register_Routine
        (T, Test_Parser_Smoke_Baseline'Access,
         "parser smoke baseline");
   end Register_Tests;

end Humanize.Tests.Parsing;
