with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for metric ranges, windows, and threshold states.
package Humanize.Thresholds is
   type Threshold_Output_Mode is
     (Threshold_Detailed,
      Threshold_Compact,
      Threshold_Accessible,
      Threshold_Log);

   type Threshold_Label_Options is record
      Mode             : Threshold_Output_Mode := Threshold_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;

   Default_Threshold_Label_Options : constant Threshold_Label_Options :=
     (Mode             => Threshold_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Threshold_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Threshold_Direction is
     (Upper_Limit,
      Lower_Limit);
   --  Whether high values or low values breach a limit.

   type Threshold_State is
     (Below_Range,
      Within_Range,
      Above_Range,
      Below_Target,
      At_Target,
      Above_Target,
      Near_Limit,
      Warning_Level,
      Critical_Level,
      Breached,
      Unknown_State);
   --  Caller-visible threshold/range state.

   type Window_Inclusivity is
     (Inclusive_Window,
      Exclusive_Window);
   --  Whether range endpoints are part of the expected window.

   function Threshold_State_Label
     (State : Threshold_State)
      return Humanize.Status.Text_Result;
   --  @param State Threshold/range state.
   --  @return Human-readable state label.

   function Threshold_State_Label
     (State   : Threshold_State;
      Options : Threshold_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param State Threshold/range state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable state label with optional metadata.

   function Threshold_Direction_Label
     (Direction : Threshold_Direction)
      return Humanize.Status.Text_Result;
   --  @param Direction Threshold direction.
   --  @return Human-readable direction label.

   function Metric_Value_Label
     (Name     : String;
      Value    : Long_Float;
      Unit     : String := "";
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Name Metric name.
   --  @param Value Metric value.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @return Human-readable metric value label.

   function Range_Label
     (Low      : Long_Float;
      High     : Long_Float;
      Unit     : String := "";
      Decimals : Natural := 0;
      Inclusive : Window_Inclusivity := Inclusive_Window)
      return Humanize.Status.Text_Result;
   --  @param Low Lower range boundary.
   --  @param High Upper range boundary.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @param Inclusive Whether endpoints are included.
   --  @return Human-readable target range label.

   function Window_Status_Label
     (Value    : Long_Float;
      Low      : Long_Float;
      High     : Long_Float;
      Unit     : String := "";
      Decimals : Natural := 0;
      Inclusive : Window_Inclusivity := Inclusive_Window)
      return Humanize.Status.Text_Result;
   --  @param Value Metric value.
   --  @param Low Lower range boundary.
   --  @param High Upper range boundary.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @param Inclusive Whether endpoints are included.
   --  @return Human-readable in/out-of-window label.

   function Window_Status_Label
     (Value     : Long_Float;
      Low       : Long_Float;
      High      : Long_Float;
      Options   : Threshold_Label_Options;
      Unit      : String := "";
      Decimals  : Natural := 0;
      Inclusive : Window_Inclusivity := Inclusive_Window)
      return Humanize.Status.Text_Result;
   --  @param Value Metric value.
   --  @param Low Lower range boundary.
   --  @param High Upper range boundary.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @param Inclusive Whether endpoints are included.
   --  @return Human-readable in/out-of-window label with optional metadata.

   function Threshold_Status_Label
     (Value     : Long_Float;
      Warning   : Long_Float;
      Critical  : Long_Float;
      Direction : Threshold_Direction := Upper_Limit;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Value Metric value.
   --  @param Warning Warning threshold.
   --  @param Critical Critical threshold.
   --  @param Direction Whether high or low values are worse.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @return Human-readable warning/critical threshold state.

   function Threshold_Status_Label
     (Value     : Long_Float;
      Warning   : Long_Float;
      Critical  : Long_Float;
      Options   : Threshold_Label_Options;
      Direction : Threshold_Direction := Upper_Limit;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Value Metric value.
   --  @param Warning Warning threshold.
   --  @param Critical Critical threshold.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Direction Whether high or low values are worse.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @return Human-readable warning/critical threshold state with metadata.

   function Threshold_State_Metadata
     (State : Threshold_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Threshold/range state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Parse_Threshold_Value_Label
     (Text  : String;
      State : Threshold_State)
      return Threshold_Label_Parse_Result;
   --  @param Text Label in rendered value-plus-threshold-state form.
   --  @param State Expected threshold state suffix.
   --  @return Parsed value span, state span, metadata, and consumed length.

   function Scan_Threshold_Value_Label
     (Text  : String;
      State : Threshold_State)
      return Threshold_Label_Parse_Result;
   --  @param Text Text beginning with a value-plus-threshold-state label.
   --  @param State Expected threshold state suffix.
   --  @return Parsed threshold-value prefix and consumed length.

   function Breach_Label
     (Value     : Long_Float;
      Limit     : Long_Float;
      Direction : Threshold_Direction := Upper_Limit;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Value Metric value.
   --  @param Limit Breach limit.
   --  @param Direction Whether high or low values breach the limit.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @return Human-readable breach amount label.

   function Target_Delta_Label
     (Value    : Long_Float;
      Target   : Long_Float;
      Unit     : String := "";
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Value Metric value.
   --  @param Target Target value.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @return Human-readable target delta label.

   function Near_Limit_Label
     (Value     : Long_Float;
      Limit     : Long_Float;
      Margin    : Long_Float;
      Direction : Threshold_Direction := Upper_Limit;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Value Metric value.
   --  @param Limit Limit value.
   --  @param Margin Distance from limit considered near.
   --  @param Direction Whether high or low values approach the limit.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @return Human-readable near-limit or clear label.

   function Threshold_Summary_Label
     (Normal   : Natural := 0;
      Warnings : Natural := 0;
      Critical : Natural := 0;
      Breaches : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Normal Count of normal metrics.
   --  @param Warnings Count of warning metrics.
   --  @param Critical Count of critical metrics.
   --  @param Breaches Count of breached metrics.
   --  @return Compact threshold-state summary.

   function Target_Window_Label
     (Target    : Long_Float;
      Tolerance : Long_Float;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Target Target value.
   --  @param Tolerance Allowed plus/minus tolerance.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @return Human-readable target window label.

   function Tolerance_Label
     (Tolerance : Long_Float;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Tolerance Tolerance value.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @return Human-readable tolerance label.

   function Percent_Of_Limit_Label
     (Value    : Long_Float;
      Limit    : Long_Float;
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Value Metric value.
   --  @param Limit Limit value.
   --  @param Decimals Decimal places to render.
   --  @return Human-readable percentage-of-limit label.

   function Remaining_To_Limit_Label
     (Value     : Long_Float;
      Limit     : Long_Float;
      Direction : Threshold_Direction := Upper_Limit;
      Unit      : String := "";
      Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Value Metric value.
   --  @param Limit Limit value.
   --  @param Direction Whether high or low values approach the limit.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @return Human-readable remaining-to-limit label.

   function Budget_Used_Label
     (Used     : Long_Float;
      Budget   : Long_Float;
      Unit     : String := "";
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Used Used budget amount.
   --  @param Budget Total budget amount.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @return Human-readable budget-used label.

   procedure Window_Status_Label_Into
     (Value     : Long_Float;
      Low       : Long_Float;
      High      : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Unit      : String := "";
      Decimals  : Natural := 0;
      Inclusive : Window_Inclusivity := Inclusive_Window);
   --  @param Value Metric value.
   --  @param Low Lower range boundary.
   --  @param High Upper range boundary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @param Inclusive Whether endpoints are included.

   procedure Threshold_Status_Label_Into
     (Value     : Long_Float;
      Warning   : Long_Float;
      Critical  : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Direction : Threshold_Direction := Upper_Limit;
      Unit      : String := "";
      Decimals  : Natural := 0);
   --  @param Value Metric value.
   --  @param Warning Warning threshold.
   --  @param Critical Critical threshold.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Direction Whether high or low values are worse.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.

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
      Inclusive : Window_Inclusivity := Inclusive_Window);
   --  @param Value Metric value.
   --  @param Low Lower range boundary.
   --  @param High Upper range boundary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.
   --  @param Inclusive Whether endpoints are included.

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
      Decimals  : Natural := 0);
   --  @param Value Metric value.
   --  @param Warning Warning threshold.
   --  @param Critical Critical threshold.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Direction Whether high or low values are worse.
   --  @param Unit Optional unit suffix.
   --  @param Decimals Decimal places to render.

   procedure Threshold_Summary_Label_Into
     (Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Normal   : Natural := 0;
      Warnings : Natural := 0;
      Critical : Natural := 0;
      Breaches : Natural := 0);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Normal Count of normal metrics.
   --  @param Warnings Count of warning metrics.
   --  @param Critical Count of critical metrics.
   --  @param Breaches Count of breached metrics.

end Humanize.Thresholds;
