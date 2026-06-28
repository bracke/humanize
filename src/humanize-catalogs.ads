with I18N.Runtime;

package Humanize.Catalogs is

   --  Load the built-in Humanize v0.1 catalog fragments into Runtime.
   --
   --  The default catalog set contains English and Danish entries for every
   --  required v0.1 Humanize key. Loading is delegated to the public
   --  I18N.Runtime.Load_Text operation; duplicate handling follows Policy.
   --  Humanize never silently overrides application catalog keys (the default
   --  policy rejects duplicates), and only defines humanize.* keys.
   procedure Load_Defaults
     (Runtime : in out I18N.Runtime.Instance;
      Result  : out I18N.Runtime.Load_Result;
      Policy  : I18N.Runtime.Duplicate_Policy :=
        I18N.Runtime.Reject_Duplicates);

end Humanize.Catalogs;
