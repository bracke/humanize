with Humanize.Messages;
with Humanize.Number_Formatting;

package body Humanize.Unit_Classification is

   use Humanize.Messages;
   use Humanize.Units;

   function Unit_Key (Unit : Unit_Kind) return Message_Id is
     (case Unit is
         when Meter      => Unit_Meter,
         when Kilometer  => Unit_Kilometer,
         when Centimeter => Unit_Centimeter,
         when Millimeter => Unit_Millimeter,
         when Gram       => Unit_Gram,
         when Kilogram   => Unit_Kilogram,
         when Milligram  => Unit_Milligram,
         when Liter      => Unit_Liter,
         when Milliliter => Unit_Milliliter);

   function Classify
     (Value : Natural;
      Unit  : Unit_Kind)
      return Humanize.Selections.Message_Selection
   is
   begin
      return Humanize.Selections.Count
               (Unit_Key (Unit),
                Humanize.Selections.Count_Value (Long_Long_Integer (Value)));
   end Classify;

   function Classify_Decimal
     (Value                  : Long_Float;
      Unit                   : Unit_Kind;
      Max_Digits             : Natural;
      Suppress_Trailing_Zero : Boolean)
      return Humanize.Selections.Message_Selection
   is
   begin
      return Humanize.Selections.Decimal
               (Unit_Key (Unit),
                Humanize.Number_Formatting.Decimal_Image
                  (Value, Max_Digits, Suppress_Trailing_Zero));
   end Classify_Decimal;

end Humanize.Unit_Classification;
