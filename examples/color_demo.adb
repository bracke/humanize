with Ada.Text_IO;

with Humanize.Bounded_Text;
with Humanize.Colors;
with Humanize.Colors.CSS;
with Humanize.Status;

procedure Color_Demo is
   use Ada.Text_IO;
   use type Humanize.Status.Status_Code;

   Color : Humanize.Colors.CSS_Color;
   Code  : constant Humanize.Status.Status_Code :=
     Humanize.Colors.CSS.Parse_CSS_Color ("rebeccapurple", Color);
begin
   if Code = Humanize.Status.Ok then
      Put_Line
        ("css color: "
         & Humanize.Bounded_Text.Result_Text
             (Humanize.Colors.CSS.CSS_Color_Label (Color)));
   end if;

   Put_Line
     ("hex color: "
      & Humanize.Bounded_Text.Result_Text
          (Humanize.Colors.CSS.Hex_Color
             ((Red => 51, Green => 102, Blue => 153))));
end Color_Demo;
