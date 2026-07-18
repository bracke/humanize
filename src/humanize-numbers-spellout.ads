--  Deterministic number spellout helpers for cardinal, ordinal, decimal,
--  fraction, currency, and percent wording. These helpers expose the
--  Humanize-owned spellout surface; they do not provide a full CLDR number
--  formatter or application-runtime rule import.
package Humanize.Numbers.Spellout is
   function Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Non-negative value to spell.
   --  @return Cardinal word label.

   procedure Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Non-negative value to spell.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Signed_Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Signed value to spell.
   --  @return Signed cardinal word label.

   procedure Signed_Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Signed value to spell.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Locale_Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Signed value to spell using the context locale tier.
   --  @return Locale spellout label or deterministic English fallback.

   procedure Locale_Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Signed value to spell using the context locale tier.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Decimal_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Decimal value to spell.
   --  @param Fraction_Digits Digits to spell after the decimal separator.
   --  @return Decimal word label.

   procedure Decimal_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Decimal value to spell.
   --  @param Fraction_Digits Digits to spell after the decimal separator.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Fraction_Words
     (Context     : Humanize.Contexts.Context;
      Numerator   : Positive;
      Denominator : Positive)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Numerator Fraction numerator.
   --  @param Denominator Fraction denominator.
   --  @return Fraction word label.

   procedure Fraction_Words_Into
     (Context     : Humanize.Contexts.Context;
      Numerator   : Positive;
      Denominator : Positive;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Numerator Fraction numerator.
   --  @param Denominator Fraction denominator.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Ordinal_Words
     (Context : Humanize.Contexts.Context;
      Value   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Ordinal value to spell.
   --  @return Ordinal word label.

   procedure Ordinal_Words_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Ordinal value to spell.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Currency_Words
     (Context       : Humanize.Contexts.Context;
      Amount        : Long_Float;
      Major_Unit    : String;
      Minor_Unit    : String := "cent";
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount Currency amount to spell.
   --  @param Major_Unit Major currency unit word.
   --  @param Minor_Unit Minor currency unit word.
   --  @param Fraction_Digits Digits to use for the minor amount.
   --  @return Currency word label.

   procedure Currency_Words_Into
     (Context       : Humanize.Contexts.Context;
      Amount        : Long_Float;
      Major_Unit    : String;
      Minor_Unit    : String;
      Fraction_Digits : Natural;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Amount Currency amount to spell.
   --  @param Major_Unit Major currency unit word.
   --  @param Minor_Unit Minor currency unit word.
   --  @param Fraction_Digits Digits to use for the minor amount.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Percent_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Percent value to spell.
   --  @param Fraction_Digits Digits to spell after the decimal separator.
   --  @return Percent word label.

   procedure Percent_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Percent value to spell.
   --  @param Fraction_Digits Digits to spell after the decimal separator.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Spellout_Coverage
      return Humanize.Status.Text_Result;
   --  @return Stable summary of Humanize-owned spellout locale coverage.

   function Spellout_Locale_Tier_For
     (Context : Humanize.Contexts.Context)
      return Spellout_Locale_Tier;
   --  @param Context Formatting context.
   --  @return Spellout tier used by the context locale.

   function Spellout_Locale_Tier_Label
     (Tier : Spellout_Locale_Tier)
      return Humanize.Status.Text_Result;
   --  @param Tier Spellout locale tier.
   --  @return Human-readable spellout tier label.

   procedure Spellout_Coverage_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Spellout_Locale_Tier_Label_Into
     (Tier    : Spellout_Locale_Tier;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Tier Spellout locale tier.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Numbers.Spellout;
