with Humanize.Messages;

package body Humanize.Byte_Classification is

   use Humanize.Bytes;
   use Humanize.Messages;

   type Unit_Range is range 1 .. 4;
   type Threshold_Array is array (Unit_Range) of Byte_Count;
   type Key_Array is array (Unit_Range) of Message_Id;

   Binary_Threshold : constant Threshold_Array :=
     [1024, 1_048_576, 1_073_741_824, 1_099_511_627_776];
   Decimal_Threshold : constant Threshold_Array :=
     [1000, 1_000_000, 1_000_000_000, 1_000_000_000_000];

   Binary_Keys : constant Key_Array :=
     [Bytes_KiB, Bytes_MiB, Bytes_GiB, Bytes_TiB];
   Decimal_Keys : constant Key_Array :=
     [Bytes_KB, Bytes_MB, Bytes_GB, Bytes_TB];

   --  Byte_Count image without the leading space that 'Image produces.
   function Image_No_Space (Value : Byte_Count) return String is
      Image : constant String := Byte_Count'Image (Value);
   begin
      if Image'Length > 0 and then Image (Image'First) = ' ' then
         return Image (Image'First + 1 .. Image'Last);
      end if;
      return Image;
   end Image_No_Space;

   --  Zero-padded decimal of Value to at least Width characters.
   function Padded (Value : Byte_Count; Width : Natural) return String is
      Image : constant String := Image_No_Space (Value);
   begin
      if Image'Length >= Width then
         return Image;
      end if;
      return [1 .. Width - Image'Length => '0'] & Image;
   end Padded;

   function Strip_Trailing_Zeros (Item : String) return String is
      Last : Natural := Item'Last;
   begin
      while Last >= Item'First and then Item (Last) = '0' loop
         Last := Last - 1;
      end loop;
      return Item (Item'First .. Last);
   end Strip_Trailing_Zeros;

   --  Format Bytes / Threshold as ASCII with at most Digits fraction digits,
   --  rounding halves away from zero. Overflow-safe: the integer and fractional
   --  parts are computed separately so Bytes is never multiplied.
   function Format_Value
     (Bytes     : Byte_Count;
      Threshold : Byte_Count;
      Options   : Byte_Options)
      return String
   is
      Digits_Count : constant Natural := Options.Maximum_Fraction_Digits;
      Int_Part     : Byte_Count := Bytes / Threshold;
      Remainder    : constant Byte_Count := Bytes mod Threshold;
      Scale        : Byte_Count := 1;
   begin
      for I in 1 .. Digits_Count loop
         Scale := Scale * 10;
      end loop;

      declare
         Frac : Byte_Count :=
           (Remainder * Scale + Threshold / 2) / Threshold;
      begin
         if Frac = Scale then
            Int_Part := Int_Part + 1;
            Frac := 0;
         end if;

         if Digits_Count = 0 then
            return Image_No_Space (Int_Part);
         end if;

         declare
            Frac_Digits : constant String := Padded (Frac, Digits_Count);
            Trimmed     : constant String :=
              (if Options.Suppress_Trailing_Zero
               then Strip_Trailing_Zeros (Frac_Digits)
               else Frac_Digits);
         begin
            if Trimmed'Length = 0 then
               return Image_No_Space (Int_Part);
            end if;
            return Image_No_Space (Int_Part) & "." & Trimmed;
         end;
      end;
   end Format_Value;

   function Classify
     (Bytes   : Byte_Count;
      Options : Byte_Options)
      return Humanize.Selections.Message_Selection
   is
      Thresholds : constant Threshold_Array :=
        (if Options.Unit_System = Binary
         then Binary_Threshold
         else Decimal_Threshold);
      Keys       : constant Key_Array :=
        (if Options.Unit_System = Binary then Binary_Keys else Decimal_Keys);
      Base       : constant Byte_Count := Thresholds (1);
      Chosen     : Unit_Range := 1;
   begin
      --  Below one unit: render a plain byte count with the plural "count".
      if Bytes < Base then
         return Humanize.Selections.Count
                  (Bytes_Byte,
                   Humanize.Selections.Count_Value
                     (Long_Long_Integer (Bytes)));
      end if;

      --  Largest unit whose threshold is at most Bytes.
      for Index in reverse Unit_Range loop
         if Thresholds (Index) <= Bytes then
            Chosen := Index;
            exit;
         end if;
      end loop;

      return Humanize.Selections.Text_Value
               (Keys (Chosen),
                Format_Value (Bytes, Thresholds (Chosen), Options));
   end Classify;

end Humanize.Byte_Classification;
