separate (Humanize.Phrases.Support.Backend)
   function Queue_Text (Locale : String; Status : Queue_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Queue_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Queued => return "in Warteschlange";
            when Running => return "laufend";
            when Waiting => return "wartend";
            when Blocked => return "blockiert";
            when Canceled_Job => return "Auftrag abgebrochen";
            when Completed_Job => return "Auftrag abgeschlossen";
         end case;
      else
         case Status is
            when Queued => return "queued";
            when Running => return "running";
            when Waiting => return "waiting";
            when Blocked => return "blocked";
            when Canceled_Job => return "job canceled";
            when Completed_Job => return "job completed";
         end case;
      end if;
   end Queue_Text;
