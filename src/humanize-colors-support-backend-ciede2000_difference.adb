separate (Humanize.Colors.Support.Backend)
function CIEDE2000_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float
   is
      use Ada.Numerics.Long_Elementary_Functions;

      function Pow_7 (Value : Long_Float) return Long_Float is
      begin
         return Value ** 7;
      end Pow_7;

      function To_Radians (Degrees : Long_Float) return Long_Float is
      begin
         return Degrees * Ada.Numerics.Pi / 180.0;
      end To_Radians;

      function Hue_Degrees
        (B : Long_Float;
         A : Long_Float)
         return Long_Float
      is
         Angle : Long_Float;
      begin
         if A = 0.0 and then B = 0.0 then
            return 0.0;
         end if;

         Angle := Arctan (B, A) * 180.0 / Ada.Numerics.Pi;
         if Angle < 0.0 then
            Angle := Angle + 360.0;
         end if;
         return Angle;
      end Hue_Degrees;

      L1 : constant Lab_Color := Lab (Left);
      L2 : constant Lab_Color := Lab (Right);
      C1 : constant Long_Float := Sqrt (L1.A * L1.A + L1.B * L1.B);
      C2 : constant Long_Float := Sqrt (L2.A * L2.A + L2.B * L2.B);
      Mean_C : constant Long_Float := (C1 + C2) / 2.0;
      Mean_C7 : constant Long_Float := Pow_7 (Mean_C);
      G : constant Long_Float :=
        0.5 * (1.0 - Sqrt (Mean_C7 / (Mean_C7 + Pow_7 (25.0))));
      A1_Prime : constant Long_Float := (1.0 + G) * L1.A;
      A2_Prime : constant Long_Float := (1.0 + G) * L2.A;
      C1_Prime : constant Long_Float :=
        Sqrt (A1_Prime * A1_Prime + L1.B * L1.B);
      C2_Prime : constant Long_Float :=
        Sqrt (A2_Prime * A2_Prime + L2.B * L2.B);
      H1_Prime : constant Long_Float := Hue_Degrees (L1.B, A1_Prime);
      H2_Prime : constant Long_Float := Hue_Degrees (L2.B, A2_Prime);
      Delta_L_Prime : constant Long_Float := L2.Lightness - L1.Lightness;
      Delta_C_Prime : constant Long_Float := C2_Prime - C1_Prime;
      Delta_H_Prime_Degrees : Long_Float;
      Delta_H_Prime : Long_Float;
      Mean_L_Prime : constant Long_Float := (L1.Lightness + L2.Lightness) / 2.0;
      Mean_C_Prime : constant Long_Float := (C1_Prime + C2_Prime) / 2.0;
      Mean_H_Prime : Long_Float;
      T : Long_Float;
      Delta_Theta : Long_Float;
      Mean_C_Prime7 : Long_Float;
      R_C : Long_Float;
      S_L : Long_Float;
      S_C : Long_Float;
      S_H : Long_Float;
      R_T : Long_Float;
      L_Term : Long_Float;
      C_Term : Long_Float;
      H_Term : Long_Float;
begin
      if C1_Prime * C2_Prime = 0.0 then
         Delta_H_Prime_Degrees := 0.0;
      elsif abs (H2_Prime - H1_Prime) <= 180.0 then
         Delta_H_Prime_Degrees := H2_Prime - H1_Prime;
      elsif H2_Prime <= H1_Prime then
         Delta_H_Prime_Degrees := H2_Prime - H1_Prime + 360.0;
      else
         Delta_H_Prime_Degrees := H2_Prime - H1_Prime - 360.0;
      end if;

      Delta_H_Prime :=
        2.0 * Sqrt (C1_Prime * C2_Prime)
        * Sin (To_Radians (Delta_H_Prime_Degrees / 2.0));

      if C1_Prime * C2_Prime = 0.0 then
         Mean_H_Prime := H1_Prime + H2_Prime;
      elsif abs (H1_Prime - H2_Prime) <= 180.0 then
         Mean_H_Prime := (H1_Prime + H2_Prime) / 2.0;
      elsif H1_Prime + H2_Prime < 360.0 then
         Mean_H_Prime := (H1_Prime + H2_Prime + 360.0) / 2.0;
      else
         Mean_H_Prime := (H1_Prime + H2_Prime - 360.0) / 2.0;
      end if;

      T := 1.0
        - 0.17 * Cos (To_Radians (Mean_H_Prime - 30.0))
        + 0.24 * Cos (To_Radians (2.0 * Mean_H_Prime))
        + 0.32 * Cos (To_Radians (3.0 * Mean_H_Prime + 6.0))
        - 0.20 * Cos (To_Radians (4.0 * Mean_H_Prime - 63.0));
      Delta_Theta :=
        30.0 * Exp (-((Mean_H_Prime - 275.0) / 25.0) ** 2);
      Mean_C_Prime7 := Pow_7 (Mean_C_Prime);
      R_C := 2.0
        * Sqrt (Mean_C_Prime7 / (Mean_C_Prime7 + Pow_7 (25.0)));
      S_L := 1.0 + (0.015 * (Mean_L_Prime - 50.0) ** 2)
        / Sqrt (20.0 + (Mean_L_Prime - 50.0) ** 2);
      S_C := 1.0 + 0.045 * Mean_C_Prime;
      S_H := 1.0 + 0.015 * Mean_C_Prime * T;
      R_T := -Sin (To_Radians (2.0 * Delta_Theta)) * R_C;
      L_Term := Delta_L_Prime / S_L;
      C_Term := Delta_C_Prime / S_C;
      H_Term := Delta_H_Prime / S_H;

      return Sqrt
        (L_Term * L_Term + C_Term * C_Term + H_Term * H_Term
         + R_T * C_Term * H_Term);
end CIEDE2000_Difference;
