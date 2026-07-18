separate (Humanize.Colors.Support.Backend)
function Color_Accessibility_Summary
  (Foreground : RGB_Color;
   Background : RGB_Color)
   return Humanize.Status.Text_Result
is
   WCAG : constant Humanize.Status.Text_Result :=
     Contrast_Label (Foreground, Background);
   APCA : constant Humanize.Status.Text_Result :=
     APCA_Contrast_Label (Foreground, Background);
begin
   return Ok_Text
     (Result_Text (WCAG) & "; "
      & Result_Text (APCA) & "; "
      & Worst_CVD_Risk (Foreground, Background));
end Color_Accessibility_Summary;
