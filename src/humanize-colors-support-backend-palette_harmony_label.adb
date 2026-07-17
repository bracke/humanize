separate (Humanize.Colors.Support.Backend)
function Palette_Harmony_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Saturated_Count : Natural := 0;
      Min_Hue         : Long_Float := 360.0;
      Max_Hue         : Long_Float := 0.0;
      Max_Distance    : Long_Float := 0.0;
      Complementary   : Boolean := False;
      Triadic_Pairs   : Natural := 0;
      H1              : HSL_Color;
      H2              : HSL_Color;
      Diff            : Long_Float;
begin
      if Colors'Length = 0 then
         return Invalid_Text;
      end if;

      for Color of Colors loop
         H1 := HSL (Color);
         if H1.Saturation >= 0.08 then
            Saturated_Count := Saturated_Count + 1;
            Min_Hue := Long_Float'Min (Min_Hue, H1.Hue);
            Max_Hue := Long_Float'Max (Max_Hue, H1.Hue);
         end if;
      end loop;

      if Saturated_Count = 0 then
         return Ok_Text ("neutral palette");
      elsif Saturated_Count = 1 then
         return Ok_Text ("single-accent palette");
      end if;

      for I in Colors'Range loop
         H1 := HSL (Colors (I));
         if H1.Saturation >= 0.08 then
            for J in I + 1 .. Colors'Last loop
               H2 := HSL (Colors (J));
               if H2.Saturation >= 0.08 then
                  Diff := Hue_Distance (H1.Hue, H2.Hue);
                  Max_Distance := Long_Float'Max (Max_Distance, Diff);
                  if Diff >= 150.0 and then Diff <= 210.0 then
                     Complementary := True;
                  elsif Diff >= 95.0 and then Diff <= 145.0 then
                     Triadic_Pairs := Triadic_Pairs + 1;
                  end if;
               end if;
            end loop;
         end if;
      end loop;

      if Max_Distance < 20.0 then
         return Ok_Text ("monochrome palette");
      elsif Triadic_Pairs >= 2 then
         return Ok_Text ("triadic palette");
      elsif Complementary then
         return Ok_Text ("complementary palette");
      elsif Max_Hue - Min_Hue <= 70.0 then
         return Ok_Text ("analogous palette");
      else
         return Ok_Text ("varied palette");
      end if;
end Palette_Harmony_Label;
