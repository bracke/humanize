private package Humanize.Catalogs.Loader is

   function Shipped_Locales return Shipped_Locale_List;
   --  @return Array of access values for shipped base locale tags.

   function Regional_Shipped_Locales return Regional_Locale_List;
   --  @return Array of access values for shipped regional locale tags.

   function All_Shipped_Locales return All_Shipped_Locale_List;
   --  @return Array of access values for every shipped locale tag.

   procedure Load_Defaults
     (Runtime : in out Messages.Runtime.Instance;
      Result  : out Messages.Runtime.Load_Result;
      Policy  : Messages.Runtime.Duplicate_Policy :=
        Messages.Runtime.Reject_Duplicates);
   --  Load the built-in catalog fragments into Runtime.

end Humanize.Catalogs.Loader;
