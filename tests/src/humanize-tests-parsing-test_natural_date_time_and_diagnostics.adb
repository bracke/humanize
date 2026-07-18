separate (Humanize.Tests.Parsing)
   procedure Test_Natural_Date_Time_And_Diagnostics
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use type Humanize.Parsing.Scheduling_Phrase_Kind;
      use type Humanize.Parsing.Parse_Value_Family;
      Reference : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 7, 13, 8.0 * 3_600.0);
      Tomorrow : constant Humanize.Parsing.Natural_Date_Time_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Time
          (Reference, "tomorrow at 09:30");
      Relative : constant Humanize.Parsing.Natural_Date_Time_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Time (Reference, "in 2 hours");
      Scanned : constant Humanize.Parsing.Natural_Date_Time_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date_Time
          (Reference, "today 14:00; cached");
      Label : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Parse_Error_Label
          (Humanize.Parsing.Expected_Unit);
      Context : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Parse_Error_Context_Label
          (Humanize.Parsing.Expected_Number, 5);
      Schedule : constant Humanize.Parsing.Scheduling_Phrase_Result :=
        Humanize.Parsing.Classify_Scheduling_Phrase
          ("every business Friday at noon");
      Schedule_Label : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Scheduling_Phrase_Label (Schedule);
      Ambiguity_Label : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Scheduling_Ambiguity_Label (Schedule);
      Resolution_Label : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Scheduling_Resolution_Label
          (Humanize.Parsing.Ambiguous_Scheduling_Phrase);
      Success_Label : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Parse_Success_Explanation_Label
          (Humanize.Parsing.Parsed_Duration, "1.5h", "90 minutes",
           Consumed => 4, Exact => True);
      Byte_Success : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Byte_Parse_Success_Label
          ("1 KiB", Humanize.Parsing.Parse_Bytes ("1 KiB"));
      Duration_Success : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Duration_Parse_Success_Label
          ("2 h", Humanize.Parsing.Parse_Duration ("2 h"));
      Number_Success : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Number_Parse_Success_Label
          ("forty two", Humanize.Parsing.Parse_Cardinal ("forty two"));
      Unit_Success : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Unit_Parse_Success_Label
          ("3 m", Humanize.Parsing.Parse_Unit ("3 m"));
      Schedule_Success : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Scheduling_Parse_Success_Label
          ("every Friday", Schedule);
      Parsed_Success : constant Humanize.Parsing.Parse_Success_Explanation :=
        Humanize.Parsing.Parse_Success_Explanation_Label
          ("parse success duration: input=""1.5h"" normalized=""90 minutes"" consumed=4 exact=yes");
      Scanned_Success : constant Humanize.Parsing.Parse_Success_Explanation :=
        Humanize.Parsing.Scan_Success_Explanation_Label
          ("parse success duration: input=""1.5h"" normalized=""90 minutes"" consumed=4 exact=yes"
           & ASCII.LF & "next");
      Buffer : String (1 .. 12);
      Written : Natural;
      Code : Humanize.Status.Status_Code;
   begin
      AUnit.Assertions.Assert
        (Tomorrow.Status = Humanize.Status.Ok
         and then Tomorrow.Has_Time
         and then Tomorrow.Value =
           Ada.Calendar.Time_Of (2026, 7, 14, 9.5 * 3_600.0),
         "parse natural date-time with clock time");
      AUnit.Assertions.Assert
        (Relative.Status = Humanize.Status.Ok
         and then Relative.Has_Relative_Offset
         and then Relative.Value = Reference + 2.0 * 3_600.0,
         "parse natural date-time relative offset");
      AUnit.Assertions.Assert
        (Scanned.Status = Humanize.Status.Ok
         and then Scanned.Has_Time
         and then Scanned.Consumed = 11,
         "scan natural date-time prefix");
      AUnit.Assertions.Assert
        (Label.Status = Humanize.Status.Ok
         and then Support.Text (Label) = "expected-unit",
         "parse error stable label");
      AUnit.Assertions.Assert
        (Context.Status = Humanize.Status.Ok
         and then Support.Text (Context) = "expected a number at position 5",
         "parse error context label");
      AUnit.Assertions.Assert
        (Schedule.Status = Humanize.Status.Ok
         and then Schedule.Ambiguous
         and then Schedule.Kind = Humanize.Parsing.Ambiguous_Scheduling_Phrase,
         "classify ambiguous scheduling phrase");
      AUnit.Assertions.Assert
        (Schedule.Has_Date_Time
         and then Schedule.Has_Business_Day
         and then Schedule.Has_Recurrence,
         "scheduling phrase candidate flags");
      AUnit.Assertions.Assert
        (Schedule_Label.Status = Humanize.Status.Ok
         and then Support.Text (Schedule_Label) =
           "ambiguous scheduling phrase, needs caller disambiguation",
         "scheduling phrase label");
      AUnit.Assertions.Assert
        (Ambiguity_Label.Status = Humanize.Status.Ok
         and then Support.Text (Ambiguity_Label) =
           "ambiguous scheduling phrase: choose date-time, business day, recurrence",
         "scheduling ambiguity label");
      AUnit.Assertions.Assert
        (Resolution_Label.Status = Humanize.Status.Ok
         and then Support.Text (Resolution_Label) =
           "ask caller to choose a scheduling interpretation",
         "scheduling resolution label");
      AUnit.Assertions.Assert
        (Success_Label.Status = Humanize.Status.Ok
         and then Support.Text (Success_Label) =
           "parse success duration: input=""1.5h"" normalized=""90 minutes"" consumed=4 exact=yes",
         "parse success explanation label");
      AUnit.Assertions.Assert
        (Byte_Success.Status = Humanize.Status.Ok
         and then Support.Text (Byte_Success) =
           "parse success bytes: input=""1 KiB"" normalized=""1024 bytes"" consumed=5 exact=yes",
         "byte parse success explanation label");
      AUnit.Assertions.Assert
        (Duration_Success.Status = Humanize.Status.Ok
         and then Support.Text (Duration_Success) =
           "parse success duration: input=""2 h"" normalized=""7200 seconds"" consumed=3 exact=yes",
         "duration parse success explanation label");
      AUnit.Assertions.Assert
        (Number_Success.Status = Humanize.Status.Ok
         and then Support.Text (Number_Success) =
           "parse success number: input=""forty two"" normalized=""42"" consumed=9 exact=yes",
         "number parse success explanation label");
      AUnit.Assertions.Assert
        (Unit_Success.Status = Humanize.Status.Ok
         and then Support.Text (Unit_Success) =
           "parse success unit: input=""3 m"" normalized=""3.00000000000000E+00 METER"" consumed=3 exact=yes",
         "unit parse success explanation label");
      AUnit.Assertions.Assert
        (Schedule_Success.Status = Humanize.Status.Ok
         and then Support.Text (Schedule_Success) =
           "parse success recurrence: input=""every Friday"" normalized=""ambiguous scheduling"" consumed=29 exact=no",
         "scheduling parse success explanation label");
      AUnit.Assertions.Assert
        (Parsed_Success.Status = Humanize.Status.Ok
         and then Parsed_Success.Family = Humanize.Parsing.Parsed_Duration
         and then Parsed_Success.Consumed = 4
         and then Parsed_Success.Exact
         and then Parsed_Success.Input_Length = 4
         and then Parsed_Success.Normalized_Length = 10,
         "parse success explanation parse");
      AUnit.Assertions.Assert
        (Scanned_Success.Status = Humanize.Status.Ok
         and then Scanned_Success.Consumed = 4
         and then Scanned_Success.Normalized_Length = 10,
         "parse success explanation scan");
      Humanize.Parsing.Scheduling_Phrase_Label_Into
        (Schedule, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Humanize.Status.Buffer_Overflow
         and then Written = 12
         and then Buffer = "ambiguous sc",
         "scheduling phrase bounded label");
      Humanize.Parsing.Parse_Error_Context_Label_Into
        (Humanize.Parsing.Unsupported_Form, Buffer, Written, Code, 3);
      AUnit.Assertions.Assert
        (Code = Humanize.Status.Buffer_Overflow
         and then Written = 12
         and then Buffer = "unsupported ",
         "parse error bounded label");
      Humanize.Parsing.Parse_Success_Explanation_Label_Into
        (Humanize.Parsing.Parsed_Duration, "1.5h", "90 minutes",
         Buffer, Written, Code, Consumed => 4);
      AUnit.Assertions.Assert
        (Code = Humanize.Status.Buffer_Overflow
         and then Written = 12
         and then Buffer = "parse succes",
         "parse success bounded label");
   end Test_Natural_Date_Time_And_Diagnostics;
