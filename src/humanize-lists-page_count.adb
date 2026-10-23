separate (Humanize.Lists)
function Page_Count
  (Context : Humanize.Contexts.Context;
   Page    : Natural;
   Total   : Natural)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return Ok_Text ("page " & Natural_Text (Page) & " of "
         & Natural_Text (Total));
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Num (Num (Sel.Phrase ("page_count"), "page", Page), "total", Total),
      English);
end Page_Count;
