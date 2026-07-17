with Ada.Calendar.Formatting;

with Humanize.Bounded_Text;

package body Humanize.Durations.Business_Calendars is
   use type Ada.Calendar.Time;
   use type Humanize.Status.Status_Code;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Padded_Text (Value : Natural; Width : Natural) return String
      renames Humanize.Bounded_Text.Padded_Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Pad2 (Value : Natural) return String is
     (Padded_Text (Value, 2));

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
      return Natural_Text (Natural (Year))
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
      return Ok_Text (ISO_Date (Add_Business_Days (Start, Days, Options)));
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

      return Ok_Text (ISO_Date (Add_Business_Hours (Start, Hours, Options)));
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
      return Ok_Text
        (ISO_Date (Add_Business_Days (Start, Days, Holidays, Options)));
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

      return Ok_Text
        (ISO_Date (Add_Business_Hours (Start, Hours, Holidays, Options)));
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

      return Ok_Text
        (ISO_Date
           (Add_Business_Hours
              (Start, Hours, Holidays, Recurring_Holidays, Half_Days,
               Shutdowns, Options)));
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

end Humanize.Durations.Business_Calendars;
