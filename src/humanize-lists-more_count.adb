separate (Humanize.Lists)
function More_Count
  (Context   : Humanize.Contexts.Context;
   Visible   : Natural;
   Remaining : Natural)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Natural_Text (Visible) & " shown, +"
         & Natural_Text (Remaining) & " more");
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Num (Num (Sel.Phrase ("more_count"), "visible", Visible), "remaining", Remaining),
      English);
end More_Count;
