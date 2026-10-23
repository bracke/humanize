separate (Humanize.Datetimes.Support)
function Natural_Time_Of_Day
  (Context : Humanize.Contexts.Context;
   Value   : Civil_Date_Time)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      if Value.Hour < 5 then
         return Ok_Text ("night");
      elsif Value.Hour < 12 then
         return Ok_Text ("morning");
      elsif Value.Hour < 17 then
         return Ok_Text ("afternoon");
      elsif Value.Hour < 21 then
         return Ok_Text ("evening");
      else
         return Ok_Text ("night");
      end if;
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.Phrase (if Value.Hour < 5 or else Value.Hour >= 21 then "time_of_day.night"
        elsif Value.Hour < 12 then "time_of_day.morning" elsif Value.Hour < 17 then "time_of_day.afternoon"
          else "time_of_day.evening"),
      English);
end Natural_Time_Of_Day;
