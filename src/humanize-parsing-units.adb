with Humanize.Parsing.Implementation.Units;

package body Humanize.Parsing.Units is
   package Impl renames Humanize.Parsing.Implementation.Units;

   function Parse_Frequency
     (Text : String)
      return Frequency_Parse_Result renames Impl.Parse_Frequency;

   function Scan_Frequency
     (Text : String)
      return Frequency_Parse_Result renames Impl.Scan_Frequency;

   function Parse_Rate
     (Text : String)
      return Rate_Parse_Result renames Impl.Parse_Rate;

   function Scan_Rate
     (Text : String)
      return Rate_Parse_Result renames Impl.Scan_Rate;

   function Parse_List
     (Text : String)
      return List_Parse_Result renames Impl.Parse_List;

   function Scan_List
     (Text : String)
      return List_Parse_Result renames Impl.Scan_List;

   function Parse_Unit
     (Text : String)
      return Unit_Parse_Result renames Impl.Parse_Unit;

   function Parse_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result renames Impl.Parse_Aspect_Ratio;

   function Scan_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result renames Impl.Scan_Aspect_Ratio;

   function Parse_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_CSS_Length;

   function Scan_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_CSS_Length;

   function Parse_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Compound_Unit;

   function Parse_Database_Throughput
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Database_Throughput;

   function Scan_Database_Throughput
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Database_Throughput;

   function Parse_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Data_Rate;

   function Scan_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Data_Rate;

   function Parse_Bit_Rate
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Bit_Rate;

   function Scan_Bit_Rate
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Bit_Rate;

   function Parse_Binary_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Binary_Data_Rate;

   function Scan_Binary_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Binary_Data_Rate;

   function Parse_Memory_Bandwidth
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Memory_Bandwidth;

   function Scan_Memory_Bandwidth
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Memory_Bandwidth;

   function Parse_Latency
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Latency;

   function Scan_Latency
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Latency;

   function Parse_IOPS
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_IOPS;

   function Scan_IOPS
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_IOPS;

   function Parse_Density
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Density;

   function Scan_Density
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Density;

   function Parse_Acceleration
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Acceleration;

   function Scan_Acceleration
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Acceleration;

   function Parse_Torque
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Torque;

   function Scan_Torque
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Torque;

   function Parse_Fuel_Economy
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Fuel_Economy;

   function Scan_Fuel_Economy
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Fuel_Economy;

   function Parse_Flow_Rate
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Flow_Rate;

   function Scan_Flow_Rate
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Flow_Rate;

   function Parse_Electric_Current
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Electric_Current;

   function Scan_Electric_Current
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Electric_Current;

   function Parse_Voltage
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Voltage;

   function Scan_Voltage
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Voltage;

   function Parse_Pixel_Density
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Pixel_Density;

   function Scan_Pixel_Density
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Pixel_Density;

   function Parse_Electric_Resistance
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Electric_Resistance;

   function Scan_Electric_Resistance
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Electric_Resistance;

   function Parse_Electric_Capacitance
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Electric_Capacitance;

   function Scan_Electric_Capacitance
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Electric_Capacitance;

   function Parse_Electric_Inductance
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Electric_Inductance;

   function Scan_Electric_Inductance
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Electric_Inductance;

   function Parse_Concentration
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Concentration;

   function Scan_Concentration
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Concentration;

   function Parse_Fuel_Efficiency_MPG
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Fuel_Efficiency_MPG;

   function Scan_Fuel_Efficiency_MPG
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Fuel_Efficiency_MPG;

   function Parse_CPU_Load
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_CPU_Load;

   function Scan_CPU_Load
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_CPU_Load;

   function Parse_Battery
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Battery;

   function Scan_Battery
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Battery;

   function Parse_Screen_Size
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Screen_Size;

   function Scan_Screen_Size
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Screen_Size;

   function Parse_Typography_Size
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Typography_Size;

   function Scan_Typography_Size
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Typography_Size;

   function Parse_Audio_Level
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Audio_Level;

   function Scan_Audio_Level
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Audio_Level;

   function Parse_Signal_Strength
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Signal_Strength;

   function Scan_Signal_Strength
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Signal_Strength;

   function Parse_Storage_Endurance
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Storage_Endurance;

   function Scan_Storage_Endurance
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Storage_Endurance;

   function Parse_Refresh_Rate
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Refresh_Rate;

   function Scan_Refresh_Rate
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Refresh_Rate;

   function Parse_Luminance
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Luminance;

   function Scan_Luminance
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Luminance;

   function Parse_Print_Resolution
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Parse_Print_Resolution;

   function Scan_Print_Resolution
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Print_Resolution;

   function Scan_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result renames Impl.Scan_Compound_Unit;

   function Scan_Unit
     (Text : String)
      return Unit_Parse_Result renames Impl.Scan_Unit;
end Humanize.Parsing.Units;
