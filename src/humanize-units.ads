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
   --  Facade map:
   --  No public child packages; private unit support remains behind
   --  Humanize.Units.Support.

   --  Facade section: shared unit and measurement option types.

   type Unit_Kind is
     (Meter,
      Kilometer,
      Centimeter,
      Millimeter,
      Gram,
      Kilogram,
      Milligram,
      Liter,
      Milliliter,
      Celsius,
      Fahrenheit,
      Square_Meter,
      Hectare,
      Kilometer_Per_Hour,
      Meter_Per_Second,
      Pascal,
      Kilopascal,
      Joule,
      Kilojoule,
      Watt,
      Kilowatt,
      Hertz,
      Kilohertz,
      Degree,
      Mile,
      Yard,
      Foot,
      Inch,
      Nautical_Mile,
      Acre,
      Square_Kilometer,
      Cubic_Meter,
      Teaspoon,
      Tablespoon,
      Cup,
      Gallon,
      Pound,
      Ounce,
      Stone,
      Tonne,
      Ton);

   type Unit_Style is (Long, Abbreviated);

   type Measurement_System is
     (Locale_Default,
      Metric_System,
      US_Customary_System,
      UK_Mixed_System,
      Cooking_US_System);

   type Measurement_Options is record
      System       : Measurement_System := Locale_Default;
      Number_Style : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options;
   end record;

   Default_Measurement_Options : constant Measurement_Options :=
     (System       => Locale_Default,
      Number_Style => Humanize.Numbers.Default_Number_Options);

   --  Facade section: formatting and automatic unit selection helpers.

   --  Convenience API: humanize Value of Unit, owned result.
   function Format
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : Unit_Kind;
      Style   : Unit_Style := Long)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Whole quantity to format.
   --  @param Unit Measurement unit.
   --  @param Style Unit word or abbreviation style.
   --  @return Rendered unit quantity result.

   --  Fractional quantity ("1.5 kilometers"). Options control fraction digits.
   function Format
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : Unit_Kind;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options;
      Style   : Unit_Style := Long)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Fractional quantity to format.
   --  @param Unit Measurement unit.
   --  @param Options Fraction digit policy.
   --  @param Style Unit word or abbreviation style.
   --  @return Rendered unit quantity result.

   function Format_Length
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Meters Length in meters.
   --  @param Options Fraction digit policy.
   --  @return Rendered length using millimeter, centimeter, meter, or kilometer.

   function Format_Length
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Meters Length in meters.
   --  @param Options Measurement-system and fraction digit policy.
   --  @return Rendered length using locale/profile-appropriate units.

   function Format_Mass
     (Context : Humanize.Contexts.Context;
      Grams   : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Grams Mass in grams.
   --  @param Options Fraction digit policy.
   --  @return Rendered mass using milligram, gram, or kilogram.

   function Format_Mass
     (Context : Humanize.Contexts.Context;
      Grams   : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Grams Mass in grams.
   --  @param Options Measurement-system and fraction digit policy.
   --  @return Rendered mass using locale/profile-appropriate units.

   function Format_Volume
     (Context : Humanize.Contexts.Context;
      Liters  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Liters Volume in liters.
   --  @param Options Fraction digit policy.
   --  @return Rendered volume using milliliter or liter.

   function Format_Volume
     (Context : Humanize.Contexts.Context;
      Liters  : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Liters Volume in liters.
   --  @param Options Measurement-system and fraction digit policy.
   --  @return Rendered volume using locale/profile-appropriate units.

   function Format_Speed
     (Context           : Humanize.Contexts.Context;
      Meters_Per_Second : Long_Float;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Meters_Per_Second Speed in meters per second.
   --  @param Options Fraction digit policy.
   --  @return Rendered speed using m/s or km/h.

   function Format_Speed
     (Context           : Humanize.Contexts.Context;
      Meters_Per_Second : Long_Float;
      Options           : Measurement_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Meters_Per_Second Speed in meters per second.
   --  @param Options Measurement-system and fraction digit policy.
   --  @return Rendered speed using locale/profile-appropriate units.

   function Format_Area
     (Context       : Humanize.Contexts.Context;
      Square_Meters : Long_Float;
      Options       : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Square_Meters Area in square meters.
   --  @param Options Fraction digit policy.
   --  @return Rendered area using square meters, hectares, or square kilometers.

   function Format_Pressure
     (Context : Humanize.Contexts.Context;
      Pascals : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Pascals Pressure in pascals.
   --  @param Options Fraction digit policy.
   --  @return Rendered pressure using pascals or kilopascals.

   function Format_Energy
     (Context : Humanize.Contexts.Context;
      Joules  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Joules Energy in joules.
   --  @param Options Fraction digit policy.
   --  @return Rendered energy using joules or kilojoules.

   function Format_Power
     (Context : Humanize.Contexts.Context;
      Watts   : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Watts Power in watts.
   --  @param Options Fraction digit policy.
   --  @return Rendered power using watts or kilowatts.

   function Format_Temperature
     (Context : Humanize.Contexts.Context;
      Celsius_Value : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Celsius_Value Temperature in degrees Celsius.
   --  @param Options Fraction digit policy.
   --  @return Rendered temperature in Celsius.

   function Format_Temperature
     (Context : Humanize.Contexts.Context;
      Celsius_Value : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Celsius_Value Temperature in degrees Celsius.
   --  @param Options Measurement-system and fraction digit policy.
   --  @return Rendered temperature using locale/profile-appropriate units.

   function Format_Frequency
     (Context : Humanize.Contexts.Context;
      Hertz_Value : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Hertz_Value Frequency in hertz.
   --  @param Options Fraction digit policy.
   --  @return Rendered frequency using hertz or kilohertz.

   function Format_Angle
     (Context : Humanize.Contexts.Context;
      Degrees : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Degrees Angle in degrees.
   --  @param Options Fraction digit policy.
   --  @return Rendered angle in degrees.

   function Format_Data_Rate
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Bytes_Per_Second Data transfer rate in bytes per second.
   --  @param Options Fraction digit policy.
   --  @return Rendered data transfer rate.

   function Format_Bits
     (Context : Humanize.Contexts.Context;
      Bits    : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Bits Bit quantity.
   --  @param Options Fraction digit policy.
   --  @return Rendered bit quantity using bit, kbit, Mbit, or Gbit.

   function Format_Bit_Rate
     (Context         : Humanize.Contexts.Context;
      Bits_Per_Second : Long_Float;
      Options         : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Bits_Per_Second Data transfer rate in bits per second.
   --  @param Options Fraction digit policy.
   --  @return Rendered bit transfer rate.

   function Format_Binary_Data_Rate
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Bytes_Per_Second Data transfer rate in bytes per second.
   --  @param Options Fraction digit policy.
   --  @return Rendered binary byte transfer rate.

   function Format_Density
     (Context                  : Humanize.Contexts.Context;
      Kilograms_Per_Cubic_Meter : Long_Float;
      Options                  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kilograms_Per_Cubic_Meter Density in kilograms per cubic meter.
   --  @param Options Fraction digit policy.
   --  @return Rendered density.

   function Format_Acceleration
     (Context                  : Humanize.Contexts.Context;
      Meters_Per_Second_Squared : Long_Float;
      Options                  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Meters_Per_Second_Squared Acceleration in meters per second squared.
   --  @param Options Fraction digit policy.
   --  @return Rendered acceleration.

   function Format_Torque
     (Context       : Humanize.Contexts.Context;
      Newton_Meters : Long_Float;
      Options       : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Newton_Meters Torque in newton-meters.
   --  @param Options Fraction digit policy.
   --  @return Rendered torque.

   function Format_Fuel_Economy
     (Context            : Humanize.Contexts.Context;
      Liters_Per_100_Km  : Long_Float;
      Options            : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Liters_Per_100_Km Fuel use in liters per 100 kilometers.
   --  @param Options Fraction digit policy.
   --  @return Rendered fuel economy.

   function Format_Fuel_Economy
     (Context            : Humanize.Contexts.Context;
      Liters_Per_100_Km  : Long_Float;
      Options            : Measurement_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Liters_Per_100_Km Fuel use in liters per 100 kilometers.
   --  @param Options Measurement-system and fraction digit policy.
   --  @return Rendered fuel economy using locale/profile-appropriate units.

   function Format_Flow_Rate
     (Context           : Humanize.Contexts.Context;
      Liters_Per_Second : Long_Float;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Liters_Per_Second Flow rate in liters per second.
   --  @param Options Fraction digit policy.
   --  @return Rendered flow rate.

   function Format_Electric_Current
     (Context : Humanize.Contexts.Context;
      Amperes : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amperes Electric current in amperes.
   --  @param Options Fraction digit policy.
   --  @return Rendered electric current.

   function Format_Voltage
     (Context : Humanize.Contexts.Context;
      Volts   : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Volts Electric potential in volts.
   --  @param Options Fraction digit policy.
   --  @return Rendered voltage.

   function Format_Resolution
     (Context : Humanize.Contexts.Context;
      Width   : Natural;
      Height  : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Width Pixel width.
   --  @param Height Pixel height.
   --  @return Rendered resolution such as "1920 x 1080 px".

   function Format_Pixel_Density
     (Context : Humanize.Contexts.Context;
      Pixels_Per_Inch : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Pixels_Per_Inch Pixel density in pixels per inch.
   --  @param Options Fraction digit policy.
   --  @return Rendered pixel density.

   function Format_CSS_Length
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value CSS length value.
   --  @param Unit CSS unit suffix such as "px", "em", or "rem".
   --  @param Options Fraction digit policy.
   --  @return Rendered deterministic CSS length.

   function Format_Electric_Resistance
     (Context : Humanize.Contexts.Context;
      Ohms    : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Ohms Electric resistance in ohms.
   --  @param Options Fraction digit policy.
   --  @return Rendered electric resistance.

   function Format_Aspect_Ratio
     (Context : Humanize.Contexts.Context;
      Width   : Natural;
      Height  : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Width Width component.
   --  @param Height Height component.
   --  @return Reduced aspect ratio such as "16:9".

   function Format_Electric_Capacitance
     (Context : Humanize.Contexts.Context;
      Farads  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Farads Electric capacitance in farads.
   --  @param Options Fraction digit policy.
   --  @return Rendered electric capacitance.

   function Format_Electric_Inductance
     (Context : Humanize.Contexts.Context;
      Henries : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Henries Electric inductance in henries.
   --  @param Options Fraction digit policy.
   --  @return Rendered electric inductance.

   function Format_Concentration
     (Context : Humanize.Contexts.Context;
      Moles_Per_Liter : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Moles_Per_Liter Concentration in moles per liter.
   --  @param Options Fraction digit policy.
   --  @return Rendered concentration.

   function Format_Fuel_Efficiency_MPG
     (Context : Humanize.Contexts.Context;
      Miles_Per_Gallon : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Miles_Per_Gallon Fuel efficiency in miles per gallon.
   --  @param Options Fraction digit policy.
   --  @return Rendered fuel efficiency.

   function Format_Cooking_Temperature
     (Context : Humanize.Contexts.Context;
      Fahrenheit_Value : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Fahrenheit_Value Cooking temperature in degrees Fahrenheit.
   --  @param Options Fraction digit policy.
   --  @return Rendered cooking temperature.

   function Format_Cooking_Temperature
     (Context : Humanize.Contexts.Context;
      Fahrenheit_Value : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Fahrenheit_Value Cooking temperature in degrees Fahrenheit.
   --  @param Options Measurement-system and fraction digit policy.
   --  @return Rendered cooking temperature using locale/profile-appropriate units.

   function Format_Memory_Bandwidth
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Bytes_Per_Second Memory bandwidth in bytes per second.
   --  @param Options Fraction digit policy.
   --  @return Rendered memory bandwidth.

   function Format_Latency
     (Context      : Humanize.Contexts.Context;
      Microseconds : Long_Float;
      Options      : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Microseconds Latency in microseconds.
   --  @param Options Fraction digit policy.
   --  @return Rendered latency using us, ms, or s.

   function Format_Database_Throughput
     (Context               : Humanize.Contexts.Context;
      Operations_Per_Second : Long_Float;
      Options               : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Operations_Per_Second Database operations per second.
   --  @param Options Fraction digit policy.
   --  @return Rendered database throughput using ops/s, k ops/s, or M ops/s.

   function Format_CPU_Load
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Percent CPU load percent.
   --  @param Options Fraction digit policy.
   --  @return Rendered CPU load.

   function Format_Battery
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Percent Battery percentage.
   --  @param Options Fraction digit policy.
   --  @return Rendered battery level.

   function Format_Screen_Size
     (Context : Humanize.Contexts.Context;
      Inches  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Inches Diagonal screen size in inches.
   --  @param Options Fraction digit policy.
   --  @return Rendered screen size.

   function Format_Typography_Size
     (Context : Humanize.Contexts.Context;
      Points  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Points Typography size in points.
   --  @param Options Fraction digit policy.
   --  @return Rendered typography size.

   function Format_IOPS
     (Context : Humanize.Contexts.Context;
      IOPS    : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param IOPS Storage operations per second.
   --  @param Options Fraction digit policy.
   --  @return Rendered IOPS value.

   function Format_Audio_Level
     (Context  : Humanize.Contexts.Context;
      Decibels : Long_Float;
      Options  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Decibels Audio level in decibels.
   --  @param Options Fraction digit policy.
   --  @return Rendered audio level.

   function Format_Signal_Strength
     (Context : Humanize.Contexts.Context;
      DBm     : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param DBm Signal strength in dBm.
   --  @param Options Fraction digit policy.
   --  @return Rendered signal strength.

   function Format_Storage_Endurance
     (Context   : Humanize.Contexts.Context;
      Terabytes : Long_Float;
      Options   : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Terabytes Endurance in terabytes written.
   --  @param Options Fraction digit policy.
   --  @return Rendered storage endurance.

   function Format_Refresh_Rate
     (Context : Humanize.Contexts.Context;
      Hertz   : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Hertz Display refresh rate in hertz.
   --  @param Options Fraction digit policy.
   --  @return Rendered refresh rate.

   function Format_Luminance
     (Context : Humanize.Contexts.Context;
      Nits    : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Nits Luminance in nits.
   --  @param Options Fraction digit policy.
   --  @return Rendered luminance.

   function Format_Print_Resolution
     (Context : Humanize.Contexts.Context;
      DPI     : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param DPI Print resolution in dots per inch.
   --  @param Options Fraction digit policy.
   --  @return Rendered print resolution.

   function Format_Geographic_Distance
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Meters Geographic distance in meters.
   --  @param Options Fraction digit policy.
   --  @return Rendered geographic distance using meters or kilometers.

   function Format_Geographic_Distance
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Meters Geographic distance in meters.
   --  @param Options Measurement-system and fraction digit policy.
   --  @return Rendered geographic distance using locale/profile-appropriate units.

   --  Facade section: bounded output adapters.

   --  Bounded API: render into caller-owned Target. Target must be 1-based.
   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : Unit_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Style   : Unit_Style := Long);
   --  @param Context Formatting context.
   --  @param Value Whole quantity to format.
   --  @param Unit Measurement unit.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Style Unit word or abbreviation style.

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : Unit_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options;
      Style   : Unit_Style := Long);
   --  @param Context Formatting context.
   --  @param Value Fractional quantity to format.
   --  @param Unit Measurement unit.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.
   --  @param Style Unit word or abbreviation style.

   procedure Format_Length_Into
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Meters Length in meters.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Length_Into
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options);
   --  @param Context Formatting context.
   --  @param Meters Length in meters.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Measurement-system and fraction digit policy.

   procedure Format_Mass_Into
     (Context : Humanize.Contexts.Context;
      Grams   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Grams Mass in grams.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Mass_Into
     (Context : Humanize.Contexts.Context;
      Grams   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options);
   --  @param Context Formatting context.
   --  @param Grams Mass in grams.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Measurement-system and fraction digit policy.

   procedure Format_Volume_Into
     (Context : Humanize.Contexts.Context;
      Liters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Liters Volume in liters.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Volume_Into
     (Context : Humanize.Contexts.Context;
      Liters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options);
   --  @param Context Formatting context.
   --  @param Liters Volume in liters.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Measurement-system and fraction digit policy.

   procedure Format_Speed_Into
     (Context           : Humanize.Contexts.Context;
      Meters_Per_Second : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Meters_Per_Second Speed in meters per second.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Speed_Into
     (Context           : Humanize.Contexts.Context;
      Meters_Per_Second : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Measurement_Options);
   --  @param Context Formatting context.
   --  @param Meters_Per_Second Speed in meters per second.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Measurement-system and fraction digit policy.

   procedure Format_Area_Into
     (Context       : Humanize.Contexts.Context;
      Square_Meters : Long_Float;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Options       : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Square_Meters Area in square meters.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Pressure_Into
     (Context : Humanize.Contexts.Context;
      Pascals : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Pascals Pressure in pascals.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Energy_Into
     (Context : Humanize.Contexts.Context;
      Joules  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Joules Energy in joules.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Power_Into
     (Context : Humanize.Contexts.Context;
      Watts   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Watts Power in watts.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Temperature_Into
     (Context : Humanize.Contexts.Context;
      Celsius_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Celsius_Value Temperature in degrees Celsius.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Temperature_Into
     (Context : Humanize.Contexts.Context;
      Celsius_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options);
   --  @param Context Formatting context.
   --  @param Celsius_Value Temperature in degrees Celsius.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Measurement-system and fraction digit policy.

   procedure Format_Frequency_Into
     (Context : Humanize.Contexts.Context;
      Hertz_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Hertz_Value Frequency in hertz.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Angle_Into
     (Context : Humanize.Contexts.Context;
      Degrees : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Degrees Angle in degrees.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Data_Rate_Into
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Bytes_Per_Second Data transfer rate in bytes per second.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Bits_Into
     (Context : Humanize.Contexts.Context;
      Bits    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Bits Bit quantity.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Bit_Rate_Into
     (Context         : Humanize.Contexts.Context;
      Bits_Per_Second : Long_Float;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Options         : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Bits_Per_Second Data transfer rate in bits per second.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Binary_Data_Rate_Into
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Bytes_Per_Second Data transfer rate in bytes per second.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Density_Into
     (Context                  : Humanize.Contexts.Context;
      Kilograms_Per_Cubic_Meter : Long_Float;
      Target                   : in out String;
      Written                  : out Natural;
      Status                   : out Humanize.Status.Status_Code;
      Options                  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Kilograms_Per_Cubic_Meter Density in kilograms per cubic meter.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Acceleration_Into
     (Context                  : Humanize.Contexts.Context;
      Meters_Per_Second_Squared : Long_Float;
      Target                   : in out String;
      Written                  : out Natural;
      Status                   : out Humanize.Status.Status_Code;
      Options                  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Meters_Per_Second_Squared Acceleration in meters per second squared.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Torque_Into
     (Context       : Humanize.Contexts.Context;
      Newton_Meters : Long_Float;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Options       : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Newton_Meters Torque in newton-meters.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Fuel_Economy_Into
     (Context           : Humanize.Contexts.Context;
      Liters_Per_100_Km : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Liters_Per_100_Km Fuel use in liters per 100 kilometers.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Fuel_Economy_Into
     (Context           : Humanize.Contexts.Context;
      Liters_Per_100_Km : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Measurement_Options);
   --  @param Context Formatting context.
   --  @param Liters_Per_100_Km Fuel use in liters per 100 kilometers.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Measurement-system and fraction digit policy.

   procedure Format_Flow_Rate_Into
     (Context           : Humanize.Contexts.Context;
      Liters_Per_Second : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Liters_Per_Second Flow rate in liters per second.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Electric_Current_Into
     (Context : Humanize.Contexts.Context;
      Amperes : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Amperes Electric current in amperes.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Voltage_Into
     (Context : Humanize.Contexts.Context;
      Volts   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Volts Electric potential in volts.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Resolution_Into
     (Context : Humanize.Contexts.Context;
      Width   : Natural;
      Height  : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Width Pixel width.
   --  @param Height Pixel height.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Format_Pixel_Density_Into
     (Context : Humanize.Contexts.Context;
      Pixels_Per_Inch : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Pixels_Per_Inch Pixel density in pixels per inch.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_CSS_Length_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Value CSS length value.
   --  @param Unit CSS unit suffix such as "px", "em", or "rem".
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Electric_Resistance_Into
     (Context : Humanize.Contexts.Context;
      Ohms    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Ohms Electric resistance in ohms.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Aspect_Ratio_Into
     (Context : Humanize.Contexts.Context;
      Width   : Natural;
      Height  : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Width Width component.
   --  @param Height Height component.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Format_Electric_Capacitance_Into
     (Context : Humanize.Contexts.Context;
      Farads  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Farads Electric capacitance in farads.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Electric_Inductance_Into
     (Context : Humanize.Contexts.Context;
      Henries : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Henries Electric inductance in henries.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Concentration_Into
     (Context : Humanize.Contexts.Context;
      Moles_Per_Liter : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Moles_Per_Liter Concentration in moles per liter.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Fuel_Efficiency_MPG_Into
     (Context : Humanize.Contexts.Context;
      Miles_Per_Gallon : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Miles_Per_Gallon Fuel efficiency in miles per gallon.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Cooking_Temperature_Into
     (Context : Humanize.Contexts.Context;
      Fahrenheit_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Fahrenheit_Value Cooking temperature in degrees Fahrenheit.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Cooking_Temperature_Into
     (Context : Humanize.Contexts.Context;
      Fahrenheit_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options);
   --  @param Context Formatting context.
   --  @param Fahrenheit_Value Cooking temperature in degrees Fahrenheit.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Measurement-system and fraction digit policy.

   procedure Format_Memory_Bandwidth_Into
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Bytes_Per_Second Memory bandwidth in bytes per second.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Latency_Into
     (Context      : Humanize.Contexts.Context;
      Microseconds : Long_Float;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Options      : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Microseconds Latency in microseconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Database_Throughput_Into
     (Context               : Humanize.Contexts.Context;
      Operations_Per_Second : Long_Float;
      Target                : in out String;
      Written               : out Natural;
      Status                : out Humanize.Status.Status_Code;
      Options               : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Operations_Per_Second Database operations per second.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_CPU_Load_Into
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Percent CPU load percent.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Battery_Into
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Percent Battery percentage.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Screen_Size_Into
     (Context : Humanize.Contexts.Context;
      Inches  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Inches Diagonal screen size in inches.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Typography_Size_Into
     (Context : Humanize.Contexts.Context;
      Points  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Points Typography size in points.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_IOPS_Into
     (Context : Humanize.Contexts.Context;
      IOPS    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param IOPS Storage operations per second.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Audio_Level_Into
     (Context  : Humanize.Contexts.Context;
      Decibels : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Decibels Audio level in decibels.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Signal_Strength_Into
     (Context : Humanize.Contexts.Context;
      DBm     : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param DBm Signal strength in dBm.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Storage_Endurance_Into
     (Context   : Humanize.Contexts.Context;
      Terabytes : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Terabytes Endurance in terabytes written.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Refresh_Rate_Into
     (Context : Humanize.Contexts.Context;
      Hertz   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Hertz Display refresh rate in hertz.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Luminance_Into
     (Context : Humanize.Contexts.Context;
      Nits    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Nits Luminance in nits.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Print_Resolution_Into
     (Context : Humanize.Contexts.Context;
      DPI     : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param DPI Print resolution in dots per inch.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Geographic_Distance_Into
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Meters Geographic distance in meters.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   procedure Format_Geographic_Distance_Into
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options);
   --  @param Context Formatting context.
   --  @param Meters Geographic distance in meters.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Measurement-system and fraction digit policy.

end Humanize.Units;
