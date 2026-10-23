--  Provenance: Humanize-owned phrase translations, one subunit per locale.

private package Humanize.Catalogs.Phrase_Data is

   function Default_Catalog return String;
   --  @return Every shipped locale's humanize.phrase.* entries, UTF-8.

end Humanize.Catalogs.Phrase_Data;
