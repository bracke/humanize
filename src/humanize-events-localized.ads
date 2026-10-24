with Humanize.Contexts;

--  Events labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Events.Localized is

   function All_Day_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's All_Day_Label.
   --  @return The label in Context's locale.

   function Attendance_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Attendance_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Attendance_State_Label.
   --  @return The label in Context's locale.

   function Attendee_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Attendee_Count_Label.
   --  @return The label in Context's locale.

   function Canceled_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Canceled_Label.
   --  @return The label in Context's locale.

   function Check_In_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Check_In_Label.
   --  @return The label in Context's locale.

   function Conference_Link_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Conference_Link_Label.
   --  @return The label in Context's locale.

   function Event_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Event_Count_Label.
   --  @return The label in Context's locale.

   function Event_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Event_State := Scheduled_Event)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Event_Label.
   --  @param State As for the parent's Event_Label.
   --  @return The label in Context's locale.

   function Event_Location_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Location : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Event_Location_Label.
   --  @param Location As for the parent's Event_Location_Label.
   --  @return The label in Context's locale.

   function Event_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Event_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Event_State_Label.
   --  @return The label in Context's locale.

   function Event_Time_Label
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Event_Time_Label.
   --  @param Time_Text As for the parent's Event_Time_Label.
   --  @return The label in Context's locale.

   function Event_Visibility_Label
      (Context    : Humanize.Contexts.Context;
       Visibility : Event_Visibility)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Visibility As for the parent's Event_Visibility_Label.
   --  @return The label in Context's locale.

   function Organizer_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Organizer_Label.
   --  @return The label in Context's locale.

   function RSVP_Label
      (Context : Humanize.Contexts.Context;
       State   : Attendance_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's RSVP_Label.
   --  @return The label in Context's locale.

   function Reminder_Label
      (Context   : Humanize.Contexts.Context;
       Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Time_Text As for the parent's Reminder_Label.
   --  @return The label in Context's locale.

   function Rescheduled_Label
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Rescheduled_Label.
   --  @param Time_Text As for the parent's Rescheduled_Label.
   --  @return The label in Context's locale.

   procedure All_Day_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's All_Day_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attendance_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Attendance_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Attendance_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attendee_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Attendee_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Canceled_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Canceled_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Check_In_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Check_In_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Conference_Link_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Conference_Link_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Event_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Event_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Event_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Event_State := Scheduled_Event;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Event_Label.
   --  @param State As for the parent's Event_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Event_Location_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Location : String;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Event_Location_Label.
   --  @param Location As for the parent's Event_Location_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Event_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Event_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Event_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Event_Time_Label_Into
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Event_Time_Label.
   --  @param Time_Text As for the parent's Event_Time_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Event_Visibility_Label_Into
      (Context    : Humanize.Contexts.Context;
       Visibility : Event_Visibility;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Visibility As for the parent's Event_Visibility_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Organizer_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Organizer_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure RSVP_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Attendance_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's RSVP_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Reminder_Label_Into
      (Context   : Humanize.Contexts.Context;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Time_Text As for the parent's Reminder_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Rescheduled_Label_Into
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Rescheduled_Label.
   --  @param Time_Text As for the parent's Rescheduled_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Events.Localized;
