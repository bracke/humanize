with Humanize.Bounded_Text;

package body Humanize.Parsing.Implementation.Calendar_Helpers is
   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;

   function Day_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      return Ada.Calendar.Time_Of (Year, Month, Day, 0.0);
   end Day_Start;

   function Days_In_Month
     (Year  : Ada.Calendar.Year_Number;
      Month : Ada.Calendar.Month_Number)
      return Ada.Calendar.Day_Number
   is
      Leap : constant Boolean :=
        (Year mod 400 = 0) or else (Year mod 4 = 0 and then Year mod 100 /= 0);
   begin
      case Month is
         when 1 | 3 | 5 | 7 | 8 | 10 | 12 =>
            return 31;
         when 4 | 6 | 9 | 11 =>
            return 30;
         when 2 =>
            return (if Leap then 29 else 28);
      end case;
   end Days_In_Month;

   function Add_Calendar_Days
     (Value : Ada.Calendar.Time;
      Days  : Integer)
      return Ada.Calendar.Time
   is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
      Step    : constant Integer := (if Days < 0 then -1 else 1);
      Left    : Integer := abs Days;
   begin
      Ada.Calendar.Split (Day_Start (Value), Year, Month, Day, Seconds);
      while Left > 0 loop
         if Step > 0 then
            if Day < Days_In_Month (Year, Month) then
               Day := Day + 1;
            elsif Month < 12 then
               Month := Month + 1;
               Day := 1;
            else
               Year := Year + 1;
               Month := 1;
               Day := 1;
            end if;
         else
            if Day > 1 then
               Day := Day - 1;
            elsif Month > 1 then
               Month := Month - 1;
               Day := Days_In_Month (Year, Month);
            else
               Year := Year - 1;
               Month := 12;
               Day := 31;
            end if;
         end if;
         Left := Left - 1;
      end loop;
      return Ada.Calendar.Time_Of (Year, Month, Day, 0.0);
   exception
      when others => --  parse failure normalization
         return Value;
   end Add_Calendar_Days;

   function Add_Months
     (Value  : Ada.Calendar.Time;
      Months : Integer)
      return Ada.Calendar.Time
   is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
      Total   : Integer;
      New_Year  : Ada.Calendar.Year_Number;
      New_Month : Ada.Calendar.Month_Number;
      New_Day   : Ada.Calendar.Day_Number;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      Total := Integer (Year) * 12 + Integer (Month) - 1 + Months;
      if Total < Integer (Ada.Calendar.Year_Number'First) * 12 then
         return Value;
      end if;
      New_Year := Ada.Calendar.Year_Number (Total / 12);
      New_Month := Ada.Calendar.Month_Number (Total mod 12 + 1);
      New_Day := Ada.Calendar.Day_Number'Min
        (Day, Days_In_Month (New_Year, New_Month));
      return Ada.Calendar.Time_Of (New_Year, New_Month, New_Day, 0.0);
   exception
      when others => --  parse failure normalization
         return Value;
   end Add_Months;

   function Add_Years
     (Value : Ada.Calendar.Time;
      Years : Integer)
      return Ada.Calendar.Time
   is
   begin
      return Add_Months (Value, Years * 12);
   end Add_Years;

   function Month_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      return Ada.Calendar.Time_Of (Year, Month, 1, 0.0);
   end Month_Start;

   function Year_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      return Ada.Calendar.Time_Of (Year, 1, 1, 0.0);
   end Year_Start;

   function Weekday_Number
     (Day : Ada.Calendar.Formatting.Day_Name)
      return Natural
   is
   begin
      case Day is
         when Ada.Calendar.Formatting.Monday    => return 1;
         when Ada.Calendar.Formatting.Tuesday   => return 2;
         when Ada.Calendar.Formatting.Wednesday => return 3;
         when Ada.Calendar.Formatting.Thursday  => return 4;
         when Ada.Calendar.Formatting.Friday    => return 5;
         when Ada.Calendar.Formatting.Saturday  => return 6;
         when Ada.Calendar.Formatting.Sunday    => return 7;
      end case;
   end Weekday_Number;

   function Weekday_Value (Text : String) return Natural is
      Item : constant String := Lower (Text);
   begin
      if Item = "monday" or else Item = "mon" then
         return 1;
      elsif Item = "tuesday" or else Item = "tue" or else Item = "tues" then
         return 2;
      elsif Item = "wednesday" or else Item = "wed" then
         return 3;
      elsif Item = "thursday" or else Item = "thu" or else Item = "thur"
        or else Item = "thurs"
      then
         return 4;
      elsif Item = "friday" or else Item = "fri" then
         return 5;
      elsif Item = "saturday" or else Item = "sat" then
         return 6;
      elsif Item = "sunday" or else Item = "sun" then
         return 7;
      else
         return 0;
      end if;
   end Weekday_Value;

   function Week_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time is
      Base : constant Ada.Calendar.Time := Day_Start (Value);
      Current : constant Natural := Weekday_Number
        (Ada.Calendar.Formatting.Day_Of_Week (Base));
   begin
      return Add_Calendar_Days (Base, -Integer (Current - 1));
   end Week_Start;

   function Quarter_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
      Start_Month : Ada.Calendar.Month_Number;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      Start_Month := Ada.Calendar.Month_Number
        (((Natural (Month) - 1) / 3) * 3 + 1);
      return Ada.Calendar.Time_Of (Year, Start_Month, 1, 0.0);
   end Quarter_Start;

   function Quarter_Start
     (Year    : Ada.Calendar.Year_Number;
      Quarter : Natural)
      return Ada.Calendar.Time
   is
      Month : constant Ada.Calendar.Month_Number :=
        Ada.Calendar.Month_Number ((Quarter - 1) * 3 + 1);
   begin
      return Ada.Calendar.Time_Of (Year, Month, 1, 0.0);
   end Quarter_Start;

   function Add_Quarters
     (Value    : Ada.Calendar.Time;
      Quarters : Integer)
      return Ada.Calendar.Time
   is
   begin
      return Add_Months (Value, Quarters * 3);
   end Add_Quarters;

   function Week_Number_Start
     (Reference : Ada.Calendar.Time;
      Week      : Natural)
      return Ada.Calendar.Time
   is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Reference, Year, Month, Day, Seconds);
      return Add_Calendar_Days
        (Week_Start (Ada.Calendar.Time_Of (Year, 1, 1, 0.0)),
         Integer ((Week - 1) * 7));
   end Week_Number_Start;

   function Is_Default_Business_Day (Value : Ada.Calendar.Time) return Boolean is
      Day : constant Natural :=
        Weekday_Number (Ada.Calendar.Formatting.Day_Of_Week (Day_Start (Value)));
   begin
      return Day in 1 .. 5;
   end Is_Default_Business_Day;

   function Month_Value (Text : String) return Natural is
      Item : constant String := Lower (Text);
   begin
      if Item = "january" or else Item = "jan" then
         return 1;
      elsif Item = "february" or else Item = "feb" then
         return 2;
      elsif Item = "march" or else Item = "mar" then
         return 3;
      elsif Item = "april" or else Item = "apr" then
         return 4;
      elsif Item = "may" then
         return 5;
      elsif Item = "june" or else Item = "jun" then
         return 6;
      elsif Item = "july" or else Item = "jul" then
         return 7;
      elsif Item = "august" or else Item = "aug" then
         return 8;
      elsif Item = "september" or else Item = "sep" or else Item = "sept" then
         return 9;
      elsif Item = "october" or else Item = "oct" then
         return 10;
      elsif Item = "november" or else Item = "nov" then
         return 11;
      elsif Item = "december" or else Item = "dec" then
         return 12;
      else
         return 0;
      end if;
   end Month_Value;
end Humanize.Parsing.Implementation.Calendar_Helpers;
