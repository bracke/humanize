separate (Humanize.Colors.Support.Backend)
   function Hue_To_RGB
     (P : Long_Float;
      Q : Long_Float;
      T : Long_Float)
      return Long_Float
   is
      Hue : Long_Float := T;
   begin
      if Hue < 0.0 then
         Hue := Hue + 1.0;
      elsif Hue > 1.0 then
         Hue := Hue - 1.0;
      end if;

      if Hue < 1.0 / 6.0 then
         return P + (Q - P) * 6.0 * Hue;
      elsif Hue < 1.0 / 2.0 then
         return Q;
      elsif Hue < 2.0 / 3.0 then
         return P + (Q - P) * (2.0 / 3.0 - Hue) * 6.0;
      else
         return P;
      end if;
   end Hue_To_RGB;
