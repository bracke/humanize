separate (Humanize.Phrases.Support.Backend)
function Feature_Flag_Phrase
  (Context : Humanize.Contexts.Context;
   Status  : Feature_Flag_Status)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      case Status is
         when Flag_Enabled => return Ok_Text ("feature flag enabled");
         when Flag_Disabled => return Ok_Text ("feature flag disabled");
         when Flag_Rolling_Out => return Ok_Text ("feature flag rolling out");
         when Flag_Rolled_Back => return Ok_Text ("feature flag rolled back");
      end case;
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.Phrase (Key_Text ("feature_flag", Feature_Flag_Status'Image (Status))),
      English);
end Feature_Flag_Phrase;
