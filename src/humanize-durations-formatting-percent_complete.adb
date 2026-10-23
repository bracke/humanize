separate (Humanize.Durations.Formatting)
function Percent_Complete
  (Context : Humanize.Contexts.Context;
   Percent : Long_Float)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String
           (Humanize.Decimal_Images.Decimal_Image (Percent, 1, True)
            & "% complete"),
         Key    => Humanize.Message_Keys.No_Message);
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.With_Arg (Sel.Phrase ("percent_complete"), "percent", Humanize.Decimal_Images.Decimal_Image (Percent, 1,
        True)),
      English);
end Percent_Complete;
