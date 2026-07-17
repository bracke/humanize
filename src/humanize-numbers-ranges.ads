private package Humanize.Numbers.Ranges is
   function Bounded_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Maximum : Long_Long_Integer;
      Suffix  : String := "+")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Value to render.
   --  @param Maximum Maximum displayed value.
   --  @param Suffix Suffix appended when Value exceeds Maximum.
   --  @return Rendered bounded number.

   function Number_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Options : Number_Range_Options := Default_Number_Range_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Low Lower bound.
   --  @param High Upper bound.
   --  @param Options Separator and spacing policy.
   --  @return Deterministic number range such as "1-5".

   function Approximate_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Options : Number_Range_Options := Default_Number_Range_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Low Lower bound.
   --  @param High Upper bound.
   --  @param Options Separator and spacing policy.
   --  @return Approximate number range such as "about 10-20".

   function Decimal_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Float;
      High    : Long_Float;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Low Lower decimal bound.
   --  @param High Upper decimal bound.
   --  @param Options Decimal formatting policy.
   --  @return Decimal range phrase such as "1.2 to 3.4".

   function Decimal_Range_Metadata
     (Low     : Long_Float;
      High    : Long_Float;
      Options : Number_Options := Default_Number_Options)
      return Number_Render_Metadata;
   --  @param Low Lower decimal bound.
   --  @param High Upper decimal bound.
   --  @param Options Decimal formatting policy.
   --  @return Machine-readable metadata for a decimal range render.

   function Uncertainty_Metadata
     (Value       : Long_Float;
      Uncertainty : Long_Float;
      Options     : Number_Options := Default_Number_Options;
      Style       : Uncertainty_Style := Plus_Minus_Uncertainty)
      return Number_Render_Metadata;
   --  @param Value Center value.
   --  @param Uncertainty Non-negative symmetric uncertainty.
   --  @param Options Decimal formatting policy.
   --  @param Style Output style for the uncertainty.
   --  @return Machine-readable metadata for an uncertainty render.

   function Uncertainty_Label
     (Context     : Humanize.Contexts.Context;
      Value       : Long_Float;
      Uncertainty : Long_Float;
      Options     : Number_Options := Default_Number_Options;
      Style       : Uncertainty_Style := Plus_Minus_Uncertainty)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Center value.
   --  @param Uncertainty Non-negative symmetric uncertainty.
   --  @param Options Decimal formatting policy.
   --  @param Style Output style for the uncertainty.
   --  @return Label such as "12.3 +/- 0.4" or "11.9 to 12.7".

   function Decimal_Range_Words
     (Context         : Humanize.Contexts.Context;
      Low             : Long_Float;
      High            : Long_Float;
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Low Lower decimal bound.
   --  @param High Upper decimal bound.
   --  @param Fraction_Digits Digits to spell after the decimal point.
   --  @return Spelled decimal range phrase.

   function Uncertainty_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Uncertainty     : Long_Float;
      Fraction_Digits : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Center value.
   --  @param Uncertainty Non-negative symmetric uncertainty.
   --  @param Fraction_Digits Digits to spell after the decimal point.
   --  @return Spelled uncertainty phrase.

   function Under_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Comparison boundary.
   --  @return Comparison phrase such as "under 5".

   function Up_To
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Inclusive upper boundary.
   --  @return Comparison phrase such as "up to 100".

   function Between
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Low Lower bound.
   --  @param High Upper bound.
   --  @return Comparison phrase such as "between 3 and 7".

   function Qualified_Range
     (Context  : Humanize.Contexts.Context;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Boundary : Range_Boundary_Style := Inclusive_Range)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Low Lower bound.
   --  @param High Upper bound.
   --  @param Boundary Inclusion/exclusion policy for the bounds.
   --  @return Range phrase such as "3 to 7 inclusive".

   function Tolerance_Range
     (Context   : Humanize.Contexts.Context;
      Center    : Long_Long_Integer;
      Tolerance : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Center Center value.
   --  @param Tolerance Symmetric tolerance around Center.
   --  @return Tolerance phrase such as "10 +/- 2".

   function Threshold
     (Context   : Humanize.Contexts.Context;
      Value     : Long_Long_Integer;
      Direction : Threshold_Direction)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Threshold value.
   --  @param Direction Threshold inclusion/exclusion policy.
   --  @return Threshold phrase such as "at least 10".

   function Range_Position
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Long_Integer;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Boundary : Range_Boundary_Style := Inclusive_Range)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Value to classify.
   --  @param Low Lower bound.
   --  @param High Upper bound.
   --  @param Boundary Inclusion/exclusion policy for the bounds.
   --  @return Position phrase such as "5 is within 3-7".

   function Ratio
     (Context : Humanize.Contexts.Context;
      Left    : Natural;
      Right   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Left Left side of the ratio.
   --  @param Right Right side of the ratio.
   --  @return Ratio phrase such as "2:1".

   function Ratio_Per
     (Context              : Humanize.Contexts.Context;
      Numerator            : Natural;
      Denominator          : Positive;
      Numerator_Singular   : String;
      Denominator_Singular : String;
      Numerator_Plural     : String := "";
      Denominator_Plural   : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Numerator Numerator count.
   --  @param Denominator Denominator count.
   --  @param Numerator_Singular Singular numerator noun.
   --  @param Denominator_Singular Singular denominator noun.
   --  @param Numerator_Plural Optional plural numerator noun.
   --  @param Denominator_Plural Optional plural denominator noun.
   --  @return Ratio phrase such as "2 errors per file".

   function One_In
     (Context : Humanize.Contexts.Context;
      Denominator : Positive)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Denominator Proportion denominator.
   --  @return Proportion phrase such as "1 in 4".

   function Out_Of
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Total   : Positive)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count Selected or matching count.
   --  @param Total Total count.
   --  @return Proportion phrase such as "3 out of 10".

   function Direction_Of_Change
     (Value : Long_Float)
      return Change_Direction;
   --  @param Value Signed change value.
   --  @return Direction metadata for the signed change.

   function Change
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Signed change value.
   --  @param Options Direction, zero, and number formatting policy.
   --  @return Change phrase such as "up 4", "+4", "4 fewer", or "unchanged".

   function Change_Since
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Since   : String;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Signed change value.
   --  @param Since Baseline label appended after "since".
   --  @param Options Direction, zero, and number formatting policy.
   --  @return Change phrase such as "up 4 since yesterday".

   function Change_From
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Options  : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Current Current value.
   --  @param Previous Previous or baseline value.
   --  @param Options Direction, zero, and number formatting policy.
   --  @return Change phrase for Current - Previous.

   function Percent_Change
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Signed percentage-point value to render with a percent sign.
   --  @param Options Direction, zero, and number formatting policy.
   --  @return Percent change phrase such as "down 12.5%" or "+4%".

   function Percent_Delta
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Options  : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Current Current value.
   --  @param Previous Previous or baseline value.
   --  @param Options Direction, zero, and number formatting policy.
   --  @return Relative percent change for Current versus Previous.

   function Point_Change
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Signed point change.
   --  @param Options Direction, zero, and number formatting policy.
   --  @return Point change phrase such as "up 3 points".

   function Unit_Change
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Float;
      Singular : String;
      Plural   : String := "";
      Options  : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Signed unit change.
   --  @param Singular Singular unit noun.
   --  @param Plural Optional plural unit noun.
   --  @param Options Direction, zero, and number formatting policy.
   --  @return Unit change phrase such as "5 fewer errors".

   procedure Bounded_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Maximum : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Suffix  : String := "+");
   --  @param Context Formatting context.
   --  @param Value Value to render.
   --  @param Maximum Maximum displayed value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Suffix Suffix appended when Value exceeds Maximum.

   procedure Number_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Range_Options := Default_Number_Range_Options);
   --  @param Context Formatting context.
   --  @param Low Lower bound.
   --  @param High Upper bound.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Separator and spacing policy.

   procedure Approximate_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Range_Options := Default_Number_Range_Options);
   --  @param Context Formatting context.
   --  @param Low Lower bound.
   --  @param High Upper bound.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Separator and spacing policy.

   procedure Decimal_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Float;
      High    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Low Lower decimal bound.
   --  @param High Upper decimal bound.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Decimal formatting policy.

   procedure Uncertainty_Label_Into
     (Context     : Humanize.Contexts.Context;
      Value       : Long_Float;
      Uncertainty : Long_Float;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Options     : Number_Options := Default_Number_Options;
      Style       : Uncertainty_Style := Plus_Minus_Uncertainty);
   --  @param Context Formatting context.
   --  @param Value Center value.
   --  @param Uncertainty Non-negative symmetric uncertainty.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Decimal formatting policy.
   --  @param Style Output style for the uncertainty.

   procedure Decimal_Range_Words_Into
     (Context         : Humanize.Contexts.Context;
      Low             : Long_Float;
      High            : Long_Float;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Fraction_Digits : Natural := 2);
   --  @param Context Formatting context.
   --  @param Low Lower decimal bound.
   --  @param High Upper decimal bound.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Fraction_Digits Digits to spell after the decimal point.

   procedure Uncertainty_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Uncertainty     : Long_Float;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Fraction_Digits : Natural := 1);
   --  @param Context Formatting context.
   --  @param Value Center value.
   --  @param Uncertainty Non-negative symmetric uncertainty.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Fraction_Digits Digits to spell after the decimal point.

   procedure Under_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Comparison boundary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Up_To_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Inclusive upper boundary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Between_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Low Lower bound.
   --  @param High Upper bound.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Qualified_Range_Into
     (Context  : Humanize.Contexts.Context;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Boundary : Range_Boundary_Style := Inclusive_Range);
   --  @param Context Formatting context.
   --  @param Low Lower bound.
   --  @param High Upper bound.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Boundary Inclusion/exclusion policy for the bounds.

   procedure Tolerance_Range_Into
     (Context   : Humanize.Contexts.Context;
      Center    : Long_Long_Integer;
      Tolerance : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Center Center value.
   --  @param Tolerance Symmetric tolerance around Center.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Threshold_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Long_Long_Integer;
      Direction : Threshold_Direction;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Threshold value.
   --  @param Direction Threshold inclusion/exclusion policy.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Range_Position_Into
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Long_Integer;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Boundary : Range_Boundary_Style := Inclusive_Range);
   --  @param Context Formatting context.
   --  @param Value Value to classify.
   --  @param Low Lower bound.
   --  @param High Upper bound.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Boundary Inclusion/exclusion policy for the bounds.

   procedure Ratio_Into
     (Context : Humanize.Contexts.Context;
      Left    : Natural;
      Right   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Left Left side of the ratio.
   --  @param Right Right side of the ratio.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Ratio_Per_Into
     (Context              : Humanize.Contexts.Context;
      Numerator            : Natural;
      Denominator          : Positive;
      Numerator_Singular   : String;
      Denominator_Singular : String;
      Target               : in out String;
      Written              : out Natural;
      Status               : out Humanize.Status.Status_Code;
      Numerator_Plural     : String := "";
      Denominator_Plural   : String := "");
   --  @param Context Formatting context.
   --  @param Numerator Numerator count.
   --  @param Denominator Denominator count.
   --  @param Numerator_Singular Singular numerator noun.
   --  @param Denominator_Singular Singular denominator noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Numerator_Plural Optional plural numerator noun.
   --  @param Denominator_Plural Optional plural denominator noun.

   procedure One_In_Into
     (Context : Humanize.Contexts.Context;
      Denominator : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Denominator Proportion denominator.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Out_Of_Into
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count Selected or matching count.
   --  @param Total Total count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Change_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options);
   --  @param Context Formatting context.
   --  @param Value Signed change value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Direction, zero, and number formatting policy.

   procedure Change_Since_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Since   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options);
   --  @param Context Formatting context.
   --  @param Value Signed change value.
   --  @param Since Baseline label appended after "since".
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Direction, zero, and number formatting policy.

   procedure Change_From_Into
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Change_Options := Default_Change_Options);
   --  @param Context Formatting context.
   --  @param Current Current value.
   --  @param Previous Previous or baseline value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Direction, zero, and number formatting policy.

   procedure Percent_Change_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options);
   --  @param Context Formatting context.
   --  @param Value Signed percentage-point value to render with a percent sign.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Direction, zero, and number formatting policy.

   procedure Percent_Delta_Into
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Change_Options := Default_Change_Options);
   --  @param Context Formatting context.
   --  @param Current Current value.
   --  @param Previous Previous or baseline value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Direction, zero, and number formatting policy.

   procedure Point_Change_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options);
   --  @param Context Formatting context.
   --  @param Value Signed point change.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Direction, zero, and number formatting policy.

   procedure Unit_Change_Into
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Float;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "";
      Options  : Change_Options := Default_Change_Options);
   --  @param Context Formatting context.
   --  @param Value Signed unit change.
   --  @param Singular Singular unit noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Plural Optional plural unit noun.
   --  @param Options Direction, zero, and number formatting policy.
end Humanize.Numbers.Ranges;
