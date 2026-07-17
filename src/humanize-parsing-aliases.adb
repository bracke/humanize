with Humanize.Bounded_Text;

package body Humanize.Parsing.Aliases is
   function Digit_Value (Item : Character) return Natural
      renames Humanize.Bounded_Text.Digit_Value;

   function Has_Alias
     (Item    : String;
      Aliases : String)
      return Boolean
   is
      First : Natural := Aliases'First;
      Last  : Natural;

      function Hex_Alias_Matches (Hex : String) return Boolean is
         function Nibble (C : Character) return Natural is
         begin
            case C is
               when '0' .. '9' =>
                  return Digit_Value (C);
               when 'A' .. 'F' =>
                  return 10 + Character'Pos (C) - Character'Pos ('A');
               when 'a' .. 'f' =>
                  return 10 + Character'Pos (C) - Character'Pos ('a');
               when others =>
                  return 0;
            end case;
         end Nibble;
      begin
         if Hex'Length mod 2 /= 0
           or else Item'Length /= Hex'Length / 2
         then
            return False;
         end if;

         for Index in Item'Range loop
            declare
               Hex_Index : constant Natural :=
                 Hex'First + 2 * (Index - Item'First);
               Value : constant Character :=
                 Character'Val
                   (Nibble (Hex (Hex_Index)) * 16
                    + Nibble (Hex (Hex_Index + 1)));
            begin
               if Item (Index) /= Value then
                  return False;
               end if;
            end;
         end loop;

         return True;
      end Hex_Alias_Matches;
   begin
      while First <= Aliases'Last loop
         Last := First;
         while Last <= Aliases'Last
           and then Aliases (Last) /= ASCII.LF
         loop
            Last := Last + 1;
         end loop;

         if Last > First
           and then Aliases (First) = '#'
           and then Hex_Alias_Matches (Aliases (First + 1 .. Last - 1))
         then
            return True;
         elsif Aliases (First .. Last - 1) = Item then
            return True;
         end if;

         First := Last + 1;
      end loop;

      return False;
   end Has_Alias;

   function Alias_Prefix_Length
     (Item    : String;
      Aliases : String)
      return Natural
   is
      First : Natural := Aliases'First;
      Last  : Natural;
   begin
      while First <= Aliases'Last loop
         Last := First;
         while Last <= Aliases'Last
           and then Aliases (Last) /= ASCII.LF
         loop
            Last := Last + 1;
         end loop;

         if Last > First
           and then Item'Length >= Last - First
           and then Item (Item'First .. Item'First + (Last - First) - 1)
             = Aliases (First .. Last - 1)
         then
            return Last - First;
         end if;

         First := Last + 1;
      end loop;

      return 0;
   end Alias_Prefix_Length;
end Humanize.Parsing.Aliases;
