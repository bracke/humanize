separate (Humanize.Phrases.Support.Backend)
function Network_Text
     (Locale : String;
      Status : Network_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Network_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Offline => return "offline";
            when Online => return "online";
            when Connecting => return "Verbindung wird hergestellt";
            when Syncing => return "wird synchronisiert";
            when Sync_Failed => return "Synchronisierung fehlgeschlagen";
            when Permission_Denied => return "Zugriff verweigert";
            when Read_Only => return "schreibgeschutzt";
         end case;
      else
         case Status is
            when Offline => return "offline";
            when Online => return "online";
            when Connecting => return "connecting";
            when Syncing => return "syncing";
            when Sync_Failed => return "sync failed";
            when Permission_Denied => return "permission denied";
            when Read_Only => return "read only";
         end case;
      end if;
end Network_Text;
