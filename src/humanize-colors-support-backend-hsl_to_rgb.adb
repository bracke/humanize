separate (Humanize.Colors.Support.Backend)
function HSL_To_RGB
  (Hue        : Long_Float;
   Saturation : Long_Float;
   Lightness  : Long_Float)
   return RGB_Color
is
   H : Long_Float := Hue;
   S : constant Long_Float := Clamp01 (Saturation);
   L : constant Long_Float := Clamp01 (Lightness);
   Q : Long_Float;
   P : Long_Float;
   R : Long_Float;
   G : Long_Float;
   B : Long_Float;
begin
   while H < 0.0 loop
      H := H + 360.0;
   end loop;
   while H >= 360.0 loop
      H := H - 360.0;
   end loop;
   H := H / 360.0;

   if S = 0.0 then
      R := L;
      G := L;
      B := L;
   else
      Q := (if L < 0.5 then L * (1.0 + S) else L + S - L * S);
      P := 2.0 * L - Q;
      R := Hue_To_RGB (P, Q, H + 1.0 / 3.0);
      G := Hue_To_RGB (P, Q, H);
      B := Hue_To_RGB (P, Q, H - 1.0 / 3.0);
   end if;

   return
     (Red   => Channel_From_Float (R * 255.0),
      Green => Channel_From_Float (G * 255.0),
      Blue  => Channel_From_Float (B * 255.0));
end HSL_To_RGB;
