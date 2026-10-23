separate (Humanize.Parsing.Localized)
function Read_Number_Kind
  (Context : Humanize.Contexts.Context; Kind : Lexicon_Kind; Text : String; Code : String := "")
   return Float_Parse_Result
is
   Value     : Long_Float;
   Ambiguous : Boolean;
begin
   if Read_Whole
     (Learned (Context, Kind, Code => Code).Forms, Trimmed (Plain_Number (Context, Text)), Value, Ambiguous)
   then
      return (Status => Humanize.Status.Ok, Value => Value, Exact => not Ambiguous, Consumed => Text'Length,
              others => <>);
   end if;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Read_Number_Kind;
