separate (Humanize.Units.Support)
function Measured_Phrase
  (Context        : Humanize.Contexts.Context;
   Name           : String;
   Value          : Long_Float;
   English_Suffix : String;
   Unit           : String;
   Options        : Humanize.Numbers.Number_Options)
   return Humanize.Status.Text_Result
is
   English : constant Humanize.Status.Text_Result := Compound (Value, English_Suffix, Options);
begin
   if Is_English (Context) then
      return English;
   end if;
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Humanize.Selections.With_Arg
        (Humanize.Selections.Phrase (Name), "measure",
         Ada.Strings.Unbounded.To_String (Measure (Context, Value, English_Suffix, Unit, Options).Text)),
      English);
end Measured_Phrase;
