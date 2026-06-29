with Humanize.Contexts;
with Humanize.Status;

--  Shared test fixtures: library-level i18n runtimes (so 'Access is legal for
--  the library-level Runtime_Access type) and context/text helpers.
package Humanize.Tests.Support is

   --  Context over a runtime that has the built-in Humanize catalog loaded.
   function En return Humanize.Contexts.Context;
   function Da return Humanize.Contexts.Context;
   function De return Humanize.Contexts.Context;
   function Fr return Humanize.Contexts.Context;
   function Es return Humanize.Contexts.Context;
   function It return Humanize.Contexts.Context;

   --  Context over a runtime with NO Humanize catalog (for missing-key tests).
   function Empty return Humanize.Contexts.Context;

   --  Rendered text of a convenience result.
   function Text (Item : Humanize.Status.Text_Result) return String;

end Humanize.Tests.Support;
