separate (Humanize.Tests.Parsing.Test_Frequency_Rate_List)
   procedure Check_Natural_Date_Range_And_Business_Calendar_Parsers is
   begin
      AUnit.Assertions.Assert
        (In_Weeks.Status = Humanize.Status.Ok
         and then In_Weeks.Value = Ref_Date + 14.0 * 86_400.0,
         "parse relative weeks");
      AUnit.Assertions.Assert
        (In_Few_Days.Status = Humanize.Status.Ok
         and then In_Few_Days.Value = Ada.Calendar.Time_Of (2024, 1, 4, 0.0),
         "parse fuzzy relative days");
      AUnit.Assertions.Assert
        (Month_Ago.Status = Humanize.Status.Ok
         and then Month_Ago.Value = Ada.Calendar.Time_Of (2023, 12, 1, 0.0),
         "parse relative months ago");
      AUnit.Assertions.Assert
        (This_Fri.Status = Humanize.Status.Ok
         and then This_Fri.Value = Ref_Date + 4.0 * 86_400.0,
         "parse this weekday");
      AUnit.Assertions.Assert
        (Last_Fri.Status = Humanize.Status.Ok
         and then Last_Fri.Value = Ref_Date - 3.0 * 86_400.0,
         "parse last weekday");
      AUnit.Assertions.Assert
        (Two_Fridays.Status = Humanize.Status.Ok
         and then Two_Fridays.Value = Ref_Date + 11.0 * 86_400.0,
         "parse repeated weekday from now");
      AUnit.Assertions.Assert
        (Friday_Before_Next.Status = Humanize.Status.Ok
         and then Friday_Before_Next.Value =
           Ada.Calendar.Time_Of (2023, 12, 29, 0.0),
         "parse weekday before next");
      AUnit.Assertions.Assert
        (End_Next_Month.Status = Humanize.Status.Ok
         and then End_Next_Month.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse end of next month");
      AUnit.Assertions.Assert
        (Start_Q3.Status = Humanize.Status.Ok
         and then Start_Q3.Value = Ada.Calendar.Time_Of (2024, 7, 1, 0.0),
         "parse start of quarter");
      AUnit.Assertions.Assert
        (End_Next_Quarter.Status = Humanize.Status.Ok
         and then End_Next_Quarter.Value =
           Ada.Calendar.Time_Of (2024, 6, 30, 0.0),
         "parse end of next quarter");
      AUnit.Assertions.Assert
        (Second_Tuesday_March.Status = Humanize.Status.Ok
         and then Second_Tuesday_March.Value =
           Ada.Calendar.Time_Of (2024, 3, 12, 0.0),
         "parse ordinal weekday in month");
      AUnit.Assertions.Assert
        (Last_Friday_March_2024.Status = Humanize.Status.Ok
         and then Last_Friday_March_2024.Value =
           Ada.Calendar.Time_Of (2024, 3, 29, 0.0),
         "parse last weekday in explicit month");
      AUnit.Assertions.Assert
        (Next_Business.Status = Humanize.Status.Ok
         and then Next_Business.Value = Ref_Date + 86_400.0,
         "parse next business day");
      AUnit.Assertions.Assert
        (Next_Business_Friday.Status = Humanize.Status.Ok
         and then Next_Business_Friday.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 0.0),
         "parse next business weekday");
      AUnit.Assertions.Assert
        (Three_Business.Status = Humanize.Status.Ok
         and then Three_Business.Value = Ref_Date + 3.0 * 86_400.0,
         "parse business days from now");
      AUnit.Assertions.Assert
        (Several_Business.Status = Humanize.Status.Ok
         and then Several_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 10, 0.0),
         "parse fuzzy business days from now");
      AUnit.Assertions.Assert
        (Before_Month_End.Status = Humanize.Status.Ok
         and then Before_Month_End.Value =
           Ada.Calendar.Time_Of (2024, 1, 29, 0.0),
         "parse business days before month end");
      AUnit.Assertions.Assert
        (Before_Next_Quarter_End.Status = Humanize.Status.Ok
         and then Before_Next_Quarter_End.Value =
           Ada.Calendar.Time_Of (2024, 6, 27, 0.0),
         "parse business days before next quarter end");
      AUnit.Assertions.Assert
        (Rule_Next_Business.Status = Humanize.Status.Ok
         and then Rule_Next_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
         "parse next business day with one-off holiday rules");
      AUnit.Assertions.Assert
        (Rule_Three_Business.Status = Humanize.Status.Ok
         and then Rule_Three_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 0.0),
         "parse business days from now with one-off holiday rules");
      AUnit.Assertions.Assert
        (Rule_Before_Month_End.Status = Humanize.Status.Ok
         and then Rule_Before_Month_End.Value =
           Ada.Calendar.Time_Of (2024, 1, 29, 0.0),
         "parse business days before boundary with rules");
      AUnit.Assertions.Assert
        (Rule_Last_Business.Status = Humanize.Status.Ok
         and then Rule_Last_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
         "parse previous business day with one-off holiday rules");
      AUnit.Assertions.Assert
        (Rule_Recurring_Business.Status = Humanize.Status.Ok
         and then Rule_Recurring_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
         "parse next business day with recurring holiday rules");
      AUnit.Assertions.Assert
        (Rule_Shutdown_Business.Status = Humanize.Status.Ok
         and then Rule_Shutdown_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 4, 0.0),
         "parse next business day with shutdown rules");
      AUnit.Assertions.Assert
        (Rule_Scanned_Business.Status = Humanize.Status.Ok
         and then Rule_Scanned_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0)
         and then Rule_Scanned_Business.Consumed = 17,
         "scan business day with business calendar rules");
      AUnit.Assertions.Assert
        (Rule_Range_Business.Status = Humanize.Status.Ok
         and then Rule_Range_Business.Low =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0)
         and then Rule_Range_Business.High =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
         "parse nested business date range with business calendar rules");
      AUnit.Assertions.Assert
        (Week_32_Start.Status = Humanize.Status.Ok
         and then Week_32_Start.Value =
           Ada.Calendar.Time_Of (2024, 8, 5, 0.0),
         "parse week-number start");
      AUnit.Assertions.Assert
        (ISO_Week_Range.Status = Humanize.Status.Ok
         and then ISO_Week_Range.Low =
           Ada.Calendar.Time_Of (2024, 2, 26, 0.0)
         and then ISO_Week_Range.High =
           Ada.Calendar.Time_Of (2024, 3, 4, 0.0),
         "parse ISO week date range");
      AUnit.Assertions.Assert
        (This_Week.Status = Humanize.Status.Ok
         and then This_Week.Low = Ref_Date
         and then This_Week.High = Ref_Date + 7.0 * 86_400.0,
         "parse this week range");
      AUnit.Assertions.Assert
        (Next_Two_Weeks.Status = Humanize.Status.Ok
         and then Next_Two_Weeks.Low = Ref_Date
         and then Next_Two_Weeks.High = Ref_Date + 14.0 * 86_400.0,
         "parse next two weeks range");
      AUnit.Assertions.Assert
        (Last_Three_Months.Status = Humanize.Status.Ok
         and then Last_Three_Months.Low =
           Ada.Calendar.Time_Of (2023, 10, 1, 0.0)
         and then Last_Three_Months.High = Ref_Date,
         "parse last three months range");
      AUnit.Assertions.Assert
        (Q3_Range.Status = Humanize.Status.Ok
         and then Q3_Range.Low = Ada.Calendar.Time_Of (2024, 7, 1, 0.0)
         and then Q3_Range.High = Ada.Calendar.Time_Of (2024, 10, 1, 0.0),
         "parse quarter range");
      AUnit.Assertions.Assert
        (Fiscal_Q2.Status = Humanize.Status.Ok
         and then Fiscal_Q2.Low = Ada.Calendar.Time_Of (2025, 4, 1, 0.0)
         and then Fiscal_Q2.High = Ada.Calendar.Time_Of (2025, 7, 1, 0.0),
         "parse fiscal quarter label range");
      AUnit.Assertions.Assert
        (Fiscal_Year.Status = Humanize.Status.Ok
         and then Fiscal_Year.Low = Ada.Calendar.Time_Of (2027, 1, 1, 0.0)
         and then Fiscal_Year.High = Ada.Calendar.Time_Of (2028, 1, 1, 0.0),
         "parse fiscal year label range");
      AUnit.Assertions.Assert
        (Fiscal_Half.Status = Humanize.Status.Ok
         and then Fiscal_Half.Low = Ada.Calendar.Time_Of (2027, 1, 1, 0.0)
         and then Fiscal_Half.High = Ada.Calendar.Time_Of (2027, 7, 1, 0.0),
         "parse fiscal half label range");
      AUnit.Assertions.Assert
        (Semester_2.Status = Humanize.Status.Ok
         and then Semester_2.Low = Ada.Calendar.Time_Of (2026, 7, 1, 0.0)
         and then Semester_2.High = Ada.Calendar.Time_Of (2027, 1, 1, 0.0),
         "parse semester label range");
      AUnit.Assertions.Assert
        (Half_Year_2.Status = Humanize.Status.Ok
         and then Half_Year_2.Low = Ada.Calendar.Time_Of (2026, 7, 1, 0.0)
         and then Half_Year_2.High = Ada.Calendar.Time_Of (2027, 1, 1, 0.0),
         "parse half-year label range");
      AUnit.Assertions.Assert
        (Scanned_Fiscal_Half.Status = Humanize.Status.Ok
         and then Scanned_Fiscal_Half.Low =
           Ada.Calendar.Time_Of (2027, 1, 1, 0.0)
         and then Scanned_Fiscal_Half.High =
           Ada.Calendar.Time_Of (2027, 7, 1, 0.0)
         and then Scanned_Fiscal_Half.Consumed = 9,
         "scan fiscal half label range");
      AUnit.Assertions.Assert
        (Early_Next_Week.Status = Humanize.Status.Ok
         and then Early_Next_Week.Low =
           Ada.Calendar.Time_Of (2024, 1, 8, 0.0)
         and then Early_Next_Week.High =
           Ada.Calendar.Time_Of (2024, 1, 11, 0.0),
         "parse early next week range");
      AUnit.Assertions.Assert
        (Mid_March.Status = Humanize.Status.Ok
         and then Mid_March.Low =
           Ada.Calendar.Time_Of (2024, 3, 12, 0.0)
         and then Mid_March.High =
           Ada.Calendar.Time_Of (2024, 3, 22, 0.0),
         "parse mid-month range");
      AUnit.Assertions.Assert
        (Late_Q2.Status = Humanize.Status.Ok
         and then Late_Q2.Low =
           Ada.Calendar.Time_Of (2024, 6, 1, 0.0)
         and then Late_Q2.High =
           Ada.Calendar.Time_Of (2024, 7, 1, 0.0),
         "parse late quarter range");
      AUnit.Assertions.Assert
        (Mid_Next_Quarter.Status = Humanize.Status.Ok
         and then Mid_Next_Quarter.Low =
           Ada.Calendar.Time_Of (2024, 5, 2, 0.0)
         and then Mid_Next_Quarter.High =
           Ada.Calendar.Time_Of (2024, 6, 1, 0.0),
         "parse mid next quarter range");
      AUnit.Assertions.Assert
        (First_Half_2026.Status = Humanize.Status.Ok
         and then First_Half_2026.Low =
           Ada.Calendar.Time_Of (2026, 1, 1, 0.0)
         and then First_Half_2026.High =
           Ada.Calendar.Time_Of (2026, 7, 1, 0.0),
         "parse first half phrase range");
      AUnit.Assertions.Assert
        (End_FY2027.Status = Humanize.Status.Ok
         and then End_FY2027.Value =
           Ada.Calendar.Time_Of (2027, 12, 31, 0.0),
         "parse fiscal year end boundary");
      AUnit.Assertions.Assert
        (Week_32_Range.Status = Humanize.Status.Ok
         and then Week_32_Range.Low = Ada.Calendar.Time_Of (2024, 8, 5, 0.0)
         and then Week_32_Range.High = Ada.Calendar.Time_Of (2024, 8, 12, 0.0),
         "parse week-number range");
      AUnit.Assertions.Assert
        (This_Weekend.Status = Humanize.Status.Ok
         and then This_Weekend.Low = Ada.Calendar.Time_Of (2024, 1, 6, 0.0)
         and then This_Weekend.High = Ada.Calendar.Time_Of (2024, 1, 8, 0.0),
         "parse this weekend range");
      AUnit.Assertions.Assert
        (Next_Weekend.Status = Humanize.Status.Ok
         and then Next_Weekend.Low = Ada.Calendar.Time_Of (2024, 1, 13, 0.0)
         and then Next_Weekend.High = Ada.Calendar.Time_Of (2024, 1, 15, 0.0),
         "parse next weekend range");
      AUnit.Assertions.Assert
        (Last_Weekend.Status = Humanize.Status.Ok
         and then Last_Weekend.Low = Ada.Calendar.Time_Of (2023, 12, 30, 0.0)
         and then Last_Weekend.High = Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
         "parse last weekend range");
      AUnit.Assertions.Assert
        (Next_Business_Week.Status = Humanize.Status.Ok
         and then Next_Business_Week.Low =
           Ada.Calendar.Time_Of (2024, 1, 8, 0.0)
         and then Next_Business_Week.High =
           Ada.Calendar.Time_Of (2024, 1, 13, 0.0),
         "parse next business week range");
      AUnit.Assertions.Assert
        (Scanned_Weekend.Status = Humanize.Status.Ok
         and then Scanned_Weekend.Low = Ada.Calendar.Time_Of (2024, 1, 6, 0.0)
         and then Scanned_Weekend.High = Ada.Calendar.Time_Of (2024, 1, 8, 0.0)
         and then Scanned_Weekend.Consumed = 12,
         "scan weekend range");
      AUnit.Assertions.Assert
        (Between_Dates.Status = Humanize.Status.Ok
         and then Between_Dates.Low = Ref_Date
         and then Between_Dates.High = Ref_Date + 4.0 * 86_400.0,
         "parse between natural date range");
      AUnit.Assertions.Assert
        (Scanned_Range_Date.Status = Humanize.Status.Ok
         and then Scanned_Range_Date.Consumed = 12
         and then Scanned_Range_Date.High = Ref_Date + 14.0 * 86_400.0,
         "scan natural date range");
      AUnit.Assertions.Assert
        (One_Off_Holiday.Status = Humanize.Status.Ok
         and then One_Off_Holiday.Kind =
           Humanize.Parsing.Business_One_Off_Holiday
         and then One_Off_Holiday.Date =
           Ada.Calendar.Time_Of (2026, 7, 6, 0.0),
         "parse one-off business holiday");
      AUnit.Assertions.Assert
        (Recurring_Holiday.Status = Humanize.Status.Ok
         and then Recurring_Holiday.Kind =
           Humanize.Parsing.Business_Recurring_Holiday
         and then Recurring_Holiday.Month = 12
         and then Recurring_Holiday.Day = 25,
         "parse recurring business holiday");
      AUnit.Assertions.Assert
        (Half_Day.Status = Humanize.Status.Ok
         and then Half_Day.Kind = Humanize.Parsing.Business_Half_Day
         and then Half_Day.Date = Ada.Calendar.Time_Of (2026, 12, 24, 0.0)
         and then Half_Day.End_Hour = 12,
         "parse business half-day");
      AUnit.Assertions.Assert
        (Shutdown.Status = Humanize.Status.Ok
         and then Shutdown.Kind = Humanize.Parsing.Business_Shutdown
         and then Shutdown.Date = Ada.Calendar.Time_Of (2026, 12, 24, 0.0)
         and then Shutdown.End_Date =
           Ada.Calendar.Time_Of (2026, 12, 31, 0.0),
         "parse business shutdown");
      AUnit.Assertions.Assert
        (Business_Hours.Status = Humanize.Status.Ok
         and then Business_Hours.Kind = Humanize.Parsing.Business_Hour_Range
         and then Business_Hours.Weekday = 1
         and then Business_Hours.Start_Hour = 9
         and then Business_Hours.End_Hour = 17,
         "parse business hour range");
      AUnit.Assertions.Assert
        (Next_Open.Status = Humanize.Status.Ok
         and then Next_Open.Kind = Humanize.Parsing.Business_Next_Open_Hour
         and then Next_Open.Date = Ada.Calendar.Time_Of (2026, 7, 6, 0.0)
         and then Next_Open.Start_Hour = 9
         and then Next_Open.End_Hour = 10,
         "parse next open business hour");
      AUnit.Assertions.Assert
        (Scanned_Business_Calendar.Status = Humanize.Status.Ok
         and then Scanned_Business_Calendar.Kind =
           Humanize.Parsing.Business_Hour_Range
         and then Scanned_Business_Calendar.Weekday = 5
         and then Scanned_Business_Calendar.Start_Hour = 10
         and then Scanned_Business_Calendar.End_Hour = 15
         and then Scanned_Business_Calendar.Consumed = 27,
         "scan business calendar phrase");
      AUnit.Assertions.Assert
        (Parsed_Rules.Status = Humanize.Status.Ok
         and then Parsed_Rules.Rules.Recurring_Holiday_Count = 1
         and then Parsed_Rules.Rules.Half_Day_Count = 1
         and then Parsed_Rules.Rules.Shutdown_Count = 1
         and then Parsed_Rules.Rules.Options.Weekday_Hours.Monday_Start = 8
         and then Parsed_Rules.Rules.Options.Weekday_Hours.Monday_End = 16,
         "parse executable business calendar rules");
      AUnit.Assertions.Assert
        (Rules_Result = Ada.Calendar.Time_Of (2026, 12, 30, 10.0 * 3_600.0),
         "apply parsed business calendar rules to business-hour arithmetic");
   end Check_Natural_Date_Range_And_Business_Calendar_Parsers;
