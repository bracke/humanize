separate (Humanize.Units.Support)
function SI_Symbol
  (Context      : Humanize.Contexts.Context;
   Value        : Long_Float;
   Symbol       : String;
   Local_Symbol : String;
   Options      : Humanize.Numbers.Number_Options)
   return Humanize.Status.Text_Result
is
begin
   if not Is_English (Context) then
      declare
         Result : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render
             (Context,
              Humanize.Selections.Value_Suffix
                (Humanize.Message_Keys.Unit_Symbol, Decimal_Text (Value, Options), Local_Symbol));
      begin
         if Result.Status = Humanize.Status.Ok then
            return Result;
         end if;
      end;
   end if;
   return Compound (Value, Symbol, Options);
end SI_Symbol;
