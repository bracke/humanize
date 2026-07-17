with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Numbers;
with Humanize.Parsing.Bytes;
with Humanize.Parsing.Implementation.Numeric_Text_Helpers;
with Humanize.Parsing.Support;
with Humanize.Status;

package body Humanize.Parsing.Implementation.Number_Text_Helpers is
   use Ada.Strings.Unbounded;
   use type Humanize.Status.Status_Code;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function B (Hex : String) return String
      renames Humanize.Bounded_Text.Hex_Bytes;
   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;
   function Upper (Text : String) return String
      renames Humanize.Bounded_Text.Upper_Text;
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;
   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;
   function Is_ASCII_Letter (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Letter;
   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;
   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;
   function Find_Substring (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;
   function Normalize_Native_Digits (Text : String) return String
      renames Humanize.Parsing.Support.Normalize_Native_Digits;
   function Has_Decimal_Comma (Text : String) return Boolean
      renames Humanize.Parsing.Support.Has_Decimal_Comma;
   function Numeric_Value
     (Text  : String;
      Value : out Long_Float)
      return Boolean
      renames Humanize.Parsing.Support.Numeric_Value;
   function Scan_End (Text : String) return Natural
      renames Humanize.Parsing.Support.Scan_End;
   function Scan_Number_End (Text : String) return Natural
      renames Humanize.Parsing.Support.Scan_Number_End;
   function Parse_Bytes
     (Text : String)
      return Byte_Parse_Result
      renames Humanize.Parsing.Bytes.Parse_Bytes;

   function Parse_Two_Naturals
     (Left_Text  : String;
      Right_Text : String;
      Left       : out Natural;
      Right      : out Natural)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Two_Naturals;
   function Parse_Digit_Word
     (Text  : String;
      Digit : out Natural)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Digit_Word;
   function Parse_Fraction_Denominator_Word
     (Text        : String;
      Denominator : out Natural)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Fraction_Denominator_Word;
   procedure Store
     (Source : String;
      Target : out String;
      Length : out Natural)
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Store;
   function Parse_Number_And_Tail
     (Text   : String;
      Value  : out Long_Float;
      Tail   : out Unbounded_String)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Number_And_Tail;
   function Strip_Grouping (Text : String) return String
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Strip_Grouping;
   function Singular_Unit (Text : String) return String
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Singular_Unit;

   function Parse_Number_Range
     (Text : String)
      return Number_Range_Parse_Result
      is separate;
   function Parse_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result
      is separate;
   function Parse_Decimal_Words_Value
     (Text  : String;
      Value : out Long_Float)
      return Boolean
      is separate;

   function Parse_Decimal_Range_Words
     (Text : String)
      return Decimal_Range_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Join : constant Natural := Find_Substring (Item, " to ");
      Low_Value : Long_Float := 0.0;
      High_Value : Long_Float := 0.0;
   begin
      if Join = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 Error_Position => Text'First,
                 others => <>);
      elsif not Parse_Decimal_Words_Value
        (Item (Item'First .. Join - 1), Low_Value)
        or else not Parse_Decimal_Words_Value
          (Item (Join + 4 .. Item'Last), High_Value)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 Error_Position => Join + 4,
                 others => <>);
      elsif High_Value < Low_Value then
         return (Status => Humanize.Status.Invalid_Value,
                 Error => Out_Of_Range,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Low => Low_Value,
         High => High_Value,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Decimal_Range_Words;

   function Parse_Fraction_Words
     (Text : String)
      return Proportion_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Space : Natural := 0;
      Numerator : Long_Long_Integer := 0;
      Denominator : Natural := 0;
   begin
      for Index in reverse Item'Range loop
         if Item (Index) = ' ' then
            Space := Index;
            exit;
         end if;
      end loop;
      if Space = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 Error_Position => Text'First,
                 others => <>);
      elsif not Humanize.Numbers.Parse_Deterministic_Cardinal
        (Item (Item'First .. Space - 1), Numerator)
        or else Numerator < 0
        or else not Parse_Fraction_Denominator_Word
          (Item (Space + 1 .. Item'Last), Denominator)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 Error_Position => Item'First,
                 others => <>);
      end if;
      return
        (Status => Humanize.Status.Ok,
         Count => Natural (Numerator),
         Total => Denominator,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Fraction_Words;

   function Parse_Percent_Words
     (Text : String)
      return Float_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Suffix : constant String := " percent";
      Value : Long_Float := 0.0;
   begin
      if not Ends_With (Item, Suffix) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Unit,
                 Error_Position => Text'First,
                 others => <>);
      elsif not Parse_Decimal_Words_Value
        (Item (Item'First .. Item'Last - Suffix'Length), Value)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 Error_Position => Text'First,
                 others => <>);
      end if;
      return
        (Status => Humanize.Status.Ok,
         Value => Value,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Percent_Words;

   function Parse_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result
      is separate;

   function Parse_Uncertainty_Words
     (Text : String)
      return Uncertainty_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Mark : constant String := " plus or minus ";
      Join : constant Natural := Find_Substring (Item, Mark);
      Center : Long_Float := 0.0;
      Amount : Long_Float := 0.0;
   begin
      if Join = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 Error_Position => Text'First,
                 others => <>);
      elsif not Parse_Decimal_Words_Value
        (Item (Item'First .. Join - 1), Center)
        or else not Parse_Decimal_Words_Value
          (Item (Join + Mark'Length .. Item'Last), Amount)
        or else Amount < 0.0
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 Error_Position => Join + Mark'Length,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Value => Center,
         Uncertainty => Amount,
         Low => Center - Amount,
         High => Center + Amount,
         Style => Humanize.Numbers.Plus_Minus_Uncertainty,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Uncertainty_Words;

   function Scan_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;
      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Uncertainty_Parse_Result :=
              Parse_Uncertainty_Label (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Uncertainty_Label;

   function Scan_Number_Range
     (Text : String)
      return Number_Range_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;
      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Number_Range_Parse_Result :=
              Parse_Number_Range (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Number_Range;

   function Scan_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;
      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Decimal_Range_Parse_Result :=
              Parse_Decimal_Range (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Decimal_Range;

   function Parse_Proportion
     (Text : String)
      return Proportion_Parse_Result
      is separate;

   function Scan_Proportion
     (Text : String)
      return Proportion_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;
      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Proportion_Parse_Result :=
              Parse_Proportion (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Proportion;

   function Compact_Multiplier (Unit : String) return Long_Float
      is separate;
   function Parse_Compact_Number
     (Text : String)
      return Number_Parse_Result
      is separate;

   function Scan_Compact_Number
     (Text : String)
      return Number_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;
      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Number_Parse_Result :=
              Parse_Compact_Number (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Compact_Number;

   function Small_English_Number (Word : String) return Integer
      is separate;
   function Parse_Cardinal
     (Text : String)
      return Number_Parse_Result
      is separate;
   function Scan_Cardinal
     (Text : String)
      return Number_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;
      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Number_Parse_Result :=
              Parse_Cardinal (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Cardinal;

   function Parse_Scientific_Number
     (Text : String)
      return Float_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Value : Long_Float;
      Seen_Exponent : Boolean := False;
   begin
      for Ch of Item loop
         if Ch = 'e' then
            Seen_Exponent := True;
         end if;
      end loop;
      if not Seen_Exponent then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Value := Long_Float'Value (Item);
      return
        (Status => Humanize.Status.Ok,
         Value => Value,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Scientific_Number;

   function Scan_Scientific_Number
     (Text : String)
      return Float_Parse_Result
   is
      Last : constant Natural := Scan_Number_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;
      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Float_Parse_Result :=
              Parse_Scientific_Number (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Scientific_Number;

   function Approximation_Prefix
     (Text : String;
      Kind : out Humanize.Numbers.Approximation_Kind;
      Rest : out Unbounded_String)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
   begin
      if Starts_With (Item, "about ") then
         Kind := Humanize.Numbers.About;
         Rest := To_Unbounded_String (Trim (Item (Item'First + 6 .. Item'Last)));
      elsif Starts_With (Item, "almost ") then
         Kind := Humanize.Numbers.Almost;
         Rest := To_Unbounded_String (Trim (Item (Item'First + 7 .. Item'Last)));
      elsif Starts_With (Item, "over ") then
         Kind := Humanize.Numbers.Over;
         Rest := To_Unbounded_String (Trim (Item (Item'First + 5 .. Item'Last)));
      elsif Starts_With (Item, "under ") then
         Kind := Humanize.Numbers.Under;
         Rest := To_Unbounded_String (Trim (Item (Item'First + 6 .. Item'Last)));
      else
         return False;
      end if;
      return Length (Rest) > 0;
   end Approximation_Prefix;

   function Parse_Currency_Core
     (Text        : String;
      Approximate : Boolean)
      return Currency_Parse_Result
      is separate;
   function Parse_Currency
     (Text : String)
      return Currency_Parse_Result is
   begin
      return Parse_Currency_Core (Text, False);
   end Parse_Currency;

   function Scan_Currency
     (Text : String)
      return Currency_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;
      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Currency_Parse_Result :=
              Parse_Currency (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Currency;

   function Parse_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result
   is
      Kind : Humanize.Numbers.Approximation_Kind;
      Rest : Unbounded_String;
   begin
      if not Approximation_Prefix (Text, Kind, Rest) then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Expected_Number,
            others => <>);
      end if;
      declare
         Result : Currency_Parse_Result :=
           Parse_Currency_Core (To_String (Rest), True);
      begin
         if Result.Status = Humanize.Status.Ok then
            Result.Kind := Kind;
            Result.Consumed := Trim (Text)'Length;
         end if;
         return Result;
      end;
   end Parse_Approximate_Currency;

   function Scan_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;
      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Currency_Parse_Result :=
              Parse_Approximate_Currency (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Approximate_Currency;

   function Parse_Approximate_Number
     (Text : String)
      return Number_Parse_Result
   is
      Kind : Humanize.Numbers.Approximation_Kind;
      Rest : Unbounded_String;
      Amount : Long_Float;
   begin
      if not Approximation_Prefix (Text, Kind, Rest)
        or else not Numeric_Value (To_String (Rest), Amount)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 Error => Expected_Number,
                 others => <>);
      end if;
      return
        (Status => Humanize.Status.Ok,
         Value => Long_Long_Integer (Long_Float'Rounding (Amount)),
         Exact => Long_Float'Rounding (Amount) = Amount,
         Consumed => Trim (Text)'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Approximate_Number;

   function Parse_Editorial_Number
     (Text : String)
      return Number_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Number_Text : constant String :=
        (if Item'Length > 0 and then Item (Item'Last) = '%'
         then Trim (Item (Item'First .. Item'Last - 1))
         else Item);
      Value : Long_Long_Integer := 0;
      Numeric : constant String := Strip_Grouping (Number_Text);
   begin
      if Number_Text'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Empty_Input,
                 Error_Position => Text'First,
                 others => <>);
      elsif Humanize.Numbers.Parse_Deterministic_Cardinal
        (Number_Text, Value)
      then
         null;
      else
         begin
            Value := Long_Long_Integer'Value (Numeric);
         exception
            when others =>
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       Error_Position => Text'First,
                       others => <>);
         end;
      end if;
      return
        (Status => Humanize.Status.Ok,
         Value => Value,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Editorial_Number;

   function Parse_Worded_Noun_Count
     (Text       : String;
      Count      : out Long_Long_Integer;
      Unit       : out String;
      Unit_Last  : out Natural)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Space : Natural := 0;
   begin
      Count := 0;
      Unit := [others => ' '];
      Unit_Last := 0;
      for Index in reverse Item'Range loop
         if Item (Index) = ' ' then
            Space := Index;
            exit;
         end if;
      end loop;
      if Space = 0
        or else not Humanize.Numbers.Parse_Deterministic_Cardinal
          (Item (Item'First .. Space - 1), Count)
      then
         return False;
      end if;
      Store (Singular_Unit (Item (Space + 1 .. Item'Last)), Unit, Unit_Last);
      return Unit_Last > 0;
   end Parse_Worded_Noun_Count;

   function Parse_Currency_Words
     (Text : String)
      return Currency_Parse_Result
      is separate;

   function Scan_Approximate_Number
     (Text : String)
      return Number_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;
      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Number_Parse_Result :=
              Parse_Approximate_Number (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Approximate_Number;

   function Parse_Change
     (Text : String)
      return Change_Parse_Result
      is separate;
   function Scan_Change
     (Text : String)
      return Change_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;
      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Change_Parse_Result :=
              Parse_Change (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Change;

   function Parse_Comparison
     (Text         : String;
      Larger_Word  : String;
      Smaller_Word : String;
      Percent      : Boolean;
      Byte_Size    : Boolean)
      return Comparison_Parse_Result
      is separate;
   function Parse_Number_Comparison
     (Text : String)
      return Comparison_Parse_Result is
   begin
      return Parse_Comparison (Text, "higher", "lower", False, False);
   end Parse_Number_Comparison;
   function Parse_Percent_Comparison
     (Text : String)
      return Comparison_Parse_Result is
   begin
      return Parse_Comparison (Text, "higher", "lower", True, False);
   end Parse_Percent_Comparison;
   function Parse_File_Size_Comparison
     (Text : String)
      return Comparison_Parse_Result is
   begin
      return Parse_Comparison (Text, "larger", "smaller", False, True);
   end Parse_File_Size_Comparison;
end Humanize.Parsing.Implementation.Number_Text_Helpers;
