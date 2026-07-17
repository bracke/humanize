with Humanize.Bounded_Text;

package body Humanize.Notification_Preferences is
   use type Humanize.Status.Status_Code;
   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;
   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;
   function Nonempty
     (Text, Message : String)
      return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Nonempty_Text;
   function Pref_Text (State : Preference_State) return String is
   begin
      case State is
         when Preference_Enabled => return "enabled";
         when Preference_Disabled => return "disabled";
         when Preference_Inherited => return "inherited";
         when Preference_Required => return "required";
      end case;
   end Pref_Text;
   function Digest_Text (Schedule : Digest_Schedule) return String is
   begin
      case Schedule is
         when No_Digest => return "no digest";
         when Instant_Digest => return "instant digest";
         when Daily_Digest => return "daily digest";
         when Weekly_Digest => return "weekly digest";
      end case;
   end Digest_Text;
   function Alert_Text (Level : Alert_Level) return String is
   begin
      case Level is
         when All_Alerts => return "all alerts";
         when Important_Alerts => return "important alerts";
         when Critical_Alerts_Only => return "critical alerts only";
         when No_Alerts => return "no alerts";
      end case;
   end Alert_Text;
   function Scope_Text (Scope : Subscription_Scope) return String is
   begin
      case Scope is
         when Thread_Subscription => return "thread subscription";
         when Project_Subscription => return "project subscription";
         when Team_Subscription => return "team subscription";
         when Account_Subscription => return "account subscription";
      end case;
   end Scope_Text;
   function Preference_State_Label
     (State : Preference_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Pref_Text (State));
   end Preference_State_Label;
   function Digest_Schedule_Label
     (Schedule : Digest_Schedule)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Digest_Text (Schedule));
   end Digest_Schedule_Label;
   function Alert_Level_Label
     (Level : Alert_Level)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Alert_Text (Level));
   end Alert_Level_Label;
   function Subscription_Scope_Label
     (Scope : Subscription_Scope)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Scope_Text (Scope));
   end Subscription_Scope_Label;
   function Domain_Options
     (Options : Notification_Preference_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Notification_Preference_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Notification_Preference_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Notification_Preference_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Notification_Preference_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Label_Text
     (Label  : Humanize.Status.Text_Result;
      Prefix : String := "";
      Suffix : String := "")
      return String
      renames Humanize.Bounded_Text.Result_Label_Text;

   function Preference_State_Suffix
     (State : Preference_State)
      return String
   is
   begin
      return Pref_Text (State);
   end Preference_State_Suffix;

   function Preference_State_Metadata
     (State : Preference_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Notification_Preferences_Surface,
         Preference_State_Suffix (State));
   end Preference_State_Metadata;

   function Channel_Preference_Suffix
     (State : Preference_State)
      return String
   is
   begin
      return "notifications " & Preference_State_Suffix (State);
   end Channel_Preference_Suffix;

   function Subscription_Suffix
     (Scope : Subscription_Scope;
      State : Preference_State)
      return String
   is
   begin
      return Scope_Text (Scope) & " " & Preference_State_Suffix (State);
   end Subscription_Suffix;

   function Channel_Preference_Label
     (Channel : String;
     State : Preference_State)
      return Humanize.Status.Text_Result
   is
      C : constant Humanize.Status.Text_Result := Nonempty (Channel, "invalid notification channel");
   begin
      if C.Status /= Humanize.Status.Ok then
         return C;
      else
         return Ok_Text (Label_Text
              (C, Suffix => " " & Channel_Preference_Suffix (State)));
      end if;
   end Channel_Preference_Label;
   function Channel_Preference_Label
     (Channel : String;
      State   : Preference_State;
      Options : Notification_Preference_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Channel_Preference_Label (Channel, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Preference_State_Metadata (State), Domain_Options (Options));
   end Channel_Preference_Label;

   function Quiet_Hours_Label
     (Time_Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Label_Text
        (Time_Text, "invalid quiet hours", Prefix => "quiet hours ");
   end Quiet_Hours_Label;
   function Subscription_Label
     (Name : String;
     Scope : Subscription_Scope;
     State : Preference_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Label_Text
        (Name,
         "invalid subscription name",
         Suffix => " " & Subscription_Suffix (Scope, State));
   end Subscription_Label;
   function Subscription_Label
     (Name    : String;
      Scope   : Subscription_Scope;
      State   : Preference_State;
      Options : Notification_Preference_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Subscription_Label (Name, Scope, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Preference_State_Metadata (State), Domain_Options (Options));
   end Subscription_Label;

   function Parse_Channel_Preference_Label
     (Text  : String;
      State : Preference_State)
      return Notification_Preference_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Notification_Preferences_Surface,
         Channel_Preference_Suffix (State));
   end Parse_Channel_Preference_Label;

   function Scan_Channel_Preference_Label
     (Text  : String;
      State : Preference_State)
      return Notification_Preference_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Notification_Preferences_Surface,
         Channel_Preference_Suffix (State));
   end Scan_Channel_Preference_Label;

   function Parse_Subscription_Label
     (Text  : String;
      Scope : Subscription_Scope;
      State : Preference_State)
      return Notification_Preference_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Notification_Preferences_Surface,
         Subscription_Suffix (Scope, State));
   end Parse_Subscription_Label;

   function Scan_Subscription_Label
     (Text  : String;
      Scope : Subscription_Scope;
      State : Preference_State)
      return Notification_Preference_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Notification_Preferences_Surface,
         Subscription_Suffix (Scope, State));
   end Scan_Subscription_Label;

   procedure Preference_State_Label_Into
     (State : Preference_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Preference_State_Label (State), Target, Written, Status);
   end Preference_State_Label_Into;
   procedure Digest_Schedule_Label_Into
     (Schedule : Digest_Schedule;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Digest_Schedule_Label (Schedule), Target, Written, Status);
   end Digest_Schedule_Label_Into;
   procedure Alert_Level_Label_Into
     (Level : Alert_Level;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Alert_Level_Label (Level), Target, Written, Status);
   end Alert_Level_Label_Into;
   procedure Subscription_Scope_Label_Into
     (Scope : Subscription_Scope;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Subscription_Scope_Label (Scope), Target, Written, Status);
   end Subscription_Scope_Label_Into;
   procedure Channel_Preference_Label_Into
     (Channel : String;
     State : Preference_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Channel_Preference_Label (Channel, State), Target, Written, Status);
   end Channel_Preference_Label_Into;
   procedure Channel_Preference_Label_Into
     (Channel : String;
      State   : Preference_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Notification_Preference_Label_Options)
   is
   begin
      Copy_Result
        (Channel_Preference_Label (Channel, State, Options),
         Target, Written, Status);
   end Channel_Preference_Label_Into;

   procedure Quiet_Hours_Label_Into
     (Time_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Quiet_Hours_Label (Time_Text), Target, Written, Status);
   end Quiet_Hours_Label_Into;
   procedure Subscription_Label_Into
     (Name : String;
     Scope : Subscription_Scope;
     State : Preference_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Subscription_Label (Name, Scope, State), Target, Written, Status);
   end Subscription_Label_Into;
end Humanize.Notification_Preferences;
