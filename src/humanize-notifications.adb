with Humanize.Bounded_Text;

package body Humanize.Notifications is
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
     (Options : Notification_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Notification_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Notification_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Notification_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Notification_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Channel_Text (Channel : Notification_Channel) return String is
   begin
      case Channel is
         when In_App_Channel  => return "in-app";
         when Email_Channel   => return "email";
         when Sms_Channel     => return "SMS";
         when Push_Channel    => return "push";
         when Webhook_Channel => return "webhook";
         when Digest_Channel  => return "digest";
      end case;
   end Channel_Text;

   function State_Text (State : Notification_State) return String is
   begin
      case State is
         when Unread_State     => return "unread";
         when Read_State       => return "read";
         when Archived_State   => return "archived";
         when Muted_State      => return "muted";
         when Snoozed_State    => return "snoozed";
         when Suppressed_State => return "suppressed";
      end case;
   end State_Text;

   function Delivery_Text (State : Delivery_State) return String is
   begin
      case State is
         when Pending_Delivery   => return "pending";
         when Sent_Delivery      => return "sent";
         when Delivered_Delivery => return "delivered";
         when Failed_Delivery    => return "failed";
         when Retrying_Delivery  => return "retrying";
         when Canceled_Delivery  => return "canceled";
      end case;
   end Delivery_Text;

   function Event_Text (Event : Notification_Event) return String is
   begin
      case Event is
         when Mention_Event    => return "mention";
         when Reply_Event      => return "reply";
         when Assignment_Event => return "assignment";
         when Approval_Event   => return "approval";
         when Alert_Event      => return "alert";
         when Digest_Event     => return "digest";
         when Reminder_Event   => return "reminder";
         when System_Event     => return "system notification";
      end case;
   end Event_Text;

   function Event_Plural_Text (Event : Notification_Event) return String is
   begin
      case Event is
         when Mention_Event    => return "mentions";
         when Reply_Event      => return "replies";
         when Assignment_Event => return "assignments";
         when Approval_Event   => return "approval requests";
         when Alert_Event      => return "alerts";
         when Digest_Event     => return "digests";
         when Reminder_Event   => return "reminders";
         when System_Event     => return "system notifications";
      end case;
   end Event_Plural_Text;

   function Event_Verb (Event : Notification_Event) return String is
   begin
      case Event is
         when Mention_Event    => return "mentioned you";
         when Reply_Event      => return "replied";
         when Assignment_Event => return "assigned you";
         when Approval_Event   => return "requested approval";
         when Alert_Event      => return "sent an alert";
         when Digest_Event     => return "sent a digest";
         when Reminder_Event   => return "sent a reminder";
         when System_Event     => return "sent a system notification";
      end case;
   end Event_Verb;

   function Channel_Suffix (Channel : Notification_Channel) return String is
   begin
      return Channel_Text (Channel);
   end Channel_Suffix;

   function Notification_State_Suffix
     (State : Notification_State)
      return String
   is
   begin
      return State_Text (State);
   end Notification_State_Suffix;

   function Delivery_State_Suffix (State : Delivery_State) return String is
   begin
      return Delivery_Text (State);
   end Delivery_State_Suffix;

   function Event_Suffix (Event : Notification_Event) return String is
   begin
      return Event_Text (Event);
   end Event_Suffix;

   function Notification_Label_Suffix
     (Event : Notification_Event;
      State : Notification_State)
      return String
   is
   begin
      return Event_Suffix (Event) & " " & Notification_State_Suffix (State);
   end Notification_Label_Suffix;

   function Delivery_Name_Suffix
     (Channel : Notification_Channel)
      return String
   is
   begin
      return Channel_Suffix (Channel) & " notification";
   end Delivery_Name_Suffix;

   function Delivery_Label_Suffix
     (Channel : Notification_Channel;
      State   : Delivery_State)
      return String
   is
   begin
      return Delivery_Name_Suffix (Channel) & " " & Delivery_State_Suffix (State);
   end Delivery_Label_Suffix;

   function Notification_State_Metadata
     (State : Notification_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Notifications_Surface,
         Notification_State_Suffix (State));
   end Notification_State_Metadata;

   function Delivery_State_Metadata
     (State : Delivery_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Notifications_Surface,
         Delivery_State_Suffix (State));
   end Delivery_State_Metadata;

   function Notification_Channel_Label
     (Channel : Notification_Channel)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Channel_Suffix (Channel) & " notifications");
   end Notification_Channel_Label;

   function Notification_State_Label
     (State : Notification_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Notification_State_Suffix (State) & " notification");
   end Notification_State_Label;

   function Delivery_State_Label
     (State : Delivery_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Delivery_State_Suffix (State) & " notification");
   end Delivery_State_Label;

   function Notification_Event_Label
     (Event : Notification_Event)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Event_Suffix (Event));
   end Notification_Event_Label;

   function New_Event_Label
     (Event : Notification_Event)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("new " & Event_Suffix (Event));
   end New_Event_Label;

   function Event_Count_Label
     (Event : Notification_Event;
      Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Count_Or_No_Text (Count, Event_Suffix (Event), Event_Plural_Text (Event)));
   end Event_Count_Label;

   function Notification_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "notification", "notifications"));
   end Notification_Count_Label;

   function Unread_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Count_Or_No_Text
           (Count, "unread notification", "unread notifications"));
   end Unread_Label;

   function Inbox_Label
     (Unread : Natural;
      Total  : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Unread > Total then
         return Invalid_Text ("invalid inbox count");
      elsif Total = 0 then
         return Ok_Text ("empty inbox");
      elsif Unread = 0 then
         return Ok_Text ("all notifications read");
      else
         return Ok_Text
           (Image (Unread) & " unread of "
            & Count_Text (Total, "notification", "notifications"));
      end if;
   end Inbox_Label;

   function Notification_Label
     (Subject : String;
      Event   : Notification_Event;
      State   : Notification_State := Unread_State)
      return Humanize.Status.Text_Result
   is
      Text : constant String := Clean (Subject);
   begin
      if Text'Length = 0 then
         return Invalid_Text ("invalid notification subject");
      else
         return Ok_Text (Text & " " & Notification_Label_Suffix (Event, State));
      end if;
   end Notification_Label;

   function Notification_Label
     (Subject : String;
      Event   : Notification_Event;
      State   : Notification_State;
      Options : Notification_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Notification_Label (Subject, Event, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Notification_State_Metadata (State), Domain_Options (Options));
   end Notification_Label;

   function Delivery_Label
     (Channel : Notification_Channel;
      State   : Delivery_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Delivery_Label_Suffix (Channel, State));
   end Delivery_Label;

   function Delivery_Label
     (Channel : Notification_Channel;
      State   : Delivery_State;
      Options : Notification_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Delivery_Label (Channel, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Delivery_State_Metadata (State), Domain_Options (Options));
   end Delivery_Label;

   function Parse_Notification_Label
     (Text  : String;
      Event : Notification_Event;
      State : Notification_State)
      return Notification_Label_Parse_Result
   is
      Result : Notification_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Notifications_Surface,
         Notification_Label_Suffix (Event, State));
      Result.Metadata := Notification_State_Metadata (State);
      return Result;
   end Parse_Notification_Label;

   function Scan_Notification_Label
     (Text  : String;
      Event : Notification_Event;
      State : Notification_State)
      return Notification_Label_Parse_Result
   is
      Result : Notification_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Notifications_Surface,
         Notification_Label_Suffix (Event, State));
      Result.Metadata := Notification_State_Metadata (State);
      return Result;
   end Scan_Notification_Label;

   function Parse_Delivery_Label
     (Text    : String;
      Channel : Notification_Channel;
      State   : Delivery_State)
      return Notification_Label_Parse_Result
   is
      Item : constant String := Clean (Text);
      Expected_Name : constant String := Delivery_Name_Suffix (Channel);
      Result : Notification_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Item, Humanize.Domain_Details.Notifications_Surface,
         Delivery_State_Suffix (State));
      if Result.Status = Humanize.Status.Ok
        and then Item (Result.Name_First
                       .. Result.Name_First + Result.Name_Length - 1)
          /= Expected_Name
      then
         Result.Status := Humanize.Status.Invalid_Argument;
      end if;
      Result.Metadata := Delivery_State_Metadata (State);
      return Result;
   end Parse_Delivery_Label;

   function Scan_Delivery_Label
     (Text    : String;
      Channel : Notification_Channel;
      State   : Delivery_State)
      return Notification_Label_Parse_Result
   is
      Result : Notification_Label_Parse_Result;
   begin
      for Last in reverse Text'Range loop
         Result := Parse_Delivery_Label
           (Text (Text'First .. Last), Channel, State);
         if Result.Status = Humanize.Status.Ok then
            return Result;
         end if;
      end loop;
      Result.Surface := Humanize.Domain_Details.Notifications_Surface;
      Result.Metadata := Delivery_State_Metadata (State);
      Result.Status := Humanize.Status.Invalid_Argument;
      Result.Consumed := 0;
      return Result;
   end Scan_Delivery_Label;

   function Delivery_Time_Label
     (State     : Delivery_State;
      Time_Text : String)
      return Humanize.Status.Text_Result
   is
      Time_Label : constant String := Clean (Time_Text);
   begin
      if Time_Label'Length = 0 then
         return Invalid_Text ("invalid delivery time");
      else
         return Ok_Text (Delivery_State_Suffix (State) & " " & Time_Label);
      end if;
   end Delivery_Time_Label;

   function Actor_Event_Label
     (Actor : String;
      Event : Notification_Event)
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Actor);
   begin
      if Name'Length = 0 then
         return Invalid_Text ("invalid notification actor");
      else
         return Ok_Text (Name & " " & Event_Verb (Event));
      end if;
   end Actor_Event_Label;

   function Muted_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Source : constant String := Clean (Name);
   begin
      if Source'Length = 0 then
         return Ok_Text ("notifications muted");
      else
         return Ok_Text (Source & " notifications muted");
      end if;
   end Muted_Label;

   function Snoozed_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Source : constant String := Clean (Name);
   begin
      if Source'Length = 0 then
         return Ok_Text ("notifications snoozed");
      else
         return Ok_Text (Source & " notifications snoozed");
      end if;
   end Snoozed_Label;

   function Digest_Label
     (Count : Natural;
      Name  : String := "")
      return Humanize.Status.Text_Result
   is
      Digest : constant String := Clean (Name);
      Counted : constant String :=
        Count_Or_No_Text (Count, "notification", "notifications");
   begin
      if Digest'Length = 0 then
         return Ok_Text ("digest: " & Counted);
      else
         return Ok_Text (Digest & " digest: " & Counted);
      end if;
   end Digest_Label;

   function Suppressed_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Count_Or_No_Text (Count, "notification", "notifications") & " suppressed");
   end Suppressed_Label;

   function Delivery_Attempt_Label
     (Attempt      : Positive;
      Max_Attempts : Positive)
      return Humanize.Status.Text_Result
   is
   begin
      if Attempt > Max_Attempts then
         return Invalid_Text ("invalid delivery attempt");
      else
         return Ok_Text
           ("delivery attempt " & Image (Attempt) & " of " & Image (Max_Attempts));
      end if;
   end Delivery_Attempt_Label;

   function Notification_Group_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result
   is
      Group : constant String := Clean (Name);
      Counted : constant String :=
        Count_Or_No_Text (Count, "notification", "notifications");
   begin
      if Group'Length = 0 then
         return Invalid_Text ("invalid notification group");
      else
         return Ok_Text (Group & ": " & Counted);
      end if;
   end Notification_Group_Label;

   function Mark_Read_Label
     (Count : Natural := 1)
      return Humanize.Status.Text_Result
   is
   begin
      if Count = 1 then
         return Ok_Text ("mark notification as read");
      else
         return Ok_Text ("mark " & Image (Count) & " notifications as read");
      end if;
   end Mark_Read_Label;

   function Mark_Unread_Label
     (Count : Natural := 1)
      return Humanize.Status.Text_Result
   is
   begin
      if Count = 1 then
         return Ok_Text ("mark notification as unread");
      else
         return Ok_Text ("mark " & Image (Count) & " notifications as unread");
      end if;
   end Mark_Unread_Label;

   procedure Notification_Channel_Label_Into
     (Channel : Notification_Channel;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Notification_Channel_Label (Channel), Target, Written, Status);
   end Notification_Channel_Label_Into;

   procedure Notification_State_Label_Into
     (State   : Notification_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Notification_State_Label (State), Target, Written, Status);
   end Notification_State_Label_Into;

   procedure Delivery_State_Label_Into
     (State   : Delivery_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Delivery_State_Label (State), Target, Written, Status);
   end Delivery_State_Label_Into;

   procedure Notification_Event_Label_Into
     (Event   : Notification_Event;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Notification_Event_Label (Event), Target, Written, Status);
   end Notification_Event_Label_Into;

   procedure New_Event_Label_Into
     (Event   : Notification_Event;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (New_Event_Label (Event), Target, Written, Status);
   end New_Event_Label_Into;

   procedure Event_Count_Label_Into
     (Event   : Notification_Event;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Event_Count_Label (Event, Count), Target, Written, Status);
   end Event_Count_Label_Into;

   procedure Notification_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Notification_Count_Label (Count), Target, Written, Status);
   end Notification_Count_Label_Into;

   procedure Unread_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Unread_Label (Count), Target, Written, Status);
   end Unread_Label_Into;

   procedure Inbox_Label_Into
     (Unread  : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Inbox_Label (Unread, Total), Target, Written, Status);
   end Inbox_Label_Into;

   procedure Notification_Label_Into
     (Subject : String;
      Event   : Notification_Event;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Notification_State := Unread_State)
   is
   begin
      Copy_Result
        (Notification_Label (Subject, Event, State), Target, Written, Status);
   end Notification_Label_Into;

   procedure Notification_Label_Into
     (Subject : String;
      Event   : Notification_Event;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Notification_State;
      Options : Notification_Label_Options)
   is
   begin
      Copy_Result
        (Notification_Label (Subject, Event, State, Options),
         Target, Written, Status);
   end Notification_Label_Into;

   procedure Delivery_Label_Into
     (Channel : Notification_Channel;
      State   : Delivery_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Delivery_Label (Channel, State), Target, Written, Status);
   end Delivery_Label_Into;

   procedure Delivery_Label_Into
     (Channel : Notification_Channel;
      State   : Delivery_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Notification_Label_Options)
   is
   begin
      Copy_Result
        (Delivery_Label (Channel, State, Options), Target, Written, Status);
   end Delivery_Label_Into;

   procedure Delivery_Time_Label_Into
     (State     : Delivery_State;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Delivery_Time_Label (State, Time_Text), Target, Written, Status);
   end Delivery_Time_Label_Into;

   procedure Actor_Event_Label_Into
     (Actor   : String;
      Event   : Notification_Event;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Actor_Event_Label (Actor, Event), Target, Written, Status);
   end Actor_Event_Label_Into;

   procedure Muted_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Muted_Label (Name), Target, Written, Status);
   end Muted_Label_Into;

   procedure Snoozed_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Snoozed_Label (Name), Target, Written, Status);
   end Snoozed_Label_Into;

   procedure Digest_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Digest_Label (Count, Name), Target, Written, Status);
   end Digest_Label_Into;

   procedure Suppressed_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Suppressed_Label (Count), Target, Written, Status);
   end Suppressed_Label_Into;

   procedure Delivery_Attempt_Label_Into
     (Attempt      : Positive;
      Max_Attempts : Positive;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Delivery_Attempt_Label (Attempt, Max_Attempts), Target, Written, Status);
   end Delivery_Attempt_Label_Into;

   procedure Notification_Group_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Notification_Group_Label (Name, Count), Target, Written, Status);
   end Notification_Group_Label_Into;

   procedure Mark_Read_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 1)
   is
   begin
      Copy_Result (Mark_Read_Label (Count), Target, Written, Status);
   end Mark_Read_Label_Into;

   procedure Mark_Unread_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 1)
   is
   begin
      Copy_Result (Mark_Unread_Label (Count), Target, Written, Status);
   end Mark_Unread_Label_Into;

end Humanize.Notifications;
