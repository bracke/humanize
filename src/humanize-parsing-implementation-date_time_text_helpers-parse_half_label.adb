separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Half_Label
     (Text : String;
      Low  : out Ada.Calendar.Time;
      High : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Core_First : Natural := Item'First;
      Year : Ada.Calendar.Year_Number;
      Half : Natural := 0;
      Left, Right : Unbounded_String;
      Fiscal : Boolean := False;
      Semester : Boolean := False;
      Half_Label : Boolean := False;
      Start_Month : Ada.Calendar.Month_Number;
begin
      if Item'Length = 0 then
         return False;
      end if;

      if Starts_With (Item, "fiscal ") then
         Fiscal := True;
         Core_First := Item'First + 7;
      elsif Starts_With (Item, "first half of ") then
         Half_Label := True;
         Half := 1;
         if not Parse_Year_Token (Item (Item'First + 14 .. Item'Last), Year) then
            return False;
         end if;
         Low := Ada.Calendar.Time_Of (Year, 1, 1, 0.0);
         High := Add_Months (Low, 6);
         return True;
      elsif Starts_With (Item, "second half of ") then
         Half_Label := True;
         Half := 2;
         if not Parse_Year_Token (Item (Item'First + 15 .. Item'Last), Year) then
            return False;
         end if;
         Low := Ada.Calendar.Time_Of (Year, 7, 1, 0.0);
         High := Add_Months (Low, 6);
         return True;
      elsif Starts_With (Item, "first half ") then
         Half_Label := True;
         Half := 1;
         if not Parse_Year_Token (Item (Item'First + 11 .. Item'Last), Year) then
            return False;
         end if;
         Low := Ada.Calendar.Time_Of (Year, 1, 1, 0.0);
         High := Add_Months (Low, 6);
         return True;
      elsif Starts_With (Item, "second half ") then
         Half_Label := True;
         Half := 2;
         if not Parse_Year_Token (Item (Item'First + 12 .. Item'Last), Year) then
            return False;
         end if;
         Low := Ada.Calendar.Time_Of (Year, 7, 1, 0.0);
         High := Add_Months (Low, 6);
         return True;
      elsif Starts_With (Item, "semester ") then
         Semester := True;
         Core_First := Item'First + 9;
      elsif Starts_With (Item, "half ") then
         Half_Label := True;
         Core_First := Item'First + 5;
      elsif Starts_With (Item, "half-year ") then
         Half_Label := True;
         Core_First := Item'First + 10;
      end if;

      declare
         Core : constant String := Trim (Item (Core_First .. Item'Last));
      begin
         if Starts_With (Core, "fy") then
            Fiscal := True;
            if Split_Once (Core, Left, Right) then
               if not Parse_Year_Token (To_String (Left), Year) then
                  return False;
               end if;
               Half := Half_Value (To_String (Right));
            else
               if not Parse_Year_Token (Core, Year) then
                  return False;
               end if;
               Low := Year_Start (Ada.Calendar.Time_Of (Year, 1, 1, 0.0));
               High := Add_Years (Low, 1);
               return True;
            end if;
         elsif Split_Once (Core, Left, Right) then
            Half := Half_Value (To_String (Left));
            if Half = 0 then
               return False;
            end if;
            if not Parse_Year_Token (To_String (Right), Year) then
               return False;
            end if;
            if Starts_With (To_String (Left), "s") then
               Semester := True;
            elsif Starts_With (To_String (Left), "h") then
               Half_Label := True;
            end if;
         else
            return False;
         end if;
      end;

      if Half not in 1 .. 2 then
         return False;
      end if;

      Start_Month :=
        (if Half = 1 then 1 else 7);
      Low := Ada.Calendar.Time_Of (Year, Start_Month, 1, 0.0);
      High := Add_Months (Low, 6);
      return Fiscal or else Semester or else Half_Label;
exception
      when others => --  parse failure normalization
         return False;
end Parse_Half_Label;
