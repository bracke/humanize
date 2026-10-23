separate (Humanize.Phrases.Support.Backend)
function Ticket_Text (Status : Ticket_Status) return String is
begin
   case Status is
      when Ticket_New => return "ticket new";
      when Ticket_Open => return "ticket open";
      when Ticket_Waiting => return "ticket waiting";
      when Ticket_Escalated => return "ticket escalated";
      when Ticket_Resolved => return "ticket resolved";
      when Ticket_Closed => return "ticket closed";
   end case;
end Ticket_Text;
