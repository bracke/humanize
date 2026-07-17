with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for calendar events, attendance, and reminders.
package Humanize.Events is

   type Event_Output_Mode is (Event_Detailed, Event_Compact,
                              Event_Accessible, Event_Log);
   --  Output style for event labels with domain metadata.

   type Event_Label_Options is record
      Mode             : Event_Output_Mode := Event_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Caller-selected metadata included around event labels.

   Default_Event_Label_Options : constant Event_Label_Options :=
     (Mode             => Event_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Event_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Event_State is
     (Scheduled_Event,
      Tentative_Event,
      In_Progress_Event,
      Completed_Event,
      Canceled_Event,
      Postponed_Event);
   --  Caller-supplied event state.

   type Attendance_State is
     (Not_Responded,
      Accepted,
      Declined,
      Maybe,
      Waitlisted);
   --  Caller-supplied attendee response state.

   type Event_Visibility is
     (Public_Event,
      Private_Event,
      Busy_Event,
      Free_Event);
   --  Caller-supplied calendar visibility/free-busy state.

   function Event_State_Label
     (State : Event_State)
      return Humanize.Status.Text_Result;
   --  @param State Event state.
   --  @return Human-readable event-state label.

   function Attendance_State_Label
     (State : Attendance_State)
      return Humanize.Status.Text_Result;
   --  @param State Attendee response state.
   --  @return Human-readable attendance-state label.

   function Event_Visibility_Label
     (Visibility : Event_Visibility)
      return Humanize.Status.Text_Result;
   --  @param Visibility Calendar visibility/free-busy state.
   --  @return Human-readable event visibility label.

   function Event_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Event count.
   --  @return Human-readable event count label.

   function Event_Label
     (Name  : String;
      State : Event_State := Scheduled_Event)
      return Humanize.Status.Text_Result;
   --  @param Name Event name.
   --  @param State Event state.
   --  @return Human-readable event label.

   function Event_Label
     (Name    : String;
      State   : Event_State;
      Options : Event_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Event name.
   --  @param State Event state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable event label with optional metadata.

   function Event_Time_Label
     (Name      : String;
      Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Name Event name.
   --  @param Time_Text Caller-supplied event time/range label.
   --  @return Human-readable event time label.

   function Event_Location_Label
     (Name     : String;
      Location : String)
      return Humanize.Status.Text_Result;
   --  @param Name Event name.
   --  @param Location Caller-supplied event location label.
   --  @return Human-readable event location label.

   function Attendee_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Attendee count.
   --  @return Human-readable attendee count label.

   function Capacity_Label
     (Reserved : Natural;
      Capacity : Natural)
      return Humanize.Status.Text_Result;
   --  @param Reserved Reserved attendee/seat count.
   --  @param Capacity Total event capacity.
   --  @return Human-readable event capacity label.

   function RSVP_Label
     (State : Attendance_State)
      return Humanize.Status.Text_Result;
   --  @param State Attendee response state.
   --  @return Human-readable RSVP action/status label.

   function RSVP_Label
     (State   : Attendance_State;
      Options : Event_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param State Attendee response state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable RSVP label with optional metadata.

   function Event_State_Metadata
     (State : Event_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Event state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Attendance_State_Metadata
     (State : Attendance_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Attendee response state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Parse_Event_Label
     (Text  : String;
      State : Event_State)
      return Event_Label_Parse_Result;
   --  @param Text Label in rendered event-label form.
   --  @param State Expected event state.
   --  @return Parsed event name span, state span, metadata, and consumed length.

   function Scan_Event_Label
     (Text  : String;
      State : Event_State)
      return Event_Label_Parse_Result;
   --  @param Text Text beginning with an event label.
   --  @param State Expected event state.
   --  @return Parsed label span and consumed prefix length.

   function Parse_RSVP_Label
     (Text  : String;
      State : Attendance_State)
      return Event_Label_Parse_Result;
   --  @param Text RSVP label rendered by RSVP_Label.
   --  @param State Expected attendance state.
   --  @return Parsed RSVP prefix, state span, metadata, and consumed length.

   function Scan_RSVP_Label
     (Text  : String;
      State : Attendance_State)
      return Event_Label_Parse_Result;
   --  @param Text Text beginning with an RSVP label.
   --  @param State Expected attendance state.
   --  @return Parsed label span and consumed prefix length.

   function Reminder_Label
     (Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Time_Text Caller-supplied reminder time/distance label.
   --  @return Human-readable event reminder label.

   function Canceled_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional event name.
   --  @return Human-readable canceled event label.

   function Rescheduled_Label
     (Name      : String;
      Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Name Event name.
   --  @param Time_Text Caller-supplied new event time/range label.
   --  @return Human-readable rescheduled event label.

   function Waitlist_Label
     (Position : Positive;
      Total    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Position Waitlist position.
   --  @param Total Optional waitlist size.
   --  @return Human-readable waitlist position label.

   function Organizer_Label
     (Name : String)
      return Humanize.Status.Text_Result;
   --  @param Name Event organizer display name.
   --  @return Human-readable organizer label.

   function Conference_Link_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional event or meeting name.
   --  @return Human-readable conference-link label.

   function Check_In_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional event name.
   --  @return Human-readable event check-in label.

   function All_Day_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional event name.
   --  @return Human-readable all-day event label.

   procedure Event_State_Label_Into
     (State   : Event_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Event state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attendance_State_Label_Into
     (State   : Attendance_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Attendee response state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Event_Visibility_Label_Into
     (Visibility : Event_Visibility;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Visibility Calendar visibility/free-busy state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Event_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Event count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Event_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Event_State := Scheduled_Event);
   --  @param Name Event name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Event state.

   procedure Event_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Event_State;
      Options : Event_Label_Options);
   --  @param Name Event name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Event state.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Event_Time_Label_Into
     (Name      : String;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Name Event name.
   --  @param Time_Text Caller-supplied event time/range label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Event_Location_Label_Into
     (Name     : String;
      Location : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Name Event name.
   --  @param Location Caller-supplied event location label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attendee_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Attendee count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Capacity_Label_Into
     (Reserved : Natural;
      Capacity : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Reserved Reserved attendee/seat count.
   --  @param Capacity Total event capacity.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure RSVP_Label_Into
     (State   : Attendance_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Attendee response state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure RSVP_Label_Into
     (State   : Attendance_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Event_Label_Options);
   --  @param State Attendee response state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Reminder_Label_Into
     (Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Time_Text Caller-supplied reminder time/distance label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Canceled_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional event name.

   procedure Rescheduled_Label_Into
     (Name      : String;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Name Event name.
   --  @param Time_Text Caller-supplied new event time/range label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Waitlist_Label_Into
     (Position : Positive;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Total    : Natural := 0);
   --  @param Position Waitlist position.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Total Optional waitlist size.

   procedure Organizer_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Event organizer display name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Conference_Link_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional event or meeting name.

   procedure Check_In_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional event name.

   procedure All_Day_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional event name.

end Humanize.Events;
