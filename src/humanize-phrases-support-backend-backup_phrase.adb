separate (Humanize.Phrases.Support.Backend)
function Backup_Phrase
  (Context : Humanize.Contexts.Context;
   Status  : Backup_Status)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      case Status is
         when Backup_Running =>
            return Ok_Text ("backup running");
         when Backup_Completed =>
            return Ok_Text ("backup completed");
         when Backup_Failed =>
            return Ok_Text ("backup failed");
         when Backup_Stale =>
            return Ok_Text ("backup stale");
      end case;
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.Phrase (Key_Text ("backup", Backup_Status'Image (Status))),
      English);
end Backup_Phrase;
