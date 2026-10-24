with Ada.Strings.Unbounded;
with Ada.Text_IO;

with Messages.Runtime;

with Humanize.Catalogs;
with Humanize.Colors;
with Humanize.Colors.Contrast.Localized;
with Humanize.Colors.Models.Localized;
with Humanize.Colors.Names.Localized;
with Humanize.Colors.Palettes.Localized;
with Humanize.Numbers.Statistics.Localized;
with Humanize.Strings.Metrics.Localized;
with Humanize.Contexts;
with Humanize.Status;
with Humanize.Accounts.Localized;
with Humanize.Attachments.Localized;
with Humanize.Badges.Localized;
with Humanize.Builds.Localized;
with Humanize.Changes.Localized;
with Humanize.Comments.Localized;
with Humanize.Comparisons.Localized;
with Humanize.Data_Quality.Localized;
with Humanize.Deployments.Localized;
with Humanize.Diagnostics.Localized;
with Humanize.Endpoints.Localized;
with Humanize.Events.Localized;
with Humanize.Forms.Localized;
with Humanize.Markup.Localized;
with Humanize.Media.Localized;
with Humanize.Moderation.Localized;
with Humanize.Navigation.Localized;
with Humanize.Notification_Preferences.Localized;
with Humanize.Notifications.Localized;
with Humanize.Payments.Localized;
with Humanize.Permissions.Localized;
with Humanize.Resources.Localized;
with Humanize.Schema.Localized;
with Humanize.Search.Localized;
with Humanize.Secrets.Localized;
with Humanize.Tables.Localized;
with Humanize.Tasks.Localized;
with Humanize.Thresholds.Localized;
with Humanize.Versions.Localized;
with Humanize.Workflows.Localized;
with Humanize_Demo_Runtime;

--  One label from each family's Localized child, in German: the parent's
--  function with a context first.
procedure Domain_Labels_Demo is
   use Ada.Strings.Unbounded;

   procedure Put_Result (Label : String; Result : Humanize.Status.Text_Result) is
   begin
      Ada.Text_IO.Put_Line (Label & " : " & To_String (Result.Text));
   end Put_Result;

   Loaded : Messages.Runtime.Load_Result;
begin
   Humanize.Catalogs.Load_Defaults (Humanize_Demo_Runtime.Runtime, Loaded, Locale => "de");
   declare
      De : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create (Humanize_Demo_Runtime.Runtime'Access, "de");
   begin
      Put_Result
        ("accounts",
         Humanize.Accounts.Localized.Account_Label
           (De,
            Name => "plain",
            State => Humanize.Accounts.Invited_Account));
      Put_Result
        ("attachments",
         Humanize.Attachments.Localized.Attachment_Kind_Label
           (De,
            Kind => Humanize.Attachments.Image_Attachment));
      Put_Result
        ("badges",
         Humanize.Badges.Localized.Badge_Label
           (De,
            Name => "plain",
            Tone => Humanize.Badges.Info_Tone,
            State => Humanize.Badges.New_Badge));
      Put_Result
        ("builds",
         Humanize.Builds.Localized.Artifact_State_Label
           (De,
            State => Humanize.Builds.Artifact_Missing));
      Put_Result
        ("changes",
         Humanize.Changes.Localized.Boolean_Field_Change_Label
           (De,
            Field_Name => "plain",
            Old_Value => True,
            New_Value => True));
      Put_Result
        ("comments",
         Humanize.Comments.Localized.Author_Action_Label
           (De,
            Author => "plain",
            State => Humanize.Comments.Published_Comment));
      Put_Result
        ("comparisons",
         Humanize.Comparisons.Localized.Baseline_Label
           (De,
            Name => "plain",
            Result => Humanize.Comparisons.Regressed));
      Put_Result
        ("data_quality",
         Humanize.Data_Quality.Localized.Data_Issue_Label
           (De,
            Issue => Humanize.Data_Quality.Duplicate_Record));
      Put_Result
        ("deployments",
         Humanize.Deployments.Localized.Artifact_State_Label
           (De,
            State => Humanize.Deployments.Artifact_Uploaded));
      Put_Result
        ("diagnostics",
         Humanize.Diagnostics.Localized.Check_Duration_Label
           (De,
            Name => "plain",
            Status => Humanize.Diagnostics.Failed_Check,
            Duration_S => 3));
      Put_Result
        ("endpoints",
         Humanize.Endpoints.Localized.Host_Kind_Label
           (De,
            Kind => Humanize.Endpoints.IPv4_Host));
      Put_Result
        ("events",
         Humanize.Events.Localized.Attendance_State_Label
           (De,
            State => Humanize.Events.Accepted));
      Put_Result
        ("forms",
         Humanize.Forms.Localized.Field_Label
           (De,
            Name => "plain",
            Required => True));
      Put_Result
        ("markup",
         Humanize.Markup.Localized.Accessibility_Issue_Label
           (De,
            Target => "plain",
            Issue => Humanize.Markup.Low_Contrast));
      Put_Result
        ("media",
         Humanize.Media.Localized.Media_Kind_Label
           (De,
            Kind => Humanize.Media.Video_Media));
      Put_Result
        ("moderation",
         Humanize.Moderation.Localized.Appeal_Label
           (De,
            Item => "plain",
            State => Humanize.Moderation.Triaged_Report));
      Put_Result
        ("navigation",
         Humanize.Navigation.Localized.Navigation_Item_Kind_Label
           (De,
            Kind => Humanize.Navigation.Menu_Item));
      Put_Result
        ("notification_preferences",
         Humanize.Notification_Preferences.Localized.Alert_Level_Label
           (De,
            Level => Humanize.Notification_Preferences.Important_Alerts));
      Put_Result
        ("notifications",
         Humanize.Notifications.Localized.Actor_Event_Label
           (De,
            Actor => "plain",
            Event => Humanize.Notifications.Reply_Event));
      Put_Result
        ("payments",
         Humanize.Payments.Localized.Invoice_Label
           (De,
            Number => "plain",
            State => Humanize.Payments.Open_Invoice));
      Put_Result
        ("permissions",
         Humanize.Permissions.Localized.Grant_Label
           (De,
            Subject => "plain",
            Role => Humanize.Permissions.Admin_Role));
      Put_Result
        ("resources",
         Humanize.Resources.Localized.Utilization_Band_Label
           (De,
            Band => Humanize.Resources.Low_Utilization));
      Put_Result
        ("schema",
         Humanize.Schema.Localized.Array_Shape_Label
           (De,
            Element_Type => Humanize.Schema.Integer_Field,
            Count => 3,
            Count_Known => True));
      Put_Result
        ("search",
         Humanize.Search.Localized.Facet_Value_Label
           (De,
            Name => "plain",
            Count => 3,
            Selected => True));
      Put_Result
        ("secrets",
         Humanize.Secrets.Localized.Exposure_Label
           (De,
            Exposure => Humanize.Secrets.Masked_Value));
      Put_Result
        ("tables",
         Humanize.Tables.Localized.Cell_Label
           (De,
            Row => 3,
            Column => 3,
            State => Humanize.Tables.Edited_Cell));
      Put_Result
        ("tasks",
         Humanize.Tasks.Localized.Assignment_Label
           (De,
            Assignee => "plain",
            State => Humanize.Tasks.Assigned));
      Put_Result
        ("thresholds",
         Humanize.Thresholds.Localized.Threshold_Direction_Label
           (De,
            Direction => Humanize.Thresholds.Lower_Limit));
      Put_Result
        ("versions",
         Humanize.Versions.Localized.Commit_Distance_Label
           (De,
            Ahead => 3,
            Behind => 3));
      Put_Result
        ("workflows",
         Humanize.Workflows.Localized.Approval_Label
           (De,
            Approver => "plain",
            Waiting => True));
      Put_Result ("contrast", Humanize.Colors.Contrast.Localized.Opacity_Label (De, Opacity => 0.5));
      Put_Result ("names", Humanize.Colors.Names.Localized.Color_Description (De, Color => (200, 30, 40)));
      Put_Result ("models", Humanize.Colors.Models.Localized.Brightness_Label (De, Color => (20, 120, 220)));
      Put_Result
        ("palettes",
         Humanize.Colors.Palettes.Localized.Palette_Mood_Label
           (De, Colors => [(200, 30, 40), (20, 120, 220), (250, 250, 240)]));
      Put_Result
        ("statistics",
         Humanize.Numbers.Statistics.Localized.Outlier_Summary_Label (De, Outliers => 3, Total => 40));
      Put_Result
        ("metrics",
         Humanize.Strings.Metrics.Localized.Reading_Time (De, Text => "The quick brown fox jumps over the lazy dog."));
   end;
end Domain_Labels_Demo;
