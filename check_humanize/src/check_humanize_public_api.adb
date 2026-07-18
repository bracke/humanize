with Check_Humanize_Public_API_Generated;

package body Check_Humanize_Public_API is
   procedure Print_Public_API_Index (Root : String) is
   begin
      Check_Humanize_Public_API_Generated.Print_Public_API_Index (Root);
   end Print_Public_API_Index;

   procedure Print_Public_API_Classes (Root : String) is
   begin
      Check_Humanize_Public_API_Generated.Print_Public_API_Classes (Root);
   end Print_Public_API_Classes;

   procedure Print_Public_API_Coverage (Root : String) is
   begin
      Check_Humanize_Public_API_Generated.Print_Public_API_Coverage (Root);
   end Print_Public_API_Coverage;

   procedure Print_Public_API_Unit_Coverage (Root : String) is
   begin
      Check_Humanize_Public_API_Generated.Print_Public_API_Unit_Coverage (Root);
   end Print_Public_API_Unit_Coverage;

   procedure Check_Public_API_Docs
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Check_Humanize_Public_API_Generated.Check_Public_API_Docs (Root, Errors);
   end Check_Public_API_Docs;
end Check_Humanize_Public_API;
