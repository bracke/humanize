separate (Humanize.Phrases.Support.Backend)
   function Task_Text (Locale : String; Status : Task_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Task_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Todo => return "zu erledigen";
            when In_Progress => return "in Arbeit";
            when Done => return "erledigt";
            when Skipped => return "ubersprungen";
            when Blocked_Task => return "blockiert";
            when Waiting_On => return "wartet auf";
         end case;
      else
         case Status is
            when Todo => return "to do";
            when In_Progress => return "in progress";
            when Done => return "done";
            when Skipped => return "skipped";
            when Blocked_Task => return "blocked";
            when Waiting_On => return "waiting on";
         end case;
      end if;
   end Task_Text;
