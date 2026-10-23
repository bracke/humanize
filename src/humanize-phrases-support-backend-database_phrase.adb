separate (Humanize.Phrases.Support.Backend)
function Database_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Database_Status)
      return Humanize.Status.Text_Result
   is
      function English return String is
      begin
         case Status is
            when Database_Online =>
               return "database online";
            when Database_Offline =>
               return "database offline";
            when Database_Degraded =>
               return "database degraded";
            when Database_Migrating =>
               return "database migrating";
            when Database_Migration_Failed =>
               return "database migration failed";
            when Database_Replicating =>
               return "database replicating";
            when Database_Replication_Lagging =>
               return "database replication lagging";
            when Database_Backup_Running =>
               return "database backup running";
            when Database_Backup_Failed =>
               return "database backup failed";
         end case;
      end English;
begin
      return Status_Phrase (Context, Key_Text ("database", Database_Status'Image (Status)), English);
end Database_Phrase;
