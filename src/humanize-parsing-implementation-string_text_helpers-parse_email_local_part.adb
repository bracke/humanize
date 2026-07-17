separate (Humanize.Parsing.Implementation.String_Text_Helpers)
function Parse_Email_Local_Part
     (Text : String)
      return Email_Local_Part_Parse_Result
   is
      Item : constant String := Trim (Text);
      Buffer : String (1 .. 160);
      Length : Natural;
      Segments : Natural := (if Item'Length = 0 then 0 else 1);
      Has_Dot : Boolean := False;
      Looks_Local : Boolean := Item'Length > 0;
begin
      for Ch of Item loop
         if Ch = '@' then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Unsupported_Form,
                    others => <>);
         elsif Ch = '.' then
            Has_Dot := True;
            Segments := Segments + 1;
         elsif not (Is_Alnum (Ch)
                    or else Ch = '!'
                    or else Ch = '#'
                    or else Ch = '$'
                    or else Ch = '%'
                    or else Ch = '&'
                    or else Ch = '''
                    or else Ch = '*'
                    or else Ch = '+'
                    or else Ch = '-'
                    or else Ch = '/'
                    or else Ch = '='
                    or else Ch = '?'
                    or else Ch = '^'
                    or else Ch = '_'
                    or else Ch = '`'
                    or else Ch = '{'
                    or else Ch = '|'
                    or else Ch = '}'
                    or else Ch = '~')
         then
            Looks_Local := False;
         end if;
      end loop;

      if Item'Length > 0
        and then (Item (Item'First) = '.'
                  or else Item (Item'Last) = '.'
                  or else Find_Substring (Item, "..") /= 0)
      then
         Looks_Local := False;
      end if;

      Store (Item, Buffer, Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Empty => Item'Length = 0,
         Segment_Count => Segments,
         Has_Dot => Has_Dot,
         Looks_Local_Part => Looks_Local,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Email_Local_Part;
