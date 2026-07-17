separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Boundary_Date
     (Reference : Ada.Calendar.Time;
      Phrase    : String;
      Is_End    : Boolean;
      Value     : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Clean_Lower (Phrase);
      Base : constant Ada.Calendar.Time := Day_Start (Reference);
      Low, High : Ada.Calendar.Time;
begin
      if Item = "this week" then
         Low := Week_Start (Base);
         High := Add_Calendar_Days (Low, 7);
      elsif Item = "next week" then
         Low := Add_Calendar_Days (Week_Start (Base), 7);
         High := Add_Calendar_Days (Low, 7);
      elsif Item = "last week" then
         Low := Add_Calendar_Days (Week_Start (Base), -7);
         High := Add_Calendar_Days (Low, 7);
      elsif Item = "this month" then
         Low := Month_Start (Base);
         High := Add_Months (Low, 1);
      elsif Item = "next month" then
         Low := Add_Months (Month_Start (Base), 1);
         High := Add_Months (Low, 1);
      elsif Item = "last month" then
         Low := Add_Months (Month_Start (Base), -1);
         High := Add_Months (Low, 1);
      elsif Item = "this quarter" then
         Low := Quarter_Start (Base);
         High := Add_Quarters (Low, 1);
      elsif Item = "next quarter" then
         Low := Add_Quarters (Quarter_Start (Base), 1);
         High := Add_Quarters (Low, 1);
      elsif Item = "last quarter" then
         Low := Add_Quarters (Quarter_Start (Base), -1);
         High := Add_Quarters (Low, 1);
      elsif Item = "this year" then
         Low := Year_Start (Base);
         High := Add_Years (Low, 1);
      elsif Item = "next year" then
         Low := Add_Years (Year_Start (Base), 1);
         High := Add_Years (Low, 1);
      elsif Item = "last year" then
         Low := Add_Years (Year_Start (Base), -1);
         High := Add_Years (Low, 1);
      elsif Parse_Quarter_Label (Reference, Item, Low, High)
        or else Parse_Half_Label (Item, Low, High)
        or else Parse_Week_Number (Reference, Item, Low, High)
      then
         null;
      else
         return False;
      end if;

      Value := (if Is_End then Add_Calendar_Days (High, -1) else Low);
      return True;
end Boundary_Date;
