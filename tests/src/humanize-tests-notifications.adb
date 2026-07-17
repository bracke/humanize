with AUnit.Assertions;

with Humanize.Notifications;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Notifications is
   use Humanize.Notifications;
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

   procedure Test_Metadata_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check
        (Notification_Channel_Label (Email_Channel),
         "email notifications",
         "email channel");
      Check
        (Notification_Channel_Label (Sms_Channel),
         "SMS notifications",
         "SMS channel");
      Check
        (Notification_State_Label (Unread_State),
         "unread notification",
         "unread state");
      Check
        (Delivery_State_Label (Failed_Delivery),
         "failed notification",
         "failed delivery state");
      Check
        (Notification_Event_Label (Mention_Event), "mention", "mention event");
      Check
        (Notification_Event_Label (System_Event),
         "system notification",
         "system event");
      Check (New_Event_Label (Reply_Event), "new reply", "new reply");
      Check
        (New_Event_Label (System_Event),
         "new system notification",
         "new system event");
      Check (Event_Count_Label (Reply_Event, 0), "no replies", "no replies");
      Check (Event_Count_Label (Reply_Event, 1), "1 reply", "one reply");
      Check (Event_Count_Label (Reply_Event, 3), "3 replies", "many replies");
      Check
        (Event_Count_Label (Approval_Event, 2),
         "2 approval requests",
         "approval request count");
   end Test_Metadata_Labels;

   procedure Test_Count_And_Inbox_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check
        (Notification_Count_Label (0),
         "no notifications",
         "zero notifications");
      Check
        (Notification_Count_Label (1),
         "1 notification",
         "one notification");
      Check
        (Notification_Count_Label (3),
         "3 notifications",
         "many notifications");
      Check (Unread_Label (0), "no unread notifications", "no unread");
      Check (Unread_Label (2), "2 unread notifications", "unread count");
      Check (Inbox_Label (0, 0), "empty inbox", "empty inbox");
      Check (Inbox_Label (0, 5), "all notifications read", "all read");
      Check
        (Inbox_Label (2, 5),
         "2 unread of 5 notifications",
         "inbox summary");

      Invalid := Inbox_Label (6, 5);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid inbox count",
         "invalid inbox count rejected");
   end Test_Count_And_Inbox_Labels;

   procedure Test_Notification_Delivery_And_Actor_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check
        (Notification_Label ("build", Alert_Event, Unread_State),
         "build alert unread",
         "notification label");
      Check
        (Notification_Label ("  thread  ", Reply_Event, Read_State),
         "thread reply read",
         "trimmed notification label");
      Check
        (Delivery_Label (Email_Channel, Failed_Delivery),
         "email notification failed",
         "delivery label");
      Check
        (Delivery_Time_Label (Sent_Delivery, "2 minutes ago"),
         "sent 2 minutes ago",
         "delivery time label");
      Check
        (Actor_Event_Label ("Dana", Mention_Event),
         "Dana mentioned you",
         "actor mention");
      Check
        (Actor_Event_Label ("Ops", Alert_Event),
         "Ops sent an alert",
         "actor alert");

      Invalid := Notification_Label (" ", Alert_Event);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid notification subject",
         "empty subject rejected");
      Invalid := Actor_Event_Label (" ", Reply_Event);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid notification actor",
         "empty actor rejected");
      Invalid := Delivery_Time_Label (Sent_Delivery, " ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid delivery time",
         "empty delivery time rejected");
   end Test_Notification_Delivery_And_Actor_Labels;

   procedure Test_Status_Action_And_Group_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Muted_Label, "notifications muted", "muted all");
      Check
        (Muted_Label ("project"),
         "project notifications muted",
         "muted source");
      Check
        (Snoozed_Label ("thread"),
         "thread notifications snoozed",
         "snoozed source");
      Check (Digest_Label (0), "digest: no notifications", "empty digest");
      Check
        (Digest_Label (3, "daily"),
         "daily digest: 3 notifications",
         "named digest");
      Check
        (Suppressed_Label (0),
         "no notifications suppressed",
         "zero suppressed");
      Check
        (Suppressed_Label (5),
         "5 notifications suppressed",
         "suppressed count");
      Check
        (Delivery_Attempt_Label (2, 5),
         "delivery attempt 2 of 5",
         "delivery attempt");
      Check
        (Notification_Group_Label ("alerts", 3),
         "alerts: 3 notifications",
         "notification group");
      Check
        (Notification_Group_Label ("alerts", 0),
         "alerts: no notifications",
         "empty notification group");
      Check (Mark_Read_Label, "mark notification as read", "mark read one");
      Check
        (Mark_Read_Label (3),
         "mark 3 notifications as read",
         "mark read many");
      Check
        (Mark_Unread_Label (3),
         "mark 3 notifications as unread",
         "mark unread many");

      Invalid := Delivery_Attempt_Label (5, 2);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid delivery attempt",
         "invalid delivery attempt rejected");
      Invalid := Notification_Group_Label (" ", 1);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid notification group",
         "empty group rejected");
   end Test_Status_Action_And_Group_Labels;

   procedure Test_Bounded_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Exact  : String (1 .. 30);
      Tiny   : String (1 .. 10);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Inbox_Label_Into (2, 5, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 27
         and then Exact (1 .. Written) = "2 unread of 5 notifications",
         "inbox bounded exact text");

      Delivery_Label_Into (Email_Channel, Failed_Delivery, Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 10
         and then Tiny = "email noti",
         "delivery bounded overflow prefix");

      Notification_Channel_Label_Into
        (Email_Channel, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "notification bounded rejects non-1-based buffers");

      Notification_Label_Into (" ", Alert_Event, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "notification bounded returns validation status");

      Delivery_Attempt_Label_Into (2, 5, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 23
         and then Exact (1 .. Written) = "delivery attempt 2 of 5",
         "delivery attempt bounded exact text");

      Delivery_Time_Label_Into
        (Sent_Delivery, "2 minutes ago", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 18
         and then Exact (1 .. Written) = "sent 2 minutes ago",
         "delivery time bounded exact text");

      Event_Count_Label_Into (Reply_Event, 3, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 9
         and then Exact (1 .. Written) = "3 replies",
         "event count bounded exact text");

      Notification_Group_Label_Into ("alerts", 3, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 23
         and then Exact (1 .. Written) = "alerts: 3 notifications",
         "group bounded exact text");

      Mark_Unread_Label_Into (Exact, Written, Code, 3);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 30
         and then Exact = "mark 3 notifications as unread",
         "mark unread bounded exact text");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize notification/inbox tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Metadata_Labels'Access,
        "metadata labels");
      Register_Routine (T, Test_Count_And_Inbox_Labels'Access,
        "count and inbox labels");
      Register_Routine (T, Test_Notification_Delivery_And_Actor_Labels'Access,
        "notification delivery and actor labels");
      Register_Routine (T, Test_Status_Action_And_Group_Labels'Access,
        "status action and group labels");
      Register_Routine (T, Test_Bounded_Labels'Access,
        "bounded labels");
   end Register_Tests;

end Humanize.Tests.Notifications;
