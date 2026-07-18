separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Parse_Pagination_Range
     (Text : String)
      return Pagination_Range_Parse_Result
   is
      Item : constant String := Trim (Text);
      Dash : constant Natural := Find_Substring (Item, "-");
      Of_At : constant Natural := Find_Substring (Item, " of ");
      First : Natural;
      Last : Natural;
      Total : Natural;
      Unit_Buffer : String (1 .. 32);
      Unit_Length : Natural;
      Amount : Long_Float;
      Tail : Unbounded_String;
begin
      if Dash = 0 or else Of_At = 0 or else Dash > Of_At
        or else not Parse_Natural_Field (Item (Item'First .. Dash - 1), First)
        or else not Parse_Natural_Field (Item (Dash + 1 .. Of_At - 1), Last)
        or else not Parse_Number_And_Tail
          (Item (Of_At + 4 .. Item'Last), Amount, Tail)
        or else Amount < 0.0
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      Total := Natural (Long_Float'Rounding (Amount));
      if Long_Float (Total) /= Amount then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      Store (To_String (Tail), Unit_Buffer, Unit_Length);
      return
        (Status => Humanize.Status.Ok,
         First => First,
         Last => Last,
         Total => Total,
         Unit => Unit_Buffer,
         Unit_Length => Unit_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when Constraint_Error => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Pagination_Range;
