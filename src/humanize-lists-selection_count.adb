separate (Humanize.Lists)
function Selection_Count
  (Context  : Humanize.Contexts.Context;
   Selected : Natural;
   Total    : Natural;
   Singular : String;
   Plural   : String := "")
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
      Noun : constant String := Noun_For (Total, Singular, Plural);
   begin
      return Ok_Text (Natural_Text (Selected) & " of "
         & Natural_Text (Total) & " " & Noun & " selected");
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      With_Nouns (Num (Num (Sel.Phrase ("selection_count"), "selected", Selected), "total", Total), Singular, Plural),
      English);
end Selection_Count;
