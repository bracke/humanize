separate (Humanize.Phrases.Support.Backend)
function Field_Removed_Summary
  (Context : Humanize.Contexts.Context;
   Field   : String;
   Value   : String)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Field & " removed (was " & Value & ")");
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("field_removed"), "field", Field), "value", Value),
      English);
end Field_Removed_Summary;
