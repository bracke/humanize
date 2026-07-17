separate (Humanize.Colors.Support.Backend)
function Parse_Hex_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code
   is
      First : Natural := Text'First;
      Last  : constant Natural := Text'Last;
      V1    : Natural;
      Valid : Boolean;

      function Pair (Index : Natural) return Natural is
         High : Natural;
         Low  : Natural;
      begin
         High := Hex_Value (Text (Index), Valid);
         if not Valid then
            return 256;
         end if;
         Low := Hex_Value (Text (Index + 1), Valid);
         if not Valid then
            return 256;
         end if;
         return High * 16 + Low;
      end Pair;
begin
      Color := (others => 0);
      if Text'Length = 0 then
         return Humanize.Status.Invalid_Value;
      elsif Text (First) = '#' then
         First := First + 1;
      end if;

      if First > Last then
         return Humanize.Status.Invalid_Value;
      elsif Last - First + 1 = 3 then
         V1 := Hex_Value (Text (First), Valid);
         if not Valid then
            return Humanize.Status.Invalid_Value;
         end if;
         Color.Red := V1 * 17;
         V1 := Hex_Value (Text (First + 1), Valid);
         if not Valid then
            return Humanize.Status.Invalid_Value;
         end if;
         Color.Green := V1 * 17;
         V1 := Hex_Value (Text (First + 2), Valid);
         if not Valid then
            return Humanize.Status.Invalid_Value;
         end if;
         Color.Blue := V1 * 17;
         return Humanize.Status.Ok;
      elsif Last - First + 1 = 6 then
         V1 := Pair (First);
         declare
            V2 : constant Natural := Pair (First + 2);
            V3 : constant Natural := Pair (First + 4);
         begin
            if V1 > 255 or else V2 > 255 or else V3 > 255 then
               return Humanize.Status.Invalid_Value;
            end if;
            Color.Red := V1;
            Color.Green := V2;
            Color.Blue := V3;
            return Humanize.Status.Ok;
         end;
      else
         return Humanize.Status.Invalid_Value;
      end if;
end Parse_Hex_Color;
