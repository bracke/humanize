separate (Humanize.Numbers.Spellout)
function Russian_Round_Hundredth
  (Context : Humanize.Contexts.Context;
   Value   : Natural)
   return Humanize.Status.Text_Result
is
   Thousands : constant Natural := Value - Value mod 1_000;
   Words     : constant Humanize.Status.Text_Result :=
     (if Thousands = 0 then (Status => Humanize.Status.Missing_Message, others => <>)
      else CLDR_Words (Context, Long_Long_Integer (Thousands)));
begin
   --  CLDR 48 writes the cardinal for a round 200 .. 900 ("две тысячи
   --  триста"); the thousands stay CLDR's words.
   if Value >= 1_000_000 or else Value mod 100 /= 0 or else Value mod 1_000 < 200 then
      return (Status => Humanize.Status.Missing_Message, others => <>);
   elsif Thousands = 0 then
      return Ok_Text (Humanize.Numbers.Spellout_Data.Ru_Round_Hundredth (Value / 100));
   elsif Words.Status = Humanize.Status.Ok then
      return Ok_Text
        (Humanize.Bounded_Text.Result_Text (Words) & " "
         & Humanize.Numbers.Spellout_Data.Ru_Round_Hundredth (Value mod 1_000 / 100));
   else
      return Words;
   end if;
end Russian_Round_Hundredth;
