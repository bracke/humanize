with Ada.Calendar;

with Humanize.Bytes;
with Humanize.Colors;
with Humanize.Durations;
with Humanize.Frequencies;
with Humanize.Numbers;
with Humanize.Phrases;
with Humanize.Rates;
with Humanize.Status;
with Humanize.Strings;
with Humanize.Units;
with Humanize.Values;

package Humanize.Parsing.Units is

   function Parse_Frequency
     (Text : String)
      return Frequency_Parse_Result;

   function Scan_Frequency
     (Text : String)
      return Frequency_Parse_Result;

   function Parse_Rate
     (Text : String)
      return Rate_Parse_Result;

   function Scan_Rate
     (Text : String)
      return Rate_Parse_Result;

   function Parse_List
     (Text : String)
      return List_Parse_Result;

   function Scan_List
     (Text : String)
      return List_Parse_Result;

   function Parse_Unit
     (Text : String)
      return Unit_Parse_Result;

   function Parse_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result;

   function Scan_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result;

   function Parse_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Database_Throughput
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Database_Throughput
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Bit_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Bit_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Binary_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Binary_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Memory_Bandwidth
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Memory_Bandwidth
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Latency
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Latency
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_IOPS
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_IOPS
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Density
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Density
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Acceleration
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Acceleration
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Torque
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Torque
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Fuel_Economy
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Fuel_Economy
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Flow_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Flow_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Electric_Current
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Electric_Current
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Voltage
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Voltage
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Pixel_Density
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Pixel_Density
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Electric_Resistance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Electric_Resistance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Electric_Capacitance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Electric_Capacitance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Electric_Inductance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Electric_Inductance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Concentration
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Concentration
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Fuel_Efficiency_MPG
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Fuel_Efficiency_MPG
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_CPU_Load
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_CPU_Load
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Battery
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Battery
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Screen_Size
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Screen_Size
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Typography_Size
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Typography_Size
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Audio_Level
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Audio_Level
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Signal_Strength
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Signal_Strength
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Storage_Endurance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Storage_Endurance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Refresh_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Refresh_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Luminance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Luminance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Print_Resolution
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Print_Resolution
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Unit
     (Text : String)
      return Unit_Parse_Result;
end Humanize.Parsing.Units;
