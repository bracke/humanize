separate (Humanize.Durations.Formatting)
function Step_Count
  (Context : Humanize.Contexts.Context;
   Step    : Standard.Natural;
   Total   : Standard.Natural)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           ("step " & No_Space (Standard.Natural'Image (Step)) & " of "
            & No_Space (Standard.Natural'Image (Total))),
         Key => Humanize.Message_Keys.No_Message);
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Num (Num (Sel.Phrase ("step_count"), "step", Step), "total", Total),
      English);
end Step_Count;
