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
         return 60;
      elsif Seconds < 86_400 then
         return 3_600;
      elsif Seconds < 604_800 then
         return 86_400;
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

end Humanize.Durations;
