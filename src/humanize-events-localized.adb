with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Events.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function All_Day_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.All_Day_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.all_day_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end All_Day_Label;

   function Attendance_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Attendance_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Attendance_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.attendance_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Attendance_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Attendance_State_Label;

   function Attendee_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Attendee_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.attendee_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Attendee_Count_Label;

   function Canceled_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Canceled_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.canceled_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Canceled_Label;

   function Capacity_Label
      (Context  : Humanize.Contexts.Context;
       Reserved : Natural;
       Capacity : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Capacity_Label (Reserved => Reserved, Capacity => Capacity);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.capacity_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "capacity", Long_Long_Integer (Capacity));
      Selection := Sel.With_Arg (Selection, "reserved", Long_Long_Integer (Reserved));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Capacity_Label;

   function Check_In_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Check_In_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.check_in_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Check_In_Label;

   function Conference_Link_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Conference_Link_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.conference_link_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Conference_Link_Label;

   function Event_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Event_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.event_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Event_Count_Label;

   function Event_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Event_State := Scheduled_Event)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Event_Label (Name => Name, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.event_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Event_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Event_Label;

   function Event_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Event_State;
       Options : Event_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Event_Label (Name => Name, State => State, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Events.Event_Label (Name => Name, State => State);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Event_Label (Context, Name => Name, State =>
        State));
   end Event_Label;

   function Event_Location_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Location : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Event_Location_Label (Name => Name, Location => Location);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.event_location_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "location", Humanize.Bounded_Text.Clean (Location));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Event_Location_Label;

   function Event_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Event_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Event_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.event_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Event_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Event_State_Label;

   function Event_Time_Label
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Event_Time_Label (Name => Name, Time_Text => Time_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.event_time_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "time_text", Humanize.Bounded_Text.Clean (Time_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Event_Time_Label;

   function Event_Visibility_Label
      (Context    : Humanize.Contexts.Context;
       Visibility : Event_Visibility)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Event_Visibility_Label (Visibility => Visibility);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.event_visibility_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "visibility", Lower (Event_Visibility'Image (Visibility)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Event_Visibility_Label;

   function Organizer_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Organizer_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.organizer_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Organizer_Label;

   function RSVP_Label
      (Context : Humanize.Contexts.Context;
       State   : Attendance_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.RSVP_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.rsvp_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Attendance_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end RSVP_Label;

   function RSVP_Label
      (Context : Humanize.Contexts.Context;
       State   : Attendance_State;
       Options : Event_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.RSVP_Label (State => State, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Events.RSVP_Label (State => State);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, RSVP_Label (Context, State => State));
   end RSVP_Label;

   function Reminder_Label
      (Context   : Humanize.Contexts.Context;
       Time_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Reminder_Label (Time_Text => Time_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.reminder_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "time_text", Humanize.Bounded_Text.Clean (Time_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Reminder_Label;

   function Rescheduled_Label
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Rescheduled_Label (Name => Name, Time_Text => Time_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.rescheduled_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "time_text", Humanize.Bounded_Text.Clean (Time_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Rescheduled_Label;

   function Waitlist_Label
      (Context  : Humanize.Contexts.Context;
       Position : Positive;
       Total    : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Events.Waitlist_Label (Position => Position, Total => Total);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.events.waitlist_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "total", Long_Long_Integer (Total));
      Selection := Sel.With_Arg (Selection, "position", Long_Long_Integer (Position));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Waitlist_Label;

   procedure All_Day_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (All_Day_Label (Context, Name => Name), Target, Written, Status);
   end All_Day_Label_Into;

   procedure Attendance_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Attendance_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Attendance_State_Label (Context, State => State), Target, Written, Status);
   end Attendance_State_Label_Into;

   procedure Attendee_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Attendee_Count_Label (Context, Count => Count), Target, Written, Status);
   end Attendee_Count_Label_Into;

   procedure Canceled_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Canceled_Label (Context, Name => Name), Target, Written, Status);
   end Canceled_Label_Into;

   procedure Capacity_Label_Into
      (Context  : Humanize.Contexts.Context;
       Reserved : Natural;
       Capacity : Natural;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Capacity_Label (Context, Reserved => Reserved, Capacity => Capacity),
         Target, Written, Status);
   end Capacity_Label_Into;

   procedure Check_In_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Check_In_Label (Context, Name => Name), Target, Written, Status);
   end Check_In_Label_Into;

   procedure Conference_Link_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Conference_Link_Label (Context, Name => Name), Target, Written, Status);
   end Conference_Link_Label_Into;

   procedure Event_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Event_Count_Label (Context, Count => Count), Target, Written, Status);
   end Event_Count_Label_Into;

   procedure Event_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Event_State := Scheduled_Event;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Event_Label (Context, Name => Name, State => State), Target, Written, Status);
   end Event_Label_Into;

   procedure Event_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Event_State;
       Options : Event_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Event_Label (Context, Name => Name, State => State, Options => Options),
         Target, Written, Status);
   end Event_Label_Into;

   procedure Event_Location_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Location : String;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Event_Location_Label (Context, Name => Name, Location => Location),
         Target, Written, Status);
   end Event_Location_Label_Into;

   procedure Event_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Event_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Event_State_Label (Context, State => State), Target, Written, Status);
   end Event_State_Label_Into;

   procedure Event_Time_Label_Into
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Event_Time_Label (Context, Name => Name, Time_Text => Time_Text),
         Target, Written, Status);
   end Event_Time_Label_Into;

   procedure Event_Visibility_Label_Into
      (Context    : Humanize.Contexts.Context;
       Visibility : Event_Visibility;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Event_Visibility_Label (Context, Visibility => Visibility),
         Target, Written, Status);
   end Event_Visibility_Label_Into;

   procedure Organizer_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Organizer_Label (Context, Name => Name), Target, Written, Status);
   end Organizer_Label_Into;

   procedure RSVP_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Attendance_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (RSVP_Label (Context, State => State), Target, Written, Status);
   end RSVP_Label_Into;

   procedure RSVP_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Attendance_State;
       Options : Event_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (RSVP_Label (Context, State => State, Options => Options),
         Target, Written, Status);
   end RSVP_Label_Into;

   procedure Reminder_Label_Into
      (Context   : Humanize.Contexts.Context;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Reminder_Label (Context, Time_Text => Time_Text), Target, Written, Status);
   end Reminder_Label_Into;

   procedure Rescheduled_Label_Into
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Rescheduled_Label (Context, Name => Name, Time_Text => Time_Text),
         Target, Written, Status);
   end Rescheduled_Label_Into;

   procedure Waitlist_Label_Into
      (Context  : Humanize.Contexts.Context;
       Position : Positive;
       Total    : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Waitlist_Label (Context, Position => Position, Total => Total),
         Target, Written, Status);
   end Waitlist_Label_Into;

end Humanize.Events.Localized;
