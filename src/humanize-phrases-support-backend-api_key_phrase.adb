separate (Humanize.Phrases.Support.Backend)
function API_Key_Phrase
  (Context : Humanize.Contexts.Context;
   Status  : API_Key_Status)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
   begin
      case Status is
         when API_Key_Active => return Ok_Text ("API key active");
         when API_Key_Revoked => return Ok_Text ("API key revoked");
         when API_Key_Expired => return Ok_Text ("API key expired");
         when API_Key_Rotated => return Ok_Text ("API key rotated");
      end case;
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.Phrase (Key_Text ("api_key", API_Key_Status'Image (Status))),
      English);
end API_Key_Phrase;
