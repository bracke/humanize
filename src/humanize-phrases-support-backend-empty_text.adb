separate (Humanize.Phrases.Support.Backend)
   function Empty_Text (Locale : String; State : Empty_State) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Empty_State'Image (State));
      elsif Locale = "de" then
         case State is
            when No_Items => return "keine Elemente";
            when No_Results => return "keine Ergebnisse";
            when No_Messages => return "keine Nachrichten";
            when No_Selection => return "keine Auswahl";
            when Nothing_To_Show => return "nichts anzuzeigen";
         end case;
      else
         case State is
            when No_Items => return "no items";
            when No_Results => return "no results";
            when No_Messages => return "no messages";
            when No_Selection => return "no selection";
            when Nothing_To_Show => return "nothing to show";
         end case;
      end if;
   end Empty_Text;
