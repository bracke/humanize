separate (Humanize.Parsing.Implementation.Unit_Text_Helpers)
function Parse_Unit
     (Text : String)
      return Unit_Parse_Result
   is
      Item : constant String := Trim (Normalize_Native_Digits (Text));
      Last_Number : Natural;
      Unit_Start : Natural;
      Amount : Long_Float;
      Unit : Humanize.Units.Unit_Kind;
begin
      if not Split_Number_Unit (Item, Last_Number, Unit_Start) then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'First,
            Error =>
              (if Item'Length = 0 then Empty_Input
               elsif Is_Digit (Item (Item'First))
                 or else Item (Item'First) = '+'
                 or else Item (Item'First) = '-'
               then Expected_Unit
               else Expected_Number),
            others => <>);
      end if;

      if not Numeric_Value (Item (Item'First .. Last_Number), Amount) then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'First,
            Error => Expected_Number,
            others => <>);
      elsif not Unit_Value (Item (Unit_Start .. Item'Last), Unit) then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Unit_Start,
            Error => Expected_Unit,
            others => <>);
      end if;

      return
        (Status   => Humanize.Status.Ok,
         Value    => Amount,
         Unit     => Unit,
         Exact    => True,
         Consumed => Trim (Text)'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Value, others => <>);
end Parse_Unit;
