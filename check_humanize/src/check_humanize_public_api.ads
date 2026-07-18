package Check_Humanize_Public_API is
   procedure Print_Public_API_Index (Root : String);
   procedure Print_Public_API_Classes (Root : String);
   procedure Print_Public_API_Coverage (Root : String);
   procedure Print_Public_API_Unit_Coverage (Root : String);

   procedure Check_Public_API_Docs
     (Root   : String;
      Errors : in out Natural);
end Check_Humanize_Public_API;
