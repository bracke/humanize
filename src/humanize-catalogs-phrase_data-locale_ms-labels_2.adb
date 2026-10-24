separate (Humanize.Catalogs.Phrase_Data.Locale_Ms)
procedure Labels_2 is
begin
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {pemberitahuan belum selesai} "
      & "sent_delivery {pemberitahuan dihantar} delivered_delivery "
      & "{pemberitahuan diterima} failed_delivery {pemberitahuan gagal} "
      & "retrying_delivery {pemberitahuan sedang dicuba semula} other "
      & "{pemberitahuan dibatalkan}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {belum selesai {time_text}} "
      & "sent_delivery {dihantar {time_text}} delivered_delivery {diterima "
      & "{time_text}} failed_delivery {gagal {time_text}} retrying_delivery "
      & "{dicuba semula {time_text}} other {dibatalkan {time_text}}}");
   P ("label.notifications.digest_label",
      "ringkasan {name}: {count, plural, =0 {tiada pemberitahuan} other "
      & "{{count, number} pemberitahuan}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {tiada sebutan} "
      & "other {{count, number} sebutan}}} reply_event {{count, plural, =0 "
      & "{tiada balasan} other {{count, number} balasan}}} assignment_event "
      & "{{count, plural, =0 {tiada tugasan} other {{count, number} tugasan}}} "
      & "approval_event {{count, plural, =0 {tiada permintaan kelulusan} other "
      & "{{count, number} permintaan kelulusan}}} alert_event {{count, plural, "
      & "=0 {tiada amaran} other {{count, number} amaran}}} digest_event "
      & "{{count, plural, =0 {tiada ringkasan} other {{count, number} "
      & "ringkasan}}} reminder_event {{count, plural, =0 {tiada peringatan} "
      & "other {{count, number} peringatan}}} other {{count, plural, =0 {tiada "
      & "pemberitahuan sistem} other {{count, number} pemberitahuan sistem}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, =1 {tandakan pemberitahuan sebagai dibaca} other "
      & "{tandakan {count, number} pemberitahuan sebagai dibaca}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, =1 {tandakan pemberitahuan sebagai belum dibaca} other "
      & "{tandakan {count, number} pemberitahuan sebagai belum dibaca}}");
   P ("label.notifications.muted_label", "pemberitahuan {name} diredamkan");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {sebutan baharu} reply_event {balasan "
      & "baharu} assignment_event {tugasan baharu} approval_event {permintaan "
      & "kelulusan baharu} alert_event {amaran baharu} digest_event {ringkasan "
      & "baharu} reminder_event {peringatan baharu} other {pemberitahuan sistem "
      & "baharu}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {pemberitahuan dalam apl} "
      & "email_channel {pemberitahuan e-mel} sms_channel {pemberitahuan SMS} "
      & "push_channel {pemberitahuan tolak} webhook_channel {pemberitahuan "
      & "webhook} other {pemberitahuan ringkasan}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {tiada pemberitahuan} other {{count, number} "
      & "pemberitahuan}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {sebutan} reply_event {balasan} "
      & "assignment_event {tugasan} approval_event {permintaan kelulusan} "
      & "alert_event {amaran} digest_event {ringkasan} reminder_event "
      & "{peringatan} other {pemberitahuan sistem}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {tiada pemberitahuan} other {{count, "
      & "number} pemberitahuan}}");
   P ("label.notifications.notification_label",
      "{subject}, {event, select, mention_event {sebutan} reply_event "
      & "{balasan} assignment_event {tugasan} approval_event {permintaan "
      & "kelulusan} alert_event {amaran} digest_event {ringkasan} "
      & "reminder_event {peringatan} other {pemberitahuan sistem}}: {state, "
      & "select, unread_state {belum dibaca} read_state {dibaca} archived_state "
      & "{diarkibkan} muted_state {diredamkan} snoozed_state {ditunda} other "
      & "{disekat}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {pemberitahuan belum dibaca} read_state "
      & "{pemberitahuan dibaca} archived_state {pemberitahuan diarkibkan} "
      & "muted_state {pemberitahuan diredamkan} snoozed_state {pemberitahuan "
      & "ditunda} other {pemberitahuan disekat}}");
   P ("label.notifications.snoozed_label", "pemberitahuan {name} ditunda");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {tiada pemberitahuan disekat} other {{count, "
      & "number} pemberitahuan disekat}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {tiada pemberitahuan belum dibaca} other {{count, "
      & "number} pemberitahuan belum dibaca}}");
   P ("label.payments.amount_label", "amaun {amount_text}");
   P ("label.payments.balance_label", "baki {amount_text}");
   P ("label.payments.chargeback_label", "caj balik {amount_text}");
   P ("label.payments.discount_label", "diskaun {amount_text}");
   P ("label.payments.due_label", "{amount_text} perlu dibayar {due_text}");
   P ("label.payments.invoice_count_label", "{count, plural, =0 {tiada invois} other {{count, number} invois}}");
   P ("label.payments.invoice_label",
      "invois {number}: {state, select, draft_invoice {draf} open_invoice "
      & "{terbuka} paid_invoice {dibayar} overdue_invoice {tertunggak} other "
      & "{dibatalkan}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {draf invois} open_invoice {invois "
      & "terbuka} paid_invoice {invois dibayar} overdue_invoice {invois "
      & "tertunggak} other {invois dibatalkan}}");
   P ("label.payments.method_label",
      "{method, select, card_method {dibayar dengan kad} bank_transfer_method "
      & "{dibayar melalui pindahan bank} cash_method {dibayar secara tunai} "
      & "wallet_method {dibayar dengan e-dompet} check_method {dibayar dengan "
      & "cek} other {dibayar dengan kaedah lain}}: {detail}");
   P ("label.payments.paid_label", "{amount_text} dibayar {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {tiada pembayaran} other {{count, number} "
      & "pembayaran}}");
   P ("label.payments.payment_label",
      "{amount_text}: pembayaran {state, select, pending_payment {belum "
      & "selesai} authorized_payment {dibenarkan} paid_payment {berjaya} "
      & "failed_payment {gagal} refunded_payment {dibayar balik} other "
      & "{dibatalkan}}");
   P ("label.payments.payment_link_label", "pautan pembayaran {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {kad} bank_transfer_method {pindahan "
      & "bank} cash_method {tunai} wallet_method {e-dompet} check_method {cek} "
      & "other {lain-lain}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {pembayaran belum selesai} "
      & "authorized_payment {pembayaran dibenarkan} paid_payment {pembayaran "
      & "berjaya} failed_payment {pembayaran gagal} refunded_payment "
      & "{pembayaran dibayar balik} other {pembayaran dibatalkan}}");
   P ("label.payments.receipt_label", "resit {number}");
   P ("label.payments.refund_label",
      "{amount_text}: bayaran balik {state, select, pending_payment {belum "
      & "selesai} authorized_payment {dibenarkan} paid_payment {dibayar} "
      & "failed_payment {gagal} refunded_payment {selesai} other {dibatalkan}}");
   P ("label.payments.subtotal_label", "subjumlah {amount_text}");
   P ("label.payments.tax_label", "cukai {amount_text}");
   P ("label.payments.total_label", "jumlah {amount_text}");
   P ("label.permissions.access_expiry_label", "akses {subject} tamat tempoh {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: diberi peranan {role, select, owner_role {pemilik} "
      & "admin_role {pentadbir} editor_role {penyunting} viewer_role {pemapar} "
      & "other {tersuai}}");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {diberikan} denied "
      & "{ditolak} inherited {diwarisi} temporary {akses sementara} expired "
      & "{tamat tempoh} other {memerlukan kelulusan}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {diberikan} denied {ditolak} inherited "
      & "{diwarisi} temporary {akses sementara} expired {tamat tempoh} other "
      & "{memerlukan kelulusan}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {dibenarkan oleh dasar} policy_denied "
      & "{ditolak oleh dasar} policy_warning {amaran dasar} other {dasar tidak "
      & "berkenaan}}");
   P ("label.permissions.revoke_label",
      "{subject}: peranan {role, select, owner_role {pemilik} admin_role "
      & "{pentadbir} editor_role {penyunting} viewer_role {pemapar} other "
      & "{tersuai}} dibatalkan");
   P ("label.permissions.role_label",
      "{role, select, owner_role {pemilik} admin_role {pentadbir} editor_role "
      & "{penyunting} viewer_role {pemapar} other {peranan tersuai}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {kosong} low_utilization {penggunaan "
      & "rendah} normal_utilization {penggunaan normal} high_utilization "
      & "{penggunaan tinggi} critical_utilization {penggunaan kritikal} "
      & "full_utilization {penuh} other {melebihi had}}");
   P ("label.schema.array_shape_label",
      "tatasusunan {element_type, select, string_field {rentetan} "
      & "integer_field {integer} decimal_field {perpuluhan} boolean_field "
      & "{boolean} date_field {tarikh} date_time_field {tarikh-masa} "
      & "object_field {objek} array_field {tatasusunan} enum_field {enum} "
      & "binary_field {binari} null_field {null} any_field {sebarang jenis} "
      & "other {jenis tidak diketahui}}{count_known, select, false {} other {, "
      & "{count, number} item}}");
   P ("label.schema.constraint_label", "kekangan {name}: {value}");
   P ("label.schema.default_value_label", "medan {field_name}, nilai lalai {value}");
   P ("label.schema.deprecated_field_label", "medan usang {name}, gunakan {replacement}");
   P ("label.schema.enum_options_label", "{count, plural, other {{count, number} pilihan enum}}");
   P ("label.schema.example_value_label", "medan {field_name}, contoh {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {medan biasa} deprecated_field {medan "
      & "usang} unknown_field {medan tidak diketahui} read_only_field {medan "
      & "baca sahaja} write_only_field {medan tulis sahaja} other {medan "
      & "terkira}}");
   P ("label.schema.field_type_label",
      "medan {kind, select, string_field {rentetan} integer_field {integer} "
      & "decimal_field {perpuluhan} boolean_field {boolean} date_field {tarikh} "
      & "date_time_field {tarikh-masa} object_field {objek} array_field "
      & "{tatasusunan} enum_field {enum} binary_field {binari} null_field "
      & "{null} any_field {sebarang jenis} other {jenis tidak diketahui}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {tiada medan wajib yang hilang} other {{count, "
      & "number} medan wajib hilang}}");
   P ("label.schema.object_shape_label",
      "objek dengan {fields, number} medan{required, plural, =0 {} other {, "
      & "{required, number} wajib}}{optional, plural, =0 {} other {, {optional, "
      & "number} pilihan}}");
   P ("label.schema.schema_source_label", "skema {name} versi {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {nilai skalar} object_shape {{count, "
      & "plural, =0 {objek} other {objek dengan {count, number} medan}}} "
      & "array_shape {{count, plural, =0 {tatasusunan} other {tatasusunan "
      & "dengan {count, number} item}}} map_shape {{count, plural, =0 {peta} "
      & "other {peta dengan {count, number} entri}}} tuple_shape {{count, "
      & "plural, =0 {tupel} other {tupel dengan {count, number} item}}} "
      & "union_shape {{count, plural, =0 {kesatuan} other {kesatuan {count, "
      & "number} jenis}}} empty_shape {bentuk kosong} other {bentuk tidak "
      & "diketahui}}");
   P ("label.schema.unknown_field_label", "medan tidak diketahui {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {tiada penapis aktif} other {{count, number} "
      & "penapis aktif}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {kosongkan penapis} =1 {kosongkan penapis aktif} "
      & "other {kosongkan {count, number} penapis aktif}}");
   P ("label.search.facet_label", "faset {name}, {count, number} pilihan");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {tiada hasil} other {{count, number} "
      & "hasil}}{selected, select, true {, dipilih} other {}}");
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {penapis aktif} "
      & "inactive_filter {penapis tidak aktif} other {penapis pengecualian}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {penapis aktif} inactive_filter {penapis "
      & "tidak aktif} other {penapis pengecualian}}");
   P ("label.search.no_results_label", "tiada hasil untuk “{query}”");
   P ("label.search.recent_search_label", "carian terkini: “{query}”");
   P ("label.search.saved_search_label",
      "carian disimpan: {name}{count, plural, =0 {} other {, {count, number} "
      & "hasil}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {tiada carian terkini} other {{count, number} "
      & "carian terkini}}");
   P ("label.search.search_query_label", "cari “{query}”");
   P ("label.search.search_result_count_label", "{count, plural, =0 {tiada hasil} other {{count, number} hasil}}");
   P ("label.search.search_result_summary_label",
      "hasil untuk “{query}”: {count, plural, =0 {tiada hasil} other "
      & "{{count, number} hasil}}");
   P ("label.search.search_scope_label",
      "skop {name}, {count, plural, =0 {tiada hasil} other {{count, number} "
      & "hasil}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {carian melahu} searching_search {sedang "
      & "mencari} complete_search {carian selesai} empty_search {tiada hasil "
      & "carian} other {carian gagal}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {isih mengikut kaitan} ascending_sort "
      & "{isih secara menaik} descending_sort {isih secara menurun} "
      & "newest_first_sort {isih terbaharu dahulu} other {isih terlama dahulu}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {kaitan} ascending_sort {menaik} "
      & "descending_sort {menurun} newest_first_sort {terbaharu dahulu} other "
      & "{terlama dahulu}}");
   P ("label.search.suggestion_label", "adakah anda maksudkan “{query}”?");
   P ("label.secrets.credential_source_label", "{count, number} bukti kelayakan daripada {source}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {nilai disembunyikan} masked_value "
      & "{nilai disamarkan} suffix_only {akhiran sahaja} other {cap jari "
      & "sahaja}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {awam} support_profile {sokongan} "
      & "audit_profile {audit} other {nyahpepijat}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, true {putaran diperlukan} other {putaran "
      & "tidak diperlukan}}{days_old, plural, =0 {} other {, berusia {days_old, "
      & "number} hari}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {kunci API} live_api_key {kunci API langsung} "
      & "test_api_key {kunci API ujian} github_token {token GitHub} "
      & "aws_access_key {kunci akses AWS} google_api_key {kunci API Google} "
      & "slack_token {token Slack} npm_token {token npm} bearer_token {token "
      & "pembawa} jwt_token {token JWT} basic_auth_credential {bukti kelayakan "
      & "pengesahan asas} password_secret {kata laluan} private_key {kunci "
      & "peribadi} ssh_private_key {kunci peribadi SSH} webhook_secret {rahsia "
      & "webhook} oauth_token {token OAuth} database_url_secret {URL pangkalan "
      & "data rahsia} sha1_fingerprint {cap jari SHA-1} sha256_fingerprint {cap "
      & "jari SHA-256} other {rahsia}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-mel} phone_value {telefon} url_value "
      & "{URL} ip_address_value {alamat IP} token_value {token} file_path_value "
      & "{laluan fail} account_id_value {ID akaun} payment_reference_value "
      & "{rujukan pembayaran} log_field_value {medan log} other {nilai "
      & "sensitif}}");
   P ("label.tables.cell_label",
      "baris {row, number}, lajur {column, number}: {state, select, "
      & "empty_cell {kosong} edited_cell {disunting} invalid_cell {tidak sah} "
      & "highlighted_cell {diserlahkan} other {baca sahaja}}");
   P ("label.tables.cell_position_label", "baris {row, number}, lajur {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {sel kosong} edited_cell {sel disunting} "
      & "invalid_cell {sel tidak sah} highlighted_cell {sel diserlahkan} other "
      & "{sel baca sahaja}}");
   P ("label.tables.column_count_label", "{count, plural, =0 {tiada lajur} other {{count, number} lajur}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {lajur teks} number_column {lajur "
      & "nombor} date_column {lajur tarikh} status_column {lajur status} "
      & "action_column {lajur tindakan} other {lajur tersembunyi}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {lajur teks} number_column {lajur nombor} "
      & "date_column {lajur tarikh} status_column {lajur status} action_column "
      & "{lajur tindakan} other {lajur tersembunyi}}");
   P ("label.tables.group_label", "{name}: {count, number} baris");
   P ("label.tables.row_count_label", "{count, plural, =0 {tiada baris} other {{count, number} baris}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {tidak diisih} ascending_sort {menaik} "
      & "other {menurun}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {tidak diisih} ascending_sort {diisih "
      & "mengikut {column_name}, menaik} other {diisih mengikut {column_name}, "
      & "menurun}}");
   P ("label.tables.subtotal_label", "subjumlah {name}: {value}");
   P ("label.tables.table_size_label", "{rows, number} baris × {columns, number} lajur");
   P ("label.tasks.assignment_label",
      "{assignee}: {state, select, unassigned {belum ditugaskan} assigned "
      & "{ditugaskan} reassigned {ditugaskan semula} watching {memerhati} other "
      & "{pemilik tugasan}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {belum ditugaskan} assigned {ditugaskan} "
      & "reassigned {ditugaskan semula} watching {memerhati} other {pemilik "
      & "tugasan}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {tunggakan kosong} other {tunggakan: {count, "
      & "number} tugasan}}");
   P ("label.tasks.blocker_label", "disekat oleh {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, =1 {selesaikan tugasan} other {selesaikan {count, "
      & "number} tugasan}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {tiada tugasan selesai} other {{count, number} "
      & "tugasan selesai}}");
   P ("label.tasks.due_label", "tarikh akhir {due_text}");
   P ("label.tasks.estimate_label", "anggaran {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {tiada tugasan terbuka} other {{count, number} "
      & "tugasan terbuka}}");
   P ("label.tasks.overdue_label", "lewat sejak {due_text}");
   P ("label.tasks.recurring_task_label", "berulang {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, =1 {buka semula tugasan} other {buka semula {count, "
      & "number} tugasan}}");
   P ("label.tasks.sprint_label", "{name}: {count, number} tugasan");
   P ("label.tasks.subtask_label", "{name}: {count, number} subtugasan");
   P ("label.tasks.task_count_label", "{count, plural, =0 {tiada tugasan} other {{count, number} tugasan}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {tugasan terbuka} in_progress_task "
      & "{tugasan sedang berjalan} blocked_task {tugasan disekat} done_task "
      & "{tugasan selesai} canceled_task {tugasan dibatalkan} deferred_task "
      & "{tugasan ditangguhkan} other {tugasan lewat}}{priority, select, "
      & "no_priority {} low_priority {, keutamaan rendah} medium_priority {, "
      & "keutamaan sederhana} high_priority {, keutamaan tinggi} other {, "
      & "keutamaan kritikal}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {tiada keutamaan} low_priority "
      & "{keutamaan rendah} medium_priority {keutamaan sederhana} high_priority "
      & "{keutamaan tinggi} other {keutamaan kritikal}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {tugasan terbuka} in_progress_task {tugasan "
      & "sedang berjalan} blocked_task {tugasan disekat} done_task {tugasan "
      & "selesai} canceled_task {tugasan dibatalkan} deferred_task {tugasan "
      & "ditangguhkan} other {tugasan lewat}}");
   P ("label.thresholds.threshold_direction_label", "{direction, select, upper_limit {had atas} other {had bawah}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {di bawah julat dijangka} within_range "
      & "{dalam julat dijangka} above_range {di atas julat dijangka} "
      & "below_target {di bawah sasaran} at_target {pada sasaran} above_target "
      & "{di atas sasaran} near_limit {hampir had} warning_level {ambang "
      & "amaran} critical_level {ambang kritikal} breached {ambang dilanggar} "
      & "other {keadaan ambang tidak diketahui}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {terkini} other {{ahead, "
      & "number} komit di hadapan}}} other {{ahead, plural, =0 {} other "
      & "{{ahead, number} komit di hadapan, }}{behind, number} komit di "
      & "belakang}}");
   P ("label.workflows.approval_label",
      "{waiting, select, true {menunggu kelulusan daripada {approver}} other "
      & "{diluluskan oleh {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, =1 {{attempt, plural, =1 {percubaan 1 daripada 1} "
      & "other {percubaan {attempt, number} daripada 1, had dilampaui}}} other "
      & "{percubaan {attempt, number} daripada {limit, number}}}");
   P ("label.workflows.blocker_label", "disekat: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {tiada kebergantungan yang menyekat} other {{count, "
      & "number} kebergantungan yang menyekat}}");
   P ("label.workflows.handoff_label", "serahan daripada {from} kepada {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {pencapaian akan datang} "
      & "current_milestone {pencapaian semasa} complete_milestone {pencapaian "
      & "selesai} missed_milestone {pencapaian terlepas} other {pencapaian "
      & "disekat}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {akan datang} "
      & "current_milestone {semasa} complete_milestone {selesai} "
      & "missed_milestone {terlepas} other {disekat}}");
   P ("label.workflows.next_action_label", "seterusnya: {action}");
   P ("label.workflows.owner_label", "dimiliki oleh {owner}");
   P ("label.workflows.resume_label", "sambung semula {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {belum selesai} active_step {aktif} "
      & "waiting_step {menunggu} blocked_step {disekat} done_step {selesai} "
      & "failed_step {gagal} other {dilangkau}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {belum selesai} active_step "
      & "{aktif} waiting_step {menunggu} blocked_step {disekat} done_step "
      & "{selesai} failed_step {gagal} other {dilangkau}}");
   P ("label.workflows.waiting_label", "menunggu {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {belum dimulakan} "
      & "in_progress_state {sedang berjalan} waiting_state {menunggu} "
      & "waiting_approval_state {menunggu kelulusan} blocked_state {disekat} "
      & "completed_state {selesai} failed_state {gagal} cancelled_state "
      & "{dibatalkan} skipped_state {dilangkau} other {dijeda}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {belum dimulakan} in_progress_state "
      & "{sedang berjalan} waiting_state {menunggu} waiting_approval_state "
      & "{menunggu kelulusan} blocked_state {disekat} completed_state {selesai} "
      & "failed_state {gagal} cancelled_state {dibatalkan} skipped_state "
      & "{dilangkau} other {dijeda}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {lut sinar} mostly_transparent "
      & "{kebanyakannya lut sinar} translucent {lut cahaya} mostly_opaque "
      & "{kebanyakannya legap} other {legap}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {tiada cerapan} other {{count, number} cerapan, min "
      & "{minimum} {unit}, median {median} {unit}, maks {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {tiada cerapan} other {0 "
      & "nilai luar daripada {total, number} cerapan}}} other {{outliers, "
      & "number} nilai luar daripada {total, number} cerapan}}");
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} melebihi kapasiti} other "
      & "{{count, number} daripada {total, number} {unit} berbaki}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {kuota dilampaui sebanyak {count, number} "
      & "{unit} ({percent} digunakan)} near {kuota hampir mencapai had: {count, "
      & "number} {unit} berbaki ({percent} digunakan)} other {kuota tersedia: "
      & "{count, number} {unit} berbaki ({percent} digunakan)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {kadar hit cache tidak tersedia: tiada "
      & "permintaan} other {kadar hit cache {percent}: {hits, number} hit, "
      & "{misses, number} terlepas}}");
   P ("label.markup.attribute_count_label.total", "{count, number} atribut");
   P ("label.markup.attribute_count_label.data", "{count, number} atribut data");
   P ("label.markup.attribute_count_label.aria", "{count, number} atribut ARIA");
   P ("label.markup.attribute_count_label.events", "{count, number} pengendali peristiwa");
   P ("label.markup.heading_label", "tajuk aras {level, number}");
   P ("label.markup.tag_count_label.total", "{count, number} teg");
   P ("label.markup.tag_count_label.links", "{count, number} pautan");
   P ("label.markup.tag_count_label.media", "{count, number} elemen media");
   P ("label.markup.tag_count_label.forms", "{count, number} kawalan borang");
   P ("label.markup.document_outline_label.headings", "{count, number} tajuk");
   P ("label.markup.document_outline_label.landmarks", "{count, number} mercu tanda");
   P ("label.markup.document_outline_label.forms", "{count, number} borang");
   P ("label.markup.document_outline_label.media", "{count, number} elemen media");
   P ("label.markup.table_navigation_label",
      "{caption} baris {row, number} daripada {rows, number}, lajur {column, "
      & "number} daripada {columns, number}");
   P ("label.secrets.secret_count_label.total", "{count, number} rahsia");
   P ("label.secrets.secret_count_label.masked", "{count, number} disembunyikan");
   P ("label.secrets.secret_count_label.unset", "{count, number} belum ditetapkan");
   P ("label.secrets.secret_count_label.fingerprints", "{count, number} cap jari");
   P ("label.schema.type_mismatch_label",
      "medan {field_name} menjangkakan {expected, select, string_field "
      & "{rentetan} integer_field {integer} decimal_field {perpuluhan} "
      & "boolean_field {boolean} date_field {tarikh} date_time_field "
      & "{tarikh-masa} object_field {objek} array_field {tatasusunan} "
      & "enum_field {enum} binary_field {binari} null_field {null} any_field "
      & "{sebarang} other {tidak diketahui}}, diterima {actual, select, "
      & "string_field {rentetan} integer_field {integer} decimal_field "
      & "{perpuluhan} boolean_field {boolean} date_field {tarikh} "
      & "date_time_field {tarikh-masa} object_field {objek} array_field "
      & "{tatasusunan} enum_field {enum} binary_field {binari} null_field "
      & "{null} any_field {sebarang} other {tidak diketahui}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, number} isu menyekat} "
      & "blocking {{base}, {blocking, number} isu menyekat} only {{base} "
      & "sahaja} other {{base}}}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {julat sasaran {low} hingga "
      & "{high}} other {tetingkap sasaran {low} hingga {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} dalam julat dijangka} below {{value} "
      & "di bawah julat dijangka} other {{value} di atas julat dijangka}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} pada ambang kritikal} warning "
      & "{{value} pada ambang amaran} other {{value} dalam julat normal}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {tidak dilanggar} other {dilanggar sebanyak "
      & "{difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {pada sasaran} below {{difference} di bawah "
      & "sasaran} other {{difference} di atas sasaran}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {had dilanggar} near {hampir mencapai had, "
      & "{distance} berbaki} other {{distance} daripada had}}");
   P ("label.thresholds.threshold_summary_label.none", "tiada metrik");
   P ("label.thresholds.threshold_summary_label.normal", "{count, number} normal");
   P ("label.thresholds.threshold_summary_label.warnings", "{count, number} amaran");
   P ("label.thresholds.threshold_summary_label.critical", "{count, number} kritikal");
   P ("label.thresholds.threshold_summary_label.breaches", "{count, number} pelanggaran");
   P ("label.thresholds.target_window_label", "sasaran {target} tambah tolak {tolerance}");
   P ("label.thresholds.tolerance_label", "toleransi {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} daripada had");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {had dilampaui sebanyak {amount}} other "
      & "{{amount} berbaki}}");
   P ("label.thresholds.budget_used_label", "{used} digunakan daripada {budget}");
   P ("label.workflows.step_label", "langkah {current, number} daripada {total, number}: {name}");
   P ("label.workflows.milestone_label", "{current, number} daripada {total, number} pencapaian selesai: {name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {tiada item aliran kerja} half {separuh aliran "
      & "kerja selesai} other {{completed, number} daripada {total, number} "
      & "selesai}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {kedudukan baris gilir {position, number}} other "
      & "{kedudukan baris gilir {position, number} daripada {total, number}}}");
   P ("label.changes.change_set_label.none", "tiada perubahan");
   P ("label.changes.change_set_label.added", "{count, number} ditambah");
   P ("label.changes.change_set_label.removed", "{count, number} dialih keluar");
   P ("label.changes.change_set_label.modified", "{count, number} diubah");
   P ("label.changes.change_set_label.unchanged", "{count, number} tidak berubah");
   P ("label.changes.sync_change_label.none", "tiada perubahan penyegerakan");
   P ("label.changes.sync_change_label.uploaded", "{count, number} dimuat naik");
   P ("label.changes.sync_change_label.downloaded", "{count, number} dimuat turun");
   P ("label.changes.sync_change_label.deleted", "{count, number} dipadam");
   P ("label.changes.sync_change_label.conflicts", "{count, number} konflik");
   P ("label.changes.net_change_label",
      "{state, select, none {tiada perubahan bersih} up {bersih +{count, "
      & "number} item} other {bersih -{count, number} item}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {tiada perubahan untuk disemak} all {semua "
      & "perubahan telah disemak} other {{reviewed, number} daripada {total, "
      & "number} perubahan telah disemak}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} kekal pada {new_value}} up "
      & "{{field_name} meningkat daripada {old_value} kepada {new_value}} other "
      & "{{field_name} menurun daripada {old_value} kepada {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {tiada baris boleh dipilih} none {tiada baris "
      & "dipilih} all {semua {total, number} baris dipilih} other {{selected, "
      & "number} daripada {total, number} baris dipilih}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {tiada halaman} other {{pages, plural, =0 {tiada "
      & "halaman} other {{rows, plural, =0 {halaman {page, number} daripada "
      & "{pages, number}} other {halaman {page, number} daripada {pages, "
      & "number}, {rows, number} baris}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {tiada baris} none {tiada baris sepadan} all "
      & "{semua {total, number} baris kelihatan} other {{visible, number} "
      & "daripada {total, number} baris kelihatan}}");
   P ("label.tables.row_range_label",
      "{state, select, none {tiada baris} single {baris {first_row, number} "
      & "daripada {total, number}} other {baris {first_row, number}-{last_row, "
      & "number} daripada {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {tiada had aksara} none_left {tiada aksara "
      & "berbaki} left {{count, number} aksara berbaki} other {{count, number} "
      & "aksara melebihi had}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {tiada medan wajib} other {{missing, plural, =0 "
      & "{semua medan wajib lengkap} other {{missing, number} daripada {total, "
      & "number} medan wajib belum diisi}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {tiada medan} all {semua medan lengkap} other "
      & "{{completed, number} daripada {total, number} medan lengkap}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: tiada medan} all {{name}: semua medan "
      & "lengkap} other {{name}: {completed, number} daripada {total, number} "
      & "medan lengkap}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {tiada langkah borang} other {langkah {current, "
      & "number} daripada {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {tiada serbuk roti} other {serbuk roti {current, "
      & "number} daripada {total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {tiada tab} other {tab {current, number} daripada "
      & "{total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {peti masuk kosong} other {{unread, plural, =0 "
      & "{semua pemberitahuan telah dibaca} other {{unread, number} belum "
      & "dibaca daripada {total, number} pemberitahuan}}}}");
   P ("label.notifications.delivery_attempt_label",
      "percubaan penghantaran {attempt, number} daripada {max_attempts, "
      & "number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {tiada item senarai semak} other {{done, number} "
      & "daripada {total, number} item selesai}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {tiada muat naik} other {{done, number} daripada "
      & "{total, number} muat naik selesai}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {tiada kapasiti} other {{reserved, number} "
      & "daripada {capacity, number} tempat duduk ditempah}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {kedudukan senarai menunggu {position, number}} "
      & "other {kedudukan senarai menunggu {position, number} daripada {total, "
      & "number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} berubah} other {{name}: {changed, number} berubah, {unchanged, "
      & "number} tidak berubah, {total, number} jumlah}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "warna latar depan semasa memenuhi kontras teks besar pada {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "warna latar depan semasa memenuhi kontras teks biasa pada {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "gunakan {v1} untuk kontras teks dipertingkat {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "gunakan {v1} untuk kontras teks besar {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "gunakan {v1} untuk kontras teks biasa {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "gunakan {v1} untuk kontras teks besar {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "gunakan {v1} untuk kontras teks dipertingkat {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "warna latar depan semasa memenuhi kontras teks besar pada {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "warna latar depan semasa memenuhi kontras teks biasa pada {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "warna latar depan semasa memenuhi kontras teks dipertingkat pada "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "warna latar depan semasa memenuhi kontras teks dipertingkat pada {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopia: risiko kekeliruan rendah, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopia: risiko kekeliruan sederhana, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopia: risiko kekeliruan sederhana, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "akromatopsia: risiko kekeliruan tinggi, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 tekstil delta {v1}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, perbezaan persepsi besar");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopia: risiko kekeliruan sederhana, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, perbezaan persepsi dramatik");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "akromatopsia: risiko kekeliruan rendah, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopia: boleh dibezakan, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopia: boleh dibezakan, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopia: boleh dibezakan, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "akromatopsia: boleh dibezakan, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "akromatopsia: risiko kekeliruan sederhana, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, perbezaan persepsi besar");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, perbezaan persepsi besar");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 tekstil delta {v1}, perbezaan persepsi besar");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, perbezaan persepsi besar");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, perbezaan persepsi ketara");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopia: risiko kekeliruan tinggi, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopia: risiko kekeliruan tinggi, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, perbezaan persepsi ketara");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 tekstil delta {v1}, perbezaan persepsi ketara");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, perbezaan persepsi ketara");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, perbezaan persepsi ketara");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopia: risiko kekeliruan rendah, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopia: risiko kekeliruan rendah, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, perbezaan persepsi besar");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopia: risiko kekeliruan tinggi, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, perbezaan persepsi besar");
end Labels_2;
