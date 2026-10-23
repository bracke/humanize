separate (Humanize.Phrases.Support.Backend)
function Search_Text (Status : Search_Status) return String is
begin
   case Status is
      when Filtering => return "filtering";
      when Filtered => return "filtered";
      when No_Matches => return "no matches";
      when Search_Ready => return "search ready";
      when Search_Failed => return "search failed";
      when Query_Too_Short => return "query too short";
   end case;
end Search_Text;
