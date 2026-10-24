with Humanize.Thresholds;
with Humanize.Versions;
with Humanize.Workflows;
with Humanize.Thresholds.Localized;
with Humanize.Versions.Localized;
with Humanize.Workflows.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_8 (Locale : String; C : Humanize.Contexts.Context) is
begin
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
   Check (Locale, "label.thresholds.threshold_summary_label", Phrase,
          Humanize.Thresholds.Localized.Threshold_Summary_Label (C, Normal => 7, Warnings => 9, Critical => 4,
            Breaches => 6),
          Humanize.Thresholds.Threshold_Summary_Label (Normal => 7, Warnings => 9, Critical => 4, Breaches => 6));
   Check (Locale, "label.thresholds.threshold_summary_label", Phrase,
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
   Check (Locale, "label.versions.compatibility_range_label", Phrase,
          Humanize.Versions.Localized.Compatibility_Range_Label (C, "1.2.3"),
          Humanize.Versions.Compatibility_Range_Label ("1.2.3"));
   Check (Locale, "label.versions.compatibility_range_label", Phrase,
          Humanize.Versions.Localized.Compatibility_Range_Label (C, ">=1.2"),
          Humanize.Versions.Compatibility_Range_Label (">=1.2"));
   Check (Locale, "label.versions.compatibility_range_label", Phrase,
          Humanize.Versions.Localized.Compatibility_Range_Label (C, "<=2.0"),
          Humanize.Versions.Compatibility_Range_Label ("<=2.0"));
   Check (Locale, "label.versions.compatibility_range_label", Prefix,
          Humanize.Versions.Localized.Compatibility_Range_Label (C, "1.2.3", Options =>
            (Humanize.Versions.Default_Version_Label_Options with delta Include_Surface => True)),
          Humanize.Versions.Compatibility_Range_Label ("1.2.3", Options =>
            (Humanize.Versions.Default_Version_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.versions.release_label", Phrase,
          Humanize.Versions.Localized.Release_Label (C, "0.9.0"),
          Humanize.Versions.Release_Label ("0.9.0"));
   Check (Locale, "label.versions.release_label", Phrase,
          Humanize.Versions.Localized.Release_Label (C, "1.0.0"),
          Humanize.Versions.Release_Label ("1.0.0"));
   Check (Locale, "label.versions.release_label", Phrase,
          Humanize.Versions.Localized.Release_Label (C, "1.2.0"),
          Humanize.Versions.Release_Label ("1.2.0"));
   Check (Locale, "label.versions.release_label", Prefix,
          Humanize.Versions.Localized.Release_Label (C, "0.9.0", Options =>
            (Humanize.Versions.Default_Version_Label_Options with delta Include_Surface => True)),
          Humanize.Versions.Release_Label ("0.9.0", Options => (Humanize.Versions.Default_Version_Label_Options with
            delta Include_Surface => True)));
   Check (Locale, "label.versions.version_delta_label", Phrase,
          Humanize.Versions.Localized.Version_Delta_Label (C, "1.2.3", "2.0.0"),
          Humanize.Versions.Version_Delta_Label ("1.2.3", "2.0.0"));
   Check (Locale, "label.versions.version_delta_label", Phrase,
          Humanize.Versions.Localized.Version_Delta_Label (C, "1.2.3", "1.3.0"),
          Humanize.Versions.Version_Delta_Label ("1.2.3", "1.3.0"));
   Check (Locale, "label.versions.version_delta_label", Phrase,
          Humanize.Versions.Localized.Version_Delta_Label (C, "1.2.3", "1.2.4"),
          Humanize.Versions.Version_Delta_Label ("1.2.3", "1.2.4"));
   Check (Locale, "label.versions.version_delta_label", Prefix,
          Humanize.Versions.Localized.Version_Delta_Label (C, "1.2.3", "2.0.0", Options =>
            (Humanize.Versions.Default_Version_Label_Options with delta Include_Surface => True)),
          Humanize.Versions.Version_Delta_Label ("1.2.3", "2.0.0", Options =>
            (Humanize.Versions.Default_Version_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.versions.version_label", Phrase,
          Humanize.Versions.Localized.Version_Label (C, "1.2.3"),
          Humanize.Versions.Version_Label ("1.2.3"));
   Check (Locale, "label.versions.version_label", Phrase,
          Humanize.Versions.Localized.Version_Label (C, "1.2.3-beta.1+build.5"),
          Humanize.Versions.Version_Label ("1.2.3-beta.1+build.5"));
   Check (Locale, "label.versions.version_label", Phrase,
          Humanize.Versions.Localized.Version_Label (C, "2.0.0-rc1"),
          Humanize.Versions.Version_Label ("2.0.0-rc1"));
   Check (Locale, "label.versions.version_label", Prefix,
          Humanize.Versions.Localized.Version_Label (C, "1.2.3", Options =>
            (Humanize.Versions.Default_Version_Label_Options with delta Include_Surface => True)),
          Humanize.Versions.Version_Label ("1.2.3", Options => (Humanize.Versions.Default_Version_Label_Options with
            delta Include_Surface => True)));
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
   Check (Locale, "label.workflows.workflow_summary_label", Phrase,
          Humanize.Workflows.Localized.Workflow_Summary_Label (C, Total => 5, Completed => 2, Failed => 1),
          Humanize.Workflows.Workflow_Summary_Label (Total => 5, Completed => 2, Failed => 1));
   Check (Locale, "label.workflows.workflow_summary_label", Phrase,
          Humanize.Workflows.Localized.Workflow_Summary_Label (C, Total => 1),
          Humanize.Workflows.Workflow_Summary_Label (Total => 1));
   Check (Locale, "label.workflows.workflow_summary_label", Phrase,
          Humanize.Workflows.Localized.Workflow_Summary_Label (C, Total => 9, Active => 3, Blocked => 1, Skipped =>
            2),
          Humanize.Workflows.Workflow_Summary_Label (Total => 9, Active => 3, Blocked => 1, Skipped => 2));
end Check_Group_8;
