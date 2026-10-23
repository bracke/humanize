separate (Humanize.Phrases.Support.Backend)
function Sync_Text (Status : Sync_Status) return String is
begin
   case Status is
      when Sync_Idle => return "sync idle";
      when Syncing_Now => return "syncing now";
      when Sync_Queued => return "sync queued";
      when Sync_Conflict => return "sync conflict";
      when Sync_Complete => return "sync complete";
      when Sync_Error => return "sync error";
   end case;
end Sync_Text;
