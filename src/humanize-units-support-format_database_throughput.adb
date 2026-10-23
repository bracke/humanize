separate (Humanize.Units.Support)
function Format_Database_Throughput
  (Context               : Humanize.Contexts.Context;
   Operations_Per_Second : Long_Float;
   Options               : Humanize.Numbers.Number_Options :=
     Humanize.Numbers.Default_Number_Options)
   return Humanize.Status.Text_Result
is
   pragma Unreferenced (Context);
begin
   if abs Operations_Per_Second >= 1_000_000.0 then
      return Compound
        (Operations_Per_Second / 1_000_000.0, "M ops/s", Options);
   elsif abs Operations_Per_Second >= 1_000.0 then
      return Compound
        (Operations_Per_Second / 1_000.0, "k ops/s", Options);
   else
      return Compound (Operations_Per_Second, "ops/s", Options);
   end if;
end Format_Database_Throughput;
