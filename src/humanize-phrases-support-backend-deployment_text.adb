separate (Humanize.Phrases.Support.Backend)
function Deployment_Text (Status : Deployment_Status) return String is
begin
   case Status is
      when Deploying => return "deploying";
      when Deployed => return "deployed";
      when Rolling_Back => return "rolling back";
      when Rolled_Back => return "rolled back";
      when Build_Failed => return "build failed";
      when Checks_Passed => return "checks passed";
   end case;
end Deployment_Text;
