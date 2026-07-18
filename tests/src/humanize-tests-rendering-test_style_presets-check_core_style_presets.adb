separate (Humanize.Tests.Rendering.Test_Style_Presets)
   procedure Check_Core_Style_Presets is
      use type Humanize.Datetimes.Calendar_Date_Style;
      Compact_Unit : constant Humanize.Units.Unit_Style :=
        Humanize.Styles.Unit_Style (Humanize.Styles.Compact_UI);
      Verbose_List : constant Humanize.Lists.List_Options :=
        Humanize.Styles.List_Options (Humanize.Styles.Verbose);
      Tech_Range : constant Humanize.Datetimes.Range_Options :=
        Humanize.Styles.Range_Options (Humanize.Styles.Technical);
      Compact_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options (Humanize.Styles.Compact_UI);
      Verbose_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options (Humanize.Styles.Verbose);
      Badge_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options
          (Humanize.Styles.Calendar_Date_Compact_Badge_Preset);
      Fiscal_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options
          (Humanize.Styles.Calendar_Date_Fiscal_Half_Preset, 4);
      Academic_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options
          (Humanize.Styles.Calendar_Date_Semester_Preset);
      Month_Phase_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options
          (Humanize.Styles.Calendar_Date_Month_Phase_Preset);
      Quarter_Phase_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options
          (Humanize.Styles.Calendar_Date_Quarter_Phase_Preset);
      Fiscal_End_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.With_Fiscal_Year_Start
          (Humanize.Styles.Calendar_Date_Fiscal_Year_End_Preset, 4);
      Override_Calendar_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.With_Calendar_Date_Style
          (Humanize.Styles.Dashboard,
           Humanize.Datetimes.Calendar_Date_Quarter_Phase);
      Rendered_Badge : constant Text_Result :=
        Humanize.Datetimes.Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           Badge_Date);
      Rendered_Fiscal : constant Text_Result :=
        Humanize.Datetimes.Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 10, Day => 1, others => 0),
           Fiscal_Date);
      Rendered_Academic : constant Text_Result :=
        Humanize.Datetimes.Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 9, Day => 1, others => 0),
           Academic_Date);
      Rendered_Month_Phase : constant Text_Result :=
        Humanize.Datetimes.Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 15, others => 0),
           Month_Phase_Date);
      Rendered_Quarter_Phase : constant Text_Result :=
        Humanize.Datetimes.Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 5, Day => 1, others => 0),
           Quarter_Phase_Date);
      Rendered_Fiscal_End : constant Text_Result :=
        Humanize.Datetimes.Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 4, Day => 1, others => 0),
           Fiscal_End_Date);
      Telemetry_Number : constant Humanize.Numbers.Number_Options :=
        Humanize.Styles.Number_Options (Humanize.Styles.Telemetry);
      Mobile_Unit : constant Humanize.Units.Unit_Style :=
        Humanize.Styles.Unit_Style (Humanize.Styles.Mobile_UI);
      Accessible_List : constant Humanize.Lists.List_Options :=
        Humanize.Styles.List_Options (Humanize.Styles.Accessibility);
   begin
      AUnit.Assertions.Assert
        (Compact_Unit = Humanize.Units.Abbreviated,
         "compact style uses abbreviated units");
      AUnit.Assertions.Assert
        (Verbose_List.Oxford_Comma,
         "verbose style uses Oxford comma");
      AUnit.Assertions.Assert
        (not Tech_Range.Use_Month_Names and then Tech_Range.Separator = '/',
         "technical range style");
      AUnit.Assertions.Assert
        (Compact_Date.Style = Humanize.Datetimes.Calendar_Date_Medium
         and then Verbose_Date.Style = Humanize.Datetimes.Calendar_Date_Long,
         "calendar date styles");
      AUnit.Assertions.Assert
        (Badge_Date.Style = Humanize.Datetimes.Calendar_Date_Compact_Badge
         and then Fiscal_Date.Style = Humanize.Datetimes.Calendar_Date_Fiscal_Half
         and then Fiscal_Date.Fiscal_Year_Start_Month = 4
         and then Academic_Date.Style = Humanize.Datetimes.Calendar_Date_Semester
         and then Month_Phase_Date.Style =
           Humanize.Datetimes.Calendar_Date_Month_Phase
         and then Quarter_Phase_Date.Style =
           Humanize.Datetimes.Calendar_Date_Quarter_Phase
         and then Fiscal_End_Date.Style =
           Humanize.Datetimes.Calendar_Date_Fiscal_Year_End
         and then Override_Calendar_Date.Style =
           Humanize.Datetimes.Calendar_Date_Quarter_Phase,
         "focused calendar date style presets");
      AUnit.Assertions.Assert
        (Rendered_Badge.Status = Ok
         and then Support.Text (Rendered_Badge) = "Mar 21"
         and then Rendered_Fiscal.Status = Ok
         and then Support.Text (Rendered_Fiscal) = "FY2027 H2"
         and then Rendered_Academic.Status = Ok
         and then Support.Text (Rendered_Academic) = "S2 2026"
         and then Rendered_Month_Phase.Status = Ok
         and then Support.Text (Rendered_Month_Phase) = "mid-March 2026"
         and then Rendered_Quarter_Phase.Status = Ok
         and then Support.Text (Rendered_Quarter_Phase) = "mid Q2 2026"
         and then Rendered_Fiscal_End.Status = Ok
         and then Support.Text (Rendered_Fiscal_End) = "end of FY2027",
         "focused calendar date style rendering");
      AUnit.Assertions.Assert
        (Telemetry_Number.Maximum_Fraction_Digits = 3
         and then not Telemetry_Number.Suppress_Trailing_Zero,
         "telemetry number style");
      AUnit.Assertions.Assert
        (Mobile_Unit = Humanize.Units.Abbreviated,
         "mobile style uses abbreviated units");
      AUnit.Assertions.Assert
        (Accessible_List.Oxford_Comma,
         "accessibility style uses Oxford comma");
   end Check_Core_Style_Presets;
