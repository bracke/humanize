separate (Humanize.Tests.Rendering)
   procedure Test_Locale_Quality_Audit
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);

      Reference : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 3, 21, 12.0 * 3_600.0);
      Today : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, others => 0);
      Tomorrow : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 22, others => 0);

      function Native_Script_Expected (Locale : String) return Boolean is
      begin
         return Locale = "ru" or else Locale = "uk"
           or else Humanize.Locales.Is_CJK (Locale)
           or else Locale = "ar" or else Locale = "hi";
      end Native_Script_Expected;

      procedure Audit_Locale (Locale : String) is
         Context : constant Humanize.Contexts.Context := Support.Locale (Locale);
      begin
         Check_Audit_Text
           (Locale, "duration-second",
            Humanize.Durations.Format (Context, 2));
         Check_Audit_Text
           (Locale, "duration-minute",
            Humanize.Durations.Format (Context, 120));
         Check_Audit_Text
           (Locale, "duration-hour",
            Humanize.Durations.Format (Context, 7_200));
         Check_Audit_Text
           (Locale, "duration-day",
            Humanize.Durations.Format (Context, 172_800));
         Check_Audit_Text
           (Locale, "duration-week",
            Humanize.Durations.Format (Context, 1_209_600));
         Check_Audit_Text
           (Locale, "duration-month",
            Humanize.Durations.Format (Context, 5_184_000));
         Check_Audit_Text
           (Locale, "duration-year",
            Humanize.Durations.Format (Context, 63_072_000));
         Check_Audit_Text
           (Locale, "bytes",
            Humanize.Bytes.Format (Context, 1_536));
         Check_Audit_Text
           (Locale, "compact-thousand",
            Humanize.Numbers.Compact (Context, 1_200));
         Check_Audit_Text
           (Locale, "compact-million",
            Humanize.Numbers.Compact (Context, 1_200_000));
         Check_Audit_Text
           (Locale, "percent",
            Humanize.Numbers.Percent (Context, 12.5));
         Check_Audit_Text
           (Locale, "frequency-count",
            Humanize.Frequencies.Times (Context, 4));
         Check_Audit_Text
           (Locale, "rate-second",
            Humanize.Rates.Pace_Approximate
              (Context, 4, Humanize.Rates.Per_Second));
         Check_Audit_Text
           (Locale, "rate-minute",
            Humanize.Rates.Pace_Approximate
              (Context, 4, Humanize.Rates.Per_Minute));
         Check_Audit_Text
           (Locale, "rate-hour",
            Humanize.Rates.Pace_Approximate
              (Context, 4, Humanize.Rates.Per_Hour));
         Check_Audit_Text
           (Locale, "rate-day",
            Humanize.Rates.Pace_Approximate
              (Context, 4, Humanize.Rates.Per_Day));
         Check_Audit_Text
           (Locale, "rate-week",
            Humanize.Rates.Pace_Approximate
              (Context, 4, Humanize.Rates.Per_Week));
         Check_Audit_Text
           (Locale, "rate-hour-less",
            Humanize.Rates.Pace_Approximate
              (Context, 0, Humanize.Rates.Per_Hour));
         Check_Audit_Text
           (Locale, "unit-meter",
            Humanize.Units.Format (Context, 5, Humanize.Units.Meter));
         Check_Audit_Text
           (Locale, "unit-kilometer",
            Humanize.Units.Format (Context, 5, Humanize.Units.Kilometer));
         Check_Audit_Text
           (Locale, "unit-centimeter",
            Humanize.Units.Format (Context, 5, Humanize.Units.Centimeter));
         Check_Audit_Text
           (Locale, "unit-millimeter",
            Humanize.Units.Format (Context, 5, Humanize.Units.Millimeter));
         Check_Audit_Text
           (Locale, "unit-gram",
            Humanize.Units.Format (Context, 5, Humanize.Units.Gram));
         Check_Audit_Text
           (Locale, "unit-kilogram",
            Humanize.Units.Format (Context, 5, Humanize.Units.Kilogram));
         Check_Audit_Text
           (Locale, "unit-milligram",
            Humanize.Units.Format (Context, 5, Humanize.Units.Milligram));
         Check_Audit_Text
           (Locale, "unit-liter",
            Humanize.Units.Format (Context, 5, Humanize.Units.Liter));
         Check_Audit_Text
           (Locale, "unit-milliliter",
            Humanize.Units.Format (Context, 5, Humanize.Units.Milliliter));
         Check_Audit_Text
           (Locale, "list",
            Humanize.Lists.Format
              (Context,
               [1 => To_Unbounded_String ("alpha"),
                2 => To_Unbounded_String ("beta"),
                3 => To_Unbounded_String ("gamma")]));
         Check_Audit_Text
           (Locale, "relative-past",
            Humanize.Datetimes.Relative
              (Context, Reference - Duration (2 * 3_600), Reference));
         Check_Audit_Text
           (Locale, "natural-today",
            Humanize.Datetimes.Natural_Day (Context, Today, Today));
         Check_Audit_Text
           (Locale, "natural-tomorrow",
            Humanize.Datetimes.Natural_Day (Context, Tomorrow, Today));

         if Native_Script_Expected (Locale) then
            Check_Native_Script_Text
              (Locale, "native-duration-hour",
               Humanize.Durations.Format (Context, 7_200));
            Check_Native_Script_Text
              (Locale, "native-duration-day",
               Humanize.Durations.Format (Context, 172_800));
            Check_Native_Script_Text
              (Locale, "native-duration-week",
               Humanize.Durations.Format (Context, 1_209_600));
            Check_Native_Script_Text
              (Locale, "native-duration-month",
               Humanize.Durations.Format (Context, 5_184_000));
            Check_Native_Script_Text
              (Locale, "native-duration-year",
               Humanize.Durations.Format (Context, 63_072_000));
            Check_Native_Script_Text
              (Locale, "native-frequency-count",
               Humanize.Frequencies.Times (Context, 4));
            Check_Native_Script_Text
              (Locale, "native-rate-week",
               Humanize.Rates.Pace_Approximate
                 (Context, 4, Humanize.Rates.Per_Week));
            Check_Native_Script_Text
              (Locale, "native-unit-meter",
               Humanize.Units.Format (Context, 5, Humanize.Units.Meter));
            Check_Native_Script_Text
              (Locale, "native-unit-kilometer",
               Humanize.Units.Format (Context, 5, Humanize.Units.Kilometer));
            Check_Native_Script_Text
              (Locale, "native-unit-centimeter",
               Humanize.Units.Format (Context, 5, Humanize.Units.Centimeter));
            Check_Native_Script_Text
              (Locale, "native-unit-millimeter",
               Humanize.Units.Format (Context, 5, Humanize.Units.Millimeter));
            Check_Native_Script_Text
              (Locale, "native-unit-gram",
               Humanize.Units.Format (Context, 5, Humanize.Units.Gram));
            Check_Native_Script_Text
              (Locale, "native-relative-past",
               Humanize.Datetimes.Relative
                 (Context, Reference - Duration (2 * 3_600), Reference));
            Check_Native_Script_Text
              (Locale, "native-natural-today",
               Humanize.Datetimes.Natural_Day (Context, Today, Today));
         end if;
      end Audit_Locale;
   begin
      for Locale_Access of Humanize.Locales.Shipped_Locales loop
         Audit_Locale (Locale_Access.all);
      end loop;
   end Test_Locale_Quality_Audit;
