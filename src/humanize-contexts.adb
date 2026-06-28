package body Humanize.Contexts is

   use Ada.Strings.Unbounded;

   function Create
     (Runtime : Runtime_Access;
      Locale  : I18N.Locales.Locale_Id)
      return Context
   is
   begin
      return
        (Runtime_Ref => Runtime,
         Locale_Text => To_Unbounded_String (Locale));
   end Create;

   function Locale
     (Item : Context)
      return I18N.Locales.Locale_Id
   is
   begin
      return To_String (Item.Locale_Text);
   end Locale;

   function Runtime
     (Item : Context)
      return Runtime_Access
   is
   begin
      return Item.Runtime_Ref;
   end Runtime;

end Humanize.Contexts;
