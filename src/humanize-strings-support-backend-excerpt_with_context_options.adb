separate (Humanize.Strings.Support.Backend)
function Excerpt_With_Context_Options
     (Text          : String;
      Phrase        : String;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...";
      Options       : Match_Options := Default_Match_Options)
      return Humanize.Status.Text_Result
   is
      Pos : constant Natural :=
        Find_Match (Text, Phrase, Text'First, Options);
      Start : Natural;
      Stop  : Natural;
begin
      if Pos = 0 then
         return Truncate_Words (Text, Context_Words * 2 + 1, Ellipsis);
      end if;

      Start := Pos;
      for I in 1 .. Context_Words loop
         Start := Previous_Word_Start
           (Text, (if Start > Text'First then Start - 1 else Text'First));
      end loop;

      Stop := Pos + Phrase'Length - 1;
      for I in 1 .. Context_Words loop
         Stop := Next_Word_End
           (Text, (if Stop < Text'Last then Stop + 1 else Text'Last));
      end loop;

      declare
         Prefix : constant String :=
           (if Start > Text'First then Ellipsis else "");
         Suffix : constant String :=
           (if Stop < Text'Last then Ellipsis else "");
      begin
         return Ok_Text (Prefix & Text (Start .. Stop) & Suffix);
      end;
end Excerpt_With_Context_Options;
