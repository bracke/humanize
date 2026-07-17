with Humanize.Units.Support;

package body Humanize.Units is

   function Format
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : Unit_Kind;
      Style   : Unit_Style := Long)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format;

   function Format
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : Unit_Kind;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options;
      Style   : Unit_Style := Long)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format;

   function Format_Length
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Length;

   function Format_Length
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Length;

   function Format_Mass
     (Context : Humanize.Contexts.Context;
      Grams   : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Mass;

   function Format_Mass
     (Context : Humanize.Contexts.Context;
      Grams   : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Mass;

   function Format_Volume
     (Context : Humanize.Contexts.Context;
      Liters  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Volume;

   function Format_Volume
     (Context : Humanize.Contexts.Context;
      Liters  : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Volume;

   function Format_Speed
     (Context           : Humanize.Contexts.Context;
      Meters_Per_Second : Long_Float;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Speed;

   function Format_Speed
     (Context           : Humanize.Contexts.Context;
      Meters_Per_Second : Long_Float;
      Options           : Measurement_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Speed;

   function Format_Area
     (Context       : Humanize.Contexts.Context;
      Square_Meters : Long_Float;
      Options       : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Area;

   function Format_Pressure
     (Context : Humanize.Contexts.Context;
      Pascals : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Pressure;

   function Format_Energy
     (Context : Humanize.Contexts.Context;
      Joules  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Energy;

   function Format_Power
     (Context : Humanize.Contexts.Context;
      Watts   : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Power;

   function Format_Temperature
     (Context : Humanize.Contexts.Context;
      Celsius_Value : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Temperature;

   function Format_Temperature
     (Context : Humanize.Contexts.Context;
      Celsius_Value : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Temperature;

   function Format_Frequency
     (Context : Humanize.Contexts.Context;
      Hertz_Value : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Frequency;

   function Format_Angle
     (Context : Humanize.Contexts.Context;
      Degrees : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Angle;

   function Format_Data_Rate
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Data_Rate;

   function Format_Bits
     (Context : Humanize.Contexts.Context;
      Bits    : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Bits;

   function Format_Bit_Rate
     (Context         : Humanize.Contexts.Context;
      Bits_Per_Second : Long_Float;
      Options         : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Bit_Rate;

   function Format_Binary_Data_Rate
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Binary_Data_Rate;

   function Format_Density
     (Context                  : Humanize.Contexts.Context;
      Kilograms_Per_Cubic_Meter : Long_Float;
      Options                  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Density;

   function Format_Acceleration
     (Context                  : Humanize.Contexts.Context;
      Meters_Per_Second_Squared : Long_Float;
      Options                  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Acceleration;

   function Format_Torque
     (Context       : Humanize.Contexts.Context;
      Newton_Meters : Long_Float;
      Options       : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Torque;

   function Format_Fuel_Economy
     (Context            : Humanize.Contexts.Context;
      Liters_Per_100_Km  : Long_Float;
      Options            : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Fuel_Economy;

   function Format_Fuel_Economy
     (Context            : Humanize.Contexts.Context;
      Liters_Per_100_Km  : Long_Float;
      Options            : Measurement_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Fuel_Economy;

   function Format_Flow_Rate
     (Context           : Humanize.Contexts.Context;
      Liters_Per_Second : Long_Float;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Flow_Rate;

   function Format_Electric_Current
     (Context : Humanize.Contexts.Context;
      Amperes : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Electric_Current;

   function Format_Voltage
     (Context : Humanize.Contexts.Context;
      Volts   : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Voltage;

   function Format_Resolution
     (Context : Humanize.Contexts.Context;
      Width   : Natural;
      Height  : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Resolution;

   function Format_Pixel_Density
     (Context : Humanize.Contexts.Context;
      Pixels_Per_Inch : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Pixel_Density;

   function Format_CSS_Length
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_CSS_Length;

   function Format_Electric_Resistance
     (Context : Humanize.Contexts.Context;
      Ohms    : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Electric_Resistance;

   function Format_Aspect_Ratio
     (Context : Humanize.Contexts.Context;
      Width   : Natural;
      Height  : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Aspect_Ratio;

   function Format_Electric_Capacitance
     (Context : Humanize.Contexts.Context;
      Farads  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Electric_Capacitance;

   function Format_Electric_Inductance
     (Context : Humanize.Contexts.Context;
      Henries : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Electric_Inductance;

   function Format_Concentration
     (Context : Humanize.Contexts.Context;
      Moles_Per_Liter : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Concentration;

   function Format_Fuel_Efficiency_MPG
     (Context : Humanize.Contexts.Context;
      Miles_Per_Gallon : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Fuel_Efficiency_MPG;

   function Format_Cooking_Temperature
     (Context : Humanize.Contexts.Context;
      Fahrenheit_Value : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Cooking_Temperature;

   function Format_Cooking_Temperature
     (Context : Humanize.Contexts.Context;
      Fahrenheit_Value : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Cooking_Temperature;

   function Format_Memory_Bandwidth
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Memory_Bandwidth;

   function Format_Latency
     (Context      : Humanize.Contexts.Context;
      Microseconds : Long_Float;
      Options      : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Latency;

   function Format_Database_Throughput
     (Context               : Humanize.Contexts.Context;
      Operations_Per_Second : Long_Float;
      Options               : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Database_Throughput;

   function Format_CPU_Load
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_CPU_Load;

   function Format_Battery
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Battery;

   function Format_Screen_Size
     (Context : Humanize.Contexts.Context;
      Inches  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Screen_Size;

   function Format_Typography_Size
     (Context : Humanize.Contexts.Context;
      Points  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Typography_Size;

   function Format_IOPS
     (Context : Humanize.Contexts.Context;
      IOPS    : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_IOPS;

   function Format_Audio_Level
     (Context  : Humanize.Contexts.Context;
      Decibels : Long_Float;
      Options  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Audio_Level;

   function Format_Signal_Strength
     (Context : Humanize.Contexts.Context;
      DBm     : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Signal_Strength;

   function Format_Storage_Endurance
     (Context   : Humanize.Contexts.Context;
      Terabytes : Long_Float;
      Options   : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Storage_Endurance;

   function Format_Refresh_Rate
     (Context : Humanize.Contexts.Context;
      Hertz   : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Refresh_Rate;

   function Format_Luminance
     (Context : Humanize.Contexts.Context;
      Nits    : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Luminance;

   function Format_Print_Resolution
     (Context : Humanize.Contexts.Context;
      DPI     : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Print_Resolution;

   function Format_Geographic_Distance
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Geographic_Distance;

   function Format_Geographic_Distance
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Options : Measurement_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Units.Support.Format_Geographic_Distance;

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : Unit_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Style   : Unit_Style := Long)
      renames Humanize.Units.Support.Format_Into;

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
      renames Humanize.Units.Support.Format_Into;

   procedure Format_Length_Into
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Length_Into;

   procedure Format_Length_Into
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options)
      renames Humanize.Units.Support.Format_Length_Into;

   procedure Format_Mass_Into
     (Context : Humanize.Contexts.Context;
      Grams   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Mass_Into;

   procedure Format_Mass_Into
     (Context : Humanize.Contexts.Context;
      Grams   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options)
      renames Humanize.Units.Support.Format_Mass_Into;

   procedure Format_Volume_Into
     (Context : Humanize.Contexts.Context;
      Liters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Volume_Into;

   procedure Format_Volume_Into
     (Context : Humanize.Contexts.Context;
      Liters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options)
      renames Humanize.Units.Support.Format_Volume_Into;

   procedure Format_Speed_Into
     (Context           : Humanize.Contexts.Context;
      Meters_Per_Second : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Speed_Into;

   procedure Format_Speed_Into
     (Context           : Humanize.Contexts.Context;
      Meters_Per_Second : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Measurement_Options)
      renames Humanize.Units.Support.Format_Speed_Into;

   procedure Format_Area_Into
     (Context       : Humanize.Contexts.Context;
      Square_Meters : Long_Float;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Options       : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Area_Into;

   procedure Format_Pressure_Into
     (Context : Humanize.Contexts.Context;
      Pascals : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Pressure_Into;

   procedure Format_Energy_Into
     (Context : Humanize.Contexts.Context;
      Joules  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Energy_Into;

   procedure Format_Power_Into
     (Context : Humanize.Contexts.Context;
      Watts   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Power_Into;

   procedure Format_Temperature_Into
     (Context : Humanize.Contexts.Context;
      Celsius_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Temperature_Into;

   procedure Format_Temperature_Into
     (Context : Humanize.Contexts.Context;
      Celsius_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options)
      renames Humanize.Units.Support.Format_Temperature_Into;

   procedure Format_Frequency_Into
     (Context : Humanize.Contexts.Context;
      Hertz_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Frequency_Into;

   procedure Format_Angle_Into
     (Context : Humanize.Contexts.Context;
      Degrees : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Angle_Into;

   procedure Format_Data_Rate_Into
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Data_Rate_Into;

   procedure Format_Bits_Into
     (Context : Humanize.Contexts.Context;
      Bits    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Bits_Into;

   procedure Format_Bit_Rate_Into
     (Context         : Humanize.Contexts.Context;
      Bits_Per_Second : Long_Float;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Options         : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Bit_Rate_Into;

   procedure Format_Binary_Data_Rate_Into
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Binary_Data_Rate_Into;

   procedure Format_Density_Into
     (Context                  : Humanize.Contexts.Context;
      Kilograms_Per_Cubic_Meter : Long_Float;
      Target                   : in out String;
      Written                  : out Natural;
      Status                   : out Humanize.Status.Status_Code;
      Options                  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Density_Into;

   procedure Format_Acceleration_Into
     (Context                  : Humanize.Contexts.Context;
      Meters_Per_Second_Squared : Long_Float;
      Target                   : in out String;
      Written                  : out Natural;
      Status                   : out Humanize.Status.Status_Code;
      Options                  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Acceleration_Into;

   procedure Format_Torque_Into
     (Context       : Humanize.Contexts.Context;
      Newton_Meters : Long_Float;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Options       : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Torque_Into;

   procedure Format_Fuel_Economy_Into
     (Context           : Humanize.Contexts.Context;
      Liters_Per_100_Km : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Fuel_Economy_Into;

   procedure Format_Fuel_Economy_Into
     (Context           : Humanize.Contexts.Context;
      Liters_Per_100_Km : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Measurement_Options)
      renames Humanize.Units.Support.Format_Fuel_Economy_Into;

   procedure Format_Flow_Rate_Into
     (Context           : Humanize.Contexts.Context;
      Liters_Per_Second : Long_Float;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Flow_Rate_Into;

   procedure Format_Electric_Current_Into
     (Context : Humanize.Contexts.Context;
      Amperes : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Electric_Current_Into;

   procedure Format_Voltage_Into
     (Context : Humanize.Contexts.Context;
      Volts   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Voltage_Into;

   procedure Format_Resolution_Into
     (Context : Humanize.Contexts.Context;
      Width   : Natural;
      Height  : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Units.Support.Format_Resolution_Into;

   procedure Format_Pixel_Density_Into
     (Context : Humanize.Contexts.Context;
      Pixels_Per_Inch : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Pixel_Density_Into;

   procedure Format_CSS_Length_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_CSS_Length_Into;

   procedure Format_Electric_Resistance_Into
     (Context : Humanize.Contexts.Context;
      Ohms    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Electric_Resistance_Into;

   procedure Format_Aspect_Ratio_Into
     (Context : Humanize.Contexts.Context;
      Width   : Natural;
      Height  : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Units.Support.Format_Aspect_Ratio_Into;

   procedure Format_Electric_Capacitance_Into
     (Context : Humanize.Contexts.Context;
      Farads  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Electric_Capacitance_Into;

   procedure Format_Electric_Inductance_Into
     (Context : Humanize.Contexts.Context;
      Henries : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Electric_Inductance_Into;

   procedure Format_Concentration_Into
     (Context : Humanize.Contexts.Context;
      Moles_Per_Liter : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Concentration_Into;

   procedure Format_Fuel_Efficiency_MPG_Into
     (Context : Humanize.Contexts.Context;
      Miles_Per_Gallon : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Fuel_Efficiency_MPG_Into;

   procedure Format_Cooking_Temperature_Into
     (Context : Humanize.Contexts.Context;
      Fahrenheit_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Cooking_Temperature_Into;

   procedure Format_Cooking_Temperature_Into
     (Context : Humanize.Contexts.Context;
      Fahrenheit_Value : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options)
      renames Humanize.Units.Support.Format_Cooking_Temperature_Into;

   procedure Format_Memory_Bandwidth_Into
     (Context          : Humanize.Contexts.Context;
      Bytes_Per_Second : Long_Float;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Options          : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Memory_Bandwidth_Into;

   procedure Format_Latency_Into
     (Context      : Humanize.Contexts.Context;
      Microseconds : Long_Float;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Options      : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Latency_Into;

   procedure Format_Database_Throughput_Into
     (Context               : Humanize.Contexts.Context;
      Operations_Per_Second : Long_Float;
      Target                : in out String;
      Written               : out Natural;
      Status                : out Humanize.Status.Status_Code;
      Options               : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Database_Throughput_Into;

   procedure Format_CPU_Load_Into
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_CPU_Load_Into;

   procedure Format_Battery_Into
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Battery_Into;

   procedure Format_Screen_Size_Into
     (Context : Humanize.Contexts.Context;
      Inches  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Screen_Size_Into;

   procedure Format_Typography_Size_Into
     (Context : Humanize.Contexts.Context;
      Points  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Typography_Size_Into;

   procedure Format_IOPS_Into
     (Context : Humanize.Contexts.Context;
      IOPS    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_IOPS_Into;

   procedure Format_Audio_Level_Into
     (Context  : Humanize.Contexts.Context;
      Decibels : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Audio_Level_Into;

   procedure Format_Signal_Strength_Into
     (Context : Humanize.Contexts.Context;
      DBm     : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Signal_Strength_Into;

   procedure Format_Storage_Endurance_Into
     (Context   : Humanize.Contexts.Context;
      Terabytes : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Storage_Endurance_Into;

   procedure Format_Refresh_Rate_Into
     (Context : Humanize.Contexts.Context;
      Hertz   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Refresh_Rate_Into;

   procedure Format_Luminance_Into
     (Context : Humanize.Contexts.Context;
      Nits    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Luminance_Into;

   procedure Format_Print_Resolution_Into
     (Context : Humanize.Contexts.Context;
      DPI     : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Print_Resolution_Into;

   procedure Format_Geographic_Distance_Into
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      renames Humanize.Units.Support.Format_Geographic_Distance_Into;

   procedure Format_Geographic_Distance_Into
     (Context : Humanize.Contexts.Context;
      Meters  : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Measurement_Options)
      renames Humanize.Units.Support.Format_Geographic_Distance_Into;

end Humanize.Units;
