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
end Labels_3;
