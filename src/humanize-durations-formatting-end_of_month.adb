separate (Humanize.Durations.Formatting)
function End_Of_Month
  (Context : Humanize.Contexts.Context)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String ("end of month"),
         Key => Humanize.Message_Keys.No_Message);
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.Phrase ("end_of_month"),
      English);
end End_Of_Month;
