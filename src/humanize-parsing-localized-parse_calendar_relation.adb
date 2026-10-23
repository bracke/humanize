separate (Humanize.Parsing.Localized)
function Parse_Calendar_Relation
  (Context : Humanize.Contexts.Context;
   Text    : String)
   return Calendar_Relation_Parse_Result
is
   package DT renames Humanize.Datetimes;

   function Day (Year, Month, Day_Of_Month : Integer) return DT.Civil_Date_Time is
     (DT.Civil_Date_Time'(Year => Year, Month => Month, Day => Day_Of_Month, others => <>));

   --  A Wednesday; each period's last, current and next one around it, the
   --  week first so the smallest period that names a day wins.
   Reference : constant DT.Civil_Date_Time := Day (2026, 3, 11);

   type Sample is record
      Period : Calendar_Period;
      Offset : Period_Offset;
      Value  : DT.Civil_Date_Time;
   end record;

   Samples_Of : constant array (Positive range <>) of Sample :=
     [(Week_Period, -1, Day (2026, 3, 4)), (Week_Period, 0, Day (2026, 3, 12)),
      (Week_Period, 1, Day (2026, 3, 18)), (Month_Period, -1, Day (2026, 2, 11)),
      (Month_Period, 0, Day (2026, 3, 27)), (Month_Period, 1, Day (2026, 4, 15)),
      (Year_Period, -1, Day (2025, 3, 11)), (Year_Period, 0, Day (2026, 8, 12)),
      (Year_Period, 1, Day (2027, 3, 11))];

   Item : constant String := Trimmed (Text);
begin
   for S of Samples_Of loop
      declare
         Rendered : constant Humanize.Status.Text_Result := DT.Calendar_Relation (Context, S.Value, Reference);
      begin
         if Rendered.Status = Humanize.Status.Ok and then Item'Length > 0
           and then To_String (Rendered.Text) = Item
         then
            return (Status => Humanize.Status.Ok, Period => S.Period, Offset => S.Offset);
         end if;
      end;
   end loop;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Calendar_Relation;
