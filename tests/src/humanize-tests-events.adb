with AUnit.Assertions;

with Humanize.Events;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Events is
   use Humanize.Events;
   use Humanize.Status;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_State_Count_And_Metadata_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check
        (Event_State_Label (Scheduled_Event),
         "scheduled event",
         "scheduled state");
      Check
        (Event_State_Label (Canceled_Event),
         "canceled event",
         "canceled state");
      Check
        (Attendance_State_Label (Accepted),
         "accepted",
         "accepted attendance");
      Check
        (Event_Visibility_Label (Private_Event),
         "private event",
         "private visibility");
      Check (Event_Count_Label (0), "no events", "no events");
      Check (Event_Count_Label (2), "2 events", "event count");
      Check (Attendee_Count_Label (0), "no attendees", "no attendees");
      Check (Attendee_Count_Label (5), "5 attendees", "attendees");
   end Test_State_Count_And_Metadata_Labels;

   procedure Test_Event_Time_Location_And_Capacity_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check
        (Event_Label ("Planning", Scheduled_Event),
         "Planning scheduled event",
         "event label");
      Check
        (Event_Time_Label ("Planning", "tomorrow at 10:00"),
         "Planning at tomorrow at 10:00",
         "event time");
      Check
        (Event_Location_Label ("Planning", "Room 4"),
         "Planning at Room 4",
         "event location");
      Check (Capacity_Label (0, 0), "no capacity", "no capacity");
      Check
        (Capacity_Label (3, 10),
         "3 of 10 seats reserved",
         "capacity");

      Invalid := Event_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid event name",
         "empty event name rejected");
      Invalid := Event_Time_Label ("Planning", " ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid event time",
         "empty event time rejected");
      Invalid := Event_Location_Label ("Planning", " ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid event location",
         "empty event location rejected");
      Invalid := Capacity_Label (11, 10);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid event capacity",
         "invalid capacity rejected");
   end Test_Event_Time_Location_And_Capacity_Labels;

   procedure Test_Rsvp_Reminder_And_Change_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (RSVP_Label (Accepted), "RSVP accepted", "rsvp accepted");
      Check (RSVP_Label (Maybe), "RSVP maybe", "rsvp maybe");
      Check
        (Reminder_Label ("10 minutes before"),
         "reminder 10 minutes before",
         "reminder");
      Check (Canceled_Label, "event canceled", "canceled generic");
      Check
        (Canceled_Label ("Planning"),
         "Planning canceled",
         "canceled named");
      Check
        (Rescheduled_Label ("Planning", "Friday at 11:00"),
         "Planning rescheduled to Friday at 11:00",
         "rescheduled");
      Check
        (Waitlist_Label (2, 5),
         "waitlist position 2 of 5",
         "waitlist total");
      Check
        (Waitlist_Label (2),
         "waitlist position 2",
         "waitlist position");
      Check
        (Organizer_Label ("Ada"),
         "organized by Ada",
         "organizer");
      Check (Conference_Link_Label, "conference link", "conference link");
      Check
        (Conference_Link_Label ("Planning"),
         "Planning conference link",
         "named conference link");
      Check (Check_In_Label, "check in", "check in generic");
      Check (Check_In_Label ("Planning"), "check in to Planning", "check in");
      Check (All_Day_Label, "all-day event", "all-day generic");
      Check
        (All_Day_Label ("Planning"),
         "Planning all-day event",
         "all-day named");

      Invalid := Reminder_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid reminder time",
         "empty reminder rejected");
      Invalid := Rescheduled_Label ("Planning", " ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid event time",
         "empty reschedule time rejected");
      Invalid := Waitlist_Label (6, 5);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid waitlist position",
         "invalid waitlist rejected");
      Invalid := Organizer_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid organizer",
         "empty organizer rejected");
   end Test_Rsvp_Reminder_And_Change_Labels;

   procedure Test_Bounded_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Exact  : String (1 .. 26);
      Tiny   : String (1 .. 10);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Waitlist_Label_Into (2, Exact, Written, Code, 5);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 24
         and then Exact (1 .. Written) = "waitlist position 2 of 5",
         "waitlist bounded exact text");

      Rescheduled_Label_Into ("Planning", "Friday", Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 10
         and then Tiny = "Planning r",
         "rescheduled bounded overflow prefix");

      Event_State_Label_Into (Scheduled_Event, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "event bounded rejects non-1-based buffers");

      Event_Label_Into (" ", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "event bounded returns validation status");

      Reminder_Label_Into ("10 minutes before", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 26
         and then Exact (1 .. Written) = "reminder 10 minutes before",
         "reminder bounded exact text");

      Organizer_Label_Into ("Ada", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 16
         and then Exact (1 .. Written) = "organized by Ada",
         "organizer bounded exact text");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize event/calendar tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_State_Count_And_Metadata_Labels'Access,
        "state count and metadata labels");
      Register_Routine (T, Test_Event_Time_Location_And_Capacity_Labels'Access,
        "event time location and capacity labels");
      Register_Routine (T, Test_Rsvp_Reminder_And_Change_Labels'Access,
        "rsvp reminder and change labels");
      Register_Routine (T, Test_Bounded_Labels'Access,
        "bounded labels");
   end Register_Tests;

end Humanize.Tests.Events;
