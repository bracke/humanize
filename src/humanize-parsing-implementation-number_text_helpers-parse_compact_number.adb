separate (Humanize.Parsing.Implementation.Number_Text_Helpers)
function Parse_Compact_Number
     (Text : String)
      return Number_Parse_Result
   is
      Item        : constant String := Trim (Normalize_Native_Digits (Text));
      Last_Number : Natural := Item'First - 1;
      Amount      : Long_Float;
      Multiplier  : Long_Float;
      Rounded     : Long_Long_Integer;
begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Value => 0,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      for Index in Item'Range loop
         if Is_Digit (Item (Index))
           or else Item (Index) = '.'
           or else Item (Index) = ','
           or else Item (Index) = '+'
           or else Item (Index) = '-'
         then
            Last_Number := Index;
         else
            exit;
         end if;
      end loop;

      if Last_Number < Item'First
        or else not Numeric_Value (Item (Item'First .. Last_Number), Amount)
      then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Value => 0,
            Error_Position => Text'First,
            Error => Expected_Number,
            others => <>);
      end if;

      declare
         Unit : constant String :=
           (if Last_Number = Item'Last then ""
            else Trim (Item (Last_Number + 1 .. Item'Last)));
      begin
         if Unit = "B"
           and then Has_Decimal_Comma (Item (Item'First .. Last_Number))
         then
            Multiplier := 1_000.0;
         else
            Multiplier := Compact_Multiplier (Unit);
         end if;
      end;

      if Multiplier = 0.0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Value => 0,
            Error_Position => Last_Number + 1,
            Error => Expected_Unit,
            others => <>);
      end if;

      Rounded := Long_Long_Integer (Long_Float'Rounding (Amount * Multiplier));
      return
        (Status   => Humanize.Status.Ok,
         Value    => Rounded,
         Exact    => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when Constraint_Error => --  parse failure normalization
         return
           (Status => Humanize.Status.Invalid_Value,
            Value => 0,
            Error_Position => Text'First,
            Error => Out_Of_Range,
            others => <>);
end Parse_Compact_Number;
