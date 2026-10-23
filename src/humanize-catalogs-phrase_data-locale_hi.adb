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
     & P ("feature_flag.flag_enabled", "फ़ीचर फ़्लैग सक्षम")
     & P ("feature_flag.flag_disabled", "फ़ीचर फ़्लैग अक्षम")
     & P ("feature_flag.flag_rolling_out",
          "फ़ीचर फ़्लैग रोल आउट हो "
          & "रहा है")
     & P ("feature_flag.flag_rolled_back", "फ़ीचर फ़्लैग वापस लिया गया")
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
     & P ("time_of_day.evening", "शाम");
end Locale_Hi;
