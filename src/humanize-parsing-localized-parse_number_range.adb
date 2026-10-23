with Humanize.Numbers;

separate (Humanize.Parsing.Localized)
function Parse_Number_Range
  (Context : Humanize.Contexts.Context;
   Text    : String)
   return Number_Range_Parse_Result
is
   --  A way the locale writes a range: the text before, between and after
   --  its two numbers ("≈" "–" "", "about " "-" "", "" " to " "").
   type Shape is record
      Before, Between, After : Unbounded_String;
      Approximate            : Boolean := False;
   end record;

   function Shape_Of
     (Rendered : Humanize.Status.Text_Result; Low_Text, High_Text : String; Approximate : Boolean)
      return Shape
   is
      Shown : constant String :=
        (if Rendered.Status = Humanize.Status.Ok then Plain_Number (Context, To_String (Rendered.Text)) else "");
      Low   : constant Natural := Ada.Strings.Fixed.Index (Shown, Low_Text);
      High  : constant Natural :=
        (if Low = 0 then 0 else Ada.Strings.Fixed.Index (Shown (Low + Low_Text'Length .. Shown'Last), High_Text));
   begin
      if High = 0 then
         return (others => <>);
      end if;
      return (Before      => To_Unbounded_String (Shown (Shown'First .. Low - 1)),
              Between     => To_Unbounded_String (Shown (Low + Low_Text'Length .. High - 1)),
              After       => To_Unbounded_String (Shown (High + High_Text'Length .. Shown'Last)),
              Approximate => Approximate);
   end Shape_Of;

   --  A whole number as Plain_Number leaves it: digits, a '.' and more, a
   --  leading minus.
   function Value_Of (Part : String; Value : out Long_Float) return Boolean is
      Minus : constant String := [Character'Val (16#E2#), Character'Val (16#88#), Character'Val (16#92#)];
      First : Positive := Part'First;
      Sign  : Long_Float := 1.0;
      Last  : Natural;
   begin
      Value := 0.0;
      if Part'Length = 0 then
         return False;
      elsif Part (First) = '-' then
         Sign := -1.0;
         First := First + 1;
      elsif Part'Length > Minus'Length and then Part (First .. First + Minus'Length - 1) = Minus then
         Sign := -1.0;
         First := First + Minus'Length;
      end if;
      if First > Part'Last then
         return False;
      end if;
      Read_Number (Part, First, Last, Value);
      Value := Sign * Value;
      return Last = Part'Last;
   end Value_Of;

   Shapes : constant array (1 .. 3) of Shape :=
     [Shape_Of (Humanize.Numbers.Approximate_Range (Context, 111, 222), "111", "222", True),
      Shape_Of (Humanize.Numbers.Number_Range (Context, 111, 222), "111", "222", False),
      Shape_Of (Humanize.Numbers.Decimal_Range (Context, 1.5, 2.5), "1.5", "2.5", False)];
   Item : constant String := Trimmed (Plain_Number (Context, Text));
begin
   for S of Shapes loop
      declare
         Before  : constant String := To_String (S.Before);
         Between : constant String := To_String (S.Between);
         After   : constant String := To_String (S.After);
      begin
         if Between /= "" and then Item'Length > Before'Length + Between'Length + After'Length
           and then Item (Item'First .. Item'First + Before'Length - 1) = Before
           and then Item (Item'Last - After'Length + 1 .. Item'Last) = After
         then
            declare
               Middle : constant String := Item (Item'First + Before'Length .. Item'Last - After'Length);
            begin
               --  Each place Between stands: a minus can look like a dash.
               for Join in Middle'First + 1 .. Middle'Last - Between'Length loop
                  if Middle (Join .. Join + Between'Length - 1) = Between then
                     declare
                        Low, High : Long_Float;
                     begin
                        if Value_Of (Middle (Middle'First .. Join - 1), Low)
                          and then Value_Of (Middle (Join + Between'Length .. Middle'Last), High)
                        then
                           return (Status => Humanize.Status.Ok, Low => Low, High => High,
                                   Approximate => S.Approximate);
                        end if;
                     end;
                  end if;
               end loop;
            end;
         end if;
      end;
   end loop;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Number_Range;
