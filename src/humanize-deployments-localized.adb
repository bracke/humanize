with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Deployments.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Artifact_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Artifact_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Deployments.Artifact_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.deployments.artifact_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Artifact_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Artifact_State_Label;

   function Deployment_Label
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Environment : String;
       State       : Deployment_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Deployments.Deployment_Label (Name => Name, Environment => Environment, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.deployments.deployment_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Deployment_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "environment", Humanize.Bounded_Text.Clean (Environment));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Deployment_Label;

   function Deployment_Label
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Environment : String;
       State       : Deployment_State;
       Options     : Deployment_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Deployments.Deployment_Label
          (Name => Name,
           Environment => Environment,
           State => State,
           Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Deployments.Deployment_Label (Name => Name, Environment => Environment, State => State);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Deployment_Label (Context, Name => Name,
        Environment => Environment, State => State));
   end Deployment_Label;

   function Deployment_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Deployment_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Deployments.Deployment_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.deployments.deployment_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Deployment_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Deployment_State_Label;

   function Environment_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Environment_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Deployments.Environment_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.deployments.environment_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Environment_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Environment_State_Label;

   function Migration_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Migration_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Deployments.Migration_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.deployments.migration_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Migration_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Migration_State_Label;

   function Promotion_Label
      (Context          : Humanize.Contexts.Context;
       Name             : String;
       From_Environment : String;
       To_Environment   : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Deployments.Promotion_Label
          (Name => Name,
           From_Environment => From_Environment,
           To_Environment => To_Environment);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.deployments.promotion_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "from_environment", Humanize.Bounded_Text.Clean (From_Environment));
      Selection := Sel.With_Arg (Selection, "to_environment", Humanize.Bounded_Text.Clean (To_Environment));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Promotion_Label;

   function Rollback_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Deployments.Rollback_Label (Name => Name, Target => Target);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.deployments.rollback_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "target", Humanize.Bounded_Text.Clean (Target));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Rollback_Label;

   function Rollout_Label
      (Context      : Humanize.Contexts.Context;
       Name         : String;
       Percent_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Deployments.Rollout_Label (Name => Name, Percent_Text => Percent_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.deployments.rollout_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "percent_text", Humanize.Bounded_Text.Clean (Percent_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Rollout_Label;

   procedure Artifact_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Artifact_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Artifact_State_Label (Context, State => State), Target, Written, Status);
   end Artifact_State_Label_Into;

   procedure Deployment_Label_Into
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Environment : String;
       State       : Deployment_State;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Deployment_Label (Context, Name => Name, Environment => Environment, State => State),
         Target, Written, Status);
   end Deployment_Label_Into;

   procedure Deployment_Label_Into
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Environment : String;
       State       : Deployment_State;
       Options     : Deployment_Label_Options;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Deployment_Label (Context, Name => Name, Environment => Environment, State => State, Options => Options),
         Target, Written, Status);
   end Deployment_Label_Into;

   procedure Deployment_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Deployment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Deployment_State_Label (Context, State => State), Target, Written, Status);
   end Deployment_State_Label_Into;

   procedure Environment_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Environment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Environment_State_Label (Context, State => State), Target, Written, Status);
   end Environment_State_Label_Into;

   procedure Migration_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Migration_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Migration_State_Label (Context, State => State), Target, Written, Status);
   end Migration_State_Label_Into;

   procedure Promotion_Label_Into
      (Context          : Humanize.Contexts.Context;
       Name             : String;
       From_Environment : String;
       To_Environment   : String;
       Target           : in out String;
       Written          : out Natural;
       Status           : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Promotion_Label (Context, Name => Name, From_Environment => From_Environment, To_Environment =>
         To_Environment),
         Target, Written, Status);
   end Promotion_Label_Into;

   procedure Rollout_Label_Into
      (Context      : Humanize.Contexts.Context;
       Name         : String;
       Percent_Text : String;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Rollout_Label (Context, Name => Name, Percent_Text => Percent_Text),
         Target, Written, Status);
   end Rollout_Label_Into;

end Humanize.Deployments.Localized;
