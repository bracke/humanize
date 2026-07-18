separate (Humanize.Tests.Numbers)
   procedure Test_Number_Bounded (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 16);
      Written : Natural;
      Code    : Status_Code;
      Range_Text : constant Text_Result := Number_Range (Support.En, 1, 5);
      Spaced_Range : constant Text_Result :=
        Number_Range (Support.En, 1, 5,
                      (Separator => ':', Spaces_Around => True));
      Approx_Range : constant Text_Result :=
        Approximate_Range (Support.En, 10, 20);
      Under_Text : constant Text_Result := Under_Number (Support.En, 5);
      German_Regional_Under : constant Text_Result :=
        Under_Number (Support.Locale ("DE_at"), 5);
      Up_To_Text : constant Text_Result := Up_To (Support.En, 100);
      Between_Text : constant Text_Result := Between (Support.En, 3, 7);
      German_Regional_Between : constant Text_Result :=
        Between (Support.Locale ("DE_at"), 3, 7);
      Qualified_Inclusive : constant Text_Result :=
        Qualified_Range (Support.En, 3, 7);
      Qualified_Exclusive : constant Text_Result :=
        Qualified_Range (Support.En, 3, 7, Exclusive_Range);
      Qualified_Low_Only : constant Text_Result :=
        Qualified_Range (Support.En, 3, 7, Include_Low_Only);
      Qualified_High_Only : constant Text_Result :=
        Qualified_Range (Support.En, 3, 7, Include_High_Only);
      Invalid_Qualified : constant Text_Result :=
        Qualified_Range (Support.En, 7, 3);
      Tolerance_Text : constant Text_Result :=
        Tolerance_Range (Support.En, 10, 2);
      Decimal_Range_Text : constant Text_Result :=
        Decimal_Range (Support.En, 1.25, 3.5,
                       (Maximum_Fraction_Digits => 2,
                        Suppress_Trailing_Zero => True));
      Decimal_Range_Meta : constant Number_Render_Metadata :=
        Decimal_Range_Metadata
          (1.25, 3.5,
           (Maximum_Fraction_Digits => 2,
            Suppress_Trailing_Zero => True));
      Decimal_Range_Word_Text : constant Text_Result :=
        Decimal_Range_Words (Support.En, 1.25, 3.5, 2);
      Invalid_Decimal_Range : constant Text_Result :=
        Decimal_Range (Support.En, 3.5, 1.25);
      Plus_Minus_Uncertainty : constant Text_Result :=
        Uncertainty_Label (Support.En, 12.3, 0.4);
      Uncertainty_Meta : constant Number_Render_Metadata :=
        Uncertainty_Metadata (12.3, 0.4, Style => Interval_Uncertainty);
      Uncertainty_Word_Text : constant Text_Result :=
        Uncertainty_Words (Support.En, 12.3, 0.4, 1);
      Parenthesized_Uncertainty_Text : constant Text_Result :=
        Uncertainty_Label
          (Support.En, 12.3, 0.4,
           Style => Parenthesized_Uncertainty);
      Interval_Uncertainty_Text : constant Text_Result :=
        Uncertainty_Label
          (Support.En, 12.3, 0.4,
           Style => Interval_Uncertainty);
      Invalid_Uncertainty : constant Text_Result :=
        Uncertainty_Label (Support.En, 12.3, -0.4);
      Threshold_Text : constant Text_Result :=
        Threshold (Support.En, 10, At_Least_Threshold);
      Threshold_Max : constant Text_Result :=
        Threshold (Support.En, 10, At_Most_Threshold);
      Range_Within : constant Text_Result :=
        Range_Position (Support.En, 5, 3, 7);
      Range_Below : constant Text_Result :=
        Range_Position (Support.En, 3, 3, 7, Exclusive_Range);
      Range_Above : constant Text_Result :=
        Range_Position (Support.En, 8, 3, 7);
      Ratio_Text : constant Text_Result := Ratio (Support.En, 2, 1);
      Ratio_Per_Text : constant Text_Result :=
        Ratio_Per (Support.En, 2, 1, "error", "file");
      Ratio_Per_Denominator : constant Text_Result :=
        Ratio_Per (Support.En, 5, 2, "failure", "run");
      One_In_Text : constant Text_Result := One_In (Support.En, 4);
      Out_Of_Text : constant Text_Result := Out_Of (Support.En, 3, 10);
      Change_Up_Text : constant Text_Result := Change (Support.En, 4.0);
      Change_Down_Text : constant Text_Result :=
        Change (Support.En, -2.5);
      Change_Zero_Text : constant Text_Result := Change (Support.En, 0.0);
      Change_Signed_Text : constant Text_Result :=
        Change (Support.En, 4.0,
                (Style => Signed_Change,
                 Zero_Style => Numeric_Zero,
                 Number_Style => Default_Number_Options));
      Change_Comparative_Text : constant Text_Result :=
        Unit_Change (Support.En, -5.0, "error",
                     Options =>
                       (Style => Comparative_Change,
                        Zero_Style => Unchanged_Zero,
                        Number_Style => Default_Number_Options));
      Change_Since_Text : constant Text_Result :=
        Change_Since (Support.En, 4.0, "yesterday");
      Change_From_Text : constant Text_Result :=
        Change_From (Support.En, 42.0, 40.0);
      Percent_Change_Text : constant Text_Result :=
        Percent_Change (Support.En, -12.5);
      German_Percent_Change : constant Text_Result :=
        Percent_Change (Support.De, 12.5);
      Percent_Delta_Text : constant Text_Result :=
        Percent_Delta (Support.En, 120.0, 100.0);
      Invalid_Percent_Delta : constant Text_Result :=
        Percent_Delta (Support.En, 120.0, 0.0);
      Point_Change_Text : constant Text_Result :=
        Point_Change (Support.En, 1.0);
      Unit_Change_Text : constant Text_Result :=
        Unit_Change (Support.En, 1.0, "file");
   begin
      Ordinal_Into (Support.En, 22, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "22nd",
         "bounded ordinal, status " & Status_Image (Code));
      Compact_Into (Support.En, 1_200, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1.2K",
         "bounded compact, status " & Status_Image (Code));
      declare
         Capped : constant Text_Result :=
           Bounded_Number (Support.En, 110, 100);
         Plain : constant Text_Result :=
           Bounded_Number (Support.De, 50, 100);
         Grouped : constant Text_Result :=
           Bounded_Number (Support.De, 1_250, 1_000);
      begin
         AUnit.Assertions.Assert
           (Capped.Status = Ok and then Support.Text (Capped) = "100+",
            "bounded number cap");
         AUnit.Assertions.Assert
           (Plain.Status = Ok and then Support.Text (Plain) = "50",
            "bounded number below cap");
         AUnit.Assertions.Assert
           (Grouped.Status = Ok and then Support.Text (Grouped) = "1.000+",
            "bounded number uses i18n number formatting");
      end;
      AUnit.Assertions.Assert
        (Range_Text.Status = Ok and then Support.Text (Range_Text) = "1-5",
         "number range");
      AUnit.Assertions.Assert
        (Spaced_Range.Status = Ok and then Support.Text (Spaced_Range) = "1 : 5",
         "number range options");
      AUnit.Assertions.Assert
        (Approx_Range.Status = Ok
         and then Support.Text (Approx_Range) = "about 10-20",
         "approximate number range");
      AUnit.Assertions.Assert
        (Under_Text.Status = Ok and then Support.Text (Under_Text) = "under 5",
         "under number");
      AUnit.Assertions.Assert
        (German_Regional_Under.Status = Ok
         and then Support.Text (German_Regional_Under) = "unter 5",
         "regional German number phrase uses language-code fallback");
      AUnit.Assertions.Assert
        (Up_To_Text.Status = Ok and then Support.Text (Up_To_Text) = "up to 100",
         "up-to number");
      AUnit.Assertions.Assert
        (Between_Text.Status = Ok
         and then Support.Text (Between_Text) = "between 3 and 7",
         "between numbers");
      AUnit.Assertions.Assert
        (German_Regional_Between.Status = Ok
         and then Support.Text (German_Regional_Between) = "zwischen 3 und 7",
         "regional German between phrase uses language-code fallback");
      AUnit.Assertions.Assert
        (Qualified_Inclusive.Status = Ok
         and then Support.Text (Qualified_Inclusive) = "3 to 7 inclusive",
         "inclusive qualified range");
      AUnit.Assertions.Assert
        (Qualified_Exclusive.Status = Ok
         and then Support.Text (Qualified_Exclusive)
           = "greater than 3 and less than 7",
         "exclusive qualified range");
      AUnit.Assertions.Assert
        (Qualified_Low_Only.Status = Ok
         and then Support.Text (Qualified_Low_Only)
           = "3 or more and less than 7",
         "low-inclusive qualified range");
      AUnit.Assertions.Assert
        (Qualified_High_Only.Status = Ok
         and then Support.Text (Qualified_High_Only)
           = "greater than 3 and up to 7",
         "high-inclusive qualified range");
      AUnit.Assertions.Assert
        (Invalid_Qualified.Status = Invalid_Value,
         "qualified range rejects reversed bounds");
      AUnit.Assertions.Assert
        (Tolerance_Text.Status = Ok
         and then Support.Text (Tolerance_Text) = "10 +/- 2",
         "tolerance range");
      AUnit.Assertions.Assert
        (Decimal_Range_Text.Status = Ok
         and then Support.Text (Decimal_Range_Text) = "1.25 to 3.5",
         "decimal range");
      AUnit.Assertions.Assert
        (Decimal_Range_Meta.Status = Ok
         and then Decimal_Range_Meta.Kind = Rendered_Decimal_Range
         and then abs (Decimal_Range_Meta.Low - 1.25) < 0.0001
         and then Decimal_Range_Meta.Fraction_Digits = 2,
         "decimal range metadata");
      AUnit.Assertions.Assert
        (Decimal_Range_Word_Text.Status = Ok
         and then Support.Text (Decimal_Range_Word_Text)
           = "one point two five to three point five zero",
         "decimal range words");
      AUnit.Assertions.Assert
        (Invalid_Decimal_Range.Status = Invalid_Value,
         "decimal range rejects reversed bounds");
      AUnit.Assertions.Assert
        (Plus_Minus_Uncertainty.Status = Ok
         and then Support.Text (Plus_Minus_Uncertainty) = "12.3 +/- 0.4",
         "plus-minus uncertainty label");
      AUnit.Assertions.Assert
        (Uncertainty_Meta.Status = Ok
         and then Uncertainty_Meta.Kind = Rendered_Uncertainty
         and then Uncertainty_Meta.Style = Interval_Uncertainty
         and then abs (Uncertainty_Meta.Low - 11.9) < 0.0001,
         "uncertainty metadata");
      AUnit.Assertions.Assert
        (Uncertainty_Word_Text.Status = Ok
         and then Support.Text (Uncertainty_Word_Text)
           = "twelve point three plus or minus zero point four",
         "uncertainty words");
      AUnit.Assertions.Assert
        (Parenthesized_Uncertainty_Text.Status = Ok
         and then Support.Text (Parenthesized_Uncertainty_Text)
           = "12.3 (+/- 0.4)",
         "parenthesized uncertainty label");
      AUnit.Assertions.Assert
        (Interval_Uncertainty_Text.Status = Ok
         and then Support.Text (Interval_Uncertainty_Text) = "11.9 to 12.7",
         "interval uncertainty label");
      AUnit.Assertions.Assert
        (Invalid_Uncertainty.Status = Invalid_Value,
         "uncertainty rejects negative delta");
      AUnit.Assertions.Assert
        (Threshold_Text.Status = Ok
         and then Support.Text (Threshold_Text) = "at least 10"
         and then Threshold_Max.Status = Ok
         and then Support.Text (Threshold_Max) = "at most 10",
         "threshold labels");
      AUnit.Assertions.Assert
        (Range_Within.Status = Ok
         and then Support.Text (Range_Within) = "5 is within 3-7",
         "range position within");
      AUnit.Assertions.Assert
        (Range_Below.Status = Ok
         and then Support.Text (Range_Below) = "3 is below 3-7",
         "range position below exclusive boundary");
      AUnit.Assertions.Assert
        (Range_Above.Status = Ok
         and then Support.Text (Range_Above) = "8 is above 3-7",
         "range position above");
      AUnit.Assertions.Assert
        (Ratio_Text.Status = Ok and then Support.Text (Ratio_Text) = "2:1",
         "ratio phrase");
      AUnit.Assertions.Assert
        (Ratio_Per_Text.Status = Ok
         and then Support.Text (Ratio_Per_Text) = "2 errors per file",
         "ratio per noun phrase");
      AUnit.Assertions.Assert
        (Ratio_Per_Denominator.Status = Ok
         and then Support.Text (Ratio_Per_Denominator)
           = "5 failures per 2 runs",
         "ratio per denominator count");
      AUnit.Assertions.Assert
        (One_In_Text.Status = Ok and then Support.Text (One_In_Text) = "1 in 4",
         "one-in proportion");
      AUnit.Assertions.Assert
        (Out_Of_Text.Status = Ok
         and then Support.Text (Out_Of_Text) = "3 out of 10",
         "out-of proportion");
      AUnit.Assertions.Assert
        (Direction_Of_Change (-0.1) = Change_Down
         and then Direction_Of_Change (0.0) = Change_None
         and then Direction_Of_Change (0.1) = Change_Up,
         "change direction metadata");
      AUnit.Assertions.Assert
        (Change_Up_Text.Status = Ok
         and then Support.Text (Change_Up_Text) = "up 4",
         "directional positive change");
      AUnit.Assertions.Assert
        (Change_Down_Text.Status = Ok
         and then Support.Text (Change_Down_Text) = "down 2.5",
         "directional negative change");
      AUnit.Assertions.Assert
        (Change_Zero_Text.Status = Ok
         and then Support.Text (Change_Zero_Text) = "unchanged",
         "change zero defaults to unchanged");
      AUnit.Assertions.Assert
        (Change_Signed_Text.Status = Ok
         and then Support.Text (Change_Signed_Text) = "+4",
         "signed positive change");
      AUnit.Assertions.Assert
        (Change_Comparative_Text.Status = Ok
         and then Support.Text (Change_Comparative_Text) = "5 fewer errors",
         "comparative unit change");
      AUnit.Assertions.Assert
        (Change_Since_Text.Status = Ok
         and then Support.Text (Change_Since_Text) = "up 4 since yesterday",
         "change since baseline label");
      AUnit.Assertions.Assert
        (Change_From_Text.Status = Ok
         and then Support.Text (Change_From_Text) = "up 2",
         "change from previous value");
      AUnit.Assertions.Assert
        (Percent_Change_Text.Status = Ok
         and then Support.Text (Percent_Change_Text) = "down 12.5%",
         "percent change");
      AUnit.Assertions.Assert
        (German_Percent_Change.Status = Ok
         and then Support.Text (German_Percent_Change) = "plus 12,5%",
         "percent change uses localized percent rendering");
      AUnit.Assertions.Assert
        (Percent_Delta_Text.Status = Ok
         and then Support.Text (Percent_Delta_Text) = "up 20%",
         "relative percent delta");
      AUnit.Assertions.Assert
        (Invalid_Percent_Delta.Status = Invalid_Value,
         "percent delta rejects zero baseline");
      AUnit.Assertions.Assert
        (Point_Change_Text.Status = Ok
         and then Support.Text (Point_Change_Text) = "up 1 point",
         "point change singular");
      AUnit.Assertions.Assert
        (Unit_Change_Text.Status = Ok
         and then Support.Text (Unit_Change_Text) = "up 1 file",
         "unit change singular");
      Out_Of_Into (Support.En, 3, 10, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "3 out of 10",
         "bounded out-of proportion");
      Qualified_Range_Into
        (Support.En, 3, 7, Buffer, Written, Code, Exclusive_Range);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow
         and then Buffer (1 .. Written) = "greater than 3 a",
         "bounded qualified range overflow");
      Ratio_Per_Into
        (Support.En, 2, 1, "error", "file", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow
         and then Buffer (1 .. Written) = "2 errors per fil",
         "bounded ratio per overflow");
      Percent_Change_Into (Support.En, -12.5, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "down 12.5%",
         "bounded percent change");
      Decimal_Range_Into
        (Support.En, 1.25, 3.5, Buffer, Written, Code,
         (Maximum_Fraction_Digits => 2,
          Suppress_Trailing_Zero => True));
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1.25 to 3.5",
         "bounded decimal range");
      Uncertainty_Label_Into
        (Support.En, 12.3, 0.4, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "12.3 +/- 0.4",
         "bounded uncertainty label");
      declare
         Word_Buffer : String (1 .. 80);
      begin
         Decimal_Range_Words_Into
           (Support.En, 1.25, 3.5, Word_Buffer, Written, Code, 2);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Word_Buffer (1 .. Written)
              = "one point two five to three point five zero",
            "bounded decimal range words");
         Uncertainty_Words_Into
           (Support.En, 12.3, 0.4, Word_Buffer, Written, Code, 1);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Word_Buffer (1 .. Written)
              = "twelve point three plus or minus zero point four",
            "bounded uncertainty words");
      end;
   end Test_Number_Bounded;
