separate (Humanize.Tests.Rendering)
   procedure Test_Generated_Locale_Coverage
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Dutch : constant Text_Result :=
        Humanize.Durations.Format (Support.Nl, 2);
      Russian : constant Text_Result :=
        Humanize.Numbers.Compact (Support.Locale ("ru"), 1_200);
      Arabic : constant Text_Result :=
        Humanize.Bytes.Format (Support.Locale ("ar"), 1_024);
      Engineering_Unit : constant Text_Result :=
        Humanize.Units.Format
          (Support.Locale ("tr"), 2, Humanize.Units.Square_Meter);
      Swedish_Frequency : constant Text_Result :=
        Humanize.Frequencies.Times (Support.Locale ("sv"), 2);
      Finnish_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("fi"), 4, Humanize.Rates.Per_Minute);
      Turkish_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("tr"), 4, Humanize.Rates.Per_Week);
      Turkish_Less_Than : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("tr"), 0, Humanize.Rates.Per_Hour);
      Japanese_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("ja"), 4, Humanize.Rates.Per_Week);
      Japanese_Regional_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("JA_jp"), 4, Humanize.Rates.Per_Week);
      Japanese_Less_Than : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("ja"), 0, Humanize.Rates.Per_Hour);
      Korean_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("ko"), 4, Humanize.Rates.Per_Week);
      Korean_Daily_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("ko"), 4, Humanize.Rates.Per_Day);
      Chinese_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("zh"), 4, Humanize.Rates.Per_Week);
      Hindi_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("hi"), 4, Humanize.Rates.Per_Week);
      Hindi_Less_Than : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("hi"), 0, Humanize.Rates.Per_Hour);
      Japanese_List : constant Text_Result :=
        Humanize.Lists.Format
          (Support.Locale ("ja"),
           [1 => To_Unbounded_String ("alpha"),
            2 => To_Unbounded_String ("beta")]);
      Chinese_Compact : constant Text_Result :=
        Humanize.Numbers.Compact (Support.Locale ("zh"), 1_200);
      Korean_Byte : constant Text_Result :=
        Humanize.Bytes.Format (Support.Locale ("ko"), 1);
      Generated_Reference : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 3, 21, 12.0 * 3_600.0);
      Turkish_Now : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("tr"),
           Generated_Reference - Duration (10),
           Generated_Reference);
      Polish_Yesterday : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("pl"),
           Generated_Reference - Duration (86_400),
           Generated_Reference);
      Finnish_Tomorrow : constant Text_Result :=
        Humanize.Datetimes.Natural_Day
          (Support.Locale ("fi"),
           (Year => 2026, Month => 3, Day => 22, others => 0),
           (Year => 2026, Month => 3, Day => 21, others => 0));
      Finnish_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("fi"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Czech_Today : constant Text_Result :=
        Humanize.Datetimes.Natural_Day
          (Support.Locale ("cs"),
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Year => 2026, Month => 3, Day => 21, others => 0));
      Turkish_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("tr"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Russian_Hours_Ago : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("ru"),
           Generated_Reference - Duration (2 * 3_600),
           Generated_Reference);
      Polish_Five_Hours_Ago : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("pl"),
           Generated_Reference - Duration (5 * 3_600),
           Generated_Reference);
      Polish_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("pl"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Czech_Five_Hours_Ago : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("cs"),
           Generated_Reference - Duration (5 * 3_600),
           Generated_Reference);
      Czech_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("cs"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Russian_Five_Hours_Ago : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("ru"),
           Generated_Reference - Duration (5 * 3_600),
           Generated_Reference);
      Russian_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("ru"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Ukrainian_Five_Hours_Ago : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("uk"),
           Generated_Reference - Duration (5 * 3_600),
           Generated_Reference);
      Ukrainian_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("uk"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Hindi_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("hi"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Korean_Minutes_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("ko"),
           Generated_Reference + Duration (2 * 60),
           Generated_Reference);

      procedure Check_Text
        (Result  : Text_Result;
         Expect  : String;
         Message : String)
      is
      begin
         AUnit.Assertions.Assert
           (Result.Status = Ok and then Support.Text (Result) = Expect,
            Message);
      end Check_Text;

      procedure Check_Duration
        (Locale : String;
         Expect : String)
      is
         Result : constant Text_Result :=
           Humanize.Durations.Format (Support.Locale (Locale), 2);
      begin
         AUnit.Assertions.Assert
           (Result.Status = Ok and then Support.Text (Result) = Expect,
            Locale & " generated catalog localizes core duration unit");
      end Check_Duration;

      procedure Check_Duration_5_Hours
        (Locale : String;
         Expect : String)
      is
         Result : constant Text_Result :=
           Humanize.Durations.Format (Support.Locale (Locale), 18_000);
      begin
         AUnit.Assertions.Assert
           (Result.Status = Ok and then Support.Text (Result) = Expect,
            Locale & " generated catalog selects Slavic duration many form");
      end Check_Duration_5_Hours;

      procedure Check_Unit_5
        (Locale : String;
         Unit   : Humanize.Units.Unit_Kind;
         Expect : String)
      is
         Result : constant Text_Result :=
           Humanize.Units.Format (Support.Locale (Locale), 5, Unit);
      begin
         AUnit.Assertions.Assert
           (Result.Status = Ok and then Support.Text (Result) = Expect,
            Locale & " generated catalog selects Slavic unit many form");
      end Check_Unit_5;

      procedure Check_Regional_Duration_Fallbacks is
      begin
         for Locale_Access of Humanize.Locales.Regional_Shipped_Locales loop
            declare
               Locale : constant String := Locale_Access.all;
               Base : constant String := Humanize.Locales.Base_Locale (Locale);
               Regional_Result : constant Text_Result :=
                 Humanize.Durations.Format (Support.Locale (Locale), 2);
               Base_Result : constant Text_Result :=
                 Humanize.Durations.Format (Support.Locale (Base), 2);
            begin
               AUnit.Assertions.Assert
                 (Regional_Result.Status = Ok
                  and then Base_Result.Status = Ok
                  and then Support.Text (Regional_Result) =
                    Support.Text (Base_Result),
                  "generated catalog resolves " & Locale
                  & " through " & Base & " region fallback");
            end;
         end loop;
      end Check_Regional_Duration_Fallbacks;
   begin
      Check_Text
        (Dutch, "2 seconden", "Dutch catalog localizes core duration unit");
      Check_Duration ("sv", "2 sekunder");
      Check_Duration ("no", "2 sekunder");
      Check_Duration ("nb", "2 sekunder");
      Check_Duration ("fi", "2 sekuntia");
      Check_Duration ("pl", "2 sekundy");
      Check_Duration ("cs", "2 sekundy");
      Check_Duration ("tr", "2 saniye");
      Check_Duration ("ru", B ("3220D181D0B5D0BAD183D0BDD0B4D18B"));
      Check_Duration ("uk", B ("3220D181D0B5D0BAD183D0BDD0B4D0B8"));
      Check_Duration ("ja", B ("3220E7A792"));
      Check_Duration ("ko", B ("3220ECB488"));
      Check_Duration ("zh", B ("3220E7A792"));
      Check_Duration ("ar", ARABIC_TWO & B ("20D8ABD988D8A7D986D98D"));
      Check_Duration ("hi", B ("3220E0A4B8E0A587E0A495E0A482E0A4A1"));
      Check_Duration_5_Hours ("pl", "5 godzin");
      Check_Duration_5_Hours ("cs", "5 hodin");
      Check_Duration_5_Hours ("ru", B ("3520D187D0B0D181D0BED0B2"));
      Check_Duration_5_Hours ("uk", B ("3520D0B3D0BED0B4D0B8D0BD"));
      Check_Unit_5
        ("pl", Humanize.Units.Meter, B ("35206D657472C3B377"));
      Check_Unit_5
        ("pl", Humanize.Units.Kilogram,
         B ("35206B696C6F6772616DC3B377"));
      Check_Unit_5
        ("cs", Humanize.Units.Meter, B ("35206D657472C5AF"));
      Check_Unit_5
        ("cs", Humanize.Units.Kilogram,
         B ("35206B696C6F6772616DC5AF"));
      Check_Unit_5
        ("ru", Humanize.Units.Meter,
         B ("3520D0BCD0B5D182D180D0BED0B2"));
      Check_Unit_5
        ("ru", Humanize.Units.Kilogram,
         B ("3520D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BCD0BED0B2"));
      Check_Unit_5
        ("uk", Humanize.Units.Meter,
         B ("3520D0BCD0B5D182D180D196D0B2"));
      Check_Unit_5
        ("uk", Humanize.Units.Kilogram,
         B ("3520D0BAD196D0BBD0BED0B3D180D0B0D0BCD196D0B2"));
      AUnit.Assertions.Assert
        (Russian.Status = Ok and then Support.Text (Russian)'Length > 0,
         "Russian generated catalog renders number");
      AUnit.Assertions.Assert
        (Arabic.Status = Ok and then Support.Text (Arabic)'Length > 0,
         "Arabic generated catalog renders bytes");
      Check_Text
        (Engineering_Unit, "2 metrekare",
         "generated catalog renders broad engineering unit words");
      Check_Text
        (Swedish_Frequency, B ("7476C3A52067C3A56E676572"),
         "Swedish generated catalog renders frequency words");
      Check_Text
        (Finnish_Rate, "noin 4 kertaa minuutissa",
         "Finnish generated catalog renders rate words");
      Check_Text
        (Turkish_Rate, B ("686166746164612079616B6C61C59FC4B16B2034206B657A"),
         "Turkish generated catalog renders natural rate word order");
      Check_Text
        (Turkish_Less_Than, "saatte bir kezden az",
         "Turkish generated catalog renders less-than rate words");
      Check_Text
        (Japanese_Rate, B ("E6AF8EE980B1E7B484203420E59B9E"),
         "Japanese generated catalog renders natural rate word order");
      AUnit.Assertions.Assert
        (Japanese_Regional_Rate.Status = Ok
         and then Support.Text (Japanese_Regional_Rate) =
           Support.Text (Japanese_Rate),
         "regional Japanese rate uses normalized CJK guard");
      Check_Text
        (Japanese_Less_Than, B ("E6AF8EE69982203120E59B9EE69CAAE6BA80"),
         "Japanese generated catalog renders less-than rate words");
      Check_Text
        (Korean_Rate, B ("ECA3BCEB8BB920EC95BD2034EBB288"),
         "Korean generated catalog renders natural rate word order");
      Check_Text
        (Korean_Daily_Rate, B ("EC9DBCEB8BB920EC95BD2034EBB288"),
         "Korean generated catalog renders daily rate period");
      Check_Text
        (Chinese_Rate, B ("E6AF8FE591A8E7BAA6203420E6ACA1"),
         "Chinese generated catalog renders natural rate word order");
      Check_Text
        (Hindi_Rate,
         B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
         & " " & B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9")
         & " " & B ("E0A4B2E0A497E0A4ADE0A497")
         & " 4 " & B ("E0A4ACE0A4BEE0A4B0"),
         "Hindi generated catalog renders natural rate word order");
      Check_Text
        (Hindi_Less_Than,
         B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
         & " " & B ("E0A498E0A482E0A49FE0A4BE")
         & " " & B ("E0A48FE0A49520E0A4ACE0A4BEE0A4B0")
         & " " & B ("E0A4B8E0A58720E0A495E0A4AE"),
         "Hindi generated catalog renders less-than rate words");
      Check_Text
        (Japanese_List, B ("616C70686120E381A82062657461"),
         "Japanese generated catalog renders list conjunction");
      Check_Text
        (Chinese_Compact, B ("312E3220E58D83"),
         "Chinese generated catalog renders compact-number suffix");
      Check_Text
        (Korean_Byte, B ("3120EBB094EC9DB4ED8AB8"),
         "Korean generated catalog renders byte word");
      Check_Regional_Duration_Fallbacks;
      Check_Text
        (Turkish_Now, B ("C59F696D6469"),
         "Turkish generated catalog renders now word");
      Check_Text
        (Polish_Yesterday, "wczoraj",
         "Polish generated catalog renders yesterday word");
      Check_Text
        (Finnish_Tomorrow, "huomenna",
         "Finnish generated catalog renders tomorrow word");
      Check_Text
        (Finnish_Five_Hours_Future, "5 tunnin kuluttua",
         "Finnish generated catalog renders explicit future relative words");
      Check_Text
        (Czech_Today, "dnes",
         "Czech generated catalog renders today word");
      Check_Text
        (Turkish_Five_Hours_Future, "5 saat sonra",
         "Turkish generated catalog renders explicit future relative words");
      Check_Text
        (Russian_Hours_Ago, B ("3220D187D0B0D181D0B020D0BDD0B0D0B7D0B0D0B4"),
         "Russian generated catalog renders relative time words");
      Check_Text
        (Polish_Five_Hours_Ago, "5 godzin temu",
         "Polish generated catalog selects Slavic relative past many form");
      Check_Text
        (Polish_Five_Hours_Future, "za 5 godzin",
         "Polish generated catalog selects Slavic relative future many form");
      Check_Text
        (Czech_Five_Hours_Ago, B ("3520686F64696E207A70C49B74"),
         "Czech generated catalog selects Slavic relative past many form");
      Check_Text
        (Czech_Five_Hours_Future, "za 5 hodin",
         "Czech generated catalog selects Slavic relative future many form");
      Check_Text
        (Russian_Five_Hours_Ago,
         B ("3520D187D0B0D181D0BED0B220D0BDD0B0D0B7D0B0D0B4"),
         "Russian generated catalog selects Slavic relative past many form");
      Check_Text
        (Russian_Five_Hours_Future,
         B ("D187D0B5D180D0B5D0B7203520D187D0B0D181D0BED0B2"),
         "Russian generated catalog selects Slavic relative future many form");
      Check_Text
        (Ukrainian_Five_Hours_Ago,
         B ("3520D0B3D0BED0B4D0B8D0BD20D182D0BED0BCD183"),
         "Ukrainian generated catalog selects Slavic relative past many form");
      Check_Text
        (Ukrainian_Five_Hours_Future,
         B ("D187D0B5D180D0B5D0B7203520D0B3D0BED0B4D0B8D0BD"),
         "Ukrainian generated catalog selects Slavic relative future many form");
      Check_Text
        (Hindi_Five_Hours_Future,
         B ("3520E0A498E0A482E0A49FE0A58720E0A4ACE0A4BEE0A4A6"),
         "Hindi generated catalog renders explicit future relative words");
      Check_Text
        (Korean_Minutes_Future, B ("3220EBB68420ED9B84"),
         "Korean generated catalog renders future relative time words");
      Check_Text
        (Humanize.Datetimes.Natural_Day
           (Support.Nl,
            (Year => 2026, Month => 3, Day => 21, others => 0),
            (Year => 2026, Month => 3, Day => 21, others => 0)),
         "vandaag",
         "Dutch native catalog renders today word");
      Check_Text
        (Humanize.Lists.Format
           (Support.Nl,
            [1 => To_Unbounded_String ("alpha"),
             2 => To_Unbounded_String ("beta")]),
         "alpha en beta",
         "Dutch native catalog renders list conjunction");
      Check_Text
        (Humanize.Frequencies.Times (Support.Da, 4),
         "4 gange",
         "Danish native catalog renders added frequency words");
      Check_Text
        (Humanize.Rates.Pace_Approximate
           (Support.Da, 4, Humanize.Rates.Per_Week),
         "cirka 4 gange per uge",
         "Danish native catalog renders added rate words");
      Check_Text
        (Humanize.Frequencies.Times (Support.De, 4),
         "4 Mal",
         "German native catalog renders added frequency words");
      Check_Text
        (Humanize.Rates.Pace_Approximate
           (Support.De, 4, Humanize.Rates.Per_Week),
         "ungefaehr 4 Mal pro Woche",
         "German native catalog renders added rate words");
      Check_Text
        (Humanize.Frequencies.Times (Support.Fr, 4),
         "4 fois",
         "French native catalog renders added frequency words");
      Check_Text
        (Humanize.Rates.Pace_Approximate
           (Support.Fr, 4, Humanize.Rates.Per_Week),
         "environ 4 fois par semaine",
         "French native catalog renders added rate words");
      Check_Text
        (Humanize.Frequencies.Times (Support.Es, 4),
         "4 veces",
         "Spanish native catalog renders added frequency words");
      Check_Text
        (Humanize.Rates.Pace_Approximate
           (Support.Es, 4, Humanize.Rates.Per_Week),
         "aproximadamente 4 veces por semana",
         "Spanish native catalog renders added rate words");
      Check_Text
        (Humanize.Frequencies.Times (Support.It, 4),
         "4 volte",
         "Italian native catalog renders added frequency words");
      Check_Text
        (Humanize.Rates.Pace_Approximate
           (Support.It, 4, Humanize.Rates.Per_Week),
         "circa 4 volte alla settimana",
         "Italian native catalog renders added rate words");
      Check_Text
        (Humanize.Frequencies.Times (Support.Pt, 4),
         "4 vezes",
         "Portuguese native catalog renders added frequency words");
      Check_Text
        (Humanize.Rates.Pace_Approximate
           (Support.Pt, 4, Humanize.Rates.Per_Week),
         "aproximadamente 4 vezes por semana",
         "Portuguese native catalog renders added rate words");
      declare
         Buffer  : String (1 .. 32);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Durations.Format_Into
           (Support.Locale ("sv"), 2, Buffer, Written, Code);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Buffer (1 .. Written) = "2 sekunder",
            "bounded generated duration");
      end;
      declare
         Buffer  : String (1 .. 32);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Datetimes.Relative_Into
           (Support.Locale ("ru"),
            Generated_Reference - Duration (2 * 3_600),
            Generated_Reference,
            Buffer,
            Written,
            Code);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Buffer (1 .. Written) = B ("3220D187D0B0D181D0B020D0BDD0B0D0B7D0B0D0B4"),
            "bounded generated relative datetime");
      end;
      declare
         Buffer  : String (1 .. 48);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Rates.Pace_Approximate_Into
           (Support.Locale ("fi"),
            4,
            Humanize.Rates.Per_Minute,
            Buffer,
            Written,
            Code);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Buffer (1 .. Written) = "noin 4 kertaa minuutissa",
            "bounded generated rate");
      end;
      declare
         Buffer  : String (1 .. 5);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Durations.Format_Into
           (Support.Locale ("sv"), 2, Buffer, Written, Code);
         AUnit.Assertions.Assert
           (Code = Buffer_Overflow
            and then Written = Buffer'Length
            and then Buffer = "2 sek",
            "bounded generated duration overflow prefix");
      end;
   end Test_Generated_Locale_Coverage;
