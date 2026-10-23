separate (Humanize.Parsing.Localized)
function Parse_Date_Range
  (Context : Humanize.Contexts.Context;
   Text    : String)
   return Date_Range_Parse_Result
is
   package DT renames Humanize.Datetimes;

   function Day (Year, Month, Day_Of_Month : Integer) return DT.Civil_Date_Time is
     (DT.Civil_Date_Time'(Year => Year, Month => Month, Day => Day_Of_Month, others => <>));

   Named : constant DT.Range_Options := (DT.Default_Range_Options with delta Use_Month_Names => True);

   function Render (First, Last : DT.Civil_Date_Time) return String is
      Rendered : constant Humanize.Status.Text_Result := DT.Date_Range (Context, First, Last, Named);
   begin
      return (if Rendered.Status = Humanize.Status.Ok then Plain (Context, To_String (Rendered.Text)) else "");
   end Render;

   Item : constant String := Trimmed (Plain (Context, Text));

   --  The sample dates' numbers become slots: days 13 and 25, years 2001 and
   --  2003, and the months, where the locale writes them as numbers.
   type Slot is (First_Day, Last_Day, First_Year, Last_Year, First_Month, Last_Month);
   type Slot_Values is array (Slot) of Integer;

   --  Item read against Template, rendered for months Month_1 and Month_2:
   --  its words as written, its numbers into the slots.
   function Match (Template : String; Month_1, Month_2 : Natural; Values : out Slot_Values) return Boolean is
      I : Natural := Template'First;
      J : Natural := Item'First;

      procedure Digits_At (S : String; From : Natural; Last : out Natural; Value : out Integer) is
      begin
         Last := From - 1;
         Value := 0;
         while Last < S'Last and then S (Last + 1) in '0' .. '9' and then Value < 100_000 loop
            Last := Last + 1;
            Value := Value * 10 + Character'Pos (S (Last)) - Character'Pos ('0');
         end loop;
      end Digits_At;
   begin
      Values := [others => -1];
      if Template = "" then
         return False;
      end if;
      while I <= Template'Last loop
         if Template (I) in '0' .. '9' then
            declare
               Template_Last, Item_Last : Natural;
               Shown, Read              : Integer;
               Which                    : Slot;
            begin
               Digits_At (Template, I, Template_Last, Shown);
               Digits_At (Item, J, Item_Last, Read);
               if Item_Last < J then
                  return False;
               end if;
               if Shown = 13 then
                  Which := First_Day;
               elsif Shown = 25 then
                  Which := Last_Day;
               elsif Shown = 2001 then
                  Which := First_Year;
               elsif Shown = 2003 then
                  Which := Last_Year;
               elsif Shown = Month_1 then
                  Which := First_Month;
               elsif Shown = Month_2 then
                  Which := Last_Month;
               else
                  return False;
               end if;
               if Values (Which) /= -1 and then Values (Which) /= Read then
                  return False;
               end if;
               Values (Which) := Read;
               I := Template_Last + 1;
               J := Item_Last + 1;
            end;
         elsif J > Item'Last or else Item (J) /= Template (I) then
            return False;
         else
            I := I + 1;
            J := J + 1;
         end if;
      end loop;
      return J = Item'Last + 1 and then Values (First_Year) /= -1 and then Values (First_Day) /= -1;
   end Match;

   --  The dates the slots name, if the formatter writes them as Item.
   function Dates (Values : Slot_Values; Month_1, Month_2 : Natural; Result : out Date_Range_Parse_Result)
      return Boolean
   is
      Year_1  : constant Integer := Values (First_Year);
      Year_2  : constant Integer := (if Values (Last_Year) /= -1 then Values (Last_Year) else Year_1);
      Mon_1   : constant Integer := (if Values (First_Month) /= -1 then Values (First_Month) else Month_1);
      Mon_2   : constant Integer :=
        (if Values (Last_Month) /= -1 then Values (Last_Month)
         elsif Month_2 = Month_1 then Mon_1 else Month_2);
      Day_1   : constant Integer := Values (First_Day);
      Day_2   : constant Integer := (if Values (Last_Day) /= -1 then Values (Last_Day) else Day_1);
   begin
      Result := (Status => Humanize.Status.Invalid_Argument, others => <>);
      if Year_1 not in 1 .. 9999 or else Year_2 not in 1 .. 9999 or else Mon_1 not in 1 .. 12
        or else Mon_2 not in 1 .. 12 or else Day_1 not in 1 .. 31 or else Day_2 not in 1 .. 31
      then
         return False;
      end if;
      Result := (Status => Humanize.Status.Ok, First => Day (Year_1, Mon_1, Day_1),
                 Last => Day (Year_2, Mon_2, Day_2));
      return Render (Result.First, Result.Last) = Item;
   exception
      when Constraint_Error =>
         return False;
   end Dates;

   Values : Slot_Values;
   Result : Date_Range_Parse_Result;
begin
   if Item = "" then
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end if;
   --  The simplest reading first: one day, then days of one month, then
   --  months of one year, then two years. (CLDR 48's Swahili writes "9 – 15
   --  Okt 2026" for October alone and for January to October.)
   for Month_1 in 1 .. 12 loop
      if (Match (Render (Day (2001, Month_1, 13), Day (2001, Month_1, 13)), Month_1, Month_1, Values)
          or else Match (Render (Day (2001, Month_1, 13), Day (2001, Month_1, 25)), Month_1, Month_1, Values))
        and then Dates (Values, Month_1, Month_1, Result)
      then
         return Result;
      end if;
   end loop;
   for Month_1 in 1 .. 12 loop
      for Month_2 in 1 .. 12 loop
         if Month_2 > Month_1
           and then Match (Render (Day (2001, Month_1, 13), Day (2001, Month_2, 25)), Month_1, Month_2, Values)
           and then Dates (Values, Month_1, Month_2, Result)
         then
            return Result;
         end if;
         if Match (Render (Day (2001, Month_1, 13), Day (2003, Month_2, 25)), Month_1, Month_2, Values)
           and then Dates (Values, Month_1, Month_2, Result)
         then
            return Result;
         end if;
      end loop;
   end loop;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Date_Range;
