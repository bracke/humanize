with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Notifications.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Actor_Event_Label
      (Context : Humanize.Contexts.Context;
       Actor   : String;
       Event   : Notification_Event)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Actor_Event_Label (Actor => Actor, Event => Event);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.actor_event_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "actor", Humanize.Bounded_Text.Clean (Actor));
      Selection := Sel.With_Arg (Selection, "event", Lower (Notification_Event'Image (Event)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Actor_Event_Label;

   function Delivery_Label
      (Context : Humanize.Contexts.Context;
       Channel : Notification_Channel;
       State   : Delivery_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Delivery_Label (Channel => Channel, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.delivery_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "channel", Lower (Notification_Channel'Image (Channel)));
      Selection := Sel.With_Arg (Selection, "state", Lower (Delivery_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Delivery_Label;

   function Delivery_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Delivery_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Delivery_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.delivery_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Delivery_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Delivery_State_Label;

   function Delivery_Time_Label
      (Context   : Humanize.Contexts.Context;
       State     : Delivery_State;
       Time_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Delivery_Time_Label (State => State, Time_Text => Time_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.delivery_time_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Delivery_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "time_text", Humanize.Bounded_Text.Clean (Time_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Delivery_Time_Label;

   function Digest_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Digest_Label (Count => Count, Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.digest_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Digest_Label;

   function Event_Count_Label
      (Context : Humanize.Contexts.Context;
       Event   : Notification_Event;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Event_Count_Label (Event => Event, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.event_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "event", Lower (Notification_Event'Image (Event)));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Event_Count_Label;

   function Mark_Read_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Mark_Read_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.mark_read_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Mark_Read_Label;

   function Mark_Unread_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Mark_Unread_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.mark_unread_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Mark_Unread_Label;

   function Muted_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Muted_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.muted_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Muted_Label;

   function New_Event_Label
      (Context : Humanize.Contexts.Context;
       Event   : Notification_Event)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.New_Event_Label (Event => Event);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.new_event_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "event", Lower (Notification_Event'Image (Event)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end New_Event_Label;

   function Notification_Channel_Label
      (Context : Humanize.Contexts.Context;
       Channel : Notification_Channel)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Notification_Channel_Label (Channel => Channel);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.notification_channel_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "channel", Lower (Notification_Channel'Image (Channel)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Notification_Channel_Label;

   function Notification_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Notification_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.notification_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Notification_Count_Label;

   function Notification_Event_Label
      (Context : Humanize.Contexts.Context;
       Event   : Notification_Event)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Notification_Event_Label (Event => Event);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.notification_event_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "event", Lower (Notification_Event'Image (Event)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Notification_Event_Label;

   function Notification_Group_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Notification_Group_Label (Name => Name, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.notification_group_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Notification_Group_Label;

   function Notification_Label
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Event   : Notification_Event;
       State   : Notification_State := Unread_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Notification_Label (Subject => Subject, Event => Event, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.notification_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "subject", Humanize.Bounded_Text.Clean (Subject));
      Selection := Sel.With_Arg (Selection, "event", Lower (Notification_Event'Image (Event)));
      Selection := Sel.With_Arg (Selection, "state", Lower (Notification_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Notification_Label;

   function Notification_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Notification_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Notification_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.notification_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Notification_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Notification_State_Label;

   function Snoozed_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Snoozed_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.snoozed_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Snoozed_Label;

   function Suppressed_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Suppressed_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.suppressed_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Suppressed_Label;

   function Unread_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notifications.Unread_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notifications.unread_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Unread_Label;

   procedure Actor_Event_Label_Into
      (Context : Humanize.Contexts.Context;
       Actor   : String;
       Event   : Notification_Event;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Actor_Event_Label (Context, Actor, Event), Target, Written, Status);
   end Actor_Event_Label_Into;

   procedure Delivery_Label_Into
      (Context : Humanize.Contexts.Context;
       Channel : Notification_Channel;
       State   : Delivery_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Delivery_Label (Context, Channel, State), Target, Written, Status);
   end Delivery_Label_Into;

   procedure Delivery_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Delivery_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Delivery_State_Label (Context, State), Target, Written, Status);
   end Delivery_State_Label_Into;

   procedure Delivery_Time_Label_Into
      (Context   : Humanize.Contexts.Context;
       State     : Delivery_State;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Delivery_Time_Label (Context, State, Time_Text), Target, Written, Status);
   end Delivery_Time_Label_Into;

   procedure Digest_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Digest_Label (Context, Count, Name), Target, Written, Status);
   end Digest_Label_Into;

   procedure Event_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Event   : Notification_Event;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Event_Count_Label (Context, Event, Count), Target, Written, Status);
   end Event_Count_Label_Into;

   procedure Mark_Read_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Mark_Read_Label (Context, Count), Target, Written, Status);
   end Mark_Read_Label_Into;

   procedure Mark_Unread_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 1;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Mark_Unread_Label (Context, Count), Target, Written, Status);
   end Mark_Unread_Label_Into;

   procedure Muted_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Muted_Label (Context, Name), Target, Written, Status);
   end Muted_Label_Into;

   procedure New_Event_Label_Into
      (Context : Humanize.Contexts.Context;
       Event   : Notification_Event;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (New_Event_Label (Context, Event), Target, Written, Status);
   end New_Event_Label_Into;

   procedure Notification_Channel_Label_Into
      (Context : Humanize.Contexts.Context;
       Channel : Notification_Channel;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Notification_Channel_Label (Context, Channel), Target, Written, Status);
   end Notification_Channel_Label_Into;

   procedure Notification_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Notification_Count_Label (Context, Count), Target, Written, Status);
   end Notification_Count_Label_Into;

   procedure Notification_Event_Label_Into
      (Context : Humanize.Contexts.Context;
       Event   : Notification_Event;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Notification_Event_Label (Context, Event), Target, Written, Status);
   end Notification_Event_Label_Into;

   procedure Notification_Group_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Notification_Group_Label (Context, Name, Count), Target, Written, Status);
   end Notification_Group_Label_Into;

   procedure Notification_Label_Into
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Event   : Notification_Event;
       State   : Notification_State := Unread_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Notification_Label (Context, Subject, Event, State), Target, Written, Status);
   end Notification_Label_Into;

   procedure Notification_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Notification_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Notification_State_Label (Context, State), Target, Written, Status);
   end Notification_State_Label_Into;

   procedure Snoozed_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Snoozed_Label (Context, Name), Target, Written, Status);
   end Snoozed_Label_Into;

   procedure Suppressed_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Suppressed_Label (Context, Count), Target, Written, Status);
   end Suppressed_Label_Into;

   procedure Unread_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Unread_Label (Context, Count), Target, Written, Status);
   end Unread_Label_Into;

end Humanize.Notifications.Localized;
