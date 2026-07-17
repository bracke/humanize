with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for notifications, inboxes, and delivery metadata.
package Humanize.Notifications is

   type Notification_Output_Mode is
     (Notification_Detailed, Notification_Compact,
      Notification_Accessible, Notification_Log);
   --  Output style for notification labels with domain metadata.

   type Notification_Label_Options is record
      Mode             : Notification_Output_Mode := Notification_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Caller-selected metadata included around notification labels.

   Default_Notification_Label_Options : constant Notification_Label_Options :=
     (Mode             => Notification_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Notification_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Notification_Channel is
     (In_App_Channel,
      Email_Channel,
      Sms_Channel,
      Push_Channel,
      Webhook_Channel,
      Digest_Channel);
   --  Caller-supplied notification delivery channel.

   type Notification_State is
     (Unread_State,
      Read_State,
      Archived_State,
      Muted_State,
      Snoozed_State,
      Suppressed_State);
   --  Caller-supplied notification inbox state.

   type Delivery_State is
     (Pending_Delivery,
      Sent_Delivery,
      Delivered_Delivery,
      Failed_Delivery,
      Retrying_Delivery,
      Canceled_Delivery);
   --  Caller-supplied notification delivery state.

   type Notification_Event is
     (Mention_Event,
      Reply_Event,
      Assignment_Event,
      Approval_Event,
      Alert_Event,
      Digest_Event,
      Reminder_Event,
      System_Event);
   --  Caller-supplied notification event kind.

   function Notification_Channel_Label
     (Channel : Notification_Channel)
      return Humanize.Status.Text_Result;
   --  @param Channel Notification delivery channel.
   --  @return Human-readable notification channel label.

   function Notification_State_Label
     (State : Notification_State)
      return Humanize.Status.Text_Result;
   --  @param State Notification inbox state.
   --  @return Human-readable notification state label.

   function Delivery_State_Label
     (State : Delivery_State)
      return Humanize.Status.Text_Result;
   --  @param State Notification delivery state.
   --  @return Human-readable delivery state label.

   function Notification_Event_Label
     (Event : Notification_Event)
      return Humanize.Status.Text_Result;
   --  @param Event Notification event kind.
   --  @return Human-readable notification event label.

   function New_Event_Label
     (Event : Notification_Event)
      return Humanize.Status.Text_Result;
   --  @param Event Notification event kind.
   --  @return Human-readable new-event notification label.

   function Event_Count_Label
     (Event : Notification_Event;
      Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Event Notification event kind.
   --  @param Count Event notification count.
   --  @return Human-readable notification event count label.

   function Notification_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Notification count.
   --  @return Human-readable notification count label.

   function Unread_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Unread notification count.
   --  @return Human-readable unread notification label.

   function Inbox_Label
     (Unread : Natural;
      Total  : Natural)
      return Humanize.Status.Text_Result;
   --  @param Unread Unread notification count.
   --  @param Total Total notification count.
   --  @return Human-readable inbox summary label.

   function Notification_Label
     (Subject : String;
      Event   : Notification_Event;
      State   : Notification_State := Unread_State)
      return Humanize.Status.Text_Result;
   --  @param Subject Notification subject.
   --  @param Event Notification event kind.
   --  @param State Notification inbox state.
   --  @return Human-readable notification label.

   function Notification_Label
     (Subject : String;
      Event   : Notification_Event;
      State   : Notification_State;
      Options : Notification_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Subject Notification subject.
   --  @param Event Notification event kind.
   --  @param State Notification inbox state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable notification label with optional metadata.

   function Delivery_Label
     (Channel : Notification_Channel;
      State   : Delivery_State)
      return Humanize.Status.Text_Result;
   --  @param Channel Notification delivery channel.
   --  @param State Notification delivery state.
   --  @return Human-readable delivery label.

   function Delivery_Label
     (Channel : Notification_Channel;
      State   : Delivery_State;
      Options : Notification_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Channel Notification delivery channel.
   --  @param State Notification delivery state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable delivery label with optional metadata.

   function Notification_State_Metadata
     (State : Notification_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Notification inbox state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Delivery_State_Metadata
     (State : Delivery_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Delivery state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Parse_Notification_Label
     (Text  : String;
      Event : Notification_Event;
      State : Notification_State)
      return Notification_Label_Parse_Result;
   --  @param Text Label in rendered notification-label form.
   --  @param Event Expected notification event kind.
   --  @param State Expected notification state.
   --  @return Parsed subject span, state span, metadata, and consumed length.

   function Scan_Notification_Label
     (Text  : String;
      Event : Notification_Event;
      State : Notification_State)
      return Notification_Label_Parse_Result;
   --  @param Text Text beginning with a notification label.
   --  @param Event Expected notification event kind.
   --  @param State Expected notification state.
   --  @return Parsed label span and consumed prefix length.

   function Parse_Delivery_Label
     (Text    : String;
      Channel : Notification_Channel;
      State   : Delivery_State)
      return Notification_Label_Parse_Result;
   --  @param Text Label in rendered delivery-label form.
   --  @param Channel Expected delivery channel.
   --  @param State Expected delivery state.
   --  @return Parsed channel span, state span, metadata, and consumed length.

   function Scan_Delivery_Label
     (Text    : String;
      Channel : Notification_Channel;
      State   : Delivery_State)
      return Notification_Label_Parse_Result;
   --  @param Text Text beginning with a delivery label.
   --  @param Channel Expected delivery channel.
   --  @param State Expected delivery state.
   --  @return Parsed label span and consumed prefix length.

   function Delivery_Time_Label
     (State     : Delivery_State;
      Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param State Notification delivery state.
   --  @param Time_Text Caller-supplied human-readable time/distance label.
   --  @return Human-readable delivery time label.

   function Actor_Event_Label
     (Actor : String;
      Event : Notification_Event)
      return Humanize.Status.Text_Result;
   --  @param Actor Actor display name.
   --  @param Event Notification event kind.
   --  @return Human-readable actor/event notification label.

   function Muted_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional notification source name.
   --  @return Human-readable muted notification label.

   function Snoozed_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional notification source name.
   --  @return Human-readable snoozed notification label.

   function Digest_Label
     (Count : Natural;
      Name  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Count Digest notification count.
   --  @param Name Optional digest name.
   --  @return Human-readable digest label.

   function Suppressed_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Suppressed notification count.
   --  @return Human-readable suppressed notification label.

   function Delivery_Attempt_Label
     (Attempt      : Positive;
      Max_Attempts : Positive)
      return Humanize.Status.Text_Result;
   --  @param Attempt Current delivery attempt.
   --  @param Max_Attempts Maximum delivery attempts.
   --  @return Human-readable delivery attempt label.

   function Notification_Group_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Notification group/source name.
   --  @param Count Notification count in the group.
   --  @return Human-readable grouped notification label.

   function Mark_Read_Label
     (Count : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Count Notification count to mark read.
   --  @return Human-readable mark-read action label.

   function Mark_Unread_Label
     (Count : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Count Notification count to mark unread.
   --  @return Human-readable mark-unread action label.

   procedure Notification_Channel_Label_Into
     (Channel : Notification_Channel;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Channel Notification delivery channel.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Notification_State_Label_Into
     (State   : Notification_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Notification inbox state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Delivery_State_Label_Into
     (State   : Delivery_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Notification delivery state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Notification_Event_Label_Into
     (Event   : Notification_Event;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Event Notification event kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure New_Event_Label_Into
     (Event   : Notification_Event;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Event Notification event kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Event_Count_Label_Into
     (Event   : Notification_Event;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Event Notification event kind.
   --  @param Count Event notification count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Notification_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Notification count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Unread_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Unread notification count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Inbox_Label_Into
     (Unread  : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Unread Unread notification count.
   --  @param Total Total notification count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Notification_Label_Into
     (Subject : String;
      Event   : Notification_Event;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Notification_State := Unread_State);
   --  @param Subject Notification subject.
   --  @param Event Notification event kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Notification inbox state.

   procedure Notification_Label_Into
     (Subject : String;
      Event   : Notification_Event;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Notification_State;
      Options : Notification_Label_Options);
   --  @param Subject Notification subject.
   --  @param Event Notification event kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Notification inbox state.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Delivery_Label_Into
     (Channel : Notification_Channel;
      State   : Delivery_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Channel Notification delivery channel.
   --  @param State Notification delivery state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Delivery_Label_Into
     (Channel : Notification_Channel;
      State   : Delivery_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Notification_Label_Options);
   --  @param Channel Notification delivery channel.
   --  @param State Notification delivery state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Delivery_Time_Label_Into
     (State     : Delivery_State;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param State Notification delivery state.
   --  @param Time_Text Caller-supplied human-readable time/distance label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Actor_Event_Label_Into
     (Actor   : String;
      Event   : Notification_Event;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Actor Actor display name.
   --  @param Event Notification event kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Muted_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional notification source name.

   procedure Snoozed_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional notification source name.

   procedure Digest_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Count Digest notification count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional digest name.

   procedure Suppressed_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Suppressed notification count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Delivery_Attempt_Label_Into
     (Attempt      : Positive;
      Max_Attempts : Positive;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   --  @param Attempt Current delivery attempt.
   --  @param Max_Attempts Maximum delivery attempts.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Notification_Group_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Notification group/source name.
   --  @param Count Notification count in the group.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Mark_Read_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 1);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Count Notification count to mark read.

   procedure Mark_Unread_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 1);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Count Notification count to mark unread.

end Humanize.Notifications;
