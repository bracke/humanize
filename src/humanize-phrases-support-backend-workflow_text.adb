separate (Humanize.Phrases.Support.Backend)
function Workflow_Text
     (Locale : String;
      Status : Workflow_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Workflow_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Draft => return "Entwurf";
            when In_Review => return "in Prufung";
            when Approved => return "genehmigt";
            when Rejected => return "abgelehnt";
            when Published => return "veroffentlicht";
            when Archived => return "archiviert";
         end case;
      else
         case Status is
            when Draft => return "draft";
            when In_Review => return "in review";
            when Approved => return "approved";
            when Rejected => return "rejected";
            when Published => return "published";
            when Archived => return "archived";
         end case;
      end if;
end Workflow_Text;
