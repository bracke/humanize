with Humanize.Tasks;
with Humanize.Thresholds;
with Humanize.Versions;
with Humanize.Workflows;
with Humanize.Tasks.Localized;
with Humanize.Thresholds.Localized;
with Humanize.Versions.Localized;
with Humanize.Workflows.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_6 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.tasks.assignment_label",
          Humanize.Tasks.Localized.Assignment_Label (C, Assignee => "plain", State => Humanize.Tasks.Unassigned),
          Humanize.Tasks.Assignment_Label (Assignee => "plain", State => Humanize.Tasks.Unassigned));
   Check (Locale, "label.tasks.assignment_label",
          Humanize.Tasks.Localized.Assignment_Label (C, Assignee => "plain", State => Humanize.Tasks.Owned),
          Humanize.Tasks.Assignment_Label (Assignee => "plain", State => Humanize.Tasks.Owned));
   Check (Locale, "label.tasks.assignment_state_label",
          Humanize.Tasks.Localized.Assignment_State_Label (C, State => Humanize.Tasks.Unassigned),
          Humanize.Tasks.Assignment_State_Label (State => Humanize.Tasks.Unassigned));
   Check (Locale, "label.tasks.assignment_state_label",
          Humanize.Tasks.Localized.Assignment_State_Label (C, State => Humanize.Tasks.Owned),
          Humanize.Tasks.Assignment_State_Label (State => Humanize.Tasks.Owned));
   Check (Locale, "label.tasks.backlog_label",
          Humanize.Tasks.Localized.Backlog_Label (C, Count => 3),
          Humanize.Tasks.Backlog_Label (Count => 3));
   Check (Locale, "label.tasks.backlog_label",
          Humanize.Tasks.Localized.Backlog_Label (C, Count => 1),
          Humanize.Tasks.Backlog_Label (Count => 1));
   Check (Locale, "label.tasks.blocker_label",
          Humanize.Tasks.Localized.Blocker_Label (C, Name => "plain"),
          Humanize.Tasks.Blocker_Label (Name => "plain"));
   Check (Locale, "label.tasks.complete_action_label",
          Humanize.Tasks.Localized.Complete_Action_Label (C, Count => 3),
          Humanize.Tasks.Complete_Action_Label (Count => 3));
   Check (Locale, "label.tasks.complete_action_label",
          Humanize.Tasks.Localized.Complete_Action_Label (C, Count => 1),
          Humanize.Tasks.Complete_Action_Label (Count => 1));
   Check (Locale, "label.tasks.completed_task_count_label",
          Humanize.Tasks.Localized.Completed_Task_Count_Label (C, Count => 3),
          Humanize.Tasks.Completed_Task_Count_Label (Count => 3));
   Check (Locale, "label.tasks.completed_task_count_label",
          Humanize.Tasks.Localized.Completed_Task_Count_Label (C, Count => 1),
          Humanize.Tasks.Completed_Task_Count_Label (Count => 1));
   Check (Locale, "label.tasks.due_label",
          Humanize.Tasks.Localized.Due_Label (C, Due_Text => "plain"),
          Humanize.Tasks.Due_Label (Due_Text => "plain"));
   Check (Locale, "label.tasks.estimate_label",
          Humanize.Tasks.Localized.Estimate_Label (C, Estimate_Text => "plain"),
          Humanize.Tasks.Estimate_Label (Estimate_Text => "plain"));
   Check (Locale, "label.tasks.open_task_count_label",
          Humanize.Tasks.Localized.Open_Task_Count_Label (C, Count => 3),
          Humanize.Tasks.Open_Task_Count_Label (Count => 3));
   Check (Locale, "label.tasks.open_task_count_label",
          Humanize.Tasks.Localized.Open_Task_Count_Label (C, Count => 1),
          Humanize.Tasks.Open_Task_Count_Label (Count => 1));
   Check (Locale, "label.tasks.overdue_label",
          Humanize.Tasks.Localized.Overdue_Label (C, Due_Text => "plain"),
          Humanize.Tasks.Overdue_Label (Due_Text => "plain"));
   Check (Locale, "label.tasks.recurring_task_label",
          Humanize.Tasks.Localized.Recurring_Task_Label (C, Schedule_Text => "plain"),
          Humanize.Tasks.Recurring_Task_Label (Schedule_Text => "plain"));
   Check (Locale, "label.tasks.reopen_action_label",
          Humanize.Tasks.Localized.Reopen_Action_Label (C, Count => 3),
          Humanize.Tasks.Reopen_Action_Label (Count => 3));
   Check (Locale, "label.tasks.reopen_action_label",
          Humanize.Tasks.Localized.Reopen_Action_Label (C, Count => 1),
          Humanize.Tasks.Reopen_Action_Label (Count => 1));
   Check (Locale, "label.tasks.sprint_label",
          Humanize.Tasks.Localized.Sprint_Label (C, Name => "plain", Count => 3),
          Humanize.Tasks.Sprint_Label (Name => "plain", Count => 3));
   Check (Locale, "label.tasks.sprint_label",
          Humanize.Tasks.Localized.Sprint_Label (C, Name => "plain", Count => 1),
          Humanize.Tasks.Sprint_Label (Name => "plain", Count => 1));
   Check (Locale, "label.tasks.subtask_label",
          Humanize.Tasks.Localized.Subtask_Label (C, Name => "plain", Count => 3),
          Humanize.Tasks.Subtask_Label (Name => "plain", Count => 3));
   Check (Locale, "label.tasks.subtask_label",
          Humanize.Tasks.Localized.Subtask_Label (C, Name => "plain", Count => 1),
          Humanize.Tasks.Subtask_Label (Name => "plain", Count => 1));
   Check (Locale, "label.tasks.task_count_label",
          Humanize.Tasks.Localized.Task_Count_Label (C, Count => 3),
          Humanize.Tasks.Task_Count_Label (Count => 3));
   Check (Locale, "label.tasks.task_count_label",
          Humanize.Tasks.Localized.Task_Count_Label (C, Count => 1),
          Humanize.Tasks.Task_Count_Label (Count => 1));
   Check (Locale, "label.tasks.task_label",
          Humanize.Tasks.Localized.Task_Label
            (C,
             Name => "plain",
             State => Humanize.Tasks.Open_Task,
             Priority => Humanize.Tasks.No_Priority),
          Humanize.Tasks.Task_Label
            (Name => "plain",
             State => Humanize.Tasks.Open_Task,
             Priority => Humanize.Tasks.No_Priority));
   Check (Locale, "label.tasks.task_label",
          Humanize.Tasks.Localized.Task_Label
            (C,
             Name => "plain",
             State => Humanize.Tasks.Overdue_Task,
             Priority => Humanize.Tasks.Critical_Priority),
          Humanize.Tasks.Task_Label
            (Name => "plain",
             State => Humanize.Tasks.Overdue_Task,
             Priority => Humanize.Tasks.Critical_Priority));
   Check (Locale, "label.tasks.task_priority_label",
          Humanize.Tasks.Localized.Task_Priority_Label (C, Priority => Humanize.Tasks.No_Priority),
          Humanize.Tasks.Task_Priority_Label (Priority => Humanize.Tasks.No_Priority));
   Check (Locale, "label.tasks.task_priority_label",
          Humanize.Tasks.Localized.Task_Priority_Label (C, Priority => Humanize.Tasks.Critical_Priority),
          Humanize.Tasks.Task_Priority_Label (Priority => Humanize.Tasks.Critical_Priority));
   Check (Locale, "label.tasks.task_state_label",
          Humanize.Tasks.Localized.Task_State_Label (C, State => Humanize.Tasks.Open_Task),
          Humanize.Tasks.Task_State_Label (State => Humanize.Tasks.Open_Task));
   Check (Locale, "label.tasks.task_state_label",
          Humanize.Tasks.Localized.Task_State_Label (C, State => Humanize.Tasks.Overdue_Task),
          Humanize.Tasks.Task_State_Label (State => Humanize.Tasks.Overdue_Task));
   Check (Locale, "label.thresholds.threshold_direction_label",
          Humanize.Thresholds.Localized.Threshold_Direction_Label (C, Direction => Humanize.Thresholds.Upper_Limit),
          Humanize.Thresholds.Threshold_Direction_Label (Direction => Humanize.Thresholds.Upper_Limit));
   Check (Locale, "label.thresholds.threshold_direction_label",
          Humanize.Thresholds.Localized.Threshold_Direction_Label (C, Direction => Humanize.Thresholds.Lower_Limit),
          Humanize.Thresholds.Threshold_Direction_Label (Direction => Humanize.Thresholds.Lower_Limit));
   Check (Locale, "label.thresholds.threshold_state_label",
          Humanize.Thresholds.Localized.Threshold_State_Label (C, State => Humanize.Thresholds.Below_Range),
          Humanize.Thresholds.Threshold_State_Label (State => Humanize.Thresholds.Below_Range));
   Check (Locale, "label.thresholds.threshold_state_label",
          Humanize.Thresholds.Localized.Threshold_State_Label (C, State => Humanize.Thresholds.Unknown_State),
          Humanize.Thresholds.Threshold_State_Label (State => Humanize.Thresholds.Unknown_State));
   Check (Locale, "label.versions.commit_distance_label",
          Humanize.Versions.Localized.Commit_Distance_Label (C, Ahead => 3, Behind => 3),
          Humanize.Versions.Commit_Distance_Label (Ahead => 3, Behind => 3));
   Check (Locale, "label.versions.commit_distance_label",
          Humanize.Versions.Localized.Commit_Distance_Label (C, Ahead => 1, Behind => 1),
          Humanize.Versions.Commit_Distance_Label (Ahead => 1, Behind => 1));
   Check (Locale, "label.workflows.approval_label",
          Humanize.Workflows.Localized.Approval_Label (C, Approver => "plain", Waiting => False),
          Humanize.Workflows.Approval_Label (Approver => "plain", Waiting => False));
   Check (Locale, "label.workflows.approval_label",
          Humanize.Workflows.Localized.Approval_Label (C, Approver => "plain", Waiting => True),
          Humanize.Workflows.Approval_Label (Approver => "plain", Waiting => True));
   Check (Locale, "label.workflows.attempt_label",
          Humanize.Workflows.Localized.Attempt_Label (C, Attempt => 3, Limit => 3),
          Humanize.Workflows.Attempt_Label (Attempt => 3, Limit => 3));
   Check (Locale, "label.workflows.attempt_label",
          Humanize.Workflows.Localized.Attempt_Label (C, Attempt => 1, Limit => 1),
          Humanize.Workflows.Attempt_Label (Attempt => 1, Limit => 1));
   Check (Locale, "label.workflows.blocker_label",
          Humanize.Workflows.Localized.Blocker_Label (C, Reason => "plain"),
          Humanize.Workflows.Blocker_Label (Reason => "plain"));
   Check (Locale, "label.workflows.dependency_label",
          Humanize.Workflows.Localized.Dependency_Label (C, Count => 3),
          Humanize.Workflows.Dependency_Label (Count => 3));
   Check (Locale, "label.workflows.dependency_label",
          Humanize.Workflows.Localized.Dependency_Label (C, Count => 1),
          Humanize.Workflows.Dependency_Label (Count => 1));
   Check (Locale, "label.workflows.handoff_label",
          Humanize.Workflows.Localized.Handoff_Label (C, From => "plain", To => "plain"),
          Humanize.Workflows.Handoff_Label (From => "plain", To => "plain"));
   Check (Locale, "label.workflows.milestone_state_label",
          Humanize.Workflows.Localized.Milestone_State_Label (C, State => Humanize.Workflows.Upcoming_Milestone),
          Humanize.Workflows.Milestone_State_Label (State => Humanize.Workflows.Upcoming_Milestone));
   Check (Locale, "label.workflows.milestone_state_label",
          Humanize.Workflows.Localized.Milestone_State_Label (C, State => Humanize.Workflows.Blocked_Milestone),
          Humanize.Workflows.Milestone_State_Label (State => Humanize.Workflows.Blocked_Milestone));
   Check (Locale, "label.workflows.milestone_status_label",
          Humanize.Workflows.Localized.Milestone_Status_Label
            (C,
             Name => "plain",
             State => Humanize.Workflows.Upcoming_Milestone),
          Humanize.Workflows.Milestone_Status_Label (Name => "plain", State => Humanize.Workflows.Upcoming_Milestone));
   Check (Locale, "label.workflows.milestone_status_label",
          Humanize.Workflows.Localized.Milestone_Status_Label
            (C,
             Name => "plain",
             State => Humanize.Workflows.Blocked_Milestone),
          Humanize.Workflows.Milestone_Status_Label (Name => "plain", State => Humanize.Workflows.Blocked_Milestone));
   Check (Locale, "label.workflows.next_action_label",
          Humanize.Workflows.Localized.Next_Action_Label (C, Action => "plain"),
          Humanize.Workflows.Next_Action_Label (Action => "plain"));
   Check (Locale, "label.workflows.owner_label",
          Humanize.Workflows.Localized.Owner_Label (C, Owner => "plain"),
          Humanize.Workflows.Owner_Label (Owner => "plain"));
   Check (Locale, "label.workflows.resume_label",
          Humanize.Workflows.Localized.Resume_Label (C, Name => "plain"),
          Humanize.Workflows.Resume_Label (Name => "plain"));
   Check (Locale, "label.workflows.step_state_label",
          Humanize.Workflows.Localized.Step_State_Label (C, State => Humanize.Workflows.Pending_Step),
          Humanize.Workflows.Step_State_Label (State => Humanize.Workflows.Pending_Step));
   Check (Locale, "label.workflows.step_state_label",
          Humanize.Workflows.Localized.Step_State_Label (C, State => Humanize.Workflows.Skipped_Step),
          Humanize.Workflows.Step_State_Label (State => Humanize.Workflows.Skipped_Step));
   Check (Locale, "label.workflows.step_status_label",
          Humanize.Workflows.Localized.Step_Status_Label
            (C,
             Name => "plain",
             State => Humanize.Workflows.Pending_Step),
          Humanize.Workflows.Step_Status_Label (Name => "plain", State => Humanize.Workflows.Pending_Step));
   Check (Locale, "label.workflows.step_status_label",
          Humanize.Workflows.Localized.Step_Status_Label
            (C,
             Name => "plain",
             State => Humanize.Workflows.Skipped_Step),
          Humanize.Workflows.Step_Status_Label (Name => "plain", State => Humanize.Workflows.Skipped_Step));
   Check (Locale, "label.workflows.waiting_label",
          Humanize.Workflows.Localized.Waiting_Label (C, Reason => "plain"),
          Humanize.Workflows.Waiting_Label (Reason => "plain"));
   Check (Locale, "label.workflows.workflow_result_label",
          Humanize.Workflows.Localized.Workflow_Result_Label
            (C,
             State => Humanize.Workflows.Not_Started_State,
             Name => "plain"),
          Humanize.Workflows.Workflow_Result_Label (State => Humanize.Workflows.Not_Started_State, Name => "plain"));
   Check (Locale, "label.workflows.workflow_result_label",
          Humanize.Workflows.Localized.Workflow_Result_Label
            (C,
             State => Humanize.Workflows.Paused_State,
             Name => "plain"),
          Humanize.Workflows.Workflow_Result_Label (State => Humanize.Workflows.Paused_State, Name => "plain"));
   Check (Locale, "label.workflows.workflow_state_label",
          Humanize.Workflows.Localized.Workflow_State_Label (C, State => Humanize.Workflows.Not_Started_State),
          Humanize.Workflows.Workflow_State_Label (State => Humanize.Workflows.Not_Started_State));
   Check (Locale, "label.workflows.workflow_state_label",
          Humanize.Workflows.Localized.Workflow_State_Label (C, State => Humanize.Workflows.Paused_State),
          Humanize.Workflows.Workflow_State_Label (State => Humanize.Workflows.Paused_State));
end Check_Group_6;
