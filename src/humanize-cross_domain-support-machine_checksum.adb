separate (Humanize.Cross_Domain.Support)
function Machine_Checksum
  (Value : String;
   Kind  : Machine_Checksum_Kind)
   return Checksum_State
is
   Item : constant String := Alnum_Upper (Value);
begin
   if Item'Length = 0 then
      return Checksum_Missing;
   end if;

   case Kind is
      when Luhn_Checksum =>
         return Luhn_Digits_Checksum (Only_Digits (Item));
      when IBAN_Checksum =>
         if Item'Length < 5 then
            return Checksum_Missing;
         elsif Mod_97
           (Expanded_Alnum_Digits
              (Item (Item'First + 4 .. Item'Last)
               & Item (Item'First .. Item'First + 3))) = 1
         then
            return Checksum_Valid;
         else
            return Checksum_Mismatch;
         end if;
      when ISIN_Checksum =>
         if Item'Length /= 12 then
            return Checksum_Missing;
         else
            return Luhn_Digits_Checksum (Expanded_Alnum_Digits (Item));
         end if;
      when VIN_Checksum =>
         return VIN_Checksum_State (Item);
      when Unknown_Checksum =>
         return Checksum_Not_Checked;
   end case;
end Machine_Checksum;
