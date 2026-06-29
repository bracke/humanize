with Humanize.Selections;
with Humanize.Units;

--  Pure unit rule selection: maps a unit + quantity to a count selection.
--  Never returns localized text (HUM-INV-001).
private package Humanize.Unit_Classification is

   function Classify
     (Value : Natural;
      Unit  : Humanize.Units.Unit_Kind)
      return Humanize.Selections.Message_Selection;

end Humanize.Unit_Classification;
