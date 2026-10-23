separate (Humanize.Units.Support)
function Measure
  (Context : Humanize.Contexts.Context;
   Value   : Long_Float;
   Symbol  : String;
   Unit    : String;
   Options : Humanize.Numbers.Number_Options)
   return Humanize.Status.Text_Result
is
begin
   if not Is_English (Context) then
      declare
         Result : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render
             (Context,
              Humanize.Selections.Value_Suffix
                (Humanize.Message_Keys.Unit_Measure, Decimal_Text (Value, Options), Unit));
      begin
         if Result.Status = Humanize.Status.Ok and then Ada.Strings.Unbounded.Length (Result.Text) > 0 then
            return Result;
         end if;
      end;
   end if;
   return Compound (Value, Symbol, Options);
end Measure;
