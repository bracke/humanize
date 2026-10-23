with Ada.Strings.Unbounded;
with I18N.Locales;
with Messages.Runtime;

package Humanize.Contexts is

   --  Non-owning reference to a caller-owned I18N runtime.
   --
   --  The referenced runtime must outlive every Humanize context that uses it.
   --  Humanize never initializes, finalizes, or mutates the runtime during
   --  formatting.
   type Runtime_Access is not null access constant Messages.Runtime.Instance;

   type Context is private;

   --  Create a non-owning formatting context bound to Runtime and Locale.
   function Create
     (Runtime : Runtime_Access;
      Locale  : I18N.Locales.Locale_Id)
      return Context;
   --  @param Runtime Caller-owned I18N runtime that outlives the context.
   --  @param Locale Locale identifier used for rendering.
   --  @return Context bound to Runtime and Locale.

   --  Locale identifier this context renders with.
   function Locale
     (Item : Context)
      return I18N.Locales.Locale_Id;
   --  @param Item Context to inspect.
   --  @return Locale identifier stored in Item.

   --  The referenced runtime.
   function Runtime
     (Item : Context)
      return Runtime_Access;
   --  @param Item Context to inspect.
   --  @return Referenced I18N runtime.

   function With_Noun_Forms
     (Item   : Context;
      Plural : String;
      Zero   : String := "";
      Two    : String := "";
      Few    : String := "";
      Many   : String := "")
      return Context;
   --  A caller's noun has two forms (a singular and a plural); languages with
   --  more plural categories need more. Registers the extra CLDR forms of the
   --  noun whose plural form is Plural, for the phrases rendered with the
   --  returned context ("pliki", Many => "plików" -- Polish "5 plików").
   --  @param Item Context to extend.
   --  @param Plural The noun's plural form, as passed to the formatters.
   --  @param Zero Form for the zero category, or "" for the plural form.
   --  @param Two Form for the two category, or "" for the plural form.
   --  @param Few Form for the few category, or "" for the plural form.
   --  @param Many Form for the many category, or "" for the plural form.
   --  @return Item with the forms registered.

   function Noun_Form
     (Item     : Context;
      Plural   : String;
      Category : String)
      return String;
   --  @param Item Context to inspect.
   --  @param Plural The noun's plural form.
   --  @param Category "zero", "two", "few" or "many".
   --  @return The registered form, or Plural when none is registered.

private

   type Context is record
      Runtime_Ref : Runtime_Access;
      Locale_Text : Ada.Strings.Unbounded.Unbounded_String;
      --  Registered noun forms: "<plural> <category> <form>" records, fields
      --  separated by unit separators, records by record separators.
      Noun_Forms  : Ada.Strings.Unbounded.Unbounded_String;
   end record;

end Humanize.Contexts;
