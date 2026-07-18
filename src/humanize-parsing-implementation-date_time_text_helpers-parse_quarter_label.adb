separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Quarter_Label
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Core_First : Natural := Item'First;
      Ref_Year : Ada.Calendar.Year_Number;
      Ref_Month : Ada.Calendar.Month_Number;
      Ref_Day : Ada.Calendar.Day_Number;
      Ref_Seconds : Ada.Calendar.Day_Duration;
      Year : Ada.Calendar.Year_Number;
      Quarter : Natural := 0;
      Left, Right : Unbounded_String;
begin
      if Item'Length = 0 then
         return False;
      end if;

      Ada.Calendar.Split (Reference, Ref_Year, Ref_Month, Ref_Day, Ref_Seconds);
      Year := Ref_Year;

      if Starts_With (Item, "fiscal ") then
         Core_First := Item'First + 7;
      end if;

      declare
         Core : constant String := Trim (Item (Core_First .. Item'Last));
      begin
         if Starts_With (Core, "fy") and then Split_Once (Core, Left, Right) then
            if not Parse_Year_Token (To_String (Left), Year) then
               return False;
            end if;
            Quarter := Quarter_Value (To_String (Right));
         elsif Starts_With (Core, "quarter ") then
            declare
               Rest : constant String := Trim (Core (Core'First + 8 .. Core'Last));
            begin
               if Split_Once (Rest, Left, Right) then
                  Quarter := Quarter_Value (To_String (Left));
                  if not Parse_Year_Token (To_String (Right), Year) then
                     return False;
                  end if;
               else
                  Quarter := Quarter_Value (Rest);
               end if;
            end;
         elsif Split_Once (Core, Left, Right) then
            Quarter := Quarter_Value (To_String (Left));
            if Quarter = 0 then
               return False;
            end if;
            if not Parse_Year_Token (To_String (Right), Year) then
               return False;
            end if;
         else
            Quarter := Quarter_Value (Core);
         end if;
      end;

      if Quarter not in 1 .. 4 then
         return False;
      end if;
      Low := Quarter_Start (Year, Quarter);
      High := Add_Quarters (Low, 1);
      return True;
exception
      when others => --  parse failure normalization
         return False;
end Parse_Quarter_Label;
