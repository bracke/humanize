with Humanize.Contexts;

--  Accounts labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Accounts.Localized is

   function Account_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Account_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Account_Label.
   --  @param State As for the parent's Account_Label.
   --  @return The label in Context's locale.

   function Account_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Account_State;
       Options : Account_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Account_Label.
   --  @param State As for the parent's Account_Label.
   --  @param Options As for the parent's Account_Label.
   --  @return The label in Context's locale.

   function Account_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Account_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Account_State_Label.
   --  @return The label in Context's locale.

   function Device_Trust_Label
      (Context : Humanize.Contexts.Context;
       State   : Device_Trust_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Device_Trust_Label.
   --  @return The label in Context's locale.

   function Last_Active_Label
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Last_Active_Label.
   --  @param Time_Text As for the parent's Last_Active_Label.
   --  @return The label in Context's locale.

   function Login_Attempt_Label
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Succeeded : Boolean)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Login_Attempt_Label.
   --  @param Succeeded As for the parent's Login_Attempt_Label.
   --  @return The label in Context's locale.

   function MFA_State_Label
      (Context : Humanize.Contexts.Context;
       State   : MFA_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's MFA_State_Label.
   --  @return The label in Context's locale.

   function Session_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Session_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Session_Label.
   --  @param State As for the parent's Session_Label.
   --  @return The label in Context's locale.

   function Session_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Session_State;
       Options : Account_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Session_Label.
   --  @param State As for the parent's Session_Label.
   --  @param Options As for the parent's Session_Label.
   --  @return The label in Context's locale.

   function Session_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Session_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Session_State_Label.
   --  @return The label in Context's locale.

   procedure Account_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Account_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Account_Label.
   --  @param State As for the parent's Account_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Account_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Account_State;
       Options : Account_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Account_Label.
   --  @param State As for the parent's Account_Label.
   --  @param Options As for the parent's Account_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Account_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Account_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Account_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Device_Trust_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Device_Trust_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Device_Trust_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Last_Active_Label_Into
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Last_Active_Label.
   --  @param Time_Text As for the parent's Last_Active_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Login_Attempt_Label_Into
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Succeeded : Boolean;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Login_Attempt_Label.
   --  @param Succeeded As for the parent's Login_Attempt_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure MFA_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : MFA_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's MFA_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Session_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Session_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Session_Label.
   --  @param State As for the parent's Session_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Session_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Session_State;
       Options : Account_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Session_Label.
   --  @param State As for the parent's Session_Label.
   --  @param Options As for the parent's Session_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Session_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Session_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Session_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Accounts.Localized;
