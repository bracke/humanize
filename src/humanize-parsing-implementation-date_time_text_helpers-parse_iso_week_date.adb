separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_ISO_Week_Date
     (Text  : String;
      Value : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Year : Integer;
      Week : Integer;
      Day  : Integer := 1;
      Start : Ada.Calendar.Time;
      Next_Start : Ada.Calendar.Time;
begin
      if Item'Length not in 8 | 10
        or else Item (Item'First + 4) /= '-'
        or else Item (Item'First + 5) not in 'W' | 'w'
      then
         return False;
      end if;
      if Item'Length = 10 and then Item (Item'First + 8) /= '-' then
         return False;
      end if;

      Year := Integer'Value (Item (Item'First .. Item'First + 3));
      Week := Integer'Value (Item (Item'First + 6 .. Item'First + 7));
      if Item'Length = 10 then
         Day := Integer'Value (Item (Item'Last .. Item'Last));
      end if;

      if Year not in Integer (Ada.Calendar.Year_Number'First) ..
        Integer (Ada.Calendar.Year_Number'Last)
        or else Week not in 1 .. 53
        or else Day not in 1 .. 7
      then
         return False;
      end if;

      Start := ISO_Week_One_Start (Ada.Calendar.Year_Number (Year));
      if Year = Integer (Ada.Calendar.Year_Number'Last) then
         Next_Start := Add_Calendar_Days (Start, 53 * 7);
      else
         Next_Start :=
           ISO_Week_One_Start (Ada.Calendar.Year_Number (Year + 1));
      end if;
      Value := Add_Calendar_Days (Start, (Week - 1) * 7 + Day - 1);
      return Value < Next_Start;
exception
      when others =>
         return False;
end Parse_ISO_Week_Date;
