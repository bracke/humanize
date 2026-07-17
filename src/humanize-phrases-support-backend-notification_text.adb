separate (Humanize.Phrases.Support.Backend)
function Notification_Text
     (Locale : String;
      Status : Notification_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Notification_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Unread => return "ungelesen";
            when Read => return "gelesen";
            when Muted => return "stummgeschaltet";
            when Snoozed => return "zuruckgestellt";
            when Sent => return "gesendet";
            when Delivered => return "zugestellt";
         end case;
      else
         case Status is
            when Unread => return "unread";
            when Read => return "read";
            when Muted => return "muted";
            when Snoozed => return "snoozed";
            when Sent => return "sent";
            when Delivered => return "delivered";
         end case;
      end if;
end Notification_Text;
