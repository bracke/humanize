with Humanize.Contexts;

--  A locale's way of writing numbers, undone: its digits as ASCII, its
--  grouping separators dropped, and for quantities its decimal separator as
--  '.', learnt from how the locale renders sample numbers.
private package Humanize.Parsing.Locale_Digits is

   function Normalize
     (Context    : Humanize.Contexts.Context;
      Text       : String;
      Quantities : Boolean := False)
      return String;
   --  @param Context Context whose locale wrote Text.
   --  @param Text Rendered text.
   --  @param Quantities Also read the locale's decimal separator as '.',
   --  no-break and narrow spaces as ' ', and drop bidi marks.
   --  @return Text with the locale's digits as ASCII and grouping separators
   --  between digits dropped ("1.234" -> "1234", Arabic-Indic digits); Text
   --  where the locale cannot render.

end Humanize.Parsing.Locale_Digits;
