separate (Humanize.Durations.Formatting)
function Working_Hours
  (Context : Humanize.Contexts.Context;
   Hours   : Standard.Natural)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (No_Space (Standard.Natural'Image (Hours)) & " working "
            & (if Hours = 1 then "hour" else "hours")),
         Key => Humanize.Message_Keys.No_Message);
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Num (Sel.Phrase ("working_hours"), "hours", Hours),
      English);
end Working_Hours;
