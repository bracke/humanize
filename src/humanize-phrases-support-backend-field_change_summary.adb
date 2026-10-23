separate (Humanize.Phrases.Support.Backend)
function Field_Change_Summary
  (Context  : Humanize.Contexts.Context;
   Changed  : Natural;
   Added    : Natural;
   Removed  : Natural;
   Singular : String := "field";
   Plural   : String := "fields")
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
      Total : constant Natural := Changed + Added + Removed;
   begin
      return Ok_Text
        (Natural_Text (Total) & " "
         & (if Total = 1 then Singular else Plural) & ": "
         & Natural_Text (Changed) & " changed, "
         & Natural_Text (Added) & " added, "
         & Natural_Text (Removed) & " removed");
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Humanize.I18N_Rendering.With_Nouns
        (Context,
         Num (Num (Num (Num (Sel.Phrase ("field_change_summary"), "total", Changed + Added + Removed),
                        "changed", Changed),
                   "added", Added),
              "removed", Removed),
         Singular, Plural),
      English);
end Field_Change_Summary;
