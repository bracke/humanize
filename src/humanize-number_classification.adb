with Humanize.Messages;
with Humanize.Decimal_Images;

package body Humanize.Number_Classification is

   use Humanize.Messages;
   use Humanize.Selections;

   Thousand : constant Long_Long_Integer := 1_000;
   Million  : constant Long_Long_Integer := 1_000_000;
   Billion  : constant Long_Long_Integer := 1_000_000_000;
   Trillion : constant Long_Long_Integer := 1_000_000_000_000;

   Lakh     : constant Long_Long_Integer := 100_000;
   Crore    : constant Long_Long_Integer := 10_000_000;
   Kharab   : constant Long_Long_Integer := 100_000_000_000;

   --  Decimal image of a signed value with no 'Image leading space.
   function Image (Value : Long_Long_Integer) return String is
      Text : constant String := Long_Long_Integer'Image (Value);
   begin
      if Text (Text'First) = ' ' then
         return Text (Text'First + 1 .. Text'Last);
      end if;
      return Text;  --  negative values keep the leading '-'
   end Image;

   function Padded (Value : Long_Long_Integer; Width : Natural) return String is
      Text : constant String := Image (Value);
   begin
      if Text'Length >= Width then
         return Text;
      end if;
      return [1 .. Width - Text'Length => '0'] & Text;
   end Padded;

   function Strip_Trailing_Zeros (Item : String) return String is
      Last : Natural := Item'Last;
   begin
      while Last >= Item'First and then Item (Last) = '0' loop
         Last := Last - 1;
      end loop;
      return Item (Item'First .. Last);
   end Strip_Trailing_Zeros;

   --  Format a non-negative magnitude / Divisor as ASCII with at most Digits
   --  fraction digits, rounding halves away from zero. Overflow-safe: integer
   --  and fractional parts are computed separately.
   function Format_Scaled
     (Magnitude : Long_Long_Integer;
      Divisor   : Long_Long_Integer;
      Digit_Count : Natural;
      Suppress  : Boolean)
      return String
   is
      Int_Part  : Long_Long_Integer := Magnitude / Divisor;
      Remainder : constant Long_Long_Integer := Magnitude mod Divisor;
      Scale     : Long_Long_Integer := 1;
   begin
      for I in 1 .. Digit_Count loop
         Scale := Scale * 10;
      end loop;

      declare
         Frac : Long_Long_Integer :=
           (Remainder * Scale + Divisor / 2) / Divisor;
      begin
         if Frac = Scale then
            Int_Part := Int_Part + 1;
            Frac := 0;
         end if;

         if Digit_Count = 0 then
            return Image (Int_Part);
         end if;

         declare
            Frac_Digits : constant String := Padded (Frac, Digit_Count);
            Trimmed     : constant String :=
              (if Suppress
               then Strip_Trailing_Zeros (Frac_Digits)
               else Frac_Digits);
         begin
            if Trimmed'Length = 0 then
               return Image (Int_Part);
            end if;
            return Image (Int_Part) & "." & Trimmed;
         end;
      end;
   end Format_Scaled;

   function Ordinal
     (Value  : Natural;
      Gender : Humanize.Numbers.Ordinal_Gender)
      return Message_Selection
   is
      use type Humanize.Numbers.Ordinal_Gender;
      Key : constant Message_Id :=
        (if Gender = Humanize.Numbers.Feminine
         then Number_Ordinal_Feminine
         else Number_Ordinal);
   begin
      return Count (Key, Count_Value (Long_Long_Integer (Value)));
   end Ordinal;

   function Magnitude (Value : Long_Long_Integer) return Long_Long_Integer is
   begin
      if Value = Long_Long_Integer'First then
         return Long_Long_Integer'Last;
      elsif Value < 0 then
         return -Value;
      else
         return Value;
      end if;
   end Magnitude;

   function Is_Hindi (Context : Humanize.Contexts.Context) return Boolean is
      Locale : constant String := Humanize.Contexts.Locale (Context);
   begin
      return Locale = "hi"
        or else (Locale'Length > 3
                 and then Locale (Locale'First .. Locale'First + 2) = "hi-");
   end Is_Hindi;

   --  True when rounding Magnitude / Divisor to Digit_Count digits reaches the
   --  next tier, so the compact tier should be promoted.
   function Promotes
     (Mag       : Long_Long_Integer;
      Divisor   : Long_Long_Integer;
      Next_Divisor : Long_Long_Integer;
      Digit_Count : Natural)
      return Boolean
   is
      Int_Part  : Long_Long_Integer := Mag / Divisor;
      Remainder : constant Long_Long_Integer := Mag mod Divisor;
      Scale     : Long_Long_Integer := 1;
      Next_Tier : constant Long_Long_Integer := Next_Divisor / Divisor;
   begin
      for I in 1 .. Digit_Count loop
         Scale := Scale * 10;
      end loop;
      if (Remainder * Scale + Divisor / 2) / Divisor = Scale then
         Int_Part := Int_Part + 1;
      end if;
      return Int_Part >= Next_Tier;
   end Promotes;

   --  Long-style key for a short compact tier key.
   function Long_Key (Short : Message_Id) return Message_Id is
     (case Short is
         when Number_Compact_Thousand => Number_Compact_Long_Thousand,
         when Number_Compact_Million  => Number_Compact_Long_Million,
         when Number_Compact_Billion  => Number_Compact_Long_Billion,
         when others                  => Number_Compact_Long_Trillion);

   function Compact
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Options : Humanize.Numbers.Number_Options;
      Style   : Humanize.Numbers.Compact_Style)
      return Message_Selection
   is
      use type Humanize.Numbers.Compact_Style;
      Mag         : constant Long_Long_Integer := Magnitude (Value);
      Sign        : constant String := (if Value < 0 then "-" else "");
      Digit_Count : constant Natural := Options.Maximum_Fraction_Digits;
      Suppress    : constant Boolean := Options.Suppress_Trailing_Zero;
      Divisor : Long_Long_Integer;
      Next_Divisor : Long_Long_Integer;
      Key     : Message_Id;
   begin
      if Mag < Thousand then
         return Text_Value (Number_Compact_Plain, Image (Value));
      elsif Is_Hindi (Context) and then Mag < Lakh then
         Divisor := Thousand;
         Next_Divisor := Lakh;
         Key := Number_Compact_Thousand;
      elsif Is_Hindi (Context) and then Mag < Crore then
         Divisor := Lakh;
         Next_Divisor := Crore;
         Key := Number_Compact_Million;
      elsif Is_Hindi (Context) and then Mag < Kharab then
         Divisor := Crore;
         Next_Divisor := Kharab;
         Key := Number_Compact_Billion;
      elsif Is_Hindi (Context) then
         Divisor := Kharab;
         Next_Divisor := Kharab;
         Key := Number_Compact_Trillion;
      elsif Mag < Million then
         Divisor := Thousand;
         Next_Divisor := Million;
         Key := Number_Compact_Thousand;
      elsif Mag < Billion then
         Divisor := Million;
         Next_Divisor := Billion;
         Key := Number_Compact_Million;
      elsif Mag < Trillion then
         Divisor := Billion;
         Next_Divisor := Trillion;
         Key := Number_Compact_Billion;
      else
         Divisor := Trillion;
         Next_Divisor := Trillion;
         Key := Number_Compact_Trillion;
      end if;

      --  Rounding may carry into the next tier (999_999 -> 1M, not 1000K).
      if Divisor < Next_Divisor
        and then Promotes (Mag, Divisor, Next_Divisor, Digit_Count)
      then
         Divisor := Next_Divisor;
         Key := Message_Id'Succ (Key);  --  Thousand->Million->Billion->Trillion
      end if;

      declare
         Scaled : constant String :=
         Sign & Format_Scaled (Mag, Divisor, Digit_Count, Suppress);
      begin
         if Style = Humanize.Numbers.Short then
            return Text_Value (Key, Scaled);
         else
            --  Long style: the scaled value is a plural selector (decimal), the
            --  scale word agrees with it.
            return Humanize.Selections.Decimal (Long_Key (Key), Scaled);
         end if;
      end;
   end Compact;

   function Percent
     (Value   : Long_Float;
      Options : Humanize.Numbers.Number_Options)
      return Message_Selection
   is
      Ascii : constant String :=
        Humanize.Decimal_Images.Decimal_Image
          (Value, Options.Maximum_Fraction_Digits,
           Options.Suppress_Trailing_Zero);
   begin
      return Text_Value (Number_Percent, Ascii);
   end Percent;

end Humanize.Number_Classification;
