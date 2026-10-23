separate (Humanize.Phrases.Support.Backend)
function Empty_Text (State : Empty_State) return String is
begin
   case State is
      when No_Items => return "no items";
      when No_Results => return "no results";
      when No_Messages => return "no messages";
      when No_Selection => return "no selection";
      when Nothing_To_Show => return "nothing to show";
   end case;
end Empty_Text;
