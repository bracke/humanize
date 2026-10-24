separate (Humanize.Catalogs.Phrase_Data.Locale_Tr)
procedure Labels_2 is
begin
   P ("label.navigation.section_state_label",
      "{name} bölümü {expanded, select, false {daraltılmış} other "
      & "{genişletilmiş}}{count, plural, =0 {} other {, {count, number} "
      & "öğe}}");
   P ("label.navigation.skip_link_label", "şuraya atla: {target}");
   P ("label.navigation.submenu_label", "{name} alt menüsü, {count, number} öğe");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {tüm uyarılar} important_alerts {önemli "
      & "uyarılar} critical_alerts_only {yalnızca kritik uyarılar} other "
      & "{uyarı yok}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel} bildirimleri: {state, select, preference_enabled {etkin} "
      & "preference_disabled {devre dışı} preference_inherited "
      & "{devralındı} other {zorunlu}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {özet yok} instant_digest {anlık özet} "
      & "daily_digest {günlük özet} other {haftalık özet}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {etkin} preference_disabled {devre "
      & "dışı} preference_inherited {devralındı} other {zorunlu}}");
   P ("label.notification_preferences.quiet_hours_label", "sessiz saatler: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}, {scope, select, thread_subscription {ileti dizisi aboneliği} "
      & "project_subscription {proje aboneliği} team_subscription {ekip "
      & "aboneliği} other {hesap aboneliği}}: {state, select, "
      & "preference_enabled {etkin} preference_disabled {devre dışı} "
      & "preference_inherited {devralındı} other {zorunlu}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {ileti dizisi aboneliği} "
      & "project_subscription {proje aboneliği} team_subscription {ekip "
      & "aboneliği} other {hesap aboneliği}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} sizden bahsetti} reply_event "
      & "{{actor} yanıtladı} assignment_event {{actor} size görev atadı} "
      & "approval_event {{actor} onay istedi} alert_event {{actor} uyarı "
      & "gönderdi} digest_event {{actor} özet gönderdi} reminder_event "
      & "{{actor} anımsatıcı gönderdi} other {{actor} sistem bildirimi "
      & "gönderdi}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {uygulama içi bildirim} "
      & "email_channel {e-posta bildirimi} sms_channel {SMS bildirimi} "
      & "push_channel {anlık bildirim} webhook_channel {webhook bildirimi} "
      & "other {özet bildirimi}}: {state, select, pending_delivery {bekliyor} "
      & "sent_delivery {gönderildi} delivered_delivery {teslim edildi} "
      & "failed_delivery {başarısız} retrying_delivery {yeniden deneniyor} "
      & "other {iptal edildi}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {bekleyen bildirim} sent_delivery "
      & "{gönderilmiş bildirim} delivered_delivery {teslim edilmiş bildirim} "
      & "failed_delivery {başarısız bildirim} retrying_delivery {yeniden "
      & "denenen bildirim} other {iptal edilmiş bildirim}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {bekliyor: {time_text}} sent_delivery "
      & "{gönderildi: {time_text}} delivered_delivery {teslim edildi: "
      & "{time_text}} failed_delivery {başarısız: {time_text}} "
      & "retrying_delivery {yeniden deneniyor: {time_text}} other {iptal "
      & "edildi: {time_text}}}");
   P ("label.notifications.digest_label",
      "{name} özeti: {count, plural, =0 {bildirim yok} other {{count, "
      & "number} bildirim}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {bahsetme yok} other "
      & "{{count, number} bahsetme}}} reply_event {{count, plural, =0 {yanıt "
      & "yok} other {{count, number} yanıt}}} assignment_event {{count, "
      & "plural, =0 {atama yok} other {{count, number} atama}}} approval_event "
      & "{{count, plural, =0 {onay isteği yok} other {{count, number} onay "
      & "isteği}}} alert_event {{count, plural, =0 {uyarı yok} other {{count, "
      & "number} uyarı}}} digest_event {{count, plural, =0 {özet yok} other "
      & "{{count, number} özet}}} reminder_event {{count, plural, =0 "
      & "{anımsatıcı yok} other {{count, number} anımsatıcı}}} other "
      & "{{count, plural, =0 {sistem bildirimi yok} other {{count, number} "
      & "sistem bildirimi}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {bildirimi okundu olarak işaretle} other {{count, "
      & "number} bildirimi okundu olarak işaretle}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {bildirimi okunmadı olarak işaretle} other "
      & "{{count, number} bildirimi okunmadı olarak işaretle}}");
   P ("label.notifications.muted_label", "{name} bildirimleri sessize alındı");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {yeni bahsetme} reply_event {yeni "
      & "yanıt} assignment_event {yeni atama} approval_event {yeni onay "
      & "isteği} alert_event {yeni uyarı} digest_event {yeni özet} "
      & "reminder_event {yeni anımsatıcı} other {yeni sistem bildirimi}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {uygulama içi bildirimler} "
      & "email_channel {e-posta bildirimleri} sms_channel {SMS bildirimleri} "
      & "push_channel {anlık bildirimler} webhook_channel {webhook "
      & "bildirimleri} other {özet bildirimleri}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {bildirim yok} other {{count, number} bildirim}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {bahsetme} reply_event {yanıt} "
      & "assignment_event {atama} approval_event {onay isteği} alert_event "
      & "{uyarı} digest_event {özet} reminder_event {anımsatıcı} other "
      & "{sistem bildirimi}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {bildirim yok} other {{count, number} "
      & "bildirim}}");
   P ("label.notifications.notification_label",
      "{subject}, {event, select, mention_event {bahsetme} reply_event "
      & "{yanıt} assignment_event {atama} approval_event {onay isteği} "
      & "alert_event {uyarı} digest_event {özet} reminder_event "
      & "{anımsatıcı} other {sistem bildirimi}}: {state, select, "
      & "unread_state {okunmadı} read_state {okundu} archived_state "
      & "{arşivlendi} muted_state {sessize alındı} snoozed_state {ertelendi} "
      & "other {bastırıldı}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {okunmamış bildirim} read_state "
      & "{okunmuş bildirim} archived_state {arşivlenmiş bildirim} "
      & "muted_state {sessize alınmış bildirim} snoozed_state {ertelenmiş "
      & "bildirim} other {bastırılmış bildirim}}");
   P ("label.notifications.snoozed_label", "{name} bildirimleri ertelendi");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {bastırılan bildirim yok} other {{count, number} "
      & "bildirim bastırıldı}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {okunmamış bildirim yok} other {{count, number} "
      & "okunmamış bildirim}}");
   P ("label.payments.amount_label", "tutar: {amount_text}");
   P ("label.payments.balance_label", "bakiye: {amount_text}");
   P ("label.payments.chargeback_label", "ters ibraz: {amount_text}");
   P ("label.payments.discount_label", "indirim: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, son ödeme: {due_text}");
   P ("label.payments.invoice_count_label", "{count, plural, =0 {fatura yok} other {{count, number} fatura}}");
   P ("label.payments.invoice_label",
      "fatura {number}: {state, select, draft_invoice {taslak} open_invoice "
      & "{açık} paid_invoice {ödendi} overdue_invoice {vadesi geçmiş} "
      & "other {geçersiz}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {taslak fatura} open_invoice {açık "
      & "fatura} paid_invoice {ödenmiş fatura} overdue_invoice {vadesi "
      & "geçmiş fatura} other {geçersiz fatura}}");
   P ("label.payments.method_label",
      "{method, select, card_method {kartla ödendi} bank_transfer_method "
      & "{banka havalesiyle ödendi} cash_method {nakit ödendi} wallet_method "
      & "{cüzdanla ödendi} check_method {çekle ödendi} other {başka bir "
      & "yöntemle ödendi}}: {detail}");
   P ("label.payments.paid_label", "{amount_text}, ödendi: {paid_text}");
   P ("label.payments.payment_count_label", "{count, plural, =0 {ödeme yok} other {{count, number} ödeme}}");
   P ("label.payments.payment_label",
      "{amount_text}: {state, select, pending_payment {bekleyen ödeme} "
      & "authorized_payment {yetkilendirilmiş ödeme} paid_payment "
      & "{tamamlanmış ödeme} failed_payment {başarısız ödeme} "
      & "refunded_payment {iade edilmiş ödeme} other {iptal edilmiş ödeme}}");
   P ("label.payments.payment_link_label", "{name} ödeme bağlantısı");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {kart} bank_transfer_method {banka "
      & "havalesi} cash_method {nakit} wallet_method {cüzdan} check_method "
      & "{çek} other {diğer}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {bekleyen ödeme} authorized_payment "
      & "{yetkilendirilmiş ödeme} paid_payment {tamamlanmış ödeme} "
      & "failed_payment {başarısız ödeme} refunded_payment {iade edilmiş "
      & "ödeme} other {iptal edilmiş ödeme}}");
   P ("label.payments.receipt_label", "makbuz {number}");
   P ("label.payments.refund_label",
      "{amount_text}: {state, select, pending_payment {bekleyen iade} "
      & "authorized_payment {yetkilendirilmiş iade} paid_payment {ödenmiş "
      & "iade} failed_payment {başarısız iade} refunded_payment "
      & "{tamamlanmış iade} other {iptal edilmiş iade}}");
   P ("label.payments.subtotal_label", "ara toplam: {amount_text}");
   P ("label.payments.tax_label", "vergi: {amount_text}");
   P ("label.payments.total_label", "toplam: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: erişimin süresi doluyor ({time_text})");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {sahip} admin_role {yönetici} "
      & "editor_role {düzenleyici} viewer_role {görüntüleyici} other "
      & "{özel}} rolü verildi");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {verildi} denied "
      & "{reddedildi} inherited {devralındı} temporary {geçici erişim} "
      & "expired {süresi doldu} other {onay gerekiyor}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {verildi} denied {reddedildi} inherited "
      & "{devralındı} temporary {geçici erişim} expired {süresi doldu} "
      & "other {onay gerekiyor}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {ilke izin verdi} policy_denied {ilke "
      & "reddetti} policy_warning {ilke uyarısı} other {ilke uygulanamaz}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {sahip} admin_role {yönetici} "
      & "editor_role {düzenleyici} viewer_role {görüntüleyici} other "
      & "{özel}} rolü kaldırıldı");
   P ("label.permissions.role_label",
      "{role, select, owner_role {sahip} admin_role {yönetici} editor_role "
      & "{düzenleyici} viewer_role {görüntüleyici} other {özel rol}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {boş} low_utilization {düşük "
      & "kullanım} normal_utilization {normal kullanım} high_utilization "
      & "{yüksek kullanım} critical_utilization {kritik kullanım} "
      & "full_utilization {dolu} other {sınır aşıldı}}");
   P ("label.schema.array_shape_label",
      "{element_type, select, string_field {dize} integer_field {tamsayı} "
      & "decimal_field {ondalık sayı} boolean_field {mantıksal değer} "
      & "date_field {tarih} date_time_field {tarih-saat} object_field {nesne} "
      & "array_field {dizi} enum_field {numaralandırma} binary_field {ikili "
      & "veri} null_field {null} any_field {herhangi bir tür} other "
      & "{bilinmeyen tür}} dizisi{count_known, select, false {} other {, "
      & "{count, number} öğe}}");
   P ("label.schema.constraint_label", "{name} kısıtlaması: {value}");
   P ("label.schema.default_value_label", "{field_name} alanı, varsayılan: {value}");
   P ("label.schema.deprecated_field_label",
      "kullanımdan kaldırılmış alan: {name}, bunun yerine {replacement} "
      & "kullanın");
   P ("label.schema.enum_options_label", "{count, plural, other {{count, number} numaralandırma seçeneği}}");
   P ("label.schema.example_value_label", "{field_name} alanı, örnek: {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {normal alan} deprecated_field "
      & "{kullanımdan kaldırılmış alan} unknown_field {bilinmeyen alan} "
      & "read_only_field {salt okunur alan} write_only_field {salt yazılır "
      & "alan} other {hesaplanan alan}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {dize alanı} integer_field {tamsayı "
      & "alanı} decimal_field {ondalık sayı alanı} boolean_field "
      & "{mantıksal alan} date_field {tarih alanı} date_time_field "
      & "{tarih-saat alanı} object_field {nesne alanı} array_field {dizi "
      & "alanı} enum_field {numaralandırma alanı} binary_field {ikili veri "
      & "alanı} null_field {null alanı} any_field {herhangi bir tür alanı} "
      & "other {bilinmeyen tür alanı}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {eksik zorunlu alan yok} other {{count, number} "
      & "zorunlu alan eksik}}");
   P ("label.schema.object_shape_label",
      "{fields, number} alanlı nesne{required, plural, =0 {} other {, "
      & "{required, number} zorunlu}}{optional, plural, =0 {} other {, "
      & "{optional, number} isteğe bağlı}}");
   P ("label.schema.schema_source_label", "{name} şeması, sürüm {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {skaler değer} object_shape {{count, "
      & "plural, =0 {nesne} other {{count, number} alanlı nesne}}} array_shape "
      & "{{count, plural, =0 {dizi} other {{count, number} öğeli dizi}}} "
      & "map_shape {{count, plural, =0 {eşlem} other {{count, number} girdili "
      & "eşlem}}} tuple_shape {{count, plural, =0 {demet} other {{count, "
      & "number} öğeli demet}}} union_shape {{count, plural, =0 {birleşim} "
      & "other {{count, number} türün birleşimi}}} empty_shape {boş şekil} "
      & "other {bilinmeyen şekil}}");
   P ("label.schema.unknown_field_label", "bilinmeyen alan: {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {etkin filtre yok} other {{count, number} etkin "
      & "filtre}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {filtreleri temizle} one {etkin filtreyi temizle} "
      & "other {{count, number} etkin filtreyi temizle}}");
   P ("label.search.facet_label", "{name} özelliği, {count, number} seçenek");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {sonuç yok} other {{count, number} "
      & "sonuç}}{selected, select, true {, seçili} other {}}");
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {etkin filtre} "
      & "inactive_filter {etkin olmayan filtre} other {hariç tutma filtresi}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {etkin filtre} inactive_filter {etkin "
      & "olmayan filtre} other {hariç tutma filtresi}}");
   P ("label.search.no_results_label", "“{query}” için sonuç yok");
   P ("label.search.recent_search_label", "son arama: “{query}”");
   P ("label.search.saved_search_label",
      "kayıtlı arama: {name}{count, plural, =0 {} other {, {count, number} "
      & "sonuç}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {son arama yok} other {{count, number} son arama}}");
   P ("label.search.search_query_label", "“{query}” için ara");
   P ("label.search.search_result_count_label", "{count, plural, =0 {sonuç yok} other {{count, number} sonuç}}");
   P ("label.search.search_result_summary_label",
      "“{query}” için sonuçlar: {count, plural, =0 {sonuç yok} other "
      & "{{count, number} sonuç}}");
   P ("label.search.search_scope_label",
      "{name} kapsamı, {count, plural, =0 {sonuç yok} other {{count, "
      & "number} sonuç}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {arama boşta} searching_search "
      & "{aranıyor} complete_search {arama tamamlandı} empty_search {arama "
      & "sonucu yok} other {arama başarısız}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {alaka düzeyine göre sırala} "
      & "ascending_sort {artan sırala} descending_sort {azalan sırala} "
      & "newest_first_sort {sırala: önce en yeni} other {sırala: önce en "
      & "eski}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {alaka düzeyi} ascending_sort {artan} "
      & "descending_sort {azalan} newest_first_sort {önce en yeni} other "
      & "{önce en eski}}");
   P ("label.search.suggestion_label", "bunu mu demek istediniz: “{query}”?");
   P ("label.secrets.credential_source_label", "{source} kaynağından {count, number} kimlik bilgisi");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {değer gizli} masked_value {değer "
      & "maskelenmiş} suffix_only {yalnızca sonek} other {yalnızca parmak "
      & "izi}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {herkese açık} support_profile "
      & "{destek} audit_profile {denetim} other {hata ayıklama}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, true {yenileme gerekli} other {yenileme "
      & "gerekmiyor}}{days_old, plural, =0 {} other {, {days_old, number} "
      & "günlük}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API anahtarı} live_api_key {canlı API "
      & "anahtarı} test_api_key {test API anahtarı} github_token {GitHub "
      & "belirteci} aws_access_key {AWS erişim anahtarı} google_api_key "
      & "{Google API anahtarı} slack_token {Slack belirteci} npm_token {npm "
      & "belirteci} bearer_token {bearer belirteci} jwt_token {JWT belirteci} "
      & "basic_auth_credential {temel kimlik doğrulama bilgisi} "
      & "password_secret {parola} private_key {özel anahtar} ssh_private_key "
      & "{SSH özel anahtarı} webhook_secret {webhook gizli anahtarı} "
      & "oauth_token {OAuth belirteci} database_url_secret {gizli veritabanı "
      & "URL’si} sha1_fingerprint {SHA-1 parmak izi} sha256_fingerprint "
      & "{SHA-256 parmak izi} other {gizli bilgi}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-posta} phone_value {telefon} url_value "
      & "{URL} ip_address_value {IP adresi} token_value {belirteç} "
      & "file_path_value {dosya yolu} account_id_value {hesap kimliği} "
      & "payment_reference_value {ödeme referansı} log_field_value {günlük "
      & "alanı} other {hassas değer}}");
   P ("label.tables.cell_label",
      "satır {row, number}, sütun {column, number}: {state, select, "
      & "empty_cell {boş} edited_cell {düzenlendi} invalid_cell {geçersiz} "
      & "highlighted_cell {vurgulandı} other {salt okunur}}");
   P ("label.tables.cell_position_label", "satır {row, number}, sütun {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {boş hücre} edited_cell {düzenlenmiş "
      & "hücre} invalid_cell {geçersiz hücre} highlighted_cell "
      & "{vurgulanmış hücre} other {salt okunur hücre}}");
   P ("label.tables.column_count_label", "{count, plural, =0 {sütun yok} other {{count, number} sütun}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {metin sütunu} number_column "
      & "{sayı sütunu} date_column {tarih sütunu} status_column {durum "
      & "sütunu} action_column {eylem sütunu} other {gizli sütun}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {metin sütunu} number_column {sayı "
      & "sütunu} date_column {tarih sütunu} status_column {durum sütunu} "
      & "action_column {eylem sütunu} other {gizli sütun}}");
   P ("label.tables.group_label", "{name}: {count, number} satır");
   P ("label.tables.row_count_label", "{count, plural, =0 {satır yok} other {{count, number} satır}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {sıralanmamış} ascending_sort {artan} "
      & "other {azalan}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {sıralanmamış} ascending_sort "
      & "{{column_name} sütununa göre artan} other {{column_name} sütununa "
      & "göre azalan}}");
   P ("label.tables.subtotal_label", "{name} ara toplamı: {value}");
   P ("label.tables.table_size_label", "{rows, number} satır × {columns, number} sütun");
   P ("label.tasks.assignment_label",
      "{assignee}: {state, select, unassigned {atanmadı} assigned {atandı} "
      & "reassigned {yeniden atandı} watching {izliyor} other {görevin "
      & "sahibi}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {atanmamış} assigned {atandı} reassigned "
      & "{yeniden atandı} watching {izliyor} other {görevin sahibi}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {iş listesi boş} other {iş listesi: {count, "
      & "number} görev}}");
   P ("label.tasks.blocker_label", "{name} tarafından engellendi");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {görevi tamamla} other {{count, number} görevi "
      & "tamamla}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {tamamlanan görev yok} other {{count, number} "
      & "tamamlanan görev}}");
   P ("label.tasks.due_label", "son tarih: {due_text}");
   P ("label.tasks.estimate_label", "tahmini: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {açık görev yok} other {{count, number} açık "
      & "görev}}");
   P ("label.tasks.overdue_label", "süresi geçti, son tarih: {due_text}");
   P ("label.tasks.recurring_task_label", "tekrar: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {görevi yeniden aç} other {{count, number} "
      & "görevi yeniden aç}}");
   P ("label.tasks.sprint_label", "{name}: {count, number} görev");
   P ("label.tasks.subtask_label", "{name}: {count, number} alt görev");
   P ("label.tasks.task_count_label", "{count, plural, =0 {görev yok} other {{count, number} görev}}");
   P ("label.tasks.task_label",
      "{name}: {priority, select, no_priority {} low_priority {düşük "
      & "öncelikli } medium_priority {orta öncelikli } high_priority {yüksek "
      & "öncelikli } other {kritik öncelikli }}{state, select, open_task "
      & "{açık görev} in_progress_task {devam eden görev} blocked_task "
      & "{engellenmiş görev} done_task {tamamlanmış görev} canceled_task "
      & "{iptal edilmiş görev} deferred_task {ertelenmiş görev} other "
      & "{gecikmiş görev}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {öncelik yok} low_priority {düşük "
      & "öncelik} medium_priority {orta öncelik} high_priority {yüksek "
      & "öncelik} other {kritik öncelik}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {açık görev} in_progress_task {devam eden "
      & "görev} blocked_task {engellenmiş görev} done_task {tamamlanmış "
      & "görev} canceled_task {iptal edilmiş görev} deferred_task "
      & "{ertelenmiş görev} other {gecikmiş görev}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {üst sınır} other {alt sınır}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {beklenen aralığın altında} "
      & "within_range {beklenen aralıkta} above_range {beklenen aralığın "
      & "üstünde} below_target {hedefin altında} at_target {hedefte} "
      & "above_target {hedefin üstünde} near_limit {sınıra yakın} "
      & "warning_level {uyarı eşiği} critical_level {kritik eşik} breached "
      & "{eşik aşıldı} other {bilinmeyen eşik durumu}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {güncel} other {{ahead, "
      & "number} commit önde}}} other {{ahead, plural, =0 {} other {{ahead, "
      & "number} commit önde, }}{behind, number} commit geride}}");
   P ("label.workflows.approval_label",
      "{waiting, select, true {onay bekleniyor: {approver}} other {onaylayan: "
      & "{approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {deneme 1/1} other {deneme "
      & "{attempt, number}/1, sınır aşıldı}}} other {deneme {attempt, "
      & "number}/{limit, number}}}");
   P ("label.workflows.blocker_label", "engellendi: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {engelleyen bağımlılık yok} other {{count, "
      & "number} engelleyen bağımlılık}}");
   P ("label.workflows.handoff_label", "devir: {from} → {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {yaklaşan kilometre taşı} "
      & "current_milestone {geçerli kilometre taşı} complete_milestone "
      & "{tamamlanan kilometre taşı} missed_milestone {kaçırılan kilometre "
      & "taşı} other {engellenen kilometre taşı}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {yaklaşıyor} "
      & "current_milestone {geçerli} complete_milestone {tamamlandı} "
      & "missed_milestone {kaçırıldı} other {engellendi}}");
   P ("label.workflows.next_action_label", "sonraki: {action}");
   P ("label.workflows.owner_label", "sahibi: {owner}");
   P ("label.workflows.resume_label", "sürdür: {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {beklemede} active_step {etkin} "
      & "waiting_step {bekliyor} blocked_step {engellendi} done_step "
      & "{tamamlandı} failed_step {başarısız} other {atlandı}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {beklemede} active_step {etkin} "
      & "waiting_step {bekliyor} blocked_step {engellendi} done_step "
      & "{tamamlandı} failed_step {başarısız} other {atlandı}}");
   P ("label.workflows.waiting_label", "bekleniyor: {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {başlamadı} "
      & "in_progress_state {devam ediyor} waiting_state {bekliyor} "
      & "waiting_approval_state {onay bekliyor} blocked_state {engellendi} "
      & "completed_state {tamamlandı} failed_state {başarısız} "
      & "cancelled_state {iptal edildi} skipped_state {atlandı} other "
      & "{duraklatıldı}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {başlamadı} in_progress_state "
      & "{devam ediyor} waiting_state {bekliyor} waiting_approval_state {onay "
      & "bekliyor} blocked_state {engellendi} completed_state {tamamlandı} "
      & "failed_state {başarısız} cancelled_state {iptal edildi} "
      & "skipped_state {atlandı} other {duraklatıldı}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {saydam} mostly_transparent "
      & "{çoğunlukla saydam} translucent {yarı saydam} mostly_opaque "
      & "{çoğunlukla opak} other {opak}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {gözlem yok} other {{count, number} gözlem, en "
      & "düşük {minimum} {unit}, medyan {median} {unit}, en yüksek "
      & "{maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {gözlem yok} other {{total, "
      & "number} gözlemde 0 aykırı değer}}} one {{total, number} gözlemde "
      & "1 aykırı değer} other {{total, number} gözlemde {outliers, number} "
      & "aykırı değer}}");
   P ("label.resources.remaining_label",
      "{state, select, over {kapasite {count, number} {unit} aşıldı} other "
      & "{{total, number} {unit} içinden {count, number} {unit} kaldı}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {kota {count, number} {unit} aşıldı "
      & "({percent} kullanıldı)} near {kota sınıra yakın: {count, number} "
      & "{unit} kaldı ({percent} kullanıldı)} other {kota kullanılabilir: "
      & "{count, number} {unit} kaldı ({percent} kullanıldı)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {önbellek isabet oranı yok: istek yok} other "
      & "{önbellek isabet oranı {percent}: {hits, number} isabet, {misses, "
      & "number} ıska}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {1 öznitelik} other {{count, number} öznitelik}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {1 data özniteliği} other {{count, number} data "
      & "özniteliği}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {1 ARIA özniteliği} other {{count, number} ARIA "
      & "özniteliği}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {1 olay işleyici} other {{count, number} olay "
      & "işleyici}}");
   P ("label.markup.heading_label", "başlık düzeyi {level, number}");
   P ("label.markup.tag_count_label.total", "{count, plural, one {1 etiket} other {{count, number} etiket}}");
   P ("label.markup.tag_count_label.links", "{count, plural, one {1 bağlantı} other {{count, number} bağlantı}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {1 medya öğesi} other {{count, number} medya "
      & "öğesi}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {1 form denetimi} other {{count, number} form "
      & "denetimi}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {1 başlık} other {{count, number} başlık}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {1 yer işareti} other {{count, number} yer "
      & "işareti}}");
   P ("label.markup.document_outline_label.forms", "{count, plural, one {1 form} other {{count, number} form}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {1 medya öğesi} other {{count, number} medya "
      & "öğesi}}");
   P ("label.markup.table_navigation_label",
      "{caption} satır {row, number}/{rows, number}, sütun {column, "
      & "number}/{columns, number}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {1 gizli değer} other {{count, number} gizli "
      & "değer}}");
   P ("label.secrets.secret_count_label.masked", "{count, number} maskelenmiş");
   P ("label.secrets.secret_count_label.unset", "{count, number} ayarlanmamış");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {1 parmak izi} other {{count, number} parmak izi}}");
   P ("label.schema.type_mismatch_label",
      "{field_name} alanı: beklenen {expected, select, string_field {dize} "
      & "integer_field {tamsayı} decimal_field {ondalık} boolean_field "
      & "{mantıksal} date_field {tarih} date_time_field {tarih-saat} "
      & "object_field {nesne} array_field {dizi} enum_field {numaralandırma} "
      & "binary_field {ikili} null_field {null} any_field {herhangi} other "
      & "{bilinmeyen}}, gelen {actual, select, string_field {dize} "
      & "integer_field {tamsayı} decimal_field {ondalık} boolean_field "
      & "{mantıksal} date_field {tarih} date_time_field {tarih-saat} "
      & "object_field {nesne} array_field {dizi} enum_field {numaralandırma} "
      & "binary_field {ikili} null_field {null} any_field {herhangi} other "
      & "{bilinmeyen}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {1 engelleyici "
      & "sorun} other {{blocking, number} engelleyici sorun}}} blocking "
      & "{{base}, {blocking, plural, one {1 engelleyici sorun} other "
      & "{{blocking, number} engelleyici sorun}}} only {yalnızca {base}} other "
      & "{{base}}}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {hedef aralık {low} – {high}} "
      & "other {hedef pencere {low} – {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} beklenen aralıkta} below {{value} "
      & "beklenen aralığın altında} other {{value} beklenen aralığın "
      & "üstünde}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} kritik eşikte} warning {{value} "
      & "uyarı eşiğinde} other {{value} normal aralıkta}}");
   P ("label.thresholds.breach_label", "{state, select, ok {aşılmadı} other {{difference} aşıldı}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {hedefte} below {hedefin {difference} altında} "
      & "other {hedefin {difference} üstünde}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {sınır aşıldı} near {sınıra yakın, "
      & "{distance} kaldı} other {sınıra {distance}}}");
   P ("label.thresholds.threshold_summary_label.none", "metrik yok");
   P ("label.thresholds.threshold_summary_label.normal", "{count, number} normal");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {1 uyarı} other {{count, number} uyarı}}");
   P ("label.thresholds.threshold_summary_label.critical", "{count, number} kritik");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {1 aşım} other {{count, number} aşım}}");
   P ("label.thresholds.target_window_label", "hedef {target} ± {tolerance}");
   P ("label.thresholds.tolerance_label", "tolerans {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "sınırın {percent} kadarı");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {sınır {amount} aşıldı} other {{amount} "
      & "kaldı}}");
   P ("label.thresholds.budget_used_label", "{budget} bütçeden {used} kullanıldı");
   P ("label.workflows.step_label", "adım {current, number}/{total, number}: {name}");
   P ("label.workflows.milestone_label", "{current, number}/{total, number} kilometre taşı tamamlandı: {name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {iş akışı öğesi yok} half {iş akışının "
      & "yarısı tamamlandı} other {{completed, number}/{total, number} "
      & "tamamlandı}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {kuyruk sırası {position, number}} other {kuyruk "
      & "sırası {position, number}/{total, number}}}");
   P ("label.changes.change_set_label.none", "değişiklik yok");
   P ("label.changes.change_set_label.added", "{count, number} eklendi");
   P ("label.changes.change_set_label.removed", "{count, number} kaldırıldı");
   P ("label.changes.change_set_label.modified", "{count, number} değişti");
   P ("label.changes.change_set_label.unchanged", "{count, number} değişmedi");
   P ("label.changes.sync_change_label.none", "eşitleme değişikliği yok");
   P ("label.changes.sync_change_label.uploaded", "{count, number} yüklendi");
   P ("label.changes.sync_change_label.downloaded", "{count, number} indirildi");
   P ("label.changes.sync_change_label.deleted", "{count, number} silindi");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {1 çakışma} other {{count, number} çakışma}}");
   P ("label.changes.net_change_label",
      "{state, select, none {net değişiklik yok} up {net +{count, plural, "
      & "one {1 öğe} other {{count, number} öğe}}} other {net -{count, "
      & "plural, one {1 öğe} other {{count, number} öğe}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {incelenecek değişiklik yok} all {tüm "
      & "değişiklikler incelendi} other {{reviewed, number}/{total, number} "
      & "değişiklik incelendi}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} değişmedi: {new_value}} up "
      & "{{field_name} {old_value} değerinden {new_value} değerine yükseldi} "
      & "other {{field_name} {old_value} değerinden {new_value} değerine "
      & "düştü}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {seçilebilir satır yok} none {satır "
      & "seçilmedi} all {{total, plural, one {1 satır} other {{total, number} "
      & "satırın tümü}} seçildi} other {{selected, number}/{total, number} "
      & "satır seçildi}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {sayfa yok} other {{pages, plural, =0 {sayfa yok} "
      & "other {{rows, plural, =0 {sayfa {page, number}/{pages, number}} one "
      & "{sayfa {page, number}/{pages, number}, 1 satır} other {sayfa {page, "
      & "number}/{pages, number}, {rows, number} satır}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {satır yok} none {eşleşen satır yok} all "
      & "{{total, plural, one {1 satır} other {{total, number} satırın "
      & "tümü}} görünür} other {{visible, number}/{total, number} satır "
      & "görünür}}");
   P ("label.tables.row_range_label",
      "{state, select, none {satır yok} single {satır {first_row, "
      & "number}/{total, number}} other {satır {first_row, number}-{last_row, "
      & "number}/{total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {karakter sınırı yok} none_left {karakter "
      & "kalmadı} left {{count, plural, one {1 karakter} other {{count, "
      & "number} karakter}} kaldı} other {sınır {count, plural, one {1 "
      & "karakter} other {{count, number} karakter}} aşıldı}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {zorunlu alan yok} one {{missing, plural, =0 {tüm "
      & "zorunlu alanlar dolu} other {1/1 zorunlu alan eksik}}} other "
      & "{{missing, plural, =0 {tüm zorunlu alanlar dolu} other {{missing, "
      & "number}/{total, number} zorunlu alan eksik}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {alan yok} all {tüm alanlar tamamlandı} other "
      & "{{completed, number}/{total, number} alan tamamlandı}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: alan yok} all {{name}: tüm alanlar "
      & "tamamlandı} other {{name}: {completed, number}/{total, number} alan "
      & "tamamlandı}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {form adımı yok} one {adım 1/1: {name}} other "
      & "{adım {current, number}/{total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {içerik haritası yok} one {içerik haritası 1/1: "
      & "{name}} other {içerik haritası {current, number}/{total, number}: "
      & "{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {sekme yok} one {sekme 1/1: {name}} other {sekme "
      & "{current, number}/{total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {gelen kutusu boş} one {{unread, plural, =0 {tüm "
      & "bildirimler okundu} other {1/1 bildirim okunmamış}}} other {{unread, "
      & "plural, =0 {tüm bildirimler okundu} other {{unread, number}/{total, "
      & "number} bildirim okunmamış}}}}");
   P ("label.notifications.delivery_attempt_label", "teslim denemesi {attempt, number}/{max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {kontrol listesi öğesi yok} one {{done, plural, "
      & "=0 {0/1 öğe tamamlandı} other {1/1 öğe tamamlandı}}} other "
      & "{{done, number}/{total, number} öğe tamamlandı}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {yükleme yok} one {{done, plural, =0 {0/1 yükleme "
      & "tamamlandı} other {1/1 yükleme tamamlandı}}} other {{done, "
      & "number}/{total, number} yükleme tamamlandı}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {kapasite yok} one {{reserved, plural, =0 {0/1 "
      & "koltuk ayrıldı} other {1/1 koltuk ayrıldı}}} other {{reserved, "
      & "number}/{capacity, number} koltuk ayrıldı}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {bekleme listesi sırası {position, number}} other "
      & "{bekleme listesi sırası {position, number}/{total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} değişti} other {{name}: {changed, number} değişti, "
      & "{unchanged, number} değişmedi, toplam {total, number}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "mevcut ön plan {v1}:{v2, number} oranında büyük metin "
      & "kontrastını karşılıyor");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "mevcut ön plan {v1}:{v2, number} oranında normal metin kontrastını "
      & "karşılıyor");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "{v2, number}:{v3, number} gelişmiş metin kontrastı için {v1} "
      & "kullanın");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "{v2, number}:{v3, number} büyük metin kontrastı için {v1} "
      & "kullanın");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "{v2}:{v3, number} normal metin kontrastı için {v1} kullanın");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "{v2}:{v3, number} büyük metin kontrastı için {v1} kullanın");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "{v2}:{v3, number} gelişmiş metin kontrastı için {v1} kullanın");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "mevcut ön plan {v1, number}:{v2, number} oranında büyük metin "
      & "kontrastını karşılıyor");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "mevcut ön plan {v1, number}:{v2, number} oranında normal metin "
      & "kontrastını karşılıyor");
end Labels_2;
