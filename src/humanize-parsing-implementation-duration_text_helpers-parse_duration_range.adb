separate (Humanize.Parsing.Implementation.Duration_Text_Helpers)
function Parse_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result
   is
      Item : constant String := Trim (Text);
      Dash : Natural := 0;
begin
      for Index in Item'Range loop
         if Item (Index) = '-' then
            Dash := Index;
            exit;
         end if;
      end loop;

      if Dash = 0 or else Dash = Item'First or else Dash = Item'Last then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position =>
              (if Item'Length = 0 then Text'First
               elsif Dash = 0 then Item'First
               else Dash),
            Error =>
              (if Item'Length = 0 then Empty_Input
               else Expected_Separator),
            others => <>);
      end if;

      declare
         Left  : constant Duration_Parse_Result :=
           Parse_Duration (Item (Item'First .. Dash - 1));
         Right : constant Duration_Parse_Result :=
           Parse_Duration (Item (Dash + 1 .. Item'Last));
      begin
         if Left.Status /= Humanize.Status.Ok then
            return
              (Status => Left.Status,
               Error_Position => Item'First,
               Error => Diagnostic
                 (Left.Status, Left.Error_Position, Left.Error),
               others => <>);
         elsif Right.Status /= Humanize.Status.Ok then
            return
              (Status => Right.Status,
               Error_Position => Dash + 1,
               Error => Diagnostic
                 (Right.Status, Right.Error_Position, Right.Error),
               others => <>);
         elsif Right.Value < Left.Value then
            return
              (Status => Humanize.Status.Invalid_Value,
               Error => Out_Of_Range,
               others => <>);
         end if;

         return
           (Status => Humanize.Status.Ok,
            Low => Left.Value,
            High => Right.Value,
            Exact => Left.Exact and then Right.Exact,
            Consumed => Item'Length,
            Error_Position => 0,
         Error => No_Parse_Error);
      end;
end Parse_Duration_Range;
