package Check_Humanize_Policy_Requirements is
   procedure Check_Required_Files
     (Root   : String;
      Errors : in out Natural);

   procedure Check_Required_Text
     (Root   : String;
      Errors : in out Natural);
end Check_Humanize_Policy_Requirements;
