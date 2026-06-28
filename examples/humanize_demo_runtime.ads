with I18N.Runtime;

--  A library-level aliased runtime so the example can take 'Access for the
--  library-level Humanize.Contexts.Runtime_Access type. Applications own the
--  I18N runtime; Humanize never mutates it during formatting.
package Humanize_Demo_Runtime is

   Runtime : aliased I18N.Runtime.Instance;

end Humanize_Demo_Runtime;
