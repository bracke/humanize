separate (Humanize.Phrases.Support.Backend)
function Database_Severity
     (Status : Database_Status)
      return Phrase_Severity
   is
begin
      case Status is
         when Database_Online =>
            return Success_Severity;
         when Database_Offline | Database_Migration_Failed
            | Database_Backup_Failed =>
            return Danger_Severity;
         when Database_Degraded | Database_Replication_Lagging =>
            return Warning_Severity;
         when Database_Migrating | Database_Replicating
            | Database_Backup_Running =>
            return Info_Severity;
      end case;
end Database_Severity;
