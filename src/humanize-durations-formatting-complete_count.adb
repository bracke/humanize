separate (Humanize.Durations.Formatting)
function Complete_Count
  (Context  : Humanize.Contexts.Context;
   Done     : Standard.Natural;
   Total    : Standard.Natural)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String
           (No_Space (Standard.Natural'Image (Done)) & " of "
            & No_Space (Standard.Natural'Image (Total)) & " complete"),
         Key    => Humanize.Message_Keys.No_Message);
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Num (Num (Sel.Phrase ("complete_count"), "done", Done), "total", Total),
      English);
end Complete_Count;
