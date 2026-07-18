with Humanize.Bounded_Text;
with Humanize.Parsing.Aliases;
with Humanize.Parsing.Implementation.Unit_Text_Helpers;
with Humanize.Parsing.Normalization;
with Humanize.Parsing.Support;
with Humanize.Status;

package body Humanize.Parsing.Implementation.Compound_Unit_Text_Helpers is
   use type Humanize.Status.Status_Code;

   function Result_Text (Result : Humanize.Status.Text_Result) return String
      renames Humanize.Bounded_Text.Result_Text;
   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;
   function Has_Alias
     (Item    : String;
      Aliases : String)
      return Boolean
      renames Humanize.Parsing.Aliases.Has_Alias;
   function Numeric_Value
     (Text  : String;
      Value : out Long_Float)
      return Boolean
      renames Humanize.Parsing.Support.Numeric_Value;
   function Split_Number_Unit
     (Text        : String;
      Number_Text : out Natural;
      Unit_Start  : out Natural)
      return Boolean
      renames Humanize.Parsing.Support.Split_Number_Unit;
   function Scan_End (Text : String) return Natural
      renames Humanize.Parsing.Support.Scan_End;
   function Normalize_Unit_Text
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Normalization.Normalize_Unit_Text;
   function Known_Compound_Unit (Unit : String) return Boolean
      renames Humanize.Parsing.Implementation.Unit_Text_Helpers.Known_Compound_Unit;

   function Compound_Result
     (Value    : Long_Float;
      Unit     : String;
      Consumed : Natural)
      return Compound_Unit_Parse_Result
   is
      Result : Compound_Unit_Parse_Result;
      Count  : constant Natural := Natural'Min (Unit'Length, Result.Unit'Length);
   begin
      Result.Status := Humanize.Status.Ok;
      Result.Value := Value;
      Result.Unit_Length := Count;
      Result.Unit (1 .. Count) := Unit (Unit'First .. Unit'First + Count - 1);
      Result.Exact := True;
      Result.Consumed := Consumed;
      Result.Error_Position := 0;
      return Result;
   end Compound_Result;

   function Parse_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result
   is
      Item : constant String := Trim (Text);
      Last_Number : Natural;
      Unit_Start : Natural;
      Amount : Long_Float;
      Unit : Humanize.Status.Text_Result;
   begin
      if not Split_Number_Unit (Item, Last_Number, Unit_Start) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Item'First,
                 Error =>
                   (if Item'Length = 0 then Empty_Input
                    elsif Is_Digit (Item (Item'First))
                      or else Item (Item'First) = '+'
                      or else Item (Item'First) = '-'
                    then Expected_Unit
                    else Expected_Number),
                 others => <>);
      elsif not Numeric_Value (Item (Item'First .. Last_Number), Amount) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Item'First,
                 Error => Expected_Number,
                 others => <>);
      end if;

      Unit := Normalize_Unit_Text (Item (Unit_Start .. Item'Last));
      declare
         U : constant String := Result_Text (Unit);
      begin
         if U = "px" or else U = "em" or else U = "rem" or else U = "vh"
           or else U = "vw" or else U = "%" or else U = "pt"
         then
            return Compound_Result (Amount, U, Item'Length);
         else
            return (Status => Humanize.Status.Invalid_Argument,
                    Error_Position => Unit_Start,
                    Error => Expected_Unit,
                    others => <>);
         end if;
      end;
   exception
      when Constraint_Error =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_CSS_Length;

   function Scan_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Compound_Unit_Parse_Result :=
              Parse_CSS_Length (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_CSS_Length;

   function Parse_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result
   is
      Item : constant String := Trim (Text);
      Last_Number : Natural;
      Unit_Start : Natural;
      Amount : Long_Float;
      Unit : Humanize.Status.Text_Result;
   begin
      if not Split_Number_Unit (Item, Last_Number, Unit_Start) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Item'First,
                 Error =>
                   (if Item'Length = 0 then Empty_Input
                    elsif Is_Digit (Item (Item'First))
                      or else Item (Item'First) = '+'
                      or else Item (Item'First) = '-'
                    then Expected_Unit
                    else Expected_Number),
                 others => <>);
      elsif not Numeric_Value (Item (Item'First .. Last_Number), Amount) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Item'First,
                 Error => Expected_Number,
                 others => <>);
      end if;

      Unit := Normalize_Unit_Text (Item (Unit_Start .. Item'Last));
      declare
         U : constant String := Result_Text (Unit);
      begin
         if Known_Compound_Unit (U) then
            return Compound_Result (Amount, U, Item'Length);
         else
            return (Status => Humanize.Status.Invalid_Argument,
                    Error_Position => Unit_Start,
                    Error => Expected_Unit,
                    others => <>);
         end if;
      end;
   exception
      when Constraint_Error =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Compound_Unit;

   function Scan_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Compound_Unit_Parse_Result :=
              Parse_Compound_Unit (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Compound_Unit;

   function Parse_Database_Throughput
     (Text : String)
      return Compound_Unit_Parse_Result
   is
      Result : constant Compound_Unit_Parse_Result := Parse_Compound_Unit (Text);
      U : constant String :=
        (if Result.Unit_Length = 0 then ""
         else Result.Unit (1 .. Result.Unit_Length));
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Result;
      elsif U = "ops/s" or else U = "k ops/s" or else U = "m ops/s" then
         return Result;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Unit,
                 Error_Position => Text'First,
                 others => <>);
      end if;
   end Parse_Database_Throughput;

   function Parse_Filtered_Compound_Unit
     (Text  : String;
      Units : String)
      return Compound_Unit_Parse_Result
   is
      Result : constant Compound_Unit_Parse_Result := Parse_Compound_Unit (Text);
      U : constant String :=
        (if Result.Unit_Length = 0 then ""
         else Result.Unit (1 .. Result.Unit_Length));
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Result;
      elsif Has_Alias (U, Units) then
         return Result;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Unit,
                 Error_Position => Text'First,
                 others => <>);
      end if;
   end Parse_Filtered_Compound_Unit;

   function Scan_Filtered_Compound_Unit
     (Text  : String;
      Units : String)
      return Compound_Unit_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Compound_Unit_Parse_Result :=
              Parse_Filtered_Compound_Unit
                (Text (Text'First .. Stop), Units);
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Filtered_Compound_Unit;

   function Scan_Database_Throughput
     (Text : String)
      return Compound_Unit_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Compound_Unit_Parse_Result :=
              Parse_Database_Throughput (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Database_Throughput;

   function Parse_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit
        (Text, "mb/s" & ASCII.LF & "kb/s" & ASCII.LF & "b/s");
   end Parse_Data_Rate;

   function Scan_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit
        (Text, "mb/s" & ASCII.LF & "kb/s" & ASCII.LF & "b/s");
   end Scan_Data_Rate;

   function Parse_Bit_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit
        (Text, "gbit/s" & ASCII.LF & "mbit/s" & ASCII.LF
         & "kbit/s" & ASCII.LF & "bit/s");
   end Parse_Bit_Rate;

   function Scan_Bit_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit
        (Text, "gbit/s" & ASCII.LF & "mbit/s" & ASCII.LF
         & "kbit/s" & ASCII.LF & "bit/s");
   end Scan_Bit_Rate;

   function Parse_Binary_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit
        (Text, "gib/s" & ASCII.LF & "mib/s" & ASCII.LF
         & "kib/s" & ASCII.LF & "b/s");
   end Parse_Binary_Data_Rate;

   function Scan_Binary_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit
        (Text, "gib/s" & ASCII.LF & "mib/s" & ASCII.LF
         & "kib/s" & ASCII.LF & "b/s");
   end Scan_Binary_Data_Rate;

   function Parse_Memory_Bandwidth
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit
        (Text, "gb/s" & ASCII.LF & "mb/s" & ASCII.LF & "kb/s"
         & ASCII.LF & "b/s" & ASCII.LF & "mib/s" & ASCII.LF & "kib/s");
   end Parse_Memory_Bandwidth;

   function Scan_Memory_Bandwidth
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit
        (Text, "gb/s" & ASCII.LF & "mb/s" & ASCII.LF & "kb/s"
         & ASCII.LF & "b/s" & ASCII.LF & "mib/s" & ASCII.LF & "kib/s");
   end Scan_Memory_Bandwidth;

   function Parse_Latency
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit
        (Text, "us" & ASCII.LF & "ms" & ASCII.LF & "s");
   end Parse_Latency;

   function Scan_Latency
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit
        (Text, "us" & ASCII.LF & "ms" & ASCII.LF & "s");
   end Scan_Latency;

   function Parse_IOPS
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit
        (Text, "iops" & ASCII.LF & "k iops" & ASCII.LF & "m iops");
   end Parse_IOPS;

   function Scan_IOPS
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit
        (Text, "iops" & ASCII.LF & "k iops" & ASCII.LF & "m iops");
   end Scan_IOPS;

   function Parse_Density
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "kg/m3");
   end Parse_Density;

   function Scan_Density
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "kg/m3");
   end Scan_Density;

   function Parse_Acceleration
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "m/s2");
   end Parse_Acceleration;

   function Scan_Acceleration
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "m/s2");
   end Scan_Acceleration;

   function Parse_Torque
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "n m");
   end Parse_Torque;

   function Scan_Torque
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "n m");
   end Scan_Torque;

   function Parse_Fuel_Economy
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "l/100 km");
   end Parse_Fuel_Economy;

   function Scan_Fuel_Economy
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "l/100 km");
   end Scan_Fuel_Economy;

   function Parse_Flow_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit
        (Text, "ml/s" & ASCII.LF & "l/s");
   end Parse_Flow_Rate;

   function Scan_Flow_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit
        (Text, "ml/s" & ASCII.LF & "l/s");
   end Scan_Flow_Rate;

   function Parse_Electric_Current
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit
        (Text, "ma" & ASCII.LF & "a");
   end Parse_Electric_Current;

   function Scan_Electric_Current
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit
        (Text, "ma" & ASCII.LF & "a");
   end Scan_Electric_Current;

   function Parse_Voltage
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit
        (Text, "kv" & ASCII.LF & "v");
   end Parse_Voltage;

   function Scan_Voltage
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit
        (Text, "kv" & ASCII.LF & "v");
   end Scan_Voltage;

   function Parse_Pixel_Density
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "ppi");
   end Parse_Pixel_Density;

   function Scan_Pixel_Density
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "ppi");
   end Scan_Pixel_Density;

   function Parse_Electric_Resistance
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit
        (Text, "mohm" & ASCII.LF & "kohm" & ASCII.LF & "ohm");
   end Parse_Electric_Resistance;

   function Scan_Electric_Resistance
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit
        (Text, "mohm" & ASCII.LF & "kohm" & ASCII.LF & "ohm");
   end Scan_Electric_Resistance;

   function Parse_Electric_Capacitance
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit
        (Text, "nf" & ASCII.LF & "uf" & ASCII.LF & "f");
   end Parse_Electric_Capacitance;

   function Scan_Electric_Capacitance
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit
        (Text, "nf" & ASCII.LF & "uf" & ASCII.LF & "f");
   end Scan_Electric_Capacitance;

   function Parse_Electric_Inductance
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit
        (Text, "mh" & ASCII.LF & "h");
   end Parse_Electric_Inductance;

   function Scan_Electric_Inductance
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit
        (Text, "mh" & ASCII.LF & "h");
   end Scan_Electric_Inductance;

   function Parse_Concentration
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "mol/l");
   end Parse_Concentration;

   function Scan_Concentration
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "mol/l");
   end Scan_Concentration;

   function Parse_Fuel_Efficiency_MPG
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "mpg");
   end Parse_Fuel_Efficiency_MPG;

   function Scan_Fuel_Efficiency_MPG
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "mpg");
   end Scan_Fuel_Efficiency_MPG;

   function Parse_CPU_Load
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "% cpu");
   end Parse_CPU_Load;

   function Scan_CPU_Load
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "% cpu");
   end Scan_CPU_Load;

   function Parse_Battery
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "% battery");
   end Parse_Battery;

   function Scan_Battery
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "% battery");
   end Scan_Battery;

   function Parse_Screen_Size
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "in screen");
   end Parse_Screen_Size;

   function Scan_Screen_Size
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "in screen");
   end Scan_Screen_Size;

   function Parse_Typography_Size
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "pt");
   end Parse_Typography_Size;

   function Scan_Typography_Size
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "pt");
   end Scan_Typography_Size;

   function Parse_Audio_Level
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "db");
   end Parse_Audio_Level;

   function Scan_Audio_Level
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "db");
   end Scan_Audio_Level;

   function Parse_Signal_Strength
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "dbm");
   end Parse_Signal_Strength;

   function Scan_Signal_Strength
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "dbm");
   end Scan_Signal_Strength;

   function Parse_Storage_Endurance
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "tbw");
   end Parse_Storage_Endurance;

   function Scan_Storage_Endurance
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "tbw");
   end Scan_Storage_Endurance;

   function Parse_Refresh_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "hz refresh");
   end Parse_Refresh_Rate;

   function Scan_Refresh_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "hz refresh");
   end Scan_Refresh_Rate;

   function Parse_Luminance
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "nits");
   end Parse_Luminance;

   function Scan_Luminance
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "nits");
   end Scan_Luminance;

   function Parse_Print_Resolution
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Parse_Filtered_Compound_Unit (Text, "dpi");
   end Parse_Print_Resolution;

   function Scan_Print_Resolution
     (Text : String)
      return Compound_Unit_Parse_Result
   is
   begin
      return Scan_Filtered_Compound_Unit (Text, "dpi");
   end Scan_Print_Resolution;
end Humanize.Parsing.Implementation.Compound_Unit_Text_Helpers;
