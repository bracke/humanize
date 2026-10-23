separate (Humanize.Lists)
function Showing_Count
  (Context  : Humanize.Contexts.Context;
   Showing  : Natural;
   Total    : Natural;
   Singular : String := "result";
   Plural   : String := "results")
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return Ok_Text ("showing " & Natural_Text (Showing) & " of "
         & Natural_Text (Total) & " "
         & Noun_For (Total, Singular, Plural));
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      With_Nouns
        (Context,
         Num (Num (Sel.Phrase ("showing_count"), "showing", Showing), "total", Total), Singular, Plural),
      English);
end Showing_Count;
