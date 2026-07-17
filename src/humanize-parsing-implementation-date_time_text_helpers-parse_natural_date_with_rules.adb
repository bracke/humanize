separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Natural_Date_With_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
     return Date_Parse_Result
   is
      Item : constant String := Canonical_Natural_Date_Text (Text);
      Base : constant Ada.Calendar.Time := Day_Start (Reference);
      Parsed : Ada.Calendar.Time;
      Count  : Integer;
      Unit   : Unbounded_String;
      Prefix : Unbounded_String;
      Seconds : Ada.Calendar.Day_Duration;
      Timezone_Offset : Integer := 0;
      Has_Timezone_Offset : Boolean := False;

      function Business_Month_Start
        (Direction : Integer)
         return Ada.Calendar.Time
      is
         Candidate : Ada.Calendar.Time :=
           Add_Months (Month_Start (Base), Direction);
      begin
         for Attempt in 1 .. 31 loop
            if Humanize.Durations.Is_Business_Day (Candidate, Rules) then
               return Candidate;
            end if;
            Candidate := Add_Calendar_Days (Candidate, 1);
         end loop;
         return Candidate;
      end Business_Month_Start;

      function Business_Month_End
        (Direction : Integer)
         return Ada.Calendar.Time
      is
         Candidate : Ada.Calendar.Time :=
           Add_Calendar_Days
             (Add_Months (Month_Start (Base), Direction + 1), -1);
      begin
         for Attempt in 1 .. 31 loop
            if Humanize.Durations.Is_Business_Day (Candidate, Rules) then
               return Candidate;
            end if;
            Candidate := Add_Calendar_Days (Candidate, -1);
         end loop;
         return Candidate;
      end Business_Month_End;

      function Business_Month_Direction
        (Phrase : String;
         Direction : out Integer)
         return Boolean
      is
         Phrase_Text : constant String := Trim (Phrase);
      begin
         if Phrase_Text = "this business month" then
            Direction := 0;
         elsif Phrase_Text = "next business month" then
            Direction := 1;
         elsif Phrase_Text = "last business month"
           or else Phrase_Text = "previous business month"
         then
            Direction := -1;
         else
            return False;
         end if;
         return True;
      end Business_Month_Direction;
begin
      if Item'Length = 0 then
         return
            (Status => Humanize.Status.Invalid_Argument,
             Error_Position => Text'First,
             Error => Empty_Input,
             others => <>);
      end if;
      if Strip_Time_Of_Day
        (Item, Prefix, Seconds, Timezone_Offset, Has_Timezone_Offset)
      then
         declare
            Date : constant Date_Parse_Result :=
              Parse_Natural_Date_With_Rules
                (Reference, To_String (Prefix), Rules);
         begin
            if Date.Status = Humanize.Status.Ok then
               declare
                  Parsed_Date : constant Ada.Calendar.Time :=
                    With_Time_Of_Day (Date.Value, Seconds);
                  Timezone_Adjustment : constant Duration :=
                    (if Has_Timezone_Offset
                     then -Duration (Timezone_Offset) * 60.0
                     else 0.0);
               begin
                  return Date_Result
                    (Parsed_Date + Timezone_Adjustment,
                     Item'Length);
               end;
            else
               return Date;
            end if;
         end;
      elsif Parse_ISO_Date (Item, Parsed)
        or else Parse_ISO_Ordinal_Date (Item, Parsed)
        or else Parse_ISO_Week_Date (Item, Parsed)
        or else Parse_Month_Name_Date (Reference, Item, Parsed)
        or else Parse_Month_Day_Ordinal_Date (Reference, Item, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Item = "today" or else Item = "now" then
         return Date_Result (Base, Item'Length);
      elsif Item = "later today" then
         declare
            Year  : Ada.Calendar.Year_Number;
            Month : Ada.Calendar.Month_Number;
            Day   : Ada.Calendar.Day_Number;
         begin
            Ada.Calendar.Split (Reference, Year, Month, Day, Seconds);
            return Date_Result
              (With_Time_Of_Day
                 (Base,
                  Ada.Calendar.Day_Duration'Min
                    (Seconds + 3_600.0, 86_399.0)),
               Item'Length);
         end;
      elsif Item = "tonight" then
         return Date_Result (With_Time_Of_Day (Base, 21.0 * 3_600.0),
                             Item'Length);
      elsif Item = "tomorrow" then
         return Date_Result (Add_Calendar_Days (Base, 1), Item'Length);
      elsif Item = "yesterday" then
         return Date_Result (Add_Calendar_Days (Base, -1), Item'Length);
      elsif Parse_Repeated_Weekday (Base, Item, Parsed) then
         return Date_Result (Parsed, Item'Length);
      elsif Parse_Ordinal_Weekday_Date (Reference, Item, Parsed) then
         return Date_Result (Parsed, Item'Length);
      elsif Parse_Weekday_Day_Ordinal_Date (Reference, Item, Parsed) then
         return Date_Result (Parsed, Item'Length);
      elsif Starts_With (Item, "start of ")
        and then Business_Month_Direction
          (Item (Item'First + 9 .. Item'Last), Count)
      then
         return Date_Result (Business_Month_Start (Count), Item'Length);
      elsif Starts_With (Item, "end of ")
        and then Business_Month_Direction
          (Item (Item'First + 7 .. Item'Last), Count)
      then
         return Date_Result (Business_Month_End (Count), Item'Length);
      elsif Starts_With (Item, "start of ")
        and then Boundary_Date
          (Reference, Item (Item'First + 9 .. Item'Last), False, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Starts_With (Item, "beginning of ")
        and then Boundary_Date
          (Reference, Item (Item'First + 13 .. Item'Last), False, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Ends_With (Item, " start")
        and then Boundary_Date
          (Reference, Item (Item'First .. Item'Last - 6), False, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Starts_With (Item, "end of ")
        and then Boundary_Date
          (Reference, Item (Item'First + 7 .. Item'Last), True, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Ends_With (Item, " end")
        and then Boundary_Date
          (Reference, Item (Item'First .. Item'Last - 4), True, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif (Starts_With (Item, "next business ")
             or else Starts_With (Item, "last business ")
             or else Starts_With (Item, "this business "))
        and then Item /= "next business day"
        and then Item /= "last business day"
      then
         declare
            Direction : constant Integer :=
              (if Starts_With (Item, "last business ") then -1
               elsif Starts_With (Item, "next business ") then 1
               else 0);
            Phrase_Body : constant String :=
              Item (Item'First + 14 .. Item'Last);
            Target : constant Natural := Weekday_Value (Phrase_Body);
            Candidate : Ada.Calendar.Time := Base;
            Step : constant Integer := (if Direction < 0 then -1 else 1);
         begin
            if Target = 0 then
               return
                 (Status => Humanize.Status.Invalid_Argument,
                  Error_Position => Item'First + 14,
                  Error => Expected_Unit,
                  others => <>);
            end if;

            if Direction /= 0 then
               Candidate := Add_Calendar_Days (Candidate, Step);
            end if;

            for Attempt in 1 .. 370 loop
               if Weekday_Number
                 (Ada.Calendar.Formatting.Day_Of_Week (Candidate)) = Target
                 and then Humanize.Durations.Is_Business_Day
                   (Candidate, Rules)
               then
                  return Date_Result (Candidate, Item'Length);
               end if;
               Candidate := Add_Calendar_Days (Candidate, Step);
            end loop;

            return
              (Status => Humanize.Status.Invalid_Value,
               Error => Out_Of_Range,
               Error_Position => Item'First,
               others => <>);
         end;
      elsif Item = "next business day" then
         return Date_Result
           (Humanize.Durations.Add_Business_Days (Base, 1, Rules),
            Item'Length);
      elsif Item = "last business day" or else Item = "previous business day" then
         return Date_Result
           (Humanize.Durations.Add_Business_Days (Base, -1, Rules),
            Item'Length);
      elsif Starts_With (Item, "in ")
        and then Ends_With (Item, " business days")
        and then Parse_Natural_Count
          (Item (Item'First + 3 .. Item'Last - 14), Count)
      then
         return Date_Result
           (Humanize.Durations.Add_Business_Days (Base, Count, Rules),
            Item'Length);
      elsif Ends_With (Item, " business days from now")
        and then Parse_Natural_Count
          (Item (Item'First .. Item'Last - 23), Count)
      then
         return Date_Result
           (Humanize.Durations.Add_Business_Days (Base, Count, Rules),
            Item'Length);
      elsif Ends_With (Item, " business days ago")
        and then Parse_Natural_Count
          (Item (Item'First .. Item'Last - 18), Count)
      then
         return Date_Result
           (Humanize.Durations.Add_Business_Days (Base, -Count, Rules),
            Item'Length);
      elsif Item = "business day" then
         return Date_Result
           (Humanize.Durations.Add_Business_Days (Base, 1, Rules),
            Item'Length);
      elsif Item = "business days" then
         return Date_Result (Base, Item'Length);
      elsif Parse_Business_Days_Before_Boundary
        (Reference, Item, Rules, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Boundary_Date (Reference, Item, False, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Starts_With (Item, "in a few ")
        and then Known_Date_Unit (Item (Item'First + 9 .. Item'Last))
      then
         return Date_Result
           (Unit_Days (Base, 3, Item (Item'First + 9 .. Item'Last)),
            Item'Length);
      elsif Starts_With (Item, "in ")
        and then Split_Count_Unit
          (Item (Item'First + 3 .. Item'Last), Count, Unit)
        and then Known_Date_Unit (To_String (Unit))
      then
         return Date_Result (Unit_Days (Base, Count, To_String (Unit)), Item'Length);
      elsif Ends_With (Item, " ago")
        and then Split_Count_Unit
          (Item (Item'First .. Item'Last - 4), Count, Unit)
        and then Known_Date_Unit (To_String (Unit))
      then
         return Date_Result (Unit_Days (Base, -Count, To_String (Unit)), Item'Length);
      elsif Ends_With (Item, " from now")
        and then Split_Count_Unit
          (Item (Item'First .. Item'Last - 9), Count, Unit)
        and then Known_Date_Unit (To_String (Unit))
      then
         return Date_Result (Unit_Days (Base, Count, To_String (Unit)), Item'Length);
      elsif Ends_With (Item, " after next") then
         declare
            Weekday_Text : constant String :=
              Trim (Item (Item'First .. Item'Last - 11));
            Target : constant Natural := Weekday_Value_Flexible (Weekday_Text);
         begin
            if Target = 0 then
               return
                 (Status => Humanize.Status.Invalid_Argument,
                  Error => Expected_Unit,
                  Error_Position => Item'First,
                  others => <>);
            end if;
            return Date_Result
              (Repeated_Weekday_Date (Base, 2, Target), Item'Length);
         end;
      elsif Ends_With (Item, " before next") then
         declare
            Weekday_Text : constant String :=
              Trim (Item (Item'First .. Item'Last - 12));
            Target : constant Natural := Weekday_Value_Flexible (Weekday_Text);
         begin
            if Target = 0 then
               return
                 (Status => Humanize.Status.Invalid_Argument,
                  Error => Expected_Unit,
                  Error_Position => Item'First,
                  others => <>);
            end if;
            return Date_Result
              (Add_Calendar_Days (Repeated_Weekday_Date (Base, 1, Target), -7),
               Item'Length);
         end;
      elsif Starts_With (Item, "next month on ")
        or else Starts_With (Item, "this month on ")
        or else Starts_With (Item, "last month on ")
      then
         declare
            Direction : constant Integer :=
              (if Starts_With (Item, "next ") then 1
               elsif Starts_With (Item, "last ") then -1
               else 0);
            Day_Text_First : constant Natural :=
              (if Starts_With (Item, "this ") then Item'First + 14
               else Item'First + 14);
            Raw_Day_Text : constant String :=
              Item (Day_Text_First .. Item'Last);
            Day_Text : constant String :=
              (if Starts_With (Raw_Day_Text, "the ")
               then Raw_Day_Text (Raw_Day_Text'First + 4 .. Raw_Day_Text'Last)
               else Raw_Day_Text);
            Error_At : constant Natural :=
              (if Starts_With (Raw_Day_Text, "the ")
               then Day_Text_First + 4
               else Day_Text_First);
            Day_Number : constant Integer :=
              Ordinal_Value (Day_Text);
            Target_Month : constant Ada.Calendar.Time :=
              Add_Months (Month_Start (Base), Direction);
            Year : Ada.Calendar.Year_Number;
            Month : Ada.Calendar.Month_Number;
            Current_Day : Ada.Calendar.Day_Number;
            Ignored : Ada.Calendar.Day_Duration;
         begin
            if Day_Number < 1 or else Day_Number > 31 then
               return
                  (Status => Humanize.Status.Invalid_Argument,
                  Error => Expected_Number,
                  Error_Position => Error_At,
                  others => <>);
            end if;
            Ada.Calendar.Split (Target_Month, Year, Month, Current_Day, Ignored);
            return Date_Result
              (Ada.Calendar.Time_Of
                 (Year, Month, Ada.Calendar.Day_Number (Day_Number), 0.0),
               Item'Length);
         exception
            when others =>
               return
                  (Status => Humanize.Status.Invalid_Value,
                  Error => Out_Of_Range,
                  Error_Position => Error_At,
                  others => <>);
         end;
      elsif Starts_With (Item, "next ") or else Starts_With (Item, "last ")
        or else Starts_With (Item, "this ")
      then
         declare
            Prefix_Length : constant Natural :=
              (if Starts_With (Item, "this ") then 5 else 5);
            Direction : constant Integer :=
              (if Starts_With (Item, "last ") then -1
               elsif Starts_With (Item, "next ") then 1
               else 0);
            Phrase_Body : constant String :=
              Item (Item'First + Prefix_Length .. Item'Last);
            Target : constant Natural := Weekday_Value (Phrase_Body);
            Current : constant Natural := Weekday_Number
              (Ada.Calendar.Formatting.Day_Of_Week (Base));
            Offset : Integer;
         begin
            if Phrase_Body = "day" then
               return Date_Result
                 (Add_Calendar_Days (Base, Direction), Item'Length);
            elsif Phrase_Body = "week" then
               return Date_Result
                 (Add_Calendar_Days (Week_Start (Base), Direction * 7),
                  Item'Length);
            elsif Phrase_Body = "month" then
               return Date_Result (Add_Months (Month_Start (Base), Direction),
                                   Item'Length);
            elsif Phrase_Body = "year" then
               return Date_Result (Add_Years (Year_Start (Base), Direction),
                                   Item'Length);
            elsif Target = 0 then
               return
                 (Status => Humanize.Status.Invalid_Argument,
                  Error_Position => Item'First + Prefix_Length,
                  Error => Expected_Unit,
                  others => <>);
            end if;

            if Direction > 0 then
               Offset := (if Target > Current then Target - Current
                          else Target + 7 - Current);
               if Offset = 0 then
                  Offset := 7;
               end if;
            elsif Direction < 0 then
               Offset := (if Target < Current then Integer (Target) - Integer (Current)
                          else Integer (Target) - Integer (Current) - 7);
               if Offset = 0 then
                  Offset := -7;
               end if;
            else
               Offset := Integer (Target) - Integer (Current);
            end if;
            return Date_Result
              (Add_Calendar_Days (Base, Offset), Item'Length);
         end;
      else
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'First,
            Error => Unsupported_Form,
            others => <>);
      end if;
exception
      when others =>
         return
           (Status => Humanize.Status.Invalid_Value,
            Error_Position => Text'First,
            Error => Out_Of_Range,
            others => <>);
end Parse_Natural_Date_With_Rules;
