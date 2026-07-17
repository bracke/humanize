separate (Humanize.Phrases.Support.Backend)
function Database_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Database_Status)
      return Humanize.Status.Text_Result
   is
      Locale : constant String := Language_Code (Humanize.Contexts.Locale (Context));
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Ok_Text (Generated_Phrase (Locale, Database_Status'Image (Status)));
      end if;

      case Status is
         when Database_Online =>
            return Ok_Text ("database online");
         when Database_Offline =>
            return Ok_Text ("database offline");
         when Database_Degraded =>
            return Ok_Text ("database degraded");
         when Database_Migrating =>
            return Ok_Text ("database migrating");
         when Database_Migration_Failed =>
            return Ok_Text ("database migration failed");
         when Database_Replicating =>
            return Ok_Text ("database replicating");
         when Database_Replication_Lagging =>
            return Ok_Text ("database replication lagging");
         when Database_Backup_Running =>
            return Ok_Text ("database backup running");
         when Database_Backup_Failed =>
            return Ok_Text ("database backup failed");
      end case;
end Database_Phrase;
