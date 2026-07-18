separate (Humanize.Cross_Domain.Support)
function Product_Code_Checksum
  (Value : String;
   Kind  : Product_Code_Kind := Unknown_Product_Code)
   return Checksum_State
is
   Digit_Text : constant String := Only_Digits (Value);
   Actual : constant Product_Code_Kind :=
     (if Kind = Unknown_Product_Code then Product_Code_Kind_Of (Value)
      else Kind);
   Sum : Natural := 0;
   Check : Natural;
begin
   if Actual = SKU_Code or else Actual = Barcode_Code
     or else Actual = Unknown_Product_Code
   then
      return Checksum_Not_Checked;
   elsif Actual = ISBN_10_Code then
      if Digit_Text'Length /= 10 then
         return Checksum_Missing;
      end if;
      for Index in 1 .. 9 loop
         Sum := Sum
           + Natural'Value (Digit_Text (Index .. Index)) * (11 - Index);
      end loop;
      Check := (11 - (Sum mod 11)) mod 11;
      if Check = Natural'Value (Digit_Text (10 .. 10)) then
         return Checksum_Valid;
      else
         return Checksum_Mismatch;
      end if;
   elsif Digit_Text'Length = 12 and then Actual = UPC_A_Code then
      for Index in 1 .. 11 loop
         if Index mod 2 = 1 then
            Sum := Sum + Natural'Value (Digit_Text (Index .. Index)) * 3;
         else
            Sum := Sum + Natural'Value (Digit_Text (Index .. Index));
         end if;
      end loop;
      Check := (10 - (Sum mod 10)) mod 10;
   elsif Digit_Text'Length = 13 then
      for Index in 1 .. 12 loop
         if Index mod 2 = 0 then
            Sum := Sum + Natural'Value (Digit_Text (Index .. Index)) * 3;
         else
            Sum := Sum + Natural'Value (Digit_Text (Index .. Index));
         end if;
      end loop;
      Check := (10 - (Sum mod 10)) mod 10;
   else
      return Checksum_Missing;
   end if;

   if Check = Natural'Value
     (Digit_Text (Digit_Text'Last .. Digit_Text'Last))
   then
      return Checksum_Valid;
   else
      return Checksum_Mismatch;
   end if;
exception
   when Constraint_Error => --  defensive recovery
      return Checksum_Mismatch;
end Product_Code_Checksum;
