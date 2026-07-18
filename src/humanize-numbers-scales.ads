--  Numeric scale and notation helpers, including compact numbers, scientific
--  notation, SI prefixes, currency labels, fractions, Roman numerals, ordinals,
--  percentages, and approximations.
package Humanize.Numbers.Scales is
   function Scientific_Notation
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Number_Options := Default_Number_Options;
      Style   : Scientific_Style := Scientific)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Numeric value to render.
   --  @param Options Fraction digit policy for the mantissa.
   --  @param Style Scientific or engineering exponent policy.
   --  @return Deterministic notation such as "1.23e6" or "1.23E6".

   procedure Scientific_Notation_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options;
      Style   : Scientific_Style := Scientific);
   --  @param Context Formatting context.
   --  @param Value Numeric value to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy for the mantissa.
   --  @param Style Scientific or engineering exponent policy.

   function SI_Prefix
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String := "";
      Options : SI_Prefix_Options := Default_SI_Prefix_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Numeric value to scale to a metric prefix.
   --  @param Unit Optional unit appended after the SI prefix.
   --  @param Options Prefix style, number formatting, and spacing policy.
   --  @return Deterministic SI-prefix text such as "1.5 k" or "2 microseconds".

   procedure SI_Prefix_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "";
      Options : SI_Prefix_Options := Default_SI_Prefix_Options);
   --  @param Context Formatting context.
   --  @param Value Numeric value to scale to a metric prefix.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Unit Optional unit appended after the SI prefix.
   --  @param Options Prefix style, number formatting, and spacing policy.

   function Currency
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount Currency amount.
   --  @param Code ISO-style currency code or symbol.
   --  @param Options Fraction digit policy.
   --  @return Deterministic currency phrase such as "12.50 USD".

   procedure Currency_Into
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Amount Currency amount.
   --  @param Code ISO-style currency code or symbol.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   function Approximate_Currency
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Kind    : Approximation_Kind := About;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount Currency amount.
   --  @param Code ISO-style currency code or symbol.
   --  @param Kind Approximation/comparison policy.
   --  @param Options Fraction digit policy.
   --  @return Deterministic approximate currency phrase.

   procedure Approximate_Currency_Into
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Approximation_Kind := About;
      Options : Number_Options := Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Amount Currency amount.
   --  @param Code ISO-style currency code or symbol.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Kind Approximation/comparison policy.
   --  @param Options Fraction digit policy.

   function Fractional
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Fraction_Options := Default_Fraction_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Value to render as a mixed fraction.
   --  @param Options Fraction approximation policy.
   --  @return Rendered fraction result.

   procedure Fractional_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Fraction_Options := Default_Fraction_Options);

   function Roman
     (Value : Natural)
      return Humanize.Status.Text_Result;
   --  @param Value Value to render as a conventional Roman numeral.
   --  @return Roman numeral for values 1 through 3999.

   procedure Roman_Into
     (Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Value Value to render as a conventional Roman numeral.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   --  Ordinal of a non-negative value (1 -> "1st" in English).
   function Ordinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Gender  : Ordinal_Gender := Masculine)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Non-negative value to render as an ordinal.
   --  @param Gender Grammatical gender for locales with gendered ordinals.
   --  @return Rendered ordinal result.

   procedure Ordinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Gender  : Ordinal_Gender := Masculine);
   --  @param Context Formatting context.
   --  @param Value Non-negative value to render as an ordinal.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Gender Grammatical gender for locales with gendered ordinals.

   --  Compact magnitude rendering (1200 -> "1.2K", or "1.2 thousand" in Long
   --  style). Values below 1000 render as a plain decimal.
   function Compact
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Options : Number_Options := Default_Number_Options;
      Style   : Compact_Style := Short)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Integer value to compact.
   --  @param Options Fraction digit policy.
   --  @param Style Compact output style.
   --  @return Rendered compact-number result.

   procedure Compact_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options;
      Style   : Compact_Style := Short);
   --  @param Context Formatting context.
   --  @param Value Integer value to compact.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.
   --  @param Style Compact output style.

   --  Percentage rendering ("50%", French "50 %"). Value is the percent number;
   --  Options control fraction digits (12.5 -> "12.5%").
   function Percent
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Percent value to render.
   --  @param Options Fraction digit policy.
   --  @return Rendered percent result.

   function Accessible_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Numeric value.
   --  @return Non-symbolic number wording for assistive text.

   procedure Accessible_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Numeric value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Percent_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Value Percent value to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction digit policy.

   function Approximate
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Kind    : Approximation_Kind := About)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Value to render with an approximation/comparison prefix.
   --  @param Kind Approximation/comparison policy.
   --  @return Rendered approximation phrase.

   procedure Approximate_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Approximation_Kind := About);
   --  @param Context Formatting context.
   --  @param Value Value to render with an approximation/comparison prefix.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Kind Approximation/comparison policy.

   function Approximate_To
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : Long_Long_Integer;
      Options : Approximation_Options := Default_Approximation_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Measured value.
   --  @param Target Boundary or target value.
   --  @param Options Threshold policy for choosing the phrase.
   --  @return Rendered automatic approximation phrase.

   procedure Approximate_To_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : Long_Long_Integer;
      Target_Buffer : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Approximation_Options := Default_Approximation_Options);
end Humanize.Numbers.Scales;
