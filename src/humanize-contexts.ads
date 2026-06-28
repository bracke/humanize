with Ada.Strings.Unbounded;
with I18N.Locales;
with I18N.Runtime;

package Humanize.Contexts is

   --  Non-owning reference to a caller-owned I18N runtime.
   --
   --  The referenced runtime must outlive every Humanize context that uses it.
   --  Humanize never initializes, finalizes, or mutates the runtime during
   --  formatting.
   type Runtime_Access is not null access constant I18N.Runtime.Instance;

   type Context is private;

   --  Create a non-owning formatting context bound to Runtime and Locale.
   function Create
     (Runtime : Runtime_Access;
      Locale  : I18N.Locales.Locale_Id)
      return Context;

   --  Locale identifier this context renders with.
   function Locale
     (Item : Context)
      return I18N.Locales.Locale_Id;

   --  The referenced runtime.
   function Runtime
     (Item : Context)
      return Runtime_Access;

private

   type Context is record
      Runtime_Ref : Runtime_Access;
      Locale_Text : Ada.Strings.Unbounded.Unbounded_String;
   end record;

end Humanize.Contexts;
