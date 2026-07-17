with Ada.Calendar;
with Ada.Strings.Unbounded;

with Humanize.Durations;

private package Humanize.Parsing.Implementation.Date_Text_Helpers is
   function Strip_Day_Ordinal_Suffix (Text : String) return String;
   function Parse_Day_Token (Text : String; Day : out Integer) return Boolean;
   function Parse_Year_Token
     (Text : String;
      Year : out Ada.Calendar.Year_Number)
      return Boolean;
   function Quarter_Value (Text : String) return Natural;
   function Half_Value (Text : String) return Natural;
   function Split_Once
     (Text  : String;
      Left  : out Ada.Strings.Unbounded.Unbounded_String;
      Right : out Ada.Strings.Unbounded.Unbounded_String)
      return Boolean;
   function Parse_Week_Number
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean;
   function Repeated_Weekday_Date
     (Base    : Ada.Calendar.Time;
      Count   : Integer;
      Weekday : Natural)
      return Ada.Calendar.Time;
   function Ordinal_Value (Text : String) return Integer;
   function Nth_Weekday_In_Month
     (Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Weekday : Natural;
      Ordinal : Integer)
      return Ada.Calendar.Time;
   function Recurrence_Unit_Value
     (Text : String;
      Unit : out Humanize.Durations.Recurrence_Unit)
      return Boolean;
   function Recurrence_Ordinal_Value (Text : String) return Integer;
   function Localized_Weekday_Value (Text : String) return Natural;
   function Weekday_Value_Flexible (Text : String) return Natural;
   function Normalize_End_Boundary (Text : String) return String;
   function Parse_Hour (Text : String; Value : out Natural) return Boolean;
   function Parse_Hour_Range
     (Text       : String;
      Start_Hour : out Natural;
      End_Hour   : out Natural)
      return Boolean;
   function Month_Day_From_Text
     (Text  : String;
      Month : out Ada.Calendar.Month_Number;
      Day   : out Ada.Calendar.Day_Number)
      return Boolean;
   function Parse_ISO_Date
     (Text  : String;
      Value : out Ada.Calendar.Time)
      return Boolean;
   function Parse_ISO_Ordinal_Date
     (Text  : String;
      Value : out Ada.Calendar.Time)
      return Boolean;
   function ISO_Week_One_Start
     (Year : Ada.Calendar.Year_Number)
      return Ada.Calendar.Time;
   function Is_Default_Open_Hour (Value : Ada.Calendar.Time) return Boolean;
   function Next_Default_Open_Hour
     (Reference : Ada.Calendar.Time;
      Hour      : out Natural)
      return Ada.Calendar.Time;
   function With_Time_Of_Day
     (Date    : Ada.Calendar.Time;
      Seconds : Ada.Calendar.Day_Duration)
      return Ada.Calendar.Time;
   type Date_Unit_Kind is
     (No_Date_Unit, Day_Date_Unit, Week_Date_Unit, Fortnight_Date_Unit,
      Month_Date_Unit, Year_Date_Unit);
   function Date_Unit (Unit : String) return Date_Unit_Kind;
   function Known_Date_Unit (Unit : String) return Boolean;
   function Unit_Days
     (Base  : Ada.Calendar.Time;
      Count : Integer;
      Unit  : String)
      return Ada.Calendar.Time;
   function Range_Unit_End
     (Start : Ada.Calendar.Time;
      Unit  : String;
      Count : Integer)
      return Ada.Calendar.Time;
   function Parse_Month_Period_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean;
end Humanize.Parsing.Implementation.Date_Text_Helpers;
