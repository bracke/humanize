separate (Humanize.Parsing.Implementation.Number_Text_Helpers)
function Parse_Decimal_Words_Value
     (Text  : String;
      Value : out Long_Float)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Point : constant Natural := Find_Substring (Item, " point ");
      Whole : Long_Long_Integer := 0;
      Fraction : Long_Float := 0.0;
      Scale : Long_Float := 10.0;
      Position : Natural;
      Negative : constant Boolean := Starts_With (Item, "minus ");
      Body_First : constant Natural :=
        (if Negative then Item'First + 6 else Item'First);
begin
      if Item'Length = 0 then
         return False;
      elsif Point = 0 then
         if not Humanize.Numbers.Parse_Deterministic_Cardinal
           (Item (Body_First .. Item'Last), Whole)
         then
            return False;
         end if;
         Value := Long_Float (Whole);
      else
         if not Humanize.Numbers.Parse_Deterministic_Cardinal
           (Item (Body_First .. Point - 1), Whole)
         then
            return False;
         end if;

         Position := Point + 7;
         while Position <= Item'Last loop
            declare
               Space : constant Natural :=
                 Find_Substring (Item (Position .. Item'Last), " ");
               Stop : constant Natural :=
                 (if Space = 0 then Item'Last else Space - 1);
               Digit : Natural;
            begin
               if not Parse_Digit_Word (Item (Position .. Stop), Digit) then
                  return False;
               end if;
               Fraction := Fraction + Long_Float (Digit) / Scale;
               Scale := Scale * 10.0;
               Position := Stop + 2;
            end;
         end loop;
         Value := Long_Float (Whole) + Fraction;
      end if;

      if Negative then
         Value := -Value;
      end if;
      return True;
exception
      when others => --  parse failure normalization
         Value := 0.0;
         return False;
end Parse_Decimal_Words_Value;
