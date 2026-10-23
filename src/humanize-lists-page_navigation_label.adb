separate (Humanize.Lists)
function Page_Navigation_Label
  (Context : Humanize.Contexts.Context;
   Page    : Positive;
   Total   : Positive)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      if Page > Total then
         return Invalid_Text ("invalid page position");
      elsif Total = 1 then
         return Ok_Text ("only page");
      elsif Page = 1 then
         return Ok_Text ("first page, next available");
      elsif Page = Total then
         return Ok_Text ("last page, previous available");
      else
         return Ok_Text ("previous and next available");
      end if;
   end English;
begin
   if Page > Total then
      return English;
   end if;
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.Phrase (if Total = 1 then "page_navigation.only" elsif Page = 1 then "page_navigation.first"
        elsif Page = Total then "page_navigation.last" else "page_navigation.middle"),
      English);
end Page_Navigation_Label;
