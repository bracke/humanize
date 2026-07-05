package Check_Humanize_Policy is
   procedure Check_Manifest
     (Root   : String;
      Errors : in out Natural);

   procedure Check_Required_Files
     (Root   : String;
      Errors : in out Natural);

   procedure Check_Required_Text
     (Root   : String;
      Errors : in out Natural);

   procedure Check_AUnit_Metrics
     (Root   : String;
      Errors : in out Natural);

   procedure Check_Generated_Artifacts
     (Root   : String;
      Errors : in out Natural);

   procedure Check_Tooling_Boundary
     (Root   : String;
      Errors : in out Natural);

   procedure Check_Public_Documentation
     (Root   : String;
      Errors : in out Natural);

   procedure Check_Examples_Inventory
     (Root   : String;
      Errors : in out Natural);

   procedure Check_Compiler_Stderr
     (Root   : String;
      Errors : in out Natural);
end Check_Humanize_Policy;
