with Humanize.Contexts;

--  Comments labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Comments.Localized is

   function Author_Action_Label
      (Context : Humanize.Contexts.Context;
       Author  : String;
       State   : Comment_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Author As for the parent's Author_Action_Label.
   --  @param State As for the parent's Author_Action_Label.
   --  @return The label in Context's locale.

   function Comment_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Comment_Count_Label.
   --  @return The label in Context's locale.

   function Comment_Label
      (Context : Humanize.Contexts.Context;
       Author  : String;
       State   : Comment_State := Published_Comment)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Author As for the parent's Comment_Label.
   --  @param State As for the parent's Comment_Label.
   --  @return The label in Context's locale.

   function Comment_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Comment_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Comment_State_Label.
   --  @return The label in Context's locale.

   function Deleted_Label
      (Context : Humanize.Contexts.Context;
       Author  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Author As for the parent's Deleted_Label.
   --  @return The label in Context's locale.

   function Edited_Label
      (Context   : Humanize.Contexts.Context;
       Time_Text : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Time_Text As for the parent's Edited_Label.
   --  @return The label in Context's locale.

   function Hide_Comment_Label
      (Context : Humanize.Contexts.Context;
       Reason  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Reason As for the parent's Hide_Comment_Label.
   --  @return The label in Context's locale.

   function Lock_Thread_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Lock_Thread_Label.
   --  @return The label in Context's locale.

   function Mention_Label
      (Context : Humanize.Contexts.Context;
       Actor   : String;
       Target  : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Actor As for the parent's Mention_Label.
   --  @param Target As for the parent's Mention_Label.
   --  @return The label in Context's locale.

   function Participant_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Participant_Count_Label.
   --  @return The label in Context's locale.

   function Pin_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Pin_Label.
   --  @return The label in Context's locale.

   function Reaction_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Reaction_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Reaction_Kind_Label.
   --  @return The label in Context's locale.

   function Reaction_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Reaction_Kind;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Reaction_Label.
   --  @param Count As for the parent's Reaction_Label.
   --  @return The label in Context's locale.

   function Reply_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Reply_Count_Label.
   --  @return The label in Context's locale.

   function Resolved_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Resolved_Label.
   --  @return The label in Context's locale.

   function Subscribe_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Subscribe_Label.
   --  @return The label in Context's locale.

   function Thread_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Thread_Count_Label.
   --  @return The label in Context's locale.

   function Thread_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Thread_State := Open_Thread;
       Count   : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Thread_Label.
   --  @param State As for the parent's Thread_Label.
   --  @param Count As for the parent's Thread_Label.
   --  @return The label in Context's locale.

   function Thread_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Thread_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Thread_State_Label.
   --  @return The label in Context's locale.

   function Unpin_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Unpin_Label.
   --  @return The label in Context's locale.

   function Unsubscribe_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Unsubscribe_Label.
   --  @return The label in Context's locale.

   procedure Author_Action_Label_Into
      (Context : Humanize.Contexts.Context;
       Author  : String;
       State   : Comment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Author As for the parent's Author_Action_Label.
   --  @param State As for the parent's Author_Action_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Comment_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Comment_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Comment_Label_Into
      (Context : Humanize.Contexts.Context;
       Author  : String;
       State   : Comment_State := Published_Comment;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Author As for the parent's Comment_Label.
   --  @param State As for the parent's Comment_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Comment_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Comment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Comment_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Deleted_Label_Into
      (Context : Humanize.Contexts.Context;
       Author  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Author As for the parent's Deleted_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Edited_Label_Into
      (Context   : Humanize.Contexts.Context;
       Time_Text : String := "";
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Time_Text As for the parent's Edited_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Hide_Comment_Label_Into
      (Context : Humanize.Contexts.Context;
       Reason  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Reason As for the parent's Hide_Comment_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Lock_Thread_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Lock_Thread_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Participant_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Participant_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Pin_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Pin_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Reaction_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Reaction_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Reaction_Kind_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Reaction_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Reaction_Kind;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Reaction_Label.
   --  @param Count As for the parent's Reaction_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Reply_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Reply_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Resolved_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Resolved_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Subscribe_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Subscribe_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Thread_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Thread_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Thread_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Thread_State := Open_Thread;
       Count   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Thread_Label.
   --  @param State As for the parent's Thread_Label.
   --  @param Count As for the parent's Thread_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Thread_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Thread_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Thread_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Unpin_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Unpin_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Unsubscribe_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Unsubscribe_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Comments.Localized;
