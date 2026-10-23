separate (Humanize.Phrases.Support.Backend)
function Collaboration_Text (Status : Collaboration_Status) return String is
begin
   case Status is
      when Active_Now => return "active now";
      when Away => return "away";
      when Do_Not_Disturb => return "do not disturb";
      when Typing => return "typing";
      when Viewing => return "viewing";
      when Editing => return "editing";
   end case;
end Collaboration_Text;
