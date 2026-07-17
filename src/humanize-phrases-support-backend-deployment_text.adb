separate (Humanize.Phrases.Support.Backend)
function Deployment_Text
     (Locale : String;
      Status : Deployment_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Deployment_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Deploying => return "Bereitstellung lauft";
            when Deployed => return "bereitgestellt";
            when Rolling_Back => return "Rollback lauft";
            when Rolled_Back => return "zuruckgesetzt";
            when Build_Failed => return "Build fehlgeschlagen";
            when Checks_Passed => return "Prufungen bestanden";
         end case;
      else
         case Status is
            when Deploying => return "deploying";
            when Deployed => return "deployed";
            when Rolling_Back => return "rolling back";
            when Rolled_Back => return "rolled back";
            when Build_Failed => return "build failed";
            when Checks_Passed => return "checks passed";
         end case;
      end if;
end Deployment_Text;
