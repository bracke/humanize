separate (Humanize.Parsing.Localized)
function Parse_Date
  (Context   : Humanize.Contexts.Context;
   Text      : String;
   Reference : Humanize.Datetimes.Civil_Date_Time)
   return Civil_Date_Parse_Result
is
   Item : constant String := Trimmed (Plain (Context, Text));

   --  Whether Pattern reads all of Item, with the day and year it holds.
   function Matches (Pattern : String; Day, Year : out Natural) return Boolean is
      P : Natural := Pattern'First;
      T : Natural := Item'First;

      function Digits_At return Natural is
         Stop : Natural := T;
      begin
         while Stop <= Item'Last and then Item (Stop) in '0' .. '9' and then Stop - T < 4 loop
            Stop := Stop + 1;
         end loop;
         return Stop - T;
      end Digits_At;
   begin
      Day := 0;
      Year := 0;
      while P <= Pattern'Last loop
         if Pattern (P) in Day_Marker | Year_Marker | Short_Marker then
            declare
               Count : constant Natural := Digits_At;
            begin
               if Count = 0 then
                  return False;
               end if;
               if Pattern (P) = Day_Marker then
                  Day := Natural'Value (Item (T .. T + Count - 1));
               elsif Pattern (P) = Year_Marker then
                  Year := Natural'Value (Item (T .. T + Count - 1));
               else
                  Year := 2000 + Natural'Value (Item (T .. T + Count - 1));
               end if;
               T := T + Count;
            end;
         elsif T > Item'Last or else Item (T) /= Pattern (P) then
            return False;
         else
            T := T + 1;
         end if;
         P := P + 1;
      end loop;
      return T > Item'Last;
   end Matches;
begin
   for F of Learned (Context, Dates_Kind).Forms loop
      if F.Unit = Day_Word then
         if To_String (F.Pattern) = Item then
            declare
               use Ada.Calendar;
               Day : constant Time :=
                 Time_Of (Reference.Year, Reference.Month, Reference.Day, 43_200.0)
                 + Duration (F.Offset * 86_400.0);
            begin
               return (Status => Humanize.Status.Ok,
                       Value  => (Year => Year (Day), Month => Month (Day), Day => Ada.Calendar.Day (Day),
                                  others => 0),
                       Exact  => True, Consumed => Text'Length);
            end;
         end if;
      else
         declare
            Day, Year : Natural;
         begin
            if Matches (To_String (F.Pattern), Day, Year)
              and then Day in Ada.Calendar.Day_Number and then Year in Ada.Calendar.Year_Number
            then
               return (Status => Humanize.Status.Ok,
                       Value  => (Year => Year, Month => Ada.Calendar.Month_Number (F.Unit), Day => Day,
                                  others => 0),
                       Exact  => True, Consumed => Text'Length);
            end if;
         end;
      end if;
   end loop;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
exception
   when Constraint_Error | Ada.Calendar.Time_Error =>
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Date;
