separate (Humanize.Colors.Support.Backend)
function Palette_Contrast_Matrix_Label
  (Colors : Color_List)
   return Humanize.Status.Text_Result
is
   Total    : Natural := 0;
   Fail     : Natural := 0;
   Large    : Natural := 0;
   Normal   : Natural := 0;
   Enhanced : Natural := 0;
begin
   if Colors'Length < 2 then
      return Invalid_Text;
   end if;

   for I in Colors'Range loop
      for J in I + 1 .. Colors'Last loop
         declare
            Level : constant Contrast_Level :=
              Contrast_Level_For (Contrast_Ratio (Colors (I), Colors (J)));
         begin
            Total := Total + 1;
            case Level is
               when Contrast_Fail =>
                  Fail := Fail + 1;
               when Contrast_Large_Text =>
                  Large := Large + 1;
               when Contrast_Normal_Text =>
                  Normal := Normal + 1;
               when Contrast_Enhanced_Text =>
                  Enhanced := Enhanced + 1;
            end case;
         end;
      end loop;
   end loop;

   return Ok_Text
     (Natural_Text (Enhanced) & " enhanced, "
      & Natural_Text (Normal) & " normal, "
      & Natural_Text (Large) & " large-only, "
      & Natural_Text (Fail) & " fail out of "
      & Natural_Text (Total) & " pairs");
end Palette_Contrast_Matrix_Label;
