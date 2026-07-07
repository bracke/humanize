with AUnit.Assertions;

with Humanize.Contexts;
with Humanize.Numbers;
with Humanize.Status;
with Humanize.Units;
with Humanize.Tests.Support;

package body Humanize.Tests.Units is

   use Humanize.Status;
   use Humanize.Units;

   --  UTF-8 'e' grave (fr) and 'o' acute (es) for expectations.
   EG : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A8#);
   OA : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B3#);

   procedure Check
     (Context  : Humanize.Contexts.Context;
      Value    : Natural;
      Unit     : Unit_Kind;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Format (Context, Value, Unit);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_English (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Support.En, 1, Meter, "1 meter", "one meter");
      Check (Support.En, 5, Meter, "5 meters", "five meters");
      Check (Support.En, 3, Kilogram, "3 kilograms", "kilograms");
      Check (Support.En, 1, Liter, "1 liter", "one liter");
      Check (Support.En, 1234, Meter, "1,234 meters", "grouped meters");
   end Test_English;

   procedure Test_Locales (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      --  German/Danish unit words are plural-invariant.
      Check (Support.De, 5, Meter, "5 Meter", "German invariant meter");
      Check (Support.Da, 5, Meter, "5 meter", "Danish invariant meter");
      Check (Support.De, 2, Kilogram, "2 Kilogramm", "German kilogram");
      --  French pluralizes and uses an accented word.
      Check (Support.Fr, 1, Meter, "1 m" & EG & "tre", "French one metre");
      Check (Support.Fr, 5, Meter, "5 m" & EG & "tres", "French metres");
      Check (Support.Fr, 3, Kilometer, "3 kilom" & EG & "tres",
             "French kilometres");
      Check (Support.Fr, 2, Gram, "2 grammes", "French grams");
      --  Additional metric units.
      Check (Support.En, 5, Centimeter, "5 centimeters", "English centimeters");
      Check (Support.En, 250, Milliliter, "250 milliliters", "English millilitres");
      Check (Support.En, 21, Celsius, "21 degrees Celsius", "English Celsius");
      Check (Support.En, 55, Kilometer_Per_Hour, "55 kilometers per hour",
             "English speed");
      Check (Support.En, 2, Square_Meter, "2 square meters", "English area");
      Check (Support.En, 3, Kilowatt, "3 kilowatts", "English power");
      Check (Support.En, 1, Foot, "1 foot", "English irregular foot");
      Check (Support.En, 12, Inch, "12 inches", "English inches");
      Check (Support.Fr, 2, Centimeter, "2 centim" & EG & "tres",
             "French centimetres");
      Check (Support.De, 5, Millimeter, "5 Millimeter", "German millimetres");
   end Test_Locales;

   procedure Check_F
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Float;
      Unit     : Unit_Kind;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Format (Context, Value, Unit);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check_F;

   procedure Test_Fractional (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      --  English: any fraction -> plural ("kilometers").
      Check_F (Support.En, 1.5, Kilometer, "1.5 kilometers", "en 1.5 plural");
      Check_F (Support.En, 2.5, Meter, "2.5 meters", "en 2.5 plural");
      --  French: i in {0,1} -> singular; comma decimal.
      Check_F (Support.Fr, 1.5, Meter, "1,5 m" & EG & "tre", "fr 1.5 singular");
      Check_F (Support.Fr, 2.5, Meter, "2,5 m" & EG & "tres", "fr 2.5 plural");
      --  Spanish: n=1 only -> 1.5 is plural; comma decimal.
      Check_F (Support.Es, 1.5, Kilometer, "1,5 kil" & OA & "metros",
               "es 1.5 plural");
      --  German invariant word, comma decimal.
      Check_F (Support.De, 1.5, Meter, "1,5 Meter", "de 1.5");
   end Test_Fractional;

   procedure Test_Bounded (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 16);
      Written : Natural;
      Code    : Status_Code;
   begin
      Format_Into (Support.En, 5, Kilometer, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "5 kilometers",
         "bounded unit, status " & Status_Image (Code));
   end Test_Bounded;

   procedure Test_Automatic_Selection (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      AUnit.Assertions.Assert
        (Support.Text (Format_Length (Support.En, 1_500.0)) = "1.5 kilometers",
         "automatic length selects kilometers");
      AUnit.Assertions.Assert
        (Support.Text (Format_Length (Support.En, 0.25)) = "25 centimeters",
         "automatic length selects centimeters");
      AUnit.Assertions.Assert
        (Support.Text (Format_Mass (Support.En, 1_500.0)) = "1.5 kilograms",
         "automatic mass selects kilograms");
      AUnit.Assertions.Assert
        (Support.Text (Format_Volume (Support.En, 0.25)) = "250 milliliters",
         "automatic volume selects milliliters");
      AUnit.Assertions.Assert
        (Support.Text (Format_Speed (Support.En, 20.0)) =
           "72 kilometers per hour",
         "automatic speed selects kilometers per hour");
      AUnit.Assertions.Assert
        (Support.Text (Format_Area (Support.En, 2_000_000.0)) =
           "2 square kilometers",
         "automatic area selects square kilometers");
      AUnit.Assertions.Assert
        (Support.Text (Format_Pressure (Support.En, 2_500.0)) =
           "2.5 kilopascals",
         "automatic pressure selects kilopascals");
      AUnit.Assertions.Assert
        (Support.Text (Format_Energy (Support.En, 2_500.0)) = "2.5 kilojoules",
         "automatic energy selects kilojoules");
      AUnit.Assertions.Assert
        (Support.Text (Format_Power (Support.En, 2_500.0)) = "2.5 kilowatts",
         "automatic power selects kilowatts");
      AUnit.Assertions.Assert
        (Support.Text (Format_Temperature (Support.En, 21.0)) =
           "21 degrees Celsius",
         "automatic temperature");
      AUnit.Assertions.Assert
        (Support.Text (Format_Frequency (Support.En, 2_500.0)) =
           "2.5 kilohertz",
         "automatic frequency");
      AUnit.Assertions.Assert
        (Support.Text (Format_Angle (Support.En, 45.0)) = "45 degrees",
         "automatic angle");
      AUnit.Assertions.Assert
        (Support.Text (Format_Data_Rate (Support.En, 1_500.0)) = "1.5 kB/s",
         "data transfer rate selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Bits (Support.En, 1_500_000.0)) = "1.5 Mbit",
         "bit quantity selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Bit_Rate (Support.En, 1_500_000.0))
         = "1.5 Mbit/s",
         "bit transfer rate selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Binary_Data_Rate (Support.En, 1_572_864.0))
         = "1.5 MiB/s",
         "binary data transfer rate selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Density (Support.En, 997.0)) = "997 kg/m3",
         "density selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Acceleration (Support.En, 9.8)) = "9.8 m/s2",
         "acceleration selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Torque (Support.En, 250.0)) = "250 N m",
         "torque selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Fuel_Economy (Support.En, 5.5)) = "5.5 L/100 km",
         "fuel economy selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Flow_Rate (Support.En, 0.25)) = "250 mL/s",
         "flow rate selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Electric_Current (Support.En, 0.5)) = "500 mA",
         "electric current selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Voltage (Support.En, 1_200.0)) = "1.2 kV",
         "voltage selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Resolution (Support.En, 1920, 1080))
         = "1920 x 1080 px",
         "resolution selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Pixel_Density (Support.En, 326.0)) = "326 ppi",
         "pixel density selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_CSS_Length (Support.En, 1.5, "rem")) = "1.5 rem",
         "CSS length selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Electric_Resistance (Support.En, 2_200.0))
         = "2.2 kohm",
         "electric resistance selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Aspect_Ratio (Support.En, 1920, 1080)) = "16:9",
         "aspect ratio selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Electric_Capacitance (Support.En, 0.000_004_7))
         = "4.7 uF",
         "electric capacitance selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Electric_Inductance (Support.En, 0.0022))
         = "2.2 mH",
         "electric inductance selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Concentration (Support.En, 0.5)) = "0.5 mol/L",
         "concentration selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Fuel_Efficiency_MPG (Support.En, 32.5))
         = "32.5 mpg",
         "mpg selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Cooking_Temperature (Support.En, 350.0))
         = "350 degrees Fahrenheit",
         "cooking temperature selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Memory_Bandwidth (Support.En, 1_500_000_000.0))
         = "1.5 GB/s",
         "memory bandwidth selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Latency (Support.En, 2_500.0)) = "2.5 ms",
         "latency selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Database_Throughput (Support.En, 12_500.0))
         = "12.5 k ops/s",
         "database throughput selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_CPU_Load (Support.En, 87.5)) = "87.5 % CPU",
         "CPU load selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Battery (Support.En, 45.0)) = "45 % battery",
         "battery selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Screen_Size (Support.En, 13.3)) = "13.3 in screen",
         "screen size selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Typography_Size (Support.En, 12.0)) = "12 pt",
         "typography selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_IOPS (Support.En, 42_000.0)) = "42 k IOPS",
         "IOPS selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Audio_Level (Support.En, -12.5)) = "-12.5 dB",
         "audio level selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Signal_Strength (Support.En, -67.0)) = "-67 dBm",
         "signal strength selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Storage_Endurance (Support.En, 600.0)) = "600 TBW",
         "storage endurance selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Refresh_Rate (Support.En, 144.0)) = "144 Hz refresh",
         "refresh rate selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Luminance (Support.En, 1_000.0)) = "1000 nits",
         "luminance selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Print_Resolution (Support.En, 300.0)) = "300 dpi",
         "print resolution selector");
      AUnit.Assertions.Assert
        (Support.Text (Format_Geographic_Distance (Support.En, 1_500.0))
         = "1.5 kilometers",
         "geographic distance selector");
      AUnit.Assertions.Assert
        (Support.Text
           (Format_Length
              (Support.En, 1609.344,
               Measurement_Options'
                 (System       => US_Customary_System,
                  Number_Style => Humanize.Numbers.Default_Number_Options)))
         = "1 mile",
         "explicit US customary length selector");
      AUnit.Assertions.Assert
        (Support.Text
           (Format_Mass
              (Support.En, 907.18474,
               Measurement_Options'
                 (System       => US_Customary_System,
                  Number_Style => Humanize.Numbers.Default_Number_Options)))
         = "2 pounds",
         "explicit US customary mass selector");
      AUnit.Assertions.Assert
        (Support.Text
           (Format_Volume
              (Support.En, 0.2365882365,
               Measurement_Options'
                 (System       => Cooking_US_System,
                  Number_Style => Humanize.Numbers.Default_Number_Options)))
         = "1 cup",
         "US cooking volume selector");
      AUnit.Assertions.Assert
        (Support.Text
           (Format_Temperature
              (Support.En, 0.0,
               Measurement_Options'
                 (System       => US_Customary_System,
                  Number_Style => Humanize.Numbers.Default_Number_Options)))
         = "32 degrees Fahrenheit",
         "US customary temperature selector");
      AUnit.Assertions.Assert
        (Support.Text
           (Format_Cooking_Temperature
              (Support.En, 350.0,
               Measurement_Options'
                 (System       => Metric_System,
                  Number_Style => Humanize.Numbers.Default_Number_Options)))
         = "176.7 degrees Celsius",
         "metric cooking temperature selector");
      AUnit.Assertions.Assert
        (Support.Text
           (Format_Geographic_Distance
              (Support.Locale ("en-US"), 1609.344,
               Default_Measurement_Options))
         = "1 mile",
         "en-US locale-default geographic distance selector");
      AUnit.Assertions.Assert
        (Support.Text (Format (Support.Locale ("sk"), 5, Meter)) = "5 metrov",
         "Slovak many-form unit selector");
      AUnit.Assertions.Assert
        (Support.Text (Format (Support.En, 5, Kilometer, Style => Abbreviated))
         = "5 km",
         "abbreviated unit style");
      AUnit.Assertions.Assert
        (Support.Text (Format (Support.En, 1, Nautical_Mile)) =
           "1 nautical mile",
         "expanded unit kind");
      declare
         Buffer : String (1 .. 32);
         Written : Natural;
         Code : Status_Code;
      begin
         Format_Speed_Into (Support.En, 20.0, Buffer, Written, Code);
         AUnit.Assertions.Assert
           (Code = Ok and then Buffer (1 .. Written) = "72 kilometers per hour",
            "bounded speed selector");
         Format_Geographic_Distance_Into
           (Support.Locale ("en-US"), 1609.344, Buffer, Written, Code,
            Default_Measurement_Options);
         AUnit.Assertions.Assert
           (Code = Ok and then Buffer (1 .. Written) = "1 mile",
            "bounded locale-default geographic distance selector");
      end;
   end Test_Automatic_Selection;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize unit tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_English'Access, "English units");
      Register_Routine (T, Test_Locales'Access, "German/Danish/French units");
      Register_Routine (T, Test_Fractional'Access, "fractional units");
      Register_Routine (T, Test_Bounded'Access, "bounded unit API");
      Register_Routine (T, Test_Automatic_Selection'Access,
        "automatic unit selection");
   end Register_Tests;

end Humanize.Tests.Units;
