separate (Humanize.Catalogs.Phrase_Data.Locale_Hi)
procedure Labels_3 is
begin
   P ("label.search.saved_search_label",
      "सहेजी गई खोज: {name}{count, plural, =0 {} other {, "
      & "{count, number} परिणाम}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {कोई हाल की खोज नहीं} "
      & "one {{count, number} हाल की खोज} other {{count, "
      & "number} हाल की खोजें}}");
   P ("label.search.search_query_label", "“{query}” खोजें");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {कोई परिणाम नहीं} other "
      & "{{count, number} परिणाम}}");
   P ("label.search.search_result_summary_label",
      "“{query}” के परिणाम: {count, plural, =0 {कोई "
      & "परिणाम नहीं} other {{count, number} "
      & "परिणाम}}");
   P ("label.search.search_scope_label",
      "{name} दायरा, {count, plural, =0 {कोई "
      & "परिणाम नहीं} other {{count, number} "
      & "परिणाम}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {खोज निष्क्रिय} "
      & "searching_search {खोज जारी है} complete_search "
      & "{खोज पूरी} empty_search {कोई खोज "
      & "परिणाम नहीं} other {खोज विफल}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {प्रासंगिकता "
      & "के अनुसार क्रमबद्ध करें} "
      & "ascending_sort {आरोही क्रम में "
      & "क्रमबद्ध करें} descending_sort "
      & "{अवरोही क्रम में क्रमबद्ध "
      & "करें} newest_first_sort {नवीनतम पहले "
      & "क्रमबद्ध करें} other {सबसे "
      & "पुराने पहले क्रमबद्ध "
      & "करें}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {प्रासंगिकता} "
      & "ascending_sort {आरोही} descending_sort {अवरोही} "
      & "newest_first_sort {नवीनतम पहले} other "
      & "{सबसे पुराने पहले}}");
   P ("label.search.suggestion_label", "क्या आपका मतलब “{query}” था?");
   P ("label.secrets.credential_source_label", "{source} से {count, number} क्रेडेंशियल");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {मान छिपा हुआ} "
      & "masked_value {मान मास्क किया गया} "
      & "suffix_only {केवल प्रत्यय} other {केवल "
      & "फ़िंगरप्रिंट}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {सार्वजनिक} "
      & "support_profile {सहायता} audit_profile {ऑडिट} "
      & "other {डीबग}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, true {रोटेशन आवश्यक} "
      & "other {रोटेशन आवश्यक नहीं}}{days_old, "
      & "plural, =0 {} other {, {days_old, number} दिन "
      & "पुराना}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API कुंजी} live_api_key "
      & "{लाइव API कुंजी} test_api_key {टेस्ट API "
      & "कुंजी} github_token {GitHub टोकन} aws_access_key "
      & "{AWS एक्सेस कुंजी} google_api_key {Google API "
      & "कुंजी} slack_token {Slack टोकन} npm_token {npm "
      & "टोकन} bearer_token {बेयरर टोकन} jwt_token "
      & "{JWT टोकन} basic_auth_credential {बेसिक ऑथ "
      & "क्रेडेंशियल} password_secret "
      & "{पासवर्ड} private_key {निजी कुंजी} "
      & "ssh_private_key {SSH निजी कुंजी} webhook_secret "
      & "{वेबहुक सीक्रेट} oauth_token {OAuth "
      & "टोकन} database_url_secret {डेटाबेस URL "
      & "सीक्रेट} sha1_fingerprint {SHA-1 "
      & "फ़िंगरप्रिंट} sha256_fingerprint {SHA-256 "
      & "फ़िंगरप्रिंट} other {सीक्रेट}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {ईमेल} phone_value {फ़ोन} "
      & "url_value {URL} ip_address_value {IP पता} token_value "
      & "{टोकन} file_path_value {फ़ाइल पथ} "
      & "account_id_value {खाता ID} payment_reference_value "
      & "{भुगतान संदर्भ} log_field_value {लॉग "
      & "फ़ील्ड} other {संवेदनशील मान}}");
   P ("label.tables.cell_label",
      "पंक्ति {row, number}, कॉलम {column, number}, "
      & "{state, select, empty_cell {खाली} edited_cell "
      & "{संपादित} invalid_cell {अमान्य} "
      & "highlighted_cell {हाइलाइट किया गया} other "
      & "{केवल पढ़ने योग्य}}");
   P ("label.tables.cell_position_label", "पंक्ति {row, number}, कॉलम {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {खाली सेल} edited_cell "
      & "{संपादित सेल} invalid_cell {अमान्य "
      & "सेल} highlighted_cell {हाइलाइट किया "
      & "गया सेल} other {केवल पढ़ने "
      & "योग्य सेल}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {कोई कॉलम नहीं} other "
      & "{{count, number} कॉलम}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {टेक्स्ट "
      & "कॉलम} number_column {संख्या कॉलम} "
      & "date_column {दिनांक कॉलम} status_column "
      & "{स्थिति कॉलम} action_column {क्रिया "
      & "कॉलम} other {छिपा हुआ कॉलम}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {टेक्स्ट कॉलम} "
      & "number_column {संख्या कॉलम} date_column "
      & "{दिनांक कॉलम} status_column {स्थिति "
      & "कॉलम} action_column {क्रिया कॉलम} other "
      & "{छिपा हुआ कॉलम}}");
   P ("label.tables.group_label",
      "{name}: {count, plural, one {{count, number} पंक्ति} other "
      & "{{count, number} पंक्तियाँ}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {कोई पंक्ति नहीं} one "
      & "{{count, number} पंक्ति} other {{count, number} "
      & "पंक्तियाँ}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {क्रमबद्ध नहीं} "
      & "ascending_sort {आरोही} other {अवरोही}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {क्रमबद्ध नहीं} "
      & "ascending_sort {{column_name} के अनुसार "
      & "आरोही क्रम में} other {{column_name} के "
      & "अनुसार अवरोही क्रम में}}");
   P ("label.tables.subtotal_label", "{name} का उप-योग: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {{rows, number} पंक्ति} other {{rows, "
      & "number} पंक्तियाँ}} × {columns, number} "
      & "कॉलम");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {{assignee} से "
      & "असाइनमेंट हटाया गया} assigned "
      & "{{assignee} को सौंपा गया} reassigned {{assignee} "
      & "को फिर से सौंपा गया} watching "
      & "{{assignee} देख रहे हैं} other {{assignee} "
      & "कार्य के स्वामी हैं}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {सौंपा नहीं गया} "
      & "assigned {सौंपा गया} reassigned {फिर से "
      & "सौंपा गया} watching {देख रहे हैं} "
      & "other {कार्य के स्वामी}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {बैकलॉग खाली} other "
      & "{बैकलॉग: {count, number} कार्य}}");
   P ("label.tasks.blocker_label", "{name} द्वारा अवरुद्ध");
   P ("label.tasks.complete_action_label",
      "{count, plural, =1 {कार्य पूरा करें} other "
      & "{{count, number} कार्य पूरे करें}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {कोई पूर्ण कार्य "
      & "नहीं} other {{count, number} पूर्ण कार्य}}");
   P ("label.tasks.due_label", "देय {due_text}");
   P ("label.tasks.estimate_label", "अनुमानित {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {कोई खुला कार्य "
      & "नहीं} one {{count, number} खुला कार्य} other "
      & "{{count, number} खुले कार्य}}");
   P ("label.tasks.overdue_label", "{due_text} से अतिदेय");
   P ("label.tasks.recurring_task_label", "दोहराव: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, =1 {कार्य फिर से खोलें} "
      & "other {{count, number} कार्य फिर से "
      & "खोलें}}");
   P ("label.tasks.sprint_label", "{name}: {count, number} कार्य");
   P ("label.tasks.subtask_label", "{name}: {count, number} उप-कार्य");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {कोई कार्य नहीं} other "
      & "{{count, number} कार्य}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {खुला कार्य} "
      & "in_progress_task {प्रगति में कार्य} "
      & "blocked_task {अवरुद्ध कार्य} done_task "
      & "{पूर्ण कार्य} canceled_task {रद्द "
      & "कार्य} deferred_task {स्थगित कार्य} "
      & "other {अतिदेय कार्य}}{priority, select, "
      & "no_priority {} low_priority {, कम प्राथमिकता} "
      & "medium_priority {, मध्यम प्राथमिकता} "
      & "high_priority {, उच्च प्राथमिकता} other {, "
      & "गंभीर प्राथमिकता}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {कोई "
      & "प्राथमिकता नहीं} low_priority {कम "
      & "प्राथमिकता} medium_priority {मध्यम "
      & "प्राथमिकता} high_priority {उच्च "
      & "प्राथमिकता} other {गंभीर "
      & "प्राथमिकता}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {खुला कार्य} "
      & "in_progress_task {प्रगति में कार्य} "
      & "blocked_task {अवरुद्ध कार्य} done_task "
      & "{पूर्ण कार्य} canceled_task {रद्द "
      & "कार्य} deferred_task {स्थगित कार्य} "
      & "other {अतिदेय कार्य}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {ऊपरी सीमा} other "
      & "{निचली सीमा}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {अपेक्षित सीमा "
      & "से नीचे} within_range {अपेक्षित "
      & "सीमा के भीतर} above_range "
      & "{अपेक्षित सीमा से ऊपर} below_target "
      & "{लक्ष्य से नीचे} at_target {लक्ष्य "
      & "पर} above_target {लक्ष्य से ऊपर} near_limit "
      & "{सीमा के निकट} warning_level "
      & "{चेतावनी सीमा} critical_level {गंभीर "
      & "सीमा} breached {सीमा पार} other {सीमा "
      & "की स्थिति अज्ञात}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {अद्यतित} other "
      & "{{ahead, number} कमिट आगे}}} other {{ahead, plural, =0 "
      & "{} other {{ahead, number} कमिट आगे, }}{behind, number} "
      & "कमिट पीछे}}");
   P ("label.workflows.approval_label",
      "{waiting, select, true {{approver} की स्वीकृति "
      & "की प्रतीक्षा} other {{approver} "
      & "द्वारा स्वीकृत}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, =1 {{attempt, plural, =1 {प्रयास 1/1} "
      & "other {प्रयास {attempt, number}/1, सीमा "
      & "पार}}} other {प्रयास {attempt, number}/{limit, "
      & "number}}}");
   P ("label.workflows.blocker_label", "अवरुद्ध: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {कोई अवरोधक "
      & "निर्भरता नहीं} one {{count, number} "
      & "अवरोधक निर्भरता} other {{count, number} "
      & "अवरोधक निर्भरताएँ}}");
   P ("label.workflows.handoff_label", "{from} से {to} को हस्तांतरण");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {आगामी "
      & "माइलस्टोन} current_milestone {वर्तमान "
      & "माइलस्टोन} complete_milestone {पूर्ण "
      & "माइलस्टोन} missed_milestone {चूका हुआ "
      & "माइलस्टोन} other {अवरुद्ध "
      & "माइलस्टोन}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {आगामी} "
      & "current_milestone {वर्तमान} complete_milestone "
      & "{पूर्ण} missed_milestone {चूक गया} other "
      & "{अवरुद्ध}}");
   P ("label.workflows.next_action_label", "अगला: {action}");
   P ("label.workflows.owner_label", "स्वामी: {owner}");
   P ("label.workflows.resume_label", "{name} फिर से शुरू करें");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {लंबित} active_step "
      & "{सक्रिय} waiting_step {प्रतीक्षारत} "
      & "blocked_step {अवरुद्ध} done_step {पूर्ण} "
      & "failed_step {विफल} other {छोड़ा गया}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {लंबित} active_step "
      & "{सक्रिय} waiting_step {प्रतीक्षारत} "
      & "blocked_step {अवरुद्ध} done_step {पूर्ण} "
      & "failed_step {विफल} other {छोड़ा गया}}");
   P ("label.workflows.waiting_label", "{reason} की प्रतीक्षा");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {शुरू नहीं "
      & "हुआ} in_progress_state {प्रगति में} "
      & "waiting_state {प्रतीक्षारत} "
      & "waiting_approval_state {स्वीकृति की "
      & "प्रतीक्षा} blocked_state {अवरुद्ध} "
      & "completed_state {पूर्ण} failed_state {विफल} "
      & "cancelled_state {रद्द} skipped_state {छोड़ा "
      & "गया} other {रोका गया}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {शुरू नहीं "
      & "हुआ} in_progress_state {प्रगति में} "
      & "waiting_state {प्रतीक्षारत} "
      & "waiting_approval_state {स्वीकृति की "
      & "प्रतीक्षा} blocked_state {अवरुद्ध} "
      & "completed_state {पूर्ण} failed_state {विफल} "
      & "cancelled_state {रद्द} skipped_state {छोड़ा "
      & "गया} other {रोका गया}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {पारदर्शी} "
      & "mostly_transparent {अधिकतर पारदर्शी} "
      & "translucent {अर्धपारदर्शी} mostly_opaque "
      & "{अधिकतर अपारदर्शी} other "
      & "{अपारदर्शी}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {कोई अवलोकन नहीं} other "
      & "{{count, number} अवलोकन, न्यूनतम {minimum} "
      & "{unit}, माध्यिका {median} {unit}, अधिकतम "
      & "{maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {कोई "
      & "अवलोकन नहीं} other {{total, number} "
      & "अवलोकनों में से 0 असामान्य "
      & "मान}}} one {{total, number} अवलोकनों में "
      & "से 1 असामान्य मान} other {{total, number} "
      & "अवलोकनों में से {outliers, number} "
      & "असामान्य मान}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {कोई अवलोकन "
      & "नहीं} sample_too_small_shape {आकार बताने "
      & "के लिए नमूना बहुत छोटा, {count, "
      & "plural, one {{count, number} अवलोकन} other {{count, "
      & "number} अवलोकन}}} flat_shape {{median} पर समतल "
      & "वितरण} outlier_heavy_shape {{median} के आसपास "
      & "अधिक असामान्य मानों वाला "
      & "वितरण} volatile_shape {{median} के आसपास "
      & "अस्थिर वितरण} clustered_shape {{median} के "
      & "आसपास समूहित वितरण} wide_spread_shape "
      & "{व्यापक रूप से फैला वितरण} "
      & "wide_spread_range {{minimum} से {maximum} तक "
      & "व्यापक रूप से फैला वितरण} "
      & "right_skewed_shape {दाईं ओर विषम वितरण, "
      & "माध्यिका {median}} left_skewed_shape {बाईं "
      & "ओर विषम वितरण, माध्यिका "
      & "{median}} other {{median} के आसपास अधिकतर "
      & "संतुलित वितरण}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {खाली ईमेल} address "
      & "{ईमेल पता} other {{domain} पर ईमेल}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {फ़ोन नंबर} redacted "
      & "{फ़ोन नंबर छिपाया गया} other "
      & "{{digits} पर समाप्त होने वाला "
      & "फ़ोन}}");
   P ("label.privacy.safe_handle_label",
      "{state, select, none {हैंडल} other {हैंडल "
      & "{shown}}}");
   P ("label.privacy.code_symbol_label",
      "{state, select, none {कोड प्रतीक} other {कोड "
      & "प्रतीक {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "पता मेटाडेटा: {present, plural, one {{present, "
      & "number} फ़ील्ड मौजूद} other {{present, number} "
      & "फ़ील्ड मौजूद}}, {missing, plural, one {{missing, "
      & "number} फ़ील्ड अनुपस्थित} other "
      & "{{missing, number} फ़ील्ड अनुपस्थित}}");
   P ("label.endpoints.host_label",
      "{state, select, none {अज्ञात होस्ट} other "
      & "{{host} {kind}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {अज्ञात एंडपॉइंट} "
      & "other {{scheme}{host}{port} {kind} एंडपॉइंट}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {खाली URL} none {बिना "
      & "पहचाने गए घटकों वाला URL} other "
      & "{{count, plural, one {{count, number} घटक} other {{count, "
      & "number} घटकों}} वाला URL: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {कोई क्वेरी "
      & "पैरामीटर नहीं} one {{count, number} "
      & "क्वेरी पैरामीटर} other {{count, number} "
      & "क्वेरी पैरामीटर}}");
   P ("label.endpoints.ip_address_label",
      "{address} {kind, select, ipv4_host {सार्वजनिक IPv4 "
      & "पता} ipv6_host {सार्वजनिक IPv6 पता} "
      & "private_network_host {निजी नेटवर्क पता} "
      & "localhost_host {लोकल होस्ट} other {IP पता "
      & "नहीं}}");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr} अमान्य CIDR} other {{cidr} "
      & "{kind} नेटवर्क प्रीफ़िक्स {prefix}}}");
   P ("label.resources.utilization_label",
      "{total, number} {unit} में से {used, number} उपयोग "
      & "में ({percent}, {band})");
   P ("label.resources.remaining_label",
      "{state, select, over {क्षमता से {count, number} {unit} "
      & "अधिक} other {{total, number} {unit} में से {count, "
      & "number} शेष}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {कोटा {count, number} {unit} से "
      & "पार ({percent} उपयोग)} near {कोटा सीमा "
      & "के निकट: {count, number} {unit} शेष ({percent} "
      & "उपयोग)} other {कोटा उपलब्ध: {count, "
      & "number} {unit} शेष ({percent} उपयोग)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {कैश हिट दर "
      & "अनुपलब्ध: कोई अनुरोध नहीं} "
      & "other {कैश हिट दर {percent}: {hits, number} हिट, "
      & "{misses, number} मिस}}");
   P ("label.resources.saturation_label",
      "{named, select, no {संसाधन} other {{name}}} {percent} "
      & "{band}");
   P ("label.versions.version_label",
      "{state, select, both {संस्करण {version}, "
      & "प्रीरिलीज़ {prerelease}, बिल्ड {build}} "
      & "prerelease {संस्करण {version}, "
      & "प्रीरिलीज़ {prerelease}} build "
      & "{संस्करण {version}, बिल्ड {build}} other "
      & "{संस्करण {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {समान संस्करण} "
      & "major_upgrade {मेजर अपग्रेड} minor_upgrade "
      & "{माइनर अपग्रेड} patch_upgrade {पैच "
      & "अपग्रेड} prerelease_change "
      & "{प्रीरिलीज़ परिवर्तन} "
      & "build_metadata_change {बिल्ड मेटाडेटा "
      & "परिवर्तन} downgrade {डाउनग्रेड} "
      & "other {अज्ञात संस्करण "
      & "परिवर्तन}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {ठीक संस्करण {version}} "
      & "minimum_range {संस्करण {version} या नया} "
      & "maximum_range {संस्करण {version} या "
      & "पुराना} major_compatible_range {मेजर "
      & "संस्करण {version} के साथ संगत} "
      & "minor_compatible_range {माइनर संस्करण "
      & "{version} के साथ संगत} other {संस्करण "
      & "सीमा {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {प्रारंभिक विकास "
      & "रिलीज़ {version}} prerelease "
      & "{प्रीरिलीज़ {version}} major {मेजर "
      & "रिलीज़ {version}} minor {माइनर "
      & "रिलीज़ {version}} other {पैच रिलीज़ "
      & "{version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {लिंक टैग} image {छवि "
      & "टैग} paragraph {अनुच्छेद टैग} ordered_list "
      & "{क्रमित सूची टैग} unordered_list "
      & "{अक्रमित सूची टैग} list_item {सूची "
      & "आइटम टैग} table_header_cell {तालिका "
      & "शीर्ष सेल टैग} table_cell {तालिका "
      & "सेल टैग} table_row {तालिका पंक्ति "
      & "टैग} line_break {पंक्ति विराम टैग} "
      & "thematic_break {विषयगत विराम टैग} "
      & "heading_level_n {शीर्षक स्तर {level, number} "
      & "टैग} other {{name} टैग}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {{name} एट्रिब्यूट} event "
      & "{{name} इवेंट हैंडलर "
      & "एट्रिब्यूट} other {{name} "
      & "एट्रिब्यूट, मान “{value}”}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {{count, number} एट्रिब्यूट} "
      & "other {{count, number} एट्रिब्यूट}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {{count, number} data "
      & "एट्रिब्यूट} other {{count, number} data "
      & "एट्रिब्यूट}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {{count, number} ARIA "
      & "एट्रिब्यूट} other {{count, number} ARIA "
      & "एट्रिब्यूट}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {{count, number} इवेंट "
      & "हैंडलर} other {{count, number} इवेंट "
      & "हैंडलर}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {टेक्स्ट "
      & "सामग्री} html_content {HTML दस्तावेज़} "
      & "json_content {JSON दस्तावेज़} xml_content {XML "
      & "दस्तावेज़} image_content {छवि "
      & "सामग्री} audio_content {ऑडियो "
      & "सामग्री} video_content {वीडियो "
      & "सामग्री} font_content {फ़ॉन्ट "
      & "सामग्री} archive_content {आर्काइव "
      & "सामग्री} binary_content {बाइनरी "
      & "सामग्री} form_content {फ़ॉर्म "
      & "सबमिशन} other {अज्ञात सामग्री}} "
      & "({base})");
   P ("label.markup.heading_label", "शीर्षक स्तर {level, number}");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {{count, number} टैग} other {{count, number} "
      & "टैग}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {{count, number} लिंक} other {{count, "
      & "number} लिंक}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} मीडिया तत्व} "
      & "other {{count, number} मीडिया तत्व}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} फ़ॉर्म "
      & "नियंत्रण} other {{count, number} फ़ॉर्म "
      & "नियंत्रण}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {{count, number} शीर्षक} other "
      & "{{count, number} शीर्षक}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {{count, number} लैंडमार्क} "
      & "other {{count, number} लैंडमार्क}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {{count, number} फ़ॉर्म} other "
      & "{{count, number} फ़ॉर्म}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} मीडिया तत्व} "
      & "other {{count, number} मीडिया तत्व}}");
   P ("label.markup.table_navigation_label",
      "{caption} पंक्ति {row, number}/{rows, number}, "
      & "कॉलम {column, number}/{columns, number}");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind} सेट नहीं} hidden_value "
      & "{{kind} छिपा हुआ} masked_value {{kind} {shown}} "
      & "fingerprint_only {{kind} फ़िंगरप्रिंट, "
      & "अंत में {shown}} other {{kind}, अंत में "
      & "{shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} {kind} सेट नहीं} other "
      & "{{name} {kind}, अंत में {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {{name} क्रेडेंशियल "
      & "हेडर सेट नहीं} other {{name} {kind}, अंत "
      & "में {shown}}}");
   P ("label.secrets.fingerprint_label",
      "{algorithm} फ़िंगरप्रिंट, अंत में "
      & "{shown}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} सीक्रेट} other "
      & "{{count, number} सीक्रेट}}");
   P ("label.secrets.secret_count_label.masked", "{count, number} मास्क किए गए");
   P ("label.secrets.secret_count_label.unset", "{count, number} सेट नहीं");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} "
      & "फ़िंगरप्रिंट} other {{count, number} "
      & "फ़िंगरप्रिंट}}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label} सेट नहीं} redacted "
      & "{{label} छिपाया गया} url_redacted {URL "
      & "छिपाया गया} ip_redacted {IP पता "
      & "छिपाया गया} path_ending {फ़ाइल पथ, "
      & "अंत में {shown}} at {{label} {shown} पर} audit "
      & "{{label} लंबाई {length, number}, अंत में "
      & "{shown}} debug {{label} {shown}} other {{label}, अंत में "
      & "{shown}}}");
   P ("label.schema.field_label",
      "{state, select, deprecated_field {अप्रचलित } "
      & "unknown_field {अज्ञात } read_only_field "
      & "{केवल-पठन } write_only_field {केवल-लेखन "
      & "} computed_field {परिकलित } other {}}{presence, select, "
      & "required_field {आवश्यक} optional_field "
      & "{वैकल्पिक} conditional_field {सशर्त} other "
      & "{उपस्थिति अज्ञात}}{nullable, select, "
      & "non_nullable {, गैर-null} nullable {, null-योग्य} "
      & "other {}} {kind, select, string_field {स्ट्रिंग} "
      & "integer_field {पूर्णांक} decimal_field "
      & "{दशमलव} boolean_field {बूलियन} date_field "
      & "{दिनांक} date_time_field {दिनांक-समय} "
      & "object_field {ऑब्जेक्ट} array_field {ऐरे} "
      & "enum_field {एनम} binary_field {बाइनरी} null_field "
      & "{null} any_field {कोई भी} other {अज्ञात}} "
      & "फ़ील्ड {name}");
   P ("label.schema.schema_summary_label.fields",
      "{count, plural, one {{count, number} फ़ील्ड} other "
      & "{{count, number} फ़ील्ड}}");
   P ("label.schema.schema_summary_label.required", "{count, number} आवश्यक");
   P ("label.schema.schema_summary_label.optional", "{count, number} वैकल्पिक");
   P ("label.schema.schema_summary_label.deprecated", "{count, number} अप्रचलित");
   P ("label.schema.schema_summary_label.unknown", "{count, number} अज्ञात");
   P ("label.schema.type_mismatch_label",
      "फ़ील्ड {field_name}: अपेक्षित {expected, "
      & "select, string_field {स्ट्रिंग} integer_field "
      & "{पूर्णांक} decimal_field {दशमलव} "
      & "boolean_field {बूलियन} date_field {दिनांक} "
      & "date_time_field {दिनांक-समय} object_field "
      & "{ऑब्जेक्ट} array_field {ऐरे} enum_field "
      & "{एनम} binary_field {बाइनरी} null_field {null} "
      & "any_field {कोई भी} other {अज्ञात}}, मिला "
      & "{actual, select, string_field {स्ट्रिंग} integer_field "
      & "{पूर्णांक} decimal_field {दशमलव} "
      & "boolean_field {बूलियन} date_field {दिनांक} "
      & "date_time_field {दिनांक-समय} object_field "
      & "{ऑब्जेक्ट} array_field {ऐरे} enum_field "
      & "{एनम} binary_field {बाइनरी} null_field {null} "
      & "any_field {कोई भी} other {अज्ञात}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} अवरोधक समस्या} other {{blocking, "
      & "number} अवरोधक समस्याएँ}}} blocking "
      & "{{base}, {blocking, plural, one {{blocking, number} अवरोधक "
      & "समस्या} other {{blocking, number} अवरोधक "
      & "समस्याएँ}}} only {केवल {base}} other {{base}}}");
   P ("label.diagnostics.check_run_summary_label.none", "कोई जाँच नहीं चली");
   P ("label.diagnostics.check_run_summary_label.passed", "{count, number} सफल");
   P ("label.diagnostics.check_run_summary_label.failed", "{count, number} विफल");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {{count, number} चेतावनी} other "
      & "{{count, number} चेतावनियाँ}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "{count, number} छोड़ी गईं");
   P ("label.diagnostics.check_run_summary_label.pending", "{count, number} लंबित");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {लक्ष्य सीमा "
      & "{low} से {high}} other {लक्ष्य विंडो {low} "
      & "से {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} अपेक्षित सीमा "
      & "के भीतर} below {{value} अपेक्षित "
      & "सीमा से नीचे} other {{value} "
      & "अपेक्षित सीमा से ऊपर}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} गंभीर सीमा पर} "
      & "warning {{value} चेतावनी सीमा पर} other "
      & "{{value} सामान्य सीमा के भीतर}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {सीमा पार नहीं} other "
      & "{{difference} से सीमा पार}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {लक्ष्य पर} below "
      & "{लक्ष्य से {difference} नीचे} other "
      & "{लक्ष्य से {difference} ऊपर}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {सीमा पार} near {सीमा "
      & "के निकट, {distance} शेष} other {सीमा से "
      & "{distance} दूर}}");
   P ("label.thresholds.threshold_summary_label.none", "कोई मीट्रिक नहीं");
   P ("label.thresholds.threshold_summary_label.normal", "{count, number} सामान्य");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {{count, number} चेतावनी} other "
      & "{{count, number} चेतावनियाँ}}");
   P ("label.thresholds.threshold_summary_label.critical", "{count, number} गंभीर");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {{count, number} उल्लंघन} other "
      & "{{count, number} उल्लंघन}}");
   P ("label.thresholds.target_window_label", "लक्ष्य {target} ± {tolerance}");
   P ("label.thresholds.tolerance_label", "सहनशीलता {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "सीमा का {percent}");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {सीमा {amount} से पार} "
      & "other {{amount} शेष}}");
   P ("label.thresholds.budget_used_label",
      "{budget} में से {used} उपयोग किया "
      & "गया");
   P ("label.workflows.step_label", "चरण {current, number}/{total, number}: {name}");
   P ("label.workflows.milestone_label",
      "{total, number} में से {current, number} "
      & "माइलस्टोन पूर्ण: {name}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {{count, number} आइटम} other {{count, "
      & "number} आइटम}}");
   P ("label.workflows.workflow_summary_label.completed", "{count, number} पूर्ण");
   P ("label.workflows.workflow_summary_label.active", "{count, number} सक्रिय");
   P ("label.workflows.workflow_summary_label.blocked", "{count, number} अवरुद्ध");
   P ("label.workflows.workflow_summary_label.failed", "{count, number} विफल");
   P ("label.workflows.workflow_summary_label.skipped", "{count, number} छोड़े गए");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {कोई वर्कफ़्लो "
      & "आइटम नहीं} half {वर्कफ़्लो आधा "
      & "पूर्ण} other {{total, number} में से {completed, "
      & "number} पूर्ण}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {कतार में स्थान {position, "
      & "number}} other {कतार में स्थान {position, "
      & "number}/{total, number}}}");
   P ("label.changes.change_set_label.none", "कोई परिवर्तन नहीं");
   P ("label.changes.change_set_label.added", "{count, number} जोड़े गए");
   P ("label.changes.change_set_label.removed", "{count, number} हटाए गए");
   P ("label.changes.change_set_label.modified", "{count, number} बदले गए");
   P ("label.changes.change_set_label.unchanged", "{count, number} अपरिवर्तित");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {{count, number} आइटम} other {{count, "
      & "number} आइटम}}");
   P ("label.changes.change_summary_label.added", "{count, number} जोड़े गए");
   P ("label.changes.change_summary_label.removed", "{count, number} हटाए गए");
   P ("label.changes.change_summary_label.modified", "{count, number} बदले गए");
   P ("label.changes.change_summary_label.renamed", "{count, number} के नाम बदले गए");
   P ("label.changes.change_summary_label.unchanged", "{count, number} अपरिवर्तित");
   P ("label.changes.sync_change_label.none", "कोई सिंक परिवर्तन नहीं");
   P ("label.changes.sync_change_label.uploaded", "{count, number} अपलोड किए गए");
   P ("label.changes.sync_change_label.downloaded", "{count, number} डाउनलोड किए गए");
   P ("label.changes.sync_change_label.deleted", "{count, number} हटाए गए");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} विरोध} other {{count, "
      & "number} विरोध}}");
   P ("label.changes.net_change_label",
      "{state, select, none {कोई शुद्ध "
      & "परिवर्तन नहीं} up {शुद्ध +{count, "
      & "plural, one {{count, number} आइटम} other {{count, number} "
      & "आइटम}}} other {शुद्ध -{count, plural, one {{count, "
      & "number} आइटम} other {{count, number} आइटम}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {समीक्षा के लिए कोई "
      & "परिवर्तन नहीं} all {सभी "
      & "परिवर्तनों की समीक्षा हो "
      & "गई} other {{total, number} में से {reviewed, number} "
      & "परिवर्तनों की समीक्षा "
      & "हुई}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} {new_value} पर "
      & "अपरिवर्तित} up {{field_name} {old_value} से "
      & "बढ़कर {new_value} हुआ} other {{field_name} {old_value} "
      & "से घटकर {new_value} हुआ}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {चयन योग्य कोई "
      & "पंक्ति नहीं} none {कोई पंक्ति "
      & "चयनित नहीं} all {{total, plural, one {1 "
      & "पंक्ति} other {सभी {total, number} "
      & "पंक्तियाँ}} चयनित} other {{total, number} "
      & "में से {selected, number} पंक्तियाँ "
      & "चयनित}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {कोई पृष्ठ नहीं} other "
      & "{{pages, plural, =0 {कोई पृष्ठ नहीं} other "
      & "{{rows, plural, =0 {पृष्ठ {page, number}/{pages, number}} "
      & "one {पृष्ठ {page, number}/{pages, number}, {rows, number} "
      & "पंक्ति} other {पृष्ठ {page, number}/{pages, "
      & "number}, {rows, number} पंक्तियाँ}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {कोई पंक्ति नहीं} "
      & "none {कोई पंक्ति मेल नहीं "
      & "खाती} all {{total, plural, one {1 पंक्ति} other "
      & "{सभी {total, number} पंक्तियाँ}} "
      & "दृश्यमान} other {{total, number} में से "
      & "{visible, number} पंक्तियाँ "
      & "दृश्यमान}}");
end Labels_3;
