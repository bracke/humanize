separate (Humanize.Lists)
function Page_Position_Label
  (Context : Humanize.Contexts.Context;
   Page    : Positive;
   Total   : Positive)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      if Page > Total then
         return Invalid_Text ("invalid page position");
      else
         return Ok_Text ("page " & Natural_Text (Page) & " of "
            & Natural_Text (Total));
      end if;
   end English;
begin
   if Page > Total then
      return English;
   end if;
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Num (Num (Sel.Phrase ("page_count"), "page", Page), "total", Total),
      English);
end Page_Position_Label;
