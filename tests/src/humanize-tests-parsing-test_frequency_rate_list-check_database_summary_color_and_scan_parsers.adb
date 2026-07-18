separate (Humanize.Tests.Parsing.Test_Frequency_Rate_List)
   procedure Check_Database_Summary_Color_And_Scan_Parsers is
   begin
      AUnit.Assertions.Assert
        (Database_Phrase.Status = Humanize.Status.Ok
         and then Database_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Phrase.Database_Status =
           Humanize.Phrases.Database_Replication_Lagging
         and then Database_Backup_Phrase.Status = Humanize.Status.Ok
         and then Database_Backup_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Backup_Phrase.Database_Status =
           Humanize.Phrases.Database_Backup_Failed,
         "parse database phrases");
      AUnit.Assertions.Assert
        (Database_Online_Phrase.Status = Humanize.Status.Ok
         and then Database_Online_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Online_Phrase.Database_Status =
           Humanize.Phrases.Database_Online
         and then Database_Offline_Phrase.Status = Humanize.Status.Ok
         and then Database_Offline_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Offline_Phrase.Database_Status =
           Humanize.Phrases.Database_Offline
         and then Database_Degraded_Phrase.Status = Humanize.Status.Ok
         and then Database_Degraded_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Degraded_Phrase.Database_Status =
           Humanize.Phrases.Database_Degraded
         and then Database_Migrating_Phrase.Status = Humanize.Status.Ok
         and then Database_Migrating_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Migrating_Phrase.Database_Status =
           Humanize.Phrases.Database_Migrating
         and then Database_Migration_Failed_Phrase.Status = Humanize.Status.Ok
         and then Database_Migration_Failed_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Migration_Failed_Phrase.Database_Status =
           Humanize.Phrases.Database_Migration_Failed
         and then Database_Replicating_Phrase.Status = Humanize.Status.Ok
         and then Database_Replicating_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Replicating_Phrase.Database_Status =
           Humanize.Phrases.Database_Replicating
         and then Database_Backup_Running_Phrase.Status = Humanize.Status.Ok
         and then Database_Backup_Running_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Backup_Running_Phrase.Database_Status =
           Humanize.Phrases.Database_Backup_Running
         and then Database_Backup_Failed_Phrase.Status = Humanize.Status.Ok
         and then Database_Backup_Failed_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Backup_Failed_Phrase.Database_Status =
           Humanize.Phrases.Database_Backup_Failed,
         "parse all database phrases");
      AUnit.Assertions.Assert
        (Field_Change.Status = Humanize.Status.Ok
         and then Field_Change.Total = 4
         and then Field_Change.Changed = 2
         and then Field_Change.Added = 1
         and then Field_Change.Removed = 1
         and then Field_Change.Unit (1 .. Field_Change.Unit_Length) = "fields",
         "parse field change summary");
      AUnit.Assertions.Assert
        (Field_Added.Status = Humanize.Status.Ok
         and then Field_Added.Kind = Humanize.Parsing.Field_State_Added
         and then Field_Added.Field (1 .. Field_Added.Field_Length) = "title"
         and then Field_Added.Value (1 .. Field_Added.Value_Length) = "final",
         "parse field added summary");
      AUnit.Assertions.Assert
        (Field_Removed.Status = Humanize.Status.Ok
         and then Field_Removed.Kind = Humanize.Parsing.Field_State_Removed
         and then Field_Removed.Field (1 .. Field_Removed.Field_Length) =
           "title"
         and then Field_Removed.Value (1 .. Field_Removed.Value_Length) =
           "draft",
         "parse field removed summary");
      AUnit.Assertions.Assert
        (Field_Unchanged.Status = Humanize.Status.Ok
         and then Field_Unchanged.Kind =
           Humanize.Parsing.Field_State_Unchanged
         and then Field_Unchanged.Field
           (1 .. Field_Unchanged.Field_Length) = "status"
         and then Field_Unchanged.Value
           (1 .. Field_Unchanged.Value_Length) = "open",
         "parse field unchanged summary");
      AUnit.Assertions.Assert
        (Uncertainty.Status = Humanize.Status.Ok
         and then abs (Uncertainty.Value - 12.3) < 0.0001
         and then abs (Uncertainty.Uncertainty - 0.4) < 0.0001
         and then Uncertainty.Style =
           Humanize.Numbers.Plus_Minus_Uncertainty,
         "parse plus-minus uncertainty");
      AUnit.Assertions.Assert
        (Uncertainty_Words.Status = Humanize.Status.Ok
         and then abs (Uncertainty_Words.Value - 12.3) < 0.0001
         and then abs (Uncertainty_Words.Uncertainty - 0.4) < 0.0001
         and then Uncertainty_Words.Style =
           Humanize.Numbers.Plus_Minus_Uncertainty,
         "parse worded uncertainty");
      AUnit.Assertions.Assert
        (Parenthesized_Uncertainty.Status = Humanize.Status.Ok
         and then abs (Parenthesized_Uncertainty.Value - 12.3) < 0.0001
         and then abs (Parenthesized_Uncertainty.Uncertainty - 0.4) < 0.0001
         and then Parenthesized_Uncertainty.Style =
           Humanize.Numbers.Parenthesized_Uncertainty,
         "parse parenthesized uncertainty");
      AUnit.Assertions.Assert
        (Interval_Uncertainty.Status = Humanize.Status.Ok
         and then abs (Interval_Uncertainty.Value - 12.3) < 0.0001
         and then abs (Interval_Uncertainty.Uncertainty - 0.4) < 0.0001
         and then abs (Interval_Uncertainty.Low - 11.9) < 0.0001
         and then abs (Interval_Uncertainty.High - 12.7) < 0.0001
         and then Interval_Uncertainty.Style =
           Humanize.Numbers.Interval_Uncertainty,
         "parse interval uncertainty");
      AUnit.Assertions.Assert
        (Scanned_Uncertainty.Status = Humanize.Status.Ok
         and then Scanned_Uncertainty.Consumed = 12,
         "scan uncertainty prefix");
      AUnit.Assertions.Assert
        (Proportion.Status = Humanize.Status.Ok
         and then Proportion.Count = 3
         and then Proportion.Total = 10,
         "parse proportion");
      AUnit.Assertions.Assert
        (Scanned_Proportion.Status = Humanize.Status.Ok
         and then Scanned_Proportion.Count = 1
         and then Scanned_Proportion.Total = 4
         and then Scanned_Proportion.Consumed = 6,
         "scan proportion prefix");
      AUnit.Assertions.Assert
        (Ratio.Status = Humanize.Status.Ok
         and then Ratio.Width = 16 and then Ratio.Height = 9,
         "parse aspect ratio");
      AUnit.Assertions.Assert
        (CSS.Status = Humanize.Status.Ok
         and then CSS.Value = 1.5
         and then CSS.Unit (1 .. CSS.Unit_Length) = "rem",
         "parse CSS length");
      AUnit.Assertions.Assert
        (Compound.Status = Humanize.Status.Ok
         and then Compound.Value = 2.5
         and then Compound.Unit (1 .. Compound.Unit_Length) = "ms",
         "parse compound unit");
      AUnit.Assertions.Assert
        (Database_Throughput.Status = Humanize.Status.Ok
         and then Database_Throughput.Value = 12.5
         and then Database_Throughput.Unit
           (1 .. Database_Throughput.Unit_Length) = "k ops/s",
         "parse database throughput");
      AUnit.Assertions.Assert
        (Scanned_Database_Throughput.Status = Humanize.Status.Ok
         and then Scanned_Database_Throughput.Value = 12.5
         and then Scanned_Database_Throughput.Unit
           (1 .. Scanned_Database_Throughput.Unit_Length) = "k ops/s"
         and then Scanned_Database_Throughput.Consumed = 12,
         "scan database throughput");
      AUnit.Assertions.Assert
        (Data_Rate.Status = Humanize.Status.Ok
         and then Data_Rate.Value = 1.5
         and then Data_Rate.Unit (1 .. Data_Rate.Unit_Length) = "mb/s",
         "parse data rate");
      AUnit.Assertions.Assert
        (Scanned_Bit_Rate.Status = Humanize.Status.Ok
         and then Scanned_Bit_Rate.Value = 1.5
         and then Scanned_Bit_Rate.Unit
           (1 .. Scanned_Bit_Rate.Unit_Length) = "mbit/s"
         and then Scanned_Bit_Rate.Consumed = 10,
         "scan bit rate");
      AUnit.Assertions.Assert
        (Binary_Data_Rate.Status = Humanize.Status.Ok
         and then Binary_Data_Rate.Value = 1.5
         and then Binary_Data_Rate.Unit
           (1 .. Binary_Data_Rate.Unit_Length) = "gib/s",
         "parse binary data rate");
      AUnit.Assertions.Assert
        (Memory_Bandwidth.Status = Humanize.Status.Ok
         and then Memory_Bandwidth.Value = 12.5
         and then Memory_Bandwidth.Unit
           (1 .. Memory_Bandwidth.Unit_Length) = "gb/s",
         "parse memory bandwidth");
      AUnit.Assertions.Assert
        (Scanned_Latency.Status = Humanize.Status.Ok
         and then Scanned_Latency.Value = 2.5
         and then Scanned_Latency.Unit
           (1 .. Scanned_Latency.Unit_Length) = "ms"
         and then Scanned_Latency.Consumed = 6,
         "scan latency");
      AUnit.Assertions.Assert
        (IOPS.Status = Humanize.Status.Ok
         and then IOPS.Value = 42.0
         and then IOPS.Unit (1 .. IOPS.Unit_Length) = "k iops",
         "parse IOPS");
      AUnit.Assertions.Assert
        (Scanned_IOPS.Status = Humanize.Status.Ok
         and then Scanned_IOPS.Value = 42.0
         and then Scanned_IOPS.Unit (1 .. Scanned_IOPS.Unit_Length) = "k iops"
         and then Scanned_IOPS.Consumed = 9,
         "scan IOPS");
      AUnit.Assertions.Assert
        (Density.Status = Humanize.Status.Ok
         and then Density.Unit (1 .. Density.Unit_Length) = "kg/m3",
         "parse density");
      AUnit.Assertions.Assert
        (Acceleration.Status = Humanize.Status.Ok
         and then Acceleration.Unit
           (1 .. Acceleration.Unit_Length) = "m/s2",
         "parse acceleration");
      AUnit.Assertions.Assert
        (Torque.Status = Humanize.Status.Ok
         and then Torque.Unit (1 .. Torque.Unit_Length) = "n m",
         "parse torque");
      AUnit.Assertions.Assert
        (Fuel_Economy.Status = Humanize.Status.Ok
         and then Fuel_Economy.Unit
           (1 .. Fuel_Economy.Unit_Length) = "l/100 km",
         "parse fuel economy");
      AUnit.Assertions.Assert
        (Flow_Rate.Status = Humanize.Status.Ok
         and then Flow_Rate.Unit (1 .. Flow_Rate.Unit_Length) = "ml/s"
         and then Flow_Rate.Consumed = 8,
         "scan flow rate");
      AUnit.Assertions.Assert
        (Electric_Current.Status = Humanize.Status.Ok
         and then Electric_Current.Unit
           (1 .. Electric_Current.Unit_Length) = "ma",
         "parse electric current");
      AUnit.Assertions.Assert
        (Voltage.Status = Humanize.Status.Ok
         and then Voltage.Unit (1 .. Voltage.Unit_Length) = "kv",
         "parse voltage");
      AUnit.Assertions.Assert
        (Pixel_Density.Status = Humanize.Status.Ok
         and then Pixel_Density.Unit
           (1 .. Pixel_Density.Unit_Length) = "ppi",
         "parse pixel density");
      AUnit.Assertions.Assert
        (Electric_Resistance.Status = Humanize.Status.Ok
         and then Electric_Resistance.Unit
           (1 .. Electric_Resistance.Unit_Length) = "mohm",
         "parse electric resistance");
      AUnit.Assertions.Assert
        (Electric_Capacitance.Status = Humanize.Status.Ok
         and then Electric_Capacitance.Unit
           (1 .. Electric_Capacitance.Unit_Length) = "nf",
         "parse electric capacitance");
      AUnit.Assertions.Assert
        (Electric_Inductance.Status = Humanize.Status.Ok
         and then Electric_Inductance.Unit
           (1 .. Electric_Inductance.Unit_Length) = "h",
         "parse electric inductance");
      AUnit.Assertions.Assert
        (Concentration.Status = Humanize.Status.Ok
         and then Concentration.Unit
           (1 .. Concentration.Unit_Length) = "mol/l",
         "parse concentration");
      AUnit.Assertions.Assert
        (Fuel_Efficiency_MPG.Status = Humanize.Status.Ok
         and then Fuel_Efficiency_MPG.Unit
           (1 .. Fuel_Efficiency_MPG.Unit_Length) = "mpg",
         "parse fuel efficiency mpg");
      AUnit.Assertions.Assert
        (CPU_Load.Status = Humanize.Status.Ok
         and then CPU_Load.Unit (1 .. CPU_Load.Unit_Length) = "% cpu",
         "parse CPU load");
      AUnit.Assertions.Assert
        (Battery.Status = Humanize.Status.Ok
         and then Battery.Unit (1 .. Battery.Unit_Length) = "% battery",
         "parse battery");
      AUnit.Assertions.Assert
        (Screen_Size.Status = Humanize.Status.Ok
         and then Screen_Size.Unit
           (1 .. Screen_Size.Unit_Length) = "in screen",
         "parse screen size");
      AUnit.Assertions.Assert
        (Typography_Size.Status = Humanize.Status.Ok
         and then Typography_Size.Unit
           (1 .. Typography_Size.Unit_Length) = "pt",
         "parse typography size");
      AUnit.Assertions.Assert
        (Audio_Level.Status = Humanize.Status.Ok
         and then Audio_Level.Value = -6.0
         and then Audio_Level.Unit
           (1 .. Audio_Level.Unit_Length) = "db",
         "parse audio level");
      AUnit.Assertions.Assert
        (Signal_Strength.Status = Humanize.Status.Ok
         and then Signal_Strength.Value = -67.0
         and then Signal_Strength.Unit
           (1 .. Signal_Strength.Unit_Length) = "dbm",
         "parse signal strength");
      AUnit.Assertions.Assert
        (Storage_Endurance.Status = Humanize.Status.Ok
         and then Storage_Endurance.Unit
           (1 .. Storage_Endurance.Unit_Length) = "tbw",
         "parse storage endurance");
      AUnit.Assertions.Assert
        (Refresh_Rate.Status = Humanize.Status.Ok
         and then Refresh_Rate.Unit
           (1 .. Refresh_Rate.Unit_Length) = "hz refresh",
         "parse refresh rate");
      AUnit.Assertions.Assert
        (Luminance.Status = Humanize.Status.Ok
         and then Luminance.Unit (1 .. Luminance.Unit_Length) = "nits",
         "parse luminance");
      AUnit.Assertions.Assert
        (Print_Resolution.Status = Humanize.Status.Ok
         and then Print_Resolution.Unit
           (1 .. Print_Resolution.Unit_Length) = "dpi",
         "parse print resolution");
      AUnit.Assertions.Assert
        (Unit.Status = Humanize.Status.Ok
         and then Unit.Unit = Humanize.Units.Kilometer
         and then Unit.Value = 5.0,
         "parse unit quantity");
      AUnit.Assertions.Assert
        (Localized_Unit.Status = Humanize.Status.Ok
         and then Localized_Unit.Unit = Humanize.Units.Kilometer
         and then Localized_Unit.Value = 5.0,
         "parse localized unit quantity");
      AUnit.Assertions.Assert
        (Acre.Status = Humanize.Status.Ok
         and then Acre.Unit = Humanize.Units.Acre
         and then Acre.Value = 2.0,
         "parse expanded unit alias");
      AUnit.Assertions.Assert
        (Pounds.Status = Humanize.Status.Ok
         and then Pounds.Unit = Humanize.Units.Pound,
         "parse plural abbreviation unit alias");
      AUnit.Assertions.Assert
        (Fahrenheit.Status = Humanize.Status.Ok
         and then Fahrenheit.Unit = Humanize.Units.Fahrenheit,
         "parse temperature unit alias");
      AUnit.Assertions.Assert
        (Bad_Unit.Status = Humanize.Status.Invalid_Argument
         and then Bad_Unit.Error_Position = 3,
         "parse unit diagnostic position");
      AUnit.Assertions.Assert
        (Scanned_Unit.Status = Humanize.Status.Ok
         and then Scanned_Unit.Unit = Humanize.Units.Kilometer
         and then Scanned_Unit.Consumed = 4,
         "scan unit prefix");
      AUnit.Assertions.Assert
        (Scanned_Bytes.Status = Humanize.Status.Ok
         and then Scanned_Bytes.Value = 1536
         and then Scanned_Bytes.Consumed = 7,
         "scan byte prefix");
      AUnit.Assertions.Assert
        (Scanned_Precise.Status = Humanize.Status.Ok
         and then Scanned_Precise.Value = 1_005_000
         and then Scanned_Precise.Consumed = 14,
         "scan precise duration prefix");
      AUnit.Assertions.Assert
        (Scanned_Compact.Status = Humanize.Status.Ok
         and then Scanned_Compact.Value = 1_200
         and then Scanned_Compact.Consumed = 4,
         "scan compact number prefix");
      AUnit.Assertions.Assert
        (Scanned_Bounded.Status = Humanize.Status.Ok
         and then Scanned_Bounded.Value = 100
         and then Scanned_Bounded.Consumed = 4,
         "scan bounded number prefix");
      AUnit.Assertions.Assert
        (Scanned_Frequency.Status = Humanize.Status.Ok
         and then Scanned_Frequency.Count = 4
         and then Scanned_Frequency.Consumed = 7,
         "scan frequency prefix");
      AUnit.Assertions.Assert
        (Scanned_Rate.Status = Humanize.Status.Ok
         and then Scanned_Rate.Less_Than
         and then Scanned_Rate.Period = Humanize.Rates.Per_Day,
         "scan rate prefix");
   end Check_Database_Summary_Color_And_Scan_Parsers;
