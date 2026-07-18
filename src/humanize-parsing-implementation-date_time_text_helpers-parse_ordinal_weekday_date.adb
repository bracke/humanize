separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Ordinal_Weekday_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Value     : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Space_1     : Natural := 0;
      Space_2     : Natural := 0;
      Space_3     : Natural := 0;
      Space_4     : Natural := 0;
      Ref_Year    : Ada.Calendar.Year_Number;
      Ref_Month   : Ada.Calendar.Month_Number;
      Ref_Day     : Ada.Calendar.Day_Number;
      Ref_Seconds : Ada.Calendar.Day_Duration;
      Ordinal     : Integer;
      Weekday     : Natural;
      Month       : Natural;
      Year        : Ada.Calendar.Year_Number;
begin
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            if Space_1 = 0 then
               Space_1 := Index;
            elsif Space_2 = 0 then
               Space_2 := Index;
            elsif Space_3 = 0 then
               Space_3 := Index;
            elsif Space_4 = 0 then
               Space_4 := Index;
               exit;
            end if;
         end if;
      end loop;

      if Space_1 = 0 or else Space_2 = 0 or else Space_3 = 0 then
         return False;
      end if;

      Ordinal := Ordinal_Value (Item (Item'First .. Space_1 - 1));
      Weekday := Weekday_Value (Item (Space_1 + 1 .. Space_2 - 1));
      if Ordinal = 0 or else Weekday = 0 then
         return False;
      end if;

      declare
         Link : constant String := Item (Space_2 + 1 .. Space_3 - 1);
         Month_Text : constant String :=
           (if Space_4 = 0 then Item (Space_3 + 1 .. Item'Last)
            else Item (Space_3 + 1 .. Space_4 - 1));
      begin
         if Link /= "in" and then Link /= "of" then
            return False;
         end if;
         Month := Month_Value (Month_Text);
      end;

      if Month = 0 then
         return False;
      end if;

      Ada.Calendar.Split (Reference, Ref_Year, Ref_Month, Ref_Day, Ref_Seconds);
      Year := Ref_Year;
      if Space_4 /= 0 then
         declare
            Parsed_Year : constant Integer :=
              Integer'Value (Item (Space_4 + 1 .. Item'Last));
         begin
            if Parsed_Year not in Integer (Ada.Calendar.Year_Number'First) ..
              Integer (Ada.Calendar.Year_Number'Last)
            then
               return False;
            end if;
            Year := Ada.Calendar.Year_Number (Parsed_Year);
         end;
      end if;

      Value := Nth_Weekday_In_Month
        (Year, Ada.Calendar.Month_Number (Month), Weekday, Ordinal);
      return True;
exception
      when Constraint_Error | Ada.Calendar.Time_Error =>
         return False;
end Parse_Ordinal_Weekday_Date;
