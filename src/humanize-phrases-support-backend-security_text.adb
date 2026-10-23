separate (Humanize.Phrases.Support.Backend)
function Security_Text (Status : Security_Status) return String is
begin
   case Status is
      when Secure => return "secure";
      when Insecure => return "insecure";
      when Vulnerable => return "vulnerable";
      when Encrypted => return "encrypted";
      when Unencrypted => return "unencrypted";
      when Token_Expired => return "token expired";
   end case;
end Security_Text;
