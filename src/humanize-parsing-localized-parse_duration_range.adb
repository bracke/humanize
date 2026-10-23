separate (Humanize.Parsing.Localized)
function Parse_Duration_Range
  (Context : Humanize.Contexts.Context;
   Text    : String;
   Low     : out Humanize.Durations.Duration_Seconds;
   High    : out Humanize.Durations.Duration_Seconds)
   return Humanize.Status.Status_Code
is
   Item    : constant String := Trimmed (Text);
   En_Dash : constant String := [Character'Val (16#E2#), Character'Val (16#80#), Character'Val (16#93#)];
   Dashes  : constant array (1 .. 2) of Unbounded_String := [To_Unbounded_String ("-"), To_Unbounded_String (En_Dash)];
begin
   Low := 0;
   High := 0;
   --  Each dash that can join the two durations; the one whose reading the
   --  formatter writes back as Item.
   for Join in Item'First + 1 .. Item'Last - 1 loop
      for Dash of Dashes loop
         declare
            Mark : constant String := To_String (Dash);
         begin
            if Join + Mark'Length <= Item'Last and then Item (Join .. Join + Mark'Length - 1) = Mark then
               declare
                  Left  : constant Duration_Parse_Result := Parse_Duration (Context, Item (Item'First .. Join - 1));
                  Right : constant Duration_Parse_Result :=
                    Parse_Duration (Context, Item (Join + Mark'Length .. Item'Last));
               begin
                  if Left.Status = Humanize.Status.Ok and then Right.Status = Humanize.Status.Ok then
                     declare
                        Again : constant Humanize.Status.Text_Result :=
                          Humanize.Durations.Format_Range (Context, Left.Value, Right.Value);
                     begin
                        if Again.Status = Humanize.Status.Ok and then To_String (Again.Text) = Item then
                           Low := Left.Value;
                           High := Right.Value;
                           return Humanize.Status.Ok;
                        end if;
                     end;
                  end if;
               end;
            end if;
         end;
      end loop;
   end loop;
   return Humanize.Status.Invalid_Argument;
end Parse_Duration_Range;
