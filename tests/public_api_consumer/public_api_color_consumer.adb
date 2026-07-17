with Ada.Command_Line;

with Humanize.Bounded_Text;
with Humanize.Colors;
with Humanize.Colors.CSS;
with Humanize.Status;

procedure Public_API_Color_Consumer is
   use type Humanize.Status.Status_Code;

   Color : Humanize.Colors.CSS_Color;
   Code  : constant Humanize.Status.Status_Code :=
     Humanize.Colors.CSS.Parse_CSS_Color ("rebeccapurple", Color);
   Hex   : constant String :=
     Humanize.Bounded_Text.Result_Text
       (Humanize.Colors.CSS.Hex_Color
          ((Red => 51, Green => 102, Blue => 153)));
begin
   Ada.Command_Line.Set_Exit_Status
     (if Code = Humanize.Status.Ok and then Hex = "#336699"
      then Ada.Command_Line.Success
      else Ada.Command_Line.Failure);
end Public_API_Color_Consumer;
