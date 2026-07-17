with Humanize.Decimal_Images;
with Humanize.I18N_Rendering;
with Humanize.Locales;
with Humanize.Unit_Classification;
with Humanize.Bounded_Text;

package body Humanize.Units.Support is
   use type Humanize.Status.Status_Code;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   procedure Copy_Result_Into
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Abbreviation (Unit : Unit_Kind) return String is
   begin
      case Unit is
         when Meter => return "m";
         when Kilometer => return "km";
         when Centimeter => return "cm";
         when Millimeter => return "mm";
         when Gram => return "g";
         when Kilogram => return "kg";
         when Milligram => return "mg";
         when Liter => return "L";
         when Milliliter => return "mL";
         when Celsius => return "deg C";
         when Fahrenheit => return "deg F";
         when Square_Meter => return "m2";
         when Hectare => return "ha";
         when Kilometer_Per_Hour => return "km/h";
         when Meter_Per_Second => return "m/s";
         when Pascal => return "Pa";
         when Kilopascal => return "kPa";
         when Joule => return "J";
         when Kilojoule => return "kJ";
         when Watt => return "W";
         when Kilowatt => return "kW";
         when Hertz => return "Hz";
         when Kilohertz => return "kHz";
         when Degree => return "deg";
         when Mile => return "mi";
         when Yard => return "yd";
         when Foot => return "ft";
         when Inch => return "in";
         when Nautical_Mile => return "nmi";
         when Acre => return "ac";
         when Square_Kilometer => return "km2";
         when Cubic_Meter => return "m3";
         when Teaspoon => return "tsp";
         when Tablespoon => return "tbsp";
         when Cup => return "cup";
         when Gallon => return "gal";
         when Pound => return "lb";
         when Ounce => return "oz";
         when Stone => return "st";
         when Tonne => return "t";
         when Ton => return "ton";
      end case;
   end Abbreviation;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function No_Space (Image : String) return String
      renames Humanize.Bounded_Text.No_Space;

   function B (Hex : String) return String
      renames Humanize.Bounded_Text.Hex_Bytes;

   function Resolved_System
     (Context : Humanize.Contexts.Context;
      Options : Measurement_Options)
      return Measurement_System
   is
      Lang   : constant String :=
        Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
      Region : constant String :=
        Humanize.Locales.Region_Code (Humanize.Contexts.Locale (Context));
   begin
      if Options.System /= Locale_Default then
         return Options.System;
      elsif Lang = "en" and then Region = "us" then
         return US_Customary_System;
      elsif Lang = "en" and then Region = "gb" then
         return UK_Mixed_System;
      elsif Lang = "en" then
         return Metric_System;
      else
         return Metric_System;
      end if;
   end Resolved_System;

   function Fahrenheit_From_Celsius (Value : Long_Float) return Long_Float is
     (Value * 9.0 / 5.0 + 32.0);

   function Celsius_From_Fahrenheit (Value : Long_Float) return Long_Float is
     ((Value - 32.0) * 5.0 / 9.0);

   function Miles_Per_Gallon_From_L_100_Km
     (Liters_Per_100_Km : Long_Float)
      return Long_Float
   is
   begin
      if Liters_Per_100_Km = 0.0 then
         return 0.0;
      end if;
      return 235.214583 / Liters_Per_100_Km;
   end Miles_Per_Gallon_From_L_100_Km;

   type Slavic_Form is (One_Form, Few_Form, Many_Form);

   function Slavic_Form_For
     (Lang  : String;
      Count : Natural)
      return Slavic_Form
   is
      Mod_10  : constant Natural := Count mod 10;
      Mod_100 : constant Natural := Count mod 100;
   begin
      if Lang = "pl" then
         if Count = 1 then
            return One_Form;
         elsif Mod_10 in 2 .. 4 and then not (Mod_100 in 12 .. 14) then
            return Few_Form;
         else
            return Many_Form;
         end if;
      elsif Lang = "cs" then
         if Count = 1 then
            return One_Form;
         elsif Count in 2 .. 4 then
            return Few_Form;
         else
            return Many_Form;
         end if;
      else
         if Mod_10 = 1 and then Mod_100 /= 11 then
            return One_Form;
         elsif Mod_10 in 2 .. 4 and then not (Mod_100 in 12 .. 14) then
            return Few_Form;
         else
            return Many_Form;
         end if;
      end if;
   end Slavic_Form_For;

   function Slavic_Unit_Name
     (Lang : String;
      Unit : Unit_Kind;
      Form : Slavic_Form)
      return String
      is separate;

   function Slavic_Unit_Result
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : Unit_Kind)
      return Humanize.Status.Text_Result
   is
      Lang : constant String :=
        Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
   begin
      if Lang = "pl"
        or else Lang = "cs"
        or else Lang = "ru"
        or else Lang = "uk"
        or else Lang = "sk"
      then
         declare
            Name : constant String :=
              Slavic_Unit_Name (Lang, Unit, Slavic_Form_For (Lang, Value));
         begin
            if Name'Length > 0 then
               return Ok_Text (Natural_Text (Value) & " " & Name);
            end if;
         end;
      end if;

      return (Status => Humanize.Status.Runtime_Error, others => <>);
   end Slavic_Unit_Result;

   function Abbreviated_Result
     (Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Text);
   end Abbreviated_Result;

   function Decimal_Text
     (Value   : Long_Float;
      Options : Humanize.Numbers.Number_Options)
      return String
   is
     (Humanize.Decimal_Images.Decimal_Image
        (Value, Options.Maximum_Fraction_Digits,
         Options.Suppress_Trailing_Zero));

   function Compound
     (Value   : Long_Float;
      Unit    : String;
      Options : Humanize.Numbers.Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Abbreviated_Result (Decimal_Text (Value, Options) & " " & Unit);
   end Compound;

   function Format
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : Unit_Kind;
      Style   : Unit_Style := Long)
      return Humanize.Status.Text_Result
   is
   begin
      if Style = Abbreviated then
         return Abbreviated_Result
           (Natural_Text (Value) & " " & Abbreviation (Unit));
      end if;
      declare
         Slavic : constant Humanize.Status.Text_Result :=
           Slavic_Unit_Result (Context, Value, Unit);
      begin
         if Slavic.Status = Humanize.Status.Ok then
            return Slavic;
         end if;
      end;
      return Humanize.I18N_Rendering.Render
               (Context, Humanize.Unit_Classification.Classify (Value, Unit));
   end Format;

   function Format_Length
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Value : constant Long_Float := abs Meters;
      System    : constant Measurement_System :=
        Resolved_System (Context, Options);
   begin
      if System = Metric_System or else System = Cooking_US_System then
         return Format_Length (Context, Meters, Options.Number_Style);
      elsif Abs_Value >= 1609.344 then
         return Format (Context, Meters / 1609.344, Mile, Options.Number_Style);
      elsif Abs_Value >= 0.9144 then
         return Format (Context, Meters / 0.9144, Yard, Options.Number_Style);
      elsif Abs_Value >= 0.3048 then
         return Format (Context, Meters / 0.3048, Foot, Options.Number_Style);
      else
         return Format (Context, Meters / 0.0254, Inch, Options.Number_Style);
      end if;
   end Format_Length;

   function Format_Length
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Value : constant Long_Float := abs Meters;
   begin
      if Abs_Value >= 1000.0 then
         return Format (Context, Meters / 1000.0, Kilometer, Options);
      elsif Abs_Value < 0.01 then
         return Format (Context, Meters * 1000.0, Millimeter, Options);
      elsif Abs_Value < 1.0 then
         return Format (Context, Meters * 100.0, Centimeter, Options);
      else
         return Format (Context, Meters, Meter, Options);
      end if;
   end Format_Length;

   function Format_Mass
     (Context : Humanize.Contexts.Context;
      Grams   : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Value : constant Long_Float := abs Grams;
   begin
      if Abs_Value >= 1000.0 then
         return Format (Context, Grams / 1000.0, Kilogram, Options);
      elsif Abs_Value < 1.0 then
         return Format (Context, Grams * 1000.0, Milligram, Options);
      else
         return Format (Context, Grams, Gram, Options);
      end if;
   end Format_Mass;

   function Format_Mass
     (Context : Humanize.Contexts.Context;
      Grams   : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Value : constant Long_Float := abs Grams;
      System    : constant Measurement_System :=
        Resolved_System (Context, Options);
   begin
      if System = Metric_System then
         return Format_Mass (Context, Grams, Options.Number_Style);
      elsif Abs_Value >= 907_184.74 then
         return Format (Context, Grams / 907_184.74, Ton, Options.Number_Style);
      elsif Abs_Value >= 453.59237 then
         return Format (Context, Grams / 453.59237, Pound, Options.Number_Style);
      else
         return Format (Context, Grams / 28.349523125, Ounce, Options.Number_Style);
      end if;
   end Format_Mass;

   function Format_Volume
     (Context : Humanize.Contexts.Context;
      Liters  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if abs Liters < 1.0 then
         return Format (Context, Liters * 1000.0, Milliliter, Options);
      else
         return Format (Context, Liters, Liter, Options);
      end if;
   end Format_Volume;

   function Format_Volume
     (Context : Humanize.Contexts.Context;
      Liters  : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Value : constant Long_Float := abs Liters;
      System    : constant Measurement_System :=
        Resolved_System (Context, Options);
   begin
      if System = Metric_System then
         return Format_Volume (Context, Liters, Options.Number_Style);
      elsif System = Cooking_US_System then
         if Abs_Value >= 3.785411784 then
            return Format (Context, Liters / 3.785411784, Gallon, Options.Number_Style);
         elsif Abs_Value >= 0.2365882365 then
            return Format (Context, Liters / 0.2365882365, Cup, Options.Number_Style);
         elsif Abs_Value >= 0.01478676478 then
            return Format (Context, Liters / 0.01478676478, Tablespoon, Options.Number_Style);
         else
            return Format (Context, Liters / 0.00492892159, Teaspoon, Options.Number_Style);
         end if;
      elsif Abs_Value >= 3.785411784 then
         return Format (Context, Liters / 3.785411784, Gallon, Options.Number_Style);
      else
         return Format (Context, Liters / 0.0338140227, Ounce, Options.Number_Style);
      end if;
   end Format_Volume;

   function Format
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : Unit_Kind;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options;
      Style   : Unit_Style := Long)
      return Humanize.Status.Text_Result
   is
   begin
      if Style = Abbreviated then
         return Abbreviated_Result
           (Humanize.Bounded_Text.Float_Image
              (Long_Float'Rounding
                 (Value * 10.0 ** Options.Maximum_Fraction_Digits)
               / 10.0 ** Options.Maximum_Fraction_Digits)
            & " " & Abbreviation (Unit));
      end if;
      return Humanize.I18N_Rendering.Render
               (Context,
                Humanize.Unit_Classification.Classify_Decimal
                  (Value, Unit, Options.Maximum_Fraction_Digits,
                   Options.Suppress_Trailing_Zero));
   end Format;

   function Format_Speed
     (Context           : Humanize.Contexts.Context;
      Meters_Per_Second : Long_Float;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      Km_H : constant Long_Float := Meters_Per_Second * 3.6;
   begin
      if abs Km_H >= 1.0 then
         return Format (Context, Km_H, Kilometer_Per_Hour, Options);
      else
         return Format (Context, Meters_Per_Second, Meter_Per_Second, Options);
      end if;
   end Format_Speed;

   function Format_Speed
     (Context           : Humanize.Contexts.Context;
      Meters_Per_Second : Long_Float;
      Options           : Measurement_Options)
      return Humanize.Status.Text_Result
   is
      System : constant Measurement_System := Resolved_System (Context, Options);
   begin
      if System = Metric_System or else System = Cooking_US_System then
         return Format_Speed (Context, Meters_Per_Second, Options.Number_Style);
      else
         return Compound (Meters_Per_Second * 2.2369362920544, "mph",
                          Options.Number_Style);
      end if;
   end Format_Speed;

   function Format_Area
     (Context       : Humanize.Contexts.Context;
      Square_Meters : Long_Float;
      Options       : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Value : constant Long_Float := abs Square_Meters;
   begin
      if Abs_Value >= 1_000_000.0 then
         return Format
           (Context, Square_Meters / 1_000_000.0, Square_Kilometer, Options);
      elsif Abs_Value >= 10_000.0 then
         return Format (Context, Square_Meters / 10_000.0, Hectare, Options);
      else
         return Format (Context, Square_Meters, Square_Meter, Options);
      end if;
   end Format_Area;

   function Format_Pressure
     (Context : Humanize.Contexts.Context;
      Pascals : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if abs Pascals >= 1000.0 then
         return Format (Context, Pascals / 1000.0, Kilopascal, Options);
      else
         return Format (Context, Pascals, Pascal, Options);
      end if;
   end Format_Pressure;

   function Format_Energy
     (Context : Humanize.Contexts.Context;
      Joules  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if abs Joules >= 1000.0 then
         return Format (Context, Joules / 1000.0, Kilojoule, Options);
      else
         return Format (Context, Joules, Joule, Options);
      end if;
   end Format_Energy;

   function Format_Power
     (Context : Humanize.Contexts.Context;
      Watts   : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if abs Watts >= 1000.0 then
         return Format (Context, Watts / 1000.0, Kilowatt, Options);
      else
         return Format (Context, Watts, Watt, Options);
      end if;
   end Format_Power;

   function Format_Temperature
     (Context : Humanize.Contexts.Context;
      Celsius_Value : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Format (Context, Celsius_Value, Celsius, Options);
   end Format_Temperature;

   function Format_Temperature
     (Context : Humanize.Contexts.Context;
      Celsius_Value : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result
   is
      System : constant Measurement_System := Resolved_System (Context, Options);
   begin
      if System = US_Customary_System
        or else System = UK_Mixed_System
        or else System = Cooking_US_System
      then
         return Format
           (Context, Fahrenheit_From_Celsius (Celsius_Value), Fahrenheit,
            Options.Number_Style);
      else
         return Format_Temperature (Context, Celsius_Value, Options.Number_Style);
      end if;
   end Format_Temperature;

   function Format_Frequency
     (Context : Humanize.Contexts.Context;
      Hertz_Value : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if abs Hertz_Value >= 1000.0 then
         return Format (Context, Hertz_Value / 1000.0, Kilohertz, Options);
      else
         return Format (Context, Hertz_Value, Hertz, Options);
      end if;
   end Format_Frequency;

   function Format_Angle
     (Context : Humanize.Contexts.Context;
      Degrees : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Format (Context, Degrees, Degree, Options);
   end Format_Angle;

   function Format_Data_Rate
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Abs_Value : constant Long_Float := abs Bytes_Per_Second;
   begin
      if Abs_Value >= 1_000_000.0 then
         return Compound (Bytes_Per_Second / 1_000_000.0, "MB/s", Options);
      elsif Abs_Value >= 1_000.0 then
         return Compound (Bytes_Per_Second / 1_000.0, "kB/s", Options);
      else
         return Compound (Bytes_Per_Second, "B/s", Options);
      end if;
   end Format_Data_Rate;

   function Format_Bits
     (Context : Humanize.Contexts.Context;
      Bits    : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Abs_Value : constant Long_Float := abs Bits;
   begin
      if Abs_Value >= 1_000_000_000.0 then
         return Compound (Bits / 1_000_000_000.0, "Gbit", Options);
      elsif Abs_Value >= 1_000_000.0 then
         return Compound (Bits / 1_000_000.0, "Mbit", Options);
      elsif Abs_Value >= 1_000.0 then
         return Compound (Bits / 1_000.0, "kbit", Options);
      else
         return Compound (Bits, "bit", Options);
      end if;
   end Format_Bits;

   function Format_Bit_Rate
     (Context         : Humanize.Contexts.Context;
      Bits_Per_Second : Long_Float;
      Options         : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Abs_Value : constant Long_Float := abs Bits_Per_Second;
   begin
      if Abs_Value >= 1_000_000_000.0 then
         return Compound (Bits_Per_Second / 1_000_000_000.0, "Gbit/s", Options);
      elsif Abs_Value >= 1_000_000.0 then
         return Compound (Bits_Per_Second / 1_000_000.0, "Mbit/s", Options);
      elsif Abs_Value >= 1_000.0 then
         return Compound (Bits_Per_Second / 1_000.0, "kbit/s", Options);
      else
         return Compound (Bits_Per_Second, "bit/s", Options);
      end if;
   end Format_Bit_Rate;

   function Format_Binary_Data_Rate
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Abs_Value : constant Long_Float := abs Bytes_Per_Second;
   begin
      if Abs_Value >= 1_073_741_824.0 then
         return Compound (Bytes_Per_Second / 1_073_741_824.0, "GiB/s", Options);
      elsif Abs_Value >= 1_048_576.0 then
         return Compound (Bytes_Per_Second / 1_048_576.0, "MiB/s", Options);
      elsif Abs_Value >= 1_024.0 then
         return Compound (Bytes_Per_Second / 1_024.0, "KiB/s", Options);
      else
         return Compound (Bytes_Per_Second, "B/s", Options);
      end if;
   end Format_Binary_Data_Rate;

   function Format_Density
     (Context                  : Humanize.Contexts.Context;
      Kilograms_Per_Cubic_Meter : Long_Float;
      Options                  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Kilograms_Per_Cubic_Meter, "kg/m3", Options);
   end Format_Density;

   function Format_Acceleration
     (Context                  : Humanize.Contexts.Context;
      Meters_Per_Second_Squared : Long_Float;
      Options                  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Meters_Per_Second_Squared, "m/s2", Options);
   end Format_Acceleration;

   function Format_Torque
     (Context       : Humanize.Contexts.Context;
      Newton_Meters : Long_Float;
      Options       : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Newton_Meters, "N m", Options);
   end Format_Torque;

   function Format_Fuel_Economy
     (Context            : Humanize.Contexts.Context;
      Liters_Per_100_Km  : Long_Float;
      Options            : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Liters_Per_100_Km, "L/100 km", Options);
   end Format_Fuel_Economy;

   function Format_Fuel_Economy
     (Context            : Humanize.Contexts.Context;
      Liters_Per_100_Km  : Long_Float;
      Options            : Measurement_Options)
      return Humanize.Status.Text_Result
   is
      System : constant Measurement_System := Resolved_System (Context, Options);
   begin
      if System = Metric_System or else System = Cooking_US_System then
         return Format_Fuel_Economy
           (Context, Liters_Per_100_Km, Options.Number_Style);
      else
         return Format_Fuel_Efficiency_MPG
           (Context, Miles_Per_Gallon_From_L_100_Km (Liters_Per_100_Km),
            Options.Number_Style);
      end if;
   end Format_Fuel_Economy;

   function Format_Flow_Rate
     (Context           : Humanize.Contexts.Context;
      Liters_Per_Second : Long_Float;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if abs Liters_Per_Second < 1.0 then
         return Compound (Liters_Per_Second * 1000.0, "mL/s", Options);
      else
         return Compound (Liters_Per_Second, "L/s", Options);
      end if;
   end Format_Flow_Rate;

   function Format_Electric_Current
     (Context : Humanize.Contexts.Context;
      Amperes : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if abs Amperes < 1.0 then
         return Compound (Amperes * 1000.0, "mA", Options);
      else
         return Compound (Amperes, "A", Options);
      end if;
   end Format_Electric_Current;

   function Format_Voltage
     (Context : Humanize.Contexts.Context;
      Volts   : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if abs Volts >= 1000.0 then
         return Compound (Volts / 1000.0, "kV", Options);
      else
         return Compound (Volts, "V", Options);
      end if;
   end Format_Voltage;

   function Format_Resolution
     (Context : Humanize.Contexts.Context;
      Width   : Natural;
      Height  : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Abbreviated_Result
        (Natural_Text (Width) & " x " & Natural_Text (Height) & " px");
   end Format_Resolution;

   function Format_Pixel_Density
     (Context : Humanize.Contexts.Context;
      Pixels_Per_Inch : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Pixels_Per_Inch, "ppi", Options);
   end Format_Pixel_Density;

   function Format_CSS_Length
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Unit'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      return Compound (Value, Unit, Options);
   end Format_CSS_Length;

   function Format_Electric_Resistance
     (Context : Humanize.Contexts.Context;
      Ohms    : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if abs Ohms >= 1_000_000.0 then
         return Compound (Ohms / 1_000_000.0, "Mohm", Options);
      elsif abs Ohms >= 1_000.0 then
         return Compound (Ohms / 1_000.0, "kohm", Options);
      else
         return Compound (Ohms, "ohm", Options);
      end if;
   end Format_Electric_Resistance;

   function GCD (Left, Right : Natural) return Natural is
      A : Natural := Left;
      B : Natural := Right;
   begin
      while B /= 0 loop
         declare
            T : constant Natural := A mod B;
         begin
            A := B;
            B := T;
         end;
      end loop;
      return A;
   end GCD;

   function Format_Aspect_Ratio
     (Context : Humanize.Contexts.Context;
      Width   : Natural;
      Height  : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Divisor : constant Natural :=
        (if Width = 0 or else Height = 0 then 1 else GCD (Width, Height));
   begin
      if Width = 0 or else Height = 0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;
      return Abbreviated_Result
        (Natural_Text (Width / Divisor) & ":"
         & Natural_Text (Height / Divisor));
   end Format_Aspect_Ratio;

   function Format_Electric_Capacitance
     (Context : Humanize.Contexts.Context;
      Farads  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if abs Farads < 0.000_001 then
         return Compound (Farads * 1_000_000_000.0, "nF", Options);
      elsif abs Farads < 1.0 then
         return Compound (Farads * 1_000_000.0, "uF", Options);
      else
         return Compound (Farads, "F", Options);
      end if;
   end Format_Electric_Capacitance;

   function Format_Electric_Inductance
     (Context : Humanize.Contexts.Context;
      Henries : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if abs Henries < 1.0 then
         return Compound (Henries * 1_000.0, "mH", Options);
      else
         return Compound (Henries, "H", Options);
      end if;
   end Format_Electric_Inductance;

   function Format_Concentration
     (Context : Humanize.Contexts.Context;
      Moles_Per_Liter : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Moles_Per_Liter, "mol/L", Options);
   end Format_Concentration;

   function Format_Fuel_Efficiency_MPG
     (Context : Humanize.Contexts.Context;
      Miles_Per_Gallon : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Miles_Per_Gallon, "mpg", Options);
   end Format_Fuel_Efficiency_MPG;

   function Format_Cooking_Temperature
     (Context : Humanize.Contexts.Context;
      Fahrenheit_Value : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Format (Context, Fahrenheit_Value, Fahrenheit, Options);
   end Format_Cooking_Temperature;

   function Format_Cooking_Temperature
     (Context : Humanize.Contexts.Context;
      Fahrenheit_Value : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result
   is
      System : constant Measurement_System := Resolved_System (Context, Options);
   begin
      if System = Metric_System then
         return Format
           (Context, Celsius_From_Fahrenheit (Fahrenheit_Value), Celsius,
            Options.Number_Style);
      else
         return Format_Cooking_Temperature
           (Context, Fahrenheit_Value, Options.Number_Style);
      end if;
   end Format_Cooking_Temperature;

   function Format_Memory_Bandwidth
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if abs Bytes_Per_Second >= 1_000_000_000.0 then
         return Compound (Bytes_Per_Second / 1_000_000_000.0, "GB/s", Options);
      elsif abs Bytes_Per_Second >= 1_000_000.0 then
         return Compound (Bytes_Per_Second / 1_000_000.0, "MB/s", Options);
      elsif abs Bytes_Per_Second >= 1_000.0 then
         return Compound (Bytes_Per_Second / 1_000.0, "kB/s", Options);
      else
         return Compound (Bytes_Per_Second, "B/s", Options);
      end if;
   end Format_Memory_Bandwidth;

   function Format_Latency
     (Context      : Humanize.Contexts.Context;
      Microseconds : Long_Float;
      Options      : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if abs Microseconds >= 1_000_000.0 then
         return Compound (Microseconds / 1_000_000.0, "s", Options);
      elsif abs Microseconds >= 1_000.0 then
         return Compound (Microseconds / 1_000.0, "ms", Options);
      else
         return Compound (Microseconds, "us", Options);
      end if;
   end Format_Latency;

   function Format_Database_Throughput
     (Context               : Humanize.Contexts.Context;
      Operations_Per_Second : Long_Float;
      Options               : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if abs Operations_Per_Second >= 1_000_000.0 then
         return Compound
           (Operations_Per_Second / 1_000_000.0, "M ops/s", Options);
      elsif abs Operations_Per_Second >= 1_000.0 then
         return Compound
           (Operations_Per_Second / 1_000.0, "k ops/s", Options);
      else
         return Compound (Operations_Per_Second, "ops/s", Options);
      end if;
   end Format_Database_Throughput;

   function Format_CPU_Load
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Percent, "% CPU", Options);
   end Format_CPU_Load;

   function Format_Battery
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Percent, "% battery", Options);
   end Format_Battery;

   function Format_Screen_Size
     (Context : Humanize.Contexts.Context;
      Inches  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Inches, "in screen", Options);
   end Format_Screen_Size;

   function Format_Typography_Size
     (Context : Humanize.Contexts.Context;
      Points  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Points, "pt", Options);
   end Format_Typography_Size;

   function Format_IOPS
     (Context : Humanize.Contexts.Context;
      IOPS    : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if abs IOPS >= 1_000_000.0 then
         return Compound (IOPS / 1_000_000.0, "M IOPS", Options);
      elsif abs IOPS >= 1_000.0 then
         return Compound (IOPS / 1_000.0, "k IOPS", Options);
      else
         return Compound (IOPS, "IOPS", Options);
      end if;
   end Format_IOPS;

   function Format_Audio_Level
     (Context  : Humanize.Contexts.Context;
      Decibels : Long_Float;
      Options  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Decibels, "dB", Options);
   end Format_Audio_Level;

   function Format_Signal_Strength
     (Context : Humanize.Contexts.Context;
      DBm     : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (DBm, "dBm", Options);
   end Format_Signal_Strength;

   function Format_Storage_Endurance
     (Context   : Humanize.Contexts.Context;
      Terabytes : Long_Float;
      Options   : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Terabytes, "TBW", Options);
   end Format_Storage_Endurance;

   function Format_Refresh_Rate
     (Context : Humanize.Contexts.Context;
      Hertz   : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Hertz, "Hz refresh", Options);
   end Format_Refresh_Rate;

   function Format_Luminance
     (Context : Humanize.Contexts.Context;
      Nits    : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (Nits, "nits", Options);
   end Format_Luminance;

   function Format_Print_Resolution
     (Context : Humanize.Contexts.Context;
      DPI     : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Compound (DPI, "dpi", Options);
   end Format_Print_Resolution;

   function Format_Geographic_Distance
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if abs Meters >= 1_000.0 then
         return Format (Context, Meters / 1_000.0, Kilometer, Options);
      else
         return Format (Context, Meters, Meter, Options);
      end if;
   end Format_Geographic_Distance;

   function Format_Geographic_Distance
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result
   is
      System : constant Measurement_System := Resolved_System (Context, Options);
   begin
      if System = Metric_System or else System = Cooking_US_System then
         return Format_Geographic_Distance (Context, Meters, Options.Number_Style);
      else
         return Format_Length (Context, Meters, Options);
      end if;
   end Format_Geographic_Distance;

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : Unit_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Style   : Unit_Style := Long)
   is
   begin
      if Style = Abbreviated then
         Copy_Result_Into
           (Format (Context, Value, Unit, Style), Target, Written, Status);
         return;
      end if;
      Humanize.I18N_Rendering.Render_Into
        (Context, Humanize.Unit_Classification.Classify (Value, Unit),
         Target, Written, Status);
   end Format_Into;

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : Unit_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options;
      Style   : Unit_Style := Long)
   is
   begin
      if Style = Abbreviated then
         Copy_Result_Into
           (Format (Context, Value, Unit, Options, Style),
            Target, Written, Status);
         return;
      end if;
      Humanize.I18N_Rendering.Render_Into
        (Context,
         Humanize.Unit_Classification.Classify_Decimal
           (Value, Unit, Options.Maximum_Fraction_Digits,
            Options.Suppress_Trailing_Zero),
         Target, Written, Status);
   end Format_Into;

   procedure Format_Length_Into
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Length (Context, Meters, Options), Target, Written, Status);
   end Format_Length_Into;

   procedure Format_Length_Into
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options)
   is
   begin
      Copy_Result_Into
        (Format_Length (Context, Meters, Options), Target, Written, Status);
   end Format_Length_Into;

   procedure Format_Mass_Into
     (Context : Humanize.Contexts.Context;
      Grams   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Mass (Context, Grams, Options), Target, Written, Status);
   end Format_Mass_Into;

   procedure Format_Mass_Into
     (Context : Humanize.Contexts.Context;
      Grams   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options)
   is
   begin
      Copy_Result_Into
        (Format_Mass (Context, Grams, Options), Target, Written, Status);
   end Format_Mass_Into;

   procedure Format_Volume_Into
     (Context : Humanize.Contexts.Context;
      Liters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Volume (Context, Liters, Options), Target, Written, Status);
   end Format_Volume_Into;

   procedure Format_Volume_Into
     (Context : Humanize.Contexts.Context;
      Liters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options)
   is
   begin
      Copy_Result_Into
        (Format_Volume (Context, Liters, Options), Target, Written, Status);
   end Format_Volume_Into;

   procedure Format_Speed_Into
     (Context           : Humanize.Contexts.Context;
      Meters_Per_Second : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Speed (Context, Meters_Per_Second, Options),
         Target, Written, Status);
   end Format_Speed_Into;

   procedure Format_Speed_Into
     (Context           : Humanize.Contexts.Context;
      Meters_Per_Second : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Measurement_Options)
   is
   begin
      Copy_Result_Into
        (Format_Speed (Context, Meters_Per_Second, Options),
         Target, Written, Status);
   end Format_Speed_Into;

   procedure Format_Area_Into
     (Context       : Humanize.Contexts.Context;
      Square_Meters : Long_Float;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Options       : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Area (Context, Square_Meters, Options),
         Target, Written, Status);
   end Format_Area_Into;

   procedure Format_Pressure_Into
     (Context : Humanize.Contexts.Context;
      Pascals : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Pressure (Context, Pascals, Options),
         Target, Written, Status);
   end Format_Pressure_Into;

   procedure Format_Energy_Into
     (Context : Humanize.Contexts.Context;
      Joules  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Energy (Context, Joules, Options),
         Target, Written, Status);
   end Format_Energy_Into;

   procedure Format_Power_Into
     (Context : Humanize.Contexts.Context;
      Watts   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Power (Context, Watts, Options), Target, Written, Status);
   end Format_Power_Into;

   procedure Format_Temperature_Into
     (Context : Humanize.Contexts.Context;
      Celsius_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Temperature (Context, Celsius_Value, Options),
         Target, Written, Status);
   end Format_Temperature_Into;

   procedure Format_Temperature_Into
     (Context : Humanize.Contexts.Context;
      Celsius_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options)
   is
   begin
      Copy_Result_Into
        (Format_Temperature (Context, Celsius_Value, Options),
         Target, Written, Status);
   end Format_Temperature_Into;

   procedure Format_Frequency_Into
     (Context : Humanize.Contexts.Context;
      Hertz_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Frequency (Context, Hertz_Value, Options),
         Target, Written, Status);
   end Format_Frequency_Into;

   procedure Format_Angle_Into
     (Context : Humanize.Contexts.Context;
      Degrees : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Angle (Context, Degrees, Options), Target, Written, Status);
   end Format_Angle_Into;

   procedure Format_Data_Rate_Into
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Data_Rate (Context, Bytes_Per_Second, Options),
         Target, Written, Status);
   end Format_Data_Rate_Into;

   procedure Format_Bits_Into
     (Context : Humanize.Contexts.Context;
      Bits    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Bits (Context, Bits, Options), Target, Written, Status);
   end Format_Bits_Into;

   procedure Format_Bit_Rate_Into
     (Context         : Humanize.Contexts.Context;
      Bits_Per_Second : Long_Float;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Options         : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Bit_Rate (Context, Bits_Per_Second, Options),
         Target, Written, Status);
   end Format_Bit_Rate_Into;

   procedure Format_Binary_Data_Rate_Into
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Binary_Data_Rate (Context, Bytes_Per_Second, Options),
         Target, Written, Status);
   end Format_Binary_Data_Rate_Into;

   procedure Format_Density_Into
     (Context                  : Humanize.Contexts.Context;
      Kilograms_Per_Cubic_Meter : Long_Float;
      Target                   : in out String;
      Written                  : out Natural;
      Status                   : out Humanize.Status.Status_Code;
      Options                  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Density (Context, Kilograms_Per_Cubic_Meter, Options),
         Target, Written, Status);
   end Format_Density_Into;

   procedure Format_Acceleration_Into
     (Context                  : Humanize.Contexts.Context;
      Meters_Per_Second_Squared : Long_Float;
      Target                   : in out String;
      Written                  : out Natural;
      Status                   : out Humanize.Status.Status_Code;
      Options                  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Acceleration
           (Context, Meters_Per_Second_Squared, Options),
         Target, Written, Status);
   end Format_Acceleration_Into;

   procedure Format_Torque_Into
     (Context       : Humanize.Contexts.Context;
      Newton_Meters : Long_Float;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Options       : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Torque (Context, Newton_Meters, Options),
         Target, Written, Status);
   end Format_Torque_Into;

   procedure Format_Fuel_Economy_Into
     (Context           : Humanize.Contexts.Context;
      Liters_Per_100_Km : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Fuel_Economy (Context, Liters_Per_100_Km, Options),
         Target, Written, Status);
   end Format_Fuel_Economy_Into;

   procedure Format_Fuel_Economy_Into
     (Context           : Humanize.Contexts.Context;
      Liters_Per_100_Km : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Measurement_Options)
   is
   begin
      Copy_Result_Into
        (Format_Fuel_Economy (Context, Liters_Per_100_Km, Options),
         Target, Written, Status);
   end Format_Fuel_Economy_Into;

   procedure Format_Flow_Rate_Into
     (Context           : Humanize.Contexts.Context;
      Liters_Per_Second : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Flow_Rate (Context, Liters_Per_Second, Options),
         Target, Written, Status);
   end Format_Flow_Rate_Into;

   procedure Format_Electric_Current_Into
     (Context : Humanize.Contexts.Context;
      Amperes : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Electric_Current (Context, Amperes, Options),
         Target, Written, Status);
   end Format_Electric_Current_Into;

   procedure Format_Voltage_Into
     (Context : Humanize.Contexts.Context;
      Volts   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Voltage (Context, Volts, Options), Target, Written, Status);
   end Format_Voltage_Into;

   procedure Format_Resolution_Into
     (Context : Humanize.Contexts.Context;
      Width   : Natural;
      Height  : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result_Into
        (Format_Resolution (Context, Width, Height), Target, Written, Status);
   end Format_Resolution_Into;

   procedure Format_Pixel_Density_Into
     (Context : Humanize.Contexts.Context;
      Pixels_Per_Inch : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Pixel_Density (Context, Pixels_Per_Inch, Options),
         Target, Written, Status);
   end Format_Pixel_Density_Into;

   procedure Format_CSS_Length_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_CSS_Length (Context, Value, Unit, Options),
         Target, Written, Status);
   end Format_CSS_Length_Into;

   procedure Format_Electric_Resistance_Into
     (Context : Humanize.Contexts.Context;
      Ohms    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Electric_Resistance (Context, Ohms, Options),
         Target, Written, Status);
   end Format_Electric_Resistance_Into;

   procedure Format_Aspect_Ratio_Into
     (Context : Humanize.Contexts.Context;
      Width   : Natural;
      Height  : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result_Into
        (Format_Aspect_Ratio (Context, Width, Height),
         Target, Written, Status);
   end Format_Aspect_Ratio_Into;

   procedure Format_Electric_Capacitance_Into
     (Context : Humanize.Contexts.Context;
      Farads  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Electric_Capacitance (Context, Farads, Options),
         Target, Written, Status);
   end Format_Electric_Capacitance_Into;

   procedure Format_Electric_Inductance_Into
     (Context : Humanize.Contexts.Context;
      Henries : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Electric_Inductance (Context, Henries, Options),
         Target, Written, Status);
   end Format_Electric_Inductance_Into;

   procedure Format_Concentration_Into
     (Context : Humanize.Contexts.Context;
      Moles_Per_Liter : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Concentration (Context, Moles_Per_Liter, Options),
         Target, Written, Status);
   end Format_Concentration_Into;

   procedure Format_Fuel_Efficiency_MPG_Into
     (Context : Humanize.Contexts.Context;
      Miles_Per_Gallon : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Fuel_Efficiency_MPG (Context, Miles_Per_Gallon, Options),
         Target, Written, Status);
   end Format_Fuel_Efficiency_MPG_Into;

   procedure Format_Cooking_Temperature_Into
     (Context : Humanize.Contexts.Context;
      Fahrenheit_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Cooking_Temperature (Context, Fahrenheit_Value, Options),
         Target, Written, Status);
   end Format_Cooking_Temperature_Into;

   procedure Format_Cooking_Temperature_Into
     (Context : Humanize.Contexts.Context;
      Fahrenheit_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options)
   is
   begin
      Copy_Result_Into
        (Format_Cooking_Temperature (Context, Fahrenheit_Value, Options),
         Target, Written, Status);
   end Format_Cooking_Temperature_Into;

   procedure Format_Memory_Bandwidth_Into
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Memory_Bandwidth (Context, Bytes_Per_Second, Options),
         Target, Written, Status);
   end Format_Memory_Bandwidth_Into;

   procedure Format_Latency_Into
     (Context      : Humanize.Contexts.Context;
      Microseconds : Long_Float;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Options      : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Latency (Context, Microseconds, Options),
         Target, Written, Status);
   end Format_Latency_Into;

   procedure Format_Database_Throughput_Into
     (Context               : Humanize.Contexts.Context;
      Operations_Per_Second : Long_Float;
      Target                : in out String;
      Written               : out Natural;
      Status                : out Humanize.Status.Status_Code;
      Options               : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Database_Throughput
           (Context, Operations_Per_Second, Options),
         Target, Written, Status);
   end Format_Database_Throughput_Into;

   procedure Format_CPU_Load_Into
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_CPU_Load (Context, Percent, Options),
         Target, Written, Status);
   end Format_CPU_Load_Into;

   procedure Format_Battery_Into
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Battery (Context, Percent, Options),
         Target, Written, Status);
   end Format_Battery_Into;

   procedure Format_Screen_Size_Into
     (Context : Humanize.Contexts.Context;
      Inches  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Screen_Size (Context, Inches, Options),
         Target, Written, Status);
   end Format_Screen_Size_Into;

   procedure Format_Typography_Size_Into
     (Context : Humanize.Contexts.Context;
      Points  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Typography_Size (Context, Points, Options),
         Target, Written, Status);
   end Format_Typography_Size_Into;

   procedure Format_IOPS_Into
     (Context : Humanize.Contexts.Context;
      IOPS    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_IOPS (Context, IOPS, Options),
         Target, Written, Status);
   end Format_IOPS_Into;

   procedure Format_Audio_Level_Into
     (Context  : Humanize.Contexts.Context;
      Decibels : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Audio_Level (Context, Decibels, Options),
         Target, Written, Status);
   end Format_Audio_Level_Into;

   procedure Format_Signal_Strength_Into
     (Context : Humanize.Contexts.Context;
      DBm     : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Signal_Strength (Context, DBm, Options),
         Target, Written, Status);
   end Format_Signal_Strength_Into;

   procedure Format_Storage_Endurance_Into
     (Context   : Humanize.Contexts.Context;
      Terabytes : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Storage_Endurance (Context, Terabytes, Options),
         Target, Written, Status);
   end Format_Storage_Endurance_Into;

   procedure Format_Refresh_Rate_Into
     (Context : Humanize.Contexts.Context;
      Hertz   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Refresh_Rate (Context, Hertz, Options),
         Target, Written, Status);
   end Format_Refresh_Rate_Into;

   procedure Format_Luminance_Into
     (Context : Humanize.Contexts.Context;
      Nits    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Luminance (Context, Nits, Options),
         Target, Written, Status);
   end Format_Luminance_Into;

   procedure Format_Print_Resolution_Into
     (Context : Humanize.Contexts.Context;
      DPI     : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Print_Resolution (Context, DPI, Options),
         Target, Written, Status);
   end Format_Print_Resolution_Into;

   procedure Format_Geographic_Distance_Into
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result_Into
        (Format_Geographic_Distance (Context, Meters, Options),
         Target, Written, Status);
   end Format_Geographic_Distance_Into;

   procedure Format_Geographic_Distance_Into
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options)
   is
   begin
      Copy_Result_Into
        (Format_Geographic_Distance (Context, Meters, Options),
         Target, Written, Status);
   end Format_Geographic_Distance_Into;

end Humanize.Units.Support;
