with I18N.Runtime;

package Humanize.Catalogs is

   --  Load the built-in Humanize catalog fragments into Runtime.
   --
   --  The default catalog set contains complete native fragments for en, da,
   --  de, fr, es, it, pt, and nl, plus generated-source complete fragments for
   --  additional high-coverage locale codes. Generated-source fragments use
   --  native script or native Latin orthography for the core Humanize date,
   --  duration, byte, compact-number, unit, frequency, rate, and list words,
   --  and use a shared symbol layer for the broad engineering-unit tail.
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
