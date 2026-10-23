separate (Humanize.Durations.Formatting)
function Attempt_Count
  (Context : Humanize.Contexts.Context;
   Attempt : Standard.Natural;
   Total   : Standard.Natural)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           ("attempt " & No_Space (Standard.Natural'Image (Attempt)) & " of "
            & No_Space (Standard.Natural'Image (Total))),
         Key => Humanize.Message_Keys.No_Message);
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Num (Num (Sel.Phrase ("attempt_count"), "attempt", Attempt), "total", Total),
      English);
end Attempt_Count;
