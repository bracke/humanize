with Humanize.Messages;

package body Humanize.Unit_Classification is

   use Humanize.Messages;
   use Humanize.Units;

   function Unit_Key (Unit : Unit_Kind) return Message_Id is
     (case Unit is
         when Meter     => Unit_Meter,
         when Kilometer => Unit_Kilometer,
         when Gram      => Unit_Gram,
         when Kilogram  => Unit_Kilogram,
         when Liter     => Unit_Liter);

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

end Humanize.Unit_Classification;
