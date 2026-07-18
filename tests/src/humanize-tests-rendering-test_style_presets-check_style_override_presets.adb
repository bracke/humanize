separate (Humanize.Tests.Rendering.Test_Style_Presets)
   procedure Check_Style_Override_Presets is
      Override_Number : constant Humanize.Numbers.Number_Options :=
        Humanize.Styles.With_Number_Fraction_Digits
          (Humanize.Styles.Dashboard, 2, False);
      Override_Range : constant Humanize.Datetimes.Range_Options :=
        Humanize.Styles.With_Range_Separator
          (Humanize.Styles.Dashboard, '/');
      Override_Datetime : constant Humanize.Datetimes.Datetime_Options :=
        Humanize.Styles.With_Datetime_Threshold
          (Humanize.Styles.Dashboard, 5);
      Override_List : constant Humanize.Lists.List_Options :=
        Humanize.Styles.With_List_Oxford_Comma
          (Humanize.Styles.CLI, True);
      Override_Bytes : constant Humanize.Bytes.Byte_Options :=
        Humanize.Styles.With_Byte_Unit_System
          (Humanize.Styles.CLI, Humanize.Bytes.Binary);
      Override_Unit : constant Humanize.Units.Unit_Style :=
        Humanize.Styles.Select_Unit_Style
          (Humanize.Styles.Verbose, Humanize.Units.Abbreviated);
   begin
      AUnit.Assertions.Assert
        (Override_Number.Maximum_Fraction_Digits = 2
         and then not Override_Number.Suppress_Trailing_Zero,
         "style number override");
      AUnit.Assertions.Assert
        (Override_Range.Separator = '/'
         and then Override_Range.Use_Month_Names,
         "style range override");
      AUnit.Assertions.Assert
        (Override_Datetime.Now_Threshold_Seconds = 5,
         "style datetime threshold override");
      AUnit.Assertions.Assert
        (Override_List.Oxford_Comma,
         "style list override");
      AUnit.Assertions.Assert
        (Override_Bytes.Unit_System = Humanize.Bytes.Binary,
         "style byte unit-system override");
      AUnit.Assertions.Assert
        (Override_Unit = Humanize.Units.Abbreviated,
         "style unit override");
   end Check_Style_Override_Presets;
