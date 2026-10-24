separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Hi (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "hi", Name, Template);
   end P;
   --  The domain labels (label.*), in nested subunits.
   procedure Labels_1 is separate;
   procedure Labels_2 is separate;
   procedure Labels_3 is separate;
begin
   P ("all_count", "सभी {total} {total, plural, one {{one}} other {{other}}}");
   P ("filtered_count.none",
      "{gender, select, masculine {मेल खाते कोई {other} "
      & "नहीं} feminine {मेल खाती कोई {other} "
      & "नहीं} other {मेल खाते कोई {other} "
      & "नहीं}}");
   P ("filtered_count.all",
      "{gender, select, masculine {सभी {total} {total, plural, one "
      & "{{one}} other {{other}}} {total, plural, one {मेल खाता "
      & "है} other {मेल खाते हैं}}} feminine {सभी "
      & "{total} {total, plural, one {{one}} other {{other}}} {total, plural, "
      & "one {मेल खाती है} other {मेल खाती "
      & "हैं}}} other {सभी {total} {total, plural, one {{one}} "
      & "other {{other}}} मेल खाते हैं}}");
   P ("filtered_count.some",
      "{gender, select, masculine {{total} {total, plural, one {{one}} other "
      & "{{other}}} में से {matching} {matching, plural, one "
      & "{मेल खाता है} other {मेल खाते "
      & "हैं}}} feminine {{total} {total, plural, one {{one}} other "
      & "{{other}}} में से {matching} {matching, plural, one "
      & "{मेल खाती है} other {मेल खाती "
      & "हैं}}} other {{total} {total, plural, one {{one}} other "
      & "{{other}}} में से {matching} मेल खाते "
      & "हैं}}");
   P ("more_count", "{visible} दिखाए गए, +{remaining} और");
   P ("others_count",
      "{first} और {remaining, plural, one {1 अन्य} other "
      & "{{remaining} अन्य}}");
   P ("page_count", "पृष्ठ {page} / {total}");
   P ("page_size",
      "प्रति पृष्ठ {size} {size, plural, one {{one}} "
      & "other {{other}}}");
   P ("pagination_range",
      "{total} {total, plural, one {{one}} other {{other}}} में से "
      & "{first}–{last}");
   P ("position_count", "{total} में से {position}");
   P ("selection_count",
      "{total} {total, plural, one {{one}} other {{other}}} में से "
      & "{selected} चयनित");
   P ("showing_count",
      "{gender, select, masculine {{total} {total, plural, one {{one}} other "
      & "{{other}}} में से {showing} {showing, plural, one "
      & "{दिखाया जा रहा है} other {दिखाए "
      & "जा रहे हैं}}} feminine {{total} {total, plural, one "
      & "{{one}} other {{other}}} में से {showing} {showing, plural, "
      & "one {दिखाई जा रही है} other {दिखाई "
      & "जा रही हैं}}} other {{total} {total, plural, one "
      & "{{one}} other {{other}}} में से {showing} दिखाए "
      & "जा रहे हैं}}");
   P ("validation_count",
      "{count, plural, =0 {कोई {severity, select, error "
      & "{त्रुटि} warning {चेतावनी} other "
      & "{सूचना}} नहीं} =1 {1 {severity, select, error "
      & "{त्रुटि} warning {चेतावनी} other "
      & "{सूचना}}} other {{count} {severity, select, error "
      & "{त्रुटियाँ} warning {चेतावनियाँ} "
      & "other {सूचनाएँ}}}}");
   P ("collection.empty", "कोई {other} नहीं");
   P ("collection.none_shown", "दिखाने के लिए कोई {other} नहीं");
   P ("collection.showing_hidden",
      "{gender, select, masculine {{total} {total, plural, one {{one}} other "
      & "{{other}}} में से {visible} {visible, plural, one "
      & "{दिखाया जा रहा है} other {दिखाए "
      & "जा रहे हैं}}, {hidden} {hidden, plural, one "
      & "{छिपा हुआ} other {छिपे हुए}}} feminine "
      & "{{total} {total, plural, one {{one}} other {{other}}} में से "
      & "{visible} {visible, plural, one {दिखाई जा रही "
      & "है} other {दिखाई जा रही हैं}}, {hidden} "
      & "छिपी हुई} other {{total} {total, plural, one {{one}} "
      & "other {{other}}} में से {visible} दिखाए जा "
      & "रहे हैं, {hidden} छिपे हुए}}");
   P ("collection.showing",
      "{gender, select, masculine {{total} {total, plural, one {{one}} other "
      & "{{other}}} में से {visible} {visible, plural, one "
      & "{दिखाया जा रहा है} other {दिखाए "
      & "जा रहे हैं}}} feminine {{total} {total, plural, one "
      & "{{one}} other {{other}}} में से {visible} {visible, plural, "
      & "one {दिखाई जा रही है} other {दिखाई "
      & "जा रही हैं}}} other {{total} {total, plural, one "
      & "{{one}} other {{other}}} में से {visible} दिखाए "
      & "जा रहे हैं}}");
   P ("collection.shown_hidden",
      "{gender, select, masculine {{visible} {visible, plural, one {{one}} "
      & "other {{other}}} {visible, plural, one {दिखाया गया} "
      & "other {दिखाए गए}}, {hidden} {hidden, plural, one "
      & "{छिपा हुआ} other {छिपे हुए}}} feminine "
      & "{{visible} {visible, plural, one {{one}} other {{other}}} {visible, "
      & "plural, one {दिखाई गई} other {दिखाई "
      & "गईं}}, {hidden} छिपी हुई} other {{visible} "
      & "{visible, plural, one {{one}} other {{other}}} दिखाए गए, "
      & "{hidden} छिपे हुए}}");
   P ("collection.shown",
      "{gender, select, masculine {{visible} {visible, plural, one {{one}} "
      & "other {{other}}} {visible, plural, one {दिखाया गया} "
      & "other {दिखाए गए}}} feminine {{visible} {visible, plural, "
      & "one {{one}} other {{other}}} {visible, plural, one {दिखाई "
      & "गई} other {दिखाई गईं}}} other {{visible} {visible, "
      & "plural, one {{one}} other {{other}}} दिखाए गए}}");
   P ("collection.visible_out_of",
      "{gender, select, masculine {{total} {total, plural, one {{one}} other "
      & "{{other}}} में से {visible} {visible, plural, one {{one}} "
      & "other {{other}}} {visible, plural, one {दिखाई दे "
      & "रहा है} other {दिखाई दे रहे हैं}}} "
      & "feminine {{total} {total, plural, one {{one}} other {{other}}} "
      & "में से {visible} {visible, plural, one {{one}} other "
      & "{{other}}} {visible, plural, one {दिखाई दे रही "
      & "है} other {दिखाई दे रही हैं}}} other "
      & "{{total} {total, plural, one {{one}} other {{other}}} में से "
      & "{visible} {visible, plural, one {{one}} other {{other}}} "
      & "दिखाई दे रहे हैं}}");
   P ("complete_count", "{total} में से {done} पूर्ण");
   P ("percent_complete", "{percent}% पूर्ण");
   P ("step_count", "चरण {step} / {total}");
   P ("attempt_count", "प्रयास {attempt} / {total}");
   P ("throughput_remaining",
      "{remaining} {remaining, plural, one {{one}} other {{other}}} "
      & "शेष, {rate} {unit}/से की दर से");
   P ("accessible_progress",
      "{total} में से {done} पूर्ण, {percent} "
      & "प्रतिशत");
   P ("business_days", "{days} कार्य दिवस");
   P ("working_hours",
      "{hours, plural, =1 {1 कार्य घंटा} other {{hours} "
      & "कार्य घंटे}}");
   P ("due.overdue",
      "{days, plural, =1 {1 दिन} other {{days} दिनों}} से "
      & "अतिदेय");
   P ("due.today", "आज देय");
   P ("due.tomorrow", "कल देय");
   P ("due.in",
      "{days, plural, one {{days} दिन में देय} other "
      & "{{days} दिनों में देय}}");
   P ("calendar_difference.future", "{difference} में");
   P ("calendar_difference.past", "{difference} पहले");
   P ("calendar_difference.same_day", "उसी दिन");
   P ("calendar_difference.zero", "0 दिन");
   P ("cpu_load", "CPU लोड: {measure}");
   P ("battery", "बैटरी: {measure}");
   P ("screen_size", "स्क्रीन: {measure}");
   P ("refresh_rate", "रीफ़्रेश दर: {measure}");
   P ("editorial_percent.symbol", "{value}%");
   P ("editorial_percent.word", "{value} प्रतिशत");
   P ("recurrence.second",
      "{every, plural, =1 {हर सेकंड} other {हर {every} "
      & "सेकंड}}");
   P ("recurrence.minute",
      "{every, plural, =1 {हर मिनट} other {हर {every} "
      & "मिनट}}");
   P ("recurrence.hour",
      "{every, plural, =1 {हर घंटे} other {हर {every} "
      & "घंटे}}");
   P ("recurrence.day",
      "{every, plural, =1 {हर दिन} other {हर {every} "
      & "दिन}}");
   P ("recurrence.week",
      "{every, plural, =1 {हर सप्ताह} other {हर {every} "
      & "सप्ताह}}");
   P ("recurrence.month",
      "{every, plural, =1 {हर महीने} other {हर {every} "
      & "महीने}}");
   P ("recurrence.quarter",
      "{every, plural, =1 {हर तिमाही} other {हर {every} "
      & "तिमाही}}");
   P ("recurrence.year",
      "{every, plural, =1 {हर साल} other {हर {every} "
      & "साल}}");
   P ("cache_summary.empty", "कैश: कोई अनुरोध नहीं");
   P ("cache_summary",
      "कैश: {hits} हिट, {misses} मिस, {rate}% हिट "
      & "दर");
   P ("field_change_summary",
      "{gender, select, masculine {{total} {total, plural, one {{one}} other "
      & "{{other}}}: {changed} {changed, plural, one {बदला गया} "
      & "other {बदले गए}}, {added} {added, plural, one "
      & "{जोड़ा गया} other {जोड़े गए}}, {removed} "
      & "{removed, plural, one {हटाया गया} other {हटाए "
      & "गए}}} feminine {{total} {total, plural, one {{one}} other "
      & "{{other}}}: {changed} {changed, plural, one {बदली गई} "
      & "other {बदली गईं}}, {added} {added, plural, one "
      & "{जोड़ी गई} other {जोड़ी गईं}}, {removed} "
      & "{removed, plural, one {हटाई गई} other {हटाई "
      & "गईं}}} other {{total} {total, plural, one {{one}} other "
      & "{{other}}}: {changed} बदले गए, {added} जोड़े "
      & "गए, {removed} हटाए गए}}");
   P ("field_diff",
      "{field} को {before} से {after} में बदला "
      & "गया");
   P ("field_added",
      "{field} को {value} के रूप में जोड़ा "
      & "गया");
   P ("field_removed", "{field} हटाया गया (पहले {value} था)");
   P ("field_unchanged", "{field} अपरिवर्तित: {value}");
   P ("number_comparison.equal", "{current}, {baseline} के बराबर है");
   P ("number_comparison.higher", "{current}, {baseline} से {quantity} अधिक है");
   P ("number_comparison.lower", "{current}, {baseline} से {quantity} कम है");
   P ("percent_comparison.equal", "{current}, {baseline} के बराबर है");
   P ("percent_comparison.higher", "{current}, {baseline} से {quantity} अधिक है");
   P ("percent_comparison.lower", "{current}, {baseline} से {quantity} कम है");
   P ("file_size_comparison.same", "{current} का आकार {baseline} के बराबर है");
   P ("file_size_comparison.larger", "{current}, {baseline} से {quantity} बड़ा है");
   P ("file_size_comparison.smaller", "{current}, {baseline} से {quantity} छोटा है");
   P ("date_comparison.same",
      "{current} और {baseline} की तारीख एक ही "
      & "है");
   P ("date_comparison.after", "{current}, {baseline} से {quantity} बाद है");
   P ("date_comparison.before", "{current}, {baseline} से {quantity} पहले है");
   P ("queue_summary", "कतार: {details}");
   P ("queue_summary.empty", "कतार खाली है");
   P ("domain_summary",
      "{domain, select, queue {कतार} job {जॉब} run {रन} "
      & "cache {कैश} sync {सिंक} import {आयात} export "
      & "{निर्यात} other {{domain}}} – {state, select, queued "
      & "{कतार में} running {चालू} waiting "
      & "{प्रतीक्षारत} paused {रोका गया} "
      & "complete {पूर्ण} failed {विफल} stale "
      & "{पुराना} skipped {छोड़ा गया} other "
      & "{{state}}}: {details}");
   P ("summary.none", "कोई {other} नहीं");
   P ("summary.completed", "{count} {count, plural, one {{one}} other {{other}}} पूर्ण");
   P ("summary.completed_of",
      "{total} {total, plural, one {{one}} other {{other}}} में से "
      & "{count} पूर्ण");
   P ("summary.failed", "{count} विफल");
   P ("summary.queued",
      "{count} {count, plural, one {{one}} other {{other}}} कतार "
      & "में");
   P ("summary.running", "{count} चालू");
   P ("summary.complete", "{count} पूर्ण");
   P ("backup.backup_running", "बैकअप चल रहा है");
   P ("backup.backup_completed", "बैकअप पूरा हुआ");
   P ("backup.backup_failed", "बैकअप विफल");
   P ("backup.backup_stale", "बैकअप पुराना है");
   P ("incident.incident_investigating", "घटना की जाँच हो रही है");
   P ("incident.incident_identified", "घटना की पहचान हुई");
   P ("incident.incident_mitigated", "घटना का प्रभाव कम किया गया");
   P ("incident.incident_resolved", "घटना हल हुई");
   P ("release.release_drafting", "रिलीज़ तैयार की जा रही है");
   P ("release.release_ready", "रिलीज़ तैयार");
   P ("release.release_published", "रिलीज़ प्रकाशित");
   P ("release.release_rolled_back", "रिलीज़ वापस ली गई");
   P ("audit.audit_created", "ऑडिट प्रविष्टि बनाई गई");
   P ("audit.audit_updated", "ऑडिट प्रविष्टि अपडेट की गई");
   P ("audit.audit_deleted", "ऑडिट प्रविष्टि हटाई गई");
   P ("audit.audit_restored",
      "ऑडिट प्रविष्टि "
      & "पुनर्स्थापित की गई");
   P ("flag.flag_enabled", "फ़ीचर फ़्लैग सक्षम");
   P ("flag.flag_disabled", "फ़ीचर फ़्लैग अक्षम");
   P ("flag.flag_rolling_out",
      "फ़ीचर फ़्लैग रोल आउट हो "
      & "रहा है");
   P ("flag.flag_rolled_back", "फ़ीचर फ़्लैग वापस लिया गया");
   P ("webhook.webhook_pending", "वेबहुक लंबित");
   P ("webhook.webhook_delivered", "वेबहुक डिलीवर हुआ");
   P ("webhook.webhook_failed", "वेबहुक विफल");
   P ("webhook.webhook_retrying",
      "वेबहुक का पुनः प्रयास हो "
      & "रहा है");
   P ("api_key.api_key_active", "API कुंजी सक्रिय");
   P ("api_key.api_key_revoked", "API कुंजी रद्द की गई");
   P ("api_key.api_key_expired", "API कुंजी की समय-सीमा समाप्त");
   P ("api_key.api_key_rotated", "API कुंजी बदली गई");
   P ("quota.quota_available", "कोटा उपलब्ध");
   P ("quota.quota_near_limit", "कोटा सीमा के करीब");
   P ("quota.quota_exceeded", "कोटा पार हो गया");
   P ("quota.quota_reset", "कोटा रीसेट हुआ");
   P ("invoice.invoice_draft", "चालान का मसौदा");
   P ("invoice.invoice_sent", "चालान भेजा गया");
   P ("invoice.invoice_paid", "चालान का भुगतान हुआ");
   P ("invoice.invoice_refunded", "चालान की राशि वापस की गई");
   P ("invoice.invoice_overdue", "चालान अतिदेय");
   P ("invoice.refund_failed", "धनवापसी विफल");
   P ("page_navigation.only", "एकमात्र पृष्ठ");
   P ("page_navigation.first", "पहला पृष्ठ, अगला उपलब्ध");
   P ("page_navigation.last", "अंतिम पृष्ठ, पिछला उपलब्ध");
   P ("page_navigation.middle", "पिछला और अगला उपलब्ध");
   P ("end_of_week", "सप्ताह का अंत");
   P ("end_of_month", "महीने का अंत");
   P ("end_of_quarter", "तिमाही का अंत");
   P ("time_of_day.night", "रात");
   P ("time_of_day.morning", "सुबह");
   P ("time_of_day.afternoon", "दोपहर");
   P ("time_of_day.evening", "शाम");
   P ("access.allowed", "अनुमति है");
   P ("access.denied", "अस्वीकृत");
   P ("access.owner", "स्वामी");
   P ("access.admin", "व्यवस्थापक");
   P ("access.viewer", "दर्शक");
   P ("access.editor", "संपादक");
   P ("auth.signed_in", "साइन इन है");
   P ("auth.signed_out", "साइन आउट है");
   P ("auth.session_expired", "सत्र समाप्त");
   P ("auth.locked", "लॉक है");
   P ("auth.two_factor_required", "दो-चरणीय सत्यापन आवश्यक");
   P ("billing.trialing", "परीक्षण अवधि में");
   P ("billing.payment_due", "भुगतान देय");
   P ("billing.payment_failed", "भुगतान विफल");
   P ("billing.paid", "भुगतान हो गया");
   P ("billing.past_due", "बकाया");
   P ("billing.canceled", "रद्द");
   P ("ci.pipeline_pending", "पाइपलाइन लंबित");
   P ("ci.pipeline_running", "पाइपलाइन चल रही है");
   P ("ci.pipeline_passed", "पाइपलाइन सफल");
   P ("ci.pipeline_failed", "पाइपलाइन विफल");
   P ("ci.review_required", "समीक्षा आवश्यक");
   P ("ci.deploy_blocked", "डिप्लॉय अवरुद्ध");
   P ("collaboration.active_now", "अभी सक्रिय");
   P ("collaboration.away", "दूर");
   P ("collaboration.do_not_disturb", "परेशान न करें");
   P ("collaboration.typing", "टाइप कर रहे हैं");
   P ("collaboration.viewing", "देख रहे हैं");
   P ("collaboration.editing", "संपादित कर रहे हैं");
   P ("deployment.deploying", "डिप्लॉय हो रहा है");
   P ("deployment.deployed", "डिप्लॉय हो गया");
   P ("deployment.rolling_back", "वापस लिया जा रहा है");
   P ("deployment.rolled_back", "वापस लिया गया");
   P ("deployment.build_failed", "बिल्ड विफल");
   P ("deployment.checks_passed", "जाँचें सफल");
   P ("empty.no_items", "कोई आइटम नहीं");
   P ("empty.no_results", "कोई परिणाम नहीं");
   P ("empty.no_messages", "कोई संदेश नहीं");
   P ("empty.no_selection", "कुछ चयनित नहीं");
   P ("empty.nothing_to_show", "दिखाने के लिए कुछ नहीं");
   P ("file.uploading", "अपलोड हो रहा है");
   P ("file.downloading", "डाउनलोड हो रहा है");
   P ("file.copying", "कॉपी हो रहा है");
   P ("file.moving", "ले जाया जा रहा है");
   P ("file.deleting", "हटाया जा रहा है");
   P ("file.deleted", "हटाया गया");
   P ("file.restoring", "पुनर्स्थापित हो रहा है");
   P ("file.synced", "सिंक हो गया");
   P ("form.valid_input", "मान्य इनपुट");
   P ("form.invalid_input", "अमान्य इनपुट");
   P ("form.dirty", "बदला गया");
   P ("form.pristine", "अपरिवर्तित");
   P ("form.submitted", "सबमिट किया गया");
   P ("form.submission_failed", "सबमिट करना विफल");
   P ("health.healthy", "स्वस्थ");
   P ("health.degraded", "प्रदर्शन में गिरावट");
   P ("health.unhealthy", "अस्वस्थ");
   P ("health.incident", "घटना");
   P ("health.maintenance", "रखरखाव");
   P ("health.recovering", "ठीक हो रहा है");
   P ("issue.open", "खुला");
   P ("issue.closed", "बंद");
   P ("issue.reopened", "फिर से खोला गया");
   P ("issue.assigned", "असाइन किया गया");
   P ("issue.unassigned", "असाइन नहीं");
   P ("issue.merged", "मर्ज किया गया");
   P ("network.offline", "ऑफ़लाइन");
   P ("network.online", "ऑनलाइन");
   P ("network.connecting", "कनेक्ट हो रहा है");
   P ("network.syncing", "सिंक हो रहा है");
   P ("network.sync_failed", "सिंक विफल");
   P ("network.permission_denied", "अनुमति अस्वीकृत");
   P ("network.read_only", "केवल पढ़ने योग्य");
   P ("notification.unread", "अपठित");
   P ("notification.read", "पढ़ा गया");
   P ("notification.muted", "म्यूट");
   P ("notification.snoozed", "स्नूज़ किया गया");
   P ("notification.sent", "भेजा गया");
   P ("notification.delivered", "डिलीवर हुआ");
   P ("payment.payment_authorized", "भुगतान अधिकृत");
   P ("payment.payment_captured", "भुगतान प्राप्त");
   P ("payment.payment_refunded", "भुगतान वापस किया गया");
   P ("payment.payment_disputed", "भुगतान विवादित");
   P ("payment.payment_requires_action",
      "भुगतान के लिए कार्रवाई "
      & "आवश्यक");
   P ("payment.payment_expired", "भुगतान की समय-सीमा समाप्त");
   P ("ui.empty", "खाली");
   P ("ui.loading", "लोड हो रहा है");
   P ("ui.saving", "सहेजा जा रहा है");
   P ("ui.saved", "सहेजा गया");
   P ("ui.unsaved", "सहेजा नहीं गया");
   P ("ui.retrying", "पुनः प्रयास हो रहा है");
   P ("ui.paused", "रुका हुआ");
   P ("ui.complete", "पूर्ण");
   P ("ui.failed", "विफल");
   P ("ui.due_soon", "जल्द देय");
   P ("ui.overdue", "अतिदेय");
   P ("ui.last_seen", "अंतिम बार देखा गया");
   P ("ui.updated_just_now", "अभी अपडेट हुआ");
   P ("queue.queued", "कतार में");
   P ("queue.running", "चल रहा है");
   P ("queue.waiting", "प्रतीक्षा में");
   P ("queue.blocked", "अवरुद्ध");
   P ("queue.canceled_job", "जॉब रद्द");
   P ("queue.completed_job", "जॉब पूर्ण");
   P ("search.filtering", "फ़िल्टर हो रहा है");
   P ("search.filtered", "फ़िल्टर किया गया");
   P ("search.no_matches", "कोई मिलान नहीं");
   P ("search.search_ready", "खोज तैयार");
   P ("search.search_failed", "खोज विफल");
   P ("search.query_too_short", "क्वेरी बहुत छोटी");
   P ("security.secure", "सुरक्षित");
   P ("security.insecure", "असुरक्षित");
   P ("security.vulnerable", "कमज़ोर");
   P ("security.encrypted", "एन्क्रिप्टेड");
   P ("security.unencrypted", "एन्क्रिप्ट नहीं");
   P ("security.token_expired", "टोकन की समय-सीमा समाप्त");
   P ("sync.sync_idle", "सिंक निष्क्रिय");
   P ("sync.syncing_now", "अभी सिंक हो रहा है");
   P ("sync.sync_queued", "सिंक कतार में");
   P ("sync.sync_conflict", "सिंक विरोध");
   P ("sync.sync_complete", "सिंक पूर्ण");
   P ("sync.sync_error", "सिंक त्रुटि");
   P ("task.todo", "करना है");
   P ("task.in_progress", "प्रगति पर");
   P ("task.done", "हो गया");
   P ("task.skipped", "छोड़ा गया");
   P ("task.blocked_task", "अवरुद्ध");
   P ("task.waiting_on", "प्रतीक्षा में");
   P ("ticket.ticket_new", "नया टिकट");
   P ("ticket.ticket_open", "खुला टिकट");
   P ("ticket.ticket_waiting", "टिकट प्रतीक्षा में");
   P ("ticket.ticket_escalated", "टिकट एस्केलेट किया गया");
   P ("ticket.ticket_resolved", "टिकट हल हुआ");
   P ("ticket.ticket_closed", "टिकट बंद");
   P ("transfer.importing", "आयात हो रहा है");
   P ("transfer.imported", "आयात हुआ");
   P ("transfer.import_failed", "आयात विफल");
   P ("transfer.exporting", "निर्यात हो रहा है");
   P ("transfer.exported", "निर्यात हुआ");
   P ("transfer.export_failed", "निर्यात विफल");
   P ("validation.required", "आवश्यक");
   P ("validation.optional", "वैकल्पिक");
   P ("validation.invalid", "अमान्य");
   P ("validation.too_short", "बहुत छोटा");
   P ("validation.too_long", "बहुत लंबा");
   P ("validation.out_of_range", "सीमा से बाहर");
   P ("validation.already_exists", "पहले से मौजूद");
   P ("workflow.draft", "मसौदा");
   P ("workflow.in_review", "समीक्षा में");
   P ("workflow.approved", "स्वीकृत");
   P ("workflow.rejected", "अस्वीकृत");
   P ("workflow.published", "प्रकाशित");
   P ("workflow.archived", "संग्रहीत");
   P ("database.database_online", "डेटाबेस ऑनलाइन");
   P ("database.database_offline", "डेटाबेस ऑफ़लाइन");
   P ("database.database_degraded",
      "डेटाबेस प्रदर्शन में "
      & "गिरावट");
   P ("database.database_migrating", "डेटाबेस माइग्रेट हो रहा है");
   P ("database.database_migration_failed", "डेटाबेस माइग्रेशन विफल");
   P ("database.database_replicating",
      "डेटाबेस प्रतिकृति हो रही "
      & "है");
   P ("database.database_replication_lagging",
      "डेटाबेस प्रतिकृति पिछड़ "
      & "रही है");
   P ("database.database_backup_running", "डेटाबेस बैकअप चल रहा है");
   P ("database.database_backup_failed", "डेटाबेस बैकअप विफल");
   P ("times_noun",
      "{count, plural, =0 {{other}: कभी नहीं} =1 {{one}: एक "
      & "बार} =2 {{other}: दो बार} other {{other}: {count} "
      & "बार}}");
   P ("availability.all",
      "{total} {total, plural, one {{one}} other {{other}}} में से "
      & "{available} उपलब्ध");
   P ("availability.none", "कोई {other} उपलब्ध नहीं");
   P ("availability.partial",
      "{total} {total, plural, one {{one}} other {{other}}} में से "
      & "{available} उपलब्ध, {unavailable} अनुपलब्ध");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "कतार में");
   P ("operation.running", "चालू");
   P ("operation.blocked", "अवरुद्ध");
   P ("operation.retrying", "पुनः प्रयास जारी");
   P ("operation.succeeded", "सफल");
   P ("operation.partially_succeeded", "आंशिक रूप से सफल");
   P ("operation.failed", "विफल");
   P ("operation.canceled", "रद्द");
   P ("operation.skipped", "छोड़ा गया");
   P ("operation.stale", "पुराना");
   P ("operation.unknown_state", "अज्ञात");
   P ("operation.last_success", "{name} – अंतिम सफलता: {time}");
   P ("operation.next_retry", "{name} – अगला प्रयास: {time}");
   P ("operation.stale_run", "{name} – {time} से पुराना");
   P ("summary.skipped", "{count} छोड़े गए");
   P ("summary.retried", "{count} पुनः प्रयास किए गए");
   P ("summary.canceled", "{count} रद्द");
   P ("system.service.operational", "चालू");
   P ("system.service.degraded", "प्रदर्शन में गिरावट");
   P ("system.service.partial_outage", "आंशिक आउटेज");
   P ("system.service.major_outage", "बड़ा आउटेज");
   P ("system.service.maintenance", "रखरखाव जारी");
   P ("system.service.unknown", "सेवा की स्थिति अज्ञात");
   P ("system.health.healthy", "स्वस्थ");
   P ("system.health.warning", "चेतावनी");
   P ("system.health.critical", "गंभीर");
   P ("system.health.unavailable", "अनुपलब्ध");
   P ("system.health.unknown_health", "स्वास्थ्य स्थिति अज्ञात");
   P ("system.readiness.ready", "तैयार");
   P ("system.readiness.not_ready", "तैयार नहीं");
   P ("system.readiness.starting", "शुरू हो रहा है");
   P ("system.readiness.draining", "ड्रेन हो रहा है");
   P ("system.readiness.stopped", "रुका हुआ");
   P ("system.readiness.unknown_readiness", "तैयारी की स्थिति अज्ञात");
   P ("system.component.online", "ऑनलाइन");
   P ("system.component.offline", "ऑफ़लाइन");
   P ("system.component.starting", "शुरू हो रहा है");
   P ("system.component.stopping", "रुक रहा है");
   P ("system.component.restarting", "पुनः आरंभ हो रहा है");
   P ("system.component.unknown", "घटक की स्थिति अज्ञात");
   P ("system.check.passing", "सफल");
   P ("system.check.failing", "विफल");
   P ("system.check.warning", "चेतावनी");
   P ("system.check.skipped", "छोड़ा गया");
   P ("system.check.timed_out", "समय समाप्त");
   P ("system.check.unknown", "जाँच की स्थिति अज्ञात");
   P ("system.incident.investigating", "जाँच जारी");
   P ("system.incident.identified", "कारण पहचाना गया");
   P ("system.incident.monitoring", "निगरानी जारी");
   P ("system.incident.resolved", "हल हो गया");
   P ("system.incident.scheduled_maintenance", "निर्धारित रखरखाव");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "{name} जाँच: {state}");
   P ("system.count.components",
      "{count, plural, =0 {कोई घटक नहीं} one {{count} "
      & "घटक} other {{count} घटक}}");
   P ("system.count.checks",
      "{count, plural, =0 {कोई जाँच नहीं} one {{count} "
      & "जाँच} other {{count} जाँचें}}");
   P ("system.count.incidents",
      "{count, plural, =0 {कोई घटना नहीं} one {{count} "
      & "घटना} other {{count} घटनाएँ}}");
   P ("system.uptime", "अपटाइम {measure}");
   P ("system.latency", "विलंबता {measure}");
   P ("system.maintenance_window", "रखरखाव अवधि {time}");
   P ("system.last_checked", "अंतिम जाँच {time}");
   P ("system.http.informational", "सूचनात्मक");
   P ("system.http.successful", "सफल");
   P ("system.http.redirection", "रीडायरेक्शन");
   P ("system.http.client_error", "क्लाइंट त्रुटि");
   P ("system.http.server_error", "सर्वर त्रुटि");
   P ("system.exit.success", "निकास कोड {code}: सफल");
   P ("system.exit.failure", "निकास कोड {code}: विफल");
   P ("system.exit.usage_error", "निकास कोड {code}: उपयोग त्रुटि");
   P ("system.exit.not_executable",
      "निकास कोड {code}: कमांड "
      & "निष्पादन योग्य नहीं");
   P ("system.exit.not_found",
      "निकास कोड {code}: कमांड नहीं "
      & "मिला");
   P ("system.exit.invalid_argument",
      "निकास कोड {code}: अमान्य निकास "
      & "तर्क");
   P ("system.exit.signal",
      "निकास कोड {code}: {signal} द्वारा "
      & "समाप्त");
   P ("validation.problem.required", "{field}: आवश्यक है");
   P ("validation.problem.minimum", "{field}: न्यूनतम से कम है");
   P ("validation.problem.maximum", "{field}: अधिकतम से अधिक है");
   P ("validation.problem.range", "{field}: सीमा से बाहर है");
   P ("validation.problem.pattern", "{field}: पैटर्न से मेल नहीं खाता");
   P ("validation.problem.choice",
      "{field}: अनुमत विकल्पों में से "
      & "एक होना चाहिए");
   P ("validation.problem.dependency",
      "{field}: किसी अन्य फ़ील्ड पर "
      & "निर्भर है");
   P ("validation.problem.custom", "{field}: अमान्य है");
   P ("validation.constraint.no_relation", "{field}: मान्य {value} होना चाहिए");
   P ("validation.constraint.less_than", "{field}: {value} से कम होना चाहिए");
   P ("validation.constraint.less_or_equal", "{field}: अधिकतम {value} होना चाहिए");
   P ("validation.constraint.greater_than", "{field}: {value} से अधिक होना चाहिए");
   P ("validation.constraint.greater_or_equal", "{field}: कम से कम {value} होना चाहिए");
   P ("validation.constraint.equal_to", "{field}: {value} के बराबर होना चाहिए");
   P ("validation.constraint.not_equal_to",
      "{field}: {value} के बराबर नहीं होना "
      & "चाहिए");
   P ("validation.constraint.before_field", "{field}: {value} से पहले होना चाहिए");
   P ("validation.constraint.after_field", "{field}: {value} के बाद होना चाहिए");
   P ("validation.choices", "{field}: अनुमत मान {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, प्राप्त मान {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, {time} में फिर से प्रयास");
   P ("net_diagnostic.dns", "{endpoint}: DNS लुकअप विफल रहा");
   P ("net_diagnostic.tcp", "{endpoint}: TCP कनेक्शन विफल रहा");
   P ("net_diagnostic.tls", "{endpoint}: TLS प्रमाणपत्र विफल रहा");
   P ("net_diagnostic.http", "{endpoint}: HTTP अनुरोध विफल रहा");
   P ("net_diagnostic.proxy", "{endpoint}: प्रॉक्सी विफल रहा");
   P ("net_diagnostic.timeout", "{endpoint}: समय समाप्त हो गया");
   P ("net_diagnostic.reset", "{endpoint}: कनेक्शन रीसेट हो गया");
   P ("net_diagnostic.unknown_network", "{endpoint}: नेटवर्क समस्या");
   P ("progress.state.not_started", "शुरू नहीं हुआ");
   P ("progress.state.running", "चल रहा है");
   P ("progress.state.stalled", "अटका हुआ");
   P ("progress.state.retrying", "फिर से प्रयास हो रहा है");
   P ("progress.state.complete", "पूर्ण");
   P ("progress.state.failed", "विफल");
   P ("progress.of",
      "{subject}: {total} में से {done} पूर्ण "
      & "({percent}%), {state}");
   P ("progress.done", "{subject}: {done} पूर्ण, {state}");
   P ("collection.summary",
      "{name}: {total} आइटम, {unique} अद्वितीय "
      & "मान, {duplicates} डुप्लिकेट, {outliers} "
      & "आउटलायर");
   P ("top_frequency", "{name}: {value} ({count} बार)");
   P ("calendar_date.fiscal_year", "वित्त वर्ष {year}");
   P ("calendar_date.fiscal_quarter",
      "वित्त वर्ष {year} की {part, plural, =1 "
      & "{पहली} =2 {दूसरी} =3 {तीसरी} other "
      & "{चौथी}} तिमाही");
   P ("calendar_date.fiscal_half",
      "वित्त वर्ष {year} की {part, plural, =1 "
      & "{पहली} other {दूसरी}} छमाही");
   P ("calendar_date.fiscal_year_end", "वित्त वर्ष {year} का अंत");
   P ("calendar_date.semester",
      "{part, plural, =1 {पहला} other {दूसरा}} "
      & "सेमेस्टर {year}");
   P ("calendar_date.half_year",
      "{part, plural, =1 {पहली} other {दूसरी}} "
      & "छमाही {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {{year} की पहली छमाही} other "
      & "{{year} की दूसरी छमाही}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {{text} की शुरुआत} mid {{text} "
      & "का मध्य} other {{text} का अंत}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {{text} की शुरुआत} mid {{text} "
      & "का मध्य} other {{text} का अंत}}");
   P ("calendar_range.weekend.last", "पिछला सप्ताहांत");
   P ("calendar_range.weekend.this", "इस सप्ताहांत");
   P ("calendar_range.weekend.next", "अगला सप्ताहांत");
   P ("calendar_range.weekend_of", "{date} वाला सप्ताहांत");
   P ("calendar_range.week.last", "पिछला सप्ताह");
   P ("calendar_range.week.this", "इस सप्ताह");
   P ("calendar_range.week.next", "अगला सप्ताह");
   P ("calendar_range.week_of", "{date} वाला सप्ताह");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "जारी रखें");
   P ("http.reason.101", "प्रोटोकॉल बदले जा रहे हैं");
   P ("http.reason.102", "प्रोसेस हो रहा है");
   P ("http.reason.103", "प्रारंभिक संकेत");
   P ("http.reason.200", "ठीक है");
   P ("http.reason.201", "बनाया गया");
   P ("http.reason.202", "स्वीकार किया गया");
   P ("http.reason.203", "गैर-आधिकारिक जानकारी");
   P ("http.reason.204", "कोई सामग्री नहीं");
   P ("http.reason.205", "सामग्री रीसेट करें");
   P ("http.reason.206", "आंशिक सामग्री");
   P ("http.reason.207", "बहु-स्थिति");
   P ("http.reason.208", "पहले ही रिपोर्ट किया गया");
   P ("http.reason.226", "IM उपयोग किया गया");
   P ("http.reason.300", "एकाधिक विकल्प");
   P ("http.reason.301", "स्थायी रूप से स्थानांतरित");
   P ("http.reason.302", "मिला");
   P ("http.reason.303", "अन्य देखें");
   P ("http.reason.304", "संशोधित नहीं");
   P ("http.reason.305", "प्रॉक्सी का उपयोग करें");
   P ("http.reason.307", "अस्थायी रीडायरेक्ट");
   P ("http.reason.308", "स्थायी रीडायरेक्ट");
   P ("http.reason.400", "अमान्य अनुरोध");
   P ("http.reason.401", "अनधिकृत");
   P ("http.reason.402", "भुगतान आवश्यक");
   P ("http.reason.403", "निषिद्ध");
   P ("http.reason.404", "नहीं मिला");
   P ("http.reason.405", "विधि की अनुमति नहीं है");
   P ("http.reason.406", "स्वीकार्य नहीं");
   P ("http.reason.407",
      "प्रॉक्सी प्रमाणीकरण "
      & "आवश्यक");
   P ("http.reason.408", "अनुरोध का समय समाप्त");
   P ("http.reason.409", "विरोध");
   P ("http.reason.410", "अब उपलब्ध नहीं");
   P ("http.reason.411", "लंबाई आवश्यक");
   P ("http.reason.412", "पूर्व शर्त विफल");
   P ("http.reason.413", "सामग्री बहुत बड़ी है");
   P ("http.reason.414", "URI बहुत लंबा है");
   P ("http.reason.415", "असमर्थित मीडिया प्रकार");
   P ("http.reason.416", "सीमा पूरी नहीं की जा सकती");
   P ("http.reason.417", "अपेक्षा विफल");
   P ("http.reason.418", "मैं एक चायदानी हूँ");
   P ("http.reason.421",
      "गलत दिशा में भेजा गया "
      & "अनुरोध");
   P ("http.reason.422",
      "संसाधित न की जा सकने वाली "
      & "सामग्री");
   P ("http.reason.423", "लॉक है");
   P ("http.reason.424", "निर्भरता विफल");
   P ("http.reason.425", "बहुत जल्दी");
   P ("http.reason.426", "अपग्रेड आवश्यक");
   P ("http.reason.428", "पूर्व शर्त आवश्यक");
   P ("http.reason.429", "बहुत अधिक अनुरोध");
   P ("http.reason.431",
      "अनुरोध हेडर फ़ील्ड बहुत "
      & "बड़े हैं");
   P ("http.reason.451", "कानूनी कारणों से अनुपलब्ध");
   P ("http.reason.500", "आंतरिक सर्वर त्रुटि");
   P ("http.reason.501", "लागू नहीं किया गया");
   P ("http.reason.502", "ख़राब गेटवे");
   P ("http.reason.503", "सेवा अनुपलब्ध");
   P ("http.reason.504", "गेटवे का समय समाप्त");
   P ("http.reason.505", "HTTP संस्करण समर्थित नहीं");
   P ("http.reason.506",
      "वेरिएंट भी नेगोशिएट करता "
      & "है");
   P ("http.reason.507", "अपर्याप्त संग्रहण");
   P ("http.reason.508", "लूप का पता चला");
   P ("http.reason.510", "विस्तारित नहीं");
   P ("http.reason.511",
      "नेटवर्क प्रमाणीकरण "
      & "आवश्यक");
   P ("errno.reason.0", "सफल");
   P ("errno.reason.1", "कार्य की अनुमति नहीं है");
   P ("errno.reason.2",
      "ऐसी कोई फ़ाइल या "
      & "निर्देशिका नहीं");
   P ("errno.reason.3", "ऐसी कोई प्रक्रिया नहीं");
   P ("errno.reason.4", "सिस्टम कॉल बाधित");
   P ("errno.reason.5", "इनपुट/आउटपुट त्रुटि");
   P ("errno.reason.6", "ऐसा कोई डिवाइस या पता नहीं");
   P ("errno.reason.9", "ख़राब फ़ाइल डिस्क्रिप्टर");
   P ("errno.reason.11",
      "संसाधन अस्थायी रूप से "
      & "अनुपलब्ध");
   P ("errno.reason.12", "पर्याप्त मेमोरी नहीं");
   P ("errno.reason.13", "अनुमति अस्वीकृत");
   P ("errno.reason.17", "फ़ाइल मौजूद है");
   P ("errno.reason.20", "निर्देशिका नहीं है");
   P ("errno.reason.21", "निर्देशिका है");
   P ("errno.reason.22", "अमान्य तर्क");
   P ("errno.reason.24", "बहुत अधिक फ़ाइलें खुली हैं");
   P ("errno.reason.28", "डिवाइस पर कोई जगह नहीं बची");
   P ("errno.reason.32", "टूटा हुआ पाइप");
   P ("errno.reason.98", "पता पहले से उपयोग में है");
   P ("errno.reason.110", "कनेक्शन का समय समाप्त");
   P ("errno.reason.111", "कनेक्शन अस्वीकृत");
   P ("signal.reason.1", "हैंगअप");
   P ("signal.reason.2", "व्यवधान");
   P ("signal.reason.3", "बाहर निकलें");
   P ("signal.reason.4", "अवैध निर्देश");
   P ("signal.reason.5", "ट्रेस ट्रैप");
   P ("signal.reason.6", "निरस्त");
   P ("signal.reason.7", "बस त्रुटि");
   P ("signal.reason.8", "फ़्लोटिंग-पॉइंट अपवाद");
   P ("signal.reason.9", "मार दिया गया");
   P ("signal.reason.10", "उपयोगकर्ता संकेत 1");
   P ("signal.reason.11", "सेगमेंटेशन दोष");
   P ("signal.reason.12", "उपयोगकर्ता संकेत 2");
   P ("signal.reason.13", "टूटा हुआ पाइप");
   P ("signal.reason.14", "अलार्म");
   P ("signal.reason.15", "समाप्ति अनुरोध");
   P ("signal.reason.17",
      "चाइल्ड प्रक्रिया की "
      & "स्थिति बदली");
   P ("signal.reason.18", "जारी रखें");
   P ("signal.reason.19", "रोका गया");
   P ("signal.reason.20", "टर्मिनल से रोका गया");
   P ("signal.reason.28", "विंडो का आकार बदला");
   P ("sqlstate.reason.00", "सफलतापूर्वक पूर्ण");
   P ("sqlstate.reason.01", "चेतावनी");
   P ("sqlstate.reason.02", "कोई डेटा नहीं");
   P ("sqlstate.reason.08", "कनेक्शन अपवाद");
   P ("sqlstate.reason.0a", "सुविधा समर्थित नहीं");
   P ("sqlstate.reason.22", "डेटा अपवाद");
   P ("sqlstate.reason.23", "अखंडता बाधा का उल्लंघन");
   P ("sqlstate.reason.24", "अमान्य कर्सर स्थिति");
   P ("sqlstate.reason.25", "अमान्य लेनदेन स्थिति");
   P ("sqlstate.reason.28",
      "अमान्य प्राधिकरण "
      & "विनिर्देश");
   P ("sqlstate.reason.2d", "अमान्य लेनदेन समाप्ति");
   P ("sqlstate.reason.3d", "अमान्य कैटलॉग नाम");
   P ("sqlstate.reason.3f", "अमान्य स्कीमा नाम");
   P ("sqlstate.reason.40", "लेनदेन रोलबैक");
   P ("sqlstate.reason.42",
      "सिंटैक्स त्रुटि या पहुँच "
      & "नियम का उल्लंघन");
   P ("sqlstate.reason.53", "अपर्याप्त संसाधन");
   P ("sqlstate.reason.54", "प्रोग्राम सीमा पार हुई");
   P ("sqlstate.reason.55",
      "ऑब्जेक्ट पूर्वापेक्षित "
      & "स्थिति में नहीं है");
   P ("sqlstate.reason.57", "ऑपरेटर हस्तक्षेप");
   P ("sqlstate.reason.58", "सिस्टम त्रुटि");
   P ("sqlstate.reason.hv", "फ़ॉरेन डेटा रैपर त्रुटि");
   P ("sqlstate.reason.p0", "PL/pgSQL त्रुटि");
   P ("sqlstate.reason.xx", "आंतरिक त्रुटि");
   P ("system.signal_numbered", "संकेत {number} {name} {reason}");
   P ("http.reason.unknown", "अज्ञात स्थिति");
   P ("errno.reason.unknown", "अज्ञात त्रुटि");
   P ("signal.reason.unknown", "अज्ञात संकेत");
   P ("sqlstate.reason.unknown", "अज्ञात SQLSTATE वर्ग");
   P ("diff.changed",
      "अंतर {path}: {before} से {after} में बदला "
      & "गया");
   P ("diff.added", "अंतर {path}: {after} जोड़ा गया");
   P ("diff.removed", "अंतर {path}: {before} हटाया गया");
   P ("diff.unchanged", "अंतर {path}: अपरिवर्तित");
   P ("diff.redacted",
      "अंतर {path}: बदला गया; मान छिपाए "
      & "गए");
   P ("validation.result",
      "सत्यापन परिणाम: {fields} फ़ील्ड, "
      & "{errors} {errors, plural, =1 {त्रुटि} other "
      & "{त्रुटियाँ}}, {warnings} {warnings, plural, =1 "
      & "{चेतावनी} other {चेतावनियाँ}}, "
      & "{required} आवश्यक फ़ील्ड, {hidden} {hidden, "
      & "plural, =1 {छिपी समस्या} other {छिपी "
      & "समस्याएँ}}");
   P ("file.kind.plain", "फ़ाइल");
   P ("file.kind.directory", "निर्देशिका");
   P ("file.kind.archive", "आर्काइव");
   P ("file.kind.compressed", "संपीड़ित फ़ाइल");
   P ("file.kind.image", "छवि");
   P ("file.kind.script", "स्क्रिप्ट");
   P ("file.kind.executable", "निष्पादन योग्य फ़ाइल");
   P ("file.kind.unknown", "अज्ञात फ़ाइल");
   P ("file.metadata", "फ़ाइल {name}: {kind}");
   P ("file.checksum", "{text}, चेकसम {checksum}");
   P ("file.signature_match",
      "फ़ाइल हस्ताक्षर {name}: {kind}, "
      & "एक्सटेंशन से मेल खाता है");
   P ("file.signature_mismatch",
      "फ़ाइल हस्ताक्षर {name}: "
      & "एक्सटेंशन के अनुसार {expected}, "
      & "सामग्री {actual} जैसी लगती है");
   P ("network_event.connecting", "कनेक्ट हो रहा है");
   P ("network_event.connected", "कनेक्ट हो गया");
   P ("network_event.redirected", "रीडायरेक्ट किया गया");
   P ("network_event.retrying", "फिर से प्रयास हो रहा है");
   P ("network_event.rate_limited", "दर सीमित");
   P ("network_event.tls_failed", "TLS विफल");
   P ("network_event.stalled", "रुका हुआ");
   P ("network_event.complete", "पूर्ण");
   P ("network_event.failed", "विफल");
   P ("network.session", "नेटवर्क {endpoint}: {state}");
   P ("diff_node.field", "फ़ील्ड");
   P ("diff_node.object", "ऑब्जेक्ट");
   P ("diff_node.list", "सूची");
   P ("diff.node",
      "अंतर नोड {path}: {kind}, {count} "
      & "परिवर्तन");
   P ("checksum.not_checked", "चेकसम जाँचा नहीं गया");
   P ("checksum.valid", "चेकसम मान्य");
   P ("checksum.mismatch", "चेकसम बेमेल");
   P ("checksum.missing", "चेकसम अनुपलब्ध");
   P ("product_code", "उत्पाद कोड {kind}: {value}, {state}");
   P ("time_zone.utc", "समय क्षेत्र: UTC");
   P ("time_zone.offset", "समय क्षेत्र: {offset}");
   P ("time_zone.named", "समय क्षेत्र: {name} ({offset})");
   P ("time_zone.local", "समय क्षेत्र: स्थानीय समय");
   P ("time_zone.unknown",
      "समय क्षेत्र: अज्ञात "
      & "क्षेत्र");
   P ("time_zone.dst",
      "{text}, डेलाइट सेविंग टाइम "
      & "लागू होता है");
   P ("zoned_time.plain", "क्षेत्रीय समय: {time} {offset}");
   P ("zoned_time.named", "क्षेत्रीय समय: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, अस्पष्ट स्थानीय समय");
   P ("number.under", "{value} से नीचे");
   P ("number.up_to", "{value} तक");
   P ("number.between", "{low} और {high} के बीच");
   P ("number.range_words", "{low} से {high}");
   P ("number.uncertainty_words", "{value} प्लस-माइनस {delta}");
   P ("number.range_inclusive", "{low} से {high} तक (दोनों सहित)");
   P ("number.range_exclusive", "{low} से अधिक और {high} से कम");
   P ("number.range_low_inclusive", "{low} या अधिक और {high} से कम");
   P ("number.range_high_inclusive", "{low} से अधिक और {high} तक");
   P ("number.at_least", "कम से कम {value}");
   P ("number.more_than", "{value} से अधिक");
   P ("number.at_most", "अधिकतम {value}");
   P ("number.less_than", "{value} से कम");
   P ("number.exactly", "ठीक {value}");
   P ("number.within", "{value}, {bounds} के भीतर है");
   P ("number.below", "{value}, {bounds} से नीचे है");
   P ("number.above", "{value}, {bounds} से ऊपर है");
   P ("number.per", "प्रति {denominator} {numerator}");
   P ("number.one_in", "{whole} में से एक");
   P ("number.out_of", "{whole} में से {value}");
   P ("number.unchanged", "अपरिवर्तित");
   P ("number.change_up", "{quantity} की वृद्धि");
   P ("number.change_down", "{quantity} की कमी");
   P ("number.change_more", "{quantity} अधिक {tail}");
   P ("number.change_fewer", "{quantity} कम {tail}");
   P ("number.since", "{since} से {change}");
   P ("duration.countdown", "{duration} शेष");
   P ("duration.within", "{duration} के भीतर");
   P ("duration.next", "अगले {duration}");
   P ("duration.between", "{low} से {high} के बीच");
   P ("duration.age", "{duration} पुराना");
   P ("duration.stale_for", "{duration} से अपडेट नहीं हुआ");
   P ("duration.backup_age", "बैकअप {duration} पुराना है");
   P ("duration.eta", "अनुमानित समय {duration}");
   P ("duration.expires", "{relative} समाप्त होगा");
   P ("duration.retrying", "{relative} पुनः प्रयास");
   P ("duration.modified", "{relative} संशोधित");
   P ("duration.synced", "{relative} सिंक हुआ");
   P ("duration.modified_now", "अभी-अभी संशोधित");
   P ("duration.synced_now", "अभी-अभी सिंक हुआ");
   P ("duration.natural.less_than_minute", "एक मिनट से कम");
   P ("duration.natural.half_hour",
      "{case, select, oblique {आधे घंटे} other {आधा "
      & "घंटा}}");
   P ("duration.natural.about_half_hour",
      "{case, select, oblique {लगभग आधे घंटे} other "
      & "{लगभग आधा घंटा}}");
   P ("duration.natural.about", "लगभग {duration}");
   P ("duration.natural.almost", "करीब-करीब {duration}");
   P ("duration.natural.over", "{duration} से अधिक");
   P ("duration.natural.just_over", "{duration} से थोड़ा अधिक");
   P ("duration.natural.little_under", "{duration} से थोड़ा कम");
   P ("duration.natural.few",
      "{unit, select, second {{case, select, oblique {कुछ "
      & "सेकंड} other {कुछ सेकंड}}} minute {{case, "
      & "select, oblique {कुछ मिनट} other {कुछ "
      & "मिनट}}} hour {{case, select, oblique {कुछ "
      & "घंटों} other {कुछ घंटे}}} day {{case, select, "
      & "oblique {कुछ दिनों} other {कुछ दिन}}} week "
      & "{{case, select, oblique {कुछ सप्ताहों} other "
      & "{कुछ सप्ताह}}} month {{case, select, oblique "
      & "{कुछ महीनों} other {कुछ महीने}}} "
      & "year {{case, select, oblique {कुछ सालों} other "
      & "{कुछ साल}}} other {कुछ}}");
   P ("duration.distance.past", "{duration} पहले");
   P ("duration.distance.future", "{duration} में");
   P ("duration.case.within", "oblique");
   P ("duration.case.between", "oblique");
   P ("duration.case.stale_for", "oblique");
   P ("duration.case.natural.over", "oblique");
   P ("duration.case.natural.just_over", "oblique");
   P ("duration.case.natural.little_under", "oblique");
   P ("geo.direction.north", "{style, select, short {उ} other {उत्तर}}");
   P ("geo.direction.north_north_east",
      "{style, select, short {उउपू} other "
      & "{उत्तर-उत्तरपूर्व}}");
   P ("geo.direction.north_east",
      "{style, select, short {उपू} other "
      & "{उत्तरपूर्व}}");
   P ("geo.direction.east_north_east",
      "{style, select, short {पूउपू} other "
      & "{पूर्व-उत्तरपूर्व}}");
   P ("geo.direction.east", "{style, select, short {पू} other {पूर्व}}");
   P ("geo.direction.east_south_east",
      "{style, select, short {पूदपू} other "
      & "{पूर्व-दक्षिणपूर्व}}");
   P ("geo.direction.south_east",
      "{style, select, short {दपू} other "
      & "{दक्षिणपूर्व}}");
   P ("geo.direction.south_south_east",
      "{style, select, short {ददपू} other "
      & "{दक्षिण-दक्षिणपूर्व}}");
   P ("geo.direction.south", "{style, select, short {द} other {दक्षिण}}");
   P ("geo.direction.south_south_west",
      "{style, select, short {ददप} other "
      & "{दक्षिण-दक्षिणपश्चिम}}");
   P ("geo.direction.south_west",
      "{style, select, short {दप} other "
      & "{दक्षिणपश्चिम}}");
   P ("geo.direction.west_south_west",
      "{style, select, short {पदप} other "
      & "{पश्चिम-दक्षिणपश्चिम}}");
   P ("geo.direction.west", "{style, select, short {प} other {पश्चिम}}");
   P ("geo.direction.west_north_west",
      "{style, select, short {पउप} other "
      & "{पश्चिम-उत्तरपश्चिम}}");
   P ("geo.direction.north_west",
      "{style, select, short {उप} other "
      & "{उत्तरपश्चिम}}");
   P ("geo.direction.north_north_west",
      "{style, select, short {उउप} other "
      & "{उत्तर-उत्तरपश्चिम}}");
   P ("geo.bearing", "{degrees} {direction}");
   P ("geo.distance_direction", "{distance} {direction}");
   P ("geo.about_distance_direction", "लगभग {distance} {direction}");
   P ("geo.coordinate", "{latitude}, {longitude}");
   P ("geo.bounding_box",
      "दक्षिणपश्चिम {southwest}; "
      & "उत्तरपूर्व {northeast}");
   P ("geo.inside_box", "सीमा बॉक्स के अंदर");
   P ("geo.outside_box", "सीमा बॉक्स के बाहर");
   P ("number.about", "लगभग {value}");
   P ("number.almost", "करीब-करीब {value}");
   P ("number.over", "{value} से अधिक");
   P ("number.plus_minus", "{value} ± {delta}");
   P ("number.plus_minus_parenthesized", "{value} (± {delta})");
   Labels_1;
   Labels_2;
   Labels_3;
end Locale_Hi;
