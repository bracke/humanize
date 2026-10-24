with Humanize.Contexts;

--  Secrets labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Secrets.Localized is

   function Credential_Source_Label
      (Context : Humanize.Contexts.Context;
       Source  : String;
       Count   : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Source As for the parent's Credential_Source_Label.
   --  @param Count As for the parent's Credential_Source_Label.
   --  @return The label in Context's locale.

   function Exposure_Label
      (Context  : Humanize.Contexts.Context;
       Exposure : Secret_Exposure)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Exposure As for the parent's Exposure_Label.
   --  @return The label in Context's locale.

   function Privacy_Profile_Label
      (Context : Humanize.Contexts.Context;
       Profile : Privacy_Profile)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Profile As for the parent's Privacy_Profile_Label.
   --  @return The label in Context's locale.

   function Rotation_Status_Label
      (Context        : Humanize.Contexts.Context;
       Needs_Rotation : Boolean;
       Days_Old       : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Needs_Rotation As for the parent's Rotation_Status_Label.
   --  @param Days_Old As for the parent's Rotation_Status_Label.
   --  @return The label in Context's locale.

   function Secret_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Secret_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Secret_Kind_Label.
   --  @return The label in Context's locale.

   function Sensitive_Value_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Sensitive_Value_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Sensitive_Value_Kind_Label.
   --  @return The label in Context's locale.

   procedure Credential_Source_Label_Into
      (Context : Humanize.Contexts.Context;
       Source  : String;
       Count   : Natural := 1;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Source As for the parent's Credential_Source_Label.
   --  @param Count As for the parent's Credential_Source_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Exposure_Label_Into
      (Context  : Humanize.Contexts.Context;
       Exposure : Secret_Exposure;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Exposure As for the parent's Exposure_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Privacy_Profile_Label_Into
      (Context : Humanize.Contexts.Context;
       Profile : Privacy_Profile;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Profile As for the parent's Privacy_Profile_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Rotation_Status_Label_Into
      (Context        : Humanize.Contexts.Context;
       Needs_Rotation : Boolean;
       Days_Old       : Natural := 0;
       Target         : in out String;
       Written        : out Natural;
       Status         : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Needs_Rotation As for the parent's Rotation_Status_Label.
   --  @param Days_Old As for the parent's Rotation_Status_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Secret_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Secret_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Secret_Kind_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sensitive_Value_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Sensitive_Value_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Sensitive_Value_Kind_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Secrets.Localized;
