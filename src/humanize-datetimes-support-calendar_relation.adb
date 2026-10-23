separate (Humanize.Datetimes.Support)
function Calendar_Relation
  (Context   : Humanize.Contexts.Context;
   Value     : Civil_Date_Time;
   Reference : Civil_Date_Time)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
      Week_Diff  : constant Integer := Week_Index (Value) - Week_Index (Reference);
      Month_Diff : constant Integer :=
        Month_Index (Value) - Month_Index (Reference);
      Year_Diff  : constant Integer :=
        Integer (Value.Year) - Integer (Reference.Year);
   begin
      if Week_Diff in -1 .. 1 then
         case Week_Diff is
            when -1 => return Ok_Text ("last week");
            when 0  => return Ok_Text ("this week");
            when others => return Ok_Text ("next week");
         end case;
      elsif Month_Diff in -1 .. 1 then
         case Month_Diff is
            when -1 => return Ok_Text ("last month");
            when 0  => return Ok_Text ("this month");
            when others => return Ok_Text ("next month");
         end case;
      elsif Year_Diff in -1 .. 1 then
         case Year_Diff is
            when -1 => return Ok_Text ("last year");
            when 0  => return Ok_Text ("this year");
            when others => return Ok_Text ("next year");
         end case;
      else
         return Ok_Text (ISO_Date (Value));
      end if;
   exception
      when Constraint_Error | Ada.Calendar.Time_Error => --  defensive recovery
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end English;
   --  The key for the nearest calendar unit within one step, or "" when none is.
   function Key return String is
      Week_Diff  : constant Integer := Week_Index (Value) - Week_Index (Reference);
      Month_Diff : constant Integer := Month_Index (Value) - Month_Index (Reference);
      Year_Diff  : constant Integer := Integer (Value.Year) - Integer (Reference.Year);
   begin
      if Week_Diff in -1 .. 1 then
         return "calendar_relation.week." & Relation_Step (Week_Diff);
      elsif Month_Diff in -1 .. 1 then
         return "calendar_relation.month." & Relation_Step (Month_Diff);
      elsif Year_Diff in -1 .. 1 then
         return "calendar_relation.year." & Relation_Step (Year_Diff);
      else
         return "";
      end if;
   exception
      when Constraint_Error | Ada.Calendar.Time_Error => --  defensive recovery
         return "";
   end Key;

   Name : constant String := Key;
begin
   if Name = "" then
      return English;
   end if;
   return Humanize.I18N_Rendering.Phrase_Or (Context, Sel.Phrase (Name), English);
end Calendar_Relation;
