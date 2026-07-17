separate (Humanize.Colors.Support.Backend)
function Parse_RGB_Channel
     (Text  : String;
      Value : out Color_Channel)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Raw  : Long_Float;
begin
      if Item'Length = 0 then
         Value := 0;
         return False;
      elsif Item = "none" then
         Value := 0;
         return True;
      elsif Starts_With (Item, "calc(") then
         if not Parse_Calc (Item, 255.0, Raw) then
            Value := 0;
            return False;
         end if;
         if Raw < 0.0 or else Raw > 255.0 then
            Value := 0;
            return False;
         end if;
         Value := Channel_From_Float (Raw);
         return True;
      elsif Ends_With (Item, "%") then
         if not Parse_Float (Item (Item'First .. Item'Last - 1), Raw) then
            Value := 0;
            return False;
         end if;
         if Raw < 0.0 or else Raw > 100.0 then
            Value := 0;
            return False;
         end if;
         Value := Channel_From_Float (Raw * 2.55);
         return True;
      else
         if not Parse_Float (Item, Raw) then
            Value := 0;
            return False;
         end if;
         if Raw < 0.0 or else Raw > 255.0 then
            Value := 0;
            return False;
         end if;
         Value := Channel_From_Float (Raw);
         return True;
      end if;
end Parse_RGB_Channel;
