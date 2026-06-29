with Humanize.Contexts;
with Humanize.Numbers;
with Humanize.Status;

--  Unit-quantity humanization ("5 meters", "1.5 kilometers", "1 kilogram").
--
--  Renders a quantity of a measurement unit with the locale's word and plural
--  form. Whole quantities use the Natural overloads; fractional quantities use
--  the Long_Float overloads (plural agreement via i18n CLDR fractional
--  operands). This package selects keys only and must not call I18N.Runtime
--  directly (HUM-INV-002).
package Humanize.Units is

   type Unit_Kind is
     (Meter,
      Kilometer,
      Centimeter,
      Millimeter,
      Gram,
      Kilogram,
      Milligram,
      Liter,
      Milliliter);

   --  Convenience API: humanize Value of Unit, owned result.
   function Format
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : Unit_Kind)
      return Humanize.Status.Text_Result;

   --  Fractional quantity ("1.5 kilometers"). Options control fraction digits.
   function Format
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : Unit_Kind;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;

   --  Bounded API: render into caller-owned Target. Target must be 1-based.
   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : Unit_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : Unit_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);

end Humanize.Units;
