separate (Humanize.Phrases.Support.Backend)
function Field_Added_Summary
  (Context : Humanize.Contexts.Context;
   Field   : String;
   Value   : String)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Field & " added as " & Value);
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("field_added"), "field", Field), "value", Value),
      English);
end Field_Added_Summary;
