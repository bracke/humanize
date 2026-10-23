separate (Humanize.Parsing.Localized)
function Parse_Calendar_Difference
  (Context : Humanize.Contexts.Context;
   Text    : String)
   return Calendar_Difference_Parse_Result
is
   Words : constant Lexicon := Learned (Context, Difference_Kind);
   Value : Long_Float;
begin
   if Read_Joined (Words.Forms, Words.Joins, Trimmed (Plain (Context, Text)), Value)
     and then Value >= 0.0 and then Value < Long_Float (Natural'Last)
   then
      declare
         Whole : constant Natural := Natural (Value);
      begin
         return (Status => Humanize.Status.Ok, Years => Whole / 10_000, Months => Whole / 100 mod 100,
                 Days => Whole mod 100);
      end;
   end if;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Calendar_Difference;
