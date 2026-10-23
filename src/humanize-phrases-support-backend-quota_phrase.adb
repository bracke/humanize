separate (Humanize.Phrases.Support.Backend)
function Quota_Phrase
  (Context : Humanize.Contexts.Context;
   Status  : Quota_Status)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      case Status is
         when Quota_Available => return Ok_Text ("quota available");
         when Quota_Near_Limit => return Ok_Text ("quota near limit");
         when Quota_Exceeded => return Ok_Text ("quota exceeded");
         when Quota_Reset => return Ok_Text ("quota reset");
      end case;
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.Phrase (Key_Text ("quota", Quota_Status'Image (Status))),
      English);
end Quota_Phrase;
