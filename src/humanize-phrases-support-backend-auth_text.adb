separate (Humanize.Phrases.Support.Backend)
function Auth_Text (Status : Auth_Status) return String is
begin
   case Status is
      when Signed_In => return "signed in";
      when Signed_Out => return "signed out";
      when Session_Expired => return "session expired";
      when Locked => return "locked";
      when Two_Factor_Required => return "two-factor required";
   end case;
end Auth_Text;
