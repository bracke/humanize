with Humanize.Tasks;
with Humanize.Thresholds;
with Humanize.Versions;
with Humanize.Workflows;
with Humanize.Tasks.Localized;
with Humanize.Thresholds.Localized;
with Humanize.Versions.Localized;
with Humanize.Workflows.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_7 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.tasks.assignment_label", Phrase,
          Humanize.Tasks.Localized.Assignment_Label (C, Assignee => "plain", State => Humanize.Tasks.Unassigned),
          Humanize.Tasks.Assignment_Label (Assignee => "plain", State => Humanize.Tasks.Unassigned));
   Check (Locale, "label.tasks.assignment_label", Phrase,
          Humanize.Tasks.Localized.Assignment_Label (C, Assignee => "plain", State => Humanize.Tasks.Owned),
          Humanize.Tasks.Assignment_Label (Assignee => "plain", State => Humanize.Tasks.Owned));
   Check (Locale, "label.tasks.assignment_label", Prefix,
          Humanize.Tasks.Localized.Assignment_Label (C, Assignee => "plain", State => Humanize.Tasks.Unassigned,
            Options => (Humanize.Tasks.Default_Task_Label_Options with delta Include_Surface => True)),
          Humanize.Tasks.Assignment_Label (Assignee => "plain", State => Humanize.Tasks.Unassigned, Options =>
            (Humanize.Tasks.Default_Task_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.tasks.assignment_state_label", Phrase,
          Humanize.Tasks.Localized.Assignment_State_Label (C, State => Humanize.Tasks.Unassigned),
          Humanize.Tasks.Assignment_State_Label (State => Humanize.Tasks.Unassigned));
   Check (Locale, "label.tasks.assignment_state_label", Phrase,
          Humanize.Tasks.Localized.Assignment_State_Label (C, State => Humanize.Tasks.Owned),
          Humanize.Tasks.Assignment_State_Label (State => Humanize.Tasks.Owned));
   Check (Locale, "label.tasks.backlog_label", Phrase,
          Humanize.Tasks.Localized.Backlog_Label (C, Count => 3),
          Humanize.Tasks.Backlog_Label (Count => 3));
   Check (Locale, "label.tasks.backlog_label", Phrase,
          Humanize.Tasks.Localized.Backlog_Label (C, Count => 1),
          Humanize.Tasks.Backlog_Label (Count => 1));
   Check (Locale, "label.tasks.blocker_label", Phrase,
          Humanize.Tasks.Localized.Blocker_Label (C, Name => "plain"),
          Humanize.Tasks.Blocker_Label (Name => "plain"));
   Check (Locale, "label.tasks.checklist_label", Phrase,
          Humanize.Tasks.Localized.Checklist_Label (C, Done => 7, Total => 9),
          Humanize.Tasks.Checklist_Label (Done => 7, Total => 9));
   Check (Locale, "label.tasks.checklist_label", Phrase,
          Humanize.Tasks.Localized.Checklist_Label (C, Done => 1, Total => 2),
          Humanize.Tasks.Checklist_Label (Done => 1, Total => 2));
   Check (Locale, "label.tasks.complete_action_label", Phrase,
          Humanize.Tasks.Localized.Complete_Action_Label (C, Count => 3),
          Humanize.Tasks.Complete_Action_Label (Count => 3));
   Check (Locale, "label.tasks.complete_action_label", Phrase,
          Humanize.Tasks.Localized.Complete_Action_Label (C, Count => 1),
          Humanize.Tasks.Complete_Action_Label (Count => 1));
   Check (Locale, "label.tasks.completed_task_count_label", Phrase,
          Humanize.Tasks.Localized.Completed_Task_Count_Label (C, Count => 3),
          Humanize.Tasks.Completed_Task_Count_Label (Count => 3));
   Check (Locale, "label.tasks.completed_task_count_label", Phrase,
          Humanize.Tasks.Localized.Completed_Task_Count_Label (C, Count => 1),
          Humanize.Tasks.Completed_Task_Count_Label (Count => 1));
   Check (Locale, "label.tasks.due_label", Phrase,
          Humanize.Tasks.Localized.Due_Label (C, Due_Text => "plain"),
          Humanize.Tasks.Due_Label (Due_Text => "plain"));
   Check (Locale, "label.tasks.estimate_label", Phrase,
          Humanize.Tasks.Localized.Estimate_Label (C, Estimate_Text => "plain"),
          Humanize.Tasks.Estimate_Label (Estimate_Text => "plain"));
   Check (Locale, "label.tasks.open_task_count_label", Phrase,
          Humanize.Tasks.Localized.Open_Task_Count_Label (C, Count => 3),
          Humanize.Tasks.Open_Task_Count_Label (Count => 3));
   Check (Locale, "label.tasks.open_task_count_label", Phrase,
          Humanize.Tasks.Localized.Open_Task_Count_Label (C, Count => 1),
          Humanize.Tasks.Open_Task_Count_Label (Count => 1));
   Check (Locale, "label.tasks.overdue_label", Phrase,
          Humanize.Tasks.Localized.Overdue_Label (C, Due_Text => "plain"),
          Humanize.Tasks.Overdue_Label (Due_Text => "plain"));
   Check (Locale, "label.tasks.recurring_task_label", Phrase,
          Humanize.Tasks.Localized.Recurring_Task_Label (C, Schedule_Text => "plain"),
          Humanize.Tasks.Recurring_Task_Label (Schedule_Text => "plain"));
   Check (Locale, "label.tasks.reopen_action_label", Phrase,
          Humanize.Tasks.Localized.Reopen_Action_Label (C, Count => 3),
          Humanize.Tasks.Reopen_Action_Label (Count => 3));
   Check (Locale, "label.tasks.reopen_action_label", Phrase,
          Humanize.Tasks.Localized.Reopen_Action_Label (C, Count => 1),
          Humanize.Tasks.Reopen_Action_Label (Count => 1));
   Check (Locale, "label.tasks.sprint_label", Phrase,
          Humanize.Tasks.Localized.Sprint_Label (C, Name => "plain", Count => 3),
          Humanize.Tasks.Sprint_Label (Name => "plain", Count => 3));
   Check (Locale, "label.tasks.sprint_label", Phrase,
          Humanize.Tasks.Localized.Sprint_Label (C, Name => "plain", Count => 1),
          Humanize.Tasks.Sprint_Label (Name => "plain", Count => 1));
   Check (Locale, "label.tasks.subtask_label", Phrase,
          Humanize.Tasks.Localized.Subtask_Label (C, Name => "plain", Count => 3),
          Humanize.Tasks.Subtask_Label (Name => "plain", Count => 3));
   Check (Locale, "label.tasks.subtask_label", Phrase,
          Humanize.Tasks.Localized.Subtask_Label (C, Name => "plain", Count => 1),
          Humanize.Tasks.Subtask_Label (Name => "plain", Count => 1));
   Check (Locale, "label.tasks.task_count_label", Phrase,
          Humanize.Tasks.Localized.Task_Count_Label (C, Count => 3),
          Humanize.Tasks.Task_Count_Label (Count => 3));
   Check (Locale, "label.tasks.task_count_label", Phrase,
          Humanize.Tasks.Localized.Task_Count_Label (C, Count => 1),
          Humanize.Tasks.Task_Count_Label (Count => 1));
   Check (Locale, "label.tasks.task_label", Phrase,
          Humanize.Tasks.Localized.Task_Label (C, Name => "plain", State => Humanize.Tasks.Open_Task, Priority =>
            Humanize.Tasks.No_Priority),
          Humanize.Tasks.Task_Label (Name => "plain", State => Humanize.Tasks.Open_Task, Priority =>
            Humanize.Tasks.No_Priority));
   Check (Locale, "label.tasks.task_label", Phrase,
          Humanize.Tasks.Localized.Task_Label (C, Name => "plain", State => Humanize.Tasks.Overdue_Task, Priority =>
            Humanize.Tasks.Critical_Priority),
          Humanize.Tasks.Task_Label (Name => "plain", State => Humanize.Tasks.Overdue_Task, Priority =>
            Humanize.Tasks.Critical_Priority));
   Check (Locale, "label.tasks.task_label", Prefix,
          Humanize.Tasks.Localized.Task_Label (C, Name => "plain", State => Humanize.Tasks.Open_Task, Priority =>
            Humanize.Tasks.No_Priority, Options => (Humanize.Tasks.Default_Task_Label_Options with delta
            Include_Surface => True)),
          Humanize.Tasks.Task_Label (Name => "plain", State => Humanize.Tasks.Open_Task, Priority =>
            Humanize.Tasks.No_Priority, Options => (Humanize.Tasks.Default_Task_Label_Options with delta
            Include_Surface => True)));
   Check (Locale, "label.tasks.task_priority_label", Phrase,
          Humanize.Tasks.Localized.Task_Priority_Label (C, Priority => Humanize.Tasks.No_Priority),
          Humanize.Tasks.Task_Priority_Label (Priority => Humanize.Tasks.No_Priority));
   Check (Locale, "label.tasks.task_priority_label", Phrase,
          Humanize.Tasks.Localized.Task_Priority_Label (C, Priority => Humanize.Tasks.Critical_Priority),
          Humanize.Tasks.Task_Priority_Label (Priority => Humanize.Tasks.Critical_Priority));
   Check (Locale, "label.tasks.task_state_label", Phrase,
          Humanize.Tasks.Localized.Task_State_Label (C, State => Humanize.Tasks.Open_Task),
          Humanize.Tasks.Task_State_Label (State => Humanize.Tasks.Open_Task));
   Check (Locale, "label.tasks.task_state_label", Phrase,
          Humanize.Tasks.Localized.Task_State_Label (C, State => Humanize.Tasks.Overdue_Task),
          Humanize.Tasks.Task_State_Label (State => Humanize.Tasks.Overdue_Task));
   Check (Locale, "label.thresholds.breach_label", Phrase,
          Humanize.Thresholds.Localized.Breach_Label (C, Value => 7.25, Limit => 9.75, Direction =>
            Humanize.Thresholds.Lower_Limit, Unit => "plain", Decimals => 7),
          Humanize.Thresholds.Breach_Label (Value => 7.25, Limit => 9.75, Direction =>
            Humanize.Thresholds.Lower_Limit, Unit => "plain", Decimals => 7));
   Check (Locale, "label.thresholds.breach_label", Phrase,
          Humanize.Thresholds.Localized.Breach_Label (C, Value => 7.25, Limit => 0.0, Direction =>
            Humanize.Thresholds.Upper_Limit, Unit => "plain", Decimals => 0),
          Humanize.Thresholds.Breach_Label (Value => 7.25, Limit => 0.0, Direction =>
            Humanize.Thresholds.Upper_Limit, Unit => "plain", Decimals => 0));
   Check (Locale, "label.thresholds.budget_used_label", Phrase,
          Humanize.Thresholds.Localized.Budget_Used_Label (C, Used => 7.25, Budget => 9.75, Unit => "plain",
            Decimals => 7),
          Humanize.Thresholds.Budget_Used_Label (Used => 7.25, Budget => 9.75, Unit => "plain", Decimals => 7));
   Check (Locale, "label.thresholds.budget_used_label", Phrase,
          Humanize.Thresholds.Localized.Budget_Used_Label (C, Used => 7.25, Budget => 0.0, Unit => "plain", Decimals
            => 0),
          Humanize.Thresholds.Budget_Used_Label (Used => 7.25, Budget => 0.0, Unit => "plain", Decimals => 0));
   Check (Locale, "label.thresholds.metric_value_label", Phrase,
          Humanize.Thresholds.Localized.Metric_Value_Label (C, Name => "plain", Value => 7.25, Unit => "plain",
            Decimals => 7),
          Humanize.Thresholds.Metric_Value_Label (Name => "plain", Value => 7.25, Unit => "plain", Decimals => 7));
   Check (Locale, "label.thresholds.metric_value_label", Phrase,
          Humanize.Thresholds.Localized.Metric_Value_Label (C, Name => "plain", Value => 7.25, Unit => "plain",
            Decimals => 0),
          Humanize.Thresholds.Metric_Value_Label (Name => "plain", Value => 7.25, Unit => "plain", Decimals => 0));
   Check (Locale, "label.thresholds.near_limit_label", Phrase,
          Humanize.Thresholds.Localized.Near_Limit_Label (C, Value => 7.25, Limit => 9.75, Margin => 4.5, Direction
            => Humanize.Thresholds.Lower_Limit, Unit => "plain", Decimals => 7),
          Humanize.Thresholds.Near_Limit_Label (Value => 7.25, Limit => 9.75, Margin => 4.5, Direction =>
            Humanize.Thresholds.Lower_Limit, Unit => "plain", Decimals => 7));
   Check (Locale, "label.thresholds.near_limit_label", Phrase,
          Humanize.Thresholds.Localized.Near_Limit_Label (C, Value => 7.25, Limit => 0.0, Margin => 0.0, Direction
            => Humanize.Thresholds.Upper_Limit, Unit => "plain", Decimals => 0),
          Humanize.Thresholds.Near_Limit_Label (Value => 7.25, Limit => 0.0, Margin => 0.0, Direction =>
            Humanize.Thresholds.Upper_Limit, Unit => "plain", Decimals => 0));
   Check (Locale, "label.thresholds.percent_of_limit_label", Phrase,
          Humanize.Thresholds.Localized.Percent_Of_Limit_Label (C, Value => 7.25, Limit => 9.75, Decimals => 7),
          Humanize.Thresholds.Percent_Of_Limit_Label (Value => 7.25, Limit => 9.75, Decimals => 7));
   Check (Locale, "label.thresholds.percent_of_limit_label", Phrase,
          Humanize.Thresholds.Localized.Percent_Of_Limit_Label (C, Value => 7.25, Limit => 9.75, Decimals => 0),
          Humanize.Thresholds.Percent_Of_Limit_Label (Value => 7.25, Limit => 9.75, Decimals => 0));
   Check (Locale, "label.thresholds.range_label", Phrase,
          Humanize.Thresholds.Localized.Range_Label (C, Low => 7.25, High => 9.75, Unit => "plain", Decimals => 7,
            Inclusive => Humanize.Thresholds.Exclusive_Window),
          Humanize.Thresholds.Range_Label (Low => 7.25, High => 9.75, Unit => "plain", Decimals => 7, Inclusive =>
            Humanize.Thresholds.Exclusive_Window));
   Check (Locale, "label.thresholds.range_label", Phrase,
          Humanize.Thresholds.Localized.Range_Label (C, Low => 0.0, High => 9.75, Unit => "plain", Decimals => 2,
            Inclusive => Humanize.Thresholds.Inclusive_Window),
          Humanize.Thresholds.Range_Label (Low => 0.0, High => 9.75, Unit => "plain", Decimals => 2, Inclusive =>
            Humanize.Thresholds.Inclusive_Window));
   Check (Locale, "label.thresholds.remaining_to_limit_label", Phrase,
          Humanize.Thresholds.Localized.Remaining_To_Limit_Label (C, Value => 7.25, Limit => 9.75, Direction =>
            Humanize.Thresholds.Lower_Limit, Unit => "plain", Decimals => 7),
          Humanize.Thresholds.Remaining_To_Limit_Label (Value => 7.25, Limit => 9.75, Direction =>
            Humanize.Thresholds.Lower_Limit, Unit => "plain", Decimals => 7));
   Check (Locale, "label.thresholds.remaining_to_limit_label", Phrase,
          Humanize.Thresholds.Localized.Remaining_To_Limit_Label (C, Value => 7.25, Limit => 0.0, Direction =>
            Humanize.Thresholds.Upper_Limit, Unit => "plain", Decimals => 0),
          Humanize.Thresholds.Remaining_To_Limit_Label (Value => 7.25, Limit => 0.0, Direction =>
            Humanize.Thresholds.Upper_Limit, Unit => "plain", Decimals => 0));
   Check (Locale, "label.thresholds.target_delta_label", Phrase,
          Humanize.Thresholds.Localized.Target_Delta_Label (C, Value => 7.25, Target => 9.75, Unit => "plain",
            Decimals => 7),
          Humanize.Thresholds.Target_Delta_Label (Value => 7.25, Target => 9.75, Unit => "plain", Decimals => 7));
   Check (Locale, "label.thresholds.target_delta_label", Phrase,
          Humanize.Thresholds.Localized.Target_Delta_Label (C, Value => 7.25, Target => 0.0, Unit => "plain",
            Decimals => 0),
          Humanize.Thresholds.Target_Delta_Label (Value => 7.25, Target => 0.0, Unit => "plain", Decimals => 0));
   Check (Locale, "label.thresholds.target_window_label", Phrase,
          Humanize.Thresholds.Localized.Target_Window_Label (C, Target => 7.25, Tolerance => 9.75, Unit => "plain",
            Decimals => 7),
          Humanize.Thresholds.Target_Window_Label (Target => 7.25, Tolerance => 9.75, Unit => "plain", Decimals =>
            7));
   Check (Locale, "label.thresholds.target_window_label", Phrase,
          Humanize.Thresholds.Localized.Target_Window_Label (C, Target => 7.25, Tolerance => 0.0, Unit => "plain",
            Decimals => 0),
          Humanize.Thresholds.Target_Window_Label (Target => 7.25, Tolerance => 0.0, Unit => "plain", Decimals =>
            0));
   Check (Locale, "label.thresholds.threshold_direction_label", Phrase,
          Humanize.Thresholds.Localized.Threshold_Direction_Label (C, Direction => Humanize.Thresholds.Upper_Limit),
          Humanize.Thresholds.Threshold_Direction_Label (Direction => Humanize.Thresholds.Upper_Limit));
   Check (Locale, "label.thresholds.threshold_direction_label", Phrase,
          Humanize.Thresholds.Localized.Threshold_Direction_Label (C, Direction => Humanize.Thresholds.Lower_Limit),
          Humanize.Thresholds.Threshold_Direction_Label (Direction => Humanize.Thresholds.Lower_Limit));
   Check (Locale, "label.thresholds.threshold_state_label", Phrase,
          Humanize.Thresholds.Localized.Threshold_State_Label (C, State => Humanize.Thresholds.Below_Range),
          Humanize.Thresholds.Threshold_State_Label (State => Humanize.Thresholds.Below_Range));
   Check (Locale, "label.thresholds.threshold_state_label", Phrase,
          Humanize.Thresholds.Localized.Threshold_State_Label (C, State => Humanize.Thresholds.Unknown_State),
          Humanize.Thresholds.Threshold_State_Label (State => Humanize.Thresholds.Unknown_State));
   Check (Locale, "label.thresholds.threshold_state_label", Prefix,
          Humanize.Thresholds.Localized.Threshold_State_Label (C, State => Humanize.Thresholds.Below_Range, Options
            => (Humanize.Thresholds.Default_Threshold_Label_Options with delta Include_Surface => True)),
          Humanize.Thresholds.Threshold_State_Label (State => Humanize.Thresholds.Below_Range, Options =>
            (Humanize.Thresholds.Default_Threshold_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.thresholds.threshold_status_label", Phrase,
          Humanize.Thresholds.Localized.Threshold_Status_Label (C, Value => 7.25, Warning => 9.75, Critical => 4.5,
            Direction => Humanize.Thresholds.Lower_Limit, Unit => "plain", Decimals => 7),
          Humanize.Thresholds.Threshold_Status_Label (Value => 7.25, Warning => 9.75, Critical => 4.5, Direction =>
            Humanize.Thresholds.Lower_Limit, Unit => "plain", Decimals => 7));
   Check (Locale, "label.thresholds.threshold_status_label", Phrase,
          Humanize.Thresholds.Localized.Threshold_Status_Label (C, Value => 7.25, Warning => 0.0, Critical => 0.0,
            Direction => Humanize.Thresholds.Upper_Limit, Unit => "plain", Decimals => 0),
          Humanize.Thresholds.Threshold_Status_Label (Value => 7.25, Warning => 0.0, Critical => 0.0, Direction =>
            Humanize.Thresholds.Upper_Limit, Unit => "plain", Decimals => 0));
   Check (Locale, "label.thresholds.threshold_status_label", Prefix,
          Humanize.Thresholds.Localized.Threshold_Status_Label (C, Value => 7.25, Warning => 9.75, Critical => 4.5,
            Direction => Humanize.Thresholds.Lower_Limit, Unit => "plain", Decimals => 7, Options =>
            (Humanize.Thresholds.Default_Threshold_Label_Options with delta Include_Surface => True)),
          Humanize.Thresholds.Threshold_Status_Label (Value => 7.25, Warning => 9.75, Critical => 4.5, Direction =>
            Humanize.Thresholds.Lower_Limit, Unit => "plain", Decimals => 7, Options =>
            (Humanize.Thresholds.Default_Threshold_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.thresholds.threshold_summary_label", Plain,
          Humanize.Thresholds.Localized.Threshold_Summary_Label (C, Normal => 7, Warnings => 9, Critical => 4,
            Breaches => 6),
          Humanize.Thresholds.Threshold_Summary_Label (Normal => 7, Warnings => 9, Critical => 4, Breaches => 6));
   Check (Locale, "label.thresholds.threshold_summary_label", Plain,
          Humanize.Thresholds.Localized.Threshold_Summary_Label (C, Normal => 2, Warnings => 0, Critical => 0,
            Breaches => 0),
          Humanize.Thresholds.Threshold_Summary_Label (Normal => 2, Warnings => 0, Critical => 0, Breaches => 0));
   Check (Locale, "label.thresholds.tolerance_label", Phrase,
          Humanize.Thresholds.Localized.Tolerance_Label (C, Tolerance => 7.25, Unit => "plain", Decimals => 7),
          Humanize.Thresholds.Tolerance_Label (Tolerance => 7.25, Unit => "plain", Decimals => 7));
   Check (Locale, "label.thresholds.tolerance_label", Phrase,
          Humanize.Thresholds.Localized.Tolerance_Label (C, Tolerance => 7.25, Unit => "plain", Decimals => 0),
          Humanize.Thresholds.Tolerance_Label (Tolerance => 7.25, Unit => "plain", Decimals => 0));
   Check (Locale, "label.thresholds.window_status_label", Phrase,
          Humanize.Thresholds.Localized.Window_Status_Label (C, Value => 7.25, Low => 0.0, High => 4.5, Unit =>
            "plain", Decimals => 7, Inclusive => Humanize.Thresholds.Exclusive_Window),
          Humanize.Thresholds.Window_Status_Label (Value => 7.25, Low => 0.0, High => 4.5, Unit => "plain", Decimals
            => 7, Inclusive => Humanize.Thresholds.Exclusive_Window));
   Check (Locale, "label.thresholds.window_status_label", Phrase,
          Humanize.Thresholds.Localized.Window_Status_Label (C, Value => 7.25, Low => 0.0, High => 0.0, Unit =>
            "plain", Decimals => 0, Inclusive => Humanize.Thresholds.Inclusive_Window),
          Humanize.Thresholds.Window_Status_Label (Value => 7.25, Low => 0.0, High => 0.0, Unit => "plain", Decimals
            => 0, Inclusive => Humanize.Thresholds.Inclusive_Window));
   Check (Locale, "label.thresholds.window_status_label", Prefix,
          Humanize.Thresholds.Localized.Window_Status_Label (C, Value => 7.25, Low => 0.0, High => 4.5, Unit =>
            "plain", Decimals => 7, Inclusive => Humanize.Thresholds.Exclusive_Window, Options =>
            (Humanize.Thresholds.Default_Threshold_Label_Options with delta Include_Surface => True)),
          Humanize.Thresholds.Window_Status_Label (Value => 7.25, Low => 0.0, High => 4.5, Unit => "plain", Decimals
            => 7, Inclusive => Humanize.Thresholds.Exclusive_Window, Options =>
            (Humanize.Thresholds.Default_Threshold_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.versions.commit_distance_label", Phrase,
          Humanize.Versions.Localized.Commit_Distance_Label (C, Ahead => 3, Behind => 3),
          Humanize.Versions.Commit_Distance_Label (Ahead => 3, Behind => 3));
   Check (Locale, "label.versions.commit_distance_label", Phrase,
          Humanize.Versions.Localized.Commit_Distance_Label (C, Ahead => 1, Behind => 1),
          Humanize.Versions.Commit_Distance_Label (Ahead => 1, Behind => 1));
   Check (Locale, "label.versions.commit_distance_label", Prefix,
          Humanize.Versions.Localized.Commit_Distance_Label (C, Ahead => 3, Behind => 3, Options =>
            (Humanize.Versions.Default_Version_Label_Options with delta Include_Surface => True)),
          Humanize.Versions.Commit_Distance_Label (Ahead => 3, Behind => 3, Options =>
            (Humanize.Versions.Default_Version_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.workflows.approval_label", Phrase,
          Humanize.Workflows.Localized.Approval_Label (C, Approver => "plain", Waiting => False),
          Humanize.Workflows.Approval_Label (Approver => "plain", Waiting => False));
   Check (Locale, "label.workflows.approval_label", Phrase,
          Humanize.Workflows.Localized.Approval_Label (C, Approver => "plain", Waiting => True),
          Humanize.Workflows.Approval_Label (Approver => "plain", Waiting => True));
   Check (Locale, "label.workflows.attempt_label", Phrase,
          Humanize.Workflows.Localized.Attempt_Label (C, Attempt => 3, Limit => 3),
          Humanize.Workflows.Attempt_Label (Attempt => 3, Limit => 3));
   Check (Locale, "label.workflows.attempt_label", Phrase,
          Humanize.Workflows.Localized.Attempt_Label (C, Attempt => 1, Limit => 1),
          Humanize.Workflows.Attempt_Label (Attempt => 1, Limit => 1));
   Check (Locale, "label.workflows.blocker_label", Phrase,
          Humanize.Workflows.Localized.Blocker_Label (C, Reason => "plain"),
          Humanize.Workflows.Blocker_Label (Reason => "plain"));
   Check (Locale, "label.workflows.dependency_label", Phrase,
          Humanize.Workflows.Localized.Dependency_Label (C, Count => 3),
          Humanize.Workflows.Dependency_Label (Count => 3));
   Check (Locale, "label.workflows.dependency_label", Phrase,
          Humanize.Workflows.Localized.Dependency_Label (C, Count => 1),
          Humanize.Workflows.Dependency_Label (Count => 1));
   Check (Locale, "label.workflows.handoff_label", Phrase,
          Humanize.Workflows.Localized.Handoff_Label (C, From => "plain", To => "plain"),
          Humanize.Workflows.Handoff_Label (From => "plain", To => "plain"));
   Check (Locale, "label.workflows.milestone_label", Phrase,
          Humanize.Workflows.Localized.Milestone_Label (C, Current => 7, Total => 9, Name => "plain"),
          Humanize.Workflows.Milestone_Label (Current => 7, Total => 9, Name => "plain"));
   Check (Locale, "label.workflows.milestone_label", Phrase,
          Humanize.Workflows.Localized.Milestone_Label (C, Current => 1, Total => 2, Name => "plain"),
          Humanize.Workflows.Milestone_Label (Current => 1, Total => 2, Name => "plain"));
   Check (Locale, "label.workflows.milestone_state_label", Phrase,
          Humanize.Workflows.Localized.Milestone_State_Label (C, State => Humanize.Workflows.Upcoming_Milestone),
          Humanize.Workflows.Milestone_State_Label (State => Humanize.Workflows.Upcoming_Milestone));
   Check (Locale, "label.workflows.milestone_state_label", Phrase,
          Humanize.Workflows.Localized.Milestone_State_Label (C, State => Humanize.Workflows.Blocked_Milestone),
          Humanize.Workflows.Milestone_State_Label (State => Humanize.Workflows.Blocked_Milestone));
   Check (Locale, "label.workflows.milestone_status_label", Phrase,
          Humanize.Workflows.Localized.Milestone_Status_Label (C, Name => "plain", State =>
            Humanize.Workflows.Upcoming_Milestone),
          Humanize.Workflows.Milestone_Status_Label (Name => "plain", State =>
            Humanize.Workflows.Upcoming_Milestone));
   Check (Locale, "label.workflows.milestone_status_label", Phrase,
          Humanize.Workflows.Localized.Milestone_Status_Label (C, Name => "plain", State =>
            Humanize.Workflows.Blocked_Milestone),
          Humanize.Workflows.Milestone_Status_Label (Name => "plain", State =>
            Humanize.Workflows.Blocked_Milestone));
   Check (Locale, "label.workflows.milestone_status_label", Prefix,
          Humanize.Workflows.Localized.Milestone_Status_Label (C, Name => "plain", State =>
            Humanize.Workflows.Upcoming_Milestone, Options => (Humanize.Workflows.Default_Workflow_Label_Options
            with delta Include_Surface => True)),
          Humanize.Workflows.Milestone_Status_Label (Name => "plain", State =>
            Humanize.Workflows.Upcoming_Milestone, Options => (Humanize.Workflows.Default_Workflow_Label_Options
            with delta Include_Surface => True)));
   Check (Locale, "label.workflows.next_action_label", Phrase,
          Humanize.Workflows.Localized.Next_Action_Label (C, Action => "plain"),
          Humanize.Workflows.Next_Action_Label (Action => "plain"));
   Check (Locale, "label.workflows.owner_label", Phrase,
          Humanize.Workflows.Localized.Owner_Label (C, Owner => "plain"),
          Humanize.Workflows.Owner_Label (Owner => "plain"));
   Check (Locale, "label.workflows.queue_position_label", Phrase,
          Humanize.Workflows.Localized.Queue_Position_Label (C, Position => 7, Total => 9),
          Humanize.Workflows.Queue_Position_Label (Position => 7, Total => 9));
   Check (Locale, "label.workflows.queue_position_label", Phrase,
          Humanize.Workflows.Localized.Queue_Position_Label (C, Position => 2, Total => 0),
          Humanize.Workflows.Queue_Position_Label (Position => 2, Total => 0));
   Check (Locale, "label.workflows.resume_label", Phrase,
          Humanize.Workflows.Localized.Resume_Label (C, Name => "plain"),
          Humanize.Workflows.Resume_Label (Name => "plain"));
   Check (Locale, "label.workflows.step_label", Phrase,
          Humanize.Workflows.Localized.Step_Label (C, Current => 7, Total => 9, Name => "plain"),
          Humanize.Workflows.Step_Label (Current => 7, Total => 9, Name => "plain"));
   Check (Locale, "label.workflows.step_label", Phrase,
          Humanize.Workflows.Localized.Step_Label (C, Current => 2, Total => 2, Name => "plain"),
          Humanize.Workflows.Step_Label (Current => 2, Total => 2, Name => "plain"));
   Check (Locale, "label.workflows.step_state_label", Phrase,
          Humanize.Workflows.Localized.Step_State_Label (C, State => Humanize.Workflows.Pending_Step),
          Humanize.Workflows.Step_State_Label (State => Humanize.Workflows.Pending_Step));
   Check (Locale, "label.workflows.step_state_label", Phrase,
          Humanize.Workflows.Localized.Step_State_Label (C, State => Humanize.Workflows.Skipped_Step),
          Humanize.Workflows.Step_State_Label (State => Humanize.Workflows.Skipped_Step));
   Check (Locale, "label.workflows.step_status_label", Phrase,
          Humanize.Workflows.Localized.Step_Status_Label (C, Name => "plain", State =>
            Humanize.Workflows.Pending_Step),
          Humanize.Workflows.Step_Status_Label (Name => "plain", State => Humanize.Workflows.Pending_Step));
   Check (Locale, "label.workflows.step_status_label", Phrase,
          Humanize.Workflows.Localized.Step_Status_Label (C, Name => "plain", State =>
            Humanize.Workflows.Skipped_Step),
          Humanize.Workflows.Step_Status_Label (Name => "plain", State => Humanize.Workflows.Skipped_Step));
   Check (Locale, "label.workflows.step_status_label", Prefix,
          Humanize.Workflows.Localized.Step_Status_Label (C, Name => "plain", State =>
            Humanize.Workflows.Pending_Step, Options => (Humanize.Workflows.Default_Workflow_Label_Options with
            delta Include_Surface => True)),
          Humanize.Workflows.Step_Status_Label (Name => "plain", State => Humanize.Workflows.Pending_Step, Options
            => (Humanize.Workflows.Default_Workflow_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.workflows.waiting_label", Phrase,
          Humanize.Workflows.Localized.Waiting_Label (C, Reason => "plain"),
          Humanize.Workflows.Waiting_Label (Reason => "plain"));
   Check (Locale, "label.workflows.workflow_progress_label", Phrase,
          Humanize.Workflows.Localized.Workflow_Progress_Label (C, Completed => 7, Total => 9),
          Humanize.Workflows.Workflow_Progress_Label (Completed => 7, Total => 9));
   Check (Locale, "label.workflows.workflow_progress_label", Phrase,
          Humanize.Workflows.Localized.Workflow_Progress_Label (C, Completed => 1, Total => 2),
          Humanize.Workflows.Workflow_Progress_Label (Completed => 1, Total => 2));
   Check (Locale, "label.workflows.workflow_result_label", Phrase,
          Humanize.Workflows.Localized.Workflow_Result_Label (C, State => Humanize.Workflows.Not_Started_State, Name
            => "plain"),
          Humanize.Workflows.Workflow_Result_Label (State => Humanize.Workflows.Not_Started_State, Name =>
            "plain"));
   Check (Locale, "label.workflows.workflow_result_label", Phrase,
          Humanize.Workflows.Localized.Workflow_Result_Label (C, State => Humanize.Workflows.Paused_State, Name =>
            "plain"),
          Humanize.Workflows.Workflow_Result_Label (State => Humanize.Workflows.Paused_State, Name => "plain"));
   Check (Locale, "label.workflows.workflow_result_label", Prefix,
          Humanize.Workflows.Localized.Workflow_Result_Label (C, State => Humanize.Workflows.Not_Started_State, Name
            => "plain", Options => (Humanize.Workflows.Default_Workflow_Label_Options with delta Include_Surface =>
            True)),
          Humanize.Workflows.Workflow_Result_Label (State => Humanize.Workflows.Not_Started_State, Name => "plain",
            Options => (Humanize.Workflows.Default_Workflow_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.workflows.workflow_state_label", Phrase,
          Humanize.Workflows.Localized.Workflow_State_Label (C, State => Humanize.Workflows.Not_Started_State),
          Humanize.Workflows.Workflow_State_Label (State => Humanize.Workflows.Not_Started_State));
   Check (Locale, "label.workflows.workflow_state_label", Phrase,
          Humanize.Workflows.Localized.Workflow_State_Label (C, State => Humanize.Workflows.Paused_State),
          Humanize.Workflows.Workflow_State_Label (State => Humanize.Workflows.Paused_State));
end Check_Group_7;
