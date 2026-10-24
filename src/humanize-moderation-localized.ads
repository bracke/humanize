with Humanize.Contexts;

--  Moderation labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Moderation.Localized is

   function Appeal_Label
      (Context : Humanize.Contexts.Context;
       Item    : String;
       State   : Report_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Item As for the parent's Appeal_Label.
   --  @param State As for the parent's Appeal_Label.
   --  @return The label in Context's locale.

   function Moderation_Action_Label
      (Context : Humanize.Contexts.Context;
       Action  : Moderation_Action)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Action As for the parent's Moderation_Action_Label.
   --  @return The label in Context's locale.

   function Moderation_Label
      (Context : Humanize.Contexts.Context;
       Item    : String;
       Action  : Moderation_Action)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Item As for the parent's Moderation_Label.
   --  @param Action As for the parent's Moderation_Label.
   --  @return The label in Context's locale.

   function Moderation_Queue_Label
      (Context   : Humanize.Contexts.Context;
       Pending   : Natural;
       Escalated : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Pending As for the parent's Moderation_Queue_Label.
   --  @param Escalated As for the parent's Moderation_Queue_Label.
   --  @return The label in Context's locale.

   function Report_Label
      (Context : Humanize.Contexts.Context;
       Item    : String;
       State   : Report_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Item As for the parent's Report_Label.
   --  @param State As for the parent's Report_Label.
   --  @return The label in Context's locale.

   function Report_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Report_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Report_State_Label.
   --  @return The label in Context's locale.

   function Review_Label
      (Context : Humanize.Contexts.Context;
       Item    : String;
       State   : Review_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Item As for the parent's Review_Label.
   --  @param State As for the parent's Review_Label.
   --  @return The label in Context's locale.

   function Review_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Review_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Review_State_Label.
   --  @return The label in Context's locale.

   procedure Appeal_Label_Into
      (Context : Humanize.Contexts.Context;
       Item    : String;
       State   : Report_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Item As for the parent's Appeal_Label.
   --  @param State As for the parent's Appeal_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Moderation_Action_Label_Into
      (Context : Humanize.Contexts.Context;
       Action  : Moderation_Action;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Action As for the parent's Moderation_Action_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Moderation_Label_Into
      (Context : Humanize.Contexts.Context;
       Item    : String;
       Action  : Moderation_Action;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Item As for the parent's Moderation_Label.
   --  @param Action As for the parent's Moderation_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Moderation_Queue_Label_Into
      (Context   : Humanize.Contexts.Context;
       Pending   : Natural;
       Escalated : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Pending As for the parent's Moderation_Queue_Label.
   --  @param Escalated As for the parent's Moderation_Queue_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Report_Label_Into
      (Context : Humanize.Contexts.Context;
       Item    : String;
       State   : Report_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Item As for the parent's Report_Label.
   --  @param State As for the parent's Report_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Report_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Report_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Report_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Review_Label_Into
      (Context : Humanize.Contexts.Context;
       Item    : String;
       State   : Review_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Item As for the parent's Review_Label.
   --  @param State As for the parent's Review_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Review_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Review_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Review_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Moderation.Localized;
