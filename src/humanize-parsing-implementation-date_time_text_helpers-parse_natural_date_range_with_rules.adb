separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Natural_Date_Range_With_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Base : constant Ada.Calendar.Time := Day_Start (Reference);
      Count : Integer;
      Unit  : Unbounded_String;
      Left_Date  : Date_Parse_Result;
      Right_Date : Date_Parse_Result;
      Label_Low  : Ada.Calendar.Time;
      Label_High : Ada.Calendar.Time;
      Sep : Natural := 0;
begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      elsif Item'Length = 8
        and then Item (Item'First + 4) = '-'
        and then Item (Item'First + 5) in 'W' | 'w'
      then
         declare
            Low : Ada.Calendar.Time;
         begin
            if Parse_ISO_Week_Date (Item, Low) then
               return Date_Range_Result
                 (Low, Add_Calendar_Days (Low, 7), Item'Length);
            end if;
         end;
      elsif Item = "today" or else Item = "tomorrow" or else Item = "yesterday"
        or else Item = "now"
      then
         Left_Date := Parse_Natural_Date_With_Rules (Reference, Item, Rules);
         if Left_Date.Status = Humanize.Status.Ok then
            return Date_Range_Result
              (Left_Date.Value, Add_Calendar_Days (Left_Date.Value, 1),
               Item'Length);
         end if;
      elsif Item = "this week" then
         return Date_Range_Result
           (Week_Start (Base), Add_Calendar_Days (Week_Start (Base), 7),
            Item'Length);
      elsif Item = "next week" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Calendar_Days (Week_Start (Base), 7);
         begin
            return Date_Range_Result
              (Low, Add_Calendar_Days (Low, 7), Item'Length);
         end;
      elsif Item = "last week" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Calendar_Days (Week_Start (Base), -7);
         begin
            return Date_Range_Result
              (Low, Add_Calendar_Days (Low, 7), Item'Length);
         end;
      elsif Item = "this weekend" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Calendar_Days (Week_Start (Base), 5);
         begin
            return Date_Range_Result
              (Low, Add_Calendar_Days (Low, 2), Item'Length);
         end;
      elsif Item = "next weekend" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Calendar_Days (Week_Start (Base), 12);
         begin
            return Date_Range_Result
              (Low, Add_Calendar_Days (Low, 2), Item'Length);
         end;
      elsif Item = "last weekend" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Calendar_Days (Week_Start (Base), -2);
         begin
            return Date_Range_Result
              (Low, Add_Calendar_Days (Low, 2), Item'Length);
         end;
      elsif Item = "this business week" then
         declare
            Low : constant Ada.Calendar.Time := Week_Start (Base);
         begin
            return Date_Range_Result
              (Low, Add_Calendar_Days (Low, 5), Item'Length);
         end;
      elsif Item = "next business week" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Calendar_Days (Week_Start (Base), 7);
         begin
            return Date_Range_Result
              (Low, Add_Calendar_Days (Low, 5), Item'Length);
         end;
      elsif Item = "last business week" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Calendar_Days (Week_Start (Base), -7);
         begin
            return Date_Range_Result
              (Low, Add_Calendar_Days (Low, 5), Item'Length);
         end;
      elsif Item = "this month" then
         return Date_Range_Result
           (Month_Start (Base), Add_Months (Month_Start (Base), 1), Item'Length);
      elsif Item = "next month" then
         declare
            Low : constant Ada.Calendar.Time := Add_Months (Month_Start (Base), 1);
         begin
            return Date_Range_Result (Low, Add_Months (Low, 1), Item'Length);
         end;
      elsif Item = "last month" then
         declare
            Low : constant Ada.Calendar.Time := Add_Months (Month_Start (Base), -1);
         begin
            return Date_Range_Result (Low, Add_Months (Low, 1), Item'Length);
         end;
      elsif Item = "this year" then
         return Date_Range_Result
           (Year_Start (Base), Add_Years (Year_Start (Base), 1), Item'Length);
      elsif Item = "next year" then
         declare
            Low : constant Ada.Calendar.Time := Add_Years (Year_Start (Base), 1);
         begin
            return Date_Range_Result (Low, Add_Years (Low, 1), Item'Length);
         end;
      elsif Item = "last year" then
         declare
            Low : constant Ada.Calendar.Time := Add_Years (Year_Start (Base), -1);
         begin
            return Date_Range_Result (Low, Add_Years (Low, 1), Item'Length);
         end;
      elsif Item = "this quarter" then
         return Date_Range_Result
           (Quarter_Start (Base), Add_Quarters (Quarter_Start (Base), 1),
            Item'Length);
      elsif Item = "next quarter" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Quarters (Quarter_Start (Base), 1);
         begin
            return Date_Range_Result (Low, Add_Quarters (Low, 1), Item'Length);
         end;
      elsif Item = "last quarter" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Quarters (Quarter_Start (Base), -1);
         begin
            return Date_Range_Result (Low, Add_Quarters (Low, 1), Item'Length);
         end;
      elsif Parse_Phased_Period_Range (Reference, Item, Label_Low, Label_High) then
         return Date_Range_Result (Label_Low, Label_High, Item'Length);
      elsif Parse_Label_Range (Reference, Item, Label_Low, Label_High) then
         return Date_Range_Result (Label_Low, Label_High, Item'Length);
      elsif Starts_With (Item, "next ")
        and then Split_Count_Unit
          (Item (Item'First + 5 .. Item'Last), Count, Unit)
        and then Known_Date_Unit (To_String (Unit))
      then
         return Date_Range_Result
           (Base, Range_Unit_End (Base, To_String (Unit), Count), Item'Length);
      elsif (Starts_With (Item, "last ") or else Starts_With (Item, "past "))
        and then Split_Count_Unit
          (Item (Item'First + 5 .. Item'Last), Count, Unit)
        and then Known_Date_Unit (To_String (Unit))
      then
         return Date_Range_Result
           (Range_Unit_End (Base, To_String (Unit), -Count), Base, Item'Length);
      end if;

      Sep := Find_Substring (Item, " to ");
      if Sep = 0 then
         Sep := Find_Substring (Item, " through ");
      end if;
      if Sep = 0 then
         Sep := Find_Substring (Item, "..");
      end if;
      if Sep = 0 and then Starts_With (Item, "between ") then
         Sep := Find_Substring (Item, " and ");
      end if;

      if Sep /= 0 then
         declare
            Left_First : Natural := Item'First;
            Left_Last  : constant Natural := Sep - 1;
            Right_First : Natural;
         begin
            if Starts_With (Item, "between ") then
               Left_First := Item'First + 8;
            end if;
            if Sep + 1 <= Item'Last and then Item (Sep .. Sep + 1) = ".." then
               Right_First := Sep + 2;
            elsif Find_Substring (Item (Sep .. Item'Last), " through ") = Sep then
               Right_First := Sep + 9;
            else
               Right_First := Sep + 4;
            end if;

            if Left_Last >= Left_First and then Right_First <= Item'Last then
               Left_Date := Parse_Natural_Date_With_Rules
                 (Reference, Item (Left_First .. Left_Last), Rules);
               Right_Date := Parse_Natural_Date_With_Rules
                 (Reference, Item (Right_First .. Item'Last), Rules);
               if Left_Date.Status = Humanize.Status.Ok
                 and then Right_Date.Status = Humanize.Status.Ok
               then
                  return Date_Range_Result
                    (Left_Date.Value, Right_Date.Value, Item'Length);
               end if;
            end if;
         end;
      end if;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Item'First,
         others => <>);
exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
end Parse_Natural_Date_Range_With_Rules;
