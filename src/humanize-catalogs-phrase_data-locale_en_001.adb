separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_En_001 (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "en-001", Name, Template);
   end P;
begin
   P ("billing.canceled", "cancelled");
   P ("payment.payment_authorized", "payment authorised");
   P ("queue.canceled_job", "job cancelled");
   P ("operation.canceled", "cancelled");
   P ("summary.canceled", "{count} cancelled");
end Locale_En_001;
