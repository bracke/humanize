with Humanize.Parsing.Implementation.Number_Text_Helpers;
with Humanize.Parsing.Implementation.Scalar_Text_Helpers;

package body Humanize.Parsing.Implementation.Numbers is
   package Number_Text renames Humanize.Parsing.Implementation.Number_Text_Helpers;
   package Scalar_Text renames Humanize.Parsing.Implementation.Scalar_Text_Helpers;

   function Parse_Compact_Number
     (Text : String)
      return Number_Parse_Result renames Number_Text.Parse_Compact_Number;

   function Parse_Cardinal
     (Text : String)
      return Number_Parse_Result renames Number_Text.Parse_Cardinal;

   function Scan_Cardinal
     (Text : String)
      return Number_Parse_Result renames Number_Text.Scan_Cardinal;

   function Parse_Scientific_Number
     (Text : String)
      return Float_Parse_Result renames Number_Text.Parse_Scientific_Number;

   function Scan_Scientific_Number
     (Text : String)
      return Float_Parse_Result renames Number_Text.Scan_Scientific_Number;

   function Parse_Currency
     (Text : String)
      return Currency_Parse_Result renames Number_Text.Parse_Currency;

   function Scan_Currency
     (Text : String)
      return Currency_Parse_Result renames Number_Text.Scan_Currency;

   function Parse_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result renames Number_Text.Parse_Approximate_Currency;

   function Scan_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result renames Number_Text.Scan_Approximate_Currency;

   function Parse_Approximate_Number
     (Text : String)
      return Number_Parse_Result renames Number_Text.Parse_Approximate_Number;

   function Parse_Editorial_Number
     (Text : String)
      return Number_Parse_Result renames Number_Text.Parse_Editorial_Number;

   function Parse_Currency_Words
     (Text : String)
      return Currency_Parse_Result renames Number_Text.Parse_Currency_Words;

   function Scan_Approximate_Number
     (Text : String)
      return Number_Parse_Result renames Number_Text.Scan_Approximate_Number;

   function Parse_Change
     (Text : String)
      return Change_Parse_Result renames Number_Text.Parse_Change;

   function Scan_Change
     (Text : String)
      return Change_Parse_Result renames Number_Text.Scan_Change;

   function Parse_Number_Comparison
     (Text : String)
      return Comparison_Parse_Result renames Number_Text.Parse_Number_Comparison;

   function Parse_Percent_Comparison
     (Text : String)
      return Comparison_Parse_Result renames Number_Text.Parse_Percent_Comparison;

   function Parse_File_Size_Comparison
     (Text : String)
      return Comparison_Parse_Result renames Number_Text.Parse_File_Size_Comparison;

   function Scan_Compact_Number
     (Text : String)
      return Number_Parse_Result renames Number_Text.Scan_Compact_Number;

   function Parse_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result renames Scalar_Text.Parse_Bounded_Number;

   function Parse_Number_Range
     (Text : String)
      return Number_Range_Parse_Result renames Number_Text.Parse_Number_Range;

   function Parse_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result renames Number_Text.Parse_Decimal_Range;

   function Parse_Decimal_Range_Words
     (Text : String)
      return Decimal_Range_Parse_Result renames Number_Text.Parse_Decimal_Range_Words;

   function Parse_Fraction_Words
     (Text : String)
      return Proportion_Parse_Result renames Number_Text.Parse_Fraction_Words;

   function Parse_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result renames Number_Text.Parse_Uncertainty_Label;

   function Parse_Uncertainty_Words
     (Text : String)
      return Uncertainty_Parse_Result renames Number_Text.Parse_Uncertainty_Words;

   function Parse_Percent_Words
     (Text : String)
      return Float_Parse_Result renames Number_Text.Parse_Percent_Words;

   function Scan_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result renames Number_Text.Scan_Uncertainty_Label;

   function Scan_Number_Range
     (Text : String)
      return Number_Range_Parse_Result renames Number_Text.Scan_Number_Range;

   function Scan_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result renames Number_Text.Scan_Decimal_Range;

   function Parse_Proportion
     (Text : String)
      return Proportion_Parse_Result renames Number_Text.Parse_Proportion;

   function Scan_Proportion
     (Text : String)
      return Proportion_Parse_Result renames Number_Text.Scan_Proportion;

   function Scan_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result renames Scalar_Text.Scan_Bounded_Number;

   function Parse_Percent
     (Text : String)
      return Number_Parse_Result renames Scalar_Text.Parse_Percent;

   function Scan_Percent
     (Text : String)
      return Number_Parse_Result renames Scalar_Text.Scan_Percent;

   function Parse_Ordinal
     (Text : String)
      return Number_Parse_Result renames Scalar_Text.Parse_Ordinal;

   function Scan_Ordinal
     (Text : String)
      return Number_Parse_Result renames Scalar_Text.Scan_Ordinal;

   function Parse_Roman
     (Text : String)
      return Number_Parse_Result renames Scalar_Text.Parse_Roman;

   function Scan_Roman
     (Text : String)
      return Number_Parse_Result renames Scalar_Text.Scan_Roman;
end Humanize.Parsing.Implementation.Numbers;
