with Humanize.Selections;
with Humanize.Units;

--  Pure unit rule selection: maps a unit + quantity to a count selection.
--  Never returns localized text (HUM-INV-001).
private package Humanize.Unit_Classification is

   function Classify
     (Value : Natural;
      Unit  : Humanize.Units.Unit_Kind)
      return Humanize.Selections.Message_Selection;

   --  Fractional quantity: Value is formatted to at most Max_Digits fraction
   --  digits and carried as a decimal plural selector.
   function Classify_Decimal
     (Value                  : Long_Float;
      Unit                   : Humanize.Units.Unit_Kind;
      Max_Digits             : Natural;
      Suppress_Trailing_Zero : Boolean)
      return Humanize.Selections.Message_Selection;

end Humanize.Unit_Classification;
