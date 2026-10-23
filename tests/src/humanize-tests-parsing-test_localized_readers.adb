with Humanize.Contexts;
with Humanize.Numbers.Spellout;

separate (Humanize.Tests.Parsing)
   procedure Test_Localized_Readers
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      package L renames Humanize.Parsing.Localized;
      package DT renames Humanize.Datetimes;
      use type L.Calendar_Period;

      function Day (Year, Month, Day_Of_Month : Integer) return DT.Civil_Date_Time is
        (DT.Civil_Date_Time'(Year => Year, Month => Month, Day => Day_Of_Month, others => <>));

      Names : constant Humanize.Lists.Text_List :=
        [To_Unbounded_String ("Anna"), To_Unbounded_String ("Bo Li"), To_Unbounded_String ("Cem"),
         To_Unbounded_String ("Dana"), To_Unbounded_String ("Eli")];

      procedure Check_List (Locale : String; Count : Positive; Style : Humanize.Lists.List_Style) is
         Text   : constant String :=
           Humanize.Tests.Support.Text
             (Humanize.Lists.Format
                (Humanize.Tests.Support.Locale (Locale), Names (Names'First .. Names'First + Count - 1),
                 (Style => Style, Oxford_Comma => False)));
         Parsed : constant L.List_Read_Result := L.Parse_List (Humanize.Tests.Support.Locale (Locale), Text, Style);
         Same   : Boolean := Parsed.Status = Humanize.Status.Ok and then Parsed.Count = Count;
      begin
         for I in 1 .. (if Same then Count else 0) loop
            Same := Same and then Parsed.Items (I) = Names (Names'First + I - 1);
         end loop;
         AUnit.Assertions.Assert (Same, Locale & " list of" & Count'Image & " read back: " & Text);
      end Check_List;

      procedure Check_Words (Locale : String; Value : Natural) is
         Context  : constant Humanize.Contexts.Context := Humanize.Tests.Support.Locale (Locale);
         Cardinal : constant String :=
           Humanize.Tests.Support.Text (Humanize.Numbers.Spellout.Locale_Cardinal (Context, Long_Long_Integer (Value)));
         Ordinal  : constant String :=
           Humanize.Tests.Support.Text (Humanize.Numbers.Spellout.Ordinal_Words (Context, Value));
         Read     : constant Humanize.Parsing.Float_Parse_Result := L.Parse_Spellout (Context, Cardinal);
         Nth      : constant Humanize.Parsing.Float_Parse_Result := L.Parse_Ordinal_Words (Context, Ordinal);
      begin
         AUnit.Assertions.Assert
           (Read.Status = Humanize.Status.Ok and then Read.Value = Long_Float (Value),
            Locale & " spelled" & Value'Image & " read back: " & Cardinal);
         AUnit.Assertions.Assert
           (Value = 0
            or else (Nth.Status = Humanize.Status.Ok and then Nth.Value = Long_Float (Value)),
            Locale & " ordinal" & Value'Image & " read back: " & Ordinal);
      end Check_Words;

      procedure Check_Difference (Locale : String; First, Last : DT.Civil_Date_Time; Y, M, D : Natural) is
         Context : constant Humanize.Contexts.Context := Humanize.Tests.Support.Locale (Locale);
         Text    : constant String :=
           Humanize.Tests.Support.Text (DT.Calendar_Difference_Label (Context, First, Last));
         Parsed  : constant L.Calendar_Difference_Parse_Result := L.Parse_Calendar_Difference (Context, Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok and then Parsed.Years = Y and then Parsed.Months = M
            and then Parsed.Days = D,
            Locale & " calendar difference read back: " & Text & " ->" & Parsed.Years'Image & Parsed.Months'Image
            & Parsed.Days'Image);
      end Check_Difference;

      type Value_List is array (Positive range <>) of Natural;
      Integer_Samples : constant Value_List := [0, 1, 2, 7, 11, 21, 34, 100, 101, 1_234, 20_000, 99_999, 1_000_000];

      --  A Wednesday, not the reader's own reference: inside the same week
      --  whether weeks start on Saturday, Sunday or Monday.
      Reference : constant DT.Civil_Date_Time := Day (2026, 10, 14);

      procedure Check_Relation
        (Locale : String; Value : DT.Civil_Date_Time; Period : L.Calendar_Period; Offset : L.Period_Offset)
      is
         Context  : constant Humanize.Contexts.Context := Humanize.Tests.Support.Locale (Locale);
         Rendered : constant Humanize.Status.Text_Result := DT.Calendar_Relation (Context, Value, Reference);
         Text     : constant String := To_String (Rendered.Text);
         Parsed   : constant L.Calendar_Relation_Parse_Result := L.Parse_Calendar_Relation (Context, Text);
      begin
         AUnit.Assertions.Assert
           (Rendered.Status = Humanize.Status.Ok and then Parsed.Status = Humanize.Status.Ok
            and then Parsed.Period = Period and then Parsed.Offset = Offset,
            Locale & " calendar relation read back: " & Text);
      end Check_Relation;
      procedure Check_Number_Range (Locale : String) is
         Context : constant Humanize.Contexts.Context := Humanize.Tests.Support.Locale (Locale);
         Plain   : constant String :=
           Humanize.Tests.Support.Text (Humanize.Numbers.Number_Range (Context, 1200, 5000));
         About   : constant String :=
           Humanize.Tests.Support.Text (Humanize.Numbers.Approximate_Range (Context, 10, 20));
         Decimal : constant String :=
           Humanize.Tests.Support.Text (Humanize.Numbers.Decimal_Range (Context, 1.2, 3.4));
         P       : constant L.Number_Range_Parse_Result := L.Parse_Number_Range (Context, Plain);
         A       : constant L.Number_Range_Parse_Result := L.Parse_Number_Range (Context, About);
         D       : constant L.Number_Range_Parse_Result := L.Parse_Number_Range (Context, Decimal);
      begin
         AUnit.Assertions.Assert
           (P.Status = Humanize.Status.Ok and then P.Low = 1200.0 and then P.High = 5000.0 and then not P.Approximate,
            Locale & " number range read back: " & Plain);
         AUnit.Assertions.Assert
           (A.Status = Humanize.Status.Ok and then A.Low = 10.0 and then A.High = 20.0 and then A.Approximate,
            Locale & " approximate range read back: " & About);
         AUnit.Assertions.Assert
           (D.Status = Humanize.Status.Ok and then abs (D.Low - 1.2) < 1.0E-9 and then abs (D.High - 3.4) < 1.0E-9,
            Locale & " decimal range read back: " & Decimal);
      end Check_Number_Range;

      procedure Check_Date_Range (Locale : String; First, Last : DT.Civil_Date_Time) is
         Context : constant Humanize.Contexts.Context := Humanize.Tests.Support.Locale (Locale);
         Named   : constant DT.Range_Options := (DT.Default_Range_Options with delta Use_Month_Names => True);
         Text    : constant String := Humanize.Tests.Support.Text (DT.Date_Range (Context, First, Last, Named));
         Parsed  : constant L.Date_Range_Parse_Result := L.Parse_Date_Range (Context, Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.First.Year = First.Year and then Parsed.First.Month = First.Month
            and then Parsed.First.Day = First.Day and then Parsed.Last.Year = Last.Year
            and then Parsed.Last.Month = Last.Month and then Parsed.Last.Day = Last.Day,
            Locale & " date range read back: " & Text);
      end Check_Date_Range;

      procedure Check_Duration_Range (Locale : String; Low, High : Humanize.Durations.Duration_Seconds) is
         Context  : constant Humanize.Contexts.Context := Humanize.Tests.Support.Locale (Locale);
         Text     : constant String :=
           Humanize.Tests.Support.Text (Humanize.Durations.Format_Range (Context, Low, High));
         Got_Low  : Humanize.Durations.Duration_Seconds;
         Got_High : Humanize.Durations.Duration_Seconds;
         Status   : constant Humanize.Status.Status_Code := L.Parse_Duration_Range (Context, Text, Got_Low, Got_High);
      begin
         AUnit.Assertions.Assert
           (Status = Humanize.Status.Ok and then Got_Low = Low and then Got_High = High,
            Locale & " duration range read back: " & Text);
      end Check_Duration_Range;

      procedure Check_Times (Locale : String; Count : Natural) is
         Context : constant Humanize.Contexts.Context := Humanize.Tests.Support.Locale (Locale);
         Text    : constant String :=
           Humanize.Tests.Support.Text (Humanize.Frequencies.Times (Context, Long_Long_Integer (Count)));
         Parsed  : constant Humanize.Parsing.Float_Parse_Result := L.Parse_Times (Context, Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok and then Parsed.Value = Long_Float (Count),
            Locale & " count read back: " & Text);
      end Check_Times;

      procedure Check_Grouped (Locale, Text : String; Value : Long_Float) is
         Parsed : constant Humanize.Parsing.Float_Parse_Result :=
           L.Parse_Number (Humanize.Tests.Support.Locale (Locale), Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok and then Parsed.Value = Value,
            Locale & " grouped number read back: " & Text);
      end Check_Grouped;
   begin
      Check_Grouped ("de", "1.234,5", 1_234.5);
      Check_Grouped ("en", "1,234,567", 1_234_567.0);
      Check_Grouped ("hi", "12,34,567", 1_234_567.0);
      Check_Grouped ("de", "-12.000", -12_000.0);
      AUnit.Assertions.Assert
        (Humanize.Tests.Support.Text
           (DT.Date_Range
              (Humanize.Tests.Support.Locale ("de"), Day (2026, 10, 9), Day (2026, 10, 15),
               (DT.Default_Range_Options with delta Use_Month_Names => True)))
         = "9." & Humanize.Tests.Support.U (16#2013#) & "15. Okt. 2026",
         "a German date range writes the month and year once");
      AUnit.Assertions.Assert
        (Humanize.Tests.Support.Text
           (Humanize.Durations.Format_Range (Humanize.Tests.Support.Locale ("de"), 3_600, 7_200))
         = "1" & Humanize.Tests.Support.U (16#2013#) & "2 Stunden",
         "a German range of hours writes the unit once");
      declare
         From  : constant DT.Civil_Date_Time := (Year => 2026, Month => 10, Day => 9, Hour => 14, others => <>);
         To_Time : constant DT.Civil_Date_Time :=
           (Year => 2026, Month => 10, Day => 9, Hour => 15, Minute => 30, others => <>);
         German : constant Humanize.Contexts.Context := Humanize.Tests.Support.Locale ("de");
      begin
         AUnit.Assertions.Assert
           (Humanize.Tests.Support.Text (DT.Time_Range (German, From, To_Time))
            = "14:00" & Humanize.Tests.Support.U (16#2013#) & "15:30 Uhr",
            "a German time range by CLDR's interval format");
         AUnit.Assertions.Assert
           (Humanize.Tests.Support.Text (DT.Date_Time_Range (German, From, To_Time, From))
            = "9. Okt. 2026, 14:00" & Humanize.Tests.Support.U (16#2013#) & "15:30 Uhr",
            "a German date-time range writes one day once");
      end;
      --  Weeks start where the locale's region starts them: the Sunday after
      --  a Saturday is next week in the United States, this week in Germany.
      AUnit.Assertions.Assert
        (Humanize.Tests.Support.Text
           (DT.Calendar_Relation (Humanize.Tests.Support.Locale ("en"), Day (2026, 10, 11), Day (2026, 10, 10)))
         = "next week",
         "a United States week starts on Sunday");
      AUnit.Assertions.Assert
        (Humanize.Tests.Support.Text
           (DT.Calendar_Relation (Humanize.Tests.Support.Locale ("de"), Day (2026, 10, 11), Day (2026, 10, 10)))
         = "diese Woche",
         "a German week starts on Monday");
      for Locale_Access of Humanize.Locales.Shipped_Locales loop
         declare
            Name : constant String := Locale_Access.all;
         begin
            for Count in 1 .. 5 loop
               Check_List (Name, Count, Humanize.Lists.Conjunction);
               Check_List (Name, Count, Humanize.Lists.Disjunction);
            end loop;
            for Value of Integer_Samples loop
               Check_Words (Name, Value);
            end loop;
            Check_Difference (Name, Day (2024, 1, 5), Day (2026, 3, 9), 2, 2, 4);
            Check_Difference (Name, Day (2025, 1, 1), Day (2026, 1, 1), 1, 0, 0);
            Check_Difference (Name, Day (2026, 1, 1), Day (2026, 1, 18), 0, 0, 17);
            Check_Difference (Name, Day (2026, 1, 31), Day (2026, 3, 2), 0, 1, 2);
            Check_Difference (Name, Day (1990, 6, 1), Day (2026, 6, 1), 36, 0, 0);
            Check_Relation (Name, Day (2026, 10, 7), L.Week_Period, -1);
            Check_Relation (Name, Day (2026, 10, 13), L.Week_Period, 0);
            Check_Relation (Name, Day (2026, 10, 21), L.Week_Period, 1);
            Check_Relation (Name, Day (2026, 9, 14), L.Month_Period, -1);
            Check_Relation (Name, Day (2026, 11, 14), L.Month_Period, 1);
            Check_Relation (Name, Day (2025, 10, 14), L.Year_Period, -1);
            Check_Relation (Name, Day (2027, 10, 14), L.Year_Period, 1);
            Check_Number_Range (Name);
            --  English keeps its own wording, with no year within one month.
            if Name /= "en" then
               Check_Date_Range (Name, Day (2026, 10, 9), Day (2026, 10, 15));
               Check_Date_Range (Name, Day (2026, 10, 9), Day (2026, 11, 15));
               Check_Date_Range (Name, Day (2026, 12, 28), Day (2027, 1, 4));
               Check_Date_Range (Name, Day (2026, 10, 9), Day (2026, 10, 9));
            end if;
            Check_Duration_Range (Name, 3_600, 7_200);
            Check_Duration_Range (Name, 120, 7_200);
            for Count of Integer_Samples loop
               Check_Times (Name, Count);
            end loop;
         end;
      end loop;
   end Test_Localized_Readers;
