with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Decimal_Images;
with Humanize.I18N_Rendering;
with Humanize.Locales;
with Humanize.Message_Keys;
with Humanize.Selections;

package body Humanize.Numbers.Ranges is
   use type Humanize.Status.Status_Code;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Integer_Text (Value : Long_Long_Integer) return String
      renames Humanize.Bounded_Text.Image;

   function Plural_Text (Count : Natural; Singular, Plural : String) return String
      renames Humanize.Bounded_Text.Plural_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Bounded_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Maximum : Long_Long_Integer;
      Suffix  : String := "+")
      return Humanize.Status.Text_Result
   is
      Display : constant Long_Long_Integer :=
        (if Value > Maximum then Maximum else Value);
      Image   : constant String :=
        Integer_Text (Display);
   begin
      return Humanize.I18N_Rendering.Render
        (Context,
         Humanize.Selections.Value_Suffix
           (Humanize.Message_Keys.Number_Bounded,
           Image,
            (if Value > Maximum then Suffix else "")));
   end Bounded_Number;

   function Plain (Value : Long_Long_Integer) return String is
     (Integer_Text (Value));

   type Number_Phrase_Key is
     (Phrase_About,
      Phrase_Under,
      Phrase_Up_To,
      Phrase_Between,
      Phrase_And,
      Phrase_To,
      Phrase_Inclusive,
      Phrase_Greater_Than,
      Phrase_Or_More,
      Phrase_At_Least,
      Phrase_More_Than,
      Phrase_At_Most,
      Phrase_Less_Than,
      Phrase_Exactly,
      Phrase_Is_Within,
      Phrase_Is_Below,
      Phrase_Is_Above,
      Phrase_Per,
      Phrase_In,
      Phrase_Out_Of,
      Phrase_Unchanged,
      Phrase_Up,
      Phrase_Down,
      Phrase_More,
      Phrase_Fewer,
      Phrase_Since);

   function Number_Phrase
     (Context : Humanize.Contexts.Context;
      Key     : Number_Phrase_Key)
      return String;

   --  Outside English, a range ("low/high") or an approximate one ("~low/high")
   --  in the locale's own numbers and CLDR's patterns for them: "1.200–5.000",
   --  "≈10–20". Not Ok in English, where the caller's separator stands.
   function CLDR_Range
     (Context : Humanize.Contexts.Context;
      Value   : String)
      return Humanize.Status.Text_Result
   is
   begin
      if Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context)) in "en" | "" then
         return (Status => Humanize.Status.Missing_Message, others => <>);
      end if;
      return Humanize.I18N_Rendering.Render
        (Context, Humanize.Selections.Text_Value (Humanize.Message_Keys.Number_Plain, Value));
   end CLDR_Range;

   --  Value in the locale's numbers ("1.234"), its plain digits in English.
   function Number_Text (Context : Humanize.Contexts.Context; Value : Long_Long_Integer) return String is
      Rendered : constant Humanize.Status.Text_Result := CLDR_Range (Context, Plain (Value));
   begin
      return (if Rendered.Status = Humanize.Status.Ok and then Ada.Strings.Unbounded.Length (Rendered.Text) > 0
              then Ada.Strings.Unbounded.To_String (Rendered.Text) else Plain (Value));
   end Number_Text;

   --  Text with runs of spaces made one and none at either end: a phrase
   --  whose optional argument was empty.
   function Tidy (Text : String) return String is
      Result : Ada.Strings.Unbounded.Unbounded_String;
   begin
      for C of Text loop
         if C /= ' ' or else (Ada.Strings.Unbounded.Length (Result) > 0
                              and then Ada.Strings.Unbounded.Element
                                (Result, Ada.Strings.Unbounded.Length (Result)) /= ' ')
         then
            Ada.Strings.Unbounded.Append (Result, C);
         end if;
      end loop;
      declare
         Done : constant String := Ada.Strings.Unbounded.To_String (Result);
      begin
         return (if Done'Length > 0 and then Done (Done'Last) = ' ' then Done (Done'First .. Done'Last - 1) else Done);
      end;
   end Tidy;

   --  Phrase Name ("number.at_least") with its arguments in the locale;
   --  English, its own wording.
   function Say
     (Context : Humanize.Contexts.Context;
      English : String;
      Name    : String;
      A1, V1  : String;
      A2, V2  : String := "";
      A3, V3  : String := "")
      return Humanize.Status.Text_Result
   is
      package Sel renames Humanize.Selections;
      Selection : Sel.Message_Selection := Sel.Phrase (Name);
   begin
      if A1 /= "" then
         Selection := Sel.With_Arg (Selection, A1, V1);
      end if;
      if A2 /= "" then
         Selection := Sel.With_Arg (Selection, A2, V2);
      end if;
      if A3 /= "" then
         Selection := Sel.With_Arg (Selection, A3, V3);
      end if;
      declare
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Phrase_Or (Context, Selection, Ok_Text (English));
      begin
         return (if Rendered.Status = Humanize.Status.Ok
                 then Ok_Text (Tidy (Ada.Strings.Unbounded.To_String (Rendered.Text))) else Rendered);
      end;
   end Say;

   function Number_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Options : Number_Range_Options := Default_Number_Range_Options)
      return Humanize.Status.Text_Result
   is separate;

   function Approximate_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Options : Number_Range_Options := Default_Number_Range_Options)
      return Humanize.Status.Text_Result
   is separate;

   function Decimal_Text
     (Value   : Long_Float;
      Options : Number_Options)
      return String
   is
   begin
      return Humanize.Decimal_Images.Decimal_Image
        (Value,
         Options.Maximum_Fraction_Digits,
         Options.Suppress_Trailing_Zero);
   end Decimal_Text;

   function Decimal_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Float;
      High    : Long_Float;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
   is separate;

   function Decimal_Range_Metadata
     (Low     : Long_Float;
      High    : Long_Float;
      Options : Number_Options := Default_Number_Options)
      return Number_Render_Metadata
   is
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Kind => Rendered_Decimal_Range,
         Low => Low,
         High => High,
         Value => 0.0,
         Uncertainty => 0.0,
         Fraction_Digits => Options.Maximum_Fraction_Digits,
         Style => Plus_Minus_Uncertainty);
   end Decimal_Range_Metadata;

   function Uncertainty_Metadata
     (Value       : Long_Float;
      Uncertainty : Long_Float;
      Options     : Number_Options := Default_Number_Options;
      Style       : Uncertainty_Style := Plus_Minus_Uncertainty)
      return Number_Render_Metadata
   is
   begin
      if Uncertainty < 0.0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Kind => Rendered_Uncertainty,
         Low => Value - Uncertainty,
         High => Value + Uncertainty,
         Value => Value,
         Uncertainty => Uncertainty,
         Fraction_Digits => Options.Maximum_Fraction_Digits,
         Style => Style);
   end Uncertainty_Metadata;

   function Uncertainty_Label
     (Context     : Humanize.Contexts.Context;
      Value       : Long_Float;
      Uncertainty : Long_Float;
      Options     : Number_Options := Default_Number_Options;
      Style       : Uncertainty_Style := Plus_Minus_Uncertainty)
      return Humanize.Status.Text_Result
   is
      Center : constant String := Decimal_Text (Value, Options);
      Delta_Text  : constant String := Decimal_Text (Uncertainty, Options);
   begin
      if Uncertainty < 0.0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      case Style is
         when Plus_Minus_Uncertainty =>
            return Ok_Text (Center & " +/- " & Delta_Text);
         when Parenthesized_Uncertainty =>
            return Ok_Text (Center & " (+/- " & Delta_Text & ")");
         when Interval_Uncertainty =>
            return Decimal_Range
              (Context, Value - Uncertainty, Value + Uncertainty, Options);
      end case;
   end Uncertainty_Label;

   function Decimal_Range_Words
     (Context         : Humanize.Contexts.Context;
      Low             : Long_Float;
      High            : Long_Float;
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result
   is
      Left  : constant Humanize.Status.Text_Result :=
        Decimal_Words (Context, Low, Fraction_Digits);
      Right : constant Humanize.Status.Text_Result :=
        Decimal_Words (Context, High, Fraction_Digits);
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      elsif Left.Status /= Humanize.Status.Ok then
         return Left;
      elsif Right.Status /= Humanize.Status.Ok then
         return Right;
      end if;

      return Say
        (Context, Result_Text (Left) & " " & Number_Phrase (Context, Phrase_To) & " " & Result_Text (Right),
         "number.range_words", "low", Result_Text (Left), "high", Result_Text (Right));
   end Decimal_Range_Words;

   function Uncertainty_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Uncertainty     : Long_Float;
      Fraction_Digits : Natural := 1)
      return Humanize.Status.Text_Result
   is
      Center : constant Humanize.Status.Text_Result :=
        Decimal_Words (Context, Value, Fraction_Digits);
      Delta_Text  : constant Humanize.Status.Text_Result :=
        Decimal_Words (Context, Uncertainty, Fraction_Digits);
   begin
      if Uncertainty < 0.0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      elsif Center.Status /= Humanize.Status.Ok then
         return Center;
      elsif Delta_Text.Status /= Humanize.Status.Ok then
         return Delta_Text;
      end if;

      return Say
        (Context, Result_Text (Center) & " plus or minus " & Result_Text (Delta_Text),
         "number.uncertainty_words", "value", Result_Text (Center), "delta", Result_Text (Delta_Text));
   end Uncertainty_Words;

   function Under_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
   begin
      return Say (Context, Number_Phrase (Context, Phrase_Under) & " " & Plain (Value),
                  "number.under", "value", Number_Text (Context, Value));
   end Under_Number;

   function Up_To
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
   begin
      return Say (Context, Number_Phrase (Context, Phrase_Up_To) & " " & Plain (Value),
                  "number.up_to", "value", Number_Text (Context, Value));
   end Up_To;

   function Between
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;
      return Say
        (Context, Number_Phrase (Context, Phrase_Between) & " " & Plain (Low) & " "
         & Number_Phrase (Context, Phrase_And) & " " & Plain (High),
         "number.between", "low", Number_Text (Context, Low), "high", Number_Text (Context, High));
   end Between;

   function Range_Text
     (Low  : Long_Long_Integer;
      High : Long_Long_Integer)
      return String
   is
   begin
      return Plain (Low) & "-" & Plain (High);
   end Range_Text;

   --  English's word for Key; other locales write whole phrases from the
   --  phrase catalogs (see Say).
   function Number_Phrase
     (Context : Humanize.Contexts.Context;
      Key     : Number_Phrase_Key)
      return String
   is
      pragma Unreferenced (Context);
   begin
      case Key is
         when Phrase_About        => return "about";
         when Phrase_Under        => return "under";
         when Phrase_Up_To        => return "up to";
         when Phrase_Between      => return "between";
         when Phrase_And          => return "and";
         when Phrase_To           => return "to";
         when Phrase_Inclusive    => return "inclusive";
         when Phrase_Greater_Than => return "greater than";
         when Phrase_Or_More      => return "or more";
         when Phrase_At_Least     => return "at least";
         when Phrase_More_Than    => return "more than";
         when Phrase_At_Most      => return "at most";
         when Phrase_Less_Than    => return "less than";
         when Phrase_Exactly      => return "exactly";
         when Phrase_Is_Within    => return "is within";
         when Phrase_Is_Below     => return "is below";
         when Phrase_Is_Above     => return "is above";
         when Phrase_Per          => return "per";
         when Phrase_In           => return "in";
         when Phrase_Out_Of       => return "out of";
         when Phrase_Unchanged    => return "unchanged";
         when Phrase_Up           => return "up";
         when Phrase_Down         => return "down";
         when Phrase_More         => return "more";
         when Phrase_Fewer        => return "fewer";
         when Phrase_Since        => return "since";
      end case;
   end Number_Phrase;

   function Qualified_Range
     (Context  : Humanize.Contexts.Context;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Boundary : Range_Boundary_Style := Inclusive_Range)
      return Humanize.Status.Text_Result
   is
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      case Boundary is
         when Inclusive_Range =>
            return Say
              (Context, Plain (Low) & " " & Number_Phrase (Context, Phrase_To) & " "
               & Plain (High) & " " & Number_Phrase (Context, Phrase_Inclusive),
               "number.range_inclusive", "low", Number_Text (Context, Low), "high", Number_Text (Context, High));
         when Exclusive_Range =>
            return Say
              (Context, Number_Phrase (Context, Phrase_Greater_Than) & " "
               & Plain (Low) & " " & Number_Phrase (Context, Phrase_And)
               & " " & Number_Phrase (Context, Phrase_Less_Than) & " " & Plain (High),
               "number.range_exclusive", "low", Number_Text (Context, Low), "high", Number_Text (Context, High));
         when Include_Low_Only =>
            return Say
              (Context, Plain (Low) & " " & Number_Phrase (Context, Phrase_Or_More)
               & " " & Number_Phrase (Context, Phrase_And) & " "
               & Number_Phrase (Context, Phrase_Less_Than) & " " & Plain (High),
               "number.range_low_inclusive", "low", Number_Text (Context, Low), "high",
               Number_Text (Context, High));
         when Include_High_Only =>
            return Say
              (Context, Number_Phrase (Context, Phrase_Greater_Than) & " "
               & Plain (Low) & " " & Number_Phrase (Context, Phrase_And)
               & " " & Number_Phrase (Context, Phrase_Up_To) & " " & Plain (High),
               "number.range_high_inclusive", "low", Number_Text (Context, Low), "high",
               Number_Text (Context, High));
      end case;
   end Qualified_Range;

   function Tolerance_Range
     (Context   : Humanize.Contexts.Context;
      Center    : Long_Long_Integer;
      Tolerance : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text (Plain (Center) & " +/- " & Natural_Text (Tolerance));
   end Tolerance_Range;

   function Threshold
     (Context   : Humanize.Contexts.Context;
      Value     : Long_Long_Integer;
      Direction : Threshold_Direction)
      return Humanize.Status.Text_Result
   is
   begin
      case Direction is
         when At_Least_Threshold =>
            return Say (Context, Number_Phrase (Context, Phrase_At_Least) & " " & Plain (Value),
                        "number.at_least", "value", Number_Text (Context, Value));
         when More_Than_Threshold =>
            return Say (Context, Number_Phrase (Context, Phrase_More_Than) & " " & Plain (Value),
                        "number.more_than", "value", Number_Text (Context, Value));
         when At_Most_Threshold =>
            return Say (Context, Number_Phrase (Context, Phrase_At_Most) & " " & Plain (Value),
                        "number.at_most", "value", Number_Text (Context, Value));
         when Less_Than_Threshold =>
            return Say (Context, Number_Phrase (Context, Phrase_Less_Than) & " " & Plain (Value),
                        "number.less_than", "value", Number_Text (Context, Value));
         when Exactly_Threshold =>
            return Say (Context, Number_Phrase (Context, Phrase_Exactly) & " " & Plain (Value),
                        "number.exactly", "value", Number_Text (Context, Value));
      end case;
   end Threshold;

   function Contains_Value
     (Value    : Long_Long_Integer;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Boundary : Range_Boundary_Style)
      return Boolean
   is
   begin
      case Boundary is
         when Inclusive_Range =>
            return Value >= Low and then Value <= High;
         when Exclusive_Range =>
            return Value > Low and then Value < High;
         when Include_Low_Only =>
            return Value >= Low and then Value < High;
         when Include_High_Only =>
            return Value > Low and then Value <= High;
      end case;
   end Contains_Value;

   function Range_Position
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Long_Integer;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Boundary : Range_Boundary_Style := Inclusive_Range)
      return Humanize.Status.Text_Result
   is
      Bounds : constant String := Range_Text (Low, High);
      --  The bounds as the locale writes a range ("1.000–5.000").
      Localized_Bounds : constant Humanize.Status.Text_Result :=
        CLDR_Range (Context, Plain (Low) & "/" & Plain (High));
      Local_Bounds : constant String :=
        (if Localized_Bounds.Status = Humanize.Status.Ok
         then Ada.Strings.Unbounded.To_String (Localized_Bounds.Text) else Bounds);
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      elsif Contains_Value (Value, Low, High, Boundary) then
         return Say
           (Context, Plain (Value) & " " & Number_Phrase (Context, Phrase_Is_Within) & " " & Bounds,
            "number.within", "value", Number_Text (Context, Value), "bounds", Local_Bounds);
      elsif Value < Low or else (Value = Low and then Boundary in
        Exclusive_Range | Include_High_Only)
      then
         return Say
           (Context, Plain (Value) & " " & Number_Phrase (Context, Phrase_Is_Below) & " " & Bounds,
            "number.below", "value", Number_Text (Context, Value), "bounds", Local_Bounds);
      else
         return Say
           (Context, Plain (Value) & " " & Number_Phrase (Context, Phrase_Is_Above) & " " & Bounds,
            "number.above", "value", Number_Text (Context, Value), "bounds", Local_Bounds);
      end if;
   end Range_Position;

   function Ratio
     (Context : Humanize.Contexts.Context;
      Left    : Natural;
      Right   : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text
        (Natural_Text (Left) & ":" & Natural_Text (Right));
   end Ratio;

   function Ratio_Per
     (Context              : Humanize.Contexts.Context;
      Numerator            : Natural;
      Denominator          : Positive;
      Numerator_Singular   : String;
      Denominator_Singular : String;
      Numerator_Plural     : String := "";
      Denominator_Plural   : String := "")
      return Humanize.Status.Text_Result
   is
      --  The nouns by the locale's plural rules and registered forms.
      Numerator_Text : constant String :=
        Natural_Text (Numerator) & " "
        & Humanize.I18N_Rendering.Noun
            (Context, Long_Float (Numerator), Numerator_Singular, Numerator_Plural,
             English => Plural_Text (Numerator, Numerator_Singular, Numerator_Plural));
      Denominator_Text : constant String :=
        (if Denominator = 1 then
            Plural_Text
              (1, Denominator_Singular, Denominator_Plural)
         else
            Natural_Text (Natural (Denominator)) & " "
            & Humanize.I18N_Rendering.Noun
                (Context, Long_Float (Denominator), Denominator_Singular, Denominator_Plural,
                 English => Plural_Text (Denominator, Denominator_Singular, Denominator_Plural)));
   begin
      return Say
        (Context, Numerator_Text & " " & Number_Phrase (Context, Phrase_Per) & " " & Denominator_Text,
         "number.per", "numerator", Numerator_Text, "denominator", Denominator_Text);
   end Ratio_Per;

   function One_In
     (Context : Humanize.Contexts.Context;
      Denominator : Positive)
      return Humanize.Status.Text_Result
   is
   begin
      return Say
        (Context, "1 " & Number_Phrase (Context, Phrase_In) & " " & Natural_Text (Natural (Denominator)),
         "number.one_in", "whole", Number_Text (Context, Long_Long_Integer (Denominator)));
   end One_In;

   function Out_Of
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Total   : Positive)
      return Humanize.Status.Text_Result
   is
   begin
      return Say
        (Context, Natural_Text (Count) & " " & Number_Phrase (Context, Phrase_Out_Of) & " "
         & Natural_Text (Natural (Total)),
         "number.out_of", "value", Number_Text (Context, Long_Long_Integer (Count)), "whole",
         Number_Text (Context, Long_Long_Integer (Total)));
   end Out_Of;

   function Direction_Of_Change
     (Value : Long_Float)
      return Change_Direction
   is
   begin
      if Value > 0.0 then
         return Change_Up;
      elsif Value < 0.0 then
         return Change_Down;
      else
         return Change_None;
      end if;
   end Direction_Of_Change;

   function Change_Number_Text
     (Value   : Long_Float;
      Options : Change_Options)
      return String
   is
   begin
      return Humanize.Decimal_Images.Decimal_Image
        (Value,
         Options.Number_Style.Maximum_Fraction_Digits,
         Options.Number_Style.Suppress_Trailing_Zero);
   end Change_Number_Text;

   function Compose_Change
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Float;
      Quantity : String;
      Options  : Change_Options;
      Tail     : String := "")
      return Humanize.Status.Text_Result
   is
      Direction : constant Change_Direction := Direction_Of_Change (Value);
      Full_Quantity : constant String :=
        (if Tail'Length = 0 then Quantity else Quantity & " " & Tail);
   begin
      if Direction = Change_None and then Options.Zero_Style = Unchanged_Zero then
         return Say (Context, Number_Phrase (Context, Phrase_Unchanged), "number.unchanged", "", "");
      end if;

      case Options.Style is
         when Directional_Change =>
            case Direction is
               when Change_Up =>
                  return Say (Context, Number_Phrase (Context, Phrase_Up) & " " & Full_Quantity,
                              "number.change_up", "quantity", Full_Quantity);
               when Change_Down =>
                  return Say (Context, Number_Phrase (Context, Phrase_Down) & " " & Full_Quantity,
                              "number.change_down", "quantity", Full_Quantity);
               when Change_None =>
                  return Ok_Text (Full_Quantity);
            end case;
         when Signed_Change =>
            case Direction is
               when Change_Up =>
                  return Ok_Text ("+" & Full_Quantity);
               when Change_Down =>
                  return Ok_Text ("-" & Full_Quantity);
               when Change_None =>
                  return Ok_Text (Full_Quantity);
            end case;
         when Comparative_Change =>
            case Direction is
               when Change_Up =>
                  return Say
                    (Context, Quantity & " " & Number_Phrase (Context, Phrase_More)
                     & (if Tail'Length = 0 then "" else " " & Tail),
                     "number.change_more", "quantity", Quantity, "tail", Tail);
               when Change_Down =>
                  return Say
                    (Context, Quantity & " " & Number_Phrase (Context, Phrase_Fewer)
                     & (if Tail'Length = 0 then "" else " " & Tail),
                     "number.change_fewer", "quantity", Quantity, "tail", Tail);
               when Change_None =>
                  return Ok_Text (Full_Quantity);
            end case;
      end case;
   end Compose_Change;

   function Append_Since
     (Context : Humanize.Contexts.Context;
      Base    : Humanize.Status.Text_Result;
      Since : String)
      return Humanize.Status.Text_Result
   is
   begin
      if Base.Status /= Humanize.Status.Ok or else Since'Length = 0 then
         return Base;
      else
         return Say
           (Context, Result_Text (Base) & " " & Number_Phrase (Context, Phrase_Since) & " " & Since,
            "number.since", "change", Result_Text (Base), "since", Since);
      end if;
   end Append_Since;

   function Change
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
      Quantity : constant String := Change_Number_Text (abs Value, Options);
   begin
      return Compose_Change (Context, Value, Quantity, Options);
   end Change;

   function Change_Since
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Since   : String;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Append_Since (Context, Change (Context, Value, Options), Since);
   end Change_Since;

   function Change_From
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Options  : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Change (Context, Current - Previous, Options);
   end Change_From;

   function Percent_Change
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
      Quantity : constant Humanize.Status.Text_Result :=
        Percent (Context, abs Value, Options.Number_Style);
   begin
      if Quantity.Status /= Humanize.Status.Ok then
         return Quantity;
      end if;
      return Compose_Change (Context, Value, Result_Text (Quantity), Options);
   end Percent_Change;

   function Percent_Delta
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Options  : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if Previous = 0.0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      else
         return Percent_Change
           (Context, ((Current - Previous) / abs Previous) * 100.0, Options);
      end if;
   end Percent_Delta;

   function Point_Change
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Value : constant Long_Float := abs Value;
      Quantity  : constant String :=
        Change_Number_Text (Abs_Value, Options);
   begin
      return Compose_Change
        (Context, Value, Quantity, Options,
         (if Abs_Value = 1.0 then "point" else "points"));
   end Point_Change;

   function Unit_Change
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Float;
      Singular : String;
      Plural   : String := "";
      Options  : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Value : constant Long_Float := abs Value;
      Quantity  : constant String :=
        Change_Number_Text (Abs_Value, Options);
   begin
      if Singular'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      else
         return Compose_Change
           (Context, Value, Quantity, Options,
            Humanize.I18N_Rendering.Noun
              (Context, Abs_Value, Singular, Plural,
               English => Plural_Text ((if Abs_Value = 1.0 then 1 else 2), Singular, Plural)));
      end if;
   end Unit_Change;

   procedure Bounded_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Maximum : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Suffix  : String := "+")
   is
      Display : constant Long_Long_Integer :=
        (if Value > Maximum then Maximum else Value);
      Image   : constant String :=
        Integer_Text (Display);
   begin
      Humanize.I18N_Rendering.Render_Into
        (Context,
         Humanize.Selections.Value_Suffix
           (Humanize.Message_Keys.Number_Bounded,
            Image,
            (if Value > Maximum then Suffix else "")),
         Target,
         Written,
         Status);
   end Bounded_Number_Into;

   procedure Number_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Range_Options := Default_Number_Range_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Number_Range (Context, Low, High, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Number_Range_Into;

   procedure Approximate_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Range_Options := Default_Number_Range_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Approximate_Range (Context, Low, High, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Approximate_Range_Into;

   procedure Decimal_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Float;
      High    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Decimal_Range (Context, Low, High, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Decimal_Range_Into;

   procedure Uncertainty_Label_Into
     (Context     : Humanize.Contexts.Context;
      Value       : Long_Float;
      Uncertainty : Long_Float;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Options     : Number_Options := Default_Number_Options;
      Style       : Uncertainty_Style := Plus_Minus_Uncertainty)
   is
      Result : constant Humanize.Status.Text_Result :=
        Uncertainty_Label (Context, Value, Uncertainty, Options, Style);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Uncertainty_Label_Into;

   procedure Decimal_Range_Words_Into
     (Context         : Humanize.Contexts.Context;
      Low             : Long_Float;
      High            : Long_Float;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Fraction_Digits : Natural := 2)
   is
      Result : constant Humanize.Status.Text_Result :=
        Decimal_Range_Words (Context, Low, High, Fraction_Digits);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Decimal_Range_Words_Into;

   procedure Uncertainty_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Uncertainty     : Long_Float;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Fraction_Digits : Natural := 1)
   is
      Result : constant Humanize.Status.Text_Result :=
        Uncertainty_Words (Context, Value, Uncertainty, Fraction_Digits);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Uncertainty_Words_Into;

   procedure Under_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Under_Number (Context, Value);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Under_Number_Into;

   procedure Up_To_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Up_To (Context, Value);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Up_To_Into;

   procedure Between_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Between (Context, Low, High);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Between_Into;

   procedure Qualified_Range_Into
     (Context  : Humanize.Contexts.Context;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Boundary : Range_Boundary_Style := Inclusive_Range)
   is
      Result : constant Humanize.Status.Text_Result :=
        Qualified_Range (Context, Low, High, Boundary);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Qualified_Range_Into;

   procedure Tolerance_Range_Into
     (Context   : Humanize.Contexts.Context;
      Center    : Long_Long_Integer;
      Tolerance : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Tolerance_Range (Context, Center, Tolerance);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Tolerance_Range_Into;

   procedure Threshold_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Long_Long_Integer;
      Direction : Threshold_Direction;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Threshold (Context, Value, Direction);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Threshold_Into;

   procedure Range_Position_Into
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Long_Integer;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Boundary : Range_Boundary_Style := Inclusive_Range)
   is
      Result : constant Humanize.Status.Text_Result :=
        Range_Position (Context, Value, Low, High, Boundary);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Range_Position_Into;

   procedure Ratio_Into
     (Context : Humanize.Contexts.Context;
      Left    : Natural;
      Right   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Ratio (Context, Left, Right);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Ratio_Into;

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
   is
      Result : constant Humanize.Status.Text_Result :=
        Ratio_Per
          (Context, Numerator, Denominator, Numerator_Singular,
           Denominator_Singular, Numerator_Plural, Denominator_Plural);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Ratio_Per_Into;

   procedure One_In_Into
     (Context : Humanize.Contexts.Context;
      Denominator : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        One_In (Context, Denominator);
   begin
      Copy_Result (Result, Target, Written, Status);
   end One_In_Into;

   procedure Out_Of_Into
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Out_Of (Context, Count, Total);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Out_Of_Into;

   procedure Change_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Change (Context, Value, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Change_Into;

   procedure Change_Since_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Since   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Change_Since (Context, Value, Since, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Change_Since_Into;

   procedure Change_From_Into
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Change_From (Context, Current, Previous, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Change_From_Into;

   procedure Percent_Change_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Percent_Change (Context, Value, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Percent_Change_Into;

   procedure Percent_Delta_Into
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Percent_Delta (Context, Current, Previous, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Percent_Delta_Into;

   procedure Point_Change_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Point_Change (Context, Value, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Point_Change_Into;

   procedure Unit_Change_Into
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Float;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "";
      Options  : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Unit_Change (Context, Value, Singular, Plural, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Unit_Change_Into;

end Humanize.Numbers.Ranges;
