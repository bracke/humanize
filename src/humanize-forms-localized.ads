with Humanize.Contexts;

--  Forms labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"): each
--  is the parent's function of the same name with a Context first, and that function itself in English, where the
--  locale has no translation, and for every input the parent rejects.
package Humanize.Forms.Localized is

   function Character_Count_Label
      (Context : Humanize.Contexts.Context;
       Used    : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Used As for the parent's Character_Count_Label.
   --  @return The label in Context's locale.

   function Character_Limit_Label
      (Context : Humanize.Contexts.Context;
       Limit   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Limit As for the parent's Character_Limit_Label.
   --  @return The label in Context's locale.

   function Character_Usage_Label
      (Context : Humanize.Contexts.Context;
       Used    : Natural;
       Limit   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Used As for the parent's Character_Usage_Label.
   --  @param Limit As for the parent's Character_Usage_Label.
   --  @return The label in Context's locale.

   function Field_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Required : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Field_Label.
   --  @param Required As for the parent's Field_Label.
   --  @return The label in Context's locale.

   function Field_State_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Input_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Field_State_Label.
   --  @param State As for the parent's Field_State_Label.
   --  @return The label in Context's locale.

   function Form_Error_Summary_Label
      (Context  : Humanize.Contexts.Context;
       Errors   : Natural := 0;
       Warnings : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Errors As for the parent's Form_Error_Summary_Label.
   --  @param Warnings As for the parent's Form_Error_Summary_Label.
   --  @return The label in Context's locale.

   function Form_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Form_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Form_State_Label.
   --  @return The label in Context's locale.

   function Input_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Input_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Input_State_Label.
   --  @return The label in Context's locale.

   function Submission_Label
      (Context : Humanize.Contexts.Context;
       State   : Form_State;
       Errors  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Submission_Label.
   --  @param Errors As for the parent's Submission_Label.
   --  @return The label in Context's locale.

   function Unsaved_Changes_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Unsaved_Changes_Label.
   --  @return The label in Context's locale.

   procedure Character_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Used    : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Used As for the parent's Character_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Character_Limit_Label_Into
      (Context : Humanize.Contexts.Context;
       Limit   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Limit As for the parent's Character_Limit_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Character_Usage_Label_Into
      (Context : Humanize.Contexts.Context;
       Used    : Natural;
       Limit   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Used As for the parent's Character_Usage_Label.
   --  @param Limit As for the parent's Character_Usage_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Field_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Required : Boolean := False;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Field_Label.
   --  @param Required As for the parent's Field_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Field_State_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Input_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Field_State_Label.
   --  @param State As for the parent's Field_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Form_Error_Summary_Label_Into
      (Context  : Humanize.Contexts.Context;
       Errors   : Natural := 0;
       Warnings : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Errors As for the parent's Form_Error_Summary_Label.
   --  @param Warnings As for the parent's Form_Error_Summary_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Form_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Form_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Form_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Input_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Input_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Input_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Submission_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Form_State;
       Errors  : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Submission_Label.
   --  @param Errors As for the parent's Submission_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Unsaved_Changes_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Unsaved_Changes_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Forms.Localized;
