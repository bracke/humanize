separate (Humanize.Tests.Datetimes)
   procedure Test_Natural_Time_And_Ranges
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Ref : constant Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, Hour => 12, others => 0);
      Morning_Time : constant Text_Result :=
        Natural_Time_Of_Day
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, Hour => 9, others => 0));
      Relation : constant Text_Result :=
        Calendar_Relation
          (Support.En,
           (Year => 2026, Month => 3, Day => 27, Hour => 9, others => 0),
           Ref);
      Dates : constant Text_Result :=
        Date_Range
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Year => 2026, Month => 3, Day => 23, others => 0));
      Times : constant Text_Result :=
        Time_Range
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, Hour => 14, Minute => 0,
            Second => 0),
           (Year => 2026, Month => 3, Day => 21, Hour => 16, Minute => 30,
            Second => 0));
      Month_Dates : constant Text_Result :=
        Date_Range
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Year => 2026, Month => 3, Day => 23, others => 0),
           (Elide_Same_Month => True,
            Separator => '-',
            Use_Month_Names => True,
            Use_12_Hour_Time => False,
            others => False));
      Hours_12 : constant Text_Result :=
        Time_Range
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, Hour => 14, Minute => 0,
            Second => 0),
           (Year => 2026, Month => 3, Day => 21, Hour => 16, Minute => 30,
            Second => 0),
           (Elide_Same_Month => True,
            Separator => '-',
            Use_Month_Names => False,
            Use_12_Hour_Time => True,
            others => False));
      Long_Dates : constant Text_Result :=
        Date_Range
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Year => 2026, Month => 3, Day => 23, others => 0),
           (Elide_Same_Month => False,
            Separator => '/',
            Use_Month_Names => False,
            Use_12_Hour_Time => False,
            others => False));
      Offset : constant Text_Result := Offset_Label (Support.En, 150);
      Date_Label : constant Text_Result :=
        Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           Range_Options'
             (Elide_Same_Month => True,
              Separator => '-',
              Use_Month_Names => True,
              Use_12_Hour_Time => False,
              others => False));
      Date_Short : constant Text_Result :=
        Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           Calendar_Date_Options'
             (Style => Calendar_Date_Short, Fiscal_Year_Start_Month => 1));
      Date_Medium : constant Text_Result :=
        Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           Calendar_Date_Options'
             (Style => Calendar_Date_Medium, Fiscal_Year_Start_Month => 1));
      Date_German_Regional : constant Text_Result :=
        Calendar_Date_Label
          (Support.Locale ("DE_at"),
           (Year => 2026, Month => 3, Day => 21, others => 0),
           Calendar_Date_Options'
             (Style => Calendar_Date_Medium, Fiscal_Year_Start_Month => 1));
      Date_French_Regional : constant Text_Result :=
        Calendar_Date_Label
          (Support.Locale ("FR_ca"),
           (Year => 2026, Month => 3, Day => 21, others => 0),
           Calendar_Date_Options'
             (Style => Calendar_Date_Medium, Fiscal_Year_Start_Month => 1));
      Date_Long : constant Text_Result :=
        Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           Calendar_Date_Options'
             (Style => Calendar_Date_Long, Fiscal_Year_Start_Month => 1));
      Date_Weekday : constant Text_Result :=
        Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           Calendar_Date_Options'
             (Style => Calendar_Date_Weekday, Fiscal_Year_Start_Month => 1));
      Date_Month_Year : constant Text_Result :=
        Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           Calendar_Date_Options'
             (Style => Calendar_Date_Month_Year,
              Fiscal_Year_Start_Month => 1));
      Date_Year_Month : constant Text_Result :=
        Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           Calendar_Date_Options'
             (Style => Calendar_Date_Year_Month,
              Fiscal_Year_Start_Month => 1));
      Date_Quarter : constant Text_Result :=
        Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           Calendar_Date_Options'
             (Style => Calendar_Date_Quarter, Fiscal_Year_Start_Month => 1));
      Date_Fiscal_Quarter : constant Text_Result :=
        Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           Calendar_Date_Options'
             (Style => Calendar_Date_Fiscal_Quarter,
              Fiscal_Year_Start_Month => 4));
      Same_Year_Dates : constant Text_Result :=
        Date_Range
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Year => 2026, Month => 4, Day => 2, others => 0),
           (Elide_Same_Month => False,
            Elide_Same_Year => True,
            Include_Weekday => False,
            Separator => '-',
            Use_Month_Names => True,
            Use_12_Hour_Time => False,
            Relative_When_Same_Day => False));
      Weekday_Dates : constant Text_Result :=
        Date_Range
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Year => 2026, Month => 3, Day => 23, others => 0),
           (Elide_Same_Month => True,
            Elide_Same_Year => False,
            Include_Weekday => True,
            Separator => '-',
            Use_Month_Names => True,
            Use_12_Hour_Time => False,
            Relative_When_Same_Day => False));
      Today_Range : constant Text_Result :=
        Date_Time_Range
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, Hour => 9, others => 0),
           (Year => 2026, Month => 3, Day => 21, Hour => 17, others => 0),
           Ref,
           (Elide_Same_Month => True,
            Elide_Same_Year => False,
            Include_Weekday => False,
            Separator => '-',
            Use_Month_Names => False,
            Use_12_Hour_Time => False,
            Relative_When_Same_Day => True));
      Combined_Range : constant Text_Result :=
        Date_Time_Range
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, Hour => 9, others => 0),
           (Year => 2026, Month => 4, Day => 2, Hour => 17, others => 0),
           Ref,
           (Elide_Same_Month => False,
            Elide_Same_Year => True,
            Include_Weekday => False,
            Separator => '-',
            Use_Month_Names => True,
            Use_12_Hour_Time => False,
            Relative_When_Same_Day => False));
      Business_Range : constant Text_Result :=
        Business_Time_Range_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 23, Hour => 9, others => 0),
           (Year => 2026, Month => 3, Day => 23, Hour => 16, others => 0),
           Ref,
           Humanize.Durations.Business_Calendar_Rules'(others => <>),
           (Elide_Same_Month => True,
            Elide_Same_Year => False,
            Include_Weekday => False,
            Separator => '-',
            Use_Month_Names => False,
            Use_12_Hour_Time => False,
            Relative_When_Same_Day => True));
      Outside_Business_Range : constant Text_Result :=
        Business_Time_Range_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 23, Hour => 18, others => 0),
           (Year => 2026, Month => 3, Day => 23, Hour => 19, others => 0),
           Ref,
           Humanize.Durations.Business_Calendar_Rules'(others => <>),
           (Elide_Same_Month => True,
            Elide_Same_Year => False,
            Include_Weekday => False,
            Separator => '-',
            Use_Month_Names => False,
            Use_12_Hour_Time => False,
            Relative_When_Same_Day => True));
      Weekend_Range : constant Text_Result :=
        Calendar_Range_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Year => 2026, Month => 3, Day => 22, others => 0),
           Ref);
      Next_Week_Range : constant Text_Result :=
        Calendar_Range_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 23, others => 0),
           (Year => 2026, Month => 3, Day => 29, others => 0),
           Ref);
      Month_Range : constant Text_Result :=
        Calendar_Range_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 1, others => 0),
           (Year => 2026, Month => 3, Day => 31, others => 0),
           Ref);
      Quarter_Range : constant Text_Result :=
        Calendar_Range_Label
          (Support.En,
           (Year => 2026, Month => 7, Day => 1, others => 0),
           (Year => 2026, Month => 9, Day => 30, others => 0),
           Ref);
      Fiscal_Quarter_Range : constant Text_Result :=
        Calendar_Range_Label
          (Support.En,
           (Year => 2026, Month => 1, Day => 1, others => 0),
           (Year => 2026, Month => 3, Day => 31, others => 0),
           Ref,
           (Style => Calendar_Range_Auto,
            Use_Month_Names => True,
            Use_12_Hour_Time => False,
            Fiscal_Year_Start_Month => 4));
      Polished_Range : constant Text_Result :=
        Calendar_Range_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Year => 2026, Month => 3, Day => 23, others => 0),
           Ref);
      Time_Today_Range : constant Text_Result :=
        Calendar_Range_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, Hour => 9, others => 0),
           (Year => 2026, Month => 3, Day => 21, Hour => 17, others => 0),
           Ref,
           (Style => Calendar_Range_Time_Today,
            Use_Month_Names => True,
            Use_12_Hour_Time => False,
            Fiscal_Year_Start_Month => 1));
      Due : constant Text_Result :=
        Due_Status
          (Support.En,
           (Year => 2026, Month => 3, Day => 23, others => 0),
           (Year => 2026, Month => 3, Day => 21, others => 0));
      Calendar_Diff : constant Calendar_Difference_Result :=
        Calendar_Difference
          ((Year => 2024, Month => 1, Day => 31, others => 0),
           (Year => 2026, Month => 3, Day => 2, others => 0));
      Leap_Diff : constant Text_Result :=
        Calendar_Difference_Label
          (Support.En,
           (Year => 2024, Month => 2, Day => 29, others => 0),
           (Year => 2025, Month => 2, Day => 28, others => 0));
      Limited_Diff : constant Text_Result :=
        Calendar_Difference_Label
          (Support.En,
           (Year => 2024, Month => 1, Day => 31, others => 0),
           (Year => 2026, Month => 3, Day => 2, others => 0),
           (Max_Components => 2,
            Include_Zero   => False,
            Style          => Calendar_Difference_Plain));
      Relative_Future_Diff : constant Text_Result :=
        Calendar_Difference_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Year => 2027, Month => 5, Day => 1, others => 0),
           (Max_Components => 3,
            Include_Zero   => False,
            Style          => Calendar_Difference_Relative));
      Relative_Past_Diff : constant Text_Result :=
        Calendar_Difference_Label
          (Support.En,
           (Year => 2027, Month => 5, Day => 1, others => 0),
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Max_Components => 3,
            Include_Zero   => False,
            Style          => Calendar_Difference_Relative));
      Same_Diff : constant Text_Result :=
        Calendar_Difference_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Year => 2026, Month => 3, Day => 21, others => 0));
      Zero_Diff : constant Text_Result :=
        Calendar_Difference_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Max_Components => 3,
            Include_Zero   => True,
            Style          => Calendar_Difference_Plain));
      Invalid_Diff : constant Text_Result :=
        Calendar_Difference_Label
          (Support.En,
           (Year => 2026, Month => 2, Day => 30, others => 0),
           (Year => 2026, Month => 3, Day => 1, others => 0));
      Tonight : constant Text_Result :=
        Calendar_Relative_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, Hour => 20, others => 0),
           Ref);
      Later_Today : constant Text_Result :=
        Calendar_Relative_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, Hour => 14, others => 0),
           Ref);
      This_Morning : constant Text_Result :=
        Calendar_Relative_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, Hour => 9, others => 0),
           Ref);
      Tomorrow_Morning : constant Text_Result :=
        Calendar_Relative_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 22, Hour => 9, others => 0),
           Ref);
      Last_Tuesday : constant Text_Result :=
        Calendar_Relative_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 17, others => 0),
           Ref);
      Next_Friday : constant Text_Result :=
        Calendar_Relative_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 27, others => 0),
           Ref);
      This_Weekend_Label : constant Text_Result :=
        Calendar_Relative_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 22, others => 0),
           Ref);
      Last_Weekend_Label : constant Text_Result :=
        Calendar_Relative_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 15, others => 0),
           Ref);
      Next_Weekend_Label : constant Text_Result :=
        Calendar_Relative_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 28, others => 0),
           Ref);
      No_Weekday_Window : constant Text_Result :=
        Calendar_Relative_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 27, others => 0),
           Ref,
           (Include_Time_Of_Day => True,
            Prefer_Weekend      => True,
            Weekday_Window      => 0,
            Use_Tonight         => True,
            Use_Later_Today     => True));
      Distant_Relative : constant Text_Result :=
        Calendar_Relative_Label
          (Support.En,
           (Year => 2026, Month => 4, Day => 30, others => 0),
           Ref);
      Invalid_Relative : constant Text_Result :=
        Calendar_Relative_Label
          (Support.En,
           (Year => 2026, Month => 2, Day => 30, others => 0),
           Ref);
      Buffer : String (1 .. 16);
      Date_Buffer : String (1 .. 32);
      Range_Buffer : String (1 .. 32);
      Written : Natural;
      Code : Status_Code;
   begin
      AUnit.Assertions.Assert
        (Morning_Time.Status = Ok and then Support.Text (Morning_Time) = "morning",
         "natural time-of-day");
      AUnit.Assertions.Assert
        (Relation.Status = Ok and then Support.Text (Relation) = "next week",
         "calendar relation");
      AUnit.Assertions.Assert
        (Dates.Status = Ok and then Support.Text (Dates) = "2026-03-21-23",
         "date range");
      AUnit.Assertions.Assert
        (Times.Status = Ok and then Support.Text (Times) = "14:00-16:30",
         "time range");
      AUnit.Assertions.Assert
        (Month_Dates.Status = Ok and then Support.Text (Month_Dates) = "Mar 21-23",
         "month-name date range");
      AUnit.Assertions.Assert
        (Hours_12.Status = Ok and then Support.Text (Hours_12) = "2 PM-4:30 PM",
         "12-hour time range");
      AUnit.Assertions.Assert
        (Long_Dates.Status = Ok
         and then Support.Text (Long_Dates) = "2026-03-21 / 2026-03-23",
         "date range options");
      AUnit.Assertions.Assert
        (Offset.Status = Ok and then Support.Text (Offset) = "UTC+02:30",
         "UTC offset label");
      AUnit.Assertions.Assert
        (Date_Label.Status = Ok
         and then Support.Text (Date_Label) = "Mar 21, 2026",
         "calendar date label");
      AUnit.Assertions.Assert
        (Date_Short.Status = Ok
         and then Support.Text (Date_Short) = "03/21/2026",
         "short calendar date label");
      AUnit.Assertions.Assert
        (Date_Medium.Status = Ok
         and then Support.Text (Date_Medium) = "Mar 21, 2026",
         "medium calendar date label");
      AUnit.Assertions.Assert
        (Date_German_Regional.Status = Ok
         and then Support.Text (Date_German_Regional) = "Marz 21, 2026"
         and then Date_French_Regional.Status = Ok
         and then Support.Text (Date_French_Regional) = "mars 21, 2026",
         "calendar date labels use language-code regional fallback");
      AUnit.Assertions.Assert
        (Date_Long.Status = Ok
         and then Support.Text (Date_Long) = "Saturday, March 21, 2026",
         "long calendar date label");
      AUnit.Assertions.Assert
        (Date_Weekday.Status = Ok
         and then Support.Text (Date_Weekday) = "Sat Mar 21, 2026",
         "weekday calendar date label");
      AUnit.Assertions.Assert
        (Date_Month_Year.Status = Ok
         and then Support.Text (Date_Month_Year) = "Mar 2026",
         "month-year calendar date label");
      AUnit.Assertions.Assert
        (Date_Year_Month.Status = Ok
         and then Support.Text (Date_Year_Month) = "2026-03",
         "year-month calendar date label");
      AUnit.Assertions.Assert
        (Date_Quarter.Status = Ok
         and then Support.Text (Date_Quarter) = "Q1 2026",
         "quarter calendar date label");
      AUnit.Assertions.Assert
        (Date_Fiscal_Quarter.Status = Ok
         and then Support.Text (Date_Fiscal_Quarter) = "FY2026 Q4",
         "fiscal quarter calendar date label");
      AUnit.Assertions.Assert
        (Same_Year_Dates.Status = Ok
         and then Support.Text (Same_Year_Dates) = "Mar 21-Apr 2, 2026",
         "same-year elided date range");
      AUnit.Assertions.Assert
        (Weekday_Dates.Status = Ok
         and then Support.Text (Weekday_Dates) = "Sat Mar 21-Mon 23",
         "weekday date range");
      AUnit.Assertions.Assert
        (Today_Range.Status = Ok
         and then Support.Text (Today_Range) = "today 09:00-17:00",
         "relative same-day date/time range");
      AUnit.Assertions.Assert
        (Combined_Range.Status = Ok
         and then Support.Text (Combined_Range) =
           "Mar 21, 2026 09:00-Apr 2 17:00",
         "same-year date/time range");
      AUnit.Assertions.Assert
        (Business_Range.Status = Ok
         and then Support.Text (Business_Range) =
           "2026-03-23 09:00-16:00 (business hours)",
         "business time range label");
      AUnit.Assertions.Assert
        (Outside_Business_Range.Status = Ok
         and then Support.Text (Outside_Business_Range) =
           "2026-03-23 18:00-19:00 (outside business hours)",
         "outside business time range label");
      AUnit.Assertions.Assert
        (Weekend_Range.Status = Ok
         and then Support.Text (Weekend_Range) = "this weekend",
         "semantic weekend range");
      AUnit.Assertions.Assert
        (Next_Week_Range.Status = Ok
         and then Support.Text (Next_Week_Range) = "next week",
         "semantic week range");
      AUnit.Assertions.Assert
        (Month_Range.Status = Ok
         and then Support.Text (Month_Range) = "Mar 2026",
         "semantic month range");
      AUnit.Assertions.Assert
        (Quarter_Range.Status = Ok
         and then Support.Text (Quarter_Range) = "Q3 2026",
         "semantic quarter range");
      AUnit.Assertions.Assert
        (Fiscal_Quarter_Range.Status = Ok
         and then Support.Text (Fiscal_Quarter_Range) = "FY2026 Q4",
         "semantic fiscal quarter range");
      AUnit.Assertions.Assert
        (Polished_Range.Status = Ok
         and then Support.Text (Polished_Range) = "Mar 21-23, 2026",
         "polished calendar range");
      AUnit.Assertions.Assert
        (Time_Today_Range.Status = Ok
         and then Support.Text (Time_Today_Range) = "09:00-17:00 today",
         "same-day calendar time range");
      AUnit.Assertions.Assert
        (Due.Status = Ok and then Support.Text (Due) = "due in 2 days",
         "due status phrase");
      AUnit.Assertions.Assert
        (Calendar_Diff.Direction = Future_Date
         and then Calendar_Diff.Years = 2
         and then Calendar_Diff.Months = 1
         and then Calendar_Diff.Days = 2,
         "exact calendar difference components");
      AUnit.Assertions.Assert
        (Leap_Diff.Status = Ok
         and then Support.Text (Leap_Diff) = "1 year",
         "exact calendar difference leap day");
      AUnit.Assertions.Assert
        (Limited_Diff.Status = Ok
         and then Support.Text (Limited_Diff) = "2 years and 1 month",
         "exact calendar difference component limit");
      AUnit.Assertions.Assert
        (Relative_Future_Diff.Status = Ok
         and then Support.Text (Relative_Future_Diff)
           = "in 1 year, 1 month and 10 days",
         "exact calendar difference future label");
      AUnit.Assertions.Assert
        (Relative_Past_Diff.Status = Ok
         and then Support.Text (Relative_Past_Diff)
           = "1 year, 1 month and 10 days ago",
         "exact calendar difference past label");
      AUnit.Assertions.Assert
        (Same_Diff.Status = Ok and then Support.Text (Same_Diff) = "same day",
         "exact calendar difference same day");
      AUnit.Assertions.Assert
        (Zero_Diff.Status = Ok and then Support.Text (Zero_Diff) = "0 days",
         "exact calendar difference zero label");
      AUnit.Assertions.Assert
        (Invalid_Diff.Status = Invalid_Value,
         "exact calendar difference invalid date");
      AUnit.Assertions.Assert
        (Tonight.Status = Ok and then Support.Text (Tonight) = "tonight",
         "calendar-relative tonight");
      AUnit.Assertions.Assert
        (Later_Today.Status = Ok
         and then Support.Text (Later_Today) = "later today",
         "calendar-relative later today");
      AUnit.Assertions.Assert
        (This_Morning.Status = Ok
         and then Support.Text (This_Morning) = "this morning",
         "calendar-relative this morning");
      AUnit.Assertions.Assert
        (Tomorrow_Morning.Status = Ok
         and then Support.Text (Tomorrow_Morning) = "tomorrow morning",
         "calendar-relative tomorrow morning");
      AUnit.Assertions.Assert
        (Last_Tuesday.Status = Ok
         and then Support.Text (Last_Tuesday) = "last Tuesday",
         "calendar-relative last weekday");
      AUnit.Assertions.Assert
        (Next_Friday.Status = Ok
         and then Support.Text (Next_Friday) = "next Friday",
         "calendar-relative next weekday");
      AUnit.Assertions.Assert
        (This_Weekend_Label.Status = Ok
         and then Support.Text (This_Weekend_Label) = "this weekend",
         "calendar-relative weekend");
      AUnit.Assertions.Assert
        (Last_Weekend_Label.Status = Ok
         and then Support.Text (Last_Weekend_Label) = "last weekend",
         "calendar-relative last weekend");
      AUnit.Assertions.Assert
        (Next_Weekend_Label.Status = Ok
         and then Support.Text (Next_Weekend_Label) = "next weekend",
         "calendar-relative next weekend");
      AUnit.Assertions.Assert
        (No_Weekday_Window.Status = Ok
         and then Support.Text (No_Weekday_Window) = "2026-03-27",
         "calendar-relative weekday window fallback");
      AUnit.Assertions.Assert
        (Distant_Relative.Status = Ok
         and then Support.Text (Distant_Relative) = "2026-04-30",
         "calendar-relative distant fallback");
      AUnit.Assertions.Assert
        (Invalid_Relative.Status = Invalid_Value,
         "calendar-relative invalid date");
      Natural_Time_Of_Day_Into
        (Support.En,
         (Year => 2026, Month => 3, Day => 21, Hour => 20, others => 0),
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "evening",
         "natural time bounded");
      Calendar_Date_Label_Into
        (Support.En,
         (Year => 2026, Month => 3, Day => 21, others => 0),
         Date_Buffer, Written, Code,
         Calendar_Date_Options'
           (Style => Calendar_Date_Long, Fiscal_Year_Start_Month => 1));
      AUnit.Assertions.Assert
        (Code = Ok
         and then Date_Buffer (1 .. Written) = "Saturday, March 21, 2026",
         "calendar date preset bounded");
      Calendar_Range_Label_Into
        (Support.En,
         (Year => 2026, Month => 3, Day => 21, others => 0),
         (Year => 2026, Month => 3, Day => 23, others => 0),
         Ref, Range_Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Range_Buffer (1 .. Written) = "Mar 21-23, 2026",
         "calendar range bounded");
      Calendar_Difference_Label_Into
        (Support.En,
         (Year => 2026, Month => 3, Day => 21, others => 0),
         (Year => 2027, Month => 5, Day => 1, others => 0),
         Range_Buffer, Written, Code,
         (Max_Components => 2,
          Include_Zero   => False,
          Style          => Calendar_Difference_Relative));
      AUnit.Assertions.Assert
        (Code = Ok
         and then Range_Buffer (1 .. Written) = "in 1 year and 1 month",
         "calendar difference bounded");
      Calendar_Relative_Label_Into
        (Support.En,
         (Year => 2026, Month => 3, Day => 27, others => 0),
         Ref, Range_Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Range_Buffer (1 .. Written) = "next Friday",
         "calendar-relative bounded");
   end Test_Natural_Time_And_Ranges;
