with Humanize.Contexts;

--  Notifications labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain
--  labels"): each is the parent's function of the same name with a Context first, and that function itself in
--  English, where the locale has no translation, and for every input the parent rejects.
package Humanize.Notifications.Localized is

   function Actor_Event_Label
      (Context : Humanize.Contexts.Context;
       Actor   : String;
       Event   : Notification_Event)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Actor As for the parent's Actor_Event_Label.
   --  @param Event As for the parent's Actor_Event_Label.
   --  @return The label in Context's locale.

   function Delivery_Attempt_Label
      (Context      : Humanize.Contexts.Context;
       Attempt      : Positive;
       Max_Attempts : Positive)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Attempt As for the parent's Delivery_Attempt_Label.
   --  @param Max_Attempts As for the parent's Delivery_Attempt_Label.
   --  @return The label in Context's locale.

   function Delivery_Label
      (Context : Humanize.Contexts.Context;
       Channel : Notification_Channel;
       State   : Delivery_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Channel As for the parent's Delivery_Label.
   --  @param State As for the parent's Delivery_Label.
   --  @return The label in Context's locale.

   function Delivery_Label
      (Context : Humanize.Contexts.Context;
       Channel : Notification_Channel;
       State   : Delivery_State;
       Options : Notification_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Channel As for the parent's Delivery_Label.
   --  @param State As for the parent's Delivery_Label.
   --  @param Options As for the parent's Delivery_Label.
   --  @return The label in Context's locale.

   function Delivery_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Delivery_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Delivery_State_Label.
   --  @return The label in Context's locale.

   function Delivery_Time_Label
      (Context   : Humanize.Contexts.Context;
       State     : Delivery_State;
       Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Delivery_Time_Label.
   --  @param Time_Text As for the parent's Delivery_Time_Label.
   --  @return The label in Context's locale.

   function Digest_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Digest_Label.
   --  @param Name As for the parent's Digest_Label.
   --  @return The label in Context's locale.

   function Event_Count_Label
      (Context : Humanize.Contexts.Context;
       Event   : Notification_Event;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Event As for the parent's Event_Count_Label.
   --  @param Count As for the parent's Event_Count_Label.
   --  @return The label in Context's locale.

   function Inbox_Label
      (Context : Humanize.Contexts.Context;
       Unread  : Natural;
       Total   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Unread As for the parent's Inbox_Label.
   --  @param Total As for the parent's Inbox_Label.
   --  @return The label in Context's locale.

   function Mark_Read_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Mark_Read_Label.
   --  @return The label in Context's locale.

   function Mark_Unread_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Mark_Unread_Label.
   --  @return The label in Context's locale.

   function Muted_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Muted_Label.
   --  @return The label in Context's locale.

   function New_Event_Label
      (Context : Humanize.Contexts.Context;
       Event   : Notification_Event)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Event As for the parent's New_Event_Label.
   --  @return The label in Context's locale.

   function Notification_Channel_Label
      (Context : Humanize.Contexts.Context;
       Channel : Notification_Channel)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Channel As for the parent's Notification_Channel_Label.
   --  @return The label in Context's locale.

   function Notification_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Notification_Count_Label.
   --  @return The label in Context's locale.

   function Notification_Event_Label
      (Context : Humanize.Contexts.Context;
       Event   : Notification_Event)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Event As for the parent's Notification_Event_Label.
   --  @return The label in Context's locale.

   function Notification_Group_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Notification_Group_Label.
   --  @param Count As for the parent's Notification_Group_Label.
   --  @return The label in Context's locale.

   function Notification_Label
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Event   : Notification_Event;
       State   : Notification_State := Unread_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Notification_Label.
   --  @param Event As for the parent's Notification_Label.
   --  @param State As for the parent's Notification_Label.
   --  @return The label in Context's locale.

   function Notification_Label
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Event   : Notification_Event;
       State   : Notification_State;
       Options : Notification_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Notification_Label.
   --  @param Event As for the parent's Notification_Label.
   --  @param State As for the parent's Notification_Label.
   --  @param Options As for the parent's Notification_Label.
   --  @return The label in Context's locale.

   function Notification_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Notification_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Notification_State_Label.
   --  @return The label in Context's locale.

   function Snoozed_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Snoozed_Label.
   --  @return The label in Context's locale.

   function Suppressed_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Suppressed_Label.
   --  @return The label in Context's locale.

   function Unread_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Unread_Label.
   --  @return The label in Context's locale.

   procedure Actor_Event_Label_Into
      (Context : Humanize.Contexts.Context;
       Actor   : String;
       Event   : Notification_Event;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Actor As for the parent's Actor_Event_Label.
   --  @param Event As for the parent's Actor_Event_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Delivery_Attempt_Label_Into
      (Context      : Humanize.Contexts.Context;
       Attempt      : Positive;
       Max_Attempts : Positive;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Attempt As for the parent's Delivery_Attempt_Label.
   --  @param Max_Attempts As for the parent's Delivery_Attempt_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Delivery_Label_Into
      (Context : Humanize.Contexts.Context;
       Channel : Notification_Channel;
       State   : Delivery_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Channel As for the parent's Delivery_Label.
   --  @param State As for the parent's Delivery_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Delivery_Label_Into
      (Context : Humanize.Contexts.Context;
       Channel : Notification_Channel;
       State   : Delivery_State;
       Options : Notification_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Channel As for the parent's Delivery_Label.
   --  @param State As for the parent's Delivery_Label.
   --  @param Options As for the parent's Delivery_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Delivery_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Delivery_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Delivery_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Delivery_Time_Label_Into
      (Context   : Humanize.Contexts.Context;
       State     : Delivery_State;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Delivery_Time_Label.
   --  @param Time_Text As for the parent's Delivery_Time_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Digest_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Digest_Label.
   --  @param Name As for the parent's Digest_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Event_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Event   : Notification_Event;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Event As for the parent's Event_Count_Label.
   --  @param Count As for the parent's Event_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Inbox_Label_Into
      (Context : Humanize.Contexts.Context;
       Unread  : Natural;
       Total   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Unread As for the parent's Inbox_Label.
   --  @param Total As for the parent's Inbox_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Mark_Read_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Mark_Read_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Mark_Unread_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Mark_Unread_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Muted_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Muted_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure New_Event_Label_Into
      (Context : Humanize.Contexts.Context;
       Event   : Notification_Event;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Event As for the parent's New_Event_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Notification_Channel_Label_Into
      (Context : Humanize.Contexts.Context;
       Channel : Notification_Channel;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Channel As for the parent's Notification_Channel_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Notification_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Notification_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Notification_Event_Label_Into
      (Context : Humanize.Contexts.Context;
       Event   : Notification_Event;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Event As for the parent's Notification_Event_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Notification_Group_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Notification_Group_Label.
   --  @param Count As for the parent's Notification_Group_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Notification_Label_Into
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Event   : Notification_Event;
       State   : Notification_State := Unread_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Notification_Label.
   --  @param Event As for the parent's Notification_Label.
   --  @param State As for the parent's Notification_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Notification_Label_Into
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Event   : Notification_Event;
       State   : Notification_State;
       Options : Notification_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Notification_Label.
   --  @param Event As for the parent's Notification_Label.
   --  @param State As for the parent's Notification_Label.
   --  @param Options As for the parent's Notification_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Notification_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Notification_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Notification_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Snoozed_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Snoozed_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Suppressed_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Suppressed_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Unread_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Unread_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Notifications.Localized;
