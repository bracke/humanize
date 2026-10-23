separate (Humanize.Phrases.Support.Backend)
function Invoice_Phrase
  (Context : Humanize.Contexts.Context;
   Status  : Invoice_Status)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      case Status is
         when Invoice_Draft => return Ok_Text ("invoice draft");
         when Invoice_Sent => return Ok_Text ("invoice sent");
         when Invoice_Paid => return Ok_Text ("invoice paid");
         when Invoice_Refunded => return Ok_Text ("invoice refunded");
         when Invoice_Overdue => return Ok_Text ("invoice overdue");
         when Refund_Failed => return Ok_Text ("refund failed");
      end case;
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.Phrase (Key_Text ("invoice", Invoice_Status'Image (Status))),
      English);
end Invoice_Phrase;
