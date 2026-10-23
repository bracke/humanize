separate (Humanize.Phrases.Support.Backend)
function Network_Text (Status : Network_Status) return String is
begin
   case Status is
      when Offline => return "offline";
      when Online => return "online";
      when Connecting => return "connecting";
      when Syncing => return "syncing";
      when Sync_Failed => return "sync failed";
      when Permission_Denied => return "permission denied";
      when Read_Only => return "read only";
   end case;
end Network_Text;
