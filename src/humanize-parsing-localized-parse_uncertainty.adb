with Humanize.Numbers.Ranges;

separate (Humanize.Parsing.Localized)
function Parse_Uncertainty (Context : Humanize.Contexts.Context; Text : String) return Uncertainty_Parse_Result is
   Item : constant String := Trimmed (Text);
   Seen : constant Number_List := Numbers_In (Context, Item);

   function Same (Label : Humanize.Status.Text_Result) return Boolean is
     (Label.Status = Humanize.Status.Ok and then To_String (Label.Text) = Item);
begin
   if Seen'Length /= 2 then
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end if;
   for Sign of Sign_Choices loop
      declare
         Value : constant Long_Float := Sign * Seen (1).Value;
      begin
         if Seen (1).Decimals = 0 and then Seen (2).Decimals = 0
           and then abs Value < 1.0E18 and then Seen (2).Value < Long_Float (Natural'Last)
           and then Same (Humanize.Numbers.Ranges.Tolerance_Range
                            (Context, Long_Long_Integer (Value), Natural (Seen (2).Value)))
         then
            return (Status => Humanize.Status.Ok, Value => Value, Uncertainty => Seen (2).Value);
         end if;
         for Digits_Shown in 0 .. 3 loop
            for Suppress in Boolean loop
               for Style in Humanize.Numbers.Plus_Minus_Uncertainty .. Humanize.Numbers.Parenthesized_Uncertainty loop
                  if Same (Humanize.Numbers.Ranges.Uncertainty_Label
                             (Context, Value, Seen (2).Value,
                              (Maximum_Fraction_Digits => Digits_Shown, Suppress_Trailing_Zero => Suppress), Style))
                  then
                     return (Status => Humanize.Status.Ok, Value => Value, Uncertainty => Seen (2).Value);
                  end if;
               end loop;
            end loop;
         end loop;
      end;
   end loop;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Uncertainty;
