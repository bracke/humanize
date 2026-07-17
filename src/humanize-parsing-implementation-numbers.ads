with Ada.Calendar;

with Humanize.Bytes;
with Humanize.Colors;
with Humanize.Durations;
with Humanize.Frequencies;
with Humanize.Numbers;
with Humanize.Phrases;
with Humanize.Rates;
with Humanize.Status;
with Humanize.Strings;
with Humanize.Units;
with Humanize.Values;

package Humanize.Parsing.Implementation.Numbers is

   function Parse_Compact_Number
     (Text : String)
      return Number_Parse_Result;

   function Parse_Cardinal
     (Text : String)
      return Number_Parse_Result;

   function Scan_Cardinal
     (Text : String)
      return Number_Parse_Result;

   function Parse_Scientific_Number
     (Text : String)
      return Float_Parse_Result;

   function Scan_Scientific_Number
     (Text : String)
      return Float_Parse_Result;

   function Parse_Currency
     (Text : String)
      return Currency_Parse_Result;

   function Scan_Currency
     (Text : String)
      return Currency_Parse_Result;

   function Parse_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result;

   function Scan_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result;

   function Parse_Approximate_Number
     (Text : String)
      return Number_Parse_Result;

   function Parse_Editorial_Number
     (Text : String)
      return Number_Parse_Result;

   function Parse_Currency_Words
     (Text : String)
      return Currency_Parse_Result;

   function Scan_Approximate_Number
     (Text : String)
      return Number_Parse_Result;

   function Parse_Change
     (Text : String)
      return Change_Parse_Result;

   function Scan_Change
     (Text : String)
      return Change_Parse_Result;

   function Parse_Number_Comparison
     (Text : String)
      return Comparison_Parse_Result;

   function Parse_Percent_Comparison
     (Text : String)
      return Comparison_Parse_Result;

   function Parse_File_Size_Comparison
     (Text : String)
      return Comparison_Parse_Result;

   function Scan_Compact_Number
     (Text : String)
      return Number_Parse_Result;

   function Parse_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result;

   function Parse_Number_Range
     (Text : String)
      return Number_Range_Parse_Result;

   function Parse_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result;

   function Parse_Decimal_Range_Words
     (Text : String)
      return Decimal_Range_Parse_Result;

   function Parse_Fraction_Words
     (Text : String)
      return Proportion_Parse_Result;

   function Parse_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result;

   function Parse_Uncertainty_Words
     (Text : String)
      return Uncertainty_Parse_Result;

   function Parse_Percent_Words
     (Text : String)
      return Float_Parse_Result;

   function Scan_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result;

   function Scan_Number_Range
     (Text : String)
      return Number_Range_Parse_Result;

   function Scan_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result;

   function Parse_Proportion
     (Text : String)
      return Proportion_Parse_Result;

   function Scan_Proportion
     (Text : String)
      return Proportion_Parse_Result;

   function Scan_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result;

   function Parse_Percent
     (Text : String)
      return Number_Parse_Result;

   function Scan_Percent
     (Text : String)
      return Number_Parse_Result;

   function Parse_Ordinal
     (Text : String)
      return Number_Parse_Result;

   function Scan_Ordinal
     (Text : String)
      return Number_Parse_Result;

   function Parse_Roman
     (Text : String)
      return Number_Parse_Result;

   function Scan_Roman
     (Text : String)
      return Number_Parse_Result;
end Humanize.Parsing.Implementation.Numbers;
