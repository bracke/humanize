separate (Humanize.Catalogs.Phrase_Data.Locale_Id)
procedure Labels_2 is
begin
   P ("label.notifications.delivery_label",
      "notifikasi {channel, select, in_app_channel {dalam aplikasi} "
      & "email_channel {email} sms_channel {SMS} push_channel {push} "
      & "webhook_channel {webhook} other {ringkasan}} {state, select, "
      & "pending_delivery {tertunda} sent_delivery {terkirim} "
      & "delivered_delivery {diterima} failed_delivery {gagal} "
      & "retrying_delivery {sedang dicoba ulang} other {dibatalkan}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {notifikasi tertunda} sent_delivery "
      & "{notifikasi terkirim} delivered_delivery {notifikasi diterima} "
      & "failed_delivery {notifikasi gagal} retrying_delivery {notifikasi "
      & "sedang dicoba ulang} other {notifikasi dibatalkan}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {tertunda {time_text}} sent_delivery "
      & "{dikirim {time_text}} delivered_delivery {diterima {time_text}} "
      & "failed_delivery {gagal {time_text}} retrying_delivery {dicoba ulang "
      & "{time_text}} other {dibatalkan {time_text}}}");
   P ("label.notifications.digest_label",
      "ringkasan {name}: {count, plural, =0 {tidak ada notifikasi} other "
      & "{{count, number} notifikasi}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {tidak ada sebutan} "
      & "other {{count, number} sebutan}}} reply_event {{count, plural, =0 "
      & "{tidak ada balasan} other {{count, number} balasan}}} assignment_event "
      & "{{count, plural, =0 {tidak ada penugasan} other {{count, number} "
      & "penugasan}}} approval_event {{count, plural, =0 {tidak ada permintaan "
      & "persetujuan} other {{count, number} permintaan persetujuan}}} "
      & "alert_event {{count, plural, =0 {tidak ada peringatan} other {{count, "
      & "number} peringatan}}} digest_event {{count, plural, =0 {tidak ada "
      & "ringkasan} other {{count, number} ringkasan}}} reminder_event {{count, "
      & "plural, =0 {tidak ada pengingat} other {{count, number} pengingat}}} "
      & "other {{count, plural, =0 {tidak ada notifikasi sistem} other {{count, "
      & "number} notifikasi sistem}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, =1 {tandai notifikasi sebagai sudah dibaca} other "
      & "{tandai {count, number} notifikasi sebagai sudah dibaca}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, =1 {tandai notifikasi sebagai belum dibaca} other "
      & "{tandai {count, number} notifikasi sebagai belum dibaca}}");
   P ("label.notifications.muted_label", "notifikasi {name} dibisukan");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {sebutan baru} reply_event {balasan "
      & "baru} assignment_event {penugasan baru} approval_event {permintaan "
      & "persetujuan baru} alert_event {peringatan baru} digest_event "
      & "{ringkasan baru} reminder_event {pengingat baru} other {notifikasi "
      & "sistem baru}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {notifikasi dalam aplikasi} "
      & "email_channel {notifikasi email} sms_channel {notifikasi SMS} "
      & "push_channel {notifikasi push} webhook_channel {notifikasi webhook} "
      & "other {notifikasi ringkasan}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {tidak ada notifikasi} other {{count, number} "
      & "notifikasi}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {sebutan} reply_event {balasan} "
      & "assignment_event {penugasan} approval_event {permintaan persetujuan} "
      & "alert_event {peringatan} digest_event {ringkasan} reminder_event "
      & "{pengingat} other {notifikasi sistem}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {tidak ada notifikasi} other {{count, "
      & "number} notifikasi}}");
   P ("label.notifications.notification_label",
      "{subject}, {event, select, mention_event {sebutan} reply_event "
      & "{balasan} assignment_event {penugasan} approval_event {permintaan "
      & "persetujuan} alert_event {peringatan} digest_event {ringkasan} "
      & "reminder_event {pengingat} other {notifikasi sistem}}: {state, select, "
      & "unread_state {belum dibaca} read_state {sudah dibaca} archived_state "
      & "{diarsipkan} muted_state {dibisukan} snoozed_state {ditunda} other "
      & "{diredam}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {notifikasi belum dibaca} read_state "
      & "{notifikasi sudah dibaca} archived_state {notifikasi diarsipkan} "
      & "muted_state {notifikasi dibisukan} snoozed_state {notifikasi ditunda} "
      & "other {notifikasi diredam}}");
   P ("label.notifications.snoozed_label", "notifikasi {name} ditunda");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {tidak ada notifikasi yang diredam} other {{count, "
      & "number} notifikasi diredam}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {tidak ada notifikasi belum dibaca} other {{count, "
      & "number} notifikasi belum dibaca}}");
   P ("label.payments.amount_label", "jumlah {amount_text}");
   P ("label.payments.balance_label", "saldo {amount_text}");
   P ("label.payments.chargeback_label", "chargeback {amount_text}");
   P ("label.payments.discount_label", "diskon {amount_text}");
   P ("label.payments.due_label", "{amount_text} jatuh tempo {due_text}");
   P ("label.payments.invoice_count_label", "{count, plural, =0 {tidak ada faktur} other {{count, number} faktur}}");
   P ("label.payments.invoice_label",
      "faktur {number}: {state, select, draft_invoice {draf} open_invoice "
      & "{terbuka} paid_invoice {lunas} overdue_invoice {lewat jatuh tempo} "
      & "other {batal}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {draf faktur} open_invoice {faktur "
      & "terbuka} paid_invoice {faktur lunas} overdue_invoice {faktur lewat "
      & "jatuh tempo} other {faktur batal}}");
   P ("label.payments.method_label",
      "{method, select, card_method {dibayar dengan kartu} "
      & "bank_transfer_method {dibayar dengan transfer bank} cash_method "
      & "{dibayar tunai} wallet_method {dibayar dengan dompet digital} "
      & "check_method {dibayar dengan cek} other {dibayar dengan metode lain}}: "
      & "{detail}");
   P ("label.payments.paid_label", "{amount_text} dibayar {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {tidak ada pembayaran} other {{count, number} "
      & "pembayaran}}");
   P ("label.payments.payment_label",
      "{amount_text}: pembayaran {state, select, pending_payment {tertunda} "
      & "authorized_payment {diotorisasi} paid_payment {berhasil} "
      & "failed_payment {gagal} refunded_payment {dikembalikan} other "
      & "{dibatalkan}}");
   P ("label.payments.payment_link_label", "tautan pembayaran {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {kartu} bank_transfer_method {transfer "
      & "bank} cash_method {tunai} wallet_method {dompet digital} check_method "
      & "{cek} other {lainnya}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {pembayaran tertunda} "
      & "authorized_payment {pembayaran diotorisasi} paid_payment {pembayaran "
      & "berhasil} failed_payment {pembayaran gagal} refunded_payment "
      & "{pembayaran dikembalikan} other {pembayaran dibatalkan}}");
   P ("label.payments.receipt_label", "kuitansi {number}");
   P ("label.payments.refund_label",
      "{amount_text}: pengembalian dana {state, select, pending_payment "
      & "{tertunda} authorized_payment {diotorisasi} paid_payment {dibayarkan} "
      & "failed_payment {gagal} refunded_payment {selesai} other {dibatalkan}}");
   P ("label.payments.subtotal_label", "subtotal {amount_text}");
   P ("label.payments.tax_label", "pajak {amount_text}");
   P ("label.payments.total_label", "total {amount_text}");
   P ("label.permissions.access_expiry_label", "akses {subject} kedaluwarsa {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: diberi peran {role, select, owner_role {pemilik} admin_role "
      & "{admin} editor_role {editor} viewer_role {pelihat} other {kustom}}");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {diberikan} denied "
      & "{ditolak} inherited {diwarisi} temporary {akses sementara} expired "
      & "{kedaluwarsa} other {memerlukan persetujuan}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {diberikan} denied {ditolak} inherited "
      & "{diwarisi} temporary {akses sementara} expired {kedaluwarsa} other "
      & "{memerlukan persetujuan}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {diizinkan kebijakan} policy_denied "
      & "{ditolak kebijakan} policy_warning {peringatan kebijakan} other "
      & "{kebijakan tidak berlaku}}");
   P ("label.permissions.revoke_label",
      "{subject}: peran {role, select, owner_role {pemilik} admin_role "
      & "{admin} editor_role {editor} viewer_role {pelihat} other {kustom}} "
      & "dicabut");
   P ("label.permissions.role_label",
      "{role, select, owner_role {pemilik} admin_role {admin} editor_role "
      & "{editor} viewer_role {pelihat} other {peran kustom}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {kosong} low_utilization {pemakaian "
      & "rendah} normal_utilization {pemakaian normal} high_utilization "
      & "{pemakaian tinggi} critical_utilization {pemakaian kritis} "
      & "full_utilization {penuh} other {melebihi batas}}");
   P ("label.schema.array_shape_label",
      "array {element_type, select, string_field {string} integer_field "
      & "{bilangan bulat} decimal_field {desimal} boolean_field {boolean} "
      & "date_field {tanggal} date_time_field {tanggal-waktu} object_field "
      & "{objek} array_field {array} enum_field {enum} binary_field {biner} "
      & "null_field {null} any_field {tipe apa pun} other {tipe tidak "
      & "dikenal}}{count_known, select, false {} other {, {count, number} "
      & "item}}");
   P ("label.schema.constraint_label", "batasan {name}: {value}");
   P ("label.schema.default_value_label", "bidang {field_name}, nilai default {value}");
   P ("label.schema.deprecated_field_label", "bidang usang {name}, gunakan {replacement}");
   P ("label.schema.enum_options_label", "{count, plural, other {{count, number} opsi enum}}");
   P ("label.schema.example_value_label", "bidang {field_name}, contoh {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {bidang normal} deprecated_field {bidang "
      & "usang} unknown_field {bidang tidak dikenal} read_only_field {bidang "
      & "hanya baca} write_only_field {bidang hanya tulis} other {bidang "
      & "terhitung}}");
   P ("label.schema.field_type_label",
      "bidang {kind, select, string_field {string} integer_field {bilangan "
      & "bulat} decimal_field {desimal} boolean_field {boolean} date_field "
      & "{tanggal} date_time_field {tanggal-waktu} object_field {objek} "
      & "array_field {array} enum_field {enum} binary_field {biner} null_field "
      & "{null} any_field {tipe apa pun} other {tipe tidak dikenal}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {tidak ada bidang wajib yang kosong} other {{count, "
      & "number} bidang wajib kosong}}");
   P ("label.schema.object_shape_label",
      "objek dengan {fields, number} bidang{required, plural, =0 {} other {, "
      & "{required, number} wajib}}{optional, plural, =0 {} other {, {optional, "
      & "number} opsional}}");
   P ("label.schema.schema_source_label", "skema {name} versi {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {nilai skalar} object_shape {{count, "
      & "plural, =0 {objek} other {objek dengan {count, number} bidang}}} "
      & "array_shape {{count, plural, =0 {array} other {array dengan {count, "
      & "number} item}}} map_shape {{count, plural, =0 {peta} other {peta "
      & "dengan {count, number} entri}}} tuple_shape {{count, plural, =0 "
      & "{tuple} other {tuple dengan {count, number} item}}} union_shape "
      & "{{count, plural, =0 {union} other {union dari {count, number} tipe}}} "
      & "empty_shape {bentuk kosong} other {bentuk tidak dikenal}}");
   P ("label.schema.unknown_field_label", "bidang tidak dikenal {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {tidak ada filter aktif} other {{count, number} "
      & "filter aktif}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {hapus filter} =1 {hapus filter aktif} other {hapus "
      & "{count, number} filter aktif}}");
   P ("label.search.facet_label", "faset {name}, {count, number} opsi");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {tidak ada hasil} other {{count, number} "
      & "hasil}}{selected, select, true {, dipilih} other {}}");
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {filter aktif} "
      & "inactive_filter {filter tidak aktif} other {filter pengecualian}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {filter aktif} inactive_filter {filter "
      & "tidak aktif} other {filter pengecualian}}");
   P ("label.search.no_results_label", "tidak ada hasil untuk “{query}”");
   P ("label.search.recent_search_label", "pencarian terbaru: “{query}”");
   P ("label.search.saved_search_label",
      "pencarian tersimpan: {name}{count, plural, =0 {} other {, {count, "
      & "number} hasil}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {tidak ada pencarian terbaru} other {{count, "
      & "number} pencarian terbaru}}");
   P ("label.search.search_query_label", "cari “{query}”");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {tidak ada hasil} other {{count, number} hasil}}");
   P ("label.search.search_result_summary_label",
      "hasil untuk “{query}”: {count, plural, =0 {tidak ada hasil} other "
      & "{{count, number} hasil}}");
   P ("label.search.search_scope_label",
      "cakupan {name}, {count, plural, =0 {tidak ada hasil} other {{count, "
      & "number} hasil}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {pencarian siaga} searching_search "
      & "{mencari} complete_search {pencarian selesai} empty_search {tidak ada "
      & "hasil pencarian} other {pencarian gagal}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {urutkan menurut relevansi} "
      & "ascending_sort {urutkan naik} descending_sort {urutkan turun} "
      & "newest_first_sort {urutkan dari yang terbaru} other {urutkan dari yang "
      & "terlama}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {relevansi} ascending_sort {naik} "
      & "descending_sort {turun} newest_first_sort {terbaru dulu} other "
      & "{terlama dulu}}");
   P ("label.search.suggestion_label", "mungkin maksud Anda “{query}”?");
   P ("label.secrets.credential_source_label", "{count, number} kredensial dari {source}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {nilai disembunyikan} masked_value "
      & "{nilai disamarkan} suffix_only {hanya akhiran} other {hanya sidik "
      & "jari}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {publik} support_profile {dukungan} "
      & "audit_profile {audit} other {debug}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, true {perlu rotasi} other {tidak perlu "
      & "rotasi}}{days_old, plural, =0 {} other {, berumur {days_old, number} "
      & "hari}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {kunci API} live_api_key {kunci API produksi} "
      & "test_api_key {kunci API uji} github_token {token GitHub} "
      & "aws_access_key {kunci akses AWS} google_api_key {kunci API Google} "
      & "slack_token {token Slack} npm_token {token npm} bearer_token {token "
      & "bearer} jwt_token {token JWT} basic_auth_credential {kredensial "
      & "autentikasi dasar} password_secret {kata sandi} private_key {kunci "
      & "privat} ssh_private_key {kunci privat SSH} webhook_secret {rahasia "
      & "webhook} oauth_token {token OAuth} database_url_secret {URL basis data "
      & "rahasia} sha1_fingerprint {sidik jari SHA-1} sha256_fingerprint {sidik "
      & "jari SHA-256} other {rahasia}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {email} phone_value {telepon} url_value "
      & "{URL} ip_address_value {alamat IP} token_value {token} file_path_value "
      & "{jalur file} account_id_value {ID akun} payment_reference_value "
      & "{referensi pembayaran} log_field_value {bidang log} other {nilai "
      & "sensitif}}");
   P ("label.tables.cell_label",
      "baris {row, number}, kolom {column, number}: {state, select, "
      & "empty_cell {kosong} edited_cell {diedit} invalid_cell {tidak valid} "
      & "highlighted_cell {disorot} other {hanya baca}}");
   P ("label.tables.cell_position_label", "baris {row, number}, kolom {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {sel kosong} edited_cell {sel diedit} "
      & "invalid_cell {sel tidak valid} highlighted_cell {sel disorot} other "
      & "{sel hanya baca}}");
   P ("label.tables.column_count_label", "{count, plural, =0 {tidak ada kolom} other {{count, number} kolom}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {kolom teks} number_column {kolom "
      & "angka} date_column {kolom tanggal} status_column {kolom status} "
      & "action_column {kolom tindakan} other {kolom tersembunyi}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {kolom teks} number_column {kolom angka} "
      & "date_column {kolom tanggal} status_column {kolom status} action_column "
      & "{kolom tindakan} other {kolom tersembunyi}}");
   P ("label.tables.group_label", "{name}: {count, number} baris");
   P ("label.tables.row_count_label", "{count, plural, =0 {tidak ada baris} other {{count, number} baris}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {tidak diurutkan} ascending_sort {naik} "
      & "other {turun}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {tidak diurutkan} ascending_sort "
      & "{diurutkan menurut {column_name}, naik} other {diurutkan menurut "
      & "{column_name}, turun}}");
   P ("label.tables.subtotal_label", "subtotal {name}: {value}");
   P ("label.tables.table_size_label", "{rows, number} baris × {columns, number} kolom");
   P ("label.tasks.assignment_label",
      "{assignee}: {state, select, unassigned {belum ditugaskan} assigned "
      & "{ditugaskan} reassigned {ditugaskan ulang} watching {memantau} other "
      & "{pemilik tugas}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {belum ditugaskan} assigned {ditugaskan} "
      & "reassigned {ditugaskan ulang} watching {memantau} other {pemilik "
      & "tugas}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {backlog kosong} other {backlog: {count, number} "
      & "tugas}}");
   P ("label.tasks.blocker_label", "diblokir oleh {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, =1 {selesaikan tugas} other {selesaikan {count, "
      & "number} tugas}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {tidak ada tugas selesai} other {{count, number} "
      & "tugas selesai}}");
   P ("label.tasks.due_label", "jatuh tempo {due_text}");
   P ("label.tasks.estimate_label", "perkiraan {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {tidak ada tugas terbuka} other {{count, number} "
      & "tugas terbuka}}");
   P ("label.tasks.overdue_label", "terlambat sejak {due_text}");
   P ("label.tasks.recurring_task_label", "berulang {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, =1 {buka kembali tugas} other {buka kembali {count, "
      & "number} tugas}}");
   P ("label.tasks.sprint_label", "{name}: {count, number} tugas");
   P ("label.tasks.subtask_label", "{name}: {count, number} subtugas");
   P ("label.tasks.task_count_label", "{count, plural, =0 {tidak ada tugas} other {{count, number} tugas}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {tugas terbuka} in_progress_task "
      & "{tugas sedang dikerjakan} blocked_task {tugas diblokir} done_task "
      & "{tugas selesai} canceled_task {tugas dibatalkan} deferred_task {tugas "
      & "ditunda} other {tugas terlambat}}{priority, select, no_priority {} "
      & "low_priority {, prioritas rendah} medium_priority {, prioritas sedang} "
      & "high_priority {, prioritas tinggi} other {, prioritas kritis}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {tanpa prioritas} low_priority "
      & "{prioritas rendah} medium_priority {prioritas sedang} high_priority "
      & "{prioritas tinggi} other {prioritas kritis}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {tugas terbuka} in_progress_task {tugas "
      & "sedang dikerjakan} blocked_task {tugas diblokir} done_task {tugas "
      & "selesai} canceled_task {tugas dibatalkan} deferred_task {tugas "
      & "ditunda} other {tugas terlambat}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {batas atas} other {batas bawah}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {di bawah rentang yang diharapkan} "
      & "within_range {dalam rentang yang diharapkan} above_range {di atas "
      & "rentang yang diharapkan} below_target {di bawah target} at_target "
      & "{sesuai target} above_target {di atas target} near_limit {mendekati "
      & "batas} warning_level {ambang peringatan} critical_level {ambang "
      & "kritis} breached {ambang terlampaui} other {status ambang tidak "
      & "diketahui}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {mutakhir} other {{ahead, "
      & "number} commit di depan}}} other {{ahead, plural, =0 {} other {{ahead, "
      & "number} commit di depan, }}{behind, number} commit di belakang}}");
   P ("label.workflows.approval_label",
      "{waiting, select, true {menunggu persetujuan dari {approver}} other "
      & "{disetujui oleh {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, =1 {{attempt, plural, =1 {percobaan 1 dari 1} other "
      & "{percobaan {attempt, number} dari 1, batas terlampaui}}} other "
      & "{percobaan {attempt, number} dari {limit, number}}}");
   P ("label.workflows.blocker_label", "diblokir: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {tidak ada dependensi yang memblokir} other "
      & "{{count, number} dependensi yang memblokir}}");
   P ("label.workflows.handoff_label", "serah terima dari {from} ke {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {tonggak mendatang} "
      & "current_milestone {tonggak saat ini} complete_milestone {tonggak "
      & "selesai} missed_milestone {tonggak terlewat} other {tonggak diblokir}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {mendatang} "
      & "current_milestone {saat ini} complete_milestone {selesai} "
      & "missed_milestone {terlewat} other {diblokir}}");
   P ("label.workflows.next_action_label", "berikutnya: {action}");
   P ("label.workflows.owner_label", "dimiliki oleh {owner}");
   P ("label.workflows.resume_label", "lanjutkan {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {tertunda} active_step {aktif} "
      & "waiting_step {menunggu} blocked_step {diblokir} done_step {selesai} "
      & "failed_step {gagal} other {dilewati}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {tertunda} active_step {aktif} "
      & "waiting_step {menunggu} blocked_step {diblokir} done_step {selesai} "
      & "failed_step {gagal} other {dilewati}}");
   P ("label.workflows.waiting_label", "menunggu {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {belum dimulai} "
      & "in_progress_state {sedang berlangsung} waiting_state {menunggu} "
      & "waiting_approval_state {menunggu persetujuan} blocked_state {diblokir} "
      & "completed_state {selesai} failed_state {gagal} cancelled_state "
      & "{dibatalkan} skipped_state {dilewati} other {dijeda}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {belum dimulai} in_progress_state "
      & "{sedang berlangsung} waiting_state {menunggu} waiting_approval_state "
      & "{menunggu persetujuan} blocked_state {diblokir} completed_state "
      & "{selesai} failed_state {gagal} cancelled_state {dibatalkan} "
      & "skipped_state {dilewati} other {dijeda}}");
end Labels_2;
