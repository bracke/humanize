separate (Humanize.Tests.Parsing)
   procedure Test_Round_Trip_Parsers
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);

      Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("12.5 USD");
      Approx_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Approximate_Currency ("under 12.5 USD");
      Prefix_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("USD 12.5");
      Attached_Prefix_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("USD12.5");
      Symbol_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("$ 12.5");
      Attached_Symbol_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("$12.5");
      Scan_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Scan_Currency ("$20");
      Currency_Missing_Code : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("12.5");
      Currency_With_Trailing_Text : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("12.5 USD now");
      Prefix_With_Trailing_Text : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("USD 12.5 now");
      Symbol_With_Trailing_Text : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("$ 12.5 now");
      Approx_Number : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Approximate_Number ("about 42");
      Change : constant Humanize.Parsing.Change_Parse_Result :=
        Humanize.Parsing.Parse_Change ("down 12.5%");
      Unit_Change : constant Humanize.Parsing.Change_Parse_Result :=
        Humanize.Parsing.Parse_Change ("5 fewer errors since yesterday");
      Number_Comparison : constant Humanize.Parsing.Comparison_Parse_Result :=
        Humanize.Parsing.Parse_Number_Comparison
          ("value is 3 errors higher than baseline");
      Percent_Comparison : constant Humanize.Parsing.Comparison_Parse_Result :=
        Humanize.Parsing.Parse_Percent_Comparison
          ("value is 12.5% lower than baseline");
      File_Comparison : constant Humanize.Parsing.Comparison_Parse_Result :=
        Humanize.Parsing.Parse_File_Size_Comparison
          ("file is 1 KiB larger than old file");
      Date_Before : constant
        Humanize.Parsing.Date_Comparison_Parse_Result :=
          Humanize.Parsing.Parse_Date_Comparison
            ("updated is 3 days before release");
      Date_After : constant
        Humanize.Parsing.Date_Comparison_Parse_Result :=
          Humanize.Parsing.Parse_Date_Comparison
            ("published is 1 year, 2 months and 3 days after release");
      Date_Same : constant
        Humanize.Parsing.Date_Comparison_Parse_Result :=
          Humanize.Parsing.Parse_Date_Comparison
            ("published is the same date as release");
      Scanned_Date : constant
        Humanize.Parsing.Date_Comparison_Parse_Result :=
          Humanize.Parsing.Scan_Date_Comparison
            ("updated is 3 days before release; cached");
      Equal_Comparison : constant Humanize.Parsing.Comparison_Parse_Result :=
        Humanize.Parsing.Parse_Number_Comparison
          ("value is equal to baseline");
      Matrix : constant
        Humanize.Parsing.Palette_Contrast_Matrix_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Contrast_Matrix
            ("1 enhanced, 1 normal, 1 large-only, 0 fail out of 3 pairs");
      Palette_Metadata : constant
        Humanize.Parsing.Palette_Metadata_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Metadata_Label
            ("3 colors, 3 pairs: 1 enhanced, 1 normal, 1 large-only, 0 fail");
      APCA : constant Humanize.Parsing.APCA_Label_Parse_Result :=
        Humanize.Parsing.Parse_APCA_Contrast_Label
          ("Lc 100, excellent, dark text on light background");
      CVD : constant
        Humanize.Parsing.Color_Vision_Deficiency_Parse_Result :=
          Humanize.Parsing.Parse_Color_Vision_Deficiency_Label
            ("deuteranopia low confusion risk, delta 33");
      Summary : constant Humanize.Parsing.Color_Accessibility_Parse_Result :=
        Humanize.Parsing.Parse_Color_Accessibility_Summary
          ("21:1 enhanced contrast; Lc 100, excellent, "
           & "dark text on light background; protanopia distinct");
      RGB_Label : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGB_Label ("rgb(51, 102, 153)");
      RGBA_Label : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGBA_Label ("rgba(51, 102, 153, 0.5)");
      CSS_Label : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_CSS_Color_Label ("currentColor");
      Color_Summary : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_Color_Summary
          ("#336699 rgb(51, 102, 153)");
      HSL_Label : constant Humanize.Parsing.Color_Model_Label_Parse_Result :=
        Humanize.Parsing.Parse_HSL_Label ("hsl(210, 50%, 40%)");
      HSV_Label : constant Humanize.Parsing.Color_Model_Label_Parse_Result :=
        Humanize.Parsing.Parse_HSV_Label ("hsv(210, 67%, 60%)");
      Color_Bucket : constant
        Humanize.Parsing.Color_Bucket_Label_Parse_Result :=
          Humanize.Parsing.Parse_Color_Bucket_Label ("moderate chroma");
      Localized_Color_Bucket : constant
        Humanize.Parsing.Color_Bucket_Label_Parse_Result :=
          Humanize.Parsing.Parse_Color_Bucket_Label ("mittleres Chroma");
      Color_Description : constant
        Humanize.Parsing.Color_Description_Parse_Result :=
          Humanize.Parsing.Parse_Color_Description
            ("dark, muted blue, cool, moderate chroma");
      Localized_Color_Description : constant
        Humanize.Parsing.Color_Description_Parse_Result :=
          Humanize.Parsing.Parse_Color_Description
            ("dunkel, gedaempft blau, kuehl, mittleres Chroma");
      Localized_Accessibility : constant
        Humanize.Parsing.Color_Accessibility_Parse_Result :=
          Humanize.Parsing.Parse_Color_Accessibility_Summary
            ("21:1 erhoehter Kontrast; Lc 100, excellent, "
             & "dark text on light background; protanopia distinct");
      Alpha_Contrast : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Alpha_Contrast_Label
            ("3.9:1 large-text contrast after alpha compositing");
      Remediation_Pass : constant
        Humanize.Parsing.Contrast_Remediation_Parse_Result :=
          Humanize.Parsing.Parse_Contrast_Remediation_Label
            ("current foreground meets normal text contrast at 21:1");
      Remediation_Use : constant
        Humanize.Parsing.Contrast_Remediation_Parse_Result :=
          Humanize.Parsing.Parse_Contrast_Remediation_Label
            ("use #767676 for 4.5:1 normal text contrast");
      Opacity : constant Humanize.Parsing.Color_Difference_Label_Parse_Result :=
        Humanize.Parsing.Parse_Opacity_Label ("50% translucent");
      Palette_Summary : constant
        Humanize.Parsing.Palette_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Summary
            ("3 colors, mostly blue, high contrast spread");
      Palette_Roles : constant Humanize.Parsing.Palette_Roles_Parse_Result :=
        Humanize.Parsing.Parse_Palette_Roles
          ("background #FFFFFF, text #000000, accent #336699");
      Palette_Harmony : constant
        Humanize.Parsing.Color_Bucket_Label_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Harmony_Label
            ("complementary palette");
      Palette_Contrast : constant
        Humanize.Parsing.Palette_Contrast_Suggestion_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Contrast_Suggestion
            ("best contrast #000000 on #FFFFFF at 21:1");
      Palette_Accessibility : constant
        Humanize.Parsing.Palette_Accessibility_Label_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Accessibility_Label
            ("1 of 3 pairs pass normal text contrast");
      Palette_Mood : constant Humanize.Parsing.Palette_Mood_Parse_Result :=
        Humanize.Parsing.Parse_Palette_Mood_Label
          ("dark, subtle, cool mood");
      Advanced_Palette : constant Humanize.Parsing.Palette_Mood_Parse_Result :=
        Humanize.Parsing.Parse_Advanced_Palette_Summary
          ("complementary palette, dark, subtle, cool mood, "
           & "1 of 3 pairs pass normal text contrast; background #FFFFFF, "
           & "text #000000, accent #336699");
      Color_Difference : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Color_Difference_Label
            ("12% noticeable difference");
      Perceptual_Difference : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Perceptual_Difference_Label
            ("OKLab delta 12.5, noticeable perceptual difference");
      CIEDE2000_Difference : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Perceptual_Difference_Label
            ("CIEDE2000 delta 12.5, noticeable perceptual difference");
   begin
      AUnit.Assertions.Assert
        (Currency.Status = Humanize.Status.Ok
         and then Currency.Amount = 12.5
         and then Currency.Code (1 .. Currency.Code_Length) = "USD"
         and then not Currency.Approximate,
         "parse deterministic currency output");
      AUnit.Assertions.Assert
         (Approx_Currency.Status = Humanize.Status.Ok
          and then Approx_Currency.Amount = 12.5
          and then Approx_Currency.Code (1 .. Approx_Currency.Code_Length) =
           "USD"
         and then Approx_Currency.Approximate
         and then Approx_Currency.Kind = Humanize.Numbers.Under,
         "parse approximate currency output");
      AUnit.Assertions.Assert
        (Prefix_Currency.Status = Humanize.Status.Ok
         and then Prefix_Currency.Amount = 12.5
         and then Prefix_Currency.Code (1 .. Prefix_Currency.Code_Length) = "USD",
         "parse currency prefix format");
      AUnit.Assertions.Assert
        (Prefix_Currency.Consumed = 8,
         "parse currency prefix consumed length");
      AUnit.Assertions.Assert
        (Attached_Prefix_Currency.Status = Humanize.Status.Ok
         and then Attached_Prefix_Currency.Amount = 12.5
         and then Attached_Prefix_Currency.Code
           (1 .. Attached_Prefix_Currency.Code_Length) = "USD",
         "parse currency prefix-attached format");
      AUnit.Assertions.Assert
        (Symbol_Currency.Status = Humanize.Status.Ok
         and then Symbol_Currency.Amount = 12.5
         and then Symbol_Currency.Code (1 .. Symbol_Currency.Code_Length) = "USD"
         and then Symbol_Currency.Consumed = 6,
         "parse currency symbol format");
      AUnit.Assertions.Assert
        (Attached_Symbol_Currency.Status = Humanize.Status.Ok
         and then Attached_Symbol_Currency.Amount = 12.5
         and then Attached_Symbol_Currency.Code
           (1 .. Attached_Symbol_Currency.Code_Length) = "USD",
         "parse currency symbol-attached format");
      AUnit.Assertions.Assert
        (Scan_Currency.Status = Humanize.Status.Ok
         and then Scan_Currency.Amount = 20.0
         and then Scan_Currency.Code (1 .. Scan_Currency.Code_Length) = "USD"
         and then Scan_Currency.Consumed = 3,
         "scan currency output");
      AUnit.Assertions.Assert
        (Currency_Missing_Code.Status = Humanize.Status.Invalid_Argument,
         "reject currency without code");
      AUnit.Assertions.Assert
        (Currency_With_Trailing_Text.Status = Humanize.Status.Invalid_Argument,
         "reject currency with trailing text (number-first)");
      AUnit.Assertions.Assert
        (Prefix_With_Trailing_Text.Status = Humanize.Status.Invalid_Argument,
         "reject currency with trailing text (prefix-first)");
      AUnit.Assertions.Assert
        (Symbol_With_Trailing_Text.Status = Humanize.Status.Invalid_Argument,
         "reject currency with trailing text (symbol)");
      AUnit.Assertions.Assert
        (Approx_Number.Status = Humanize.Status.Ok
         and then Approx_Number.Value = 42,
         "parse approximate number output");
      AUnit.Assertions.Assert
        (Change.Status = Humanize.Status.Ok
         and then Change.Value = -12.5
         and then Change.Percent
         and then not Change.Points,
         "parse percent change output");
      AUnit.Assertions.Assert
        (Unit_Change.Status = Humanize.Status.Ok
         and then Unit_Change.Value = -5.0
         and then Unit_Change.Unit (1 .. Unit_Change.Unit_Length) = "errors"
         and then Unit_Change.Since (1 .. Unit_Change.Since_Length) =
           "yesterday",
         "parse comparative unit change output");
      AUnit.Assertions.Assert
        (Number_Comparison.Status = Humanize.Status.Ok
         and then Number_Comparison.Direction =
           Humanize.Parsing.Comparison_Higher
         and then Number_Comparison.Difference = 3.0
         and then Number_Comparison.Unit
           (1 .. Number_Comparison.Unit_Length) = "errors"
         and then Number_Comparison.Current_Label
           (1 .. Number_Comparison.Current_Label_Length) = "value"
         and then Number_Comparison.Baseline_Label
           (1 .. Number_Comparison.Baseline_Label_Length) = "baseline",
         "parse number comparison output");
      AUnit.Assertions.Assert
        (Percent_Comparison.Status = Humanize.Status.Ok
         and then Percent_Comparison.Direction =
           Humanize.Parsing.Comparison_Lower
         and then Percent_Comparison.Difference = 12.5
         and then Percent_Comparison.Percent,
         "parse percent comparison output");
      AUnit.Assertions.Assert
        (File_Comparison.Status = Humanize.Status.Ok
         and then File_Comparison.Direction =
           Humanize.Parsing.Comparison_Larger
         and then File_Comparison.Difference = 1024.0
         and then File_Comparison.Byte_Size,
         "parse file-size comparison output");
      AUnit.Assertions.Assert
        (Date_Before.Status = Humanize.Status.Ok
         and then Date_Before.Direction =
           Humanize.Parsing.Comparison_Before
         and then Date_Before.Days = 3
         and then Date_Before.Current_Label
           (1 .. Date_Before.Current_Label_Length) = "updated"
         and then Date_Before.Baseline_Label
           (1 .. Date_Before.Baseline_Label_Length) = "release",
         "parse date before comparison output");
      AUnit.Assertions.Assert
        (Date_After.Status = Humanize.Status.Ok
         and then Date_After.Direction =
           Humanize.Parsing.Comparison_After
         and then Date_After.Years = 1
         and then Date_After.Months = 2
         and then Date_After.Days = 3,
         "parse date after comparison output");
      AUnit.Assertions.Assert
        (Date_Same.Status = Humanize.Status.Ok
         and then Date_Same.Direction =
           Humanize.Parsing.Comparison_Equal
         and then Date_Same.Years = 0
         and then Date_Same.Months = 0
         and then Date_Same.Days = 0,
         "parse same-date comparison output");
      AUnit.Assertions.Assert
        (Scanned_Date.Status = Humanize.Status.Ok
         and then Scanned_Date.Consumed = 32
         and then Scanned_Date.Direction =
           Humanize.Parsing.Comparison_Before,
         "scan date comparison output");
      AUnit.Assertions.Assert
        (Equal_Comparison.Status = Humanize.Status.Ok
         and then Equal_Comparison.Direction =
           Humanize.Parsing.Comparison_Equal
         and then Equal_Comparison.Difference = 0.0,
         "parse equal comparison output");
      AUnit.Assertions.Assert
        (Matrix.Status = Humanize.Status.Ok
         and then Matrix.Enhanced = 1
         and then Matrix.Normal = 1
         and then Matrix.Large_Only = 1
         and then Matrix.Fail = 0
         and then Matrix.Total = 3,
         "parse palette contrast matrix output");
      AUnit.Assertions.Assert
        (Palette_Metadata.Status = Humanize.Status.Ok
         and then Palette_Metadata.Color_Count = 3
         and then Palette_Metadata.Pair_Count = 3
         and then Palette_Metadata.Enhanced = 1
         and then Palette_Metadata.Normal = 1
         and then Palette_Metadata.Large_Only = 1
         and then Palette_Metadata.Fail = 0,
         "parse palette metadata label output");
      AUnit.Assertions.Assert
        (APCA.Status = Humanize.Status.Ok
         and then APCA.Score = 100.0
         and then APCA.Strength (1 .. APCA.Strength_Length) = "excellent"
         and then APCA.Polarity (1 .. APCA.Polarity_Length) =
           "dark text on light background",
         "parse APCA contrast label output");
      AUnit.Assertions.Assert
        (CVD.Status = Humanize.Status.Ok
         and then CVD.Deficiency = Humanize.Colors.Deuteranopia
         and then CVD.Risk (1 .. CVD.Risk_Length) =
           "low confusion risk"
         and then CVD.Difference = 33.0
         and then CVD.Has_Delta,
         "parse color vision deficiency label output");
      AUnit.Assertions.Assert
        (Summary.Status = Humanize.Status.Ok
         and then Summary.Contrast_Ratio = 21.0
         and then Summary.Contrast_Level
           (1 .. Summary.Contrast_Level_Length) = "enhanced"
         and then Summary.APCA.Score = 100.0
         and then Summary.CVD.Deficiency = Humanize.Colors.Protanopia
         and then Summary.CVD.Risk (1 .. Summary.CVD.Risk_Length) =
           "distinct"
         and then not Summary.CVD.Has_Delta,
         "parse combined color accessibility summary output");
      AUnit.Assertions.Assert
        (RGB_Label.Status = Humanize.Status.Ok
         and then RGB_Label.Color.Red = 51
         and then RGB_Label.Color.Green = 102
         and then RGB_Label.Color.Blue = 153
         and then not RGB_Label.Has_Opacity,
         "parse RGB label output");
      AUnit.Assertions.Assert
        (RGBA_Label.Status = Humanize.Status.Ok
         and then RGBA_Label.Color.Red = 51
         and then RGBA_Label.Color.Green = 102
         and then RGBA_Label.Color.Blue = 153
         and then RGBA_Label.Has_Opacity
         and then RGBA_Label.Opacity = 0.5,
         "parse RGBA label output");
      AUnit.Assertions.Assert
        (CSS_Label.Status = Humanize.Status.Ok
         and then CSS_Label.Is_Current,
         "parse CSS currentColor label output");
      AUnit.Assertions.Assert
        (Color_Summary.Status = Humanize.Status.Ok
         and then Color_Summary.Color.Red = 51
         and then Color_Summary.Color.Green = 102
         and then Color_Summary.Color.Blue = 153,
         "parse color summary output");
      AUnit.Assertions.Assert
        (HSL_Label.Status = Humanize.Status.Ok
         and then HSL_Label.First = 210.0
         and then HSL_Label.Second = 50.0
         and then HSL_Label.Third = 40.0,
         "parse HSL label output");
      AUnit.Assertions.Assert
        (HSV_Label.Status = Humanize.Status.Ok
         and then HSV_Label.First = 210.0
         and then HSV_Label.Second = 67.0
         and then HSV_Label.Third = 60.0,
         "parse HSV label output");
      AUnit.Assertions.Assert
        (Color_Bucket.Status = Humanize.Status.Ok
         and then Color_Bucket.Label (1 .. Color_Bucket.Label_Length) =
           "moderate chroma",
         "parse color bucket label output");
      AUnit.Assertions.Assert
        (Localized_Color_Bucket.Status = Humanize.Status.Ok
         and then Localized_Color_Bucket.Label
           (1 .. Localized_Color_Bucket.Label_Length) = "mittleres chroma",
         "parse localized color bucket label output");
      AUnit.Assertions.Assert
        (Color_Description.Status = Humanize.Status.Ok
         and then Color_Description.Brightness
           (1 .. Color_Description.Brightness_Length) = "dark"
         and then Color_Description.Saturation
           (1 .. Color_Description.Saturation_Length) = "muted"
         and then Color_Description.Hue
           (1 .. Color_Description.Hue_Length) = "blue"
         and then Color_Description.Temperature
           (1 .. Color_Description.Temperature_Length) = "cool"
         and then Color_Description.Chroma
           (1 .. Color_Description.Chroma_Length) = "moderate chroma",
         "parse color description output");
      AUnit.Assertions.Assert
        (Localized_Color_Description.Status = Humanize.Status.Ok
         and then Localized_Color_Description.Brightness
           (1 .. Localized_Color_Description.Brightness_Length) = "dunkel"
         and then Localized_Color_Description.Saturation
           (1 .. Localized_Color_Description.Saturation_Length) = "gedaempft"
         and then Localized_Color_Description.Hue
           (1 .. Localized_Color_Description.Hue_Length) = "blau"
         and then Localized_Color_Description.Temperature
           (1 .. Localized_Color_Description.Temperature_Length) = "kuehl"
         and then Localized_Color_Description.Chroma
           (1 .. Localized_Color_Description.Chroma_Length) = "mittleres chroma",
         "parse localized color description output");
      AUnit.Assertions.Assert
        (Localized_Accessibility.Status = Humanize.Status.Ok
         and then Localized_Accessibility.Contrast_Ratio = 21.0
         and then Localized_Accessibility.Contrast_Level
           (1 .. Localized_Accessibility.Contrast_Level_Length)
           = "erhoehter Kontrast",
         "parse localized color accessibility summary output");
      AUnit.Assertions.Assert
        (Alpha_Contrast.Status = Humanize.Status.Ok
         and then Alpha_Contrast.Value = 3.9
         and then Alpha_Contrast.Label
           (1 .. Alpha_Contrast.Label_Length) = "large-text"
         and then not Alpha_Contrast.Perceptual,
         "parse alpha contrast label output");
      AUnit.Assertions.Assert
        (Remediation_Pass.Status = Humanize.Status.Ok
         and then Remediation_Pass.Already_Passes
         and then not Remediation_Pass.Has_Recommended_Color
         and then Remediation_Pass.Ratio = 21.0
         and then Remediation_Pass.Target
           (1 .. Remediation_Pass.Target_Length) = "normal text",
         "parse contrast remediation pass output");
      AUnit.Assertions.Assert
        (Remediation_Use.Status = Humanize.Status.Ok
         and then not Remediation_Use.Already_Passes
         and then Remediation_Use.Has_Recommended_Color
         and then Remediation_Use.Recommended_Color =
           (Red => 16#76#, Green => 16#76#, Blue => 16#76#)
         and then Remediation_Use.Ratio = 4.5
         and then Remediation_Use.Target
           (1 .. Remediation_Use.Target_Length) = "normal text",
         "parse contrast remediation suggestion output");
      AUnit.Assertions.Assert
        (Opacity.Status = Humanize.Status.Ok
         and then Opacity.Value = 50.0
         and then Opacity.Label (1 .. Opacity.Label_Length) =
           "translucent",
         "parse opacity label output");
      AUnit.Assertions.Assert
        (Palette_Summary.Status = Humanize.Status.Ok
         and then Palette_Summary.Count = 3
         and then Palette_Summary.Dominant_Color
           (1 .. Palette_Summary.Dominant_Color_Length) = "blue"
         and then Palette_Summary.Spread
           (1 .. Palette_Summary.Spread_Length) = "high contrast spread",
         "parse palette summary output");
      AUnit.Assertions.Assert
        (Palette_Roles.Status = Humanize.Status.Ok
         and then Palette_Roles.Background.Red = 255
         and then Palette_Roles.Background.Green = 255
         and then Palette_Roles.Background.Blue = 255
         and then Palette_Roles.Text_Color.Red = 0
         and then Palette_Roles.Accent.Red = 51
         and then Palette_Roles.Accent.Green = 102
         and then Palette_Roles.Accent.Blue = 153,
         "parse palette roles output");
      AUnit.Assertions.Assert
        (Palette_Harmony.Status = Humanize.Status.Ok
         and then Palette_Harmony.Label
           (1 .. Palette_Harmony.Label_Length) = "complementary palette",
         "parse palette harmony output");
      AUnit.Assertions.Assert
        (Palette_Contrast.Status = Humanize.Status.Ok
         and then Palette_Contrast.Foreground.Red = 0
         and then Palette_Contrast.Background.Red = 255
         and then Palette_Contrast.Ratio = 21.0,
         "parse palette contrast suggestion output");
      AUnit.Assertions.Assert
        (Palette_Accessibility.Status = Humanize.Status.Ok
         and then Palette_Accessibility.Passing = 1
         and then Palette_Accessibility.Total = 3
         and then Palette_Accessibility.Normal_Text
         and then Palette_Accessibility.Has_Accessible_Pairs,
         "parse palette accessibility output");
      AUnit.Assertions.Assert
        (Palette_Mood.Status = Humanize.Status.Ok
         and then Palette_Mood.Tone (1 .. Palette_Mood.Tone_Length) = "dark"
         and then Palette_Mood.Energy
           (1 .. Palette_Mood.Energy_Length) = "subtle"
         and then Palette_Mood.Temperature
           (1 .. Palette_Mood.Temperature_Length) = "cool",
         "parse palette mood output");
      AUnit.Assertions.Assert
        (Advanced_Palette.Status = Humanize.Status.Ok
         and then Advanced_Palette.Tone
           (1 .. Advanced_Palette.Tone_Length) = "dark"
         and then Advanced_Palette.Energy
           (1 .. Advanced_Palette.Energy_Length) = "subtle"
         and then Advanced_Palette.Temperature
           (1 .. Advanced_Palette.Temperature_Length) = "cool",
         "parse advanced palette summary output");
      AUnit.Assertions.Assert
        (Color_Difference.Status = Humanize.Status.Ok
         and then Color_Difference.Value = 12.0
         and then Color_Difference.Label
           (1 .. Color_Difference.Label_Length) =
             "noticeable difference"
         and then not Color_Difference.Perceptual,
         "parse color difference label output");
      AUnit.Assertions.Assert
        (Perceptual_Difference.Status = Humanize.Status.Ok
         and then Perceptual_Difference.Value = 12.5
         and then Perceptual_Difference.Label
           (1 .. Perceptual_Difference.Label_Length) =
             "noticeable perceptual difference"
         and then Perceptual_Difference.Perceptual,
         "parse perceptual difference label output");
      AUnit.Assertions.Assert
        (CIEDE2000_Difference.Status = Humanize.Status.Ok
         and then CIEDE2000_Difference.Value = 12.5
         and then CIEDE2000_Difference.Label
           (1 .. CIEDE2000_Difference.Label_Length) =
             "noticeable perceptual difference"
         and then CIEDE2000_Difference.Perceptual,
         "parse CIEDE2000 perceptual difference label output");
   end Test_Round_Trip_Parsers;
