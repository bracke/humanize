separate (Humanize.Strings.Support.Backend)
function Title_Case
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result     : Unbounded_String;
      New_Word   : Boolean := True;
      Have_Chars : Boolean := False;
begin
      for Ch of Text loop
         if Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF then
            if Have_Chars and then not New_Word then
               Append (Result, " ");
               New_Word := True;
            end if;
         else
            if New_Word then
               Append (Result, Upper (Ch));
               New_Word := False;
            else
               Append (Result, Lower (Ch));
            end if;
            Have_Chars := True;
         end if;
      end loop;

      declare
         Text_Result : constant String := To_String (Result);
      begin
         if Text_Result'Length > 0 and then Text_Result (Text_Result'Last) = ' ' then
            return Ok_Text (Text_Result (Text_Result'First .. Text_Result'Last - 1));
         else
            return Ok_Text (Text_Result);
         end if;
      end;
end Title_Case;
