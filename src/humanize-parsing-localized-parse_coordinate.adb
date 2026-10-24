with Humanize.Geo.Localized;

separate (Humanize.Parsing.Localized)
function Parse_Coordinate (Context : Humanize.Contexts.Context; Text : String) return Coordinate_Parse_Result is
   Item : constant String := Trimmed (Text);
   Seen : constant Number_List := Numbers_In (Context, Item);
begin
   if Seen'Length = 2 then
      for North_South of Sign_Choices loop
         for East_West of Sign_Choices loop
            declare
               Label : constant Humanize.Status.Text_Result :=
                 Humanize.Geo.Localized.Coordinate_Label
                   (Context, North_South * Seen (1).Value, East_West * Seen (2).Value, Seen (1).Decimals);
            begin
               if Label.Status = Humanize.Status.Ok and then To_String (Label.Text) = Item then
                  return (Status => Humanize.Status.Ok, Latitude => North_South * Seen (1).Value,
                          Longitude => East_West * Seen (2).Value);
               end if;
            end;
         end loop;
      end loop;
   end if;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Coordinate;
