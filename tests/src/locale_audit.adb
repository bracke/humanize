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
with Humanize.Numbers;
with Humanize.Rates;
with Humanize.Status;
with Humanize.Units;

procedure Locale_Audit is

   use Ada.Strings.Unbounded;
   use type Ada.Calendar.Time;
   use type Humanize.Status.Status_Code;

   Runtime : aliased I18N.Runtime.Instance;
   Errors  : Natural := 0;

   type Locale_Code is
     (En, Da, De, Fr, Es, It, Pt, Nl, Sv, No, Nb, Fi, Pl, Cs, Tr, Ru, Uk,
      Ja, Ko, Zh, Ar, Hi);

   type Sample_Label is
     (Duration_Second, Duration_Minute, Duration_Hour, Duration_Day,
      Duration_Week, Duration_Month, Duration_Year, Byte_Size,
      Compact_Thousand, Compact_Million, Percent, Frequency_Count,
      Rate_Second, Rate_Minute, Rate_Hour, Rate_Day, Rate_Week,
      Rate_Hour_Less, Unit_Meter, Unit_Kilometer, Unit_Centimeter,
      Unit_Millimeter, Unit_Gram, Unit_Kilogram, Unit_Milligram, Unit_Liter,
      Unit_Milliliter, List, Relative_Past, Relative_Past_Many,
      Relative_Future_Many, Natural_Today, Natural_Tomorrow);

   type Sample_Texts is array (Sample_Label) of Unbounded_String;

   function Locale_Name (Code : Locale_Code) return String is
   begin
      case Code is
         when En => return "en";
         when Da => return "da";
         when De => return "de";
         when Fr => return "fr";
         when Es => return "es";
         when It => return "it";
         when Pt => return "pt";
         when Nl => return "nl";
         when Sv => return "sv";
         when No => return "no";
         when Nb => return "nb";
         when Fi => return "fi";
         when Pl => return "pl";
         when Cs => return "cs";
         when Tr => return "tr";
         when Ru => return "ru";
         when Uk => return "uk";
         when Ja => return "ja";
         when Ko => return "ko";
         when Zh => return "zh";
         when Ar => return "ar";
         when Hi => return "hi";
      end case;
   end Locale_Name;

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
         when List => return "list";
         when Relative_Past => return "relative-past";
         when Relative_Past_Many => return "relative-past-many";
         when Relative_Future_Many => return "relative-future-many";
         when Natural_Today => return "natural-today";
         when Natural_Tomorrow => return "natural-tomorrow";
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
      Text : constant String := To_String (Result.Text);
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
      Check (Relative_Past);
      Check (Natural_Today);
   end Audit_Non_ASCII_Core;

   Load_Result : I18N.Runtime.Load_Result;
begin
   Humanize.Catalogs.Load_Defaults (Runtime, Load_Result);
   Print_Header;

   for Code in Locale_Code loop
      declare
         Locale : constant String := Locale_Name (Code);
         Texts  : Sample_Texts := [others => Null_Unbounded_String];
      begin
         Audit_Locale (Locale, Texts);
         case Code is
            when Da =>
               Audit_Generated_Core
                 (Locale, Texts, "2 minutter", "2 dage", "2 uger",
                  B ("32206DC3A56E65646572"), B ("3220C3A572"),
                  "5 kilometer", "5 centimeter", "5 millimeter",
                  "5 gram", "5 milligram", "5 liter", "5 milliliter");
               Audit_Native_Added
                 (Locale, Texts, "4 gange", "cirka 4 gange per uge");
            when De =>
               Audit_Generated_Core
                 (Locale, Texts, "2 Minuten", "2 Tage", "2 Wochen",
                  "2 Monate", "2 Jahre", "5 Kilometer", "5 Zentimeter",
                  "5 Millimeter", "5 Gramm", "5 Milligramm", "5 Liter",
                  "5 Milliliter");
               Audit_Native_Added
                 (Locale, Texts, "4 Mal", "ungefaehr 4 Mal pro Woche");
            when Fr =>
               Audit_Generated_Core
                 (Locale, Texts, "2 minutes", "2 jours", "2 semaines",
                  "2 mois", "2 ans", B ("35206B696C6F6DC3A874726573"),
                  B ("352063656E74696DC3A874726573"),
                  B ("35206D696C6C696DC3A874726573"), "5 grammes",
                  "5 milligrammes", "5 litres", "5 millilitres");
               Audit_Native_Added
                 (Locale, Texts, "4 fois", "environ 4 fois par semaine");
            when Es =>
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
            when It =>
               Audit_Generated_Core
                 (Locale, Texts, "2 minuti", "2 giorni", "2 settimane",
                  "2 mesi", "2 anni", "5 chilometri", "5 centimetri",
                  "5 millimetri", "5 grammi", "5 milligrammi", "5 litri",
                  "5 millilitri");
               Audit_Native_Added
                 (Locale, Texts, "4 volte", "circa 4 volte alla settimana");
            when Pt =>
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
            when Nl =>
               Audit_Generated_Core
                 (Locale, Texts, "2 minuten", "2 dagen", "2 weken",
                  "2 maanden", "2 jaar", "5 kilometer", "5 centimeter",
                  "5 millimeter", "5 gram", "5 milligram", "5 liter",
                  "5 milliliter");
            when Sv =>
               Audit_Generated_Core
                 (Locale, Texts, "2 minuter", "2 dagar", "2 veckor",
                  B ("32206DC3A56E61646572"), B ("3220C3A572"),
                  "5 kilometer", "5 centimeter", "5 millimeter",
                  "5 gram", "5 milligram", "5 liter", "5 milliliter");
            when No | Nb =>
               Audit_Generated_Core
                 (Locale, Texts, "2 minutter", "2 dager", "2 uker",
                  B ("32206DC3A56E65646572"), B ("3220C3A572"),
                  "5 kilometer", "5 centimeter", "5 millimeter",
                  "5 gram", "5 milligram", "5 liter", "5 milliliter");
            when Fi =>
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
            when Pl =>
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
            when Cs =>
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
            when Ru =>
               Audit_Non_ASCII_Core (Locale, Texts);
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
            when Uk =>
               Audit_Non_ASCII_Core (Locale, Texts);
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
            when Tr =>
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
            when Ko =>
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
            when Ja =>
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
            when Zh =>
               Audit_Non_ASCII_Core (Locale, Texts);
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
            when Hi =>
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
            when others =>
               null;
         end case;
         if Code = Ar then
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
               Audit_Generated_Core
                 (Locale, Texts, Core_Minute, Core_Day, Core_Week,
                  Core_Month, Core_Year, Kilometer, Centimeter, Millimeter,
                  Core_Gram, Milligram, Core_Liter, Milliliter);
            end;
         end if;
         if Code = Nl then
            Audit_Dutch_Core (Texts);
         end if;
         Print_Row (Locale, Texts);
      end;
   end loop;

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
