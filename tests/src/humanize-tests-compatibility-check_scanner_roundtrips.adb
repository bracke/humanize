separate (Humanize.Tests.Compatibility)
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
