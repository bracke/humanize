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
   Measured : constant Humanize.Status.Text_Result :=
     Humanize.I18N_Rendering.Render
       (Context,
        Humanize.Selections.Value_Suffix (Humanize.Message_Keys.Unit_Measure, Decimal_Text (Value, Options), Unit));
begin
   if Is_English (Context)
     or else Measured.Status /= Humanize.Status.Ok
     or else Ada.Strings.Unbounded.Length (Measured.Text) = 0
   then
      return English;
   end if;
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Humanize.Selections.With_Arg
        (Humanize.Selections.Phrase (Name), "measure", Ada.Strings.Unbounded.To_String (Measured.Text)),
      English);
end Measured_Phrase;
