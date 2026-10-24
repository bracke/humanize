with Humanize.Contexts;

--  Deployments labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain
--  labels"): each is the parent's function of the same name with a Context first, and that function itself in
--  English, where the locale has no translation, and for every input the parent rejects.
package Humanize.Deployments.Localized is

   function Artifact_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Artifact_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Artifact_State_Label.
   --  @return The label in Context's locale.

   function Deployment_Label
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Environment : String;
       State       : Deployment_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Deployment_Label.
   --  @param Environment As for the parent's Deployment_Label.
   --  @param State As for the parent's Deployment_Label.
   --  @return The label in Context's locale.

   function Deployment_Label
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Environment : String;
       State       : Deployment_State;
       Options     : Deployment_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Deployment_Label.
   --  @param Environment As for the parent's Deployment_Label.
   --  @param State As for the parent's Deployment_Label.
   --  @param Options As for the parent's Deployment_Label.
   --  @return The label in Context's locale.

   function Deployment_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Deployment_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Deployment_State_Label.
   --  @return The label in Context's locale.

   function Environment_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Environment_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Environment_State_Label.
   --  @return The label in Context's locale.

   function Migration_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Migration_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Migration_State_Label.
   --  @return The label in Context's locale.

   function Promotion_Label
      (Context          : Humanize.Contexts.Context;
       Name             : String;
       From_Environment : String;
       To_Environment   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Promotion_Label.
   --  @param From_Environment As for the parent's Promotion_Label.
   --  @param To_Environment As for the parent's Promotion_Label.
   --  @return The label in Context's locale.

   function Rollback_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Rollback_Label.
   --  @param Target As for the parent's Rollback_Label.
   --  @return The label in Context's locale.

   function Rollout_Label
      (Context      : Humanize.Contexts.Context;
       Name         : String;
       Percent_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Rollout_Label.
   --  @param Percent_Text As for the parent's Rollout_Label.
   --  @return The label in Context's locale.

   procedure Artifact_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Artifact_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Artifact_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Deployment_Label_Into
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Environment : String;
       State       : Deployment_State;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Deployment_Label.
   --  @param Environment As for the parent's Deployment_Label.
   --  @param State As for the parent's Deployment_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Deployment_Label_Into
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Environment : String;
       State       : Deployment_State;
       Options     : Deployment_Label_Options;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Deployment_Label.
   --  @param Environment As for the parent's Deployment_Label.
   --  @param State As for the parent's Deployment_Label.
   --  @param Options As for the parent's Deployment_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Deployment_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Deployment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Deployment_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Environment_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Environment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Environment_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Migration_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Migration_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Migration_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Promotion_Label_Into
      (Context          : Humanize.Contexts.Context;
       Name             : String;
       From_Environment : String;
       To_Environment   : String;
       Target           : in out String;
       Written          : out Natural;
       Status           : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Promotion_Label.
   --  @param From_Environment As for the parent's Promotion_Label.
   --  @param To_Environment As for the parent's Promotion_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Rollout_Label_Into
      (Context      : Humanize.Contexts.Context;
       Name         : String;
       Percent_Text : String;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Rollout_Label.
   --  @param Percent_Text As for the parent's Rollout_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Deployments.Localized;
