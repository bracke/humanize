separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Fr_Be (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "fr-BE", Name, Template);
   end P;
begin
   P ("business_days", "{days} {days, plural, one {jour ouvrable} other {jours ouvrables}}");
end Locale_Fr_Be;
