package body Humanize.Decimal_Images is

   --  Decimal image without the 'Image leading space.
   function No_Space (Image : String) return String is
     (if Image'Length > 0 and then Image (Image'First) = ' '
      then Image (Image'First + 1 .. Image'Last)
      else Image);

   function Decimal_Image
     (Value                  : Long_Float;
      Max_Digits             : Natural;
      Suppress_Trailing_Zero : Boolean := True)
      return String
   is
      Sign  : constant String := (if Value < 0.0 then "-" else "");
      Scale : Long_Long_Integer := 1;
   begin
      for Count in 1 .. Max_Digits loop
         Scale := Scale * 10;
      end loop;

      declare
         Scaled    : constant Long_Long_Integer :=
           Long_Long_Integer
             (Long_Float'Rounding (abs Value * Long_Float (Scale)));
         Int_Part  : constant Long_Long_Integer := Scaled / Scale;
         Frac_Part : constant Long_Long_Integer := Scaled mod Scale;
         Int_Img   : constant String :=
           No_Space (Long_Long_Integer'Image (Int_Part));
      begin
         if Max_Digits = 0 then
            return Sign & Int_Img;
         end if;

         declare
            Raw_Frac : constant String :=
              No_Space (Long_Long_Integer'Image (Frac_Part));
            Padded   : String (1 .. Max_Digits) := [others => '0'];
            Last     : Natural := Max_Digits;
         begin
            --  Right-align the fraction digits, zero-padded on the left.
            Padded (Max_Digits - Raw_Frac'Length + 1 .. Max_Digits) := Raw_Frac;
            if Suppress_Trailing_Zero then
               while Last >= 1 and then Padded (Last) = '0' loop
                  Last := Last - 1;
               end loop;
            end if;
            if Last = 0 then
               return Sign & Int_Img;
            end if;
            return Sign & Int_Img & "." & Padded (1 .. Last);
         end;
      end;
   end Decimal_Image;

end Humanize.Decimal_Images;
