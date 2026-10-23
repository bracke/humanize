separate (Humanize.Numbers.Ranges)
function Decimal_Range
  (Context : Humanize.Contexts.Context;
   Low     : Long_Float;
   High    : Long_Float;
   Options : Number_Options := Default_Number_Options)
   return Humanize.Status.Text_Result
is
begin
   if High < Low then
      return (Status => Humanize.Status.Invalid_Value, others => <>);
   end if;

   declare
      Localized : constant Humanize.Status.Text_Result :=
        CLDR_Range (Context, Decimal_Text (Low, Options) & "/" & Decimal_Text (High, Options));
   begin
      if Localized.Status = Humanize.Status.Ok and then Ada.Strings.Unbounded.Length (Localized.Text) > 0 then
         return Localized;
      end if;
   end;
   return Ok_Text
     (Decimal_Text (Low, Options) & " "
      & Number_Phrase (Context, Phrase_To) & " "
      & Decimal_Text (High, Options));
end Decimal_Range;
