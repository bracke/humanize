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
         end;
      end loop;
   end Test_Localized_Readers;
