separate (Humanize.Phrases.Support.Backend)
function Field_Unchanged_Summary
  (Context : Humanize.Contexts.Context;
   Field   : String;
   Value   : String)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Field & " unchanged at " & Value);
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("field_unchanged"), "field", Field), "value", Value),
      English);
end Field_Unchanged_Summary;
