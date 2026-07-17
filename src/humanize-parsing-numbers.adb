with Humanize.Parsing.Implementation.Numbers;

package body Humanize.Parsing.Numbers is
   package Impl renames Humanize.Parsing.Implementation.Numbers;

   function Parse_Compact_Number
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Compact_Number;

   function Parse_Cardinal
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Cardinal;

   function Scan_Cardinal
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Cardinal;

   function Parse_Scientific_Number
     (Text : String)
      return Float_Parse_Result renames Impl.Parse_Scientific_Number;

   function Scan_Scientific_Number
     (Text : String)
      return Float_Parse_Result renames Impl.Scan_Scientific_Number;

   function Parse_Currency
     (Text : String)
      return Currency_Parse_Result renames Impl.Parse_Currency;

   function Scan_Currency
     (Text : String)
      return Currency_Parse_Result renames Impl.Scan_Currency;

   function Parse_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result renames Impl.Parse_Approximate_Currency;

   function Scan_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result renames Impl.Scan_Approximate_Currency;

   function Parse_Approximate_Number
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Approximate_Number;

   function Parse_Editorial_Number
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Editorial_Number;

   function Parse_Currency_Words
     (Text : String)
      return Currency_Parse_Result renames Impl.Parse_Currency_Words;

   function Scan_Approximate_Number
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Approximate_Number;

   function Parse_Change
     (Text : String)
      return Change_Parse_Result renames Impl.Parse_Change;

   function Scan_Change
     (Text : String)
      return Change_Parse_Result renames Impl.Scan_Change;

   function Parse_Number_Comparison
     (Text : String)
      return Comparison_Parse_Result renames Impl.Parse_Number_Comparison;

   function Parse_Percent_Comparison
     (Text : String)
      return Comparison_Parse_Result renames Impl.Parse_Percent_Comparison;

   function Parse_File_Size_Comparison
     (Text : String)
      return Comparison_Parse_Result renames Impl.Parse_File_Size_Comparison;

   function Scan_Compact_Number
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Compact_Number;

   function Parse_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result renames Impl.Parse_Bounded_Number;

   function Parse_Number_Range
     (Text : String)
      return Number_Range_Parse_Result renames Impl.Parse_Number_Range;

   function Parse_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result renames Impl.Parse_Decimal_Range;

   function Parse_Decimal_Range_Words
     (Text : String)
      return Decimal_Range_Parse_Result renames Impl.Parse_Decimal_Range_Words;

   function Parse_Fraction_Words
     (Text : String)
      return Proportion_Parse_Result renames Impl.Parse_Fraction_Words;

   function Parse_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result renames Impl.Parse_Uncertainty_Label;

   function Parse_Uncertainty_Words
     (Text : String)
      return Uncertainty_Parse_Result renames Impl.Parse_Uncertainty_Words;

   function Parse_Percent_Words
     (Text : String)
      return Float_Parse_Result renames Impl.Parse_Percent_Words;

   function Scan_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result renames Impl.Scan_Uncertainty_Label;

   function Scan_Number_Range
     (Text : String)
      return Number_Range_Parse_Result renames Impl.Scan_Number_Range;

   function Scan_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result renames Impl.Scan_Decimal_Range;

   function Parse_Proportion
     (Text : String)
      return Proportion_Parse_Result renames Impl.Parse_Proportion;

   function Scan_Proportion
     (Text : String)
      return Proportion_Parse_Result renames Impl.Scan_Proportion;

   function Scan_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result renames Impl.Scan_Bounded_Number;

   function Parse_Percent
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Percent;

   function Scan_Percent
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Percent;

   function Parse_Ordinal
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Ordinal;

   function Scan_Ordinal
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Ordinal;

   function Parse_Roman
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Roman;

   function Scan_Roman
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Roman;
end Humanize.Parsing.Numbers;
