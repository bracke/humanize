separate (Humanize.Tests.Compatibility)
   procedure Check_Unit_Compound_Roundtrips is
      function Close
        (Left  : Long_Float;
         Right : Long_Float)
         return Boolean
      is
      begin
         return abs (Left - Right) < 0.000_001;
      end Close;

      procedure Check_Compound
        (Result        : Text_Result;
         Expected_Value : Long_Float;
         Expected_Unit  : String;
         Label          : String)
      is
         Text : constant String := Rendered (Result, Label);
         Parsed : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
           Humanize.Parsing.Parse_Compound_Unit (Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Ok
            and then Close (Parsed.Value, Expected_Value)
            and then Parsed.Unit (1 .. Parsed.Unit_Length) = Expected_Unit,
            Label & " compound roundtrip [" & Text & "]");
      end Check_Compound;

      Aspect_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Aspect_Ratio (Support.En, 1_920, 1_080),
           "aspect ratio");
      Aspect : constant Humanize.Parsing.Aspect_Ratio_Parse_Result :=
        Humanize.Parsing.Parse_Aspect_Ratio (Aspect_Text);
      CSS_Text : constant String :=
        Rendered
          (Humanize.Units.Format_CSS_Length (Support.En, 1.5, "rem"),
           "CSS length");
      CSS : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_CSS_Length (CSS_Text);
      Compound_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Latency (Support.En, 2_500.0),
           "compound unit");
      Compound : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Compound_Unit (Compound_Text);
      Length_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Length (Support.En, 1_500.0),
           "auto length");
      Length : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Length_Text);
      Mass_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Mass (Support.En, 1_500.0),
           "auto mass");
      Mass : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Mass_Text);
      Volume_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Volume (Support.En, 0.25),
           "auto volume");
      Volume : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Volume_Text);
      Speed_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Speed (Support.En, 20.0),
           "auto speed");
      Speed : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Speed_Text);
      Area_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Area (Support.En, 2_000_000.0),
           "auto area");
      Area : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Area_Text);
      Pressure_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Pressure (Support.En, 2_500.0),
           "auto pressure");
      Pressure : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Pressure_Text);
      Fahrenheit_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Cooking_Temperature (Support.En, 350.0),
           "cooking temperature");
      Fahrenheit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit (Fahrenheit_Text);
      Data_Rate_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Data_Rate (Support.En, 1_500.0),
           "data rate");
      Data_Rate : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Compound_Unit (Data_Rate_Text);
      Bit_Rate_Text : constant String :=
        Rendered
          (Humanize.Units.Format_Bit_Rate (Support.En, 1_500_000.0),
           "bit rate");
      Bit_Rate : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Compound_Unit (Bit_Rate_Text);
      IOPS_Text : constant String :=
        Rendered
          (Humanize.Units.Format_IOPS (Support.En, 42_000.0),
           "IOPS");
      IOPS : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Compound_Unit (IOPS_Text);
   begin
      AUnit.Assertions.Assert
        (Aspect.Status = Ok
         and then Aspect.Width = 16
         and then Aspect.Height = 9,
         "aspect ratio roundtrip [" & Aspect_Text & "]");
      AUnit.Assertions.Assert
        (CSS.Status = Ok
         and then CSS.Value = 1.5
         and then CSS.Unit (1 .. CSS.Unit_Length) = "rem",
         "CSS length roundtrip [" & CSS_Text & "]");
      AUnit.Assertions.Assert
        (Compound.Status = Ok
         and then Compound.Value = 2.5
         and then Compound.Unit (1 .. Compound.Unit_Length) = "ms",
         "compound unit roundtrip [" & Compound_Text & "]");
      AUnit.Assertions.Assert
        (Length.Status = Ok
         and then Close (Length.Value, 1.5)
         and then Length.Unit = Humanize.Units.Kilometer,
         "auto length unit roundtrip [" & Length_Text & "]");
      AUnit.Assertions.Assert
        (Mass.Status = Ok
         and then Close (Mass.Value, 1.5)
         and then Mass.Unit = Humanize.Units.Kilogram,
         "auto mass unit roundtrip [" & Mass_Text & "]");
      AUnit.Assertions.Assert
        (Volume.Status = Ok
         and then Close (Volume.Value, 250.0)
         and then Volume.Unit = Humanize.Units.Milliliter,
         "auto volume unit roundtrip [" & Volume_Text & "]");
      AUnit.Assertions.Assert
        (Speed.Status = Ok
         and then Close (Speed.Value, 72.0)
         and then Speed.Unit = Humanize.Units.Kilometer_Per_Hour,
         "auto speed unit roundtrip [" & Speed_Text & "]");
      AUnit.Assertions.Assert
        (Area.Status = Ok
         and then Close (Area.Value, 2.0)
         and then Area.Unit = Humanize.Units.Square_Kilometer,
         "auto area unit roundtrip [" & Area_Text & "]");
      AUnit.Assertions.Assert
        (Pressure.Status = Ok
         and then Close (Pressure.Value, 2.5)
         and then Pressure.Unit = Humanize.Units.Kilopascal,
         "auto pressure unit roundtrip [" & Pressure_Text & "]");
      AUnit.Assertions.Assert
        (Fahrenheit.Status = Ok
         and then Close (Fahrenheit.Value, 350.0)
         and then Fahrenheit.Unit = Humanize.Units.Fahrenheit,
         "Fahrenheit unit roundtrip [" & Fahrenheit_Text & "]");
      AUnit.Assertions.Assert
        (Data_Rate.Status = Ok
         and then Close (Data_Rate.Value, 1.5)
         and then Data_Rate.Unit (1 .. Data_Rate.Unit_Length) = "kb/s",
         "data-rate compound roundtrip [" & Data_Rate_Text & "]");
      AUnit.Assertions.Assert
        (Bit_Rate.Status = Ok
         and then Close (Bit_Rate.Value, 1.5)
         and then Bit_Rate.Unit (1 .. Bit_Rate.Unit_Length) = "mbit/s",
         "bit-rate compound roundtrip [" & Bit_Rate_Text & "]");
      AUnit.Assertions.Assert
        (IOPS.Status = Ok
         and then Close (IOPS.Value, 42.0)
         and then IOPS.Unit (1 .. IOPS.Unit_Length) = "k iops",
         "IOPS compound roundtrip [" & IOPS_Text & "]");

      Check_Compound
        (Humanize.Units.Format_Bits (Support.En, 1_500_000.0),
         1.5, "mbit", "bit quantity");
      Check_Compound
        (Humanize.Units.Format_Binary_Data_Rate (Support.En, 1_572_864.0),
         1.5, "mib/s", "binary data rate");
      Check_Compound
        (Humanize.Units.Format_Density (Support.En, 997.0),
         997.0, "kg/m3", "density");
      Check_Compound
        (Humanize.Units.Format_Acceleration (Support.En, 9.8),
         9.8, "m/s2", "acceleration");
      Check_Compound
        (Humanize.Units.Format_Torque (Support.En, 250.0),
         250.0, "n m", "torque");
      Check_Compound
        (Humanize.Units.Format_Fuel_Economy (Support.En, 5.5),
         5.5, "l/100 km", "fuel economy");
      Check_Compound
        (Humanize.Units.Format_Flow_Rate (Support.En, 0.25),
         250.0, "ml/s", "flow rate");
      Check_Compound
        (Humanize.Units.Format_Electric_Current (Support.En, 0.5),
         500.0, "ma", "electric current");
      Check_Compound
        (Humanize.Units.Format_Voltage (Support.En, 1_200.0),
         1.2, "kv", "voltage");
      Check_Compound
        (Humanize.Units.Format_Pixel_Density (Support.En, 326.0),
         326.0, "ppi", "pixel density");
      Check_Compound
        (Humanize.Units.Format_Electric_Resistance (Support.En, 2_200.0),
         2.2, "kohm", "electric resistance");
      Check_Compound
        (Humanize.Units.Format_Electric_Capacitance
           (Support.En, 0.000_004_7),
         4.7, "uf", "electric capacitance");
      Check_Compound
        (Humanize.Units.Format_Electric_Inductance (Support.En, 0.0022),
         2.2, "mh", "electric inductance");
      Check_Compound
        (Humanize.Units.Format_Concentration (Support.En, 0.5),
         0.5, "mol/l", "concentration");
      Check_Compound
        (Humanize.Units.Format_Fuel_Efficiency_MPG (Support.En, 32.5),
         32.5, "mpg", "fuel efficiency MPG");
      Check_Compound
        (Humanize.Units.Format_Memory_Bandwidth
           (Support.En, 1_500_000_000.0),
         1.5, "gb/s", "memory bandwidth");
      Check_Compound
        (Humanize.Units.Format_CPU_Load (Support.En, 87.5),
         87.5, "% cpu", "CPU load");
      Check_Compound
        (Humanize.Units.Format_Battery (Support.En, 45.0),
         45.0, "% battery", "battery");
      Check_Compound
        (Humanize.Units.Format_Screen_Size (Support.En, 13.3),
         13.3, "in screen", "screen size");
      Check_Compound
        (Humanize.Units.Format_Typography_Size (Support.En, 12.0),
         12.0, "pt", "typography size");
      Check_Compound
        (Humanize.Units.Format_Audio_Level (Support.En, -12.5),
         -12.5, "db", "audio level");
      Check_Compound
        (Humanize.Units.Format_Signal_Strength (Support.En, -67.0),
         -67.0, "dbm", "signal strength");
      Check_Compound
        (Humanize.Units.Format_Storage_Endurance (Support.En, 600.0),
         600.0, "tbw", "storage endurance");
      Check_Compound
        (Humanize.Units.Format_Refresh_Rate (Support.En, 144.0),
         144.0, "hz refresh", "refresh rate");
      Check_Compound
        (Humanize.Units.Format_Luminance (Support.En, 1_000.0),
         1_000.0, "nits", "luminance");
      Check_Compound
        (Humanize.Units.Format_Print_Resolution (Support.En, 300.0),
         300.0, "dpi", "print resolution");
   end Check_Unit_Compound_Roundtrips;
