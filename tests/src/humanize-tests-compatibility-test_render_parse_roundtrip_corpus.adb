separate (Humanize.Tests.Compatibility)
   procedure Test_Render_Parse_Roundtrip_Corpus
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Today : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, others => 0);
      Tomorrow : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 22, others => 0);
      Yesterday : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 20, others => 0);
   begin
      Check_Precise_Duration_Roundtrip
        (1_500_000, "precise duration seconds milliseconds");
      Check_Duration_Phrase_Roundtrips;
      Check_Progress_Roundtrips;
      Check_List_Count_Roundtrips;
      Check_Number_Roundtrips;
      Check_Unit_Compound_Roundtrips;
      Check_Scanner_Roundtrips;
      Check_Deterministic_Helper_Roundtrips;

      for Locale_Access of Humanize.Locales.Shipped_Locales loop
         declare
            Locale  : constant String := Locale_Access.all;
            Context : constant Humanize.Contexts.Context :=
              Support.Locale (Locale);
         begin
            Check_Duration_Roundtrip
              (Context, Locale, 2, "duration seconds");
            Check_Duration_Roundtrip
              (Context, Locale, 120, "duration minutes");
            Check_Duration_Roundtrip
              (Context, Locale, 7_200, "duration hours");
            Check_Duration_Roundtrip
              (Context, Locale, 172_800, "duration days");
            Check_Duration_Components_Roundtrip
              (Context, Locale, 3_661, "duration components");

            Check_Bytes_Roundtrip
              (Context, Locale, 1_536, "bytes binary");
            Check_Compact_Roundtrip
              (Context, Locale, 1_200, "compact thousand");
            Check_Compact_Roundtrip
              (Context, Locale, 1_200_000, "compact million");
            Check_Percent_Roundtrip
              (Context, Locale, 12.5, 13, "percent decimal");

            Check_Frequency_Roundtrip
              (Context, Locale, 0, "frequency never");
            Check_Frequency_Roundtrip
              (Context, Locale, 1, "frequency once");
            Check_Frequency_Roundtrip
              (Context, Locale, 2, "frequency twice");
            Check_Frequency_Roundtrip
              (Context, Locale, 4, "frequency count");
            Check_Rate_Roundtrip
              (Context, Locale, 4, Humanize.Rates.Per_Week, "rate week");

            Check_Unit_Roundtrip
              (Context, Locale, 5, Humanize.Units.Meter, "unit meter");
            Check_Unit_Roundtrip
              (Context, Locale, 5, Humanize.Units.Kilometer,
               "unit kilometer");
            Check_Unit_Roundtrip
              (Context, Locale, 5, Humanize.Units.Kilogram,
               "unit kilogram");
            Check_Unit_Roundtrip
              (Context, Locale, 5, Humanize.Units.Liter, "unit liter");
            Check_List_Roundtrip (Context, Locale);

            Check_Natural_Day_Roundtrip
              (Context, Locale, Today,
               Ada.Calendar.Time_Of (2026, 3, 21, 0.0),
               "natural day today");
            Check_Directional_Natural_Day_Roundtrips
              (Context, Locale, Tomorrow, Yesterday);
         end;
      end loop;
   end Test_Render_Parse_Roundtrip_Corpus;
