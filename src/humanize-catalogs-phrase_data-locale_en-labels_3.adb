separate (Humanize.Catalogs.Phrase_Data.Locale_En)
procedure Labels_3 is
begin
   P ("label.tasks.task_label",
      "{priority, select, no_priority {{state, select, open_task {{name} open "
      & "task} in_progress_task {{name} in progress task} blocked_task {{name} "
      & "blocked task} done_task {{name} done task} canceled_task {{name} "
      & "canceled task} deferred_task {{name} deferred task} other {{name} "
      & "overdue task}}} low_priority {{state, select, open_task {{name} open "
      & "task, low priority} in_progress_task {{name} in progress task, low "
      & "priority} blocked_task {{name} blocked task, low priority} done_task "
      & "{{name} done task, low priority} canceled_task {{name} canceled task, "
      & "low priority} deferred_task {{name} deferred task, low priority} other "
      & "{{name} overdue task, low priority}}} medium_priority {{state, select, "
      & "open_task {{name} open task, medium priority} in_progress_task {{name} "
      & "in progress task, medium priority} blocked_task {{name} blocked task, "
      & "medium priority} done_task {{name} done task, medium priority} "
      & "canceled_task {{name} canceled task, medium priority} deferred_task "
      & "{{name} deferred task, medium priority} other {{name} overdue task, "
      & "medium priority}}} high_priority {{state, select, open_task {{name} "
      & "open task, high priority} in_progress_task {{name} in progress task, "
      & "high priority} blocked_task {{name} blocked task, high priority} "
      & "done_task {{name} done task, high priority} canceled_task {{name} "
      & "canceled task, high priority} deferred_task {{name} deferred task, "
      & "high priority} other {{name} overdue task, high priority}}} other "
      & "{{state, select, open_task {{name} open task, critical priority} "
      & "in_progress_task {{name} in progress task, critical priority} "
      & "blocked_task {{name} blocked task, critical priority} done_task "
      & "{{name} done task, critical priority} canceled_task {{name} canceled "
      & "task, critical priority} deferred_task {{name} deferred task, critical "
      & "priority} other {{name} overdue task, critical priority}}}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {no priority} low_priority {low "
      & "priority} medium_priority {medium priority} high_priority {high "
      & "priority} other {critical priority}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {open task} in_progress_task {in progress "
      & "task} blocked_task {blocked task} done_task {done task} canceled_task "
      & "{canceled task} deferred_task {deferred task} other {overdue task}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {upper limit} other {lower limit}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {below expected range} within_range "
      & "{within expected range} above_range {above expected range} "
      & "below_target {below target} at_target {at target} above_target {above "
      & "target} near_limit {near limit} warning_level {warning threshold} "
      & "critical_level {critical threshold} breached {breached} other {unknown "
      & "threshold state}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {up to date} one {1 commit "
      & "ahead} other {{ahead, number} commits ahead}}} one {{ahead, plural, =0 "
      & "{1 commit behind} one {1 commit ahead, 1 commit behind} other {{ahead, "
      & "number} commits ahead, 1 commit behind}}} other {{ahead, plural, =0 "
      & "{{behind, number} commits behind} one {1 commit ahead, {behind, "
      & "number} commits behind} other {{ahead, number} commits ahead, {behind, "
      & "number} commits behind}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {approved by {approver}} other {waiting for "
      & "approval from {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {attempt 1 of 1} other "
      & "{attempt {attempt, number} of 1 exceeded}}} other {attempt {attempt, "
      & "number} of {limit, number}}}");
   P ("label.workflows.blocker_label", "blocked: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {no blocking dependencies} one {1 blocking "
      & "dependency} other {{count, number} blocking dependencies}}");
   P ("label.workflows.handoff_label", "handoff from {from} to {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {upcoming milestone} "
      & "current_milestone {current milestone} complete_milestone {complete "
      & "milestone} missed_milestone {missed milestone} other {blocked "
      & "milestone}}");
   P ("label.workflows.milestone_status_label",
      "{state, select, upcoming_milestone {{name} upcoming} current_milestone "
      & "{{name} current} complete_milestone {{name} complete} missed_milestone "
      & "{{name} missed} other {{name} blocked}}");
   P ("label.workflows.next_action_label", "next: {action}");
   P ("label.workflows.owner_label", "owned by {owner}");
   P ("label.workflows.resume_label", "resume {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {pending} active_step {active} "
      & "waiting_step {waiting} blocked_step {blocked} done_step {done} "
      & "failed_step {failed} other {skipped}}");
   P ("label.workflows.step_status_label",
      "{state, select, pending_step {{name} pending} active_step {{name} "
      & "active} waiting_step {{name} waiting} blocked_step {{name} blocked} "
      & "done_step {{name} done} failed_step {{name} failed} other {{name} "
      & "skipped}}");
   P ("label.workflows.waiting_label", "waiting for {reason}");
   P ("label.workflows.workflow_result_label",
      "{state, select, not_started_state {{name} not started} "
      & "in_progress_state {{name} in progress} waiting_state {{name} waiting} "
      & "waiting_approval_state {{name} waiting for approval} blocked_state "
      & "{{name} blocked} completed_state {{name} completed} failed_state "
      & "{{name} failed} cancelled_state {{name} cancelled} skipped_state "
      & "{{name} skipped} other {{name} paused}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {not started} in_progress_state {in "
      & "progress} waiting_state {waiting} waiting_approval_state {waiting for "
      & "approval} blocked_state {blocked} completed_state {completed} "
      & "failed_state {failed} cancelled_state {cancelled} skipped_state "
      & "{skipped} other {paused}}");
end Labels_3;
