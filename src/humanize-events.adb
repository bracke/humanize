with Humanize.Bounded_Text;

package body Humanize.Events is
   use type Humanize.Status.Status_Code;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   function Clean (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Text;

   function Count_Or_No_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Or_No_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Domain_Options
     (Options : Event_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Event_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Event_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Event_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Event_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function State_Text (State : Event_State) return String is
   begin
      case State is
         when Scheduled_Event   => return "scheduled";
         when Tentative_Event   => return "tentative";
         when In_Progress_Event => return "in progress";
         when Completed_Event   => return "completed";
         when Canceled_Event    => return "canceled";
         when Postponed_Event   => return "postponed";
      end case;
   end State_Text;

   function Attendance_Text (State : Attendance_State) return String is
   begin
      case State is
         when Not_Responded => return "not responded";
         when Accepted      => return "accepted";
         when Declined      => return "declined";
         when Maybe         => return "maybe";
         when Waitlisted    => return "waitlisted";
      end case;
   end Attendance_Text;

   function Visibility_Text (Visibility : Event_Visibility) return String is
   begin
      case Visibility is
         when Public_Event  => return "public";
         when Private_Event => return "private";
         when Busy_Event    => return "busy";
         when Free_Event    => return "free";
      end case;
   end Visibility_Text;

   function Event_State_Suffix (State : Event_State) return String is
   begin
      return State_Text (State);
   end Event_State_Suffix;

   function Event_Label_Suffix (State : Event_State) return String is
   begin
      return Event_State_Suffix (State) & " event";
   end Event_Label_Suffix;

   function Attendance_State_Suffix (State : Attendance_State) return String is
   begin
      return Attendance_Text (State);
   end Attendance_State_Suffix;

   function Visibility_Suffix (Visibility : Event_Visibility) return String is
   begin
      return Visibility_Text (Visibility);
   end Visibility_Suffix;

   function Event_State_Metadata
     (State : Event_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Events_Surface, Event_State_Suffix (State));
   end Event_State_Metadata;

   function Attendance_State_Metadata
     (State : Attendance_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Events_Surface, Attendance_State_Suffix (State));
   end Attendance_State_Metadata;

   function Event_State_Label
     (State : Event_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Event_Label_Suffix (State));
   end Event_State_Label;

   function Attendance_State_Label
     (State : Attendance_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Attendance_State_Suffix (State));
   end Attendance_State_Label;

   function Event_Visibility_Label
     (Visibility : Event_Visibility)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Visibility_Suffix (Visibility) & " event");
   end Event_Visibility_Label;

   function Event_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "event", "events"));
   end Event_Count_Label;

   function Event_Label
     (Name  : String;
      State : Event_State := Scheduled_Event)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid event name");
      else
         return Ok_Text (Label & " " & Event_Label_Suffix (State));
      end if;
   end Event_Label;

   function Event_Label
     (Name    : String;
      State   : Event_State;
      Options : Event_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Event_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Event_State_Metadata (State), Domain_Options (Options));
   end Event_Label;

   function Parse_Event_Label
     (Text  : String;
      State : Event_State)
      return Event_Label_Parse_Result
   is
      Result : Event_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Events_Surface,
         Event_Label_Suffix (State));
      Result.Metadata := Event_State_Metadata (State);
      return Result;
   end Parse_Event_Label;

   function Scan_Event_Label
     (Text  : String;
      State : Event_State)
      return Event_Label_Parse_Result
   is
      Result : Event_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Events_Surface,
         Event_Label_Suffix (State));
      Result.Metadata := Event_State_Metadata (State);
      return Result;
   end Scan_Event_Label;

   function Event_Time_Label
     (Name      : String;
      Time_Text : String)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
      Time  : constant String := Clean (Time_Text);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid event name");
      elsif Time'Length = 0 then
         return Invalid_Text ("invalid event time");
      else
         return Ok_Text (Label & " at " & Time);
      end if;
   end Event_Time_Label;

   function Event_Location_Label
     (Name     : String;
      Location : String)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
      Place : constant String := Clean (Location);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid event name");
      elsif Place'Length = 0 then
         return Invalid_Text ("invalid event location");
      else
         return Ok_Text (Label & " at " & Place);
      end if;
   end Event_Location_Label;

   function Attendee_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "attendee", "attendees"));
   end Attendee_Count_Label;

   function Capacity_Label
     (Reserved : Natural;
      Capacity : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Capacity = 0 then
         return Ok_Text ("no capacity");
      elsif Reserved > Capacity then
         return Invalid_Text ("invalid event capacity");
      else
         return Ok_Text
           (Image (Reserved) & " of " & Count_Text (Capacity, "seat", "seats")
            & " reserved");
      end if;
   end Capacity_Label;

   function RSVP_Label
     (State : Attendance_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("RSVP " & Attendance_State_Suffix (State));
   end RSVP_Label;

   function RSVP_Label
     (State   : Attendance_State;
      Options : Event_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := RSVP_Label (State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Attendance_State_Metadata (State), Domain_Options (Options));
   end RSVP_Label;

   function Parse_RSVP_Label
     (Text  : String;
      State : Attendance_State)
      return Event_Label_Parse_Result
   is
      Result : Event_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Events_Surface,
         Attendance_State_Suffix (State));
      Result.Metadata := Attendance_State_Metadata (State);
      return Result;
   end Parse_RSVP_Label;

   function Scan_RSVP_Label
     (Text  : String;
      State : Attendance_State)
      return Event_Label_Parse_Result
   is
      Result : Event_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Events_Surface,
         Attendance_State_Suffix (State));
      Result.Metadata := Attendance_State_Metadata (State);
      return Result;
   end Scan_RSVP_Label;

   function Reminder_Label
     (Time_Text : String)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Time_Text);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid reminder time");
      else
         return Ok_Text ("reminder " & Label);
      end if;
   end Reminder_Label;

   function Canceled_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("event canceled");
      else
         return Ok_Text (Label & " canceled");
      end if;
   end Canceled_Label;

   function Rescheduled_Label
     (Name      : String;
      Time_Text : String)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
      Time  : constant String := Clean (Time_Text);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid event name");
      elsif Time'Length = 0 then
         return Invalid_Text ("invalid event time");
      else
         return Ok_Text (Label & " rescheduled to " & Time);
      end if;
   end Rescheduled_Label;

   function Waitlist_Label
     (Position : Positive;
      Total    : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      if Total > 0 and then Position > Total then
         return Invalid_Text ("invalid waitlist position");
      elsif Total = 0 then
         return Ok_Text ("waitlist position " & Image (Position));
      else
         return Ok_Text
           ("waitlist position " & Image (Position) & " of " & Image (Total));
      end if;
   end Waitlist_Label;

   function Organizer_Label
     (Name : String)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid organizer");
      else
         return Ok_Text ("organized by " & Label);
      end if;
   end Organizer_Label;

   function Conference_Link_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("conference link");
      else
         return Ok_Text (Label & " conference link");
      end if;
   end Conference_Link_Label;

   function Check_In_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("check in");
      else
         return Ok_Text ("check in to " & Label);
      end if;
   end Check_In_Label;

   function All_Day_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("all-day event");
      else
         return Ok_Text (Label & " all-day event");
      end if;
   end All_Day_Label;

   procedure Event_State_Label_Into
     (State   : Event_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Event_State_Label (State), Target, Written, Status);
   end Event_State_Label_Into;

   procedure Attendance_State_Label_Into
     (State   : Attendance_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Attendance_State_Label (State), Target, Written, Status);
   end Attendance_State_Label_Into;

   procedure Event_Visibility_Label_Into
     (Visibility : Event_Visibility;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Event_Visibility_Label (Visibility), Target, Written, Status);
   end Event_Visibility_Label_Into;

   procedure Event_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Event_Count_Label (Count), Target, Written, Status);
   end Event_Count_Label_Into;

   procedure Event_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Event_State := Scheduled_Event)
   is
   begin
      Copy_Result (Event_Label (Name, State), Target, Written, Status);
   end Event_Label_Into;

   procedure Event_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Event_State;
      Options : Event_Label_Options)
   is
   begin
      Copy_Result (Event_Label (Name, State, Options), Target, Written, Status);
   end Event_Label_Into;

   procedure Event_Time_Label_Into
     (Name      : String;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Event_Time_Label (Name, Time_Text), Target, Written, Status);
   end Event_Time_Label_Into;

   procedure Event_Location_Label_Into
     (Name     : String;
      Location : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Event_Location_Label (Name, Location), Target, Written, Status);
   end Event_Location_Label_Into;

   procedure Attendee_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Attendee_Count_Label (Count), Target, Written, Status);
   end Attendee_Count_Label_Into;

   procedure Capacity_Label_Into
     (Reserved : Natural;
      Capacity : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Capacity_Label (Reserved, Capacity), Target, Written, Status);
   end Capacity_Label_Into;

   procedure RSVP_Label_Into
     (State   : Attendance_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (RSVP_Label (State), Target, Written, Status);
   end RSVP_Label_Into;

   procedure RSVP_Label_Into
     (State   : Attendance_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Event_Label_Options)
   is
   begin
      Copy_Result (RSVP_Label (State, Options), Target, Written, Status);
   end RSVP_Label_Into;

   procedure Reminder_Label_Into
     (Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Reminder_Label (Time_Text), Target, Written, Status);
   end Reminder_Label_Into;

   procedure Canceled_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Canceled_Label (Name), Target, Written, Status);
   end Canceled_Label_Into;

   procedure Rescheduled_Label_Into
     (Name      : String;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Rescheduled_Label (Name, Time_Text), Target, Written, Status);
   end Rescheduled_Label_Into;

   procedure Waitlist_Label_Into
     (Position : Positive;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Total    : Natural := 0)
   is
   begin
      Copy_Result (Waitlist_Label (Position, Total), Target, Written, Status);
   end Waitlist_Label_Into;

   procedure Organizer_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Organizer_Label (Name), Target, Written, Status);
   end Organizer_Label_Into;

   procedure Conference_Link_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Conference_Link_Label (Name), Target, Written, Status);
   end Conference_Link_Label_Into;

   procedure Check_In_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Check_In_Label (Name), Target, Written, Status);
   end Check_In_Label_Into;

   procedure All_Day_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (All_Day_Label (Name), Target, Written, Status);
   end All_Day_Label_Into;

end Humanize.Events;
