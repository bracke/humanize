with Humanize.Domain_Details;
with Humanize.Status;

--  Deterministic labels for notification preferences and subscriptions.
package Humanize.Notification_Preferences is
   type Notification_Preference_Output_Mode is
     (Notification_Preference_Detailed,
      Notification_Preference_Compact,
      Notification_Preference_Accessible,
      Notification_Preference_Log);
   --  Output policy for notification preference labels.

   type Notification_Preference_Label_Options is record
      Mode             : Notification_Preference_Output_Mode :=
        Notification_Preference_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Notification preference label output options.

   Default_Notification_Preference_Label_Options :
     constant Notification_Preference_Label_Options :=
       (Mode             => Notification_Preference_Detailed,
        Include_Surface  => False,
        Include_Severity => False,
        Include_Tone     => False);

   subtype Notification_Preference_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;
   --  Parsed notification preference label metadata.

   type Preference_State is (Preference_Enabled, Preference_Disabled,
      Preference_Inherited, Preference_Required);
   --  Caller-supplied notification preference state.

   type Digest_Schedule is (No_Digest, Instant_Digest, Daily_Digest,
      Weekly_Digest);
   --  Caller-supplied digest schedule.

   type Alert_Level is (All_Alerts, Important_Alerts, Critical_Alerts_Only,
      No_Alerts);
   --  Caller-supplied alert level.

   type Subscription_Scope is (Thread_Subscription, Project_Subscription,
      Team_Subscription, Account_Subscription);
   --  Caller-supplied subscription scope.

   function Preference_State_Label (State : Preference_State) return Humanize.Status.Text_Result;
   --  @param State Notification preference state.
   --  @return Human-readable preference-state label.

   function Digest_Schedule_Label (Schedule : Digest_Schedule) return Humanize.Status.Text_Result;
   --  @param Schedule Digest schedule.
   --  @return Human-readable digest-schedule label.

   function Alert_Level_Label (Level : Alert_Level) return Humanize.Status.Text_Result;
   --  @param Level Alert level.
   --  @return Human-readable alert-level label.

   function Subscription_Scope_Label (Scope : Subscription_Scope) return Humanize.Status.Text_Result;
   --  @param Scope Subscription scope.
   --  @return Human-readable subscription-scope label.

   function Channel_Preference_Label (Channel : String; State : Preference_State) return Humanize.Status.Text_Result;
   --  @param Channel Notification channel label.
   --  @param State Notification preference state.
   --  @return Human-readable channel preference label.

   function Channel_Preference_Label
     (Channel : String;
      State   : Preference_State;
      Options : Notification_Preference_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Channel Notification channel label.
   --  @param State Notification preference state.
   --  @param Options Notification preference output policy.
   --  @return Human-readable channel preference label with optional metadata.

   function Quiet_Hours_Label (Time_Text : String) return Humanize.Status.Text_Result;
   --  @param Time_Text Caller-supplied quiet-hours time/range label.
   --  @return Human-readable quiet-hours label.

   function Subscription_Label
     (Name : String;
     Scope : Subscription_Scope;
     State : Preference_State)
      return Humanize.Status.Text_Result;
   --  @param Name Subscribed resource display name.
   --  @param Scope Subscription scope.
   --  @param State Notification preference state.
   --  @return Human-readable subscription label.

   function Subscription_Label
     (Name    : String;
      Scope   : Subscription_Scope;
      State   : Preference_State;
      Options : Notification_Preference_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Subscribed resource display name.
   --  @param Scope Subscription scope.
   --  @param State Notification preference state.
   --  @param Options Notification preference output policy.
   --  @return Human-readable subscription label with optional metadata.

   function Preference_State_Metadata
     (State : Preference_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Notification preference state.
   --  @return Stable metadata for State.

   function Parse_Channel_Preference_Label
     (Text  : String;
      State : Preference_State)
      return Notification_Preference_Label_Parse_Result;
   --  @param Text Channel preference label emitted by Channel_Preference_Label.
   --  @param State Expected preference state suffix.
   --  @return Parsed channel preference label spans and metadata.

   function Scan_Channel_Preference_Label
     (Text  : String;
      State : Preference_State)
      return Notification_Preference_Label_Parse_Result;
   --  @param Text Text beginning with a channel preference label.
   --  @param State Expected preference state suffix.
   --  @return Parsed channel preference label prefix spans and metadata.

   function Parse_Subscription_Label
     (Text  : String;
      Scope : Subscription_Scope;
      State : Preference_State)
      return Notification_Preference_Label_Parse_Result;
   --  @param Text Subscription label emitted by Subscription_Label.
   --  @param Scope Expected subscription scope.
   --  @param State Expected preference state suffix.
   --  @return Parsed subscription label spans and metadata.

   function Scan_Subscription_Label
     (Text  : String;
      Scope : Subscription_Scope;
      State : Preference_State)
      return Notification_Preference_Label_Parse_Result;
   --  @param Text Text beginning with a subscription label.
   --  @param Scope Expected subscription scope.
   --  @param State Expected preference state suffix.
   --  @return Parsed subscription label prefix spans and metadata.

   procedure Preference_State_Label_Into
     (State : Preference_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Notification preference state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Digest_Schedule_Label_Into
     (Schedule : Digest_Schedule;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Schedule Digest schedule.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Alert_Level_Label_Into
     (Level : Alert_Level;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Level Alert level.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Subscription_Scope_Label_Into
     (Scope : Subscription_Scope;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Scope Subscription scope.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Channel_Preference_Label_Into
     (Channel : String;
     State : Preference_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Channel Notification channel label.
   --  @param State Notification preference state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Channel_Preference_Label_Into
     (Channel : String;
      State   : Preference_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Notification_Preference_Label_Options);
   --  @param Channel Notification channel label.
   --  @param State Notification preference state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Notification preference output policy.

   procedure Quiet_Hours_Label_Into
     (Time_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Time_Text Caller-supplied quiet-hours time/range label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Subscription_Label_Into
     (Name : String;
     Scope : Subscription_Scope;
     State : Preference_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Name Subscribed resource display name.
   --  @param Scope Subscription scope.
   --  @param State Notification preference state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Notification_Preferences;
