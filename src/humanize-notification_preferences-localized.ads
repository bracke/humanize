with Humanize.Contexts;

--  Notification Preferences labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md,
--  "Domain labels"): each is the parent's function of the same name with a Context first, and that function itself
--  in English, where the locale has no translation, and for every input the parent rejects.
package Humanize.Notification_Preferences.Localized is

   function Alert_Level_Label
      (Context : Humanize.Contexts.Context;
       Level   : Alert_Level)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Level As for the parent's Alert_Level_Label.
   --  @return The label in Context's locale.

   function Channel_Preference_Label
      (Context : Humanize.Contexts.Context;
       Channel : String;
       State   : Preference_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Channel As for the parent's Channel_Preference_Label.
   --  @param State As for the parent's Channel_Preference_Label.
   --  @return The label in Context's locale.

   function Digest_Schedule_Label
      (Context  : Humanize.Contexts.Context;
       Schedule : Digest_Schedule)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Schedule As for the parent's Digest_Schedule_Label.
   --  @return The label in Context's locale.

   function Preference_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Preference_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Preference_State_Label.
   --  @return The label in Context's locale.

   function Quiet_Hours_Label
      (Context   : Humanize.Contexts.Context;
       Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Time_Text As for the parent's Quiet_Hours_Label.
   --  @return The label in Context's locale.

   function Subscription_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Scope   : Subscription_Scope;
       State   : Preference_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Subscription_Label.
   --  @param Scope As for the parent's Subscription_Label.
   --  @param State As for the parent's Subscription_Label.
   --  @return The label in Context's locale.

   function Subscription_Scope_Label
      (Context : Humanize.Contexts.Context;
       Scope   : Subscription_Scope)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Scope As for the parent's Subscription_Scope_Label.
   --  @return The label in Context's locale.

   procedure Alert_Level_Label_Into
      (Context : Humanize.Contexts.Context;
       Level   : Alert_Level;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Level As for the parent's Alert_Level_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Channel_Preference_Label_Into
      (Context : Humanize.Contexts.Context;
       Channel : String;
       State   : Preference_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Channel As for the parent's Channel_Preference_Label.
   --  @param State As for the parent's Channel_Preference_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Digest_Schedule_Label_Into
      (Context  : Humanize.Contexts.Context;
       Schedule : Digest_Schedule;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Schedule As for the parent's Digest_Schedule_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Preference_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Preference_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Preference_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Quiet_Hours_Label_Into
      (Context   : Humanize.Contexts.Context;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Time_Text As for the parent's Quiet_Hours_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Subscription_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Scope   : Subscription_Scope;
       State   : Preference_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Subscription_Label.
   --  @param Scope As for the parent's Subscription_Label.
   --  @param State As for the parent's Subscription_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Subscription_Scope_Label_Into
      (Context : Humanize.Contexts.Context;
       Scope   : Subscription_Scope;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Scope As for the parent's Subscription_Scope_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Notification_Preferences.Localized;
