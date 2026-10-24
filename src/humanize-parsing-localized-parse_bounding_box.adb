with Humanize.Geo.Localized;

separate (Humanize.Parsing.Localized)
function Parse_Bounding_Box (Context : Humanize.Contexts.Context; Text : String) return Bounding_Box_Parse_Result is
   Item : constant String := Trimmed (Text);
   Seen : constant Number_List := Numbers_In (Context, Item);
begin
   if Seen'Length = 4 then
      for South of Sign_Choices loop
         for West of Sign_Choices loop
            for North of Sign_Choices loop
               for East of Sign_Choices loop
                  declare
                     Box   : constant Humanize.Geo.Bounding_Box :=
                       (South => South * Seen (1).Value, West => West * Seen (2).Value,
                        North => North * Seen (3).Value, East => East * Seen (4).Value);
                     Label : constant Humanize.Status.Text_Result :=
                       Humanize.Geo.Localized.Bounding_Box_Label (Context, Box, Seen (1).Decimals);
                  begin
                     if Label.Status = Humanize.Status.Ok and then To_String (Label.Text) = Item then
                        return (Status => Humanize.Status.Ok, Box => Box);
                     end if;
                  end;
               end loop;
            end loop;
         end loop;
      end loop;
   end if;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Bounding_Box;
