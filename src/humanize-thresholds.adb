with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Thresholds is
   use type Humanize.Status.Status_Code;

   Max_Decimals : constant Natural := 9;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   function Digits_Image (Value : Long_Long_Integer) return String
      renames Humanize.Bounded_Text.Image;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Domain_Options
     (Options : Threshold_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Threshold_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Threshold_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Threshold_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Threshold_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Decimal_Scale (Decimals : Natural) return Long_Long_Integer is
      Result : Long_Long_Integer := 1;
   begin
      for I in 1 .. Decimals loop
         pragma Unreferenced (I);
         Result := Result * 10;
      end loop;
      return Result;
   end Decimal_Scale;

   function Fixed_Image
     (Value    : Long_Float;
      Decimals : Natural)
      return String
   is
      Places : constant Natural := Natural'Min (Decimals, Max_Decimals);
      Scale  : constant Long_Long_Integer := Decimal_Scale (Places);
      Abs_Value : constant Long_Float := abs Value;
      Rounded : constant Long_Long_Integer :=
        Long_Long_Integer (Long_Float'Rounding (Abs_Value * Long_Float (Scale)));
      Whole : constant Long_Long_Integer := Rounded / Scale;
      Frac  : constant Long_Long_Integer := Rounded mod Scale;
      Sign  : constant String := (if Value < 0.0 and then Rounded /= 0 then "-" else "");
   begin
      if Places = 0 then
         return Sign & Digits_Image (Whole);
      end if;

      declare
         Frac_Text : constant String := Digits_Image (Frac);
         Padding   : constant Natural := Places - Frac_Text'Length;
         Zeroes    : constant String (1 .. Padding) := [others => '0'];
      begin
         return Sign & Digits_Image (Whole) & "." & Zeroes & Frac_Text;
      end;
   end Fixed_Image;

   function Clean (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Value_Text
     (Value    : Long_Float;
      Unit     : String;
      Decimals : Natural)
      return String
   is
      Clean_Unit : constant String := Clean (Unit);
   begin
      if Clean_Unit'Length = 0 then
         return Fixed_Image (Value, Decimals);
      else
         return Fixed_Image (Value, Decimals) & " " & Clean_Unit;
      end if;
   end Value_Text;

   function State_Text (State : Threshold_State) return String is
   begin
      case State is
         when Below_Range => return "below expected range";
         when Within_Range => return "within expected range";
         when Above_Range => return "above expected range";
         when Below_Target => return "below target";
         when At_Target => return "at target";
         when Above_Target => return "above target";
         when Near_Limit => return "near limit";
         when Warning_Level => return "warning threshold";
         when Critical_Level => return "critical threshold";
         when Breached => return "breached";
         when Unknown_State => return "unknown threshold state";
      end case;
   end State_Text;

   function Threshold_State_Suffix (State : Threshold_State) return String is
   begin
      return State_Text (State);
   end Threshold_State_Suffix;

   function Threshold_State_Label
     (State : Threshold_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Threshold_State_Suffix (State));
   end Threshold_State_Label;

   function Threshold_State_Metadata
     (State : Threshold_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Thresholds_Surface,
         Threshold_State_Suffix (State));
   end Threshold_State_Metadata;

   function Threshold_State_Label
     (State   : Threshold_State;
      Options : Threshold_Label_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Domain_Details.Domain_Label
        (Threshold_State_Suffix (State), Threshold_State_Metadata (State),
         Domain_Options (Options));
   end Threshold_State_Label;

   function Parse_Threshold_Value_Label
     (Text  : String;
      State : Threshold_State)
      return Threshold_Label_Parse_Result
   is
      Result : Threshold_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Thresholds_Surface,
         Threshold_State_Suffix (State));
      Result.Metadata := Threshold_State_Metadata (State);
      return Result;
   end Parse_Threshold_Value_Label;

   function Scan_Threshold_Value_Label
     (Text  : String;
      State : Threshold_State)
      return Threshold_Label_Parse_Result
   is
      Result : Threshold_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Thresholds_Surface,
         Threshold_State_Suffix (State));
      Result.Metadata := Threshold_State_Metadata (State);
      return Result;
   end Scan_Threshold_Value_Label;

   function Threshold_Direction_Label
     (Direction : Threshold_Direction)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Direction is
            when Upper_Limit => "upper limit",
            when Lower_Limit => "lower limit");
   end Threshold_Direction_Label;

   function Metric_Value_Label
     (Name     : String;
      Value    : Long_Float;
      Unit     : String := "";
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Metric : constant String := Clean (Name);
   begin
      if Metric'Length = 0 then
         return Invalid_Text ("invalid metric name");
      end if;

      return Ok_Text (Metric & " " & Value_Text (Value, Unit, Decimals));
   end Metric_Value_Label;

   function Range_Label
     (Low      : Long_Float;
      High     : Long_Float;
      Unit     : String := "";
      Decimals : Natural := 0;
      Inclusive : Window_Inclusivity := Inclusive_Window)
      return Humanize.Status.Text_Result
   is
      Prefix : constant String := (if Inclusive = Inclusive_Window then "target range " else "target window ");
   begin
      if Low > High then
         return Invalid_Text ("invalid range");
      end if;

      return Ok_Text
        (Prefix & Value_Text (Low, Unit, Decimals)
         & " to " & Value_Text (High, Unit, Decimals));
   end Range_Label;

   function Window_Status_Label
     (Value    : Long_Float;
      Low      : Long_Float;
      High     : Long_Float;
      Unit     : String := "";
      Decimals : Natural := 0;
      Inclusive : Window_Inclusivity := Inclusive_Window)
      return Humanize.Status.Text_Result
   is
      Inside : Boolean;
   begin
      if Low > High then
         return Invalid_Text ("invalid range");
      end if;

      Inside :=
        (if Inclusive = Inclusive_Window then
            Value >= Low and then Value <= High
         else
            Value > Low and then Value < High);

      if Inside then
         return Ok_Text (Value_Text (Value, Unit, Decimals) & " within expected range");
      elsif Value < Low then
         return Ok_Text (Value_Text (Value, Unit, Decimals) & " below expected range");
      else
         return Ok_Text (Value_Text (Value, Unit, Decimals) & " above expected range");
      end if;
   end Window_Status_Label;

   function Window_Status_Label
     (Value     : Long_Float;
      Low       : Long_Float;
      High      : Long_Float;
      Options   : Threshold_Label_Options;
      Unit      : String := "";
      Decimals  : Natural := 0;
      Inclusive : Window_Inclusivity := Inclusive_Window)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Window_Status_Label (Value, Low, High, Unit, Decimals, Inclusive);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base,
         Humanize.Domain_Details.State_Metadata
           (Humanize.Domain_Details.Thresholds_Surface, Result_Text (Base)),
         Domain_Options (Options));
   end Window_Status_Label;

   function Threshold_Status_Label
     (Value     : Long_Float;
      Warning   : Long_Float;
      Critical  : Long_Float;
      Direction : Threshold_Direction := Upper_Limit;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Invalid_Order : constant Boolean :=
        (Direction = Upper_Limit and then Warning > Critical)
        or else (Direction = Lower_Limit and then Warning < Critical);
   begin
      if Invalid_Order then
         return Invalid_Text ("invalid thresholds");
      end if;

      case Direction is
         when Upper_Limit =>
            if Value >= Critical then
               return Ok_Text (Value_Text (Value, Unit, Decimals) & " at critical threshold");
            elsif Value >= Warning then
               return Ok_Text (Value_Text (Value, Unit, Decimals) & " at warning threshold");
            else
               return Ok_Text (Value_Text (Value, Unit, Decimals) & " within normal range");
            end if;
         when Lower_Limit =>
            if Value <= Critical then
               return Ok_Text (Value_Text (Value, Unit, Decimals) & " at critical threshold");
            elsif Value <= Warning then
               return Ok_Text (Value_Text (Value, Unit, Decimals) & " at warning threshold");
            else
               return Ok_Text (Value_Text (Value, Unit, Decimals) & " within normal range");
            end if;
      end case;
   end Threshold_Status_Label;

   function Threshold_Status_Label
     (Value     : Long_Float;
      Warning   : Long_Float;
      Critical  : Long_Float;
      Options   : Threshold_Label_Options;
      Direction : Threshold_Direction := Upper_Limit;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Threshold_Status_Label
          (Value, Warning, Critical, Direction, Unit, Decimals);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base,
         Humanize.Domain_Details.State_Metadata
           (Humanize.Domain_Details.Thresholds_Surface, Result_Text (Base)),
         Domain_Options (Options));
   end Threshold_Status_Label;

   function Breach_Label
     (Value     : Long_Float;
      Limit     : Long_Float;
      Direction : Threshold_Direction := Upper_Limit;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Difference : constant Long_Float :=
        (if Direction = Upper_Limit then Value - Limit else Limit - Value);
   begin
      if Difference <= 0.0 then
         return Ok_Text ("not breached");
      end if;

      return Ok_Text ("breached by " & Value_Text (Difference, Unit, Decimals));
   end Breach_Label;

   function Target_Delta_Label
     (Value    : Long_Float;
      Target   : Long_Float;
      Unit     : String := "";
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Difference : constant Long_Float := Value - Target;
   begin
      if Difference = 0.0 then
         return Ok_Text ("at target");
      elsif Difference < 0.0 then
         return Ok_Text (Value_Text (-Difference, Unit, Decimals) & " below target");
      else
         return Ok_Text (Value_Text (Difference, Unit, Decimals) & " above target");
      end if;
   end Target_Delta_Label;

   function Near_Limit_Label
     (Value     : Long_Float;
      Limit     : Long_Float;
      Margin    : Long_Float;
      Direction : Threshold_Direction := Upper_Limit;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Distance : constant Long_Float :=
        (if Direction = Upper_Limit then Limit - Value else Value - Limit);
   begin
      if Margin < 0.0 then
         return Invalid_Text ("invalid margin");
      elsif Distance < 0.0 then
         return Ok_Text ("limit breached");
      elsif Distance <= Margin then
         return Ok_Text ("near limit, " & Value_Text (Distance, Unit, Decimals) & " remaining");
      else
         return Ok_Text (Value_Text (Distance, Unit, Decimals) & " from limit");
      end if;
   end Near_Limit_Label;

   function Threshold_Summary_Label
     (Normal   : Natural := 0;
      Warnings : Natural := 0;
      Critical : Natural := 0;
      Breaches : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String;
   begin
      if Normal = 0 and then Warnings = 0 and then Critical = 0 and then Breaches = 0 then
         return Ok_Text ("no metrics");
      end if;

      if Normal > 0 then
         Append (Text, Count_Text (Normal, "normal", "normal"));
      end if;
      if Warnings > 0 then
         if Length (Text) > 0 then
            Append (Text, ", ");
         end if;
         Append (Text, Count_Text (Warnings, "warning", "warnings"));
      end if;
      if Critical > 0 then
         if Length (Text) > 0 then
            Append (Text, ", ");
         end if;
         Append (Text, Count_Text (Critical, "critical", "critical"));
      end if;
      if Breaches > 0 then
         if Length (Text) > 0 then
            Append (Text, ", ");
         end if;
         Append (Text, Count_Text (Breaches, "breach", "breaches"));
      end if;
      return Ok_Text (To_String (Text));
   end Threshold_Summary_Label;

   function Target_Window_Label
     (Target    : Long_Float;
      Tolerance : Long_Float;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      if Tolerance < 0.0 then
         return Invalid_Text ("invalid tolerance");
      end if;

      return Ok_Text
        ("target " & Value_Text (Target, Unit, Decimals)
         & " plus/minus " & Value_Text (Tolerance, Unit, Decimals));
   end Target_Window_Label;

   function Tolerance_Label
     (Tolerance : Long_Float;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      if Tolerance < 0.0 then
         return Invalid_Text ("invalid tolerance");
      end if;

      return Ok_Text ("tolerance " & Value_Text (Tolerance, Unit, Decimals));
   end Tolerance_Label;

   function Percent_Of_Limit_Label
     (Value    : Long_Float;
      Limit    : Long_Float;
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      if Limit = 0.0 then
         return Invalid_Text ("invalid limit");
      end if;

      return Ok_Text
        (Fixed_Image ((Value / Limit) * 100.0, Decimals) & "% of limit");
   end Percent_Of_Limit_Label;

   function Remaining_To_Limit_Label
     (Value     : Long_Float;
      Limit     : Long_Float;
      Direction : Threshold_Direction := Upper_Limit;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Remaining : constant Long_Float :=
        (if Direction = Upper_Limit then Limit - Value else Value - Limit);
   begin
      if Remaining < 0.0 then
         return Ok_Text ("limit exceeded by " & Value_Text (-Remaining, Unit, Decimals));
      else
         return Ok_Text (Value_Text (Remaining, Unit, Decimals) & " remaining");
      end if;
   end Remaining_To_Limit_Label;

   function Budget_Used_Label
     (Used     : Long_Float;
      Budget   : Long_Float;
      Unit     : String := "";
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      if Budget < 0.0 or else Used < 0.0 then
         return Invalid_Text ("invalid budget");
      end if;

      return Ok_Text
        (Value_Text (Used, Unit, Decimals) & " used of "
         & Value_Text (Budget, Unit, Decimals));
   end Budget_Used_Label;

   procedure Window_Status_Label_Into
     (Value     : Long_Float;
      Low       : Long_Float;
      High      : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Unit      : String := "";
      Decimals  : Natural := 0;
      Inclusive : Window_Inclusivity := Inclusive_Window)
   is
      Result : constant Humanize.Status.Text_Result :=
        Window_Status_Label (Value, Low, High, Unit, Decimals, Inclusive);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Window_Status_Label_Into;

   procedure Window_Status_Label_Into
     (Value     : Long_Float;
      Low       : Long_Float;
      High      : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Threshold_Label_Options;
      Unit      : String := "";
      Decimals  : Natural := 0;
      Inclusive : Window_Inclusivity := Inclusive_Window)
   is
   begin
      Copy_Result
        (Window_Status_Label
           (Value, Low, High, Options, Unit, Decimals, Inclusive),
         Target, Written, Status);
   end Window_Status_Label_Into;

   procedure Threshold_Status_Label_Into
     (Value     : Long_Float;
      Warning   : Long_Float;
      Critical  : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Direction : Threshold_Direction := Upper_Limit;
      Unit      : String := "";
      Decimals  : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result :=
        Threshold_Status_Label (Value, Warning, Critical, Direction, Unit, Decimals);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Threshold_Status_Label_Into;

   procedure Threshold_Status_Label_Into
     (Value     : Long_Float;
      Warning   : Long_Float;
      Critical  : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Threshold_Label_Options;
      Direction : Threshold_Direction := Upper_Limit;
      Unit      : String := "";
      Decimals  : Natural := 0)
   is
   begin
      Copy_Result
        (Threshold_Status_Label
           (Value, Warning, Critical, Options, Direction, Unit, Decimals),
         Target, Written, Status);
   end Threshold_Status_Label_Into;

   procedure Threshold_Summary_Label_Into
     (Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Normal   : Natural := 0;
      Warnings : Natural := 0;
      Critical : Natural := 0;
      Breaches : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result :=
        Threshold_Summary_Label (Normal, Warnings, Critical, Breaches);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Threshold_Summary_Label_Into;

end Humanize.Thresholds;
