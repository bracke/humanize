separate (Humanize.Colors.Support.Backend)
function Palette_Metadata_For
     (Colors : Color_List)
      return Palette_Metadata
   is
      Result : Palette_Metadata :=
        (Status => Humanize.Status.Ok,
         Color_Count => Colors'Length,
         Pair_Count => 0,
         Failing_Pairs => 0,
         Large_Text_Pairs => 0,
         Normal_Text_Pairs => 0,
         Enhanced_Text_Pairs => 0,
         Best_Contrast_Ratio => 1.0,
         Worst_Contrast_Ratio => 1.0);
      Ratio : Long_Float;
      First_Pair : Boolean := True;
begin
      if Colors'Length < 2 then
         return Result;
      end if;

      for I in Colors'First .. Colors'Last - 1 loop
         for J in I + 1 .. Colors'Last loop
            Ratio := Contrast_Ratio (Colors (I), Colors (J));
            Result.Pair_Count := Result.Pair_Count + 1;

            if First_Pair then
               Result.Best_Contrast_Ratio := Ratio;
               Result.Worst_Contrast_Ratio := Ratio;
               First_Pair := False;
            elsif Ratio > Result.Best_Contrast_Ratio then
               Result.Best_Contrast_Ratio := Ratio;
            elsif Ratio < Result.Worst_Contrast_Ratio then
               Result.Worst_Contrast_Ratio := Ratio;
            end if;

            case Contrast_Level_For (Ratio) is
               when Contrast_Enhanced_Text =>
                  Result.Enhanced_Text_Pairs :=
                    Result.Enhanced_Text_Pairs + 1;
               when Contrast_Normal_Text =>
                  Result.Normal_Text_Pairs := Result.Normal_Text_Pairs + 1;
               when Contrast_Large_Text =>
                  Result.Large_Text_Pairs := Result.Large_Text_Pairs + 1;
               when Contrast_Fail =>
                  Result.Failing_Pairs := Result.Failing_Pairs + 1;
            end case;
         end loop;
      end loop;

      return Result;
end Palette_Metadata_For;
