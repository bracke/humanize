separate (Humanize.Parsing.Implementation.Number_Text_Helpers)
function Parse_Cardinal
     (Text : String)
      return Number_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Amount : Long_Float;
      Total : Integer := 0;
      Index : Natural := Item'First;
      Locale_Value : Long_Long_Integer := 0;
begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      elsif Numeric_Value (Item, Amount) then
         return
           (Status => Humanize.Status.Ok,
            Value => Long_Long_Integer (Long_Float'Rounding (Amount)),
            Exact => Long_Float'Rounding (Amount) = Amount,
            Consumed => Item'Length,
            Error_Position => 0,
         Error => No_Parse_Error);
      end if;

      while Index <= Item'Last loop
         while Index <= Item'Last
           and then (Item (Index) = ' ' or else Item (Index) = '-')
         loop
            Index := Index + 1;
         end loop;
         exit when Index > Item'Last;
         declare
            Start : constant Natural := Index;
         begin
            while Index <= Item'Last
              and then Item (Index) /= ' ' and then Item (Index) /= '-'
            loop
               Index := Index + 1;
            end loop;
            declare
               Part : constant Integer :=
                 Small_English_Number (Item (Start .. Index - 1));
            begin
               if Part < 0 then
                  if Humanize.Numbers.Parse_Deterministic_Cardinal
                       (Item, Locale_Value)
                  then
                     return
                       (Status => Humanize.Status.Ok,
                        Value => Locale_Value,
                        Exact => True,
                        Consumed => Item'Length,
                        Error_Position => 0,
                        Error => No_Parse_Error);
                  end if;
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error_Position => Start,
                          Error => Expected_Number,
                          others => <>);
               end if;
               Total := Total + Part;
            end;
         end;
      end loop;

      return
        (Status => Humanize.Status.Ok,
         Value => Long_Long_Integer (Total),
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Cardinal;
