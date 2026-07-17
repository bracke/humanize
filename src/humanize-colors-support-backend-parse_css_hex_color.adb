separate (Humanize.Colors.Support.Backend)
function Parse_CSS_Hex_Color
     (Text  : String;
      Color : out CSS_Color)
      return Boolean
   is
      Item  : constant String := Trim (Text);
      First : Natural := Item'First;
      Last  : constant Natural := Item'Last;
      Valid : Boolean;

      function Digit (Index : Natural) return Natural is
      begin
         return Hex_Value (Item (Index), Valid);
      end Digit;

      function Pair (Index : Natural) return Natural is
         High : Natural;
         Low  : Natural;
      begin
         High := Hex_Value (Item (Index), Valid);
         if not Valid then
            return 256;
         end if;
         Low := Hex_Value (Item (Index + 1), Valid);
         if not Valid then
            return 256;
         end if;
         return High * 16 + Low;
      end Pair;

      R : Natural := 0;
      G : Natural := 0;
      B : Natural := 0;
      A : Natural := 255;
begin
      Color := (others => <>);
      if Item'Length = 0 then
         return False;
      elsif Item (First) = '#' then
         First := First + 1;
      end if;

      if First > Last then
         return False;
      end if;

      case Last - First + 1 is
         when 3 | 4 =>
            R := Digit (First);
            if not Valid then
               return False;
            end if;
            G := Digit (First + 1);
            if not Valid then
               return False;
            end if;
            B := Digit (First + 2);
            if not Valid then
               return False;
            end if;
            if Last - First + 1 = 4 then
               A := Digit (First + 3);
               if not Valid then
                  return False;
               end if;
            end if;
            R := R * 17;
            G := G * 17;
            B := B * 17;
            A := A * 17;
         when 6 | 8 =>
            R := Pair (First);
            G := Pair (First + 2);
            B := Pair (First + 4);
            if Last - First + 1 = 8 then
               A := Pair (First + 6);
            end if;
            if R > 255 or else G > 255 or else B > 255 or else A > 255 then
               return False;
            end if;
         when others =>
            return False;
      end case;

      Color :=
        (Color       =>
         (Red => R, Green => G, Blue => B),
         Opacity     => Long_Float (A) / 255.0,
         Has_Opacity => A /= 255,
         Is_Current  => False);
      return True;
end Parse_CSS_Hex_Color;
