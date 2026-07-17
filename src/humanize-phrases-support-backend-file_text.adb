separate (Humanize.Phrases.Support.Backend)
function File_Text (Locale : String; Status : File_Status) return String is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, File_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Uploading => return "wird hochgeladen";
            when Downloading => return "wird heruntergeladen";
            when Copying => return "wird kopiert";
            when Moving => return "wird verschoben";
            when Deleting => return "wird geloscht";
            when Deleted => return "geloscht";
            when Restoring => return "wird wiederhergestellt";
            when Synced => return "synchronisiert";
         end case;
      else
         case Status is
            when Uploading => return "uploading";
            when Downloading => return "downloading";
            when Copying => return "copying";
            when Moving => return "moving";
            when Deleting => return "deleting";
            when Deleted => return "deleted";
            when Restoring => return "restoring";
            when Synced => return "synced";
         end case;
      end if;
end File_Text;
