separate (Humanize.Phrases.Support.Backend)
function Audit_Phrase
  (Context : Humanize.Contexts.Context;
   Status  : Audit_Status)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      case Status is
         when Audit_Created => return Ok_Text ("audit entry created");
         when Audit_Updated => return Ok_Text ("audit entry updated");
         when Audit_Deleted => return Ok_Text ("audit entry deleted");
         when Audit_Restored => return Ok_Text ("audit entry restored");
      end case;
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.Phrase (Key_Text ("audit", Audit_Status'Image (Status))),
      English);
end Audit_Phrase;
