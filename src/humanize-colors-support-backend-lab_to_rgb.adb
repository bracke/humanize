separate (Humanize.Colors.Support.Backend)
function Lab_To_RGB
     (Lightness : Long_Float;
      A         : Long_Float;
      B         : Long_Float)
      return RGB_Color
   is
      use Ada.Numerics.Long_Elementary_Functions;
      Epsilon : constant Long_Float := 216.0 / 24_389.0;
      Kappa   : constant Long_Float := 24_389.0 / 27.0;

      function Pivot (Value : Long_Float) return Long_Float is
      begin
         if Value * Value * Value > Epsilon then
            return Value * Value * Value;
         else
            return (116.0 * Value - 16.0) / Kappa;
         end if;
      end Pivot;

      FY : constant Long_Float := (Lightness + 16.0) / 116.0;
      FX : constant Long_Float := FY + A / 500.0;
      FZ : constant Long_Float := FY - B / 200.0;

      --  CSS Lab/LCH are D50. Convert D50 XYZ to D65 XYZ before sRGB.
      X50 : constant Long_Float := 0.96422 * Pivot (FX);
      Y50 : constant Long_Float := 1.00000 * Pivot (FY);
      Z50 : constant Long_Float := 0.82521 * Pivot (FZ);
      X65 : constant Long_Float :=
        0.9555766 * X50 - 0.0230393 * Y50 + 0.0631636 * Z50;
      Y65 : constant Long_Float :=
       -0.0282895 * X50 + 1.0099416 * Y50 + 0.0210077 * Z50;
      Z65 : constant Long_Float :=
        0.0122982 * X50 - 0.0204830 * Y50 + 1.3299098 * Z50;
      R : constant Long_Float :=
        3.2404542 * X65 - 1.5371385 * Y65 - 0.4985314 * Z65;
      G : constant Long_Float :=
       -0.9692660 * X65 + 1.8760108 * Y65 + 0.0415560 * Z65;
      BL : constant Long_Float :=
        0.0556434 * X65 - 0.2040259 * Y65 + 1.0572252 * Z65;
begin
      return
        (Red   => Channel_From_Linear (R),
         Green => Channel_From_Linear (G),
         Blue  => Channel_From_Linear (BL));
end Lab_To_RGB;
