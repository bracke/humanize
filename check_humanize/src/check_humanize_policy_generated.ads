package Check_Humanize_Policy_Generated is
   procedure Check_Generated_Artifacts
     (Root   : String;
      Errors : in out Natural);

   procedure Check_Source_Tree_Artifacts
     (Root   : String;
      Errors : in out Natural);

   procedure Check_Generated_Data_Manifest
     (Root   : String;
      Errors : in out Natural);

   procedure Check_Generated_Docs_Manifest
     (Root   : String;
      Errors : in out Natural);

   procedure Print_Generated_Data_Manifest (Root : String);
end Check_Humanize_Policy_Generated;
