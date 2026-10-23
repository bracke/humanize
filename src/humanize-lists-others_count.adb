separate (Humanize.Lists)
function Others_Count
  (Context   : Humanize.Contexts.Context;
   First     : String;
   Remaining : Natural)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      if Remaining = 0 then
         return Ok_Text (First);
      elsif Remaining = 1 then
         return Ok_Text (First & " and 1 other");
      else
         return Ok_Text (First & " and " & Natural_Text (Remaining)
            & " others");
      end if;
   end English;
begin
   if Remaining = 0 then
      return English;
   end if;
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Num (Sel.With_Arg (Sel.Phrase ("others_count"), "first", First), "remaining", Remaining),
      English);
end Others_Count;
