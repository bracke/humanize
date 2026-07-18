with Ada.Calendar.Formatting;

with Humanize.Bounded_Text;
with Humanize.Parsing.Implementation.Calendar_Helpers;
with Humanize.Parsing.Implementation.Duration_Text_Helpers;

package body Humanize.Parsing.Implementation.Date_Text_Helpers is
   use type Ada.Calendar.Time;
   use Ada.Strings.Unbounded;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;
   function U (Code : Natural) return String
      renames Humanize.Bounded_Text.UTF8_Code_Point;
   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;
   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;
   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;
   function Find_Substring (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;

   function Day_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Day_Start;
   function Days_In_Month
     (Year  : Ada.Calendar.Year_Number;
      Month : Ada.Calendar.Month_Number)
      return Ada.Calendar.Day_Number
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Days_In_Month;
   function Add_Calendar_Days
     (Value : Ada.Calendar.Time;
      Days  : Integer)
      return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Add_Calendar_Days;
   function Is_Default_Business_Day (Value : Ada.Calendar.Time) return Boolean
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Is_Default_Business_Day;
   function Month_Value (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Month_Value;
   function Add_Months
     (Value  : Ada.Calendar.Time;
      Months : Integer)
      return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Add_Months;
   function Add_Years
     (Value : Ada.Calendar.Time;
      Years : Integer)
      return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Add_Years;
   function Weekday_Value (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Weekday_Value;
   function Unit_Seconds (Unit : String) return Long_Long_Integer
      renames Humanize.Parsing.Implementation.Duration_Text_Helpers.Unit_Seconds;

   function Strip_Day_Ordinal_Suffix (Text : String) return String is
      Item : constant String := Clean_Lower (Text);
   begin
      if Item'Length > 2
        and then
          (Ends_With (Item, "st")
           or else Ends_With (Item, "nd")
           or else Ends_With (Item, "rd")
           or else Ends_With (Item, "th"))
      then
         return Item (Item'First .. Item'Last - 2);
      else
         return Item;
      end if;
   end Strip_Day_Ordinal_Suffix;

   function Parse_Day_Token (Text : String; Day : out Integer) return Boolean is
      Item : constant String := Strip_Day_Ordinal_Suffix (Text);
   begin
      if Item'Length = 0 then
         return False;
      end if;

      for Index in Item'Range loop
         if not Is_Digit (Item (Index)) then
            return False;
         end if;
      end loop;

      Day := Integer'Value (Item);
      return Day in 1 .. 31;
   exception
      when others => --  parse failure normalization
         return False;
   end Parse_Day_Token;

   function Parse_Year_Token
     (Text : String;
      Year : out Ada.Calendar.Year_Number)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      First : Natural := Item'First;
      Value : Integer;
   begin
      if Starts_With (Item, "fy") then
         First := Item'First + 2;
      end if;
      if First > Item'Last then
         return False;
      end if;
      Value := Integer'Value (Item (First .. Item'Last));
      if Value not in Integer (Ada.Calendar.Year_Number'First) ..
        Integer (Ada.Calendar.Year_Number'Last)
      then
         return False;
      end if;
      Year := Ada.Calendar.Year_Number (Value);
      return True;
   exception
      when others => --  parse failure normalization
         return False;
   end Parse_Year_Token;

   function Quarter_Value (Text : String) return Natural is
      Item : constant String := Clean_Lower (Text);
      Value : Integer;
   begin
      if Item'Length = 2 and then Item (Item'First) = 'q'
        and then Item (Item'Last) in '1' .. '4'
      then
         return Natural'Value (Item (Item'Last .. Item'Last));
      elsif Item'Length = 1 and then Item (Item'First) in '1' .. '4' then
         return Natural'Value (Item);
      else
         Value := Integer'Value (Item);
         if Value in 1 .. 4 then
            return Natural (Value);
         else
            return 0;
         end if;
      end if;
   exception
      when others => --  parse failure normalization
         return 0;
   end Quarter_Value;

   function Half_Value (Text : String) return Natural is
      Item : constant String := Clean_Lower (Text);
      Value : Integer;
   begin
      if Item'Length = 2
        and then (Item (Item'First) = 'h' or else Item (Item'First) = 's')
        and then Item (Item'Last) in '1' .. '2'
      then
         return Natural'Value (Item (Item'Last .. Item'Last));
      elsif Item'Length = 1 and then Item (Item'First) in '1' .. '2' then
         return Natural'Value (Item);
      else
         Value := Integer'Value (Item);
         if Value in 1 .. 2 then
            return Natural (Value);
         else
            return 0;
         end if;
      end if;
   exception
      when others => --  parse failure normalization
         return 0;
   end Half_Value;

   function Split_Once
     (Text  : String;
      Left  : out Unbounded_String;
      Right : out Unbounded_String)
      return Boolean
   is
      Item : constant String := Trim (Text);
   begin
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            Left := To_Unbounded_String (Trim (Item (Item'First .. Index - 1)));
            Right := To_Unbounded_String (Trim (Item (Index + 1 .. Item'Last)));
            return Length (Left) > 0 and then Length (Right) > 0;
         end if;
      end loop;
      return False;
   end Split_Once;

   function Parse_Week_Number
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Week : Integer;
   begin
      if not Starts_With (Item, "week ") then
         return False;
      end if;
      Week := Integer'Value (Trim (Item (Item'First + 5 .. Item'Last)));
      if Week not in 1 .. 53 then
         return False;
      end if;
      Low := Humanize.Parsing.Implementation.Calendar_Helpers.Week_Number_Start
        (Reference, Natural (Week));
      High := Add_Calendar_Days (Low, 7);
      return True;
   exception
      when others => --  parse failure normalization
         return False;
   end Parse_Week_Number;

   function Repeated_Weekday_Date
     (Base    : Ada.Calendar.Time;
      Count   : Integer;
      Weekday : Natural)
      return Ada.Calendar.Time
   is
      Current : constant Natural :=
        Humanize.Parsing.Implementation.Calendar_Helpers.Weekday_Number
          (Ada.Calendar.Formatting.Day_Of_Week (Base));
      First_Offset : Integer;
   begin
      First_Offset := (if Weekday > Current then Weekday - Current
                       else Weekday + 7 - Current);
      if First_Offset = 0 then
         First_Offset := 7;
      end if;
      return Add_Calendar_Days (Base, First_Offset + (Count - 1) * 7);
   end Repeated_Weekday_Date;

   function Ordinal_Value (Text : String) return Integer is
      Item : constant String := Clean_Lower (Text);
   begin
      if Item = "first" or else Item = "1st" then
         return 1;
      elsif Item = "second" or else Item = "2nd" then
         return 2;
      elsif Item = "third" or else Item = "3rd" then
         return 3;
      elsif Item = "fourth" or else Item = "4th" then
         return 4;
      elsif Item = "fifth" or else Item = "5th" then
         return 5;
      elsif Item = "last" then
         return -1;
      else
         return 0;
      end if;
   end Ordinal_Value;

   function Nth_Weekday_In_Month
     (Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Weekday : Natural;
      Ordinal : Integer)
      return Ada.Calendar.Time
   is
      First : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Year, Month, 1, 0.0);
      Last_Day : constant Ada.Calendar.Day_Number := Days_In_Month (Year, Month);
      Last : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Year, Month, Last_Day, 0.0);
      First_Weekday : constant Natural :=
        Humanize.Parsing.Implementation.Calendar_Helpers.Weekday_Number
          (Ada.Calendar.Formatting.Day_Of_Week (First));
      Last_Weekday : constant Natural :=
        Humanize.Parsing.Implementation.Calendar_Helpers.Weekday_Number
          (Ada.Calendar.Formatting.Day_Of_Week (Last));
      Offset : Integer;
      Day    : Integer;
   begin
      if Ordinal > 0 then
         Offset := (if Weekday >= First_Weekday
                    then Weekday - First_Weekday
                    else Weekday + 7 - First_Weekday);
         Day := 1 + Offset + (Ordinal - 1) * 7;
      else
         Offset := (if Weekday <= Last_Weekday
                    then Last_Weekday - Weekday
                    else Last_Weekday + 7 - Weekday);
         Day := Integer (Last_Day) - Offset;
      end if;

      if Day < 1 or else Day > Integer (Last_Day) then
         raise Constraint_Error;
      end if;

      return Ada.Calendar.Time_Of
        (Year, Month, Ada.Calendar.Day_Number (Day), 0.0);
   end Nth_Weekday_In_Month;

   function Localized_Weekday_Value (Text : String) return Natural is
      Item : constant String := Clean_Lower (Text);
   begin
      if Weekday_Value (Item) /= 0 then
         return Weekday_Value (Item);
      elsif Item = "mandag" or else Item = "montag" or else Item = "lundi"
        or else Item = "lunes" or else Item = "luned" & U (16#EC#)
        or else Item = "segunda-feira" or else Item = "maandag"
        or else Item = "m" & U (16#E5#) & "ndag"
        or else Item = "maanantai"
        or else Item = "poniedzia" & U (16#142#) & "ek"
        or else Item = "pond" & U (16#11B#) & "l" & U (16#ED#)
        or else Item = "pazartesi"
      then
         return 1;
      elsif Item = "tirsdag" or else Item = "dienstag" or else Item = "mardi"
        or else Item = "martes" or else Item = "marted" & U (16#EC#)
        or else Item = "ter" & U (16#E7#) & "a-feira"
        or else Item = "dinsdag" or else Item = "tisdag"
        or else Item = "tiistai" or else Item = "wtorek"
        or else Item = U (16#FA#) & "ter" & U (16#FD#)
        or else Item = "sal" & U (16#131#)
      then
         return 2;
      elsif Item = "onsdag" or else Item = "mittwoch"
        or else Item = "mercredi"
        or else Item = "mi" & U (16#E9#) & "rcoles"
        or else Item = "mercoled" & U (16#EC#)
        or else Item = "quarta-feira" or else Item = "woensdag"
        or else Item = "keskiviikko"
        or else Item = U (16#15B#) & "roda"
        or else Item = "st" & U (16#159#) & "eda"
        or else Item = U (16#E7#) & "ar" & U (16#15F#) & "amba"
      then
         return 3;
      elsif Item = "torsdag" or else Item = "donnerstag"
        or else Item = "jeudi" or else Item = "jueves"
        or else Item = "gioved" & U (16#EC#)
        or else Item = "quinta-feira" or else Item = "donderdag"
        or else Item = "torstai" or else Item = "czwartek"
        or else Item = U (16#10D#) & "tvrtek"
        or else Item = "per" & U (16#15F#) & "embe"
      then
         return 4;
      elsif Item = "fredag" or else Item = "freitag"
        or else Item = "vendredi" or else Item = "viernes"
        or else Item = "venerd" & U (16#EC#)
        or else Item = "sexta-feira" or else Item = "vrijdag"
        or else Item = "perjantai"
        or else Item = "pi" & U (16#105#) & "tek"
        or else Item = "p" & U (16#E1#) & "tek"
        or else Item = "cuma"
      then
         return 5;
      elsif Item = "l" & U (16#F8#) & "rdag" or else Item = "samstag"
        or else Item = "samedi"
        or else Item = "s" & U (16#E1#) & "bado"
        or else Item = "sabato" or else Item = "zaterdag"
        or else Item = "l" & U (16#F6#) & "rdag"
        or else Item = "lauantai" or else Item = "sobota"
        or else Item = "cumartesi"
      then
         return 6;
      elsif Item = "s" & U (16#F8#) & "ndag" or else Item = "sonntag"
        or else Item = "dimanche" or else Item = "domingo"
        or else Item = "domenica" or else Item = "zondag"
        or else Item = "s" & U (16#F6#) & "ndag"
        or else Item = "sunnuntai" or else Item = "niedziela"
        or else Item = "ned" & U (16#11B#) & "le"
        or else Item = "pazar"
      then
         return 7;
      else
         return 0;
      end if;
   end Localized_Weekday_Value;

   function Weekday_Value_Flexible (Text : String) return Natural is
      Item : constant String := Clean_Lower (Text);
   begin
      if Localized_Weekday_Value (Item) /= 0 then
         return Localized_Weekday_Value (Item);
      elsif Item'Length > 1 and then Item (Item'Last) = 's' then
         return Localized_Weekday_Value (Item (Item'First .. Item'Last - 1));
      else
         return 0;
      end if;
   end Weekday_Value_Flexible;

   function Recurrence_Ordinal_Value (Text : String) return Integer is
      Item : constant String := Clean_Lower (Text);
   begin
      if Item = "first" or else Item = "1st" then
         return 1;
      elsif Item = "second" or else Item = "2nd" then
         return 2;
      elsif Item = "third" or else Item = "3rd" then
         return 3;
      elsif Item = "fourth" or else Item = "4th" then
         return 4;
      elsif Item = "fifth" or else Item = "5th" then
         return 5;
      elsif Item = "last" then
         return -1;
      elsif Item = "primo" or else Item = "primer"
        or else Item = "primeiro" or else Item = "eerste"
        or else Item = "f" & U (16#F8#) & "rste"
        or else Item = "erster"
      then
         return 1;
      elsif Item = "secondo" or else Item = "segundo" or else Item = "tweede"
        or else Item = "anden" or else Item = "zweiter"
      then
         return 2;
      elsif Item = "terzo" or else Item = "tercer"
        or else Item = "terceiro" or else Item = "derde"
        or else Item = "tredje" or else Item = "dritter"
      then
         return 3;
      elsif Item = "quarto" or else Item = "cuarto" or else Item = "vierde"
        or else Item = "fjerde" or else Item = "vierter"
      then
         return 4;
      elsif Item = "quinto" or else Item = "vijfde" or else Item = "femte"
        or else Item = "f" & U (16#FC#) & "nfter"
      then
         return 5;
      elsif Item = "ultimo" or else Item = "laatste"
        or else Item = "sidste" or else Item = "letzter"
        or else Item = U (16#FA#) & "ltimo"
      then
         return -1;
      else
         return 0;
      end if;
   end Recurrence_Ordinal_Value;

   function Recurrence_Unit_Value
     (Text : String;
      Unit : out Humanize.Durations.Recurrence_Unit)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
   begin
      if Item = "second" or else Item = "seconds" then
         Unit := Humanize.Durations.Every_Second;
      elsif Item = "minute" or else Item = "minutes" then
         Unit := Humanize.Durations.Every_Minute;
      elsif Item = "hour" or else Item = "hours" then
         Unit := Humanize.Durations.Every_Hour;
      elsif Item = "day" or else Item = "days" then
         Unit := Humanize.Durations.Every_Day;
      elsif Item = "week" or else Item = "weeks" then
         Unit := Humanize.Durations.Every_Week;
      elsif Item = "month" or else Item = "months" then
         Unit := Humanize.Durations.Every_Month;
      elsif Item = "quarter" or else Item = "quarters" then
         Unit := Humanize.Durations.Every_Quarter;
      elsif Item = "year" or else Item = "years" then
         Unit := Humanize.Durations.Every_Year;
      else
         return False;
      end if;
      return True;
   end Recurrence_Unit_Value;

   function Normalize_End_Boundary (Text : String) return String is
      Item : constant String := Clean_Lower (Text);
   begin
      if Item = "month end" or else Item = "end of month" then
         return "this month";
      elsif Item = "quarter end" or else Item = "end of quarter" then
         return "this quarter";
      elsif Item = "year end" or else Item = "end of year" then
         return "this year";
      elsif Starts_With (Item, "end of ") then
         return Trim (Item (Item'First + 7 .. Item'Last));
      elsif Ends_With (Item, " end") then
         return Trim (Item (Item'First .. Item'Last - 4));
      else
         return Item;
      end if;
   end Normalize_End_Boundary;

   function Parse_Hour (Text : String; Value : out Natural) return Boolean is
      Item : constant String := Clean_Lower (Text);
      Stop : Natural := Item'Last;
      Raw  : Integer;
   begin
      if Ends_With (Item, ":00") then
         Stop := Item'Last - 3;
      end if;
      if Stop < Item'First then
         return False;
      end if;
      Raw := Integer'Value (Item (Item'First .. Stop));
      if Raw not in 0 .. 24 then
         return False;
      end if;
      Value := Natural (Raw);
      return True;
   exception
      when others => --  parse failure normalization
         return False;
   end Parse_Hour;

   function Parse_Hour_Range
     (Text       : String;
      Start_Hour : out Natural;
      End_Hour   : out Natural)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Sep  : Natural := 0;
   begin
      Sep := Find_Substring (Item, "-");
      if Sep = 0 then
         Sep := Find_Substring (Item, " to ");
      end if;
      if Sep = 0 then
         return False;
      elsif Item (Sep) = '-' then
         return Parse_Hour (Item (Item'First .. Sep - 1), Start_Hour)
           and then Parse_Hour (Item (Sep + 1 .. Item'Last), End_Hour)
           and then Start_Hour < End_Hour;
      else
         return Parse_Hour (Item (Item'First .. Sep - 1), Start_Hour)
           and then Parse_Hour (Item (Sep + 4 .. Item'Last), End_Hour)
           and then Start_Hour < End_Hour;
      end if;
   end Parse_Hour_Range;

   function Month_Day_From_Text
     (Text  : String;
      Month : out Ada.Calendar.Month_Number;
      Day   : out Ada.Calendar.Day_Number)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Space : Natural := 0;
      M : Natural;
      D : Integer;
   begin
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            Space := Index;
            exit;
         end if;
      end loop;
      if Space = 0 then
         return False;
      end if;
      M := Month_Value (Item (Item'First .. Space - 1));
      D := Integer'Value (Item (Space + 1 .. Item'Last));
      if M not in 1 .. 12
        or else D < 1
        or else D > Integer (Days_In_Month (2024, Ada.Calendar.Month_Number (M)))
      then
         return False;
      end if;
      Month := Ada.Calendar.Month_Number (M);
      Day := Ada.Calendar.Day_Number (D);
      return True;
   exception
      when others => --  parse failure normalization
         return False;
   end Month_Day_From_Text;

   function Parse_ISO_Date
     (Text  : String;
      Value : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Year : Integer;
      Month : Integer;
      Day : Integer;
   begin
      if Item'Length /= 10
        or else (Item (Item'First + 4) /= '-' and then Item (Item'First + 4) /= '/')
        or else (Item (Item'First + 7) /= '-' and then Item (Item'First + 7) /= '/')
      then
         return False;
      end if;

      Year := Integer'Value (Item (Item'First .. Item'First + 3));
      Month := Integer'Value (Item (Item'First + 5 .. Item'First + 6));
      Day := Integer'Value (Item (Item'First + 8 .. Item'First + 9));
      if Year not in Integer (Ada.Calendar.Year_Number'First) ..
        Integer (Ada.Calendar.Year_Number'Last)
        or else Month not in 1 .. 12
        or else Day not in 1 .. 31
      then
         return False;
      end if;
      if Day > Integer (Days_In_Month
        (Ada.Calendar.Year_Number (Year), Ada.Calendar.Month_Number (Month)))
      then
         return False;
      end if;
      Value := Ada.Calendar.Time_Of
        (Ada.Calendar.Year_Number (Year),
         Ada.Calendar.Month_Number (Month),
         Ada.Calendar.Day_Number (Day),
         0.0);
      return True;
   exception
      when others => --  parse failure normalization
         return False;
   end Parse_ISO_Date;

   function Parse_ISO_Ordinal_Date
     (Text  : String;
      Value : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Year : Integer;
      Ordinal : Integer;
   begin
      if Item'Length /= 8
        or else Item (Item'First + 4) /= '-'
      then
         return False;
      end if;

      Year := Integer'Value (Item (Item'First .. Item'First + 3));
      Ordinal := Integer'Value (Item (Item'First + 5 .. Item'Last));
      if Year not in Integer (Ada.Calendar.Year_Number'First) ..
        Integer (Ada.Calendar.Year_Number'Last)
        or else Ordinal < 1
        or else Ordinal >
          (if Days_In_Month (Ada.Calendar.Year_Number (Year), 2) = 29
           then 366
           else 365)
      then
         return False;
      end if;

      Value := Add_Calendar_Days
        (Ada.Calendar.Time_Of
           (Ada.Calendar.Year_Number (Year), 1, 1, 0.0),
         Ordinal - 1);
      return True;
   exception
      when others => --  parse failure normalization
         return False;
   end Parse_ISO_Ordinal_Date;

   function ISO_Week_One_Start
     (Year : Ada.Calendar.Year_Number)
      return Ada.Calendar.Time
   is
      Jan_4 : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Year, 1, 4, 0.0);
      Day : constant Natural :=
        Humanize.Parsing.Implementation.Calendar_Helpers.Weekday_Number
          (Ada.Calendar.Formatting.Day_Of_Week (Jan_4));
   begin
      return Add_Calendar_Days (Jan_4, 1 - Integer (Day));
   end ISO_Week_One_Start;

   function Is_Default_Open_Hour (Value : Ada.Calendar.Time) return Boolean is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
      Hour    : Natural;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      Hour := Natural (Seconds / 3_600.0);
      return Is_Default_Business_Day (Value) and then Hour in 9 .. 16;
   end Is_Default_Open_Hour;

   function Next_Default_Open_Hour
     (Reference : Ada.Calendar.Time;
      Hour      : out Natural)
      return Ada.Calendar.Time
   is
      Candidate : Ada.Calendar.Time := Reference;
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      for Attempt in 1 .. 24 * 14 loop
         Candidate := Candidate + 3_600.0;
         if Is_Default_Open_Hour (Candidate) then
            Ada.Calendar.Split (Candidate, Year, Month, Day, Seconds);
            Hour := Natural (Seconds / 3_600.0);
            return Ada.Calendar.Time_Of (Year, Month, Day, 0.0);
         end if;
      end loop;
      Hour := 0;
      return Day_Start (Reference);
   end Next_Default_Open_Hour;

   function With_Time_Of_Day
     (Date    : Ada.Calendar.Time;
      Seconds : Ada.Calendar.Day_Duration)
      return Ada.Calendar.Time
   is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Ignored : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Date, Year, Month, Day, Ignored);
      return Ada.Calendar.Time_Of (Year, Month, Day, Seconds);
   end With_Time_Of_Day;

   function Date_Unit (Unit : String) return Date_Unit_Kind is
      U : constant String := Clean_Lower (Unit);
   begin
      if Unit_Seconds (U) = 86_400 then
         return Day_Date_Unit;
      elsif Unit_Seconds (U) = 14 * 86_400 then
         return Fortnight_Date_Unit;
      elsif Unit_Seconds (U) = 7 * 86_400 then
         return Week_Date_Unit;
      elsif Unit_Seconds (U) = 30 * 86_400 then
         return Month_Date_Unit;
      elsif Unit_Seconds (U) = 365 * 86_400 then
         return Year_Date_Unit;
      else
         return No_Date_Unit;
      end if;
   end Date_Unit;

   function Known_Date_Unit (Unit : String) return Boolean is
   begin
      return Date_Unit (Unit) /= No_Date_Unit;
   end Known_Date_Unit;

   function Unit_Days
     (Base  : Ada.Calendar.Time;
      Count : Integer;
      Unit  : String)
      return Ada.Calendar.Time
   is
      Kind : constant Date_Unit_Kind := Date_Unit (Unit);
   begin
      if Kind = Day_Date_Unit then
         return Add_Calendar_Days (Base, Count);
      elsif Kind = Week_Date_Unit then
         return Add_Calendar_Days (Base, Count * 7);
      elsif Kind = Fortnight_Date_Unit then
         return Add_Calendar_Days (Base, Count * 14);
      elsif Kind = Month_Date_Unit then
         return Add_Months (Base, Count);
      elsif Kind = Year_Date_Unit then
         return Add_Years (Base, Count);
      else
         return Base;
      end if;
   end Unit_Days;

   function Range_Unit_End
     (Start : Ada.Calendar.Time;
      Unit  : String;
      Count : Integer)
      return Ada.Calendar.Time
   is
      U : constant String := Clean_Lower (Unit);
   begin
      if U = "day" or else U = "days" then
         return Add_Calendar_Days (Start, Count);
      elsif U = "week" or else U = "weeks" then
         return Add_Calendar_Days (Start, Count * 7);
      elsif U = "month" or else U = "months" then
         return Add_Months (Start, Count);
      elsif U = "year" or else U = "years" then
         return Add_Years (Start, Count);
      else
         return Start;
      end if;
   end Range_Unit_End;

   function Parse_Month_Period_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Left, Right : Unbounded_String;
      Ref_Year : Ada.Calendar.Year_Number;
      Ref_Month : Ada.Calendar.Month_Number;
      Ref_Day : Ada.Calendar.Day_Number;
      Ref_Seconds : Ada.Calendar.Day_Duration;
      Month : Natural;
      Year : Ada.Calendar.Year_Number;
   begin
      Ada.Calendar.Split (Reference, Ref_Year, Ref_Month, Ref_Day, Ref_Seconds);
      Year := Ref_Year;

      if Split_Once (Item, Left, Right) then
         Month := Month_Value (To_String (Left));
         if Month = 0 or else not Parse_Year_Token (To_String (Right), Year) then
            return False;
         end if;
      else
         Month := Month_Value (Item);
         if Month = 0 then
            return False;
         end if;
      end if;

      Low := Ada.Calendar.Time_Of
        (Year, Ada.Calendar.Month_Number (Month), 1, 0.0);
      High := Add_Months (Low, 1);
      return True;
   exception
      when others => --  parse failure normalization
         return False;
   end Parse_Month_Period_Range;
end Humanize.Parsing.Implementation.Date_Text_Helpers;
