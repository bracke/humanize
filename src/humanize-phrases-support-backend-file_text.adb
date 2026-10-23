separate (Humanize.Phrases.Support.Backend)
function File_Text (Status : File_Status) return String is
begin
   case Status is
      when Uploading => return "uploading";
      when Downloading => return "downloading";
      when Copying => return "copying";
      when Moving => return "moving";
      when Deleting => return "deleting";
      when Deleted => return "deleted";
      when Restoring => return "restoring";
      when Synced => return "synced";
   end case;
end File_Text;
