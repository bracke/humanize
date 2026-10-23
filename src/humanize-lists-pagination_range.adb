separate (Humanize.Lists)
function Pagination_Range
  (Context  : Humanize.Contexts.Context;
   First    : Natural;
   Last     : Natural;
   Total    : Natural;
   Singular : String := "result";
   Plural   : String := "results")
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Natural_Text (First) & "-"
         & Natural_Text (Last) & " of "
         & Natural_Text (Total) & " "
         & Noun_For (Total, Singular, Plural));
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      With_Nouns
        (Context,
         Num (Num (Num (Sel.Phrase ("pagination_range"), "first", First), "last", Last), "total", Total),
        Singular, Plural),
      English);
end Pagination_Range;
