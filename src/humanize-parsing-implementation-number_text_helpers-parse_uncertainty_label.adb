separate (Humanize.Parsing.Implementation.Number_Text_Helpers)
function Parse_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Center : Long_Float := 0.0;
      Amount : Long_Float := 0.0;
      Low_Value : Long_Float := 0.0;
      High_Value : Long_Float := 0.0;
      Tail : Unbounded_String;
      Join : Natural := 0;
begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      if Parse_Number_And_Tail (Item, Center, Tail) then
         declare
            Tail_Text : constant String := Trim (To_String (Tail));
         begin
            if Starts_With (Tail_Text, "+/- ") then
               if Tail_Text'Length >= 5
                 and then Numeric_Value
                   (Trim (Tail_Text (5 .. Tail_Text'Last)), Amount)
                 and then Amount >= 0.0
               then
                  return
                    (Status => Humanize.Status.Ok,
                     Value => Center,
                     Uncertainty => Amount,
                     Low => Center - Amount,
                     High => Center + Amount,
                     Style => Humanize.Numbers.Plus_Minus_Uncertainty,
                     Exact => True,
                     Consumed => Item'Length,
                     Error_Position => 0,
                     Error => No_Parse_Error);
               end if;
            elsif Starts_With (Tail_Text, "(+/- ")
              and then Tail_Text'Length >= 7
              and then Tail_Text (Tail_Text'Last) = ')'
            then
               declare
                  Inner : constant String :=
                    Tail_Text (6 .. Tail_Text'Last - 1);
               begin
                  if Numeric_Value (Trim (Inner), Amount)
                    and then Amount >= 0.0
                  then
                     return
                       (Status => Humanize.Status.Ok,
                        Value => Center,
                        Uncertainty => Amount,
                        Low => Center - Amount,
                        High => Center + Amount,
                        Style => Humanize.Numbers.Parenthesized_Uncertainty,
                        Exact => True,
                        Consumed => Item'Length,
                        Error_Position => 0,
                        Error => No_Parse_Error);
                  end if;
               end;
            end if;
         end;
      end if;

      Join := Find_Substring (Item, " to ");
      if Join /= 0
        and then Numeric_Value (Trim (Item (Item'First .. Join - 1)), Low_Value)
        and then Numeric_Value
          (Trim (Item (Join + 4 .. Item'Last)), High_Value)
      then
         if High_Value < Low_Value then
            return
              (Status => Humanize.Status.Invalid_Value,
               Error => Out_Of_Range,
               others => <>);
         end if;

         return
           (Status => Humanize.Status.Ok,
            Value => (Low_Value + High_Value) / 2.0,
            Uncertainty => (High_Value - Low_Value) / 2.0,
            Low => Low_Value,
            High => High_Value,
            Style => Humanize.Numbers.Interval_Uncertainty,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      end if;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         Error => Expected_Separator,
         others => <>);
end Parse_Uncertainty_Label;
