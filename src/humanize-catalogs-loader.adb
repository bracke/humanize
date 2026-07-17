with Humanize.Catalogs.Core_Data;
with Humanize.Catalogs.Native_Data;

package body Humanize.Catalogs.Loader is

   function Shipped_Locales return Shipped_Locale_List is
   begin
      return Humanize.Locales.Shipped_Locales;
   end Shipped_Locales;

   function Regional_Shipped_Locales return Regional_Locale_List is
   begin
      return Humanize.Locales.Regional_Shipped_Locales;
   end Regional_Shipped_Locales;

   function All_Shipped_Locales return All_Shipped_Locale_List is
   begin
      return Humanize.Locales.All_Shipped_Locales;
   end All_Shipped_Locales;

   procedure Load_Defaults
     (Runtime : in out I18N.Runtime.Instance;
      Result  : out I18N.Runtime.Load_Result;
      Policy  : I18N.Runtime.Duplicate_Policy :=
        I18N.Runtime.Reject_Duplicates)
   is
   begin
      I18N.Runtime.Load_Text
        (Item        => Runtime,
         Source_Name => "humanize.builtin.catalog",
         Text        =>
           Humanize.Catalogs.Core_Data.Default_Catalog
           & Humanize.Catalogs.Native_Data.Default_Catalog,
         Result      => Result,
         Policy      => Policy);
   end Load_Defaults;

end Humanize.Catalogs.Loader;
