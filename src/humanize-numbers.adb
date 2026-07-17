with Humanize.Numbers.Editorial;
with Humanize.Numbers.Ranges;
with Humanize.Numbers.Rendered_Parse;
with Humanize.Numbers.Scales;
with Humanize.Numbers.Spellout;
with Humanize.Numbers.Statistics;

package body Humanize.Numbers is

   function Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Spellout.Cardinal;

   procedure Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Spellout.Cardinal_Into;

   function Signed_Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Spellout.Signed_Cardinal;

   procedure Signed_Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Spellout.Signed_Cardinal_Into;

   function Locale_Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Spellout.Locale_Cardinal;

   procedure Locale_Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Spellout.Locale_Cardinal_Into;

   function Decimal_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Spellout.Decimal_Words;

   procedure Decimal_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Spellout.Decimal_Words_Into;

   function Fraction_Words
     (Context     : Humanize.Contexts.Context;
      Numerator   : Positive;
      Denominator : Positive)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Spellout.Fraction_Words;

   procedure Fraction_Words_Into
     (Context     : Humanize.Contexts.Context;
      Numerator   : Positive;
      Denominator : Positive;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Spellout.Fraction_Words_Into;

   function Ordinal_Words
     (Context : Humanize.Contexts.Context;
      Value   : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Spellout.Ordinal_Words;

   procedure Ordinal_Words_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Spellout.Ordinal_Words_Into;

   function Parse_Deterministic_Cardinal
     (Text  : String;
      Value : out Long_Long_Integer)
      return Boolean
      renames Humanize.Numbers.Rendered_Parse.Parse_Deterministic_Cardinal;

   function Parse_Deterministic_Ordinal
     (Text  : String;
      Value : out Natural)
      return Boolean
      renames Humanize.Numbers.Rendered_Parse.Parse_Deterministic_Ordinal;

   function Currency_Words
     (Context       : Humanize.Contexts.Context;
      Amount        : Long_Float;
      Major_Unit    : String;
      Minor_Unit    : String := "cent";
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Spellout.Currency_Words;

   procedure Currency_Words_Into
     (Context       : Humanize.Contexts.Context;
      Amount        : Long_Float;
      Major_Unit    : String;
      Minor_Unit    : String;
      Fraction_Digits : Natural;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Spellout.Currency_Words_Into;

   function Percent_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural := 1)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Spellout.Percent_Words;

   procedure Percent_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Spellout.Percent_Words_Into;

   function Editorial_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Usage   : Editorial_Number_Use := General_Number;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Editorial.Editorial_Number;

   procedure Editorial_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Usage   : Editorial_Number_Use := General_Number;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      renames Humanize.Numbers.Editorial.Editorial_Number_Into;

   function Editorial_Ordinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Editorial.Editorial_Ordinal;

   procedure Editorial_Ordinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      renames Humanize.Numbers.Editorial.Editorial_Ordinal_Into;

   function Editorial_Percent
     (Context        : Humanize.Contexts.Context;
      Value          : Long_Float;
      Number_Style   : Number_Options := Default_Number_Options;
      Include_Symbol : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Editorial.Editorial_Percent;

   procedure Editorial_Percent_Into
     (Context        : Humanize.Contexts.Context;
      Value          : Long_Float;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Number_Style   : Number_Options := Default_Number_Options;
      Include_Symbol : Boolean := True)
      renames Humanize.Numbers.Editorial.Editorial_Percent_Into;

   function Editorial_Measurement
     (Context      : Humanize.Contexts.Context;
      Value        : Long_Float;
      Unit         : String;
      Number_Style : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Editorial.Editorial_Measurement;

   procedure Editorial_Measurement_Into
     (Context      : Humanize.Contexts.Context;
      Value        : Long_Float;
      Unit         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Number_Style : Number_Options := Default_Number_Options)
      renames Humanize.Numbers.Editorial.Editorial_Measurement_Into;

   function Editorial_Age
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : String := "years old")
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Editorial.Editorial_Age;

   procedure Editorial_Age_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "years old")
      renames Humanize.Numbers.Editorial.Editorial_Age_Into;

   function Spellout_Coverage
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Spellout.Spellout_Coverage;

   function Spellout_Locale_Tier_For
     (Context : Humanize.Contexts.Context)
      return Spellout_Locale_Tier
      renames Humanize.Numbers.Spellout.Spellout_Locale_Tier_For;

   function Spellout_Locale_Tier_Label
     (Tier : Spellout_Locale_Tier)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Spellout.Spellout_Locale_Tier_Label;

   procedure Spellout_Coverage_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Spellout.Spellout_Coverage_Into;

   procedure Spellout_Locale_Tier_Label_Into
     (Tier    : Spellout_Locale_Tier;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Spellout.Spellout_Locale_Tier_Label_Into;

   function Scientific_Notation
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Number_Options := Default_Number_Options;
      Style   : Scientific_Style := Scientific)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Scales.Scientific_Notation;

   procedure Scientific_Notation_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options;
      Style   : Scientific_Style := Scientific)
      renames Humanize.Numbers.Scales.Scientific_Notation_Into;

   function SI_Prefix
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String := "";
      Options : SI_Prefix_Options := Default_SI_Prefix_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Scales.SI_Prefix;

   procedure SI_Prefix_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "";
      Options : SI_Prefix_Options := Default_SI_Prefix_Options)
      renames Humanize.Numbers.Scales.SI_Prefix_Into;

   function Currency
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Scales.Currency;

   procedure Currency_Into
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options)
      renames Humanize.Numbers.Scales.Currency_Into;

   function Approximate_Currency
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Kind    : Approximation_Kind := About;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Scales.Approximate_Currency;

   procedure Approximate_Currency_Into
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Approximation_Kind := About;
      Options : Number_Options := Default_Number_Options)
      renames Humanize.Numbers.Scales.Approximate_Currency_Into;

   function Fractional
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Fraction_Options := Default_Fraction_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Scales.Fractional;

   procedure Fractional_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Fraction_Options := Default_Fraction_Options)
      renames Humanize.Numbers.Scales.Fractional_Into;
   function Bounded_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Maximum : Long_Long_Integer;
      Suffix  : String := "+")
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Bounded_Number;

   function Number_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Options : Number_Range_Options := Default_Number_Range_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Number_Range;

   function Approximate_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Options : Number_Range_Options := Default_Number_Range_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Approximate_Range;

   function Decimal_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Float;
      High    : Long_Float;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Decimal_Range;

   function Decimal_Range_Metadata
     (Low     : Long_Float;
      High    : Long_Float;
      Options : Number_Options := Default_Number_Options)
      return Number_Render_Metadata
      renames Humanize.Numbers.Ranges.Decimal_Range_Metadata;

   function Uncertainty_Metadata
     (Value       : Long_Float;
      Uncertainty : Long_Float;
      Options     : Number_Options := Default_Number_Options;
      Style       : Uncertainty_Style := Plus_Minus_Uncertainty)
      return Number_Render_Metadata
      renames Humanize.Numbers.Ranges.Uncertainty_Metadata;

   function Uncertainty_Label
     (Context     : Humanize.Contexts.Context;
      Value       : Long_Float;
      Uncertainty : Long_Float;
      Options     : Number_Options := Default_Number_Options;
      Style       : Uncertainty_Style := Plus_Minus_Uncertainty)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Uncertainty_Label;

   function Decimal_Range_Words
     (Context         : Humanize.Contexts.Context;
      Low             : Long_Float;
      High            : Long_Float;
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Decimal_Range_Words;

   function Uncertainty_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Uncertainty     : Long_Float;
      Fraction_Digits : Natural := 1)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Uncertainty_Words;

   function Under_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Under_Number;

   function Up_To
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Up_To;

   function Between
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Between;

   function Qualified_Range
     (Context  : Humanize.Contexts.Context;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Boundary : Range_Boundary_Style := Inclusive_Range)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Qualified_Range;

   function Tolerance_Range
     (Context   : Humanize.Contexts.Context;
      Center    : Long_Long_Integer;
      Tolerance : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Tolerance_Range;

   function Threshold
     (Context   : Humanize.Contexts.Context;
      Value     : Long_Long_Integer;
      Direction : Threshold_Direction)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Threshold;

   function Range_Position
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Long_Integer;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Boundary : Range_Boundary_Style := Inclusive_Range)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Range_Position;

   function Ratio
     (Context : Humanize.Contexts.Context;
      Left    : Natural;
      Right   : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Ratio;

   function Ratio_Per
     (Context              : Humanize.Contexts.Context;
      Numerator            : Natural;
      Denominator          : Positive;
      Numerator_Singular   : String;
      Denominator_Singular : String;
      Numerator_Plural     : String := "";
      Denominator_Plural   : String := "")
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Ratio_Per;

   function One_In
     (Context : Humanize.Contexts.Context;
      Denominator : Positive)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.One_In;

   function Out_Of
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Total   : Positive)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Out_Of;

   function Direction_Of_Change
     (Value : Long_Float)
      return Change_Direction
      renames Humanize.Numbers.Ranges.Direction_Of_Change;

   function Change
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Change;

   function Change_Since
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Since   : String;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Change_Since;

   function Change_From
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Options  : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Change_From;

   function Percent_Change
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Percent_Change;

   function Percent_Delta
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Options  : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Percent_Delta;

   function Point_Change
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Point_Change;

   function Unit_Change
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Float;
      Singular : String;
      Plural   : String := "";
      Options  : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Ranges.Unit_Change;

   procedure Bounded_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Maximum : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Suffix  : String := "+")
      renames Humanize.Numbers.Ranges.Bounded_Number_Into;

   procedure Number_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Range_Options := Default_Number_Range_Options)
      renames Humanize.Numbers.Ranges.Number_Range_Into;

   procedure Approximate_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Range_Options := Default_Number_Range_Options)
      renames Humanize.Numbers.Ranges.Approximate_Range_Into;

   procedure Decimal_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Float;
      High    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options)
      renames Humanize.Numbers.Ranges.Decimal_Range_Into;

   procedure Uncertainty_Label_Into
     (Context     : Humanize.Contexts.Context;
      Value       : Long_Float;
      Uncertainty : Long_Float;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Options     : Number_Options := Default_Number_Options;
      Style       : Uncertainty_Style := Plus_Minus_Uncertainty)
      renames Humanize.Numbers.Ranges.Uncertainty_Label_Into;

   procedure Decimal_Range_Words_Into
     (Context         : Humanize.Contexts.Context;
      Low             : Long_Float;
      High            : Long_Float;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Fraction_Digits : Natural := 2)
      renames Humanize.Numbers.Ranges.Decimal_Range_Words_Into;

   procedure Uncertainty_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Uncertainty     : Long_Float;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Fraction_Digits : Natural := 1)
      renames Humanize.Numbers.Ranges.Uncertainty_Words_Into;

   procedure Under_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Ranges.Under_Number_Into;

   procedure Up_To_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Ranges.Up_To_Into;

   procedure Between_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Ranges.Between_Into;

   procedure Qualified_Range_Into
     (Context  : Humanize.Contexts.Context;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Boundary : Range_Boundary_Style := Inclusive_Range)
      renames Humanize.Numbers.Ranges.Qualified_Range_Into;

   procedure Tolerance_Range_Into
     (Context   : Humanize.Contexts.Context;
      Center    : Long_Long_Integer;
      Tolerance : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Ranges.Tolerance_Range_Into;

   procedure Threshold_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Long_Long_Integer;
      Direction : Threshold_Direction;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Ranges.Threshold_Into;

   procedure Range_Position_Into
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Long_Integer;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Boundary : Range_Boundary_Style := Inclusive_Range)
      renames Humanize.Numbers.Ranges.Range_Position_Into;

   procedure Ratio_Into
     (Context : Humanize.Contexts.Context;
      Left    : Natural;
      Right   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Ranges.Ratio_Into;

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
      Denominator_Plural   : String := "")
      renames Humanize.Numbers.Ranges.Ratio_Per_Into;

   procedure One_In_Into
     (Context     : Humanize.Contexts.Context;
      Denominator : Positive;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Ranges.One_In_Into;

   procedure Out_Of_Into
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Ranges.Out_Of_Into;

   procedure Change_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options)
      renames Humanize.Numbers.Ranges.Change_Into;

   procedure Change_Since_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Since   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options)
      renames Humanize.Numbers.Ranges.Change_Since_Into;

   procedure Change_From_Into
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Change_Options := Default_Change_Options)
      renames Humanize.Numbers.Ranges.Change_From_Into;

   procedure Percent_Change_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options)
      renames Humanize.Numbers.Ranges.Percent_Change_Into;

   procedure Percent_Delta_Into
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Change_Options := Default_Change_Options)
      renames Humanize.Numbers.Ranges.Percent_Delta_Into;

   procedure Point_Change_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options)
      renames Humanize.Numbers.Ranges.Point_Change_Into;

   procedure Unit_Change_Into
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Float;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "";
      Options  : Change_Options := Default_Change_Options)
      renames Humanize.Numbers.Ranges.Unit_Change_Into;

   function Roman
     (Value : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Scales.Roman;

   procedure Roman_Into
     (Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Scales.Roman_Into;

   function Ordinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Gender  : Ordinal_Gender := Masculine)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Scales.Ordinal;

   procedure Ordinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Gender  : Ordinal_Gender := Masculine)
      renames Humanize.Numbers.Scales.Ordinal_Into;

   function Compact
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Options : Number_Options := Default_Number_Options;
      Style   : Compact_Style := Short)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Scales.Compact;

   procedure Compact_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options;
      Style   : Compact_Style := Short)
      renames Humanize.Numbers.Scales.Compact_Into;

   function Percent
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Scales.Percent;

   function Accessible_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Scales.Accessible_Number;

   procedure Accessible_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Numbers.Scales.Accessible_Number_Into;

   procedure Percent_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options)
      renames Humanize.Numbers.Scales.Percent_Into;

   function Approximate
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Kind    : Approximation_Kind := About)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Scales.Approximate;

   procedure Approximate_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Approximation_Kind := About)
      renames Humanize.Numbers.Scales.Approximate_Into;

   function Approximate_To
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : Long_Long_Integer;
      Options : Approximation_Options := Default_Approximation_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Scales.Approximate_To;

   procedure Approximate_To_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : Long_Long_Integer;
      Target_Buffer : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Approximation_Options := Default_Approximation_Options)
      renames Humanize.Numbers.Scales.Approximate_To_Into;

   function Distribution_Summary_Label
     (Count   : Natural;
      Minimum : Long_Float;
      Median  : Long_Float;
      Maximum : Long_Float;
      Unit    : String := "")
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Statistics.Distribution_Summary_Label;

   function Percentile_Summary_Label
     (P50  : Long_Float;
      P95  : Long_Float;
      P99  : Long_Float;
      Unit : String := "")
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Statistics.Percentile_Summary_Label;

   function Outlier_Summary_Label
     (Outliers : Natural;
      Total    : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Statistics.Outlier_Summary_Label;

   function Distribution_Shape_Label
     (Count      : Natural;
      Minimum    : Long_Float;
      Q1         : Long_Float;
      Median     : Long_Float;
      Q3         : Long_Float;
      Maximum    : Long_Float;
      Mean       : Long_Float := 0.0;
      Stddev     : Long_Float := 0.0;
      Outliers   : Natural := 0;
      Unit       : String := "")
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Statistics.Distribution_Shape_Label;

   function Distribution_Shape_Metadata_For
     (Count      : Natural;
      Minimum    : Long_Float;
      Q1         : Long_Float;
      Median     : Long_Float;
      Q3         : Long_Float;
      Maximum    : Long_Float;
      Mean       : Long_Float := 0.0;
      Stddev     : Long_Float := 0.0;
      Outliers   : Natural := 0)
      return Distribution_Shape_Metadata
      renames Humanize.Numbers.Statistics.Distribution_Shape_Metadata_For;

   function Distribution_Shape_Label
     (Metadata : Distribution_Shape_Metadata;
      Median   : Long_Float := 0.0;
      Unit     : String := "")
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Statistics.Distribution_Shape_Label;

   function Distribution_Shape_Metadata_Label
     (Metadata : Distribution_Shape_Metadata)
      return Humanize.Status.Text_Result
      renames Humanize.Numbers.Statistics.Distribution_Shape_Metadata_Label;

   procedure Distribution_Summary_Label_Into
     (Count   : Natural;
      Minimum : Long_Float;
      Median  : Long_Float;
      Maximum : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "")
      renames Humanize.Numbers.Statistics.Distribution_Summary_Label_Into;

   procedure Distribution_Shape_Label_Into
     (Count      : Natural;
      Minimum    : Long_Float;
      Q1         : Long_Float;
      Median     : Long_Float;
      Q3         : Long_Float;
      Maximum    : Long_Float;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Mean       : Long_Float := 0.0;
      Stddev     : Long_Float := 0.0;
      Outliers   : Natural := 0;
      Unit       : String := "")
      renames Humanize.Numbers.Statistics.Distribution_Shape_Label_Into;

end Humanize.Numbers;
