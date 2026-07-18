separate (Humanize.Phrases.Support.Backend)
   function Access_Text (Locale : String; Status : Access_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Access_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Allowed => return "erlaubt";
            when Denied => return "verweigert";
            when Owner => return "Besitzer";
            when Admin => return "Administrator";
            when Viewer => return "Betrachter";
            when Editor => return "Bearbeiter";
         end case;
      else
         case Status is
            when Allowed => return "allowed";
            when Denied => return "denied";
            when Owner => return "owner";
            when Admin => return "admin";
            when Viewer => return "viewer";
            when Editor => return "editor";
         end case;
      end if;
   end Access_Text;
