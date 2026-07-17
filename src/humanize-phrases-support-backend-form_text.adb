separate (Humanize.Phrases.Support.Backend)
function Form_Text
     (Locale : String;
      Status : Form_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Form_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Valid_Input => return "gultige Eingabe";
            when Invalid_Input => return "ungultige Eingabe";
            when Dirty => return "geandert";
            when Pristine => return "unverandert";
            when Submitted => return "gesendet";
            when Submission_Failed => return "Senden fehlgeschlagen";
         end case;
      else
         case Status is
            when Valid_Input => return "valid input";
            when Invalid_Input => return "invalid input";
            when Dirty => return "changed";
            when Pristine => return "unchanged";
            when Submitted => return "submitted";
            when Submission_Failed => return "submission failed";
         end case;
      end if;
end Form_Text;
