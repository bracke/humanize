separate (Humanize.Parsing.Implementation.Number_Text_Helpers)
function Parse_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Join : constant Natural := Find_Substring (Item, " to ");
      Low_Value : Long_Float := 0.0;
      High_Value : Long_Float := 0.0;
begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      if Join = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'First,
            Error => Expected_Separator,
            others => <>);
      end if;

      if not Numeric_Value (Trim (Item (Item'First .. Join - 1)), Low_Value)
        or else not Numeric_Value
          (Trim (Item (Join + 4 .. Item'Last)), High_Value)
      then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Join + 4,
            Error => Expected_Number,
            others => <>);
      end if;

      if High_Value < Low_Value then
         return
           (Status => Humanize.Status.Invalid_Value,
            Error => Out_Of_Range,
            others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Low => Low_Value,
         High => High_Value,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Decimal_Range;
