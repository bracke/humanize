separate (Humanize.Phrases.Support.Backend)
function Access_Text (Status : Access_Status) return String is
begin
   case Status is
      when Allowed => return "allowed";
      when Denied => return "denied";
      when Owner => return "owner";
      when Admin => return "admin";
      when Viewer => return "viewer";
      when Editor => return "editor";
   end case;
end Access_Text;
