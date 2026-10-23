separate (Humanize.Catalogs.Phrase_Data)
function Locale_En_001 return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("en-001", Name, Template));
begin
   return
     P ("billing.canceled", "cancelled")
     & P ("payment.payment_authorized", "payment authorised")
     & P ("queue.canceled_job", "job cancelled")
     & P ("operation.canceled", "cancelled")
     & P ("summary.canceled", "{count} cancelled");
end Locale_En_001;
