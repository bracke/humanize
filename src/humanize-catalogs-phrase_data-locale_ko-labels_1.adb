separate (Humanize.Catalogs.Phrase_Data.Locale_Ko)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{name}: {state, select, active_account {활성 계정} invited_account "
      & "{초대된 계정} locked_account {잠긴 계정} suspended_account "
      & "{정지된 계정} deleted_account {삭제된 계정} other {알 수 "
      & "없는 계정 상태}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {활성 계정} invited_account "
      & "{초대된 계정} locked_account {잠긴 계정} suspended_account "
      & "{정지된 계정} deleted_account {삭제된 계정} other {알 수 "
      & "없는 계정 상태}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {신뢰할 수 있는 기기} "
      & "untrusted_device {신뢰할 수 없는 기기} new_device {새 기기} "
      & "other {차단된 기기}}");
   P ("label.accounts.last_active_label", "{name}: 마지막 활동 {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: 로그인 실패} other {{name}: "
      & "로그인 성공}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA 사용} mfa_disabled {MFA 사용 안 "
      & "함} mfa_required {MFA 필요} other {MFA 재설정 필요}}");
   P ("label.accounts.session_label",
      "{name}: {state, select, active_session {활성 세션} expired_session "
      & "{세션 만료됨} revoked_session {세션 취소됨} idle_session "
      & "{유휴 세션} other {알 수 없는 세션 상태}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {활성 세션} expired_session {세션 "
      & "만료됨} revoked_session {세션 취소됨} idle_session {유휴 "
      & "세션} other {알 수 없는 세션 상태}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {첨부 파일 없음} other {첨부 파일 {count, "
      & "number}개}}");
   P ("label.attachments.attachment_group_label", "{name}: 첨부 파일 {count, number}개");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {파일 첨부} image_attachment "
      & "{이미지 첨부} video_attachment {동영상 첨부} "
      & "audio_attachment {오디오 첨부} document_attachment {문서 "
      & "첨부} archive_attachment {압축 파일 첨부} other {링크 "
      & "첨부}}");
   P ("label.attachments.attachment_label",
      "{name} {kind, select, file_attachment {파일} image_attachment "
      & "{이미지} video_attachment {동영상} audio_attachment {오디오} "
      & "document_attachment {문서} archive_attachment {압축 파일} other "
      & "{링크}}: {state, select, pending_attachment {대기 중} "
      & "uploading_attachment {업로드 중} uploaded_attachment "
      & "{업로드됨} failed_attachment {실패} removed_attachment "
      & "{제거됨} other {차단됨}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {대기 중인 첨부 파일} "
      & "uploading_attachment {업로드 중인 첨부 파일} "
      & "uploaded_attachment {업로드된 첨부 파일} failed_attachment "
      & "{실패한 첨부 파일} removed_attachment {제거된 첨부 파일} "
      & "other {차단된 첨부 파일}}");
   P ("label.attachments.download_label", "{name} 다운로드");
   P ("label.attachments.expiring_link_label", "{name} 링크 만료: {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "{name} 미리 보기");
   P ("label.attachments.remove_label", "{name} 제거");
   P ("label.attachments.scan_result_label",
      "{name}: {state, select, not_scanned {검사 안 됨} scanning {검사 "
      & "중} safe {검사 결과 안전} suspicious {검사 결과 의심} "
      & "other {검사 결과 감염}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {검사 안 됨} scanning {검사 중} "
      & "safe {검사 결과 안전} suspicious {검사 결과 의심} other "
      & "{검사 결과 감염}}");
   P ("label.attachments.upload_error_label", "{name} 업로드 실패: {reason}");
   P ("label.badges.badge_label",
      "{name}: {tone, select, neutral_tone {중립} info_tone {정보} "
      & "success_tone {성공} warning_tone {경고} danger_tone {위험} other "
      & "{흐림}} 배지{state, select, default_badge {} new_badge {, 새 "
      & "항목} updated_badge {, 업데이트됨} deprecated_badge {, 지원 "
      & "중단} selected_badge {, 선택됨} disabled_badge {, "
      & "비활성화됨} other {, 닫기 가능}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {낮은 우선순위 배지} "
      & "medium_priority {보통 우선순위 배지} high_priority {높은 "
      & "우선순위 배지} other {긴급 우선순위 배지}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {기본 배지} new_badge {새 항목 "
      & "배지} updated_badge {업데이트 배지} deprecated_badge {지원 "
      & "중단 배지} selected_badge {선택된 배지} disabled_badge "
      & "{비활성화된 배지} other {닫을 수 있는 배지}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {중립 배지} info_tone {정보 배지} "
      & "success_tone {성공 배지} warning_tone {경고 배지} danger_tone "
      & "{위험 배지} other {흐린 배지}}");
   P ("label.badges.chip_label", "{selected, select, false {{name} 칩} other {{name} 칩, 선택됨}}");
   P ("label.badges.count_badge_label", "{count, plural, =0 {{name} 없음} other {{name} {count, number}개}}");
   P ("label.badges.deprecated_label", "{name}: 경고 배지, 지원 중단");
   P ("label.badges.dismiss_label", "{name} 닫기");
   P ("label.badges.new_label", "{name}: 정보 배지, 새 항목");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {숨겨진 배지 없음} other {배지 "
      & "{hidden_count, number}개 더 있음}}");
   P ("label.badges.priority_badge_label",
      "{name}: {priority, select, low_priority {낮은 우선순위 배지} "
      & "medium_priority {보통 우선순위 배지} high_priority {높은 "
      & "우선순위 배지} other {긴급 우선순위 배지}}");
   P ("label.badges.status_badge_label",
      "{name} 상태: {tone, select, neutral_tone {중립} info_tone {정보} "
      & "success_tone {성공} warning_tone {경고} danger_tone {위험} other "
      & "{흐림}}");
   P ("label.badges.tag_count_label", "{count, plural, =0 {태그 없음} other {태그 {count, number}개}}");
   P ("label.badges.tag_label", "{name} 태그");
   P ("label.badges.updated_label", "{name}: 성공 배지, 업데이트됨");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {아티팩트 업로드됨} "
      & "artifact_missing {아티팩트 없음} artifact_expired {아티팩트 "
      & "만료됨} other {아티팩트 확인됨}}");
   P ("label.builds.benchmark_label", "{name} 벤치마크: {result_text}");
   P ("label.builds.build_label",
      "{name}: {state, select, build_queued {빌드 대기 중} build_running "
      & "{빌드 실행 중} build_passed {빌드 성공} build_failed {빌드 "
      & "실패} snapshot_build {스냅샷 빌드} other {릴리스 빌드}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {빌드 대기 중} build_running {빌드 "
      & "실행 중} build_passed {빌드 성공} build_failed {빌드 실패} "
      & "snapshot_build {스냅샷 빌드} other {릴리스 빌드}}");
   P ("label.builds.coverage_label", "커버리지 {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {릴리스 게이트 통과} gate_failed "
      & "{릴리스 게이트 실패} gate_warning {릴리스 게이트 경고} "
      & "other {릴리스 게이트 차단됨}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {통과한 테스트 "
      & "없음} other {테스트 {count, number}개 통과}}} failed_test "
      & "{{count, plural, =0 {실패한 테스트 없음} other {테스트 "
      & "{count, number}개 실패}}} skipped_test {{count, plural, =0 "
      & "{건너뛴 테스트 없음} other {테스트 {count, number}개 "
      & "건너뜀}}} flaky_test {{count, plural, =0 {불안정한 테스트 "
      & "없음} other {불안정한 테스트 {count, number}개}}} other "
      & "{{count, plural, =0 {예상된 실패 테스트 없음} other "
      & "{예상된 실패 테스트 {count, number}개}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {통과} failed_test {실패} skipped_test "
      & "{건너뜀} flaky_test {불안정} other {예상된 실패}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name}: "
      & "변경 없음, 사용 안 함} other {{field_name}: 사용 안 "
      & "함에서 사용으로 변경}}} other {{new_value, select, false "
      & "{{field_name}: 사용에서 사용 안 함으로 변경} other "
      & "{{field_name}: 변경 없음, 사용}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {추가됨} removed_change {제거됨} "
      & "modified_change {변경됨} renamed_change {이름 변경됨} "
      & "unchanged_change {변경 없음} metadata_change {메타데이터 "
      & "변경됨} moved_change {이동됨} conflict_change {충돌} other "
      & "{알 수 없는 변경}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {정보성 변경} "
      & "minor_change {사소한 변경} major_change {주요 변경} other "
      & "{호환성을 깨는 변경}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}: 변경 없음} "
      & "other {{unchanged, plural, =0 {{field_name} 변경됨: {added, "
      & "number}개 추가} other {{field_name} 변경됨: {added, number}개 "
      & "추가, {unchanged, number}개 변경 없음}}}}} other {{added, "
      & "plural, =0 {{unchanged, plural, =0 {{field_name} 변경됨: {removed, "
      & "number}개 제거} other {{field_name} 변경됨: {removed, number}개 "
      & "제거, {unchanged, number}개 변경 없음}}} other {{unchanged, "
      & "plural, =0 {{field_name} 변경됨: {added, number}개 추가, "
      & "{removed, number}개 제거} other {{field_name} 변경됨: {added, "
      & "number}개 추가, {removed, number}개 제거, {unchanged, number}개 "
      & "변경 없음}}}}}}");
   P ("label.changes.conflict_label", "{count, plural, =0 {충돌 없음} other {충돌 {count, number}개}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name}: {old_label}에서 "
      & "{new_label}(으)로 늦춰짐} other {{field_name}: {old_label}에서 "
      & "{new_label}(으)로 앞당겨짐}}");
   P ("label.changes.duration_field_change_label", "{field_name}: {old_label}에서 {new_label}(으)로 변경됨");
   P ("label.changes.field_change_label", "{field_name}: {old_value}에서 {new_value}(으)로 변경됨");
   P ("label.changes.item_change_label",
      "{name}: {kind, select, added_change {추가됨} removed_change "
      & "{제거됨} modified_change {변경됨} renamed_change {이름 "
      & "변경됨} unchanged_change {변경 없음} metadata_change "
      & "{메타데이터 변경됨} moved_change {이동됨} conflict_change "
      & "{충돌} other {알 수 없는 변경}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {메타데이터만 변경됨} other "
      & "{메타데이터 필드 {count, number}개만 변경됨}}");
   P ("label.changes.move_label", "{name}: {from}에서 {to}(으)로 이동됨");
   P ("label.changes.no_changes_label", "변경 사항 없음");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {줄 변경 "
      & "없음} other {{lines_added, number}줄 추가}}} other {{lines_added, "
      & "plural, =0 {{lines_removed, number}줄 삭제} other {{lines_added, "
      & "number}줄 추가, {lines_removed, number}줄 삭제}}}}");
   P ("label.changes.rename_label", "이름 변경: {old_name} → {new_name}");
   P ("label.comments.author_action_label",
      "{author}: {state, select, draft_comment {댓글 임시 저장} "
      & "published_comment {댓글 작성} edited_comment {댓글 수정} "
      & "deleted_comment {댓글 삭제} resolved_comment {댓글 해결} "
      & "unresolved_comment {댓글 다시 열기} pinned_comment {댓글 "
      & "고정} other {댓글 숨김}}");
   P ("label.comments.comment_count_label", "{count, plural, =0 {댓글 없음} other {댓글 {count, number}개}}");
   P ("label.comments.comment_label",
      "{author}: {state, select, draft_comment {임시 저장된 댓글} "
      & "published_comment {게시된 댓글} edited_comment {수정된 댓글} "
      & "deleted_comment {삭제된 댓글} resolved_comment {해결된 댓글} "
      & "unresolved_comment {해결되지 않은 댓글} pinned_comment "
      & "{고정된 댓글} other {숨겨진 댓글}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {임시 저장된 댓글} "
      & "published_comment {게시된 댓글} edited_comment {수정된 댓글} "
      & "deleted_comment {삭제된 댓글} resolved_comment {해결된 댓글} "
      & "unresolved_comment {해결되지 않은 댓글} pinned_comment "
      & "{고정된 댓글} other {숨겨진 댓글}}");
   P ("label.comments.deleted_label", "{author}: 댓글 삭제");
   P ("label.comments.edited_label", "수정됨 {time_text}");
   P ("label.comments.hide_comment_label", "댓글 숨기기: {reason}");
   P ("label.comments.lock_thread_label", "{name} 스레드 잠금");
   P ("label.comments.mention_label", "{actor} → {target} 멘션");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {참여자 없음} other {참여자 {count, "
      & "number}명}}");
   P ("label.comments.pin_label", "{name} 고정");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {좋아요} dislike_reaction {싫어요} "
      & "heart_reaction {하트} laugh_reaction {웃음} confused_reaction "
      & "{혼란} hooray_reaction {축하} rocket_reaction {로켓} other "
      & "{눈}} 반응");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {좋아요} dislike_reaction {싫어요} "
      & "heart_reaction {하트} laugh_reaction {웃음} confused_reaction "
      & "{혼란} hooray_reaction {축하} rocket_reaction {로켓} other "
      & "{눈}} 반응 {count, plural, =0 {없음} other {{count, number}개}}");
   P ("label.comments.reply_count_label", "{count, plural, =0 {답글 없음} other {답글 {count, number}개}}");
   P ("label.comments.resolved_label", "{name}: 해결됨");
   P ("label.comments.subscribe_label", "{name} 구독");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {스레드 없음} other {스레드 {count, "
      & "number}개}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {열린 스레드} resolved_thread "
      & "{해결된 스레드} locked_thread {잠긴 스레드} other "
      & "{보관된 스레드}}{count, plural, =0 {} other {, 댓글 {count, "
      & "number}개}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {열린 스레드} resolved_thread "
      & "{해결된 스레드} locked_thread {잠긴 스레드} other "
      & "{보관된 스레드}}");
   P ("label.comments.unpin_label", "{name} 고정 해제");
   P ("label.comments.unsubscribe_label", "{name} 구독 취소");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {개선됨} regressed {저하됨} "
      & "unchanged {변화 없음} within_tolerance {허용 범위 내} "
      & "outside_tolerance {허용 범위 밖} new_value {신규} removed_value "
      & "{제거됨} other {기준선 없음}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {개선됨} regressed {저하됨} unchanged "
      & "{변화 없음} within_tolerance {허용 범위 내} outside_tolerance "
      & "{허용 범위 밖} new_value {신규} removed_value {제거됨} other "
      & "{기준선 없음}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {{difference_text} 개선됨} "
      & "regressed {{difference_text} 저하됨} unchanged {변화 "
      & "없음(차이 {difference_text})} within_tolerance {허용 범위 "
      & "내(차이 {difference_text})} outside_tolerance {허용 범위 "
      & "밖(차이 {difference_text})} new_value {신규(차이 "
      & "{difference_text})} removed_value {제거됨(차이 "
      & "{difference_text})} other {기준선 없음(차이 "
      & "{difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {{difference_text} 개선됨} "
      & "regressed {{difference_text} 저하됨} unchanged {변화 "
      & "없음(차이 {difference_text})} within_tolerance {허용 범위 "
      & "내(차이 {difference_text})} outside_tolerance {허용 범위 "
      & "밖(차이 {difference_text})} new_value {신규(차이 "
      & "{difference_text})} removed_value {제거됨(차이 "
      & "{difference_text})} other {기준선 없음(차이 "
      & "{difference_text})}}, 허용 오차 {tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {잘못된 행} duplicate_record {중복 "
      & "레코드} missing_column {누락된 열} unknown_field {알 수 "
      & "없는 필드} schema_mismatch {스키마 불일치} other {건너뛴 "
      & "레코드}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {테스트 실행 통과} "
      & "dry_run_failed {테스트 실행 실패} import_valid {가져오기 "
      & "유효} import_invalid {가져오기 유효하지 않음} other "
      & "{부분 가져오기}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {테스트 실행 통과} "
      & "dry_run_failed {테스트 실행 실패} import_valid {가져오기 "
      & "유효} import_invalid {가져오기 유효하지 않음} other "
      & "{부분 가져오기}}, {accepted, number}개 수락, {rejected, "
      & "number}개 거부");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {잘못된 행} duplicate_record {중복 "
      & "레코드} missing_column {누락된 열} unknown_field {알 수 "
      & "없는 필드} schema_mismatch {스키마 불일치} other {건너뛴 "
      & "레코드}} {count, plural, =0 {없음} other {{count, number}개}}");
   P ("label.data_quality.row_issue_label",
      "{row, number}행: {issue, select, invalid_row {잘못된 행} "
      & "duplicate_record {중복 레코드} missing_column {누락된 열} "
      & "unknown_field {알 수 없는 필드} schema_mismatch {스키마 "
      & "불일치} other {건너뛴 레코드}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {잘못된 행} "
      & "duplicate_record {중복 레코드} missing_column {누락된 열} "
      & "unknown_field {알 수 없는 필드} schema_mismatch {스키마 "
      & "불일치} other {건너뛴 레코드}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {아티팩트 준비됨} "
      & "artifact_uploaded {아티팩트 업로드됨} artifact_signed "
      & "{아티팩트 서명됨} artifact_missing {아티팩트 없음} other "
      & "{아티팩트 만료됨}}");
   P ("label.deployments.deployment_label",
      "{name} → {environment} 배포: {state, select, queued_deployment "
      & "{대기 중} deploying {진행 중} deployed {완료} "
      & "failed_deployment {실패} rolled_back {롤백됨} blocked_deployment "
      & "{차단됨} other {취소됨}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {배포 대기 중} deploying "
      & "{배포 중} deployed {배포됨} failed_deployment {배포 실패} "
      & "rolled_back {롤백됨} blocked_deployment {배포 차단됨} other "
      & "{배포 취소됨}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {환경 정상} "
      & "drifting_environment {환경 드리프트} locked_environment {환경 "
      & "잠김} maintenance_environment {환경 유지 관리 중} other {알 "
      & "수 없는 환경 상태}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {마이그레이션 없음} "
      & "migration_pending {마이그레이션 대기 중} migrating "
      & "{마이그레이션 중} migration_complete {마이그레이션 "
      & "완료} other {마이그레이션 실패}}");
   P ("label.deployments.promotion_label", "{name}: {from_environment}에서 {to_environment}(으)로 승격");
   P ("label.deployments.rollback_label", "{name}: {target}(으)로 롤백");
   P ("label.deployments.rollout_label", "{name} 롤아웃 {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {영향받는 항목 없음} other {영향받는 "
      & "항목 {count, number}개}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {통과} failed_check {실패} "
      & "warning_check {경고} skipped_check {건너뜀} pending_check {대기 "
      & "중} other {실행 중}}({duration_s, number}초)");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {통과} failed_check {실패} "
      & "warning_check {경고} skipped_check {건너뜀} pending_check {대기 "
      & "중} other {실행 중}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {통과} failed_check {실패} "
      & "warning_check {경고} skipped_check {건너뜀} pending_check {대기 "
      & "중} other {실행 중}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{subject}{position, plural, =0 {} other { (위치 {position, "
      & "number})}}: {kind, select, expected_value {값이 필요합니다} "
      & "expected_unit {단위가 필요합니다} invalid_range {잘못된 "
      & "범위입니다} end_before_start {범위의 끝이 시작보다 "
      & "앞섭니다} unknown_field {알 수 없는 필드입니다} "
      & "unsafe_redacted_value {안전하지 않은 값이 가려졌습니다} "
      & "unsupported_syntax {지원되지 않는 구문입니다} other {진단 "
      & "설명}}. 다음을 사용하세요: {suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {정보} notice_severity {알림} "
      & "warning_severity {경고} error_severity {오류} critical_severity "
      & "{심각} other {차단}}: {path}{line, plural, =0 {} other { {line, "
      & "number}행}}: {message}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path} {line, "
      & "number}행} other {{path} {line, number}행 {column, "
      & "number}열}}}}에서 실패");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {정보} notice_severity {알림} "
      & "warning_severity {경고} error_severity {오류} critical_severity "
      & "{심각} other {차단}}({field_name}): {message}");
   P ("label.diagnostics.first_failure_label",
      "{check_name} 첫 실패: {path}{line, plural, =0 {} other { {line, "
      & "number}행}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{문제 없음} other {알림 {notices, number}개}}} other {{notices, "
      & "plural, =0 {경고 {warnings, number}개} other {경고 {warnings, "
      & "number}개, 알림 {notices, number}개}}}}} other {{warnings, plural, "
      & "=0 {{notices, plural, =0 {오류 {errors, number}개} other {오류 "
      & "{errors, number}개, 알림 {notices, number}개}}} other {{notices, "
      & "plural, =0 {오류 {errors, number}개, 경고 {warnings, number}개} "
      & "other {오류 {errors, number}개, 경고 {warnings, number}개, "
      & "알림 {notices, number}개}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path} {line, "
      & "number}행} other {{path} {line, number}행 {column, number}열}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{family, select, byte_parser {바이트 파서} duration_parser "
      & "{기간 파서} date_time_parser {날짜/시간 파서} color_parser "
      & "{색상 파서} url_parser {URL 파서} unit_parser {단위 파서} "
      & "recurrence_parser {반복 파서} domain_label_parser {도메인 "
      & "레이블 파서} other {파서}}에서 지원되지 않는 구문: "
      & "{error}{position, plural, =0 {} other { (위치 {position, number})}}. "
      & "다음을 사용하세요: {family, select, byte_parser {B, kB, MB, "
      & "GB, KiB, MiB, GiB 또는 TiB} duration_parser {ms, s, min, h, d, w, "
      & "month 또는 year} date_time_parser {ISO 날짜, 자연어 날짜 "
      & "또는 시각} color_parser {16진수, rgb(), hsl(), lab(), lch() "
      & "또는 색상 이름} url_parser {스킴, 호스트, 경로, 쿼리 "
      & "또는 프래그먼트} unit_parser {지원되는 Humanize 단위 "
      & "레이블} recurrence_parser {cron 또는 every/요일 반복 형식} "
      & "domain_label_parser {결정적인 Humanize 도메인 레이블} other "
      & "{지원되는 입력 형식}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {통과} failed_check {실패} "
      & "warning_check {경고} skipped_check {건너뜀} pending_check {대기 "
      & "중} other {실행 중}}({notices, plural, =0 {알림 없음} other "
      & "{알림 {notices, number}개}})");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {재시도 1/1} other "
      & "{재시도 {attempt, number}/1(한도 초과)}}} other {재시도 "
      & "{attempt, number}/{limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {정보} notice_severity {알림} "
      & "warning_severity {경고} error_severity {오류} critical_severity "
      & "{심각} other {차단}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {빌드 진단} test_source {테스트 "
      & "진단} lint_source {린트 진단} import_source {가져오기 "
      & "진단} validation_source {유효성 검사 진단} runtime_source "
      & "{런타임 진단} security_source {보안 진단} other {진단}}");
   P ("label.diagnostics.source_summary_label",
      "{source, select, build_source {빌드 진단} test_source {테스트 "
      & "진단} lint_source {린트 진단} import_source {가져오기 "
      & "진단} validation_source {유효성 검사 진단} runtime_source "
      & "{런타임 진단} security_source {보안 진단} other {진단}} "
      & "{count, number}개");
   P ("label.diagnostics.suggested_action_label", "다음 작업: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {도메인 호스트} ipv4_host {IPv4 "
      & "주소} ipv6_host {IPv6 주소} localhost_host {로컬 호스트} "
      & "private_network_host {사설 네트워크 주소} other {알 수 "
      & "없는 호스트}}");
   P ("label.events.all_day_label", "{name}(종일)");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {응답 안 함} accepted {수락} "
      & "declined {거절} maybe {미정} other {대기자 명단}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {참석자 없음} other {참석자 {count, "
      & "number}명}}");
   P ("label.events.canceled_label", "{name} 취소됨");
   P ("label.events.check_in_label", "{name} 체크인");
   P ("label.events.conference_link_label", "{name} 회의 링크");
   P ("label.events.event_count_label",
      "{count, plural, =0 {이벤트 없음} other {이벤트 {count, "
      & "number}개}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {예정됨} tentative_event "
      & "{미정} in_progress_event {진행 중} completed_event {완료됨} "
      & "canceled_event {취소됨} other {연기됨}}");
   P ("label.events.event_location_label", "{name}(장소: {location})");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {예정된 이벤트} tentative_event "
      & "{미정 이벤트} in_progress_event {진행 중인 이벤트} "
      & "completed_event {완료된 이벤트} canceled_event {취소된 "
      & "이벤트} other {연기된 이벤트}}");
   P ("label.events.event_time_label", "{name}({time_text})");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {공개 이벤트} private_event "
      & "{비공개 이벤트} busy_event {바쁨} other {한가함}}");
   P ("label.events.organizer_label", "주최자: {name}");
   P ("label.events.rsvp_label",
      "참석 여부: {state, select, not_responded {응답 안 함} accepted "
      & "{수락} declined {거절} maybe {미정} other {대기자 명단}}");
   P ("label.events.reminder_label", "미리 알림: {time_text}");
   P ("label.events.rescheduled_label", "{name} 일정 변경: {time_text}");
   P ("label.forms.character_count_label", "{used, number}자");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {글자 수 제한 없음} other {최대 {limit, "
      & "number}자}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, number}자} other {{used, number}/{limit, "
      & "number}자}}");
   P ("label.forms.field_label", "{required, select, false {{name}(선택)} other {{name}(필수)}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {유효함} invalid_input "
      & "{잘못됨} required_input {필수} optional_input {선택} "
      & "disabled_input {비활성화됨} other {읽기 전용}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {양식 문제 없음} "
      & "other {경고 {warnings, number}개}}} other {{warnings, plural, =0 "
      & "{오류 {errors, number}개} other {오류 {errors, number}개, 경고 "
      & "{warnings, number}개}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {시작 안 함} editing_form {편집 "
      & "중} dirty_form {저장되지 않은 변경 사항} saving_form "
      & "{저장 중} saved_form {저장됨} submitted_form {제출됨} other "
      & "{제출 실패}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {유효한 입력} invalid_input "
      & "{잘못된 입력} required_input {필수 입력} optional_input "
      & "{선택 입력} disabled_input {비활성화된 입력} other {읽기 "
      & "전용 입력}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {시작 안 함} editing_form {편집 "
      & "중} dirty_form {저장되지 않은 변경 사항} saving_form "
      & "{양식 저장 중} saved_form {양식 저장됨} submitted_form "
      & "{양식 제출됨} other {{errors, plural, =0 {제출 실패} other "
      & "{제출 실패(오류 {errors, number}개)}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {저장되지 않은 변경 사항 없음} other "
      & "{저장되지 않은 변경 사항 {count, number}개}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {접근 가능한 "
      & "이름 없음} low_contrast {낮은 대비} skipped_heading_level "
      & "{제목 수준 건너뜀} missing_form_label {양식 레이블 없음} "
      & "invalid_aria {잘못된 ARIA} keyboard_trap {키보드 트랩} other "
      & "{알 수 없는 접근성 문제}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title} 접근성 요약: 랜드마크 {landmarks, number}개, 제목 "
      & "{headings, number}개, 문제 {issues, number}개");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {접근 가능한 이름을 "
      & "추가하세요} low_contrast {텍스트 대비를 높이세요} "
      & "skipped_heading_level {제목 수준을 순서대로 사용하세요} "
      & "missing_form_label {양식 컨트롤에 레이블을 연결하세요} "
      & "invalid_aria {유효한 ARIA 역할 또는 속성을 사용하세요} "
      & "keyboard_trap {키보드 포커스가 구성 요소를 벗어날 수 "
      & "있게 하세요} other {접근성 문제를 검토하세요}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target}: 접근성 문제 없음} other "
      & "{{target}: 접근성 문제 {issues, number}개}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id 속성} class_attribute {class 속성} "
      & "data_attribute {data 속성} aria_attribute {ARIA 속성} "
      & "role_attribute {role 속성} link_attribute {링크 속성} "
      & "media_attribute {미디어 속성} form_attribute {양식 속성} "
      & "boolean_attribute {부울 속성} event_attribute {이벤트 핸들러 "
      & "속성} other {알 수 없는 속성}}");
   P ("label.markup.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{form_name}: 양식 문제 "
      & "없음} other {{form_name}: 경고 {warnings, number}개}}} other "
      & "{{warnings, plural, =0 {{form_name}: 오류 {errors, number}개} other "
      & "{{form_name}: 오류 {errors, number}개, 경고 {warnings, "
      & "number}개}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {배너 랜드마크} navigation_role "
      & "{탐색 랜드마크} main_role {기본 랜드마크} "
      & "complementary_role {보충 랜드마크} contentinfo_role {콘텐츠 "
      & "정보 랜드마크} search_role {검색 랜드마크} form_role "
      & "{양식 랜드마크} region_role {영역 랜드마크} dialog_role "
      & "{대화 상자} alert_role {경고 라이브 영역} status_role "
      & "{상태 라이브 영역} other {알 수 없는 랜드마크}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region} 즉시 업데이트: {update}} other "
      & "{{region} 일반 업데이트: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {텍스트 콘텐츠} html_content {HTML "
      & "콘텐츠} json_content {JSON 콘텐츠} xml_content {XML 콘텐츠} "
      & "image_content {이미지 콘텐츠} audio_content {오디오 "
      & "콘텐츠} video_content {동영상 콘텐츠} font_content {글꼴 "
      & "콘텐츠} archive_content {압축 파일 콘텐츠} binary_content "
      & "{바이너리 콘텐츠} form_content {양식 콘텐츠} other {알 "
      & "수 없는 콘텐츠}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {문서 태그} metadata_tag "
      & "{메타데이터 태그} section_tag {섹션 태그} text_tag "
      & "{텍스트 태그} link_tag {링크 태그} media_tag {미디어 "
      & "태그} form_tag {양식 태그} table_tag {표 태그} "
      & "interactive_tag {대화형 태그} scripting_tag {스크립트 태그} "
      & "other {알 수 없는 태그}}");
   P ("label.media.duration_label", "재생 시간 {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {이미지} video_media {동영상} "
      & "audio_media {오디오} pdf_document {PDF 문서} text_document "
      & "{텍스트 문서} archive_media {압축 파일} other {미디어}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {준비됨} processing_media {처리 중} "
      & "transcoding_media {트랜스코딩 중} thumbnail_missing {썸네일 "
      & "없음} metadata_missing {메타데이터 없음} locked_document "
      & "{문서 잠김} other {사용할 수 없음}}");
   P ("label.media.media_summary",
      "{name}({kind, select, image_media {이미지} video_media {동영상} "
      & "audio_media {오디오} pdf_document {PDF 문서} text_document "
      & "{텍스트 문서} archive_media {압축 파일} other {미디어}}): "
      & "{state, select, ready_media {준비됨} processing_media {처리 중} "
      & "transcoding_media {트랜스코딩 중} thumbnail_missing {썸네일 "
      & "없음} metadata_missing {메타데이터 없음} locked_document "
      & "{문서 잠김} other {사용할 수 없음}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {페이지 없음} other {{pages, "
      & "number}페이지}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "{item} 이의 제기: {state, select, open_report {미처리} "
      & "triaged_report {분류됨} actioned_report {조치 완료} "
      & "dismissed_report {기각됨} appealed_report {이의 제기됨} other "
      & "{종료됨}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {모더레이션 조치 없음} flagged "
      & "{플래그 지정됨} hidden {모더레이터가 숨김} restored "
      & "{복원됨} marked_spam {스팸으로 표시됨} removed {삭제됨} "
      & "other {에스컬레이션됨}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {모더레이션 조치 없음} "
      & "flagged {플래그 지정됨} hidden {모더레이터가 숨김} "
      & "restored {복원됨} marked_spam {스팸으로 표시됨} removed "
      & "{삭제됨} other {에스컬레이션됨}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {모더레이션 "
      & "대기열 비어 있음} other {검토 대기 {pending, number}개}}} "
      & "other {검토 대기 {pending, number}개, 에스컬레이션 "
      & "{escalated, number}개}}");
   P ("label.moderation.report_label",
      "{item} 신고: {state, select, open_report {미처리} triaged_report "
      & "{분류됨} actioned_report {조치 완료} dismissed_report "
      & "{기각됨} appealed_report {이의 제기됨} other {종료됨}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {미처리 신고} triaged_report "
      & "{분류된 신고} actioned_report {조치 완료} dismissed_report "
      & "{기각된 신고} appealed_report {이의 제기된 신고} other "
      & "{종료된 신고}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {검토 대기} approved "
      & "{승인됨} rejected {거부됨} needs_changes {변경 필요} other "
      & "{에스컬레이션됨}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {검토 대기} approved {승인됨} "
      & "rejected {거부됨} needs_changes {변경 필요} other "
      & "{에스컬레이션됨}}");
   P ("label.navigation.back_label", "{target}(으)로 돌아가기");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {탐색 경로 없음} other {탐색 경로 {depth, "
      & "number}단계}}");
   P ("label.navigation.current_page_label", "현재 페이지: {name}");
   P ("label.navigation.external_link_label", "{name} 외부 링크");
   P ("label.navigation.first_label", "처음: {target}");
   P ("label.navigation.last_label", "마지막: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {메뉴 항목 없음} other {메뉴 항목 {count, "
      & "number}개}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {링크} menu_item {메뉴 항목} tab_item "
      & "{탭} breadcrumb_item {탐색 경로} section_item {섹션} other "
      & "{구분선}}");
   P ("label.navigation.navigation_item_label",
      "{name} {kind, select, link_item {링크} menu_item {메뉴 항목} "
      & "tab_item {탭} breadcrumb_item {탐색 경로} section_item {섹션} "
      & "other {구분선}}: {state, select, current_item {현재} active_item "
      & "{활성} inactive_item {비활성} disabled_item {사용 중지됨} "
      & "expanded_item {펼쳐짐} collapsed_item {접힘} visited_item "
      & "{방문함} other {외부}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {현재} active_item {활성} "
      & "inactive_item {비활성} disabled_item {사용 중지됨} "
      & "expanded_item {펼쳐짐} collapsed_item {접힘} visited_item "
      & "{방문함} other {외부}}");
   P ("label.navigation.next_label", "다음: {target}");
   P ("label.navigation.section_state_label",
      "{name} 섹션 {expanded, select, false {접힘} other "
      & "{펼쳐짐}}{count, plural, =0 {} other {, 항목 {count, number}개}}");
   P ("label.navigation.skip_link_label", "{target}(으)로 건너뛰기");
   P ("label.navigation.submenu_label", "{name} 하위 메뉴, 항목 {count, number}개");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {모든 경고} important_alerts {중요한 "
      & "경고} critical_alerts_only {심각한 경고만} other {경고 "
      & "없음}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel} 알림: {state, select, preference_enabled {사용} "
      & "preference_disabled {사용 안 함} preference_inherited {상속됨} "
      & "other {필수}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {요약 없음} instant_digest {즉시 "
      & "요약} daily_digest {일일 요약} other {주간 요약}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {사용} preference_disabled "
      & "{사용 안 함} preference_inherited {상속됨} other {필수}}");
   P ("label.notification_preferences.quiet_hours_label", "방해 금지 시간: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name} {scope, select, thread_subscription {스레드} "
      & "project_subscription {프로젝트} team_subscription {팀} other "
      & "{계정}} 구독: {state, select, preference_enabled {사용} "
      & "preference_disabled {사용 안 함} preference_inherited {상속됨} "
      & "other {필수}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {스레드 구독} "
      & "project_subscription {프로젝트 구독} team_subscription {팀 "
      & "구독} other {계정 구독}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor}님이 나를 언급함} "
      & "reply_event {{actor}님이 답글을 남김} assignment_event "
      & "{{actor}님이 나에게 할당함} approval_event {{actor}님이 "
      & "승인을 요청함} alert_event {{actor}님이 경고를 보냄} "
      & "digest_event {{actor}님이 요약을 보냄} reminder_event "
      & "{{actor}님이 미리 알림을 보냄} other {{actor}님이 시스템 "
      & "알림을 보냄}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {앱 내 알림} email_channel "
      & "{이메일 알림} sms_channel {SMS 알림} push_channel {푸시 "
      & "알림} webhook_channel {웹훅 알림} other {요약 알림}}: "
      & "{state, select, pending_delivery {대기 중} sent_delivery "
      & "{전송됨} delivered_delivery {전달됨} failed_delivery {실패} "
      & "retrying_delivery {재시도 중} other {취소됨}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {대기 중인 알림} sent_delivery "
      & "{전송된 알림} delivered_delivery {전달된 알림} "
      & "failed_delivery {실패한 알림} retrying_delivery {재시도 중인 "
      & "알림} other {취소된 알림}}");
end Labels_1;
