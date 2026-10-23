separate (Humanize.Phrases.Support.Backend)
function Transfer_Text (Status : Transfer_Status) return String is
begin
   case Status is
      when Importing => return "importing";
      when Imported => return "imported";
      when Import_Failed => return "import failed";
      when Exporting => return "exporting";
      when Exported => return "exported";
      when Export_Failed => return "export failed";
   end case;
end Transfer_Text;
