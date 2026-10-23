separate (Humanize.Datetimes.Support)
function Due_Status
  (Context   : Humanize.Contexts.Context;
   Due       : Civil_Date_Time;
   Reference : Civil_Date_Time)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
      Due_Time : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Due.Year, Due.Month, Due.Day, 0.0);
      Ref_Time : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Reference.Year, Reference.Month, Reference.Day, 0.0);
      Days : constant Integer := Integer ((Due_Time - Ref_Time) / 86_400.0);
   begin
      if Days < 0 then
         return Ok_Text
           ("overdue by " & Signed_Text (-Days)
            & (if Days = -1 then " day" else " days"));
      elsif Days = 0 then
         return Ok_Text ("due today");
      elsif Days = 1 then
         return Ok_Text ("due tomorrow");
      else
         return Ok_Text
           ("due in " & Signed_Text (Days) & " days");
      end if;
   exception
      when Constraint_Error | Ada.Calendar.Time_Error => --  defensive recovery
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end English;
   Days : Integer;
begin
   begin
      Days := Due_Days (Due, Reference);
   exception
      when Constraint_Error | Ada.Calendar.Time_Error => --  defensive recovery
         return English;
   end;
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Num (Sel.Phrase
             (if Days < 0 then "due.overdue" elsif Days = 0 then "due.today"
              elsif Days = 1 then "due.tomorrow" else "due.in"),
           "days", abs Days),
      English);
end Due_Status;
