separate (Humanize.Phrases.Support.Backend)
function Webhook_Phrase
  (Context : Humanize.Contexts.Context;
   Status  : Webhook_Status)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      case Status is
         when Webhook_Pending => return Ok_Text ("webhook pending");
         when Webhook_Delivered => return Ok_Text ("webhook delivered");
         when Webhook_Failed => return Ok_Text ("webhook failed");
         when Webhook_Retrying => return Ok_Text ("webhook retrying");
      end case;
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.Phrase (Key_Text ("webhook", Webhook_Status'Image (Status))),
      English);
end Webhook_Phrase;
