separate (Humanize.Catalogs.Phrase_Data.Locale_Ms)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name}: akaun aktif} invited_account "
      & "{{name}: akaun dijemput} locked_account {{name}: akaun dikunci} "
      & "suspended_account {{name}: akaun digantung} deleted_account {{name}: "
      & "akaun dipadam} other {{name}: status akaun tidak diketahui}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {akaun aktif} invited_account {akaun "
      & "dijemput} locked_account {akaun dikunci} suspended_account {akaun "
      & "digantung} deleted_account {akaun dipadam} other {status akaun tidak "
      & "diketahui}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {peranti dipercayai} untrusted_device "
      & "{peranti tidak dipercayai} new_device {peranti baharu} other {peranti "
      & "disekat}}");
   P ("label.accounts.last_active_label", "{name} kali terakhir aktif {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: log masuk gagal} other {{name}: log "
      & "masuk berjaya}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA didayakan} mfa_disabled {MFA "
      & "dinyahdayakan} mfa_required {MFA diperlukan} other {tetapan semula MFA "
      & "diperlukan}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: sesi aktif} expired_session "
      & "{{name}: sesi tamat tempoh} revoked_session {{name}: sesi dibatalkan} "
      & "idle_session {{name}: sesi melahu} other {{name}: status sesi tidak "
      & "diketahui}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {sesi aktif} expired_session {sesi "
      & "tamat tempoh} revoked_session {sesi dibatalkan} idle_session {sesi "
      & "melahu} other {status sesi tidak diketahui}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {tiada lampiran} other {{count, number} lampiran}}");
   P ("label.attachments.attachment_group_label", "{name}: {count, number} lampiran");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {lampiran fail} image_attachment "
      & "{lampiran imej} video_attachment {lampiran video} audio_attachment "
      & "{lampiran audio} document_attachment {lampiran dokumen} "
      & "archive_attachment {lampiran arkib} other {lampiran pautan}}");
   P ("label.attachments.attachment_label",
      "{name}, {kind, select, file_attachment {fail} image_attachment {imej} "
      & "video_attachment {video} audio_attachment {audio} document_attachment "
      & "{dokumen} archive_attachment {arkib} other {pautan}}: {state, select, "
      & "pending_attachment {belum selesai} uploading_attachment {sedang dimuat "
      & "naik} uploaded_attachment {dimuat naik} failed_attachment {gagal "
      & "dimuat naik} removed_attachment {dialih keluar} other {disekat}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {lampiran belum selesai} "
      & "uploading_attachment {lampiran sedang dimuat naik} uploaded_attachment "
      & "{lampiran dimuat naik} failed_attachment {lampiran gagal dimuat naik} "
      & "removed_attachment {lampiran dialih keluar} other {lampiran disekat}}");
   P ("label.attachments.download_label", "muat turun {name}");
   P ("label.attachments.expiring_link_label", "pautan {name} tamat tempoh {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "pratonton {name}");
   P ("label.attachments.remove_label", "alih keluar {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: belum diimbas} scanning {{name}: "
      & "sedang diimbas} safe {{name}: selamat} suspicious {{name}: "
      & "mencurigakan} other {{name}: dijangkiti}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {belum diimbas} scanning {sedang diimbas} "
      & "safe {selamat} suspicious {mencurigakan} other {dijangkiti}}");
   P ("label.attachments.upload_error_label", "{name} gagal dimuat naik: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {lencana} new_badge {lencana "
      & "baharu} updated_badge {lencana dikemas kini} deprecated_badge {lencana "
      & "usang} selected_badge {lencana dipilih} disabled_badge {lencana "
      & "dinyahdayakan} other {lencana boleh ditutup}}, {tone, select, "
      & "neutral_tone {tona neutral} info_tone {tona maklumat} success_tone "
      & "{tona berjaya} warning_tone {tona amaran} danger_tone {tona bahaya} "
      & "other {tona malap}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {lencana keutamaan rendah} "
      & "medium_priority {lencana keutamaan sederhana} high_priority {lencana "
      & "keutamaan tinggi} other {lencana keutamaan kritikal}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {lencana lalai} new_badge {lencana "
      & "baharu} updated_badge {lencana dikemas kini} deprecated_badge {lencana "
      & "usang} selected_badge {lencana dipilih} disabled_badge {lencana "
      & "dinyahdayakan} other {lencana boleh ditutup}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {lencana neutral} info_tone {lencana "
      & "maklumat} success_tone {lencana berjaya} warning_tone {lencana amaran} "
      & "danger_tone {lencana bahaya} other {lencana malap}}");
   P ("label.badges.chip_label", "{selected, select, false {cip {name}} other {cip {name}, dipilih}}");
   P ("label.badges.count_badge_label", "{count, plural, other {{name}: {count, number}}}");
   P ("label.badges.deprecated_label", "{name}: lencana usang");
   P ("label.badges.dismiss_label", "tutup {name}");
   P ("label.badges.new_label", "{name}: lencana baharu");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {tiada lencana tersembunyi} other "
      & "{+{hidden_count, number} lagi lencana}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: lencana keutamaan rendah} "
      & "medium_priority {{name}: lencana keutamaan sederhana} high_priority "
      & "{{name}: lencana keutamaan tinggi} other {{name}: lencana keutamaan "
      & "kritikal}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {status {name}: neutral} info_tone {status "
      & "{name}: maklumat} success_tone {status {name}: berjaya} warning_tone "
      & "{status {name}: amaran} danger_tone {status {name}: bahaya} other "
      & "{status {name}: malap}}");
   P ("label.badges.tag_count_label", "{count, plural, =0 {tiada tag} other {{count, number} tag}}");
   P ("label.badges.tag_label", "tag {name}");
   P ("label.badges.updated_label", "{name}: lencana dikemas kini");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artifak dimuat naik} "
      & "artifact_missing {artifak tiada} artifact_expired {artifak tamat "
      & "tempoh} other {artifak disahkan}}");
   P ("label.builds.benchmark_label", "penanda aras {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {{name}: binaan dalam baris gilir} "
      & "build_running {{name}: binaan sedang berjalan} build_passed {{name}: "
      & "binaan berjaya} build_failed {{name}: binaan gagal} snapshot_build "
      & "{{name}: binaan snapshot} other {{name}: binaan keluaran}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {binaan dalam baris gilir} build_running "
      & "{binaan sedang berjalan} build_passed {binaan berjaya} build_failed "
      & "{binaan gagal} snapshot_build {binaan snapshot} other {binaan "
      & "keluaran}}");
   P ("label.builds.coverage_label", "liputan {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {get keluaran lulus} gate_failed {get "
      & "keluaran gagal} gate_warning {get keluaran memberi amaran} other {get "
      & "keluaran disekat}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {tiada ujian lulus} "
      & "other {{count, number} ujian lulus}}} failed_test {{count, plural, =0 "
      & "{tiada ujian gagal} other {{count, number} ujian gagal}}} skipped_test "
      & "{{count, plural, =0 {tiada ujian dilangkau} other {{count, number} "
      & "ujian dilangkau}}} flaky_test {{count, plural, =0 {tiada ujian tidak "
      & "stabil} other {{count, number} ujian tidak stabil}}} other {{count, "
      & "plural, =0 {tiada ujian gagal seperti dijangka} other {{count, number} "
      & "ujian gagal seperti dijangka}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {lulus} failed_test {gagal} skipped_test "
      & "{dilangkau} flaky_test {tidak stabil} other {gagal seperti dijangka}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "tidak berubah, dinyahdayakan} other {{field_name} berubah daripada "
      & "dinyahdayakan kepada didayakan}}} other {{new_value, select, false "
      & "{{field_name} berubah daripada didayakan kepada dinyahdayakan} other "
      & "{{field_name} tidak berubah, didayakan}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {ditambah} removed_change {dialih keluar} "
      & "modified_change {diubah} renamed_change {dinamakan semula} "
      & "unchanged_change {tidak berubah} metadata_change {metadata diubah} "
      & "moved_change {dialihkan} conflict_change {konflik} other {perubahan "
      & "tidak diketahui}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {perubahan makluman} "
      & "minor_change {perubahan kecil} major_change {perubahan besar} other "
      & "{perubahan tidak serasi}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} tidak berubah} "
      & "other {{unchanged, plural, =0 {{field_name} diubah: {added, number} "
      & "ditambah} other {{field_name} diubah: {added, number} ditambah, "
      & "{unchanged, number} tidak berubah}}}}} other {{added, plural, =0 "
      & "{{unchanged, plural, =0 {{field_name} diubah: {removed, number} dialih "
      & "keluar} other {{field_name} diubah: {removed, number} dialih keluar, "
      & "{unchanged, number} tidak berubah}}} other {{unchanged, plural, =0 "
      & "{{field_name} diubah: {added, number} ditambah, {removed, number} "
      & "dialih keluar} other {{field_name} diubah: {added, number} ditambah, "
      & "{removed, number} dialih keluar, {unchanged, number} tidak "
      & "berubah}}}}}}");
   P ("label.changes.conflict_label", "{count, plural, =0 {tiada konflik} other {{count, number} konflik}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} dianjakkan ke kemudian daripada "
      & "{old_label} kepada {new_label}} other {{field_name} dianjakkan ke awal "
      & "daripada {old_label} kepada {new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} berubah daripada {old_label} kepada {new_label}");
   P ("label.changes.field_change_label", "{field_name} berubah daripada {old_value} kepada {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name} ditambah} removed_change {{name} "
      & "dialih keluar} modified_change {{name} diubah} renamed_change {{name} "
      & "dinamakan semula} unchanged_change {{name} tidak berubah} "
      & "metadata_change {metadata {name} diubah} moved_change {{name} "
      & "dialihkan} conflict_change {{name}: konflik} other {{name}: perubahan "
      & "tidak diketahui}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {hanya metadata berubah} other {hanya {count, "
      & "number} medan metadata berubah}}");
   P ("label.changes.move_label", "{name} dialihkan daripada {from} ke {to}");
   P ("label.changes.no_changes_label", "tiada perubahan");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {tiada perubahan "
      & "baris} other {{lines_added, number} baris ditambah}}} other "
      & "{{lines_added, plural, =0 {{lines_removed, number} baris dialih "
      & "keluar} other {{lines_added, number} baris ditambah, {lines_removed, "
      & "number} baris dialih keluar}}}}");
   P ("label.changes.rename_label", "dinamakan semula daripada {old_name} kepada {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} mendraf ulasan} "
      & "published_comment {{author} mengulas} edited_comment {{author} "
      & "mengedit ulasan} deleted_comment {{author} memadam ulasan} "
      & "resolved_comment {{author} menyelesaikan ulasan} unresolved_comment "
      & "{{author} membuka semula ulasan} pinned_comment {{author} menyemat "
      & "ulasan} other {{author} menyembunyikan ulasan}}");
   P ("label.comments.comment_count_label", "{count, plural, =0 {tiada ulasan} other {{count, number} ulasan}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author}: draf ulasan} "
      & "published_comment {{author}: ulasan diterbitkan} edited_comment "
      & "{{author}: ulasan diedit} deleted_comment {{author}: ulasan dipadam} "
      & "resolved_comment {{author}: ulasan diselesaikan} unresolved_comment "
      & "{{author}: ulasan belum diselesaikan} pinned_comment {{author}: ulasan "
      & "disemat} other {{author}: ulasan disembunyikan}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {draf ulasan} published_comment {ulasan "
      & "diterbitkan} edited_comment {ulasan diedit} deleted_comment {ulasan "
      & "dipadam} resolved_comment {ulasan diselesaikan} unresolved_comment "
      & "{ulasan belum diselesaikan} pinned_comment {ulasan disemat} other "
      & "{ulasan disembunyikan}}");
   P ("label.comments.deleted_label", "{author} memadam ulasan");
   P ("label.comments.edited_label", "diedit {time_text}");
   P ("label.comments.hide_comment_label", "sembunyikan ulasan: {reason}");
   P ("label.comments.lock_thread_label", "kunci bebenang {name}");
   P ("label.comments.mention_label", "{actor} menyebut {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {tiada peserta} other {{count, number} peserta}}");
   P ("label.comments.pin_label", "semat {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reaksi suka} dislike_reaction {reaksi "
      & "tidak suka} heart_reaction {reaksi hati} laugh_reaction {reaksi "
      & "ketawa} confused_reaction {reaksi keliru} hooray_reaction {reaksi "
      & "hore} rocket_reaction {reaksi roket} other {reaksi mata}}");
   P ("label.comments.reaction_label",
      "{count, plural, =0 {tiada reaksi {kind, select, like_reaction {suka} "
      & "dislike_reaction {tidak suka} heart_reaction {hati} laugh_reaction "
      & "{ketawa} confused_reaction {keliru} hooray_reaction {hore} "
      & "rocket_reaction {roket} other {mata}}} other {{count, number} reaksi "
      & "{kind, select, like_reaction {suka} dislike_reaction {tidak suka} "
      & "heart_reaction {hati} laugh_reaction {ketawa} confused_reaction "
      & "{keliru} hooray_reaction {hore} rocket_reaction {roket} other "
      & "{mata}}}}");
   P ("label.comments.reply_count_label", "{count, plural, =0 {tiada balasan} other {{count, number} balasan}}");
   P ("label.comments.resolved_label", "{name} diselesaikan");
   P ("label.comments.subscribe_label", "langgan {name}");
   P ("label.comments.thread_count_label", "{count, plural, =0 {tiada bebenang} other {{count, number} bebenang}}");
   P ("label.comments.thread_label",
      "{name}: bebenang {state, select, open_thread {terbuka} resolved_thread "
      & "{diselesaikan} locked_thread {dikunci} other {diarkibkan}}{count, "
      & "plural, =0 {} other {, {count, number} ulasan}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {bebenang terbuka} resolved_thread "
      & "{bebenang diselesaikan} locked_thread {bebenang dikunci} other "
      & "{bebenang diarkibkan}}");
   P ("label.comments.unpin_label", "nyahsemat {name}");
   P ("label.comments.unsubscribe_label", "nyahlanggan {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name}: bertambah baik} regressed {{name}: "
      & "merosot} unchanged {{name}: tidak berubah} within_tolerance {{name}: "
      & "dalam toleransi} outside_tolerance {{name}: di luar toleransi} "
      & "new_value {{name}: baharu} removed_value {{name}: dialih keluar} other "
      & "{{name}: garis dasar tidak tersedia}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {bertambah baik} regressed {merosot} "
      & "unchanged {tidak berubah} within_tolerance {dalam toleransi} "
      & "outside_tolerance {di luar toleransi} new_value {baharu} removed_value "
      & "{dialih keluar} other {garis dasar tidak tersedia}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name}: bertambah baik sebanyak "
      & "{difference_text}} regressed {{name}: merosot sebanyak "
      & "{difference_text}} unchanged {{name}: tidak berubah "
      & "({difference_text})} within_tolerance {{name}: dalam toleransi "
      & "({difference_text})} outside_tolerance {{name}: di luar toleransi "
      & "({difference_text})} new_value {{name}: baharu ({difference_text})} "
      & "removed_value {{name}: dialih keluar ({difference_text})} other "
      & "{{name}: garis dasar tidak tersedia ({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name}: bertambah baik sebanyak "
      & "{difference_text}, toleransi {tolerance_text}} regressed {{name}: "
      & "merosot sebanyak {difference_text}, toleransi {tolerance_text}} "
      & "unchanged {{name}: tidak berubah ({difference_text}), toleransi "
      & "{tolerance_text}} within_tolerance {{name}: dalam toleransi "
      & "({difference_text}), toleransi {tolerance_text}} outside_tolerance "
      & "{{name}: di luar toleransi ({difference_text}), toleransi "
      & "{tolerance_text}} new_value {{name}: baharu ({difference_text}), "
      & "toleransi {tolerance_text}} removed_value {{name}: dialih keluar "
      & "({difference_text}), toleransi {tolerance_text}} other {{name}: garis "
      & "dasar tidak tersedia ({difference_text}), toleransi {tolerance_text}}}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {baris tidak sah} duplicate_record {rekod "
      & "pendua} missing_column {lajur hilang} unknown_field {medan tidak "
      & "diketahui} schema_mismatch {skema tidak sepadan} other {rekod "
      & "dilangkau}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {larian percubaan lulus} dry_run_failed "
      & "{larian percubaan gagal} import_valid {import sah} import_invalid "
      & "{import tidak sah} other {import separa}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {larian percubaan lulus} "
      & "dry_run_failed {larian percubaan gagal} import_valid {import sah} "
      & "import_invalid {import tidak sah} other {import separa}} ({accepted, "
      & "number} diterima, {rejected, number} ditolak)");
   P ("label.data_quality.issue_count_label",
      "{count, plural, =0 {tiada {issue, select, invalid_row {baris tidak "
      & "sah} duplicate_record {rekod pendua} missing_column {lajur hilang} "
      & "unknown_field {medan tidak diketahui} schema_mismatch {ketidakpadanan "
      & "skema} other {rekod dilangkau}}} other {{count, number} {issue, "
      & "select, invalid_row {baris tidak sah} duplicate_record {rekod pendua} "
      & "missing_column {lajur hilang} unknown_field {medan tidak diketahui} "
      & "schema_mismatch {ketidakpadanan skema} other {rekod dilangkau}}}}");
   P ("label.data_quality.row_issue_label",
      "baris {row, number}: {issue, select, invalid_row {baris tidak sah} "
      & "duplicate_record {rekod pendua} missing_column {lajur hilang} "
      & "unknown_field {medan tidak diketahui} schema_mismatch {skema tidak "
      & "sepadan} other {rekod dilangkau}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {baris tidak sah} "
      & "duplicate_record {rekod pendua} missing_column {lajur hilang} "
      & "unknown_field {medan tidak diketahui} schema_mismatch {skema tidak "
      & "sepadan} other {rekod dilangkau}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artifak sedia} artifact_uploaded "
      & "{artifak dimuat naik} artifact_signed {artifak ditandatangani} "
      & "artifact_missing {artifak tiada} other {artifak tamat tempoh}}");
   P ("label.deployments.deployment_label",
      "{name} ke {environment}: {state, select, queued_deployment {atur letak "
      & "dalam baris gilir} deploying {sedang diatur letak} deployed {telah "
      & "diatur letak} failed_deployment {atur letak gagal} rolled_back {telah "
      & "digulung balik} blocked_deployment {atur letak disekat} other {atur "
      & "letak dibatalkan}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {atur letak dalam baris gilir} "
      & "deploying {sedang diatur letak} deployed {telah diatur letak} "
      & "failed_deployment {atur letak gagal} rolled_back {telah digulung "
      & "balik} blocked_deployment {atur letak disekat} other {atur letak "
      & "dibatalkan}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {persekitaran sihat} "
      & "drifting_environment {persekitaran menyimpang} locked_environment "
      & "{persekitaran dikunci} maintenance_environment {persekitaran dalam "
      & "penyelenggaraan} other {keadaan persekitaran tidak diketahui}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {tiada pemindahan} migration_pending "
      & "{pemindahan belum selesai} migrating {sedang dipindahkan} "
      & "migration_complete {pemindahan selesai} other {pemindahan gagal}}");
   P ("label.deployments.promotion_label", "{name} dinaikkan dari {from_environment} ke {to_environment}");
   P ("label.deployments.rollback_label", "{name}: gulung balik ke {target}");
   P ("label.deployments.rollout_label", "{name}: pelancaran berperingkat {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {tiada item terjejas} other {{count, number} item "
      & "terjejas}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {lulus} failed_check {gagal} "
      & "warning_check {ada amaran} skipped_check {dilangkau} pending_check "
      & "{belum selesai} other {berjalan}} ({duration_s, number} saat)");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {lulus} failed_check {gagal} "
      & "warning_check {ada amaran} skipped_check {dilangkau} pending_check "
      & "{belum selesai} other {berjalan}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {lulus} failed_check {gagal} "
      & "warning_check {amaran} skipped_check {dilangkau} pending_check {belum "
      & "selesai} other {berjalan}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {nilai diperlukan} expected_unit {unit "
      & "diperlukan} invalid_range {julat tidak sah} end_before_start {akhir "
      & "julat sebelum permulaan} unknown_field {medan tidak diketahui} "
      & "unsafe_redacted_value {nilai tidak selamat disembunyikan} "
      & "unsupported_syntax {sintaks tidak disokong} other {penjelasan "
      & "diagnostik}} untuk {subject}{position, plural, =0 {} other { pada "
      & "kedudukan {position, number}}}; gunakan {suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {maklumat} notice_severity {makluman} "
      & "warning_severity {amaran} error_severity {ralat} critical_severity "
      & "{kritikal} other {penyekat}} di {path}{line, plural, =0 {} other {, "
      & "baris {line, number}}}: {message}");
   P ("label.diagnostics.failed_at_label",
      "gagal di {path}{line, plural, =0 {} other {, baris {line, "
      & "number}{column, plural, =0 {} other {, lajur {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {maklumat} notice_severity {makluman} "
      & "warning_severity {amaran} error_severity {ralat} critical_severity "
      & "{kritikal} other {penyekat}} dalam {field_name}: {message}");
   P ("label.diagnostics.first_failure_label",
      "kegagalan pertama dalam {check_name} di {path}{line, plural, =0 {} "
      & "other {, baris {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{tiada isu} other {{notices, number} makluman}}} other {{notices, "
      & "plural, =0 {{warnings, number} amaran} other {{warnings, number} "
      & "amaran, {notices, number} makluman}}}}} other {{warnings, plural, =0 "
      & "{{notices, plural, =0 {{errors, number} ralat} other {{errors, number} "
      & "ralat, {notices, number} makluman}}} other {{notices, plural, =0 "
      & "{{errors, number} ralat, {warnings, number} amaran} other {{errors, "
      & "number} ralat, {warnings, number} amaran, {notices, number} "
      & "makluman}}}}}}");
   P ("label.diagnostics.location_label",
      "{path}{line, plural, =0 {} other {, baris {line, number}{column, "
      & "plural, =0 {} other {, lajur {column, number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "sintaks tidak disokong untuk {family, select, byte_parser {penghurai "
      & "bait} duration_parser {penghurai tempoh} date_time_parser {penghurai "
      & "tarikh-masa} color_parser {penghurai warna} url_parser {penghurai URL} "
      & "unit_parser {penghurai unit} recurrence_parser {penghurai ulangan} "
      & "domain_label_parser {penghurai label domain} other {penghurai}} "
      & "{error}{position, plural, =0 {} other { pada kedudukan {position, "
      & "number}}}; {family, select, byte_parser {gunakan B, kB, MB, GB, KiB, "
      & "MiB, GiB atau TiB} duration_parser {gunakan ms, s, min, h, d, w, month "
      & "atau year} date_time_parser {gunakan tarikh ISO, hari dalam bahasa "
      & "semula jadi atau waktu jam} color_parser {gunakan hex, rgb(), hsl(), "
      & "lab(), lch() atau nama warna} url_parser {gunakan skema, hos, laluan, "
      & "pertanyaan atau serpihan} unit_parser {gunakan label unit Humanize "
      & "yang disokong} recurrence_parser {gunakan cron atau bentuk ulangan "
      & "every/weekday} domain_label_parser {gunakan label domain Humanize yang "
      & "deterministik} other {gunakan bentuk input yang disokong}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {lulus} failed_check {gagal} "
      & "warning_check {ada amaran} skipped_check {dilangkau} pending_check "
      & "{belum selesai} other {berjalan}}, {notices, plural, =0 {tiada "
      & "makluman} other {{notices, number} makluman}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {cubaan semula 1 daripada 1} "
      & "other {had cubaan semula dilebihi ({attempt, number} daripada 1)}}} "
      & "other {cubaan semula {attempt, number} daripada {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {maklumat} notice_severity {makluman} "
      & "warning_severity {amaran} error_severity {ralat} critical_severity "
      & "{kritikal} other {penyekat}}");
   P ("label.diagnostics.source_label",
      "diagnostik {source, select, build_source {binaan} test_source {ujian} "
      & "lint_source {lint} import_source {import} validation_source "
      & "{pengesahan} runtime_source {masa jalan} security_source {keselamatan} "
      & "other {umum}}");
   P ("label.diagnostics.source_summary_label",
      "{count, number} diagnostik {source, select, build_source {binaan} "
      & "test_source {ujian} lint_source {lint} import_source {import} "
      & "validation_source {pengesahan} runtime_source {masa jalan} "
      & "security_source {keselamatan} other {umum}}");
   P ("label.diagnostics.suggested_action_label", "langkah seterusnya: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {nama domain} ipv4_host {alamat IPv4} "
      & "ipv6_host {alamat IPv6} localhost_host {hos setempat} "
      & "private_network_host {alamat rangkaian peribadi} other {hos tidak "
      & "diketahui}}");
   P ("label.events.all_day_label", "{name}: acara sepanjang hari");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {belum dijawab} accepted {diterima} "
      & "declined {ditolak} maybe {mungkin} other {dalam senarai menunggu}}");
   P ("label.events.attendee_count_label", "{count, plural, =0 {tiada peserta} other {{count, number} peserta}}");
   P ("label.events.canceled_label", "{name}: dibatalkan");
   P ("label.events.check_in_label", "daftar masuk ke {name}");
   P ("label.events.conference_link_label", "pautan persidangan {name}");
   P ("label.events.event_count_label", "{count, plural, =0 {tiada acara} other {{count, number} acara}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {acara dijadualkan} "
      & "tentative_event {acara tentatif} in_progress_event {acara sedang "
      & "berlangsung} completed_event {acara selesai} canceled_event {acara "
      & "dibatalkan} other {acara ditangguhkan}}");
   P ("label.events.event_location_label", "{name} di {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {acara dijadualkan} tentative_event "
      & "{acara tentatif} in_progress_event {acara sedang berlangsung} "
      & "completed_event {acara selesai} canceled_event {acara dibatalkan} "
      & "other {acara ditangguhkan}}");
   P ("label.events.event_time_label", "{name} pada {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {acara awam} private_event {acara "
      & "peribadi} busy_event {sibuk} other {lapang}}");
   P ("label.events.organizer_label", "dianjurkan oleh {name}");
   P ("label.events.rsvp_label",
      "RSVP: {state, select, not_responded {belum dijawab} accepted "
      & "{diterima} declined {ditolak} maybe {mungkin} other {dalam senarai "
      & "menunggu}}");
   P ("label.events.reminder_label", "peringatan {time_text}");
   P ("label.events.rescheduled_label", "{name} dijadualkan semula ke {time_text}");
   P ("label.forms.character_count_label", "{used, number} aksara");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {tiada had aksara} other {maksimum {limit, number} "
      & "aksara}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, number} aksara} other {{used, number} "
      & "daripada {limit, number} aksara}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}, medan pilihan} other {{name}, medan "
      & "wajib}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {sah} invalid_input {tidak sah} "
      & "required_input {wajib} optional_input {pilihan} disabled_input "
      & "{dinyahdayakan} other {baca sahaja}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {tiada isu borang} other "
      & "{{warnings, number} amaran}}} other {{warnings, plural, =0 {{errors, "
      & "number} ralat} other {{errors, number} ralat, {warnings, number} "
      & "amaran}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {belum dimulakan} editing_form {sedang "
      & "disunting} dirty_form {perubahan belum disimpan} saving_form "
      & "{menyimpan} saved_form {disimpan} submitted_form {diserahkan} other "
      & "{penyerahan gagal}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {input sah} invalid_input {input tidak "
      & "sah} required_input {input wajib} optional_input {input pilihan} "
      & "disabled_input {input dinyahdayakan} other {input baca sahaja}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {belum dimulakan} editing_form {sedang "
      & "disunting} dirty_form {perubahan belum disimpan} saving_form "
      & "{menyimpan borang} saved_form {borang disimpan} submitted_form {borang "
      & "diserahkan} other {{errors, plural, =0 {penyerahan gagal} other "
      & "{penyerahan gagal dengan {errors, number} ralat}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {tiada perubahan belum disimpan} other {{count, "
      & "number} perubahan belum disimpan}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {nama boleh capai "
      & "tiada} low_contrast {kontras rendah} skipped_heading_level {aras tajuk "
      & "dilangkau} missing_form_label {label borang tiada} invalid_aria {ARIA "
      & "tidak sah} keyboard_trap {perangkap papan kekunci} other {isu "
      & "kebolehcapaian tidak diketahui}}");
   P ("label.markup.accessibility_page_summary_label",
      "ringkasan kebolehcapaian {title}: {landmarks, number} mercu tanda, "
      & "{headings, number} tajuk, {issues, number} isu");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {tambah nama boleh capai} "
      & "low_contrast {tingkatkan kontras teks} skipped_heading_level {gunakan "
      & "aras tajuk secara berturutan} missing_form_label {kaitkan label dengan "
      & "kawalan borang} invalid_aria {gunakan peranan atau atribut ARIA yang "
      & "sah} keyboard_trap {pastikan fokus papan kekunci boleh meninggalkan "
      & "komponen} other {semak isu kebolehcapaian}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target} tiada isu kebolehcapaian} other "
      & "{{target} mempunyai {issues, number} isu kebolehcapaian}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {atribut id} class_attribute {atribut "
      & "class} data_attribute {atribut data} aria_attribute {atribut ARIA} "
      & "role_attribute {atribut role} link_attribute {atribut pautan} "
      & "media_attribute {atribut media} form_attribute {atribut borang} "
      & "boolean_attribute {atribut boolean} event_attribute {atribut "
      & "pengendali peristiwa} other {atribut tidak diketahui}}");
   P ("label.markup.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{form_name} tiada isu} "
      & "other {{form_name} mempunyai {warnings, number} amaran}}} other "
      & "{{warnings, plural, =0 {{form_name} mempunyai {errors, number} ralat} "
      & "other {{form_name} mempunyai {errors, number} ralat, {warnings, "
      & "number} amaran}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {mercu tanda sepanduk} navigation_role "
      & "{mercu tanda navigasi} main_role {mercu tanda utama} "
      & "complementary_role {mercu tanda pelengkap} contentinfo_role {mercu "
      & "tanda maklumat kandungan} search_role {mercu tanda carian} form_role "
      & "{mercu tanda borang} region_role {mercu tanda kawasan} dialog_role "
      & "{dialog} alert_role {kawasan langsung amaran} status_role {kawasan "
      & "langsung status} other {mercu tanda tidak diketahui}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}, kemas kini segera: {update}} other "
      & "{{region}, kemas kini tidak mendesak: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {kandungan teks} html_content {kandungan "
      & "HTML} json_content {kandungan JSON} xml_content {kandungan XML} "
      & "image_content {kandungan imej} audio_content {kandungan audio} "
      & "video_content {kandungan video} font_content {kandungan fon} "
      & "archive_content {kandungan arkib} binary_content {kandungan binari} "
      & "form_content {kandungan borang} other {kandungan tidak diketahui}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {tag dokumen} metadata_tag {tag metadata} "
      & "section_tag {tag bahagian} text_tag {tag teks} link_tag {tag pautan} "
      & "media_tag {tag media} form_tag {tag borang} table_tag {tag jadual} "
      & "interactive_tag {tag interaktif} scripting_tag {tag skrip} other {tag "
      & "tidak diketahui}}");
   P ("label.media.duration_label", "tempoh {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {imej} video_media {video} audio_media "
      & "{audio} pdf_document {dokumen PDF} text_document {dokumen teks} "
      & "archive_media {arkib} other {media}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {sedia} processing_media {sedang diproses} "
      & "transcoding_media {sedang ditranskod} thumbnail_missing {lakaran kecil "
      & "tidak tersedia} metadata_missing {metadata tiada} locked_document "
      & "{dokumen dikunci} other {tidak tersedia}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {imej} video_media {video} "
      & "audio_media {audio} pdf_document {dokumen PDF} text_document {dokumen "
      & "teks} archive_media {arkib} other {media}}): {state, select, "
      & "ready_media {sedia} processing_media {sedang diproses} "
      & "transcoding_media {sedang ditranskod} thumbnail_missing {lakaran kecil "
      & "tidak tersedia} metadata_missing {metadata tiada} locked_document "
      & "{dokumen dikunci} other {tidak tersedia}}");
   P ("label.media.page_count_label", "{pages, plural, =0 {tiada halaman} other {{pages, number} halaman}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "{item}: rayuan, {state, select, open_report {laporan terbuka} "
      & "triaged_report {laporan sudah ditriaj} actioned_report {tindakan sudah "
      & "diambil} dismissed_report {laporan ditolak} appealed_report {laporan "
      & "dirayu} other {laporan ditutup}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {tiada tindakan moderasi} flagged {ditanda} "
      & "hidden {disembunyikan oleh moderator} restored {dipulihkan} "
      & "marked_spam {ditanda sebagai spam} removed {dialih keluar} other "
      & "{dieskalasi}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {tiada tindakan moderasi} flagged "
      & "{ditanda} hidden {disembunyikan oleh moderator} restored {dipulihkan} "
      & "marked_spam {ditanda sebagai spam} removed {dialih keluar} other "
      & "{dieskalasi}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {baris gilir moderasi "
      & "kosong} other {{pending, number} menunggu semakan}}} other {{pending, "
      & "number} menunggu semakan, {escalated, number} dieskalasi}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {laporan terbuka} triaged_report "
      & "{laporan sudah ditriaj} actioned_report {tindakan sudah diambil} "
      & "dismissed_report {laporan ditolak} appealed_report {laporan dirayu} "
      & "other {laporan ditutup}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {laporan terbuka} triaged_report {laporan "
      & "sudah ditriaj} actioned_report {tindakan sudah diambil} "
      & "dismissed_report {laporan ditolak} appealed_report {laporan dirayu} "
      & "other {laporan ditutup}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {menunggu semakan} approved "
      & "{diluluskan} rejected {ditolak} needs_changes {perlu perubahan} other "
      & "{semakan dieskalasi}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {menunggu semakan} approved "
      & "{diluluskan} rejected {ditolak} needs_changes {perlu perubahan} other "
      & "{semakan dieskalasi}}");
   P ("label.navigation.back_label", "kembali ke {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {tiada serbuk roti} other {{depth, number} serbuk "
      & "roti}}");
   P ("label.navigation.current_page_label", "halaman semasa: {name}");
   P ("label.navigation.external_link_label", "{name}, pautan luaran");
   P ("label.navigation.first_label", "pertama: {target}");
   P ("label.navigation.last_label", "terakhir: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {tiada item menu} other {{count, number} item "
      & "menu}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {pautan} menu_item {item menu} tab_item {tab} "
      & "breadcrumb_item {serbuk roti} section_item {bahagian} other {pemisah}}");
   P ("label.navigation.navigation_item_label",
      "{name}, {kind, select, link_item {pautan} menu_item {item menu} "
      & "tab_item {tab} breadcrumb_item {serbuk roti} section_item {bahagian} "
      & "other {pemisah}}: {state, select, current_item {semasa} active_item "
      & "{aktif} inactive_item {tidak aktif} disabled_item {dinyahdayakan} "
      & "expanded_item {dikembangkan} collapsed_item {dikuncupkan} visited_item "
      & "{sudah dilawati} other {luaran}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {semasa} active_item {aktif} "
      & "inactive_item {tidak aktif} disabled_item {dinyahdayakan} "
      & "expanded_item {dikembangkan} collapsed_item {dikuncupkan} visited_item "
      & "{sudah dilawati} other {luaran}}");
   P ("label.navigation.next_label", "seterusnya: {target}");
   P ("label.navigation.section_state_label",
      "bahagian {name} {expanded, select, false {dikuncupkan} other "
      & "{dikembangkan}}{count, plural, =0 {} other {, {count, number} item}}");
   P ("label.navigation.skip_link_label", "langkau ke {target}");
   P ("label.navigation.submenu_label", "submenu {name}, {count, number} item");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {semua amaran} important_alerts {amaran "
      & "penting} critical_alerts_only {amaran kritikal sahaja} other {tiada "
      & "amaran}}");
   P ("label.notification_preferences.channel_preference_label",
      "pemberitahuan {channel} {state, select, preference_enabled {didayakan} "
      & "preference_disabled {dinyahdayakan} preference_inherited {diwarisi} "
      & "other {diwajibkan}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {tiada ringkasan} instant_digest "
      & "{ringkasan segera} daily_digest {ringkasan harian} other {ringkasan "
      & "mingguan}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {didayakan} preference_disabled "
      & "{dinyahdayakan} preference_inherited {diwarisi} other {diwajibkan}}");
   P ("label.notification_preferences.quiet_hours_label", "waktu senyap {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: langganan {scope, select, thread_subscription {bebenang} "
      & "project_subscription {projek} team_subscription {pasukan} other "
      & "{akaun}} {state, select, preference_enabled {didayakan} "
      & "preference_disabled {dinyahdayakan} preference_inherited {diwarisi} "
      & "other {diwajibkan}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {langganan bebenang} "
      & "project_subscription {langganan projek} team_subscription {langganan "
      & "pasukan} other {langganan akaun}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} menyebut anda} reply_event "
      & "{{actor} membalas} assignment_event {{actor} menugaskan anda} "
      & "approval_event {{actor} meminta kelulusan} alert_event {{actor} "
      & "menghantar amaran} digest_event {{actor} menghantar ringkasan} "
      & "reminder_event {{actor} menghantar peringatan} other {{actor} "
      & "menghantar pemberitahuan sistem}}");
   P ("label.notifications.delivery_label",
      "pemberitahuan {channel, select, in_app_channel {dalam apl} "
      & "email_channel {e-mel} sms_channel {SMS} push_channel {tolak} "
      & "webhook_channel {webhook} other {ringkasan}} {state, select, "
      & "pending_delivery {belum selesai} sent_delivery {dihantar} "
      & "delivered_delivery {diterima} failed_delivery {gagal} "
      & "retrying_delivery {sedang dicuba semula} other {dibatalkan}}");
end Labels_1;
