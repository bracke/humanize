separate (Humanize.Phrases.Support.Backend)
function Cache_Summary
  (Context : Humanize.Contexts.Context;
   Hits    : Natural;
   Misses  : Natural)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
      Total : constant Natural := Hits + Misses;
      Rate  : Natural := 0;
   begin
      if Total = 0 then
         return Ok_Text ("cache: no requests");
      end if;

      Rate :=
        Natural
          ((Long_Long_Integer (Hits) * 100
            + Long_Long_Integer (Total) / 2)
           / Long_Long_Integer (Total));

      return Ok_Text
        ("cache: " & Natural_Text (Hits) & " "
         & Unit_Noun (Hits, "hit", "hits") & ", "
         & Natural_Text (Misses) & " " & Unit_Noun (Misses, "miss", "misses")
         & ", " & Natural_Text (Rate) & "% hit rate");
   end English;
   Total : constant Long_Long_Integer := Long_Long_Integer (Hits) + Long_Long_Integer (Misses);
   Rate  : constant Natural :=
     (if Total = 0 then 0 else Natural ((Long_Long_Integer (Hits) * 100 + Total / 2) / Total));
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Num (Num (Num (Sel.Phrase (if Total = 0 then "cache_summary.empty" else "cache_summary"),
                     "hits", Hits),
                "misses", Misses),
           "rate", Rate),
      English);
end Cache_Summary;
