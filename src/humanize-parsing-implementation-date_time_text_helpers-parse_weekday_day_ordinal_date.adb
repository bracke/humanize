separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Weekday_Day_Ordinal_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Value     : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      The_Pos : constant Natural := Find_Substring (Item, " the ");
      Ref_Start : constant Ada.Calendar.Time := Day_Start (Reference);
      Ref_Year : Ada.Calendar.Year_Number;
      Ref_Month : Ada.Calendar.Month_Number;
      Ref_Day : Ada.Calendar.Day_Number;
      Ref_Seconds : Ada.Calendar.Day_Duration;
      Weekday : Natural;
      Day : Integer;
      Best : Ada.Calendar.Time := Ref_Start;
      Best_Set : Boolean := False;
      Best_Distance : Duration := 0.0;
begin
      if The_Pos = 0 then
         return False;
      end if;

      Weekday := Weekday_Value (Item (Item'First .. The_Pos - 1));
      if Weekday = 0
        or else not Parse_Day_Token
          (Item (The_Pos + 5 .. Item'Last), Day)
      then
         return False;
      end if;

      Ada.Calendar.Split (Reference, Ref_Year, Ref_Month, Ref_Day, Ref_Seconds);
      for Offset in -6 .. 6 loop
         declare
            Month_Start_Candidate : constant Ada.Calendar.Time :=
              Add_Months
                (Ada.Calendar.Time_Of (Ref_Year, Ref_Month, 1, 0.0),
                 Offset);
            Year : Ada.Calendar.Year_Number;
            Month : Ada.Calendar.Month_Number;
            Candidate_Day : Ada.Calendar.Day_Number;
            Seconds : Ada.Calendar.Day_Duration;
         begin
            Ada.Calendar.Split
              (Month_Start_Candidate, Year, Month, Candidate_Day, Seconds);
            if Day <= Integer (Days_In_Month (Year, Month)) then
               declare
                  Candidate : constant Ada.Calendar.Time :=
                    Ada.Calendar.Time_Of
                      (Year, Month, Ada.Calendar.Day_Number (Day), 0.0);
                  Distance : constant Duration := abs (Candidate - Ref_Start);
               begin
                  if Weekday_Number
                    (Ada.Calendar.Formatting.Day_Of_Week (Candidate)) = Weekday
                    and then
                      (not Best_Set or else Distance < Best_Distance)
                  then
                     Best := Candidate;
                     Best_Set := True;
                     Best_Distance := Distance;
                  end if;
               end;
            end if;
         end;
      end loop;

      if not Best_Set then
         return False;
      end if;

      Value := Best;
      return True;
exception
      when others => --  parse failure normalization
         return False;
end Parse_Weekday_Day_Ordinal_Date;
