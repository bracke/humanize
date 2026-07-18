separate (Humanize.Tests.Compatibility)
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
