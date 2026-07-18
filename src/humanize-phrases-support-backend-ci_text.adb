separate (Humanize.Phrases.Support.Backend)
   function CI_Text (Locale : String; Status : CI_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, CI_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Pipeline_Pending => return "Pipeline ausstehend";
            when Pipeline_Running => return "Pipeline lauft";
            when Pipeline_Passed => return "Pipeline bestanden";
            when Pipeline_Failed => return "Pipeline fehlgeschlagen";
            when Review_Required => return "Review erforderlich";
            when Deploy_Blocked => return "Deployment blockiert";
         end case;
      else
         case Status is
            when Pipeline_Pending => return "pipeline pending";
            when Pipeline_Running => return "pipeline running";
            when Pipeline_Passed => return "pipeline passed";
            when Pipeline_Failed => return "pipeline failed";
            when Review_Required => return "review required";
            when Deploy_Blocked => return "deploy blocked";
         end case;
      end if;
   end CI_Text;
