separate (Humanize.Lists)
function Page_Size_Label
  (Context   : Humanize.Contexts.Context;
   Page_Size : Positive;
   Singular  : String := "result";
   Plural    : String := "results")
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Natural_Text (Page_Size) & " "
         & Noun_For (Page_Size, Singular, Plural) & " per page");
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      With_Nouns (Context, Num (Sel.Phrase ("page_size"), "size", Page_Size), Singular, Plural),
      English);
end Page_Size_Label;
