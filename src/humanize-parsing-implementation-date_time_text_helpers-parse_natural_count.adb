separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Natural_Count (Text : String; Value : out Integer) return Boolean is
      Item : constant String := Clean_Lower (Text);
      Amount : Long_Float;
begin
      if Item = "a" or else Item = "an" or else Item = "one" then
         Value := 1;
         return True;
      elsif Item = "couple" or else Item = "a couple" then
         Value := 2;
         return True;
      elsif Item = "two" then
         Value := 2;
         return True;
      elsif Item = "few" or else Item = "a few" then
         Value := 3;
         return True;
      elsif Item = "three" then
         Value := 3;
         return True;
      elsif Item = "four" then
         Value := 4;
         return True;
      elsif Item = "five" then
         Value := 5;
         return True;
      elsif Item = "six" then
         Value := 6;
         return True;
      elsif Item = "several" then
         Value := 7;
         return True;
      elsif Item = "seven" then
         Value := 7;
         return True;
      elsif Item = "eight" then
         Value := 8;
         return True;
      elsif Item = "nine" then
         Value := 9;
         return True;
      elsif Item = "ten" then
         Value := 10;
         return True;
      elsif Numeric_Value (Item, Amount) and then Amount >= 0.0 then
         Value := Integer (Long_Float'Rounding (Amount));
         return Long_Float (Value) = Amount;
      else
         return False;
      end if;
end Parse_Natural_Count;
