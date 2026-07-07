with Ada.Calendar.Formatting;
with Ada.Characters.Handling;
with Ada.Strings.Unbounded;

with Humanize.Duration_Classification;
with Humanize.Decimal_Images;
with Humanize.I18N_Rendering;
with Humanize.Lists;
with Humanize.Messages;
with Humanize.Selections;

package body Humanize.Durations is

   use Ada.Strings.Unbounded;
   use type Ada.Calendar.Time;
   use type Humanize.Status.Status_Code;

   type Precise_Component is record
      Unit  : Precise_Duration_Unit := Millisecond;
      Count : Long_Long_Integer := 0;
   end record;

   type Precise_Component_List is array (Positive range <>) of Precise_Component;

   function No_Space (Image : String) return String is
     (if Image'Length > 0 and then Image (Image'First) = ' '
      then Image (Image'First + 1 .. Image'Last)
      else Image);

   function Lower (Text : String) return String is
      Result : String (Text'Range);
   begin
      for Index in Text'Range loop
         Result (Index) := Ada.Characters.Handling.To_Lower (Text (Index));
      end loop;
      return Result;
   end Lower;

   function Two_Digits (Value : Natural) return String is
      Tens : constant Natural := (Value / 10) mod 10;
      Ones : constant Natural := Value mod 10;
   begin
      return
        String'
          (1 => Character'Val (Character'Pos ('0') + Tens),
           2 => Character'Val (Character'Pos ('0') + Ones));
   end Two_Digits;

   function U (Code : Natural) return String is
   begin
      if Code <= 16#7F# then
         return String'(1 => Character'Val (Code));
      elsif Code <= 16#7FF# then
         return Character'Val (16#C0# + Code / 64)
           & Character'Val (16#80# + Code mod 64);
      elsif Code <= 16#FFFF# then
         return Character'Val (16#E0# + Code / 4_096)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      else
         return Character'Val (16#F0# + Code / 262_144)
           & Character'Val (16#80# + (Code / 4_096) mod 64)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      end if;
   end U;

   function Locale_Prefix (Context : Humanize.Contexts.Context) return String is
      Locale : constant String := Humanize.Contexts.Locale (Context);
   begin
      if Locale'Length >= 2 then
         return Locale (Locale'First .. Locale'First + 1);
      else
         return Locale;
      end if;
   end Locale_Prefix;

   function Unit_Name
     (Unit_Count : Duration_Seconds;
      Singular   : String;
      Plural     : String)
      return String
   is
   begin
      if Unit_Count = 1 then
         return Singular;
      else
         return Plural;
      end if;
   end Unit_Name;

   function Natural_Unit_Name
     (Unit_Seconds : Duration_Seconds;
      Count        : Duration_Seconds)
      return String
   is
   begin
      case Unit_Seconds is
         when 60 =>
            return Unit_Name (Count, "minute", "minutes");
         when 3_600 =>
            return Unit_Name (Count, "hour", "hours");
         when 86_400 =>
            return Unit_Name (Count, "day", "days");
         when 604_800 =>
            return Unit_Name (Count, "week", "weeks");
         when 2_592_000 =>
            return Unit_Name (Count, "month", "months");
         when 31_536_000 =>
            return Unit_Name (Count, "year", "years");
         when others =>
            return Unit_Name (Count, "second", "seconds");
      end case;
   end Natural_Unit_Name;

   function Natural_Unit_Seconds
     (Seconds                  : Duration_Seconds;
      Prefer_Larger            : Boolean;
      Larger_Threshold_Percent : Natural)
      return Duration_Seconds
   is
      function Reaches_Percent
        (Value   : Duration_Seconds;
         Unit    : Duration_Seconds;
         Percent : Natural)
         return Boolean
      is
      begin
         return Value * 100 >= Unit * Duration_Seconds (Percent);
      end Reaches_Percent;
   begin
      if Seconds < 60 then
         return 1;
      elsif Seconds < 3_600 then
         if Prefer_Larger
           and then Reaches_Percent (Seconds, 3_600, Larger_Threshold_Percent)
         then
            return 3_600;
         else
            return 60;
         end if;
      elsif Seconds < 86_400 then
         if Prefer_Larger
           and then Reaches_Percent (Seconds, 86_400, Larger_Threshold_Percent)
         then
            return 86_400;
         else
            return 3_600;
         end if;
      elsif Seconds < 604_800 then
         if Prefer_Larger
           and then Reaches_Percent (Seconds, 604_800, Larger_Threshold_Percent)
         then
            return 604_800;
         else
            return 86_400;
         end if;
      elsif Seconds < 2_592_000 then
         if Prefer_Larger
           and then Reaches_Percent
             (Seconds, 2_592_000, Larger_Threshold_Percent)
         then
            return 2_592_000;
         else
            return 604_800;
         end if;
      elsif Seconds < 31_536_000 then
         if Prefer_Larger
           and then Reaches_Percent
             (Seconds, 31_536_000, Larger_Threshold_Percent)
         then
            return 31_536_000;
         else
            return 2_592_000;
         end if;
      else
         return 31_536_000;
      end if;
   end Natural_Unit_Seconds;

   function Natural_Approximation_Text
     (Prefix                    : String;
      Seconds                   : Duration_Seconds;
      Round_Up                  : Boolean;
      Options                   : Natural_Duration_Approximation_Options;
      Prefer_Larger             : Boolean := False)
      return String
   is
      Unit_Seconds : constant Duration_Seconds :=
        Natural_Unit_Seconds
          (Seconds, Prefer_Larger, Options.Larger_Unit_Threshold_Percent);
      Raw_Count : constant Duration_Seconds := Seconds / Unit_Seconds;
      Base_Count : constant Duration_Seconds :=
        Duration_Seconds'Max (1, Raw_Count);
      Remainder : constant Duration_Seconds := Seconds mod Unit_Seconds;
      Should_Round_Up : constant Boolean :=
        Round_Up
        and then Remainder > 0
        and then Remainder * 100
          >= Unit_Seconds
             * Duration_Seconds (Options.Round_Up_Threshold_Percent);
      Count : constant Duration_Seconds :=
        (if Should_Round_Up and then Raw_Count > 0
         then Base_Count + 1
         else Base_Count);
   begin
      return Prefix & " " & No_Space (Duration_Seconds'Image (Count))
        & " " & Natural_Unit_Name (Unit_Seconds, Count);
   end Natural_Approximation_Text;

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

   function Language (Context : Humanize.Contexts.Context) return String is
      Locale : constant String := Humanize.Contexts.Locale (Context);
      Last   : Natural := Locale'Last;
   begin
      for Index in Locale'Range loop
         if Locale (Index) = '-' or else Locale (Index) = '_' then
            Last := Index - 1;
            exit;
         end if;
      end loop;

      return Ada.Characters.Handling.To_Lower (Locale (Locale'First .. Last));
   end Language;

   type Slavic_Form is (One_Form, Few_Form, Many_Form);

   function Slavic_Form_For
     (Lang  : String;
      Count : Long_Long_Integer)
      return Slavic_Form
   is
      Mod_10  : constant Long_Long_Integer := Count mod 10;
      Mod_100 : constant Long_Long_Integer := Count mod 100;
   begin
      if Lang = "pl" then
         if Count = 1 then
            return One_Form;
         elsif Mod_10 in 2 .. 4 and then not (Mod_100 in 12 .. 14) then
            return Few_Form;
         else
            return Many_Form;
         end if;
      elsif Lang = "cs" then
         if Count = 1 then
            return One_Form;
         elsif Count in 2 .. 4 then
            return Few_Form;
         else
            return Many_Form;
         end if;
      else
         if Mod_10 = 1 and then Mod_100 /= 11 then
            return One_Form;
         elsif Mod_10 in 2 .. 4 and then not (Mod_100 in 12 .. 14) then
            return Few_Form;
         else
            return Many_Form;
         end if;
      end if;
   end Slavic_Form_For;

   function Slavic_Duration_Name
     (Lang : String;
      Unit : Duration_Unit;
      Form : Slavic_Form)
      return String
   is
   begin
      if Lang = "pl" then
         case Unit is
            when Second =>
               return (case Form is
                         when One_Form => "sekunda",
                         when Few_Form => "sekundy",
                         when Many_Form => "sekund");
            when Minute =>
               return (case Form is
                         when One_Form => "minuta",
                         when Few_Form => "minuty",
                         when Many_Form => "minut");
            when Hour =>
               return (case Form is
                         when One_Form => "godzina",
                         when Few_Form => "godziny",
                         when Many_Form => "godzin");
            when Day =>
               return (case Form is
                         when One_Form => B ("647A6965C584"),
                         when Few_Form => "dni",
                         when Many_Form => "dni");
            when Week =>
               return (case Form is
                         when One_Form => B ("7479647A6965C584"),
                         when Few_Form => "tygodnie",
                         when Many_Form => "tygodni");
            when Month =>
               return (case Form is
                         when One_Form => B ("6D69657369C48563"),
                         when Few_Form => B ("6D69657369C4856365"),
                         when Many_Form => B ("6D69657369C4996379"));
            when Year =>
               return (case Form is
                         when One_Form => "rok",
                         when Few_Form => "lata",
                         when Many_Form => "lat");
         end case;
      elsif Lang = "cs" then
         case Unit is
            when Second =>
               return (case Form is
                         when One_Form => "sekunda",
                         when Few_Form => "sekundy",
                         when Many_Form => "sekund");
            when Minute =>
               return (case Form is
                         when One_Form => "minuta",
                         when Few_Form => "minuty",
                         when Many_Form => "minut");
            when Hour =>
               return (case Form is
                         when One_Form => "hodina",
                         when Few_Form => "hodiny",
                         when Many_Form => "hodin");
            when Day =>
               return (case Form is
                         when One_Form => "den",
                         when Few_Form => "dny",
                         when Many_Form => B ("646EC5AF"));
            when Week =>
               return (case Form is
                         when One_Form => B ("74C3BD64656E"),
                         when Few_Form => B ("74C3BD646E79"),
                         when Many_Form => B ("74C3BD646EC5AF"));
            when Month =>
               return (case Form is
                         when One_Form => B ("6DC49B73C3AD63"),
                         when Few_Form => B ("6DC49B73C3AD6365"),
                         when Many_Form => B ("6DC49B73C3AD63C5AF"));
            when Year =>
               return (case Form is
                         when One_Form => "rok",
                         when Few_Form => "roky",
                         when Many_Form => "let");
         end case;
      elsif Lang = "ru" then
         case Unit is
            when Second =>
               return (case Form is
                         when One_Form => B ("D181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D181D0B5D0BAD183D0BDD0B4D18B"),
                         when Many_Form => B ("D181D0B5D0BAD183D0BDD0B4"));
            when Minute =>
               return (case Form is
                         when One_Form => B ("D0BCD0B8D0BDD183D182D0B0"),
                         when Few_Form => B ("D0BCD0B8D0BDD183D182D18B"),
                         when Many_Form => B ("D0BCD0B8D0BDD183D182"));
            when Hour =>
               return (case Form is
                         when One_Form => B ("D187D0B0D181"),
                         when Few_Form => B ("D187D0B0D181D0B0"),
                         when Many_Form => B ("D187D0B0D181D0BED0B2"));
            when Day =>
               return (case Form is
                         when One_Form => B ("D0B4D0B5D0BDD18C"),
                         when Few_Form => B ("D0B4D0BDD18F"),
                         when Many_Form => B ("D0B4D0BDD0B5D0B9"));
            when Week =>
               return (case Form is
                         when One_Form => B ("D0BDD0B5D0B4D0B5D0BBD18F"),
                         when Few_Form => B ("D0BDD0B5D0B4D0B5D0BBD0B8"),
                         when Many_Form => B ("D0BDD0B5D0B4D0B5D0BBD18C"));
            when Month =>
               return (case Form is
                         when One_Form => B ("D0BCD0B5D181D18FD186"),
                         when Few_Form => B ("D0BCD0B5D181D18FD186D0B0"),
                         when Many_Form => B ("D0BCD0B5D181D18FD186D0B5D0B2"));
            when Year =>
               return (case Form is
                         when One_Form => B ("D0B3D0BED0B4"),
                         when Few_Form => B ("D0B3D0BED0B4D0B0"),
                         when Many_Form => B ("D0BBD0B5D182"));
         end case;
      elsif Lang = "uk" then
         case Unit is
            when Second =>
               return (case Form is
                         when One_Form => B ("D181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D181D0B5D0BAD183D0BDD0B4D0B8"),
                         when Many_Form => B ("D181D0B5D0BAD183D0BDD0B4"));
            when Minute =>
               return (case Form is
                         when One_Form => B ("D185D0B2D0B8D0BBD0B8D0BDD0B0"),
                         when Few_Form => B ("D185D0B2D0B8D0BBD0B8D0BDD0B8"),
                         when Many_Form => B ("D185D0B2D0B8D0BBD0B8D0BD"));
            when Hour =>
               return (case Form is
                         when One_Form => B ("D0B3D0BED0B4D0B8D0BDD0B0"),
                         when Few_Form => B ("D0B3D0BED0B4D0B8D0BDD0B8"),
                         when Many_Form => B ("D0B3D0BED0B4D0B8D0BD"));
            when Day =>
               return (case Form is
                         when One_Form => B ("D0B4D0B5D0BDD18C"),
                         when Few_Form => B ("D0B4D0BDD196"),
                         when Many_Form => B ("D0B4D0BDD196D0B2"));
            when Week =>
               return (case Form is
                         when One_Form => B ("D182D0B8D0B6D0B4D0B5D0BDD18C"),
                         when Few_Form => B ("D182D0B8D0B6D0BDD196"),
                         when Many_Form => B ("D182D0B8D0B6D0BDD196D0B2"));
            when Month =>
               return (case Form is
                         when One_Form => B ("D0BCD196D181D18FD186D18C"),
                         when Few_Form => B ("D0BCD196D181D18FD186D196"),
                         when Many_Form => B ("D0BCD196D181D18FD186D196D0B2"));
            when Year =>
               return (case Form is
                         when One_Form => B ("D180D196D0BA"),
                         when Few_Form => B ("D180D0BED0BAD0B8"),
                         when Many_Form => B ("D180D0BED0BAD196D0B2"));
         end case;
      else
         return "";
      end if;
   end Slavic_Duration_Name;

   function Slavic_Duration_Result
     (Context : Humanize.Contexts.Context;
      Count   : Long_Long_Integer;
      Unit    : Duration_Unit)
      return Humanize.Status.Text_Result
   is
      Lang : constant String := Language (Context);
   begin
      if Lang = "pl" or else Lang = "cs" or else Lang = "ru" or else Lang = "uk" then
         declare
            Name : constant String :=
              Slavic_Duration_Name (Lang, Unit, Slavic_Form_For (Lang, Count));
         begin
            if Name'Length > 0 then
               return
                 (Status => Humanize.Status.Ok,
                  Text   =>
                    To_Unbounded_String
                      (No_Space (Long_Long_Integer'Image (Count)) & " " & Name),
                  Key    => Humanize.Messages.No_Message);
            end if;
         end;
      end if;

      return (Status => Humanize.Status.Runtime_Error, others => <>);
   end Slavic_Duration_Result;

   function Duration_Size (Unit : Duration_Unit) return Duration_Seconds is
     (case Unit is
         when Second => 1,
         when Minute => 60,
         when Hour   => 3_600,
         when Day    => 86_400,
         when Week   => 7 * 86_400,
         when Month  => 30 * 86_400,
         when Year   => 365 * 86_400);

   function Slavic_Format_Selection
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options)
      return Humanize.Status.Text_Result
   is
      Lang : constant String := Language (Context);
   begin
      if not (Lang = "pl" or else Lang = "cs" or else Lang = "ru" or else Lang = "uk") then
         return (Status => Humanize.Status.Runtime_Error, others => <>);
      end if;

      if Seconds = 0 then
         return Slavic_Duration_Result
           (Context, 0, Options.Smallest_Unit);
      end if;

      for Unit in reverse Options.Smallest_Unit .. Options.Largest_Unit loop
         if Seconds / Duration_Size (Unit) >= 1 then
            return Slavic_Duration_Result
              (Context, Long_Long_Integer (Seconds / Duration_Size (Unit)), Unit);
         end if;
      end loop;

      return Slavic_Duration_Result
        (Context, 0, Options.Smallest_Unit);
   end Slavic_Format_Selection;

   function Slavic_Precise_Name
     (Lang : String;
      Unit : Precise_Duration_Unit;
      Form : Slavic_Form)
      return String
   is
   begin
      if Unit = Precise_Second then
         return Slavic_Duration_Name (Lang, Second, Form);
      elsif Unit = Precise_Minute then
         return Slavic_Duration_Name (Lang, Minute, Form);
      elsif Unit = Precise_Hour then
         return Slavic_Duration_Name (Lang, Hour, Form);
      elsif Unit = Precise_Day then
         return Slavic_Duration_Name (Lang, Day, Form);
      elsif Lang = "pl" then
         case Unit is
            when Microsecond =>
               return (case Form is
                         when One_Form => "mikrosekunda",
                         when Few_Form => "mikrosekundy",
                         when Many_Form => "mikrosekund");
            when Millisecond =>
               return (case Form is
                         when One_Form => "milisekunda",
                         when Few_Form => "milisekundy",
                         when Many_Form => "milisekund");
            when others =>
               return "";
         end case;
      elsif Lang = "cs" then
         case Unit is
            when Microsecond =>
               return (case Form is
                         when One_Form => "mikrosekunda",
                         when Few_Form => "mikrosekundy",
                         when Many_Form => "mikrosekund");
            when Millisecond =>
               return (case Form is
                         when One_Form => "milisekunda",
                         when Few_Form => "milisekundy",
                         when Many_Form => "milisekund");
            when others =>
               return "";
         end case;
      elsif Lang = "ru" then
         case Unit is
            when Microsecond =>
               return (case Form is
                         when One_Form => B ("D0BCD0B8D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D0BCD0B8D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D18B"),
                         when Many_Form => B ("D0BCD0B8D0BAD180D0BED181D0B5D0BAD183D0BDD0B4"));
            when Millisecond =>
               return (case Form is
                         when One_Form => B ("D0BCD0B8D0BBD0BBD0B8D181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D0BCD0B8D0BBD0BBD0B8D181D0B5D0BAD183D0BDD0B4D18B"),
                         when Many_Form => B ("D0BCD0B8D0BBD0BBD0B8D181D0B5D0BAD183D0BDD0B4"));
            when others =>
               return "";
         end case;
      elsif Lang = "uk" then
         case Unit is
            when Microsecond =>
               return (case Form is
                         when One_Form => B ("D0BCD196D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D0BCD196D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D0B8"),
                         when Many_Form => B ("D0BCD196D0BAD180D0BED181D0B5D0BAD183D0BDD0B4"));
            when Millisecond =>
               return (case Form is
                         when One_Form => B ("D0BCD196D0BBD196D181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D0BCD196D0BBD196D181D0B5D0BAD183D0BDD0B4D0B8"),
                         when Many_Form => B ("D0BCD196D0BBD196D181D0B5D0BAD183D0BDD0B4"));
            when others =>
               return "";
         end case;
      else
         return "";
      end if;
   end Slavic_Precise_Name;

   function Slavic_Precise_Result
     (Context   : Humanize.Contexts.Context;
      Component : Precise_Component)
      return Humanize.Status.Text_Result
   is
      Lang : constant String := Language (Context);
   begin
      if Lang = "pl" or else Lang = "cs" or else Lang = "ru" or else Lang = "uk" then
         declare
            Name : constant String :=
              Slavic_Precise_Name
                (Lang, Component.Unit,
                 Slavic_Form_For (Lang, Component.Count));
         begin
            if Name'Length > 0 then
               return
                 (Status => Humanize.Status.Ok,
                  Text   =>
                    To_Unbounded_String
                      (No_Space (Long_Long_Integer'Image (Component.Count))
                       & " " & Name),
                  Key    => Humanize.Messages.No_Message);
            end if;
         end;
      end if;

      return (Status => Humanize.Status.Runtime_Error, others => <>);
   end Slavic_Precise_Result;

   function Pad2 (Value : Natural) return String is
      Raw : constant String := No_Space (Natural'Image (Value));
   begin
      if Raw'Length = 1 then
         return "0" & Raw;
      else
         return Raw;
      end if;
   end Pad2;

   function Valid_Month_Day
     (Month : Ada.Calendar.Month_Number;
      Day   : Ada.Calendar.Day_Number)
      return Boolean
   is
      Leap_Year_Days : constant array (Ada.Calendar.Month_Number) of Natural :=
        [1 => 31, 2 => 29, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
         7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31];
   begin
      return Natural (Day) <= Leap_Year_Days (Month);
   end Valid_Month_Day;

   procedure Apply_Hours
     (Hours      : in out Weekday_Business_Hours;
      Weekday    : Natural;
      Start_Hour : Natural;
      End_Hour   : Natural)
   is
   begin
      case Weekday is
         when 1 =>
            Hours.Monday_Start := Start_Hour;
            Hours.Monday_End := End_Hour;
         when 2 =>
            Hours.Tuesday_Start := Start_Hour;
            Hours.Tuesday_End := End_Hour;
         when 3 =>
            Hours.Wednesday_Start := Start_Hour;
            Hours.Wednesday_End := End_Hour;
         when 4 =>
            Hours.Thursday_Start := Start_Hour;
            Hours.Thursday_End := End_Hour;
         when 5 =>
            Hours.Friday_Start := Start_Hour;
            Hours.Friday_End := End_Hour;
         when 6 =>
            Hours.Saturday_Start := Start_Hour;
            Hours.Saturday_End := End_Hour;
         when 7 =>
            Hours.Sunday_Start := Start_Hour;
            Hours.Sunday_End := End_Hour;
         when others =>
            null;
      end case;
   end Apply_Hours;

   procedure Clear_Business_Calendar_Rules
     (Rules : in out Business_Calendar_Rules)
   is
   begin
      Rules.Options := Default_Advanced_Business_Calendar_Options;
      Rules.Holiday_Count := 0;
      Rules.Recurring_Holiday_Count := 0;
      Rules.Half_Day_Count := 0;
      Rules.Shutdown_Count := 0;
   end Clear_Business_Calendar_Rules;

   function Add_One_Off_Holiday
     (Rules : in out Business_Calendar_Rules;
      Date  : Ada.Calendar.Time)
      return Humanize.Status.Status_Code
   is
   begin
      if Rules.Holiday_Count = Rules.Max_Holidays then
         return Humanize.Status.Buffer_Overflow;
      end if;
      Rules.Holiday_Count := Rules.Holiday_Count + 1;
      Rules.Holidays (Rules.Holiday_Count) := Date;
      return Humanize.Status.Ok;
   end Add_One_Off_Holiday;

   function Add_Recurring_Holiday
     (Rules : in out Business_Calendar_Rules;
      Month : Ada.Calendar.Month_Number;
      Day   : Ada.Calendar.Day_Number)
      return Humanize.Status.Status_Code
   is
   begin
      if not Valid_Month_Day (Month, Day) then
         return Humanize.Status.Invalid_Value;
      elsif Rules.Recurring_Holiday_Count = Rules.Max_Recurring_Holidays then
         return Humanize.Status.Buffer_Overflow;
      end if;
      Rules.Recurring_Holiday_Count := Rules.Recurring_Holiday_Count + 1;
      Rules.Recurring_Holidays (Rules.Recurring_Holiday_Count) :=
        (Month => Month, Day => Day);
      return Humanize.Status.Ok;
   end Add_Recurring_Holiday;

   function ISO_Weekday (Value : Ada.Calendar.Time) return Natural is
   begin
      case Ada.Calendar.Formatting.Day_Of_Week (Value) is
         when Ada.Calendar.Formatting.Monday =>
            return 1;
         when Ada.Calendar.Formatting.Tuesday =>
            return 2;
         when Ada.Calendar.Formatting.Wednesday =>
            return 3;
         when Ada.Calendar.Formatting.Thursday =>
            return 4;
         when Ada.Calendar.Formatting.Friday =>
            return 5;
         when Ada.Calendar.Formatting.Saturday =>
            return 6;
         when Ada.Calendar.Formatting.Sunday =>
            return 7;
      end case;
   end ISO_Weekday;

   function Last_Day_Of_Month
     (Year  : Ada.Calendar.Year_Number;
      Month : Ada.Calendar.Month_Number)
      return Ada.Calendar.Day_Number
   is
      Next_Month : Ada.Calendar.Month_Number;
      Next_Year  : Ada.Calendar.Year_Number := Year;
      Last_Time  : Ada.Calendar.Time;
      Last_Year  : Ada.Calendar.Year_Number;
      Last_Month : Ada.Calendar.Month_Number;
      Last_Day   : Ada.Calendar.Day_Number;
      Seconds    : Ada.Calendar.Day_Duration;
   begin
      if Month = 12 then
         Next_Month := 1;
         Next_Year := Year + 1;
      else
         Next_Month := Month + 1;
      end if;

      Last_Time := Ada.Calendar.Time_Of (Next_Year, Next_Month, 1, 0.0)
        - 86_400.0;
      Ada.Calendar.Split (Last_Time, Last_Year, Last_Month, Last_Day, Seconds);
      return Last_Day;
   end Last_Day_Of_Month;

   function Add_Observed_Holiday
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number;
      Month : Ada.Calendar.Month_Number;
      Day   : Ada.Calendar.Day_Number)
      return Humanize.Status.Status_Code
   is
      Actual : Ada.Calendar.Time;
      Observed : Ada.Calendar.Time;
   begin
      if not Valid_Month_Day (Month, Day) then
         return Humanize.Status.Invalid_Value;
      end if;

      Actual := Ada.Calendar.Time_Of (Year, Month, Day, 0.0);
      case ISO_Weekday (Actual) is
         when 6 =>
            Observed := Actual - 86_400.0;
         when 7 =>
            Observed := Actual + 86_400.0;
         when others =>
            Observed := Actual;
      end case;
      return Add_One_Off_Holiday (Rules, Observed);
   end Add_Observed_Holiday;

   function Add_Nth_Weekday_Holiday
     (Rules   : in out Business_Calendar_Rules;
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Weekday : Natural;
      Ordinal : Integer)
      return Humanize.Status.Status_Code
   is
      First : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Year, Month, 1, 0.0);
      Last_Day : constant Ada.Calendar.Day_Number :=
        Last_Day_Of_Month (Year, Month);
      Last : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Year, Month, Last_Day, 0.0);
      First_Weekday : constant Natural := ISO_Weekday (First);
      Last_Weekday  : constant Natural := ISO_Weekday (Last);
      Offset : Natural;
      Day    : Natural;
   begin
      if Weekday not in 1 .. 7
        or else (Ordinal /= -1 and then Ordinal not in 1 .. 5)
      then
         return Humanize.Status.Invalid_Value;
      end if;

      if Ordinal = -1 then
         Offset :=
           (if Weekday <= Last_Weekday
            then Last_Weekday - Weekday
            else Last_Weekday + 7 - Weekday);
         Day := Natural (Last_Day) - Offset;
      else
         Offset :=
           (if Weekday >= First_Weekday
            then Weekday - First_Weekday
            else Weekday + 7 - First_Weekday);
         Day := 1 + Offset + Natural (Ordinal - 1) * 7;
      end if;

      if Day < 1 or else Day > Natural (Last_Day) then
         return Humanize.Status.Invalid_Value;
      end if;

      return Add_One_Off_Holiday
        (Rules, Ada.Calendar.Time_Of
          (Year, Month, Ada.Calendar.Day_Number (Day), 0.0));
   end Add_Nth_Weekday_Holiday;

   function Add_US_Federal_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;

      procedure Add (Next_Code : Humanize.Status.Status_Code) is
      begin
         if Code = Humanize.Status.Ok
           and then Next_Code /= Humanize.Status.Ok
         then
            Code := Next_Code;
         end if;
      end Add;
   begin
      Add (Add_Observed_Holiday (Rules, Year, 1, 1));
      Add (Add_Nth_Weekday_Holiday (Rules, Year, 1, 1, 3));
      Add (Add_Nth_Weekday_Holiday (Rules, Year, 2, 1, 3));
      Add (Add_Nth_Weekday_Holiday (Rules, Year, 5, 1, -1));
      Add (Add_Observed_Holiday (Rules, Year, 6, 19));
      Add (Add_Observed_Holiday (Rules, Year, 7, 4));
      Add (Add_Nth_Weekday_Holiday (Rules, Year, 9, 1, 1));
      Add (Add_Nth_Weekday_Holiday (Rules, Year, 10, 1, 2));
      Add (Add_Observed_Holiday (Rules, Year, 11, 11));
      Add (Add_Nth_Weekday_Holiday (Rules, Year, 11, 4, 4));
      Add (Add_Observed_Holiday (Rules, Year, 12, 25));
      return Code;
   end Add_US_Federal_Holidays;

   procedure Remember_First_Error
     (Current   : in out Humanize.Status.Status_Code;
      Next_Code : Humanize.Status.Status_Code)
   is
   begin
      if Current = Humanize.Status.Ok
        and then Next_Code /= Humanize.Status.Ok
      then
         Current := Next_Code;
      end if;
   end Remember_First_Error;

   function Western_Easter
     (Year : Ada.Calendar.Year_Number)
      return Ada.Calendar.Time
   is
      Y : constant Integer := Integer (Year);
      A : constant Integer := Y mod 19;
      B : constant Integer := Y / 100;
      C : constant Integer := Y mod 100;
      D : constant Integer := B / 4;
      E : constant Integer := B mod 4;
      F : constant Integer := (B + 8) / 25;
      G : constant Integer := (B - F + 1) / 3;
      H : constant Integer := (19 * A + B - D - G + 15) mod 30;
      I : constant Integer := C / 4;
      K : constant Integer := C mod 4;
      L : constant Integer := (32 + 2 * E + 2 * I - H - K) mod 7;
      M : constant Integer := (A + 11 * H + 22 * L) / 451;
      Month : constant Integer := (H + L - 7 * M + 114) / 31;
      Day : constant Integer := ((H + L - 7 * M + 114) mod 31) + 1;
   begin
      return Ada.Calendar.Time_Of
        (Year,
         Ada.Calendar.Month_Number (Month),
         Ada.Calendar.Day_Number (Day),
         0.0);
   end Western_Easter;

   function Add_TARGET2_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Easter : constant Ada.Calendar.Time := Western_Easter (Year);
   begin
      Remember_First_Error
        (Code, Add_One_Off_Holiday
          (Rules, Ada.Calendar.Time_Of (Year, 1, 1, 0.0)));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Easter - 2.0 * 86_400.0));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Easter + 86_400.0));
      Remember_First_Error
        (Code, Add_One_Off_Holiday
          (Rules, Ada.Calendar.Time_Of (Year, 5, 1, 0.0)));
      Remember_First_Error
        (Code, Add_One_Off_Holiday
          (Rules, Ada.Calendar.Time_Of (Year, 12, 25, 0.0)));
      Remember_First_Error
        (Code, Add_One_Off_Holiday
          (Rules, Ada.Calendar.Time_Of (Year, 12, 26, 0.0)));
      return Code;
   end Add_TARGET2_Holidays;

   function Add_UK_Christmas_Boxing
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Christmas : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Year, 12, 25, 0.0);
   begin
      case ISO_Weekday (Christmas) is
         when 6 =>
            Remember_First_Error
              (Code, Add_One_Off_Holiday
                (Rules, Ada.Calendar.Time_Of (Year, 12, 27, 0.0)));
            Remember_First_Error
              (Code, Add_One_Off_Holiday
                (Rules, Ada.Calendar.Time_Of (Year, 12, 28, 0.0)));
         when 7 =>
            Remember_First_Error
              (Code, Add_One_Off_Holiday
                (Rules, Ada.Calendar.Time_Of (Year, 12, 26, 0.0)));
            Remember_First_Error
              (Code, Add_One_Off_Holiday
                (Rules, Ada.Calendar.Time_Of (Year, 12, 27, 0.0)));
         when 5 =>
            Remember_First_Error
              (Code, Add_One_Off_Holiday
                (Rules, Ada.Calendar.Time_Of (Year, 12, 25, 0.0)));
            Remember_First_Error
              (Code, Add_One_Off_Holiday
                (Rules, Ada.Calendar.Time_Of (Year, 12, 28, 0.0)));
         when others =>
            Remember_First_Error
              (Code, Add_One_Off_Holiday
                (Rules, Ada.Calendar.Time_Of (Year, 12, 25, 0.0)));
            Remember_First_Error
              (Code, Add_One_Off_Holiday
                (Rules, Ada.Calendar.Time_Of (Year, 12, 26, 0.0)));
      end case;
      return Code;
   end Add_UK_Christmas_Boxing;

   function Add_UK_Bank_Holidays_England_Wales
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Easter : constant Ada.Calendar.Time := Western_Easter (Year);
   begin
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 1, 1));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Easter - 2.0 * 86_400.0));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Easter + 86_400.0));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 5, 1, 1));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 5, 1, -1));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 8, 1, -1));
      Remember_First_Error (Code, Add_UK_Christmas_Boxing (Rules, Year));
      return Code;
   end Add_UK_Bank_Holidays_England_Wales;

   function Add_Canada_Federal_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Easter : constant Ada.Calendar.Time := Western_Easter (Year);
      May_24 : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Year, 5, 24, 0.0);
      Victoria_Day : constant Ada.Calendar.Time :=
        May_24 - Duration (ISO_Weekday (May_24) - 1) * 86_400.0;
   begin
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 1, 1));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Easter - 2.0 * 86_400.0));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Victoria_Day));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 7, 1));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 9, 1, 1));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 10, 1, 2));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 11, 11));
      Remember_First_Error (Code, Add_UK_Christmas_Boxing (Rules, Year));
      return Code;
   end Add_Canada_Federal_Holidays;

   function Add_Germany_Public_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Easter : constant Ada.Calendar.Time := Western_Easter (Year);
   begin
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Ada.Calendar.Time_Of (Year, 1, 1, 0.0)));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Easter - 2.0 * 86_400.0));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Easter + 86_400.0));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Ada.Calendar.Time_Of (Year, 5, 1, 0.0)));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Easter + 39.0 * 86_400.0));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Easter + 50.0 * 86_400.0));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Ada.Calendar.Time_Of (Year, 10, 3, 0.0)));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Ada.Calendar.Time_Of (Year, 12, 25, 0.0)));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Ada.Calendar.Time_Of (Year, 12, 26, 0.0)));
      return Code;
   end Add_Germany_Public_Holidays;

   function Add_France_Public_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Easter : constant Ada.Calendar.Time := Western_Easter (Year);
   begin
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Ada.Calendar.Time_Of (Year, 1, 1, 0.0)));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Easter + 86_400.0));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Ada.Calendar.Time_Of (Year, 5, 1, 0.0)));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Ada.Calendar.Time_Of (Year, 5, 8, 0.0)));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Easter + 39.0 * 86_400.0));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Easter + 50.0 * 86_400.0));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Ada.Calendar.Time_Of (Year, 7, 14, 0.0)));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Ada.Calendar.Time_Of (Year, 8, 15, 0.0)));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Ada.Calendar.Time_Of (Year, 11, 1, 0.0)));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Ada.Calendar.Time_Of (Year, 11, 11, 0.0)));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Ada.Calendar.Time_Of (Year, 12, 25, 0.0)));
      return Code;
   end Add_France_Public_Holidays;

   function Add_NYSE_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Easter : constant Ada.Calendar.Time := Western_Easter (Year);
   begin
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 1, 1));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 1, 1, 3));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 2, 1, 3));
      Remember_First_Error (Code, Add_One_Off_Holiday (Rules, Easter - 2.0 * 86_400.0));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 5, 1, -1));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 6, 19));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 7, 4));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 9, 1, 1));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 11, 4, 4));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 12, 25));
      return Code;
   end Add_NYSE_Holidays;

   function Add_Australia_National_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Easter : constant Ada.Calendar.Time := Western_Easter (Year);
   begin
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 1, 1));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 1, 26));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter - 2.0 * 86_400.0));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter + 86_400.0));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 4, 25));
      Remember_First_Error (Code, Add_UK_Christmas_Boxing (Rules, Year));
      return Code;
   end Add_Australia_National_Holidays;

   function Add_ASX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Add_Australia_National_Holidays
        (Rules, Year);
   begin
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 6, 1, 2));
      return Code;
   end Add_ASX_Holidays;

   function Add_Japan_Public_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
   begin
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 1, 1));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 1, 1, 2));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 2, 11));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 2, 23));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 4, 29));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 5, 3));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 5, 4));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 5, 5));
      if ISO_Weekday (Ada.Calendar.Time_Of (Year, 5, 3, 0.0)) = 7 then
         Remember_First_Error
           (Code, Add_One_Off_Holiday
              (Rules, Ada.Calendar.Time_Of (Year, 5, 6, 0.0)));
      end if;
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 7, 1, 3));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 8, 11));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 9, 1, 3));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 9, 23));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 10, 1, 2));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 11, 3));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 11, 23));
      return Code;
   end Add_Japan_Public_Holidays;

   function Add_JPX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Add_Japan_Public_Holidays
        (Rules, Year);
   begin
      Remember_First_Error
        (Code, Add_One_Off_Holiday
           (Rules, Ada.Calendar.Time_Of (Year, 1, 2, 0.0)));
      Remember_First_Error
        (Code, Add_One_Off_Holiday
           (Rules, Ada.Calendar.Time_Of (Year, 1, 3, 0.0)));
      Remember_First_Error
        (Code, Add_One_Off_Holiday
           (Rules, Ada.Calendar.Time_Of (Year, 12, 31, 0.0)));
      return Code;
   end Add_JPX_Holidays;

   function Add_Switzerland_Common_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Easter : constant Ada.Calendar.Time := Western_Easter (Year);
   begin
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 1, 1));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter - 2.0 * 86_400.0));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter + 86_400.0));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter + 39.0 * 86_400.0));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter + 50.0 * 86_400.0));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 8, 1));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 12, 25));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 12, 26));
      return Code;
   end Add_Switzerland_Common_Holidays;

   function Add_SIX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Add_Switzerland_Common_Holidays
        (Rules, Year);
   begin
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 1, 2));
      return Code;
   end Add_SIX_Holidays;

   function Add_Singapore_Public_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Easter : constant Ada.Calendar.Time := Western_Easter (Year);
   begin
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 1, 1));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter - 2.0 * 86_400.0));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 5, 1));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 8, 9));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 12, 25));
      return Code;
   end Add_Singapore_Public_Holidays;

   function Add_SGX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
   begin
      return Add_Singapore_Public_Holidays (Rules, Year);
   end Add_SGX_Holidays;

   function Add_HKEX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Easter : constant Ada.Calendar.Time := Western_Easter (Year);
   begin
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 1, 1));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter - 2.0 * 86_400.0));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter + 86_400.0));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 5, 1));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 7, 1));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 10, 1));
      Remember_First_Error (Code, Add_UK_Christmas_Boxing (Rules, Year));
      Remember_First_Error
        (Code, Add_Half_Day
           (Rules, Ada.Calendar.Time_Of (Year, 12, 24, 0.0), 12));
      Remember_First_Error
        (Code, Add_Half_Day
           (Rules, Ada.Calendar.Time_Of (Year, 12, 31, 0.0), 12));
      return Code;
   end Add_HKEX_Holidays;

   function Add_NSE_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Easter : constant Ada.Calendar.Time := Western_Easter (Year);
   begin
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 1, 26));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter - 2.0 * 86_400.0));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 5, 1));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 8, 15));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 10, 2));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 12, 25));
      return Code;
   end Add_NSE_Holidays;

   function Add_B3_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Easter : constant Ada.Calendar.Time := Western_Easter (Year);
   begin
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 1, 1));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter - 48.0 * 86_400.0));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter - 47.0 * 86_400.0));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter - 2.0 * 86_400.0));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 4, 21));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 5, 1));
      Remember_First_Error
        (Code, Add_One_Off_Holiday (Rules, Easter + 60.0 * 86_400.0));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 9, 7));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 10, 12));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 11, 2));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 11, 15));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 11, 20));
      Remember_First_Error
        (Code, Add_One_Off_Holiday
           (Rules, Ada.Calendar.Time_Of (Year, 12, 24, 0.0)));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 12, 25));
      Remember_First_Error
        (Code, Add_One_Off_Holiday
           (Rules, Ada.Calendar.Time_Of (Year, 12, 31, 0.0)));
      return Code;
   end Add_B3_Holidays;

   function Add_BMV_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
   is
      Code : Humanize.Status.Status_Code := Humanize.Status.Ok;
   begin
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 1, 1));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 2, 1, 1));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 3, 1, 3));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 5, 1));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 9, 16));
      Remember_First_Error
        (Code, Add_Nth_Weekday_Holiday (Rules, Year, 11, 1, 3));
      Remember_First_Error (Code, Add_Observed_Holiday (Rules, Year, 12, 25));
      return Code;
   end Add_BMV_Holidays;

   function Add_Half_Day
     (Rules    : in out Business_Calendar_Rules;
      Date     : Ada.Calendar.Time;
      End_Hour : Natural)
      return Humanize.Status.Status_Code
   is
   begin
      if End_Hour > 24 then
         return Humanize.Status.Invalid_Value;
      elsif Rules.Half_Day_Count = Rules.Max_Half_Days then
         return Humanize.Status.Buffer_Overflow;
      end if;
      Rules.Half_Day_Count := Rules.Half_Day_Count + 1;
      Rules.Half_Days (Rules.Half_Day_Count) :=
        (Date => Date, End_Hour => End_Hour);
      return Humanize.Status.Ok;
   end Add_Half_Day;

   function Add_Shutdown
     (Rules      : in out Business_Calendar_Rules;
      First_Date : Ada.Calendar.Time;
      Last_Date  : Ada.Calendar.Time)
      return Humanize.Status.Status_Code
   is
   begin
      if Last_Date < First_Date then
         return Humanize.Status.Invalid_Value;
      elsif Rules.Shutdown_Count = Rules.Max_Shutdowns then
         return Humanize.Status.Buffer_Overflow;
      end if;
      Rules.Shutdown_Count := Rules.Shutdown_Count + 1;
      Rules.Shutdowns (Rules.Shutdown_Count) :=
        (First_Date => First_Date, Last_Date => Last_Date);
      return Humanize.Status.Ok;
   end Add_Shutdown;

   function Set_Business_Hours
     (Rules      : in out Business_Calendar_Rules;
      Weekday    : Natural;
      Start_Hour : Natural;
      End_Hour   : Natural)
      return Humanize.Status.Status_Code
   is
   begin
      if Weekday > 7
        or else Start_Hour > 24
        or else End_Hour > 24
        or else Start_Hour >= End_Hour
      then
         return Humanize.Status.Invalid_Value;
      end if;

      if Weekday = 0 then
         for Day in 1 .. 7 loop
            Apply_Hours
              (Rules.Options.Weekday_Hours, Day, Start_Hour, End_Hour);
         end loop;
      else
         Apply_Hours
           (Rules.Options.Weekday_Hours, Weekday, Start_Hour, End_Hour);
      end if;
      return Humanize.Status.Ok;
   end Set_Business_Hours;

   function Rule_Holidays
     (Rules : Business_Calendar_Rules)
      return Holiday_List
   is
   begin
      return Rules.Holidays (1 .. Rules.Holiday_Count);
   end Rule_Holidays;

   function Rule_Recurring_Holidays
     (Rules : Business_Calendar_Rules)
      return Recurring_Holiday_List
   is
   begin
      return Rules.Recurring_Holidays (1 .. Rules.Recurring_Holiday_Count);
   end Rule_Recurring_Holidays;

   function Rule_Half_Days
     (Rules : Business_Calendar_Rules)
      return Half_Day_List
   is
   begin
      return Rules.Half_Days (1 .. Rules.Half_Day_Count);
   end Rule_Half_Days;

   function Rule_Shutdowns
     (Rules : Business_Calendar_Rules)
      return Shutdown_Period_List
   is
   begin
      return Rules.Shutdowns (1 .. Rules.Shutdown_Count);
   end Rule_Shutdowns;

   function Hours
     (Monday_Start    : Natural;
      Monday_End      : Natural;
      Tuesday_Start   : Natural;
      Tuesday_End     : Natural;
      Wednesday_Start : Natural;
      Wednesday_End   : Natural;
      Thursday_Start  : Natural;
      Thursday_End    : Natural;
      Friday_Start    : Natural;
      Friday_End      : Natural;
      Saturday_Start  : Natural;
      Saturday_End    : Natural;
      Sunday_Start    : Natural;
      Sunday_End      : Natural)
      return Weekday_Business_Hours
   is
   begin
      return
        (Monday_Start    => Monday_Start,
         Monday_End      => Monday_End,
         Tuesday_Start   => Tuesday_Start,
         Tuesday_End     => Tuesday_End,
         Wednesday_Start => Wednesday_Start,
         Wednesday_End   => Wednesday_End,
         Thursday_Start  => Thursday_Start,
         Thursday_End    => Thursday_End,
         Friday_Start    => Friday_Start,
         Friday_End      => Friday_End,
         Saturday_Start  => Saturday_Start,
         Saturday_End    => Saturday_End,
         Sunday_Start    => Sunday_Start,
         Sunday_End      => Sunday_End);
   end Hours;

   function Business_Calendar_Options_For
     (Preset : Business_Calendar_Preset)
      return Advanced_Business_Calendar_Options
   is
   begin
      case Preset is
         when Business_Weekdays_9_To_5 =>
            return Default_Advanced_Business_Calendar_Options;
         when Business_Weekdays_8_To_4 =>
            return
              (Weekday_Hours =>
                 Hours (8, 16, 8, 16, 8, 16, 8, 16, 8, 16, 0, 0, 0, 0),
               Break_Start_Hour => 0,
               Break_End_Hour   => 0);
         when Business_Extended_Weekdays =>
            return
              (Weekday_Hours =>
                 Hours (8, 18, 8, 18, 8, 18, 8, 18, 8, 18, 0, 0, 0, 0),
               Break_Start_Hour => 0,
               Break_End_Hour   => 0);
         when Business_Seven_Days =>
            return
              (Weekday_Hours =>
                 Hours (9, 17, 9, 17, 9, 17, 9, 17, 9, 17, 9, 17, 9, 17),
               Break_Start_Hour => 0,
               Break_End_Hour   => 0);
         when Business_Closed =>
            return
              (Weekday_Hours =>
                 Hours (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
               Break_Start_Hour => 0,
               Break_End_Hour   => 0);
      end case;
   end Business_Calendar_Options_For;

   function Business_Calendar_Rules_For
     (Preset : Business_Calendar_Preset)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
   begin
      Rules.Options := Business_Calendar_Options_For (Preset);
      return Rules;
   end Business_Calendar_Rules_For;

   function US_Federal_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_US_Federal_Holidays (Rules, Year);
      return Rules;
   end US_Federal_Business_Calendar_Rules;

   function TARGET2_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_TARGET2_Holidays (Rules, Year);
      return Rules;
   end TARGET2_Business_Calendar_Rules;

   function UK_England_Wales_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_UK_Bank_Holidays_England_Wales (Rules, Year);
      return Rules;
   end UK_England_Wales_Business_Calendar_Rules;

   function Canada_Federal_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_Canada_Federal_Holidays (Rules, Year);
      return Rules;
   end Canada_Federal_Business_Calendar_Rules;

   function Germany_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_Germany_Public_Holidays (Rules, Year);
      return Rules;
   end Germany_Business_Calendar_Rules;

   function France_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_France_Public_Holidays (Rules, Year);
      return Rules;
   end France_Business_Calendar_Rules;

   function NYSE_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_NYSE_Holidays (Rules, Year);
      return Rules;
   end NYSE_Business_Calendar_Rules;

   function ASX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_ASX_Holidays (Rules, Year);
      return Rules;
   end ASX_Business_Calendar_Rules;

   function JPX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules
        (Max_Holidays           => 32,
         Max_Recurring_Holidays => 16,
         Max_Half_Days          => 16,
         Max_Shutdowns          => 16);
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_JPX_Holidays (Rules, Year);
      return Rules;
   end JPX_Business_Calendar_Rules;

   function SIX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_SIX_Holidays (Rules, Year);
      return Rules;
   end SIX_Business_Calendar_Rules;

   function SGX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_SGX_Holidays (Rules, Year);
      return Rules;
   end SGX_Business_Calendar_Rules;

   function HKEX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_HKEX_Holidays (Rules, Year);
      return Rules;
   end HKEX_Business_Calendar_Rules;

   function NSE_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_NSE_Holidays (Rules, Year);
      return Rules;
   end NSE_Business_Calendar_Rules;

   function B3_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules
        (Max_Holidays           => 32,
         Max_Recurring_Holidays => 16,
         Max_Half_Days          => 16,
         Max_Shutdowns          => 16);
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_B3_Holidays (Rules, Year);
      return Rules;
   end B3_Business_Calendar_Rules;

   function BMV_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_BMV_Holidays (Rules, Year);
      return Rules;
   end BMV_Business_Calendar_Rules;

   function Australia_National_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_Australia_National_Holidays (Rules, Year);
      return Rules;
   end Australia_National_Business_Calendar_Rules;

   function Japan_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_Japan_Public_Holidays (Rules, Year);
      return Rules;
   end Japan_Business_Calendar_Rules;

   function Switzerland_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_Switzerland_Common_Holidays (Rules, Year);
      return Rules;
   end Switzerland_Business_Calendar_Rules;

   function Singapore_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
   is
      Rules : Business_Calendar_Rules;
      Code  : Humanize.Status.Status_Code;
      pragma Unreferenced (Code);
   begin
      Rules.Options := Business_Calendar_Options_For (Business_Weekdays_9_To_5);
      Code := Add_Singapore_Public_Holidays (Rules, Year);
      return Rules;
   end Singapore_Business_Calendar_Rules;

   function ISO_Date (Value : Ada.Calendar.Time) return String is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      return No_Space (Ada.Calendar.Year_Number'Image (Year))
        & "-" & Pad2 (Natural (Month))
        & "-" & Pad2 (Natural (Day));
   end ISO_Date;

   function Same_Date
     (Left  : Ada.Calendar.Time;
      Right : Ada.Calendar.Time)
      return Boolean
   is
      Left_Year     : Ada.Calendar.Year_Number;
      Left_Month    : Ada.Calendar.Month_Number;
      Left_Day      : Ada.Calendar.Day_Number;
      Left_Seconds  : Ada.Calendar.Day_Duration;
      Right_Year    : Ada.Calendar.Year_Number;
      Right_Month   : Ada.Calendar.Month_Number;
      Right_Day     : Ada.Calendar.Day_Number;
      Right_Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split
        (Left, Left_Year, Left_Month, Left_Day, Left_Seconds);
      Ada.Calendar.Split
        (Right, Right_Year, Right_Month, Right_Day, Right_Seconds);
      return Left_Year = Right_Year
        and then Left_Month = Right_Month
        and then Left_Day = Right_Day;
   end Same_Date;

   procedure Date_Parts
     (Value : Ada.Calendar.Time;
      Year  : out Ada.Calendar.Year_Number;
      Month : out Ada.Calendar.Month_Number;
      Day   : out Ada.Calendar.Day_Number)
   is
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
   end Date_Parts;

   procedure Month_Day
     (Value : Ada.Calendar.Time;
      Month : out Ada.Calendar.Month_Number;
      Day   : out Ada.Calendar.Day_Number)
   is
      Year    : Ada.Calendar.Year_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
   end Month_Day;

   function Is_Configured_Work_Day
     (Value   : Ada.Calendar.Time;
      Options : Business_Day_Options)
      return Boolean
   is
      use Ada.Calendar.Formatting;
      Day : constant Day_Name := Day_Of_Week (Value);
   begin
      case Day is
         when Monday    => return Options.Work_Monday;
         when Tuesday   => return Options.Work_Tuesday;
         when Wednesday => return Options.Work_Wednesday;
         when Thursday  => return Options.Work_Thursday;
         when Friday    => return Options.Work_Friday;
         when Saturday  => return Options.Work_Saturday;
         when Sunday    => return Options.Work_Sunday;
      end case;
   end Is_Configured_Work_Day;

   function Is_Business_Day
     (Value    : Ada.Calendar.Time;
      Holidays : Holiday_List;
      Options  : Business_Day_Options)
      return Boolean
   is
   begin
      if not Is_Configured_Work_Day (Value, Options) then
         return False;
      end if;

      for Holiday of Holidays loop
         if Same_Date (Value, Holiday) then
            return False;
         end if;
      end loop;
      return True;
   end Is_Business_Day;

   function Is_Recurring_Holiday
     (Value              : Ada.Calendar.Time;
      Recurring_Holidays : Recurring_Holiday_List)
      return Boolean
   is
      Month : Ada.Calendar.Month_Number;
      Day   : Ada.Calendar.Day_Number;
   begin
      Month_Day (Value, Month, Day);
      for Holiday of Recurring_Holidays loop
         if Holiday.Month = Month and then Holiday.Day = Day then
            return True;
         end if;
      end loop;
      return False;
   end Is_Recurring_Holiday;

   function Is_One_Off_Holiday
     (Value    : Ada.Calendar.Time;
      Holidays : Holiday_List)
      return Boolean
   is
   begin
      for Holiday of Holidays loop
         if Same_Date (Value, Holiday) then
            return True;
         end if;
      end loop;
      return False;
   end Is_One_Off_Holiday;

   function Is_Shutdown_Day
     (Value     : Ada.Calendar.Time;
      Shutdowns : Shutdown_Period_List)
      return Boolean
   is
      Value_Year  : Ada.Calendar.Year_Number;
      Value_Month : Ada.Calendar.Month_Number;
      Value_Day   : Ada.Calendar.Day_Number;
      First_Year  : Ada.Calendar.Year_Number;
      First_Month : Ada.Calendar.Month_Number;
      First_Day   : Ada.Calendar.Day_Number;
      Last_Year   : Ada.Calendar.Year_Number;
      Last_Month  : Ada.Calendar.Month_Number;
      Last_Day    : Ada.Calendar.Day_Number;
      Day : Ada.Calendar.Time;
      First : Ada.Calendar.Time;
      Last  : Ada.Calendar.Time;
   begin
      Date_Parts (Value, Value_Year, Value_Month, Value_Day);
      Day := Ada.Calendar.Time_Of (Value_Year, Value_Month, Value_Day, 0.0);
      for Shutdown of Shutdowns loop
         Date_Parts (Shutdown.First_Date, First_Year, First_Month, First_Day);
         Date_Parts (Shutdown.Last_Date, Last_Year, Last_Month, Last_Day);
         First := Ada.Calendar.Time_Of
           (First_Year, First_Month, First_Day, 0.0);
         Last := Ada.Calendar.Time_Of
           (Last_Year, Last_Month, Last_Day, 0.0);
         if Day >= First and then Day <= Last then
            return True;
         end if;
      end loop;
      return False;
   end Is_Shutdown_Day;

   procedure Copy_Text
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
      elsif Text'Length > Target'Length then
         if Target'Length > 0 then
            Target (Target'First .. Target'Last) :=
              Text (Text'First .. Text'First + Target'Length - 1);
         end if;
         Written := Target'Length;
         Status := Humanize.Status.Buffer_Overflow;
      else
         if Text'Length > 0 then
            Target (Target'First .. Target'First + Text'Length - 1) := Text;
         end if;
         Written := Text'Length;
         Status := Humanize.Status.Ok;
      end if;
   end Copy_Text;

   function Unit_Seconds
     (Unit : Duration_Unit)
      return Duration_Seconds
   is
   begin
      case Unit is
         when Year   => return 31_536_000;
         when Month  => return 2_592_000;
         when Week   => return 604_800;
         when Day    => return 86_400;
         when Hour   => return 3_600;
         when Minute => return 60;
         when Second => return 1;
      end case;
   end Unit_Seconds;

   function Format_Metadata
     (Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Duration_Render_Metadata
   is
      Remaining : Duration_Seconds :=
        (if Seconds < 0 then -Seconds else Seconds);
      Result : Duration_Render_Metadata :=
        (Status => Humanize.Status.Ok,
         Negative => Seconds < 0,
         others => <>);

      procedure Take
        (Unit  : Duration_Unit;
         Count : out Natural)
      is
         Size : constant Duration_Seconds := Unit_Seconds (Unit);
      begin
         if Unit <= Options.Largest_Unit
           and then Unit >= Options.Smallest_Unit
           and then Size > 0
         then
            Count := Natural (Remaining / Size);
            Remaining := Remaining mod Size;
            if Count > 0 then
               Result.Component_Count := Result.Component_Count + 1;
            end if;
         else
            Count := 0;
         end if;
      end Take;
   begin
      if Options.Largest_Unit < Options.Smallest_Unit then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      Take (Year, Result.Years);
      Take (Month, Result.Months);
      Take (Week, Result.Weeks);
      Take (Day, Result.Days);
      Take (Hour, Result.Hours);
      Take (Minute, Result.Minutes);
      Take (Second, Result.Seconds);
      return Result;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Format_Metadata;

   function Format
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Result : constant Humanize.Duration_Classification.Outcome :=
        Humanize.Duration_Classification.Classify (Seconds, Options);
   begin
      case Result.Kind is
         when Humanize.Duration_Classification.Ok_Selection =>
            declare
               Slavic : constant Humanize.Status.Text_Result :=
                 Slavic_Format_Selection (Context, Seconds, Options);
            begin
               if Slavic.Status = Humanize.Status.Ok then
                  return Slavic;
               end if;
            end;
            return Humanize.I18N_Rendering.Render (Context, Result.Selection);
         when Humanize.Duration_Classification.Value_Invalid =>
            return (Status => Humanize.Status.Invalid_Value, others => <>);
         when Humanize.Duration_Classification.Options_Invalid =>
            return (Status => Humanize.Status.Invalid_Options, others => <>);
      end case;
   end Format;

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
      Result : constant Humanize.Duration_Classification.Outcome :=
        Humanize.Duration_Classification.Classify (Seconds, Options);
   begin
      Written := 0;

      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;

      case Result.Kind is
         when Humanize.Duration_Classification.Ok_Selection =>
            declare
               Slavic : constant Humanize.Status.Text_Result :=
                 Slavic_Format_Selection (Context, Seconds, Options);
            begin
               if Slavic.Status = Humanize.Status.Ok then
                  Copy_Text (To_String (Slavic.Text), Target, Written, Status);
               else
                  Humanize.I18N_Rendering.Render_Into
                    (Context, Result.Selection, Target, Written, Status);
               end if;
            end;
         when Humanize.Duration_Classification.Value_Invalid =>
            Status := Humanize.Status.Invalid_Value;
         when Humanize.Duration_Classification.Options_Invalid =>
            Status := Humanize.Status.Invalid_Options;
      end case;
   end Format_Into;

   function Format_Components
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Options        : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Outcome : constant Humanize.Duration_Classification.Multi_Outcome :=
        Humanize.Duration_Classification.Classify_Multi
          (Seconds, Options, Max_Components);
      Joined  : Unbounded_String;
   begin
      case Outcome.Kind is
         when Humanize.Duration_Classification.Value_Invalid =>
            return (Status => Humanize.Status.Invalid_Value, others => <>);
         when Humanize.Duration_Classification.Options_Invalid =>
            return (Status => Humanize.Status.Invalid_Options, others => <>);
         when Humanize.Duration_Classification.Ok_Selection =>
            null;
      end case;

      declare
         Parts : array (1 .. Outcome.Length) of Unbounded_String;
         --  The locale conjunction joining the final component ("and"/"og"/...).
         Conj_Result : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render
             (Context, Humanize.Selections.No_Arg (Humanize.Messages.List_And));
         Conjunction : constant String :=
           (if Conj_Result.Status = Humanize.Status.Ok
            then To_String (Conj_Result.Text)
            else "and");
      begin
         for Index in 1 .. Outcome.Length loop
            declare
               Part : constant Humanize.Status.Text_Result :=
                 Slavic_Duration_Result
                   (Context, Outcome.Items (Index).Count, Outcome.Items (Index).Unit);
               Rendered : constant Humanize.Status.Text_Result :=
                 (if Part.Status = Humanize.Status.Ok
                  then Part
                  else Humanize.I18N_Rendering.Render
                         (Context,
                          Humanize.Duration_Classification.Component_Selection
                            (Outcome.Items (Index))));
            begin
               if Rendered.Status /= Humanize.Status.Ok then
                  return Rendered;  --  propagate the first render failure
               end if;
               Parts (Index) := Rendered.Text;
            end;
         end loop;

         --  Join: non-final components with ", ", the last with the conjunction
         --  (for example "1 hour, 1 minute and 1 second").
         if Outcome.Length = 1 then
            Joined := Parts (1);
         else
            for Index in 1 .. Outcome.Length - 1 loop
               if Index > 1 then
                  Append (Joined, ", ");
               end if;
               Append (Joined, Parts (Index));
            end loop;
            Append (Joined, " " & Conjunction & " ");
            Append (Joined, Parts (Outcome.Length));
         end if;
      end;

      return
        (Status => Humanize.Status.Ok,
         Text   => Joined,
         Key    => Humanize.Messages.No_Message);
   end Format_Components;

   procedure Format_Components_Into
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Options        : Duration_Options := Default_Duration_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Format_Components (Context, Seconds, Max_Components, Options);
      Text   : constant String := To_String (Result.Text);
   begin
      Written := 0;

      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;

      if Result.Status /= Humanize.Status.Ok then
         Status := Result.Status;
         return;
      end if;

      if Text'Length > Target'Length then
         if Target'Length > 0 then
            Target (Target'First .. Target'Last) :=
              Text (Text'First .. Text'First + Target'Length - 1);
         end if;
         Written := Target'Length;
         Status := Humanize.Status.Buffer_Overflow;
      else
         if Text'Length > 0 then
            Target (Target'First .. Target'First + Text'Length - 1) := Text;
         end if;
         Written := Text'Length;
         Status := Humanize.Status.Ok;
      end if;
   end Format_Components_Into;

   function Unit_Suffix (Unit : Duration_Unit) return String is
   begin
      case Unit is
         when Second => return "s";
         when Minute => return "m";
         when Hour   => return "h";
         when Day    => return "d";
         when Week   => return "w";
         when Month  => return "mo";
         when Year   => return "y";
      end case;
   end Unit_Suffix;

   function Format_Compact
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive := 2;
      Options        : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Outcome : constant Humanize.Duration_Classification.Multi_Outcome :=
        Humanize.Duration_Classification.Classify_Multi
          (Seconds, Options, Max_Components);
      Result  : Unbounded_String;
   begin
      case Outcome.Kind is
         when Humanize.Duration_Classification.Value_Invalid =>
            return (Status => Humanize.Status.Invalid_Value, others => <>);
         when Humanize.Duration_Classification.Options_Invalid =>
            return (Status => Humanize.Status.Invalid_Options, others => <>);
         when Humanize.Duration_Classification.Ok_Selection =>
            null;
      end case;

      for Index in 1 .. Outcome.Length loop
         if Index > 1 then
            Append (Result, " ");
         end if;
         Append
           (Result,
            No_Space (Long_Long_Integer'Image (Outcome.Items (Index).Count))
            & Unit_Suffix (Outcome.Items (Index).Unit));
      end loop;

      return
        (Status => Humanize.Status.Ok,
         Text   => Result,
         Key    => Humanize.Messages.No_Message);
   end Format_Compact;

   procedure Format_Compact_Into
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Options        : Duration_Options := Default_Duration_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Format_Compact (Context, Seconds, Max_Components, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Format_Compact_Into;

   function Two_Digits (Value : Long_Long_Integer) return String is
      Image : constant String := No_Space (Long_Long_Integer'Image (Value));
   begin
      if Value < 10 then
         return "0" & Image;
      else
         return Image;
      end if;
   end Two_Digits;

   function Format_Clock
     (Context      : Humanize.Contexts.Context;
      Seconds      : Duration_Seconds;
      Always_Hours : Boolean := True)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Total   : constant Long_Long_Integer := Long_Long_Integer (Seconds);
      Hours   : Long_Long_Integer;
      Minutes : Long_Long_Integer;
      Secs    : Long_Long_Integer;
      Text    : Unbounded_String;
   begin
      if Seconds < 0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      Hours := Total / 3_600;
      Minutes := (Total mod 3_600) / 60;
      Secs := Total mod 60;

      if Always_Hours or else Hours > 0 then
         Append (Text, Two_Digits (Hours) & ":");
      end if;
      Append (Text, Two_Digits (Minutes) & ":" & Two_Digits (Secs));

      return
        (Status => Humanize.Status.Ok,
         Text   => Text,
         Key    => Humanize.Messages.No_Message);
   end Format_Clock;

   procedure Format_Clock_Into
     (Context      : Humanize.Contexts.Context;
      Seconds      : Duration_Seconds;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Always_Hours : Boolean := True)
   is
      Result : constant Humanize.Status.Text_Result :=
        Format_Clock (Context, Seconds, Always_Hours);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Format_Clock_Into;

   function Unit_Size (Unit : Precise_Duration_Unit) return Long_Long_Integer is
   begin
      case Unit is
         when Microsecond    => return 1;
         when Millisecond    => return 1_000;
         when Precise_Second => return 1_000_000;
         when Precise_Minute => return 60 * 1_000_000;
         when Precise_Hour   => return 3_600 * 1_000_000;
         when Precise_Day    => return 86_400 * 1_000_000;
      end case;
   end Unit_Size;

   function Message_For
     (Unit : Precise_Duration_Unit)
      return Humanize.Messages.Message_Id
   is
   begin
      case Unit is
         when Microsecond =>
            return Humanize.Messages.Duration_Unit_Microsecond;
         when Millisecond =>
            return Humanize.Messages.Duration_Unit_Millisecond;
         when Precise_Second =>
            return Humanize.Messages.Duration_Unit_Second;
         when Precise_Minute =>
            return Humanize.Messages.Duration_Unit_Minute;
         when Precise_Hour =>
            return Humanize.Messages.Duration_Unit_Hour;
         when Precise_Day =>
            return Humanize.Messages.Duration_Unit_Day;
      end case;
   end Message_For;

   function Render_Precise_Component
     (Context   : Humanize.Contexts.Context;
      Component : Precise_Component)
      return Humanize.Status.Text_Result
   is
   begin
      declare
         Slavic : constant Humanize.Status.Text_Result :=
           Slavic_Precise_Result (Context, Component);
      begin
         if Slavic.Status = Humanize.Status.Ok then
            return Slavic;
         end if;
      end;

      return Humanize.I18N_Rendering.Render
        (Context,
         Humanize.Selections.Count
           (Message_For (Component.Unit),
            Humanize.Selections.Count_Value (Component.Count)));
   end Render_Precise_Component;

   function Format_Precise
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Minimum_Unit      : Precise_Duration_Unit)
      return Humanize.Status.Text_Result
   is
   begin
      return Format_Precise
        (Context, Microseconds, Max_Components,
         (Minimum_Unit     => Minimum_Unit,
          Suppressed_Units => [others => False]));
   end Format_Precise;

   function Format_Precise
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Options           : Precise_Duration_Options :=
        Default_Precise_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Remaining : Long_Long_Integer;
      Items     : Precise_Component_List (1 .. 6);
      Length    : Natural := 0;
   begin
      if Microseconds < 0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      Remaining := Long_Long_Integer (Microseconds);

      for Unit in reverse Precise_Duration_Unit loop
         if Unit >= Options.Minimum_Unit
           and then not Options.Suppressed_Units (Unit)
         then
            declare
               Size  : constant Long_Long_Integer := Unit_Size (Unit);
               Count : constant Long_Long_Integer := Remaining / Size;
            begin
               if Count > 0 or else (Remaining = 0 and then Length = 0) then
                  Length := Length + 1;
                  Items (Length) := (Unit => Unit, Count => Count);
                  Remaining := Remaining - Count * Size;
                  exit when Length = Max_Components;
               end if;
            end;
         end if;
      end loop;

      if Length = 0 then
         Length := 1;
         Items (1) := (Unit => Options.Minimum_Unit, Count => 0);
      end if;

      declare
         Parts : Humanize.Lists.Text_List (1 .. Length);
      begin
         for Index in 1 .. Length loop
            declare
               Part : constant Humanize.Status.Text_Result :=
                 Render_Precise_Component (Context, Items (Index));
            begin
               if Part.Status /= Humanize.Status.Ok then
                  return Part;
               end if;
               Parts (Index) := Part.Text;
            end;
         end loop;

         return Humanize.Lists.Format (Context, Parts);
      end;
   end Format_Precise;

   procedure Format_Precise_Into
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Minimum_Unit      : Precise_Duration_Unit)
   is
   begin
      Format_Precise_Into
        (Context, Microseconds, Max_Components, Target, Written, Status,
         (Minimum_Unit     => Minimum_Unit,
          Suppressed_Units => [others => False]));
   end Format_Precise_Into;

   procedure Format_Precise_Into
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Precise_Duration_Options :=
        Default_Precise_Duration_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Format_Precise (Context, Microseconds, Max_Components, Options);
      Text   : constant String := To_String (Result.Text);
   begin
      Written := 0;

      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;

      if Result.Status /= Humanize.Status.Ok then
         Status := Result.Status;
         return;
      end if;

      if Text'Length > Target'Length then
         if Target'Length > 0 then
            Target (Target'First .. Target'Last) :=
              Text (Text'First .. Text'First + Target'Length - 1);
         end if;
         Written := Target'Length;
         Status := Humanize.Status.Buffer_Overflow;
      else
         if Text'Length > 0 then
            Target (Target'First .. Target'First + Text'Length - 1) := Text;
         end if;
         Written := Text'Length;
         Status := Humanize.Status.Ok;
      end if;
   end Format_Precise_Into;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Text : constant String := To_String (Result.Text);
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
      elsif Result.Status /= Humanize.Status.Ok then
         Status := Result.Status;
      elsif Text'Length > Target'Length then
         if Target'Length > 0 then
            Target (Target'First .. Target'Last) :=
              Text (Text'First .. Text'First + Target'Length - 1);
         end if;
         Written := Target'Length;
         Status := Humanize.Status.Buffer_Overflow;
      else
         if Text'Length > 0 then
            Target (Target'First .. Target'First + Text'Length - 1) := Text;
         end if;
         Written := Text'Length;
         Status := Humanize.Status.Ok;
      end if;
   end Copy_Result;

   function Format_Range
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Left  : constant Humanize.Status.Text_Result :=
        Format (Context, Low, Options);
      Right : constant Humanize.Status.Text_Result :=
        Format (Context, High, Options);
   begin
      if Low < 0 or else High < 0 or else High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      elsif Left.Status /= Humanize.Status.Ok then
         return Left;
      elsif Right.Status /= Humanize.Status.Ok then
         return Right;
      else
         return
           (Status => Humanize.Status.Ok,
            Text   => To_Unbounded_String
              (To_String (Left.Text) & "-" & To_String (Right.Text)),
            Key    => Humanize.Messages.No_Message);
      end if;
   end Format_Range;

   function Countdown
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Format (Context, Seconds, Options);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (To_String (Base.Text) & " remaining"),
         Key    => Humanize.Messages.No_Message);
   end Countdown;

   function SLA_Window
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Format (Context, Seconds, Options);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String ("within " & To_String (Base.Text)),
         Key    => Humanize.Messages.No_Message);
   end SLA_Window;

   function Duration_Text
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      if Seconds = 0 then
         return
           (Status => Humanize.Status.Ok,
            Text   => To_Unbounded_String ("just now"),
            Key    => Humanize.Messages.No_Message);
      else
         return Format (Context, Seconds, Options);
      end if;
   end Duration_Text;

   function With_Base
     (Base   : Humanize.Status.Text_Result;
      Prefix : String := "";
      Suffix : String := "")
      return Humanize.Status.Text_Result is
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Prefix & To_String (Base.Text) & Suffix),
         Key    => Humanize.Messages.No_Message);
   end With_Base;

   function Interval
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
      return Humanize.Status.Text_Result
   is
      Left  : constant Humanize.Status.Text_Result := Format (Context, Low, Options);
      Right : constant Humanize.Status.Text_Result := Format (Context, High, Options);
      Prefix : constant String :=
        (case Phrase.Style is
            when Natural_Wording => "between ",
            when Compact_Label => "");
      Joiner : constant String :=
        (case Phrase.Style is
            when Natural_Wording => " and ",
            when Compact_Label => "-");
   begin
      if Low < 0 or else High < 0 or else High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      elsif Left.Status /= Humanize.Status.Ok then
         return Left;
      elsif Right.Status /= Humanize.Status.Ok then
         return Right;
      else
         return
           (Status => Humanize.Status.Ok,
            Text   => To_Unbounded_String
              (Prefix & To_String (Left.Text) & Joiner & To_String (Right.Text)),
            Key    => Humanize.Messages.No_Message);
      end if;
   end Interval;

   function Next_Window
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base
        (Format (Context, Seconds, Options),
         (case Phrase.Style is
             when Natural_Wording => "next ",
             when Compact_Label => ""));
   end Next_Window;

   function Age
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Format (Context, Seconds, Options), Suffix => " old");
   end Age;

   function Stale_For
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Format (Context, Seconds, Options), "stale for ");
   end Stale_For;

   function Expires_In
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Format (Context, Seconds, Options), "expires in ");
   end Expires_In;

   function Modified_Ago
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Duration_Text (Context, Seconds, Options), "modified ",
                        (if Seconds = 0 then "" else " ago"));
   end Modified_Ago;

   function Synced_Ago
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Duration_Text (Context, Seconds, Options), "synced ",
                        (if Seconds = 0 then "" else " ago"));
   end Synced_Ago;

   function Backup_Age
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Format (Context, Seconds, Options), "backup is ", " old");
   end Backup_Age;

   function Complete_Count
     (Context  : Humanize.Contexts.Context;
      Done     : Natural;
      Total    : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String
           (No_Space (Natural'Image (Done)) & " of "
            & No_Space (Natural'Image (Total)) & " complete"),
         Key    => Humanize.Messages.No_Message);
   end Complete_Count;

   function Percent_Complete
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String
           (Humanize.Decimal_Images.Decimal_Image (Percent, 1, True)
            & "% complete"),
         Key    => Humanize.Messages.No_Message);
   end Percent_Complete;

   function Retry_In
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Format (Context, Seconds, Options), "retrying in ");
   end Retry_In;

   function Step_Count
     (Context : Humanize.Contexts.Context;
      Step    : Natural;
      Total   : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           ("step " & No_Space (Natural'Image (Step)) & " of "
            & No_Space (Natural'Image (Total))),
         Key => Humanize.Messages.No_Message);
   end Step_Count;

   function Attempt_Count
     (Context : Humanize.Contexts.Context;
      Attempt : Natural;
      Total   : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           ("attempt " & No_Space (Natural'Image (Attempt)) & " of "
            & No_Space (Natural'Image (Total))),
         Key => Humanize.Messages.No_Message);
   end Attempt_Count;

   function ETA
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Format (Context, Seconds, Options), "ETA ");
   end ETA;

   function Throughput_Remaining
     (Context   : Humanize.Contexts.Context;
      Remaining : Natural;
      Rate      : Natural;
      Unit_Name : String)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Noun : constant String :=
        (if Remaining = 1 then Unit_Name else Unit_Name & "s");
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (No_Space (Natural'Image (Remaining)) & " " & Noun
            & " remaining at " & No_Space (Natural'Image (Rate)) & " "
            & Unit_Name & "/s"),
         Key => Humanize.Messages.No_Message);
   end Throughput_Remaining;

   function Progress_Bar
     (Context : Humanize.Contexts.Context;
      Done    : Natural;
      Total   : Positive;
      Width   : Positive := 10)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Filled : constant Natural := Natural'Min (Width, Done * Width / Total);
      Percent : constant Natural := Natural'Min (100, Done * 100 / Total);
      Text : Unbounded_String;
   begin
      Append (Text, "[");
      for Index in 1 .. Width loop
         Append (Text, (if Index <= Filled then "#" else "-"));
      end loop;
      Append
        (Text, "] " & No_Space (Natural'Image (Percent)) & "%");
      return
        (Status => Humanize.Status.Ok,
         Text => Text,
         Key => Humanize.Messages.No_Message);
   end Progress_Bar;

   function Accessible_Progress
     (Context : Humanize.Contexts.Context;
      Done    : Natural;
      Total   : Positive)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Percent : constant Natural := Natural'Min (100, Done * 100 / Total);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (No_Space (Natural'Image (Done)) & " of "
            & No_Space (Positive'Image (Total)) & " complete, "
            & No_Space (Natural'Image (Percent)) & " percent"),
         Key => Humanize.Messages.No_Message);
   end Accessible_Progress;

   function Business_Days
     (Context : Humanize.Contexts.Context;
      Days    : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (No_Space (Natural'Image (Days)) & " business "
            & (if Days = 1 then "day" else "days")),
         Key => Humanize.Messages.No_Message);
   end Business_Days;

   function Working_Hours
     (Context : Humanize.Contexts.Context;
      Hours   : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (No_Space (Natural'Image (Hours)) & " working "
            & (if Hours = 1 then "hour" else "hours")),
         Key => Humanize.Messages.No_Message);
   end Working_Hours;

   function End_Of_Week
     (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String ("end of week"),
         Key => Humanize.Messages.No_Message);
   end End_Of_Week;

   function End_Of_Month
     (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String ("end of month"),
         Key => Humanize.Messages.No_Message);
   end End_Of_Month;

   function End_Of_Quarter
     (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String ("end of quarter"),
         Key => Humanize.Messages.No_Message);
   end End_Of_Quarter;

   function Recurrence
     (Context : Humanize.Contexts.Context;
      Every   : Positive;
      Unit    : Recurrence_Unit)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Unit_Text : constant String :=
        (case Unit is
            when Every_Second => "second",
            when Every_Minute => "minute",
            when Every_Hour => "hour",
            when Every_Day => "day",
            when Every_Week => "week",
            when Every_Month => "month",
            when Every_Quarter => "quarter",
            when Every_Year => "year");
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           ("every " & No_Space (Positive'Image (Every)) & " "
            & Unit_Text & (if Every = 1 then "" else "s")),
         Key => Humanize.Messages.No_Message);
   end Recurrence;

   function Is_Norwegian (Locale : String) return Boolean is
     (Locale = "no" or else Locale = "nb");

   pragma Style_Checks (Off);

   function Weekday_Name
     (Locale  : String;
      Weekday : Natural)
      return String
   is
   begin
      if Locale = "da" or else Is_Norwegian (Locale) then
         case Weekday is
            when 1 => return "mandag";
            when 2 => return "tirsdag";
            when 3 => return "onsdag";
            when 4 => return "torsdag";
            when 5 => return "fredag";
            when 6 => return "l" & U (16#F8#) & "rdag";
            when 7 => return "s" & U (16#F8#) & "ndag";
            when others => return "";
         end case;
      elsif Locale = "de" then
         case Weekday is
            when 1 => return "Montag";
            when 2 => return "Dienstag";
            when 3 => return "Mittwoch";
            when 4 => return "Donnerstag";
            when 5 => return "Freitag";
            when 6 => return "Samstag";
            when 7 => return "Sonntag";
            when others => return "";
         end case;
      elsif Locale = "fr" then
         case Weekday is
            when 1 => return "lundi";
            when 2 => return "mardi";
            when 3 => return "mercredi";
            when 4 => return "jeudi";
            when 5 => return "vendredi";
            when 6 => return "samedi";
            when 7 => return "dimanche";
            when others => return "";
         end case;
      elsif Locale = "es" then
         case Weekday is
            when 1 => return "lunes";
            when 2 => return "martes";
            when 3 => return "mi" & U (16#E9#) & "rcoles";
            when 4 => return "jueves";
            when 5 => return "viernes";
            when 6 => return "s" & U (16#E1#) & "bado";
            when 7 => return "domingo";
            when others => return "";
         end case;
      elsif Locale = "it" then
         case Weekday is
            when 1 => return "luned" & U (16#EC#);
            when 2 => return "marted" & U (16#EC#);
            when 3 => return "mercoled" & U (16#EC#);
            when 4 => return "gioved" & U (16#EC#);
            when 5 => return "venerd" & U (16#EC#);
            when 6 => return "sabato";
            when 7 => return "domenica";
            when others => return "";
         end case;
      elsif Locale = "pt" then
         case Weekday is
            when 1 => return "segunda-feira";
            when 2 => return "ter" & U (16#E7#) & "a-feira";
            when 3 => return "quarta-feira";
            when 4 => return "quinta-feira";
            when 5 => return "sexta-feira";
            when 6 => return "s" & U (16#E1#) & "bado";
            when 7 => return "domingo";
            when others => return "";
         end case;
      elsif Locale = "nl" then
         case Weekday is
            when 1 => return "maandag";
            when 2 => return "dinsdag";
            when 3 => return "woensdag";
            when 4 => return "donderdag";
            when 5 => return "vrijdag";
            when 6 => return "zaterdag";
            when 7 => return "zondag";
            when others => return "";
         end case;
      elsif Locale = "sv" then
         case Weekday is
            when 1 => return "m" & U (16#E5#) & "ndag";
            when 2 => return "tisdag";
            when 3 => return "onsdag";
            when 4 => return "torsdag";
            when 5 => return "fredag";
            when 6 => return "l" & U (16#F6#) & "rdag";
            when 7 => return "s" & U (16#F6#) & "ndag";
            when others => return "";
         end case;
      elsif Locale = "fi" then
         case Weekday is
            when 1 => return "maanantai";
            when 2 => return "tiistai";
            when 3 => return "keskiviikko";
            when 4 => return "torstai";
            when 5 => return "perjantai";
            when 6 => return "lauantai";
            when 7 => return "sunnuntai";
            when others => return "";
         end case;
      elsif Locale = "pl" then
         case Weekday is
            when 1 => return "poniedzia" & U (16#142#) & "ek";
            when 2 => return "wtorek";
            when 3 => return U (16#15B#) & "roda";
            when 4 => return "czwartek";
            when 5 => return "pi" & U (16#105#) & "tek";
            when 6 => return "sobota";
            when 7 => return "niedziela";
            when others => return "";
         end case;
      elsif Locale = "cs" then
         case Weekday is
            when 1 => return "pond" & U (16#11B#) & "l" & U (16#ED#);
            when 2 => return U (16#FA#) & "ter" & U (16#FD#);
            when 3 => return "st" & U (16#159#) & "eda";
            when 4 => return U (16#10D#) & "tvrtek";
            when 5 => return "p" & U (16#E1#) & "tek";
            when 6 => return "sobota";
            when 7 => return "ned" & U (16#11B#) & "le";
            when others => return "";
         end case;
      elsif Locale = "tr" then
         case Weekday is
            when 1 => return "Pazartesi";
            when 2 => return "Sal" & U (16#131#);
            when 3 => return U (16#C7#) & "ar" & U (16#15F#) & "amba";
            when 4 => return "Per" & U (16#15F#) & "embe";
            when 5 => return "Cuma";
            when 6 => return "Cumartesi";
            when 7 => return "Pazar";
            when others => return "";
         end case;
      elsif Locale = "ru" then
         case Weekday is
            when 1 => return U (16#43F#) & U (16#43E#) & U (16#43D#) & U (16#435#) & U (16#434#) & U (16#435#) & U (16#43B#) & U (16#44C#) & U (16#43D#) & U (16#438#) & U (16#43A#);
            when 2 => return U (16#432#) & U (16#442#) & U (16#43E#) & U (16#440#) & U (16#43D#) & U (16#438#) & U (16#43A#);
            when 3 => return U (16#441#) & U (16#440#) & U (16#435#) & U (16#434#) & U (16#430#);
            when 4 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#432#) & U (16#435#) & U (16#440#) & U (16#433#);
            when 5 => return U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#43D#) & U (16#438#) & U (16#446#) & U (16#430#);
            when 6 => return U (16#441#) & U (16#443#) & U (16#431#) & U (16#431#) & U (16#43E#) & U (16#442#) & U (16#430#);
            when 7 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#43A#) & U (16#440#) & U (16#435#) & U (16#441#) & U (16#435#) & U (16#43D#) & U (16#44C#) & U (16#435#);
            when others => return "";
         end case;
      elsif Locale = "uk" then
         case Weekday is
            when 1 => return U (16#43F#) & U (16#43E#) & U (16#43D#) & U (16#435#) & U (16#434#) & U (16#456#) & U (16#43B#) & U (16#43E#) & U (16#43A#);
            when 2 => return U (16#432#) & U (16#456#) & U (16#432#) & U (16#442#) & U (16#43E#) & U (16#440#) & U (16#43E#) & U (16#43A#);
            when 3 => return U (16#441#) & U (16#435#) & U (16#440#) & U (16#435#) & U (16#434#) & U (16#430#);
            when 4 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#432#) & U (16#435#) & U (16#440#);
            when 5 => return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#43D#) & U (16#438#) & U (16#446#) & U (16#44F#);
            when 6 => return U (16#441#) & U (16#443#) & U (16#431#) & U (16#43E#) & U (16#442#) & U (16#430#);
            when 7 => return U (16#43D#) & U (16#435#) & U (16#434#) & U (16#456#) & U (16#43B#) & U (16#44F#);
            when others => return "";
         end case;
      elsif Locale = "ja" then
         case Weekday is
            when 1 => return U (16#6708#) & U (16#66DC#) & U (16#65E5#);
            when 2 => return U (16#706B#) & U (16#66DC#) & U (16#65E5#);
            when 3 => return U (16#6C34#) & U (16#66DC#) & U (16#65E5#);
            when 4 => return U (16#6728#) & U (16#66DC#) & U (16#65E5#);
            when 5 => return U (16#91D1#) & U (16#66DC#) & U (16#65E5#);
            when 6 => return U (16#571F#) & U (16#66DC#) & U (16#65E5#);
            when 7 => return U (16#65E5#) & U (16#66DC#) & U (16#65E5#);
            when others => return "";
         end case;
      elsif Locale = "ko" then
         case Weekday is
            when 1 => return U (16#C6D4#) & U (16#C694#) & U (16#C77C#);
            when 2 => return U (16#D654#) & U (16#C694#) & U (16#C77C#);
            when 3 => return U (16#C218#) & U (16#C694#) & U (16#C77C#);
            when 4 => return U (16#BAA9#) & U (16#C694#) & U (16#C77C#);
            when 5 => return U (16#AE08#) & U (16#C694#) & U (16#C77C#);
            when 6 => return U (16#D1A0#) & U (16#C694#) & U (16#C77C#);
            when 7 => return U (16#C77C#) & U (16#C694#) & U (16#C77C#);
            when others => return "";
         end case;
      elsif Locale = "zh" then
         case Weekday is
            when 1 => return U (16#661F#) & U (16#671F#) & U (16#4E00#);
            when 2 => return U (16#661F#) & U (16#671F#) & U (16#4E8C#);
            when 3 => return U (16#661F#) & U (16#671F#) & U (16#4E09#);
            when 4 => return U (16#661F#) & U (16#671F#) & U (16#56DB#);
            when 5 => return U (16#661F#) & U (16#671F#) & U (16#4E94#);
            when 6 => return U (16#661F#) & U (16#671F#) & U (16#516D#);
            when 7 => return U (16#661F#) & U (16#671F#) & U (16#65E5#);
            when others => return "";
         end case;
      elsif Locale = "ar" then
         case Weekday is
            when 1 => return U (16#627#) & U (16#644#) & U (16#627#) & U (16#62B#) & U (16#646#) & U (16#64A#) & U (16#646#);
            when 2 => return U (16#627#) & U (16#644#) & U (16#62B#) & U (16#644#) & U (16#627#) & U (16#62B#) & U (16#627#) & U (16#621#);
            when 3 => return U (16#627#) & U (16#644#) & U (16#623#) & U (16#631#) & U (16#628#) & U (16#639#) & U (16#627#) & U (16#621#);
            when 4 => return U (16#627#) & U (16#644#) & U (16#62E#) & U (16#645#) & U (16#64A#) & U (16#633#);
            when 5 => return U (16#627#) & U (16#644#) & U (16#62C#) & U (16#645#) & U (16#639#) & U (16#629#);
            when 6 => return U (16#627#) & U (16#644#) & U (16#633#) & U (16#628#) & U (16#62A#);
            when 7 => return U (16#627#) & U (16#644#) & U (16#623#) & U (16#62D#) & U (16#62F#);
            when others => return "";
         end case;
      elsif Locale = "hi" then
         case Weekday is
            when 1 => return U (16#938#) & U (16#94B#) & U (16#92E#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when 2 => return U (16#92E#) & U (16#902#) & U (16#917#) & U (16#932#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when 3 => return U (16#92C#) & U (16#941#) & U (16#927#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when 4 => return U (16#917#) & U (16#941#) & U (16#930#) & U (16#941#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when 5 => return U (16#936#) & U (16#941#) & U (16#915#) & U (16#94D#) & U (16#930#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when 6 => return U (16#936#) & U (16#928#) & U (16#93F#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when 7 => return U (16#930#) & U (16#935#) & U (16#93F#) & U (16#935#) & U (16#93E#) & U (16#930#);
            when others => return "";
         end case;
      else
         case Weekday is
            when 1 => return "Monday";
            when 2 => return "Tuesday";
            when 3 => return "Wednesday";
            when 4 => return "Thursday";
            when 5 => return "Friday";
            when 6 => return "Saturday";
            when 7 => return "Sunday";
            when others => return "";
         end case;
      end if;
   end Weekday_Name;

   pragma Style_Checks (On);

   function Ordinal_Name
     (Locale  : String;
      Ordinal : Integer)
      return String
   is
   begin
      if Locale = "da" or else Is_Norwegian (Locale) then
         case Ordinal is
            when -1 => return "sidste";
            when 1 => return "f" & U (16#F8#) & "rste";
            when 2 => return "anden";
            when 3 => return "tredje";
            when 4 => return "fjerde";
            when 5 => return "femte";
            when others => return "";
         end case;
      elsif Locale = "de" then
         case Ordinal is
            when -1 => return "letzter";
            when 1 => return "erster";
            when 2 => return "zweiter";
            when 3 => return "dritter";
            when 4 => return "vierter";
            when 5 => return "f" & U (16#FC#) & "nfter";
            when others => return "";
         end case;
      elsif Locale = "fr" then
         case Ordinal is
            when -1 => return "dernier";
            when 1 => return "premier";
            when 2 => return "deuxi" & U (16#E8#) & "me";
            when 3 => return "troisi" & U (16#E8#) & "me";
            when 4 => return "quatri" & U (16#E8#) & "me";
            when 5 => return "cinqui" & U (16#E8#) & "me";
            when others => return "";
         end case;
      elsif Locale = "es" then
         case Ordinal is
            when -1 => return U (16#FA#) & "ltimo";
            when 1 => return "primer";
            when 2 => return "segundo";
            when 3 => return "tercer";
            when 4 => return "cuarto";
            when 5 => return "quinto";
            when others => return "";
         end case;
      elsif Locale = "it" then
         case Ordinal is
            when -1 => return "ultimo";
            when 1 => return "primo";
            when 2 => return "secondo";
            when 3 => return "terzo";
            when 4 => return "quarto";
            when 5 => return "quinto";
            when others => return "";
         end case;
      elsif Locale = "pt" then
         case Ordinal is
            when -1 => return U (16#FA#) & "ltimo";
            when 1 => return "primeiro";
            when 2 => return "segundo";
            when 3 => return "terceiro";
            when 4 => return "quarto";
            when 5 => return "quinto";
            when others => return "";
         end case;
      elsif Locale = "nl" then
         case Ordinal is
            when -1 => return "laatste";
            when 1 => return "eerste";
            when 2 => return "tweede";
            when 3 => return "derde";
            when 4 => return "vierde";
            when 5 => return "vijfde";
            when others => return "";
         end case;
      elsif Locale = "sv" then
         case Ordinal is
            when -1 => return "sista";
            when 1 => return "f" & U (16#F6#) & "rsta";
            when 2 => return "andra";
            when 3 => return "tredje";
            when 4 => return "fj" & U (16#E4#) & "rde";
            when 5 => return "femte";
            when others => return "";
         end case;
      elsif Locale = "fi" then
         case Ordinal is
            when -1 => return "viimeinen";
            when 1 => return "ensimm" & U (16#E4#) & "inen";
            when 2 => return "toinen";
            when 3 => return "kolmas";
            when 4 => return "nelj" & U (16#E4#) & "s";
            when 5 => return "viides";
            when others => return "";
         end case;
      elsif Locale = "pl" then
         case Ordinal is
            when -1 => return "ostatni";
            when 1 => return "pierwszy";
            when 2 => return "drugi";
            when 3 => return "trzeci";
            when 4 => return "czwarty";
            when 5 => return "pi" & U (16#105#) & "ty";
            when others => return "";
         end case;
      elsif Locale = "cs" then
         case Ordinal is
            when -1 => return "posledn" & U (16#ED#);
            when 1 => return "prvn" & U (16#ED#);
            when 2 => return "druh" & U (16#FD#);
            when 3 => return "t" & U (16#159#) & "et" & U (16#ED#);
            when 4 => return U (16#10D#) & "tvrt" & U (16#FD#);
            when 5 => return "p" & U (16#E1#) & "t" & U (16#FD#);
            when others => return "";
         end case;
      elsif Locale = "tr" then
         case Ordinal is
            when -1 => return "son";
            when 1 => return "birinci";
            when 2 => return "ikinci";
            when 3 => return U (16#FC#) & U (16#E7#) & U (16#FC#) & "nc" & U (16#FC#);
            when 4 => return "d" & U (16#F6#) & "rd" & U (16#FC#) & "nc" & U (16#FC#);
            when 5 => return "be" & U (16#15F#) & "inci";
            when others => return "";
         end case;
      elsif Locale = "ja" or else Locale = "zh" then
         if Ordinal = -1 then
            return U (16#6700#) & U (16#5F8C#);
         elsif Ordinal in 1 .. 5 then
            return U (16#7B2C#) & No_Space (Integer'Image (Ordinal));
         else
            return "";
         end if;
      elsif Locale = "ko" then
         if Ordinal = -1 then
            return U (16#B9C8#) & U (16#C9C0#) & U (16#B9C9#);
         elsif Ordinal in 1 .. 5 then
            return No_Space (Integer'Image (Ordinal)) & U (16#BC88#) & U (16#C9F8#);
         else
            return "";
         end if;
      elsif Locale = "ar" then
         case Ordinal is
            when -1 => return U (16#627#) & U (16#644#) & U (16#623#) & U (16#62E#) & U (16#64A#) & U (16#631#);
            when 1 => return U (16#627#) & U (16#644#) & U (16#623#) & U (16#648#) & U (16#644#);
            when 2 => return U (16#627#) & U (16#644#) & U (16#62B#) & U (16#627#) & U (16#646#) & U (16#64A#);
            when 3 => return U (16#627#) & U (16#644#) & U (16#62B#) & U (16#627#) & U (16#644#) & U (16#62B#);
            when 4 => return U (16#627#) & U (16#644#) & U (16#631#) & U (16#627#) & U (16#628#) & U (16#639#);
            when 5 => return U (16#627#) & U (16#644#) & U (16#62E#) & U (16#627#) & U (16#645#) & U (16#633#);
            when others => return "";
         end case;
      elsif Locale = "hi" then
         case Ordinal is
            when -1 => return U (16#905#) & U (16#902#) & U (16#924#) & U (16#93F#) & U (16#92E#);
            when 1 => return U (16#92A#) & U (16#939#) & U (16#932#) & U (16#93E#);
            when 2 => return U (16#926#) & U (16#942#) & U (16#938#) & U (16#930#) & U (16#93E#);
            when 3 => return U (16#924#) & U (16#940#) & U (16#938#) & U (16#930#) & U (16#93E#);
            when 4 => return U (16#91A#) & U (16#94C#) & U (16#925#) & U (16#93E#);
            when 5 =>
               return U (16#92A#) & U (16#93E#) & U (16#901#)
                 & U (16#91A#) & U (16#935#) & U (16#93E#)
                 & U (16#901#);
            when others => return "";
         end case;
      end if;

      case Ordinal is
         when -1 => return "last";
         when 1 => return "first";
         when 2 => return "second";
         when 3 => return "third";
         when 4 => return "fourth";
         when 5 => return "fifth";
         when others => return "";
      end case;
   end Ordinal_Name;

   function Time_Label
     (Hour        : Natural;
      Minute      : Natural;
      Use_12_Hour : Boolean)
      return String
   is
   begin
      if Use_12_Hour then
         declare
            PM : constant Boolean := Hour >= 12;
            H  : constant Natural :=
              (if Hour mod 12 = 0 then 12 else Hour mod 12);
         begin
            return No_Space (Natural'Image (H)) & ":" & Two_Digits (Minute)
              & (if PM then " PM" else " AM");
         end;
      end if;

      return Two_Digits (Hour) & ":" & Two_Digits (Minute);
   end Time_Label;

   function Every_Phrase
     (Locale : String;
      Label  : String)
      return String
   is
   begin
      if Locale = "da" then
         return "hver " & Label;
      elsif Locale = "de" then
         return "jeden " & Label;
      elsif Locale = "fr" then
         return "chaque " & Label;
      elsif Locale = "es" or else Locale = "pt" then
         return "cada " & Label;
      elsif Locale = "it" then
         return "ogni " & Label;
      elsif Locale = "nl" then
         return "elke " & Label;
      elsif Locale = "sv" then
         return "varje " & Label;
      elsif Is_Norwegian (Locale) then
         return "hver " & Label;
      elsif Locale = "fi" then
         return "joka " & Label;
      elsif Locale = "pl" then
         return "ka" & U (16#17C#) & "dy " & Label;
      elsif Locale = "cs" then
         return "ka" & U (16#17E#) & "d" & U (16#FD#) & " " & Label;
      elsif Locale = "tr" then
         return "her " & Label;
      elsif Locale = "ro" then
         return "fiecare " & Label;
      elsif Locale = "lt" then
         return "kiekviena " & Label;
      elsif Locale = "sl" then
         return "vsak " & Label;
      elsif Locale = "id" or else Locale = "ms" then
         return "setiap " & Label;
      elsif Locale = "eo" then
         return "cxiu " & Label;
      elsif Locale = "vi" then
         return "moi " & Label;
      elsif Locale = "sw" then
         return "kila " & Label;
      elsif Locale = "af" then
         return "elke " & Label;
      elsif Locale = "hu" then
         return "minden " & Label;
      elsif Locale = "sk" then
         return "kazdy " & Label;
      elsif Locale = "ru" then
         return U (16#43A#) & U (16#430#) & U (16#436#) & U (16#434#) & U (16#44B#) & U (16#439#) & " " & Label;
      elsif Locale = "uk" then
         return U (16#43A#) & U (16#43E#) & U (16#436#) & U (16#435#) & U (16#43D#) & " " & Label;
      elsif Locale = "ja" or else Locale = "zh" then
         return U (16#6BCE#) & Label;
      elsif Locale = "ko" then
         return U (16#B9E4#) & U (16#C8FC#) & " " & Label;
      elsif Locale = "ar" then
         return U (16#643#) & U (16#644#) & " " & Label;
      elsif Locale = "hi" then
         return U (16#939#) & U (16#930#) & " " & Label;
      else
         return "every " & Label;
      end if;
   end Every_Phrase;

   function Schedule_Conjunction (Locale : String) return String is
   begin
      if Locale = "da" or else Is_Norwegian (Locale) then
         return "og";
      elsif Locale = "de" or else Locale = "nl" then
         return "und";
      elsif Locale = "fr" then
         return "et";
      elsif Locale = "es" then
         return "y";
      elsif Locale = "it" then
         return "e";
      elsif Locale = "pt" then
         return "e";
      elsif Locale = "sv" then
         return "och";
      elsif Locale = "fi" then
         return "ja";
      elsif Locale = "pl" then
         return "i";
      elsif Locale = "cs" then
         return "a";
      elsif Locale = "tr" then
         return "ve";
      elsif Locale = "ro" then
         return "si";
      elsif Locale = "lt" then
         return "ir";
      elsif Locale = "sl" then
         return "in";
      elsif Locale = "id" or else Locale = "ms" then
         return "dan";
      elsif Locale = "eo" then
         return "kaj";
      elsif Locale = "vi" then
         return "va";
      elsif Locale = "sw" then
         return "na";
      elsif Locale = "af" then
         return "en";
      elsif Locale = "hu" then
         return "es";
      elsif Locale = "sk" then
         return "a";
      elsif Locale = "ru" then
         return U (16#438#);
      elsif Locale = "uk" then
         return U (16#456#);
      elsif Locale = "ja" or else Locale = "zh" then
         return U (16#3068#);
      elsif Locale = "ko" then
         return U (16#BC0F#);
      elsif Locale = "ar" then
         return U (16#648#);
      elsif Locale = "hi" then
         return U (16#914#) & U (16#930#);
      else
         return "and";
      end if;
   end Schedule_Conjunction;

   function Business_Day_Label (Locale : String) return String is
   begin
      if Locale = "da" then
         return "hverdag";
      elsif Locale = "de" then
         return "Wochentag";
      elsif Locale = "fr" then
         return "jour ouvrable";
      elsif Locale = "es" then
         return "d" & U (16#ED#) & "a laborable";
      elsif Locale = "it" then
         return "giorno feriale";
      elsif Locale = "pt" then
         return "dia " & U (16#FA#) & "til";
      elsif Locale = "nl" then
         return "werkdag";
      elsif Locale = "sv" then
         return "vardag";
      elsif Is_Norwegian (Locale) then
         return "virkedag";
      elsif Locale = "fi" then
         return "arkip" & U (16#E4#) & "iv" & U (16#E4#);
      elsif Locale = "pl" then
         return "dzie" & U (16#144#) & " roboczy";
      elsif Locale = "cs" then
         return "pracovn" & U (16#ED#) & " den";
      elsif Locale = "tr" then
         return "i" & U (16#15F#) & " g" & U (16#FC#) & "n"
           & U (16#FC#);
      elsif Locale = "ro" then
         return "zi lucratoare";
      elsif Locale = "lt" then
         return "darbo diena";
      elsif Locale = "sl" then
         return "delovni dan";
      elsif Locale = "id" or else Locale = "ms" then
         return "hari kerja";
      elsif Locale = "eo" then
         return "labortago";
      elsif Locale = "vi" then
         return "ngay lam viec";
      elsif Locale = "sw" then
         return "siku ya kazi";
      elsif Locale = "af" then
         return "werksdag";
      elsif Locale = "hu" then
         return "munkanap";
      elsif Locale = "sk" then
         return "pracovny den";
      elsif Locale = "ru" then
         return U (16#440#) & U (16#430#) & U (16#431#)
           & U (16#43E#) & U (16#447#) & U (16#438#)
           & U (16#439#) & " " & U (16#434#) & U (16#435#)
           & U (16#43D#) & U (16#44C#);
      elsif Locale = "uk" then
         return U (16#440#) & U (16#43E#) & U (16#431#)
           & U (16#43E#) & U (16#447#) & U (16#438#)
           & U (16#439#) & " " & U (16#434#) & U (16#435#)
           & U (16#43D#) & U (16#44C#);
      elsif Locale = "ja" then
         return U (16#55B6#) & U (16#696D#) & U (16#65E5#);
      elsif Locale = "ko" then
         return U (16#C601#) & U (16#C5C5#) & U (16#C77C#);
      elsif Locale = "zh" then
         return U (16#5DE5#) & U (16#4F5C#) & U (16#65E5#);
      elsif Locale = "ar" then
         return U (16#64A#) & U (16#648#) & U (16#645#) & " " & U (16#639#) & U (16#645#) & U (16#644#);
      elsif Locale = "hi" then
         return U (16#915#) & U (16#93E#) & U (16#930#)
           & U (16#94D#) & U (16#92F#) & U (16#926#)
           & U (16#93F#) & U (16#935#) & U (16#938#);
      else
         return "business day";
      end if;
   end Business_Day_Label;

   pragma Style_Checks (Off);

   function Schedule_Unit_Name
     (Locale : String;
      Unit   : Recurrence_Unit;
      Count  : Positive)
      return String
   is
      pragma Unreferenced (Count);
   begin
      if Locale = "da" then
         case Unit is
            when Every_Second => return "sekund";
            when Every_Minute => return "minut";
            when Every_Hour => return "time";
            when Every_Day => return "dag";
            when Every_Week => return "uge";
            when Every_Month => return "m" & U (16#E5#) & "ned";
            when Every_Quarter => return "kvartal";
            when Every_Year => return U (16#E5#) & "r";
         end case;
      elsif Locale = "de" then
         case Unit is
            when Every_Second => return "Sekunde";
            when Every_Minute => return "Minute";
            when Every_Hour => return "Stunde";
            when Every_Day => return "Tag";
            when Every_Week => return "Woche";
            when Every_Month => return "Monat";
            when Every_Quarter => return "Quartal";
            when Every_Year => return "Jahr";
         end case;
      elsif Locale = "fr" then
         case Unit is
            when Every_Second => return "seconde";
            when Every_Minute => return "minute";
            when Every_Hour => return "heure";
            when Every_Day => return "jour";
            when Every_Week => return "semaine";
            when Every_Month => return "mois";
            when Every_Quarter => return "trimestre";
            when Every_Year => return "an";
         end case;
      elsif Locale = "es" then
         case Unit is
            when Every_Second => return "segundo";
            when Every_Minute => return "minuto";
            when Every_Hour => return "hora";
            when Every_Day => return "d" & U (16#ED#) & "a";
            when Every_Week => return "semana";
            when Every_Month => return "mes";
            when Every_Quarter => return "trimestre";
            when Every_Year => return "a" & U (16#F1#) & "o";
         end case;
      elsif Locale = "it" then
         case Unit is
            when Every_Second => return "secondo";
            when Every_Minute => return "minuto";
            when Every_Hour => return "ora";
            when Every_Day => return "giorno";
            when Every_Week => return "settimana";
            when Every_Month => return "mese";
            when Every_Quarter => return "trimestre";
            when Every_Year => return "anno";
         end case;
      elsif Locale = "pt" then
         case Unit is
            when Every_Second => return "segundo";
            when Every_Minute => return "minuto";
            when Every_Hour => return "hora";
            when Every_Day => return "dia";
            when Every_Week => return "semana";
            when Every_Month => return "m" & U (16#EA#) & "s";
            when Every_Quarter => return "trimestre";
            when Every_Year => return "ano";
         end case;
      elsif Locale = "nl" then
         case Unit is
            when Every_Second => return "seconde";
            when Every_Minute => return "minuut";
            when Every_Hour => return "uur";
            when Every_Day => return "dag";
            when Every_Week => return "week";
            when Every_Month => return "maand";
            when Every_Quarter => return "kwartaal";
            when Every_Year => return "jaar";
         end case;
      elsif Locale = "sv" or else Is_Norwegian (Locale) then
         case Unit is
            when Every_Second => return "sekund";
            when Every_Minute => return "minut";
            when Every_Hour => return "time";
            when Every_Day => return "dag";
            when Every_Week => return "uke";
            when Every_Month => return "m" & U (16#E5#) & "ned";
            when Every_Quarter => return "kvartal";
            when Every_Year => return U (16#E5#) & "r";
         end case;
      elsif Locale = "fi" then
         case Unit is
            when Every_Second => return "sekunti";
            when Every_Minute => return "minuutti";
            when Every_Hour => return "tunti";
            when Every_Day => return "p" & U (16#E4#) & "iv" & U (16#E4#);
            when Every_Week => return "viikko";
            when Every_Month => return "kuukausi";
            when Every_Quarter => return "nelj" & U (16#E4#) & "nnes";
            when Every_Year => return "vuosi";
         end case;
      elsif Locale = "pl" then
         case Unit is
            when Every_Second => return "sekunda";
            when Every_Minute => return "minuta";
            when Every_Hour => return "godzina";
            when Every_Day => return "dzie" & U (16#144#);
            when Every_Week => return "tydzie" & U (16#144#);
            when Every_Month => return "miesi" & U (16#105#) & "c";
            when Every_Quarter => return "kwarta" & U (16#142#);
            when Every_Year => return "rok";
         end case;
      elsif Locale = "cs" then
         case Unit is
            when Every_Second => return "sekunda";
            when Every_Minute => return "minuta";
            when Every_Hour => return "hodina";
            when Every_Day => return "den";
            when Every_Week => return "t" & U (16#FD#) & "den";
            when Every_Month => return "m" & U (16#11B#) & "s" & U (16#ED#) & "c";
            when Every_Quarter => return U (16#10D#) & "tvrtlet" & U (16#ED#);
            when Every_Year => return "rok";
         end case;
      elsif Locale = "tr" then
         case Unit is
            when Every_Second => return "saniye";
            when Every_Minute => return "dakika";
            when Every_Hour => return "saat";
            when Every_Day => return "g" & U (16#FC#) & "n";
            when Every_Week => return "hafta";
            when Every_Month => return "ay";
            when Every_Quarter => return U (16#E7#) & "eyrek";
            when Every_Year => return "y" & U (16#131#) & "l";
         end case;
      elsif Locale = "ru" then
         case Unit is
            when Every_Second => return U (16#441#) & U (16#435#) & U (16#43A#) & U (16#443#) & U (16#43D#) & U (16#434#) & U (16#430#);
            when Every_Minute => return U (16#43C#) & U (16#438#) & U (16#43D#) & U (16#443#) & U (16#442#) & U (16#430#);
            when Every_Hour => return U (16#447#) & U (16#430#) & U (16#441#);
            when Every_Day => return U (16#434#) & U (16#435#) & U (16#43D#) & U (16#44C#);
            when Every_Week => return U (16#43D#) & U (16#435#) & U (16#434#) & U (16#435#) & U (16#43B#) & U (16#44F#);
            when Every_Month => return U (16#43C#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#446#);
            when Every_Quarter => return U (16#43A#) & U (16#432#) & U (16#430#) & U (16#440#) & U (16#442#) & U (16#430#) & U (16#43B#);
            when Every_Year => return U (16#433#) & U (16#43E#) & U (16#434#);
         end case;
      elsif Locale = "uk" then
         case Unit is
            when Every_Second => return U (16#441#) & U (16#435#) & U (16#43A#) & U (16#443#) & U (16#43D#) & U (16#434#) & U (16#430#);
            when Every_Minute => return U (16#445#) & U (16#432#) & U (16#438#) & U (16#43B#) & U (16#438#) & U (16#43D#) & U (16#430#);
            when Every_Hour => return U (16#433#) & U (16#43E#) & U (16#434#) & U (16#438#) & U (16#43D#) & U (16#430#);
            when Every_Day => return U (16#434#) & U (16#435#) & U (16#43D#) & U (16#44C#);
            when Every_Week => return U (16#442#) & U (16#438#) & U (16#436#) & U (16#434#) & U (16#435#) & U (16#43D#) & U (16#44C#);
            when Every_Month => return U (16#43C#) & U (16#456#) & U (16#441#) & U (16#44F#) & U (16#446#) & U (16#44C#);
            when Every_Quarter => return U (16#43A#) & U (16#432#) & U (16#430#) & U (16#440#) & U (16#442#) & U (16#430#) & U (16#43B#);
            when Every_Year => return U (16#440#) & U (16#456#) & U (16#43A#);
         end case;
      elsif Locale = "ja" then
         case Unit is
            when Every_Second => return U (16#79D2#);
            when Every_Minute => return U (16#5206#);
            when Every_Hour => return U (16#6642#) & U (16#9593#);
            when Every_Day => return U (16#65E5#);
            when Every_Week => return U (16#9031#);
            when Every_Month => return U (16#6708#);
            when Every_Quarter => return U (16#56DB#) & U (16#534A#) & U (16#671F#);
            when Every_Year => return U (16#5E74#);
         end case;
      elsif Locale = "ko" then
         case Unit is
            when Every_Second => return U (16#CD08#);
            when Every_Minute => return U (16#BD84#);
            when Every_Hour => return U (16#C2DC#) & U (16#AC04#);
            when Every_Day => return U (16#C77C#);
            when Every_Week => return U (16#C8FC#);
            when Every_Month => return U (16#C6D4#);
            when Every_Quarter => return U (16#BD84#) & U (16#AE30#);
            when Every_Year => return U (16#B144#);
         end case;
      elsif Locale = "zh" then
         case Unit is
            when Every_Second => return U (16#79D2#);
            when Every_Minute => return U (16#5206#) & U (16#949F#);
            when Every_Hour => return U (16#5C0F#) & U (16#65F6#);
            when Every_Day => return U (16#5929#);
            when Every_Week => return U (16#5468#);
            when Every_Month => return U (16#6708#);
            when Every_Quarter => return U (16#5B63#) & U (16#5EA6#);
            when Every_Year => return U (16#5E74#);
         end case;
      elsif Locale = "ar" then
         case Unit is
            when Every_Second => return U (16#62B#) & U (16#627#) & U (16#646#) & U (16#64A#) & U (16#629#);
            when Every_Minute => return U (16#62F#) & U (16#642#) & U (16#64A#) & U (16#642#) & U (16#629#);
            when Every_Hour => return U (16#633#) & U (16#627#) & U (16#639#) & U (16#629#);
            when Every_Day => return U (16#64A#) & U (16#648#) & U (16#645#);
            when Every_Week => return U (16#623#) & U (16#633#) & U (16#628#) & U (16#648#) & U (16#639#);
            when Every_Month => return U (16#634#) & U (16#647#) & U (16#631#);
            when Every_Quarter => return U (16#631#) & U (16#628#) & U (16#639#);
            when Every_Year => return U (16#633#) & U (16#646#) & U (16#629#);
         end case;
      elsif Locale = "hi" then
         case Unit is
            when Every_Second => return U (16#938#) & U (16#947#) & U (16#915#) & U (16#902#) & U (16#921#);
            when Every_Minute => return U (16#92E#) & U (16#93F#) & U (16#928#) & U (16#91F#);
            when Every_Hour => return U (16#918#) & U (16#902#) & U (16#91F#) & U (16#93E#);
            when Every_Day => return U (16#926#) & U (16#93F#) & U (16#928#);
            when Every_Week => return U (16#938#) & U (16#92A#) & U (16#94D#) & U (16#924#) & U (16#93E#) & U (16#939#);
            when Every_Month => return U (16#92E#) & U (16#939#) & U (16#940#) & U (16#928#) & U (16#93E#);
            when Every_Quarter => return U (16#924#) & U (16#93F#) & U (16#92E#) & U (16#93E#) & U (16#939#) & U (16#940#);
            when Every_Year => return U (16#935#) & U (16#930#) & U (16#94D#) & U (16#937#);
         end case;
      else
         case Unit is
            when Every_Second => return "second";
            when Every_Minute => return "minute";
            when Every_Hour => return "hour";
            when Every_Day => return "day";
            when Every_Week => return "week";
            when Every_Month => return "month";
            when Every_Quarter => return "quarter";
            when Every_Year => return "year";
         end case;
      end if;
   end Schedule_Unit_Name;

   pragma Style_Checks (On);

   function Weekday_Set_Label
     (Locale : String;
      Set    : Weekday_Set)
      return String
   is
      Count : Natural := 0;
      Last  : Natural := 0;
      Text  : Unbounded_String;
   begin
      if Set = Weekdays then
         if Locale = "en" then
            return "weekday";
         else
            return Business_Day_Label (Locale);
         end if;
      elsif Set = Weekends then
         if Locale = "da" or else Locale = "de" or else Locale = "nl" then
            return "weekend";
         elsif Locale = "fr" then
            return "week-end";
         elsif Locale = "es" then
            return "fin de semana";
         elsif Locale = "it" then
            return "fine settimana";
         elsif Locale = "pt" then
            return "fim de semana";
         elsif Locale = "sv" then
            return "helg";
         elsif Is_Norwegian (Locale) then
            return "helg";
         elsif Locale = "fi" then
            return "viikonloppu";
         elsif Locale = "tr" then
            return "hafta sonu";
         else
            return "weekend";
         end if;
      elsif Set = Every_Day_Set then
         if Locale = "da" then
            return "dag";
         elsif Locale = "de" then
            return "Tag";
         elsif Locale = "fr" then
            return "jour";
         elsif Locale = "es" then
            return "d" & U (16#ED#) & "a";
         elsif Locale = "it" then
            return "giorno";
         elsif Locale = "pt" then
            return "dia";
         elsif Locale = "nl" then
            return "dag";
         elsif Locale = "sv" then
            return "dag";
         elsif Is_Norwegian (Locale) then
            return "dag";
         elsif Locale = "fi" then
            return "p" & U (16#E4#) & "iv" & U (16#E4#);
         elsif Locale = "tr" then
            return "g" & U (16#FC#) & "n";
         else
            return "day";
         end if;
      end if;

      for Day in Set'Range loop
         if Set (Day) then
            Count := Count + 1;
            Last := Day;
         end if;
      end loop;

      if Count = 0 then
         return "";
      elsif Count = 1 then
         return Weekday_Name (Locale, Last);
      end if;

      for Day in Set'Range loop
         if Set (Day) then
            if Length (Text) > 0 then
               if Count = 1 then
                  Append (Text, " " & Schedule_Conjunction (Locale) & " ");
               else
                  Append (Text, ", ");
               end if;
            end if;
            Append (Text, Weekday_Name (Locale, Day));
            Count := Count - 1;
         end if;
      end loop;

      return To_String (Text);
   end Weekday_Set_Label;

   function With_Time (Base : String; Options : Schedule_Options) return String is
   begin
      if Options.Has_Time then
         return Base & " at "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      else
         return Base;
      end if;
   end With_Time;

   function With_Time
     (Locale  : String;
      Base    : String;
      Options : Schedule_Options)
      return String
   is
   begin
      if not Options.Has_Time then
         return Base;
      elsif Locale = "da" then
         return Base & " kl. "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "de" then
         return Base & " um "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "fr" then
         return Base & " " & U (16#E0#) & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "es" then
         return Base & " a las "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "it" then
         return Base & " alle "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "pt" then
         return Base & " " & U (16#E0#) & "s "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "nl" then
         return Base & " om "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "sv" or else Is_Norwegian (Locale) then
         return Base & " kl. "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "fi" then
         return Base & " klo "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "pl" or else Locale = "cs" then
         return Base & " o "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "tr" then
         return Base & " saat "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "ro" then
         return Base & " la "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "lt" then
         return Base & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "sl" then
         return Base & " ob "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "id" or else Locale = "ms" then
         return Base & " pukul "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "eo" then
         return Base & " je "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "vi" then
         return Base & " luc "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "sw" then
         return Base & " saa "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "af" then
         return Base & " om "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "hu" then
         return Base & " ekkor: "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "sk" then
         return Base & " o "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "ru" then
         return Base & " " & U (16#432#) & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "uk" then
         return Base & " " & U (16#43E#) & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "ja" or else Locale = "zh" then
         return Base & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "ko" then
         return Base & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "ar" then
         return Base & " " & U (16#639#) & U (16#646#) & U (16#62F#) & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "hi" then
         return Base & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      else
         return Base & " at "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      end if;
   end With_Time;

   function Schedule_Interval_Label
     (Locale : String;
      Every  : Positive;
      Unit   : Recurrence_Unit)
      return String
   is
      Unit_Text : constant String := Schedule_Unit_Name (Locale, Unit, Every);
   begin
      if Locale = "da" then
         return
           (if Every = 1 then "hver " & Unit_Text
            else "hver " & No_Space (Positive'Image (Every)) & ". "
              & Unit_Text);
      elsif Locale = "de" then
         return
           (if Every = 1 then "jeden " & Unit_Text
            else "alle " & No_Space (Positive'Image (Every)) & " "
              & Unit_Text & "n");
      elsif Locale = "fr" then
         return
           (if Every = 1 then "chaque " & Unit_Text
            else "toutes les " & No_Space (Positive'Image (Every)) & " "
              & Unit_Text & "s");
      elsif Locale = "en" then
         if Every = 1 then
            return "every " & Unit_Text;
         else
            return "every " & No_Space (Positive'Image (Every)) & " "
              & Unit_Text & "s";
         end if;
      elsif Every = 1 then
         return Every_Phrase (Locale, Unit_Text);
      else
         return Every_Phrase
           (Locale, No_Space (Positive'Image (Every)) & " " & Unit_Text);
      end if;
   end Schedule_Interval_Label;

   function Weekly_On_Label
     (Locale : String;
      Every  : Positive;
      Label  : String)
      return String
   is
      Count : constant String := No_Space (Positive'Image (Every));
   begin
      if Every = 1 then
         return Every_Phrase (Locale, Label);
      elsif Locale = "da" then
         return "hver " & Count & ". uge pa " & Label;
      elsif Locale = "de" then
         return "alle " & Count & " Wochen an " & Label;
      elsif Locale = "fr" then
         return "toutes les " & Count & " semaines le " & Label;
      elsif Locale = "es" then
         return "cada " & Count & " semanas el " & Label;
      elsif Locale = "it" then
         return "ogni " & Count & " settimane il " & Label;
      elsif Locale = "pt" then
         return "a cada " & Count & " semanas em " & Label;
      elsif Locale = "nl" then
         return "elke " & Count & " weken op " & Label;
      elsif Locale = "en" then
         return "every " & Count & " weeks on " & Label;
      else
         return "every " & Count & " weeks on " & Label;
      end if;
   end Weekly_On_Label;

   function Valid_Schedule_Time
     (Has_Time : Boolean;
      Hour     : Natural;
      Minute   : Natural)
      return Boolean is
     ((not Has_Time) or else (Hour <= 23 and then Minute <= 59));

   function Ordinal_Weekday_Monthly_Label
     (Locale  : String;
      Ordinal : Integer;
      Weekday : Natural)
      return String
   is
      Ordinal_Text : constant String := Ordinal_Name (Locale, Ordinal);
      Weekday_Text : constant String := Weekday_Name (Locale, Weekday);
   begin
      if Ordinal_Text'Length = 0 or else Weekday_Text'Length = 0 then
         return "";
      elsif Locale = "da" then
         return Ordinal_Text & " " & Weekday_Text & " hver m"
           & U (16#E5#) & "ned";
      elsif Locale = "de" then
         return Ordinal_Text & " " & Weekday_Text & " jedes Monats";
      elsif Locale = "fr" then
         return Ordinal_Text & " " & Weekday_Text & " de chaque mois";
      elsif Locale = "es" then
         return Ordinal_Text & " " & Weekday_Text & " de cada mes";
      elsif Locale = "it" then
         return Ordinal_Text & " " & Weekday_Text & " di ogni mese";
      elsif Locale = "pt" then
         return Ordinal_Text & " " & Weekday_Text & " de cada m"
           & U (16#EA#) & "s";
      elsif Locale = "nl" then
         return Ordinal_Text & " " & Weekday_Text & " van elke maand";
      elsif Locale = "sv" then
         return Ordinal_Text & " " & Weekday_Text & " varje m"
           & U (16#E5#) & "nad";
      elsif Is_Norwegian (Locale) then
         return Ordinal_Text & " " & Weekday_Text & " hver m" & U (16#E5#) & "ned";
      elsif Locale = "fi" then
         return Ordinal_Text & " " & Weekday_Text & " joka kuukausi";
      elsif Locale = "pl" then
         return Ordinal_Text & " " & Weekday_Text & " ka" & U (16#17C#)
           & "dego miesi" & U (16#105#) & "ca";
      elsif Locale = "cs" then
         return Ordinal_Text & " " & Weekday_Text & " ka" & U (16#17E#)
           & "d" & U (16#FD#) & " m" & U (16#11B#) & "s"
           & U (16#ED#) & "c";
      elsif Locale = "tr" then
         return "her ay" & U (16#131#) & "n " & Ordinal_Text
           & " " & Weekday_Text;
      elsif Locale = "ro" then
         return Ordinal_Text & " " & Weekday_Text & " in fiecare luna";
      elsif Locale = "lt" then
         return Ordinal_Text & " " & Weekday_Text & " kiekviena menesi";
      elsif Locale = "sl" then
         return Ordinal_Text & " " & Weekday_Text & " vsak mesec";
      elsif Locale = "id" or else Locale = "ms" then
         return Ordinal_Text & " " & Weekday_Text & " setiap bulan";
      elsif Locale = "eo" then
         return Ordinal_Text & " " & Weekday_Text & " cxiumonate";
      elsif Locale = "vi" then
         return Ordinal_Text & " " & Weekday_Text & " moi thang";
      elsif Locale = "sw" then
         return Ordinal_Text & " " & Weekday_Text & " kila mwezi";
      elsif Locale = "af" then
         return Ordinal_Text & " " & Weekday_Text & " elke maand";
      elsif Locale = "hu" then
         return "minden honap " & Ordinal_Text & " " & Weekday_Text;
      elsif Locale = "sk" then
         return Ordinal_Text & " " & Weekday_Text & " kazdy mesiac";
      elsif Locale = "ru" then
         return Ordinal_Text & " " & Weekday_Text & " "
           & U (16#43A#) & U (16#430#) & U (16#436#)
           & U (16#434#) & U (16#43E#) & U (16#433#)
           & U (16#43E#) & " " & U (16#43C#) & U (16#435#)
           & U (16#441#) & U (16#44F#) & U (16#446#)
           & U (16#430#);
      elsif Locale = "uk" then
         return Ordinal_Text & " " & Weekday_Text & " "
           & U (16#43A#) & U (16#43E#) & U (16#436#)
           & U (16#43D#) & U (16#43E#) & U (16#433#)
           & U (16#43E#) & " " & U (16#43C#) & U (16#456#)
           & U (16#441#) & U (16#44F#) & U (16#446#)
           & U (16#44F#);
      elsif Locale = "ja" then
         return U (16#6BCE#) & U (16#6708#) & U (16#306E#)
           & Ordinal_Text & Weekday_Text;
      elsif Locale = "ko" then
         return U (16#B9E4#) & U (16#B2EC#) & " " & Ordinal_Text
           & " " & Weekday_Text;
      elsif Locale = "zh" then
         return U (16#6BCF#) & U (16#6708#) & Ordinal_Text & Weekday_Text;
      elsif Locale = "ar" then
         return Ordinal_Text & " " & Weekday_Text & " " & U (16#645#)
           & U (16#646#) & " " & U (16#643#) & U (16#644#) & " "
           & U (16#634#) & U (16#647#) & U (16#631#);
      elsif Locale = "hi" then
         return U (16#939#) & U (16#930#) & " " & U (16#92E#)
           & U (16#939#) & U (16#940#) & U (16#928#) & U (16#947#)
           & " " & Ordinal_Text & " " & Weekday_Text;
      else
         return Ordinal_Text & " " & Weekday_Text & " of each month";
      end if;
   end Ordinal_Weekday_Monthly_Label;

   function Business_Day_Schedule_Label
     (Locale  : String;
      Ordinal : Integer)
      return String
   is
      Label : constant String := Business_Day_Label (Locale);
      Last  : constant String := Ordinal_Name (Locale, -1);
      Ordinal_Text : constant String := Ordinal_Name (Locale, Ordinal);
   begin
      if Ordinal = -1 then
         if Locale = "da" then
            return Last & " " & Label & " hver m" & U (16#E5#) & "ned";
         elsif Locale = "de" then
            return Last & " " & Label & " jedes Monats";
         elsif Locale = "fr" then
            return Last & " " & Label & " de chaque mois";
         elsif Locale = "es" then
            return U (16#FA#) & "ltimo " & Label & " de cada mes";
         elsif Locale = "it" then
            return "ultimo " & Label & " di ogni mese";
         elsif Locale = "pt" then
            return U (16#FA#) & "ltimo " & Label & " de cada m"
              & U (16#EA#) & "s";
         elsif Locale = "nl" then
            return "laatste " & Label & " van elke maand";
         elsif Locale = "sv" then
            return "sista " & Label & " varje m" & U (16#E5#) & "nad";
         elsif Is_Norwegian (Locale) then
            return "siste " & Label & " hver m" & U (16#E5#) & "ned";
         elsif Locale = "fi" then
            return "viimeinen " & Label & " joka kuukausi";
         elsif Locale = "pl" then
            return "ostatni " & Label & " ka" & U (16#17C#)
              & "dego miesi" & U (16#105#) & "ca";
         elsif Locale = "cs" then
            return "posledn" & U (16#ED#) & " " & Label & " ka"
              & U (16#17E#) & "d" & U (16#FD#) & " m"
              & U (16#11B#) & "s" & U (16#ED#) & "c";
         elsif Locale = "tr" then
            return "her ay" & U (16#131#) & "n son " & Label;
         elsif Locale = "ro" then
            return "ultima " & Label & " din fiecare luna";
         elsif Locale = "lt" then
            return "paskutine " & Label & " kiekviena menesi";
         elsif Locale = "sl" then
            return "zadnji " & Label & " vsak mesec";
         elsif Locale = "id" or else Locale = "ms" then
            return "hari kerja terakhir setiap bulan";
         elsif Locale = "eo" then
            return "lasta " & Label & " cxiumonate";
         elsif Locale = "vi" then
            return Label & " cuoi moi thang";
         elsif Locale = "sw" then
            return Label & " ya mwisho kila mwezi";
         elsif Locale = "af" then
            return "laaste " & Label & " elke maand";
         elsif Locale = "hu" then
            return "minden honap utolso " & Label & "ja";
         elsif Locale = "sk" then
            return "posledny " & Label & " kazdy mesiac";
         elsif Locale = "ja" then
            return U (16#6BCE#) & U (16#6708#) & U (16#6700#)
              & U (16#5F8C#) & U (16#306E#) & Label;
         elsif Locale = "ko" then
            return U (16#B9E4#) & U (16#B2EC#) & " "
              & U (16#B9C8#) & U (16#C9C0#) & U (16#B9C9#)
              & " " & Label;
         elsif Locale = "zh" then
            return U (16#6BCF#) & U (16#6708#) & U (16#6700#)
              & U (16#540E#) & U (16#4E00#) & U (16#4E2A#)
              & Label;
         elsif Locale = "ar" then
            return U (16#622#) & U (16#62E#) & U (16#631#)
              & " " & Label & " " & U (16#641#) & U (16#64A#)
              & " " & U (16#643#) & U (16#644#) & " "
              & U (16#634#) & U (16#647#) & U (16#631#);
         elsif Locale = "hi" then
            return U (16#939#) & U (16#930#) & " " & U (16#92E#)
              & U (16#939#) & U (16#940#) & U (16#928#)
              & U (16#947#) & " " & U (16#905#) & U (16#902#)
              & U (16#924#) & U (16#93F#) & U (16#92E#)
              & " " & Label;
         else
            return "last " & Label & " of each month";
         end if;
      elsif Ordinal in 1 .. 5 then
         if Locale = "da" then
            return Ordinal_Text & " " & Label & " hver m" & U (16#E5#)
              & "ned";
         elsif Locale = "de" then
            return Ordinal_Text & " " & Label & " jedes Monats";
         elsif Locale = "fr" then
            return Ordinal_Text & " " & Label & " de chaque mois";
         elsif Locale = "es" then
            return Ordinal_Text & " " & Label & " de cada mes";
         elsif Locale = "it" then
            return Ordinal_Text & " " & Label & " di ogni mese";
         elsif Locale = "pt" then
            return Ordinal_Text & " " & Label & " de cada m"
              & U (16#EA#) & "s";
         elsif Locale = "nl" then
            return Ordinal_Text & " " & Label & " van elke maand";
         elsif Locale = "sv" then
            return Ordinal_Text & " " & Label & " varje m" & U (16#E5#)
              & "nad";
         elsif Is_Norwegian (Locale) then
            return Ordinal_Text & " " & Label & " hver m" & U (16#E5#)
              & "ned";
         elsif Locale = "fi" then
            return Ordinal_Text & " " & Label & " joka kuukausi";
         else
            return Ordinal_Text & " " & Label & " of each month";
         end if;
      else
         return Every_Phrase (Locale, Label);
      end if;
   end Business_Day_Schedule_Label;

   function Monthly_Day_Label
     (Locale : String;
      Day    : Natural)
      return String
   is
      Image : constant String := No_Space (Natural'Image (Day));
   begin
      if Locale = "da" then
         return Image & ". hver m" & U (16#E5#) & "ned";
      elsif Locale = "de" then
         return "Tag " & Image & " jedes Monats";
      elsif Locale = "fr" then
         return "jour " & Image & " de chaque mois";
      elsif Locale = "es" then
         return "d" & U (16#ED#) & "a " & Image & " de cada mes";
      elsif Locale = "it" then
         return "giorno " & Image & " di ogni mese";
      elsif Locale = "pt" then
         return "dia " & Image & " de cada m" & U (16#EA#) & "s";
      elsif Locale = "nl" then
         return "dag " & Image & " van elke maand";
      elsif Locale = "sv" then
         return "dag " & Image & " varje m" & U (16#E5#) & "nad";
      elsif Is_Norwegian (Locale) then
         return "dag " & Image & " hver m" & U (16#E5#) & "ned";
      elsif Locale = "fi" then
         return "p" & U (16#E4#) & "iv" & U (16#E4#) & " "
           & Image & " joka kuukausi";
      elsif Locale = "pl" then
         return Image & ". dzie" & U (16#144#) & " ka" & U (16#17C#)
           & "dego miesi" & U (16#105#) & "ca";
      elsif Locale = "cs" then
         return Image & ". den ka" & U (16#17E#) & "d" & U (16#E9#)
           & "ho m" & U (16#11B#) & "s" & U (16#ED#) & "ce";
      elsif Locale = "tr" then
         return "her ay" & U (16#131#) & "n " & Image & ". g"
           & U (16#FC#) & "n" & U (16#FC#);
      elsif Locale = "ro" then
         return "ziua " & Image & " a fiecarei luni";
      elsif Locale = "lt" then
         return Image & " diena kiekviena menesi";
      elsif Locale = "sl" then
         return Image & ". dan vsakega meseca";
      elsif Locale = "id" then
         return "tanggal " & Image & " setiap bulan";
      elsif Locale = "ms" then
         return "hari " & Image & " setiap bulan";
      elsif Locale = "eo" then
         return "tago " & Image & " de cxiu monato";
      elsif Locale = "vi" then
         return "ngay " & Image & " moi thang";
      elsif Locale = "sw" then
         return "siku ya " & Image & " ya kila mwezi";
      elsif Locale = "af" then
         return "dag " & Image & " van elke maand";
      elsif Locale = "hu" then
         return "minden honap " & Image & ". napja";
      elsif Locale = "sk" then
         return Image & ". den kazdeho mesiaca";
      elsif Locale = "ru" then
         return Image & "-" & U (16#439#) & " " & U (16#434#)
           & U (16#435#) & U (16#43D#) & U (16#44C#) & " "
           & U (16#43A#) & U (16#430#) & U (16#436#) & U (16#434#)
           & U (16#43E#) & U (16#433#) & U (16#43E#) & " "
           & U (16#43C#) & U (16#435#) & U (16#441#) & U (16#44F#)
           & U (16#446#) & U (16#430#);
      elsif Locale = "uk" then
         return Image & "-" & U (16#439#) & " " & U (16#434#)
           & U (16#435#) & U (16#43D#) & U (16#44C#) & " "
           & U (16#43A#) & U (16#43E#) & U (16#436#) & U (16#43D#)
           & U (16#43E#) & U (16#433#) & U (16#43E#) & " "
           & U (16#43C#) & U (16#456#) & U (16#441#) & U (16#44F#)
           & U (16#446#) & U (16#44F#);
      elsif Locale = "ja" then
         return U (16#6BCE#) & U (16#6708#) & Image & U (16#65E5#);
      elsif Locale = "ko" then
         return U (16#B9E4#) & U (16#B2EC#) & " " & Image & U (16#C77C#);
      elsif Locale = "zh" then
         return U (16#6BCF#) & U (16#6708#) & Image & U (16#65E5#);
      elsif Locale = "ar" then
         return U (16#627#) & U (16#644#) & U (16#64A#) & U (16#648#)
           & U (16#645#) & " " & Image & " " & U (16#645#)
           & U (16#646#) & " " & U (16#643#) & U (16#644#) & " "
           & U (16#634#) & U (16#647#) & U (16#631#);
      elsif Locale = "hi" then
         return U (16#939#) & U (16#930#) & " " & U (16#92E#)
           & U (16#939#) & U (16#940#) & U (16#928#) & U (16#947#)
           & " " & Image & " " & U (16#924#) & U (16#93E#)
           & U (16#930#) & U (16#940#) & U (16#916#);
      else
         return "day " & Image & " of each month";
      end if;
   end Monthly_Day_Label;

   function Schedule
     (Context : Humanize.Contexts.Context;
      Options : Schedule_Options)
      return Humanize.Status.Text_Result
   is
      Locale : constant String := Locale_Prefix (Context);
      Base : Unbounded_String;
   begin
      case Options.Kind is
         when Schedule_Interval =>
            return
              (Status => Humanize.Status.Ok,
               Text => To_Unbounded_String
                 (With_Time
                    (Locale,
                     Schedule_Interval_Label
                       (Locale, Options.Every, Options.Unit),
                     Options)),
               Key => Humanize.Messages.No_Message);

         when Schedule_Weekday =>
            if Options.Weekday = 0 then
               return (Status => Humanize.Status.Invalid_Options, others => <>);
            end if;
            if Options.Every > 1 and then Options.Unit = Every_Week then
               Base := To_Unbounded_String
                 (Weekly_On_Label
                    (Locale, Options.Every,
                     Weekday_Name (Locale, Options.Weekday)));
            else
               Base := To_Unbounded_String
                 (Every_Phrase (Locale, Weekday_Name (Locale, Options.Weekday)));
            end if;

         when Schedule_Weekday_Set =>
            declare
               Label : constant String :=
                 Weekday_Set_Label (Locale, Options.Weekdays);
            begin
               if Label'Length = 0 then
                  return (Status => Humanize.Status.Invalid_Options, others => <>);
               end if;
               if Options.Every > 1 and then Options.Unit = Every_Week then
                  Base := To_Unbounded_String
                    (Weekly_On_Label (Locale, Options.Every, Label));
               else
                  Base := To_Unbounded_String (Every_Phrase (Locale, Label));
               end if;
            end;

         when Schedule_Ordinal_Weekday =>
            if Options.Weekday = 0 or else Options.Ordinal = 0 then
               return (Status => Humanize.Status.Invalid_Options, others => <>);
            end if;
            Base := To_Unbounded_String
              (Ordinal_Weekday_Monthly_Label
                 (Locale, Options.Ordinal, Options.Weekday));
            if Length (Base) = 0 then
               return (Status => Humanize.Status.Invalid_Options, others => <>);
            end if;

         when Schedule_Business_Day =>
            Base := To_Unbounded_String
              (Business_Day_Schedule_Label (Locale, Options.Ordinal));
      end case;

      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (With_Time (Locale, To_String (Base), Options)),
         Key => Humanize.Messages.No_Message);
   end Schedule;

   function Weekly_Schedule
     (Context     : Humanize.Contexts.Context;
      Weekdays    : Weekday_Set;
      Every       : Positive := 1;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result is
   begin
      if not Valid_Schedule_Time (Has_Time, Hour, Minute) then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      return Schedule
        (Context,
         (Kind        => Schedule_Weekday_Set,
          Every       => Every,
          Unit        => Every_Week,
          Weekday     => 0,
          Weekdays    => Weekdays,
          Ordinal     => 0,
          Has_Time    => Has_Time,
          Hour        => Hour,
          Minute      => Minute,
          Use_12_Hour => Use_12_Hour));
   end Weekly_Schedule;

   function Every_Other_Weekday_Schedule
     (Context     : Humanize.Contexts.Context;
      Weekday     : Natural;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result is
   begin
      if Weekday not in 1 .. 7
        or else not Valid_Schedule_Time (Has_Time, Hour, Minute)
      then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      return Schedule
        (Context,
         (Kind        => Schedule_Weekday,
          Every       => 2,
          Unit        => Every_Week,
          Weekday     => Weekday,
          Weekdays    => Every_Day_Set,
          Ordinal     => 0,
          Has_Time    => Has_Time,
          Hour        => Hour,
          Minute      => Minute,
          Use_12_Hour => Use_12_Hour));
   end Every_Other_Weekday_Schedule;

   function Monthly_Day_Schedule
     (Context     : Humanize.Contexts.Context;
      Day         : Natural;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Locale : constant String := Locale_Prefix (Context);
   begin
      if Day not in 1 .. 31
        or else not Valid_Schedule_Time (Has_Time, Hour, Minute)
      then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      declare
         Options : constant Schedule_Options :=
           (Kind        => Schedule_Interval,
            Every       => 1,
            Unit        => Every_Month,
            Weekday     => 0,
            Weekdays    => Every_Day_Set,
            Ordinal     => 0,
            Has_Time    => Has_Time,
            Hour        => Hour,
            Minute      => Minute,
            Use_12_Hour => Use_12_Hour);
      begin
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (With_Time (Locale, Monthly_Day_Label (Locale, Day), Options)),
            Key => Humanize.Messages.No_Message);
      end;
   end Monthly_Day_Schedule;

   function Last_Business_Day_Schedule
     (Context     : Humanize.Contexts.Context;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result is
   begin
      if not Valid_Schedule_Time (Has_Time, Hour, Minute) then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      return Schedule
        (Context,
         (Kind        => Schedule_Business_Day,
          Every       => 1,
          Unit        => Every_Month,
          Weekday     => 0,
          Weekdays    => Every_Day_Set,
          Ordinal     => -1,
          Has_Time    => Has_Time,
          Hour        => Hour,
          Minute      => Minute,
          Use_12_Hour => Use_12_Hour));
   end Last_Business_Day_Schedule;

   function Business_Day_Schedule
     (Context     : Humanize.Contexts.Context;
      Ordinal     : Integer;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result
   is
   begin
      if (Ordinal /= -1 and then Ordinal not in 1 .. 5)
        or else not Valid_Schedule_Time (Has_Time, Hour, Minute)
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return Schedule
        (Context,
         (Kind        => Schedule_Business_Day,
          Every       => 1,
          Unit        => Every_Month,
          Weekday     => 0,
          Weekdays    => Every_Day_Set,
          Ordinal     => Ordinal,
          Has_Time    => Has_Time,
          Hour        => Hour,
          Minute      => Minute,
          Use_12_Hour => Use_12_Hour));
   end Business_Day_Schedule;

   function Cron_Schedule
     (Context : Humanize.Contexts.Context;
      Minute  : String;
      Hour    : String;
      Day     : String;
      Month   : String;
      Weekday : String)
      return Humanize.Status.Text_Result
   is
      M : constant String := Lower (Minute);
      H : constant String := Lower (Hour);
      D : constant String := Lower (Day);
      Mo : constant String := Lower (Month);
      W : constant String := Lower (Weekday);
      Locale : constant String := Locale_Prefix (Context);

      function Is_Number (Text : String; Value : out Natural) return Boolean is
         N : Natural := 0;
      begin
         if Text'Length = 0 then
            return False;
         end if;
         for Ch of Text loop
            if Ch not in '0' .. '9' then
               return False;
            end if;
            N := N * 10 + Character'Pos (Ch) - Character'Pos ('0');
         end loop;
         Value := N;
         return True;
      end Is_Number;

      function Cron_Weekday (Text : String) return Natural is
      begin
         if Text = "1" or else Text = "mon" or else Text = "monday" then
            return 1;
         elsif Text = "2" or else Text = "tue" or else Text = "tuesday" then
            return 2;
         elsif Text = "3" or else Text = "wed" or else Text = "wednesday" then
            return 3;
         elsif Text = "4" or else Text = "thu" or else Text = "thursday" then
            return 4;
         elsif Text = "5" or else Text = "fri" or else Text = "friday" then
            return 5;
         elsif Text = "6" or else Text = "sat" or else Text = "saturday" then
            return 6;
         elsif Text = "0" or else Text = "7"
           or else Text = "sun" or else Text = "sunday"
         then
            return 7;
         else
            return 0;
         end if;
      end Cron_Weekday;

      Minute_Value : Natural := 0;
      Hour_Value   : Natural := 0;
      Day_Value    : Natural := 0;
      Weekday_Value : Natural := 0;
      Opt : Schedule_Options := Default_Schedule_Options;
   begin
      if M = "*" and then H = "*" and then D = "*" and then Mo = "*"
        and then W = "*"
      then
         Opt.Kind := Schedule_Interval;
         Opt.Every := 1;
         Opt.Unit := Every_Minute;
         return Schedule (Context, Opt);
      end if;

      if not Is_Number (M, Minute_Value)
        or else Minute_Value > 59
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      if H = "*" and then D = "*" and then Mo = "*" and then W = "*" then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              ("every hour at minute " & No_Space (Natural'Image (Minute_Value))),
            Key => Humanize.Messages.No_Message);
      end if;

      if not Is_Number (H, Hour_Value) or else Hour_Value > 23 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      Opt.Has_Time := True;
      Opt.Hour := Hour_Value;
      Opt.Minute := Minute_Value;

      if D = "*" and then Mo = "*" and then W = "*" then
         Opt.Kind := Schedule_Interval;
         Opt.Every := 1;
         Opt.Unit := Every_Day;
         return Schedule (Context, Opt);
      elsif D = "*" and then Mo = "*" then
         if W = "1-5" or else W = "mon-fri" then
            Opt.Kind := Schedule_Weekday_Set;
            Opt.Weekdays := Weekdays;
            return Schedule (Context, Opt);
         end if;
         Weekday_Value := Cron_Weekday (W);
         if Weekday_Value /= 0 then
            Opt.Kind := Schedule_Weekday;
            Opt.Weekday := Weekday_Value;
            return Schedule (Context, Opt);
         end if;
      elsif Mo = "*" and then W = "*" and then Is_Number (D, Day_Value)
        and then Day_Value in 1 .. 31
      then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (With_Time
                 (Locale, Monthly_Day_Label (Locale, Day_Value),
                  (Kind        => Schedule_Interval,
                   Every       => 1,
                   Unit        => Every_Day,
                   Weekday     => 0,
                   Weekdays    => Every_Day_Set,
                   Ordinal     => 0,
                   Has_Time    => True,
                   Hour        => Hour_Value,
                   Minute      => Minute_Value,
                   Use_12_Hour => False))),
            Key => Humanize.Messages.No_Message);
      end if;

      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Cron_Schedule;

   function Natural_Duration_Preset_Style
     (Seconds : Duration_Seconds;
      Preset  : Natural_Duration_Threshold_Preset)
      return Natural_Duration_Style
   is
   begin
      case Preset is
         when Threshold_Default =>
            return Plain_Duration;

         when Threshold_Rails =>
            if Seconds < 30 then
               return Few_Duration;
            elsif Seconds < 90 then
               return Plain_Duration;
            elsif Seconds < 45 * 60 then
               return Approximate_Duration;
            elsif Seconds < 90 * 60 then
               return Approximate_Duration;
            elsif Seconds < 24 * 3_600 then
               return Approximate_Duration;
            elsif Seconds < 30 * 86_400 then
               return Approximate_Duration;
            elsif Seconds < 365 * 86_400 then
               return Approximate_Duration;
            else
               return Over_Duration;
            end if;

         when Threshold_Django =>
            if Seconds < 60 then
               return Plain_Duration;
            elsif Seconds < 90 then
               return Approximate_Duration;
            elsif Seconds < 24 * 3_600 then
               return Approximate_Duration;
            elsif Seconds < 365 * 86_400 then
               return Plain_Duration;
            else
               return Over_Duration;
            end if;

         when Threshold_Conversational =>
            if Seconds < 45 then
               return Few_Duration;
            elsif Seconds < 60 then
               return Plain_Duration;
            elsif Seconds >= 45 * 60
              and then Seconds < 60 * 60
            then
               return Little_Under_Duration;
            elsif Seconds >= 23 * 3_600
              and then Seconds < 24 * 3_600
            then
               return Little_Under_Duration;
            elsif Seconds < 90 then
               return Approximate_Duration;
            elsif Seconds mod Natural_Unit_Seconds (Seconds, False, 70) = 0 then
               return Plain_Duration;
            else
               return Just_Over_Duration;
            end if;
      end case;
   end Natural_Duration_Preset_Style;

   function Natural_Duration_Internal
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Natural_Duration_Options;
      Approximation : Natural_Duration_Approximation_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Seconds : constant Duration_Seconds := Duration_Seconds'Max (0, Seconds);
      Hours : constant Duration_Seconds := Abs_Seconds / 3_600;
      Minutes : constant Duration_Seconds := (Abs_Seconds mod 3_600) / 60;
      Seconds_Part : constant Duration_Seconds := Abs_Seconds mod 60;
   begin
      if Options.Style = Brief_Duration
        or else Options.Style = Brief_Precise_Duration
      then
         declare
            Text : constant String :=
              No_Space (Duration_Seconds'Image (Hours)) & " hr "
              & Pad2 (Natural (Minutes)) & " min"
              & (if Options.Style = Brief_Precise_Duration
                 then " " & Pad2 (Natural (Seconds_Part)) & " sec"
                 else "");
         begin
            return
              (Status => Humanize.Status.Ok,
               Text => To_Unbounded_String (Text),
               Key => Humanize.Messages.No_Message);
         end;
      elsif Options.Style = Few_Duration then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (if Abs_Seconds < 60 then "a few seconds"
               elsif Abs_Seconds < 300 then "a few minutes"
               else "a few " & To_String
                 (Format (Context, Abs_Seconds).Text)),
            Key => Humanize.Messages.No_Message);
      elsif Options.Style = Almost_Duration then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (Natural_Approximation_Text
                 ("almost", Abs_Seconds, Round_Up => True,
                  Options => Approximation)),
            Key => Humanize.Messages.No_Message);
      elsif Options.Style = Over_Duration then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (Natural_Approximation_Text
                 ("over", Abs_Seconds, Round_Up => False,
                  Options => Approximation)),
            Key => Humanize.Messages.No_Message);
      elsif Options.Style = Just_Over_Duration then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (Natural_Approximation_Text
                 ("just over", Abs_Seconds, Round_Up => False,
                  Options => Approximation)),
            Key => Humanize.Messages.No_Message);
      elsif Options.Style = Little_Under_Duration then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (Natural_Approximation_Text
                 ("a little under", Abs_Seconds, Round_Up => True,
                  Options => Approximation,
                  Prefer_Larger => True)),
            Key => Humanize.Messages.No_Message);
      elsif Abs_Seconds < 60 then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String ("less than a minute"),
            Key => Humanize.Messages.No_Message);
      elsif Abs_Seconds = 1_800 and then Options.Style = Plain_Duration then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String ("half an hour"),
            Key => Humanize.Messages.No_Message);
      elsif Options.Style = Approximate_Duration then
         declare
            Base : constant Humanize.Status.Text_Result :=
              Format (Context, Abs_Seconds);
         begin
            if Abs_Seconds = 1_800 then
               return
                 (Status => Humanize.Status.Ok,
                  Text => To_Unbounded_String ("about half an hour"),
                  Key => Humanize.Messages.No_Message);
            end if;
            if Base.Status /= Humanize.Status.Ok then
               return Base;
            end if;
            return
              (Status => Humanize.Status.Ok,
               Text => To_Unbounded_String ("about " & To_String (Base.Text)),
               Key => Humanize.Messages.No_Message);
         end;
      else
         return Format (Context, Abs_Seconds);
      end if;
   end Natural_Duration_Internal;

   function Natural_Duration
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Natural_Duration_Options := Default_Natural_Duration_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Natural_Duration_Internal
        (Context, Seconds, Options,
         Default_Natural_Duration_Approximation_Options);
   end Natural_Duration;

   function Natural_Duration
     (Context       : Humanize.Contexts.Context;
      Seconds       : Duration_Seconds;
      Options       : Natural_Duration_Options;
      Approximation : Natural_Duration_Approximation_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Natural_Duration_Internal
        (Context, Seconds, Options, Approximation);
   end Natural_Duration;

   function Natural_Duration
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Preset  : Natural_Duration_Threshold_Preset)
      return Humanize.Status.Text_Result
   is
      Abs_Seconds : constant Duration_Seconds := Duration_Seconds'Max (0, Seconds);
      Style : constant Natural_Duration_Style :=
        Natural_Duration_Preset_Style (Abs_Seconds, Preset);
      Approximation : constant Natural_Duration_Approximation_Options :=
        (case Preset is
            when Threshold_Default =>
              Default_Natural_Duration_Approximation_Options,
            when Threshold_Rails =>
              (Round_Up_Threshold_Percent => 50,
               Larger_Unit_Threshold_Percent => 75),
            when Threshold_Django =>
              (Round_Up_Threshold_Percent => 50,
               Larger_Unit_Threshold_Percent => 80),
            when Threshold_Conversational =>
              (Round_Up_Threshold_Percent => 25,
               Larger_Unit_Threshold_Percent => 70));
   begin
      return Natural_Duration_Internal
        (Context, Abs_Seconds, (Style => Style), Approximation);
   end Natural_Duration;

   function Duration_Distance
     (Context   : Humanize.Contexts.Context;
      Seconds   : Duration_Seconds;
      Direction : Duration_Distance_Direction := Duration_Distance_Plain;
      Preset    : Natural_Duration_Threshold_Preset := Threshold_Default)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Natural_Duration (Context, Duration_Seconds'Max (0, Seconds), Preset);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      case Direction is
         when Duration_Distance_Plain =>
            return Base;
         when Duration_Distance_Past =>
            return
              (Status => Humanize.Status.Ok,
               Text => To_Unbounded_String (To_String (Base.Text) & " ago"),
               Key => Humanize.Messages.No_Message);
         when Duration_Distance_Future =>
            return
              (Status => Humanize.Status.Ok,
               Text => To_Unbounded_String ("in " & To_String (Base.Text)),
               Key => Humanize.Messages.No_Message);
      end case;
   end Duration_Distance;

   function Natural_Duration_Detailed
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Detailed_Duration_Options :=
        Default_Detailed_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Seconds : Duration_Seconds := Duration_Seconds'Max (0, Seconds);
      Base        : Humanize.Status.Text_Result;
      Prefix      : constant String :=
        (case Options.Prefix is
            when Plain_Duration | Brief_Duration | Brief_Precise_Duration =>
               "",
            when Approximate_Duration => "about ",
            when Almost_Duration => "almost ",
            when Over_Duration => "over ",
            when Just_Over_Duration => "just over ",
            when Little_Under_Duration => "a little under ",
            when Few_Duration => "a few ");
   begin
      if Options.Round_To_Minutes and then Abs_Seconds >= 60 then
         Abs_Seconds := ((Abs_Seconds + 30) / 60) * 60;
      end if;

      Base := Format_Components
        (Context, Abs_Seconds, Options.Max_Components,
         (Largest_Unit => Year, Smallest_Unit => Second));

      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String (Prefix & To_String (Base.Text)),
         Key => Humanize.Messages.No_Message);
   end Natural_Duration_Detailed;

   function Add_Business_Days
     (Start   : Ada.Calendar.Time;
      Days    : Natural;
      Options : Business_Day_Options := Default_Business_Day_Options)
      return Ada.Calendar.Time
   is
      Result : Ada.Calendar.Time := Start;
      Count  : Natural := 0;
   begin
      if Options.Include_Start
        and then Is_Configured_Work_Day (Result, Options)
      then
         Count := 1;
      end if;

      while Count < Days loop
         Result := Result + 86_400.0;
         if Is_Configured_Work_Day (Result, Options) then
            Count := Count + 1;
         end if;
      end loop;
      return Result;
   end Add_Business_Days;

   function Add_Business_Days
     (Start    : Ada.Calendar.Time;
      Days     : Natural;
      Holidays : Holiday_List;
      Options  : Business_Day_Options := Default_Business_Day_Options)
      return Ada.Calendar.Time
   is
      Result : Ada.Calendar.Time := Start;
      Count  : Natural := 0;
   begin
      if Options.Include_Start
        and then Is_Business_Day (Result, Holidays, Options)
      then
         Count := 1;
      end if;

      while Count < Days loop
         Result := Result + 86_400.0;
         if Is_Business_Day (Result, Holidays, Options) then
            Count := Count + 1;
         end if;
      end loop;
      return Result;
   end Add_Business_Days;

   procedure Weekday_Hours
     (Value      : Ada.Calendar.Time;
      Options    : Advanced_Business_Calendar_Options;
      Start_Hour : out Natural;
      End_Hour   : out Natural);

   function Half_Day_End_Hour
     (Value     : Ada.Calendar.Time;
      Half_Days : Half_Day_List;
      Default   : Natural)
      return Natural;

   function Is_Business_Day
     (Value : Ada.Calendar.Time;
      Rules : Business_Calendar_Rules)
      return Boolean
   is
      Start_Hour : Natural;
      End_Hour   : Natural;
   begin
      Weekday_Hours (Value, Rules.Options, Start_Hour, End_Hour);
      End_Hour := Half_Day_End_Hour
        (Value, Rule_Half_Days (Rules), End_Hour);

      return Start_Hour < End_Hour
        and then not Is_One_Off_Holiday (Value, Rule_Holidays (Rules))
        and then not Is_Recurring_Holiday
          (Value, Rule_Recurring_Holidays (Rules))
        and then not Is_Shutdown_Day (Value, Rule_Shutdowns (Rules));
   end Is_Business_Day;

   function Add_Business_Days
     (Start : Ada.Calendar.Time;
      Days  : Integer;
      Rules : Business_Calendar_Rules)
      return Ada.Calendar.Time
   is
      Result : Ada.Calendar.Time := Start;
      Count  : Natural := 0;
      Target : constant Natural := Natural (abs Days);
      Step   : constant Duration := (if Days < 0 then -86_400.0 else 86_400.0);
   begin
      while Count < Target loop
         Result := Result + Step;
         if Is_Business_Day (Result, Rules) then
            Count := Count + 1;
         end if;
      end loop;
      return Result;
   end Add_Business_Days;

   function Business_Date_Label
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Days    : Natural;
      Options : Business_Day_Options := Default_Business_Day_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (ISO_Date (Add_Business_Days (Start, Days, Options))),
         Key => Humanize.Messages.No_Message);
   end Business_Date_Label;

   function Hour_Of (Value : Ada.Calendar.Time) return Natural is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      return Natural (Seconds / 3_600.0);
   end Hour_Of;

   function Is_Business_Hour
     (Value   : Ada.Calendar.Time;
      Options : Business_Hour_Options)
      return Boolean
   is
      Hour : constant Natural := Hour_Of (Value);
   begin
      return Options.Start_Hour < Options.End_Hour
        and then Is_Configured_Work_Day (Value, Options.Days)
        and then Hour >= Options.Start_Hour
        and then Hour < Options.End_Hour;
   end Is_Business_Hour;

   function Add_Business_Hours
     (Start   : Ada.Calendar.Time;
      Hours   : Natural;
      Options : Business_Hour_Options := Default_Business_Hour_Options)
      return Ada.Calendar.Time
   is
      Result : Ada.Calendar.Time := Start;
      Count  : Natural := 0;
   begin
      while Count < Hours loop
         Result := Result + 3_600.0;
         if Is_Business_Hour (Result, Options) then
            Count := Count + 1;
         end if;
      end loop;
      return Result;
   end Add_Business_Hours;

   function Business_Hour_Label
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Hours   : Natural;
      Options : Business_Hour_Options := Default_Business_Hour_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Options.Start_Hour >= Options.End_Hour then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (ISO_Date (Add_Business_Hours (Start, Hours, Options))),
         Key => Humanize.Messages.No_Message);
   end Business_Hour_Label;

   function Business_Date_Label
     (Context  : Humanize.Contexts.Context;
      Start    : Ada.Calendar.Time;
      Days     : Natural;
      Holidays : Holiday_List;
      Options  : Business_Day_Options := Default_Business_Day_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (ISO_Date (Add_Business_Days (Start, Days, Holidays, Options))),
         Key => Humanize.Messages.No_Message);
   end Business_Date_Label;

   function Is_Calendar_Business_Hour
     (Value    : Ada.Calendar.Time;
      Holidays : Holiday_List;
      Options  : Business_Calendar_Options)
      return Boolean
   is
      Hour : constant Natural := Hour_Of (Value);
      In_Break : constant Boolean :=
        Options.Break_Start_Hour < Options.Break_End_Hour
        and then Hour >= Options.Break_Start_Hour
        and then Hour < Options.Break_End_Hour;
   begin
      return Options.Hours.Start_Hour < Options.Hours.End_Hour
        and then not In_Break
        and then Is_Business_Day (Value, Holidays, Options.Hours.Days)
        and then Hour >= Options.Hours.Start_Hour
        and then Hour < Options.Hours.End_Hour;
   end Is_Calendar_Business_Hour;

   function Add_Business_Hours
     (Start    : Ada.Calendar.Time;
      Hours    : Natural;
      Holidays : Holiday_List;
      Options  : Business_Calendar_Options :=
        Default_Business_Calendar_Options)
      return Ada.Calendar.Time
   is
      Result : Ada.Calendar.Time := Start;
      Count  : Natural := 0;
   begin
      while Count < Hours loop
         Result := Result + 3_600.0;
         if Is_Calendar_Business_Hour (Result, Holidays, Options) then
            Count := Count + 1;
         end if;
      end loop;
      return Result;
   end Add_Business_Hours;

   function Business_Calendar_Label
     (Context  : Humanize.Contexts.Context;
      Start    : Ada.Calendar.Time;
      Hours    : Natural;
      Holidays : Holiday_List;
      Options  : Business_Calendar_Options :=
        Default_Business_Calendar_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Options.Hours.Start_Hour >= Options.Hours.End_Hour
        or else Options.Break_Start_Hour > Options.Break_End_Hour
      then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (ISO_Date (Add_Business_Hours (Start, Hours, Holidays, Options))),
         Key => Humanize.Messages.No_Message);
   end Business_Calendar_Label;

   procedure Weekday_Hours
     (Value      : Ada.Calendar.Time;
      Options    : Advanced_Business_Calendar_Options;
      Start_Hour : out Natural;
      End_Hour   : out Natural)
   is
      Day : constant Ada.Calendar.Formatting.Day_Name :=
        Ada.Calendar.Formatting.Day_Of_Week (Value);
   begin
      case Day is
         when Ada.Calendar.Formatting.Monday =>
            Start_Hour := Options.Weekday_Hours.Monday_Start;
            End_Hour := Options.Weekday_Hours.Monday_End;
         when Ada.Calendar.Formatting.Tuesday =>
            Start_Hour := Options.Weekday_Hours.Tuesday_Start;
            End_Hour := Options.Weekday_Hours.Tuesday_End;
         when Ada.Calendar.Formatting.Wednesday =>
            Start_Hour := Options.Weekday_Hours.Wednesday_Start;
            End_Hour := Options.Weekday_Hours.Wednesday_End;
         when Ada.Calendar.Formatting.Thursday =>
            Start_Hour := Options.Weekday_Hours.Thursday_Start;
            End_Hour := Options.Weekday_Hours.Thursday_End;
         when Ada.Calendar.Formatting.Friday =>
            Start_Hour := Options.Weekday_Hours.Friday_Start;
            End_Hour := Options.Weekday_Hours.Friday_End;
         when Ada.Calendar.Formatting.Saturday =>
            Start_Hour := Options.Weekday_Hours.Saturday_Start;
            End_Hour := Options.Weekday_Hours.Saturday_End;
         when Ada.Calendar.Formatting.Sunday =>
            Start_Hour := Options.Weekday_Hours.Sunday_Start;
            End_Hour := Options.Weekday_Hours.Sunday_End;
      end case;
   end Weekday_Hours;

   function Half_Day_End_Hour
     (Value     : Ada.Calendar.Time;
      Half_Days : Half_Day_List;
      Default   : Natural)
      return Natural
   is
      Result : Natural := Default;
   begin
      for Item of Half_Days loop
         if Same_Date (Value, Item.Date) then
            Result := Natural'Min (Result, Item.End_Hour);
         end if;
      end loop;
      return Result;
   end Half_Day_End_Hour;

   function Is_Advanced_Business_Hour
     (Value               : Ada.Calendar.Time;
      Holidays            : Holiday_List;
      Recurring_Holidays  : Recurring_Holiday_List;
      Half_Days           : Half_Day_List;
      Shutdowns           : Shutdown_Period_List;
      Options             : Advanced_Business_Calendar_Options)
      return Boolean
   is
      Hour : constant Natural := Hour_Of (Value);
      Start_Hour : Natural;
      End_Hour   : Natural;
      In_Break   : constant Boolean :=
        Options.Break_Start_Hour < Options.Break_End_Hour
        and then Hour >= Options.Break_Start_Hour
        and then Hour < Options.Break_End_Hour;
   begin
      Weekday_Hours (Value, Options, Start_Hour, End_Hour);
      End_Hour := Half_Day_End_Hour (Value, Half_Days, End_Hour);

      if Start_Hour >= End_Hour
        or else In_Break
        or else Is_One_Off_Holiday (Value, Holidays)
        or else Is_Recurring_Holiday (Value, Recurring_Holidays)
        or else Is_Shutdown_Day (Value, Shutdowns)
      then
         return False;
      end if;

      return Hour >= Start_Hour and then Hour < End_Hour;
   end Is_Advanced_Business_Hour;

   function Has_Advanced_Business_Hours
     (Options : Advanced_Business_Calendar_Options)
      return Boolean
   is
      Hours : constant Weekday_Business_Hours := Options.Weekday_Hours;
   begin
      return (Hours.Monday_Start < Hours.Monday_End)
        or else (Hours.Tuesday_Start < Hours.Tuesday_End)
        or else (Hours.Wednesday_Start < Hours.Wednesday_End)
        or else (Hours.Thursday_Start < Hours.Thursday_End)
        or else (Hours.Friday_Start < Hours.Friday_End)
        or else (Hours.Saturday_Start < Hours.Saturday_End)
        or else (Hours.Sunday_Start < Hours.Sunday_End);
   end Has_Advanced_Business_Hours;

   function Add_Business_Hours
     (Start               : Ada.Calendar.Time;
      Hours               : Natural;
      Holidays            : Holiday_List;
      Recurring_Holidays  : Recurring_Holiday_List;
      Half_Days           : Half_Day_List;
      Shutdowns           : Shutdown_Period_List;
      Options             : Advanced_Business_Calendar_Options :=
        Default_Advanced_Business_Calendar_Options)
      return Ada.Calendar.Time
   is
      Result : Ada.Calendar.Time := Start;
      Count  : Natural := 0;
   begin
      while Count < Hours loop
         Result := Result + 3_600.0;
         if Is_Advanced_Business_Hour
           (Result, Holidays, Recurring_Holidays, Half_Days, Shutdowns, Options)
         then
            Count := Count + 1;
         end if;
      end loop;
      return Result;
   end Add_Business_Hours;

   function Add_Business_Hours
     (Start : Ada.Calendar.Time;
      Hours : Natural;
      Rules : Business_Calendar_Rules)
      return Ada.Calendar.Time
   is
   begin
      return Add_Business_Hours
        (Start,
         Hours,
         Rule_Holidays (Rules),
         Rule_Recurring_Holidays (Rules),
         Rule_Half_Days (Rules),
         Rule_Shutdowns (Rules),
         Rules.Options);
   end Add_Business_Hours;

   function Business_Calendar_Label
     (Context             : Humanize.Contexts.Context;
      Start               : Ada.Calendar.Time;
      Hours               : Natural;
      Holidays            : Holiday_List;
      Recurring_Holidays  : Recurring_Holiday_List;
      Half_Days           : Half_Day_List;
      Shutdowns           : Shutdown_Period_List;
      Options             : Advanced_Business_Calendar_Options :=
        Default_Advanced_Business_Calendar_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Options.Break_Start_Hour > Options.Break_End_Hour
        or else (Hours > 0 and then not Has_Advanced_Business_Hours (Options))
      then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (ISO_Date
              (Add_Business_Hours
                 (Start, Hours, Holidays, Recurring_Holidays, Half_Days,
                  Shutdowns, Options))),
         Key => Humanize.Messages.No_Message);
   end Business_Calendar_Label;

   function Business_Calendar_Label
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Hours   : Natural;
      Rules   : Business_Calendar_Rules)
      return Humanize.Status.Text_Result
   is
   begin
      return Business_Calendar_Label
        (Context,
         Start,
         Hours,
         Rule_Holidays (Rules),
         Rule_Recurring_Holidays (Rules),
         Rule_Half_Days (Rules),
         Rule_Shutdowns (Rules),
         Rules.Options);
   end Business_Calendar_Label;

   procedure Format_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result
        (Format_Range (Context, Low, High, Options), Target, Written, Status);
   end Format_Range_Into;

   procedure Countdown_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Countdown (Context, Seconds, Options), Target, Written, Status);
   end Countdown_Into;

   procedure SLA_Window_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (SLA_Window (Context, Seconds, Options), Target, Written, Status);
   end SLA_Window_Into;

   procedure Interval_Into
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
   is
   begin
      Copy_Result
        (Interval (Context, Low, High, Options, Phrase), Target, Written, Status);
   end Interval_Into;

   procedure Age_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Age (Context, Seconds, Options), Target, Written, Status);
   end Age_Into;

   procedure Complete_Count_Into
     (Context  : Humanize.Contexts.Context;
      Done     : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Complete_Count (Context, Done, Total), Target, Written, Status);
   end Complete_Count_Into;

   procedure Next_Window_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
   is
   begin
      Copy_Result
        (Next_Window (Context, Seconds, Options, Phrase), Target, Written, Status);
   end Next_Window_Into;

   procedure Stale_For_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Stale_For (Context, Seconds, Options), Target, Written, Status);
   end Stale_For_Into;

   procedure Expires_In_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Expires_In (Context, Seconds, Options), Target, Written, Status);
   end Expires_In_Into;

   procedure Modified_Ago_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Modified_Ago (Context, Seconds, Options), Target, Written, Status);
   end Modified_Ago_Into;

   procedure Synced_Ago_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Synced_Ago (Context, Seconds, Options), Target, Written, Status);
   end Synced_Ago_Into;

   procedure Backup_Age_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Backup_Age (Context, Seconds, Options), Target, Written, Status);
   end Backup_Age_Into;

   procedure Percent_Complete_Into
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Percent_Complete (Context, Percent), Target, Written, Status);
   end Percent_Complete_Into;

   procedure Retry_In_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Retry_In (Context, Seconds, Options), Target, Written, Status);
   end Retry_In_Into;

   procedure Step_Count_Into
     (Context : Humanize.Contexts.Context;
      Step    : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Step_Count (Context, Step, Total), Target, Written, Status);
   end Step_Count_Into;

   procedure Attempt_Count_Into
     (Context : Humanize.Contexts.Context;
      Attempt : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Attempt_Count (Context, Attempt, Total), Target, Written, Status);
   end Attempt_Count_Into;

   procedure ETA_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (ETA (Context, Seconds, Options), Target, Written, Status);
   end ETA_Into;

   procedure Throughput_Remaining_Into
     (Context   : Humanize.Contexts.Context;
      Remaining : Natural;
      Rate      : Natural;
      Unit_Name : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Throughput_Remaining (Context, Remaining, Rate, Unit_Name),
         Target, Written, Status);
   end Throughput_Remaining_Into;

   procedure Progress_Bar_Into
     (Context : Humanize.Contexts.Context;
      Done    : Natural;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Width   : Positive := 10)
   is
   begin
      Copy_Result
        (Progress_Bar (Context, Done, Total, Width), Target, Written, Status);
   end Progress_Bar_Into;

   procedure Natural_Duration_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Natural_Duration_Options := Default_Natural_Duration_Options)
   is
   begin
      Copy_Result
        (Natural_Duration (Context, Seconds, Options), Target, Written, Status);
   end Natural_Duration_Into;

   procedure Natural_Duration_Into
     (Context       : Humanize.Contexts.Context;
      Seconds       : Duration_Seconds;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Options       : Natural_Duration_Options;
      Approximation : Natural_Duration_Approximation_Options)
   is
   begin
      Copy_Result
        (Natural_Duration (Context, Seconds, Options, Approximation),
         Target, Written, Status);
   end Natural_Duration_Into;

   procedure Natural_Duration_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Preset  : Natural_Duration_Threshold_Preset)
   is
   begin
      Copy_Result
        (Natural_Duration (Context, Seconds, Preset), Target, Written, Status);
   end Natural_Duration_Into;

   procedure Duration_Distance_Into
     (Context   : Humanize.Contexts.Context;
      Seconds   : Duration_Seconds;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Direction : Duration_Distance_Direction := Duration_Distance_Plain;
      Preset    : Natural_Duration_Threshold_Preset := Threshold_Default)
   is
   begin
      Copy_Result
        (Duration_Distance (Context, Seconds, Direction, Preset),
         Target, Written, Status);
   end Duration_Distance_Into;

   procedure Natural_Duration_Detailed_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Detailed_Duration_Options :=
        Default_Detailed_Duration_Options)
   is
   begin
      Copy_Result
        (Natural_Duration_Detailed (Context, Seconds, Options),
         Target, Written, Status);
   end Natural_Duration_Detailed_Into;

   procedure Accessible_Progress_Into
     (Context : Humanize.Contexts.Context;
      Done    : Natural;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Accessible_Progress (Context, Done, Total), Target, Written, Status);
   end Accessible_Progress_Into;

   procedure Business_Days_Into
     (Context : Humanize.Contexts.Context;
      Days    : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Business_Days (Context, Days), Target, Written, Status);
   end Business_Days_Into;

   procedure Working_Hours_Into
     (Context : Humanize.Contexts.Context;
      Hours   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Working_Hours (Context, Hours), Target, Written, Status);
   end Working_Hours_Into;

   procedure End_Of_Week_Into
     (Context : Humanize.Contexts.Context;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (End_Of_Week (Context), Target, Written, Status);
   end End_Of_Week_Into;

   procedure End_Of_Month_Into
     (Context : Humanize.Contexts.Context;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (End_Of_Month (Context), Target, Written, Status);
   end End_Of_Month_Into;

   procedure End_Of_Quarter_Into
     (Context : Humanize.Contexts.Context;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (End_Of_Quarter (Context), Target, Written, Status);
   end End_Of_Quarter_Into;

   procedure Recurrence_Into
     (Context : Humanize.Contexts.Context;
      Every   : Positive;
      Unit    : Recurrence_Unit;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Recurrence (Context, Every, Unit), Target, Written, Status);
   end Recurrence_Into;

   procedure Schedule_Into
     (Context : Humanize.Contexts.Context;
      Options : Schedule_Options;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Schedule (Context, Options), Target, Written, Status);
   end Schedule_Into;

   procedure Weekly_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Weekdays    : Weekday_Set;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Every       : Positive := 1;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
   is
   begin
      Copy_Result
        (Weekly_Schedule
           (Context, Weekdays, Every, Has_Time, Hour, Minute, Use_12_Hour),
         Target, Written, Status);
   end Weekly_Schedule_Into;

   procedure Every_Other_Weekday_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Weekday     : Natural;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
   is
   begin
      Copy_Result
        (Every_Other_Weekday_Schedule
           (Context, Weekday, Has_Time, Hour, Minute, Use_12_Hour),
         Target, Written, Status);
   end Every_Other_Weekday_Schedule_Into;

   procedure Monthly_Day_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Day         : Natural;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
   is
   begin
      Copy_Result
        (Monthly_Day_Schedule
           (Context, Day, Has_Time, Hour, Minute, Use_12_Hour),
         Target, Written, Status);
   end Monthly_Day_Schedule_Into;

   procedure Last_Business_Day_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
   is
   begin
      Copy_Result
        (Last_Business_Day_Schedule
           (Context, Has_Time, Hour, Minute, Use_12_Hour),
         Target, Written, Status);
   end Last_Business_Day_Schedule_Into;

   procedure Business_Day_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Ordinal     : Integer;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
   is
   begin
      Copy_Result
        (Business_Day_Schedule
           (Context, Ordinal, Has_Time, Hour, Minute, Use_12_Hour),
         Target, Written, Status);
   end Business_Day_Schedule_Into;

   procedure Cron_Schedule_Into
     (Context : Humanize.Contexts.Context;
      Minute  : String;
      Hour    : String;
      Day     : String;
      Month   : String;
      Weekday : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Cron_Schedule (Context, Minute, Hour, Day, Month, Weekday),
         Target, Written, Status);
   end Cron_Schedule_Into;

   procedure Business_Date_Label_Into
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Days    : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Business_Day_Options := Default_Business_Day_Options)
   is
   begin
      Copy_Result
        (Business_Date_Label (Context, Start, Days, Options),
         Target, Written, Status);
   end Business_Date_Label_Into;

   procedure Business_Date_Label_Into
     (Context  : Humanize.Contexts.Context;
      Start    : Ada.Calendar.Time;
      Days     : Natural;
      Holidays : Holiday_List;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Business_Day_Options := Default_Business_Day_Options)
   is
   begin
      Copy_Result
        (Business_Date_Label (Context, Start, Days, Holidays, Options),
         Target, Written, Status);
   end Business_Date_Label_Into;

   procedure Business_Hour_Label_Into
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Hours   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Business_Hour_Options := Default_Business_Hour_Options)
   is
   begin
      Copy_Result
        (Business_Hour_Label (Context, Start, Hours, Options),
         Target, Written, Status);
   end Business_Hour_Label_Into;

   procedure Business_Calendar_Label_Into
     (Context  : Humanize.Contexts.Context;
      Start    : Ada.Calendar.Time;
      Hours    : Natural;
      Holidays : Holiday_List;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Business_Calendar_Options :=
        Default_Business_Calendar_Options)
   is
   begin
      Copy_Result
        (Business_Calendar_Label (Context, Start, Hours, Holidays, Options),
         Target, Written, Status);
   end Business_Calendar_Label_Into;

   procedure Business_Calendar_Label_Into
     (Context             : Humanize.Contexts.Context;
      Start               : Ada.Calendar.Time;
      Hours               : Natural;
      Holidays            : Holiday_List;
      Recurring_Holidays  : Recurring_Holiday_List;
      Half_Days           : Half_Day_List;
      Shutdowns           : Shutdown_Period_List;
      Target              : in out String;
      Written             : out Natural;
      Status              : out Humanize.Status.Status_Code;
      Options             : Advanced_Business_Calendar_Options :=
        Default_Advanced_Business_Calendar_Options)
   is
   begin
      Copy_Result
        (Business_Calendar_Label
           (Context, Start, Hours, Holidays, Recurring_Holidays, Half_Days,
            Shutdowns, Options),
         Target, Written, Status);
   end Business_Calendar_Label_Into;

   procedure Business_Calendar_Label_Into
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Hours   : Natural;
      Rules   : Business_Calendar_Rules;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Business_Calendar_Label (Context, Start, Hours, Rules),
         Target, Written, Status);
   end Business_Calendar_Label_Into;

end Humanize.Durations;
