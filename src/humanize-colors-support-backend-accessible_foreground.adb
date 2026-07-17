separate (Humanize.Colors.Support.Backend)
function Accessible_Foreground
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : Contrast_Target := Target_Normal_Text)
      return Color_Remediation_Result
   is
      Goal : constant Long_Float := Target_Ratio (Target);
      Current_Ratio : constant Long_Float :=
        Contrast_Ratio (Foreground, Background);
      Black : constant RGB_Color := (Red => 0, Green => 0, Blue => 0);
      White : constant RGB_Color := (Red => 255, Green => 255, Blue => 255);
      Toward : RGB_Color;
      Candidate : RGB_Color := Foreground;
      Ratio : Long_Float := Current_Ratio;
begin
      if Current_Ratio >= Goal then
         return
           (Status => Humanize.Status.Ok,
            Color  => Foreground,
            Ratio  => Current_Ratio);
      end if;

      if Contrast_Ratio (Black, Background)
        >= Contrast_Ratio (White, Background)
      then
         Toward := Black;
      else
         Toward := White;
      end if;

      for Step in 1 .. 100 loop
         Candidate := Mix_Toward (Foreground, Toward, Long_Float (Step) / 100.0);
         Ratio := Contrast_Ratio (Candidate, Background);
         if Ratio >= Goal then
            return
              (Status => Humanize.Status.Ok,
               Color  => Candidate,
               Ratio  => Ratio);
         end if;
      end loop;

      Candidate := Toward;
      Ratio := Contrast_Ratio (Candidate, Background);
      return
        (Status =>
           (if Ratio >= Goal then Humanize.Status.Ok
            else Humanize.Status.Invalid_Options),
         Color  => Candidate,
         Ratio  => Ratio);
end Accessible_Foreground;
