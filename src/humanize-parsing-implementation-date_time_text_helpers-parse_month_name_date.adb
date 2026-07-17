separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Month_Name_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Value     : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      First_Space : Natural := 0;
      Second_Space : Natural := 0;
      Ref_Year : Ada.Calendar.Year_Number;
      Ref_Month : Ada.Calendar.Month_Number;
      Ref_Day : Ada.Calendar.Day_Number;
      Ref_Seconds : Ada.Calendar.Day_Duration;
      Month : Natural;
      Day : Integer;
      Year : Integer;
begin
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            if First_Space = 0 then
               First_Space := Index;
            else
               Second_Space := Index;
               exit;
            end if;
         end if;
      end loop;

      if First_Space = 0 then
         return False;
      end if;

      Month := Month_Value (Item (Item'First .. First_Space - 1));
      if Month = 0 then
         return False;
      end if;

      Ada.Calendar.Split (Reference, Ref_Year, Ref_Month, Ref_Day, Ref_Seconds);
      if Second_Space = 0 then
         Day := Integer'Value (Item (First_Space + 1 .. Item'Last));
         Year := Integer (Ref_Year);
      else
         Day := Integer'Value (Item (First_Space + 1 .. Second_Space - 1));
         Year := Integer'Value (Item (Second_Space + 1 .. Item'Last));
      end if;

      if Year not in Integer (Ada.Calendar.Year_Number'First) ..
        Integer (Ada.Calendar.Year_Number'Last)
        or else Day < 1
        or else Day > Integer (Days_In_Month
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
      when others =>
         return False;
end Parse_Month_Name_Date;
