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
   is separate;

   procedure Audit_Deterministic_Schedule_Spellout
     (Locale : String;
      Texts  : Sample_Texts)
   is separate;

   procedure Run_Audit is separate;
begin
   Run_Audit;
exception
   when others =>
      Ada.Text_IO.Put_Line
        (Ada.Text_IO.Standard_Error,
         "error: locale audit failed unexpectedly");
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
end Locale_Audit;
