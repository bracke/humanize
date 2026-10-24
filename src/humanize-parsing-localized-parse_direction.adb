with Humanize.Geo.Localized;

separate (Humanize.Parsing.Localized)
function Parse_Direction (Context : Humanize.Contexts.Context; Text : String) return Direction_Parse_Result is
   Item : constant String := Trimmed (Text);
begin
   for Point in Humanize.Geo.Direction_Point loop
      for Style in Humanize.Geo.Direction_Label_Style loop
         declare
            Label : constant Humanize.Status.Text_Result :=
              Humanize.Geo.Localized.Direction_Label (Context, Point, Style);
         begin
            if Label.Status = Humanize.Status.Ok and then To_String (Label.Text) = Item then
               return (Status => Humanize.Status.Ok, Point => Point,
                       Bearing => 22.5 * Long_Float (Humanize.Geo.Direction_Point'Pos (Point)));
            end if;
         end;
      end loop;
   end loop;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Direction;
