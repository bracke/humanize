separate (Humanize.Phrases.Support.Backend)
function Issue_Text (Status : Issue_Status) return String is
begin
   case Status is
      when Open => return "open";
      when Closed => return "closed";
      when Reopened => return "reopened";
      when Assigned => return "assigned";
      when Unassigned => return "unassigned";
      when Merged => return "merged";
   end case;
end Issue_Text;
