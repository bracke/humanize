separate (Humanize.Catalogs.Phrase_Data)
function Locale_En_Ca return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("en-CA", Name, Template));
begin
   return
     P ("billing.canceled", "cancelled")
     & P ("queue.canceled_job", "job cancelled")
     & P ("operation.canceled", "cancelled")
     & P ("summary.canceled", "{count} cancelled");
end Locale_En_Ca;
