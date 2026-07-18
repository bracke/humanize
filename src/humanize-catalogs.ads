with I18N.Runtime;

with Humanize.Contexts;
with Humanize.Locales;
with Humanize.Messages;

--  Public accessors for Humanize's built-in message catalogs and locale
--  availability metadata.
package Humanize.Catalogs is

   subtype Locale_Code_Access is Humanize.Locales.Locale_Code_Access;

   subtype Locale_Code_Array is Humanize.Locales.Locale_Code_Array;

   Shipped_Locale_Count : constant Positive :=
     Humanize.Locales.Shipped_Locale_Count;

   Regional_Shipped_Locale_Count : constant Positive :=
     Humanize.Locales.Regional_Shipped_Locale_Count;

   All_Shipped_Locale_Count : constant Positive :=
     Humanize.Locales.All_Shipped_Locale_Count;

   subtype Shipped_Locale_List is Locale_Code_Array (1 .. Shipped_Locale_Count);

   subtype Regional_Locale_List is
     Locale_Code_Array (1 .. Regional_Shipped_Locale_Count);

   subtype All_Shipped_Locale_List is
     Locale_Code_Array (1 .. All_Shipped_Locale_Count);

   function Shipped_Locales return Shipped_Locale_List;
   --  @return Array of access values for shipped base locale tags.

   function Regional_Shipped_Locales return Regional_Locale_List;
   --  @return Array of access values for shipped regional locale tags.

   function All_Shipped_Locales return All_Shipped_Locale_List;
   --  @return Array of access values for every shipped locale tag.

   function Is_Base_Shipped_Locale (Locale : String) return Boolean
     renames Humanize.Locales.Is_Base_Shipped_Locale;
   --  @param Locale Locale tag or locale-like string.
   --  @return True when Locale names a shipped base locale.

   function Is_Regional_Shipped_Locale (Locale : String) return Boolean
     renames Humanize.Locales.Is_Regional_Shipped_Locale;
   --  @param Locale Locale tag or locale-like string.
   --  @return True when Locale names a shipped regional fallback alias.

   function Is_Shipped_Locale (Locale : String) return Boolean
     renames Humanize.Locales.Is_Shipped_Locale;
   --  @param Locale Locale tag or locale-like string.
   --  @return True when Locale names any shipped base or regional locale tag.

   function Canonical_Shipped_Locale (Locale : String) return String
     renames Humanize.Locales.Canonical_Shipped_Locale;
   --  @param Locale Locale tag or locale-like string.
   --  @return Canonical shipped tag, or "" when Locale is not shipped.

   function Available
     (Context : Humanize.Contexts.Context;
      Id      : Humanize.Messages.Message_Id)
      return Boolean;
   --  @param Context Humanize context backed by a loaded runtime.
   --  @param Id Humanize message id to resolve through locale fallback.
   --  @return True when Id resolves for Context's locale.

   --  Load the built-in Humanize catalog fragments into Runtime.
   --
   --  The default catalog set contains complete reviewed native fragments for
   --  en, da, de, fr, es, it, pt, and nl, plus reviewed native-orthography
   --  Latin fragments for sv, no, nb, fi, pl, cs, tr, ro, lt, sl, id, ms,
   --  eo, vi, sw, af, hu, and sk. Complete reviewed native-script fragments
   --  are also included for ru, uk, ja, ko, zh, ar, and hi. Native-script
   --  fragments avoid Latin fallback for Humanize-owned
   --  date, duration, compact-number, unit, frequency, rate, and list words,
   --  with long-form wording for the broad engineering-unit tail.
   --  Loading is delegated to the public
   --  I18N.Runtime.Load_Text operation; duplicate handling follows Policy.
   --  Humanize never silently overrides application catalog keys (the default
   --  policy rejects duplicates), and only defines humanize.* keys.
   procedure Load_Defaults
     (Runtime : in out I18N.Runtime.Instance;
      Result  : out I18N.Runtime.Load_Result;
      Policy  : I18N.Runtime.Duplicate_Policy :=
        I18N.Runtime.Reject_Duplicates);
   --  @param Runtime Runtime that receives the built-in catalog fragments.
   --  @param Result Load result reported by I18N.Runtime.Load_Text.
   --  @param Policy Duplicate-key policy passed through to I18N.

end Humanize.Catalogs;
