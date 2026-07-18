separate (Humanize.Colors.Support.Backend)
function APCA_Contrast_Label
  (Foreground : RGB_Color;
   Background : RGB_Color)
   return Humanize.Status.Text_Result
is
   Score     : constant Long_Float := APCA_Contrast (Foreground, Background);
   Magnitude : constant Long_Float := abs Score;
   Polarity  : constant String :=
     (if Score >= 0.0 then "dark text on light background"
      else "light text on dark background");
begin
   return Ok_Text
     ("Lc " & Humanize.Decimal_Images.Decimal_Image (Magnitude, 0, True)
      & ", " & APCA_Strength_Label (Magnitude) & ", " & Polarity);
end APCA_Contrast_Label;
