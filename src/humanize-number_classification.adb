with Humanize.Messages;
with Humanize.Number_Formatting;

package body Humanize.Number_Classification is

   use Humanize.Messages;
   use Humanize.Selections;

   Thousand : constant Long_Long_Integer := 1_000;
   Million  : constant Long_Long_Integer := 1_000_000;
   Billion  : constant Long_Long_Integer := 1_000_000_000;
   Trillion : constant Long_Long_Integer := 1_000_000_000_000;

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

   --  True when rounding Magnitude / Divisor to Digit_Count digits reaches the
   --  next tier (>= 1000), so the compact tier should be promoted.
   function Promotes
     (Mag       : Long_Long_Integer;
      Divisor   : Long_Long_Integer;
      Digit_Count : Natural)
      return Boolean
   is
      Int_Part  : Long_Long_Integer := Mag / Divisor;
      Remainder : constant Long_Long_Integer := Mag mod Divisor;
      Scale     : Long_Long_Integer := 1;
   begin
      for I in 1 .. Digit_Count loop
         Scale := Scale * 10;
      end loop;
      if (Remainder * Scale + Divisor / 2) / Divisor = Scale then
         Int_Part := Int_Part + 1;
      end if;
      return Int_Part >= 1000;
   end Promotes;

   --  Long-style key for a short compact tier key.
   function Long_Key (Short : Message_Id) return Message_Id is
     (case Short is
         when Number_Compact_Thousand => Number_Compact_Long_Thousand,
         when Number_Compact_Million  => Number_Compact_Long_Million,
         when Number_Compact_Billion  => Number_Compact_Long_Billion,
         when others                  => Number_Compact_Long_Trillion);

   function Compact
     (Value   : Long_Long_Integer;
      Options : Humanize.Numbers.Number_Options;
      Locale  : String;
      Style   : Humanize.Numbers.Compact_Style)
      return Message_Selection
   is
      use type Humanize.Numbers.Compact_Style;
      Mag         : constant Long_Long_Integer := Magnitude (Value);
      Sign        : constant String := (if Value < 0 then "-" else "");
      Digit_Count : constant Natural := Options.Maximum_Fraction_Digits;
      Suppress    : constant Boolean := Options.Suppress_Trailing_Zero;
      Symbols     : constant Humanize.Number_Formatting.Number_Symbols :=
        Humanize.Number_Formatting.Symbols_For (Locale);

      function Local (Raw : String) return String is
        (Humanize.Number_Formatting.Localize (Raw, Symbols));

      Divisor : Long_Long_Integer;
      Key     : Message_Id;
   begin
      if Mag < Thousand then
         return Text_Value (Number_Compact_Plain, Local (Image (Value)));
      elsif Mag < Million then
         Divisor := Thousand;
         Key := Number_Compact_Thousand;
      elsif Mag < Billion then
         Divisor := Million;
         Key := Number_Compact_Million;
      elsif Mag < Trillion then
         Divisor := Billion;
         Key := Number_Compact_Billion;
      else
         Divisor := Trillion;
         Key := Number_Compact_Trillion;
      end if;

      --  Rounding may carry into the next tier (999_999 -> 1M, not 1000K).
      if Divisor < Trillion and then Promotes (Mag, Divisor, Digit_Count) then
         Divisor := Divisor * 1000;
         Key := Message_Id'Succ (Key);  --  Thousand->Million->Billion->Trillion
      end if;

      declare
         Scaled : constant String :=
           Sign & Format_Scaled (Mag, Divisor, Digit_Count, Suppress);
      begin
         if Style = Humanize.Numbers.Short then
            return Text_Value (Key, Local (Scaled));
         else
            --  Long style: the scaled value is a plural selector (decimal), the
            --  scale word agrees with it.
            return Humanize.Selections.Decimal (Long_Key (Key), Scaled);
         end if;
      end;
   end Compact;

   function Percent
     (Value   : Long_Float;
      Options : Humanize.Numbers.Number_Options;
      Locale  : String)
      return Message_Selection
   is
      Ascii : constant String :=
        Humanize.Number_Formatting.Decimal_Image
          (Value, Options.Maximum_Fraction_Digits,
           Options.Suppress_Trailing_Zero);
   begin
      return Text_Value
               (Number_Percent,
                Humanize.Number_Formatting.Localize
                  (Ascii, Humanize.Number_Formatting.Symbols_For (Locale)));
   end Percent;

end Humanize.Number_Classification;
