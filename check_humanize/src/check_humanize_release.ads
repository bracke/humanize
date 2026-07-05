package Check_Humanize_Release is
   procedure Run_Release_Builds
     (Root   : String;
      Errors : in out Natural);

   procedure Check_Staged_Release_Tree
     (Root       : String;
      Stage_Root : String;
      Errors     : in out Natural);
end Check_Humanize_Release;
