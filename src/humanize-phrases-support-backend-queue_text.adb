separate (Humanize.Phrases.Support.Backend)
function Queue_Text (Status : Queue_Status) return String is
begin
   case Status is
      when Queued => return "queued";
      when Running => return "running";
      when Waiting => return "waiting";
      when Blocked => return "blocked";
      when Canceled_Job => return "job canceled";
      when Completed_Job => return "job completed";
   end case;
end Queue_Text;
