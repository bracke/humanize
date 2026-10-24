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
end Labels_2;
