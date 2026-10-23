--  Provenance: Humanize-owned phrase translations, one subunit per locale.

private package Humanize.Catalogs.Phrase_Data is

   function Default_Catalog return String;
   --  @return Every shipped locale's humanize.phrase.* entries, UTF-8.

   function Catalog_For (Language : String) return String;
   --  @param Language A language code ("de", "nb"), without region.
   --  @return That language's humanize.phrase.* entries, UTF-8; Norwegian
   --  "no" and "nb" bring each other's; "" for English or an unshipped one.

end Humanize.Catalogs.Phrase_Data;
