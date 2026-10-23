separate (Humanize.Phrases.Support.Backend)
function Notification_Text (Status : Notification_Status) return String is
begin
   case Status is
      when Unread => return "unread";
      when Read => return "read";
      when Muted => return "muted";
      when Snoozed => return "snoozed";
      when Sent => return "sent";
      when Delivered => return "delivered";
   end case;
end Notification_Text;
