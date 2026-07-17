with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Decimal_Images;
with Humanize.I18N_Rendering;
with Humanize.Locales;
with Humanize.Messages;
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
           (Humanize.Messages.Number_Bounded,
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

   function Number_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Options : Number_Range_Options := Default_Number_Range_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Sep : constant String :=
        (if Options.Spaces_Around
         then " " & Options.Separator & " "
         else [1 => Options.Separator]);
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;
      return Ok_Text (Plain (Low) & Sep & Plain (High));
   end Number_Range;

   function Approximate_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Options : Number_Range_Options := Default_Number_Range_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Number_Range (Context, Low, High, Options);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;
      return Ok_Text
        (Number_Phrase (Context, Phrase_About) & " " & Result_Text (Base));
   end Approximate_Range;

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
   is
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      return Ok_Text
        (Decimal_Text (Low, Options) & " "
         & Number_Phrase (Context, Phrase_To) & " "
         & Decimal_Text (High, Options));
   end Decimal_Range;

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

      return Ok_Text
        (Result_Text (Left) & " "
         & Number_Phrase (Context, Phrase_To) & " "
         & Result_Text (Right));
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

      return Ok_Text
        (Result_Text (Center) & " plus or minus "
         & Result_Text (Delta_Text));
   end Uncertainty_Words;

   function Under_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Number_Phrase (Context, Phrase_Under) & " " & Plain (Value));
   end Under_Number;

   function Up_To
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Number_Phrase (Context, Phrase_Up_To) & " " & Plain (Value));
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
      return Ok_Text
        (Number_Phrase (Context, Phrase_Between) & " " & Plain (Low) & " "
         & Number_Phrase (Context, Phrase_And) & " " & Plain (High));
   end Between;

   function Range_Text
     (Low  : Long_Long_Integer;
      High : Long_Long_Integer)
      return String
   is
   begin
      return Plain (Low) & "-" & Plain (High);
   end Range_Text;

   function Number_Phrase
     (Context : Humanize.Contexts.Context;
      Key     : Number_Phrase_Key)
      return String
   is
      Locale : constant String := Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
   begin
      if Locale = "da" then
         case Key is
            when Phrase_About        => return "cirka";
            when Phrase_Under        => return "under";
            when Phrase_Up_To        => return "op til";
            when Phrase_Between      => return "mellem";
            when Phrase_And          => return "og";
            when Phrase_To           => return "til";
            when Phrase_Inclusive    => return "inklusive";
            when Phrase_Greater_Than => return "storre end";
            when Phrase_Or_More      => return "eller mere";
            when Phrase_At_Least     => return "mindst";
            when Phrase_More_Than    => return "mere end";
            when Phrase_At_Most      => return "hojst";
            when Phrase_Less_Than    => return "mindre end";
            when Phrase_Exactly      => return "praecis";
            when Phrase_Is_Within    => return "er inden for";
            when Phrase_Is_Below     => return "er under";
            when Phrase_Is_Above     => return "er over";
            when Phrase_Per          => return "per";
            when Phrase_In           => return "ud af";
            when Phrase_Out_Of       => return "ud af";
            when Phrase_Unchanged    => return "uaendret";
            when Phrase_Up           => return "op";
            when Phrase_Down         => return "ned";
            when Phrase_More         => return "mere";
            when Phrase_Fewer        => return "faerre";
            when Phrase_Since        => return "siden";
         end case;
      elsif Locale = "de" then
         case Key is
            when Phrase_About        => return "ungefaehr";
            when Phrase_Under        => return "unter";
            when Phrase_Up_To        => return "bis zu";
            when Phrase_Between      => return "zwischen";
            when Phrase_And          => return "und";
            when Phrase_To           => return "bis";
            when Phrase_Inclusive    => return "einschliesslich";
            when Phrase_Greater_Than => return "groesser als";
            when Phrase_Or_More      => return "oder mehr";
            when Phrase_At_Least     => return "mindestens";
            when Phrase_More_Than    => return "mehr als";
            when Phrase_At_Most      => return "hoechstens";
            when Phrase_Less_Than    => return "weniger als";
            when Phrase_Exactly      => return "genau";
            when Phrase_Is_Within    => return "liegt innerhalb von";
            when Phrase_Is_Below     => return "liegt unter";
            when Phrase_Is_Above     => return "liegt ueber";
            when Phrase_Per          => return "pro";
            when Phrase_In           => return "von";
            when Phrase_Out_Of       => return "von";
            when Phrase_Unchanged    => return "unveraendert";
            when Phrase_Up           => return "plus";
            when Phrase_Down         => return "minus";
            when Phrase_More         => return "mehr";
            when Phrase_Fewer        => return "weniger";
            when Phrase_Since        => return "seit";
         end case;
      elsif Locale = "fr" then
         case Key is
            when Phrase_About        => return "environ";
            when Phrase_Under        => return "moins de";
            when Phrase_Up_To        => return "jusqu'a";
            when Phrase_Between      => return "entre";
            when Phrase_And          => return "et";
            when Phrase_To           => return "a";
            when Phrase_Inclusive    => return "inclus";
            when Phrase_Greater_Than => return "superieur a";
            when Phrase_Or_More      => return "ou plus";
            when Phrase_At_Least     => return "au moins";
            when Phrase_More_Than    => return "plus de";
            when Phrase_At_Most      => return "au plus";
            when Phrase_Less_Than    => return "moins de";
            when Phrase_Exactly      => return "exactement";
            when Phrase_Is_Within    => return "est dans";
            when Phrase_Is_Below     => return "est sous";
            when Phrase_Is_Above     => return "est au-dessus de";
            when Phrase_Per          => return "par";
            when Phrase_In           => return "sur";
            when Phrase_Out_Of       => return "sur";
            when Phrase_Unchanged    => return "inchange";
            when Phrase_Up           => return "en hausse de";
            when Phrase_Down         => return "en baisse de";
            when Phrase_More         => return "de plus";
            when Phrase_Fewer        => return "de moins";
            when Phrase_Since        => return "depuis";
         end case;
      elsif Locale = "es" then
         case Key is
            when Phrase_About        => return "aproximadamente";
            when Phrase_Under        => return "menos de";
            when Phrase_Up_To        => return "hasta";
            when Phrase_Between      => return "entre";
            when Phrase_And          => return "y";
            when Phrase_To           => return "a";
            when Phrase_Inclusive    => return "inclusive";
            when Phrase_Greater_Than => return "mayor que";
            when Phrase_Or_More      => return "o mas";
            when Phrase_At_Least     => return "al menos";
            when Phrase_More_Than    => return "mas de";
            when Phrase_At_Most      => return "como maximo";
            when Phrase_Less_Than    => return "menos de";
            when Phrase_Exactly      => return "exactamente";
            when Phrase_Is_Within    => return "esta dentro de";
            when Phrase_Is_Below     => return "esta por debajo de";
            when Phrase_Is_Above     => return "esta por encima de";
            when Phrase_Per          => return "por";
            when Phrase_In           => return "en";
            when Phrase_Out_Of       => return "de";
            when Phrase_Unchanged    => return "sin cambios";
            when Phrase_Up           => return "sube";
            when Phrase_Down         => return "baja";
            when Phrase_More         => return "mas";
            when Phrase_Fewer        => return "menos";
            when Phrase_Since        => return "desde";
         end case;
      elsif Locale = "it" then
         case Key is
            when Phrase_About        => return "circa";
            when Phrase_Under        => return "meno di";
            when Phrase_Up_To        => return "fino a";
            when Phrase_Between      => return "tra";
            when Phrase_And          => return "e";
            when Phrase_To           => return "a";
            when Phrase_Inclusive    => return "incluso";
            when Phrase_Greater_Than => return "maggiore di";
            when Phrase_Or_More      => return "o piu";
            when Phrase_At_Least     => return "almeno";
            when Phrase_More_Than    => return "piu di";
            when Phrase_At_Most      => return "al massimo";
            when Phrase_Less_Than    => return "meno di";
            when Phrase_Exactly      => return "esattamente";
            when Phrase_Is_Within    => return "e entro";
            when Phrase_Is_Below     => return "e sotto";
            when Phrase_Is_Above     => return "e sopra";
            when Phrase_Per          => return "per";
            when Phrase_In           => return "su";
            when Phrase_Out_Of       => return "su";
            when Phrase_Unchanged    => return "invariato";
            when Phrase_Up           => return "su";
            when Phrase_Down         => return "giu";
            when Phrase_More         => return "in piu";
            when Phrase_Fewer        => return "in meno";
            when Phrase_Since        => return "da";
         end case;
      elsif Locale = "pt" then
         case Key is
            when Phrase_About        => return "aproximadamente";
            when Phrase_Under        => return "menos de";
            when Phrase_Up_To        => return "ate";
            when Phrase_Between      => return "entre";
            when Phrase_And          => return "e";
            when Phrase_To           => return "a";
            when Phrase_Inclusive    => return "inclusive";
            when Phrase_Greater_Than => return "maior que";
            when Phrase_Or_More      => return "ou mais";
            when Phrase_At_Least     => return "pelo menos";
            when Phrase_More_Than    => return "mais de";
            when Phrase_At_Most      => return "no maximo";
            when Phrase_Less_Than    => return "menos de";
            when Phrase_Exactly      => return "exatamente";
            when Phrase_Is_Within    => return "esta dentro de";
            when Phrase_Is_Below     => return "esta abaixo de";
            when Phrase_Is_Above     => return "esta acima de";
            when Phrase_Per          => return "por";
            when Phrase_In           => return "em";
            when Phrase_Out_Of       => return "de";
            when Phrase_Unchanged    => return "inalterado";
            when Phrase_Up           => return "sobe";
            when Phrase_Down         => return "desce";
            when Phrase_More         => return "mais";
            when Phrase_Fewer        => return "menos";
            when Phrase_Since        => return "desde";
         end case;
      elsif Locale = "nl" then
         case Key is
            when Phrase_About        => return "ongeveer";
            when Phrase_Under        => return "onder";
            when Phrase_Up_To        => return "tot";
            when Phrase_Between      => return "tussen";
            when Phrase_And          => return "en";
            when Phrase_To           => return "tot";
            when Phrase_Inclusive    => return "inclusief";
            when Phrase_Greater_Than => return "groter dan";
            when Phrase_Or_More      => return "of meer";
            when Phrase_At_Least     => return "minstens";
            when Phrase_More_Than    => return "meer dan";
            when Phrase_At_Most      => return "hoogstens";
            when Phrase_Less_Than    => return "minder dan";
            when Phrase_Exactly      => return "precies";
            when Phrase_Is_Within    => return "ligt binnen";
            when Phrase_Is_Below     => return "ligt onder";
            when Phrase_Is_Above     => return "ligt boven";
            when Phrase_Per          => return "per";
            when Phrase_In           => return "op";
            when Phrase_Out_Of       => return "van";
            when Phrase_Unchanged    => return "ongewijzigd";
            when Phrase_Up           => return "omhoog";
            when Phrase_Down         => return "omlaag";
            when Phrase_More         => return "meer";
            when Phrase_Fewer        => return "minder";
            when Phrase_Since        => return "sinds";
         end case;
      else
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
      end if;
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
            return Ok_Text
              (Plain (Low) & " " & Number_Phrase (Context, Phrase_To) & " "
               & Plain (High) & " "
               & Number_Phrase (Context, Phrase_Inclusive));
         when Exclusive_Range =>
            return Ok_Text
              (Number_Phrase (Context, Phrase_Greater_Than) & " "
               & Plain (Low) & " " & Number_Phrase (Context, Phrase_And)
               & " " & Number_Phrase (Context, Phrase_Less_Than) & " "
               & Plain (High));
         when Include_Low_Only =>
            return Ok_Text
              (Plain (Low) & " " & Number_Phrase (Context, Phrase_Or_More)
               & " " & Number_Phrase (Context, Phrase_And) & " "
               & Number_Phrase (Context, Phrase_Less_Than) & " "
               & Plain (High));
         when Include_High_Only =>
            return Ok_Text
              (Number_Phrase (Context, Phrase_Greater_Than) & " "
               & Plain (Low) & " " & Number_Phrase (Context, Phrase_And)
               & " " & Number_Phrase (Context, Phrase_Up_To) & " "
               & Plain (High));
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
            return Ok_Text
              (Number_Phrase (Context, Phrase_At_Least) & " " & Plain (Value));
         when More_Than_Threshold =>
            return Ok_Text
              (Number_Phrase (Context, Phrase_More_Than) & " " & Plain (Value));
         when At_Most_Threshold =>
            return Ok_Text
              (Number_Phrase (Context, Phrase_At_Most) & " " & Plain (Value));
         when Less_Than_Threshold =>
            return Ok_Text
              (Number_Phrase (Context, Phrase_Less_Than) & " " & Plain (Value));
         when Exactly_Threshold =>
            return Ok_Text
              (Number_Phrase (Context, Phrase_Exactly) & " " & Plain (Value));
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
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      elsif Contains_Value (Value, Low, High, Boundary) then
         return Ok_Text
           (Plain (Value) & " " & Number_Phrase (Context, Phrase_Is_Within)
            & " " & Bounds);
      elsif Value < Low or else (Value = Low and then Boundary in
        Exclusive_Range | Include_High_Only)
      then
         return Ok_Text
           (Plain (Value) & " " & Number_Phrase (Context, Phrase_Is_Below)
            & " " & Bounds);
      else
         return Ok_Text
           (Plain (Value) & " " & Number_Phrase (Context, Phrase_Is_Above)
            & " " & Bounds);
      end if;
   end Range_Position;

   function Ratio
     (Context : Humanize.Contexts.Context;
      Left    : Natural;
      Right   : Natural)
      return Humanize.Status.Text_Result
   is
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
      Numerator_Text : constant String :=
        Natural_Text (Numerator) & " "
        & Plural_Text (Numerator, Numerator_Singular, Numerator_Plural);
      Denominator_Text : constant String :=
        (if Denominator = 1 then
            Plural_Text
              (1, Denominator_Singular, Denominator_Plural)
         else
            Natural_Text (Natural (Denominator)) & " "
            & Plural_Text
              (Denominator, Denominator_Singular, Denominator_Plural));
   begin
      return Ok_Text
        (Numerator_Text & " " & Number_Phrase (Context, Phrase_Per)
         & " " & Denominator_Text);
   end Ratio_Per;

   function One_In
     (Context : Humanize.Contexts.Context;
      Denominator : Positive)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("1 " & Number_Phrase (Context, Phrase_In) & " "
         & Natural_Text (Natural (Denominator)));
   end One_In;

   function Out_Of
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Total   : Positive)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Natural_Text (Count) & " "
         & Number_Phrase (Context, Phrase_Out_Of) & " "
         & Natural_Text (Natural (Total)));
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

   function Unit_Noun
     (Value    : Long_Float;
      Singular : String;
      Plural   : String)
      return String
   is (Plural_Text ((if abs Value = 1.0 then 1 else 2), Singular, Plural));

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
         return Ok_Text (Number_Phrase (Context, Phrase_Unchanged));
      end if;

      case Options.Style is
         when Directional_Change =>
            case Direction is
               when Change_Up =>
                  return Ok_Text
                    (Number_Phrase (Context, Phrase_Up) & " " & Full_Quantity);
               when Change_Down =>
                  return Ok_Text
                    (Number_Phrase (Context, Phrase_Down) & " " & Full_Quantity);
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
                  return Ok_Text
                    (Quantity & " " & Number_Phrase (Context, Phrase_More)
                     & (if Tail'Length = 0 then "" else " " & Tail));
               when Change_Down =>
                  return Ok_Text
                    (Quantity & " " & Number_Phrase (Context, Phrase_Fewer)
                     & (if Tail'Length = 0 then "" else " " & Tail));
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
         return Ok_Text
           (Result_Text (Base) & " "
            & Number_Phrase (Context, Phrase_Since) & " " & Since);
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
            Unit_Noun (Abs_Value, Singular, Plural));
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
           (Humanize.Messages.Number_Bounded,
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
