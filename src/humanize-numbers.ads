with Humanize.Contexts;
with Humanize.Status;

--  Ordinal and compact number humanization.
--
--  Ordinal renders "1st"/"2nd"/"3rd"/"4th" (English) or "1."/"2." (German,
--  Danish) using i18n selectordinal mechanics; Romance locales offer a feminine
--  form (French "1re", Spanish "1.a", Italian "1a"). Compact renders large
--  values as "1.2K"/"3.4M" with locale-specific suffixes and locale decimal
--  grouping. This package selects keys only and must not call I18N.Runtime
--  directly (HUM-INV-002).
package Humanize.Numbers is

   type Number_Options is record
      Maximum_Fraction_Digits : Natural range 0 .. 3 := 1;
      Suppress_Trailing_Zero  : Boolean := True;
   end record;

   Default_Number_Options : constant Number_Options :=
     (Maximum_Fraction_Digits => 1,
      Suppress_Trailing_Zero  => True);

   --  Grammatical gender for ordinals. Locales without an ordinal gender
   --  distinction (en/da/de) render both alike.
   type Ordinal_Gender is (Masculine, Feminine);

   --  Compact rendering style: Short uses symbols ("1.2K"); Long uses the
   --  spelled-out scale word with plural agreement ("1.2 million").
   type Compact_Style is (Short, Long);

   type Scientific_Style is (Scientific, Engineering);

   type SI_Prefix_Style is (SI_Symbol, SI_Long);

   type SI_Prefix_Options is record
      Number_Style : Number_Options := Default_Number_Options;
      Prefix_Style : SI_Prefix_Style := SI_Symbol;
      Space_Before_Unit : Boolean := True;
   end record;

   Default_SI_Prefix_Options : constant SI_Prefix_Options :=
     (Number_Style      => Default_Number_Options,
      Prefix_Style      => SI_Symbol,
      Space_Before_Unit => True);

   type Approximation_Kind is (About, Almost, Over, Under);

   type Spellout_Locale_Tier is
     (English_Spellout,
      Native_Locale_Spellout,
      Generated_Locale_Spellout,
      English_Fallback_Spellout);
   --  Stable metadata for Humanize-owned deterministic spellout helpers.
   --  English_Spellout covers `en`; Native_Locale_Spellout covers hand-written
   --  shipped spellout locales; Generated_Locale_Spellout covers generated
   --  deterministic spellout locales; English_Fallback_Spellout reports that
   --  the locale falls back to deterministic English wording.

   type Approximation_Options is record
      Threshold : Long_Long_Integer := 1;
   end record;

   Default_Approximation_Options : constant Approximation_Options :=
     (Threshold => 1);

   type Fraction_Options is record
      Max_Denominator : Positive := 1_000;
   end record;

   Default_Fraction_Options : constant Fraction_Options :=
     (Max_Denominator => 1_000);

   type Number_Range_Options is record
      Separator      : Character := '-';
      Spaces_Around  : Boolean := False;
   end record;

   Default_Number_Range_Options : constant Number_Range_Options :=
     (Separator => '-', Spaces_Around => False);

   type Range_Boundary_Style is
     (Inclusive_Range,
      Exclusive_Range,
      Include_Low_Only,
      Include_High_Only);

   type Uncertainty_Style is
     (Plus_Minus_Uncertainty,
      Parenthesized_Uncertainty,
      Interval_Uncertainty);

   type Threshold_Direction is
     (At_Least_Threshold,
      More_Than_Threshold,
      At_Most_Threshold,
      Less_Than_Threshold,
      Exactly_Threshold);

   type Change_Style is
     (Directional_Change,
      Signed_Change,
      Comparative_Change);

   type Zero_Change_Style is
     (Unchanged_Zero,
      Numeric_Zero);

   type Change_Direction is
     (Change_Down,
      Change_None,
      Change_Up);

   type Change_Options is record
      Style        : Change_Style := Directional_Change;
      Zero_Style   : Zero_Change_Style := Unchanged_Zero;
      Number_Style : Number_Options := Default_Number_Options;
   end record;

   Default_Change_Options : constant Change_Options :=
     (Style        => Directional_Change,
      Zero_Style   => Unchanged_Zero,
      Number_Style => Default_Number_Options);

   type Editorial_Number_Use is
     (General_Number,
      Age_Number,
      Measurement_Number,
      Percent_Number,
      Ordinal_Number,
      Headline_Number);

   subtype Editorial_Spell_Limit is Natural;

   type Editorial_Number_Options is record
      Spell_Out_Below          : Editorial_Spell_Limit := 10;
      Headline_Spell_Out_Below : Editorial_Spell_Limit := 10;
      Group_Digits             : Boolean := True;
      Spell_Zero               : Boolean := True;
   end record;

   Default_Editorial_Number_Options : constant Editorial_Number_Options :=
     (Spell_Out_Below          => 10,
      Headline_Spell_Out_Below => 10,
      Group_Digits             => True,
      Spell_Zero               => True);

   function Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Non-negative value to render as English cardinal words.
   --  @return Rendered cardinal word result.

   procedure Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Non-negative value to render as English cardinal words.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Signed_Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Signed value to render as deterministic English words.
   --  @return Rendered cardinal word result.

   procedure Signed_Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Signed value to render as deterministic English words.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Locale_Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Signed value to render as deterministic locale words.
   --  @return Locale word result for shipped spellout locales, or English fallback.

   procedure Locale_Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Signed value to render as deterministic locale words.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Decimal_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Decimal value to spell out deterministically in context locale.
   --  @param Fraction_Digits Digits to spell after the decimal point.
   --  @return Phrase such as "one point two five" or "eins komma zwei fünf".

   procedure Decimal_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Decimal value to spell out deterministically in context locale.
   --  @param Fraction_Digits Digits to spell after the decimal point.
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
   --  @return Locale phrase such as "one half" or "three quarters".

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
   --  @param Value Non-negative value to render as locale ordinal words.
   --  @return Phrase such as "twenty-first" or "einundzwanzigste".

   procedure Ordinal_Words_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Non-negative value to render as locale ordinal words.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Parse_Deterministic_Cardinal
     (Text  : String;
      Value : out Long_Long_Integer)
      return Boolean;
   --  @param Text Exact deterministic cardinal words emitted by Humanize.
   --  @param Value Parsed non-negative or negative value.
   --  @return True when Text matches a shipped Humanize spellout locale.

   function Parse_Deterministic_Ordinal
     (Text  : String;
      Value : out Natural)
      return Boolean;
   --  @param Text Exact deterministic ordinal words emitted by Humanize.
   --  @param Value Parsed ordinal value.
   --  @return True when Text matches a shipped Humanize spellout locale.

   function Currency_Words
     (Context       : Humanize.Contexts.Context;
      Amount        : Long_Float;
      Major_Unit    : String;
      Minor_Unit    : String := "cent";
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount Currency amount.
   --  @param Major_Unit Major currency noun.
   --  @param Minor_Unit Minor currency noun.
   --  @param Fraction_Digits Digits used for the minor unit.
   --  @return Phrase such as "twelve dollars and fifty cents".

   function Percent_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Percent value.
   --  @param Fraction_Digits Digits to spell after the decimal point.
   --  @return Phrase such as "twelve point five percent".

   procedure Percent_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Percent value.
   --  @param Fraction_Digits Digits to spell after the decimal point.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Editorial_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Usage   : Editorial_Number_Use := General_Number;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Integer value to render.
   --  @param Usage Editorial usage category.
   --  @param Options Editorial spelling and digit grouping policy.
   --  @return AP/editorial-style number text.

   procedure Editorial_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Usage   : Editorial_Number_Use := General_Number;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options);
   --  @param Context Formatting context.
   --  @param Value Integer value to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Usage Editorial usage category.
   --  @param Options Editorial spelling and digit grouping policy.

   function Editorial_Ordinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Non-negative ordinal value.
   --  @param Options Editorial spelling and digit grouping policy.
   --  @return AP/editorial-style ordinal text.

   procedure Editorial_Ordinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options);
   --  @param Context Formatting context.
   --  @param Value Non-negative ordinal value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Editorial spelling and digit grouping policy.

   function Editorial_Percent
     (Context        : Humanize.Contexts.Context;
      Value          : Long_Float;
      Number_Style   : Number_Options := Default_Number_Options;
      Include_Symbol : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Percent value.
   --  @param Number_Style Fraction digit policy.
   --  @param Include_Symbol Use % when True, " percent" when False.
   --  @return Editorial percent text.

   procedure Editorial_Percent_Into
     (Context        : Humanize.Contexts.Context;
      Value          : Long_Float;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Number_Style   : Number_Options := Default_Number_Options;
      Include_Symbol : Boolean := True);
   --  @param Context Formatting context.
   --  @param Value Percent value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Number_Style Fraction digit policy.
   --  @param Include_Symbol Use % when True, " percent" when False.

   function Editorial_Measurement
     (Context      : Humanize.Contexts.Context;
      Value        : Long_Float;
      Unit         : String;
      Number_Style : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Measurement value.
   --  @param Unit Unit label appended after the value.
   --  @param Number_Style Fraction digit policy.
   --  @return Editorial measurement text using digits.

   procedure Editorial_Measurement_Into
     (Context      : Humanize.Contexts.Context;
      Value        : Long_Float;
      Unit         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Number_Style : Number_Options := Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Value Measurement value.
   --  @param Unit Unit label appended after the value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Number_Style Fraction digit policy.

   function Editorial_Age
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : String := "years old")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Age value.
   --  @param Unit Unit label appended after the value.
   --  @return Editorial age text using digits.

   procedure Editorial_Age_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "years old");
   --  @param Context Formatting context.
   --  @param Value Age value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Unit Unit label appended after the value.

   function Spellout_Coverage
     return Humanize.Status.Text_Result;
   --  @return Deterministic spellout coverage summary.

   function Spellout_Locale_Tier_For
     (Context : Humanize.Contexts.Context)
      return Spellout_Locale_Tier;
   --  @param Context Formatting context whose locale should be audited.
   --  @return Deterministic spellout tier used for that locale.

   function Spellout_Locale_Tier_Label
     (Tier : Spellout_Locale_Tier)
      return Humanize.Status.Text_Result;
   --  @param Tier Spellout locale tier metadata value.
   --  @return Lowercase stable tier label.

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
   --  @param Tier Spellout locale tier metadata value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

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
   --  @param Amount Currency amount.
   --  @param Major_Unit Major currency noun.
   --  @param Minor_Unit Minor currency noun.
   --  @param Fraction_Digits Digits used for the minor unit.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

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
   --  @param Context Formatting context.
   --  @param Value Value to render as a mixed fraction.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Fraction approximation policy.

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

   type Number_Render_Kind is
     (Rendered_Decimal_Range,
      Rendered_Uncertainty);

   type Number_Render_Metadata is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Kind   : Number_Render_Kind := Rendered_Decimal_Range;
      Low    : Long_Float := 0.0;
      High   : Long_Float := 0.0;
      Value  : Long_Float := 0.0;
      Uncertainty : Long_Float := 0.0;
      Fraction_Digits : Natural range 0 .. 3 := 1;
      Style : Uncertainty_Style := Plus_Minus_Uncertainty;
   end record;

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
   --  @param Context Formatting context.
   --  @param Value Measured value.
   --  @param Target Boundary or target value.
   --  @param Target_Buffer Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Threshold policy for choosing the phrase.

end Humanize.Numbers;
