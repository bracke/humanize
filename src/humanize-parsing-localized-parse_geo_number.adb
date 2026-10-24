with Humanize.Geo.Localized;

separate (Humanize.Parsing.Localized)
function Parse_Geo_Number (Context : Humanize.Contexts.Context; Text : String; Latitude : Boolean)
   return Float_Parse_Result
is
   Item : constant String := Trimmed (Text);
   Seen : constant Number_List := Numbers_In (Context, Item);
begin
   if Seen'Length = 1 then
      for Sign of Sign_Choices loop
         declare
            Value : constant Long_Float := Sign * Seen (1).Value;
            Label : constant Humanize.Status.Text_Result :=
              (if Latitude then Humanize.Geo.Localized.Latitude_Label (Context, Value, Seen (1).Decimals)
               else Humanize.Geo.Localized.Longitude_Label (Context, Value, Seen (1).Decimals));
         begin
            if Label.Status = Humanize.Status.Ok and then To_String (Label.Text) = Item then
               return (Status => Humanize.Status.Ok, Value => Value, Exact => True, Consumed => Text'Length,
                       others => <>);
            end if;
         end;
      end loop;
   end if;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Geo_Number;
