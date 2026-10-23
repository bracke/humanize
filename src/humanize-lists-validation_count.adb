separate (Humanize.Lists)
function Validation_Count
  (Context : Humanize.Contexts.Context;
   Count   : Natural;
   Options : Validation_Summary_Options :=
     Default_Validation_Summary_Options)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
      Noun : constant String := Severity_Noun (Options.Severity, Count);
   begin
      if Count = 0 and then not Options.Include_Ok then
         return Ok_Text ("");
      elsif Count = 0 then
         return Ok_Text ("no " & Noun);
      else
         return Ok_Text (Natural_Text (Count) & " " & Noun);
      end if;
   end English;
begin
   if Count = 0 and then not Options.Include_Ok then
      return English;
   end if;
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.With_Arg (Num (Sel.Phrase ("validation_count"), "count", Count), "severity",
        (case Options.Severity is when Validation_Error => "error", when Validation_Warning => "warning",
          when Validation_Info => "info")),
      English);
end Validation_Count;
