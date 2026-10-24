with Humanize.Numbers.Scales;

separate (Humanize.Parsing.Localized)
function Parse_Approximation (Context : Humanize.Contexts.Context; Text : String) return Approximation_Parse_Result is
   Item : constant String := Trimmed (Text);
   Seen : constant Number_List := Numbers_In (Context, Item);
begin
   if Seen'Length = 1 and then Seen (1).Decimals = 0 and then Seen (1).Value < 1.0E18 then
      for Sign of Sign_Choices loop
         for Kind in Humanize.Numbers.Approximation_Kind loop
            declare
               Value : constant Long_Long_Integer := Long_Long_Integer (Sign * Seen (1).Value);
               Label : constant Humanize.Status.Text_Result :=
                 Humanize.Numbers.Scales.Approximate (Context, Value, Kind);
            begin
               if Label.Status = Humanize.Status.Ok and then To_String (Label.Text) = Item then
                  return (Status => Humanize.Status.Ok, Kind => Kind, Value => Value);
               end if;
            end;
         end loop;
      end loop;
   end if;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Approximation;
