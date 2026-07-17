with Humanize.Status;
with Humanize.Domain_Details;

--  Deterministic labels for accounts, sessions, MFA, and trusted devices.
package Humanize.Accounts is
   type Account_Output_Mode is (Account_Detailed, Account_Compact,
      Account_Accessible, Account_Log);
   --  Output policy for account and session labels.

   type Account_Label_Options is record
      Mode             : Account_Output_Mode := Account_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Account label output options.

   Default_Account_Label_Options : constant Account_Label_Options :=
     (Mode             => Account_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Account_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;
   --  Parsed account/session label metadata.

   type Account_State is (Active_Account, Invited_Account, Locked_Account,
      Suspended_Account, Deleted_Account, Unknown_Account);
   --  Caller-supplied account state.

   type Session_State is (Active_Session, Expired_Session, Revoked_Session,
      Idle_Session, Unknown_Session);
   --  Caller-supplied session state.

   type MFA_State is (MFA_Enabled, MFA_Disabled, MFA_Required, MFA_Reset_Required);
   --  Caller-supplied multi-factor authentication state.

   type Device_Trust_State is (Trusted_Device, Untrusted_Device, New_Device,
      Blocked_Device);
   --  Caller-supplied device trust state.

   function Account_State_Label (State : Account_State) return Humanize.Status.Text_Result;
   --  @param State Account state.
   --  @return Human-readable account-state label.

   function Session_State_Label (State : Session_State) return Humanize.Status.Text_Result;
   --  @param State Session state.
   --  @return Human-readable session-state label.

   function MFA_State_Label (State : MFA_State) return Humanize.Status.Text_Result;
   --  @param State Multi-factor authentication state.
   --  @return Human-readable MFA-state label.

   function Device_Trust_Label (State : Device_Trust_State) return Humanize.Status.Text_Result;
   --  @param State Device trust state.
   --  @return Human-readable device-trust label.

   function Account_Label (Name : String; State : Account_State) return Humanize.Status.Text_Result;
   --  @param Name Account display name.
   --  @param State Account state.
   --  @return Human-readable account label.

   function Account_Label
     (Name    : String;
      State   : Account_State;
      Options : Account_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Account display name.
   --  @param State Account state.
   --  @param Options Account output policy.
   --  @return Human-readable account label with optional metadata.

   function Session_Label (Name : String; State : Session_State) return Humanize.Status.Text_Result;
   --  @param Name Session or device display name.
   --  @param State Session state.
   --  @return Human-readable session label.

   function Session_Label
     (Name    : String;
      State   : Session_State;
      Options : Account_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Session or device display name.
   --  @param State Session state.
   --  @param Options Account output policy.
   --  @return Human-readable session label with optional metadata.

   function Account_State_Metadata
     (State : Account_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Account state.
   --  @return Stable metadata for State.

   function Session_State_Metadata
     (State : Session_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Session state.
   --  @return Stable metadata for State.

   function Parse_Account_Label
     (Text : String;
      State : Account_State)
      return Account_Label_Parse_Result;
   --  @param Text Account label emitted by Account_Label.
   --  @param State Expected account state suffix.
   --  @return Parsed account label spans and metadata.

   function Scan_Account_Label
     (Text : String;
      State : Account_State)
      return Account_Label_Parse_Result;
   --  @param Text Text beginning with an account label.
   --  @param State Expected account state suffix.
   --  @return Parsed account label prefix spans and metadata.

   function Parse_Session_Label
     (Text : String;
      State : Session_State)
      return Account_Label_Parse_Result;
   --  @param Text Session label emitted by Session_Label.
   --  @param State Expected session state suffix.
   --  @return Parsed session label spans and metadata.

   function Scan_Session_Label
     (Text : String;
      State : Session_State)
      return Account_Label_Parse_Result;
   --  @param Text Text beginning with a session label.
   --  @param State Expected session state suffix.
   --  @return Parsed session label prefix spans and metadata.

   function Last_Active_Label (Name : String; Time_Text : String) return Humanize.Status.Text_Result;
   --  @param Name Account display name.
   --  @param Time_Text Caller-supplied time/distance label.
   --  @return Human-readable last-active label.

   function Login_Attempt_Label (Name : String; Succeeded : Boolean) return Humanize.Status.Text_Result;
   --  @param Name Account display name.
   --  @param Succeeded Whether the login attempt succeeded.
   --  @return Human-readable login-attempt label.

   procedure Account_State_Label_Into
     (State : Account_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Account state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Session_State_Label_Into
     (State : Session_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Session state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure MFA_State_Label_Into
     (State : MFA_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Multi-factor authentication state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Device_Trust_Label_Into
     (State : Device_Trust_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Device trust state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Account_Label_Into
     (Name : String;
     State : Account_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Name Account display name.
   --  @param State Account state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Account_Label_Into
     (Name    : String;
      State   : Account_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Account_Label_Options);
   --  @param Name Account display name.
   --  @param State Account state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Account output policy.

   procedure Session_Label_Into
     (Name : String;
     State : Session_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Name Session or device display name.
   --  @param State Session state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Last_Active_Label_Into
     (Name : String;
     Time_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Name Account display name.
   --  @param Time_Text Caller-supplied time/distance label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Login_Attempt_Label_Into
     (Name : String;
     Succeeded : Boolean;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Name Account display name.
   --  @param Succeeded Whether the login attempt succeeded.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Accounts;
