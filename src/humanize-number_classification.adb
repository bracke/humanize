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
     (Value : Natural)
      return Message_Selection
   is
   begin
      return Count (Number_Ordinal, Count_Value (Long_Long_Integer (Value)));
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

   function Compact
     (Value   : Long_Long_Integer;
      Options : Humanize.Numbers.Number_Options;
      Locale  : String)
      return Message_Selection
   is
      Mag      : constant Long_Long_Integer := Magnitude (Value);
      Sign     : constant String := (if Value < 0 then "-" else "");
      Digit_Count : constant Natural := Options.Maximum_Fraction_Digits;
      Suppress : constant Boolean := Options.Suppress_Trailing_Zero;
      Symbols  : constant Humanize.Number_Formatting.Number_Symbols :=
        Humanize.Number_Formatting.Symbols_For (Locale);

      function Local (Raw : String) return String is
        (Humanize.Number_Formatting.Localize (Raw, Symbols));
   begin
      if Mag < Thousand then
         return Text_Value (Number_Compact_Plain, Local (Image (Value)));
      elsif Mag < Million then
         return Text_Value
                  (Number_Compact_Thousand,
                   Local
                     (Sign
                      & Format_Scaled (Mag, Thousand, Digit_Count, Suppress)));
      elsif Mag < Billion then
         return Text_Value
                  (Number_Compact_Million,
                   Local
                     (Sign
                      & Format_Scaled (Mag, Million, Digit_Count, Suppress)));
      elsif Mag < Trillion then
         return Text_Value
                  (Number_Compact_Billion,
                   Local
                     (Sign
                      & Format_Scaled (Mag, Billion, Digit_Count, Suppress)));
      else
         return Text_Value
                  (Number_Compact_Trillion,
                   Local
                     (Sign
                      & Format_Scaled (Mag, Trillion, Digit_Count, Suppress)));
      end if;
   end Compact;

end Humanize.Number_Classification;
