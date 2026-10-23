with Humanize.Numbers;

separate (Humanize.Parsing.Localized)
function Parse_Duration_Range
  (Context : Humanize.Contexts.Context;
   Text    : String;
   Low     : out Humanize.Durations.Duration_Seconds;
   High    : out Humanize.Durations.Duration_Seconds)
   return Humanize.Status.Status_Code
is
   use type Humanize.Durations.Duration_Seconds;
   Item    : constant String := Trimmed (Text);
   En_Dash : constant String := [Character'Val (16#E2#), Character'Val (16#80#), Character'Val (16#93#)];
   --  The locale's own range joiner ("–", Japanese "～"), from its number range.
   Shown   : constant String :=
     Plain (Context, To_String (Humanize.Numbers.Number_Range (Context, 111, 222).Text));
   First   : constant Natural := Ada.Strings.Fixed.Index (Shown, "111");
   Second  : constant Natural := Ada.Strings.Fixed.Index (Shown, "222");
   Joiner  : constant String :=
     (if First > 0 and then Second > First + 3 then Shown (First + 3 .. Second - 1) else "-");
   Dashes  : constant array (1 .. 3) of Unbounded_String :=
     [To_Unbounded_String ("-"), To_Unbounded_String (En_Dash), To_Unbounded_String (Joiner)];
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
                  --  One unit written once ("1–2 Stunden", "saa 1–2"): the bare
                  --  number on one side in each unit, as the formatter writes it.
                  declare
                     Left_Number  : constant Float_Parse_Result :=
                       Parse_Number (Context, Item (Item'First .. Join - 1));
                     Right_Number : constant Float_Parse_Result :=
                       Parse_Number (Context, Item (Join + Mark'Length .. Item'Last));
                     type Second_List is array (1 .. 4) of Humanize.Durations.Duration_Seconds;
                     Units : constant Second_List := [86_400, 3_600, 60, 1];
                  begin
                     for Unit of Units loop
                        declare
                           L : constant Humanize.Durations.Duration_Seconds :=
                             (if Left.Status = Humanize.Status.Ok then Left.Value
                              elsif Left_Number.Status = Humanize.Status.Ok
                                and then Left_Number.Value in 0.0 .. 1.0E9
                              then Humanize.Durations.Duration_Seconds (Left_Number.Value) * Unit
                              else -1);
                           H : constant Humanize.Durations.Duration_Seconds :=
                             (if Right.Status = Humanize.Status.Ok then Right.Value
                              elsif Right_Number.Status = Humanize.Status.Ok
                                and then Right_Number.Value in 0.0 .. 1.0E9
                              then Humanize.Durations.Duration_Seconds (Right_Number.Value) * Unit
                              else -1);
                        begin
                           if L >= 0 and then H >= L then
                              declare
                                 Again : constant Humanize.Status.Text_Result :=
                                   Humanize.Durations.Format_Range (Context, L, H);
                              begin
                                 if Again.Status = Humanize.Status.Ok and then To_String (Again.Text) = Item then
                                    Low := L;
                                    High := H;
                                    return Humanize.Status.Ok;
                                 end if;
                              end;
                           end if;
                        end;
                     end loop;
                  end;
               end;
            end if;
         end;
      end loop;
   end loop;
   return Humanize.Status.Invalid_Argument;
end Parse_Duration_Range;
