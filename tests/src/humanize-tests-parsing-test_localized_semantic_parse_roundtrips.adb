separate (Humanize.Tests.Parsing)
   procedure Test_Localized_Semantic_Parse_Roundtrips
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);

      Reference : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 3, 21, 12.0 * 3_600.0);
      Today : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, others => 0);
      Tomorrow : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 22, others => 0);

      procedure Check_Compact
        (Locale : String;
         Value  : Long_Long_Integer)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Numbers.Compact
             (Humanize.Tests.Support.Locale (Locale), Value);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Parse_Compact_Number (Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Value = Value,
            Locale & " localized compact round trip: " & Text);
      end Check_Compact;

      procedure Check_Percent (Locale : String) is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Numbers.Percent
             (Humanize.Tests.Support.Locale (Locale), 12.0);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Parse_Percent (Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Value = 12,
            Locale & " localized percent round trip: " & Text);
      end Check_Percent;

      procedure Check_Frequency
        (Locale : String;
         Count  : Humanize.Frequencies.Occurrence_Count)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Frequencies.Times
             (Humanize.Tests.Support.Locale (Locale), Count);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Frequency_Parse_Result :=
           Humanize.Parsing.Parse_Frequency (Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Count = Count,
            Locale & " localized frequency round trip: " & Text);
      end Check_Frequency;

      procedure Check_Rate
        (Locale    : String;
         Count     : Humanize.Frequencies.Occurrence_Count;
         Less_Than : Boolean := False)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Rates.Pace_Approximate
             (Humanize.Tests.Support.Locale (Locale), Count,
              Humanize.Rates.Per_Week);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Rate_Parse_Result :=
           Humanize.Parsing.Parse_Rate (Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Period = Humanize.Rates.Per_Week
            and then Parsed.Less_Than = Less_Than
            and then
              (if Less_Than then Parsed.Count = 1 else Parsed.Count = Count),
            Locale & " localized rate round trip: " & Text);
      end Check_Rate;

      procedure Check_List (Locale : String) is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Lists.Format
             (Humanize.Tests.Support.Locale (Locale),
              [1 => To_Unbounded_String ("alpha"),
               2 => To_Unbounded_String ("beta"),
               3 => To_Unbounded_String ("gamma")]);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.List_Parse_Result :=
           Humanize.Parsing.Parse_List (Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Count = 3,
            Locale & " localized list round trip: " & Text);
      end Check_List;

      procedure Check_Natural_Day
        (Locale : String;
         Day    : Humanize.Datetimes.Civil_Date_Time;
         Offset : Integer)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Datetimes.Natural_Day
             (Humanize.Tests.Support.Locale (Locale), Day, Today);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Date_Parse_Result :=
           Humanize.Parsing.Parse_Natural_Date (Reference, Text);
         Expected : constant Ada.Calendar.Time :=
           Reference + Standard.Duration (Offset * 86_400);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Ada.Calendar.Year (Parsed.Value) =
              Ada.Calendar.Year (Expected)
            and then Ada.Calendar.Month (Parsed.Value) =
              Ada.Calendar.Month (Expected)
            and then Ada.Calendar.Day (Parsed.Value) =
              Ada.Calendar.Day (Expected),
            Locale & " localized natural day round trip: " & Text);
      end Check_Natural_Day;

      procedure Check_Relative_Day
        (Locale : String;
         Offset : Integer)
      is
         Target : constant Ada.Calendar.Time :=
           Reference + Standard.Duration (Offset * 86_400);
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Datetimes.Relative
             (Humanize.Tests.Support.Locale (Locale), Target, Reference);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Date_Parse_Result :=
           Humanize.Parsing.Parse_Natural_Date (Reference, Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Ada.Calendar.Year (Parsed.Value) =
              Ada.Calendar.Year (Target)
            and then Ada.Calendar.Month (Parsed.Value) =
              Ada.Calendar.Month (Target)
            and then Ada.Calendar.Day (Parsed.Value) =
              Ada.Calendar.Day (Target),
            Locale & " localized relative day round trip: " & Text);
      end Check_Relative_Day;
   begin
      for Locale_Access of Humanize.Locales.Shipped_Locales loop
         declare
            Name : constant String := Locale_Access.all;
         begin
            Check_Compact (Name, 1_200);
            Check_Compact (Name, 1_200_000);
            Check_Percent (Name);
            Check_Frequency (Name, 0);
            Check_Frequency (Name, 1);
            Check_Frequency (Name, 2);
            Check_Frequency (Name, 4);
            Check_Rate (Name, 0, Less_Than => True);
            Check_Rate (Name, 4);
            Check_List (Name);
            Check_Natural_Day (Name, Today, 0);
            Check_Natural_Day (Name, Tomorrow, 1);
            Check_Relative_Day (Name, 3);
            Check_Relative_Day (Name, -3);
         end;
      end loop;
   end Test_Localized_Semantic_Parse_Roundtrips;
