with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Notification_Preferences.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Alert_Level_Label
      (Context : Humanize.Contexts.Context;
       Level   : Alert_Level)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notification_Preferences.Alert_Level_Label (Level => Level);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notification_preferences.alert_level_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "level", Lower (Alert_Level'Image (Level)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Alert_Level_Label;

   function Channel_Preference_Label
      (Context : Humanize.Contexts.Context;
       Channel : String;
       State   : Preference_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notification_Preferences.Channel_Preference_Label (Channel => Channel, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notification_preferences.channel_preference_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Preference_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "channel", Humanize.Bounded_Text.Clean (Channel));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Channel_Preference_Label;

   function Channel_Preference_Label
      (Context : Humanize.Contexts.Context;
       Channel : String;
       State   : Preference_State;
       Options : Notification_Preference_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notification_Preferences.Channel_Preference_Label
          (Channel => Channel,
           State => State,
           Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Notification_Preferences.Channel_Preference_Label (Channel => Channel, State => State);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Channel_Preference_Label (Context, Channel =>
        Channel, State => State));
   end Channel_Preference_Label;

   function Digest_Schedule_Label
      (Context  : Humanize.Contexts.Context;
       Schedule : Digest_Schedule)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notification_Preferences.Digest_Schedule_Label (Schedule => Schedule);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notification_preferences.digest_schedule_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "schedule", Lower (Digest_Schedule'Image (Schedule)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Digest_Schedule_Label;

   function Preference_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Preference_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notification_Preferences.Preference_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notification_preferences.preference_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Preference_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Preference_State_Label;

   function Quiet_Hours_Label
      (Context   : Humanize.Contexts.Context;
       Time_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notification_Preferences.Quiet_Hours_Label (Time_Text => Time_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notification_preferences.quiet_hours_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "time_text", Humanize.Bounded_Text.Clean (Time_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Quiet_Hours_Label;

   function Subscription_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Scope   : Subscription_Scope;
       State   : Preference_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notification_Preferences.Subscription_Label (Name => Name, Scope => Scope, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notification_preferences.subscription_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Preference_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "scope", Lower (Subscription_Scope'Image (Scope)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Subscription_Label;

   function Subscription_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Scope   : Subscription_Scope;
       State   : Preference_State;
       Options : Notification_Preference_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notification_Preferences.Subscription_Label
          (Name => Name,
           Scope => Scope,
           State => State,
           Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Notification_Preferences.Subscription_Label (Name => Name, Scope => Scope, State => State);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Subscription_Label (Context, Name => Name, Scope
        => Scope, State => State));
   end Subscription_Label;

   function Subscription_Scope_Label
      (Context : Humanize.Contexts.Context;
       Scope   : Subscription_Scope)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Notification_Preferences.Subscription_Scope_Label (Scope => Scope);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.notification_preferences.subscription_scope_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "scope", Lower (Subscription_Scope'Image (Scope)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Subscription_Scope_Label;

   procedure Alert_Level_Label_Into
      (Context : Humanize.Contexts.Context;
       Level   : Alert_Level;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Alert_Level_Label (Context, Level => Level), Target, Written, Status);
   end Alert_Level_Label_Into;

   procedure Channel_Preference_Label_Into
      (Context : Humanize.Contexts.Context;
       Channel : String;
       State   : Preference_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Channel_Preference_Label (Context, Channel => Channel, State => State),
         Target, Written, Status);
   end Channel_Preference_Label_Into;

   procedure Channel_Preference_Label_Into
      (Context : Humanize.Contexts.Context;
       Channel : String;
       State   : Preference_State;
       Options : Notification_Preference_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Channel_Preference_Label (Context, Channel => Channel, State => State, Options => Options),
         Target, Written, Status);
   end Channel_Preference_Label_Into;

   procedure Digest_Schedule_Label_Into
      (Context  : Humanize.Contexts.Context;
       Schedule : Digest_Schedule;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Digest_Schedule_Label (Context, Schedule => Schedule),
         Target, Written, Status);
   end Digest_Schedule_Label_Into;

   procedure Preference_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Preference_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Preference_State_Label (Context, State => State), Target, Written, Status);
   end Preference_State_Label_Into;

   procedure Quiet_Hours_Label_Into
      (Context   : Humanize.Contexts.Context;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Quiet_Hours_Label (Context, Time_Text => Time_Text), Target, Written, Status);
   end Quiet_Hours_Label_Into;

   procedure Subscription_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Scope   : Subscription_Scope;
       State   : Preference_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Subscription_Label (Context, Name => Name, Scope => Scope, State => State),
         Target, Written, Status);
   end Subscription_Label_Into;

   procedure Subscription_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Scope   : Subscription_Scope;
       State   : Preference_State;
       Options : Notification_Preference_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Subscription_Label (Context, Name => Name, Scope => Scope, State => State, Options => Options),
         Target, Written, Status);
   end Subscription_Label_Into;

   procedure Subscription_Scope_Label_Into
      (Context : Humanize.Contexts.Context;
       Scope   : Subscription_Scope;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Subscription_Scope_Label (Context, Scope => Scope), Target, Written, Status);
   end Subscription_Scope_Label_Into;

end Humanize.Notification_Preferences.Localized;
