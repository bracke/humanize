separate (Humanize.Tests.Durations)
   procedure Test_Natural_Distance
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Buffer : String (1 .. 32);
      Written : Natural;
      Code : Status_Code;
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
   begin
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
   end Test_Natural_Distance;
