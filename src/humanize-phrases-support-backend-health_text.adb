separate (Humanize.Phrases.Support.Backend)
function Health_Text
     (Locale : String;
      Status : Health_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Health_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Healthy => return "gesund";
            when Degraded => return "eingeschrankt";
            when Unhealthy => return "ungesund";
            when Incident => return "Storung";
            when Maintenance => return "Wartung";
            when Recovering => return "erholt sich";
         end case;
      else
         case Status is
            when Healthy => return "healthy";
            when Degraded => return "degraded";
            when Unhealthy => return "unhealthy";
            when Incident => return "incident";
            when Maintenance => return "maintenance";
            when Recovering => return "recovering";
         end case;
      end if;
end Health_Text;
