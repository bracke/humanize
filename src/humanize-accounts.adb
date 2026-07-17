with Humanize.Bounded_Text;

package body Humanize.Accounts is
   use type Humanize.Status.Status_Code;
   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;
   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;
   function Account_Text (State : Account_State) return String is
   begin
      case State is
         when Active_Account => return "active account";
         when Invited_Account => return "invited account";
         when Locked_Account => return "locked account";
         when Suspended_Account => return "suspended account";
         when Deleted_Account => return "deleted account";
         when Unknown_Account => return "unknown account state";
      end case;
   end Account_Text;
   function Session_Text (State : Session_State) return String is
   begin
      case State is
         when Active_Session => return "active session";
         when Expired_Session => return "session expired";
         when Revoked_Session => return "session revoked";
         when Idle_Session => return "idle session";
         when Unknown_Session => return "unknown session state";
      end case;
   end Session_Text;
   function MFA_Text (State : MFA_State) return String is
   begin
      case State is
         when MFA_Enabled => return "MFA enabled";
         when MFA_Disabled => return "MFA disabled";
         when MFA_Required => return "MFA required";
         when MFA_Reset_Required => return "MFA reset required";
      end case;
   end MFA_Text;
   function Device_Text (State : Device_Trust_State) return String is
   begin
      case State is
         when Trusted_Device => return "trusted device";
         when Untrusted_Device => return "untrusted device";
         when New_Device => return "new device";
         when Blocked_Device => return "blocked device";
      end case;
   end Device_Text;
   function Account_State_Label
     (State : Account_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Account_Text (State));
   end Account_State_Label;
   function Session_State_Label
     (State : Session_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Session_Text (State));
   end Session_State_Label;
   function MFA_State_Label
     (State : MFA_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (MFA_Text (State));
   end MFA_State_Label;
   function Device_Trust_Label
     (State : Device_Trust_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Device_Text (State));
   end Device_Trust_Label;
   function Domain_Options
     (Options : Account_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Account_Detailed => Humanize.Domain_Details.Detailed_Output,
              when Account_Compact => Humanize.Domain_Details.Compact_Output,
              when Account_Accessible => Humanize.Domain_Details.Accessible_Output,
              when Account_Log => Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Account_Label_Suffix
     (State : Account_State)
      return String
   is
   begin
      return Account_Text (State);
   end Account_Label_Suffix;

   function Session_Label_Suffix
     (State : Session_State)
      return String
   is
   begin
      return Session_Text (State);
   end Session_Label_Suffix;

   function Account_State_Metadata
     (State : Account_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Accounts_Surface, Account_Label_Suffix (State));
   end Account_State_Metadata;

   function Session_State_Metadata
     (State : Session_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Accounts_Surface, Session_Label_Suffix (State));
   end Session_State_Metadata;

   function Named (Name, Suffix, Message : String) return Humanize.Status.Text_Result is
   begin
      return Humanize.Bounded_Text.Nonempty_Label_Text
        (Name, Message, Suffix => " " & Suffix);
   end Named;
   function Account_Label
     (Name : String;
     State : Account_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Named (Name, Account_Label_Suffix (State), "invalid account name");
   end Account_Label;
   function Account_Label
     (Name    : String;
      State   : Account_State;
      Options : Account_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Account_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Account_State_Metadata (State), Domain_Options (Options));
   end Account_Label;

   function Session_Label
     (Name : String;
     State : Session_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Named (Name, Session_Label_Suffix (State), "invalid session name");
   end Session_Label;
   function Session_Label
     (Name    : String;
      State   : Session_State;
      Options : Account_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Session_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Session_State_Metadata (State), Domain_Options (Options));
   end Session_Label;

   function Parse_Account_Label
     (Text : String;
      State : Account_State)
      return Account_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Accounts_Surface,
         Account_Label_Suffix (State));
   end Parse_Account_Label;

   function Scan_Account_Label
     (Text : String;
      State : Account_State)
      return Account_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Accounts_Surface,
         Account_Label_Suffix (State));
   end Scan_Account_Label;

   function Parse_Session_Label
     (Text : String;
      State : Session_State)
      return Account_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Accounts_Surface,
         Session_Label_Suffix (State));
   end Parse_Session_Label;

   function Scan_Session_Label
     (Text : String;
      State : Session_State)
      return Account_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Accounts_Surface,
         Session_Label_Suffix (State));
   end Scan_Session_Label;

   function Last_Active_Label (Name : String; Time_Text : String) return Humanize.Status.Text_Result is
   begin
      return Humanize.Bounded_Text.Nonempty_Detail_Text
        (Name,
         "invalid account name",
         " last active ",
         Time_Text,
         "invalid active time");
   end Last_Active_Label;
   function Login_Attempt_Label (Name : String; Succeeded : Boolean) return Humanize.Status.Text_Result is
   begin
      return Named (Name, (if Succeeded then "login succeeded" else "login failed"), "invalid account name");
   end Login_Attempt_Label;
   procedure Account_State_Label_Into
     (State : Account_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Account_State_Label (State), Target, Written, Status);
   end Account_State_Label_Into;
   procedure Session_State_Label_Into
     (State : Session_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Session_State_Label (State), Target, Written, Status);
   end Session_State_Label_Into;
   procedure MFA_State_Label_Into
     (State : MFA_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (MFA_State_Label (State), Target, Written, Status);
   end MFA_State_Label_Into;
   procedure Device_Trust_Label_Into
     (State : Device_Trust_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Device_Trust_Label (State), Target, Written, Status);
   end Device_Trust_Label_Into;
   procedure Account_Label_Into
     (Name : String;
     State : Account_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Account_Label (Name, State), Target, Written, Status);
   end Account_Label_Into;
   procedure Account_Label_Into
     (Name    : String;
      State   : Account_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Account_Label_Options)
   is
   begin
      Copy_Result (Account_Label (Name, State, Options), Target, Written, Status);
   end Account_Label_Into;
   procedure Session_Label_Into
     (Name : String;
     State : Session_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Session_Label (Name, State), Target, Written, Status);
   end Session_Label_Into;
   procedure Last_Active_Label_Into
     (Name : String;
     Time_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Last_Active_Label (Name, Time_Text), Target, Written, Status);
   end Last_Active_Label_Into;
   procedure Login_Attempt_Label_Into
     (Name : String;
     Succeeded : Boolean;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Login_Attempt_Label (Name, Succeeded), Target, Written, Status);
   end Login_Attempt_Label_Into;
end Humanize.Accounts;
