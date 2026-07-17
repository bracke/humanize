separate (Humanize.Parsing.Implementation.Duration_Text_Helpers)
function Lenient_Duration_Text (Text : String) return String is
      Item  : constant String := Clean_Lower (Text);
      First : Natural := Item'First;
begin
      if Item'Length = 0 then
         return "";
      end if;

      if Item (First) = '~' then
         First := First + 1;
      end if;

      while First <= Item'Last and then Item (First) = ' ' loop
         First := First + 1;
      end loop;

      if First + 2 <= Item'Last and then Item (First .. First + 2) = "in " then
         First := First + 3;
      end if;

      if First + 17 <= Item'Last
        and then Item (First .. First + 17) = "about half an hour"
      then
         return "30 minutes"
           & (if First + 18 <= Item'Last then Item (First + 18 .. Item'Last) else "");
      elsif First + 11 <= Item'Last
        and then Item (First .. First + 11) = "half an hour"
      then
         return "30 minutes"
           & (if First + 12 <= Item'Last then Item (First + 12 .. Item'Last) else "");
      elsif First + 14 <= Item'Last
        and then Item (First .. First + 14) = "a little under "
      then
         First := First + 15;
      elsif First + 9 <= Item'Last
        and then Item (First .. First + 9) = "just over "
      then
         First := First + 10;
      elsif First + 5 <= Item'Last and then Item (First .. First + 5) = "about " then
         First := First + 6;
      elsif First + 6 <= Item'Last
        and then Item (First .. First + 6) = "around "
      then
         First := First + 7;
      elsif First + 6 <= Item'Last
        and then Item (First .. First + 6) = "almost "
      then
         First := First + 7;
      elsif First + 4 <= Item'Last and then Item (First .. First + 4) = "over " then
         First := First + 5;
      end if;

      if First > Item'Last then
         return "";
      else
         return Item (First .. Item'Last);
      end if;
end Lenient_Duration_Text;
