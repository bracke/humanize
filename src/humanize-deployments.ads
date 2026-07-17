with Humanize.Status;
with Humanize.Domain_Details;

--  Deterministic labels for deployments, rollouts, environments, and artifacts.
package Humanize.Deployments is
   type Deployment_Output_Mode is
     (Deployment_Detailed,
      Deployment_Compact,
      Deployment_Accessible,
      Deployment_Log);
   --  Output policy for deployment labels.

   type Deployment_Label_Options is record
      Mode             : Deployment_Output_Mode := Deployment_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Deployment label output options.

   Default_Deployment_Label_Options : constant Deployment_Label_Options :=
     (Mode             => Deployment_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Deployment_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;
   --  Parsed deployment label metadata.

   type Deployment_State is (Queued_Deployment, Deploying, Deployed, Failed_Deployment,
      Rolled_Back, Blocked_Deployment, Canceled_Deployment);
   --  Caller-supplied deployment lifecycle state.

   type Environment_State is (Healthy_Environment, Drifting_Environment,
      Locked_Environment, Maintenance_Environment, Unknown_Environment);
   --  Caller-supplied environment state.

   type Migration_State is (No_Migration, Migration_Pending, Migrating,
      Migration_Complete, Migration_Failed);
   --  Caller-supplied migration state.

   type Artifact_State is (Artifact_Ready, Artifact_Uploaded, Artifact_Signed,
      Artifact_Missing, Artifact_Expired);
   --  Caller-supplied build/release artifact state.

   function Deployment_State_Label (State : Deployment_State) return Humanize.Status.Text_Result;
   --  @param State Deployment lifecycle state.
   --  @return Human-readable deployment-state label.

   function Environment_State_Label (State : Environment_State) return Humanize.Status.Text_Result;
   --  @param State Environment state.
   --  @return Human-readable environment-state label.

   function Migration_State_Label (State : Migration_State) return Humanize.Status.Text_Result;
   --  @param State Migration state.
   --  @return Human-readable migration-state label.

   function Artifact_State_Label (State : Artifact_State) return Humanize.Status.Text_Result;
   --  @param State Artifact state.
   --  @return Human-readable artifact-state label.

   function Deployment_Label
     (Name : String;
     Environment : String;
     State : Deployment_State)
      return Humanize.Status.Text_Result;
   --  @param Name Deployment or release display name.
   --  @param Environment Target environment label.
   --  @param State Deployment lifecycle state.
   --  @return Human-readable deployment label.

   function Deployment_Label
     (Name        : String;
      Environment : String;
      State       : Deployment_State;
      Options     : Deployment_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Deployment or release display name.
   --  @param Environment Target environment label.
   --  @param State Deployment lifecycle state.
   --  @param Options Deployment output policy.
   --  @return Human-readable deployment label with optional metadata.

   function Deployment_State_Metadata
     (State : Deployment_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Deployment state.
   --  @return Stable metadata for State.

   function Parse_Deployment_Label
     (Text  : String;
      State : Deployment_State)
      return Deployment_Label_Parse_Result;
   --  @param Text Deployment label emitted by Deployment_Label.
   --  @param State Expected deployment state suffix.
   --  @return Parsed deployment label spans and metadata.

   function Scan_Deployment_Label
     (Text  : String;
      State : Deployment_State)
      return Deployment_Label_Parse_Result;
   --  @param Text Text beginning with a deployment label.
   --  @param State Expected deployment state suffix.
   --  @return Parsed deployment label prefix spans and metadata.

   function Rollout_Label (Name : String; Percent_Text : String) return Humanize.Status.Text_Result;
   --  @param Name Deployment or feature display name.
   --  @param Percent_Text Caller-supplied rollout percentage label.
   --  @return Human-readable rollout label.

   function Promotion_Label
     (Name : String;
     From_Environment : String;
     To_Environment : String)
      return Humanize.Status.Text_Result;
   --  @param Name Release display name.
   --  @param From_Environment Source environment label.
   --  @param To_Environment Destination environment label.
   --  @return Human-readable promotion label.

   function Rollback_Label (Name : String; Target : String) return Humanize.Status.Text_Result;
   --  @param Name Deployment or release display name.
   --  @param Target Rollback target label.
   --  @return Human-readable rollback label.

   procedure Deployment_State_Label_Into
     (State : Deployment_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Deployment lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Environment_State_Label_Into
     (State : Environment_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Environment state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Migration_State_Label_Into
     (State : Migration_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Migration state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Artifact_State_Label_Into
     (State : Artifact_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Artifact state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Deployment_Label_Into
     (Name : String;
     Environment : String;
     State : Deployment_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Name Deployment or release display name.
   --  @param Environment Target environment label.
   --  @param State Deployment lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Deployment_Label_Into
     (Name        : String;
      Environment : String;
      State       : Deployment_State;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Options     : Deployment_Label_Options);
   --  @param Name Deployment or release display name.
   --  @param Environment Target environment label.
   --  @param State Deployment lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Deployment output policy.

   procedure Rollout_Label_Into
     (Name : String;
     Percent_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Name Deployment or feature display name.
   --  @param Percent_Text Caller-supplied rollout percentage label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Promotion_Label_Into
     (Name : String;
     From_Environment : String;
     To_Environment : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Name Release display name.
   --  @param From_Environment Source environment label.
   --  @param To_Environment Destination environment label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Rollback_Label_Into
     (Name : String;
     Target : String;
     Output : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Name Deployment or release display name.
   --  @param Target Rollback target label.
   --  @param Output Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Deployments;
