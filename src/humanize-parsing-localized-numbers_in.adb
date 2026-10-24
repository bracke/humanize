separate (Humanize.Parsing.Localized)
function Numbers_In (Context : Humanize.Contexts.Context; Text : String) return Number_List is
   Item   : constant String := Plain_Number (Context, Text);
   Found  : Number_List (1 .. 8);
   Count  : Natural := 0;
   Index  : Natural := Item'First;
begin
   while Index <= Item'Last and then Count < Found'Last loop
      if Item (Index) in '0' .. '9' then
         declare
            First    : constant Positive := Index;
            Point    : Natural := 0;
         begin
            while Index <= Item'Last
              and then (Item (Index) in '0' .. '9'
                        or else (Item (Index) = '.' and then Point = 0 and then Index < Item'Last
                                 and then Item (Index + 1) in '0' .. '9'))
            loop
               if Item (Index) = '.' then
                  Point := Index;
               end if;
               Index := Index + 1;
            end loop;
            if Index - First <= 18 then
               Count := Count + 1;
               Found (Count) :=
                 (Value    => Long_Float'Value (Item (First .. Index - 1)),
                  Decimals => (if Point = 0 then 0 else Index - 1 - Point));
            end if;
         end;
      else
         Index := Index + 1;
      end if;
   end loop;
   return Found (1 .. Count);
end Numbers_In;
