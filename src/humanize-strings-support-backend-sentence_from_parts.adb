separate (Humanize.Strings.Support.Backend)
function Sentence_From_Parts
     (Parts : Name_List)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
begin
      for Index in Parts'Range loop
         declare
            Part : constant String :=
              Result_Text (Squish (To_String (Parts (Index))));
         begin
            if Part'Length > 0 then
               if Length (Result) > 0 then
                  Append (Result, "; ");
               end if;
               Append (Result, Part);
            end if;
         end;
      end loop;

      if Length (Result) = 0 then
         return Ok_Text ("");
      end if;

      declare
         Text : constant String := To_String (Result);
      begin
         if Text (Text'Last) = '.' or else Text (Text'Last) = '!'
           or else Text (Text'Last) = '?'
         then
            return Capitalize (Text);
         else
            return Capitalize (Text & ".");
         end if;
      end;
end Sentence_From_Parts;
