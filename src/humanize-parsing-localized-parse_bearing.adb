with Humanize.Geo.Localized;

separate (Humanize.Parsing.Localized)
function Parse_Bearing (Context : Humanize.Contexts.Context; Text : String) return Direction_Parse_Result is
   Item : constant String := Trimmed (Text);
   Seen : constant Number_List := Numbers_In (Context, Item);
begin
   if Seen'Length /= 1 then
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end if;
   for Style in Humanize.Geo.Direction_Style loop
      for Labels in Humanize.Geo.Direction_Label_Style loop
         declare
            Label : constant Humanize.Status.Text_Result :=
              Humanize.Geo.Localized.Bearing_Label (Context, Seen (1).Value, Style, Labels, Seen (1).Decimals);
         begin
            if Label.Status = Humanize.Status.Ok and then To_String (Label.Text) = Item then
               --  The compass point: the longest name the label shows.
               declare
                  Result : Direction_Parse_Result :=
                    (Status => Humanize.Status.Ok, Bearing => Seen (1).Value, others => <>);
                  Length : Natural := 0;
               begin
                  for Point in Humanize.Geo.Direction_Point loop
                     declare
                        Name : constant String :=
                          To_String (Humanize.Geo.Localized.Direction_Label (Context, Point, Labels).Text);
                     begin
                        if Name'Length > Length and then Ada.Strings.Fixed.Index (Item, Name) /= 0 then
                           Result.Point := Point;
                           Length := Name'Length;
                        end if;
                     end;
                  end loop;
                  return Result;
               end;
            end if;
         end;
      end loop;
   end loop;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Bearing;
