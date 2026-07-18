separate (Humanize.Phrases.Support.Backend)
   function Auth_Text (Locale : String; Status : Auth_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Auth_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Signed_In => return "angemeldet";
            when Signed_Out => return "abgemeldet";
            when Session_Expired => return "Sitzung abgelaufen";
            when Locked => return "gesperrt";
            when Two_Factor_Required => return "Zwei-Faktor erforderlich";
         end case;
      else
         case Status is
            when Signed_In => return "signed in";
            when Signed_Out => return "signed out";
            when Session_Expired => return "session expired";
            when Locked => return "locked";
            when Two_Factor_Required => return "two-factor required";
         end case;
      end if;
   end Auth_Text;
