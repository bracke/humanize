separate (Humanize.Phrases.Support.Backend)
   function Issue_Text (Locale : String; Status : Issue_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Issue_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Open => return "offen";
            when Closed => return "geschlossen";
            when Reopened => return "wieder geoffnet";
            when Assigned => return "zugewiesen";
            when Unassigned => return "nicht zugewiesen";
            when Merged => return "zusammengefuhrt";
         end case;
      else
         case Status is
            when Open => return "open";
            when Closed => return "closed";
            when Reopened => return "reopened";
            when Assigned => return "assigned";
            when Unassigned => return "unassigned";
            when Merged => return "merged";
         end case;
      end if;
   end Issue_Text;
