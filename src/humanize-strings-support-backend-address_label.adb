separate (Humanize.Strings.Support.Backend)
function Address_Label
     (Address   : Address_Fields;
      Multiline : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      City_Line : Unbounded_String;
begin
      Append_Address_Part
        (Result, Slice_Field (Address.Name, Address.Name_Length), Multiline);
      Append_Address_Part
        (Result, Slice_Field (Address.Street, Address.Street_Length), Multiline);

      declare
         City : constant String := Slice_Field (Address.City, Address.City_Length);
         Region : constant String := Slice_Field (Address.Region, Address.Region_Length);
         Postal : constant String :=
           Slice_Field (Address.Postal_Code, Address.Postal_Length);
      begin
         if City'Length > 0 then
            Append (City_Line, City);
         end if;
         if Region'Length > 0 then
            if Length (City_Line) > 0 then
               Append (City_Line, ", ");
            end if;
            Append (City_Line, Region);
         end if;
         if Postal'Length > 0 then
            if Length (City_Line) > 0 then
               Append (City_Line, " ");
            end if;
            Append (City_Line, Postal);
         end if;
      end;

      Append_Address_Part (Result, To_String (City_Line), Multiline);
      Append_Address_Part
        (Result, Slice_Field (Address.Country, Address.Country_Length),
         Multiline);

      if Length (Result) = 0 then
         return Ok_Text ("address unavailable");
      else
         return Ok_Text (To_String (Result));
      end if;
end Address_Label;
