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
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {transparent} mostly_transparent "
      & "{mostly transparent} translucent {translucent} mostly_opaque {mostly "
      & "opaque} other {opaque}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {no observations} other {{count, number} "
      & "observations, min {minimum} {unit}, median {median} {unit}, max "
      & "{maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {no observations} other {0 "
      & "outliers out of {total, number} observations}}} one {1 outlier out of "
      & "{total, number} observations} other {{outliers, number} outliers out "
      & "of {total, number} observations}}");
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} over capacity} other "
      & "{{count, number} of {total, number} {unit} remaining}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {quota exceeded by {count, number} {unit} "
      & "({percent} used)} near {quota near limit: {count, number} {unit} "
      & "remaining ({percent} used)} other {quota available: {count, number} "
      & "{unit} remaining ({percent} used)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {cache hit rate unavailable: no requests} other "
      & "{cache hit rate {percent}: {hits, number} hits, {misses, number} "
      & "misses}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {1 attribute} other {{count, number} attributes}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {1 data attribute} other {{count, number} data "
      & "attributes}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {1 ARIA attribute} other {{count, number} ARIA "
      & "attributes}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {1 event handler} other {{count, number} event "
      & "handlers}}");
   P ("label.markup.heading_label", "heading level {level, number}");
   P ("label.markup.tag_count_label.total", "{count, plural, one {1 tag} other {{count, number} tags}}");
   P ("label.markup.tag_count_label.links", "{count, plural, one {1 link} other {{count, number} links}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {1 media element} other {{count, number} media "
      & "elements}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {1 form control} other {{count, number} form "
      & "controls}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {1 heading} other {{count, number} headings}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {1 landmark} other {{count, number} landmarks}}");
   P ("label.markup.document_outline_label.forms", "{count, plural, one {1 form} other {{count, number} forms}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {1 media element} other {{count, number} media "
      & "elements}}");
   P ("label.markup.table_navigation_label",
      "{caption} row {row, number} of {rows, number}, column {column, number} "
      & "of {columns, number}");
   P ("label.secrets.secret_count_label.total", "{count, plural, one {1 secret} other {{count, number} secrets}}");
   P ("label.secrets.secret_count_label.masked", "{count, number} masked");
   P ("label.secrets.secret_count_label.unset", "{count, number} unset");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {1 fingerprint} other {{count, number} "
      & "fingerprints}}");
   P ("label.schema.type_mismatch_label",
      "field {field_name} expected {expected, select, string_field {string} "
      & "integer_field {integer} decimal_field {decimal} boolean_field "
      & "{boolean} date_field {date} date_time_field {date-time} object_field "
      & "{object} array_field {array} enum_field {enum} binary_field {binary} "
      & "null_field {null} any_field {any} other {unknown}}, got {actual, "
      & "select, string_field {string} integer_field {integer} decimal_field "
      & "{decimal} boolean_field {boolean} date_field {date} date_time_field "
      & "{date-time} object_field {object} array_field {array} enum_field "
      & "{enum} binary_field {binary} null_field {null} any_field {any} other "
      & "{unknown}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {1 blocking "
      & "issue} other {{blocking, number} blocking issues}}} blocking {{base}, "
      & "{blocking, plural, one {1 blocking issue} other {{blocking, number} "
      & "blocking issues}}} only {{base} only} other {{base}}}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {target range {low} to {high}} "
      & "other {target window {low} to {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} within expected range} below {{value} "
      & "below expected range} other {{value} above expected range}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} at critical threshold} warning "
      & "{{value} at warning threshold} other {{value} within normal range}}");
   P ("label.thresholds.breach_label", "{state, select, ok {not breached} other {breached by {difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {at target} below {{difference} below target} other "
      & "{{difference} above target}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {limit breached} near {near limit, {distance} "
      & "remaining} other {{distance} from limit}}");
   P ("label.thresholds.threshold_summary_label.none", "no metrics");
   P ("label.thresholds.threshold_summary_label.normal", "{count, number} normal");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {1 warning} other {{count, number} warnings}}");
   P ("label.thresholds.threshold_summary_label.critical", "{count, number} critical");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {1 breach} other {{count, number} breaches}}");
   P ("label.thresholds.target_window_label", "target {target} plus/minus {tolerance}");
   P ("label.thresholds.tolerance_label", "tolerance {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} of limit");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {limit exceeded by {amount}} other {{amount} "
      & "remaining}}");
   P ("label.thresholds.budget_used_label", "{used} used of {budget}");
   P ("label.workflows.step_label", "step {current, number} of {total, number}: {name}");
   P ("label.workflows.milestone_label", "{current, number} of {total, number} milestones complete: {name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {no workflow items} half {halfway through "
      & "workflow} other {{completed, number} of {total, number} complete}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {queue position {position, number}} other {queue "
      & "position {position, number} of {total, number}}}");
   P ("label.changes.change_set_label.none", "no changes");
   P ("label.changes.change_set_label.added", "{count, number} added");
   P ("label.changes.change_set_label.removed", "{count, number} removed");
   P ("label.changes.change_set_label.modified", "{count, number} changed");
   P ("label.changes.change_set_label.unchanged", "{count, number} unchanged");
   P ("label.changes.sync_change_label.none", "no sync changes");
   P ("label.changes.sync_change_label.uploaded", "{count, number} uploaded");
   P ("label.changes.sync_change_label.downloaded", "{count, number} downloaded");
   P ("label.changes.sync_change_label.deleted", "{count, number} deleted");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {1 conflict} other {{count, number} conflicts}}");
   P ("label.changes.net_change_label",
      "{state, select, none {no net change} up {net +{count, plural, one {1 "
      & "item} other {{count, number} items}}} other {net -{count, plural, one "
      & "{1 item} other {{count, number} items}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {no changes to review} all {all changes reviewed} "
      & "other {{reviewed, number} of {total, number} changes reviewed}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} unchanged at {new_value}} up "
      & "{{field_name} increased from {old_value} to {new_value}} other "
      & "{{field_name} decreased from {old_value} to {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {no rows selectable} none {no rows selected} "
      & "all {all {total, plural, one {1 row} other {{total, number} rows}} "
      & "selected} other {{selected, number} of {total, plural, one {1 row} "
      & "other {{total, number} rows}} selected}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {no pages} other {{pages, plural, =0 {no pages} "
      & "other {{rows, plural, =0 {page {page, number} of {pages, number}} one "
      & "{page {page, number} of {pages, number}, 1 row} other {page {page, "
      & "number} of {pages, number}, {rows, number} rows}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {no rows} none {no rows match} all {all "
      & "{total, plural, one {1 row} other {{total, number} rows}} visible} "
      & "other {{visible, number} of {total, plural, one {1 row} other {{total, "
      & "number} rows}} visible}}");
   P ("label.tables.row_range_label",
      "{state, select, none {no rows} single {row {first_row, number} of "
      & "{total, number}} other {rows {first_row, number}-{last_row, number} of "
      & "{total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {no character limit} none_left {no "
      & "characters remaining} left {{count, plural, one {1 character} other "
      & "{{count, number} characters}} remaining} other {{count, plural, one {1 "
      & "character} other {{count, number} characters}} over limit}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {no required fields} one {{missing, plural, =0 {all "
      & "required fields complete} other {1 of 1 required field missing}}} "
      & "other {{missing, plural, =0 {all required fields complete} other "
      & "{{missing, number} of {total, number} required fields missing}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {no fields} all {all fields complete} other "
      & "{{completed, number} of {total, plural, one {1 field} other {{total, "
      & "number} fields}} complete}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: no fields} all {{name}: all fields "
      & "complete} other {{name}: {completed, number} of {total, plural, one {1 "
      & "field} other {{total, number} fields}} complete}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {no form steps} one {step 1 of 1: {name}} other "
      & "{step {current, number} of {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {no breadcrumbs} one {breadcrumb 1 of 1: {name}} "
      & "other {breadcrumb {current, number} of {total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {no tabs} one {tab 1 of 1: {name}} other {tab "
      & "{current, number} of {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {empty inbox} one {{unread, plural, =0 {all "
      & "notifications read} other {1 unread of 1 notification}}} other "
      & "{{unread, plural, =0 {all notifications read} other {{unread, number} "
      & "unread of {total, number} notifications}}}}");
   P ("label.notifications.delivery_attempt_label", "delivery attempt {attempt, number} of {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {no checklist items} one {{done, plural, =0 {0 of 1 "
      & "item complete} other {1 of 1 item complete}}} other {{done, number} of "
      & "{total, number} items complete}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {no uploads} one {{done, plural, =0 {0 of 1 upload "
      & "complete} other {1 of 1 upload complete}}} other {{done, number} of "
      & "{total, number} uploads complete}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {no capacity} one {{reserved, plural, =0 {0 of 1 "
      & "seat reserved} other {1 of 1 seat reserved}}} other {{reserved, "
      & "number} of {capacity, number} seats reserved}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {waitlist position {position, number}} other "
      & "{waitlist position {position, number} of {total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} changed} other {{name}: {changed, number} changed, {unchanged, "
      & "number} unchanged, {total, number} total}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {pink} other "
      & "{{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "current foreground meets large text contrast at {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "current foreground meets normal text contrast at {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "use {v1} for {v2, number}:{v3, number} enhanced text contrast");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "use {v1} for {v2, number}:{v3, number} large text contrast");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "use {v1} for {v2}:{v3, number} normal text contrast");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "use {v1} for {v2}:{v3, number} large text contrast");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "use {v1} for {v2}:{v3, number} enhanced text contrast");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "current foreground meets large text contrast at {v1, number}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "current foreground meets normal text contrast at {v1, number}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "current foreground meets enhanced text contrast at {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "current foreground meets enhanced text contrast at {v1, number}:{v2, "
      & "number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopia low confusion risk, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopia moderate confusion risk, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopia moderate confusion risk, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "achromatopsia high confusion risk, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, dramatic perceptual difference");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, dramatic perceptual difference");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 textile delta {v1}, dramatic perceptual difference");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, dramatic perceptual difference");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, large perceptual difference");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopia moderate confusion risk, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, dramatic perceptual difference");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, dramatic perceptual difference");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, dramatic perceptual difference");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "achromatopsia low confusion risk, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopia distinct, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopia distinct, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopia distinct, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "achromatopsia distinct, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "achromatopsia moderate confusion risk, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, large perceptual difference");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, large perceptual difference");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 textile delta {v1}, large perceptual difference");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, large perceptual difference");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, noticeable perceptual difference");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopia high confusion risk, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopia high confusion risk, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, noticeable perceptual difference");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 textile delta {v1}, noticeable perceptual difference");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, noticeable perceptual difference");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, noticeable perceptual difference");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopia low confusion risk, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopia low confusion risk, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, large perceptual difference");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopia high confusion risk, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, dramatic perceptual difference");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 textile delta {v1, number}, dramatic perceptual difference");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, dramatic perceptual difference");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, large perceptual difference");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 textile delta {v1, number}, large perceptual difference");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, large perceptual difference");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, noticeable perceptual difference");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 textile delta {v1}, subtle perceptual difference");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, noticeable perceptual difference");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 textile delta {v1, number}, noticeable perceptual difference");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, barely perceptible");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, imperceptible");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 textile delta {v1}, imperceptible");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, imperceptible");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, imperceptible");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, large perceptual difference");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 textile delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, subtle perceptual difference");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, subtle perceptual difference");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, subtle perceptual difference");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, barely perceptible");
   P ("label.metrics.text_summary.n_words", "{v1, number} words");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, number} paragraphs");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} minutes spoken");
   P ("label.metrics.text_summary.n_sentences", "{v1, number} sentences");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} minutes read");
   P ("label.metrics.text_summary.n_paragraph", "{v1, number} paragraph");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "less than {v1, number} minute spoken");
   P ("label.metrics.text_summary.less_than_n_minute_read", "less than {v1, number} minute read");
   P ("label.metrics.text_summary.n_sentence", "{v1, number} sentence");
   P ("label.metrics.text_summary.no_words", "no words");
   P ("label.metrics.text_summary.no_paragraphs", "no paragraphs");
   P ("label.metrics.text_summary.no_sentences", "no sentences");
   P ("label.metrics.text_summary.n_word", "{v1, number} word");
   P ("label.names.hue_family_label.neutral", "neutral");
   P ("label.names.saturation_label.neutral", "neutral");
   P ("label.names.temperature_label.neutral_temperature", "neutral temperature");
   P ("label.names.chroma_label.grayish", "grayish");
   P ("label.names.nearest_color_name.black", "black");
   P ("label.models.brightness_label.very_dark", "very dark");
   P ("label.names.hue_family_label.blue", "blue");
   P ("label.names.saturation_label.vivid", "vivid");
   P ("label.names.temperature_label.cool", "cool");
   P ("label.names.chroma_label.moderate_chroma", "moderate chroma");
   P ("label.names.nearest_color_name.navy", "navy");
   P ("label.names.chroma_label.high_chroma", "high chroma");
   P ("label.names.nearest_color_name.blue", "blue");
   P ("label.names.hue_family_label.green", "green");
   P ("label.names.temperature_label.balanced_temperature", "balanced temperature");
   P ("label.names.hue_family_label.cyan", "cyan");
   P ("label.names.chroma_label.soft", "soft");
   P ("label.models.brightness_label.dark", "dark");
   P ("label.names.nearest_color_name.green", "green");
   P ("label.names.nearest_color_name.teal", "teal");
   P ("label.models.brightness_label.medium_brightness", "medium brightness");
   P ("label.names.nearest_color_name.aqua", "aqua");
   P ("label.names.nearest_color_name.lime", "lime");
   P ("label.models.brightness_label.light", "light");
   P ("label.names.hue_family_label.red", "red");
   P ("label.names.temperature_label.warm", "warm");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "purple");
   P ("label.names.hue_family_label.yellow", "yellow");
   P ("label.names.saturation_label.muted", "muted");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "saturated");
   P ("label.names.nearest_color_name.maroon", "maroon");
   P ("label.names.nearest_color_name.purple", "purple");
   P ("label.names.hue_family_label.orange", "orange");
   P ("label.names.nearest_color_name.olive", "olive");
   P ("label.names.nearest_color_name.gray", "gray");
   P ("label.names.saturation_label.desaturated", "desaturated");
   P ("label.names.nearest_color_name.silver", "silver");
   P ("label.names.chroma_label.pastel", "pastel");
   P ("label.models.brightness_label.very_light", "very light");
   P ("label.names.nearest_color_name.fuchsia", "fuchsia");
   P ("label.names.nearest_color_name.yellow", "yellow");
   P ("label.names.nearest_color_name.red", "red");
   P ("label.names.nearest_color_name.orange", "orange");
   P ("label.names.nearest_color_name.white", "white");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number} low contrast");
   P ("label.contrast.readability_label.low_readability", "low readability");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, insufficient, dark text on light background");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number} low contrast");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, insufficient, dark text on light background");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "achromatopsia moderate confusion risk");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}% strong difference");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number} low contrast after alpha compositing");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, insufficient, light text on dark background");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, insufficient, light text on dark background");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopia high confusion risk");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number} large-text contrast");
   P ("label.contrast.readability_label.readable_for_large_text_only", "readable for large text only");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, large text, light text on dark background");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast", "{v1}:{v2, number} large-text contrast");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, large text, light text on dark background");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk", "tritanopia high confusion risk");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} large-text contrast after alpha compositing");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, non-text only, light text on dark background");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, non-text only, light text on dark background");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopia moderate confusion risk");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number} low contrast");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number} low contrast");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, non-text only, dark text on light background");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, non-text only, dark text on light background");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopia moderate confusion risk");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk", "protanopia high confusion risk");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}% very different");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "achromatopsia high confusion risk");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "achromatopsia low confusion risk");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} low contrast after alpha compositing");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number} normal-text contrast");
   P ("label.contrast.readability_label.readable_for_normal_text", "readable for normal text");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, body text, light text on dark background");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number} normal-text contrast");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, body text, light text on dark background");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, large text, dark text on light background");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, large text, dark text on light background");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}% subtle difference");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, body text, dark text on light background");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, body text, dark text on light background");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk", "tritanopia low confusion risk");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}% noticeable difference");
   P ("label.contrast.contrast_label.n_n_large_text_contrast", "{v1, number}:{v2, number} large-text contrast");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} large-text contrast");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopia low confusion risk");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number} enhanced contrast");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "readable for enhanced text");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number} enhanced contrast");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, subtle perceptual difference");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopia distinct");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} normal-text contrast after alpha compositing");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopia moderate confusion risk");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} normal-text contrast after alpha compositing");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} large-text contrast after alpha compositing");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, excellent, dark text on light background");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, excellent, dark text on light background");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast", "{v1, number}:{v2, number} normal-text contrast");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} normal-text contrast");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number} enhanced contrast");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, excellent, light text on dark background");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} enhanced contrast");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, excellent, light text on dark background");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopia distinct");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number} enhanced contrast after alpha compositing");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, barely perceptible");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}% nearly identical");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk", "protanopia low confusion risk");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "achromatopsia distinct");
   P ("label.palettes.palette_summary.n_colors", "{v1, number} colors");
   P ("label.palettes.palette_summary.mostly_gray", "mostly gray");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "moderate contrast spread");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "background {v1}, text {v2}, accent {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triadic palette");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "best contrast {v1} on {v2} at {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} of {v2, number} pairs pass normal text contrast");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v1, number} enhanced, {v2, number} normal, {v3, number} large-only, "
      & "{v4, number} fail out of {v5, number} pairs");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, number} colors, {v2, number} pairs: {v3, number} enhanced, {v4, "
      & "number} normal, {v5, number} large-only, {v6, number} fail");
   P ("label.palettes.palette_mood_label.balanced", "balanced");
   P ("label.palettes.palette_mood_label.vibrant", "vibrant");
   P ("label.palettes.palette_mood_label.warm_mood", "warm mood");
   P ("label.palettes.palette_summary.mostly_blue", "mostly blue");
   P ("label.palettes.palette_summary.low_contrast_spread", "low contrast spread");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "single-accent palette");
   P ("label.palettes.palette_mood_label.dark", "dark");
   P ("label.palettes.palette_mood_label.cool_mood", "cool mood");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "mostly rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "no accessible text pairs");
   P ("label.palettes.palette_mood_label.subtle", "subtle");
   P ("label.palettes.palette_summary.high_contrast_spread", "high contrast spread");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "best contrast {v1} on {v2} at {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "neutral mood");
   P ("label.palettes.palette_summary.mostly_purple", "mostly purple");
   P ("label.palettes.palette_harmony_label.complementary_palette", "complementary palette");
   P ("label.palettes.palette_summary.mostly_green", "mostly green");
   P ("label.palettes.palette_mood_label.moderate", "moderate");
   P ("label.palettes.palette_summary.mostly_silver", "mostly silver");
   P ("label.palettes.palette_harmony_label.varied_palette", "varied palette");
   P ("label.palettes.palette_summary.mostly_olive", "mostly olive");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analogous palette");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} of {v2, number} pairs pass large text only");
   P ("label.palettes.palette_mood_label.light", "light");
   P ("label.palettes.palette_summary.mostly_teal", "mostly teal");
   P ("label.palettes.palette_summary.mostly_aqua", "mostly aqua");
   P ("label.palettes.palette_summary.mostly_lime", "mostly lime");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "monochrome palette");
   P ("label.palettes.palette_summary.mostly_black", "mostly black");
   P ("label.palettes.palette_summary.mostly_yellow", "mostly yellow");
   P ("label.palettes.palette_summary.mostly_maroon", "mostly maroon");
   P ("label.palettes.palette_summary.mostly_white", "mostly white");
   P ("label.palettes.palette_summary.mostly_orange", "mostly orange");
   P ("label.palettes.palette_summary.mostly_fuchsia", "mostly fuchsia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "neutral palette");
   P ("label.palettes.palette_summary.mostly_red", "mostly red");
   P ("label.metrics.word_count_summary.n_words", "{v1, number} words");
   P ("label.metrics.sentence_count_summary.n_sentences", "{v1, number} sentences");
   P ("label.metrics.paragraph_count_summary.n_paragraphs", "{v1, number} paragraphs");
   P ("label.metrics.reading_time.n_minutes_read", "{v1, number} minutes read");
   P ("label.metrics.speaking_time.n_minutes_spoken", "{v1, number} minutes spoken");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, number} words");
   P ("label.metrics.text_summary_with_options.n_sentences", "{v1, number} sentences");
   P ("label.metrics.text_summary_with_options.n_paragraphs", "{v1, number} paragraphs");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "{v1, number} minutes read");
   P ("label.metrics.paragraph_count_summary.n_paragraph", "{v1, number} paragraph");
   P ("label.metrics.reading_time.less_than_n_minute_read", "less than {v1, number} minute read");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "less than {v1, number} minute spoken");
   P ("label.metrics.text_summary_with_options.n_paragraph", "{v1, number} paragraph");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "less than {v1, number} minute read");
   P ("label.metrics.sentence_count_summary.n_sentence", "{v1, number} sentence");
   P ("label.metrics.text_summary_with_options.n_sentence", "{v1, number} sentence");
   P ("label.metrics.word_count_summary.no_words", "no words");
end Labels_3;
