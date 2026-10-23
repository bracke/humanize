separate (Humanize.Phrases.Support.Backend)
function Payment_Lifecycle_Text (Status : Payment_Lifecycle_Status) return String is
begin
   case Status is
      when Payment_Authorized => return "payment authorized";
      when Payment_Captured => return "payment captured";
      when Payment_Refunded => return "payment refunded";
      when Payment_Disputed => return "payment disputed";
      when Payment_Requires_Action => return "payment requires action";
      when Payment_Expired => return "payment expired";
   end case;
end Payment_Lifecycle_Text;
