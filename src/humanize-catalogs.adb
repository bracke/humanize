with Humanize.Catalogs.Loader;
with Humanize.I18N_Rendering;

package body Humanize.Catalogs is

   function Shipped_Locales return Shipped_Locale_List
      renames Humanize.Catalogs.Loader.Shipped_Locales;

   function Regional_Shipped_Locales return Regional_Locale_List
      renames Humanize.Catalogs.Loader.Regional_Shipped_Locales;

   function All_Shipped_Locales return All_Shipped_Locale_List
      renames Humanize.Catalogs.Loader.All_Shipped_Locales;

   function Available
     (Context : Humanize.Contexts.Context;
      Id      : Humanize.Messages.Message_Id)
      return Boolean
      renames Humanize.I18N_Rendering.Available;

   procedure Load_Defaults
     (Runtime : in out I18N.Runtime.Instance;
      Result  : out I18N.Runtime.Load_Result;
      Policy  : I18N.Runtime.Duplicate_Policy :=
        I18N.Runtime.Reject_Duplicates)
      renames Humanize.Catalogs.Loader.Load_Defaults;

end Humanize.Catalogs;
