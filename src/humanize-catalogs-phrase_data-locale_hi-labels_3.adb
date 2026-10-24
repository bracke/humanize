separate (Humanize.Catalogs.Phrase_Data.Locale_Hi)
procedure Labels_3 is
begin
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {सक्रिय "
      & "फ़िल्टर} inactive_filter {निष्क्रिय "
      & "फ़िल्टर} other {बहिष्कृत "
      & "फ़िल्टर}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {सक्रिय "
      & "फ़िल्टर} inactive_filter {निष्क्रिय "
      & "फ़िल्टर} other {बहिष्कृत "
      & "फ़िल्टर}}");
   P ("label.search.no_results_label",
      "“{query}” के लिए कोई परिणाम "
      & "नहीं");
   P ("label.search.recent_search_label", "हाल की खोज: “{query}”");
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
      & "{लाइव API कुंजी} test_api_key {परीक्षण "
      & "API कुंजी} github_token {GitHub टोकन} aws_access_key "
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
      "{state, select, unassigned {असाइन नहीं} assigned "
      & "{सौंपा गया} reassigned {फिर से "
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
      & "स्तंभ {column, number}/{columns, number}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} गुप्त मान} other "
      & "{{count, number} गुप्त मान}}");
   P ("label.secrets.secret_count_label.masked", "{count, number} छिपाए गए");
   P ("label.secrets.secret_count_label.unset", "{count, number} सेट नहीं");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} "
      & "फ़िंगरप्रिंट} other {{count, number} "
      & "फ़िंगरप्रिंट}}");
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
   P ("label.tables.row_range_label",
      "{state, select, none {कोई पंक्ति नहीं} "
      & "single {पंक्ति {first_row, number}/{total, number}} other "
      & "{पंक्तियाँ {first_row, number}-{last_row, "
      & "number}/{total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {कोई वर्ण सीमा "
      & "नहीं} none_left {कोई वर्ण शेष "
      & "नहीं} left {{count, plural, one {{count, number} वर्ण} "
      & "other {{count, number} वर्ण}} शेष} other {सीमा "
      & "से {count, plural, one {{count, number} वर्ण} other "
      & "{{count, number} वर्ण}} अधिक}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {कोई आवश्यक फ़ील्ड "
      & "नहीं} one {{missing, plural, =0 {सभी आवश्यक "
      & "फ़ील्ड पूर्ण} other {1 में से 1 "
      & "आवश्यक फ़ील्ड अनुपस्थित}}} "
      & "other {{missing, plural, =0 {सभी आवश्यक "
      & "फ़ील्ड पूर्ण} other {{total, number} में "
      & "से {missing, number} आवश्यक फ़ील्ड "
      & "अनुपस्थित}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {कोई फ़ील्ड नहीं} all "
      & "{सभी फ़ील्ड पूर्ण} other {{total, number} "
      & "में से {completed, number} फ़ील्ड "
      & "पूर्ण}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: कोई फ़ील्ड "
      & "नहीं} all {{name}: सभी फ़ील्ड "
      & "पूर्ण} other {{name}: {total, number} में से "
      & "{completed, number} फ़ील्ड पूर्ण}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {कोई फ़ॉर्म चरण "
      & "नहीं} one {चरण 1/1: {name}} other {चरण {current, "
      & "number}/{total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {कोई ब्रेडक्रंब "
      & "नहीं} one {ब्रेडक्रंब 1/1: {name}} other "
      & "{ब्रेडक्रंब {current, number}/{total, number}: "
      & "{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {कोई टैब नहीं} one {टैब "
      & "1/1: {name}} other {टैब {current, number}/{total, number}: "
      & "{name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {इनबॉक्स खाली} one {{unread, "
      & "plural, =0 {सभी सूचनाएँ पढ़ी गईं} "
      & "other {1 में से 1 सूचना अपठित}}} other "
      & "{{unread, plural, =0 {सभी सूचनाएँ पढ़ी "
      & "गईं} other {{total, number} में से {unread, number} "
      & "सूचनाएँ अपठित}}}}");
   P ("label.notifications.delivery_attempt_label",
      "डिलीवरी प्रयास {attempt, "
      & "number}/{max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {कोई चेकलिस्ट आइटम "
      & "नहीं} one {{done, plural, =0 {1 में से 0 "
      & "आइटम पूर्ण} other {1 में से 1 आइटम "
      & "पूर्ण}}} other {{total, number} में से {done, "
      & "number} आइटम पूर्ण}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {कोई अपलोड नहीं} one "
      & "{{done, plural, =0 {1 में से 0 अपलोड "
      & "पूर्ण} other {1 में से 1 अपलोड "
      & "पूर्ण}}} other {{total, number} में से {done, "
      & "number} अपलोड पूर्ण}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {कोई क्षमता नहीं} one "
      & "{{reserved, plural, =0 {1 में से 0 सीट "
      & "आरक्षित} other {1 में से 1 सीट "
      & "आरक्षित}}} other {{capacity, number} में से "
      & "{reserved, number} सीटें आरक्षित}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {प्रतीक्षा सूची में "
      & "स्थान {position, number}} other {प्रतीक्षा "
      & "सूची में स्थान {position, number}/{total, "
      & "number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} बदले} other {{name}: {changed, number} बदले, "
      & "{unchanged, number} अपरिवर्तित, कुल {total, "
      & "number}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "वर्तमान अग्रभूमि {v1}:{v2, number} "
      & "पर बड़े टेक्स्ट के "
      & "कंट्रास्ट को पूरा करती है");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "वर्तमान अग्रभूमि {v1}:{v2, number} "
      & "पर सामान्य टेक्स्ट के "
      & "कंट्रास्ट को पूरा करती है");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "{v2, number}:{v3, number} उन्नत टेक्स्ट के "
      & "कंट्रास्ट के लिए {v1} का "
      & "उपयोग करें");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "{v2, number}:{v3, number} बड़े टेक्स्ट के "
      & "कंट्रास्ट के लिए {v1} का "
      & "उपयोग करें");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "{v2}:{v3, number} सामान्य टेक्स्ट के "
      & "कंट्रास्ट के लिए {v1} का "
      & "उपयोग करें");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "{v2}:{v3, number} बड़े टेक्स्ट के "
      & "कंट्रास्ट के लिए {v1} का "
      & "उपयोग करें");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "{v2}:{v3, number} उन्नत टेक्स्ट के "
      & "कंट्रास्ट के लिए {v1} का "
      & "उपयोग करें");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "वर्तमान अग्रभूमि {v1, number}:{v2, "
      & "number} पर बड़े टेक्स्ट के "
      & "कंट्रास्ट को पूरा करती है");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "वर्तमान अग्रभूमि {v1, number}:{v2, "
      & "number} पर सामान्य टेक्स्ट के "
      & "कंट्रास्ट को पूरा करती है");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "वर्तमान अग्रभूमि {v1}:{v2, number} "
      & "पर उन्नत टेक्स्ट के "
      & "कंट्रास्ट को पूरा करती है");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "वर्तमान अग्रभूमि {v1, number}:{v2, "
      & "number} पर उन्नत टेक्स्ट के "
      & "कंट्रास्ट को पूरा करती है");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "प्रोटानोपिया: भ्रम का कम "
      & "जोखिम, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "ड्यूटेरानोपिया: भ्रम का "
      & "मध्यम जोखिम, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "ट्राइटानोपिया: भ्रम का "
      & "मध्यम जोखिम, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "एक्रोमैटोप्सिया: भ्रम का "
      & "उच्च जोखिम, डेल्टा {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 डेल्टा {v1}, अत्यधिक दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 डेल्टा {v1}, अत्यधिक दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 टेक्सटाइल डेल्टा {v1}, "
      & "अत्यधिक दृश्य अंतर");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 डेल्टा {v1, number}, अत्यधिक "
      & "दृश्य अंतर");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab डेल्टा {v1}, बड़ा दृश्य "
      & "अंतर");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "प्रोटानोपिया: भ्रम का "
      & "मध्यम जोखिम, डेल्टा {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 डेल्टा {v1, number}, अत्यधिक "
      & "दृश्य अंतर");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 डेल्टा {v1}, अत्यधिक "
      & "दृश्य अंतर");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab डेल्टा {v1}, अत्यधिक दृश्य "
      & "अंतर");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "एक्रोमैटोप्सिया: भ्रम का "
      & "कम जोखिम, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "प्रोटानोपिया: स्पष्ट रूप "
      & "से अलग, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "ड्यूटेरानोपिया: स्पष्ट "
      & "रूप से अलग, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "ट्राइटानोपिया: स्पष्ट रूप "
      & "से अलग, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "एक्रोमैटोप्सिया: स्पष्ट "
      & "रूप से अलग, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "एक्रोमैटोप्सिया: भ्रम का "
      & "मध्यम जोखिम, डेल्टा {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 डेल्टा {v1}, बड़ा दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 डेल्टा {v1}, बड़ा दृश्य "
      & "अंतर");
end Labels_3;
