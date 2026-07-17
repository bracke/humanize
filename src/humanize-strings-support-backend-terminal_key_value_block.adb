separate (Humanize.Strings.Support.Backend)
function Terminal_Key_Value_Block
     (Keys    : Name_List;
      Values  : Name_List;
      Options : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Count  : constant Natural := Natural'Min (Keys'Length, Values'Length);
begin
      if Count = 0 then
         return Ok_Text ("");
      end if;

      for Offset in 0 .. Count - 1 loop
         declare
            Key : constant String := To_String (Keys (Keys'First + Offset));
            Value : constant String := To_String (Values (Values'First + Offset));
            Line : constant String := Result_Text
              (Terminal_Paragraph
                 (Value, Options.Width, Key & ": ", "  "));
         begin
            if Length (Result) > 0 then
               Append (Result, ASCII.LF);
            end if;
            Append (Result, Line);
         end;
      end loop;
      return Ok_Text (To_String (Result));
end Terminal_Key_Value_Block;
