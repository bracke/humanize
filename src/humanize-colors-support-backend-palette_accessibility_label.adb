separate (Humanize.Colors.Support.Backend)
function Palette_Accessibility_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Normal_Pairs   : Natural := 0;
      Large_Pairs    : Natural := 0;
      Total_Pairs    : Natural := 0;
      Ratio          : Long_Float;
begin
      if Colors'Length < 2 then
         return Invalid_Text;
      end if;

      for I in Colors'Range loop
         for J in I + 1 .. Colors'Last loop
            Total_Pairs := Total_Pairs + 1;
            Ratio := Contrast_Ratio (Colors (I), Colors (J));
            if Ratio >= 4.5 then
               Normal_Pairs := Normal_Pairs + 1;
            end if;
            if Ratio >= 3.0 then
               Large_Pairs := Large_Pairs + 1;
            end if;
         end loop;
      end loop;

      if Normal_Pairs > 0 then
         return Ok_Text
           (Natural_Text (Normal_Pairs) & " of " & Natural_Text (Total_Pairs)
            & " pairs pass normal text contrast");
      elsif Large_Pairs > 0 then
         return Ok_Text
           (Natural_Text (Large_Pairs) & " of " & Natural_Text (Total_Pairs)
            & " pairs pass large text only");
      else
         return Ok_Text ("no accessible text pairs");
      end if;
end Palette_Accessibility_Label;
