separate (Humanize.Units.Support)
function Format_IOPS
  (Context : Humanize.Contexts.Context;
   IOPS    : Long_Float;
   Options : Humanize.Numbers.Number_Options :=
     Humanize.Numbers.Default_Number_Options)
   return Humanize.Status.Text_Result
is
   pragma Unreferenced (Context);
begin
   if abs IOPS >= 1_000_000.0 then
      return Compound (IOPS / 1_000_000.0, "M IOPS", Options);
   elsif abs IOPS >= 1_000.0 then
      return Compound (IOPS / 1_000.0, "k IOPS", Options);
   else
      return Compound (IOPS, "IOPS", Options);
   end if;
end Format_IOPS;
