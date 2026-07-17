separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Parsed_Date : Date_Parse_Result;
      Parsed_Range : Date_Range_Parse_Result;
      Month : Ada.Calendar.Month_Number;
      Day   : Ada.Calendar.Day_Number;
      Start_Hour : Natural;
      End_Hour   : Natural;
      Weekday    : Natural := 0;
      Tail_First : Natural;
      Sep        : Natural;
begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 Error => Empty_Input,
                 others => <>);
      elsif Item = "next open business hour" then
         declare
            Open_Hour : Natural;
            Open_Date : constant Ada.Calendar.Time :=
              Next_Default_Open_Hour (Reference, Open_Hour);
         begin
            return Business_Result
              (Business_Next_Open_Hour, Item'Length, Date => Open_Date,
               Start_Hour => Open_Hour, End_Hour => Open_Hour + 1);
         end;
      elsif Starts_With (Item, "holiday ") then
         Parsed_Date := Parse_Natural_Date
           (Reference, Item (Item'First + 8 .. Item'Last));
         if Parsed_Date.Status = Humanize.Status.Ok then
            return Business_Result
              (Business_One_Off_Holiday, Item'Length, Date => Parsed_Date.Value);
         end if;
      elsif Starts_With (Item, "recurring holiday ") then
         if Month_Day_From_Text
           (Item (Item'First + 18 .. Item'Last), Month, Day)
         then
            return Business_Result
              (Business_Recurring_Holiday, Item'Length, Month => Month,
               Day => Day);
         end if;
      elsif Starts_With (Item, "half-day ") then
         Sep := Find_Substring (Item, " until ");
         if Sep = 0 then
            Sep := Find_Substring (Item, " to ");
         end if;
         if Sep /= 0 then
            Parsed_Date := Parse_Natural_Date
              (Reference, Item (Item'First + 9 .. Sep - 1));
            Tail_First := (if Find_Substring (Item (Sep .. Item'Last), " until ") = Sep
                           then Sep + 7 else Sep + 4);
            if Parsed_Date.Status = Humanize.Status.Ok
              and then Parse_Hour (Item (Tail_First .. Item'Last), End_Hour)
            then
               return Business_Result
                 (Business_Half_Day, Item'Length, Date => Parsed_Date.Value,
                  End_Hour => End_Hour);
            end if;
         end if;
      elsif Starts_With (Item, "shutdown ") then
         Parsed_Range := Parse_Natural_Date_Range
           (Reference, Item (Item'First + 9 .. Item'Last));
         if Parsed_Range.Status = Humanize.Status.Ok then
            return Business_Result
              (Business_Shutdown, Item'Length, Date => Parsed_Range.Low,
               End_Date => Parsed_Range.High);
         end if;
      elsif Starts_With (Item, "business hours ") then
         declare
            Rest : constant String := Trim (Item (Item'First + 15 .. Item'Last));
            Space : Natural := 0;
         begin
            for Index in Rest'Range loop
               if Rest (Index) = ' ' then
                  Space := Index;
                  exit;
               end if;
            end loop;
            if Space /= 0 then
               Weekday := Weekday_Value_Flexible (Rest (Rest'First .. Space - 1));
               if Weekday /= 0
                 and then Parse_Hour_Range
                   (Rest (Space + 1 .. Rest'Last), Start_Hour, End_Hour)
               then
                  return Business_Result
                    (Business_Hour_Range, Item'Length, Weekday => Weekday,
                     Start_Hour => Start_Hour, End_Hour => End_Hour);
               end if;
            elsif Parse_Hour_Range (Rest, Start_Hour, End_Hour) then
               return Business_Result
                 (Business_Hour_Range, Item'Length, Start_Hour => Start_Hour,
                  End_Hour => End_Hour);
            end if;
         end;
      end if;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Item'First,
              Error => Unsupported_Form,
              others => <>);
exception
      when others =>
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error => Unsupported_Form,
            others => <>);
end Parse_Business_Calendar;
