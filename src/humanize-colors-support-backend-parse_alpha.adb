separate (Humanize.Colors.Support.Backend)
   function Parse_Alpha
     (Text  : String;
      Value : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Raw  : Long_Float;
   begin
      if Item'Length = 0 then
         Value := 1.0;
         return False;
      elsif Item = "none" then
         Value := 1.0;
         return True;
      elsif Starts_With (Item, "calc(") then
         if not Parse_Calc (Item, 1.0, Raw)
           or else Raw < 0.0
           or else Raw > 1.0
         then
            Value := 1.0;
            return False;
         end if;
         Value := Raw;
         return True;
      elsif Ends_With (Item, "%") then
         if not Parse_Float (Item (Item'First .. Item'Last - 1), Raw) then
            Value := 1.0;
            return False;
         end if;
         if Raw < 0.0 or else Raw > 100.0 then
            Value := 1.0;
            return False;
         end if;
         Value := Raw / 100.0;
         return True;
      else
         if not Parse_Float (Item, Raw) or else Raw < 0.0 or else Raw > 1.0 then
            Value := 1.0;
            return False;
         end if;
         Value := Raw;
         return True;
      end if;
   end Parse_Alpha;
