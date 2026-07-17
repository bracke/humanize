separate (Humanize.Phrases.Support.Backend)
function Phrase_Text
     (Locale : String;
      Status : UI_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, UI_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Empty => return "leer";
            when Loading => return "wird geladen";
            when Saving => return "wird gespeichert";
            when Saved => return "gespeichert";
            when Unsaved => return "ungespeichert";
            when Retrying => return "erneuter Versuch";
            when Paused => return "pausiert";
            when Complete => return "abgeschlossen";
            when Failed => return "fehlgeschlagen";
            when Due_Soon => return "bald fallig";
            when Overdue => return "uberfallig";
            when Last_Seen => return "zuletzt gesehen";
            when Updated_Just_Now => return "gerade aktualisiert";
         end case;
      elsif Locale = "fr" then
         case Status is
            when Empty => return "vide";
            when Loading => return "chargement";
            when Saving => return "enregistrement";
            when Saved => return "enregistre";
            when Unsaved => return "non enregistre";
            when Retrying => return "nouvel essai";
            when Paused => return "en pause";
            when Complete => return "termine";
            when Failed => return "echec";
            when Due_Soon => return "bientot du";
            when Overdue => return "en retard";
            when Last_Seen => return "vu recemment";
            when Updated_Just_Now => return "mis a jour a l'instant";
         end case;
      else
         case Status is
            when Empty => return "empty";
            when Loading => return "loading";
            when Saving => return "saving";
            when Saved => return "saved";
            when Unsaved => return "unsaved";
            when Retrying => return "retrying";
            when Paused => return "paused";
            when Complete => return "complete";
            when Failed => return "failed";
            when Due_Soon => return "due soon";
            when Overdue => return "overdue";
            when Last_Seen => return "last seen";
            when Updated_Just_Now => return "updated just now";
         end case;
      end if;
end Phrase_Text;
