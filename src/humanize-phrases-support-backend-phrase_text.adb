separate (Humanize.Phrases.Support.Backend)
function Phrase_Text (Status : UI_Status) return String is
begin
   case Status is
      when Empty => return "empty";
      when Loading => return "loading";
      when Saving => return "saving";
      when Saved => return "saved";
      when Unsaved => return "unsaved";
      when Retrying => return "retrying";
      when Paused => return "paused";
      when Complete => return "complete";
      when Failed => return "failed";
      when Due_Soon => return "due soon";
      when Overdue => return "overdue";
      when Last_Seen => return "last seen";
      when Updated_Just_Now => return "updated just now";
   end case;
end Phrase_Text;
