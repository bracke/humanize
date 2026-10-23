separate (Humanize.Phrases.Support.Backend)
function Health_Text (Status : Health_Status) return String is
begin
   case Status is
      when Healthy => return "healthy";
      when Degraded => return "degraded";
      when Unhealthy => return "unhealthy";
      when Incident => return "incident";
      when Maintenance => return "maintenance";
      when Recovering => return "recovering";
   end case;
end Health_Text;
