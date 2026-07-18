separate (Humanize.Colors.Support.Backend)
function Color_Summary
  (Color : RGB_Color)
   return Humanize.Status.Text_Result
is
begin
   return Ok_Text
     (Result_Text (Hex_Color (Color)) & " "
      & Result_Text (RGB_Label (Color)));
end Color_Summary;
