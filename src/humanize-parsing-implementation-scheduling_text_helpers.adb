with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Durations;
with Humanize.Parsing.Aliases;
with Humanize.Parsing.Implementation.Date_Time_Text_Helpers;
with Humanize.Parsing.Implementation.Date_Text_Helpers;
with Humanize.Parsing.Implementation.Numeric_Text_Helpers;
with Humanize.Parsing.Support;
with Humanize.Status;

package body Humanize.Parsing.Implementation.Scheduling_Text_Helpers is
   use Ada.Strings.Unbounded;
   use type Humanize.Status.Status_Code;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;
   function U (Code : Natural) return String
      renames Humanize.Bounded_Text.UTF8_Code_Point;
   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;
   function Digit_Value (Item : Character) return Natural
      renames Humanize.Bounded_Text.Digit_Value;
   function Is_Lower (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Lowercase;
   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;
   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;
   function Find_Substring (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;
   function Has_Alias
     (Item    : String;
      Aliases : String)
      return Boolean
      renames Humanize.Parsing.Aliases.Has_Alias;
   function Alias_Prefix_Length
     (Item    : String;
      Aliases : String)
      return Natural
      renames Humanize.Parsing.Aliases.Alias_Prefix_Length;
   function Scan_End (Text : String) return Natural
      renames Humanize.Parsing.Support.Scan_End;
   function Numeric_Value (Text : String; Value : out Long_Float)
      return Boolean
      renames Humanize.Parsing.Support.Numeric_Value;
   function Parse_Two_Naturals
     (Left_Text  : String;
      Right_Text : String;
      Left       : out Natural;
      Right      : out Natural)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Two_Naturals;

   function Parse_Natural_Count (Text : String; Value : out Integer)
      return Boolean
   is
      Item   : constant String := Clean_Lower (Text);
      Amount : Long_Float;
   begin
      if Item = "a" or else Item = "an" or else Item = "one" then
         Value := 1;
         return True;
      elsif Item = "couple" or else Item = "a couple" then
         Value := 2;
         return True;
      elsif Item = "two" then
         Value := 2;
         return True;
      elsif Item = "few" or else Item = "a few" then
         Value := 3;
         return True;
      elsif Item = "three" then
         Value := 3;
         return True;
      elsif Item = "four" then
         Value := 4;
         return True;
      elsif Item = "five" then
         Value := 5;
         return True;
      elsif Item = "six" then
         Value := 6;
         return True;
      elsif Item = "several" then
         Value := 7;
         return True;
      elsif Item = "seven" then
         Value := 7;
         return True;
      elsif Item = "eight" then
         Value := 8;
         return True;
      elsif Item = "nine" then
         Value := 9;
         return True;
      elsif Item = "ten" then
         Value := 10;
         return True;
      elsif Numeric_Value (Item, Amount) and then Amount >= 0.0 then
         Value := Integer (Long_Float'Rounding (Amount));
         return Long_Float (Value) = Amount;
      else
         return False;
      end if;
   end Parse_Natural_Count;

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Time_Text_Helpers.Parse_Natural_Date;
   function Weekday_Value_Flexible (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Weekday_Value_Flexible;
   function Recurrence_Unit_Value
     (Text : String;
      Unit : out Humanize.Durations.Recurrence_Unit)
      return Boolean
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Recurrence_Unit_Value;
   function Recurrence_Ordinal_Value (Text : String) return Integer
      renames Humanize.Parsing.Implementation.Date_Text_Helpers.Recurrence_Ordinal_Value;

   function Recurrence_Result
     (Kind     : Recurrence_Parse_Kind;
      Every    : Positive;
      Unit     : Humanize.Durations.Recurrence_Unit;
      Consumed : Natural;
      Weekday  : Natural := 0;
      Ordinal  : Integer := 0;
      Weekdays : Humanize.Durations.Weekday_Set :=
        Humanize.Durations.Every_Day_Set)
      return Recurrence_Parse_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Kind => Kind,
         Every => Every,
         Unit => Unit,
         Weekday => Weekday,
         Weekdays => Weekdays,
         Ordinal => Ordinal,
         Exact => True,
         Consumed => Consumed,
         others => <>);
   end Recurrence_Result;

   function Parse_Recurrence_Core
     (Core : String)
      return Recurrence_Parse_Result
      is separate;

   function Parse_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result
      is separate;

   function Parse_Recurrence
     (Text : String)
      return Number_Parse_Result
   is
      Detail : constant Recurrence_Parse_Result :=
        Parse_Recurrence_Detail (Ada.Calendar.Clock, Text);
   begin
      if Detail.Status /= Humanize.Status.Ok then
         return (Status => Detail.Status, others => <>);
      end if;
      return
        (Status => Humanize.Status.Ok,
         Value => Long_Long_Integer (Detail.Every),
         Exact => True,
         Consumed => Detail.Consumed,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Recurrence;

   function Parse_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result
      is separate;

   function Scan_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : Recurrence_Parse_Result :=
              Parse_Cron_Schedule (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Scan_Cron_Schedule;

   function Parse_Number_With_Suffix
     (Text   : String;
      Suffix : String)
      return Number_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Amount : Long_Float;
      Rounded : Long_Long_Integer;
   begin
      if not Ends_With (Item, Suffix)
        or else Item'Length <= Suffix'Length
        or else not Numeric_Value
          (Item (Item'First .. Item'Last - Suffix'Length), Amount)
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      Rounded := Long_Long_Integer (Long_Float'Rounding (Amount));
      return
        (Status => Humanize.Status.Ok,
         Value => Rounded,
         Exact => Long_Float (Rounded) = Amount,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when Constraint_Error => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Number_With_Suffix;

   function Parse_Business_Days
     (Text : String)
      return Number_Parse_Result is
   begin
      if Ends_With (Clean_Lower (Text), " business day") then
         return Parse_Number_With_Suffix (Text, " business day");
      else
         return Parse_Number_With_Suffix (Text, " business days");
      end if;
   end Parse_Business_Days;

   function Parse_Working_Hours
     (Text : String)
      return Number_Parse_Result is
   begin
      if Ends_With (Clean_Lower (Text), " working hour") then
         return Parse_Number_With_Suffix (Text, " working hour");
      else
         return Parse_Number_With_Suffix (Text, " working hours");
      end if;
   end Parse_Working_Hours;

   function Parse_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Remaining_Pos : constant Natural := Find_Substring (Item, " remaining at ");
      Count, Rate : Natural := 0;
      End_Count : Natural := Item'First - 1;
      Start_Rate : Natural;
      End_Rate : Natural;
   begin
      if Remaining_Pos = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      for Index in Item'First .. Remaining_Pos - 1 loop
         exit when Item (Index) = ' ';
         End_Count := Index;
      end loop;

      Start_Rate := Remaining_Pos + 14;
      End_Rate := Start_Rate - 1;
      while End_Rate + 1 <= Item'Last and then Item (End_Rate + 1) /= ' ' loop
         End_Rate := End_Rate + 1;
      end loop;

      if End_Count < Item'First
        or else End_Rate < Start_Rate
        or else not Parse_Two_Naturals
          (Item (Item'First .. End_Count),
           Item (Start_Rate .. End_Rate), Count, Rate)
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return (Status => Humanize.Status.Ok, Count => Count, Total => Rate,
              Exact => True, Consumed => Item'Length, Error_Position => 0,
              Error => No_Parse_Error);
   end Parse_Throughput_Remaining;

   function Scan_Business_Days
     (Text : String)
      return Number_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Number_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Business_Days (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Business_Days;

   function Scan_Working_Hours
     (Text : String)
      return Number_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Number_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Working_Hours (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Working_Hours;

   function Scan_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Proportion_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Throughput_Remaining (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Throughput_Remaining;

   function Scan_Recurrence
     (Text : String)
      return Number_Parse_Result
   is
      Detail : constant Recurrence_Parse_Result :=
        Scan_Recurrence_Detail (Ada.Calendar.Clock, Text);
   begin
      if Detail.Status /= Humanize.Status.Ok then
         return (Status => Detail.Status, others => <>);
      end if;
      return
        (Status => Humanize.Status.Ok,
         Value => Long_Long_Integer (Detail.Every),
         Exact => True,
         Consumed => Detail.Consumed,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Scan_Recurrence;

   function Scan_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : Recurrence_Parse_Result :=
              Parse_Recurrence_Detail
                (Reference, Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Scan_Recurrence_Detail;

   function Contains_Scheduling_Word
     (Text : String;
      Word : String)
      return Boolean
   is
   begin
      if Word'Length = 0 or else Text'Length < Word'Length then
         return False;
      end if;

      for Index in Text'First .. Text'Last - Word'Length + 1 loop
         if Text (Index .. Index + Word'Length - 1) = Word then
            declare
               Before_OK : constant Boolean :=
                 Index = Text'First
                 or else not (Is_Lower (Text (Index - 1))
                              or else Is_Digit (Text (Index - 1)));
               After_OK : constant Boolean :=
                 Index + Word'Length - 1 = Text'Last
                 or else not (Is_Lower (Text (Index + Word'Length))
                              or else Is_Digit (Text (Index + Word'Length)));
            begin
               if Before_OK and then After_OK then
                  return True;
               end if;
            end;
         end if;
      end loop;

      return False;
   end Contains_Scheduling_Word;

   function Classify_Scheduling_Phrase
     (Text : String)
      return Scheduling_Phrase_Result
      is separate;
end Humanize.Parsing.Implementation.Scheduling_Text_Helpers;
