separate (Humanize.Tests.Parsing.Test_Frequency_Rate_List)
   procedure Check_Basic_Number_Duration_And_Cron_Parsers is
   begin
      AUnit.Assertions.Assert
        (Frequency.Status = Humanize.Status.Ok and then Frequency.Count = 4,
         "parse frequency");
      AUnit.Assertions.Assert
        (Rate.Status = Humanize.Status.Ok and then Rate.Count = 4
         and then Rate.Period = Humanize.Rates.Per_Week
         and then not Rate.Less_Than,
         "parse rate");
      AUnit.Assertions.Assert
        (Rate_Alias.Status = Humanize.Status.Ok
         and then Rate_Alias.Period = Humanize.Rates.Per_Week,
         "parse rate period alias");
      AUnit.Assertions.Assert
        (Less.Status = Humanize.Status.Ok and then Less.Count = 1
         and then Less.Period = Humanize.Rates.Per_Day
         and then Less.Less_Than,
         "parse less-than rate");
      AUnit.Assertions.Assert
        (List.Status = Humanize.Status.Ok and then List.Count = 3,
         "parse list count");
      AUnit.Assertions.Assert
        (Bad_Rate.Status = Humanize.Status.Invalid_Argument,
         "reject malformed rate");
      AUnit.Assertions.Assert
        (Single.Status = Humanize.Status.Ok and then Single.Count = 1,
         "parse single-item list count");
      AUnit.Assertions.Assert
        (German_List.Status = Humanize.Status.Ok and then German_List.Count = 3,
         "parse localized list count");
      AUnit.Assertions.Assert
        (Japanese_List.Status = Humanize.Status.Ok
         and then Japanese_List.Count = 2,
         "parse CJK localized list count");
      AUnit.Assertions.Assert
        (Localized_Frequency.Status = Humanize.Status.Ok
         and then Localized_Frequency.Count = 2,
         "parse localized frequency unit");
      AUnit.Assertions.Assert
        (Localized_Rate.Status = Humanize.Status.Ok
         and then Localized_Rate.Count = 2
         and then Localized_Rate.Period = Humanize.Rates.Per_Week,
         "parse localized rate");
      AUnit.Assertions.Assert
        (Percent.Status = Humanize.Status.Ok and then Percent.Value = 13
         and then not Percent.Exact,
         "parse percent");
      AUnit.Assertions.Assert
        (Ordinal.Status = Humanize.Status.Ok and then Ordinal.Value = 21,
         "parse ordinal");
      AUnit.Assertions.Assert
        (Word_Cardinal.Status = Humanize.Status.Ok
         and then Word_Cardinal.Value = 21,
         "parse word cardinal");
      AUnit.Assertions.Assert
        (Word_Ordinal.Status = Humanize.Status.Ok
         and then Word_Ordinal.Value = 21,
         "parse word ordinal");
      AUnit.Assertions.Assert
        (German_Word_Cardinal.Status = Humanize.Status.Ok
         and then German_Word_Cardinal.Value = 42,
         "parse localized German cardinal spellout");
      AUnit.Assertions.Assert
        (Finnish_Word_Cardinal.Status = Humanize.Status.Ok
         and then Finnish_Word_Cardinal.Value = 2_345,
         "parse localized Finnish cardinal spellout");
      AUnit.Assertions.Assert
        (French_Large_Word_Cardinal.Status = Humanize.Status.Ok
         and then French_Large_Word_Cardinal.Value = 2_000_000_001,
         "parse localized French large cardinal spellout");
      AUnit.Assertions.Assert
        (Japanese_Word_Cardinal.Status = Humanize.Status.Ok
         and then Japanese_Word_Cardinal.Value = 2_345,
         "parse localized Japanese cardinal spellout");
      AUnit.Assertions.Assert
        (Korean_Word_Cardinal.Status = Humanize.Status.Ok
         and then Korean_Word_Cardinal.Value = 2_345,
         "parse localized Korean cardinal spellout");
      AUnit.Assertions.Assert
        (Chinese_Word_Cardinal.Status = Humanize.Status.Ok
         and then Chinese_Word_Cardinal.Value = 2_345,
         "parse localized Chinese cardinal spellout");
      AUnit.Assertions.Assert
        (Polish_Word_Ordinal.Status = Humanize.Status.Ok
         and then Polish_Word_Ordinal.Value = 121,
         "parse localized Polish ordinal spellout");
      AUnit.Assertions.Assert
        (Polish_Thousands_Word_Ordinal.Status = Humanize.Status.Ok
         and then Polish_Thousands_Word_Ordinal.Value = 2_345,
         "parse localized Polish thousands ordinal spellout");
      AUnit.Assertions.Assert
        (Japanese_Word_Ordinal.Status = Humanize.Status.Ok
         and then Japanese_Word_Ordinal.Value = 12,
         "parse localized Japanese ordinal spellout");
      AUnit.Assertions.Assert
        (Korean_Word_Ordinal.Status = Humanize.Status.Ok
         and then Korean_Word_Ordinal.Value = 12,
         "parse localized Korean ordinal spellout");
      AUnit.Assertions.Assert
        (Chinese_Word_Ordinal.Status = Humanize.Status.Ok
         and then Chinese_Word_Ordinal.Value = 12,
         "parse localized Chinese ordinal spellout");
      AUnit.Assertions.Assert
        (Japanese_Thousands_Word_Ordinal.Status = Humanize.Status.Ok
         and then Japanese_Thousands_Word_Ordinal.Value = 2_345,
         "parse localized Japanese thousands ordinal spellout");
      AUnit.Assertions.Assert
        (Scientific.Status = Humanize.Status.Ok
         and then Scientific.Value = 1_230_000.0,
         "parse scientific number");
      AUnit.Assertions.Assert
        (Duration_Range.Status = Humanize.Status.Ok
         and then Duration_Range.Low = 3_600
         and then Duration_Range.High = 7_200,
         "parse duration range");
      AUnit.Assertions.Assert
        (Countdown.Status = Humanize.Status.Ok and then Countdown.Value = 60,
         "parse countdown");
      AUnit.Assertions.Assert
        (SLA.Status = Humanize.Status.Ok and then SLA.Value = 86_400,
         "parse SLA window");
      AUnit.Assertions.Assert
        (Age.Status = Humanize.Status.Ok and then Age.Value = 259_200,
         "parse age phrase");
      AUnit.Assertions.Assert
        (Modified.Status = Humanize.Status.Ok and then Modified.Value = 7_200,
         "parse modified-ago phrase");
      AUnit.Assertions.Assert
        (Parsed_Progress.Status = Humanize.Status.Ok
         and then Parsed_Progress.Count = 3
         and then Parsed_Progress.Total = 10,
         "parse progress phrase");
      AUnit.Assertions.Assert
        (Results.Status = Humanize.Status.Ok and then Results.Count = 24,
         "parse result count");
      AUnit.Assertions.Assert
        (Counted.Status = Humanize.Status.Ok
         and then Counted.Count = 0
         and then Counted.Noun (1 .. Counted.Noun_Length) = "files",
         "parse counted noun zero");
      AUnit.Assertions.Assert
        (Article_Count.Status = Humanize.Status.Ok
         and then Article_Count.Count = 1
         and then Article_Count.Noun (1 .. Article_Count.Noun_Length) = "item",
         "parse counted noun article");
      AUnit.Assertions.Assert
        (Compact_Count.Status = Humanize.Status.Ok
         and then Compact_Count.Count = 1_200
         and then Compact_Count.Noun (1 .. Compact_Count.Noun_Length) = "files",
         "parse counted noun compact count");
      AUnit.Assertions.Assert
        (Word_Count.Status = Humanize.Status.Ok
         and then Word_Count.Count = 21
         and then Word_Count.Noun (1 .. Word_Count.Noun_Length) = "entries",
         "parse counted noun word count");
      AUnit.Assertions.Assert
        (Scanned_Count.Status = Humanize.Status.Ok
         and then Scanned_Count.Count = 3
         and then Scanned_Count.Noun (1 .. Scanned_Count.Noun_Length) = "boxes"
         and then Scanned_Count.Consumed = 7,
         "scan counted noun prefix");
      AUnit.Assertions.Assert
        (Showing.Status = Humanize.Status.Ok
         and then Showing.Count = 20
         and then Showing.Total = 153,
         "parse showing count");
      AUnit.Assertions.Assert
        (Page.Status = Humanize.Status.Ok
         and then Page.Count = 2
         and then Page.Total = 8,
         "parse page count");
      AUnit.Assertions.Assert
        (ETA.Status = Humanize.Status.Ok and then ETA.Value = 300,
         "parse ETA phrase");
      AUnit.Assertions.Assert
        (Retry.Status = Humanize.Status.Ok and then Retry.Value = 10,
         "parse retry phrase");
      AUnit.Assertions.Assert
        (Step.Status = Humanize.Status.Ok
         and then Step.Count = 2
         and then Step.Total = 5,
         "parse step count");
      AUnit.Assertions.Assert
        (Attempt.Status = Humanize.Status.Ok
         and then Attempt.Count = 2
         and then Attempt.Total = 3,
         "parse attempt count");
      AUnit.Assertions.Assert
        (Business.Status = Humanize.Status.Ok and then Business.Value = 3,
         "parse business days");
      AUnit.Assertions.Assert
        (Working.Status = Humanize.Status.Ok and then Working.Value = 1,
         "parse working hours");
      AUnit.Assertions.Assert
        (Recurrence.Status = Humanize.Status.Ok and then Recurrence.Value = 2,
         "parse recurrence");
      AUnit.Assertions.Assert
        (Other_Tuesday.Status = Humanize.Status.Ok
         and then Other_Tuesday.Kind = Humanize.Parsing.Recurrence_Weekday
         and then Other_Tuesday.Every = 2
         and then Other_Tuesday.Unit = Humanize.Durations.Every_Week
         and then Other_Tuesday.Weekday = 2,
         "parse every-other weekday recurrence");
      AUnit.Assertions.Assert
        (Weekday_Schedule.Status = Humanize.Status.Ok
         and then Weekday_Schedule.Kind =
           Humanize.Parsing.Recurrence_Weekday_Set
         and then Weekday_Schedule.Weekdays = Humanize.Durations.Weekdays
         and then Weekday_Schedule.Has_Time
         and then Weekday_Schedule.Hour = 9
         and then Weekday_Schedule.Minute = 0,
         "parse weekday schedule recurrence");
      AUnit.Assertions.Assert
        (First_Monday.Status = Humanize.Status.Ok
         and then First_Monday.Kind =
           Humanize.Parsing.Recurrence_Ordinal_Weekday
         and then First_Monday.Unit = Humanize.Durations.Every_Month
         and then First_Monday.Ordinal = 1
         and then First_Monday.Weekday = 1
         and then First_Monday.Has_Time
         and then First_Monday.Hour = 9
         and then First_Monday.Minute = 30,
         "parse ordinal weekday recurrence");
      AUnit.Assertions.Assert
        (Cron_Weekday.Status = Humanize.Status.Ok
         and then Cron_Weekday.Kind = Humanize.Parsing.Recurrence_Weekday_Set
         and then Cron_Weekday.Weekdays = Humanize.Durations.Weekdays
         and then Cron_Weekday.Has_Time
         and then Cron_Weekday.Hour = 9
         and then Cron_Weekday.Minute = 0,
         "parse cron weekday schedule");
      AUnit.Assertions.Assert
        (Cron_Monthly.Status = Humanize.Status.Ok
         and then Cron_Monthly.Unit = Humanize.Durations.Every_Month
         and then Cron_Monthly.Day_Of_Month = 15
         and then Cron_Monthly.Has_Time
         and then Cron_Monthly.Hour = 8
         and then Cron_Monthly.Minute = 30,
         "parse cron monthly schedule");
      AUnit.Assertions.Assert
        (Scanned_Cron.Status = Humanize.Status.Ok
         and then Scanned_Cron.Kind = Humanize.Parsing.Recurrence_Weekday_Set
         and then Scanned_Cron.Weekdays = Humanize.Durations.Weekdays
         and then Scanned_Cron.Has_Time
         and then Scanned_Cron.Hour = 9
         and then Scanned_Cron.Consumed = 11,
         "scan cron weekday schedule");
      AUnit.Assertions.Assert
        (Cron_Step_Minute.Status = Humanize.Status.Ok
         and then Cron_Step_Minute.Every = 15
         and then Cron_Step_Minute.Unit = Humanize.Durations.Every_Minute,
         "parse cron stepped minute schedule");
      AUnit.Assertions.Assert
        (Cron_Step_Hour.Status = Humanize.Status.Ok
         and then Cron_Step_Hour.Every = 2
         and then Cron_Step_Hour.Unit = Humanize.Durations.Every_Hour
         and then Cron_Step_Hour.Has_Time
         and then Cron_Step_Hour.Minute = 0,
         "parse cron stepped hour schedule");
      AUnit.Assertions.Assert
        (Cron_Named_List.Status = Humanize.Status.Ok
         and then Cron_Named_List.Kind =
           Humanize.Parsing.Recurrence_Weekday_Set
         and then Cron_Named_List.Weekdays (1)
         and then Cron_Named_List.Weekdays (3)
         and then Cron_Named_List.Weekdays (5)
         and then not Cron_Named_List.Weekdays (2)
         and then Cron_Named_List.Has_Time
         and then Cron_Named_List.Hour = 9
         and then Cron_Named_List.Minute = 30,
         "parse cron named weekday list");
      AUnit.Assertions.Assert
        (Cron_Yearly.Status = Humanize.Status.Ok
         and then Cron_Yearly.Unit = Humanize.Durations.Every_Year
         and then Cron_Yearly.Month_Of_Year = 1
         and then Cron_Yearly.Day_Of_Month = 15
         and then Cron_Yearly.Has_Time
         and then Cron_Yearly.Hour = 8
         and then Cron_Yearly.Minute = 30,
         "parse cron named month yearly schedule");
      AUnit.Assertions.Assert
        (Cron_Quartz_Weekday.Status = Humanize.Status.Ok
         and then Cron_Quartz_Weekday.Kind =
           Humanize.Parsing.Recurrence_Weekday_Set
         and then Cron_Quartz_Weekday.Has_Second
         and then Cron_Quartz_Weekday.Second = 0
         and then Cron_Quartz_Weekday.Has_Time
         and then Cron_Quartz_Weekday.Hour = 9
         and then Cron_Quartz_Weekday.Minute = 0
         and then Cron_Quartz_Weekday.Weekdays =
           Humanize.Durations.Weekdays,
         "parse quartz cron weekday schedule");
      AUnit.Assertions.Assert
        (Cron_Quartz_Year.Status = Humanize.Status.Ok
         and then Cron_Quartz_Year.Unit = Humanize.Durations.Every_Year
         and then Cron_Quartz_Year.Has_Second
         and then Cron_Quartz_Year.Second = 30
         and then Cron_Quartz_Year.Has_Year
         and then Cron_Quartz_Year.Year = 2027
         and then Cron_Quartz_Year.Month_Of_Year = 1
         and then Cron_Quartz_Year.Day_Of_Month = 15
         and then Cron_Quartz_Year.Hour = 8
         and then Cron_Quartz_Year.Minute = 15,
         "parse quartz cron year field");
      AUnit.Assertions.Assert
        (Cron_Last_Day.Status = Humanize.Status.Ok
         and then Cron_Last_Day.Unit = Humanize.Durations.Every_Month
         and then Cron_Last_Day.Is_Last_Day_Of_Month,
         "parse quartz cron last day of month");
      AUnit.Assertions.Assert
        (Cron_Nearest_Weekday.Status = Humanize.Status.Ok
         and then Cron_Nearest_Weekday.Unit = Humanize.Durations.Every_Month
         and then Cron_Nearest_Weekday.Day_Of_Month = 15
         and then Cron_Nearest_Weekday.Is_Nearest_Weekday,
         "parse quartz cron nearest weekday");
      AUnit.Assertions.Assert
        (Cron_Last_Friday.Status = Humanize.Status.Ok
         and then Cron_Last_Friday.Kind =
           Humanize.Parsing.Recurrence_Ordinal_Weekday
         and then Cron_Last_Friday.Is_Last_Weekday
         and then Cron_Last_Friday.Ordinal = -1
         and then Cron_Last_Friday.Weekday = 5,
         "parse quartz cron last weekday");
   end Check_Basic_Number_Duration_And_Cron_Parsers;
