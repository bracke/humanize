separate (Humanize.Colors.Support.Backend)
function Parse_Hue
     (Text  : String;
      Value : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Raw  : Long_Float;
begin
      if Item = "none" then
         Raw := 0.0;
      elsif Starts_With (Item, "calc(") then
         if not Parse_Calc (Item, 360.0, Raw) then
            Value := 0.0;
            return False;
         end if;
      elsif Ends_With (Item, "deg") then
         if not Parse_Float (Item (Item'First .. Item'Last - 3), Raw) then
            Value := 0.0;
            return False;
         end if;
      elsif Ends_With (Item, "grad") then
         if not Parse_Float (Item (Item'First .. Item'Last - 4), Raw) then
            Value := 0.0;
            return False;
         end if;
         Raw := Raw * 0.9;
      elsif Ends_With (Item, "rad") then
         if not Parse_Float (Item (Item'First .. Item'Last - 3), Raw) then
            Value := 0.0;
            return False;
         end if;
         Raw := Raw * 180.0 / Ada.Numerics.Pi;
      elsif Ends_With (Item, "turn") then
         if not Parse_Float (Item (Item'First .. Item'Last - 4), Raw) then
            Value := 0.0;
            return False;
         end if;
         Raw := Raw * 360.0;
      elsif Parse_Float (Item, Raw) then
         null;
      else
         Value := 0.0;
         return False;
      end if;

      while Raw < 0.0 loop
         Raw := Raw + 360.0;
      end loop;
      while Raw >= 360.0 loop
         Raw := Raw - 360.0;
      end loop;
      Value := Raw;
      return True;
end Parse_Hue;
