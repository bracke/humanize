separate (Humanize.Phrases.Support.Backend)
function Ticket_Text
     (Locale : String;
      Status : Ticket_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Ticket_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Ticket_New => return "Ticket neu";
            when Ticket_Open => return "Ticket offen";
            when Ticket_Waiting => return "Ticket wartet";
            when Ticket_Escalated => return "Ticket eskaliert";
            when Ticket_Resolved => return "Ticket gelost";
            when Ticket_Closed => return "Ticket geschlossen";
         end case;
      else
         case Status is
            when Ticket_New => return "ticket new";
            when Ticket_Open => return "ticket open";
            when Ticket_Waiting => return "ticket waiting";
            when Ticket_Escalated => return "ticket escalated";
            when Ticket_Resolved => return "ticket resolved";
            when Ticket_Closed => return "ticket closed";
         end case;
      end if;
end Ticket_Text;
