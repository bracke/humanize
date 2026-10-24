with Humanize.Contexts;

--  Permissions labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain
--  labels"): each is the parent's function of the same name with a Context first, and that function itself in
--  English, where the locale has no translation, and for every input the parent rejects.
package Humanize.Permissions.Localized is

   function Access_Expiry_Label
      (Context   : Humanize.Contexts.Context;
       Subject   : String;
       Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Access_Expiry_Label.
   --  @param Time_Text As for the parent's Access_Expiry_Label.
   --  @return The label in Context's locale.

   function Grant_Label
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Role    : Role_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Grant_Label.
   --  @param Role As for the parent's Grant_Label.
   --  @return The label in Context's locale.

   function Permission_Label
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Action  : String;
       State   : Permission_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Permission_Label.
   --  @param Action As for the parent's Permission_Label.
   --  @param State As for the parent's Permission_Label.
   --  @return The label in Context's locale.

   function Permission_Label
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Action  : String;
       State   : Permission_State;
       Options : Permission_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Permission_Label.
   --  @param Action As for the parent's Permission_Label.
   --  @param State As for the parent's Permission_Label.
   --  @param Options As for the parent's Permission_Label.
   --  @return The label in Context's locale.

   function Permission_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Permission_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Permission_State_Label.
   --  @return The label in Context's locale.

   function Policy_Result_Label
      (Context : Humanize.Contexts.Context;
       Result  : Policy_Result)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Result As for the parent's Policy_Result_Label.
   --  @return The label in Context's locale.

   function Revoke_Label
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Role    : Role_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Revoke_Label.
   --  @param Role As for the parent's Revoke_Label.
   --  @return The label in Context's locale.

   function Role_Label
      (Context : Humanize.Contexts.Context;
       Role    : Role_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Role As for the parent's Role_Label.
   --  @return The label in Context's locale.

   procedure Access_Expiry_Label_Into
      (Context   : Humanize.Contexts.Context;
       Subject   : String;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Access_Expiry_Label.
   --  @param Time_Text As for the parent's Access_Expiry_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Grant_Label_Into
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Role    : Role_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Grant_Label.
   --  @param Role As for the parent's Grant_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Permission_Label_Into
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Action  : String;
       State   : Permission_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Permission_Label.
   --  @param Action As for the parent's Permission_Label.
   --  @param State As for the parent's Permission_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Permission_Label_Into
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Action  : String;
       State   : Permission_State;
       Options : Permission_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Permission_Label.
   --  @param Action As for the parent's Permission_Label.
   --  @param State As for the parent's Permission_Label.
   --  @param Options As for the parent's Permission_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Permission_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Permission_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Permission_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Policy_Result_Label_Into
      (Context : Humanize.Contexts.Context;
       Result  : Policy_Result;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Result As for the parent's Policy_Result_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Revoke_Label_Into
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Role    : Role_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Revoke_Label.
   --  @param Role As for the parent's Revoke_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Role_Label_Into
      (Context : Humanize.Contexts.Context;
       Role    : Role_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Role As for the parent's Role_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Permissions.Localized;
