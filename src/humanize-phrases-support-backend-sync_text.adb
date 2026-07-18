separate (Humanize.Phrases.Support.Backend)
   function Sync_Text (Locale : String; Status : Sync_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Sync_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Sync_Idle => return "Synchronisierung bereit";
            when Syncing_Now => return "Synchronisierung lauft";
            when Sync_Queued => return "Synchronisierung geplant";
            when Sync_Conflict => return "Synchronisierungskonflikt";
            when Sync_Complete => return "Synchronisierung abgeschlossen";
            when Sync_Error => return "Synchronisierungsfehler";
         end case;
      else
         case Status is
            when Sync_Idle => return "sync idle";
            when Syncing_Now => return "syncing now";
            when Sync_Queued => return "sync queued";
            when Sync_Conflict => return "sync conflict";
            when Sync_Complete => return "sync complete";
            when Sync_Error => return "sync error";
         end case;
      end if;
   end Sync_Text;
