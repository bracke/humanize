package body Humanize.Status is

   function Status_Image
     (Status : Status_Code)
      return String
   is
   begin
      case Status is
         when Ok =>
            return "Ok";
         when Invalid_Value =>
            return "Invalid_Value";
         when Invalid_Options =>
            return "Invalid_Options";
         when Missing_Message =>
            return "Missing_Message";
         when Missing_Argument =>
            return "Missing_Argument";
         when Invalid_Argument =>
            return "Invalid_Argument";
         when Render_Error =>
            return "Render_Error";
         when Runtime_Error =>
            return "Runtime_Error";
         when Buffer_Overflow =>
            return "Buffer_Overflow";
         when Internal_Error =>
            return "Internal_Error";
      end case;
   end Status_Image;

end Humanize.Status;
