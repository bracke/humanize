with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Decimal_Images;

package body Humanize.Numbers.Editorial is
   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Integer_Text (Value : Long_Long_Integer) return String
      renames Humanize.Bounded_Text.Image;

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

   function Group_Integer_Image
     (Text    : String;
      Enabled : Boolean)
      return String
   is
      Sign   : constant String :=
        (if Text'Length > 0 and then Text (Text'First) = '-' then "-" else "");
      First  : constant Natural :=
        (if Sign'Length = 0 then Text'First else Text'First + 1);
      Count  : Natural := 0;
      Result : Unbounded_String;
   begin
      if not Enabled or else Text'Length <= Sign'Length + 3 then
         return Text;
      end if;

      Append (Result, Sign);
      for Index in First .. Text'Last loop
         if Count > 0 and then (Text'Last - Index + 1) mod 3 = 0 then
            Append (Result, ",");
         end if;
         Append (Result, Text (Index));
         Count := Count + 1;
      end loop;
      return To_String (Result);
   end Group_Integer_Image;

   function Group_Decimal_Image
     (Text    : String;
      Enabled : Boolean)
      return String
   is
      Dot : Natural := 0;
   begin
      if not Enabled then
         return Text;
      end if;

      for Index in Text'Range loop
         if Text (Index) = '.' then
            Dot := Index;
            exit;
         end if;
      end loop;

      if Dot = 0 then
         return Group_Integer_Image (Text, Enabled);
      elsif Dot = Text'First then
         return Text;
      else
         return Group_Integer_Image (Text (Text'First .. Dot - 1), Enabled)
           & Text (Dot .. Text'Last);
      end if;
   end Group_Decimal_Image;

   function Grouped_Integer
     (Value   : Long_Long_Integer;
      Options : Editorial_Number_Options)
      return String
   is
   begin
      return Group_Integer_Image
        (Integer_Text (Value), Options.Group_Digits);
   end Grouped_Integer;

   function Editorial_Decimal
     (Value   : Long_Float;
      Options : Number_Options)
      return String
   is
   begin
      return Group_Decimal_Image
        (Humanize.Decimal_Images.Decimal_Image
           (Value, Options.Maximum_Fraction_Digits,
            Options.Suppress_Trailing_Zero),
         Enabled => True);
   end Editorial_Decimal;

   function Should_Spell_Editorial
     (Value   : Long_Long_Integer;
      Usage   : Editorial_Number_Use;
      Options : Editorial_Number_Options)
      return Boolean
   is
      Limit : constant Natural :=
        (if Usage = Headline_Number
         then Natural (Options.Headline_Spell_Out_Below)
         else Natural (Options.Spell_Out_Below));
   begin
      if Value = 0 then
         return Options.Spell_Zero and then Limit > 0;
      elsif Value < 0 then
         return Value > -Long_Long_Integer (Limit);
      else
         return Value < Long_Long_Integer (Limit);
      end if;
   end Should_Spell_Editorial;

   function Editorial_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Usage   : Editorial_Number_Use := General_Number;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if Value = Long_Long_Integer'First then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      case Usage is
         when General_Number | Headline_Number =>
            if Should_Spell_Editorial (Value, Usage, Options) then
               return Signed_Cardinal (Context, Value);
            else
               return Ok_Text (Grouped_Integer (Value, Options));
            end if;
         when Age_Number | Measurement_Number =>
            return Ok_Text (Grouped_Integer (Value, Options));
         when Percent_Number =>
            return Ok_Text (Grouped_Integer (Value, Options) & "%");
         when Ordinal_Number =>
            if Value < 0 or else Value > Long_Long_Integer (Natural'Last) then
               return (Status => Humanize.Status.Invalid_Value, others => <>);
            end if;
            return Editorial_Ordinal (Context, Natural (Value), Options);
      end case;
   end Editorial_Number;

   procedure Editorial_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Usage   : Editorial_Number_Use := General_Number;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Editorial_Number (Context, Value, Usage, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Editorial_Number_Into;

   function Ordinal_Suffix (Value : Natural) return String is
      Last_Two : constant Natural := Value mod 100;
      Last_One : constant Natural := Value mod 10;
   begin
      if Last_Two in 11 .. 13 then
         return "th";
      end if;

      case Last_One is
         when 1 => return "st";
         when 2 => return "nd";
         when 3 => return "rd";
         when others => return "th";
      end case;
   end Ordinal_Suffix;

   function Editorial_Ordinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if Long_Long_Integer (Value) < Long_Long_Integer (Options.Spell_Out_Below)
      then
         return Ordinal_Words (Context, Value);
      else
         return Ok_Text
           (Group_Integer_Image
              (Natural_Text (Value), Options.Group_Digits)
            & Ordinal_Suffix (Value));
      end if;
   end Editorial_Ordinal;

   procedure Editorial_Ordinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Editorial_Ordinal (Context, Value, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Editorial_Ordinal_Into;

   function Editorial_Percent
     (Context        : Humanize.Contexts.Context;
      Value          : Long_Float;
      Number_Style   : Number_Options := Default_Number_Options;
      Include_Symbol : Boolean := True)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Number : constant String := Editorial_Decimal (Value, Number_Style);
   begin
      return Ok_Text
        (Number & (if Include_Symbol then "%" else " percent"));
   end Editorial_Percent;

   procedure Editorial_Percent_Into
     (Context        : Humanize.Contexts.Context;
      Value          : Long_Float;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Number_Style   : Number_Options := Default_Number_Options;
      Include_Symbol : Boolean := True)
   is
      Result : constant Humanize.Status.Text_Result :=
        Editorial_Percent (Context, Value, Number_Style, Include_Symbol);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Editorial_Percent_Into;

   function Editorial_Measurement
     (Context      : Humanize.Contexts.Context;
      Value        : Long_Float;
      Unit         : String;
      Number_Style : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Unit'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return Ok_Text (Editorial_Decimal (Value, Number_Style) & " " & Unit);
   end Editorial_Measurement;

   procedure Editorial_Measurement_Into
     (Context      : Humanize.Contexts.Context;
      Value        : Long_Float;
      Unit         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Number_Style : Number_Options := Default_Number_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Editorial_Measurement (Context, Value, Unit, Number_Style);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Editorial_Measurement_Into;

   function Editorial_Age
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : String := "years old")
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Unit'Length = 0 then
         return Ok_Text (Natural_Text (Value));
      else
         return Ok_Text (Natural_Text (Value) & " " & Unit);
      end if;
   end Editorial_Age;

   procedure Editorial_Age_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "years old")
   is
      Result : constant Humanize.Status.Text_Result :=
        Editorial_Age (Context, Value, Unit);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Editorial_Age_Into;
end Humanize.Numbers.Editorial;
