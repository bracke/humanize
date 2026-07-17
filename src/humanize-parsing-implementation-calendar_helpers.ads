with Ada.Calendar;
with Ada.Calendar.Formatting;

private package Humanize.Parsing.Implementation.Calendar_Helpers is
   function Day_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time;
   function Days_In_Month
     (Year  : Ada.Calendar.Year_Number;
      Month : Ada.Calendar.Month_Number)
      return Ada.Calendar.Day_Number;
   function Add_Calendar_Days
     (Value : Ada.Calendar.Time;
      Days  : Integer)
      return Ada.Calendar.Time;
   function Add_Months
     (Value  : Ada.Calendar.Time;
      Months : Integer)
      return Ada.Calendar.Time;
   function Add_Years
     (Value : Ada.Calendar.Time;
      Years : Integer)
      return Ada.Calendar.Time;
   function Month_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time;
   function Year_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time;
   function Weekday_Number
     (Day : Ada.Calendar.Formatting.Day_Name)
      return Natural;
   function Weekday_Value (Text : String) return Natural;
   function Week_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time;
   function Quarter_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time;
   function Quarter_Start
     (Year    : Ada.Calendar.Year_Number;
      Quarter : Natural)
      return Ada.Calendar.Time;
   function Add_Quarters
     (Value    : Ada.Calendar.Time;
      Quarters : Integer)
      return Ada.Calendar.Time;
   function Week_Number_Start
     (Reference : Ada.Calendar.Time;
      Week      : Natural)
      return Ada.Calendar.Time;
   function Is_Default_Business_Day (Value : Ada.Calendar.Time) return Boolean;
   function Month_Value (Text : String) return Natural;
end Humanize.Parsing.Implementation.Calendar_Helpers;
