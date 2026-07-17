separate (Humanize.Colors.Support.Backend)
function HWB_To_RGB
  (Hue       : Long_Float;
   Whiteness : Long_Float;
   Blackness : Long_Float)
   return RGB_Color
is
   W : constant Long_Float := Clamp01 (Whiteness);
   B : constant Long_Float := Clamp01 (Blackness);
   Base : constant RGB_Color := HSL_To_RGB (Hue, 1.0, 0.5);
   Sum : constant Long_Float := W + B;
begin
   if Sum >= 1.0 then
      declare
         Gray : constant Color_Channel := Channel_From_Float (W / Sum * 255.0);
      begin
         return (Red => Gray, Green => Gray, Blue => Gray);
      end;
   end if;

   return
     (Red   => Channel_From_Float
        ((Long_Float (Base.Red) / 255.0 * (1.0 - W - B) + W) * 255.0),
      Green => Channel_From_Float
        ((Long_Float (Base.Green) / 255.0 * (1.0 - W - B) + W) * 255.0),
      Blue  => Channel_From_Float
        ((Long_Float (Base.Blue) / 255.0 * (1.0 - W - B) + W) * 255.0));
end HWB_To_RGB;
