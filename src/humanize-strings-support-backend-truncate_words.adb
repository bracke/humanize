separate (Humanize.Strings.Support.Backend)
function Truncate_Words
     (Text      : String;
      Max_Words : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Words  : Natural := 0;
      Index  : Natural := Text'First;
begin
      if Max_Words = 0 then
         return Ok_Text (Ellipsis);
      end if;

      while Index <= Text'Last loop
         while Index <= Text'Last and then Text (Index) = ' ' loop
            Index := Index + 1;
         end loop;
         exit when Index > Text'Last;

         Words := Words + 1;
         if Words > Max_Words then
            Append (Result, " " & Ellipsis);
            return Ok_Text (To_String (Result));
         end if;

         if Length (Result) > 0 then
            Append (Result, " ");
         end if;
         while Index <= Text'Last and then Text (Index) /= ' ' loop
            Append (Result, Text (Index));
            Index := Index + 1;
         end loop;
      end loop;

      return Ok_Text (To_String (Result));
end Truncate_Words;
