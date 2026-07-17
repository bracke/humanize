separate (Humanize.Strings.Support.Backend)
function Highlight_Core
     (Text        : String;
      Phrase      : String;
      Before      : String;
      After       : String;
      Options     : Highlight_Options;
      Escape_HTML : Boolean)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Index  : Natural := Text'First;
      Pos    : Natural;
begin
      if Phrase'Length = 0 then
         Append_Output_Text (Result, Text, Escape_HTML);
         return Ok_Text (To_String (Result));
      end if;

      while Index <= Text'Last loop
         Pos := Find_Match (Text, Phrase, Index, Options.Match_Mode);
         if Pos = 0 then
            Append_Output_Text (Result, Text (Index .. Text'Last), Escape_HTML);
            exit;
         end if;
         if Pos > Index then
            Append_Output_Text (Result, Text (Index .. Pos - 1), Escape_HTML);
         end if;

         Append (Result, Before);
         Append_Output_Text
           (Result, Text (Pos .. Pos + Phrase'Length - 1), Escape_HTML);
         Append (Result, After);

         Index := Pos + Phrase'Length;
         if Options.Count_Mode = First_Match and then Index <= Text'Last then
            Append_Output_Text (Result, Text (Index .. Text'Last), Escape_HTML);
            exit;
         end if;
      end loop;
      return Ok_Text (To_String (Result));
end Highlight_Core;
