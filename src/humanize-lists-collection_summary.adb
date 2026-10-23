separate (Humanize.Lists)
function Collection_Summary
  (Context   : Humanize.Contexts.Context;
   Visible   : Natural;
   Total     : Natural;
   Singular  : String := "item";
   Plural    : String := "items";
   Options   : Collection_Summary_Options :=
     Default_Collection_Summary_Options)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
      Hidden : Natural := 0;
      Visible_Text : constant String := Natural_Text (Visible);
      Total_Text : constant String := Natural_Text (Total);
   begin
      if Visible > Total then
         return Invalid_Text ("invalid collection summary");
      elsif Total = 0 then
         return Ok_Text ("no " & Noun_For (0, Singular, Plural));
      elsif Visible = 0 then
         return Ok_Text ("no " & Noun_For (Total, Singular, Plural) & " shown");
      end if;

      Hidden := Total - Visible;
      declare
         Hidden_Text : constant String := Natural_Text (Hidden);
      begin
         case Options.Style is
            when Collection_Compact_Summary =>
               if Options.Include_Total then
                  return Ok_Text (Visible_Text & "/" & Total_Text);
               elsif Options.Include_Hidden and then Hidden > 0 then
                  return Ok_Text (Visible_Text & " +" & Hidden_Text);
               else
                  return Ok_Text (Visible_Text);
               end if;

            when Collection_Detailed_Summary =>
               if Options.Include_Total and then Options.Include_Hidden
                 and then Hidden > 0
               then
                  return Ok_Text ("showing " & Visible_Text & " of " & Total_Text & " "
                     & Noun_For (Total, Singular, Plural) & ", "
                     & Hidden_Text & " hidden");
               elsif Options.Include_Total then
                  return Ok_Text ("showing " & Visible_Text & " of " & Total_Text & " "
                     & Noun_For (Total, Singular, Plural));
               elsif Options.Include_Hidden and then Hidden > 0 then
                  return Ok_Text (Visible_Text & " " & Noun_For (Visible, Singular, Plural)
                     & " shown, " & Hidden_Text & " hidden");
               else
                  return Ok_Text (Visible_Text & " " & Noun_For (Visible, Singular, Plural)
                     & " shown");
               end if;

            when Collection_Accessible_Summary =>
               return Ok_Text (Visible_Text & " " & Noun_For (Visible, Singular, Plural)
                  & " visible out of " & Total_Text & " "
                  & Noun_For (Total, Singular, Plural));
         end case;
      end;
   end English;
begin
   if Visible > Total
     or else (Total > 0 and then Visible > 0 and then Options.Style = Collection_Compact_Summary)
   then
      return English;
   end if;
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      With_Nouns (Context, Num (Num (Num (Sel.Phrase (if Total = 0 then "collection.empty" elsif Visible = 0
        then "collection.none_shown" elsif Options.Style = Collection_Accessible_Summary
          then "collection.visible_out_of" elsif Options.Include_Total and then Options.Include_Hidden and
            then Total > Visible then "collection.showing_hidden" elsif Options.Include_Total
              then "collection.showing" elsif Options.Include_Hidden and then Total > Visible
                then "collection.shown_hidden" else "collection.shown"), "visible", Visible), "total", Total),
                  "hidden", Total - Visible), Singular, Plural),
      English);
end Collection_Summary;
