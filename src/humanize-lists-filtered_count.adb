separate (Humanize.Lists)
function Filtered_Count
  (Context  : Humanize.Contexts.Context;
   Matching : Natural;
   Total    : Natural;
   Singular : String := "result";
   Plural   : String := "results")
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
      Noun : constant String := Noun_For (Total, Singular, Plural);
   begin
      if Matching = 0 then
         return Ok_Text ("no " & Noun & " match");
      elsif Matching = Total then
         return Ok_Text ("all " & Natural_Text (Total) & " "
            & Noun & " match");
      else
         return Ok_Text (Natural_Text (Matching) & " of "
            & Natural_Text (Total) & " "
            & Noun & " match");
      end if;
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      With_Nouns (Context, Num (Num (Sel.Phrase (if Matching = 0 then "filtered_count.none" elsif Matching = Total
        then "filtered_count.all" else "filtered_count.some"), "matching", Matching), "total", Total), Singular,
          Plural),
      English);
end Filtered_Count;
