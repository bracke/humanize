with Ada.Strings.Unbounded;
with Humanize.Messages;

package Humanize.Status is

   --  Public Humanize status set. I18N result statuses are mapped to these
   --  values only inside Humanize.I18N_Rendering.
   type Status_Code is
     (Ok,
      Invalid_Value,
      Invalid_Options,
      Missing_Message,
      Missing_Argument,
      Invalid_Argument,
      Render_Error,
      Runtime_Error,
      Buffer_Overflow,
      Internal_Error);

   --  Convenience result returned by the public formatters.
   type Text_Result is record
      Status : Status_Code := Internal_Error;
      Text   : Ada.Strings.Unbounded.Unbounded_String;
      Key    : Humanize.Messages.Message_Id := Humanize.Messages.No_Message;
   end record;

   function Is_Ok
     (Item : Text_Result)
      return Boolean
   is (Item.Status = Ok);

   --  Stable textual name for a status code.
   function Status_Image
     (Status : Status_Code)
      return String;

end Humanize.Status;
