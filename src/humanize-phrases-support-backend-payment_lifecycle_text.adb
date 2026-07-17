separate (Humanize.Phrases.Support.Backend)
function Payment_Lifecycle_Text
     (Locale : String;
      Status : Payment_Lifecycle_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase
           (Locale, Payment_Lifecycle_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Payment_Authorized => return "Zahlung autorisiert";
            when Payment_Captured => return "Zahlung eingezogen";
            when Payment_Refunded => return "Zahlung erstattet";
            when Payment_Disputed => return "Zahlung angefochten";
            when Payment_Requires_Action => return "Zahlung erfordert Aktion";
            when Payment_Expired => return "Zahlung abgelaufen";
         end case;
      else
         case Status is
            when Payment_Authorized => return "payment authorized";
            when Payment_Captured => return "payment captured";
            when Payment_Refunded => return "payment refunded";
            when Payment_Disputed => return "payment disputed";
            when Payment_Requires_Action => return "payment requires action";
            when Payment_Expired => return "payment expired";
         end case;
      end if;
end Payment_Lifecycle_Text;
