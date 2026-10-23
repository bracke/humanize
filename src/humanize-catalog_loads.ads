--  How many times humanize has loaded catalogs into any runtime: whatever is
--  learnt from a runtime's renderings (Humanize.Parsing.Localized) is learnt
--  again after a load, which can change them.
private package Humanize.Catalog_Loads is

   --  Count a load.
   procedure Note_Load;

   --  @return Loads so far.
   function Count return Natural;

end Humanize.Catalog_Loads;
