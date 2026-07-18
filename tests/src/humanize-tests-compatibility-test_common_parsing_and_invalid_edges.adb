separate (Humanize.Tests.Compatibility)
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
