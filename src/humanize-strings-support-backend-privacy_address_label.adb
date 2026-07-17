separate (Humanize.Strings.Support.Backend)
function Privacy_Address_Label
     (Address : Address_Fields)
      return Humanize.Status.Text_Result
   is
      City : constant String := Slice_Field (Address.City, Address.City_Length);
      Region : constant String :=
        Slice_Field (Address.Region, Address.Region_Length);
      Country : constant String :=
        Slice_Field (Address.Country, Address.Country_Length);
      Result : Unbounded_String;
begin
      if City'Length > 0 then
         Append (Result, City);
      end if;
      if Region'Length > 0 then
         if Length (Result) > 0 then
            Append (Result, ", ");
         end if;
         Append (Result, Region);
      end if;
      if Country'Length > 0 then
         if Length (Result) > 0 then
            Append (Result, ", ");
         end if;
         Append (Result, Country);
      end if;

      if Length (Result) = 0 then
         return Ok_Text ("address redacted");
      else
         return Ok_Text ("address near " & To_String (Result));
      end if;
end Privacy_Address_Label;
