--  Provenance: generated from reviewed native catalog fragments; split shard:
--  additional Latin-script native catalog fragment aggregator.

separate (Humanize.Catalogs.Native_Data)
   function Additional_Latin_Locale_Catalogs return String is
   begin
      return
        Additional_Latin_European_Locale_Catalogs
        & Additional_Latin_Global_Locale_Catalogs;
   end Additional_Latin_Locale_Catalogs;
