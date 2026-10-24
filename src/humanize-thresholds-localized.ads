with Humanize.Contexts;

--  Thresholds labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Thresholds.Localized is

   function Breach_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Limit     : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value As for the parent's Breach_Label.
   --  @param Limit As for the parent's Breach_Label.
   --  @param Direction As for the parent's Breach_Label.
   --  @param Unit As for the parent's Breach_Label.
   --  @param Decimals As for the parent's Breach_Label.
   --  @return The label in Context's locale.

   function Budget_Used_Label
      (Context  : Humanize.Contexts.Context;
       Used     : Long_Float;
       Budget   : Long_Float;
       Unit     : String := "";
       Decimals : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Used As for the parent's Budget_Used_Label.
   --  @param Budget As for the parent's Budget_Used_Label.
   --  @param Unit As for the parent's Budget_Used_Label.
   --  @param Decimals As for the parent's Budget_Used_Label.
   --  @return The label in Context's locale.

   function Metric_Value_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Value    : Long_Float;
       Unit     : String := "";
       Decimals : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Metric_Value_Label.
   --  @param Value As for the parent's Metric_Value_Label.
   --  @param Unit As for the parent's Metric_Value_Label.
   --  @param Decimals As for the parent's Metric_Value_Label.
   --  @return The label in Context's locale.

   function Near_Limit_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Limit     : Long_Float;
       Margin    : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value As for the parent's Near_Limit_Label.
   --  @param Limit As for the parent's Near_Limit_Label.
   --  @param Margin As for the parent's Near_Limit_Label.
   --  @param Direction As for the parent's Near_Limit_Label.
   --  @param Unit As for the parent's Near_Limit_Label.
   --  @param Decimals As for the parent's Near_Limit_Label.
   --  @return The label in Context's locale.

   function Percent_Of_Limit_Label
      (Context  : Humanize.Contexts.Context;
       Value    : Long_Float;
       Limit    : Long_Float;
       Decimals : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value As for the parent's Percent_Of_Limit_Label.
   --  @param Limit As for the parent's Percent_Of_Limit_Label.
   --  @param Decimals As for the parent's Percent_Of_Limit_Label.
   --  @return The label in Context's locale.

   function Range_Label
      (Context   : Humanize.Contexts.Context;
       Low       : Long_Float;
       High      : Long_Float;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Inclusive : Window_Inclusivity := Inclusive_Window)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Low As for the parent's Range_Label.
   --  @param High As for the parent's Range_Label.
   --  @param Unit As for the parent's Range_Label.
   --  @param Decimals As for the parent's Range_Label.
   --  @param Inclusive As for the parent's Range_Label.
   --  @return The label in Context's locale.

   function Remaining_To_Limit_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Limit     : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value As for the parent's Remaining_To_Limit_Label.
   --  @param Limit As for the parent's Remaining_To_Limit_Label.
   --  @param Direction As for the parent's Remaining_To_Limit_Label.
   --  @param Unit As for the parent's Remaining_To_Limit_Label.
   --  @param Decimals As for the parent's Remaining_To_Limit_Label.
   --  @return The label in Context's locale.

   function Target_Delta_Label
      (Context  : Humanize.Contexts.Context;
       Value    : Long_Float;
       Target   : Long_Float;
       Unit     : String := "";
       Decimals : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value As for the parent's Target_Delta_Label.
   --  @param Target As for the parent's Target_Delta_Label.
   --  @param Unit As for the parent's Target_Delta_Label.
   --  @param Decimals As for the parent's Target_Delta_Label.
   --  @return The label in Context's locale.

   function Target_Window_Label
      (Context   : Humanize.Contexts.Context;
       Target    : Long_Float;
       Tolerance : Long_Float;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Target As for the parent's Target_Window_Label.
   --  @param Tolerance As for the parent's Target_Window_Label.
   --  @param Unit As for the parent's Target_Window_Label.
   --  @param Decimals As for the parent's Target_Window_Label.
   --  @return The label in Context's locale.

   function Threshold_Direction_Label
      (Context   : Humanize.Contexts.Context;
       Direction : Threshold_Direction)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Direction As for the parent's Threshold_Direction_Label.
   --  @return The label in Context's locale.

   function Threshold_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Threshold_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Threshold_State_Label.
   --  @return The label in Context's locale.

   function Threshold_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Threshold_State;
       Options : Threshold_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Threshold_State_Label.
   --  @param Options As for the parent's Threshold_State_Label.
   --  @return The label in Context's locale.

   function Threshold_Status_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Warning   : Long_Float;
       Critical  : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value As for the parent's Threshold_Status_Label.
   --  @param Warning As for the parent's Threshold_Status_Label.
   --  @param Critical As for the parent's Threshold_Status_Label.
   --  @param Direction As for the parent's Threshold_Status_Label.
   --  @param Unit As for the parent's Threshold_Status_Label.
   --  @param Decimals As for the parent's Threshold_Status_Label.
   --  @return The label in Context's locale.

   function Threshold_Status_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Warning   : Long_Float;
       Critical  : Long_Float;
       Options   : Threshold_Label_Options;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value As for the parent's Threshold_Status_Label.
   --  @param Warning As for the parent's Threshold_Status_Label.
   --  @param Critical As for the parent's Threshold_Status_Label.
   --  @param Options As for the parent's Threshold_Status_Label.
   --  @param Direction As for the parent's Threshold_Status_Label.
   --  @param Unit As for the parent's Threshold_Status_Label.
   --  @param Decimals As for the parent's Threshold_Status_Label.
   --  @return The label in Context's locale.

   function Threshold_Summary_Label
      (Context  : Humanize.Contexts.Context;
       Normal   : Natural := 0;
       Warnings : Natural := 0;
       Critical : Natural := 0;
       Breaches : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Normal As for the parent's Threshold_Summary_Label.
   --  @param Warnings As for the parent's Threshold_Summary_Label.
   --  @param Critical As for the parent's Threshold_Summary_Label.
   --  @param Breaches As for the parent's Threshold_Summary_Label.
   --  @return The label in Context's locale.

   function Tolerance_Label
      (Context   : Humanize.Contexts.Context;
       Tolerance : Long_Float;
       Unit      : String := "";
       Decimals  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Tolerance As for the parent's Tolerance_Label.
   --  @param Unit As for the parent's Tolerance_Label.
   --  @param Decimals As for the parent's Tolerance_Label.
   --  @return The label in Context's locale.

   function Window_Status_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Low       : Long_Float;
       High      : Long_Float;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Inclusive : Window_Inclusivity := Inclusive_Window)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value As for the parent's Window_Status_Label.
   --  @param Low As for the parent's Window_Status_Label.
   --  @param High As for the parent's Window_Status_Label.
   --  @param Unit As for the parent's Window_Status_Label.
   --  @param Decimals As for the parent's Window_Status_Label.
   --  @param Inclusive As for the parent's Window_Status_Label.
   --  @return The label in Context's locale.

   function Window_Status_Label
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Low       : Long_Float;
       High      : Long_Float;
       Options   : Threshold_Label_Options;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Inclusive : Window_Inclusivity := Inclusive_Window)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value As for the parent's Window_Status_Label.
   --  @param Low As for the parent's Window_Status_Label.
   --  @param High As for the parent's Window_Status_Label.
   --  @param Options As for the parent's Window_Status_Label.
   --  @param Unit As for the parent's Window_Status_Label.
   --  @param Decimals As for the parent's Window_Status_Label.
   --  @param Inclusive As for the parent's Window_Status_Label.
   --  @return The label in Context's locale.

   procedure Breach_Label_Into
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Limit     : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value As for the parent's Breach_Label.
   --  @param Limit As for the parent's Breach_Label.
   --  @param Direction As for the parent's Breach_Label.
   --  @param Unit As for the parent's Breach_Label.
   --  @param Decimals As for the parent's Breach_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Budget_Used_Label_Into
      (Context  : Humanize.Contexts.Context;
       Used     : Long_Float;
       Budget   : Long_Float;
       Unit     : String := "";
       Decimals : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Used As for the parent's Budget_Used_Label.
   --  @param Budget As for the parent's Budget_Used_Label.
   --  @param Unit As for the parent's Budget_Used_Label.
   --  @param Decimals As for the parent's Budget_Used_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Metric_Value_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Value    : Long_Float;
       Unit     : String := "";
       Decimals : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Metric_Value_Label.
   --  @param Value As for the parent's Metric_Value_Label.
   --  @param Unit As for the parent's Metric_Value_Label.
   --  @param Decimals As for the parent's Metric_Value_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

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
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value As for the parent's Near_Limit_Label.
   --  @param Limit As for the parent's Near_Limit_Label.
   --  @param Margin As for the parent's Near_Limit_Label.
   --  @param Direction As for the parent's Near_Limit_Label.
   --  @param Unit As for the parent's Near_Limit_Label.
   --  @param Decimals As for the parent's Near_Limit_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Percent_Of_Limit_Label_Into
      (Context  : Humanize.Contexts.Context;
       Value    : Long_Float;
       Limit    : Long_Float;
       Decimals : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value As for the parent's Percent_Of_Limit_Label.
   --  @param Limit As for the parent's Percent_Of_Limit_Label.
   --  @param Decimals As for the parent's Percent_Of_Limit_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Range_Label_Into
      (Context   : Humanize.Contexts.Context;
       Low       : Long_Float;
       High      : Long_Float;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Inclusive : Window_Inclusivity := Inclusive_Window;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Low As for the parent's Range_Label.
   --  @param High As for the parent's Range_Label.
   --  @param Unit As for the parent's Range_Label.
   --  @param Decimals As for the parent's Range_Label.
   --  @param Inclusive As for the parent's Range_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Remaining_To_Limit_Label_Into
      (Context   : Humanize.Contexts.Context;
       Value     : Long_Float;
       Limit     : Long_Float;
       Direction : Threshold_Direction := Upper_Limit;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value As for the parent's Remaining_To_Limit_Label.
   --  @param Limit As for the parent's Remaining_To_Limit_Label.
   --  @param Direction As for the parent's Remaining_To_Limit_Label.
   --  @param Unit As for the parent's Remaining_To_Limit_Label.
   --  @param Decimals As for the parent's Remaining_To_Limit_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Threshold_Direction_Label_Into
      (Context   : Humanize.Contexts.Context;
       Direction : Threshold_Direction;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Direction As for the parent's Threshold_Direction_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Threshold_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Threshold_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Threshold_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Threshold_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Threshold_State;
       Options : Threshold_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Threshold_State_Label.
   --  @param Options As for the parent's Threshold_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

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
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value As for the parent's Threshold_Status_Label.
   --  @param Warning As for the parent's Threshold_Status_Label.
   --  @param Critical As for the parent's Threshold_Status_Label.
   --  @param Direction As for the parent's Threshold_Status_Label.
   --  @param Unit As for the parent's Threshold_Status_Label.
   --  @param Decimals As for the parent's Threshold_Status_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

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
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value As for the parent's Threshold_Status_Label.
   --  @param Warning As for the parent's Threshold_Status_Label.
   --  @param Critical As for the parent's Threshold_Status_Label.
   --  @param Options As for the parent's Threshold_Status_Label.
   --  @param Direction As for the parent's Threshold_Status_Label.
   --  @param Unit As for the parent's Threshold_Status_Label.
   --  @param Decimals As for the parent's Threshold_Status_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Threshold_Summary_Label_Into
      (Context  : Humanize.Contexts.Context;
       Normal   : Natural := 0;
       Warnings : Natural := 0;
       Critical : Natural := 0;
       Breaches : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Normal As for the parent's Threshold_Summary_Label.
   --  @param Warnings As for the parent's Threshold_Summary_Label.
   --  @param Critical As for the parent's Threshold_Summary_Label.
   --  @param Breaches As for the parent's Threshold_Summary_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Tolerance_Label_Into
      (Context   : Humanize.Contexts.Context;
       Tolerance : Long_Float;
       Unit      : String := "";
       Decimals  : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Tolerance As for the parent's Tolerance_Label.
   --  @param Unit As for the parent's Tolerance_Label.
   --  @param Decimals As for the parent's Tolerance_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

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
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value As for the parent's Window_Status_Label.
   --  @param Low As for the parent's Window_Status_Label.
   --  @param High As for the parent's Window_Status_Label.
   --  @param Unit As for the parent's Window_Status_Label.
   --  @param Decimals As for the parent's Window_Status_Label.
   --  @param Inclusive As for the parent's Window_Status_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

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
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value As for the parent's Window_Status_Label.
   --  @param Low As for the parent's Window_Status_Label.
   --  @param High As for the parent's Window_Status_Label.
   --  @param Options As for the parent's Window_Status_Label.
   --  @param Unit As for the parent's Window_Status_Label.
   --  @param Decimals As for the parent's Window_Status_Label.
   --  @param Inclusive As for the parent's Window_Status_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Thresholds.Localized;
