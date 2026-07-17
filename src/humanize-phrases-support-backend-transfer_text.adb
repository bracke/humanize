separate (Humanize.Phrases.Support.Backend)
function Transfer_Text
     (Locale : String;
      Status : Transfer_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Transfer_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Importing => return "Import lauft";
            when Imported => return "importiert";
            when Import_Failed => return "Import fehlgeschlagen";
            when Exporting => return "Export lauft";
            when Exported => return "exportiert";
            when Export_Failed => return "Export fehlgeschlagen";
         end case;
      else
         case Status is
            when Importing => return "importing";
            when Imported => return "imported";
            when Import_Failed => return "import failed";
            when Exporting => return "exporting";
            when Exported => return "exported";
            when Export_Failed => return "export failed";
         end case;
      end if;
end Transfer_Text;
