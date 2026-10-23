separate (Humanize.Lists)
function All_Count
  (Context  : Humanize.Contexts.Context;
   Total    : Natural;
   Singular : String;
   Plural   : String := "")
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return Ok_Text ("all " & Natural_Text (Total) & " "
         & Noun_For (Total, Singular, Plural));
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      With_Nouns (Num (Sel.Phrase ("all_count"), "total", Total), Singular, Plural),
      English);
end All_Count;
