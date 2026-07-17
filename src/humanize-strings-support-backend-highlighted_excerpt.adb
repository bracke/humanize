separate (Humanize.Strings.Support.Backend)
function Highlighted_Excerpt
     (Text               : String;
      Phrase             : String;
      Radius             : Natural := 32;
      Ellipsis           : String := "...";
      Before             : String := "<mark>";
      After              : String := "</mark>";
      Options            : Highlight_Options := Default_Highlight_Options;
      Escape_HTML_Output : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Excerpted : constant Humanize.Status.Text_Result :=
        Excerpt_With_Options
          (Text, Phrase, Radius, Ellipsis, Options.Match_Mode);
begin
      return Highlight_Core
        (Result_Text (Excerpted), Phrase, Before, After, Options,
         Escape_HTML => Escape_HTML_Output);
end Highlighted_Excerpt;
