with Humanize.Bounded_Text;
with Humanize.Durations;
with Humanize.Parsing.Diagnostics;
with Humanize.Parsing.Duration_Aliases;
with Humanize.Parsing.Implementation.Numeric_Text_Helpers;
with Humanize.Parsing.Implementation.Text_Helpers;
with Humanize.Parsing.Support;
with Humanize.Status;

package body Humanize.Parsing.Implementation.Duration_Text_Helpers is
   use type Humanize.Status.Status_Code;
   use type Humanize.Durations.Duration_Seconds;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;
   function B (Hex : String) return String
      renames Humanize.Bounded_Text.Hex_Bytes;
   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;
   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;
   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;

   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;
   function Starts_At
     (Text    : String;
      Index   : Natural;
      Pattern : String)
      return Boolean
      renames Humanize.Parsing.Implementation.Text_Helpers.Starts_At;
   function Normalize_Native_Digits (Text : String) return String
      renames Humanize.Parsing.Support.Normalize_Native_Digits;
   function Numeric_Value
     (Text  : String;
      Value : out Long_Float)
      return Boolean
      renames Humanize.Parsing.Support.Numeric_Value;
   function Rounded_Nonnegative (Value : Long_Float) return Long_Long_Integer
      renames Humanize.Parsing.Support.Rounded_Nonnegative;
   function Scan_End (Text : String) return Natural
      renames Humanize.Parsing.Support.Scan_End;
   function Diagnostic
     (Status         : Humanize.Status.Status_Code;
      Error_Position : Natural;
      Error          : Parse_Error_Kind)
      return Parse_Error_Kind
      renames Humanize.Parsing.Diagnostics.Diagnostic;

   function Unit_Seconds (Unit : String) return Long_Long_Integer is
      U : constant String := Clean_Lower (Unit);
   begin
      if U = "second" or else U = "seconds" or else U = "sec" or else U = "s"
        or else U = "sekund" or else U = "sekunder"
        or else U = "seconde" or else U = "secondes"
        or else U = "sekunde" or else U = "sekunden"
        or else U = "segundo" or else U = "segundos"
        or else U = "secondo" or else U = "secondi"
        or else U = "seconde" or else U = "seconden"
        or else U = "sekunti" or else U = "sekuntia"
        or else U = "sekunda" or else U = "sekundy"
        or else U = "sekundas" or else U = "saniye"
        or else U = "secunde" or else U = "detik"
        or else U = "sekundo"
        or else U = "sekundoj" or else U = "giay"
        or else U = "sekunde" or else U = "sekonde"
        or else U = "sekondes" or else U = "masodperc"
        or else U = B ("736563756E64C483")
        or else U = B ("73656B756E64C497")
        or else U = B ("73656B756E64C49773")
        or else U = B ("D181D0B5D0BAD183D0BDD0B4D0B0")
        or else U = B ("D181D0B5D0BAD183D0BDD0B4D18B")
        or else U = B ("D181D0B5D0BAD183D0BDD0B4")
        or else U = B ("D181D0B5D0BAD183D0BDD0B4D0B8")
        or else U = B ("E7A792")
        or else U = B ("ECB488")
        or else U = B ("E7A792")
        or else U = B ("D8ABD8A7D986D98AD8A9")
        or else U = B ("D8ABD988D8A7D986")
        or else U = B ("D8ABD988D8A7D986D98D")
        or else U = B ("E0A4B8E0A587E0A495E0A482E0A4A1")
      then
         return 1;
      elsif U = "minute" or else U = "minutes" or else U = "min" or else U = "m"
        or else U = "minut" or else U = "minutt" or else U = "minutter"
        or else U = "minuten"
        or else U = "minuto" or else U = "minutos" or else U = "minuti"
        or else U = "minuut" or else U = "minuter"
        or else U = "minuutti" or else U = "minuuttia"
        or else U = "minuta" or else U = "minuty"
        or else U = "dakika"
        or else U = "minute" or else U = "menit"
        or else U = "minit" or else U = "minutoj"
        or else U = "phut" or else U = "perc"
        or else U = B ("6D696E7574C497")
        or else U = B ("6D696E7574C49773")
        or else U = B ("D0BCD0B8D0BDD183D182D0B0")
        or else U = B ("D0BCD0B8D0BDD183D182D18B")
        or else U = B ("D185D0B2D0B8D0BBD0B8D0BDD0B0")
        or else U = B ("D185D0B2D0B8D0BBD0B8D0BDD0B8")
        or else U = B ("E58886")
        or else U = B ("E58886E9929F")
        or else U = B ("EBB684")
        or else U = B ("D8AFD982D98AD982D8A9")
        or else U = B ("D8AFD982D8A7D8A6D982")
        or else U = B ("E0A4AEE0A4BFE0A4A8E0A49F")
      then
         return 60;
      elsif U = "hour" or else U = "hours" or else U = "h"
        or else U = "hr" or else U = "hrs"
        or else U = "time" or else U = "timer"
        or else U = "stunde" or else U = "stunden"
        or else U = "heure" or else U = "heures"
        or else U = "hora" or else U = "horas"
        or else U = "ora" or else U = "ore"
        or else U = "uur"
        or else U = "timme" or else U = "timmar"
        or else U = "tunti" or else U = "tuntia"
        or else U = "godzina" or else U = "godziny"
        or else U = "hodina" or else U = "hodiny"
        or else U = "saat"
        or else U = "ore" or else U = "valanda"
        or else U = "valandos" or else U = "ura"
        or else U = "ure" or else U = "jam"
        or else U = "horo" or else U = "horoj"
        or else U = "gio" or else U = "saa"
        or else U = "ora"
        or else U = B ("6F72C483")
        or else U = B ("D187D0B0D181")
        or else U = B ("D187D0B0D181D0B0")
        or else U = B ("D0B3D0BED0B4D0B8D0BDD0B0")
        or else U = B ("D0B3D0BED0B4D0B8D0BDD0B8")
        or else U = B ("E69982E99693")
        or else U = B ("E5B08FE697B6")
        or else U = B ("EC8B9CEAB084")
        or else U = B ("D8B3D8A7D8B9D8A9")
        or else U = B ("D8B3D8A7D8B9D8A7D8AA")
        or else U = B ("E0A498E0A482E0A49FE0A4BE")
        or else U = B ("E0A498E0A482E0A49FE0A587")
      then
         return 3_600;
      elsif U = "day" or else U = "days" or else U = "d"
        or else U = "dag" or else U = "dage" or else U = "dager"
        or else U = "dagen"
        or else U = "tag" or else U = "tage" or else U = "tagen"
        or else U = "jour" or else U = "jours"
        or else U = "dia" or else U = "dias"
        or else U = B ("64C3AD61") or else U = B ("64C3AD6173")
        or else U = "giorno" or else U = "giorni"
        or else U = "dagar" or else U = "paiva" or else U = "paivaa"
        or else U = B ("70C3A46976C3A4")
        or else U = B ("70C3A46976C3A4C3A4")
        or else U = B ("70C3A46976C3A46E")
        or else U = "dzien" or else U = "dni" or else U = "den" or else U = "dny"
        or else U = "gun" or else U = B ("67C3BC6E")
        or else U = "zi" or else U = "zile"
        or else U = "diena" or else U = "dienos"
        or else U = "dan" or else U = "hari"
        or else U = "tago" or else U = "tagoj"
        or else U = "ngay" or else U = "siku"
        or else U = "dae" or else U = "nap"
        or else U = B ("D0B4D0B5D0BDD18C")
        or else U = B ("D0B4D0BDD18F")
        or else U = B ("D0B4D0B5D0BDD18C")
        or else U = B ("D0B4D0BDD196")
        or else U = B ("E697A5")
        or else U = B ("E5A4A9")
        or else U = B ("EC9DBC")
        or else U = B ("D98AD988D985")
        or else U = B ("D8A3D98AD8A7D985")
        or else U = B ("E0A4A6E0A4BFE0A4A8")
      then
         return 86_400;
      elsif U = "fortnight" or else U = "fortnights" then
         return 14 * 86_400;
      elsif U = "week" or else U = "weeks" or else U = "w"
        or else U = "weken"
        or else U = "uge" or else U = "uger"
        or else U = "uke" or else U = "uker"
        or else U = "woche" or else U = "wochen"
        or else U = "semaine" or else U = "semaines"
        or else U = "semana" or else U = "semanas"
        or else U = "settimana" or else U = "settimane"
        or else U = "vecka" or else U = "veckor"
        or else U = "viikko" or else U = "viikkoa"
        or else U = "tydzien" or else U = B ("7479647A6965C584")
        or else U = "tygodnie"
        or else U = "tyden" or else U = B ("74C3BD64656E")
        or else U = "tydny"
        or else U = B ("74C3BD646E79")
        or else U = "hafta"
        or else U = B ("73C4837074C4836DC3A26EC483")
        or else U = B ("73C4837074C4836DC3A26E69")
        or else U = B ("736176616974C497")
        or else U = B ("736176616974C49773")
        or else U = "teden" or else U = "tedni"
        or else U = "minggu" or else U = "semajno"
        or else U = "semajnoj" or else U = "tuan"
        or else U = "wiki" or else U = "weke"
        or else U = "het" or else U = "tyzden"
        or else U = "tyzdne"
        or else U = B ("D0BDD0B5D0B4D0B5D0BBD18F")
        or else U = B ("D0BDD0B5D0B4D0B5D0BBD0B8")
        or else U = B ("D0BDD0B5D0B4D0B5D0BBD18E")
        or else U = B ("D182D0B8D0B6D0B4D0B5D0BDD18C")
        or else U = B ("D182D0B8D0B6D0BDD196")
        or else U = B ("E980B1")
        or else U = B ("E591A8")
        or else U = B ("ECA3BC")
        or else U = B ("D8A3D8B3D8A8D988D8B9")
        or else U = B ("D8A7D984D8A3D8B3D8A8D988D8B9")
        or else U = B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9")
      then
         return 7 * 86_400;
      elsif U = "month" or else U = "months" or else U = "mo"
        or else U = "mth" or else U = "mths"
        or else U = "maaned" or else U = "maaneder"
        or else U = B ("6DC3A56E6564") or else U = B ("6DC3A56E65646572")
        or else U = "monat" or else U = "monate"
        or else U = "mois"
        or else U = "mes" or else U = "meses"
        or else U = "mese" or else U = "mesi"
        or else U = "maand" or else U = "maanden"
        or else U = "manad" or else U = "manader"
        or else U = B ("6DC3A56E6164") or else U = B ("6DC3A56E61646572")
        or else U = "kuukausi" or else U = "kuukautta"
        or else U = "miesiac" or else U = "miesiace"
        or else U = B ("6D69657369C48563")
        or else U = B ("6D69657369C4856365")
        or else U = "mesic" or else U = "mesice"
        or else U = B ("6DC49B73C3AD63")
        or else U = B ("6DC49B73C3AD6365")
        or else U = "ay"
        or else U = B ("6C756EC483")
        or else U = "luni"
        or else U = B ("6DC4976E756F")
        or else U = B ("6DC4976E6573696169")
        or else U = "mesec" or else U = "meseci"
        or else U = "bulan" or else U = "monato"
        or else U = "monatoj" or else U = "thang"
        or else U = "mwezi" or else U = "miezi"
        or else U = "maande" or else U = "honap"
        or else U = "mesiac" or else U = "mesiace"
        or else U = B ("D0BCD0B5D181D18FD186")
        or else U = B ("D0BCD0B5D181D18FD186D18B")
        or else U = B ("D0BCD196D181D18FD186D18C")
        or else U = B ("D0BCD196D181D18FD186D196")
        or else U = B ("E69C88")
        or else U = B ("EB8BAC")
        or else U = B ("D8B4D987D8B1")
        or else U = B ("E0A4AEE0A4B9E0A580E0A4A8E0A4BE")
      then
         return 30 * 86_400;
      elsif U = "year" or else U = "years" or else U = "y"
        or else U = "yr" or else U = "yrs"
        or else U = "aar"
        or else U = B ("C3A572")
        or else U = "jahr" or else U = "jahre" or else U = "jahren"
        or else U = "an" or else U = "ans"
        or else U = "ano" or else U = "anos"
        or else U = B ("61C3B16F") or else U = B ("61C3B16F73")
        or else U = "anno" or else U = "anni"
        or else U = "jaar"
        or else U = "ar" or else U = B ("C3A572")
        or else U = "vuosi" or else U = "vuotta"
        or else U = "rok" or else U = "lata" or else U = "let"
        or else U = "roky"
        or else U = "yil" or else B ("79C4B16C") = U
        or else U = "ani" or else U = "metai"
        or else U = "leto" or else U = "leta"
        or else U = "tahun" or else U = "jaro"
        or else U = "jaroj" or else U = "nam"
        or else U = "mwaka" or else U = "miaka"
        or else U = "ev"
        or else U = B ("D0B3D0BED0B4")
        or else U = B ("D0B3D0BED0B4D0B0")
        or else U = B ("D180D196D0BA")
        or else U = B ("D180D0BED0BAD0B8")
        or else U = B ("E5B9B4")
        or else U = B ("EB8584")
        or else U = B ("D8B3D986D8A9")
        or else U = B ("E0A4B8E0A4BEE0A4B2")
      then
         return 365 * 86_400;
      else
         return Humanize.Parsing.Duration_Aliases.Generated_Duration_Seconds
           (U);
      end if;
   end Unit_Seconds;

   function Unit_Microseconds (Unit : String) return Long_Long_Integer is
      U : constant String := Clean_Lower (Unit);
   begin
      if U = "microsecond" or else U = "microseconds" or else U = "us"
        or else U = "microseconde" or else U = "microsecondes"
        or else U = "microseconden"
        or else U = "mikrosekunde" or else U = "mikrosekunden"
      then
         return 1;
      elsif U = "millisecond" or else U = "milliseconds" or else U = "ms"
        or else U = "milliseconde" or else U = "millisecondes"
        or else U = "milliseconden"
        or else U = "millisekunde" or else U = "millisekunden"
      then
         return 1_000;
      else
         declare
            Seconds : constant Long_Long_Integer := Unit_Seconds (Unit);
         begin
            if Seconds = 0 then
               return 0;
            end if;
            return Seconds * 1_000_000;
         end;
      end if;
   end Unit_Microseconds;

   function Duration_Conjunction_Length
     (Text  : String;
      Index : Natural)
      return Natural
      is separate;

   function Parse_ISO_Duration
     (Text  : String;
      Value : out Long_Long_Integer)
      return Boolean
      is separate;

   function Parse_ISO_Duration_Microseconds
     (Text  : String;
      Value : out Long_Long_Integer)
      return Boolean
      is separate;

   function Parse_Duration
     (Text : String)
      return Duration_Parse_Result
      is separate;

   function Scan_Duration
     (Text : String)
      return Duration_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Duration_Parse_Result :=
              Parse_Duration (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Duration;

   function Lenient_Duration_Text (Text : String) return String
      is separate;

   function Parse_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result
   is
      Normal : constant String := Lenient_Duration_Text (Text);
      Item   : constant String := Clean_Lower (Text);
   begin
      if Normal'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      elsif Item in "couple of seconds" | "a couple of seconds" then
         return Parse_Duration ("2 seconds");
      elsif Item in "few seconds" | "a few seconds" then
         return Parse_Duration ("3 seconds");
      elsif Item = "several seconds" then
         return Parse_Duration ("7 seconds");
      elsif Item in "couple of minutes" | "a couple of minutes" then
         return Parse_Duration ("2 minutes");
      elsif Item in "few minutes" | "a few minutes" then
         return Parse_Duration ("3 minutes");
      elsif Item = "several minutes" then
         return Parse_Duration ("7 minutes");
      elsif Item in "couple of hours" | "a couple of hours" then
         return Parse_Duration ("2 hours");
      elsif Item in "few hours" | "a few hours" then
         return Parse_Duration ("3 hours");
      elsif Item = "several hours" then
         return Parse_Duration ("7 hours");
      elsif Item in "couple of days" | "a couple of days" then
         return Parse_Duration ("2 days");
      elsif Item in "few days" | "a few days" then
         return Parse_Duration ("3 days");
      elsif Item = "several days" then
         return Parse_Duration ("7 days");
      elsif Item in "couple of weeks" | "a couple of weeks" then
         return Parse_Duration ("2 weeks");
      elsif Item in "few weeks" | "a few weeks" then
         return Parse_Duration ("3 weeks");
      elsif Item = "several weeks" then
         return Parse_Duration ("7 weeks");
      elsif Normal = "a fortnight" or else Normal = "an fortnight"
        or else Normal = "fortnight"
      then
         return Parse_Duration ("2 weeks");
      else
         return Parse_Duration (Normal);
      end if;
   end Parse_Lenient_Duration;

   function Scan_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Duration_Parse_Result;
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      Result := Parse_Lenient_Duration (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Lenient_Duration;

   function Parse_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result
      is separate;

   function Scan_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Duration_Range_Parse_Result :=
              Parse_Duration_Range (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Duration_Range;

   function Parse_Countdown
     (Text : String)
      return Duration_Parse_Result
   is
      Item   : constant String := Clean_Lower (Text);
      Suffix : constant String := " remaining";
   begin
      if Item'Length > Suffix'Length
        and then Item (Item'Last - Suffix'Length + 1 .. Item'Last) = Suffix
      then
         return Parse_Duration
           (Item (Item'First .. Item'Last - Suffix'Length));
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
   end Parse_Countdown;

   function Parse_SLA_Window
     (Text : String)
      return Duration_Parse_Result
   is
      Item   : constant String := Clean_Lower (Text);
      Prefix : constant String := "within ";
   begin
      if Item'Length > Prefix'Length
        and then Item (Item'First .. Item'First + Prefix'Length - 1) = Prefix
      then
         return Parse_Duration
           (Item (Item'First + Prefix'Length .. Item'Last));
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
   end Parse_SLA_Window;

   function Parse_Age
     (Text : String)
      return Duration_Parse_Result
   is
      Item   : constant String := Clean_Lower (Text);
      Suffix : constant String := " old";
   begin
      if Item'Length > Suffix'Length
        and then Item (Item'Last - Suffix'Length + 1 .. Item'Last) = Suffix
      then
         return Parse_Duration
           (Item (Item'First .. Item'Last - Suffix'Length));
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
   end Parse_Age;

   function Parse_Modified_Ago
     (Text : String)
      return Duration_Parse_Result
   is
      Item   : constant String := Clean_Lower (Text);
      Prefix : constant String := "modified ";
      Suffix : constant String := " ago";
   begin
      if Item = "modified just now" then
         return
           (Status => Humanize.Status.Ok,
            Value => 0,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      elsif Item'Length > Prefix'Length + Suffix'Length
        and then Item (Item'First .. Item'First + Prefix'Length - 1) = Prefix
        and then Item (Item'Last - Suffix'Length + 1 .. Item'Last) = Suffix
      then
         return Parse_Duration
           (Item (Item'First + Prefix'Length .. Item'Last - Suffix'Length));
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
   end Parse_Modified_Ago;

   function Parse_ETA
     (Text : String)
      return Duration_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Prefix : constant String := "eta ";
   begin
      if Starts_With (Item, Prefix) then
         return Parse_Duration (Item (Item'First + Prefix'Length .. Item'Last));
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
   end Parse_ETA;

   function Parse_Retry_In
     (Text : String)
      return Duration_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Prefix : constant String := "retrying in ";
   begin
      if Starts_With (Item, Prefix) then
         return Parse_Duration (Item (Item'First + Prefix'Length .. Item'Last));
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
   end Parse_Retry_In;

   function Scan_ETA
     (Text : String)
      return Duration_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Duration_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_ETA (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_ETA;

   function Scan_Retry_In
     (Text : String)
      return Duration_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Duration_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Retry_In (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Retry_In;

   function Parse_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result
      is separate;

   function Scan_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Precise_Duration_Parse_Result :=
              Parse_Precise_Duration (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Precise_Duration;
end Humanize.Parsing.Implementation.Duration_Text_Helpers;
