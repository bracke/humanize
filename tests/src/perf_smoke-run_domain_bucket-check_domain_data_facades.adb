with Humanize.Accounts;
with Humanize.Comparisons;
with Humanize.Data_Quality;
with Humanize.Deployments;
with Humanize.Endpoints;
with Humanize.Media;
with Humanize.Moderation;
with Humanize.Resources;
with Humanize.Schema;
with Humanize.Secrets;
with Humanize.Thresholds;
with Humanize.Versions;

separate (Perf_Smoke.Run_Domain_Bucket)
   procedure Check_Domain_Data_Facades is
      Endpoint : constant Humanize.Status.Text_Result :=
        Humanize.Endpoints.Endpoint_Label
          ("example.com", Port => 443, Scheme => "https");
      Resource : constant Humanize.Status.Text_Result :=
        Humanize.Resources.Quota_Label
          (Used => 80, Limit => 100, Unit => "requests");
      Version : constant Humanize.Status.Text_Result :=
        Humanize.Versions.Version_Label ("1.2.3");
      Secret : constant Humanize.Status.Text_Result :=
        Humanize.Secrets.Secret_Count_Label
          (Total => 3, Masked => 2, Unset => 1);
      Schema : constant Humanize.Status.Text_Result :=
        Humanize.Schema.Field_Label
          ("email", Humanize.Schema.String_Field,
           Presence => Humanize.Schema.Required_Field);
      Threshold : constant Humanize.Status.Text_Result :=
        Humanize.Thresholds.Metric_Value_Label
          ("latency", 250.0, Unit => "ms");
      Comparison : constant Humanize.Status.Text_Result :=
        Humanize.Comparisons.Multi_Value_Summary
          (Name => "latency", Changed => 2, Unchanged => 8, Total => 10);
      Moderation : constant Humanize.Status.Text_Result :=
        Humanize.Moderation.Review_Label
          ("comment", Humanize.Moderation.Pending_Review);
      Account : constant Humanize.Status.Text_Result :=
        Humanize.Accounts.Account_Label
          ("release-bot", Humanize.Accounts.Active_Account);
      Deployment : constant Humanize.Status.Text_Result :=
        Humanize.Deployments.Deployment_Label
          ("release", "production", Humanize.Deployments.Deploying);
      Data_Quality : constant Humanize.Status.Text_Result :=
        Humanize.Data_Quality.Import_Result_Label
          ("orders", Humanize.Data_Quality.Import_Partial,
           Accepted => 120, Rejected => 2);
      Media : constant Humanize.Status.Text_Result :=
        Humanize.Media.Media_Summary
          ("hero.png", Humanize.Media.Image_Media,
           Humanize.Media.Ready_Media);
   begin
      Check_Status (Endpoint.Status, "endpoint label");
      Check_Status (Resource.Status, "resource quota label");
      Check_Status (Version.Status, "version label");
      Check_Status (Secret.Status, "secret count label");
      Check_Status (Schema.Status, "schema field label");
      Check_Status (Threshold.Status, "threshold metric value label");
      Check_Status (Comparison.Status, "comparison summary label");
      Check_Status (Moderation.Status, "moderation review label");
      Check_Status (Account.Status, "account label");
      Check_Status (Deployment.Status, "deployment label");
      Check_Status (Data_Quality.Status, "data quality import label");
      Check_Status (Media.Status, "media summary label");
   end Check_Domain_Data_Facades;
