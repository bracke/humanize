separate (Humanize.Catalogs.Phrase_Data.Locale_Ko)
procedure Labels_2 is
begin
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {대기 중} sent_delivery "
      & "{전송됨} delivered_delivery {전달됨} failed_delivery {실패} "
      & "retrying_delivery {재시도 중} other {취소됨}}: {time_text}");
   P ("label.notifications.digest_label",
      "{name} 요약: {count, plural, =0 {알림 없음} other {알림 "
      & "{count, number}개}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {언급} reply_event {답글} "
      & "assignment_event {할당} approval_event {승인 요청} alert_event "
      & "{경고} digest_event {요약} reminder_event {미리 알림} other "
      & "{시스템 알림}} {count, plural, =0 {없음} other {{count, "
      & "number}개}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, =1 {알림을 읽음으로 표시} other {알림 "
      & "{count, number}개를 읽음으로 표시}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, =1 {알림을 읽지 않음으로 표시} other "
      & "{알림 {count, number}개를 읽지 않음으로 표시}}");
   P ("label.notifications.muted_label", "{name} 알림 음소거됨");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {새 언급} reply_event {새 답글} "
      & "assignment_event {새 할당} approval_event {새 승인 요청} "
      & "alert_event {새 경고} digest_event {새 요약} reminder_event {새 "
      & "미리 알림} other {새 시스템 알림}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {앱 내 알림} email_channel "
      & "{이메일 알림} sms_channel {SMS 알림} push_channel {푸시 "
      & "알림} webhook_channel {웹훅 알림} other {요약 알림}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {알림 없음} other {알림 {count, number}개}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {언급} reply_event {답글} "
      & "assignment_event {할당} approval_event {승인 요청} alert_event "
      & "{경고} digest_event {요약} reminder_event {미리 알림} other "
      & "{시스템 알림}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {알림 없음} other {알림 {count, "
      & "number}개}}");
   P ("label.notifications.notification_label",
      "{subject} {event, select, mention_event {언급} reply_event {답글} "
      & "assignment_event {할당} approval_event {승인 요청} alert_event "
      & "{경고} digest_event {요약} reminder_event {미리 알림} other "
      & "{시스템 알림}}: {state, select, unread_state {읽지 않음} "
      & "read_state {읽음} archived_state {보관됨} muted_state "
      & "{음소거됨} snoozed_state {일시 중지됨} other {억제됨}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {읽지 않은 알림} read_state {읽은 "
      & "알림} archived_state {보관된 알림} muted_state {음소거된 "
      & "알림} snoozed_state {일시 중지된 알림} other {억제된 "
      & "알림}}");
   P ("label.notifications.snoozed_label", "{name} 알림 일시 중지됨");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {억제된 알림 없음} other {알림 {count, "
      & "number}개 억제됨}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {읽지 않은 알림 없음} other {읽지 않은 "
      & "알림 {count, number}개}}");
   P ("label.payments.amount_label", "금액: {amount_text}");
   P ("label.payments.balance_label", "잔액: {amount_text}");
   P ("label.payments.chargeback_label", "지불 거절: {amount_text}");
   P ("label.payments.discount_label", "할인: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, 기한 {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {청구서 없음} other {청구서 {count, "
      & "number}건}}");
   P ("label.payments.invoice_label",
      "청구서 {number}: {state, select, draft_invoice {초안} "
      & "open_invoice {미결제} paid_invoice {결제 완료} overdue_invoice "
      & "{연체} other {무효}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {초안 청구서} open_invoice "
      & "{미결제 청구서} paid_invoice {결제된 청구서} "
      & "overdue_invoice {연체된 청구서} other {무효 청구서}}");
   P ("label.payments.method_label",
      "{method, select, card_method {카드 결제} bank_transfer_method "
      & "{계좌 이체} cash_method {현금 결제} wallet_method "
      & "{전자지갑 결제} check_method {수표 결제} other {기타 "
      & "결제}}: {detail}");
   P ("label.payments.paid_label", "{amount_text}, {paid_text} 결제됨");
   P ("label.payments.payment_count_label", "{count, plural, =0 {결제 없음} other {결제 {count, number}건}}");
   P ("label.payments.payment_label",
      "{amount_text} 결제: {state, select, pending_payment {대기 중} "
      & "authorized_payment {승인됨} paid_payment {완료} failed_payment "
      & "{실패} refunded_payment {환불됨} other {취소됨}}");
   P ("label.payments.payment_link_label", "{name} 결제 링크");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {카드} bank_transfer_method {계좌 "
      & "이체} cash_method {현금} wallet_method {전자지갑} check_method "
      & "{수표} other {기타}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {대기 중인 결제} "
      & "authorized_payment {승인된 결제} paid_payment {완료된 결제} "
      & "failed_payment {실패한 결제} refunded_payment {환불된 결제} "
      & "other {취소된 결제}}");
   P ("label.payments.receipt_label", "영수증 {number}");
   P ("label.payments.refund_label",
      "{amount_text} 환불: {state, select, pending_payment {대기 중} "
      & "authorized_payment {승인됨} paid_payment {완료} failed_payment "
      & "{실패} refunded_payment {완료} other {취소됨}}");
   P ("label.payments.subtotal_label", "소계: {amount_text}");
   P ("label.payments.tax_label", "세금: {amount_text}");
   P ("label.payments.total_label", "합계: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject} 액세스 만료: {time_text}");
   P ("label.permissions.grant_label",
      "{subject}에게 {role, select, owner_role {소유자} admin_role "
      & "{관리자} editor_role {편집자} viewer_role {뷰어} other "
      & "{사용자 지정}} 역할 부여");
   P ("label.permissions.permission_label",
      "{subject} {action} 권한: {state, select, granted {허용됨} denied "
      & "{거부됨} inherited {상속됨} temporary {임시 액세스} expired "
      & "{만료됨} other {승인 필요}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {허용됨} denied {거부됨} inherited "
      & "{상속됨} temporary {임시 액세스} expired {만료됨} other "
      & "{승인 필요}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {정책 허용} policy_denied {정책 "
      & "거부} policy_warning {정책 경고} other {정책 해당 없음}}");
   P ("label.permissions.revoke_label",
      "{subject}의 {role, select, owner_role {소유자} admin_role "
      & "{관리자} editor_role {편집자} viewer_role {뷰어} other "
      & "{사용자 지정}} 역할 취소");
   P ("label.permissions.role_label",
      "{role, select, owner_role {소유자} admin_role {관리자} "
      & "editor_role {편집자} viewer_role {뷰어} other {사용자 지정 "
      & "역할}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {비어 있음} low_utilization "
      & "{사용률 낮음} normal_utilization {사용률 보통} "
      & "high_utilization {사용률 높음} critical_utilization {사용률 "
      & "위험} full_utilization {가득 참} other {한도 초과}}");
   P ("label.schema.array_shape_label",
      "{element_type, select, string_field {문자열} integer_field {정수} "
      & "decimal_field {소수} boolean_field {불리언} date_field {날짜} "
      & "date_time_field {날짜 및 시간} object_field {객체} array_field "
      & "{배열} enum_field {열거형} binary_field {바이너리} null_field "
      & "{null} any_field {임의 값} other {알 수 없는 값}} "
      & "배열{count_known, select, false {} other { ({count, number}개)}}");
   P ("label.schema.constraint_label", "{name} 제약 조건: {value}");
   P ("label.schema.default_value_label", "{field_name} 필드 기본값: {value}");
   P ("label.schema.deprecated_field_label", "사용 중단된 필드 {name}, {replacement} 사용");
   P ("label.schema.enum_options_label", "열거형 옵션 {count, number}개");
   P ("label.schema.example_value_label", "{field_name} 필드 예: {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {일반 필드} deprecated_field {사용 "
      & "중단된 필드} unknown_field {알 수 없는 필드} "
      & "read_only_field {읽기 전용 필드} write_only_field {쓰기 전용 "
      & "필드} other {계산된 필드}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {문자열 필드} integer_field {정수 "
      & "필드} decimal_field {소수 필드} boolean_field {불리언 필드} "
      & "date_field {날짜 필드} date_time_field {날짜 및 시간 필드} "
      & "object_field {객체 필드} array_field {배열 필드} enum_field "
      & "{열거형 필드} binary_field {바이너리 필드} null_field {null "
      & "필드} any_field {임의 형식 필드} other {알 수 없는 "
      & "형식의 필드}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {누락된 필수 필드 없음} other {누락된 "
      & "필수 필드 {count, number}개}}");
   P ("label.schema.object_shape_label",
      "객체 (필드 {fields, number}개{required, plural, =0 {} other {, "
      & "필수 {required, number}개}}{optional, plural, =0 {} other {, 선택 "
      & "{optional, number}개}})");
   P ("label.schema.schema_source_label", "스키마 {name} 버전 {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {스칼라 값} object_shape "
      & "{객체{count, plural, =0 {} other { (필드 {count, number}개)}}} "
      & "array_shape {배열{count, plural, =0 {} other { (항목 {count, "
      & "number}개)}}} map_shape {맵{count, plural, =0 {} other { (항목 "
      & "{count, number}개)}}} tuple_shape {튜플{count, plural, =0 {} other "
      & "{ (항목 {count, number}개)}}} union_shape {유니언{count, plural, "
      & "=0 {} other { (형식 {count, number}개)}}} empty_shape {빈 형태} "
      & "other {알 수 없는 형태}}");
   P ("label.schema.unknown_field_label", "알 수 없는 필드 {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {활성 필터 없음} other {활성 필터 {count, "
      & "number}개}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {필터 지우기} other {활성 필터 {count, "
      & "number}개 지우기}}");
   P ("label.search.facet_label", "{name} 패싯, 옵션 {count, number}개");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {결과 없음} other {결과 {count, "
      & "number}개}}{selected, select, false {} other {, 선택됨}}");
   P ("label.search.filter_label",
      "{name}: {value} ({state, select, active_filter {활성 필터} "
      & "inactive_filter {비활성 필터} other {제외 필터}})");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {활성 필터} inactive_filter "
      & "{비활성 필터} other {제외 필터}}");
   P ("label.search.no_results_label", "“{query}”에 대한 결과 없음");
   P ("label.search.recent_search_label", "최근 검색: “{query}”");
   P ("label.search.saved_search_label",
      "저장된 검색: {name}{count, plural, =0 {} other {, 결과 {count, "
      & "number}개}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {최근 검색 없음} other {최근 검색 {count, "
      & "number}개}}");
   P ("label.search.search_query_label", "“{query}” 검색");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {결과 없음} other {결과 {count, number}개}}");
   P ("label.search.search_result_summary_label",
      "“{query}” 검색 결과: {count, plural, =0 {없음} other "
      & "{{count, number}개}}");
   P ("label.search.search_scope_label",
      "{name} 범위: {count, plural, =0 {결과 없음} other {결과 "
      & "{count, number}개}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {검색 대기 중} searching_search "
      & "{검색 중} complete_search {검색 완료} empty_search {검색 "
      & "결과 없음} other {검색 실패}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {관련성순 정렬} ascending_sort "
      & "{오름차순 정렬} descending_sort {내림차순 정렬} "
      & "newest_first_sort {최신순 정렬} other {오래된순 정렬}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {관련성순} ascending_sort "
      & "{오름차순} descending_sort {내림차순} newest_first_sort "
      & "{최신순} other {오래된순}}");
   P ("label.search.suggestion_label", "“{query}”을(를) 찾으셨나요?");
   P ("label.secrets.credential_source_label", "{source}의 자격 증명 {count, number}개");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {값 숨김} masked_value {값 "
      & "마스킹됨} suffix_only {끝부분만 표시} other {지문만 "
      & "표시}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {공개} support_profile {지원} "
      & "audit_profile {감사} other {디버그}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {교체 필요 없음} other {교체 "
      & "필요}}{days_old, plural, =0 {} other {, {days_old, number}일 "
      & "경과}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API 키} live_api_key {라이브 API 키} "
      & "test_api_key {테스트 API 키} github_token {GitHub 토큰} "
      & "aws_access_key {AWS 액세스 키} google_api_key {Google API 키} "
      & "slack_token {Slack 토큰} npm_token {npm 토큰} bearer_token {Bearer "
      & "토큰} jwt_token {JWT 토큰} basic_auth_credential {기본 인증 "
      & "자격 증명} password_secret {비밀번호} private_key {개인 키} "
      & "ssh_private_key {SSH 개인 키} webhook_secret {웹훅 시크릿} "
      & "oauth_token {OAuth 토큰} database_url_secret {데이터베이스 "
      & "URL} sha1_fingerprint {SHA-1 지문} sha256_fingerprint {SHA-256 "
      & "지문} other {시크릿}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {이메일} phone_value {전화번호} "
      & "url_value {URL} ip_address_value {IP 주소} token_value {토큰} "
      & "file_path_value {파일 경로} account_id_value {계정 ID} "
      & "payment_reference_value {결제 참조 번호} log_field_value {로그 "
      & "필드} other {민감한 값}}");
   P ("label.tables.cell_label",
      "{row, number}행 {column, number}열: {state, select, empty_cell "
      & "{비어 있음} edited_cell {편집됨} invalid_cell {잘못됨} "
      & "highlighted_cell {강조 표시됨} other {읽기 전용}}");
   P ("label.tables.cell_position_label", "{row, number}행 {column, number}열");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {빈 셀} edited_cell {편집된 셀} "
      & "invalid_cell {잘못된 셀} highlighted_cell {강조 표시된 셀} "
      & "other {읽기 전용 셀}}");
   P ("label.tables.column_count_label", "{count, plural, =0 {열 없음} other {열 {count, number}개}}");
   P ("label.tables.column_label",
      "{name} {role, select, text_column {텍스트 열} number_column "
      & "{숫자 열} date_column {날짜 열} status_column {상태 열} "
      & "action_column {작업 열} other {숨겨진 열}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {텍스트 열} number_column {숫자 열} "
      & "date_column {날짜 열} status_column {상태 열} action_column "
      & "{작업 열} other {숨겨진 열}}");
   P ("label.tables.group_label", "{name}: 행 {count, number}개");
   P ("label.tables.row_count_label", "{count, plural, =0 {행 없음} other {행 {count, number}개}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {정렬 안 됨} ascending_sort "
      & "{오름차순} other {내림차순}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {정렬 안 됨} ascending_sort "
      & "{{column_name} 기준 오름차순 정렬됨} other {{column_name} "
      & "기준 내림차순 정렬됨}}");
   P ("label.tables.subtotal_label", "{name} 소계: {value}");
   P ("label.tables.table_size_label", "{rows, number}행 × {columns, number}열");
   P ("label.tasks.assignment_label",
      "{assignee}: {state, select, unassigned {할당 해제됨} assigned "
      & "{할당됨} reassigned {재할당됨} watching {지켜보는 중} "
      & "other {작업 소유자}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {할당되지 않음} assigned {할당됨} "
      & "reassigned {재할당됨} watching {지켜보는 중} other {작업 "
      & "소유자}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {백로그 비어 있음} other {백로그: 작업 "
      & "{count, number}개}}");
   P ("label.tasks.blocker_label", "{name}에 의해 차단됨");
   P ("label.tasks.complete_action_label",
      "{count, plural, =1 {작업 완료} other {작업 {count, number}개 "
      & "완료}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {완료된 작업 없음} other {완료된 작업 "
      & "{count, number}개}}");
   P ("label.tasks.due_label", "기한: {due_text}");
   P ("label.tasks.estimate_label", "예상: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {열린 작업 없음} other {열린 작업 {count, "
      & "number}개}}");
   P ("label.tasks.overdue_label", "{due_text}부터 기한 초과");
   P ("label.tasks.recurring_task_label", "반복: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, =1 {작업 다시 열기} other {작업 {count, "
      & "number}개 다시 열기}}");
   P ("label.tasks.sprint_label", "{name}: 작업 {count, number}개");
   P ("label.tasks.subtask_label", "{name}: 하위 작업 {count, number}개");
   P ("label.tasks.task_count_label", "{count, plural, =0 {작업 없음} other {작업 {count, number}개}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {열린 작업} in_progress_task "
      & "{진행 중인 작업} blocked_task {차단된 작업} done_task "
      & "{완료된 작업} canceled_task {취소된 작업} deferred_task "
      & "{연기된 작업} other {기한이 지난 작업}}{priority, select, "
      & "no_priority {} low_priority {, 우선순위 낮음} medium_priority {, "
      & "우선순위 보통} high_priority {, 우선순위 높음} other {, "
      & "우선순위 긴급}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {우선순위 없음} low_priority "
      & "{우선순위 낮음} medium_priority {우선순위 보통} "
      & "high_priority {우선순위 높음} other {우선순위 긴급}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {열린 작업} in_progress_task {진행 "
      & "중인 작업} blocked_task {차단된 작업} done_task {완료된 "
      & "작업} canceled_task {취소된 작업} deferred_task {연기된 "
      & "작업} other {기한이 지난 작업}}");
   P ("label.thresholds.threshold_direction_label", "{direction, select, upper_limit {상한} other {하한}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {예상 범위 미만} within_range "
      & "{예상 범위 내} above_range {예상 범위 초과} below_target "
      & "{목표 미달} at_target {목표 도달} above_target {목표 초과} "
      & "near_limit {한도 근접} warning_level {경고 임계값} "
      & "critical_level {심각 임계값} breached {임계값 초과} other "
      & "{알 수 없는 임계값 상태}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {최신 상태} other {{ahead, "
      & "number}개 커밋 앞섬}}} other {{ahead, plural, =0 {{behind, "
      & "number}개 커밋 뒤처짐} other {{ahead, number}개 커밋 앞섬, "
      & "{behind, number}개 커밋 뒤처짐}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {{approver}이(가) 승인함} other "
      & "{{approver}의 승인 대기 중}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, =1 {{attempt, plural, =1 {시도 1/1} other {시도 "
      & "{attempt, number}/1 (한도 초과)}}} other {시도 {attempt, "
      & "number}/{limit, number}}}");
   P ("label.workflows.blocker_label", "차단됨: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {차단 중인 종속성 없음} other {차단 "
      & "중인 종속성 {count, number}개}}");
   P ("label.workflows.handoff_label", "{from}에서 {to}(으)로 인계");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {예정된 마일스톤} "
      & "current_milestone {현재 마일스톤} complete_milestone {완료된 "
      & "마일스톤} missed_milestone {놓친 마일스톤} other {차단된 "
      & "마일스톤}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {예정} current_milestone "
      & "{현재} complete_milestone {완료} missed_milestone {놓침} other "
      & "{차단됨}}");
   P ("label.workflows.next_action_label", "다음: {action}");
   P ("label.workflows.owner_label", "소유자: {owner}");
   P ("label.workflows.resume_label", "{name} 재개");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {대기 중} active_step {진행 중} "
      & "waiting_step {기다리는 중} blocked_step {차단됨} done_step "
      & "{완료} failed_step {실패} other {건너뜀}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {대기 중} active_step {진행 "
      & "중} waiting_step {기다리는 중} blocked_step {차단됨} "
      & "done_step {완료} failed_step {실패} other {건너뜀}}");
   P ("label.workflows.waiting_label", "{reason} 대기 중");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {시작 안 됨} "
      & "in_progress_state {진행 중} waiting_state {대기 중} "
      & "waiting_approval_state {승인 대기 중} blocked_state {차단됨} "
      & "completed_state {완료됨} failed_state {실패} cancelled_state "
      & "{취소됨} skipped_state {건너뜀} other {일시 중지됨}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {시작 안 됨} in_progress_state "
      & "{진행 중} waiting_state {대기 중} waiting_approval_state {승인 "
      & "대기 중} blocked_state {차단됨} completed_state {완료됨} "
      & "failed_state {실패} cancelled_state {취소됨} skipped_state "
      & "{건너뜀} other {일시 중지됨}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {투명} mostly_transparent "
      & "{거의 투명} translucent {반투명} mostly_opaque {거의 "
      & "불투명} other {불투명}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {관측값 없음} other {관측값 {count, "
      & "number}개, 최소 {minimum} {unit}, 중앙값 {median} {unit}, 최대 "
      & "{maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {관측값 없음} other "
      & "{관측값 {total, number}개 중 이상값 0개}}} other {관측값 "
      & "{total, number}개 중 이상값 {outliers, number}개}}");
   P ("label.resources.remaining_label",
      "{state, select, over {용량 {count, number} {unit} 초과} other "
      & "{{total, number} {unit} 중 {count, number} {unit} 남음}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {할당량 {count, number} {unit} "
      & "초과({percent} 사용)} near {할당량 한도 임박: {count, "
      & "number} {unit} 남음({percent} 사용)} other {할당량 여유: "
      & "{count, number} {unit} 남음({percent} 사용)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {캐시 적중률 없음: 요청 없음} other "
      & "{캐시 적중률 {percent}: 적중 {hits, number}회, 실패 {misses, "
      & "number}회}}");
   P ("label.markup.attribute_count_label.total", "속성 {count, number}개");
   P ("label.markup.attribute_count_label.data", "data 속성 {count, number}개");
   P ("label.markup.attribute_count_label.aria", "ARIA 속성 {count, number}개");
   P ("label.markup.attribute_count_label.events", "이벤트 핸들러 {count, number}개");
   P ("label.markup.heading_label", "제목 수준 {level, number}");
   P ("label.markup.tag_count_label.total", "태그 {count, number}개");
   P ("label.markup.tag_count_label.links", "링크 {count, number}개");
   P ("label.markup.tag_count_label.media", "미디어 요소 {count, number}개");
   P ("label.markup.tag_count_label.forms", "양식 컨트롤 {count, number}개");
   P ("label.markup.document_outline_label.headings", "제목 {count, number}개");
   P ("label.markup.document_outline_label.landmarks", "랜드마크 {count, number}개");
   P ("label.markup.document_outline_label.forms", "양식 {count, number}개");
   P ("label.markup.document_outline_label.media", "미디어 요소 {count, number}개");
   P ("label.markup.table_navigation_label",
      "{caption}, {rows, number}행 중 {row, number}행, {columns, "
      & "number}열 중 {column, number}열");
   P ("label.secrets.secret_count_label.total", "시크릿 {count, number}개");
   P ("label.secrets.secret_count_label.masked", "{count, number}개 마스킹됨");
   P ("label.secrets.secret_count_label.unset", "{count, number}개 설정 안 됨");
   P ("label.secrets.secret_count_label.fingerprints", "지문 {count, number}개");
   P ("label.schema.type_mismatch_label",
      "필드 {field_name}: 예상 {expected, select, string_field "
      & "{문자열} integer_field {정수} decimal_field {소수} "
      & "boolean_field {불리언} date_field {날짜} date_time_field "
      & "{날짜/시간} object_field {객체} array_field {배열} enum_field "
      & "{열거형} binary_field {바이너리} null_field {null} any_field "
      & "{모든 값} other {알 수 없음}}, 실제 {actual, select, "
      & "string_field {문자열} integer_field {정수} decimal_field {소수} "
      & "boolean_field {불리언} date_field {날짜} date_time_field "
      & "{날짜/시간} object_field {객체} array_field {배열} enum_field "
      & "{열거형} binary_field {바이너리} null_field {null} any_field "
      & "{모든 값} other {알 수 없음}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {차단 문제 {blocking, number}개} "
      & "blocking {{base}, 차단 문제 {blocking, number}개} only "
      & "{{base}만} other {{base}}}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {목표 범위 {low}~{high}} "
      & "other {목표 구간 {low}~{high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value}, 예상 범위 내} below {{value}, "
      & "예상 범위 미만} other {{value}, 예상 범위 초과}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value}, 위험 임계값 도달} warning "
      & "{{value}, 경고 임계값 도달} other {{value}, 정상 범위 내}}");
   P ("label.thresholds.breach_label", "{state, select, ok {위반 없음} other {{difference} 위반}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {목표 달성} below {목표보다 {difference} "
      & "낮음} other {목표보다 {difference} 높음}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {한도 초과} near {한도 임박, "
      & "{distance} 남음} other {한도까지 {distance}}}");
   P ("label.thresholds.threshold_summary_label.none", "지표 없음");
   P ("label.thresholds.threshold_summary_label.normal", "정상 {count, number}개");
   P ("label.thresholds.threshold_summary_label.warnings", "경고 {count, number}개");
   P ("label.thresholds.threshold_summary_label.critical", "위험 {count, number}개");
   P ("label.thresholds.threshold_summary_label.breaches", "위반 {count, number}건");
   P ("label.thresholds.target_window_label", "목표 {target} ±{tolerance}");
   P ("label.thresholds.tolerance_label", "허용 오차 {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "한도의 {percent}");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {한도 {amount} 초과} other {{amount} "
      & "남음}}");
   P ("label.thresholds.budget_used_label", "{budget} 중 {used} 사용");
   P ("label.workflows.step_label", "{total, number}단계 중 {current, number}단계: {name}");
   P ("label.workflows.milestone_label",
      "마일스톤 {total, number}개 중 {current, number}개 완료: "
      & "{name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {워크플로 항목 없음} half {워크플로 "
      & "절반 완료} other {{total, number}개 중 {completed, number}개 "
      & "완료}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {대기열 {position, number}번째} other "
      & "{대기열 {total, number}개 중 {position, number}번째}}");
   P ("label.changes.change_set_label.none", "변경 없음");
   P ("label.changes.change_set_label.added", "{count, number}개 추가");
   P ("label.changes.change_set_label.removed", "{count, number}개 제거");
   P ("label.changes.change_set_label.modified", "{count, number}개 변경");
   P ("label.changes.change_set_label.unchanged", "{count, number}개 변경 없음");
   P ("label.changes.sync_change_label.none", "동기화 변경 없음");
   P ("label.changes.sync_change_label.uploaded", "{count, number}개 업로드");
   P ("label.changes.sync_change_label.downloaded", "{count, number}개 다운로드");
   P ("label.changes.sync_change_label.deleted", "{count, number}개 삭제");
   P ("label.changes.sync_change_label.conflicts", "충돌 {count, number}개");
   P ("label.changes.net_change_label",
      "{state, select, none {순변경 없음} up {순증 +{count, "
      & "number}개} other {순감 -{count, number}개}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {검토할 변경 없음} all {모든 변경 "
      & "검토 완료} other {변경 {total, number}개 중 {reviewed, "
      & "number}개 검토 완료}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name}: {new_value}(변경 없음)} up "
      & "{{field_name}: {old_value}에서 {new_value}(으)로 증가} other "
      & "{{field_name}: {old_value}에서 {new_value}(으)로 감소}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {선택할 수 있는 행 없음} none "
      & "{선택된 행 없음} all {행 {total, number}개 모두 선택됨} "
      & "other {행 {total, number}개 중 {selected, number}개 선택됨}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {페이지 없음} other {{pages, plural, =0 "
      & "{페이지 없음} other {{rows, plural, =0 {{pages, number}페이지 "
      & "중 {page, number}페이지} other {{pages, number}페이지 중 "
      & "{page, number}페이지, 행 {rows, number}개}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {행 없음} none {일치하는 행 없음} "
      & "all {행 {total, number}개 모두 표시됨} other {행 {total, "
      & "number}개 중 {visible, number}개 표시됨}}");
   P ("label.tables.row_range_label",
      "{state, select, none {행 없음} single {{total, number}행 중 "
      & "{first_row, number}행} other {{total, number}행 중 {first_row, "
      & "number}~{last_row, number}행}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {글자 수 제한 없음} none_left {남은 "
      & "글자 없음} left {{count, number}자 남음} other {{count, "
      & "number}자 초과}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {필수 필드 없음} other {{missing, plural, =0 "
      & "{필수 필드 모두 입력됨} other {필수 필드 {total, "
      & "number}개 중 {missing, number}개 누락}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {필드 없음} all {모든 필드 완료} other "
      & "{필드 {total, number}개 중 {completed, number}개 완료}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: 필드 없음} all {{name}: 모든 "
      & "필드 완료} other {{name}: 필드 {total, number}개 중 "
      & "{completed, number}개 완료}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {양식 단계 없음} =1 {1단계 중 1단계: "
      & "{name}} other {{total, number}단계 중 {current, number}단계: "
      & "{name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {이동 경로 없음} =1 {이동 경로 1/1: "
      & "{name}} other {이동 경로 {current, number}/{total, number}: "
      & "{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {탭 없음} =1 {탭 1/1: {name}} other {탭 "
      & "{current, number}/{total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {받은편지함 비어 있음} other {{unread, "
      & "plural, =0 {모든 알림 읽음} other {알림 {total, number}개 중 "
      & "{unread, number}개 읽지 않음}}}}");
   P ("label.notifications.delivery_attempt_label", "전송 시도 {attempt, number}/{max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {체크리스트 항목 없음} other {항목 "
      & "{total, number}개 중 {done, number}개 완료}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {업로드 없음} other {업로드 {total, "
      & "number}개 중 {done, number}개 완료}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {정원 없음} other {좌석 {capacity, "
      & "number}개 중 {reserved, number}개 예약됨}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {대기자 명단 {position, number}번째} other "
      & "{대기자 명단 {total, number}명 중 {position, number}번째}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} 변경} other {{name}: {changed, number}개 변경, "
      & "{unchanged, number}개 변경 없음, 총 {total, number}개}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "현재 전경색이 큰 텍스트 대비 충족({v1}:{v2, number})");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "현재 전경색이 일반 텍스트 대비 충족({v1}:{v2, number})");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "{v1} 사용 시 향상된 텍스트 대비 {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "{v1} 사용 시 큰 텍스트 대비 {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "{v1} 사용 시 일반 텍스트 대비 {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "{v1} 사용 시 큰 텍스트 대비 {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "{v1} 사용 시 향상된 텍스트 대비 {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "현재 전경색이 큰 텍스트 대비 충족({v1, number}:{v2, "
      & "number})");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "현재 전경색이 일반 텍스트 대비 충족({v1, number}:{v2, "
      & "number})");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "현재 전경색이 향상된 텍스트 대비 충족({v1}:{v2, "
      & "number})");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "현재 전경색이 향상된 텍스트 대비 충족({v1, "
      & "number}:{v2, number})");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "적색맹: 혼동 위험 낮음, 델타 {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "녹색맹: 혼동 위험 보통, 델타 {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "청색맹: 혼동 위험 보통, 델타 {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "전색맹: 혼동 위험 높음, 델타 {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 델타 {v1}, 극적인 지각 차이");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 델타 {v1}, 극적인 지각 차이");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 섬유 델타 {v1}, 극적인 지각 차이");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 델타 {v1, number}, 극적인 지각 차이");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab 델타 {v1}, 큰 지각 차이");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "적색맹: 혼동 위험 보통, 델타 {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 델타 {v1, number}, 극적인 지각 차이");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 델타 {v1}, 극적인 지각 차이");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab 델타 {v1}, 극적인 지각 차이");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "전색맹: 혼동 위험 낮음, 델타 {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "적색맹: 구별 가능, 델타 {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "녹색맹: 구별 가능, 델타 {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "청색맹: 구별 가능, 델타 {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "전색맹: 구별 가능, 델타 {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "전색맹: 혼동 위험 보통, 델타 {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 델타 {v1}, 큰 지각 차이");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 델타 {v1}, 큰 지각 차이");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 섬유 델타 {v1}, 큰 지각 차이");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 델타 {v1}, 큰 지각 차이");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab 델타 {v1}, 눈에 띄는 지각 차이");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "적색맹: 혼동 위험 높음, 델타 {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "청색맹: 혼동 위험 높음, 델타 {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 델타 {v1}, 눈에 띄는 지각 차이");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 섬유 델타 {v1}, 눈에 띄는 지각 차이");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 델타 {v1}, 눈에 띄는 지각 차이");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab 델타 {v1, number}, 눈에 띄는 지각 차이");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "청색맹: 혼동 위험 낮음, 델타 {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "녹색맹: 혼동 위험 낮음, 델타 {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab 델타 {v1, number}, 큰 지각 차이");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "녹색맹: 혼동 위험 높음, 델타 {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 델타 {v1, number}, 극적인 지각 차이");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 섬유 델타 {v1, number}, 극적인 지각 차이");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab 델타 {v1, number}, 극적인 지각 차이");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 델타 {v1, number}, 큰 지각 차이");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 섬유 델타 {v1, number}, 큰 지각 차이");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 델타 {v1, number}, 큰 지각 차이");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 델타 {v1}, 눈에 띄는 지각 차이");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 섬유 델타 {v1}, 미묘한 지각 차이");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 델타 {v1, number}, 눈에 띄는 지각 차이");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 섬유 델타 {v1, number}, 눈에 띄는 지각 차이");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 델타 {v1}, 거의 인지 불가");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 델타 {v1}, 인지 불가");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 섬유 델타 {v1}, 인지 불가");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 델타 {v1}, 인지 불가");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab 델타 {v1}, 인지 불가");
end Labels_2;
