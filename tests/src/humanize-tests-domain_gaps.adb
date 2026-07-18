with AUnit.Assertions;

with Humanize.Accounts;
with Humanize.Attachments;
with Humanize.Badges;
with Humanize.Builds;
with Humanize.Comments;
with Humanize.Comparisons;
with Humanize.Cross_Domain;
with Humanize.Data_Quality;
with Humanize.Deployments;
with Humanize.Domain_Details;
with Humanize.Events;
with Humanize.Forms;
with Humanize.Media;
with Humanize.Moderation;
with Humanize.Navigation;
with Humanize.Notification_Preferences;
with Humanize.Notifications;
with Humanize.Operations;
with Humanize.Payments;
with Humanize.Permissions;
with Humanize.Search;
with Humanize.Status;
with Humanize.Tasks;
with Humanize.Tests.Support;

package body Humanize.Tests.Domain_Gaps is
   use Humanize.Status;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_Operations_And_Comparisons
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use type Humanize.Operations.Operation_State;
      Buffer  : String (1 .. 14);
      Written : Natural;
      Code    : Status_Code;
      Log_Progress : constant Text_Result :=
        Humanize.Operations.Progress_Summary
          ("sync", Humanize.Operations.Running, 8, 10,
           Failed => 1, Skipped => 1, Retried => 0, Canceled => 0,
           Singular => "item", Plural => "items",
           Options =>
             (Mode => Humanize.Operations.Operation_Log,
              Include_Extras => True));
      Compact_Progress : constant Text_Result :=
        Humanize.Operations.Progress_Summary
          ("sync", Humanize.Operations.Running, 8, 10,
           Failed => 1, Skipped => 1, Retried => 0, Canceled => 0,
           Singular => "item", Plural => "items",
           Options =>
             (Mode => Humanize.Operations.Operation_Compact,
              Include_Extras => True));
      No_Extras_Progress : constant Text_Result :=
        Humanize.Operations.Progress_Summary
          ("sync", Humanize.Operations.Running, 8, 10,
           Failed => 1, Skipped => 1, Retried => 1, Canceled => 1,
           Singular => "item", Plural => "items",
           Options =>
             (Mode => Humanize.Operations.Operation_Detailed,
              Include_Extras => False));
      Parsed_Progress : constant Humanize.Operations.Operation_Progress_Parse_Result :=
        Humanize.Operations.Parse_Progress_Summary
          ("sync running: 8 of 10 items complete, 1 item failed");
      Parsed_Log : constant Humanize.Operations.Operation_Progress_Parse_Result :=
        Humanize.Operations.Parse_Progress_Summary
          (Support.Text (Log_Progress));
      Scanned_Log : constant Humanize.Operations.Operation_Progress_Parse_Result :=
        Humanize.Operations.Scan_Progress_Summary
          (Support.Text (Log_Progress) & " trailing context");
      Comparison_Log : constant Text_Result :=
        Humanize.Comparisons.Multi_Value_Summary
          ("settings", 3, 7, 10,
           (Mode => Humanize.Comparisons.Comparison_Log));
      Comparison_Compact : constant Text_Result :=
        Humanize.Comparisons.Multi_Value_Summary
          ("settings", 3, 7, 10,
           (Mode => Humanize.Comparisons.Comparison_Compact));
      Parsed_Comparison :
        constant Humanize.Comparisons.Multi_Value_Parse_Result :=
          Humanize.Comparisons.Parse_Multi_Value_Summary
            ("settings: 3 changed, 7 unchanged, 10 total");
      Parsed_Comparison_Log :
        constant Humanize.Comparisons.Multi_Value_Parse_Result :=
          Humanize.Comparisons.Parse_Multi_Value_Summary
            (Support.Text (Comparison_Log));
      Scanned_Comparison :
        constant Humanize.Comparisons.Multi_Value_Parse_Result :=
          Humanize.Comparisons.Scan_Multi_Value_Summary
            (Support.Text (Comparison_Log) & " trailing context");
   begin
      Check
        (Humanize.Operations.Progress_Summary
           ("sync", Humanize.Operations.Running, 8, 10,
            Failed => 1, Skipped => 1),
         "sync running: 8 of 10 items complete, 1 item failed, 1 item skipped",
         "operation progress");
      Check
        (Humanize.Operations.Unknown_Total_Summary
           ("import", Humanize.Operations.Retrying, 12, Failed => 2,
            Singular => "record", Plural => "records"),
         "import retrying: 12 records complete, 2 records failed",
         "operation unknown total");
      Check
        (Humanize.Operations.Next_Retry_Label ("sync", "in 5 minutes"),
         "sync next retry in 5 minutes", "operation retry");
      AUnit.Assertions.Assert
        (Humanize.Operations.Progress_Summary
           ("sync", Humanize.Operations.Running, 11, 10).Status =
         Invalid_Argument,
         "invalid operation progress");
      Check
        (Compact_Progress,
         "sync 8/10 running, 1 failed, 1 skipped",
         "operation compact progress");
      Check
        (Log_Progress,
         "sync state=running completed=8 total=10 failed=1 skipped=1 retried=0 canceled=0",
         "operation log progress");
      Check
        (No_Extras_Progress,
         "sync running: 8 of 10 items complete",
         "operation options suppress extras");
      AUnit.Assertions.Assert
        (Parsed_Progress.Status = Ok
         and then Parsed_Progress.State = Humanize.Operations.Running
         and then Parsed_Progress.Completed = 8
         and then Parsed_Progress.Total = 10,
         "parse detailed operation progress");
      AUnit.Assertions.Assert
        (Parsed_Log.Status = Ok
         and then Parsed_Log.State = Humanize.Operations.Running
         and then Parsed_Log.Completed = 8
         and then Parsed_Log.Total = 10
         and then Parsed_Log.Failed = 1
         and then Parsed_Log.Skipped = 1,
         "parse log operation progress");
      AUnit.Assertions.Assert
        (Scanned_Log.Status = Ok
         and then Scanned_Log.Consumed = Support.Text (Log_Progress)'Length,
         "scan operation progress prefix");

      Check
        (Humanize.Comparisons.Tolerance_Label
           ("latency", "12 ms", "5 ms", Humanize.Comparisons.Outside_Tolerance),
         "latency outside tolerance by 12 ms, tolerance 5 ms",
         "comparison tolerance");
      Check
        (Humanize.Comparisons.Baseline_Label
           ("throughput", Humanize.Comparisons.Baseline_Unavailable),
         "throughput baseline unavailable", "comparison baseline");
      Check
        (Humanize.Comparisons.Multi_Value_Summary ("settings", 3, 7, 10),
         "settings: 3 changed, 7 unchanged, 10 total",
         "comparison multi value");
      Check
        (Comparison_Compact,
         "settings 3/10 changed",
         "comparison compact multi value");
      Check
        (Comparison_Log,
         "settings changed=3 unchanged=7 total=10",
         "comparison log multi value");
      AUnit.Assertions.Assert
        (Parsed_Comparison.Status = Ok
         and then Parsed_Comparison.Changed = 3
         and then Parsed_Comparison.Unchanged = 7
         and then Parsed_Comparison.Total = 10,
         "parse detailed comparison multi value");
      AUnit.Assertions.Assert
        (Parsed_Comparison_Log.Status = Ok
         and then Parsed_Comparison_Log.Changed = 3
         and then Parsed_Comparison_Log.Unchanged = 7
         and then Parsed_Comparison_Log.Total = 10,
         "parse log comparison multi value");
      AUnit.Assertions.Assert
        (Scanned_Comparison.Status = Ok
         and then Scanned_Comparison.Consumed =
           Support.Text (Comparison_Log)'Length,
         "scan comparison multi value prefix");
      Humanize.Comparisons.Baseline_Label_Into
        ("throughput", Humanize.Comparisons.Baseline_Unavailable,
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 14
         and then Buffer = "throughput bas",
         "bounded comparison overflow");
   end Test_Operations_And_Comparisons;

   procedure Test_Review_Accounts_Deployments
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      use type Humanize.Domain_Details.Domain_Surface;
      Review_Detailed : constant Text_Result :=
        Humanize.Moderation.Review_Label
          ("comment 42", Humanize.Moderation.Rejected,
           (Mode             => Humanize.Moderation.Moderation_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Review :
        constant Humanize.Moderation.Moderation_Label_Parse_Result :=
          Humanize.Moderation.Parse_Review_Label
            ("comment 42 rejected", Humanize.Moderation.Rejected);
      Scanned_Moderation :
        constant Humanize.Moderation.Moderation_Label_Parse_Result :=
          Humanize.Moderation.Scan_Moderation_Label
            ("post hidden by moderator trailing", Humanize.Moderation.Hidden);
      Account_Detailed : constant Text_Result :=
        Humanize.Accounts.Account_Label
          ("Ada", Humanize.Accounts.Locked_Account,
           (Mode             => Humanize.Accounts.Account_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Account_Accessible : constant Text_Result :=
        Humanize.Accounts.Account_Label
          ("Ada", Humanize.Accounts.Active_Account,
           (Mode             => Humanize.Accounts.Account_Accessible,
            Include_Surface  => False,
            Include_Severity => False,
            Include_Tone     => False));
      Parsed_Account :
        constant Humanize.Accounts.Account_Label_Parse_Result :=
          Humanize.Accounts.Parse_Account_Label
            ("Ada locked account", Humanize.Accounts.Locked_Account);
      Scanned_Account :
        constant Humanize.Accounts.Account_Label_Parse_Result :=
          Humanize.Accounts.Scan_Account_Label
            ("Ada locked account trailing", Humanize.Accounts.Locked_Account);
      Deployment_Detailed : constant Text_Result :=
        Humanize.Deployments.Deployment_Label
          ("release 1.2", "production", Humanize.Deployments.Deployed,
           (Mode             => Humanize.Deployments.Deployment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Deployment :
        constant Humanize.Deployments.Deployment_Label_Parse_Result :=
          Humanize.Deployments.Parse_Deployment_Label
            ("release 1.2 to production deployed",
             Humanize.Deployments.Deployed);
   begin
      Check
        (Humanize.Moderation.Review_Label
           ("comment 42", Humanize.Moderation.Needs_Changes),
         "comment 42 needs changes", "review label");
      Check
        (Humanize.Moderation.Moderation_Label
           ("post", Humanize.Moderation.Hidden),
         "post hidden by moderator", "moderation label");
      Check
        (Humanize.Moderation.Moderation_Queue_Label (4, 1),
         "4 pending review, 1 escalated", "moderation queue");
      Check
        (Review_Detailed,
         "[moderation danger] comment 42 rejected",
         "review option metadata");
      AUnit.Assertions.Assert
        (Parsed_Review.Status = Ok
         and then Parsed_Review.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Review.Name_Length = 10,
         "parse review label");
      AUnit.Assertions.Assert
        (Scanned_Moderation.Status = Ok
         and then Scanned_Moderation.Consumed = 24,
         "scan moderation label");

      Check
        (Humanize.Accounts.Account_Label
           ("Ada", Humanize.Accounts.Locked_Account),
         "Ada locked account", "account label");
      Check
        (Humanize.Accounts.Last_Active_Label ("Ada", "2 hours ago"),
         "Ada last active 2 hours ago", "last active");
      Check
        (Humanize.Accounts.MFA_State_Label
           (Humanize.Accounts.MFA_Reset_Required),
         "MFA reset required", "mfa label");
      Check
        (Account_Detailed,
         "[accounts danger] Ada locked account",
         "account option metadata");
      Check
        (Account_Accessible,
         "Ada active account",
         "account accessible option");
      AUnit.Assertions.Assert
        (Parsed_Account.Status = Ok
         and then Parsed_Account.Surface =
           Humanize.Domain_Details.Accounts_Surface
         and then Parsed_Account.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Account.Name_Length = 3
         and then Parsed_Account.State_Length = 14,
         "parse account label");
      AUnit.Assertions.Assert
        (Scanned_Account.Status = Ok
         and then Scanned_Account.Consumed = 18,
         "scan account label");

      Check
        (Humanize.Deployments.Deployment_Label
           ("release 1.2", "production", Humanize.Deployments.Deployed),
         "release 1.2 to production deployed", "deployment label");
      Check
        (Humanize.Deployments.Rollout_Label ("checkout", "25%"),
         "checkout rollout 25%", "rollout label");
      Check
        (Humanize.Deployments.Promotion_Label ("release 1.2", "staging", "production"),
         "release 1.2 promoted from staging to production",
         "promotion label");
      Check
        (Deployment_Detailed,
         "[deployments success] release 1.2 to production deployed",
         "deployment option metadata");
      AUnit.Assertions.Assert
        (Parsed_Deployment.Status = Ok
         and then Parsed_Deployment.Name_Length = 25
         and then Parsed_Deployment.State_Length = 8,
         "parse deployment label");
   end Test_Review_Accounts_Deployments;

   procedure Test_Data_Media_Notification_Permissions_Builds
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Domain_Details
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Cross_Domain_Features
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize domain gap tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine
        (T, Test_Operations_And_Comparisons'Access,
         "operations and comparisons");
      Register_Routine
        (T, Test_Review_Accounts_Deployments'Access,
         "review accounts and deployments");
      Register_Routine
        (T, Test_Data_Media_Notification_Permissions_Builds'Access,
         "data media notification permissions and builds");
      Register_Routine
        (T, Test_Domain_Details'Access,
         "domain details metadata options and parsing");
      Register_Routine
        (T, Test_Cross_Domain_Features'Access,
         "cross-domain missing feature labels");
   end Register_Tests;
end Humanize.Tests.Domain_Gaps;
