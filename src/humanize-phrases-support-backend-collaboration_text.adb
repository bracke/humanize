separate (Humanize.Phrases.Support.Backend)
function Collaboration_Text
     (Locale : String;
      Status : Collaboration_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Collaboration_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Active_Now => return "jetzt aktiv";
            when Away => return "abwesend";
            when Do_Not_Disturb => return "nicht storen";
            when Typing => return "tippt";
            when Viewing => return "sieht an";
            when Editing => return "bearbeitet";
         end case;
      else
         case Status is
            when Active_Now => return "active now";
            when Away => return "away";
            when Do_Not_Disturb => return "do not disturb";
            when Typing => return "typing";
            when Viewing => return "viewing";
            when Editing => return "editing";
         end case;
      end if;
end Collaboration_Text;
