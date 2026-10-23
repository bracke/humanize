separate (Humanize.Numbers.Ranges)
function Approximate_Range
  (Context : Humanize.Contexts.Context;
   Low     : Long_Long_Integer;
   High    : Long_Long_Integer;
   Options : Number_Range_Options := Default_Number_Range_Options)
   return Humanize.Status.Text_Result
is
   Base : constant Humanize.Status.Text_Result :=
     Number_Range (Context, Low, High, Options);
begin
   if Base.Status /= Humanize.Status.Ok then
      return Base;
   end if;
   if Options = Default_Number_Range_Options then
      declare
         Localized : constant Humanize.Status.Text_Result :=
           CLDR_Range (Context, "~" & Plain (Low) & "/" & Plain (High));
      begin
         if Localized.Status = Humanize.Status.Ok and then Ada.Strings.Unbounded.Length (Localized.Text) > 0 then
            return Localized;
         end if;
      end;
   end if;
   return Ok_Text
     (Number_Phrase (Context, Phrase_About) & " " & Result_Text (Base));
end Approximate_Range;
