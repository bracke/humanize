separate (Humanize.Catalogs.Phrase_Data.Locale_Ja)
procedure Labels_2 is
begin
   P ("label.navigation.external_link_label", "{name}（外部リンク）");
   P ("label.navigation.first_label", "最初：{target}");
   P ("label.navigation.last_label", "最後：{target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {メニュー項目なし} other "
      & "{メニュー項目{count, number}件}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {リンク} menu_item {メニュー項目} "
      & "tab_item {タブ} breadcrumb_item {パンくず} section_item "
      & "{セクション} other {区切り線}}");
   P ("label.navigation.navigation_item_label",
      "{name}（{kind, select, link_item {リンク} menu_item "
      & "{メニュー項目} tab_item {タブ} breadcrumb_item {パンくず} "
      & "section_item {セクション} other {区切り線}}）：{state, "
      & "select, current_item {現在} active_item {アクティブ} "
      & "inactive_item {非アクティブ} disabled_item {無効} "
      & "expanded_item {展開} collapsed_item {折りたたみ} visited_item "
      & "{訪問済み} other {外部}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {現在} active_item {アクティブ} "
      & "inactive_item {非アクティブ} disabled_item {無効} "
      & "expanded_item {展開} collapsed_item {折りたたみ} visited_item "
      & "{訪問済み} other {外部}}");
   P ("label.navigation.next_label", "次：{target}");
   P ("label.navigation.section_state_label",
      "{name}セクション：{expanded, select, false {折りたたみ} "
      & "other {展開}}{count, plural, =0 {} other {、項目{count, "
      & "number}件}}");
   P ("label.navigation.skip_link_label", "{target}へスキップ");
   P ("label.navigation.submenu_label", "{name}サブメニュー、項目{count, number}件");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {すべてのアラート} important_alerts "
      & "{重要なアラート} critical_alerts_only "
      & "{重大なアラートのみ} other {アラートなし}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}通知：{state, select, preference_enabled {有効} "
      & "preference_disabled {無効} preference_inherited {継承} other "
      & "{必須}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {ダイジェストなし} instant_digest "
      & "{即時ダイジェスト} daily_digest {毎日のダイジェスト} "
      & "other {毎週のダイジェスト}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {有効} preference_disabled "
      & "{無効} preference_inherited {継承} other {必須}}");
   P ("label.notification_preferences.quiet_hours_label", "通知停止時間：{time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}の{scope, select, thread_subscription {スレッド} "
      & "project_subscription {プロジェクト} team_subscription "
      & "{チーム} other {アカウント}}購読：{state, select, "
      & "preference_enabled {有効} preference_disabled {無効} "
      & "preference_inherited {継承} other {必須}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {スレッドの購読} "
      & "project_subscription {プロジェクトの購読} team_subscription "
      & "{チームの購読} other {アカウントの購読}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event "
      & "{{actor}があなたをメンションしました} reply_event "
      & "{{actor}が返信しました} assignment_event "
      & "{{actor}があなたを担当者に割り当てました} "
      & "approval_event {{actor}が承認をリクエストしました} "
      & "alert_event {{actor}がアラートを送信しました} digest_event "
      & "{{actor}がダイジェストを送信しました} reminder_event "
      & "{{actor}がリマインダーを送信しました} other "
      & "{{actor}がシステム通知を送信しました}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {アプリ内通知} email_channel "
      & "{メール通知} sms_channel {SMS通知} push_channel "
      & "{プッシュ通知} webhook_channel {Webhook通知} other "
      & "{ダイジェスト通知}}：{state, select, pending_delivery "
      & "{保留中} sent_delivery {送信済み} delivered_delivery "
      & "{配信済み} failed_delivery {失敗} retrying_delivery "
      & "{再試行中} other {キャンセル済み}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {保留中の通知} sent_delivery "
      & "{送信済みの通知} delivered_delivery {配信済みの通知} "
      & "failed_delivery {配信に失敗した通知} retrying_delivery "
      & "{再試行中の通知} other {キャンセルされた通知}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {保留中} sent_delivery "
      & "{送信済み} delivered_delivery {配信済み} failed_delivery "
      & "{失敗} retrying_delivery {再試行中} other "
      & "{キャンセル済み}}：{time_text}");
   P ("label.notifications.digest_label",
      "{name}ダイジェスト：{count, plural, =0 {通知なし} other "
      & "{通知{count, number}件}}");
   P ("label.notifications.event_count_label",
      "{count, plural, =0 {{event, select, mention_event "
      & "{メンションなし} reply_event {返信なし} assignment_event "
      & "{割り当てなし} approval_event {承認リクエストなし} "
      & "alert_event {アラートなし} digest_event "
      & "{ダイジェストなし} reminder_event {リマインダーなし} "
      & "other {システム通知なし}}} other {{event, select, "
      & "mention_event {メンション} reply_event {返信} assignment_event "
      & "{割り当て} approval_event {承認リクエスト} alert_event "
      & "{アラート} digest_event {ダイジェスト} reminder_event "
      & "{リマインダー} other {システム通知}}{count, number}件}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, =1 {通知を既読にする} other {{count, "
      & "number}件の通知を既読にする}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, =1 {通知を未読にする} other {{count, "
      & "number}件の通知を未読にする}}");
   P ("label.notifications.muted_label", "{name}の通知はミュート中");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {新しいメンション} reply_event "
      & "{新しい返信} assignment_event {新しい割り当て} "
      & "approval_event {新しい承認リクエスト} alert_event "
      & "{新しいアラート} digest_event {新しいダイジェスト} "
      & "reminder_event {新しいリマインダー} other "
      & "{新しいシステム通知}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {アプリ内通知} email_channel "
      & "{メール通知} sms_channel {SMS通知} push_channel "
      & "{プッシュ通知} webhook_channel {Webhook通知} other "
      & "{ダイジェスト通知}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {通知なし} other {通知{count, number}件}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {メンション} reply_event {返信} "
      & "assignment_event {割り当て} approval_event {承認リクエスト} "
      & "alert_event {アラート} digest_event {ダイジェスト} "
      & "reminder_event {リマインダー} other {システム通知}}");
   P ("label.notifications.notification_group_label",
      "{name}：{count, plural, =0 {通知なし} other {通知{count, "
      & "number}件}}");
   P ("label.notifications.notification_label",
      "{subject}（{event, select, mention_event {メンション} "
      & "reply_event {返信} assignment_event {割り当て} approval_event "
      & "{承認リクエスト} alert_event {アラート} digest_event "
      & "{ダイジェスト} reminder_event {リマインダー} other "
      & "{システム通知}}）：{state, select, unread_state {未読} "
      & "read_state {既読} archived_state {アーカイブ済み} muted_state "
      & "{ミュート中} snoozed_state {スヌーズ中} other "
      & "{抑制済み}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {未読の通知} read_state "
      & "{既読の通知} archived_state {アーカイブ済みの通知} "
      & "muted_state {ミュート中の通知} snoozed_state "
      & "{スヌーズ中の通知} other {抑制された通知}}");
   P ("label.notifications.snoozed_label", "{name}の通知はスヌーズ中");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {抑制された通知なし} other {通知{count, "
      & "number}件を抑制}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {未読の通知なし} other "
      & "{未読の通知{count, number}件}}");
   P ("label.payments.amount_label", "金額：{amount_text}");
   P ("label.payments.balance_label", "残高：{amount_text}");
   P ("label.payments.chargeback_label", "チャージバック：{amount_text}");
   P ("label.payments.discount_label", "割引：{amount_text}");
   P ("label.payments.due_label", "{amount_text}（期限：{due_text}）");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {請求書なし} other {請求書{count, "
      & "number}件}}");
   P ("label.payments.invoice_label",
      "請求書{number}：{state, select, draft_invoice {下書き} "
      & "open_invoice {未払い} paid_invoice {支払い済み} "
      & "overdue_invoice {期限超過} other {無効}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {下書きの請求書} open_invoice "
      & "{未払いの請求書} paid_invoice {支払い済みの請求書} "
      & "overdue_invoice {期限超過の請求書} other {無効な請求書}}");
   P ("label.payments.method_label",
      "{method, select, card_method {カード払い} bank_transfer_method "
      & "{銀行振込} cash_method {現金払い} wallet_method "
      & "{ウォレット払い} check_method {小切手払い} other "
      & "{その他の方法で支払い}}：{detail}");
   P ("label.payments.paid_label", "{amount_text}（{paid_text}に支払い済み）");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {支払いなし} other {支払い{count, "
      & "number}件}}");
   P ("label.payments.payment_label",
      "{amount_text}の支払い：{state, select, pending_payment "
      & "{保留中} authorized_payment {承認済み} paid_payment {完了} "
      & "failed_payment {失敗} refunded_payment {返金済み} other "
      & "{キャンセル済み}}");
   P ("label.payments.payment_link_label", "{name}の支払いリンク");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {カード} bank_transfer_method "
      & "{銀行振込} cash_method {現金} wallet_method {ウォレット} "
      & "check_method {小切手} other {その他}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {保留中の支払い} "
      & "authorized_payment {承認済みの支払い} paid_payment "
      & "{完了した支払い} failed_payment {失敗した支払い} "
      & "refunded_payment {返金済みの支払い} other "
      & "{キャンセルされた支払い}}");
   P ("label.payments.receipt_label", "領収書{number}");
   P ("label.payments.refund_label",
      "{amount_text}の返金：{state, select, pending_payment {保留中} "
      & "authorized_payment {承認済み} paid_payment {完了} failed_payment "
      & "{失敗} refunded_payment {完了} other {キャンセル済み}}");
   P ("label.payments.subtotal_label", "小計：{amount_text}");
   P ("label.payments.tax_label", "税：{amount_text}");
   P ("label.payments.total_label", "合計：{amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}のアクセス期限：{time_text}");
   P ("label.permissions.grant_label",
      "{subject}に{role, select, owner_role {オーナーロール} "
      & "admin_role {管理者ロール} editor_role {編集者ロール} "
      & "viewer_role {閲覧者ロール} other "
      & "{カスタムロール}}を付与");
   P ("label.permissions.permission_label",
      "{subject}の{action}権限：{state, select, granted {許可} denied "
      & "{拒否} inherited {継承} temporary {一時的なアクセス} "
      & "expired {期限切れ} other {承認が必要}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {許可} denied {拒否} inherited {継承} "
      & "temporary {一時的なアクセス} expired {期限切れ} other "
      & "{承認が必要}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {ポリシーで許可} policy_denied "
      & "{ポリシーで拒否} policy_warning {ポリシー警告} other "
      & "{ポリシー適用外}}");
   P ("label.permissions.revoke_label",
      "{subject}から{role, select, owner_role {オーナーロール} "
      & "admin_role {管理者ロール} editor_role {編集者ロール} "
      & "viewer_role {閲覧者ロール} other "
      & "{カスタムロール}}を取り消し");
   P ("label.permissions.role_label",
      "{role, select, owner_role {オーナー} admin_role {管理者} "
      & "editor_role {編集者} viewer_role {閲覧者} other "
      & "{カスタムロール}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {空} low_utilization {使用率低} "
      & "normal_utilization {使用率正常} high_utilization {使用率高} "
      & "critical_utilization {使用率危険} full_utilization {満杯} other "
      & "{上限超過}}");
   P ("label.schema.array_shape_label",
      "{element_type, select, string_field {文字列} integer_field {整数} "
      & "decimal_field {小数} boolean_field {真偽値} date_field {日付} "
      & "date_time_field {日時} object_field {オブジェクト} array_field "
      & "{配列} enum_field {列挙値} binary_field {バイナリ} null_field "
      & "{null} any_field {任意の値} other "
      & "{不明な値}}の配列{count_known, select, false {} other "
      & "{（{count, number}個）}}");
   P ("label.schema.constraint_label", "{name}制約：{value}");
   P ("label.schema.default_value_label", "フィールド{field_name}の既定値：{value}");
   P ("label.schema.deprecated_field_label", "非推奨のフィールド{name}（{replacement}を使用）");
   P ("label.schema.enum_options_label", "列挙オプション{count, number}個");
   P ("label.schema.example_value_label", "フィールド{field_name}の例：{value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {通常のフィールド} "
      & "deprecated_field {非推奨のフィールド} unknown_field "
      & "{不明なフィールド} read_only_field "
      & "{読み取り専用フィールド} write_only_field "
      & "{書き込み専用フィールド} other {計算フィールド}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {文字列フィールド} integer_field "
      & "{整数フィールド} decimal_field {小数フィールド} "
      & "boolean_field {真偽値フィールド} date_field "
      & "{日付フィールド} date_time_field {日時フィールド} "
      & "object_field {オブジェクトフィールド} array_field "
      & "{配列フィールド} enum_field {列挙フィールド} "
      & "binary_field {バイナリフィールド} null_field "
      & "{nullフィールド} any_field {任意型フィールド} other "
      & "{不明な型のフィールド}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {不足している必須フィールドなし} "
      & "other {不足している必須フィールド{count, number}件}}");
   P ("label.schema.object_shape_label",
      "オブジェクト（フィールド{fields, number}件{required, "
      & "plural, =0 {} other {、必須{required, number}件}}{optional, "
      & "plural, =0 {} other {、任意{optional, number}件}}）");
   P ("label.schema.schema_source_label", "スキーマ{name}、バージョン{version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {スカラー値} object_shape "
      & "{オブジェクト{count, plural, =0 {} other "
      & "{（フィールド{count, number}件）}}} array_shape {配列{count, "
      & "plural, =0 {} other {（項目{count, number}件）}}} map_shape "
      & "{マップ{count, plural, =0 {} other {（エントリ{count, "
      & "number}件）}}} tuple_shape {タプル{count, plural, =0 {} other "
      & "{（項目{count, number}件）}}} union_shape {共用体{count, "
      & "plural, =0 {} other {（型{count, number}個）}}} empty_shape "
      & "{空の形状} other {不明な形状}}");
   P ("label.schema.unknown_field_label", "不明なフィールド{name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {有効なフィルターなし} other "
      & "{有効なフィルター{count, number}件}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {フィルターをクリア} other "
      & "{有効なフィルター{count, number}件をクリア}}");
   P ("label.search.facet_label", "{name}ファセット、選択肢{count, number}件");
   P ("label.search.facet_value_label",
      "{name}、{count, plural, =0 {結果なし} other {結果{count, "
      & "number}件}}{selected, select, false {} other {、選択済み}}");
   P ("label.search.filter_label",
      "{name}：{value}（{state, select, active_filter "
      & "{有効なフィルター} inactive_filter {無効なフィルター} "
      & "other {除外フィルター}}）");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {有効なフィルター} "
      & "inactive_filter {無効なフィルター} other "
      & "{除外フィルター}}");
   P ("label.search.no_results_label", "「{query}」の検索結果はありません");
   P ("label.search.recent_search_label", "最近の検索：「{query}」");
   P ("label.search.saved_search_label",
      "保存した検索：{name}{count, plural, =0 {} other "
      & "{、結果{count, number}件}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {最近の検索なし} other "
      & "{最近の検索{count, number}件}}");
   P ("label.search.search_query_label", "「{query}」を検索");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {結果なし} other {結果{count, number}件}}");
   P ("label.search.search_result_summary_label",
      "「{query}」の検索結果：{count, plural, =0 {なし} other "
      & "{{count, number}件}}");
   P ("label.search.search_scope_label",
      "検索範囲{name}：{count, plural, =0 {結果なし} other "
      & "{結果{count, number}件}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {検索待機中} searching_search "
      & "{検索中} complete_search {検索完了} empty_search "
      & "{検索結果なし} other {検索失敗}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {関連度順に並べ替え} "
      & "ascending_sort {昇順に並べ替え} descending_sort "
      & "{降順に並べ替え} newest_first_sort "
      & "{新しい順に並べ替え} other {古い順に並べ替え}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {関連度順} ascending_sort {昇順} "
      & "descending_sort {降順} newest_first_sort {新しい順} other "
      & "{古い順}}");
   P ("label.search.suggestion_label", "もしかして：「{query}」");
   P ("label.secrets.credential_source_label", "{source}の認証情報{count, number}件");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {値は非表示} masked_value "
      & "{値はマスク済み} suffix_only {末尾のみ表示} other "
      & "{フィンガープリントのみ}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {公開} support_profile "
      & "{サポート} audit_profile {監査} other {デバッグ}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {ローテーション不要} other "
      & "{ローテーションが必要}}{days_old, plural, =0 {} other "
      & "{（{days_old, number}日経過）}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {APIキー} live_api_key {本番用APIキー} "
      & "test_api_key {テスト用APIキー} github_token {GitHubトークン} "
      & "aws_access_key {AWSアクセスキー} google_api_key {Google "
      & "APIキー} slack_token {Slackトークン} npm_token {npmトークン} "
      & "bearer_token {Bearerトークン} jwt_token {JWTトークン} "
      & "basic_auth_credential {Basic認証の資格情報} password_secret "
      & "{パスワード} private_key {秘密鍵} ssh_private_key "
      & "{SSH秘密鍵} webhook_secret {Webhookシークレット} oauth_token "
      & "{OAuthトークン} database_url_secret {データベースURL} "
      & "sha1_fingerprint {SHA-1フィンガープリント} sha256_fingerprint "
      & "{SHA-256フィンガープリント} other {シークレット}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {メールアドレス} phone_value "
      & "{電話番号} url_value {URL} ip_address_value {IPアドレス} "
      & "token_value {トークン} file_path_value {ファイルパス} "
      & "account_id_value {アカウントID} payment_reference_value "
      & "{支払い参照番号} log_field_value {ログフィールド} other "
      & "{機密情報}}");
   P ("label.tables.cell_label",
      "{row, number}行{column, number}列：{state, select, empty_cell {空} "
      & "edited_cell {編集済み} invalid_cell {無効} highlighted_cell "
      & "{強調表示} other {読み取り専用}}");
   P ("label.tables.cell_position_label", "{row, number}行{column, number}列");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {空のセル} edited_cell "
      & "{編集済みのセル} invalid_cell {無効なセル} "
      & "highlighted_cell {強調表示されたセル} other "
      & "{読み取り専用のセル}}");
   P ("label.tables.column_count_label", "{count, plural, =0 {列なし} other {{count, number}列}}");
   P ("label.tables.column_label",
      "{name}（{role, select, text_column {テキスト列} number_column "
      & "{数値列} date_column {日付列} status_column {ステータス列} "
      & "action_column {操作列} other {非表示の列}}）");
   P ("label.tables.column_role_label",
      "{role, select, text_column {テキスト列} number_column {数値列} "
      & "date_column {日付列} status_column {ステータス列} "
      & "action_column {操作列} other {非表示の列}}");
   P ("label.tables.group_label", "{name}：{count, number}行");
   P ("label.tables.row_count_label", "{count, plural, =0 {行なし} other {{count, number}行}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {並べ替えなし} ascending_sort "
      & "{昇順} other {降順}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {並べ替えなし} ascending_sort "
      & "{{column_name}で昇順に並べ替え済み} other "
      & "{{column_name}で降順に並べ替え済み}}");
   P ("label.tables.subtotal_label", "{name}の小計：{value}");
   P ("label.tables.table_size_label", "{rows, number}行×{columns, number}列");
   P ("label.tasks.assignment_label",
      "{assignee}：{state, select, unassigned {割り当て解除} assigned "
      & "{割り当て済み} reassigned {再割り当て済み} watching "
      & "{ウォッチ中} other {タスクの所有者}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {未割り当て} assigned "
      & "{割り当て済み} reassigned {再割り当て済み} watching "
      & "{ウォッチ中} other {タスクの所有者}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {バックログは空} other "
      & "{バックログ：タスク{count, number}件}}");
   P ("label.tasks.blocker_label", "{name}によりブロック中");
   P ("label.tasks.complete_action_label",
      "{count, plural, =1 {タスクを完了} other {タスク{count, "
      & "number}件を完了}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {完了したタスクなし} other "
      & "{完了したタスク{count, number}件}}");
   P ("label.tasks.due_label", "期限：{due_text}");
   P ("label.tasks.estimate_label", "見積もり：{estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {未完了のタスクなし} other "
      & "{未完了のタスク{count, number}件}}");
   P ("label.tasks.overdue_label", "{due_text}から期限超過");
   P ("label.tasks.recurring_task_label", "繰り返し：{schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, =1 {タスクを再開} other {タスク{count, "
      & "number}件を再開}}");
   P ("label.tasks.sprint_label", "{name}：タスク{count, number}件");
   P ("label.tasks.subtask_label", "{name}：サブタスク{count, number}件");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {タスクなし} other {タスク{count, "
      & "number}件}}");
   P ("label.tasks.task_label",
      "{name}：{state, select, open_task {未着手のタスク} "
      & "in_progress_task {進行中のタスク} blocked_task "
      & "{ブロック中のタスク} done_task {完了したタスク} "
      & "canceled_task {キャンセルされたタスク} deferred_task "
      & "{延期されたタスク} other {期限超過のタスク}}{priority, "
      & "select, no_priority {} low_priority {、優先度：低} "
      & "medium_priority {、優先度：中} high_priority "
      & "{、優先度：高} other {、優先度：緊急}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {優先度なし} low_priority "
      & "{優先度：低} medium_priority {優先度：中} high_priority "
      & "{優先度：高} other {優先度：緊急}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {未着手のタスク} in_progress_task "
      & "{進行中のタスク} blocked_task {ブロック中のタスク} "
      & "done_task {完了したタスク} canceled_task "
      & "{キャンセルされたタスク} deferred_task "
      & "{延期されたタスク} other {期限超過のタスク}}");
   P ("label.thresholds.threshold_direction_label", "{direction, select, upper_limit {上限} other {下限}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {想定範囲を下回る} within_range "
      & "{想定範囲内} above_range {想定範囲を上回る} below_target "
      & "{目標未満} at_target {目標どおり} above_target {目標超過} "
      & "near_limit {上限に接近} warning_level {警告しきい値} "
      & "critical_level {重大しきい値} breached {しきい値超過} "
      & "other {しきい値の状態不明}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {最新} other {{ahead, "
      & "number}コミット先行}}} other {{ahead, plural, =0 {{behind, "
      & "number}コミット遅れ} other {{ahead, "
      & "number}コミット先行、{behind, number}コミット遅れ}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {{approver}が承認済み} other "
      & "{{approver}の承認待ち}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, =1 {{attempt, plural, =1 {試行 1/1} other {試行 "
      & "{attempt, number}/1（上限超過）}}} other {試行 {attempt, "
      & "number}/{limit, number}}}");
   P ("label.workflows.blocker_label", "ブロック中：{reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {ブロック中の依存関係なし} other "
      & "{ブロック中の依存関係{count, number}件}}");
   P ("label.workflows.handoff_label", "{from}から{to}への引き継ぎ");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {今後のマイルストーン} "
      & "current_milestone {現在のマイルストーン} complete_milestone "
      & "{完了したマイルストーン} missed_milestone "
      & "{未達のマイルストーン} other "
      & "{ブロック中のマイルストーン}}");
   P ("label.workflows.milestone_status_label",
      "{name}：{state, select, upcoming_milestone {予定} current_milestone "
      & "{現在} complete_milestone {完了} missed_milestone {未達} other "
      & "{ブロック中}}");
   P ("label.workflows.next_action_label", "次：{action}");
   P ("label.workflows.owner_label", "所有者：{owner}");
   P ("label.workflows.resume_label", "{name}を再開");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {保留中} active_step {実行中} "
      & "waiting_step {待機中} blocked_step {ブロック中} done_step "
      & "{完了} failed_step {失敗} other {スキップ}}");
   P ("label.workflows.step_status_label",
      "{name}：{state, select, pending_step {保留中} active_step "
      & "{実行中} waiting_step {待機中} blocked_step {ブロック中} "
      & "done_step {完了} failed_step {失敗} other {スキップ}}");
   P ("label.workflows.waiting_label", "{reason}を待機中");
   P ("label.workflows.workflow_result_label",
      "{name}：{state, select, not_started_state {未開始} "
      & "in_progress_state {進行中} waiting_state {待機中} "
      & "waiting_approval_state {承認待ち} blocked_state {ブロック中} "
      & "completed_state {完了} failed_state {失敗} cancelled_state "
      & "{キャンセル済み} skipped_state {スキップ} other "
      & "{一時停止中}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {未開始} in_progress_state "
      & "{進行中} waiting_state {待機中} waiting_approval_state "
      & "{承認待ち} blocked_state {ブロック中} completed_state "
      & "{完了} failed_state {失敗} cancelled_state {キャンセル済み} "
      & "skipped_state {スキップ} other {一時停止中}}");
end Labels_2;
