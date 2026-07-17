with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Decimal_Images;
with Humanize.I18N_Rendering;
with Humanize.Number_Classification;

package body Humanize.Numbers.Scales is
   use type Humanize.Status.Status_Code;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Integer_Text (Value : Long_Long_Integer) return String
      renames Humanize.Bounded_Text.Image;

   function Signed_Text (Value : Integer) return String
      renames Humanize.Bounded_Text.Signed_Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function GCD (Left, Right : Natural) return Natural is
      A : Natural := Left;
      B : Natural := Right;
      T : Natural;
   begin
      while B /= 0 loop
         T := A mod B;
         A := B;
         B := T;
      end loop;
      return (if A = 0 then 1 else A);
   end GCD;

   function Scientific_Text
     (Value   : Long_Float;
      Options : Number_Options;
      Style   : Scientific_Style)
      return String
   is
      Mantissa : Long_Float := Value;
      Exponent : Integer := 0;
   begin
      if Value = 0.0 then
         return "0e0";
      end if;

      while abs Mantissa >= 10.0 loop
         Mantissa := Mantissa / 10.0;
         Exponent := Exponent + 1;
      end loop;
      while abs Mantissa < 1.0 loop
         Mantissa := Mantissa * 10.0;
         Exponent := Exponent - 1;
      end loop;

      if Style = Engineering then
         while Exponent mod 3 /= 0 loop
            Mantissa := Mantissa * 10.0;
            Exponent := Exponent - 1;
         end loop;
      end if;

      return Humanize.Decimal_Images.Decimal_Image
          (Mantissa, Options.Maximum_Fraction_Digits,
           Options.Suppress_Trailing_Zero)
        & (if Style = Engineering then "E" else "e")
        & Signed_Text (Exponent);
   end Scientific_Text;

   function Scientific_Notation
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Number_Options := Default_Number_Options;
      Style   : Scientific_Style := Scientific)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text (Scientific_Text (Value, Options, Style));
   end Scientific_Notation;

   procedure Scientific_Notation_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options;
      Style   : Scientific_Style := Scientific)
   is
      Result : constant Humanize.Status.Text_Result :=
        Scientific_Notation (Context, Value, Options, Style);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Scientific_Notation_Into;

   function SI_Prefix_Symbol (Exponent : Integer) return String is
   begin
      case Exponent is
         when -24 => return "y";
         when -21 => return "z";
         when -18 => return "a";
         when -15 => return "f";
         when -12 => return "p";
         when -9  => return "n";
         when -6  => return "u";
         when -3  => return "m";
         when 0   => return "";
         when 3   => return "k";
         when 6   => return "M";
         when 9   => return "G";
         when 12  => return "T";
         when 15  => return "P";
         when 18  => return "E";
         when 21  => return "Z";
         when 24  => return "Y";
         when others => return "";
      end case;
   end SI_Prefix_Symbol;

   function SI_Prefix_Name (Exponent : Integer) return String is
   begin
      case Exponent is
         when -24 => return "yocto";
         when -21 => return "zepto";
         when -18 => return "atto";
         when -15 => return "femto";
         when -12 => return "pico";
         when -9  => return "nano";
         when -6  => return "micro";
         when -3  => return "milli";
         when 0   => return "";
         when 3   => return "kilo";
         when 6   => return "mega";
         when 9   => return "giga";
         when 12  => return "tera";
         when 15  => return "peta";
         when 18  => return "exa";
         when 21  => return "zetta";
         when 24  => return "yotta";
         when others => return "";
      end case;
   end SI_Prefix_Name;

   function SI_Prefix
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String := "";
      Options : SI_Prefix_Options := Default_SI_Prefix_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Scaled   : Long_Float := Value;
      Exponent : Integer := 0;
   begin
      if Value /= 0.0 then
         while abs Scaled >= 1000.0 and then Exponent < 24 loop
            Scaled := Scaled / 1000.0;
            Exponent := Exponent + 3;
         end loop;

         while abs Scaled < 1.0 and then Exponent > -24 loop
            Scaled := Scaled * 1000.0;
            Exponent := Exponent - 3;
         end loop;
      end if;

      declare
         Number : constant String :=
           Humanize.Decimal_Images.Decimal_Image
             (Scaled,
              Options.Number_Style.Maximum_Fraction_Digits,
              Options.Number_Style.Suppress_Trailing_Zero);
         Prefix : constant String :=
           (if Options.Prefix_Style = SI_Symbol
            then SI_Prefix_Symbol (Exponent)
            else SI_Prefix_Name (Exponent));
         Suffix : constant String := Prefix & Unit;
         Space  : constant String :=
           (if Options.Space_Before_Unit
            and then Suffix'Length > 0 then " " else "");
      begin
         return Ok_Text (Number & Space & Suffix);
      end;
   end SI_Prefix;

   procedure SI_Prefix_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "";
      Options : SI_Prefix_Options := Default_SI_Prefix_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        SI_Prefix (Context, Value, Unit, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end SI_Prefix_Into;

   function Currency
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Code'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return Ok_Text
        (Humanize.Decimal_Images.Decimal_Image
           (Amount, Options.Maximum_Fraction_Digits,
            Options.Suppress_Trailing_Zero)
         & " " & Code);
   end Currency;

   procedure Currency_Into
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Currency (Context, Amount, Code, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Currency_Into;

   function Approximate_Currency
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Kind    : Approximation_Kind := About;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Currency (Context, Amount, Code, Options);
      Prefix : constant String :=
        (case Kind is
            when About  => "about ",
            when Almost => "almost ",
            when Over   => "over ",
            when Under  => "under ");
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;
      return Ok_Text (Prefix & Result_Text (Base));
   end Approximate_Currency;

   procedure Approximate_Currency_Into
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Approximation_Kind := About;
      Options : Number_Options := Default_Number_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Approximate_Currency (Context, Amount, Code, Kind, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Approximate_Currency_Into;

   function Fractional
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Fraction_Options := Default_Fraction_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Sign       : constant String := (if Value < 0.0 then "-" else "");
      Abs_Value  : constant Long_Float := abs Value;
      Whole      : constant Natural := Natural (Long_Float'Floor (Abs_Value));
      Fraction   : constant Long_Float := Abs_Value - Long_Float (Whole);
      Denominator : constant Natural := Options.Max_Denominator;
      Numerator   : constant Natural :=
        Natural (Long_Float'Rounding (Fraction * Long_Float (Denominator)));
   begin
      if Numerator = 0 then
         return Ok_Text (Sign & Natural_Text (Whole));
      elsif Numerator = Denominator then
         return Ok_Text (Sign & Natural_Text (Whole + 1));
      else
         declare
            Divisor : constant Natural := GCD (Numerator, Denominator);
            Num     : constant Natural := Numerator / Divisor;
            Den     : constant Natural := Denominator / Divisor;
            Frac    : constant String :=
              Natural_Text (Num) & "/" & Natural_Text (Den);
            Text    : constant String :=
              (if Whole = 0 then Sign & Frac
               else Sign & Natural_Text (Whole) & " " & Frac);
         begin
            return Ok_Text (Text);
         end;
      end if;
   end Fractional;

   procedure Fractional_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Fraction_Options := Default_Fraction_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Fractional (Context, Value, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Fractional_Into;

   function Roman
     (Value : Natural)
      return Humanize.Status.Text_Result
   is
      type Roman_Pair is record
         Value : Natural;
         Text  : String (1 .. 2);
         Len   : Natural;
      end record;

      Pairs : constant array (Positive range <>) of Roman_Pair :=
        [Roman_Pair'(Value => 1000, Text => "M ", Len => 1),
         Roman_Pair'(Value => 900,  Text => "CM", Len => 2),
         Roman_Pair'(Value => 500,  Text => "D ", Len => 1),
         Roman_Pair'(Value => 400,  Text => "CD", Len => 2),
         Roman_Pair'(Value => 100,  Text => "C ", Len => 1),
         Roman_Pair'(Value => 90,   Text => "XC", Len => 2),
         Roman_Pair'(Value => 50,   Text => "L ", Len => 1),
         Roman_Pair'(Value => 40,   Text => "XL", Len => 2),
         Roman_Pair'(Value => 10,   Text => "X ", Len => 1),
         Roman_Pair'(Value => 9,    Text => "IX", Len => 2),
         Roman_Pair'(Value => 5,    Text => "V ", Len => 1),
         Roman_Pair'(Value => 4,    Text => "IV", Len => 2),
         Roman_Pair'(Value => 1,    Text => "I ", Len => 1)];
      Remaining : Natural := Value;
      Result    : Unbounded_String;
   begin
      if Value = 0 or else Value > 3_999 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      for Pair of Pairs loop
         while Remaining >= Pair.Value loop
            Append (Result, Pair.Text (1 .. Pair.Len));
            Remaining := Remaining - Pair.Value;
         end loop;
      end loop;

      return Ok_Text (To_String (Result));
   end Roman;

   procedure Roman_Into
     (Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Roman (Value);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Roman_Into;

   function Ordinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Gender  : Ordinal_Gender := Masculine)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.I18N_Rendering.Render
               (Context,
                Humanize.Number_Classification.Ordinal (Value, Gender));
   end Ordinal;

   procedure Ordinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Gender  : Ordinal_Gender := Masculine)
   is
   begin
      Humanize.I18N_Rendering.Render_Into
        (Context, Humanize.Number_Classification.Ordinal (Value, Gender),
         Target, Written, Status);
   end Ordinal_Into;

   function Compact
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Options : Number_Options := Default_Number_Options;
      Style   : Compact_Style := Short)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.I18N_Rendering.Render
               (Context,
         Humanize.Number_Classification.Compact
                  (Context, Value, Options, Style));
   end Compact;

   procedure Compact_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options;
      Style   : Compact_Style := Short)
   is
   begin
      Humanize.I18N_Rendering.Render_Into
        (Context,
         Humanize.Number_Classification.Compact
           (Context, Value, Options, Style),
         Target, Written, Status);
   end Compact_Into;

   function Percent
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.I18N_Rendering.Render
               (Context,
         Humanize.Number_Classification.Percent
                  (Value, Options));
   end Percent;

   function Accessible_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
   begin
      return Signed_Cardinal (Context, Value);
   end Accessible_Number;

   procedure Accessible_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Accessible_Number (Context, Value);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Accessible_Number_Into;

   procedure Percent_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options)
   is
   begin
      Humanize.I18N_Rendering.Render_Into
        (Context,
         Humanize.Number_Classification.Percent
           (Value, Options),
         Target, Written, Status);
   end Percent_Into;

   function Prefix (Kind : Approximation_Kind) return String is
   begin
      case Kind is
         when About =>
            return "about";
         when Almost =>
            return "almost";
         when Over =>
            return "over";
         when Under =>
            return "under";
      end case;
   end Prefix;

   function Approximate
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Kind    : Approximation_Kind := About)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text
        (Prefix (Kind) & " " & Integer_Text (Value));
   end Approximate;

   procedure Approximate_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Approximation_Kind := About)
   is
      Result : constant Humanize.Status.Text_Result :=
        Approximate (Context, Value, Kind);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Approximate_Into;

   function Abs_Diff
     (Left  : Long_Long_Integer;
      Right : Long_Long_Integer)
      return Long_Long_Integer
   is
   begin
      if Left >= Right then
         return Left - Right;
      else
         return Right - Left;
      end if;
   end Abs_Diff;

   function Approximate_To
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : Long_Long_Integer;
      Options : Approximation_Options := Default_Approximation_Options)
      return Humanize.Status.Text_Result
   is
      Threshold : constant Long_Long_Integer :=
        (if Options.Threshold < 0 then 0 else Options.Threshold);
   begin
      if Value < Target and then Target - Value <= Threshold then
         return Approximate (Context, Target, Almost);
      elsif Abs_Diff (Value, Target) <= Threshold then
         return Approximate (Context, Target, About);
      elsif Value > Target then
         return Approximate (Context, Target, Over);
      else
         return Approximate (Context, Target, Under);
      end if;
   end Approximate_To;

   procedure Approximate_To_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : Long_Long_Integer;
      Target_Buffer : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Approximation_Options := Default_Approximation_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Approximate_To (Context, Value, Target, Options);
   begin
      Copy_Result
        (Result, Target_Buffer, Written, Status);
   end Approximate_To_Into;

end Humanize.Numbers.Scales;
