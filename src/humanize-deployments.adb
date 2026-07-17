with Humanize.Bounded_Text;

package body Humanize.Deployments is
   use type Humanize.Status.Status_Code;
   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;
   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;
   function Deployment_Text (State : Deployment_State) return String is
   begin
      case State is
         when Queued_Deployment => return "deployment queued";
         when Deploying => return "deploying";
         when Deployed => return "deployed";
         when Failed_Deployment => return "deployment failed";
         when Rolled_Back => return "rolled back";
         when Blocked_Deployment => return "deployment blocked";
         when Canceled_Deployment => return "deployment canceled";
      end case;
   end Deployment_Text;
   function Environment_Text (State : Environment_State) return String is
   begin
      case State is
         when Healthy_Environment => return "environment healthy";
         when Drifting_Environment => return "environment drift";
         when Locked_Environment => return "environment locked";
         when Maintenance_Environment => return "environment maintenance";
         when Unknown_Environment => return "unknown environment state";
      end case;
   end Environment_Text;
   function Migration_Text (State : Migration_State) return String is
   begin
      case State is
         when No_Migration => return "no migration";
         when Migration_Pending => return "migration pending";
         when Migrating => return "migrating";
         when Migration_Complete => return "migration complete";
         when Migration_Failed => return "migration failed";
      end case;
   end Migration_Text;
   function Artifact_Text (State : Artifact_State) return String is
   begin
      case State is
         when Artifact_Ready => return "artifact ready";
         when Artifact_Uploaded => return "artifact uploaded";
         when Artifact_Signed => return "artifact signed";
         when Artifact_Missing => return "artifact missing";
         when Artifact_Expired => return "artifact expired";
      end case;
   end Artifact_Text;
   function Deployment_State_Label
     (State : Deployment_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Deployment_Text (State));
   end Deployment_State_Label;
   function Environment_State_Label
     (State : Environment_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Environment_Text (State));
   end Environment_State_Label;
   function Migration_State_Label
     (State : Migration_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Migration_Text (State));
   end Migration_State_Label;
   function Artifact_State_Label
     (State : Artifact_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Artifact_Text (State));
   end Artifact_State_Label;
   function Domain_Options
     (Options : Deployment_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Deployment_Detailed => Humanize.Domain_Details.Detailed_Output,
              when Deployment_Compact => Humanize.Domain_Details.Compact_Output,
              when Deployment_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Deployment_Log => Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Deployment_Label_Suffix
     (State : Deployment_State)
      return String
   is
   begin
      return Deployment_Text (State);
   end Deployment_Label_Suffix;

   function Deployment_State_Metadata
     (State : Deployment_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Deployments_Surface,
         Deployment_Label_Suffix (State));
   end Deployment_State_Metadata;

   function Deployment_Label
     (Name        : String;
      Environment : String;
      State       : Deployment_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Detail_Text
        (Name,
         "invalid deployment name",
         " to ",
         Environment,
         "invalid environment",
         Suffix => " " & Deployment_Label_Suffix (State));
   end Deployment_Label;
   function Deployment_Label
     (Name        : String;
      Environment : String;
      State       : Deployment_State;
      Options     : Deployment_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Deployment_Label (Name, Environment, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Deployment_State_Metadata (State), Domain_Options (Options));
   end Deployment_Label;

   function Parse_Deployment_Label
     (Text  : String;
      State : Deployment_State)
      return Deployment_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Parse_Named_Label
         (Text,
         Humanize.Domain_Details.Deployments_Surface,
         Deployment_Label_Suffix (State));
   end Parse_Deployment_Label;

   function Scan_Deployment_Label
     (Text  : String;
      State : Deployment_State)
      return Deployment_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Scan_Named_Label
         (Text,
         Humanize.Domain_Details.Deployments_Surface,
         Deployment_Label_Suffix (State));
   end Scan_Deployment_Label;

   function Rollout_Label (Name : String; Percent_Text : String) return Humanize.Status.Text_Result is
   begin
      return Humanize.Bounded_Text.Nonempty_Detail_Text
        (Name,
         "invalid rollout name",
         " rollout ",
         Percent_Text,
         "invalid rollout percent");
   end Rollout_Label;
   function Promotion_Label
     (Name             : String;
      From_Environment : String;
      To_Environment   : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Two_Details_Text
        (Name,
         "invalid release name",
         " promoted from ",
         From_Environment,
         "invalid source environment",
         " to ",
         To_Environment,
         "invalid target environment");
   end Promotion_Label;
   function Rollback_Label (Name : String; Target : String) return Humanize.Status.Text_Result is
   begin
      return Humanize.Bounded_Text.Nonempty_Detail_Text
        (Name,
         "invalid deployment name",
         " rollback to ",
         Target,
         "invalid rollback target");
   end Rollback_Label;
   procedure Deployment_State_Label_Into
     (State : Deployment_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Deployment_State_Label (State), Target, Written, Status);
   end Deployment_State_Label_Into;
   procedure Environment_State_Label_Into
     (State : Environment_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Environment_State_Label (State), Target, Written, Status);
   end Environment_State_Label_Into;
   procedure Migration_State_Label_Into
     (State : Migration_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Migration_State_Label (State), Target, Written, Status);
   end Migration_State_Label_Into;
   procedure Artifact_State_Label_Into
     (State : Artifact_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Artifact_State_Label (State), Target, Written, Status);
   end Artifact_State_Label_Into;
   procedure Deployment_Label_Into
     (Name : String;
     Environment : String;
     State : Deployment_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Deployment_Label (Name, Environment, State), Target, Written, Status);
   end Deployment_Label_Into;
   procedure Deployment_Label_Into
     (Name        : String;
      Environment : String;
      State       : Deployment_State;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Options     : Deployment_Label_Options)
   is
   begin
      Copy_Result
        (Deployment_Label (Name, Environment, State, Options),
         Target, Written, Status);
   end Deployment_Label_Into;

   procedure Rollout_Label_Into
     (Name : String;
     Percent_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Rollout_Label (Name, Percent_Text), Target, Written, Status);
   end Rollout_Label_Into;
   procedure Promotion_Label_Into
     (Name : String;
     From_Environment : String;
     To_Environment : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Promotion_Label (Name, From_Environment, To_Environment), Target, Written, Status);
   end Promotion_Label_Into;
   procedure Rollback_Label_Into
     (Name : String;
     Target : String;
     Output : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Rollback_Label (Name, Target), Output, Written, Status);
   end Rollback_Label_Into;
end Humanize.Deployments;
