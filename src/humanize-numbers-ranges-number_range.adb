separate (Humanize.Numbers.Ranges)
function Number_Range
  (Context : Humanize.Contexts.Context;
   Low     : Long_Long_Integer;
   High    : Long_Long_Integer;
   Options : Number_Range_Options := Default_Number_Range_Options)
   return Humanize.Status.Text_Result
is
   Sep : constant String :=
     (if Options.Spaces_Around
      then " " & Options.Separator & " "
      else [1 => Options.Separator]);
begin
   if High < Low then
      return (Status => Humanize.Status.Invalid_Value, others => <>);
   end if;
   if Options = Default_Number_Range_Options then
      declare
         Localized : constant Humanize.Status.Text_Result := CLDR_Range (Context, Plain (Low) & "/" & Plain (High));
      begin
         if Localized.Status = Humanize.Status.Ok and then Ada.Strings.Unbounded.Length (Localized.Text) > 0 then
            return Localized;
         end if;
      end;
   end if;
   return Ok_Text (Plain (Low) & Sep & Plain (High));
end Number_Range;
