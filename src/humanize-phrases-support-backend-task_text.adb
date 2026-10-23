separate (Humanize.Phrases.Support.Backend)
function Task_Text (Status : Task_Status) return String is
begin
   case Status is
      when Todo => return "to do";
      when In_Progress => return "in progress";
      when Done => return "done";
      when Skipped => return "skipped";
      when Blocked_Task => return "blocked";
      when Waiting_On => return "waiting on";
   end case;
end Task_Text;
