separate (Humanize.Catalogs.Phrase_Data.Locale_Id)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name}: akun aktif} invited_account "
      & "{{name}: akun diundang} locked_account {{name}: akun terkunci} "
      & "suspended_account {{name}: akun ditangguhkan} deleted_account {{name}: "
      & "akun dihapus} other {{name}: status akun tidak diketahui}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {akun aktif} invited_account {akun "
      & "diundang} locked_account {akun terkunci} suspended_account {akun "
      & "ditangguhkan} deleted_account {akun dihapus} other {status akun tidak "
      & "diketahui}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {perangkat tepercaya} untrusted_device "
      & "{perangkat tidak tepercaya} new_device {perangkat baru} other "
      & "{perangkat diblokir}}");
   P ("label.accounts.last_active_label", "{name} terakhir aktif {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: login gagal} other {{name}: login "
      & "berhasil}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA aktif} mfa_disabled {MFA nonaktif} "
      & "mfa_required {MFA wajib} other {MFA perlu disetel ulang}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: sesi aktif} expired_session "
      & "{{name}: sesi berakhir} revoked_session {{name}: sesi dicabut} "
      & "idle_session {{name}: sesi tidak aktif} other {{name}: status sesi "
      & "tidak diketahui}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {sesi aktif} expired_session {sesi "
      & "berakhir} revoked_session {sesi dicabut} idle_session {sesi tidak "
      & "aktif} other {status sesi tidak diketahui}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {tidak ada lampiran} other {{count, number} "
      & "lampiran}}");
   P ("label.attachments.attachment_group_label", "{name}: {count, number} lampiran");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {lampiran file} image_attachment "
      & "{lampiran gambar} video_attachment {lampiran video} audio_attachment "
      & "{lampiran audio} document_attachment {lampiran dokumen} "
      & "archive_attachment {lampiran arsip} other {lampiran tautan}}");
   P ("label.attachments.attachment_label",
      "{name}, {kind, select, file_attachment {file} image_attachment "
      & "{gambar} video_attachment {video} audio_attachment {audio} "
      & "document_attachment {dokumen} archive_attachment {arsip} other "
      & "{tautan}}: {state, select, pending_attachment {tertunda} "
      & "uploading_attachment {sedang diunggah} uploaded_attachment {diunggah} "
      & "failed_attachment {gagal diunggah} removed_attachment {dihapus} other "
      & "{diblokir}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {lampiran tertunda} "
      & "uploading_attachment {lampiran sedang diunggah} uploaded_attachment "
      & "{lampiran diunggah} failed_attachment {lampiran gagal diunggah} "
      & "removed_attachment {lampiran dihapus} other {lampiran diblokir}}");
   P ("label.attachments.download_label", "unduh {name}");
   P ("label.attachments.expiring_link_label", "tautan {name} kedaluwarsa {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "pratinjau {name}");
   P ("label.attachments.remove_label", "hapus {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: belum dipindai} scanning {{name}: "
      & "sedang dipindai} safe {{name}: aman} suspicious {{name}: mencurigakan} "
      & "other {{name}: terinfeksi}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {belum dipindai} scanning {sedang "
      & "dipindai} safe {aman} suspicious {mencurigakan} other {terinfeksi}}");
   P ("label.attachments.upload_error_label", "{name} gagal diunggah: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {lencana} new_badge {lencana "
      & "baru} updated_badge {lencana diperbarui} deprecated_badge {lencana "
      & "usang} selected_badge {lencana dipilih} disabled_badge {lencana "
      & "nonaktif} other {lencana yang dapat ditutup}}, {tone, select, "
      & "neutral_tone {nada netral} info_tone {nada info} success_tone {nada "
      & "sukses} warning_tone {nada peringatan} danger_tone {nada bahaya} other "
      & "{nada redup}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {lencana prioritas rendah} "
      & "medium_priority {lencana prioritas sedang} high_priority {lencana "
      & "prioritas tinggi} other {lencana prioritas kritis}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {lencana default} new_badge {lencana "
      & "baru} updated_badge {lencana diperbarui} deprecated_badge {lencana "
      & "usang} selected_badge {lencana dipilih} disabled_badge {lencana "
      & "nonaktif} other {lencana yang dapat ditutup}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {lencana netral} info_tone {lencana info} "
      & "success_tone {lencana sukses} warning_tone {lencana peringatan} "
      & "danger_tone {lencana bahaya} other {lencana redup}}");
   P ("label.badges.chip_label", "{selected, select, false {chip {name}} other {chip {name}, dipilih}}");
   P ("label.badges.count_badge_label", "{count, plural, other {{name}: {count, number}}}");
   P ("label.badges.deprecated_label", "{name}: lencana usang");
   P ("label.badges.dismiss_label", "tutup {name}");
   P ("label.badges.new_label", "{name}: lencana baru");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {tidak ada lencana tersembunyi} other "
      & "{+{hidden_count, number} lencana lagi}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: lencana prioritas rendah} "
      & "medium_priority {{name}: lencana prioritas sedang} high_priority "
      & "{{name}: lencana prioritas tinggi} other {{name}: lencana prioritas "
      & "kritis}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {status {name}: netral} info_tone {status "
      & "{name}: info} success_tone {status {name}: sukses} warning_tone "
      & "{status {name}: peringatan} danger_tone {status {name}: bahaya} other "
      & "{status {name}: redup}}");
   P ("label.badges.tag_count_label", "{count, plural, =0 {tidak ada tag} other {{count, number} tag}}");
   P ("label.badges.tag_label", "tag {name}");
   P ("label.badges.updated_label", "{name}: lencana diperbarui");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefak diunggah} artifact_missing "
      & "{artefak tidak ada} artifact_expired {artefak kedaluwarsa} other "
      & "{artefak terverifikasi}}");
   P ("label.builds.benchmark_label", "benchmark {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {{name}: build dalam antrean} "
      & "build_running {{name}: build berjalan} build_passed {{name}: build "
      & "berhasil} build_failed {{name}: build gagal} snapshot_build {{name}: "
      & "build snapshot} other {{name}: build rilis}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {build dalam antrean} build_running "
      & "{build berjalan} build_passed {build berhasil} build_failed {build "
      & "gagal} snapshot_build {build snapshot} other {build rilis}}");
   P ("label.builds.coverage_label", "cakupan {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {gerbang rilis lolos} gate_failed {gerbang "
      & "rilis gagal} gate_warning {gerbang rilis memberi peringatan} other "
      & "{gerbang rilis diblokir}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {tidak ada tes yang "
      & "lulus} other {{count, number} tes lulus}}} failed_test {{count, "
      & "plural, =0 {tidak ada tes yang gagal} other {{count, number} tes "
      & "gagal}}} skipped_test {{count, plural, =0 {tidak ada tes yang "
      & "dilewati} other {{count, number} tes dilewati}}} flaky_test {{count, "
      & "plural, =0 {tidak ada tes yang tidak stabil} other {{count, number} "
      & "tes tidak stabil}}} other {{count, plural, =0 {tidak ada tes yang "
      & "gagal sesuai harapan} other {{count, number} tes gagal sesuai "
      & "harapan}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {lulus} failed_test {gagal} skipped_test "
      & "{dilewati} flaky_test {tidak stabil} other {gagal sesuai harapan}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "tidak berubah, nonaktif} other {{field_name} berubah dari nonaktif "
      & "menjadi aktif}}} other {{new_value, select, false {{field_name} "
      & "berubah dari aktif menjadi nonaktif} other {{field_name} tidak "
      & "berubah, aktif}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {ditambahkan} removed_change {dihapus} "
      & "modified_change {diubah} renamed_change {diganti nama} "
      & "unchanged_change {tidak berubah} metadata_change {metadata diubah} "
      & "moved_change {dipindahkan} conflict_change {konflik} other {perubahan "
      & "tidak diketahui}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {perubahan informasional} "
      & "minor_change {perubahan minor} major_change {perubahan mayor} other "
      & "{perubahan tidak kompatibel}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} tidak berubah} "
      & "other {{unchanged, plural, =0 {{field_name} diubah: {added, number} "
      & "ditambahkan} other {{field_name} diubah: {added, number} ditambahkan, "
      & "{unchanged, number} tidak berubah}}}}} other {{added, plural, =0 "
      & "{{unchanged, plural, =0 {{field_name} diubah: {removed, number} "
      & "dihapus} other {{field_name} diubah: {removed, number} dihapus, "
      & "{unchanged, number} tidak berubah}}} other {{unchanged, plural, =0 "
      & "{{field_name} diubah: {added, number} ditambahkan, {removed, number} "
      & "dihapus} other {{field_name} diubah: {added, number} ditambahkan, "
      & "{removed, number} dihapus, {unchanged, number} tidak berubah}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {tidak ada konflik} other {{count, number} "
      & "konflik}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} dimundurkan dari {old_label} ke "
      & "{new_label}} other {{field_name} dimajukan dari {old_label} ke "
      & "{new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} berubah dari {old_label} menjadi {new_label}");
   P ("label.changes.field_change_label", "{field_name} berubah dari {old_value} menjadi {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name} ditambahkan} removed_change "
      & "{{name} dihapus} modified_change {{name} diubah} renamed_change "
      & "{{name} diganti nama} unchanged_change {{name} tidak berubah} "
      & "metadata_change {metadata {name} diubah} moved_change {{name} "
      & "dipindahkan} conflict_change {{name}: konflik} other {{name}: "
      & "perubahan tidak diketahui}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {hanya metadata yang berubah} other {hanya {count, "
      & "number} bidang metadata yang berubah}}");
   P ("label.changes.move_label", "{name} dipindahkan dari {from} ke {to}");
   P ("label.changes.no_changes_label", "tidak ada perubahan");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {tidak ada "
      & "perubahan baris} other {{lines_added, number} baris ditambahkan}}} "
      & "other {{lines_added, plural, =0 {{lines_removed, number} baris "
      & "dihapus} other {{lines_added, number} baris ditambahkan, "
      & "{lines_removed, number} baris dihapus}}}}");
   P ("label.changes.rename_label", "nama diubah dari {old_name} menjadi {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} membuat draf komentar} "
      & "published_comment {{author} berkomentar} edited_comment {{author} "
      & "mengedit komentar} deleted_comment {{author} menghapus komentar} "
      & "resolved_comment {{author} menyelesaikan komentar} unresolved_comment "
      & "{{author} membuka kembali komentar} pinned_comment {{author} "
      & "menyematkan komentar} other {{author} menyembunyikan komentar}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {tidak ada komentar} other {{count, number} "
      & "komentar}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author}: draf komentar} "
      & "published_comment {{author}: komentar dipublikasikan} edited_comment "
      & "{{author}: komentar diedit} deleted_comment {{author}: komentar "
      & "dihapus} resolved_comment {{author}: komentar diselesaikan} "
      & "unresolved_comment {{author}: komentar belum diselesaikan} "
      & "pinned_comment {{author}: komentar disematkan} other {{author}: "
      & "komentar disembunyikan}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {draf komentar} published_comment "
      & "{komentar dipublikasikan} edited_comment {komentar diedit} "
      & "deleted_comment {komentar dihapus} resolved_comment {komentar "
      & "diselesaikan} unresolved_comment {komentar belum diselesaikan} "
      & "pinned_comment {komentar disematkan} other {komentar disembunyikan}}");
   P ("label.comments.deleted_label", "{author} menghapus komentar");
   P ("label.comments.edited_label", "diedit {time_text}");
   P ("label.comments.hide_comment_label", "sembunyikan komentar: {reason}");
   P ("label.comments.lock_thread_label", "kunci utas {name}");
   P ("label.comments.mention_label", "{actor} menyebut {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {tidak ada peserta} other {{count, number} "
      & "peserta}}");
   P ("label.comments.pin_label", "sematkan {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reaksi suka} dislike_reaction {reaksi "
      & "tidak suka} heart_reaction {reaksi hati} laugh_reaction {reaksi "
      & "tertawa} confused_reaction {reaksi bingung} hooray_reaction {reaksi "
      & "hore} rocket_reaction {reaksi roket} other {reaksi mata}}");
   P ("label.comments.reaction_label",
      "{count, plural, =0 {tidak ada reaksi {kind, select, like_reaction "
      & "{suka} dislike_reaction {tidak suka} heart_reaction {hati} "
      & "laugh_reaction {tertawa} confused_reaction {bingung} hooray_reaction "
      & "{hore} rocket_reaction {roket} other {mata}}} other {{count, number} "
      & "reaksi {kind, select, like_reaction {suka} dislike_reaction {tidak "
      & "suka} heart_reaction {hati} laugh_reaction {tertawa} confused_reaction "
      & "{bingung} hooray_reaction {hore} rocket_reaction {roket} other "
      & "{mata}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {tidak ada balasan} other {{count, number} "
      & "balasan}}");
   P ("label.comments.resolved_label", "{name} diselesaikan");
   P ("label.comments.subscribe_label", "berlangganan {name}");
   P ("label.comments.thread_count_label", "{count, plural, =0 {tidak ada utas} other {{count, number} utas}}");
   P ("label.comments.thread_label",
      "{name}: utas {state, select, open_thread {terbuka} resolved_thread "
      & "{diselesaikan} locked_thread {dikunci} other {diarsipkan}}{count, "
      & "plural, =0 {} other {, {count, number} komentar}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {utas terbuka} resolved_thread {utas "
      & "diselesaikan} locked_thread {utas dikunci} other {utas diarsipkan}}");
   P ("label.comments.unpin_label", "lepas sematan {name}");
   P ("label.comments.unsubscribe_label", "berhenti berlangganan {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name}: membaik} regressed {{name}: "
      & "memburuk} unchanged {{name}: tidak berubah} within_tolerance {{name}: "
      & "dalam toleransi} outside_tolerance {{name}: di luar toleransi} "
      & "new_value {{name}: baru} removed_value {{name}: dihapus} other "
      & "{{name}: acuan tidak tersedia}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {membaik} regressed {memburuk} unchanged "
      & "{tidak berubah} within_tolerance {dalam toleransi} outside_tolerance "
      & "{di luar toleransi} new_value {baru} removed_value {dihapus} other "
      & "{acuan tidak tersedia}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name}: membaik sebesar {difference_text}} "
      & "regressed {{name}: memburuk sebesar {difference_text}} unchanged "
      & "{{name}: tidak berubah ({difference_text})} within_tolerance {{name}: "
      & "dalam toleransi ({difference_text})} outside_tolerance {{name}: di "
      & "luar toleransi ({difference_text})} new_value {{name}: baru "
      & "({difference_text})} removed_value {{name}: dihapus "
      & "({difference_text})} other {{name}: acuan tidak tersedia "
      & "({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name}: membaik sebesar {difference_text}, "
      & "toleransi {tolerance_text}} regressed {{name}: memburuk sebesar "
      & "{difference_text}, toleransi {tolerance_text}} unchanged {{name}: "
      & "tidak berubah ({difference_text}), toleransi {tolerance_text}} "
      & "within_tolerance {{name}: dalam toleransi ({difference_text}), "
      & "toleransi {tolerance_text}} outside_tolerance {{name}: di luar "
      & "toleransi ({difference_text}), toleransi {tolerance_text}} new_value "
      & "{{name}: baru ({difference_text}), toleransi {tolerance_text}} "
      & "removed_value {{name}: dihapus ({difference_text}), toleransi "
      & "{tolerance_text}} other {{name}: acuan tidak tersedia "
      & "({difference_text}), toleransi {tolerance_text}}}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {baris tidak valid} duplicate_record "
      & "{catatan duplikat} missing_column {kolom hilang} unknown_field {bidang "
      & "tidak dikenal} schema_mismatch {skema tidak cocok} other {catatan "
      & "dilewati}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {uji coba berhasil} dry_run_failed {uji "
      & "coba gagal} import_valid {impor valid} import_invalid {impor tidak "
      & "valid} other {impor sebagian}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {uji coba berhasil} "
      & "dry_run_failed {uji coba gagal} import_valid {impor valid} "
      & "import_invalid {impor tidak valid} other {impor sebagian}} ({accepted, "
      & "number} diterima, {rejected, number} ditolak)");
   P ("label.data_quality.issue_count_label",
      "{count, plural, =0 {tidak ada {issue, select, invalid_row {baris tidak "
      & "valid} duplicate_record {catatan duplikat} missing_column {kolom yang "
      & "hilang} unknown_field {bidang tidak dikenal} schema_mismatch "
      & "{ketidakcocokan skema} other {catatan yang dilewati}}} other {{count, "
      & "number} {issue, select, invalid_row {baris tidak valid} "
      & "duplicate_record {catatan duplikat} missing_column {kolom hilang} "
      & "unknown_field {bidang tidak dikenal} schema_mismatch {ketidakcocokan "
      & "skema} other {catatan dilewati}}}}");
   P ("label.data_quality.row_issue_label",
      "baris {row, number}: {issue, select, invalid_row {baris tidak valid} "
      & "duplicate_record {catatan duplikat} missing_column {kolom hilang} "
      & "unknown_field {bidang tidak dikenal} schema_mismatch {skema tidak "
      & "cocok} other {catatan dilewati}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {baris tidak valid} "
      & "duplicate_record {catatan duplikat} missing_column {kolom hilang} "
      & "unknown_field {bidang tidak dikenal} schema_mismatch {skema tidak "
      & "cocok} other {catatan dilewati}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefak siap} artifact_uploaded "
      & "{artefak diunggah} artifact_signed {artefak ditandatangani} "
      & "artifact_missing {artefak tidak ada} other {artefak kedaluwarsa}}");
   P ("label.deployments.deployment_label",
      "{name} ke {environment}: {state, select, queued_deployment {deploy "
      & "dalam antrean} deploying {sedang men-deploy} deployed {sudah "
      & "di-deploy} failed_deployment {deploy gagal} rolled_back {sudah "
      & "di-rollback} blocked_deployment {deploy diblokir} other {deploy "
      & "dibatalkan}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {deploy dalam antrean} deploying "
      & "{sedang men-deploy} deployed {sudah di-deploy} failed_deployment "
      & "{deploy gagal} rolled_back {sudah di-rollback} blocked_deployment "
      & "{deploy diblokir} other {deploy dibatalkan}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {lingkungan sehat} "
      & "drifting_environment {lingkungan menyimpang} locked_environment "
      & "{lingkungan terkunci} maintenance_environment {lingkungan dalam "
      & "pemeliharaan} other {status lingkungan tidak diketahui}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {tidak ada migrasi} migration_pending "
      & "{migrasi tertunda} migrating {sedang migrasi} migration_complete "
      & "{migrasi selesai} other {migrasi gagal}}");
   P ("label.deployments.promotion_label", "{name} dipromosikan dari {from_environment} ke {to_environment}");
   P ("label.deployments.rollback_label", "{name}: rollback ke {target}");
   P ("label.deployments.rollout_label", "{name}: peluncuran bertahap {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {tidak ada item terdampak} other {{count, number} "
      & "item terdampak}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {lulus} failed_check {gagal} "
      & "warning_check {ada peringatan} skipped_check {dilewati} pending_check "
      & "{tertunda} other {berjalan}} ({duration_s, number} detik)");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {lulus} failed_check {gagal} "
      & "warning_check {ada peringatan} skipped_check {dilewati} pending_check "
      & "{tertunda} other {berjalan}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {lulus} failed_check {gagal} "
      & "warning_check {peringatan} skipped_check {dilewati} pending_check "
      & "{tertunda} other {berjalan}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {diperlukan nilai} expected_unit "
      & "{diperlukan satuan} invalid_range {rentang tidak valid} "
      & "end_before_start {akhir rentang sebelum awal} unknown_field {bidang "
      & "tidak dikenal} unsafe_redacted_value {nilai tidak aman disamarkan} "
      & "unsupported_syntax {sintaksis tidak didukung} other {penjelasan "
      & "diagnostik}} untuk {subject}{position, plural, =0 {} other { pada "
      & "posisi {position, number}}}; gunakan {suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {info} notice_severity "
      & "{pemberitahuan} warning_severity {peringatan} error_severity "
      & "{kesalahan} critical_severity {kritis} other {pemblokir}} di "
      & "{path}{line, plural, =0 {} other {, baris {line, number}}}: {message}");
   P ("label.diagnostics.failed_at_label",
      "gagal di {path}{line, plural, =0 {} other {, baris {line, "
      & "number}{column, plural, =0 {} other {, kolom {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {info} notice_severity "
      & "{pemberitahuan} warning_severity {peringatan} error_severity "
      & "{kesalahan} critical_severity {kritis} other {pemblokir}} di "
      & "{field_name}: {message}");
   P ("label.diagnostics.first_failure_label",
      "kegagalan pertama di {check_name} pada {path}{line, plural, =0 {} "
      & "other {, baris {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{tidak ada masalah} other {{notices, number} pemberitahuan}}} other "
      & "{{notices, plural, =0 {{warnings, number} peringatan} other "
      & "{{warnings, number} peringatan, {notices, number} pemberitahuan}}}}} "
      & "other {{warnings, plural, =0 {{notices, plural, =0 {{errors, number} "
      & "kesalahan} other {{errors, number} kesalahan, {notices, number} "
      & "pemberitahuan}}} other {{notices, plural, =0 {{errors, number} "
      & "kesalahan, {warnings, number} peringatan} other {{errors, number} "
      & "kesalahan, {warnings, number} peringatan, {notices, number} "
      & "pemberitahuan}}}}}}");
   P ("label.diagnostics.location_label",
      "{path}{line, plural, =0 {} other {, baris {line, number}{column, "
      & "plural, =0 {} other {, kolom {column, number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "sintaksis tidak didukung untuk {family, select, byte_parser {parser "
      & "byte} duration_parser {parser durasi} date_time_parser {parser "
      & "tanggal-waktu} color_parser {parser warna} url_parser {parser URL} "
      & "unit_parser {parser satuan} recurrence_parser {parser pengulangan} "
      & "domain_label_parser {parser label domain} other {parser}} "
      & "{error}{position, plural, =0 {} other { pada posisi {position, "
      & "number}}}; {family, select, byte_parser {gunakan B, kB, MB, GB, KiB, "
      & "MiB, GiB, atau TiB} duration_parser {gunakan ms, s, min, h, d, w, "
      & "month, atau year} date_time_parser {gunakan tanggal ISO, hari dalam "
      & "bahasa alami, atau jam} color_parser {gunakan hex, rgb(), hsl(), "
      & "lab(), lch(), atau nama warna} url_parser {gunakan skema, host, jalur, "
      & "kueri, atau fragmen} unit_parser {gunakan label satuan Humanize yang "
      & "didukung} recurrence_parser {gunakan cron atau bentuk pengulangan "
      & "every/weekday} domain_label_parser {gunakan label domain Humanize yang "
      & "deterministik} other {gunakan bentuk input yang didukung}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {lulus} failed_check {gagal} "
      & "warning_check {ada peringatan} skipped_check {dilewati} pending_check "
      & "{tertunda} other {berjalan}}, {notices, plural, =0 {tanpa "
      & "pemberitahuan} other {{notices, number} pemberitahuan}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {percobaan ulang 1 dari 1} "
      & "other {batas percobaan ulang terlampaui ({attempt, number} dari 1)}}} "
      & "other {percobaan ulang {attempt, number} dari {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {info} notice_severity "
      & "{pemberitahuan} warning_severity {peringatan} error_severity "
      & "{kesalahan} critical_severity {kritis} other {pemblokir}}");
   P ("label.diagnostics.source_label",
      "diagnostik {source, select, build_source {build} test_source "
      & "{pengujian} lint_source {lint} import_source {impor} validation_source "
      & "{validasi} runtime_source {runtime} security_source {keamanan} other "
      & "{umum}}");
   P ("label.diagnostics.source_summary_label",
      "{count, number} diagnostik {source, select, build_source {build} "
      & "test_source {pengujian} lint_source {lint} import_source {impor} "
      & "validation_source {validasi} runtime_source {runtime} security_source "
      & "{keamanan} other {umum}}");
   P ("label.diagnostics.suggested_action_label", "langkah berikutnya: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {nama domain} ipv4_host {alamat IPv4} "
      & "ipv6_host {alamat IPv6} localhost_host {host lokal} "
      & "private_network_host {alamat jaringan privat} other {host tidak "
      & "dikenal}}");
   P ("label.events.all_day_label", "{name}: acara sepanjang hari");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {belum menanggapi} accepted {diterima} "
      & "declined {ditolak} maybe {mungkin} other {dalam daftar tunggu}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {tidak ada peserta} other {{count, number} "
      & "peserta}}");
   P ("label.events.canceled_label", "{name}: dibatalkan");
   P ("label.events.check_in_label", "check-in ke {name}");
   P ("label.events.conference_link_label", "tautan konferensi {name}");
   P ("label.events.event_count_label", "{count, plural, =0 {tidak ada acara} other {{count, number} acara}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {acara terjadwal} "
      & "tentative_event {acara tentatif} in_progress_event {acara sedang "
      & "berlangsung} completed_event {acara selesai} canceled_event {acara "
      & "dibatalkan} other {acara ditunda}}");
   P ("label.events.event_location_label", "{name} di {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {acara terjadwal} tentative_event "
      & "{acara tentatif} in_progress_event {acara sedang berlangsung} "
      & "completed_event {acara selesai} canceled_event {acara dibatalkan} "
      & "other {acara ditunda}}");
   P ("label.events.event_time_label", "{name} pada {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {acara publik} private_event {acara "
      & "pribadi} busy_event {sibuk} other {luang}}");
   P ("label.events.organizer_label", "diselenggarakan oleh {name}");
   P ("label.events.rsvp_label",
      "RSVP: {state, select, not_responded {belum menanggapi} accepted "
      & "{diterima} declined {ditolak} maybe {mungkin} other {dalam daftar "
      & "tunggu}}");
   P ("label.events.reminder_label", "pengingat {time_text}");
   P ("label.events.rescheduled_label", "{name} dijadwalkan ulang ke {time_text}");
   P ("label.forms.character_count_label", "{used, number} karakter");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {tanpa batas karakter} other {maksimal {limit, "
      & "number} karakter}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, number} karakter} other {{used, number} "
      & "dari {limit, number} karakter}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}, bidang opsional} other {{name}, "
      & "bidang wajib}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {valid} invalid_input {tidak "
      & "valid} required_input {wajib} optional_input {opsional} disabled_input "
      & "{dinonaktifkan} other {hanya baca}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {tidak ada masalah "
      & "formulir} other {{warnings, number} peringatan}}} other {{warnings, "
      & "plural, =0 {{errors, number} kesalahan} other {{errors, number} "
      & "kesalahan, {warnings, number} peringatan}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {belum dimulai} editing_form {sedang "
      & "diedit} dirty_form {perubahan belum disimpan} saving_form {menyimpan} "
      & "saved_form {tersimpan} submitted_form {terkirim} other {pengiriman "
      & "gagal}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {input valid} invalid_input {input tidak "
      & "valid} required_input {input wajib} optional_input {input opsional} "
      & "disabled_input {input dinonaktifkan} other {input hanya baca}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {belum dimulai} editing_form {sedang "
      & "diedit} dirty_form {perubahan belum disimpan} saving_form {menyimpan "
      & "formulir} saved_form {formulir tersimpan} submitted_form {formulir "
      & "terkirim} other {{errors, plural, =0 {pengiriman gagal} other "
      & "{pengiriman gagal dengan {errors, number} kesalahan}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {tidak ada perubahan yang belum disimpan} other "
      & "{{count, number} perubahan belum disimpan}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {nama aksesibel "
      & "tidak ada} low_contrast {kontras rendah} skipped_heading_level "
      & "{tingkat judul dilewati} missing_form_label {label formulir tidak ada} "
      & "invalid_aria {ARIA tidak valid} keyboard_trap {jebakan keyboard} other "
      & "{masalah aksesibilitas tidak dikenal}}");
   P ("label.markup.accessibility_page_summary_label",
      "ringkasan aksesibilitas {title}: {landmarks, number} landmark, "
      & "{headings, number} judul, {issues, number} masalah");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {tambahkan nama aksesibel} "
      & "low_contrast {tingkatkan kontras teks} skipped_heading_level {gunakan "
      & "tingkat judul secara berurutan} missing_form_label {kaitkan label "
      & "dengan kontrol formulir} invalid_aria {gunakan peran atau atribut ARIA "
      & "yang valid} keyboard_trap {pastikan fokus keyboard dapat keluar dari "
      & "komponen} other {tinjau masalah aksesibilitas}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target} tidak memiliki masalah aksesibilitas} "
      & "other {{target} memiliki {issues, number} masalah aksesibilitas}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {atribut id} class_attribute {atribut "
      & "class} data_attribute {atribut data} aria_attribute {atribut ARIA} "
      & "role_attribute {atribut role} link_attribute {atribut tautan} "
      & "media_attribute {atribut media} form_attribute {atribut formulir} "
      & "boolean_attribute {atribut boolean} event_attribute {atribut penangan "
      & "peristiwa} other {atribut tidak dikenal}}");
   P ("label.markup.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{form_name} tidak memiliki "
      & "masalah} other {{form_name} memiliki {warnings, number} peringatan}}} "
      & "other {{warnings, plural, =0 {{form_name} memiliki {errors, number} "
      & "kesalahan} other {{form_name} memiliki {errors, number} kesalahan, "
      & "{warnings, number} peringatan}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {landmark banner} navigation_role {landmark "
      & "navigasi} main_role {landmark utama} complementary_role {landmark "
      & "pelengkap} contentinfo_role {landmark info konten} search_role "
      & "{landmark pencarian} form_role {landmark formulir} region_role "
      & "{landmark wilayah} dialog_role {dialog} alert_role {wilayah live "
      & "peringatan} status_role {wilayah live status} other {landmark tidak "
      & "dikenal}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}, pembaruan segera: {update}} other "
      & "{{region}, pembaruan tidak mendesak: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {konten teks} html_content {konten HTML} "
      & "json_content {konten JSON} xml_content {konten XML} image_content "
      & "{konten gambar} audio_content {konten audio} video_content {konten "
      & "video} font_content {konten font} archive_content {konten arsip} "
      & "binary_content {konten biner} form_content {konten formulir} other "
      & "{konten tidak dikenal}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {tag dokumen} metadata_tag {tag metadata} "
      & "section_tag {tag bagian} text_tag {tag teks} link_tag {tag tautan} "
      & "media_tag {tag media} form_tag {tag formulir} table_tag {tag tabel} "
      & "interactive_tag {tag interaktif} scripting_tag {tag skrip} other {tag "
      & "tidak dikenal}}");
   P ("label.media.duration_label", "durasi {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {gambar} video_media {video} audio_media "
      & "{audio} pdf_document {dokumen PDF} text_document {dokumen teks} "
      & "archive_media {arsip} other {media}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {siap} processing_media {sedang diproses} "
      & "transcoding_media {sedang ditranskode} thumbnail_missing {thumbnail "
      & "tidak tersedia} metadata_missing {metadata tidak ada} locked_document "
      & "{dokumen terkunci} other {tidak tersedia}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {gambar} video_media {video} "
      & "audio_media {audio} pdf_document {dokumen PDF} text_document {dokumen "
      & "teks} archive_media {arsip} other {media}}): {state, select, "
      & "ready_media {siap} processing_media {sedang diproses} "
      & "transcoding_media {sedang ditranskode} thumbnail_missing {thumbnail "
      & "tidak tersedia} metadata_missing {metadata tidak ada} locked_document "
      & "{dokumen terkunci} other {tidak tersedia}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {tidak ada halaman} other {{pages, number} "
      & "halaman}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "{item}: banding, {state, select, open_report {laporan terbuka} "
      & "triaged_report {laporan sudah ditriase} actioned_report {tindakan "
      & "sudah diambil} dismissed_report {laporan ditolak} appealed_report "
      & "{laporan diajukan banding} other {laporan ditutup}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {tidak ada tindakan moderasi} flagged "
      & "{ditandai} hidden {disembunyikan oleh moderator} restored {dipulihkan} "
      & "marked_spam {ditandai sebagai spam} removed {dihapus} other "
      & "{dieskalasi}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {tidak ada tindakan moderasi} "
      & "flagged {ditandai} hidden {disembunyikan oleh moderator} restored "
      & "{dipulihkan} marked_spam {ditandai sebagai spam} removed {dihapus} "
      & "other {dieskalasi}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {antrean moderasi kosong} "
      & "other {{pending, number} menunggu peninjauan}}} other {{pending, "
      & "number} menunggu peninjauan, {escalated, number} dieskalasi}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {laporan terbuka} triaged_report "
      & "{laporan sudah ditriase} actioned_report {tindakan sudah diambil} "
      & "dismissed_report {laporan ditolak} appealed_report {laporan diajukan "
      & "banding} other {laporan ditutup}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {laporan terbuka} triaged_report {laporan "
      & "sudah ditriase} actioned_report {tindakan sudah diambil} "
      & "dismissed_report {laporan ditolak} appealed_report {laporan diajukan "
      & "banding} other {laporan ditutup}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {menunggu peninjauan} approved "
      & "{disetujui} rejected {ditolak} needs_changes {perlu perubahan} other "
      & "{peninjauan dieskalasi}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {menunggu peninjauan} approved "
      & "{disetujui} rejected {ditolak} needs_changes {perlu perubahan} other "
      & "{peninjauan dieskalasi}}");
   P ("label.navigation.back_label", "kembali ke {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {tidak ada breadcrumb} other {{depth, number} "
      & "breadcrumb}}");
   P ("label.navigation.current_page_label", "halaman saat ini: {name}");
   P ("label.navigation.external_link_label", "{name}, tautan eksternal");
   P ("label.navigation.first_label", "pertama: {target}");
   P ("label.navigation.last_label", "terakhir: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {tidak ada item menu} other {{count, number} item "
      & "menu}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {tautan} menu_item {item menu} tab_item {tab} "
      & "breadcrumb_item {breadcrumb} section_item {bagian} other {pemisah}}");
   P ("label.navigation.navigation_item_label",
      "{name}, {kind, select, link_item {tautan} menu_item {item menu} "
      & "tab_item {tab} breadcrumb_item {breadcrumb} section_item {bagian} "
      & "other {pemisah}}: {state, select, current_item {saat ini} active_item "
      & "{aktif} inactive_item {tidak aktif} disabled_item {nonaktif} "
      & "expanded_item {diperluas} collapsed_item {diciutkan} visited_item "
      & "{sudah dikunjungi} other {eksternal}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {saat ini} active_item {aktif} "
      & "inactive_item {tidak aktif} disabled_item {nonaktif} expanded_item "
      & "{diperluas} collapsed_item {diciutkan} visited_item {sudah dikunjungi} "
      & "other {eksternal}}");
   P ("label.navigation.next_label", "berikutnya: {target}");
   P ("label.navigation.section_state_label",
      "bagian {name} {expanded, select, false {diciutkan} other "
      & "{diperluas}}{count, plural, =0 {} other {, {count, number} item}}");
   P ("label.navigation.skip_link_label", "lompat ke {target}");
   P ("label.navigation.submenu_label", "submenu {name}, {count, number} item");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {semua peringatan} important_alerts "
      & "{peringatan penting} critical_alerts_only {hanya peringatan kritis} "
      & "other {tanpa peringatan}}");
   P ("label.notification_preferences.channel_preference_label",
      "notifikasi {channel} {state, select, preference_enabled {aktif} "
      & "preference_disabled {nonaktif} preference_inherited {diwarisi} other "
      & "{wajib}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {tanpa ringkasan} instant_digest "
      & "{ringkasan instan} daily_digest {ringkasan harian} other {ringkasan "
      & "mingguan}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {aktif} preference_disabled "
      & "{nonaktif} preference_inherited {diwarisi} other {wajib}}");
   P ("label.notification_preferences.quiet_hours_label", "jam tenang {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: langganan {scope, select, thread_subscription {utas} "
      & "project_subscription {proyek} team_subscription {tim} other {akun}} "
      & "{state, select, preference_enabled {aktif} preference_disabled "
      & "{nonaktif} preference_inherited {diwarisi} other {wajib}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {langganan utas} "
      & "project_subscription {langganan proyek} team_subscription {langganan "
      & "tim} other {langganan akun}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} menyebut Anda} reply_event "
      & "{{actor} membalas} assignment_event {{actor} menugaskan Anda} "
      & "approval_event {{actor} meminta persetujuan} alert_event {{actor} "
      & "mengirim peringatan} digest_event {{actor} mengirim ringkasan} "
      & "reminder_event {{actor} mengirim pengingat} other {{actor} mengirim "
      & "notifikasi sistem}}");
end Labels_1;
