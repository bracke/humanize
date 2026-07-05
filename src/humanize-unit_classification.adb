with Humanize.Messages;
with Humanize.Decimal_Images;

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
         when Milliliter => Unit_Milliliter,
         when Celsius    => Unit_Celsius,
         when Fahrenheit => Unit_Fahrenheit,
         when Square_Meter => Unit_Square_Meter,
         when Hectare => Unit_Hectare,
         when Kilometer_Per_Hour => Unit_Kilometer_Per_Hour,
         when Meter_Per_Second => Unit_Meter_Per_Second,
         when Pascal => Unit_Pascal,
         when Kilopascal => Unit_Kilopascal,
         when Joule => Unit_Joule,
         when Kilojoule => Unit_Kilojoule,
         when Watt => Unit_Watt,
         when Kilowatt => Unit_Kilowatt,
         when Hertz => Unit_Hertz,
         when Kilohertz => Unit_Kilohertz,
         when Degree => Unit_Degree,
         when Mile => Unit_Mile,
         when Yard => Unit_Yard,
         when Foot => Unit_Foot,
         when Inch => Unit_Inch,
         when Nautical_Mile => Unit_Nautical_Mile,
         when Acre => Unit_Acre,
         when Square_Kilometer => Unit_Square_Kilometer,
         when Cubic_Meter => Unit_Cubic_Meter,
         when Teaspoon => Unit_Teaspoon,
         when Tablespoon => Unit_Tablespoon,
         when Cup => Unit_Cup,
         when Gallon => Unit_Gallon,
         when Pound => Unit_Pound,
         when Ounce => Unit_Ounce,
         when Stone => Unit_Stone,
         when Tonne => Unit_Tonne,
         when Ton => Unit_Ton);

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
                Humanize.Decimal_Images.Decimal_Image
                  (Value, Max_Digits, Suppress_Trailing_Zero));
   end Classify_Decimal;

end Humanize.Unit_Classification;
