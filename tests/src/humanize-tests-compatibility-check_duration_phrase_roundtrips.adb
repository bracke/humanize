separate (Humanize.Tests.Compatibility)
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
