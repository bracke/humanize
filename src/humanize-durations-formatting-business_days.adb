separate (Humanize.Durations.Formatting)
function Business_Days
  (Context : Humanize.Contexts.Context;
   Days    : Standard.Natural)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (No_Space (Standard.Natural'Image (Days)) & " business "
            & (if Days = 1 then "day" else "days")),
         Key => Humanize.Message_Keys.No_Message);
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Num (Sel.Phrase ("business_days"), "days", Days),
      English);
end Business_Days;
