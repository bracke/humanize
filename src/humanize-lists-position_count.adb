separate (Humanize.Lists)
function Position_Count
  (Context  : Humanize.Contexts.Context;
   Position : Natural;
   Total    : Natural)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Natural_Text (Position) & " of " & Natural_Text (Total));
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Num (Num (Sel.Phrase ("position_count"), "position", Position), "total", Total),
      English);
end Position_Count;
