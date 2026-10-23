separate (Humanize.Phrases.Support.Backend)
function Billing_Text (Status : Billing_Status) return String is
begin
   case Status is
      when Trialing => return "trialing";
      when Payment_Due => return "payment due";
      when Payment_Failed => return "payment failed";
      when Paid => return "paid";
      when Past_Due => return "past due";
      when Canceled => return "canceled";
   end case;
end Billing_Text;
