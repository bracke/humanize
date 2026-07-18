separate (Humanize.Colors.Support.Backend)
   function Parse_Percent_Or_Number
     (Text         : String;
      Percent_Base : Long_Float;
      Value        : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Raw  : Long_Float;
   begin
      if Item = "none" then
         Value := 0.0;
         return True;
      elsif Starts_With (Item, "calc(") then
         return Parse_Calc (Item, Percent_Base, Value);
      end if;

      if Ends_With (Item, "%") then
         if not Parse_Float (Item (Item'First .. Item'Last - 1), Raw) then
            Value := 0.0;
            return False;
         end if;
         Value := Raw * Percent_Base / 100.0;
         return True;
      elsif Parse_Float (Item, Raw) then
         Value := Raw;
         return True;
      else
         Value := 0.0;
         return False;
      end if;
   end Parse_Percent_Or_Number;
