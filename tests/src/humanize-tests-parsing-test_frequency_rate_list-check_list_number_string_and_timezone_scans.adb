separate (Humanize.Tests.Parsing.Test_Frequency_Rate_List)
   procedure Check_List_Number_String_And_Timezone_Scans is
   begin
      AUnit.Assertions.Assert
        (Scanned_List.Status = Humanize.Status.Ok
         and then Scanned_List.Count = 3
         and then Scanned_List.Consumed = 20,
         "scan list prefix");
      AUnit.Assertions.Assert
        (Scanned_Percent.Status = Humanize.Status.Ok
         and then Scanned_Percent.Value = 13
         and then Scanned_Percent.Consumed = 5,
         "scan percent prefix");
      AUnit.Assertions.Assert
        (Scanned_Ordinal.Status = Humanize.Status.Ok
         and then Scanned_Ordinal.Value = 21
         and then Scanned_Ordinal.Consumed = 4,
         "scan ordinal prefix");
      AUnit.Assertions.Assert
        (Roman.Status = Humanize.Status.Ok and then Roman.Value = 2026,
         "parse Roman numeral");
      AUnit.Assertions.Assert
        (Lower_Roman.Status = Humanize.Status.Ok
         and then Lower_Roman.Value = 944,
         "parse lowercase Roman numeral");
      AUnit.Assertions.Assert
        (Bad_Roman.Status = Humanize.Status.Invalid_Argument,
         "reject noncanonical Roman numeral");
      AUnit.Assertions.Assert
        (Scanned_Roman.Status = Humanize.Status.Ok
         and then Scanned_Roman.Value = 2026
         and then Scanned_Roman.Consumed = 6,
         "scan Roman numeral");
      AUnit.Assertions.Assert
        (Normal_Unit.Status = Humanize.Status.Ok
         and then Humanize.Tests.Support.Text (Normal_Unit)
           = "kilometers per hour",
         "normalize unit text");
      AUnit.Assertions.Assert
        (Normal_List.Status = Humanize.Status.Ok
         and then Humanize.Tests.Support.Text (Normal_List)
           = "ada, spark and alire",
         "normalize list text");
      AUnit.Assertions.Assert
        (Tomorrow.Status = Humanize.Status.Ok
         and then Tomorrow.Value = Ref_Date + 86_400.0,
         "parse natural date tomorrow");
      AUnit.Assertions.Assert
        (Russian_Today.Status = Humanize.Status.Ok
         and then Russian_Today.Value = Ref_Date,
         "parse localized natural date today");
      AUnit.Assertions.Assert
        (Danish_In_Weeks.Status = Humanize.Status.Ok
         and then Danish_In_Weeks.Value = Ref_Date + 14.0 * 86_400.0,
         "parse localized relative natural date");
      AUnit.Assertions.Assert
        (Russian_Ago.Status = Humanize.Status.Ok
         and then Russian_Ago.Value = Ref_Date - 2.0 * 86_400.0,
         "parse localized natural date ago");
      AUnit.Assertions.Assert
        (Next_Fri.Status = Humanize.Status.Ok
         and then Next_Fri.Value = Ref_Date + 4.0 * 86_400.0,
         "parse natural next weekday");
      AUnit.Assertions.Assert
        (Friday_After_Next.Status = Humanize.Status.Ok
         and then Friday_After_Next.Value = Ref_Date + 11.0 * 86_400.0,
         "parse natural weekday after next");
      AUnit.Assertions.Assert
        (Next_Fri_Afternoon.Status = Humanize.Status.Ok
         and then Next_Fri_Afternoon.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 13.0 * 3_600.0),
         "parse natural weekday with time-of-day");
      AUnit.Assertions.Assert
        (Next_Fri_At_1730.Status = Humanize.Status.Ok
         and then Next_Fri_At_1730.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 17.0 * 3_600.0 + 30.0 * 60.0),
         "parse natural weekday with clock time");
      AUnit.Assertions.Assert
        (Next_Fri_At_1730_TZ.Status = Humanize.Status.Ok
         and then Next_Fri_At_1730_TZ.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 15.0 * 3_600.0 + 30.0 * 60.0),
         "parse natural weekday with clock time and timezone");
      AUnit.Assertions.Assert
        (Next_Fri_At_1730_CEST.Status = Humanize.Status.Ok
         and then Next_Fri_At_1730_CEST.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 15.0 * 3_600.0 + 30.0 * 60.0),
         "parse natural weekday with clock time and timezone name");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_TZ_Name.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_TZ_Name.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 16.0 * 3_600.0),
         "parse natural date with timezone name");
      AUnit.Assertions.Assert
        (Tomorrow_At_5_PM_TZ_Name.Status = Humanize.Status.Ok
         and then Tomorrow_At_5_PM_TZ_Name.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 16.0 * 3_600.0),
         "parse natural date with timezone name and split am/pm");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_UTC_Plus2.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_UTC_Plus2.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 15.0 * 3_600.0),
         "parse natural date with UTC timezone offset -- status="
         & Humanize.Status.Status_Code'Image (Tomorrow_At_5pm_UTC_Plus2.Status)
         & ", value="
         & Ada.Calendar.Formatting.Image (Tomorrow_At_5pm_UTC_Plus2.Value));
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_UTC_Plus2_NoSpace.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_UTC_Plus2_NoSpace.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 15.0 * 3_600.0),
         "parse natural date with UTC timezone offset without space");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_GMT_Minus2.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_GMT_Minus2.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 19.0 * 3_600.0),
         "parse natural date with GMT timezone offset");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_TZ_NoSpace.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_TZ_NoSpace.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 17.0 * 3_600.0),
         "parse natural date with no-space time and timezone suffix");
      AUnit.Assertions.Assert
        (Tonight_At_5pm_TZ.Status = Humanize.Status.Ok
         and then Tonight_At_5pm_TZ.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 0.0),
         "parse natural date with pm timezone suffix");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_TZ.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_TZ.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 17.0 * 3_600.0),
         "parse natural date with timezone suffix and space: status="
         & Humanize.Status.Status_Code'Image (Tomorrow_At_5pm_TZ.Status)
         & " value="
         & Ada.Calendar.Formatting.Image (Tomorrow_At_5pm_TZ.Value)
         & " error-pos="
         & Integer'Image (Tomorrow_At_5pm_TZ.Error_Position));
      AUnit.Assertions.Assert
        (Tonight.Status = Humanize.Status.Ok
         and then Tonight.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 21.0 * 3_600.0),
         "parse tonight");
      AUnit.Assertions.Assert
        (Later_Today.Status = Humanize.Status.Ok
         and then Later_Today.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 13.0 * 3_600.0),
         "parse later today");
      AUnit.Assertions.Assert
        (Scanned_Tonight.Status = Humanize.Status.Ok
         and then Scanned_Tonight.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 21.0 * 3_600.0)
         and then Scanned_Tonight.Consumed = 7,
         "scan tonight");
      AUnit.Assertions.Assert
        (Scanned_Fri_Afternoon.Status = Humanize.Status.Ok
         and then Scanned_Fri_Afternoon.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 13.0 * 3_600.0)
         and then Scanned_Fri_Afternoon.Consumed = 21,
         "scan natural weekday with time-of-day");
      AUnit.Assertions.Assert
        (Scanned_Tonight_TZ.Status = Humanize.Status.Ok
         and then Scanned_Tonight_TZ.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 15.0 * 3_600.0)
         and then Scanned_Tonight_TZ.Consumed = 19,
         "scan natural weekday with clock time and timezone");
      AUnit.Assertions.Assert
        (Scanned_Tonight_TZ_Name.Status = Humanize.Status.Ok
         and then Scanned_Tonight_TZ_Name.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 16.0 * 3_600.0)
         and then Scanned_Tonight_TZ_Name.Consumed = 19,
         "scan natural date with timezone name");
      AUnit.Assertions.Assert
        (Scanned_Tonight_TZ_Name_With_Space.Status = Humanize.Status.Ok
         and then Scanned_Tonight_TZ_Name_With_Space.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 16.0 * 3_600.0),
         "scan natural date with timezone name and split am/pm");
      AUnit.Assertions.Assert
        (Scanned_Tomorrow_At_5pm_UTC_Plus2.Status = Humanize.Status.Ok
         and then Scanned_Tomorrow_At_5pm_UTC_Plus2.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 15.0 * 3_600.0)
         and then Scanned_Tomorrow_At_5pm_UTC_Plus2.Consumed = 21,
         "scan natural date with UTC timezone offset");
      AUnit.Assertions.Assert
        (Scanned_Tomorrow_At_5pm_GMT_Minus2.Status = Humanize.Status.Ok
         and then Scanned_Tomorrow_At_5pm_GMT_Minus2.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 19.0 * 3_600.0)
         and then Scanned_Tomorrow_At_5pm_GMT_Minus2.Consumed = 23,
         "scan natural date with GMT timezone offset");
      AUnit.Assertions.Assert
        (Scanned_Date.Status = Humanize.Status.Ok
         and then Scanned_Date.Value = Ref_Date + 3.0 * 86_400.0
         and then Scanned_Date.Consumed = 9,
         "scan natural date");
      AUnit.Assertions.Assert
        (In_A_Couple_Of_Weeks.Status = Humanize.Status.Ok
         and then In_A_Couple_Of_Weeks.Value =
           Ada.Calendar.Time_Of (2024, 1, 15, 0.0),
         "parse natural date couple of weeks");
      AUnit.Assertions.Assert
        (In_A_Fortnight.Status = Humanize.Status.Ok
         and then In_A_Fortnight.Value =
           Ada.Calendar.Time_Of (2024, 1, 15, 0.0),
         "parse natural date fortnight");
      AUnit.Assertions.Assert
        (Fortnight_Ago.Status = Humanize.Status.Ok
         and then Fortnight_Ago.Value =
           Ada.Calendar.Time_Of (2023, 12, 18, 0.0),
         "parse natural date fortnight ago");
      AUnit.Assertions.Assert
        (Tomorrow_At_5.Status = Humanize.Status.Ok
         and then Tomorrow_At_5.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 17.0 * 3_600.0),
         "parse natural date with clock time");
      AUnit.Assertions.Assert
        (Tomorrow_Around_Noon.Status = Humanize.Status.Ok
         and then Tomorrow_Around_Noon.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 12.0 * 3_600.0),
         "parse natural date around noon");
      AUnit.Assertions.Assert
        (End_Next_Business_Month.Status = Humanize.Status.Ok
         and then End_Next_Business_Month.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse end of next business month");
      AUnit.Assertions.Assert
        (Next_Month_Third.Status = Humanize.Status.Ok
         and then Next_Month_Third.Value =
           Ada.Calendar.Time_Of (2024, 2, 3, 0.0),
         "parse next month ordinal date");
      AUnit.Assertions.Assert
        (ISO_Date.Status = Humanize.Status.Ok
         and then ISO_Date.Value = Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse ISO natural date");
      AUnit.Assertions.Assert
        (ISO_Ordinal_Date.Status = Humanize.Status.Ok
         and then ISO_Ordinal_Date.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse ISO ordinal date");
      AUnit.Assertions.Assert
        (ISO_Week_Date.Status = Humanize.Status.Ok
         and then ISO_Week_Date.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse ISO week date");
      AUnit.Assertions.Assert
        (ISO_Week_Start.Status = Humanize.Status.Ok
         and then ISO_Week_Start.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
         "parse ISO week start date");
      AUnit.Assertions.Assert
        (Scanned_ISO_Week.Status = Humanize.Status.Ok
         and then Scanned_ISO_Week.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0)
         and then Scanned_ISO_Week.Consumed = 10,
         "scan ISO week date");
      AUnit.Assertions.Assert
        (Month_Name.Status = Humanize.Status.Ok
         and then Month_Name.Value = Ada.Calendar.Time_Of (2024, 2, 2, 0.0),
         "parse month-name natural date");
      AUnit.Assertions.Assert
        (Month_Day_Ordinal.Status = Humanize.Status.Ok
         and then Month_Day_Ordinal.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
         "parse month-day ordinal date");
      AUnit.Assertions.Assert
        (Weekday_Ordinal.Status = Humanize.Status.Ok
         and then Weekday_Ordinal.Value =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
         "parse weekday ordinal date");
      AUnit.Assertions.Assert
        (Scanned_Month_Day_Ordinal.Status = Humanize.Status.Ok
         and then Scanned_Month_Day_Ordinal.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0)
         and then Scanned_Month_Day_Ordinal.Consumed = 7,
         "scan month-day ordinal date");
   end Check_List_Number_String_And_Timezone_Scans;
