separate (Humanize.Phrases.Support.Backend)
function Incident_Phrase
  (Context : Humanize.Contexts.Context;
   Status  : Incident_Status)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      case Status is
         when Incident_Investigating =>
            return Ok_Text ("investigating incident");
         when Incident_Identified =>
            return Ok_Text ("incident identified");
         when Incident_Mitigated =>
            return Ok_Text ("incident mitigated");
         when Incident_Resolved =>
            return Ok_Text ("incident resolved");
      end case;
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.Phrase (Key_Text ("incident", Incident_Status'Image (Status))),
      English);
end Incident_Phrase;
