with Ada.Calendar;
with Ada.Command_Line;
with Ada.Strings.Unbounded;
with Ada.Text_IO;

with I18N.Runtime;

with Humanize.Bytes;
with Humanize.Catalogs;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Durations;
with Humanize.Frequencies;
with Humanize.Lists;
with Humanize.Locales;
with Humanize.Numbers;
with Humanize.Rates;
with Humanize.Bounded_Text;
with Humanize.Status;
with Humanize.Units;

procedure Locale_Audit is

   use Ada.Strings.Unbounded;
   use type Ada.Calendar.Time;
   use type Humanize.Status.Status_Code;

   Runtime : aliased I18N.Runtime.Instance;
   Errors  : Natural := 0;
   Audited_Locales : Natural := 0;

   type Sample_Label is
     (Duration_Second, Duration_Minute, Duration_Hour, Duration_Day,
      Duration_Week, Duration_Month, Duration_Year, Byte_Size,
      Compact_Thousand, Compact_Million, Percent, Frequency_Count,
      Rate_Second, Rate_Minute, Rate_Hour, Rate_Day, Rate_Week,
      Rate_Hour_Less, Unit_Meter, Unit_Kilometer, Unit_Centimeter,
      Unit_Millimeter, Unit_Gram, Unit_Kilogram, Unit_Milligram, Unit_Liter,
      Unit_Milliliter, Unit_Celsius, Unit_Square_Meter,
      Unit_Kilometer_Per_Hour, Unit_Teaspoon, Unit_Fahrenheit, Unit_Hectare,
      Unit_Meter_Per_Second, Unit_Pascal, Unit_Kilopascal, Unit_Joule,
      Unit_Kilojoule, Unit_Watt, Unit_Kilowatt, Unit_Hertz, Unit_Kilohertz,
      Unit_Degree, Unit_Mile, Unit_Yard, Unit_Foot, Unit_Inch,
      Unit_Nautical_Mile, Unit_Acre, Unit_Square_Kilometer, Unit_Cubic_Meter,
      Unit_Tablespoon, Unit_Cup, Unit_Gallon, Unit_Pound, Unit_Ounce,
      Unit_Stone, Unit_Tonne, Unit_Ton, List, Relative_Past,
      Relative_Past_Many, Relative_Future_Many, Natural_Today,
      Natural_Tomorrow, Schedule_Weekday, Schedule_Monthly,
      Spellout_Ordinal);

   type Sample_Texts is array (Sample_Label) of Unbounded_String;

   function Sample_Name (Label : Sample_Label) return String is
   begin
      case Label is
         when Duration_Second => return "duration-second";
         when Duration_Minute => return "duration-minute";
         when Duration_Hour => return "duration-hour";
         when Duration_Day => return "duration-day";
         when Duration_Week => return "duration-week";
         when Duration_Month => return "duration-month";
         when Duration_Year => return "duration-year";
         when Byte_Size => return "bytes";
         when Compact_Thousand => return "compact-thousand";
         when Compact_Million => return "compact-million";
         when Percent => return "percent";
         when Frequency_Count => return "frequency-count";
         when Rate_Second => return "rate-second";
         when Rate_Minute => return "rate-minute";
         when Rate_Hour => return "rate-hour";
         when Rate_Day => return "rate-day";
         when Rate_Week => return "rate-week";
         when Rate_Hour_Less => return "rate-hour-less";
         when Unit_Meter => return "unit-meter";
         when Unit_Kilometer => return "unit-kilometer";
         when Unit_Centimeter => return "unit-centimeter";
         when Unit_Millimeter => return "unit-millimeter";
         when Unit_Gram => return "unit-gram";
         when Unit_Kilogram => return "unit-kilogram";
         when Unit_Milligram => return "unit-milligram";
         when Unit_Liter => return "unit-liter";
         when Unit_Milliliter => return "unit-milliliter";
         when Unit_Celsius => return "unit-celsius";
         when Unit_Square_Meter => return "unit-square-meter";
         when Unit_Kilometer_Per_Hour => return "unit-kilometer-per-hour";
         when Unit_Teaspoon => return "unit-teaspoon";
         when Unit_Fahrenheit => return "unit-fahrenheit";
         when Unit_Hectare => return "unit-hectare";
         when Unit_Meter_Per_Second => return "unit-meter-per-second";
         when Unit_Pascal => return "unit-pascal";
         when Unit_Kilopascal => return "unit-kilopascal";
         when Unit_Joule => return "unit-joule";
         when Unit_Kilojoule => return "unit-kilojoule";
         when Unit_Watt => return "unit-watt";
         when Unit_Kilowatt => return "unit-kilowatt";
         when Unit_Hertz => return "unit-hertz";
         when Unit_Kilohertz => return "unit-kilohertz";
         when Unit_Degree => return "unit-degree";
         when Unit_Mile => return "unit-mile";
         when Unit_Yard => return "unit-yard";
         when Unit_Foot => return "unit-foot";
         when Unit_Inch => return "unit-inch";
         when Unit_Nautical_Mile => return "unit-nautical-mile";
         when Unit_Acre => return "unit-acre";
         when Unit_Square_Kilometer => return "unit-square-kilometer";
         when Unit_Cubic_Meter => return "unit-cubic-meter";
         when Unit_Tablespoon => return "unit-tablespoon";
         when Unit_Cup => return "unit-cup";
         when Unit_Gallon => return "unit-gallon";
         when Unit_Pound => return "unit-pound";
         when Unit_Ounce => return "unit-ounce";
         when Unit_Stone => return "unit-stone";
         when Unit_Tonne => return "unit-tonne";
         when Unit_Ton => return "unit-ton";
         when List => return "list";
         when Relative_Past => return "relative-past";
         when Relative_Past_Many => return "relative-past-many";
         when Relative_Future_Many => return "relative-future-many";
         when Natural_Today => return "natural-today";
         when Natural_Tomorrow => return "natural-tomorrow";
         when Schedule_Weekday => return "schedule-weekday";
         when Schedule_Monthly => return "schedule-monthly";
         when Spellout_Ordinal => return "spellout-ordinal";
      end case;
   end Sample_Name;

   function B (Hex : String) return String is
      Result : String (1 .. Hex'Length / 2);

      function Nibble (C : Character) return Natural is
      begin
         case C is
            when '0' .. '9' =>
               return Character'Pos (C) - Character'Pos ('0');
            when 'A' .. 'F' =>
               return 10 + Character'Pos (C) - Character'Pos ('A');
            when 'a' .. 'f' =>
               return 10 + Character'Pos (C) - Character'Pos ('a');
            when others =>
               return 0;
         end case;
      end Nibble;
   begin
      for I in Result'Range loop
         Result (I) :=
           Character'Val
             (Nibble (Hex (Hex'First + 2 * (I - Result'First))) * 16
              + Nibble (Hex (Hex'First + 2 * (I - Result'First) + 1)));
      end loop;

      return Result;
   end B;

   function Contains (Text, Pattern : String) return Boolean is
   begin
      if Pattern'Length = 0 or else Text'Length < Pattern'Length then
         return False;
      end if;

      for Index in Text'First .. Text'Last - Pattern'Length + 1 loop
         if Text (Index .. Index + Pattern'Length - 1) = Pattern then
            return True;
         end if;
      end loop;
      return False;
   end Contains;

   function Has_Non_ASCII (Text : String) return Boolean is
   begin
      for C of Text loop
         if Character'Pos (C) > 127 then
            return True;
         end if;
      end loop;

      return False;
   end Has_Non_ASCII;

   function Has_ASCII_Letter (Text : String) return Boolean is
   begin
      for C of Text loop
         if (C >= 'A' and then C <= 'Z')
           or else (C >= 'a' and then C <= 'z')
         then
            return True;
         end if;
      end loop;

      return False;
   end Has_ASCII_Letter;

   procedure Error
     (Locale : String;
      Label  : Sample_Label;
      Text   : String;
      Reason : String)
   is
   begin
      Errors := Errors + 1;
      Ada.Text_IO.Put_Line
        (Ada.Text_IO.Standard_Error,
         "error: locale audit " & Locale & " " & Sample_Name (Label)
         & ": " & Reason & " [" & Text & "]");
   end Error;

   procedure Audit_Result
     (Locale : String;
      Label  : Sample_Label;
      Result : Humanize.Status.Text_Result;
      Texts  : in out Sample_Texts)
   is
      Text : constant String := Humanize.Bounded_Text.Result_Text (Result);
   begin
      Texts (Label) := To_Unbounded_String (Text);

      if Result.Status /= Humanize.Status.Ok then
         Error (Locale, Label, Text, "render status was not Ok");
      elsif Text'Length = 0 then
         Error (Locale, Label, Text, "rendered empty text");
      elsif Contains (Text, "humanize.") then
         Error (Locale, Label, Text, "leaked catalog key");
      elsif Contains (Text, "{") or else Contains (Text, "}") then
         Error (Locale, Label, Text, "leaked placeholder");
      elsif Contains (Text, "  ") then
         Error (Locale, Label, Text, "contains doubled spaces");
      elsif Text (Text'First) = ' ' or else Text (Text'Last) = ' ' then
         Error (Locale, Label, Text, "has edge whitespace");
      end if;
   end Audit_Result;

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

   procedure Print_Header is
   begin
      Ada.Text_IO.Put ("locale");
      for Label in Sample_Label loop
         Ada.Text_IO.Put (ASCII.HT & Sample_Name (Label));
      end loop;
      Ada.Text_IO.New_Line;
   end Print_Header;

   procedure Print_Row
     (Locale : String;
      Texts  : Sample_Texts)
   is
   begin
      Ada.Text_IO.Put (Locale);
      for Label in Sample_Label loop
         Ada.Text_IO.Put (ASCII.HT & To_String (Texts (Label)));
      end loop;
      Ada.Text_IO.New_Line;
   end Print_Row;

   function Has_Argument (Name : String) return Boolean is
   begin
      for I in 1 .. Ada.Command_Line.Argument_Count loop
         if Ada.Command_Line.Argument (I) = Name then
            return True;
         end if;
      end loop;
      return False;
   end Has_Argument;

   function Option_Value (Name : String) return String is
   begin
      if Ada.Command_Line.Argument_Count < 2 then
         return "";
      end if;

      for I in 1 .. Ada.Command_Line.Argument_Count - 1 loop
         if Ada.Command_Line.Argument (I) = Name then
            return Ada.Command_Line.Argument (I + 1);
         end if;
      end loop;
      return "";
   end Option_Value;

   Summary_Only  : constant Boolean := Has_Argument ("--summary");
   Failures_Only : constant Boolean := Has_Argument ("--failures-only");
   Locale_Filter : constant String := Option_Value ("--locale");

   procedure Audit_Dutch_Core (Texts : Sample_Texts) is
   begin
      if To_String (Texts (Duration_Second)) /= "2 seconden" then
         Error
           ("nl", Duration_Second, To_String (Texts (Duration_Second)),
            "expected native Dutch duration wording");
      end if;

      if To_String (Texts (Duration_Hour)) /= "2 uur" then
         Error
           ("nl", Duration_Hour, To_String (Texts (Duration_Hour)),
            "expected native Dutch hour wording");
      end if;

      if To_String (Texts (List)) /= "alpha, beta en gamma" then
         Error
           ("nl", List, To_String (Texts (List)),
            "expected native Dutch list conjunction");
      end if;

      if To_String (Texts (Relative_Past)) /= "2 uur geleden" then
         Error
           ("nl", Relative_Past, To_String (Texts (Relative_Past)),
            "expected native Dutch relative-time wording");
      end if;

      if To_String (Texts (Natural_Today)) /= "vandaag" then
         Error
           ("nl", Natural_Today, To_String (Texts (Natural_Today)),
            "expected native Dutch today word");
      end if;
   end Audit_Dutch_Core;

   procedure Audit_Native_Added
     (Locale         : String;
      Texts          : Sample_Texts;
      Frequency_Text : String;
      Rate_Text      : String)
   is
   begin
      if To_String (Texts (Frequency_Count)) /= Frequency_Text then
         Error
           (Locale, Frequency_Count, To_String (Texts (Frequency_Count)),
            "expected native frequency wording");
      end if;

      if To_String (Texts (Rate_Week)) /= Rate_Text then
         Error
           (Locale, Rate_Week, To_String (Texts (Rate_Week)),
            "expected native rate wording");
      end if;
   end Audit_Native_Added;

   procedure Audit_Slavic_Relative_Many
     (Locale      : String;
      Texts       : Sample_Texts;
      Past_Text   : String;
      Future_Text : String)
   is
   begin
      if To_String (Texts (Relative_Past_Many)) /= Past_Text then
         Error
           (Locale, Relative_Past_Many,
            To_String (Texts (Relative_Past_Many)),
            "expected Slavic relative past many wording");
      end if;

      if To_String (Texts (Relative_Future_Many)) /= Future_Text then
         Error
           (Locale, Relative_Future_Many,
            To_String (Texts (Relative_Future_Many)),
            "expected Slavic relative future many wording");
      end if;
   end Audit_Slavic_Relative_Many;

   procedure Audit_Rate_Periods
     (Locale      : String;
      Texts       : Sample_Texts;
      Per_Second  : String;
      Per_Minute  : String;
      Per_Hour    : String;
      Per_Day     : String;
      Per_Week    : String;
      Hour_Less   : String)
   is
      procedure Check (Label : Sample_Label; Expected : String) is
      begin
         if To_String (Texts (Label)) /= Expected then
            Error
              (Locale, Label, To_String (Texts (Label)),
               "expected natural generated-locale rate wording");
         end if;
      end Check;
   begin
      Check (Rate_Second, Per_Second);
      Check (Rate_Minute, Per_Minute);
      Check (Rate_Hour, Per_Hour);
      Check (Rate_Day, Per_Day);
      Check (Rate_Week, Per_Week);
      Check (Rate_Hour_Less, Hour_Less);
   end Audit_Rate_Periods;

   procedure Audit_Slavic_Core
     (Locale      : String;
      Texts       : Sample_Texts;
      Minute      : String;
      Day         : String;
      Week        : String;
      Month       : String;
      Year        : String;
      Kilometer   : String;
      Centimeter  : String;
      Millimeter  : String;
      Gram        : String;
      Milligram   : String;
      Liter       : String;
      Milliliter  : String)
   is
      procedure Check (Label : Sample_Label; Expected : String) is
      begin
         if To_String (Texts (Label)) /= Expected then
            Error
              (Locale, Label, To_String (Texts (Label)),
               "expected Slavic generated-locale core wording");
         end if;
      end Check;
   begin
      Check (Duration_Minute, Minute);
      Check (Duration_Day, Day);
      Check (Duration_Week, Week);
      Check (Duration_Month, Month);
      Check (Duration_Year, Year);
      Check (Unit_Kilometer, Kilometer);
      Check (Unit_Centimeter, Centimeter);
      Check (Unit_Millimeter, Millimeter);
      Check (Unit_Gram, Gram);
      Check (Unit_Milligram, Milligram);
      Check (Unit_Liter, Liter);
      Check (Unit_Milliliter, Milliliter);
   end Audit_Slavic_Core;

   procedure Audit_Generated_Core
     (Locale      : String;
      Texts       : Sample_Texts;
      Minute      : String;
      Day         : String;
      Week        : String;
      Month       : String;
      Year        : String;
      Kilometer   : String;
      Centimeter  : String;
      Millimeter  : String;
      Gram        : String;
      Milligram   : String;
      Liter       : String;
      Milliliter  : String)
   is
      procedure Check (Label : Sample_Label; Expected : String) is
      begin
         if To_String (Texts (Label)) /= Expected then
            Error
              (Locale, Label, To_String (Texts (Label)),
               "expected generated-locale core wording");
         end if;
      end Check;
   begin
      Check (Duration_Minute, Minute);
      Check (Duration_Day, Day);
      Check (Duration_Week, Week);
      Check (Duration_Month, Month);
      Check (Duration_Year, Year);
      Check (Unit_Kilometer, Kilometer);
      Check (Unit_Centimeter, Centimeter);
      Check (Unit_Millimeter, Millimeter);
      Check (Unit_Gram, Gram);
      Check (Unit_Milligram, Milligram);
      Check (Unit_Liter, Liter);
      Check (Unit_Milliliter, Milliliter);
   end Audit_Generated_Core;

   type Generated_Core_Expectation is record
      Locale      : Unbounded_String;
      Minute      : Unbounded_String;
      Day         : Unbounded_String;
      Week        : Unbounded_String;
      Month       : Unbounded_String;
      Year        : Unbounded_String;
      Kilometer   : Unbounded_String;
      Centimeter  : Unbounded_String;
      Millimeter  : Unbounded_String;
      Gram        : Unbounded_String;
      Milligram   : Unbounded_String;
      Liter       : Unbounded_String;
      Milliliter  : Unbounded_String;
   end record;

   function U (Text : String) return Unbounded_String is
     (To_Unbounded_String (Text));

   Generated_Core_Expectations : constant array (Positive range <>) of
     Generated_Core_Expectation :=
       [(U ("da"), U ("2 minutter"), U ("2 dage"), U ("2 uger"),
         U (B ("32206DC3A56E65646572")), U (B ("3220C3A572")),
         U ("5 kilometer"), U ("5 centimeter"), U ("5 millimeter"),
         U ("5 gram"), U ("5 milligram"), U ("5 liter"),
         U ("5 milliliter")),
        (U ("de"), U ("2 Minuten"), U ("2 Tage"), U ("2 Wochen"),
         U ("2 Monate"), U ("2 Jahre"), U ("5 Kilometer"),
         U ("5 Zentimeter"), U ("5 Millimeter"), U ("5 Gramm"),
         U ("5 Milligramm"), U ("5 Liter"), U ("5 Milliliter")),
        (U ("fr"), U ("2 minutes"), U ("2 jours"), U ("2 semaines"),
         U ("2 mois"), U ("2 ans"), U (B ("35206B696C6F6DC3A874726573")),
         U ("5 centim" & B ("C3A874726573")), U ("5 millim" & B ("C3A874726573")),
         U ("5 grammes"), U ("5 milligrammes"), U ("5 litres"),
         U ("5 millilitres")),
        (U ("es"), U ("2 minutos"), U (B ("322064C3AD6173")),
         U ("2 semanas"), U ("2 meses"), U (B ("322061C3B16F73")),
         U (B ("35206B696CC3B36D6574726F73")),
         U (B ("352063656E74C3AD6D6574726F73")),
         U (B ("35206D696CC3AD6D6574726F73")),
         U ("5 gramos"), U ("5 miligramos"), U ("5 litros"),
         U ("5 mililitros")),
        (U ("it"), U ("2 minuti"), U ("2 giorni"), U ("2 settimane"),
         U ("2 mesi"), U ("2 anni"), U ("5 chilometri"),
         U ("5 centimetri"), U ("5 millimetri"), U ("5 grammi"),
         U ("5 milligrammi"), U ("5 litri"), U ("5 millilitri")),
        (U ("pt"), U ("2 minutos"), U ("2 dias"), U ("2 semanas"),
         U ("2 meses"), U ("2 anos"), U (B ("35207175696CC3B36D6574726F73")),
         U ("5 cent" & B ("C3AD6D6574726F73")),
         U ("5 mil" & B ("C3AD6D6574726F73")),
         U ("5 gramas"), U ("5 miligramas"), U ("5 litros"),
         U ("5 mililitros")),
        (U ("nl"), U ("2 minuten"), U ("2 dagen"), U ("2 weken"),
         U ("2 maanden"), U ("2 jaar"), U ("5 kilometer"),
         U ("5 centimeter"), U ("5 millimeter"), U ("5 gram"),
         U ("5 milligram"), U ("5 liter"), U ("5 milliliter")),
        (U ("sv"), U ("2 minuter"), U ("2 dagar"), U ("2 veckor"),
         U (B ("32206DC3A56E61646572")), U (B ("3220C3A572")),
         U ("5 kilometer"), U ("5 centimeter"), U ("5 millimeter"),
         U ("5 gram"), U ("5 milligram"), U ("5 liter"),
         U ("5 milliliter")),
        (U ("no"), U ("2 minutter"), U ("2 dager"), U ("2 uker"),
         U (B ("32206DC3A56E65646572")), U (B ("3220C3A572")),
         U ("5 kilometer"), U ("5 centimeter"), U ("5 millimeter"),
         U ("5 gram"), U ("5 milligram"), U ("5 liter"),
         U ("5 milliliter")),
        (U ("nb"), U ("2 minutter"), U ("2 dager"), U ("2 uker"),
         U (B ("32206DC3A56E65646572")), U (B ("3220C3A572")),
         U ("5 kilometer"), U ("5 centimeter"), U ("5 millimeter"),
         U ("5 gram"), U ("5 milligram"), U ("5 liter"),
         U ("5 milliliter")),
        (U ("fi"), U ("2 minuuttia"), U (B ("322070C3A46976C3A4C3A4")),
         U ("2 viikkoa"), U ("2 kuukautta"), U ("2 vuotta"),
         U (B ("35206B696C6F6D65747269C3A4")),
         U (B ("352073656E7474696D65747269C3A4")),
         U (B ("35206D696C6C696D65747269C3A4")),
         U ("5 grammaa"), U ("5 milligrammaa"), U ("5 litraa"),
         U ("5 millilitraa")),
        (U ("tr"), U ("2 dakika"), U (B ("322067C3BC6E")),
         U ("2 hafta"), U ("2 ay"), U (B ("322079C4B16C")),
         U ("5 kilometre"), U ("5 santimetre"), U ("5 milimetre"),
         U ("5 gram"), U ("5 miligram"), U ("5 litre"),
         U ("5 mililitre"))];

   procedure Audit_Configured_Generated_Core
     (Locale : String;
      Texts  : Sample_Texts)
   is
   begin
      for Item of Generated_Core_Expectations loop
         if To_String (Item.Locale) = Locale then
            Audit_Generated_Core
              (Locale, Texts, To_String (Item.Minute), To_String (Item.Day),
               To_String (Item.Week), To_String (Item.Month),
               To_String (Item.Year), To_String (Item.Kilometer),
               To_String (Item.Centimeter), To_String (Item.Millimeter),
               To_String (Item.Gram), To_String (Item.Milligram),
               To_String (Item.Liter), To_String (Item.Milliliter));
            return;
         end if;
      end loop;
   end Audit_Configured_Generated_Core;

   procedure Audit_Non_ASCII_Core
     (Locale : String;
      Texts  : Sample_Texts)
   is
      procedure Check (Label : Sample_Label) is
         Text : constant String := To_String (Texts (Label));
      begin
         if not Has_Non_ASCII (Text) then
            Error
              (Locale, Label, Text,
               "expected native-script generated-locale wording");
         end if;
      end Check;
   begin
      Check (Duration_Hour);
      Check (Duration_Day);
      Check (Duration_Week);
      Check (Duration_Month);
      Check (Duration_Year);
      Check (Frequency_Count);
      Check (Rate_Week);
      Check (Unit_Meter);
      Check (Unit_Kilometer);
      Check (Unit_Centimeter);
      Check (Unit_Millimeter);
      Check (Unit_Gram);
      Check (Unit_Celsius);
      Check (Unit_Square_Meter);
      Check (Unit_Kilometer_Per_Hour);
      Check (Unit_Teaspoon);
      Check (Unit_Fahrenheit);
      Check (Unit_Hectare);
      Check (Unit_Meter_Per_Second);
      Check (Unit_Pascal);
      Check (Unit_Kilopascal);
      Check (Unit_Joule);
      Check (Unit_Kilojoule);
      Check (Unit_Watt);
      Check (Unit_Kilowatt);
      Check (Unit_Hertz);
      Check (Unit_Kilohertz);
      Check (Unit_Degree);
      Check (Unit_Mile);
      Check (Unit_Yard);
      Check (Unit_Foot);
      Check (Unit_Inch);
      Check (Unit_Nautical_Mile);
      Check (Unit_Acre);
      Check (Unit_Square_Kilometer);
      Check (Unit_Cubic_Meter);
      Check (Unit_Tablespoon);
      Check (Unit_Cup);
      Check (Unit_Gallon);
      Check (Unit_Pound);
      Check (Unit_Ounce);
      Check (Unit_Stone);
      Check (Unit_Tonne);
      Check (Unit_Ton);
      Check (Relative_Past);
      Check (Natural_Today);
   end Audit_Non_ASCII_Core;

   procedure Audit_Native_Script_No_Latin
     (Locale : String;
      Texts  : Sample_Texts)
   is
      procedure Check (Label : Sample_Label) is
         Text : constant String := To_String (Texts (Label));
      begin
         if Has_ASCII_Letter (Text) then
            Error
              (Locale, Label, Text,
               "expected reviewed native-script wording without Latin fallback");
         end if;
      end Check;
   begin
      Check (Duration_Second);
      Check (Duration_Minute);
      Check (Duration_Hour);
      Check (Duration_Day);
      Check (Duration_Week);
      Check (Duration_Month);
      Check (Duration_Year);
      Check (Compact_Thousand);
      Check (Compact_Million);
      Check (Frequency_Count);
      Check (Rate_Second);
      Check (Rate_Minute);
      Check (Rate_Hour);
      Check (Rate_Day);
      Check (Rate_Week);
      Check (Rate_Hour_Less);
      Check (Unit_Meter);
      Check (Unit_Kilometer);
      Check (Unit_Centimeter);
      Check (Unit_Millimeter);
      Check (Unit_Gram);
      Check (Unit_Kilogram);
      Check (Unit_Milligram);
      Check (Unit_Liter);
      Check (Unit_Milliliter);
      Check (Unit_Celsius);
      Check (Unit_Square_Meter);
      Check (Unit_Kilometer_Per_Hour);
      Check (Unit_Teaspoon);
      Check (Unit_Fahrenheit);
      Check (Unit_Hectare);
      Check (Unit_Meter_Per_Second);
      Check (Unit_Pascal);
      Check (Unit_Kilopascal);
      Check (Unit_Joule);
      Check (Unit_Kilojoule);
      Check (Unit_Watt);
      Check (Unit_Kilowatt);
      Check (Unit_Hertz);
      Check (Unit_Kilohertz);
      Check (Unit_Degree);
      Check (Unit_Mile);
      Check (Unit_Yard);
      Check (Unit_Foot);
      Check (Unit_Inch);
      Check (Unit_Nautical_Mile);
      Check (Unit_Acre);
      Check (Unit_Square_Kilometer);
      Check (Unit_Cubic_Meter);
      Check (Unit_Tablespoon);
      Check (Unit_Cup);
      Check (Unit_Gallon);
      Check (Unit_Pound);
      Check (Unit_Ounce);
      Check (Unit_Stone);
      Check (Unit_Tonne);
      Check (Unit_Ton);
      Check (Relative_Past);
      Check (Relative_Past_Many);
      Check (Relative_Future_Many);
      Check (Natural_Today);
      Check (Natural_Tomorrow);
   end Audit_Native_Script_No_Latin;

   procedure Audit_Reviewed_Latin_Upgrades
     (Locale : String;
      Texts  : Sample_Texts)
   is
      procedure Check
        (Label    : Sample_Label;
         Expected : String)
      is
      begin
         if To_String (Texts (Label)) /= Expected then
            Error
              (Locale, Label, To_String (Texts (Label)),
               "expected reviewed native locale wording");
         end if;
      end Check;
   begin
      if Locale = "da" then
         Check (Unit_Nautical_Mile, B ("352073C3B86D696C"));
      elsif Locale = "de" then
         Check (Unit_Foot, B ("35204675C39F"));
         Check (Unit_Teaspoon, B ("35205465656CC3B66666656C"));
         Check (Unit_Tablespoon, B ("35204573736CC3B66666656C"));
      elsif Locale = "fr" then
         Check
           (Unit_Celsius,
            B ("352064656772C3A9732043656C73697573"));
         Check
           (Unit_Square_Meter,
            B ("35206DC3A8747265732063617272C3A973"));
         Check
           (Unit_Kilometer_Per_Hour,
            B ("35206B696C6F6DC3A87472657320706172206865757265"));
         Check
           (Unit_Teaspoon,
            B ("35206375696C6CC3A872657320C3A020636166C3A9"));
         Check
           (Unit_Fahrenheit,
            B ("352064656772C3A9732046616872656E68656974"));
         Check
           (Unit_Meter_Per_Second,
            B ("35206DC3A87472657320706172207365636F6E6465"));
         Check (Unit_Degree, B ("352064656772C3A973"));
         Check
           (Unit_Square_Kilometer,
            B ("35206B696C6F6DC3A8747265732063617272C3A973"));
         Check
           (Unit_Cubic_Meter,
            B ("35206DC3A874726573206375626573"));
         Check
           (Unit_Tablespoon,
            B ("35206375696C6CC3A872657320C3A020736F757065"));
      elsif Locale = "es" then
         Check
           (Unit_Kilometer_Per_Hour,
            B ("35206B696CC3B36D6574726F7320706F7220686F7261"));
         Check (Unit_Hectare, B ("352068656374C3A172656173"));
         Check
           (Unit_Nautical_Mile,
            B ("35206D696C6C6173206EC3A1757469636173"));
         Check
           (Unit_Square_Kilometer,
            B ("35206B696CC3B36D6574726F7320637561647261646F73"));
         Check
           (Unit_Cubic_Meter,
            B ("35206D6574726F732063C3BA6269636F73"));
      elsif Locale = "pt" then
         Check
           (Unit_Kilometer_Per_Hour,
            B ("35207175696CC3B46D6574726F7320706F7220686F7261"));
         Check
           (Unit_Teaspoon,
            B ("3520636F6C6865726573206465206368C3A1"));
         Check (Unit_Foot, B ("352070C3A973"));
         Check
           (Unit_Nautical_Mile,
            B ("35206D696C686173206EC3A1757469636173"));
         Check
           (Unit_Square_Kilometer,
            B ("35207175696CC3B46D6574726F7320717561647261646F73"));
         Check
           (Unit_Cubic_Meter,
            B ("35206D6574726F732063C3BA6269636F73"));
         Check (Unit_Cup, B ("352078C3AD6361726173"));
         Check (Unit_Gallon, B ("352067616CC3B56573"));
         Check (Unit_Ounce, B ("35206F6EC3A76173"));
      elsif Locale = "sv" then
         Check (Unit_Nautical_Mile, B ("3520736AC3B66D696C"));
      elsif Locale = "fi" then
         Check (Unit_Ton, B ("35206C7968797474C3A420746F6E6E6961"));
      elsif Locale = "pl" then
         Check
           (Unit_Kilometer_Per_Hour,
            B ("35206B696C6F6D65747279206E6120676F647A696EC499"));
         Check
           (Unit_Meter_Per_Second,
            B ("35206D65747279206E612073656B756E64C499"));
         Check
           (Unit_Cubic_Meter,
            B ("35206D6574727920737A65C59B6369656E6E65"));
         Check (Unit_Teaspoon, B ("3520C58279C5BC65637A6B69"));
         Check
           (Unit_Tablespoon,
            B ("3520C58279C5BC6B692073746FC5826F7765"));
         Check (Unit_Cup, B ("352066696C69C5BC616E6B69"));
         Check (Unit_Ton, B ("3520746F6E79206B72C3B3746B6965"));
      elsif Locale = "tr" then
         Check (Unit_Cubic_Meter, B ("35206D657472656BC3BC70"));
         Check (Unit_Ton, B ("35206BC4B1736120746F6E"));
      end if;
   end Audit_Reviewed_Latin_Upgrades;

   procedure Audit_Deterministic_Schedule_Spellout
     (Locale : String;
      Texts  : Sample_Texts)
   is
      Weekday : constant String := To_String (Texts (Schedule_Weekday));
      Monthly : constant String := To_String (Texts (Schedule_Monthly));
      Ordinal : constant String := To_String (Texts (Spellout_Ordinal));
   begin
      if Locale /= "en" then
         if Contains (Weekday, "every weekday") then
            Error
              (Locale, Schedule_Weekday, Weekday,
               "expected localized schedule weekday wording");
         end if;
         if Contains (Monthly, "day 15 of each month") then
            Error
              (Locale, Schedule_Monthly, Monthly,
               "expected localized cron monthly wording");
         end if;
         if Ordinal = "thirtieth" then
            Error
              (Locale, Spellout_Ordinal, Ordinal,
               "expected localized ordinal spellout wording");
         end if;
      end if;
   end Audit_Deterministic_Schedule_Spellout;

   Load_Result : I18N.Runtime.Load_Result;
begin
   Humanize.Catalogs.Load_Defaults (Runtime, Load_Result);
   if not Summary_Only and then not Failures_Only then
      Print_Header;
   end if;

   for Locale_Access of Humanize.Locales.Shipped_Locales loop
      declare
         Locale : constant String := Locale_Access.all;
         Texts  : Sample_Texts := [others => Null_Unbounded_String];
      begin
         if Locale_Filter'Length > 0 and then Locale /= Locale_Filter then
            goto Continue;
         end if;

         Audited_Locales := Audited_Locales + 1;
         Audit_Locale (Locale, Texts);
         Audit_Deterministic_Schedule_Spellout (Locale, Texts);
         Audit_Configured_Generated_Core (Locale, Texts);
         if Locale = "da" then
               Audit_Generated_Core
                 (Locale, Texts, "2 minutter", "2 dage", "2 uger",
                  B ("32206DC3A56E65646572"), B ("3220C3A572"),
                  "5 kilometer", "5 centimeter", "5 millimeter",
                  "5 gram", "5 milligram", "5 liter", "5 milliliter");
               Audit_Native_Added
                 (Locale, Texts, "4 gange", "cirka 4 gange per uge");
         elsif Locale = "de" then
               Audit_Generated_Core
                 (Locale, Texts, "2 Minuten", "2 Tage", "2 Wochen",
                  "2 Monate", "2 Jahre", "5 Kilometer", "5 Zentimeter",
                  "5 Millimeter", "5 Gramm", "5 Milligramm", "5 Liter",
                  "5 Milliliter");
               Audit_Native_Added
                 (Locale, Texts, "4 Mal", "ungefaehr 4 Mal pro Woche");
         elsif Locale = "fr" then
               Audit_Generated_Core
                 (Locale, Texts, "2 minutes", "2 jours", "2 semaines",
                  "2 mois", "2 ans", B ("35206B696C6F6DC3A874726573"),
                  B ("352063656E74696DC3A874726573"),
                  B ("35206D696C6C696DC3A874726573"), "5 grammes",
                  "5 milligrammes", "5 litres", "5 millilitres");
               Audit_Native_Added
                 (Locale, Texts, "4 fois", "environ 4 fois par semaine");
         elsif Locale = "es" then
               Audit_Generated_Core
                 (Locale, Texts, "2 minutos", B ("322064C3AD6173"),
                  "2 semanas", "2 meses", B ("322061C3B16F73"),
                  B ("35206B696CC3B36D6574726F73"),
                  B ("352063656E74C3AD6D6574726F73"),
                  B ("35206D696CC3AD6D6574726F73"), "5 gramos",
                  "5 miligramos", "5 litros", "5 mililitros");
               Audit_Native_Added
                 (Locale, Texts, "4 veces",
                  "aproximadamente 4 veces por semana");
         elsif Locale = "it" then
               Audit_Generated_Core
                 (Locale, Texts, "2 minuti", "2 giorni", "2 settimane",
                  "2 mesi", "2 anni", "5 chilometri", "5 centimetri",
                  "5 millimetri", "5 grammi", "5 milligrammi", "5 litri",
                  "5 millilitri");
               Audit_Native_Added
                 (Locale, Texts, "4 volte", "circa 4 volte alla settimana");
         elsif Locale = "pt" then
               Audit_Generated_Core
                 (Locale, Texts, "2 minutos", "2 dias", "2 semanas",
                  "2 meses", "2 anos",
                  B ("35207175696CC3B36D6574726F73"),
                  B ("352063656E74C3AD6D6574726F73"),
                  B ("35206D696CC3AD6D6574726F73"), "5 gramas",
                  "5 miligramas", "5 litros", "5 mililitros");
               Audit_Native_Added
                 (Locale, Texts, "4 vezes",
                  "aproximadamente 4 vezes por semana");
         elsif Locale = "nl" then
               Audit_Generated_Core
                 (Locale, Texts, "2 minuten", "2 dagen", "2 weken",
                  "2 maanden", "2 jaar", "5 kilometer", "5 centimeter",
                  "5 millimeter", "5 gram", "5 milligram", "5 liter",
                  "5 milliliter");
         elsif Locale = "sv" then
               Audit_Generated_Core
                 (Locale, Texts, "2 minuter", "2 dagar", "2 veckor",
                  B ("32206DC3A56E61646572"), B ("3220C3A572"),
                  "5 kilometer", "5 centimeter", "5 millimeter",
                  "5 gram", "5 milligram", "5 liter", "5 milliliter");
         elsif Humanize.Locales.Is_Norwegian (Locale) then
               Audit_Generated_Core
                 (Locale, Texts, "2 minutter", "2 dager", "2 uker",
                  B ("32206DC3A56E65646572"), B ("3220C3A572"),
                  "5 kilometer", "5 centimeter", "5 millimeter",
                  "5 gram", "5 milligram", "5 liter", "5 milliliter");
         elsif Locale = "fi" then
               Audit_Generated_Core
                 (Locale, Texts, "2 minuuttia",
                  B ("322070C3A46976C3A4C3A4"), "2 viikkoa",
                  "2 kuukautta", "2 vuotta",
                  B ("35206B696C6F6D65747269C3A4"),
                  B ("352073656E7474696D65747269C3A4"),
                  B ("35206D696C6C696D65747269C3A4"),
                  "5 grammaa", "5 milligrammaa", "5 litraa",
                  "5 millilitraa");
               if To_String (Texts (Relative_Future_Many))
                 /= "5 tunnin kuluttua"
               then
                  Error
                    (Locale, Relative_Future_Many,
                     To_String (Texts (Relative_Future_Many)),
                     "expected explicit Finnish future relative wording");
               end if;
         elsif Locale = "pl" then
               Audit_Slavic_Core
                 (Locale, Texts, "2 minuty", "2 dni", "2 tygodnie",
                  B ("32206D69657369C4856365"), "2 lata",
                  B ("35206B696C6F6D657472C3B377"),
                  B ("352063656E74796D657472C3B377"),
                  B ("35206D696C696D657472C3B377"),
                  B ("35206772616DC3B377"),
                  B ("35206D696C696772616DC3B377"),
                  B ("35206C697472C3B377"),
                  B ("35206D696C696C697472C3B377"));
               Audit_Slavic_Relative_Many
                 (Locale, Texts, "5 godzin temu", "za 5 godzin");
         elsif Locale = "cs" then
               Audit_Slavic_Core
                 (Locale, Texts, "2 minuty", "2 dny",
                  B ("322074C3BD646E79"),
                  B ("32206DC49B73C3AD6365"), "2 roky",
                  B ("35206B696C6F6D657472C5AF"),
                  B ("352063656E74696D657472C5AF"),
                  B ("35206D696C696D657472C5AF"),
                  B ("35206772616DC5AF"),
                  B ("35206D696C696772616DC5AF"),
                  B ("35206C697472C5AF"),
                  B ("35206D696C696C697472C5AF"));
               Audit_Slavic_Relative_Many
                 (Locale, Texts, B ("3520686F64696E207A70C49B74"),
                  "za 5 hodin");
         elsif Locale = "ru" then
               Audit_Non_ASCII_Core (Locale, Texts);
               Audit_Native_Script_No_Latin (Locale, Texts);
               Audit_Slavic_Core
                 (Locale, Texts,
                  B ("3220D0BCD0B8D0BDD183D182D18B"),
                  B ("3220D0B4D0BDD18F"),
                  B ("3220D0BDD0B5D0B4D0B5D0BBD0B8"),
                  B ("3220D0BCD0B5D181D18FD186D0B0"),
                  B ("3220D0B3D0BED0B4D0B0"),
                  B ("3520D0BAD0B8D0BBD0BED0BCD0B5D182D180D0BED0B2"),
                  B ("3520D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0BED0B2"),
                  B ("3520D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180D0BED0B2"),
                  B ("3520D0B3D180D0B0D0BCD0BCD0BED0B2"),
                  B ("3520D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BCD0BED0B2"),
                  B ("3520D0BBD0B8D182D180D0BED0B2"),
                  B ("3520D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180D0BED0B2"));
               Audit_Slavic_Relative_Many
                 (Locale, Texts,
                  B ("3520D187D0B0D181D0BED0B220D0BDD0B0D0B7D0B0D0B4"),
                  B ("D187D0B5D180D0B5D0B7203520D187D0B0D181D0BED0B2"));
         elsif Locale = "uk" then
               Audit_Non_ASCII_Core (Locale, Texts);
               Audit_Native_Script_No_Latin (Locale, Texts);
               Audit_Slavic_Core
                 (Locale, Texts,
                  B ("3220D185D0B2D0B8D0BBD0B8D0BDD0B8"),
                  B ("3220D0B4D0BDD196"),
                  B ("3220D182D0B8D0B6D0BDD196"),
                  B ("3220D0BCD196D181D18FD186D196"),
                  B ("3220D180D0BED0BAD0B8"),
                  B ("3520D0BAD196D0BBD0BED0BCD0B5D182D180D196D0B2"),
                  B ("3520D181D0B0D0BDD182D0B8D0BCD0B5D182D180D196D0B2"),
                  B ("3520D0BCD196D0BBD196D0BCD0B5D182D180D196D0B2"),
                  B ("3520D0B3D180D0B0D0BCD196D0B2"),
                  B ("3520D0BCD196D0BBD196D0B3D180D0B0D0BCD196D0B2"),
                  B ("3520D0BBD196D182D180D196D0B2"),
                  B ("3520D0BCD196D0BBD196D0BBD196D182D180D196D0B2"));
               Audit_Slavic_Relative_Many
                 (Locale, Texts,
                  B ("3520D0B3D0BED0B4D0B8D0BD20D182D0BED0BCD183"),
                  B ("D187D0B5D180D0B5D0B7203520D0B3D0BED0B4D0B8D0BD"));
         elsif Locale = "tr" then
               Audit_Generated_Core
                 (Locale, Texts, "2 dakika", B ("322067C3BC6E"),
                  "2 hafta", "2 ay", B ("322079C4B16C"),
                  "5 kilometre", "5 santimetre", "5 milimetre",
                  "5 gram", "5 miligram", "5 litre", "5 mililitre");
               Audit_Rate_Periods
                 (Locale, Texts,
                  B ("73616E69796564652079616B6C61C59FC4B16B2034206B657A"),
                  B ("64616B696B6164612079616B6C61C59FC4B16B2034206B657A"),
                  B ("7361617474652079616B6C61C59FC4B16B2034206B657A"),
                  B ("67C3BC6E64652079616B6C61C59FC4B16B2034206B657A"),
                  B ("686166746164612079616B6C61C59FC4B16B2034206B657A"),
                  B ("73616174746520626972206B657A64656E20617A"));
               if To_String (Texts (Relative_Future_Many))
                 /= "5 saat sonra"
               then
                  Error
                    (Locale, Relative_Future_Many,
                     To_String (Texts (Relative_Future_Many)),
                     "expected explicit Turkish future relative wording");
               end if;
         elsif Locale = "ko" then
               declare
                  Kilometer  : constant String :=
                    B ("3520ED82ACEBA19CEBAFB8ED84B0");
                  Centimeter : constant String :=
                    B ("3520EC84BCED8BB0EBAFB8ED84B0");
                  Millimeter : constant String :=
                    B ("3520EBB080EBA6ACEBAFB8ED84B0");
                  Milligram  : constant String :=
                    B ("3520EBB080EBA6ACEAB7B8EB9EA8");
                  Milliliter : constant String :=
                    B ("3520EBB080EBA6ACEBA6ACED84B0");
               begin
                  Audit_Non_ASCII_Core (Locale, Texts);
                  Audit_Native_Script_No_Latin (Locale, Texts);
                  Audit_Generated_Core
                    (Locale, Texts, B ("3220EBB684"), B ("3220EC9DBC"),
                     B ("3220ECA3BC"), B ("3220EAB09CEC9B94"),
                     B ("3220EB8584"), Kilometer, Centimeter, Millimeter,
                     B ("3520EAB7B8EB9EA8"), Milligram,
                     B ("3520EBA6ACED84B0"), Milliliter);
               end;
               Audit_Rate_Periods
                 (Locale, Texts,
                  B ("ECB488EB8BB920EC95BD2034EBB288"),
                  B ("EBB684EB8BB920EC95BD2034EBB288"),
                  B ("EC8B9CEAB084EB8BB920EC95BD2034EBB288"),
                  B ("EC9DBCEB8BB920EC95BD2034EBB288"),
                  B ("ECA3BCEB8BB920EC95BD2034EBB288"),
                  B ("EC8B9CEAB084EB8BB92031EBB28820EBAFB8EBA78C"));
               if To_String (Texts (Relative_Future_Many))
                 /= B ("3520EC8B9CEAB08420ED9B84")
               then
                  Error
                    (Locale, Relative_Future_Many,
                     To_String (Texts (Relative_Future_Many)),
                     "expected Korean future relative suffix wording");
               end if;
         elsif Locale = "ja" then
               declare
                  Kilometer  : constant String :=
                    B ("3520E382ADE383ADE383A1E383BCE38388E383AB");
                  Centimeter : constant String :=
                    B ("3520E382BBE383B3E38381E383A1E383BCE38388E383AB");
                  Millimeter : constant String :=
                    B ("3520E3839FE383AAE383A1E383BCE38388E383AB");
                  Milligram  : constant String :=
                    B ("3520E3839FE383AAE382B0E383A9E383A0");
                  Milliliter : constant String :=
                    B ("3520E3839FE383AAE383AAE38383E38388E383AB");
               begin
                  Audit_Non_ASCII_Core (Locale, Texts);
                  Audit_Native_Script_No_Latin (Locale, Texts);
                  Audit_Generated_Core
                    (Locale, Texts, B ("3220E58886"), B ("3220E697A5"),
                     B ("3220E980B1"), B ("3220E3818BE69C88"),
                     B ("3220E5B9B4"), Kilometer, Centimeter, Millimeter,
                     B ("3520E382B0E383A9E383A0"), Milligram,
                     B ("3520E383AAE38383E38388E383AB"), Milliliter);
               end;
               Audit_Rate_Periods
                 (Locale, Texts,
                  B ("E6AF8EE7A792E7B484203420E59B9E"),
                  B ("E6AF8EE58886E7B484203420E59B9E"),
                  B ("E6AF8EE69982E7B484203420E59B9E"),
                  B ("E6AF8EE697A5E7B484203420E59B9E"),
                  B ("E6AF8EE980B1E7B484203420E59B9E"),
                  B ("E6AF8EE69982203120E59B9EE69CAAE6BA80"));
         elsif Locale = "zh" then
               Audit_Non_ASCII_Core (Locale, Texts);
               Audit_Native_Script_No_Latin (Locale, Texts);
               Audit_Generated_Core
                 (Locale, Texts, B ("3220E58886E9929F"),
                  B ("3220E5A4A9"), B ("3220E591A8"),
                  B ("3220E4B8AAE69C88"), B ("3220E5B9B4"),
                  B ("3520E58D83E7B1B3"), B ("3520E58E98E7B1B3"),
                  B ("3520E6AFABE7B1B3"), B ("3520E5858B"),
                  B ("3520E6AFABE5858B"), B ("3520E58D87"),
                  B ("3520E6AFABE58D87"));
               Audit_Rate_Periods
                 (Locale, Texts,
                  B ("E6AF8FE7A792E7BAA6203420E6ACA1"),
                  B ("E6AF8FE58886E9929FE7BAA6203420E6ACA1"),
                  B ("E6AF8FE5B08FE697B6E7BAA6203420E6ACA1"),
                  B ("E6AF8FE5A4A9E7BAA6203420E6ACA1"),
                  B ("E6AF8FE591A8E7BAA6203420E6ACA1"),
                  B ("E6AF8FE5B08FE697B6E5B091E4BA8E203120E6ACA1"));
               if To_String (Texts (Duration_Month))
                 /= B ("3220E4B8AAE69C88")
               then
                  Error
                    (Locale, Duration_Month, To_String (Texts (Duration_Month)),
                     "expected Chinese duration month classifier");
               end if;
         elsif Locale = "hi" then
               declare
                  Core_Minute : constant String :=
                    B ("3220E0A4AEE0A4BFE0A4A8E0A49F");
                  Core_Day    : constant String :=
                    B ("3220E0A4A6E0A4BFE0A4A8");
                  Core_Week   : constant String :=
                    B ("3220E0A4B8E0A4AAE0A58DE0A4A4")
                    & B ("E0A4BEE0A4B9");
                  Core_Month  : constant String :=
                    B ("3220E0A4AEE0A4B9E0A580E0A4A8E0A587");
                  Core_Year   : constant String :=
                    B ("3220E0A4B8E0A4BEE0A4B2");
                  Kilometer   : constant String :=
                    B ("3520E0A495E0A4BFE0A4B2E0A58BE0A4AE")
                    & B ("E0A580E0A49FE0A4B0");
                  Centimeter  : constant String :=
                    B ("3520E0A4B8E0A587E0A482E0A49FE0A580")
                    & B ("E0A4AEE0A580E0A49FE0A4B0");
                  Millimeter  : constant String :=
                    B ("3520E0A4AEE0A4BFE0A4B2E0A580E0A4AE")
                    & B ("E0A580E0A49FE0A4B0");
                  Core_Gram   : constant String :=
                    B ("3520E0A497E0A58DE0A4B0E0A4BEE0A4AE");
                  Milligram   : constant String :=
                    B ("3520E0A4AEE0A4BFE0A4B2E0A580E0A497")
                    & B ("E0A58DE0A4B0E0A4BEE0A4AE");
                  Core_Liter  : constant String :=
                    B ("3520E0A4B2E0A580E0A49FE0A4B0");
                  Milliliter  : constant String :=
                    B ("3520E0A4AEE0A4BFE0A4B2E0A580E0A4B2")
                    & B ("E0A580E0A49FE0A4B0");
                  Approx : constant String := B ("E0A4B2E0A497E0A4ADE0A497");
                  Times  : constant String := B ("E0A4ACE0A4BEE0A4B0");
                  Less   : constant String :=
                    B ("E0A48FE0A49520E0A4ACE0A4BEE0A4B0")
                    & " " & B ("E0A4B8E0A58720E0A495E0A4AE");
                  Second : constant String :=
                    B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
                    & " " & B ("E0A4B8E0A587E0A495E0A482E0A4A1");
                  Minute : constant String :=
                    B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
                    & " " & B ("E0A4AEE0A4BFE0A4A8E0A49F");
                  Hour   : constant String :=
                    B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
                    & " " & B ("E0A498E0A482E0A49FE0A4BE");
                  Day    : constant String :=
                    B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
                    & " " & B ("E0A4A6E0A4BFE0A4A8");
                  Week   : constant String :=
                    B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
                    & " " & B ("E0A4B8E0A4AAE0A58DE0A4A4")
                    & B ("E0A4BEE0A4B9");
               begin
                  Audit_Non_ASCII_Core (Locale, Texts);
                  Audit_Native_Script_No_Latin (Locale, Texts);
                  Audit_Generated_Core
                    (Locale, Texts, Core_Minute, Core_Day, Core_Week,
                     Core_Month, Core_Year, Kilometer, Centimeter,
                     Millimeter, Core_Gram, Milligram, Core_Liter,
                     Milliliter);
                  Audit_Rate_Periods
                    (Locale, Texts,
                     Second & " " & Approx & " 4 " & Times,
                     Minute & " " & Approx & " 4 " & Times,
                     Hour & " " & Approx & " 4 " & Times,
                     Day & " " & Approx & " 4 " & Times,
                     Week & " " & Approx & " 4 " & Times,
                     Hour & " " & Less);
               end;
               if To_String (Texts (Relative_Future_Many))
                 /= B ("3520E0A498E0A482E0A49FE0A58720E0A4ACE0A4BEE0A4A6")
               then
                  Error
                    (Locale, Relative_Future_Many,
                     To_String (Texts (Relative_Future_Many)),
                     "expected explicit Hindi future relative wording");
               end if;
         end if;
         if Locale = "ar" then
            declare
               Core_Minute : constant String :=
                 B ("D9A220D8AFD982D8A7D8A6D982");
               Core_Day    : constant String :=
                 B ("D9A220D8A3D98AD8A7D985");
               Core_Week   : constant String :=
                 B ("D9A220D8A3D8B3D8A7D8A8D98AD8B9");
               Core_Month  : constant String :=
                 B ("D9A220D8A3D8B4D987D8B1");
               Core_Year   : constant String :=
                 B ("D9A220D8B3D986D988D8A7D8AA");
               Kilometer   : constant String :=
                 B ("D9A520D983D98AD984D988D985D8AAD8B1D8A7D8AA");
               Centimeter  : constant String :=
                 B ("D9A520D8B3D986D8AAD98AD985D8AAD8B1D8A7D8AA");
               Millimeter  : constant String :=
                 B ("D9A520D985D984D98AD985D8AAD8B1D8A7D8AA");
               Core_Gram   : constant String :=
                 B ("D9A520D8BAD8B1D8A7D985D8A7D8AA");
               Milligram   : constant String :=
                 B ("D9A520D985D984D98AD8BAD8B1D8A7D985D8A7D8AA");
               Core_Liter  : constant String :=
                 B ("D9A520D984D8AAD8B1D8A7D8AA");
               Milliliter  : constant String :=
                 B ("D9A520D985D984D98AD984D8AAD8B1D8A7D8AA");
            begin
               Audit_Non_ASCII_Core (Locale, Texts);
               Audit_Native_Script_No_Latin (Locale, Texts);
               Audit_Generated_Core
                 (Locale, Texts, Core_Minute, Core_Day, Core_Week,
                  Core_Month, Core_Year, Kilometer, Centimeter, Millimeter,
                  Core_Gram, Milligram, Core_Liter, Milliliter);
            end;
         end if;
         if Locale = "nl" then
            Audit_Dutch_Core (Texts);
         end if;
         Audit_Reviewed_Latin_Upgrades (Locale, Texts);
         if not Summary_Only and then not Failures_Only then
            Print_Row (Locale, Texts);
         end if;
      end;
      <<Continue>>
      null;
   end loop;

   if Locale_Filter'Length > 0 and then Audited_Locales = 0 then
      Ada.Text_IO.Put_Line
        (Ada.Text_IO.Standard_Error,
         "error: locale audit unknown shipped locale: " & Locale_Filter);
      Errors := Errors + 1;
   end if;

   if Summary_Only or else Failures_Only then
      Ada.Text_IO.Put_Line
        ("locale audit summary: "
         & Natural'Image (Audited_Locales) & " locale(s), "
         & Natural'Image (Errors) & " error(s)");
   end if;

   if Errors = 0 then
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
   else
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   end if;
exception
   when others =>
      Ada.Text_IO.Put_Line
        (Ada.Text_IO.Standard_Error,
         "error: locale audit failed unexpectedly");
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
end Locale_Audit;
