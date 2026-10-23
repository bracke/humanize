separate (Humanize.Catalogs.Phrase_Data)
function Locale_Hi return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("hi", Name, Template));
begin
   return
     P ("all_count", "सभी {total} {total, plural, one {{one}} other {{other}}}")
     & P ("filtered_count.none", "मेल खाते कोई {other} नहीं")
     & P ("filtered_count.all",
          "सभी {total} {total, plural, one {{one}} other {{other}}} "
          & "मेल खाते हैं")
     & P ("filtered_count.some",
          "{total} {total, plural, one {{one}} other {{other}}} में से "
          & "{matching} मेल खाते हैं")
     & P ("more_count", "{visible} दिखाए गए, +{remaining} और")
     & P ("others_count",
          "{first} और {remaining, plural, one {1 अन्य} other "
          & "{{remaining} अन्य}}")
     & P ("page_count", "पृष्ठ {page} / {total}")
     & P ("page_size",
          "प्रति पृष्ठ {size} {size, plural, one {{one}} "
          & "other {{other}}}")
     & P ("pagination_range",
          "{total} {total, plural, one {{one}} other {{other}}} में से "
          & "{first}–{last}")
     & P ("position_count", "{total} में से {position}")
     & P ("selection_count",
          "{total} {total, plural, one {{one}} other {{other}}} में से "
          & "{selected} चयनित")
     & P ("showing_count",
          "{total} {total, plural, one {{one}} other {{other}}} में से "
          & "{showing} दिखाए जा रहे हैं")
     & P ("validation_count",
          "{count, plural, =0 {कोई {severity, select, error "
          & "{त्रुटि} warning {चेतावनी} other "
          & "{सूचना}} नहीं} =1 {1 {severity, select, error "
          & "{त्रुटि} warning {चेतावनी} other "
          & "{सूचना}}} other {{count} {severity, select, error "
          & "{त्रुटियाँ} warning {चेतावनियाँ} "
          & "other {सूचनाएँ}}}}")
     & P ("collection.empty", "कोई {other} नहीं")
     & P ("collection.none_shown", "दिखाने के लिए कोई {other} नहीं")
     & P ("collection.showing_hidden",
          "{total} {total, plural, one {{one}} other {{other}}} में से "
          & "{visible} दिखाए जा रहे हैं, {hidden} "
          & "छिपे हुए")
     & P ("collection.showing",
          "{total} {total, plural, one {{one}} other {{other}}} में से "
          & "{visible} दिखाए जा रहे हैं")
     & P ("collection.shown_hidden",
          "{visible} {visible, plural, one {{one}} other {{other}}} "
          & "दिखाए गए, {hidden} छिपे हुए")
     & P ("collection.shown",
          "{visible} {visible, plural, one {{one}} other {{other}}} "
          & "दिखाए गए")
     & P ("collection.visible_out_of",
          "{total} {total, plural, one {{one}} other {{other}}} में से "
          & "{visible} {visible, plural, one {{one}} other {{other}}} "
          & "दिखाई दे रहे हैं")
     & P ("complete_count", "{total} में से {done} पूर्ण")
     & P ("percent_complete", "{percent}% पूर्ण")
     & P ("step_count", "चरण {step} / {total}")
     & P ("attempt_count", "प्रयास {attempt} / {total}")
     & P ("throughput_remaining",
          "{remaining} {unit} शेष, {rate} {unit}/से की दर "
          & "से")
     & P ("accessible_progress",
          "{total} में से {done} पूर्ण, {percent} "
          & "प्रतिशत")
     & P ("business_days", "{days} कार्य दिवस")
     & P ("working_hours",
          "{hours, plural, =1 {1 कार्य घंटा} other {{hours} "
          & "कार्य घंटे}}")
     & P ("due.overdue",
          "{days, plural, =1 {1 दिन} other {{days} दिनों}} से "
          & "अतिदेय")
     & P ("due.today", "आज देय")
     & P ("due.tomorrow", "कल देय")
     & P ("due.in", "{days} दिनों में देय")
     & P ("calendar_difference.future", "{difference} में")
     & P ("calendar_difference.past", "{difference} पहले")
     & P ("calendar_difference.same_day", "उसी दिन")
     & P ("calendar_difference.zero", "0 दिन")
     & P ("cpu_load", "CPU लोड: {measure}")
     & P ("battery", "बैटरी: {measure}")
     & P ("screen_size", "स्क्रीन: {measure}")
     & P ("refresh_rate", "रीफ़्रेश दर: {measure}")
     & P ("editorial_percent.symbol", "{value}%")
     & P ("editorial_percent.word", "{value} प्रतिशत")
     & P ("recurrence.second",
          "{every, plural, =1 {हर सेकंड} other {हर {every} "
          & "सेकंड}}")
     & P ("recurrence.minute",
          "{every, plural, =1 {हर मिनट} other {हर {every} "
          & "मिनट}}")
     & P ("recurrence.hour",
          "{every, plural, =1 {हर घंटे} other {हर {every} "
          & "घंटे}}")
     & P ("recurrence.day",
          "{every, plural, =1 {हर दिन} other {हर {every} "
          & "दिन}}")
     & P ("recurrence.week",
          "{every, plural, =1 {हर सप्ताह} other {हर {every} "
          & "सप्ताह}}")
     & P ("recurrence.month",
          "{every, plural, =1 {हर महीने} other {हर {every} "
          & "महीने}}")
     & P ("recurrence.quarter",
          "{every, plural, =1 {हर तिमाही} other {हर {every} "
          & "तिमाही}}")
     & P ("recurrence.year",
          "{every, plural, =1 {हर साल} other {हर {every} "
          & "साल}}")
     & P ("cache_summary.empty", "कैश: कोई अनुरोध नहीं")
     & P ("cache_summary",
          "कैश: {hits} हिट, {misses} मिस, {rate}% हिट "
          & "दर")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} other {{other}}}: {changed} "
          & "बदले गए, {added} जोड़े गए, {removed} "
          & "हटाए गए")
     & P ("field_diff",
          "{field} को {before} से {after} में बदला "
          & "गया")
     & P ("field_added",
          "{field} को {value} के रूप में जोड़ा "
          & "गया")
     & P ("field_removed", "{field} हटाया गया (पहले {value} था)")
     & P ("field_unchanged", "{field} अपरिवर्तित: {value}")
     & P ("number_comparison.equal", "{current}, {baseline} के बराबर है")
     & P ("number_comparison.higher", "{current}, {baseline} से {quantity} अधिक है")
     & P ("number_comparison.lower", "{current}, {baseline} से {quantity} कम है")
     & P ("percent_comparison.equal", "{current}, {baseline} के बराबर है")
     & P ("percent_comparison.higher", "{current}, {baseline} से {quantity} अधिक है")
     & P ("percent_comparison.lower", "{current}, {baseline} से {quantity} कम है")
     & P ("file_size_comparison.same", "{current} का आकार {baseline} के बराबर है")
     & P ("file_size_comparison.larger", "{current}, {baseline} से {quantity} बड़ा है")
     & P ("file_size_comparison.smaller", "{current}, {baseline} से {quantity} छोटा है")
     & P ("date_comparison.same",
          "{current} और {baseline} की तारीख एक ही "
          & "है")
     & P ("date_comparison.after", "{current}, {baseline} से {quantity} बाद है")
     & P ("date_comparison.before", "{current}, {baseline} से {quantity} पहले है")
     & P ("queue_summary", "कतार: {details}")
     & P ("queue_summary.empty", "कतार खाली है")
     & P ("domain_summary",
          "{domain, select, queue {कतार} job {जॉब} run {रन} "
          & "cache {कैश} sync {सिंक} import {आयात} export "
          & "{निर्यात} other {{domain}}} – {state, select, queued "
          & "{कतार में} running {चालू} waiting "
          & "{प्रतीक्षारत} paused {रोका गया} "
          & "complete {पूर्ण} failed {विफल} stale "
          & "{पुराना} skipped {छोड़ा गया} other "
          & "{{state}}}: {details}")
     & P ("summary.none", "कोई {other} नहीं")
     & P ("summary.completed", "{count} {count, plural, one {{one}} other {{other}}} पूर्ण")
     & P ("summary.completed_of",
          "{total} {total, plural, one {{one}} other {{other}}} में से "
          & "{count} पूर्ण")
     & P ("summary.failed", "{count} विफल")
     & P ("summary.queued",
          "{count} {count, plural, one {{one}} other {{other}}} कतार "
          & "में")
     & P ("summary.running", "{count} चालू")
     & P ("summary.complete", "{count} पूर्ण")
     & P ("backup.backup_running", "बैकअप चल रहा है")
     & P ("backup.backup_completed", "बैकअप पूरा हुआ")
     & P ("backup.backup_failed", "बैकअप विफल")
     & P ("backup.backup_stale", "बैकअप पुराना है")
     & P ("incident.incident_investigating", "घटना की जाँच हो रही है")
     & P ("incident.incident_identified", "घटना की पहचान हुई")
     & P ("incident.incident_mitigated", "घटना का प्रभाव कम किया गया")
     & P ("incident.incident_resolved", "घटना हल हुई")
     & P ("release.release_drafting", "रिलीज़ तैयार की जा रही है")
     & P ("release.release_ready", "रिलीज़ तैयार")
     & P ("release.release_published", "रिलीज़ प्रकाशित")
     & P ("release.release_rolled_back", "रिलीज़ वापस ली गई")
     & P ("audit.audit_created", "ऑडिट प्रविष्टि बनाई गई")
     & P ("audit.audit_updated", "ऑडिट प्रविष्टि अपडेट की गई")
     & P ("audit.audit_deleted", "ऑडिट प्रविष्टि हटाई गई")
     & P ("audit.audit_restored",
          "ऑडिट प्रविष्टि "
          & "पुनर्स्थापित की गई")
     & P ("flag.flag_enabled", "फ़ीचर फ़्लैग सक्षम")
     & P ("flag.flag_disabled", "फ़ीचर फ़्लैग अक्षम")
     & P ("flag.flag_rolling_out",
          "फ़ीचर फ़्लैग रोल आउट हो "
          & "रहा है")
     & P ("flag.flag_rolled_back", "फ़ीचर फ़्लैग वापस लिया गया")
     & P ("webhook.webhook_pending", "वेबहुक लंबित")
     & P ("webhook.webhook_delivered", "वेबहुक डिलीवर हुआ")
     & P ("webhook.webhook_failed", "वेबहुक विफल")
     & P ("webhook.webhook_retrying",
          "वेबहुक का पुनः प्रयास हो "
          & "रहा है")
     & P ("api_key.api_key_active", "API कुंजी सक्रिय")
     & P ("api_key.api_key_revoked", "API कुंजी रद्द की गई")
     & P ("api_key.api_key_expired", "API कुंजी की समय-सीमा समाप्त")
     & P ("api_key.api_key_rotated", "API कुंजी बदली गई")
     & P ("quota.quota_available", "कोटा उपलब्ध")
     & P ("quota.quota_near_limit", "कोटा सीमा के करीब")
     & P ("quota.quota_exceeded", "कोटा पार हो गया")
     & P ("quota.quota_reset", "कोटा रीसेट हुआ")
     & P ("invoice.invoice_draft", "चालान का मसौदा")
     & P ("invoice.invoice_sent", "चालान भेजा गया")
     & P ("invoice.invoice_paid", "चालान का भुगतान हुआ")
     & P ("invoice.invoice_refunded", "चालान की राशि वापस की गई")
     & P ("invoice.invoice_overdue", "चालान अतिदेय")
     & P ("invoice.refund_failed", "धनवापसी विफल")
     & P ("page_navigation.only", "एकमात्र पृष्ठ")
     & P ("page_navigation.first", "पहला पृष्ठ, अगला उपलब्ध")
     & P ("page_navigation.last", "अंतिम पृष्ठ, पिछला उपलब्ध")
     & P ("page_navigation.middle", "पिछला और अगला उपलब्ध")
     & P ("end_of_week", "सप्ताह का अंत")
     & P ("end_of_month", "महीने का अंत")
     & P ("end_of_quarter", "तिमाही का अंत")
     & P ("time_of_day.night", "रात")
     & P ("time_of_day.morning", "सुबह")
     & P ("time_of_day.afternoon", "दोपहर")
     & P ("time_of_day.evening", "शाम")
     & P ("access.allowed", "अनुमति है")
     & P ("access.denied", "अस्वीकृत")
     & P ("access.owner", "स्वामी")
     & P ("access.admin", "व्यवस्थापक")
     & P ("access.viewer", "दर्शक")
     & P ("access.editor", "संपादक")
     & P ("auth.signed_in", "साइन इन है")
     & P ("auth.signed_out", "साइन आउट है")
     & P ("auth.session_expired", "सत्र समाप्त")
     & P ("auth.locked", "लॉक है")
     & P ("auth.two_factor_required", "दो-चरणीय सत्यापन आवश्यक")
     & P ("billing.trialing", "परीक्षण अवधि में")
     & P ("billing.payment_due", "भुगतान देय")
     & P ("billing.payment_failed", "भुगतान विफल")
     & P ("billing.paid", "भुगतान हो गया")
     & P ("billing.past_due", "बकाया")
     & P ("billing.canceled", "रद्द")
     & P ("ci.pipeline_pending", "पाइपलाइन लंबित")
     & P ("ci.pipeline_running", "पाइपलाइन चल रही है")
     & P ("ci.pipeline_passed", "पाइपलाइन सफल")
     & P ("ci.pipeline_failed", "पाइपलाइन विफल")
     & P ("ci.review_required", "समीक्षा आवश्यक")
     & P ("ci.deploy_blocked", "डिप्लॉय अवरुद्ध")
     & P ("collaboration.active_now", "अभी सक्रिय")
     & P ("collaboration.away", "दूर")
     & P ("collaboration.do_not_disturb", "परेशान न करें")
     & P ("collaboration.typing", "टाइप कर रहे हैं")
     & P ("collaboration.viewing", "देख रहे हैं")
     & P ("collaboration.editing", "संपादित कर रहे हैं")
     & P ("deployment.deploying", "डिप्लॉय हो रहा है")
     & P ("deployment.deployed", "डिप्लॉय हो गया")
     & P ("deployment.rolling_back", "वापस लिया जा रहा है")
     & P ("deployment.rolled_back", "वापस लिया गया")
     & P ("deployment.build_failed", "बिल्ड विफल")
     & P ("deployment.checks_passed", "जाँचें सफल")
     & P ("empty.no_items", "कोई आइटम नहीं")
     & P ("empty.no_results", "कोई परिणाम नहीं")
     & P ("empty.no_messages", "कोई संदेश नहीं")
     & P ("empty.no_selection", "कुछ चयनित नहीं")
     & P ("empty.nothing_to_show", "दिखाने के लिए कुछ नहीं")
     & P ("file.uploading", "अपलोड हो रहा है")
     & P ("file.downloading", "डाउनलोड हो रहा है")
     & P ("file.copying", "कॉपी हो रहा है")
     & P ("file.moving", "ले जाया जा रहा है")
     & P ("file.deleting", "हटाया जा रहा है")
     & P ("file.deleted", "हटाया गया")
     & P ("file.restoring", "पुनर्स्थापित हो रहा है")
     & P ("file.synced", "सिंक हो गया")
     & P ("form.valid_input", "मान्य इनपुट")
     & P ("form.invalid_input", "अमान्य इनपुट")
     & P ("form.dirty", "बदला गया")
     & P ("form.pristine", "अपरिवर्तित")
     & P ("form.submitted", "सबमिट किया गया")
     & P ("form.submission_failed", "सबमिट करना विफल")
     & P ("health.healthy", "स्वस्थ")
     & P ("health.degraded", "प्रदर्शन में गिरावट")
     & P ("health.unhealthy", "अस्वस्थ")
     & P ("health.incident", "घटना")
     & P ("health.maintenance", "रखरखाव")
     & P ("health.recovering", "ठीक हो रहा है")
     & P ("issue.open", "खुला")
     & P ("issue.closed", "बंद")
     & P ("issue.reopened", "फिर से खोला गया")
     & P ("issue.assigned", "असाइन किया गया")
     & P ("issue.unassigned", "असाइन नहीं")
     & P ("issue.merged", "मर्ज किया गया")
     & P ("network.offline", "ऑफ़लाइन")
     & P ("network.online", "ऑनलाइन")
     & P ("network.connecting", "कनेक्ट हो रहा है")
     & P ("network.syncing", "सिंक हो रहा है")
     & P ("network.sync_failed", "सिंक विफल")
     & P ("network.permission_denied", "अनुमति अस्वीकृत")
     & P ("network.read_only", "केवल पढ़ने योग्य")
     & P ("notification.unread", "अपठित")
     & P ("notification.read", "पढ़ा गया")
     & P ("notification.muted", "म्यूट")
     & P ("notification.snoozed", "स्नूज़ किया गया")
     & P ("notification.sent", "भेजा गया")
     & P ("notification.delivered", "डिलीवर हुआ")
     & P ("payment.payment_authorized", "भुगतान अधिकृत")
     & P ("payment.payment_captured", "भुगतान प्राप्त")
     & P ("payment.payment_refunded", "भुगतान वापस किया गया")
     & P ("payment.payment_disputed", "भुगतान विवादित")
     & P ("payment.payment_requires_action",
          "भुगतान के लिए कार्रवाई "
          & "आवश्यक")
     & P ("payment.payment_expired", "भुगतान की समय-सीमा समाप्त")
     & P ("ui.empty", "खाली")
     & P ("ui.loading", "लोड हो रहा है")
     & P ("ui.saving", "सहेजा जा रहा है")
     & P ("ui.saved", "सहेजा गया")
     & P ("ui.unsaved", "सहेजा नहीं गया")
     & P ("ui.retrying", "पुनः प्रयास हो रहा है")
     & P ("ui.paused", "रुका हुआ")
     & P ("ui.complete", "पूर्ण")
     & P ("ui.failed", "विफल")
     & P ("ui.due_soon", "जल्द देय")
     & P ("ui.overdue", "अतिदेय")
     & P ("ui.last_seen", "अंतिम बार देखा गया")
     & P ("ui.updated_just_now", "अभी अपडेट हुआ")
     & P ("queue.queued", "कतार में")
     & P ("queue.running", "चल रहा है")
     & P ("queue.waiting", "प्रतीक्षा में")
     & P ("queue.blocked", "अवरुद्ध")
     & P ("queue.canceled_job", "जॉब रद्द")
     & P ("queue.completed_job", "जॉब पूर्ण")
     & P ("search.filtering", "फ़िल्टर हो रहा है")
     & P ("search.filtered", "फ़िल्टर किया गया")
     & P ("search.no_matches", "कोई मिलान नहीं")
     & P ("search.search_ready", "खोज तैयार")
     & P ("search.search_failed", "खोज विफल")
     & P ("search.query_too_short", "क्वेरी बहुत छोटी")
     & P ("security.secure", "सुरक्षित")
     & P ("security.insecure", "असुरक्षित")
     & P ("security.vulnerable", "कमज़ोर")
     & P ("security.encrypted", "एन्क्रिप्टेड")
     & P ("security.unencrypted", "एन्क्रिप्ट नहीं")
     & P ("security.token_expired", "टोकन की समय-सीमा समाप्त")
     & P ("sync.sync_idle", "सिंक निष्क्रिय")
     & P ("sync.syncing_now", "अभी सिंक हो रहा है")
     & P ("sync.sync_queued", "सिंक कतार में")
     & P ("sync.sync_conflict", "सिंक विरोध")
     & P ("sync.sync_complete", "सिंक पूर्ण")
     & P ("sync.sync_error", "सिंक त्रुटि")
     & P ("task.todo", "करना है")
     & P ("task.in_progress", "प्रगति पर")
     & P ("task.done", "हो गया")
     & P ("task.skipped", "छोड़ा गया")
     & P ("task.blocked_task", "अवरुद्ध")
     & P ("task.waiting_on", "प्रतीक्षा में")
     & P ("ticket.ticket_new", "नया टिकट")
     & P ("ticket.ticket_open", "खुला टिकट")
     & P ("ticket.ticket_waiting", "टिकट प्रतीक्षा में")
     & P ("ticket.ticket_escalated", "टिकट एस्केलेट किया गया")
     & P ("ticket.ticket_resolved", "टिकट हल हुआ")
     & P ("ticket.ticket_closed", "टिकट बंद")
     & P ("transfer.importing", "आयात हो रहा है")
     & P ("transfer.imported", "आयात हुआ")
     & P ("transfer.import_failed", "आयात विफल")
     & P ("transfer.exporting", "निर्यात हो रहा है")
     & P ("transfer.exported", "निर्यात हुआ")
     & P ("transfer.export_failed", "निर्यात विफल")
     & P ("validation.required", "आवश्यक")
     & P ("validation.optional", "वैकल्पिक")
     & P ("validation.invalid", "अमान्य")
     & P ("validation.too_short", "बहुत छोटा")
     & P ("validation.too_long", "बहुत लंबा")
     & P ("validation.out_of_range", "सीमा से बाहर")
     & P ("validation.already_exists", "पहले से मौजूद")
     & P ("workflow.draft", "मसौदा")
     & P ("workflow.in_review", "समीक्षा में")
     & P ("workflow.approved", "स्वीकृत")
     & P ("workflow.rejected", "अस्वीकृत")
     & P ("workflow.published", "प्रकाशित")
     & P ("workflow.archived", "संग्रहीत")
     & P ("database.database_online", "डेटाबेस ऑनलाइन")
     & P ("database.database_offline", "डेटाबेस ऑफ़लाइन")
     & P ("database.database_degraded",
          "डेटाबेस प्रदर्शन में "
          & "गिरावट")
     & P ("database.database_migrating", "डेटाबेस माइग्रेट हो रहा है")
     & P ("database.database_migration_failed", "डेटाबेस माइग्रेशन विफल")
     & P ("database.database_replicating",
          "डेटाबेस प्रतिकृति हो रही "
          & "है")
     & P ("database.database_replication_lagging",
          "डेटाबेस प्रतिकृति पिछड़ "
          & "रही है")
     & P ("database.database_backup_running", "डेटाबेस बैकअप चल रहा है")
     & P ("database.database_backup_failed", "डेटाबेस बैकअप विफल")
     & P ("times_noun",
          "{count, plural, =0 {{other}: कभी नहीं} =1 {{one}: एक "
          & "बार} =2 {{other}: दो बार} other {{other}: {count} "
          & "बार}}")
     & P ("availability.all",
          "{total} {total, plural, one {{one}} other {{other}}} में से "
          & "{available} उपलब्ध")
     & P ("availability.none", "कोई {other} उपलब्ध नहीं")
     & P ("availability.partial",
          "{total} {total, plural, one {{one}} other {{other}}} में से "
          & "{available} उपलब्ध, {unavailable} अनुपलब्ध")
     & P ("operation_progress", "{name} – {state}: {details}")
     & P ("operation.queued", "कतार में")
     & P ("operation.running", "चालू")
     & P ("operation.blocked", "अवरुद्ध")
     & P ("operation.retrying", "पुनः प्रयास जारी")
     & P ("operation.succeeded", "सफल")
     & P ("operation.partially_succeeded", "आंशिक रूप से सफल")
     & P ("operation.failed", "विफल")
     & P ("operation.canceled", "रद्द")
     & P ("operation.skipped", "छोड़ा गया")
     & P ("operation.stale", "पुराना")
     & P ("operation.unknown_state", "अज्ञात")
     & P ("operation.last_success", "{name} – अंतिम सफलता: {time}")
     & P ("operation.next_retry", "{name} – अगला प्रयास: {time}")
     & P ("operation.stale_run", "{name} – {time} से पुराना")
     & P ("summary.skipped", "{count} छोड़े गए")
     & P ("summary.retried", "{count} पुनः प्रयास किए गए")
     & P ("summary.canceled", "{count} रद्द")
     & P ("system.service.operational", "चालू")
     & P ("system.service.degraded", "प्रदर्शन में गिरावट")
     & P ("system.service.partial_outage", "आंशिक आउटेज")
     & P ("system.service.major_outage", "बड़ा आउटेज")
     & P ("system.service.maintenance", "रखरखाव जारी")
     & P ("system.service.unknown", "सेवा की स्थिति अज्ञात")
     & P ("system.health.healthy", "स्वस्थ")
     & P ("system.health.warning", "चेतावनी")
     & P ("system.health.critical", "गंभीर")
     & P ("system.health.unavailable", "अनुपलब्ध")
     & P ("system.health.unknown_health", "स्वास्थ्य स्थिति अज्ञात")
     & P ("system.readiness.ready", "तैयार")
     & P ("system.readiness.not_ready", "तैयार नहीं")
     & P ("system.readiness.starting", "शुरू हो रहा है")
     & P ("system.readiness.draining", "ड्रेन हो रहा है")
     & P ("system.readiness.stopped", "रुका हुआ")
     & P ("system.readiness.unknown_readiness", "तैयारी की स्थिति अज्ञात")
     & P ("system.component.online", "ऑनलाइन")
     & P ("system.component.offline", "ऑफ़लाइन")
     & P ("system.component.starting", "शुरू हो रहा है")
     & P ("system.component.stopping", "रुक रहा है")
     & P ("system.component.restarting", "पुनः आरंभ हो रहा है")
     & P ("system.component.unknown", "घटक की स्थिति अज्ञात")
     & P ("system.check.passing", "पास")
     & P ("system.check.failing", "फ़ेल")
     & P ("system.check.warning", "चेतावनी")
     & P ("system.check.skipped", "छोड़ा गया")
     & P ("system.check.timed_out", "समय समाप्त")
     & P ("system.check.unknown", "जाँच की स्थिति अज्ञात")
     & P ("system.incident.investigating", "जाँच जारी")
     & P ("system.incident.identified", "कारण पहचाना गया")
     & P ("system.incident.monitoring", "निगरानी जारी")
     & P ("system.incident.resolved", "हल हो गया")
     & P ("system.incident.scheduled_maintenance", "निर्धारित रखरखाव")
     & P ("system.named", "{name}: {state}")
     & P ("system.check_named", "{name} जाँच: {state}")
     & P ("system.count.components",
          "{count, plural, =0 {कोई घटक नहीं} one {{count} "
          & "घटक} other {{count} घटक}}")
     & P ("system.count.checks",
          "{count, plural, =0 {कोई जाँच नहीं} one {{count} "
          & "जाँच} other {{count} जाँचें}}")
     & P ("system.count.incidents",
          "{count, plural, =0 {कोई घटना नहीं} one {{count} "
          & "घटना} other {{count} घटनाएँ}}")
     & P ("system.uptime", "अपटाइम {measure}")
     & P ("system.latency", "विलंबता {measure}")
     & P ("system.maintenance_window", "रखरखाव अवधि {time}")
     & P ("system.last_checked", "अंतिम जाँच {time}")
     & P ("system.http.informational", "सूचनात्मक")
     & P ("system.http.successful", "सफल")
     & P ("system.http.redirection", "रीडायरेक्शन")
     & P ("system.http.client_error", "क्लाइंट त्रुटि")
     & P ("system.http.server_error", "सर्वर त्रुटि")
     & P ("system.exit.success", "निकास कोड {code}: सफल")
     & P ("system.exit.failure", "निकास कोड {code}: विफल")
     & P ("system.exit.usage_error", "निकास कोड {code}: उपयोग त्रुटि")
     & P ("system.exit.not_executable",
          "निकास कोड {code}: कमांड "
          & "निष्पादन योग्य नहीं")
     & P ("system.exit.not_found",
          "निकास कोड {code}: कमांड नहीं "
          & "मिला")
     & P ("system.exit.invalid_argument",
          "निकास कोड {code}: अमान्य निकास "
          & "तर्क")
     & P ("system.exit.signal",
          "निकास कोड {code}: {signal} द्वारा "
          & "समाप्त");
end Locale_Hi;
