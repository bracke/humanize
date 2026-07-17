with Ada.Calendar.Formatting;
with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.I18N_Rendering;
with Humanize.Locales;
with Humanize.Parsing.Implementation.Calendar_Helpers;
with Humanize.Parsing.Implementation.Date_Text_Helpers;
with Humanize.Parsing.Implementation.Numeric_Text_Helpers;
with Humanize.Parsing.Implementation.Support;
with Humanize.Parsing.Support;

package body Humanize.Parsing.Implementation.Date_Time_Text_Helpers is
   use Ada.Strings.Unbounded;
   use type Ada.Calendar.Time;
   use type Humanize.Status.Status_Code;

   function Result_Text (Result : Humanize.Status.Text_Result) return String
      renames Humanize.Bounded_Text.Result_Text;
   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function B (Hex : String) return String
      renames Humanize.Bounded_Text.Hex_Bytes;
   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;
   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;
   function Digit_Value (Item : Character) return Natural
      renames Humanize.Bounded_Text.Digit_Value;
   function Is_ASCII_Letter (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Letter;
   function Is_Lower (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Lowercase;
   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;
   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;
   function Find_Substring (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;
   function Numeric_Value
     (Text  : String;
      Value : out Long_Float)
      return Boolean
      renames Humanize.Parsing.Support.Numeric_Value;
   function Scan_End (Text : String) return Natural
      renames Humanize.Parsing.Support.Scan_End;

   function Parse_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Support.Parse_Lenient_Duration;

   procedure Store
     (Source : String;
      Target : out String;
      Length : out Natural)
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Store;
   function Parse_Number_And_Tail
     (Text   : String;
      Value  : out Long_Float;
      Tail   : out Unbounded_String)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Number_And_Tail;

   function Rendered_Natural_Date_Canonical (Text : String) return String
      is separate;

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
   function Month_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Month_Start;
   function Year_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Year_Start;
   function Weekday_Number
     (Day : Ada.Calendar.Formatting.Day_Name)
      return Natural
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Weekday_Number;
   function Weekday_Value (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Weekday_Value;
   function Localized_Weekday_Value (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Localized_Weekday_Value;
   function Weekday_Value_Flexible (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Weekday_Value_Flexible;
   function Week_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Week_Start;
   function Quarter_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Quarter_Start;
   function Quarter_Start
     (Year    : Ada.Calendar.Year_Number;
      Quarter : Natural)
      return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Quarter_Start;
   function Add_Quarters
     (Value    : Ada.Calendar.Time;
      Quarters : Integer)
      return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Add_Quarters;
   function Week_Number_Start
     (Reference : Ada.Calendar.Time;
      Week      : Natural)
      return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Week_Number_Start;
   function Is_Default_Business_Day (Value : Ada.Calendar.Time) return Boolean
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Is_Default_Business_Day;
   function Month_Value (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Calendar_Helpers.Month_Value;

   function Parse_Natural_Count (Text : String; Value : out Integer) return Boolean
      is separate;
   function Canonical_Natural_Date_Text (Text : String) return String
      is separate;
   function Split_Count_Unit
     (Text  : String;
      Count : out Integer;
      Unit  : out Unbounded_String)
      return Boolean
      is separate;

   function Known_Date_Unit (Unit : String) return Boolean
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Known_Date_Unit;
   function Unit_Days
     (Base  : Ada.Calendar.Time;
      Count : Integer;
      Unit  : String)
      return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Unit_Days;
   function Parse_ISO_Date (Text : String; Value : out Ada.Calendar.Time) return Boolean
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Parse_ISO_Date;
   function Parse_ISO_Ordinal_Date
     (Text  : String;
      Value : out Ada.Calendar.Time)
      return Boolean
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Parse_ISO_Ordinal_Date;
   function ISO_Week_One_Start
     (Year : Ada.Calendar.Year_Number)
      return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.ISO_Week_One_Start;
   function Parse_ISO_Week_Date
     (Text  : String;
      Value : out Ada.Calendar.Time)
      return Boolean
      is separate;
   function Parse_Month_Name_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Value     : out Ada.Calendar.Time)
      return Boolean
      is separate;
   function Strip_Day_Ordinal_Suffix (Text : String) return String
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Strip_Day_Ordinal_Suffix;
   function Parse_Day_Token (Text : String; Day : out Integer) return Boolean
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Parse_Day_Token;
   function Parse_Month_Day_Ordinal_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Value     : out Ada.Calendar.Time)
      return Boolean
      is separate;

   function Date_Result
     (Value    : Ada.Calendar.Time;
      Consumed : Natural;
      Exact    : Boolean := True)
      return Date_Parse_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Value => Value,
         Exact => Exact,
         Consumed => Consumed,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Date_Result;

   function Parse_Year_Token
     (Text : String;
      Year : out Ada.Calendar.Year_Number)
      return Boolean
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Parse_Year_Token;
   function Quarter_Value (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Quarter_Value;
   function Half_Value (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Half_Value;
   function Split_Once
     (Text  : String;
      Left  : out Unbounded_String;
      Right : out Unbounded_String)
      return Boolean
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Split_Once;
   function Parse_Quarter_Label
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
      is separate;
   function Parse_Half_Label
     (Text : String;
      Low  : out Ada.Calendar.Time;
      High : out Ada.Calendar.Time)
      return Boolean
      is separate;
   function Parse_Week_Number
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Parse_Week_Number;
   function Repeated_Weekday_Date
     (Base    : Ada.Calendar.Time;
      Count   : Integer;
      Weekday : Natural)
      return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Repeated_Weekday_Date;

   function Parse_Repeated_Weekday
     (Base  : Ada.Calendar.Time;
      Text  : String;
      Value : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Body_Last : Natural;
      Count : Integer;
      Unit : Unbounded_String;
      Weekday : Natural;
   begin
      if not Ends_With (Item, " from now") then
         return False;
      end if;
      Body_Last := Item'Last - 9;
      if Body_Last < Item'First
        or else not Split_Count_Unit (Item (Item'First .. Body_Last), Count, Unit)
      then
         return False;
      end if;
      Weekday := Weekday_Value_Flexible (To_String (Unit));
      if Count <= 0 or else Weekday = 0 then
         return False;
      end if;
      Value := Repeated_Weekday_Date (Base, Count, Weekday);
      return True;
   end Parse_Repeated_Weekday;

   function Time_Of_Day_Seconds
     (Text    : String;
      Seconds : out Ada.Calendar.Day_Duration;
      Offset : out Integer;
      Has_Offset : out Boolean)
     return Boolean
      is separate;
   function With_Time_Of_Day
     (Date    : Ada.Calendar.Time;
      Seconds : Ada.Calendar.Day_Duration)
      return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.With_Time_Of_Day;
   function Strip_Time_Of_Day
     (Text    : String;
      Prefix  : out Unbounded_String;
      Seconds : out Ada.Calendar.Day_Duration;
      Offset : out Integer;
      Has_Offset : out Boolean)
      return Boolean
      is separate;
   function Ordinal_Value (Text : String) return Integer
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Ordinal_Value;
   function Nth_Weekday_In_Month
     (Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Weekday : Natural;
      Ordinal : Integer)
      return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Nth_Weekday_In_Month;
   function Parse_Ordinal_Weekday_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Value     : out Ada.Calendar.Time)
      return Boolean
      is separate;
   function Parse_Weekday_Day_Ordinal_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Value     : out Ada.Calendar.Time)
      return Boolean
      is separate;
   function Boundary_Date
     (Reference : Ada.Calendar.Time;
      Phrase    : String;
      Is_End    : Boolean;
      Value     : out Ada.Calendar.Time)
      return Boolean
      is separate;
   function Normalize_End_Boundary (Text : String) return String
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Normalize_End_Boundary;

   function Parse_Business_Days_Before_Boundary
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules;
      Value     : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Marker : constant String := " business days before ";
      Singular_Marker : constant String := " business day before ";
      Marker_Pos : Natural := Find_Substring (Item, Marker);
      Marker_Length : Natural := Marker'Length;
      Count : Integer;
      Boundary : Ada.Calendar.Time;
   begin
      if Marker_Pos = 0 then
         Marker_Pos := Find_Substring (Item, Singular_Marker);
         Marker_Length := Singular_Marker'Length;
      end if;
      if Marker_Pos = 0 or else Marker_Pos = Item'First then
         return False;
      end if;
      if not Parse_Natural_Count (Item (Item'First .. Marker_Pos - 1), Count)
        or else Count <= 0
      then
         return False;
      end if;
      declare
         Boundary_Text : constant String :=
           Normalize_End_Boundary
             (Item (Marker_Pos + Marker_Length .. Item'Last));
      begin
         if Boundary_Text'Length = 0
           or else not Boundary_Date
             (Reference, Boundary_Text, True, Boundary)
         then
            return False;
         end if;
      end;
      Value := Humanize.Durations.Add_Business_Days
        (Boundary, -Count, Rules);
      return True;
   end Parse_Business_Days_Before_Boundary;

   function Parse_Label_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
   is
   begin
      return Parse_Quarter_Label (Reference, Text, Low, High)
        or else Parse_Half_Label (Text, Low, High)
        or else Parse_Week_Number (Reference, Text, Low, High);
   end Parse_Label_Range;

   function Parse_Natural_Date_With_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
     return Date_Parse_Result
      is separate;

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result
   is
      Rules : constant Humanize.Durations.Business_Calendar_Rules :=
        (others => <>);
   begin
      return Parse_Natural_Date_With_Rules (Reference, Text, Rules);
   end Parse_Natural_Date;

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result
   is
   begin
      return Parse_Natural_Date_With_Rules (Reference, Text, Rules);
   end Parse_Natural_Date;

   function Date_Range_Result
     (Low      : Ada.Calendar.Time;
      High     : Ada.Calendar.Time;
      Consumed : Natural;
      Exact    : Boolean := True)
      return Date_Range_Parse_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Low => Low,
         High => High,
         Exact => Exact,
         Consumed => Consumed,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Date_Range_Result;

   function Range_Unit_End
     (Start : Ada.Calendar.Time;
      Unit  : String;
      Count : Integer)
      return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Range_Unit_End;
   function Parse_Month_Period_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Parse_Month_Period_Range;
   function Parse_Basic_Period_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
      is separate;
   function Parse_Phased_Period_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
      is separate;
   function Parse_Natural_Date_Range_With_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result
      is separate;

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result
   is
      Rules : constant Humanize.Durations.Business_Calendar_Rules :=
        (others => <>);
   begin
      return Parse_Natural_Date_Range_With_Rules (Reference, Text, Rules);
   end Parse_Natural_Date_Range;

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result
   is
   begin
      return Parse_Natural_Date_Range_With_Rules (Reference, Text, Rules);
   end Parse_Natural_Date_Range;

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result
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
            Result : Date_Parse_Result :=
              Parse_Natural_Date (Reference, Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;
      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Natural_Date;

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result
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
            Result : Date_Parse_Result :=
              Parse_Natural_Date_With_Rules
                (Reference, Text (Text'First .. Stop), Rules);
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;
      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Natural_Date;

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result
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
            Result : Date_Range_Parse_Result :=
              Parse_Natural_Date_Range (Reference, Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;
      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Natural_Date_Range;

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result
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
            Result : Date_Range_Parse_Result :=
              Parse_Natural_Date_Range_With_Rules
                (Reference, Text (Text'First .. Stop), Rules);
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;
      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Natural_Date_Range;

   function Business_Result
     (Kind       : Business_Calendar_Parse_Kind;
      Consumed   : Natural;
      Date       : Ada.Calendar.Time := Ada.Calendar.Clock;
      End_Date   : Ada.Calendar.Time := Ada.Calendar.Clock;
      Month      : Ada.Calendar.Month_Number := 1;
      Day        : Ada.Calendar.Day_Number := 1;
      Weekday    : Natural := 0;
      Start_Hour : Natural := 0;
      End_Hour   : Natural := 0)
      return Business_Calendar_Parse_Result
   is
   begin
      return
        (Status     => Humanize.Status.Ok,
         Kind       => Kind,
         Date       => Date,
         End_Date   => End_Date,
         Month      => Month,
         Day        => Day,
         Weekday    => Weekday,
         Start_Hour => Start_Hour,
         End_Hour   => End_Hour,
         Exact      => True,
         Consumed   => Consumed,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Business_Result;

   function Parse_Hour (Text : String; Value : out Natural) return Boolean
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Parse_Hour;
   function Parse_Hour_Range
     (Text       : String;
      Start_Hour : out Natural;
      End_Hour   : out Natural)
      return Boolean
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Parse_Hour_Range;
   function Month_Day_From_Text
     (Text  : String;
      Month : out Ada.Calendar.Month_Number;
      Day   : out Ada.Calendar.Day_Number)
      return Boolean
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Month_Day_From_Text;
   function Is_Default_Open_Hour (Value : Ada.Calendar.Time) return Boolean
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Is_Default_Open_Hour;
   function Next_Default_Open_Hour
     (Reference : Ada.Calendar.Time;
      Hour      : out Natural)
      return Ada.Calendar.Time
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Next_Default_Open_Hour;
   function Parse_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result
      is separate;

   function Scan_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result
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
            Result : Business_Calendar_Parse_Result :=
              Parse_Business_Calendar (Reference, Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;
      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Business_Calendar;

   function Apply_Business_Calendar_Rule
     (Rules : in out Humanize.Durations.Business_Calendar_Rules;
      Rule  : Business_Calendar_Parse_Result)
      return Humanize.Status.Status_Code
   is
   begin
      if Rule.Status /= Humanize.Status.Ok then
         return Humanize.Status.Invalid_Argument;
      end if;
      case Rule.Kind is
         when Business_One_Off_Holiday =>
            return Humanize.Durations.Add_One_Off_Holiday (Rules, Rule.Date);
         when Business_Recurring_Holiday =>
            return Humanize.Durations.Add_Recurring_Holiday
              (Rules, Rule.Month, Rule.Day);
         when Business_Half_Day =>
            return Humanize.Durations.Add_Half_Day
              (Rules, Rule.Date, Rule.End_Hour);
         when Business_Shutdown =>
            return Humanize.Durations.Add_Shutdown
              (Rules, Rule.Date, Rule.End_Date);
         when Business_Hour_Range =>
            return Humanize.Durations.Set_Business_Hours
              (Rules, Rule.Weekday, Rule.Start_Hour, Rule.End_Hour);
         when Business_Next_Open_Hour =>
            return Humanize.Status.Invalid_Argument;
      end case;
   end Apply_Business_Calendar_Rule;

   function Parse_Business_Calendar_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Rules_Parse_Result
      is separate;

   function Parse_Date_Difference_Components
     (Text   : String;
      Years  : out Natural;
      Months : out Natural;
      Days   : out Natural)
      return Boolean
      is separate;
   function Parse_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result
      is separate;
   function Scan_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result
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
            Result : constant Date_Comparison_Parse_Result :=
              Parse_Date_Comparison (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Date_Comparison;

   function Parse_Time_Of_Day
     (Text   : String;
      Hour   : out Natural;
      Minute : out Natural;
      Consumed : out Natural)
      return Boolean
      is separate;

   function With_Clock_Time
     (Date   : Ada.Calendar.Time;
      Hour   : Natural;
      Minute : Natural)
      return Ada.Calendar.Time
   is
      Year : Ada.Calendar.Year_Number;
      Month : Ada.Calendar.Month_Number;
      Day : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Date, Year, Month, Day, Seconds);
      return Ada.Calendar.Time_Of
        (Year, Month, Day,
         Ada.Calendar.Day_Duration (Hour * 3_600 + Minute * 60));
   end With_Clock_Time;

   function Natural_Date_Time_Result
     (Value               : Ada.Calendar.Time;
      Consumed            : Natural;
      Has_Time            : Boolean;
      Has_Relative_Offset : Boolean)
      return Natural_Date_Time_Parse_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Value => Value,
         Has_Time => Has_Time,
         Has_Relative_Offset => Has_Relative_Offset,
         Exact => True,
         Consumed => Consumed,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Natural_Date_Time_Result;

   function Parse_Natural_Date_Time
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Natural_Date_Time_Parse_Result
      is separate;

   function Scan_Natural_Date_Time
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Natural_Date_Time_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;
      for Stop in reverse Text'First .. Last loop
         declare
            Result : Natural_Date_Time_Parse_Result :=
              Parse_Natural_Date_Time (Reference, Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;
      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         Error => Unsupported_Form,
         others => <>);
   end Scan_Natural_Date_Time;
end Humanize.Parsing.Implementation.Date_Time_Text_Helpers;
