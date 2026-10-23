separate (Humanize.Phrases.Support.Backend)
function Workflow_Text (Status : Workflow_Status) return String is
begin
   case Status is
      when Draft => return "draft";
      when In_Review => return "in review";
      when Approved => return "approved";
      when Rejected => return "rejected";
      when Published => return "published";
      when Archived => return "archived";
   end case;
end Workflow_Text;
