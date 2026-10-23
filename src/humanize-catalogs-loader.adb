with Humanize.Catalogs.Core_Data;
with Humanize.Catalogs.Native_Data;
with Humanize.Catalogs.Phrase_Data;
with Humanize.Locales;

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
     (Runtime : in out Messages.Runtime.Instance;
      Result  : out Messages.Runtime.Load_Result;
      Policy  : Messages.Runtime.Duplicate_Policy :=
        Messages.Runtime.Reject_Duplicates)
   is
   begin
      Messages.Runtime.Load_Text
        (Item        => Runtime,
         Source_Name => "humanize.builtin.catalog",
         Text        =>
           Humanize.Catalogs.Core_Data.Default_Catalog
           & Humanize.Catalogs.Native_Data.Default_Catalog
           & Humanize.Catalogs.Phrase_Data.Default_Catalog,
         Result      => Result,
         Policy      => Policy);
   end Load_Defaults;

   procedure Load_Defaults
     (Runtime : in out Messages.Runtime.Instance;
      Result  : out Messages.Runtime.Load_Result;
      Locale  : String;
      Policy  : Messages.Runtime.Duplicate_Policy :=
        Messages.Runtime.Reject_Duplicates)
   is
   begin
      Messages.Runtime.Load_Text
        (Item        => Runtime,
         Source_Name => "humanize.builtin.catalog",
         Text        =>
           Humanize.Catalogs.Core_Data.Default_Catalog
           & Humanize.Catalogs.Native_Data.Default_Catalog
           & Humanize.Catalogs.Phrase_Data.Catalog_For (Humanize.Locales.Language_Code (Locale)),
         Result      => Result,
         Policy      => Policy);
   end Load_Defaults;

   procedure Load_Phrases
     (Runtime : in out Messages.Runtime.Instance;
      Result  : out Messages.Runtime.Load_Result;
      Locale  : String)
   is
   begin
      --  A language loaded before keeps its entries.
      Messages.Runtime.Load_Text
        (Item        => Runtime,
         Source_Name => "humanize.builtin.phrases",
         Text        => Humanize.Catalogs.Phrase_Data.Catalog_For (Humanize.Locales.Language_Code (Locale)),
         Result      => Result,
         Policy      => Messages.Runtime.Keep_First);
   end Load_Phrases;

end Humanize.Catalogs.Loader;
