separate (Humanize.Phrases.Support.Backend)
function Billing_Text
     (Locale : String;
      Status : Billing_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Billing_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Trialing => return "Testphase";
            when Payment_Due => return "Zahlung fallig";
            when Payment_Failed => return "Zahlung fehlgeschlagen";
            when Paid => return "bezahlt";
            when Past_Due => return "uberfallig";
            when Canceled => return "gekundigt";
         end case;
      else
         case Status is
            when Trialing => return "trialing";
            when Payment_Due => return "payment due";
            when Payment_Failed => return "payment failed";
            when Paid => return "paid";
            when Past_Due => return "past due";
            when Canceled => return "canceled";
         end case;
      end if;
end Billing_Text;
