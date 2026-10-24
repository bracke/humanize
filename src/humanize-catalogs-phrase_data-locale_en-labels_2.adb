separate (Humanize.Catalogs.Phrase_Data.Locale_En)
procedure Labels_2 is
begin
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {add an accessible name} "
      & "low_contrast {increase text contrast} skipped_heading_level {use "
      & "sequential heading levels} missing_form_label {associate a label with "
      & "the form control} invalid_aria {use a valid ARIA role or attribute} "
      & "keyboard_trap {ensure keyboard focus can leave the component} other "
      & "{review accessibility issue}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target} has no accessibility issues} one "
      & "{{target} has 1 accessibility issue} other {{target} has {issues, "
      & "number} accessibility issues}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id attribute} class_attribute {class "
      & "attribute} data_attribute {data attribute} aria_attribute {ARIA "
      & "attribute} role_attribute {role attribute} link_attribute {link "
      & "attribute} media_attribute {media attribute} form_attribute {form "
      & "attribute} boolean_attribute {boolean attribute} event_attribute "
      & "{event handler attribute} other {unknown attribute}}");
   P ("label.markup.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {{form_name} has no form "
      & "issues} one {{form_name} has 1 error} other {{form_name} has {errors, "
      & "number} errors}}} one {{errors, plural, one {{form_name} has 1 error, "
      & "1 warning} other {{form_name} has {errors, number} errors, 1 "
      & "warning}}} other {{errors, plural, one {{form_name} has 1 error, "
      & "{warnings, number} warnings} other {{form_name} has {errors, number} "
      & "errors, {warnings, number} warnings}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {banner landmark} navigation_role "
      & "{navigation landmark} main_role {main landmark} complementary_role "
      & "{complementary landmark} contentinfo_role {content info landmark} "
      & "search_role {search landmark} form_role {form landmark} region_role "
      & "{region landmark} dialog_role {dialog} alert_role {alert live region} "
      & "status_role {status live region} other {unknown landmark}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region} assertive update: {update}} other "
      & "{{region} polite update: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {text content} html_content {HTML content} "
      & "json_content {JSON content} xml_content {XML content} image_content "
      & "{image content} audio_content {audio content} video_content {video "
      & "content} font_content {font content} archive_content {archive content} "
      & "binary_content {binary content} form_content {form content} other "
      & "{unknown content}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {document tag} metadata_tag {metadata tag} "
      & "section_tag {section tag} text_tag {text tag} link_tag {link tag} "
      & "media_tag {media tag} form_tag {form tag} table_tag {table tag} "
      & "interactive_tag {interactive tag} scripting_tag {scripting tag} other "
      & "{unknown tag}}");
   P ("label.media.duration_label", "duration {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {image} video_media {video} audio_media "
      & "{audio} pdf_document {PDF document} text_document {text document} "
      & "archive_media {archive} other {media}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {ready} processing_media {processing} "
      & "transcoding_media {transcoding} thumbnail_missing {thumbnail "
      & "unavailable} metadata_missing {metadata missing} locked_document "
      & "{document locked} other {unavailable}}");
   P ("label.media.media_summary",
      "{state, select, ready_media {{kind, select, image_media {{name} image "
      & "ready} video_media {{name} video ready} audio_media {{name} audio "
      & "ready} pdf_document {{name} PDF document ready} text_document {{name} "
      & "text document ready} archive_media {{name} archive ready} other "
      & "{{name} media ready}}} processing_media {{kind, select, image_media "
      & "{{name} image processing} video_media {{name} video processing} "
      & "audio_media {{name} audio processing} pdf_document {{name} PDF "
      & "document processing} text_document {{name} text document processing} "
      & "archive_media {{name} archive processing} other {{name} media "
      & "processing}}} transcoding_media {{kind, select, image_media {{name} "
      & "image transcoding} video_media {{name} video transcoding} audio_media "
      & "{{name} audio transcoding} pdf_document {{name} PDF document "
      & "transcoding} text_document {{name} text document transcoding} "
      & "archive_media {{name} archive transcoding} other {{name} media "
      & "transcoding}}} thumbnail_missing {{kind, select, image_media {{name} "
      & "image thumbnail unavailable} video_media {{name} video thumbnail "
      & "unavailable} audio_media {{name} audio thumbnail unavailable} "
      & "pdf_document {{name} PDF document thumbnail unavailable} text_document "
      & "{{name} text document thumbnail unavailable} archive_media {{name} "
      & "archive thumbnail unavailable} other {{name} media thumbnail "
      & "unavailable}}} metadata_missing {{kind, select, image_media {{name} "
      & "image metadata missing} video_media {{name} video metadata missing} "
      & "audio_media {{name} audio metadata missing} pdf_document {{name} PDF "
      & "document metadata missing} text_document {{name} text document "
      & "metadata missing} archive_media {{name} archive metadata missing} "
      & "other {{name} media metadata missing}}} locked_document {{kind, "
      & "select, image_media {{name} image document locked} video_media {{name} "
      & "video document locked} audio_media {{name} audio document locked} "
      & "pdf_document {{name} PDF document document locked} text_document "
      & "{{name} text document document locked} archive_media {{name} archive "
      & "document locked} other {{name} media document locked}}} other {{kind, "
      & "select, image_media {{name} image unavailable} video_media {{name} "
      & "video unavailable} audio_media {{name} audio unavailable} pdf_document "
      & "{{name} PDF document unavailable} text_document {{name} text document "
      & "unavailable} archive_media {{name} archive unavailable} other {{name} "
      & "media unavailable}}}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {no pages} one {1 page} other {{pages, number} "
      & "pages}}");
   P ("label.media.resolution_label", "{width, number}x{height, number}");
   P ("label.moderation.appeal_label",
      "{state, select, open_report {{item} appeal open report} triaged_report "
      & "{{item} appeal triaged report} actioned_report {{item} appeal action "
      & "taken} dismissed_report {{item} appeal dismissed report} "
      & "appealed_report {{item} appeal appealed report} other {{item} appeal "
      & "closed report}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {no moderation action} flagged {flagged} "
      & "hidden {hidden by moderator} restored {restored} marked_spam {marked "
      & "as spam} removed {removed} other {escalated}}");
   P ("label.moderation.moderation_label",
      "{action, select, no_action {{item} no moderation action} flagged "
      & "{{item} flagged} hidden {{item} hidden by moderator} restored {{item} "
      & "restored} marked_spam {{item} marked as spam} removed {{item} removed} "
      & "other {{item} escalated}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {moderation queue empty} "
      & "other {{pending, number} pending review}}} other {{pending, number} "
      & "pending review, {escalated, number} escalated}}");
   P ("label.moderation.report_label",
      "{state, select, open_report {{item} open report} triaged_report "
      & "{{item} triaged report} actioned_report {{item} action taken} "
      & "dismissed_report {{item} dismissed report} appealed_report {{item} "
      & "appealed report} other {{item} closed report}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {open report} triaged_report {triaged "
      & "report} actioned_report {action taken} dismissed_report {dismissed "
      & "report} appealed_report {appealed report} other {closed report}}");
   P ("label.moderation.review_label",
      "{state, select, pending_review {{item} pending review} approved "
      & "{{item} approved} rejected {{item} rejected} needs_changes {{item} "
      & "needs changes} other {{item} escalated review}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {pending review} approved {approved} "
      & "rejected {rejected} needs_changes {needs changes} other {escalated "
      & "review}}");
   P ("label.navigation.back_label", "back to {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {no breadcrumbs} one {1 breadcrumb} other {{depth, "
      & "number} breadcrumbs}}");
   P ("label.navigation.current_page_label", "current page: {name}");
   P ("label.navigation.external_link_label", "{name} external link");
   P ("label.navigation.first_label", "first: {target}");
   P ("label.navigation.last_label", "last: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {no menu items} one {1 menu item} other {{count, "
      & "number} menu items}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {link} menu_item {menu item} tab_item {tab} "
      & "breadcrumb_item {breadcrumb} section_item {section} other {separator}}");
   P ("label.navigation.navigation_item_label",
      "{state, select, current_item {{kind, select, link_item {{name} link "
      & "current} menu_item {{name} menu item current} tab_item {{name} tab "
      & "current} breadcrumb_item {{name} breadcrumb current} section_item "
      & "{{name} section current} other {{name} separator current}}} "
      & "active_item {{kind, select, link_item {{name} link active} menu_item "
      & "{{name} menu item active} tab_item {{name} tab active} breadcrumb_item "
      & "{{name} breadcrumb active} section_item {{name} section active} other "
      & "{{name} separator active}}} inactive_item {{kind, select, link_item "
      & "{{name} link inactive} menu_item {{name} menu item inactive} tab_item "
      & "{{name} tab inactive} breadcrumb_item {{name} breadcrumb inactive} "
      & "section_item {{name} section inactive} other {{name} separator "
      & "inactive}}} disabled_item {{kind, select, link_item {{name} link "
      & "disabled} menu_item {{name} menu item disabled} tab_item {{name} tab "
      & "disabled} breadcrumb_item {{name} breadcrumb disabled} section_item "
      & "{{name} section disabled} other {{name} separator disabled}}} "
      & "expanded_item {{kind, select, link_item {{name} link expanded} "
      & "menu_item {{name} menu item expanded} tab_item {{name} tab expanded} "
      & "breadcrumb_item {{name} breadcrumb expanded} section_item {{name} "
      & "section expanded} other {{name} separator expanded}}} collapsed_item "
      & "{{kind, select, link_item {{name} link collapsed} menu_item {{name} "
      & "menu item collapsed} tab_item {{name} tab collapsed} breadcrumb_item "
      & "{{name} breadcrumb collapsed} section_item {{name} section collapsed} "
      & "other {{name} separator collapsed}}} visited_item {{kind, select, "
      & "link_item {{name} link visited} menu_item {{name} menu item visited} "
      & "tab_item {{name} tab visited} breadcrumb_item {{name} breadcrumb "
      & "visited} section_item {{name} section visited} other {{name} separator "
      & "visited}}} other {{kind, select, link_item {{name} link external} "
      & "menu_item {{name} menu item external} tab_item {{name} tab external} "
      & "breadcrumb_item {{name} breadcrumb external} section_item {{name} "
      & "section external} other {{name} separator external}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {current} active_item {active} "
      & "inactive_item {inactive} disabled_item {disabled} expanded_item "
      & "{expanded} collapsed_item {collapsed} visited_item {visited} other "
      & "{external}}");
   P ("label.navigation.next_label", "next: {target}");
   P ("label.navigation.section_state_label",
      "{expanded, select, false {{count, plural, =0 {{name} section "
      & "collapsed} one {{name} section collapsed, 1 item} other {{name} "
      & "section collapsed, {count, number} items}}} other {{count, plural, =0 "
      & "{{name} section expanded} one {{name} section expanded, 1 item} other "
      & "{{name} section expanded, {count, number} items}}}}");
   P ("label.navigation.skip_link_label", "skip to {target}");
   P ("label.navigation.submenu_label",
      "{count, plural, one {{name} submenu, 1 item} other {{name} submenu, "
      & "{count, number} items}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {all alerts} important_alerts {important "
      & "alerts} critical_alerts_only {critical alerts only} other {no alerts}}");
   P ("label.notification_preferences.channel_preference_label",
      "{state, select, preference_enabled {{channel} notifications enabled} "
      & "preference_disabled {{channel} notifications disabled} "
      & "preference_inherited {{channel} notifications inherited} other "
      & "{{channel} notifications required}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {no digest} instant_digest {instant "
      & "digest} daily_digest {daily digest} other {weekly digest}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {enabled} preference_disabled "
      & "{disabled} preference_inherited {inherited} other {required}}");
   P ("label.notification_preferences.quiet_hours_label", "quiet hours {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{state, select, preference_enabled {{scope, select, "
      & "thread_subscription {{name} thread subscription enabled} "
      & "project_subscription {{name} project subscription enabled} "
      & "team_subscription {{name} team subscription enabled} other {{name} "
      & "account subscription enabled}}} preference_disabled {{scope, select, "
      & "thread_subscription {{name} thread subscription disabled} "
      & "project_subscription {{name} project subscription disabled} "
      & "team_subscription {{name} team subscription disabled} other {{name} "
      & "account subscription disabled}}} preference_inherited {{scope, select, "
      & "thread_subscription {{name} thread subscription inherited} "
      & "project_subscription {{name} project subscription inherited} "
      & "team_subscription {{name} team subscription inherited} other {{name} "
      & "account subscription inherited}}} other {{scope, select, "
      & "thread_subscription {{name} thread subscription required} "
      & "project_subscription {{name} project subscription required} "
      & "team_subscription {{name} team subscription required} other {{name} "
      & "account subscription required}}}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {thread subscription} "
      & "project_subscription {project subscription} team_subscription {team "
      & "subscription} other {account subscription}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} mentioned you} reply_event "
      & "{{actor} replied} assignment_event {{actor} assigned you} "
      & "approval_event {{actor} requested approval} alert_event {{actor} sent "
      & "an alert} digest_event {{actor} sent a digest} reminder_event {{actor} "
      & "sent a reminder} other {{actor} sent a system notification}}");
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
      & "{{channel, select, in_app_channel {in-app notification canceled} "
      & "email_channel {email notification canceled} sms_channel {SMS "
      & "notification canceled} push_channel {push notification canceled} "
      & "webhook_channel {webhook notification canceled} other {digest "
      & "notification canceled}}}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {pending notification} sent_delivery "
      & "{sent notification} delivered_delivery {delivered notification} "
      & "failed_delivery {failed notification} retrying_delivery {retrying "
      & "notification} other {canceled notification}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {pending {time_text}} sent_delivery "
      & "{sent {time_text}} delivered_delivery {delivered {time_text}} "
      & "failed_delivery {failed {time_text}} retrying_delivery {retrying "
      & "{time_text}} other {canceled {time_text}}}");
   P ("label.notifications.digest_label",
      "{count, plural, =0 {{name} digest: no notifications} one {{name} "
      & "digest: 1 notification} other {{name} digest: {count, number} "
      & "notifications}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {no mentions} one {1 "
      & "mention} other {{count, number} mentions}}} reply_event {{count, "
      & "plural, =0 {no replies} one {1 reply} other {{count, number} "
      & "replies}}} assignment_event {{count, plural, =0 {no assignments} one "
      & "{1 assignment} other {{count, number} assignments}}} approval_event "
      & "{{count, plural, =0 {no approval requests} one {1 approval} other "
      & "{{count, number} approval requests}}} alert_event {{count, plural, =0 "
      & "{no alerts} one {1 alert} other {{count, number} alerts}}} "
      & "digest_event {{count, plural, =0 {no digests} one {1 digest} other "
      & "{{count, number} digests}}} reminder_event {{count, plural, =0 {no "
      & "reminders} one {1 reminder} other {{count, number} reminders}}} other "
      & "{{count, plural, =0 {no system notifications} one {1 system "
      & "notification} other {{count, number} system notifications}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {mark notification as read} other {mark {count, "
      & "number} notifications as read}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {mark notification as unread} other {mark {count, "
      & "number} notifications as unread}}");
   P ("label.notifications.muted_label", "{name} notifications muted");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {new mention} reply_event {new reply} "
      & "assignment_event {new assignment} approval_event {new approval} "
      & "alert_event {new alert} digest_event {new digest} reminder_event {new "
      & "reminder} other {new system notification}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {in-app notifications} email_channel "
      & "{email notifications} sms_channel {SMS notifications} push_channel "
      & "{push notifications} webhook_channel {webhook notifications} other "
      & "{digest notifications}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {no notifications} one {1 notification} other "
      & "{{count, number} notifications}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {mention} reply_event {reply} "
      & "assignment_event {assignment} approval_event {approval} alert_event "
      & "{alert} digest_event {digest} reminder_event {reminder} other {system "
      & "notification}}");
   P ("label.notifications.notification_group_label",
      "{count, plural, =0 {{name}: no notifications} one {{name}: 1 "
      & "notification} other {{name}: {count, number} notifications}}");
   P ("label.notifications.notification_label",
      "{state, select, unread_state {{event, select, mention_event {{subject} "
      & "mention unread} reply_event {{subject} reply unread} assignment_event "
      & "{{subject} assignment unread} approval_event {{subject} approval "
      & "unread} alert_event {{subject} alert unread} digest_event {{subject} "
      & "digest unread} reminder_event {{subject} reminder unread} other "
      & "{{subject} system notification unread}}} read_state {{event, select, "
      & "mention_event {{subject} mention read} reply_event {{subject} reply "
      & "read} assignment_event {{subject} assignment read} approval_event "
      & "{{subject} approval read} alert_event {{subject} alert read} "
      & "digest_event {{subject} digest read} reminder_event {{subject} "
      & "reminder read} other {{subject} system notification read}}} "
      & "archived_state {{event, select, mention_event {{subject} mention "
      & "archived} reply_event {{subject} reply archived} assignment_event "
      & "{{subject} assignment archived} approval_event {{subject} approval "
      & "archived} alert_event {{subject} alert archived} digest_event "
      & "{{subject} digest archived} reminder_event {{subject} reminder "
      & "archived} other {{subject} system notification archived}}} muted_state "
      & "{{event, select, mention_event {{subject} mention muted} reply_event "
      & "{{subject} reply muted} assignment_event {{subject} assignment muted} "
      & "approval_event {{subject} approval muted} alert_event {{subject} alert "
      & "muted} digest_event {{subject} digest muted} reminder_event {{subject} "
      & "reminder muted} other {{subject} system notification muted}}} "
      & "snoozed_state {{event, select, mention_event {{subject} mention "
      & "snoozed} reply_event {{subject} reply snoozed} assignment_event "
      & "{{subject} assignment snoozed} approval_event {{subject} approval "
      & "snoozed} alert_event {{subject} alert snoozed} digest_event {{subject} "
      & "digest snoozed} reminder_event {{subject} reminder snoozed} other "
      & "{{subject} system notification snoozed}}} other {{event, select, "
      & "mention_event {{subject} mention suppressed} reply_event {{subject} "
      & "reply suppressed} assignment_event {{subject} assignment suppressed} "
      & "approval_event {{subject} approval suppressed} alert_event {{subject} "
      & "alert suppressed} digest_event {{subject} digest suppressed} "
      & "reminder_event {{subject} reminder suppressed} other {{subject} system "
      & "notification suppressed}}}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {unread notification} read_state {read "
      & "notification} archived_state {archived notification} muted_state "
      & "{muted notification} snoozed_state {snoozed notification} other "
      & "{suppressed notification}}");
   P ("label.notifications.snoozed_label", "{name} notifications snoozed");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {no notifications suppressed} one {1 notification "
      & "suppressed} other {{count, number} notifications suppressed}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {no unread notifications} one {1 unread "
      & "notification} other {{count, number} unread notifications}}");
   P ("label.payments.amount_label", "amount {amount_text}");
   P ("label.payments.balance_label", "balance {amount_text}");
   P ("label.payments.chargeback_label", "chargeback {amount_text}");
   P ("label.payments.discount_label", "discount {amount_text}");
   P ("label.payments.due_label", "{amount_text} due {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {no invoices} one {1 invoice} other {{count, "
      & "number} invoices}}");
   P ("label.payments.invoice_label",
      "{state, select, draft_invoice {invoice {number} draft} open_invoice "
      & "{invoice {number} open} paid_invoice {invoice {number} paid} "
      & "overdue_invoice {invoice {number} overdue} other {invoice {number} "
      & "void}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {draft invoice} open_invoice {open "
      & "invoice} paid_invoice {paid invoice} overdue_invoice {overdue invoice} "
      & "other {void invoice}}");
   P ("label.payments.method_label",
      "{method, select, card_method {paid by card: {detail}} "
      & "bank_transfer_method {paid by bank transfer: {detail}} cash_method "
      & "{paid by cash: {detail}} wallet_method {paid by wallet: {detail}} "
      & "check_method {paid by check: {detail}} other {paid by other: "
      & "{detail}}}");
   P ("label.payments.paid_label", "{amount_text} paid {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {no payments} one {1 payment} other {{count, "
      & "number} payments}}");
   P ("label.payments.payment_label",
      "{state, select, pending_payment {{amount_text} pending payment} "
      & "authorized_payment {{amount_text} authorized payment} paid_payment "
      & "{{amount_text} paid payment} failed_payment {{amount_text} failed "
      & "payment} refunded_payment {{amount_text} refunded payment} other "
      & "{{amount_text} canceled payment}}");
   P ("label.payments.payment_link_label", "{name} payment link");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {card} bank_transfer_method {bank "
      & "transfer} cash_method {cash} wallet_method {wallet} check_method "
      & "{check} other {other}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {pending payment} authorized_payment "
      & "{authorized payment} paid_payment {paid payment} failed_payment "
      & "{failed payment} refunded_payment {refunded payment} other {canceled "
      & "payment}}");
   P ("label.payments.receipt_label", "receipt {number}");
   P ("label.payments.refund_label",
      "{state, select, pending_payment {{amount_text} pending refund} "
      & "authorized_payment {{amount_text} authorized refund} paid_payment "
      & "{{amount_text} paid refund} failed_payment {{amount_text} failed "
      & "refund} refunded_payment {{amount_text} refunded refund} other "
      & "{{amount_text} canceled refund}}");
   P ("label.payments.subtotal_label", "subtotal {amount_text}");
   P ("label.payments.tax_label", "tax {amount_text}");
   P ("label.payments.total_label", "total {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject} access expires {time_text}");
   P ("label.permissions.grant_label",
      "{role, select, owner_role {{subject} granted owner} admin_role "
      & "{{subject} granted admin} editor_role {{subject} granted editor} "
      & "viewer_role {{subject} granted viewer} other {{subject} granted custom "
      & "role}}");
   P ("label.permissions.permission_label",
      "{state, select, granted {{subject} {action} granted} denied {{subject} "
      & "{action} denied} inherited {{subject} {action} inherited} temporary "
      & "{{subject} {action} temporary access} expired {{subject} {action} "
      & "expired} other {{subject} {action} requires approval}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {granted} denied {denied} inherited "
      & "{inherited} temporary {temporary access} expired {expired} other "
      & "{requires approval}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {policy allowed} policy_denied {policy "
      & "denied} policy_warning {policy warning} other {policy not applicable}}");
   P ("label.permissions.revoke_label",
      "{role, select, owner_role {{subject} revoked owner} admin_role "
      & "{{subject} revoked admin} editor_role {{subject} revoked editor} "
      & "viewer_role {{subject} revoked viewer} other {{subject} revoked custom "
      & "role}}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {owner} admin_role {admin} editor_role "
      & "{editor} viewer_role {viewer} other {custom role}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {empty} low_utilization {low "
      & "utilization} normal_utilization {normal utilization} high_utilization "
      & "{high utilization} critical_utilization {critical utilization} "
      & "full_utilization {full} other {over limit}}");
   P ("label.schema.array_shape_label",
      "{count_known, select, false {{element_type, select, string_field "
      & "{array of strings} integer_field {array of integers} decimal_field "
      & "{array of decimals} boolean_field {array of booleans} date_field "
      & "{array of dates} date_time_field {array of date-times} object_field "
      & "{array of objects} array_field {array of arrays} enum_field {array of "
      & "enums} binary_field {array of binarys} null_field {array of nulls} "
      & "any_field {array of anys} other {array of unknowns}}} other {{count, "
      & "plural, one {{element_type, select, string_field {array of 1 string} "
      & "integer_field {array of 1 integer} decimal_field {array of 1 decimal} "
      & "boolean_field {array of 1 boolean} date_field {array of 1 date} "
      & "date_time_field {array of 1 date-time} object_field {array of 1 "
      & "object} array_field {array of 1 array} enum_field {array of 1 enum} "
      & "binary_field {array of 1 binary} null_field {array of 1 null} "
      & "any_field {array of 1 any} other {array of 1 unknown}}} other "
      & "{{element_type, select, string_field {array of {count, number} "
      & "strings} integer_field {array of {count, number} integers} "
      & "decimal_field {array of {count, number} decimals} boolean_field {array "
      & "of {count, number} booleans} date_field {array of {count, number} "
      & "dates} date_time_field {array of {count, number} date-times} "
      & "object_field {array of {count, number} objects} array_field {array of "
      & "{count, number} arrays} enum_field {array of {count, number} enums} "
      & "binary_field {array of {count, number} binarys} null_field {array of "
      & "{count, number} nulls} any_field {array of {count, number} anys} other "
      & "{array of {count, number} unknowns}}}}}}");
   P ("label.schema.constraint_label", "{name} constraint {value}");
   P ("label.schema.default_value_label", "field {field_name} defaults to {value}");
   P ("label.schema.deprecated_field_label", "deprecated field {name}, use {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 enum option} other {{count, number} enum "
      & "options}}");
   P ("label.schema.example_value_label", "field {field_name} example {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {normal field} deprecated_field "
      & "{deprecated field} unknown_field {unknown field} read_only_field "
      & "{read-only field} write_only_field {write-only field} other {computed "
      & "field}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {string field} integer_field {integer "
      & "field} decimal_field {decimal field} boolean_field {boolean field} "
      & "date_field {date field} date_time_field {date-time field} object_field "
      & "{object field} array_field {array field} enum_field {enum field} "
      & "binary_field {binary field} null_field {null field} any_field {any "
      & "field} other {unknown field}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {no missing required fields} one {1 missing "
      & "required field} other {{count, number} missing required fields}}");
   P ("label.schema.object_shape_label",
      "{required, plural, =0 {{optional, plural, =0 {{fields, plural, one "
      & "{object with 1 field} other {object with {fields, number} fields}}} "
      & "other {{fields, plural, one {object with 1 field, {optional, number} "
      & "optional} other {object with {fields, number} fields, {optional, "
      & "number} optional}}}}} other {{optional, plural, =0 {{fields, plural, "
      & "one {object with 1 field, {required, number} required} other {object "
      & "with {fields, number} fields, {required, number} required}}} other "
      & "{{fields, plural, one {object with 1 field, {required, number} "
      & "required, {optional, number} optional} other {object with {fields, "
      & "number} fields, {required, number} required, {optional, number} "
      & "optional}}}}}}");
   P ("label.schema.schema_source_label", "schema {name} version {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {scalar value} object_shape {{count, "
      & "plural, =0 {object} one {object with 1 field} other {object with "
      & "{count, number} fields}}} array_shape {{count, plural, =0 {array} one "
      & "{array with 1 item} other {array with {count, number} items}}} "
      & "map_shape {{count, plural, =0 {map} one {map with 1 entry} other {map "
      & "with {count, number} entries}}} tuple_shape {{count, plural, =0 "
      & "{tuple} one {tuple with 1 item} other {tuple with {count, number} "
      & "items}}} union_shape {{count, plural, =0 {union} one {union of 1 type} "
      & "other {union of {count, number} types}}} empty_shape {empty shape} "
      & "other {unknown shape}}");
   P ("label.schema.unknown_field_label", "unknown field {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {no active filters} one {1 active filter} other "
      & "{{count, number} active filters}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {clear filters} one {clear active filter} other "
      & "{clear {count, number} active filters}}");
   P ("label.search.facet_label",
      "{count, plural, one {{name} facet, 1 option} other {{name} facet, "
      & "{count, number} options}}");
   P ("label.search.facet_value_label",
      "{selected, select, false {{count, plural, =0 {{name}, no results} one "
      & "{{name}, 1 result} other {{name}, {count, number} results}}} other "
      & "{{count, plural, =0 {{name}, no results, selected} one {{name}, 1 "
      & "result, selected} other {{name}, {count, number} results, selected}}}}");
   P ("label.search.filter_label",
      "{state, select, active_filter {{name}: {value} active filter} "
      & "inactive_filter {{name}: {value} inactive filter} other {{name}: "
      & "{value} excluded filter}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {active filter} inactive_filter "
      & "{inactive filter} other {excluded filter}}");
   P ("label.search.no_results_label", "no results for ""{query}""");
   P ("label.search.recent_search_label", "recent search: ""{query}""");
   P ("label.search.saved_search_label",
      "{count, plural, =0 {saved search: {name}} one {saved search: {name}, 1 "
      & "result} other {saved search: {name}, {count, number} results}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {no recent searches} one {1 recent search} other "
      & "{{count, number} recent searches}}");
   P ("label.search.search_query_label", "search for ""{query}""");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {no results} one {1 result} other {{count, number} "
      & "results}}");
   P ("label.search.search_result_summary_label",
      "{count, plural, =0 {results for ""{query}"": no results} one {results "
      & "for ""{query}"": 1 result} other {results for ""{query}"": {count, number} "
      & "results}}");
   P ("label.search.search_scope_label",
      "{count, plural, =0 {{name} scope, no results} one {{name} scope, 1 "
      & "result} other {{name} scope, {count, number} results}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {search idle} searching_search {searching} "
      & "complete_search {search complete} empty_search {no search results} "
      & "other {search failed}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {sort by relevance} ascending_sort {sort "
      & "by ascending} descending_sort {sort by descending} newest_first_sort "
      & "{sort by newest first} other {sort by oldest first}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {relevance} ascending_sort {ascending} "
      & "descending_sort {descending} newest_first_sort {newest first} other "
      & "{oldest first}}");
   P ("label.search.suggestion_label", "did you mean ""{query}""?");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {1 credential from {source}} other {{count, "
      & "number} credentials from {source}}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {value hidden} masked_value {value "
      & "masked} suffix_only {suffix only} other {fingerprint only}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {public} support_profile {support} "
      & "audit_profile {audit} other {debug}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {{days_old, plural, =0 {rotation not "
      & "required} other {rotation not required, {days_old, number} days old}}} "
      & "other {{days_old, plural, =0 {rotation needed} other {rotation needed, "
      & "{days_old, number} days old}}}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API key} live_api_key {live API key} "
      & "test_api_key {test API key} github_token {GitHub token} aws_access_key "
      & "{AWS access key} google_api_key {Google API key} slack_token {Slack "
      & "token} npm_token {npm token} bearer_token {bearer token} jwt_token "
      & "{JWT token} basic_auth_credential {basic auth credential} "
      & "password_secret {password} private_key {private key} ssh_private_key "
      & "{SSH private key} webhook_secret {webhook secret} oauth_token {OAuth "
      & "token} database_url_secret {database URL secret} sha1_fingerprint "
      & "{SHA-1 fingerprint} sha256_fingerprint {SHA-256 fingerprint} other "
      & "{secret}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {email} phone_value {phone} url_value {URL} "
      & "ip_address_value {IP address} token_value {token} file_path_value "
      & "{file path} account_id_value {account ID} payment_reference_value "
      & "{payment reference} log_field_value {log field} other {sensitive "
      & "value}}");
   P ("label.tables.cell_label",
      "{state, select, empty_cell {row {row, number}, column {column, number} "
      & "empty} edited_cell {row {row, number}, column {column, number} edited} "
      & "invalid_cell {row {row, number}, column {column, number} invalid} "
      & "highlighted_cell {row {row, number}, column {column, number} "
      & "highlighted} other {row {row, number}, column {column, number} "
      & "read-only}}");
   P ("label.tables.cell_position_label", "row {row, number}, column {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {empty cell} edited_cell {edited cell} "
      & "invalid_cell {invalid cell} highlighted_cell {highlighted cell} other "
      & "{read-only cell}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {no columns} one {1 column} other {{count, number} "
      & "columns}}");
   P ("label.tables.column_label",
      "{role, select, text_column {{name} text column} number_column {{name} "
      & "number column} date_column {{name} date column} status_column {{name} "
      & "status column} action_column {{name} action column} other {{name} "
      & "hidden column}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {text column} number_column {number column} "
      & "date_column {date column} status_column {status column} action_column "
      & "{action column} other {hidden column}}");
   P ("label.tables.group_label",
      "{count, plural, one {{name}: 1 row} other {{name}: {count, number} "
      & "rows}}");
   P ("label.tables.row_count_label", "{count, plural, =0 {no rows} one {1 row} other {{count, number} rows}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {not sorted} ascending_sort {ascending} "
      & "other {descending}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {not sorted} ascending_sort {sorted by "
      & "{column_name} ascending} other {sorted by {column_name} descending}}");
   P ("label.tables.subtotal_label", "subtotal {name}: {value}");
   P ("label.tables.table_size_label",
      "{columns, plural, one {{rows, plural, one {1 row by 1 column} other "
      & "{{rows, number} rows by 1 column}}} other {{rows, plural, one {1 row "
      & "by {columns, number} columns} other {{rows, number} rows by {columns, "
      & "number} columns}}}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {{assignee} unassigned} assigned "
      & "{{assignee} assigned} reassigned {{assignee} reassigned} watching "
      & "{{assignee} watching} other {{assignee} owns task}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {unassigned} assigned {assigned} reassigned "
      & "{reassigned} watching {watching} other {owns task}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {empty backlog} one {backlog: 1 task} other "
      & "{backlog: {count, number} tasks}}");
   P ("label.tasks.blocker_label", "blocked by {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {complete task} other {complete {count, number} "
      & "tasks}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {no completed tasks} one {1 completed task} other "
      & "{{count, number} completed tasks}}");
   P ("label.tasks.due_label", "due {due_text}");
   P ("label.tasks.estimate_label", "estimated {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {no open tasks} one {1 open task} other {{count, "
      & "number} open tasks}}");
   P ("label.tasks.overdue_label", "overdue since {due_text}");
   P ("label.tasks.recurring_task_label", "repeats {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {reopen task} other {reopen {count, number} "
      & "tasks}}");
   P ("label.tasks.sprint_label",
      "{count, plural, one {{name}: 1 task} other {{name}: {count, number} "
      & "tasks}}");
   P ("label.tasks.subtask_label",
      "{count, plural, one {{name}: 1 subtask} other {{name}: {count, number} "
      & "subtasks}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {no tasks} one {1 task} other {{count, number} "
      & "tasks}}");
end Labels_2;
