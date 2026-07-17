separate (Humanize.Phrases.Support.Backend)
function Security_Text
     (Locale : String;
      Status : Security_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Security_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Secure => return "sicher";
            when Insecure => return "unsicher";
            when Vulnerable => return "verwundbar";
            when Encrypted => return "verschlusselt";
            when Unencrypted => return "unverschlusselt";
            when Token_Expired => return "Token abgelaufen";
         end case;
      else
         case Status is
            when Secure => return "secure";
            when Insecure => return "insecure";
            when Vulnerable => return "vulnerable";
            when Encrypted => return "encrypted";
            when Unencrypted => return "unencrypted";
            when Token_Expired => return "token expired";
         end case;
      end if;
end Security_Text;
