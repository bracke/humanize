separate (Humanize.Phrases.Support.Backend)
function CI_Text (Status : CI_Status) return String is
begin
   case Status is
      when Pipeline_Pending => return "pipeline pending";
      when Pipeline_Running => return "pipeline running";
      when Pipeline_Passed => return "pipeline passed";
      when Pipeline_Failed => return "pipeline failed";
      when Review_Required => return "review required";
      when Deploy_Blocked => return "deploy blocked";
   end case;
end CI_Text;
