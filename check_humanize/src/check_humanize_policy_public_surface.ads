package Check_Humanize_Policy_Public_Surface is
   procedure Check_Public_Spec_Purpose_Comments
     (Root   : String;
      Errors : in out Natural);

   procedure Check_Public_API_Unit_Coverage_Gaps
     (Root   : String;
      Errors : in out Natural);
end Check_Humanize_Policy_Public_Surface;
