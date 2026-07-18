separate (Humanize.Phrases.Support.Backend)
   function Search_Text (Locale : String; Status : Search_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Search_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Filtering => return "Filterung lauft";
            when Filtered => return "gefiltert";
            when No_Matches => return "keine Treffer";
            when Search_Ready => return "Suche bereit";
            when Search_Failed => return "Suche fehlgeschlagen";
            when Query_Too_Short => return "Suchanfrage zu kurz";
         end case;
      else
         case Status is
            when Filtering => return "filtering";
            when Filtered => return "filtered";
            when No_Matches => return "no matches";
            when Search_Ready => return "search ready";
            when Search_Failed => return "search failed";
            when Query_Too_Short => return "query too short";
         end case;
      end if;
   end Search_Text;
