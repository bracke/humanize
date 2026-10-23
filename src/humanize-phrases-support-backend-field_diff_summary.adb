separate (Humanize.Phrases.Support.Backend)
function Field_Diff_Summary
  (Context : Humanize.Contexts.Context;
   Field   : String;
   Before  : String;
   After   : String)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      return Ok_Text
        (Field & " changed from " & Before & " to " & After);
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.With_Arg (Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("field_diff"), "field", Field), "before", Before),
        "after", After),
      English);
end Field_Diff_Summary;
