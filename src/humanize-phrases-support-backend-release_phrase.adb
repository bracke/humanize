separate (Humanize.Phrases.Support.Backend)
function Release_Phrase
  (Context : Humanize.Contexts.Context;
   Status  : Release_Status)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      case Status is
         when Release_Drafting =>
            return Ok_Text ("release drafting");
         when Release_Ready =>
            return Ok_Text ("release ready");
         when Release_Published =>
            return Ok_Text ("release published");
         when Release_Rolled_Back =>
            return Ok_Text ("release rolled back");
      end case;
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.Phrase (Key_Text ("release", Release_Status'Image (Status))),
      English);
end Release_Phrase;
