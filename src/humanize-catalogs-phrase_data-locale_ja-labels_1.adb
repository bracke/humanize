separate (Humanize.Catalogs.Phrase_Data.Locale_Ja)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{name}：{state, select, active_account {有効なアカウント} "
      & "invited_account {招待中のアカウント} locked_account "
      & "{ロック中のアカウント} suspended_account "
      & "{停止中のアカウント} deleted_account "
      & "{削除済みのアカウント} other "
      & "{アカウントの状態不明}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {有効なアカウント} "
      & "invited_account {招待中のアカウント} locked_account "
      & "{ロック中のアカウント} suspended_account "
      & "{停止中のアカウント} deleted_account "
      & "{削除済みのアカウント} other "
      & "{アカウントの状態不明}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {信頼済みのデバイス} "
      & "untrusted_device {信頼されていないデバイス} new_device "
      & "{新しいデバイス} other {ブロックされたデバイス}}");
   P ("label.accounts.last_active_label", "{name}：最終アクティブ {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}：ログイン失敗} other "
      & "{{name}：ログイン成功}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA有効} mfa_disabled {MFA無効} "
      & "mfa_required {MFA必須} other {MFAのリセットが必要}}");
   P ("label.accounts.session_label",
      "{name}：{state, select, active_session {有効なセッション} "
      & "expired_session {セッション期限切れ} revoked_session "
      & "{セッション取り消し済み} idle_session "
      & "{アイドル状態のセッション} other "
      & "{セッションの状態不明}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {有効なセッション} "
      & "expired_session {セッション期限切れ} revoked_session "
      & "{セッション取り消し済み} idle_session "
      & "{アイドル状態のセッション} other "
      & "{セッションの状態不明}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {添付ファイルなし} other "
      & "{添付ファイル{count, number}件}}");
   P ("label.attachments.attachment_group_label", "{name}：添付ファイル{count, number}件");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {添付ファイル} image_attachment "
      & "{添付画像} video_attachment {添付動画} audio_attachment "
      & "{添付音声} document_attachment {添付ドキュメント} "
      & "archive_attachment {添付アーカイブ} other {添付リンク}}");
   P ("label.attachments.attachment_label",
      "{name}（{kind, select, file_attachment {ファイル} "
      & "image_attachment {画像} video_attachment {動画} audio_attachment "
      & "{音声} document_attachment {ドキュメント} archive_attachment "
      & "{アーカイブ} other {リンク}}）：{state, select, "
      & "pending_attachment {保留中} uploading_attachment "
      & "{アップロード中} uploaded_attachment {アップロード済み} "
      & "failed_attachment {失敗} removed_attachment {削除済み} other "
      & "{ブロック済み}}");
   P ("label.attachments.attachment_size_label", "{name}、{size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {保留中の添付ファイル} "
      & "uploading_attachment {アップロード中の添付ファイル} "
      & "uploaded_attachment {アップロード済みの添付ファイル} "
      & "failed_attachment {失敗した添付ファイル} removed_attachment "
      & "{削除された添付ファイル} other "
      & "{ブロックされた添付ファイル}}");
   P ("label.attachments.download_label", "{name}をダウンロード");
   P ("label.attachments.expiring_link_label", "{name}のリンクの有効期限：{time_text}");
   P ("label.attachments.image_dimensions_label", "{name}、{dimensions}");
   P ("label.attachments.preview_label", "{name}をプレビュー");
   P ("label.attachments.remove_label", "{name}を削除");
   P ("label.attachments.scan_result_label",
      "{name}：{state, select, not_scanned {未スキャン} scanning "
      & "{スキャン中} safe {スキャン結果：安全} suspicious "
      & "{スキャン結果：不審} other {スキャン結果：感染}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {未スキャン} scanning "
      & "{スキャン中} safe {スキャン結果：安全} suspicious "
      & "{スキャン結果：不審} other {スキャン結果：感染}}");
   P ("label.attachments.upload_error_label", "{name}のアップロード失敗：{reason}");
   P ("label.badges.badge_label",
      "{name}：{tone, select, neutral_tone {中立} info_tone {情報} "
      & "success_tone {成功} warning_tone {警告} danger_tone {危険} other "
      & "{控えめ}}バッジ{state, select, default_badge {} new_badge "
      & "{、新規} updated_badge {、更新済み} deprecated_badge "
      & "{、非推奨} selected_badge {、選択済み} disabled_badge "
      & "{、無効} other {、閉じることが可能}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {低優先度バッジ} "
      & "medium_priority {中優先度バッジ} high_priority "
      & "{高優先度バッジ} other {緊急優先度バッジ}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {標準バッジ} new_badge "
      & "{新規バッジ} updated_badge {更新済みバッジ} "
      & "deprecated_badge {非推奨バッジ} selected_badge "
      & "{選択済みバッジ} disabled_badge {無効なバッジ} other "
      & "{閉じることが可能なバッジ}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {中立バッジ} info_tone "
      & "{情報バッジ} success_tone {成功バッジ} warning_tone "
      & "{警告バッジ} danger_tone {危険バッジ} other "
      & "{控えめなバッジ}}");
   P ("label.badges.chip_label",
      "{selected, select, false {{name}チップ} other "
      & "{{name}チップ、選択済み}}");
   P ("label.badges.count_badge_label", "{count, plural, =0 {{name}なし} other {{name}{count, number}件}}");
   P ("label.badges.deprecated_label", "{name}：警告バッジ、非推奨");
   P ("label.badges.dismiss_label", "{name}を閉じる");
   P ("label.badges.new_label", "{name}：情報バッジ、新規");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {非表示のバッジなし} other "
      & "{ほか{hidden_count, number}個のバッジ}}");
   P ("label.badges.priority_badge_label",
      "{name}：{priority, select, low_priority {低優先度バッジ} "
      & "medium_priority {中優先度バッジ} high_priority "
      & "{高優先度バッジ} other {緊急優先度バッジ}}");
   P ("label.badges.status_badge_label",
      "{name}のステータス：{tone, select, neutral_tone {中立} "
      & "info_tone {情報} success_tone {成功} warning_tone {警告} "
      & "danger_tone {危険} other {控えめ}}");
   P ("label.badges.tag_count_label", "{count, plural, =0 {タグなし} other {タグ{count, number}個}}");
   P ("label.badges.tag_label", "{name}タグ");
   P ("label.badges.updated_label", "{name}：成功バッジ、更新済み");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded "
      & "{アーティファクトをアップロード済み} artifact_missing "
      & "{アーティファクトなし} artifact_expired "
      & "{アーティファクト期限切れ} other "
      & "{アーティファクト検証済み}}");
   P ("label.builds.benchmark_label", "{name}のベンチマーク：{result_text}");
   P ("label.builds.build_label",
      "{name}：{state, select, build_queued {ビルド待機中} "
      & "build_running {ビルド実行中} build_passed {ビルド成功} "
      & "build_failed {ビルド失敗} snapshot_build "
      & "{スナップショットビルド} other {リリースビルド}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {ビルド待機中} build_running "
      & "{ビルド実行中} build_passed {ビルド成功} build_failed "
      & "{ビルド失敗} snapshot_build {スナップショットビルド} "
      & "other {リリースビルド}}");
   P ("label.builds.coverage_label", "カバレッジ：{percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {リリースゲート通過} gate_failed "
      & "{リリースゲート失敗} gate_warning "
      & "{リリースゲート警告} other "
      & "{リリースゲートでブロック}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 "
      & "{成功したテストなし} other {テスト{count, "
      & "number}件成功}}} failed_test {{count, plural, =0 "
      & "{失敗したテストなし} other {テスト{count, "
      & "number}件失敗}}} skipped_test {{count, plural, =0 "
      & "{スキップしたテストなし} other {テスト{count, "
      & "number}件スキップ}}} flaky_test {{count, plural, =0 "
      & "{不安定なテストなし} other {不安定なテスト{count, "
      & "number}件}}} other {{count, plural, =0 "
      & "{想定どおり失敗したテストなし} other "
      & "{想定どおり失敗したテスト{count, number}件}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {成功} failed_test {失敗} skipped_test "
      & "{スキップ} flaky_test {不安定} other "
      & "{想定どおりの失敗}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false "
      & "{{field_name}：変更なし（無効）} other "
      & "{{field_name}：無効から有効に変更}}} other {{new_value, "
      & "select, false {{field_name}：有効から無効に変更} other "
      & "{{field_name}：変更なし（有効）}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {追加} removed_change {削除} "
      & "modified_change {変更} renamed_change {名前変更} "
      & "unchanged_change {変更なし} metadata_change "
      & "{メタデータ変更} moved_change {移動} conflict_change {競合} "
      & "other {不明な変更}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {情報のみの変更} "
      & "minor_change {軽微な変更} major_change {大きな変更} other "
      & "{破壊的変更}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}：変更なし} "
      & "other {{unchanged, plural, =0 {{field_name}を変更：{added, "
      & "number}件追加} other {{field_name}を変更：{added, "
      & "number}件追加、{unchanged, number}件変更なし}}}}} other "
      & "{{added, plural, =0 {{unchanged, plural, =0 "
      & "{{field_name}を変更：{removed, number}件削除} other "
      & "{{field_name}を変更：{removed, number}件削除、{unchanged, "
      & "number}件変更なし}}} other {{unchanged, plural, =0 "
      & "{{field_name}を変更：{added, number}件追加、{removed, "
      & "number}件削除} other {{field_name}を変更：{added, "
      & "number}件追加、{removed, number}件削除、{unchanged, "
      & "number}件変更なし}}}}}}");
   P ("label.changes.conflict_label", "{count, plural, =0 {競合なし} other {競合{count, number}件}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false "
      & "{{field_name}を{old_label}から{new_label}に繰り下げ} other "
      & "{{field_name}を{old_label}から{new_label}に繰り上げ}}");
   P ("label.changes.duration_field_change_label", "{field_name}を{old_label}から{new_label}に変更");
   P ("label.changes.field_change_label", "{field_name}を{old_value}から{new_value}に変更");
   P ("label.changes.item_change_label",
      "{name}：{kind, select, added_change {追加} removed_change {削除} "
      & "modified_change {変更} renamed_change {名前変更} "
      & "unchanged_change {変更なし} metadata_change "
      & "{メタデータ変更} moved_change {移動} conflict_change {競合} "
      & "other {不明な変更}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {メタデータのみ変更} other "
      & "{メタデータのフィールド{count, number}件のみ変更}}");
   P ("label.changes.move_label", "{name}を{from}から{to}に移動");
   P ("label.changes.no_changes_label", "変更なし");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 "
      & "{行の変更なし} other {{lines_added, number}行追加}}} other "
      & "{{lines_added, plural, =0 {{lines_removed, number}行削除} other "
      & "{{lines_added, number}行追加、{lines_removed, number}行削除}}}}");
   P ("label.changes.rename_label", "{old_name}から{new_name}に名前を変更");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author}がコメントを下書き} "
      & "published_comment {{author}がコメント} edited_comment "
      & "{{author}がコメントを編集} deleted_comment "
      & "{{author}がコメントを削除} resolved_comment "
      & "{{author}がコメントを解決} unresolved_comment "
      & "{{author}がコメントを再オープン} pinned_comment "
      & "{{author}がコメントをピン留め} other "
      & "{{author}がコメントを非表示}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {コメントなし} other {コメント{count, "
      & "number}件}}");
   P ("label.comments.comment_label",
      "{author}のコメント（{state, select, draft_comment {下書き} "
      & "published_comment {公開済み} edited_comment {編集済み} "
      & "deleted_comment {削除済み} resolved_comment {解決済み} "
      & "unresolved_comment {未解決} pinned_comment {ピン留め} other "
      & "{非表示}}）");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {下書きのコメント} "
      & "published_comment {公開済みのコメント} edited_comment "
      & "{編集済みのコメント} deleted_comment "
      & "{削除されたコメント} resolved_comment "
      & "{解決済みのコメント} unresolved_comment "
      & "{未解決のコメント} pinned_comment "
      & "{ピン留めされたコメント} other {非表示のコメント}}");
   P ("label.comments.deleted_label", "{author}がコメントを削除");
   P ("label.comments.edited_label", "{time_text}に編集");
   P ("label.comments.hide_comment_label", "コメントを非表示：{reason}");
   P ("label.comments.lock_thread_label", "{name}のスレッドをロック");
   P ("label.comments.mention_label", "{actor}が{target}をメンション");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {参加者なし} other {参加者{count, "
      & "number}人}}");
   P ("label.comments.pin_label", "{name}をピン留め");
   P ("label.comments.reaction_kind_label",
      "リアクション：{kind, select, like_reaction {いいね} "
      & "dislike_reaction {よくないね} heart_reaction {ハート} "
      & "laugh_reaction {笑い} confused_reaction {困惑} hooray_reaction "
      & "{お祝い} rocket_reaction {ロケット} other {目}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {いいね} dislike_reaction "
      & "{よくないね} heart_reaction {ハート} laugh_reaction {笑い} "
      & "confused_reaction {困惑} hooray_reaction {お祝い} rocket_reaction "
      & "{ロケット} other {目}}のリアクション{count, plural, =0 "
      & "{なし} other {{count, number}件}}");
   P ("label.comments.reply_count_label", "{count, plural, =0 {返信なし} other {返信{count, number}件}}");
   P ("label.comments.resolved_label", "{name}：解決済み");
   P ("label.comments.subscribe_label", "{name}を購読");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {スレッドなし} other {スレッド{count, "
      & "number}件}}");
   P ("label.comments.thread_label",
      "{name}：{state, select, open_thread {オープン中のスレッド} "
      & "resolved_thread {解決済みのスレッド} locked_thread "
      & "{ロック中のスレッド} other "
      & "{アーカイブ済みのスレッド}}{count, plural, =0 {} other "
      & "{、コメント{count, number}件}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {オープン中のスレッド} "
      & "resolved_thread {解決済みのスレッド} locked_thread "
      & "{ロック中のスレッド} other "
      & "{アーカイブ済みのスレッド}}");
   P ("label.comments.unpin_label", "{name}のピン留めを解除");
   P ("label.comments.unsubscribe_label", "{name}の購読を解除");
   P ("label.comparisons.baseline_label",
      "{name}：{result, select, improved {改善} regressed {悪化} "
      & "unchanged {変化なし} within_tolerance {許容範囲内} "
      & "outside_tolerance {許容範囲外} new_value {新規} removed_value "
      & "{削除} other {ベースラインなし}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {改善} regressed {悪化} unchanged "
      & "{変化なし} within_tolerance {許容範囲内} outside_tolerance "
      & "{許容範囲外} new_value {新規} removed_value {削除} other "
      & "{ベースラインなし}}");
   P ("label.comparisons.difference_label",
      "{name}：{result, select, improved {{difference_text}改善} regressed "
      & "{{difference_text}悪化} unchanged "
      & "{変化なし（差：{difference_text}）} within_tolerance "
      & "{許容範囲内（差：{difference_text}）} outside_tolerance "
      & "{許容範囲外（差：{difference_text}）} new_value "
      & "{新規（差：{difference_text}）} removed_value "
      & "{削除（差：{difference_text}）} other "
      & "{ベースラインなし（差：{difference_text}）}}");
   P ("label.comparisons.tolerance_label",
      "{name}：{result, select, improved {{difference_text}改善} regressed "
      & "{{difference_text}悪化} unchanged "
      & "{変化なし（差：{difference_text}）} within_tolerance "
      & "{許容範囲内（差：{difference_text}）} outside_tolerance "
      & "{許容範囲外（差：{difference_text}）} new_value "
      & "{新規（差：{difference_text}）} removed_value "
      & "{削除（差：{difference_text}）} other "
      & "{ベースラインなし（差：{difference_text}）}}、許容差"
      & "：{tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {無効な行} duplicate_record "
      & "{重複レコード} missing_column {列の欠落} unknown_field "
      & "{不明なフィールド} schema_mismatch {スキーマの不一致} "
      & "other {スキップされたレコード}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {ドライラン成功} dry_run_failed "
      & "{ドライラン失敗} import_valid {インポート有効} "
      & "import_invalid {インポート無効} other {部分インポート}}");
   P ("label.data_quality.import_result_label",
      "{name}：{state, select, dry_run_passed {ドライラン成功} "
      & "dry_run_failed {ドライラン失敗} import_valid "
      & "{インポート有効} import_invalid {インポート無効} other "
      & "{部分インポート}}（受理{accepted, "
      & "number}件、拒否{rejected, number}件）");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {無効な行} duplicate_record "
      & "{重複レコード} missing_column {欠落した列} unknown_field "
      & "{不明なフィールド} schema_mismatch {スキーマの不一致} "
      & "other {スキップされたレコード}}{count, plural, =0 {なし} "
      & "other {{count, number}件}}");
   P ("label.data_quality.row_issue_label",
      "{row, number}行目：{issue, select, invalid_row {無効な行} "
      & "duplicate_record {重複レコード} missing_column {列の欠落} "
      & "unknown_field {不明なフィールド} schema_mismatch "
      & "{スキーマの不一致} other {スキップされたレコード}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}：{issue, select, invalid_row {無効な行} "
      & "duplicate_record {重複レコード} missing_column {列の欠落} "
      & "unknown_field {不明なフィールド} schema_mismatch "
      & "{スキーマの不一致} other {スキップされたレコード}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {アーティファクト準備完了} "
      & "artifact_uploaded {アーティファクトアップロード済み} "
      & "artifact_signed {アーティファクト署名済み} "
      & "artifact_missing {アーティファクトなし} other "
      & "{アーティファクト期限切れ}}");
   P ("label.deployments.deployment_label",
      "{name}の{environment}へのデプロイ：{state, select, "
      & "queued_deployment {待機中} deploying {実行中} deployed {完了} "
      & "failed_deployment {失敗} rolled_back {ロールバック済み} "
      & "blocked_deployment {ブロック中} other {キャンセル済み}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {デプロイ待機中} deploying "
      & "{デプロイ中} deployed {デプロイ済み} failed_deployment "
      & "{デプロイ失敗} rolled_back {ロールバック済み} "
      & "blocked_deployment {デプロイブロック中} other "
      & "{デプロイキャンセル済み}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {環境正常} "
      & "drifting_environment {環境ドリフト} locked_environment "
      & "{環境ロック中} maintenance_environment "
      & "{環境メンテナンス中} other {環境の状態不明}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {マイグレーションなし} "
      & "migration_pending {マイグレーション保留中} migrating "
      & "{マイグレーション中} migration_complete "
      & "{マイグレーション完了} other "
      & "{マイグレーション失敗}}");
   P ("label.deployments.promotion_label", "{name}を{from_environment}から{to_environment}に昇格");
   P ("label.deployments.rollback_label", "{name}を{target}にロールバック");
   P ("label.deployments.rollout_label", "{name}のロールアウト：{percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {影響を受ける項目なし} other "
      & "{影響を受ける項目{count, number}件}}");
   P ("label.diagnostics.check_duration_label",
      "{name}：{status, select, passed_check {成功} failed_check {失敗} "
      & "warning_check {警告あり} skipped_check {スキップ} "
      & "pending_check {保留中} other {実行中}}（{duration_s, "
      & "number}秒）");
   P ("label.diagnostics.check_result_label",
      "{name}：{status, select, passed_check {成功} failed_check {失敗} "
      & "warning_check {警告あり} skipped_check {スキップ} "
      & "pending_check {保留中} other {実行中}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {成功} failed_check {失敗} "
      & "warning_check {警告あり} skipped_check {スキップ} "
      & "pending_check {保留中} other {実行中}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{subject}{position, plural, =0 {} other {（位置{position, "
      & "number}）}}：{kind, select, expected_value {値が必要です} "
      & "expected_unit {単位が必要です} invalid_range "
      & "{範囲が無効です} end_before_start "
      & "{範囲の終了が開始より前です} unknown_field "
      & "{不明なフィールドです} unsafe_redacted_value "
      & "{安全でない値を伏せました} unsupported_syntax "
      & "{サポートされていない構文です} other "
      & "{診断の説明}}。{suggestion}を使用してください");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {情報} notice_severity {注意} "
      & "warning_severity {警告} error_severity {エラー} critical_severity "
      & "{重大} other {ブロッカー}}：{path}{line, plural, =0 {} other { "
      & "{line, number}行目}}：{message}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path} {line, "
      & "number}行目} other {{path} {line, number}行{column, "
      & "number}列}}}}で失敗");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {情報} notice_severity {注意} "
      & "warning_severity {警告} error_severity {エラー} critical_severity "
      & "{重大} other {ブロッカー}}（{field_name}）：{message}");
   P ("label.diagnostics.first_failure_label",
      "{check_name}の最初の失敗：{path}{line, plural, =0 {} other { "
      & "{line, number}行目}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{問題なし} other {通知{notices, number}件}}} other {{notices, "
      & "plural, =0 {警告{warnings, number}件} other {警告{warnings, "
      & "number}件、通知{notices, number}件}}}}} other {{warnings, plural, "
      & "=0 {{notices, plural, =0 {エラー{errors, number}件} other "
      & "{エラー{errors, number}件、通知{notices, number}件}}} other "
      & "{{notices, plural, =0 {エラー{errors, number}件、警告{warnings, "
      & "number}件} other {エラー{errors, number}件、警告{warnings, "
      & "number}件、通知{notices, number}件}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path} {line, "
      & "number}行目} other {{path} {line, number}行{column, number}列}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{family, select, byte_parser {バイトパーサー} duration_parser "
      & "{期間パーサー} date_time_parser {日時パーサー} "
      & "color_parser {色パーサー} url_parser {URLパーサー} "
      & "unit_parser {単位パーサー} recurrence_parser "
      & "{繰り返しパーサー} domain_label_parser "
      & "{ドメインラベルパーサー} other "
      & "{パーサー}}でサポートされていない構文：{error}{position, "
      & "plural, =0 {} other {（位置{position, number}）}}。{family, "
      & "select, byte_parser "
      & "{B、kB、MB、GB、KiB、MiB、GiB、TiBのいずれか} "
      & "duration_parser "
      & "{ms、s、min、h、d、w、month、yearのいずれか} "
      & "date_time_parser "
      & "{ISO日付、自然な日付表現、時刻のいずれか} "
      & "color_parser "
      & "{16進、rgb()、hsl()、lab()、lch()、色名のいずれか} "
      & "url_parser "
      & "{スキーム、ホスト、パス、クエリ、フラグメント} "
      & "unit_parser {サポートされているHumanize単位ラベル} "
      & "recurrence_parser {cronまたはevery/曜日形式の繰り返し} "
      & "domain_label_parser {決定的なHumanizeドメインラベル} other "
      & "{サポートされている入力形式}}を使用してください");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {成功} failed_check {失敗} "
      & "warning_check {警告あり} skipped_check {スキップ} "
      & "pending_check {保留中} other {実行中}}（{notices, plural, =0 "
      & "{通知なし} other {通知{notices, number}件}}）");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {再試行 1/1} other "
      & "{再試行 {attempt, number}/1（上限超過）}}} other {再試行 "
      & "{attempt, number}/{limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {情報} notice_severity {注意} "
      & "warning_severity {警告} error_severity {エラー} critical_severity "
      & "{重大} other {ブロッカー}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {ビルド診断} test_source "
      & "{テスト診断} lint_source {リント診断} import_source "
      & "{インポート診断} validation_source {検証診断} "
      & "runtime_source {実行時診断} security_source "
      & "{セキュリティ診断} other {診断}}");
   P ("label.diagnostics.source_summary_label",
      "{source, select, build_source {ビルド診断} test_source "
      & "{テスト診断} lint_source {リント診断} import_source "
      & "{インポート診断} validation_source {検証診断} "
      & "runtime_source {実行時診断} security_source "
      & "{セキュリティ診断} other {診断}}{count, number}件");
   P ("label.diagnostics.suggested_action_label", "次の操作：{action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {ドメインホスト} ipv4_host "
      & "{IPv4アドレス} ipv6_host {IPv6アドレス} localhost_host "
      & "{ローカルホスト} private_network_host "
      & "{プライベートネットワークアドレス} other "
      & "{不明なホスト}}");
   P ("label.events.all_day_label", "{name}（終日）");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {未回答} accepted {承諾} declined "
      & "{辞退} maybe {未定} other {キャンセル待ち}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {参加者なし} other {参加者{count, "
      & "number}人}}");
   P ("label.events.canceled_label", "{name}：キャンセル済み");
   P ("label.events.check_in_label", "{name}にチェックイン");
   P ("label.events.conference_link_label", "{name}の会議リンク");
   P ("label.events.event_count_label",
      "{count, plural, =0 {イベントなし} other {イベント{count, "
      & "number}件}}");
   P ("label.events.event_label",
      "{name}：{state, select, scheduled_event {予定} tentative_event "
      & "{仮予定} in_progress_event {進行中} completed_event {終了} "
      & "canceled_event {キャンセル} other {延期}}");
   P ("label.events.event_location_label", "{name}（場所：{location}）");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {予定されたイベント} "
      & "tentative_event {仮のイベント} in_progress_event "
      & "{進行中のイベント} completed_event {終了したイベント} "
      & "canceled_event {キャンセルされたイベント} other "
      & "{延期されたイベント}}");
   P ("label.events.event_time_label", "{name}（{time_text}）");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {公開イベント} private_event "
      & "{非公開イベント} busy_event {予定あり} other "
      & "{空き時間}}");
   P ("label.events.organizer_label", "主催者：{name}");
   P ("label.events.rsvp_label",
      "出欠：{state, select, not_responded {未回答} accepted {承諾} "
      & "declined {辞退} maybe {未定} other {キャンセル待ち}}");
   P ("label.events.reminder_label", "リマインダー：{time_text}");
   P ("label.events.rescheduled_label", "{name}の日程を{time_text}に変更");
   P ("label.forms.character_count_label", "{used, number}文字");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {文字数制限なし} other {最大{limit, "
      & "number}文字}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, number}文字} other {{used, "
      & "number}/{limit, number}文字}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}（任意）} other "
      & "{{name}（必須）}}");
   P ("label.forms.field_state_label",
      "{name}：{state, select, valid_input {有効} invalid_input {無効} "
      & "required_input {必須} optional_input {任意} disabled_input "
      & "{使用不可} other {読み取り専用}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 "
      & "{フォームの問題なし} other {警告{warnings, number}件}}} "
      & "other {{warnings, plural, =0 {エラー{errors, number}件} other "
      & "{エラー{errors, number}件、警告{warnings, number}件}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {未着手} editing_form {編集中} "
      & "dirty_form {未保存の変更あり} saving_form {保存中} "
      & "saved_form {保存済み} submitted_form {送信済み} other "
      & "{送信失敗}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {有効な入力} invalid_input "
      & "{無効な入力} required_input {必須入力} optional_input "
      & "{任意入力} disabled_input {使用不可の入力} other "
      & "{読み取り専用の入力}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {未着手} editing_form {編集中} "
      & "dirty_form {未保存の変更あり} saving_form "
      & "{フォームを保存中} saved_form {フォーム保存済み} "
      & "submitted_form {フォーム送信済み} other {{errors, plural, =0 "
      & "{送信失敗} other {送信失敗（エラー{errors, "
      & "number}件）}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {未保存の変更なし} other "
      & "{未保存の変更{count, number}件}}");
   P ("label.markup.accessibility_issue_label",
      "{target}：{issue, select, missing_accessible_name "
      & "{アクセシブルな名前がありません} low_contrast "
      & "{コントラスト不足} skipped_heading_level "
      & "{見出しレベルの飛ばし} missing_form_label "
      & "{フォームラベルがありません} invalid_aria {無効なARIA} "
      & "keyboard_trap {キーボードトラップ} other "
      & "{不明なアクセシビリティの問題}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}のアクセシビリティ概要：ランドマーク{landmarks, "
      & "number}件、見出し{headings, number}件、問題{issues, "
      & "number}件");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name "
      & "{アクセシブルな名前を追加してください} low_contrast "
      & "{テキストのコントラストを上げてください} "
      & "skipped_heading_level "
      & "{見出しレベルを順番に使用してください} "
      & "missing_form_label "
      & "{フォームコントロールにラベルを関連付けてください} "
      & "invalid_aria "
      & "{有効なARIAロールまたは属性を使用してください} "
      & "keyboard_trap "
      & "{キーボードフォーカスがコンポーネントから移動で"
      & "きるようにしてください} "
      & "other {アクセシビリティの問題を確認してください}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 "
      & "{{target}にアクセシビリティの問題はありません} other "
      & "{{target}にアクセシビリティの問題が{issues, "
      & "number}件あります}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id属性} class_attribute {class属性} "
      & "data_attribute {data属性} aria_attribute {ARIA属性} role_attribute "
      & "{role属性} link_attribute {リンク属性} media_attribute "
      & "{メディア属性} form_attribute {フォーム属性} "
      & "boolean_attribute {ブール属性} event_attribute "
      & "{イベントハンドラー属性} other {不明な属性}}");
   P ("label.markup.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 "
      & "{{form_name}にフォームの問題はありません} other "
      & "{{form_name}：警告{warnings, number}件}}} other {{warnings, "
      & "plural, =0 {{form_name}：エラー{errors, number}件} other "
      & "{{form_name}：エラー{errors, number}件、警告{warnings, "
      & "number}件}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {バナーランドマーク} "
      & "navigation_role {ナビゲーションランドマーク} main_role "
      & "{メインランドマーク} complementary_role "
      & "{補足ランドマーク} contentinfo_role "
      & "{コンテンツ情報ランドマーク} search_role "
      & "{検索ランドマーク} form_role {フォームランドマーク} "
      & "region_role {領域ランドマーク} dialog_role {ダイアログ} "
      & "alert_role {アラートライブリージョン} status_role "
      & "{ステータスライブリージョン} other "
      & "{不明なランドマーク}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}の即時更新：{update}} other "
      & "{{region}の通常更新：{update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {テキストコンテンツ} html_content "
      & "{HTMLコンテンツ} json_content {JSONコンテンツ} xml_content "
      & "{XMLコンテンツ} image_content {画像コンテンツ} "
      & "audio_content {音声コンテンツ} video_content "
      & "{動画コンテンツ} font_content {フォントコンテンツ} "
      & "archive_content {アーカイブコンテンツ} binary_content "
      & "{バイナリコンテンツ} form_content "
      & "{フォームコンテンツ} other {不明なコンテンツ}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {ドキュメントタグ} metadata_tag "
      & "{メタデータタグ} section_tag {セクションタグ} text_tag "
      & "{テキストタグ} link_tag {リンクタグ} media_tag "
      & "{メディアタグ} form_tag {フォームタグ} table_tag "
      & "{テーブルタグ} interactive_tag {インタラクティブタグ} "
      & "scripting_tag {スクリプトタグ} other {不明なタグ}}");
   P ("label.media.duration_label", "再生時間：{duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {画像} video_media {動画} audio_media "
      & "{音声} pdf_document {PDFドキュメント} text_document "
      & "{テキストドキュメント} archive_media {アーカイブ} other "
      & "{メディア}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {準備完了} processing_media "
      & "{処理中} transcoding_media {トランスコード中} "
      & "thumbnail_missing {サムネイルなし} metadata_missing "
      & "{メタデータなし} locked_document "
      & "{ドキュメントロック中} other {利用不可}}");
   P ("label.media.media_summary",
      "{name}（{kind, select, image_media {画像} video_media {動画} "
      & "audio_media {音声} pdf_document {PDFドキュメント} "
      & "text_document {テキストドキュメント} archive_media "
      & "{アーカイブ} other {メディア}}）：{state, select, "
      & "ready_media {準備完了} processing_media {処理中} "
      & "transcoding_media {トランスコード中} thumbnail_missing "
      & "{サムネイルなし} metadata_missing {メタデータなし} "
      & "locked_document {ドキュメントロック中} other {利用不可}}");
   P ("label.media.page_count_label", "{pages, plural, =0 {ページなし} other {{pages, number}ページ}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "{item}の異議申し立て：{state, select, open_report {未対応} "
      & "triaged_report {トリアージ済み} actioned_report {対応済み} "
      & "dismissed_report {却下} appealed_report {異議申し立て中} "
      & "other {終了}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {モデレーション操作なし} flagged "
      & "{フラグ付き} hidden {モデレーターにより非表示} "
      & "restored {復元済み} marked_spam "
      & "{スパムとしてマーク済み} removed {削除済み} other "
      & "{エスカレーション済み}}");
   P ("label.moderation.moderation_label",
      "{item}：{action, select, no_action "
      & "{モデレーション操作なし} flagged {フラグ付き} hidden "
      & "{モデレーターにより非表示} restored {復元済み} "
      & "marked_spam {スパムとしてマーク済み} removed {削除済み} "
      & "other {エスカレーション済み}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 "
      & "{モデレーションキューは空} other "
      & "{レビュー待ち{pending, number}件}}} other "
      & "{レビュー待ち{pending, "
      & "number}件、エスカレーション{escalated, number}件}}");
   P ("label.moderation.report_label",
      "{item}の報告：{state, select, open_report {未対応} "
      & "triaged_report {トリアージ済み} actioned_report {対応済み} "
      & "dismissed_report {却下} appealed_report {異議申し立て中} "
      & "other {終了}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {未対応の報告} triaged_report "
      & "{トリアージ済みの報告} actioned_report {対応済み} "
      & "dismissed_report {却下された報告} appealed_report "
      & "{異議申し立て中の報告} other {終了した報告}}");
   P ("label.moderation.review_label",
      "{item}：{state, select, pending_review {レビュー待ち} approved "
      & "{承認済み} rejected {却下} needs_changes {要修正} other "
      & "{エスカレーション済み}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {レビュー待ち} approved "
      & "{承認済み} rejected {却下} needs_changes {要修正} other "
      & "{エスカレーション済み}}");
   P ("label.navigation.back_label", "{target}に戻る");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {パンくずリストなし} other "
      & "{パンくずリスト{depth, number}階層}}");
   P ("label.navigation.current_page_label", "現在のページ：{name}");
end Labels_1;
