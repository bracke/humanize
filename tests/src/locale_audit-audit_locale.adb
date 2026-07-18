separate (Locale_Audit)
   procedure Audit_Locale
     (Locale : String;
      Texts  : out Sample_Texts)
   is
      Context : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create (Runtime'Unchecked_Access, Locale);
      Reference : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 3, 21, 12.0 * 3_600.0);
      Today : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, others => 0);
      Tomorrow : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 22, others => 0);
   begin
      Audit_Result
        (Locale, Duration_Second, Humanize.Durations.Format (Context, 2),
         Texts);
      Audit_Result
        (Locale, Duration_Minute, Humanize.Durations.Format (Context, 120),
         Texts);
      Audit_Result
        (Locale, Duration_Hour, Humanize.Durations.Format (Context, 7_200),
         Texts);
      Audit_Result
        (Locale, Duration_Day, Humanize.Durations.Format (Context, 172_800),
         Texts);
      Audit_Result
        (Locale, Duration_Week, Humanize.Durations.Format (Context, 1_209_600),
         Texts);
      Audit_Result
        (Locale, Duration_Month, Humanize.Durations.Format (Context, 5_184_000),
         Texts);
      Audit_Result
        (Locale, Duration_Year, Humanize.Durations.Format (Context, 63_072_000),
         Texts);
      Audit_Result
        (Locale, Byte_Size, Humanize.Bytes.Format (Context, 1_536), Texts);
      Audit_Result
        (Locale, Compact_Thousand, Humanize.Numbers.Compact (Context, 1_200),
         Texts);
      Audit_Result
        (Locale, Compact_Million,
         Humanize.Numbers.Compact (Context, 1_200_000), Texts);
      Audit_Result
        (Locale, Percent, Humanize.Numbers.Percent (Context, 12.5), Texts);
      Audit_Result
        (Locale, Frequency_Count, Humanize.Frequencies.Times (Context, 4),
         Texts);
      Audit_Result
        (Locale, Rate_Second,
         Humanize.Rates.Pace_Approximate
           (Context, 4, Humanize.Rates.Per_Second),
         Texts);
      Audit_Result
        (Locale, Rate_Minute,
         Humanize.Rates.Pace_Approximate
           (Context, 4, Humanize.Rates.Per_Minute),
         Texts);
      Audit_Result
        (Locale, Rate_Hour,
         Humanize.Rates.Pace_Approximate
           (Context, 4, Humanize.Rates.Per_Hour),
         Texts);
      Audit_Result
        (Locale, Rate_Day,
         Humanize.Rates.Pace_Approximate
           (Context, 4, Humanize.Rates.Per_Day),
         Texts);
      Audit_Result
        (Locale, Rate_Week,
         Humanize.Rates.Pace_Approximate
           (Context, 4, Humanize.Rates.Per_Week),
         Texts);
      Audit_Result
        (Locale, Rate_Hour_Less,
         Humanize.Rates.Pace_Approximate
           (Context, 0, Humanize.Rates.Per_Hour),
         Texts);
      Audit_Result
        (Locale, Unit_Meter,
         Humanize.Units.Format (Context, 5, Humanize.Units.Meter), Texts);
      Audit_Result
        (Locale, Unit_Kilometer,
         Humanize.Units.Format (Context, 5, Humanize.Units.Kilometer), Texts);
      Audit_Result
        (Locale, Unit_Centimeter,
         Humanize.Units.Format (Context, 5, Humanize.Units.Centimeter), Texts);
      Audit_Result
        (Locale, Unit_Millimeter,
         Humanize.Units.Format (Context, 5, Humanize.Units.Millimeter), Texts);
      Audit_Result
        (Locale, Unit_Gram,
         Humanize.Units.Format (Context, 5, Humanize.Units.Gram), Texts);
      Audit_Result
        (Locale, Unit_Kilogram,
         Humanize.Units.Format (Context, 5, Humanize.Units.Kilogram), Texts);
      Audit_Result
        (Locale, Unit_Milligram,
         Humanize.Units.Format (Context, 5, Humanize.Units.Milligram), Texts);
      Audit_Result
        (Locale, Unit_Liter,
         Humanize.Units.Format (Context, 5, Humanize.Units.Liter), Texts);
      Audit_Result
        (Locale, Unit_Milliliter,
         Humanize.Units.Format (Context, 5, Humanize.Units.Milliliter), Texts);
      Audit_Result
        (Locale, Unit_Celsius,
         Humanize.Units.Format (Context, 5, Humanize.Units.Celsius), Texts);
      Audit_Result
        (Locale, Unit_Square_Meter,
         Humanize.Units.Format (Context, 5, Humanize.Units.Square_Meter),
         Texts);
      Audit_Result
        (Locale, Unit_Kilometer_Per_Hour,
         Humanize.Units.Format
           (Context, 5, Humanize.Units.Kilometer_Per_Hour),
         Texts);
      Audit_Result
        (Locale, Unit_Teaspoon,
         Humanize.Units.Format (Context, 5, Humanize.Units.Teaspoon), Texts);
      Audit_Result
        (Locale, Unit_Fahrenheit,
         Humanize.Units.Format (Context, 5, Humanize.Units.Fahrenheit),
         Texts);
      Audit_Result
        (Locale, Unit_Hectare,
         Humanize.Units.Format (Context, 5, Humanize.Units.Hectare), Texts);
      Audit_Result
        (Locale, Unit_Meter_Per_Second,
         Humanize.Units.Format
           (Context, 5, Humanize.Units.Meter_Per_Second),
         Texts);
      Audit_Result
        (Locale, Unit_Pascal,
         Humanize.Units.Format (Context, 5, Humanize.Units.Pascal), Texts);
      Audit_Result
        (Locale, Unit_Kilopascal,
         Humanize.Units.Format (Context, 5, Humanize.Units.Kilopascal),
         Texts);
      Audit_Result
        (Locale, Unit_Joule,
         Humanize.Units.Format (Context, 5, Humanize.Units.Joule), Texts);
      Audit_Result
        (Locale, Unit_Kilojoule,
         Humanize.Units.Format (Context, 5, Humanize.Units.Kilojoule), Texts);
      Audit_Result
        (Locale, Unit_Watt,
         Humanize.Units.Format (Context, 5, Humanize.Units.Watt), Texts);
      Audit_Result
        (Locale, Unit_Kilowatt,
         Humanize.Units.Format (Context, 5, Humanize.Units.Kilowatt), Texts);
      Audit_Result
        (Locale, Unit_Hertz,
         Humanize.Units.Format (Context, 5, Humanize.Units.Hertz), Texts);
      Audit_Result
        (Locale, Unit_Kilohertz,
         Humanize.Units.Format (Context, 5, Humanize.Units.Kilohertz), Texts);
      Audit_Result
        (Locale, Unit_Degree,
         Humanize.Units.Format (Context, 5, Humanize.Units.Degree), Texts);
      Audit_Result
        (Locale, Unit_Mile,
         Humanize.Units.Format (Context, 5, Humanize.Units.Mile), Texts);
      Audit_Result
        (Locale, Unit_Yard,
         Humanize.Units.Format (Context, 5, Humanize.Units.Yard), Texts);
      Audit_Result
        (Locale, Unit_Foot,
         Humanize.Units.Format (Context, 5, Humanize.Units.Foot), Texts);
      Audit_Result
        (Locale, Unit_Inch,
         Humanize.Units.Format (Context, 5, Humanize.Units.Inch), Texts);
      Audit_Result
        (Locale, Unit_Nautical_Mile,
         Humanize.Units.Format (Context, 5, Humanize.Units.Nautical_Mile),
         Texts);
      Audit_Result
        (Locale, Unit_Acre,
         Humanize.Units.Format (Context, 5, Humanize.Units.Acre), Texts);
      Audit_Result
        (Locale, Unit_Square_Kilometer,
         Humanize.Units.Format (Context, 5, Humanize.Units.Square_Kilometer),
         Texts);
      Audit_Result
        (Locale, Unit_Cubic_Meter,
         Humanize.Units.Format (Context, 5, Humanize.Units.Cubic_Meter),
         Texts);
      Audit_Result
        (Locale, Unit_Tablespoon,
         Humanize.Units.Format (Context, 5, Humanize.Units.Tablespoon),
         Texts);
      Audit_Result
        (Locale, Unit_Cup,
         Humanize.Units.Format (Context, 5, Humanize.Units.Cup), Texts);
      Audit_Result
        (Locale, Unit_Gallon,
         Humanize.Units.Format (Context, 5, Humanize.Units.Gallon), Texts);
      Audit_Result
        (Locale, Unit_Pound,
         Humanize.Units.Format (Context, 5, Humanize.Units.Pound), Texts);
      Audit_Result
        (Locale, Unit_Ounce,
         Humanize.Units.Format (Context, 5, Humanize.Units.Ounce), Texts);
      Audit_Result
        (Locale, Unit_Stone,
         Humanize.Units.Format (Context, 5, Humanize.Units.Stone), Texts);
      Audit_Result
        (Locale, Unit_Tonne,
         Humanize.Units.Format (Context, 5, Humanize.Units.Tonne), Texts);
      Audit_Result
        (Locale, Unit_Ton,
         Humanize.Units.Format (Context, 5, Humanize.Units.Ton), Texts);
      Audit_Result
        (Locale, List,
         Humanize.Lists.Format
           (Context,
            [1 => To_Unbounded_String ("alpha"),
             2 => To_Unbounded_String ("beta"),
             3 => To_Unbounded_String ("gamma")]),
         Texts);
      Audit_Result
        (Locale, Relative_Past,
         Humanize.Datetimes.Relative
           (Context, Reference - Standard.Duration (2 * 3_600), Reference),
         Texts);
      Audit_Result
        (Locale, Relative_Past_Many,
         Humanize.Datetimes.Relative
           (Context, Reference - Standard.Duration (5 * 3_600), Reference),
         Texts);
      Audit_Result
        (Locale, Relative_Future_Many,
         Humanize.Datetimes.Relative
           (Context, Reference + Standard.Duration (5 * 3_600), Reference),
         Texts);
      Audit_Result
        (Locale, Natural_Today,
         Humanize.Datetimes.Natural_Day (Context, Today, Today), Texts);
      Audit_Result
        (Locale, Natural_Tomorrow,
         Humanize.Datetimes.Natural_Day (Context, Tomorrow, Today), Texts);
      Audit_Result
        (Locale, Schedule_Weekday,
         Humanize.Durations.Schedule
           (Context,
            (Kind        => Humanize.Durations.Schedule_Weekday_Set,
             Every       => 1,
             Unit        => Humanize.Durations.Every_Week,
             Weekday     => 0,
             Weekdays    => Humanize.Durations.Weekdays,
             Ordinal     => 0,
             Has_Time    => True,
             Hour        => 9,
             Minute      => 0,
             Use_12_Hour => False)),
         Texts);
      Audit_Result
        (Locale, Schedule_Monthly,
         Humanize.Durations.Cron_Schedule (Context, "30", "8", "15", "*", "*"),
         Texts);
      Audit_Result
        (Locale, Spellout_Ordinal,
         Humanize.Numbers.Ordinal_Words (Context, 30),
         Texts);
   end Audit_Locale;
