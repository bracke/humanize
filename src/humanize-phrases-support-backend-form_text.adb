separate (Humanize.Phrases.Support.Backend)
function Form_Text (Status : Form_Status) return String is
begin
   case Status is
      when Valid_Input => return "valid input";
      when Invalid_Input => return "invalid input";
      when Dirty => return "changed";
      when Pristine => return "unchanged";
      when Submitted => return "submitted";
      when Submission_Failed => return "submission failed";
   end case;
end Form_Text;
