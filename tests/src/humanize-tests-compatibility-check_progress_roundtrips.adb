separate (Humanize.Tests.Compatibility)
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
