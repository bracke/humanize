with Humanize.Status;
with Humanize.Domain_Details;

--  Deterministic labels for roles, permissions, policy results, and access grants.
package Humanize.Permissions is
   type Permission_Output_Mode is
     (Permission_Detailed,
      Permission_Compact,
      Permission_Accessible,
      Permission_Log);
   --  Output policy for permission labels.

   type Permission_Label_Options is record
      Mode             : Permission_Output_Mode := Permission_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Permission label output options.

   Default_Permission_Label_Options : constant Permission_Label_Options :=
     (Mode             => Permission_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Permission_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;
   --  Parsed permission label metadata.

   type Role_Kind is (Owner_Role, Admin_Role, Editor_Role, Viewer_Role,
      Custom_Role);
   --  Caller-supplied role kind.

   type Permission_State is (Granted, Denied, Inherited, Temporary,
      Expired, Requires_Approval);
   --  Caller-supplied permission state.

   type Policy_Result is (Policy_Allowed, Policy_Denied, Policy_Warning,
      Policy_Not_Applicable);
   --  Caller-supplied policy evaluation result.

   function Role_Label (Role : Role_Kind) return Humanize.Status.Text_Result;
   --  @param Role Role kind.
   --  @return Human-readable role label.

   function Permission_State_Label (State : Permission_State) return Humanize.Status.Text_Result;
   --  @param State Permission state.
   --  @return Human-readable permission-state label.

   function Policy_Result_Label (Result : Policy_Result) return Humanize.Status.Text_Result;
   --  @param Result Policy evaluation result.
   --  @return Human-readable policy-result label.

   function Permission_Label
     (Subject : String;
     Action : String;
     State : Permission_State)
      return Humanize.Status.Text_Result;
   --  @param Subject User, group, or role display name.
   --  @param Action Permission action label.
   --  @param State Permission state.
   --  @return Human-readable permission label.

   function Permission_Label
     (Subject : String;
      Action  : String;
      State   : Permission_State;
      Options : Permission_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Subject User, group, or role display name.
   --  @param Action Permission action label.
   --  @param State Permission state.
   --  @param Options Permission output policy.
   --  @return Human-readable permission label with optional metadata.

   function Permission_State_Metadata
     (State : Permission_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Permission state.
   --  @return Stable metadata for State.

   function Parse_Permission_Label
     (Text  : String;
      State : Permission_State)
      return Permission_Label_Parse_Result;
   --  @param Text Permission label emitted by Permission_Label.
   --  @param State Expected permission state suffix.
   --  @return Parsed permission label spans and metadata.

   function Scan_Permission_Label
     (Text  : String;
      State : Permission_State)
      return Permission_Label_Parse_Result;
   --  @param Text Text beginning with a permission label.
   --  @param State Expected permission state suffix.
   --  @return Parsed permission label prefix spans and metadata.

   function Access_Expiry_Label (Subject : String; Time_Text : String) return Humanize.Status.Text_Result;
   --  @param Subject User, group, or role display name.
   --  @param Time_Text Caller-supplied expiry time/distance label.
   --  @return Human-readable access-expiry label.

   function Grant_Label (Subject : String; Role : Role_Kind) return Humanize.Status.Text_Result;
   --  @param Subject User or group display name.
   --  @param Role Granted role kind.
   --  @return Human-readable grant label.

   function Revoke_Label (Subject : String; Role : Role_Kind) return Humanize.Status.Text_Result;
   --  @param Subject User or group display name.
   --  @param Role Revoked role kind.
   --  @return Human-readable revoke label.

   procedure Role_Label_Into
     (Role : Role_Kind;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Role Role kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Permission_State_Label_Into
     (State : Permission_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Permission state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Policy_Result_Label_Into
     (Result : Policy_Result;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Result Policy evaluation result.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Permission_Label_Into
     (Subject : String;
     Action : String;
     State : Permission_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Subject User, group, or role display name.
   --  @param Action Permission action label.
   --  @param State Permission state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Permission_Label_Into
     (Subject : String;
      Action  : String;
      State   : Permission_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Permission_Label_Options);
   --  @param Subject User, group, or role display name.
   --  @param Action Permission action label.
   --  @param State Permission state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Permission output policy.

   procedure Access_Expiry_Label_Into
     (Subject : String;
     Time_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Subject User, group, or role display name.
   --  @param Time_Text Caller-supplied expiry time/distance label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Grant_Label_Into
     (Subject : String;
     Role : Role_Kind;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Subject User or group display name.
   --  @param Role Granted role kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Revoke_Label_Into
     (Subject : String;
     Role : Role_Kind;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Subject User or group display name.
   --  @param Role Revoked role kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Permissions;
