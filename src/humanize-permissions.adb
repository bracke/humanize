with Humanize.Bounded_Text;

package body Humanize.Permissions is
   use type Humanize.Status.Status_Code;
   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;
   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;
   function Role_Text (Role : Role_Kind) return String is
   begin
      case Role is
         when Owner_Role => return "owner";
         when Admin_Role => return "admin";
         when Editor_Role => return "editor";
         when Viewer_Role => return "viewer";
         when Custom_Role => return "custom role";
      end case;
   end Role_Text;
   function State_Text (State : Permission_State) return String is
   begin
      case State is
         when Granted => return "granted";
         when Denied => return "denied";
         when Inherited => return "inherited";
         when Temporary => return "temporary access";
         when Expired => return "expired";
         when Requires_Approval => return "requires approval";
      end case;
   end State_Text;
   function Policy_Text (Result : Policy_Result) return String is
   begin
      case Result is
         when Policy_Allowed => return "policy allowed";
         when Policy_Denied => return "policy denied";
         when Policy_Warning => return "policy warning";
         when Policy_Not_Applicable => return "policy not applicable";
      end case;
   end Policy_Text;
   function Role_Label
     (Role : Role_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Role_Text (Role));
   end Role_Label;
   function Permission_State_Label
     (State : Permission_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (State_Text (State));
   end Permission_State_Label;
   function Policy_Result_Label
     (Result : Policy_Result)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Policy_Text (Result));
   end Policy_Result_Label;
   function Domain_Options
     (Options : Permission_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Permission_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Permission_Compact => Humanize.Domain_Details.Compact_Output,
              when Permission_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Permission_Log => Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Permission_Label_Suffix
     (State : Permission_State)
      return String
   is
   begin
      return State_Text (State);
   end Permission_Label_Suffix;

   function Permission_State_Metadata
     (State : Permission_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Permissions_Surface,
         Permission_Label_Suffix (State));
   end Permission_State_Metadata;

   function Permission_Label
     (Subject : String;
      Action  : String;
      State   : Permission_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Detail_Text
        (Subject,
         "invalid permission subject",
         " ",
         Action,
         "invalid permission action",
         Suffix => " " & Permission_Label_Suffix (State));
   end Permission_Label;
   function Permission_Label
     (Subject : String;
      Action  : String;
      State   : Permission_State;
      Options : Permission_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Permission_Label (Subject, Action, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Permission_State_Metadata (State), Domain_Options (Options));
   end Permission_Label;

   function Parse_Permission_Label
     (Text  : String;
      State : Permission_State)
      return Permission_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Permissions_Surface,
         Permission_Label_Suffix (State));
   end Parse_Permission_Label;

   function Scan_Permission_Label
     (Text  : String;
      State : Permission_State)
      return Permission_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Permissions_Surface,
         Permission_Label_Suffix (State));
   end Scan_Permission_Label;

   function Access_Expiry_Label (Subject : String; Time_Text : String) return Humanize.Status.Text_Result is
   begin
      return Humanize.Bounded_Text.Nonempty_Detail_Text
        (Subject,
         "invalid permission subject",
         " access expires ",
         Time_Text,
         "invalid access expiry");
   end Access_Expiry_Label;
   function Grant_Label
     (Subject : String;
     Role : Role_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Label_Text
        (Subject,
         "invalid permission subject",
         Suffix => " granted " & Role_Text (Role));
   end Grant_Label;
   function Revoke_Label
     (Subject : String;
     Role : Role_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Label_Text
        (Subject,
         "invalid permission subject",
         Suffix => " revoked " & Role_Text (Role));
   end Revoke_Label;
   procedure Role_Label_Into
     (Role : Role_Kind;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Role_Label (Role), Target, Written, Status);
   end Role_Label_Into;
   procedure Permission_State_Label_Into
     (State : Permission_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Permission_State_Label (State), Target, Written, Status);
   end Permission_State_Label_Into;
   procedure Policy_Result_Label_Into
     (Result : Policy_Result;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Policy_Result_Label (Result), Target, Written, Status);
   end Policy_Result_Label_Into;
   procedure Permission_Label_Into
     (Subject : String;
     Action : String;
     State : Permission_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Permission_Label (Subject, Action, State), Target, Written, Status);
   end Permission_Label_Into;
   procedure Permission_Label_Into
     (Subject : String;
      Action  : String;
      State   : Permission_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Permission_Label_Options)
   is
   begin
      Copy_Result
        (Permission_Label (Subject, Action, State, Options),
         Target, Written, Status);
   end Permission_Label_Into;

   procedure Access_Expiry_Label_Into
     (Subject : String;
     Time_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Access_Expiry_Label (Subject, Time_Text), Target, Written, Status);
   end Access_Expiry_Label_Into;
   procedure Grant_Label_Into
     (Subject : String;
     Role : Role_Kind;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Grant_Label (Subject, Role), Target, Written, Status);
   end Grant_Label_Into;
   procedure Revoke_Label_Into
     (Subject : String;
     Role : Role_Kind;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Revoke_Label (Subject, Role), Target, Written, Status);
   end Revoke_Label_Into;
end Humanize.Permissions;
