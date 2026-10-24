with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Thresholds.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Breach_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Limit     : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Breach_Label
          (Value => Value,
           Limit => Limit,
           Direction => Direction,
           Unit => Unit,
           Decimals => Decimals);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.breach_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if (if Direction = Upper_Limit then Value - Limit else Limit -
        Value) <= 0.0 then "ok" else "breached"));
      Selection := Sel.With_Arg (Selection, "difference", Humanize.Label_Values.Fixed_With_Unit (Context, (if
        Direction = Upper_Limit then Value - Limit else Limit - Value), Unit, Decimals));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Breach_Label;

   function Budget_Used_Label
      (Context  : Humanize.Contexts.Context;
       Used     : Long_Float;
       Budget   : Long_Float;
       Unit     : String := "";
       Decimals : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Budget_Used_Label (Used => Used, Budget => Budget, Unit => Unit, Decimals => Decimals);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.budget_used_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "used", Humanize.Label_Values.Fixed_With_Unit (Context, Used, Unit,
        Decimals));
      Selection := Sel.With_Arg (Selection, "budget", Humanize.Label_Values.Fixed_With_Unit (Context, Budget, Unit,
        Decimals));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Budget_Used_Label;

   function Metric_Value_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Value    : Long_Float;
       Unit     : String := "";
       Decimals : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Metric_Value_Label (Name => Name, Value => Value, Unit => Unit, Decimals => Decimals);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.metric_value_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "value", Humanize.Label_Values.Fixed_With_Unit (Context, Value, Unit,
        Decimals));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Metric_Value_Label;

   function Near_Limit_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Limit     : Long_Float;
       Margin    : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Near_Limit_Label
          (Value => Value,
           Limit => Limit,
           Margin => Margin,
           Direction => Direction,
           Unit => Unit,
           Decimals => Decimals);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.near_limit_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if (if Direction = Upper_Limit then Limit - Value else Value -
        Limit) < 0.0 then "breached" elsif (if Direction = Upper_Limit then Limit - Value else Value - Limit) <=
        Margin then "near" else "far"));
      Selection := Sel.With_Arg (Selection, "distance", Humanize.Label_Values.Fixed_With_Unit (Context, (if Direction
        = Upper_Limit then Limit - Value else Value - Limit), Unit, Decimals));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Near_Limit_Label;

   function Percent_Of_Limit_Label
      (Context  : Humanize.Contexts.Context;
       Value    : Long_Float;
       Limit    : Long_Float;
       Decimals : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Percent_Of_Limit_Label (Value => Value, Limit => Limit, Decimals => Decimals);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.percent_of_limit_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "percent", Humanize.Label_Values.Percent (Context, (Value / Limit) *
        100.0, Decimals));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Percent_Of_Limit_Label;

   function Range_Label
      (Context   : Humanize.Contexts.Context;
       Low       : Long_Float;
       High      : Long_Float;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Inclusive : Window_Inclusivity := Inclusive_Window)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Range_Label
          (Low => Low,
           High => High,
           Unit => Unit,
           Decimals => Decimals,
           Inclusive => Inclusive);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.range_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "inclusive", Lower (Window_Inclusivity'Image (Inclusive)));
      Selection := Sel.With_Arg (Selection, "low", Humanize.Label_Values.Fixed_With_Unit (Context, Low, Unit,
        Decimals));
      Selection := Sel.With_Arg (Selection, "high", Humanize.Label_Values.Fixed_With_Unit (Context, High, Unit,
        Decimals));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Range_Label;

   function Remaining_To_Limit_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Limit     : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Remaining_To_Limit_Label
          (Value => Value,
           Limit => Limit,
           Direction => Direction,
           Unit => Unit,
           Decimals => Decimals);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.remaining_to_limit_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if (if Direction = Upper_Limit then Limit - Value else Value -
        Limit) < 0.0 then "exceeded" else "left"));
      Selection := Sel.With_Arg (Selection, "amount", Humanize.Label_Values.Fixed_With_Unit (Context, abs (if
        Direction = Upper_Limit then Limit - Value else Value - Limit), Unit, Decimals));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Remaining_To_Limit_Label;

   function Target_Delta_Label
      (Context  : Humanize.Contexts.Context;
       Value    : Long_Float;
       Target   : Long_Float;
       Unit     : String := "";
       Decimals : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Target_Delta_Label (Value => Value, Target => Target, Unit => Unit, Decimals => Decimals);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.target_delta_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if Value = Target then "at" elsif Value < Target then "below"
        else "above"));
      Selection := Sel.With_Arg (Selection, "difference", Humanize.Label_Values.Fixed_With_Unit (Context, abs (Value -
        Target), Unit, Decimals));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Target_Delta_Label;

   function Target_Window_Label
      (Context   : Humanize.Contexts.Context;
       Target    : Long_Float;
       Tolerance : Long_Float;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Target_Window_Label
          (Target => Target,
           Tolerance => Tolerance,
           Unit => Unit,
           Decimals => Decimals);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.target_window_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "target", Humanize.Label_Values.Fixed_With_Unit (Context, Target, Unit,
        Decimals));
      Selection := Sel.With_Arg (Selection, "tolerance", Humanize.Label_Values.Fixed_With_Unit (Context, Tolerance,
        Unit, Decimals));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Target_Window_Label;

   function Threshold_Direction_Label
      (Context   : Humanize.Contexts.Context;
       Direction : Threshold_Direction)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Threshold_Direction_Label (Direction => Direction);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.threshold_direction_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "direction", Lower (Threshold_Direction'Image (Direction)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Threshold_Direction_Label;

   function Threshold_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Threshold_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Threshold_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.threshold_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Threshold_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Threshold_State_Label;

   function Threshold_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Threshold_State;
       Options : Threshold_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Threshold_State_Label (State => State, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Thresholds.Threshold_State_Label (State => State);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Threshold_State_Label (Context, State =>
        State));
   end Threshold_State_Label;

   function Threshold_Status_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Warning   : Long_Float;
       Critical  : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Threshold_Status_Label
          (Value => Value,
           Warning => Warning,
           Critical => Critical,
           Direction => Direction,
           Unit => Unit,
           Decimals => Decimals);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.threshold_status_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if (if Direction = Upper_Limit then Value >= Critical else Value
        <= Critical) then "critical" elsif (if Direction = Upper_Limit then Value >= Warning else Value <= Warning)
        then "warning" else "normal"));
      Selection := Sel.With_Arg (Selection, "value", Humanize.Label_Values.Fixed_With_Unit (Context, Value, Unit,
        Decimals));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Threshold_Status_Label;

   function Threshold_Status_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Warning   : Long_Float;
       Critical  : Long_Float;
       Options   : Threshold_Label_Options;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Threshold_Status_Label
          (Value => Value,
           Warning => Warning,
           Critical => Critical,
           Options => Options,
           Direction => Direction,
           Unit => Unit,
           Decimals => Decimals);
      Plain_English : constant Humanize.Status.Text_Result :=
        Thresholds.Threshold_Status_Label
          (Value => Value,
           Warning => Warning,
           Critical => Critical,
           Direction => Direction,
           Unit => Unit,
           Decimals => Decimals);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Threshold_Status_Label (Context, Value => Value,
        Warning => Warning, Critical => Critical, Direction => Direction, Unit => Unit, Decimals => Decimals));
   end Threshold_Status_Label;

   function Threshold_Summary_Label
      (Context  : Humanize.Contexts.Context;
       Normal   : Natural := 0;
       Warnings : Natural := 0;
       Critical : Natural := 0;
       Breaches : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Threshold_Summary_Label
          (Normal => Normal,
           Warnings => Warnings,
           Critical => Critical,
           Breaches => Breaches);
      Text : Humanize.Status.Text_Result := Humanize.Label_Values.Nothing;
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      if Normal = 0 and then Warnings = 0 and then Critical = 0 and then Breaches = 0 then
         return Humanize.I18N_Rendering.Phrase_Or
           (Context, Sel.Phrase ("label.thresholds.threshold_summary_label.none"), English);
      end if;
      if Normal > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.thresholds.threshold_summary_label.normal", Long_Long_Integer (Normal)));
      end if;
      if Warnings > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.thresholds.threshold_summary_label.warnings", Long_Long_Integer (Warnings)));
      end if;
      if Critical > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.thresholds.threshold_summary_label.critical", Long_Long_Integer (Critical)));
      end if;
      if Breaches > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.thresholds.threshold_summary_label.breaches", Long_Long_Integer (Breaches)));
      end if;
      return Humanize.Label_Values.Localized_Or (Context, Text, English);
   end Threshold_Summary_Label;

   function Tolerance_Label
      (Context   : Humanize.Contexts.Context;
       Tolerance : Long_Float;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Tolerance_Label (Tolerance => Tolerance, Unit => Unit, Decimals => Decimals);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.tolerance_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "tolerance", Humanize.Label_Values.Fixed_With_Unit (Context, Tolerance,
        Unit, Decimals));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Tolerance_Label;

   function Window_Status_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Low       : Long_Float;
       High      : Long_Float;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Inclusive : Window_Inclusivity := Inclusive_Window)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Window_Status_Label
          (Value => Value,
           Low => Low,
           High => High,
           Unit => Unit,
           Decimals => Decimals,
           Inclusive => Inclusive);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.thresholds.window_status_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if (if Inclusive = Inclusive_Window then Value >= Low and then
        Value <= High else Value > Low and then Value < High) then "inside" elsif Value < Low then "below" else
        "above"));
      Selection := Sel.With_Arg (Selection, "value", Humanize.Label_Values.Fixed_With_Unit (Context, Value, Unit,
        Decimals));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Window_Status_Label;

   function Window_Status_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Low       : Long_Float;
       High      : Long_Float;
       Options   : Threshold_Label_Options;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Inclusive : Window_Inclusivity := Inclusive_Window)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Thresholds.Window_Status_Label
          (Value => Value,
           Low => Low,
           High => High,
           Options => Options,
           Unit => Unit,
           Decimals => Decimals,
           Inclusive => Inclusive);
      Plain_English : constant Humanize.Status.Text_Result :=
        Thresholds.Window_Status_Label
          (Value => Value,
           Low => Low,
           High => High,
           Unit => Unit,
           Decimals => Decimals,
           Inclusive => Inclusive);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Window_Status_Label (Context, Value => Value,
        Low => Low, High => High, Unit => Unit, Decimals => Decimals, Inclusive => Inclusive));
   end Window_Status_Label;

   procedure Breach_Label_Into
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Limit     : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Breach_Label (Context, Value => Value, Limit => Limit, Direction => Direction, Unit => Unit, Decimals =>
         Decimals),
         Target, Written, Status);
   end Breach_Label_Into;

   procedure Budget_Used_Label_Into
      (Context  : Humanize.Contexts.Context;
       Used     : Long_Float;
       Budget   : Long_Float;
       Unit     : String := "";
       Decimals : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Budget_Used_Label (Context, Used => Used, Budget => Budget, Unit => Unit, Decimals => Decimals),
         Target, Written, Status);
   end Budget_Used_Label_Into;

   procedure Metric_Value_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Value    : Long_Float;
       Unit     : String := "";
       Decimals : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Metric_Value_Label (Context, Name => Name, Value => Value, Unit => Unit, Decimals => Decimals),
         Target, Written, Status);
   end Metric_Value_Label_Into;

   procedure Near_Limit_Label_Into
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Limit     : Long_Float;
       Margin    : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Near_Limit_Label (Context, Value => Value, Limit => Limit, Margin => Margin, Direction => Direction, Unit =>
         Unit, Decimals => Decimals),
         Target, Written, Status);
   end Near_Limit_Label_Into;

   procedure Percent_Of_Limit_Label_Into
      (Context  : Humanize.Contexts.Context;
       Value    : Long_Float;
       Limit    : Long_Float;
       Decimals : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Percent_Of_Limit_Label (Context, Value => Value, Limit => Limit, Decimals => Decimals),
         Target, Written, Status);
   end Percent_Of_Limit_Label_Into;

   procedure Range_Label_Into
      (Context   : Humanize.Contexts.Context;
       Low       : Long_Float;
       High      : Long_Float;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Inclusive : Window_Inclusivity := Inclusive_Window;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Range_Label (Context, Low => Low, High => High, Unit => Unit, Decimals => Decimals, Inclusive => Inclusive),
         Target, Written, Status);
   end Range_Label_Into;

   procedure Remaining_To_Limit_Label_Into
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Limit     : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Remaining_To_Limit_Label (Context, Value => Value, Limit => Limit, Direction => Direction, Unit => Unit,
         Decimals => Decimals),
         Target, Written, Status);
   end Remaining_To_Limit_Label_Into;

   procedure Threshold_Direction_Label_Into
      (Context   : Humanize.Contexts.Context;
       Direction : Threshold_Direction;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Threshold_Direction_Label (Context, Direction => Direction),
         Target, Written, Status);
   end Threshold_Direction_Label_Into;

   procedure Threshold_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Threshold_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Threshold_State_Label (Context, State => State), Target, Written, Status);
   end Threshold_State_Label_Into;

   procedure Threshold_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Threshold_State;
       Options : Threshold_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Threshold_State_Label (Context, State => State, Options => Options),
         Target, Written, Status);
   end Threshold_State_Label_Into;

   procedure Threshold_Status_Label_Into
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Warning   : Long_Float;
       Critical  : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Threshold_Status_Label (Context, Value => Value, Warning => Warning, Critical => Critical, Direction =>
         Direction, Unit => Unit, Decimals => Decimals),
         Target, Written, Status);
   end Threshold_Status_Label_Into;

   procedure Threshold_Status_Label_Into
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Warning   : Long_Float;
       Critical  : Long_Float;
       Options   : Threshold_Label_Options;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Threshold_Status_Label (Context, Value => Value, Warning => Warning, Critical => Critical, Options =>
         Options, Direction => Direction, Unit => Unit, Decimals => Decimals),
         Target, Written, Status);
   end Threshold_Status_Label_Into;

   procedure Threshold_Summary_Label_Into
      (Context  : Humanize.Contexts.Context;
       Normal   : Natural := 0;
       Warnings : Natural := 0;
       Critical : Natural := 0;
       Breaches : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Threshold_Summary_Label (Context, Normal => Normal, Warnings => Warnings, Critical => Critical, Breaches =>
         Breaches),
         Target, Written, Status);
   end Threshold_Summary_Label_Into;

   procedure Tolerance_Label_Into
      (Context   : Humanize.Contexts.Context;
       Tolerance : Long_Float;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Tolerance_Label (Context, Tolerance => Tolerance, Unit => Unit, Decimals => Decimals),
         Target, Written, Status);
   end Tolerance_Label_Into;

   procedure Window_Status_Label_Into
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Low       : Long_Float;
       High      : Long_Float;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Inclusive : Window_Inclusivity := Inclusive_Window;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Window_Status_Label (Context, Value => Value, Low => Low, High => High, Unit => Unit, Decimals => Decimals,
         Inclusive => Inclusive),
         Target, Written, Status);
   end Window_Status_Label_Into;

   procedure Window_Status_Label_Into
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Low       : Long_Float;
       High      : Long_Float;
       Options   : Threshold_Label_Options;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Inclusive : Window_Inclusivity := Inclusive_Window;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Window_Status_Label (Context, Value => Value, Low => Low, High => High, Options => Options, Unit => Unit,
         Decimals => Decimals, Inclusive => Inclusive),
         Target, Written, Status);
   end Window_Status_Label_Into;

end Humanize.Thresholds.Localized;
