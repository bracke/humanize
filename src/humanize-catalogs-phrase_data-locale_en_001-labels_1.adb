separate (Humanize.Catalogs.Phrase_Data.Locale_En_001)
procedure Labels_1 is
begin
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {{name} to {environment} deployment "
      & "queued} deploying {{name} to {environment} deploying} deployed {{name} "
      & "to {environment} deployed} failed_deployment {{name} to {environment} "
      & "deployment failed} rolled_back {{name} to {environment} rolled back} "
      & "blocked_deployment {{name} to {environment} deployment blocked} other "
      & "{{name} to {environment} deployment cancelled}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {deployment queued} deploying "
      & "{deploying} deployed {deployed} failed_deployment {deployment failed} "
      & "rolled_back {rolled back} blocked_deployment {deployment blocked} "
      & "other {deployment cancelled}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{position, plural, =0 {{family, select, byte_parser {unsupported "
      & "syntax for byte parser {error}; use B, kB, MB, GB, KiB, MiB, GiB, or "
      & "TiB} duration_parser {unsupported syntax for duration parser {error}; "
      & "use ms, s, min, h, d, w, month, or year} date_time_parser {unsupported "
      & "syntax for date-time parser {error}; use ISO date, natural day, or "
      & "clock time} colour_parser {unsupported syntax for colour parser "
      & "{error}; use hex, rgb(), hsl(), lab(), lch(), or named colour} "
      & "url_parser {unsupported syntax for URL parser {error}; use scheme, "
      & "host, path, query, or fragment} unit_parser {unsupported syntax for "
      & "unit parser {error}; use a supported Humanize unit label} "
      & "recurrence_parser {unsupported syntax for recurrence parser {error}; "
      & "use cron or every/weekday recurrence form} domain_label_parser "
      & "{unsupported syntax for domain-label parser {error}; use a "
      & "deterministic Humanize domain label} other {unsupported syntax for "
      & "parser {error}; use a supported input form}}} other {{family, select, "
      & "byte_parser {unsupported syntax for byte parser {error} at position "
      & "{position, number}; use B, kB, MB, GB, KiB, MiB, GiB, or TiB} "
      & "duration_parser {unsupported syntax for duration parser {error} at "
      & "position {position, number}; use ms, s, min, h, d, w, month, or year} "
      & "date_time_parser {unsupported syntax for date-time parser {error} at "
      & "position {position, number}; use ISO date, natural day, or clock time} "
      & "colour_parser {unsupported syntax for colour parser {error} at "
      & "position {position, number}; use hex, rgb(), hsl(), lab(), lch(), or "
      & "named colour} url_parser {unsupported syntax for URL parser {error} at "
      & "position {position, number}; use scheme, host, path, query, or "
      & "fragment} unit_parser {unsupported syntax for unit parser {error} at "
      & "position {position, number}; use a supported Humanize unit label} "
      & "recurrence_parser {unsupported syntax for recurrence parser {error} at "
      & "position {position, number}; use cron or every/weekday recurrence "
      & "form} domain_label_parser {unsupported syntax for domain-label parser "
      & "{error} at position {position, number}; use a deterministic Humanize "
      & "domain label} other {unsupported syntax for parser {error} at position "
      & "{position, number}; use a supported input form}}}}");
   P ("label.events.canceled_label", "{name} cancelled");
   P ("label.events.event_label",
      "{state, select, scheduled_event {{name} scheduled event} "
      & "tentative_event {{name} tentative event} in_progress_event {{name} in "
      & "progress event} completed_event {{name} completed event} "
      & "canceled_event {{name} cancelled event} other {{name} postponed "
      & "event}}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {scheduled event} tentative_event "
      & "{tentative event} in_progress_event {in progress event} "
      & "completed_event {completed event} canceled_event {cancelled event} "
      & "other {postponed event}}");
   P ("label.events.organizer_label", "organised by {name}");
   P ("label.notifications.delivery_label",
      "{state, select, pending_delivery {{channel, select, in_app_channel "
      & "{in-app notification pending} email_channel {email notification "
      & "pending} sms_channel {SMS notification pending} push_channel {push "
      & "notification pending} webhook_channel {webhook notification pending} "
      & "other {digest notification pending}}} sent_delivery {{channel, select, "
      & "in_app_channel {in-app notification sent} email_channel {email "
      & "notification sent} sms_channel {SMS notification sent} push_channel "
      & "{push notification sent} webhook_channel {webhook notification sent} "
      & "other {digest notification sent}}} delivered_delivery {{channel, "
      & "select, in_app_channel {in-app notification delivered} email_channel "
      & "{email notification delivered} sms_channel {SMS notification "
      & "delivered} push_channel {push notification delivered} webhook_channel "
      & "{webhook notification delivered} other {digest notification "
      & "delivered}}} failed_delivery {{channel, select, in_app_channel {in-app "
      & "notification failed} email_channel {email notification failed} "
      & "sms_channel {SMS notification failed} push_channel {push notification "
      & "failed} webhook_channel {webhook notification failed} other {digest "
      & "notification failed}}} retrying_delivery {{channel, select, "
      & "in_app_channel {in-app notification retrying} email_channel {email "
      & "notification retrying} sms_channel {SMS notification retrying} "
      & "push_channel {push notification retrying} webhook_channel {webhook "
      & "notification retrying} other {digest notification retrying}}} other "
      & "{{channel, select, in_app_channel {in-app notification cancelled} "
      & "email_channel {email notification cancelled} sms_channel {SMS "
      & "notification cancelled} push_channel {push notification cancelled} "
      & "webhook_channel {webhook notification cancelled} other {digest "
      & "notification cancelled}}}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {pending notification} sent_delivery "
      & "{sent notification} delivered_delivery {delivered notification} "
      & "failed_delivery {failed notification} retrying_delivery {retrying "
      & "notification} other {cancelled notification}}");
   P ("label.payments.payment_label",
      "{state, select, pending_payment {{amount_text} pending payment} "
      & "authorized_payment {{amount_text} authorised payment} paid_payment "
      & "{{amount_text} paid payment} failed_payment {{amount_text} failed "
      & "payment} refunded_payment {{amount_text} refunded payment} other "
      & "{{amount_text} cancelled payment}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {pending payment} authorized_payment "
      & "{authorised payment} paid_payment {paid payment} failed_payment "
      & "{failed payment} refunded_payment {refunded payment} other {cancelled "
      & "payment}}");
   P ("label.payments.refund_label",
      "{state, select, pending_payment {{amount_text} pending refund} "
      & "authorized_payment {{amount_text} authorised refund} paid_payment "
      & "{{amount_text} paid refund} failed_payment {{amount_text} failed "
      & "refund} refunded_payment {{amount_text} refunded refund} other "
      & "{{amount_text} cancelled refund}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {empty} low_utilization {low "
      & "utilisation} normal_utilization {normal utilisation} high_utilization "
      & "{high utilisation} critical_utilization {critical utilisation} "
      & "full_utilization {full} other {over limit}}");
   P ("label.tasks.task_label",
      "{priority, select, no_priority {{state, select, open_task {{name} open "
      & "task} in_progress_task {{name} in progress task} blocked_task {{name} "
      & "blocked task} done_task {{name} done task} canceled_task {{name} "
      & "cancelled task} deferred_task {{name} deferred task} other {{name} "
      & "overdue task}}} low_priority {{state, select, open_task {{name} open "
      & "task, low priority} in_progress_task {{name} in progress task, low "
      & "priority} blocked_task {{name} blocked task, low priority} done_task "
      & "{{name} done task, low priority} canceled_task {{name} cancelled task, "
      & "low priority} deferred_task {{name} deferred task, low priority} other "
      & "{{name} overdue task, low priority}}} medium_priority {{state, select, "
      & "open_task {{name} open task, medium priority} in_progress_task {{name} "
      & "in progress task, medium priority} blocked_task {{name} blocked task, "
      & "medium priority} done_task {{name} done task, medium priority} "
      & "canceled_task {{name} cancelled task, medium priority} deferred_task "
      & "{{name} deferred task, medium priority} other {{name} overdue task, "
      & "medium priority}}} high_priority {{state, select, open_task {{name} "
      & "open task, high priority} in_progress_task {{name} in progress task, "
      & "high priority} blocked_task {{name} blocked task, high priority} "
      & "done_task {{name} done task, high priority} canceled_task {{name} "
      & "cancelled task, high priority} deferred_task {{name} deferred task, "
      & "high priority} other {{name} overdue task, high priority}}} other "
      & "{{state, select, open_task {{name} open task, critical priority} "
      & "in_progress_task {{name} in progress task, critical priority} "
      & "blocked_task {{name} blocked task, critical priority} done_task "
      & "{{name} done task, critical priority} canceled_task {{name} cancelled "
      & "task, critical priority} deferred_task {{name} deferred task, critical "
      & "priority} other {{name} overdue task, critical priority}}}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {open task} in_progress_task {in progress "
      & "task} blocked_task {blocked task} done_task {done task} canceled_task "
      & "{cancelled task} deferred_task {deferred task} other {overdue task}}");
   P ("label.palettes.palette_summary.n_colors", "{v1, number} colours");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, number} colours, {v2, number} pairs: {v3, number} enhanced, {v4, "
      & "number} normal, {v5, number} large-only, {v6, number} fail");
end Labels_1;
