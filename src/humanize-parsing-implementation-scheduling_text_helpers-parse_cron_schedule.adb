separate (Humanize.Parsing.Implementation.Scheduling_Text_Helpers)
function Parse_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Field_Start : Natural := Item'First;
      Field_Count : Natural := 0;
      Fields : array (Positive range 1 .. 7) of Unbounded_String :=
        [others => To_Unbounded_String ("")];

      function Parse_Natural (S : String; N : out Natural) return Boolean is
         V : Natural := 0;
      begin
         if S'Length = 0 then
            return False;
         end if;

         for Ch of S loop
            if not Is_Digit (Ch) then
               return False;
            end if;
            V := V * 10 + Digit_Value (Ch);
         end loop;

         N := V;
         return True;
      end Parse_Natural;

      function Cron_Weekday (S : String) return Natural is
      begin
         if S = "1" or else S = "mon" or else S = "monday" then
            return 1;
         elsif S = "2" or else S = "tue" or else S = "tuesday" then
            return 2;
         elsif S = "3" or else S = "wed" or else S = "wednesday" then
            return 3;
         elsif S = "4" or else S = "thu" or else S = "thursday" then
            return 4;
         elsif S = "5" or else S = "fri" or else S = "friday" then
            return 5;
         elsif S = "6" or else S = "sat" or else S = "saturday" then
            return 6;
         elsif S = "0" or else S = "7"
           or else S = "sun" or else S = "sunday"
         then
            return 7;
         else
            return 0;
         end if;
      end Cron_Weekday;

      function Cron_Month (S : String) return Natural is
      begin
         if S = "1" or else S = "jan" or else S = "january" then
            return 1;
         elsif S = "2" or else S = "feb" or else S = "february" then
            return 2;
         elsif S = "3" or else S = "mar" or else S = "march" then
            return 3;
         elsif S = "4" or else S = "apr" or else S = "april" then
            return 4;
         elsif S = "5" or else S = "may" then
            return 5;
         elsif S = "6" or else S = "jun" or else S = "june" then
            return 6;
         elsif S = "7" or else S = "jul" or else S = "july" then
            return 7;
         elsif S = "8" or else S = "aug" or else S = "august" then
            return 8;
         elsif S = "9" or else S = "sep" or else S = "september" then
            return 9;
         elsif S = "10" or else S = "oct" or else S = "october" then
            return 10;
         elsif S = "11" or else S = "nov" or else S = "november" then
            return 11;
         elsif S = "12" or else S = "dec" or else S = "december" then
            return 12;
         else
            return 0;
         end if;
      end Cron_Month;

      function Is_Any (S : String) return Boolean is
      begin
         return S = "*" or else S = "?";
      end Is_Any;

      function Parse_Step
        (S    : String;
         Step : out Natural)
         return Boolean
      is
         Slash : Natural := 0;
      begin
         for Index in S'Range loop
            if S (Index) = '/' then
               Slash := Index;
               exit;
            end if;
         end loop;

         if Slash = 0 or else Slash = S'Last then
            return False;
         elsif S (S'First .. Slash - 1) /= "*"
           and then S (S'First .. Slash - 1) /= "?"
           and then S (S'First .. Slash - 1) /= "0"
         then
            return False;
         elsif not Parse_Natural (S (Slash + 1 .. S'Last), Step)
           or else Step = 0
         then
            return False;
         end if;

         return True;
      end Parse_Step;

      function Parse_Weekday_Field
        (S       : String;
         Days    : out Humanize.Durations.Weekday_Set;
         Single  : out Natural;
         Is_List : out Boolean)
         return Boolean
      is
         Part_Start : Natural := S'First;
         Count      : Natural := 0;

         function Add_Part (Part : String) return Boolean is
            Dash : Natural := 0;
            First_Day : Natural;
            Last_Day  : Natural;

            procedure Mark_Range (A, B : Natural) is
            begin
               if A <= B then
                  for Day in A .. B loop
                     Days (Day) := True;
                  end loop;
               else
                  for Day in A .. 7 loop
                     Days (Day) := True;
                  end loop;
                  for Day in 1 .. B loop
                     Days (Day) := True;
                  end loop;
               end if;
            end Mark_Range;
         begin
            if Part'Length = 0 then
               return False;
            end if;

            for Index in Part'Range loop
               if Part (Index) = '-' then
                  Dash := Index;
                  exit;
               end if;
            end loop;

            if Dash /= 0 then
               if Dash = Part'First or else Dash = Part'Last then
                  return False;
               end if;
               First_Day := Cron_Weekday (Part (Part'First .. Dash - 1));
               Last_Day := Cron_Weekday (Part (Dash + 1 .. Part'Last));
               if First_Day = 0 or else Last_Day = 0 then
                  return False;
               end if;
               Mark_Range (First_Day, Last_Day);
               Count := Count + 2;
            else
               First_Day := Cron_Weekday (Part);
               if First_Day = 0 then
                  return False;
               end if;
               Days (First_Day) := True;
               Single := First_Day;
               Count := Count + 1;
            end if;

            return True;
         end Add_Part;
      begin
         Days := [others => False];
         Single := 0;
         Is_List := False;

         if Is_Any (S) then
            Days := Humanize.Durations.Every_Day_Set;
            return True;
         end if;

         for Index in S'Range loop
            if S (Index) = ',' then
               if not Add_Part (S (Part_Start .. Index - 1)) then
                  return False;
               end if;
               Is_List := True;
               Part_Start := Index + 1;
            end if;
         end loop;

         if Part_Start <= S'Last then
            if not Add_Part (S (Part_Start .. S'Last)) then
               return False;
            end if;
         else
            return False;
         end if;

         if Count /= 1 then
            Single := 0;
         end if;
         return True;
      end Parse_Weekday_Field;

      function Parse_Last_Weekday
        (S       : String;
         Weekday : out Natural)
         return Boolean
      is
      begin
         Weekday := 0;
         if S'Length < 2 or else S (S'Last) /= 'l' then
            return False;
         end if;

         Weekday := Cron_Weekday (S (S'First .. S'Last - 1));
         return Weekday /= 0;
      end Parse_Last_Weekday;

      function Parse_Nth_Weekday
        (S       : String;
         Weekday : out Natural;
         Nth     : out Natural)
         return Boolean
      is
         Hash : Natural := 0;
      begin
         Weekday := 0;
         Nth := 0;
         for Index in S'Range loop
            if S (Index) = '#' then
               Hash := Index;
               exit;
            end if;
         end loop;

         if Hash = 0 or else Hash = S'First or else Hash = S'Last then
            return False;
         end if;

         Weekday := Cron_Weekday (S (S'First .. Hash - 1));
         return Weekday /= 0
           and then Parse_Natural (S (Hash + 1 .. S'Last), Nth)
           and then Nth in 1 .. 5;
      end Parse_Nth_Weekday;

      function Parse_Nearest_Weekday_Day
        (S   : String;
         Day : out Natural)
         return Boolean
      is
      begin
         Day := 0;
         if S'Length < 2 or else S (S'Last) /= 'w' then
            return False;
         end if;

         return Parse_Natural (S (S'First .. S'Last - 1), Day)
           and then Day in 1 .. 31;
      end Parse_Nearest_Weekday_Day;

      function Is_Every_Day
        (Days : Humanize.Durations.Weekday_Set)
         return Boolean
      is
      begin
         for Day in Days'Range loop
            if not Days (Day) then
               return False;
            end if;
         end loop;
         return True;
      end Is_Every_Day;

      Minute_Value : Natural := 0;
      Hour_Value : Natural := 0;
      Day_Value : Natural := 0;
      Month_Value : Natural := 0;
      Weekday_Value : Natural := 0;
      Nth_Value : Natural := 0;
      Second_Value : Natural := 0;
      Year_Value : Natural := 0;
      Step_Value : Natural := 0;
      Result : Recurrence_Parse_Result;
begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      for Index in Item'Range loop
         if Item (Index) = ' ' then
            if Field_Start < Index then
               Field_Count := Field_Count + 1;
               if Field_Count > 7 then
                  return Parse_Recurrence_Detail (Ada.Calendar.Clock, Item);
               end if;
               Fields (Field_Count) :=
                 To_Unbounded_String (Item (Field_Start .. Index - 1));
            end if;
            Field_Start := Index + 1;
         end if;
      end loop;

      if Field_Start <= Item'Last then
         Field_Count := Field_Count + 1;
         if Field_Count > 7 then
            return Parse_Recurrence_Detail (Ada.Calendar.Clock, Item);
         end if;
         Fields (Field_Count) :=
           To_Unbounded_String (Item (Field_Start .. Item'Last));
      end if;

      if Field_Count not in 5 .. 7 then
         return Parse_Recurrence_Detail (Ada.Calendar.Clock, Item);
      end if;

      declare
         Offset : constant Natural := (if Field_Count = 5 then 0 else 1);
         S : constant String :=
           (if Field_Count = 5 then "" else To_String (Fields (1)));
         M : constant String := To_String (Fields (1 + Offset));
         H : constant String := To_String (Fields (2 + Offset));
         D : constant String := To_String (Fields (3 + Offset));
         Mo : constant String := To_String (Fields (4 + Offset));
         W : constant String := To_String (Fields (5 + Offset));
         Y : constant String :=
           (if Field_Count = 7 then To_String (Fields (7)) else "");
      begin
         if Field_Count >= 6 then
            if not Parse_Natural (S, Second_Value) or else Second_Value > 59 then
               return Parse_Recurrence_Detail (Ada.Calendar.Clock, Item);
            end if;
         end if;

         if Field_Count = 7 then
            if Is_Any (Y) then
               null;
            elsif not Parse_Natural (Y, Year_Value) then
               return Parse_Recurrence_Detail (Ada.Calendar.Clock, Item);
            end if;
         end if;

         if Is_Any (M) and then Is_Any (H) and then Is_Any (D)
           and then Is_Any (Mo) and then Is_Any (W)
         then
            Result := Recurrence_Result
              (Recurrence_Interval, 1, Humanize.Durations.Every_Minute,
               Item'Length);
            if Field_Count >= 6 then
               Result.Has_Second := True;
               Result.Second := Second_Value;
            end if;
            if Field_Count = 7 and then not Is_Any (Y) then
               Result.Has_Year := True;
               Result.Year := Year_Value;
            end if;
            return Result;
         end if;

         if Parse_Step (M, Step_Value) and then Step_Value <= 59
           and then Is_Any (H) and then Is_Any (D) and then Is_Any (Mo)
           and then Is_Any (W)
         then
            Result := Recurrence_Result
              (Recurrence_Interval, Positive (Step_Value),
               Humanize.Durations.Every_Minute, Item'Length);
            if Field_Count >= 6 then
               Result.Has_Second := True;
               Result.Second := Second_Value;
            end if;
            if Field_Count = 7 and then not Is_Any (Y) then
               Result.Has_Year := True;
               Result.Year := Year_Value;
            end if;
            return Result;
         end if;

         if not Parse_Natural (M, Minute_Value) or else Minute_Value > 59 then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;

         if Is_Any (H) and then Is_Any (D) and then Is_Any (Mo)
           and then Is_Any (W)
         then
            Result := Recurrence_Result
              (Recurrence_Interval, 1, Humanize.Durations.Every_Hour,
               Item'Length);
            Result.Has_Time := True;
            Result.Minute := Minute_Value;
            return Result;
         end if;

         if Parse_Step (H, Step_Value) and then Step_Value <= 23
           and then Is_Any (D) and then Is_Any (Mo) and then Is_Any (W)
         then
            Result := Recurrence_Result
              (Recurrence_Interval, Positive (Step_Value),
               Humanize.Durations.Every_Hour, Item'Length);
            Result.Has_Time := True;
            Result.Minute := Minute_Value;
            return Result;
         elsif not Parse_Natural (H, Hour_Value) or else Hour_Value > 23 then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;

         if Parse_Step (D, Step_Value) and then Step_Value <= 31
           and then Is_Any (Mo) and then Is_Any (W)
         then
            Result := Recurrence_Result
              (Recurrence_Interval, Positive (Step_Value),
               Humanize.Durations.Every_Day, Item'Length);
         elsif Is_Any (D) and then Is_Any (Mo) and then Is_Any (W) then
            Result := Recurrence_Result
              (Recurrence_Interval, 1, Humanize.Durations.Every_Day,
               Item'Length);
         elsif Is_Any (D) and then Is_Any (Mo) then
            declare
               Days : Humanize.Durations.Weekday_Set;
               Is_List : Boolean;
            begin
               if Parse_Last_Weekday (W, Weekday_Value) then
                  Result := Recurrence_Result
                    (Recurrence_Ordinal_Weekday, 1,
                     Humanize.Durations.Every_Month, Item'Length,
                     Weekday => Weekday_Value, Ordinal => -1);
                  Result.Is_Last_Weekday := True;
               elsif Parse_Nth_Weekday (W, Weekday_Value, Nth_Value) then
                  Result := Recurrence_Result
                    (Recurrence_Ordinal_Weekday, 1,
                     Humanize.Durations.Every_Month, Item'Length,
                     Weekday => Weekday_Value, Ordinal => Integer (Nth_Value));
                  Result.Nth_Weekday := Nth_Value;
               elsif not Parse_Weekday_Field (W, Days, Weekday_Value, Is_List)
                 or else Is_Every_Day (Days)
               then
                  return
                    (Status => Humanize.Status.Invalid_Argument,
                     others => <>);
               elsif Weekday_Value /= 0 and then not Is_List then
                  Result := Recurrence_Result
                    (Recurrence_Weekday, 1, Humanize.Durations.Every_Week,
                     Item'Length, Weekday => Weekday_Value);
               else
                  Result := Recurrence_Result
                    (Recurrence_Weekday_Set, 1,
                     Humanize.Durations.Every_Week, Item'Length,
                     Weekdays => Days);
               end if;
            end;
         elsif Is_Any (W)
           and then (D = "l"
                     or else Parse_Nearest_Weekday_Day (D, Day_Value)
                     or else (Parse_Natural (D, Day_Value)
                              and then Day_Value in 1 .. 31))
         then
            Month_Value := (if Is_Any (Mo) then 0 else Cron_Month (Mo));
            if (not Is_Any (Mo)) and then Month_Value = 0 then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
            Result := Recurrence_Result
              (Recurrence_Interval, 1,
               (if Month_Value = 0
                then Humanize.Durations.Every_Month
                else Humanize.Durations.Every_Year),
               Item'Length);
            if D = "l" then
               Result.Is_Last_Day_Of_Month := True;
            else
               Result.Day_Of_Month := Day_Value;
               Result.Is_Nearest_Weekday := D (D'Last) = 'w';
            end if;
            Result.Month_Of_Year := Month_Value;
         else
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;

         Result.Has_Time := True;
         Result.Hour := Hour_Value;
         Result.Minute := Minute_Value;
         if Field_Count >= 6 then
            Result.Has_Second := True;
            Result.Second := Second_Value;
         end if;
         if Field_Count = 7 and then not Is_Any (Y) then
            Result.Has_Year := True;
            Result.Year := Year_Value;
         end if;
         return Result;
      end;
exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Value, others => <>);
end Parse_Cron_Schedule;
