with Humanize.Comments;
with Humanize.Comparisons;
with Humanize.Data_Quality;
with Humanize.Deployments;
with Humanize.Diagnostics;
with Humanize.Endpoints;
with Humanize.Comments.Localized;
with Humanize.Comparisons.Localized;
with Humanize.Data_Quality.Localized;
with Humanize.Deployments.Localized;
with Humanize.Diagnostics.Localized;
with Humanize.Endpoints.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_2 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.comments.author_action_label",
          Humanize.Comments.Localized.Author_Action_Label
            (C,
             Author => "plain",
             State => Humanize.Comments.Draft_Comment),
          Humanize.Comments.Author_Action_Label (Author => "plain", State => Humanize.Comments.Draft_Comment));
   Check (Locale, "label.comments.author_action_label",
          Humanize.Comments.Localized.Author_Action_Label
            (C,
             Author => "plain",
             State => Humanize.Comments.Hidden_Comment),
          Humanize.Comments.Author_Action_Label (Author => "plain", State => Humanize.Comments.Hidden_Comment));
   Check (Locale, "label.comments.comment_count_label",
          Humanize.Comments.Localized.Comment_Count_Label (C, Count => 3),
          Humanize.Comments.Comment_Count_Label (Count => 3));
   Check (Locale, "label.comments.comment_count_label",
          Humanize.Comments.Localized.Comment_Count_Label (C, Count => 1),
          Humanize.Comments.Comment_Count_Label (Count => 1));
   Check (Locale, "label.comments.comment_label",
          Humanize.Comments.Localized.Comment_Label (C, Author => "plain", State => Humanize.Comments.Draft_Comment),
          Humanize.Comments.Comment_Label (Author => "plain", State => Humanize.Comments.Draft_Comment));
   Check (Locale, "label.comments.comment_label",
          Humanize.Comments.Localized.Comment_Label (C, Author => "plain", State => Humanize.Comments.Hidden_Comment),
          Humanize.Comments.Comment_Label (Author => "plain", State => Humanize.Comments.Hidden_Comment));
   Check (Locale, "label.comments.comment_state_label",
          Humanize.Comments.Localized.Comment_State_Label (C, State => Humanize.Comments.Draft_Comment),
          Humanize.Comments.Comment_State_Label (State => Humanize.Comments.Draft_Comment));
   Check (Locale, "label.comments.comment_state_label",
          Humanize.Comments.Localized.Comment_State_Label (C, State => Humanize.Comments.Hidden_Comment),
          Humanize.Comments.Comment_State_Label (State => Humanize.Comments.Hidden_Comment));
   Check (Locale, "label.comments.deleted_label",
          Humanize.Comments.Localized.Deleted_Label (C, Author => "plain"),
          Humanize.Comments.Deleted_Label (Author => "plain"));
   Check (Locale, "label.comments.edited_label",
          Humanize.Comments.Localized.Edited_Label (C, Time_Text => "plain"),
          Humanize.Comments.Edited_Label (Time_Text => "plain"));
   Check (Locale, "label.comments.hide_comment_label",
          Humanize.Comments.Localized.Hide_Comment_Label (C, Reason => "plain"),
          Humanize.Comments.Hide_Comment_Label (Reason => "plain"));
   Check (Locale, "label.comments.lock_thread_label",
          Humanize.Comments.Localized.Lock_Thread_Label (C, Name => "plain"),
          Humanize.Comments.Lock_Thread_Label (Name => "plain"));
   Check (Locale, "label.comments.mention_label",
          Humanize.Comments.Localized.Mention_Label (C, Actor => "plain", Target => "plain"),
          Humanize.Comments.Mention_Label (Actor => "plain", Target => "plain"));
   Check (Locale, "label.comments.participant_count_label",
          Humanize.Comments.Localized.Participant_Count_Label (C, Count => 3),
          Humanize.Comments.Participant_Count_Label (Count => 3));
   Check (Locale, "label.comments.participant_count_label",
          Humanize.Comments.Localized.Participant_Count_Label (C, Count => 1),
          Humanize.Comments.Participant_Count_Label (Count => 1));
   Check (Locale, "label.comments.pin_label",
          Humanize.Comments.Localized.Pin_Label (C, Name => "plain"),
          Humanize.Comments.Pin_Label (Name => "plain"));
   Check (Locale, "label.comments.reaction_kind_label",
          Humanize.Comments.Localized.Reaction_Kind_Label (C, Kind => Humanize.Comments.Like_Reaction),
          Humanize.Comments.Reaction_Kind_Label (Kind => Humanize.Comments.Like_Reaction));
   Check (Locale, "label.comments.reaction_kind_label",
          Humanize.Comments.Localized.Reaction_Kind_Label (C, Kind => Humanize.Comments.Eyes_Reaction),
          Humanize.Comments.Reaction_Kind_Label (Kind => Humanize.Comments.Eyes_Reaction));
   Check (Locale, "label.comments.reaction_label",
          Humanize.Comments.Localized.Reaction_Label (C, Kind => Humanize.Comments.Like_Reaction, Count => 3),
          Humanize.Comments.Reaction_Label (Kind => Humanize.Comments.Like_Reaction, Count => 3));
   Check (Locale, "label.comments.reaction_label",
          Humanize.Comments.Localized.Reaction_Label (C, Kind => Humanize.Comments.Eyes_Reaction, Count => 1),
          Humanize.Comments.Reaction_Label (Kind => Humanize.Comments.Eyes_Reaction, Count => 1));
   Check (Locale, "label.comments.reply_count_label",
          Humanize.Comments.Localized.Reply_Count_Label (C, Count => 3),
          Humanize.Comments.Reply_Count_Label (Count => 3));
   Check (Locale, "label.comments.reply_count_label",
          Humanize.Comments.Localized.Reply_Count_Label (C, Count => 1),
          Humanize.Comments.Reply_Count_Label (Count => 1));
   Check (Locale, "label.comments.resolved_label",
          Humanize.Comments.Localized.Resolved_Label (C, Name => "plain"),
          Humanize.Comments.Resolved_Label (Name => "plain"));
   Check (Locale, "label.comments.subscribe_label",
          Humanize.Comments.Localized.Subscribe_Label (C, Name => "plain"),
          Humanize.Comments.Subscribe_Label (Name => "plain"));
   Check (Locale, "label.comments.thread_count_label",
          Humanize.Comments.Localized.Thread_Count_Label (C, Count => 3),
          Humanize.Comments.Thread_Count_Label (Count => 3));
   Check (Locale, "label.comments.thread_count_label",
          Humanize.Comments.Localized.Thread_Count_Label (C, Count => 1),
          Humanize.Comments.Thread_Count_Label (Count => 1));
   Check (Locale, "label.comments.thread_label",
          Humanize.Comments.Localized.Thread_Label
            (C,
             Name => "plain",
             State => Humanize.Comments.Open_Thread,
             Count => 3),
          Humanize.Comments.Thread_Label (Name => "plain", State => Humanize.Comments.Open_Thread, Count => 3));
   Check (Locale, "label.comments.thread_label",
          Humanize.Comments.Localized.Thread_Label
            (C,
             Name => "plain",
             State => Humanize.Comments.Archived_Thread,
             Count => 1),
          Humanize.Comments.Thread_Label (Name => "plain", State => Humanize.Comments.Archived_Thread, Count => 1));
   Check (Locale, "label.comments.thread_state_label",
          Humanize.Comments.Localized.Thread_State_Label (C, State => Humanize.Comments.Open_Thread),
          Humanize.Comments.Thread_State_Label (State => Humanize.Comments.Open_Thread));
   Check (Locale, "label.comments.thread_state_label",
          Humanize.Comments.Localized.Thread_State_Label (C, State => Humanize.Comments.Archived_Thread),
          Humanize.Comments.Thread_State_Label (State => Humanize.Comments.Archived_Thread));
   Check (Locale, "label.comments.unpin_label",
          Humanize.Comments.Localized.Unpin_Label (C, Name => "plain"),
          Humanize.Comments.Unpin_Label (Name => "plain"));
   Check (Locale, "label.comments.unsubscribe_label",
          Humanize.Comments.Localized.Unsubscribe_Label (C, Name => "plain"),
          Humanize.Comments.Unsubscribe_Label (Name => "plain"));
   Check (Locale, "label.comparisons.baseline_label",
          Humanize.Comparisons.Localized.Baseline_Label (C, Name => "plain", Result => Humanize.Comparisons.Improved),
          Humanize.Comparisons.Baseline_Label (Name => "plain", Result => Humanize.Comparisons.Improved));
   Check (Locale, "label.comparisons.baseline_label",
          Humanize.Comparisons.Localized.Baseline_Label
            (C,
             Name => "plain",
             Result => Humanize.Comparisons.Baseline_Unavailable),
          Humanize.Comparisons.Baseline_Label (Name => "plain", Result => Humanize.Comparisons.Baseline_Unavailable));
   Check (Locale, "label.comparisons.comparison_result_label",
          Humanize.Comparisons.Localized.Comparison_Result_Label (C, Result => Humanize.Comparisons.Improved),
          Humanize.Comparisons.Comparison_Result_Label (Result => Humanize.Comparisons.Improved));
   Check (Locale, "label.comparisons.comparison_result_label",
          Humanize.Comparisons.Localized.Comparison_Result_Label
            (C,
             Result => Humanize.Comparisons.Baseline_Unavailable),
          Humanize.Comparisons.Comparison_Result_Label (Result => Humanize.Comparisons.Baseline_Unavailable));
   Check (Locale, "label.comparisons.difference_label",
          Humanize.Comparisons.Localized.Difference_Label
            (C,
             Name => "plain",
             Difference_Text => "plain",
             Result => Humanize.Comparisons.Improved),
          Humanize.Comparisons.Difference_Label
            (Name => "plain",
             Difference_Text => "plain",
             Result => Humanize.Comparisons.Improved));
   Check (Locale, "label.comparisons.difference_label",
          Humanize.Comparisons.Localized.Difference_Label
            (C,
             Name => "plain",
             Difference_Text => "plain",
             Result => Humanize.Comparisons.Baseline_Unavailable),
          Humanize.Comparisons.Difference_Label
            (Name => "plain",
             Difference_Text => "plain",
             Result => Humanize.Comparisons.Baseline_Unavailable));
   Check (Locale, "label.comparisons.tolerance_label",
          Humanize.Comparisons.Localized.Tolerance_Label
            (C,
             Name => "plain",
             Difference_Text => "plain",
             Tolerance_Text => "plain",
             Result => Humanize.Comparisons.Improved),
          Humanize.Comparisons.Tolerance_Label
            (Name => "plain",
             Difference_Text => "plain",
             Tolerance_Text => "plain",
             Result => Humanize.Comparisons.Improved));
   Check (Locale, "label.comparisons.tolerance_label",
          Humanize.Comparisons.Localized.Tolerance_Label
            (C,
             Name => "plain",
             Difference_Text => "plain",
             Tolerance_Text => "plain",
             Result => Humanize.Comparisons.Baseline_Unavailable),
          Humanize.Comparisons.Tolerance_Label
            (Name => "plain",
             Difference_Text => "plain",
             Tolerance_Text => "plain",
             Result => Humanize.Comparisons.Baseline_Unavailable));
   Check (Locale, "label.data_quality.data_issue_label",
          Humanize.Data_Quality.Localized.Data_Issue_Label (C, Issue => Humanize.Data_Quality.Invalid_Row),
          Humanize.Data_Quality.Data_Issue_Label (Issue => Humanize.Data_Quality.Invalid_Row));
   Check (Locale, "label.data_quality.data_issue_label",
          Humanize.Data_Quality.Localized.Data_Issue_Label (C, Issue => Humanize.Data_Quality.Skipped_Record),
          Humanize.Data_Quality.Data_Issue_Label (Issue => Humanize.Data_Quality.Skipped_Record));
   Check (Locale, "label.data_quality.import_check_state_label",
          Humanize.Data_Quality.Localized.Import_Check_State_Label (C, State => Humanize.Data_Quality.Dry_Run_Passed),
          Humanize.Data_Quality.Import_Check_State_Label (State => Humanize.Data_Quality.Dry_Run_Passed));
   Check (Locale, "label.data_quality.import_check_state_label",
          Humanize.Data_Quality.Localized.Import_Check_State_Label (C, State => Humanize.Data_Quality.Import_Partial),
          Humanize.Data_Quality.Import_Check_State_Label (State => Humanize.Data_Quality.Import_Partial));
   Check (Locale, "label.data_quality.import_result_label",
          Humanize.Data_Quality.Localized.Import_Result_Label
            (C,
             Name => "plain",
             State => Humanize.Data_Quality.Dry_Run_Passed,
             Accepted => 3,
             Rejected => 3),
          Humanize.Data_Quality.Import_Result_Label
            (Name => "plain",
             State => Humanize.Data_Quality.Dry_Run_Passed,
             Accepted => 3,
             Rejected => 3));
   Check (Locale, "label.data_quality.import_result_label",
          Humanize.Data_Quality.Localized.Import_Result_Label
            (C,
             Name => "plain",
             State => Humanize.Data_Quality.Import_Partial,
             Accepted => 1,
             Rejected => 1),
          Humanize.Data_Quality.Import_Result_Label
            (Name => "plain",
             State => Humanize.Data_Quality.Import_Partial,
             Accepted => 1,
             Rejected => 1));
   Check (Locale, "label.data_quality.issue_count_label",
          Humanize.Data_Quality.Localized.Issue_Count_Label
            (C,
             Issue => Humanize.Data_Quality.Invalid_Row,
             Count => 3),
          Humanize.Data_Quality.Issue_Count_Label (Issue => Humanize.Data_Quality.Invalid_Row, Count => 3));
   Check (Locale, "label.data_quality.issue_count_label",
          Humanize.Data_Quality.Localized.Issue_Count_Label
            (C,
             Issue => Humanize.Data_Quality.Skipped_Record,
             Count => 1),
          Humanize.Data_Quality.Issue_Count_Label (Issue => Humanize.Data_Quality.Skipped_Record, Count => 1));
   Check (Locale, "label.data_quality.row_issue_label",
          Humanize.Data_Quality.Localized.Row_Issue_Label (C, Row => 3, Issue => Humanize.Data_Quality.Invalid_Row),
          Humanize.Data_Quality.Row_Issue_Label (Row => 3, Issue => Humanize.Data_Quality.Invalid_Row));
   Check (Locale, "label.data_quality.row_issue_label",
          Humanize.Data_Quality.Localized.Row_Issue_Label
            (C,
             Row => 1,
             Issue => Humanize.Data_Quality.Skipped_Record),
          Humanize.Data_Quality.Row_Issue_Label (Row => 1, Issue => Humanize.Data_Quality.Skipped_Record));
   Check (Locale, "label.data_quality.source_file_issue_label",
          Humanize.Data_Quality.Localized.Source_File_Issue_Label
            (C,
             File_Name => "plain",
             Issue => Humanize.Data_Quality.Invalid_Row),
          Humanize.Data_Quality.Source_File_Issue_Label
            (File_Name => "plain",
             Issue => Humanize.Data_Quality.Invalid_Row));
   Check (Locale, "label.data_quality.source_file_issue_label",
          Humanize.Data_Quality.Localized.Source_File_Issue_Label
            (C,
             File_Name => "plain",
             Issue => Humanize.Data_Quality.Skipped_Record),
          Humanize.Data_Quality.Source_File_Issue_Label
            (File_Name => "plain",
             Issue => Humanize.Data_Quality.Skipped_Record));
   Check (Locale, "label.deployments.artifact_state_label",
          Humanize.Deployments.Localized.Artifact_State_Label (C, State => Humanize.Deployments.Artifact_Ready),
          Humanize.Deployments.Artifact_State_Label (State => Humanize.Deployments.Artifact_Ready));
   Check (Locale, "label.deployments.artifact_state_label",
          Humanize.Deployments.Localized.Artifact_State_Label (C, State => Humanize.Deployments.Artifact_Expired),
          Humanize.Deployments.Artifact_State_Label (State => Humanize.Deployments.Artifact_Expired));
   Check (Locale, "label.deployments.deployment_label",
          Humanize.Deployments.Localized.Deployment_Label
            (C,
             Name => "plain",
             Environment => "plain",
             State => Humanize.Deployments.Queued_Deployment),
          Humanize.Deployments.Deployment_Label
            (Name => "plain",
             Environment => "plain",
             State => Humanize.Deployments.Queued_Deployment));
   Check (Locale, "label.deployments.deployment_label",
          Humanize.Deployments.Localized.Deployment_Label
            (C,
             Name => "plain",
             Environment => "plain",
             State => Humanize.Deployments.Canceled_Deployment),
          Humanize.Deployments.Deployment_Label
            (Name => "plain",
             Environment => "plain",
             State => Humanize.Deployments.Canceled_Deployment));
   Check (Locale, "label.deployments.deployment_state_label",
          Humanize.Deployments.Localized.Deployment_State_Label (C, State => Humanize.Deployments.Queued_Deployment),
          Humanize.Deployments.Deployment_State_Label (State => Humanize.Deployments.Queued_Deployment));
   Check (Locale, "label.deployments.deployment_state_label",
          Humanize.Deployments.Localized.Deployment_State_Label
            (C,
             State => Humanize.Deployments.Canceled_Deployment),
          Humanize.Deployments.Deployment_State_Label (State => Humanize.Deployments.Canceled_Deployment));
   Check (Locale, "label.deployments.environment_state_label",
          Humanize.Deployments.Localized.Environment_State_Label
            (C,
             State => Humanize.Deployments.Healthy_Environment),
          Humanize.Deployments.Environment_State_Label (State => Humanize.Deployments.Healthy_Environment));
   Check (Locale, "label.deployments.environment_state_label",
          Humanize.Deployments.Localized.Environment_State_Label
            (C,
             State => Humanize.Deployments.Unknown_Environment),
          Humanize.Deployments.Environment_State_Label (State => Humanize.Deployments.Unknown_Environment));
   Check (Locale, "label.deployments.migration_state_label",
          Humanize.Deployments.Localized.Migration_State_Label (C, State => Humanize.Deployments.No_Migration),
          Humanize.Deployments.Migration_State_Label (State => Humanize.Deployments.No_Migration));
   Check (Locale, "label.deployments.migration_state_label",
          Humanize.Deployments.Localized.Migration_State_Label (C, State => Humanize.Deployments.Migration_Failed),
          Humanize.Deployments.Migration_State_Label (State => Humanize.Deployments.Migration_Failed));
   Check (Locale, "label.deployments.promotion_label",
          Humanize.Deployments.Localized.Promotion_Label
            (C,
             Name => "plain",
             From_Environment => "plain",
             To_Environment => "plain"),
          Humanize.Deployments.Promotion_Label
            (Name => "plain",
             From_Environment => "plain",
             To_Environment => "plain"));
   Check (Locale, "label.deployments.rollback_label",
          Humanize.Deployments.Localized.Rollback_Label (C, Name => "plain", Target => "plain"),
          Humanize.Deployments.Rollback_Label (Name => "plain", Target => "plain"));
   Check (Locale, "label.deployments.rollout_label",
          Humanize.Deployments.Localized.Rollout_Label (C, Name => "plain", Percent_Text => "plain"),
          Humanize.Deployments.Rollout_Label (Name => "plain", Percent_Text => "plain"));
   Check (Locale, "label.diagnostics.affected_items_label",
          Humanize.Diagnostics.Localized.Affected_Items_Label (C, Count => 3),
          Humanize.Diagnostics.Affected_Items_Label (Count => 3));
   Check (Locale, "label.diagnostics.affected_items_label",
          Humanize.Diagnostics.Localized.Affected_Items_Label (C, Count => 1),
          Humanize.Diagnostics.Affected_Items_Label (Count => 1));
   Check (Locale, "label.diagnostics.check_duration_label",
          Humanize.Diagnostics.Localized.Check_Duration_Label
            (C,
             Name => "plain",
             Status => Humanize.Diagnostics.Passed_Check,
             Duration_S => 3),
          Humanize.Diagnostics.Check_Duration_Label
            (Name => "plain",
             Status => Humanize.Diagnostics.Passed_Check,
             Duration_S => 3));
   Check (Locale, "label.diagnostics.check_duration_label",
          Humanize.Diagnostics.Localized.Check_Duration_Label
            (C,
             Name => "plain",
             Status => Humanize.Diagnostics.Running_Check,
             Duration_S => 1),
          Humanize.Diagnostics.Check_Duration_Label
            (Name => "plain",
             Status => Humanize.Diagnostics.Running_Check,
             Duration_S => 1));
   Check (Locale, "label.diagnostics.check_result_label",
          Humanize.Diagnostics.Localized.Check_Result_Label
            (C,
             Name => "plain",
             Status => Humanize.Diagnostics.Passed_Check),
          Humanize.Diagnostics.Check_Result_Label (Name => "plain", Status => Humanize.Diagnostics.Passed_Check));
   Check (Locale, "label.diagnostics.check_result_label",
          Humanize.Diagnostics.Localized.Check_Result_Label
            (C,
             Name => "plain",
             Status => Humanize.Diagnostics.Running_Check),
          Humanize.Diagnostics.Check_Result_Label (Name => "plain", Status => Humanize.Diagnostics.Running_Check));
   Check (Locale, "label.diagnostics.check_status_label",
          Humanize.Diagnostics.Localized.Check_Status_Label (C, Status => Humanize.Diagnostics.Passed_Check),
          Humanize.Diagnostics.Check_Status_Label (Status => Humanize.Diagnostics.Passed_Check));
   Check (Locale, "label.diagnostics.check_status_label",
          Humanize.Diagnostics.Localized.Check_Status_Label (C, Status => Humanize.Diagnostics.Running_Check),
          Humanize.Diagnostics.Check_Status_Label (Status => Humanize.Diagnostics.Running_Check));
   Check (Locale, "label.diagnostics.diagnostic_explanation_label",
          Humanize.Diagnostics.Localized.Diagnostic_Explanation_Label
            (C,
             Kind => Humanize.Diagnostics.Expected_Value,
             Subject => "plain",
             Position => 3,
             Suggestion => "plain"),
          Humanize.Diagnostics.Diagnostic_Explanation_Label
            (Kind => Humanize.Diagnostics.Expected_Value,
             Subject => "plain",
             Position => 3,
             Suggestion => "plain"));
   Check (Locale, "label.diagnostics.diagnostic_explanation_label",
          Humanize.Diagnostics.Localized.Diagnostic_Explanation_Label
            (C,
             Kind => Humanize.Diagnostics.Unknown_Diagnostic_Explanation,
             Subject => "plain",
             Position => 1,
             Suggestion => "plain"),
          Humanize.Diagnostics.Diagnostic_Explanation_Label
            (Kind => Humanize.Diagnostics.Unknown_Diagnostic_Explanation,
             Subject => "plain",
             Position => 1,
             Suggestion => "plain"));
   Check (Locale, "label.diagnostics.diagnostic_label",
          Humanize.Diagnostics.Localized.Diagnostic_Label
            (C,
             Message => "plain",
             Severity => Humanize.Diagnostics.Info_Severity,
             Path => "plain",
             Line => 3),
          Humanize.Diagnostics.Diagnostic_Label
            (Message => "plain",
             Severity => Humanize.Diagnostics.Info_Severity,
             Path => "plain",
             Line => 3));
   Check (Locale, "label.diagnostics.diagnostic_label",
          Humanize.Diagnostics.Localized.Diagnostic_Label
            (C,
             Message => "plain",
             Severity => Humanize.Diagnostics.Blocking_Severity,
             Path => "plain",
             Line => 1),
          Humanize.Diagnostics.Diagnostic_Label
            (Message => "plain",
             Severity => Humanize.Diagnostics.Blocking_Severity,
             Path => "plain",
             Line => 1));
   Check (Locale, "label.diagnostics.failed_at_label",
          Humanize.Diagnostics.Localized.Failed_At_Label (C, Path => "plain", Line => 3, Column => 3),
          Humanize.Diagnostics.Failed_At_Label (Path => "plain", Line => 3, Column => 3));
   Check (Locale, "label.diagnostics.failed_at_label",
          Humanize.Diagnostics.Localized.Failed_At_Label (C, Path => "plain", Line => 1, Column => 1),
          Humanize.Diagnostics.Failed_At_Label (Path => "plain", Line => 1, Column => 1));
   Check (Locale, "label.diagnostics.field_problem_label",
          Humanize.Diagnostics.Localized.Field_Problem_Label
            (C,
             Field_Name => "plain",
             Message => "plain",
             Severity => Humanize.Diagnostics.Info_Severity),
          Humanize.Diagnostics.Field_Problem_Label
            (Field_Name => "plain",
             Message => "plain",
             Severity => Humanize.Diagnostics.Info_Severity));
   Check (Locale, "label.diagnostics.field_problem_label",
          Humanize.Diagnostics.Localized.Field_Problem_Label
            (C,
             Field_Name => "plain",
             Message => "plain",
             Severity => Humanize.Diagnostics.Blocking_Severity),
          Humanize.Diagnostics.Field_Problem_Label
            (Field_Name => "plain",
             Message => "plain",
             Severity => Humanize.Diagnostics.Blocking_Severity));
   Check (Locale, "label.diagnostics.first_failure_label",
          Humanize.Diagnostics.Localized.First_Failure_Label (C, Check_Name => "plain", Path => "plain", Line => 3),
          Humanize.Diagnostics.First_Failure_Label (Check_Name => "plain", Path => "plain", Line => 3));
   Check (Locale, "label.diagnostics.first_failure_label",
          Humanize.Diagnostics.Localized.First_Failure_Label (C, Check_Name => "plain", Path => "plain", Line => 1),
          Humanize.Diagnostics.First_Failure_Label (Check_Name => "plain", Path => "plain", Line => 1));
   Check (Locale, "label.diagnostics.issue_count_label",
          Humanize.Diagnostics.Localized.Issue_Count_Label (C, Errors => 3, Warnings => 3, Notices => 3),
          Humanize.Diagnostics.Issue_Count_Label (Errors => 3, Warnings => 3, Notices => 3));
   Check (Locale, "label.diagnostics.issue_count_label",
          Humanize.Diagnostics.Localized.Issue_Count_Label (C, Errors => 1, Warnings => 1, Notices => 1),
          Humanize.Diagnostics.Issue_Count_Label (Errors => 1, Warnings => 1, Notices => 1));
   Check (Locale, "label.diagnostics.location_label",
          Humanize.Diagnostics.Localized.Location_Label (C, Path => "plain", Line => 3, Column => 3),
          Humanize.Diagnostics.Location_Label (Path => "plain", Line => 3, Column => 3));
   Check (Locale, "label.diagnostics.location_label",
          Humanize.Diagnostics.Localized.Location_Label (C, Path => "plain", Line => 1, Column => 1),
          Humanize.Diagnostics.Location_Label (Path => "plain", Line => 1, Column => 1));
   Check (Locale, "label.diagnostics.parser_diagnostic_explanation_label",
          Humanize.Diagnostics.Localized.Parser_Diagnostic_Explanation_Label
            (C,
             Family => Humanize.Diagnostics.Byte_Parser,
             Error => "plain",
             Position => 3),
          Humanize.Diagnostics.Parser_Diagnostic_Explanation_Label
            (Family => Humanize.Diagnostics.Byte_Parser,
             Error => "plain",
             Position => 3));
   Check (Locale, "label.diagnostics.parser_diagnostic_explanation_label",
          Humanize.Diagnostics.Localized.Parser_Diagnostic_Explanation_Label
            (C,
             Family => Humanize.Diagnostics.Unknown_Parser,
             Error => "plain",
             Position => 1),
          Humanize.Diagnostics.Parser_Diagnostic_Explanation_Label
            (Family => Humanize.Diagnostics.Unknown_Parser,
             Error => "plain",
             Position => 1));
   Check (Locale, "label.diagnostics.result_with_notices_label",
          Humanize.Diagnostics.Localized.Result_With_Notices_Label
            (C,
             Status => Humanize.Diagnostics.Passed_Check,
             Notices => 3),
          Humanize.Diagnostics.Result_With_Notices_Label (Status => Humanize.Diagnostics.Passed_Check, Notices => 3));
   Check (Locale, "label.diagnostics.result_with_notices_label",
          Humanize.Diagnostics.Localized.Result_With_Notices_Label
            (C,
             Status => Humanize.Diagnostics.Running_Check,
             Notices => 1),
          Humanize.Diagnostics.Result_With_Notices_Label (Status => Humanize.Diagnostics.Running_Check, Notices => 1));
   Check (Locale, "label.diagnostics.retry_label",
          Humanize.Diagnostics.Localized.Retry_Label (C, Attempt => 3, Limit => 3),
          Humanize.Diagnostics.Retry_Label (Attempt => 3, Limit => 3));
   Check (Locale, "label.diagnostics.retry_label",
          Humanize.Diagnostics.Localized.Retry_Label (C, Attempt => 1, Limit => 1),
          Humanize.Diagnostics.Retry_Label (Attempt => 1, Limit => 1));
   Check (Locale, "label.diagnostics.severity_label",
          Humanize.Diagnostics.Localized.Severity_Label (C, Severity => Humanize.Diagnostics.Info_Severity),
          Humanize.Diagnostics.Severity_Label (Severity => Humanize.Diagnostics.Info_Severity));
   Check (Locale, "label.diagnostics.severity_label",
          Humanize.Diagnostics.Localized.Severity_Label (C, Severity => Humanize.Diagnostics.Blocking_Severity),
          Humanize.Diagnostics.Severity_Label (Severity => Humanize.Diagnostics.Blocking_Severity));
   Check (Locale, "label.diagnostics.source_label",
          Humanize.Diagnostics.Localized.Source_Label (C, Source => Humanize.Diagnostics.Build_Source),
          Humanize.Diagnostics.Source_Label (Source => Humanize.Diagnostics.Build_Source));
   Check (Locale, "label.diagnostics.source_label",
          Humanize.Diagnostics.Localized.Source_Label (C, Source => Humanize.Diagnostics.Unknown_Source),
          Humanize.Diagnostics.Source_Label (Source => Humanize.Diagnostics.Unknown_Source));
   Check (Locale, "label.diagnostics.source_summary_label",
          Humanize.Diagnostics.Localized.Source_Summary_Label
            (C,
             Source => Humanize.Diagnostics.Build_Source,
             Count => 3),
          Humanize.Diagnostics.Source_Summary_Label (Source => Humanize.Diagnostics.Build_Source, Count => 3));
   Check (Locale, "label.diagnostics.source_summary_label",
          Humanize.Diagnostics.Localized.Source_Summary_Label
            (C,
             Source => Humanize.Diagnostics.Unknown_Source,
             Count => 1),
          Humanize.Diagnostics.Source_Summary_Label (Source => Humanize.Diagnostics.Unknown_Source, Count => 1));
   Check (Locale, "label.diagnostics.suggested_action_label",
          Humanize.Diagnostics.Localized.Suggested_Action_Label (C, Action => "plain"),
          Humanize.Diagnostics.Suggested_Action_Label (Action => "plain"));
   Check (Locale, "label.endpoints.host_kind_label",
          Humanize.Endpoints.Localized.Host_Kind_Label (C, Kind => Humanize.Endpoints.Domain_Host),
          Humanize.Endpoints.Host_Kind_Label (Kind => Humanize.Endpoints.Domain_Host));
   Check (Locale, "label.endpoints.host_kind_label",
          Humanize.Endpoints.Localized.Host_Kind_Label (C, Kind => Humanize.Endpoints.Unknown_Host),
          Humanize.Endpoints.Host_Kind_Label (Kind => Humanize.Endpoints.Unknown_Host));
end Check_Group_2;
