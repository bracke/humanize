separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Fr_Ch (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "fr-CH", Name, Template);
   end P;
   --  The domain labels (label.*), in nested subunits.
   procedure Labels_1 is separate;
begin
   P ("business_days", "{days} {days, plural, one {jour ouvrable} other {jours ouvrables}}");
   Labels_1;
end Locale_Fr_Ch;
