separate (Humanize.Parsing.Implementation.Number_Text_Helpers)
function Small_English_Number (Word : String) return Integer is
      W : constant String := Clean_Lower (Word);
begin
      if W = "zero" then
         return 0;
      elsif W = "one" or else W = "first" then
         return 1;
      elsif W = "two" or else W = "second" then
         return 2;
      elsif W = "three" or else W = "third" then
         return 3;
      elsif W = "four" or else W = "fourth" then
         return 4;
      elsif W = "five" or else W = "fifth" then
         return 5;
      elsif W = "six" or else W = "sixth" then
         return 6;
      elsif W = "seven" or else W = "seventh" then
         return 7;
      elsif W = "eight" or else W = "eighth" then
         return 8;
      elsif W = "nine" or else W = "ninth" then
         return 9;
      elsif W = "ten" or else W = "tenth" then
         return 10;
      elsif W = "eleven" or else W = "eleventh" then
         return 11;
      elsif W = "twelve" or else W = "twelfth" then
         return 12;
      elsif W = "thirteen" or else W = "thirteenth" then
         return 13;
      elsif W = "fourteen" or else W = "fourteenth" then
         return 14;
      elsif W = "fifteen" or else W = "fifteenth" then
         return 15;
      elsif W = "sixteen" or else W = "sixteenth" then
         return 16;
      elsif W = "seventeen" or else W = "seventeenth" then
         return 17;
      elsif W = "eighteen" or else W = "eighteenth" then
         return 18;
      elsif W = "nineteen" or else W = "nineteenth" then
         return 19;
      elsif W = "twenty" or else W = "twentieth" then
         return 20;
      elsif W = "thirty" or else W = "thirtieth" then
         return 30;
      elsif W = "forty" or else W = "fortieth" then
         return 40;
      elsif W = "fifty" or else W = "fiftieth" then
         return 50;
      elsif W = "sixty" or else W = "sixtieth" then
         return 60;
      elsif W = "seventy" or else W = "seventieth" then
         return 70;
      elsif W = "eighty" or else W = "eightieth" then
         return 80;
      elsif W = "ninety" or else W = "ninetieth" then
         return 90;
      else
         return -1;
      end if;
end Small_English_Number;
