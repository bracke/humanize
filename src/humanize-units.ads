with Humanize.Contexts;
with Humanize.Status;

--  Unit-quantity humanization ("5 meters", "1 kilogram").
--
--  Renders a whole quantity of a measurement unit with the locale's word and
--  plural form. Values are non-negative integers; fractional unit quantities
--  are deferred (i18n plural selection is integer-only). This package selects
--  keys only and must not call I18N.Runtime directly (HUM-INV-002).
package Humanize.Units is

   type Unit_Kind is
     (Meter,
      Kilometer,
      Gram,
      Kilogram,
      Liter);

   --  Convenience API: humanize Value of Unit, owned result.
   function Format
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : Unit_Kind)
      return Humanize.Status.Text_Result;

   --  Bounded API: render into caller-owned Target. Target must be 1-based.
   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : Unit_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

end Humanize.Units;
