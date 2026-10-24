separate (Humanize.Catalogs.Phrase_Data.Locale_Tr)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name}: etkin hesap} invited_account "
      & "{{name}: davet edilmiş hesap} locked_account {{name}: kilitli hesap} "
      & "suspended_account {{name}: askıya alınmış hesap} deleted_account "
      & "{{name}: silinmiş hesap} other {{name}: bilinmeyen hesap durumu}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {etkin hesap} invited_account {davet "
      & "edilmiş hesap} locked_account {kilitli hesap} suspended_account "
      & "{askıya alınmış hesap} deleted_account {silinmiş hesap} other "
      & "{bilinmeyen hesap durumu}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {güvenilir cihaz} untrusted_device "
      & "{güvenilmeyen cihaz} new_device {yeni cihaz} other {engellenmiş "
      & "cihaz}}");
   P ("label.accounts.last_active_label", "{name}: son etkinlik {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: giriş başarısız} other {{name}: "
      & "giriş başarılı}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA etkin} mfa_disabled {MFA devre "
      & "dışı} mfa_required {MFA gerekli} other {MFA sıfırlaması "
      & "gerekli}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: etkin oturum} expired_session "
      & "{{name}: oturum süresi doldu} revoked_session {{name}: oturum iptal "
      & "edildi} idle_session {{name}: boşta oturum} other {{name}: bilinmeyen "
      & "oturum durumu}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {etkin oturum} expired_session {oturum "
      & "süresi doldu} revoked_session {oturum iptal edildi} idle_session "
      & "{boşta oturum} other {bilinmeyen oturum durumu}}");
   P ("label.attachments.attachment_count_label", "{count, plural, =0 {ek yok} other {{count, number} ek}}");
   P ("label.attachments.attachment_group_label", "{name}: {count, number} ek");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {dosya eki} image_attachment "
      & "{görüntü eki} video_attachment {video eki} audio_attachment {ses "
      & "eki} document_attachment {belge eki} archive_attachment {arşiv eki} "
      & "other {bağlantı eki}}");
   P ("label.attachments.attachment_label",
      "{name}, {kind, select, file_attachment {dosya} image_attachment "
      & "{görüntü} video_attachment {video} audio_attachment {ses} "
      & "document_attachment {belge} archive_attachment {arşiv} other "
      & "{bağlantı}}: {state, select, pending_attachment {bekliyor} "
      & "uploading_attachment {yükleniyor} uploaded_attachment {yüklendi} "
      & "failed_attachment {yüklenemedi} removed_attachment {kaldırıldı} "
      & "other {engellendi}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {ek bekliyor} uploading_attachment "
      & "{ek yükleniyor} uploaded_attachment {ek yüklendi} failed_attachment "
      & "{ek yüklenemedi} removed_attachment {ek kaldırıldı} other {ek "
      & "engellendi}}");
   P ("label.attachments.download_label", "indir: {name}");
   P ("label.attachments.expiring_link_label", "{name}: bağlantının süresi doluyor ({time_text})");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "önizle: {name}");
   P ("label.attachments.remove_label", "kaldır: {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: taranmadı} scanning {{name}: "
      & "taranıyor} safe {{name}: güvenli} suspicious {{name}: şüpheli} "
      & "other {{name}: virüslü}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {taranmadı} scanning {taranıyor} safe "
      & "{güvenli} suspicious {şüpheli} other {virüslü}}");
   P ("label.attachments.upload_error_label", "{name} yüklenemedi: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {rozet} new_badge {yeni rozet} "
      & "updated_badge {güncellenmiş rozet} deprecated_badge {kullanımdan "
      & "kaldırılmış rozet} selected_badge {seçili rozet} disabled_badge "
      & "{devre dışı rozet} other {kapatılabilir rozet}}, {tone, select, "
      & "neutral_tone {nötr ton} info_tone {bilgi tonu} success_tone {başarı "
      & "tonu} warning_tone {uyarı tonu} danger_tone {tehlike tonu} other "
      & "{soluk ton}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {düşük öncelikli rozet} "
      & "medium_priority {orta öncelikli rozet} high_priority {yüksek "
      & "öncelikli rozet} other {kritik öncelikli rozet}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {varsayılan rozet} new_badge {yeni "
      & "rozet} updated_badge {güncellenmiş rozet} deprecated_badge "
      & "{kullanımdan kaldırılmış rozet} selected_badge {seçili rozet} "
      & "disabled_badge {devre dışı rozet} other {kapatılabilir rozet}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {nötr rozet} info_tone {bilgi rozeti} "
      & "success_tone {başarı rozeti} warning_tone {uyarı rozeti} "
      & "danger_tone {tehlike rozeti} other {soluk rozet}}");
   P ("label.badges.chip_label", "{selected, select, false {{name} çipi} other {{name} çipi, seçili}}");
   P ("label.badges.count_badge_label", "{count, plural, other {{name}: {count, number}}}");
   P ("label.badges.deprecated_label", "{name}: kullanımdan kaldırılmış rozet");
   P ("label.badges.dismiss_label", "kapat: {name}");
   P ("label.badges.new_label", "{name}: yeni rozet");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {gizli rozet yok} other {+{hidden_count, "
      & "number} rozet daha}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: düşük öncelikli rozet} "
      & "medium_priority {{name}: orta öncelikli rozet} high_priority {{name}: "
      & "yüksek öncelikli rozet} other {{name}: kritik öncelikli rozet}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {{name} durumu: nötr} info_tone {{name} "
      & "durumu: bilgi} success_tone {{name} durumu: başarılı} warning_tone "
      & "{{name} durumu: uyarı} danger_tone {{name} durumu: tehlike} other "
      & "{{name} durumu: soluk}}");
   P ("label.badges.tag_count_label", "{count, plural, =0 {etiket yok} other {{count, number} etiket}}");
   P ("label.badges.tag_label", "{name} etiketi");
   P ("label.badges.updated_label", "{name}: güncellenmiş rozet");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {yapıt yüklendi} artifact_missing "
      & "{yapıt eksik} artifact_expired {yapıtın süresi doldu} other "
      & "{yapıt doğrulandı}}");
   P ("label.builds.benchmark_label", "{name} performans testi: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {{name}: derleme kuyrukta} build_running "
      & "{{name}: derleme sürüyor} build_passed {{name}: derleme başarılı} "
      & "build_failed {{name}: derleme başarısız} snapshot_build {{name}: "
      & "anlık görüntü derlemesi} other {{name}: sürüm derlemesi}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {derleme kuyrukta} build_running {derleme "
      & "sürüyor} build_passed {derleme başarılı} build_failed {derleme "
      & "başarısız} snapshot_build {anlık görüntü derlemesi} other "
      & "{sürüm derlemesi}}");
   P ("label.builds.coverage_label", "kapsam: {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {sürüm geçidi geçildi} gate_failed "
      & "{sürüm geçidi başarısız} gate_warning {sürüm geçidinde "
      & "uyarı} other {sürüm geçidi engellendi}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {başarılı test yok} "
      & "other {{count, number} test başarılı}}} failed_test {{count, "
      & "plural, =0 {başarısız test yok} other {{count, number} test "
      & "başarısız}}} skipped_test {{count, plural, =0 {atlanan test yok} "
      & "other {{count, number} test atlandı}}} flaky_test {{count, plural, =0 "
      & "{kararsız test yok} other {{count, number} test kararsız}}} other "
      & "{{count, plural, =0 {beklenen başarısızlık yok} other {{count, "
      & "number} test beklendiği gibi başarısız}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {başarılı} failed_test {başarısız} "
      & "skipped_test {atlandı} flaky_test {kararsız} other {beklenen "
      & "başarısızlık}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "değişmedi, devre dışı} other {{field_name} devre dışı "
      & "durumundan etkin duruma geçti}}} other {{new_value, select, false "
      & "{{field_name} etkin durumdan devre dışı duruma geçti} other "
      & "{{field_name} değişmedi, etkin}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {eklendi} removed_change {kaldırıldı} "
      & "modified_change {değiştirildi} renamed_change {yeniden "
      & "adlandırıldı} unchanged_change {değişmedi} metadata_change {meta "
      & "veriler değişti} moved_change {taşındı} conflict_change "
      & "{çakışma} other {bilinmeyen değişiklik}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {bilgilendirici değişiklik} "
      & "minor_change {küçük değişiklik} major_change {büyük "
      & "değişiklik} other {uyumluluğu bozan değişiklik}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} değişmedi} "
      & "other {{unchanged, plural, =0 {{field_name} değişti: {added, number} "
      & "eklendi} other {{field_name} değişti: {added, number} eklendi, "
      & "{unchanged, number} değişmedi}}}}} other {{added, plural, =0 "
      & "{{unchanged, plural, =0 {{field_name} değişti: {removed, number} "
      & "kaldırıldı} other {{field_name} değişti: {removed, number} "
      & "kaldırıldı, {unchanged, number} değişmedi}}} other {{unchanged, "
      & "plural, =0 {{field_name} değişti: {added, number} eklendi, {removed, "
      & "number} kaldırıldı} other {{field_name} değişti: {added, number} "
      & "eklendi, {removed, number} kaldırıldı, {unchanged, number} "
      & "değişmedi}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {çakışma yok} other {{count, number} "
      & "çakışma}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name}, {old_label} tarihinden "
      & "{new_label} tarihine ertelendi} other {{field_name}, {old_label} "
      & "tarihinden {new_label} tarihine öne alındı}}");
   P ("label.changes.duration_field_change_label",
      "{field_name}, {old_label} süresinden {new_label} süresine değişti");
   P ("label.changes.field_change_label", "{field_name}, {old_value} değerinden {new_value} değerine değişti");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name} eklendi} removed_change {{name} "
      & "kaldırıldı} modified_change {{name} değiştirildi} renamed_change "
      & "{{name} yeniden adlandırıldı} unchanged_change {{name} değişmedi} "
      & "metadata_change {{name}: meta veriler değişti} moved_change {{name} "
      & "taşındı} conflict_change {{name}: çakışma} other {{name}: "
      & "bilinmeyen değişiklik}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {yalnızca meta veriler değişti} other {yalnızca "
      & "{count, number} meta veri alanı değişti}}");
   P ("label.changes.move_label", "{name}, {from} konumundan {to} konumuna taşındı");
   P ("label.changes.no_changes_label", "değişiklik yok");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {satır "
      & "değişikliği yok} other {{lines_added, number} satır eklendi}}} "
      & "other {{lines_added, plural, =0 {{lines_removed, number} satır "
      & "silindi} other {{lines_added, number} satır eklendi, {lines_removed, "
      & "number} satır silindi}}}}");
   P ("label.changes.rename_label", "{old_name} adı {new_name} olarak değiştirildi");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} taslak yorum yazdı} "
      & "published_comment {{author} yorum yaptı} edited_comment {{author} bir "
      & "yorumu düzenledi} deleted_comment {{author} bir yorumu sildi} "
      & "resolved_comment {{author} bir yorumu çözümledi} unresolved_comment "
      & "{{author} bir yorumu yeniden açtı} pinned_comment {{author} bir "
      & "yorumu sabitledi} other {{author} bir yorumu gizledi}}");
   P ("label.comments.comment_count_label", "{count, plural, =0 {yorum yok} other {{count, number} yorum}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author}: taslak yorum} "
      & "published_comment {{author}: yayımlanmış yorum} edited_comment "
      & "{{author}: düzenlenmiş yorum} deleted_comment {{author}: silinmiş "
      & "yorum} resolved_comment {{author}: çözümlenmiş yorum} "
      & "unresolved_comment {{author}: çözümlenmemiş yorum} pinned_comment "
      & "{{author}: sabitlenmiş yorum} other {{author}: gizlenmiş yorum}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {taslak yorum} published_comment "
      & "{yayımlanmış yorum} edited_comment {düzenlenmiş yorum} "
      & "deleted_comment {silinmiş yorum} resolved_comment {çözümlenmiş "
      & "yorum} unresolved_comment {çözümlenmemiş yorum} pinned_comment "
      & "{sabitlenmiş yorum} other {gizlenmiş yorum}}");
   P ("label.comments.deleted_label", "{author} bir yorumu sildi");
   P ("label.comments.edited_label", "düzenlendi: {time_text}");
   P ("label.comments.hide_comment_label", "yorumu gizle: {reason}");
   P ("label.comments.lock_thread_label", "{name} ileti dizisini kilitle");
   P ("label.comments.mention_label", "{actor} bahsetti: {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {katılımcı yok} other {{count, number} "
      & "katılımcı}}");
   P ("label.comments.pin_label", "sabitle: {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {beğeni tepkisi} dislike_reaction "
      & "{beğenmeme tepkisi} heart_reaction {kalp tepkisi} laugh_reaction "
      & "{gülme tepkisi} confused_reaction {şaşkınlık tepkisi} "
      & "hooray_reaction {kutlama tepkisi} rocket_reaction {roket tepkisi} "
      & "other {göz tepkisi}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {beğeni yok} other "
      & "{{count, number} beğeni}}} dislike_reaction {{count, plural, =0 "
      & "{beğenmeme yok} other {{count, number} beğenmeme}}} heart_reaction "
      & "{{count, plural, =0 {kalp yok} other {{count, number} kalp}}} "
      & "laugh_reaction {{count, plural, =0 {gülme yok} other {{count, number} "
      & "gülme}}} confused_reaction {{count, plural, =0 {şaşkınlık tepkisi "
      & "yok} other {{count, number} şaşkınlık tepkisi}}} hooray_reaction "
      & "{{count, plural, =0 {kutlama yok} other {{count, number} kutlama}}} "
      & "rocket_reaction {{count, plural, =0 {roket yok} other {{count, number} "
      & "roket}}} other {{count, plural, =0 {göz tepkisi yok} other {{count, "
      & "number} göz tepkisi}}}}");
   P ("label.comments.reply_count_label", "{count, plural, =0 {yanıt yok} other {{count, number} yanıt}}");
   P ("label.comments.resolved_label", "{name} çözümlendi");
   P ("label.comments.subscribe_label", "{name} için abone ol");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {ileti dizisi yok} other {{count, number} ileti "
      & "dizisi}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {açık} resolved_thread "
      & "{çözümlenmiş} locked_thread {kilitli} other {arşivlenmiş}} ileti "
      & "dizisi{count, plural, =0 {} other {, {count, number} yorum}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {açık ileti dizisi} resolved_thread "
      & "{çözümlenmiş ileti dizisi} locked_thread {kilitli ileti dizisi} "
      & "other {arşivlenmiş ileti dizisi}}");
   P ("label.comments.unpin_label", "sabitlemeyi kaldır: {name}");
   P ("label.comments.unsubscribe_label", "{name} aboneliğinden çık");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name}: iyileşti} regressed {{name}: "
      & "geriledi} unchanged {{name}: değişmedi} within_tolerance {{name}: "
      & "tolerans içinde} outside_tolerance {{name}: tolerans dışında} "
      & "new_value {{name}: yeni} removed_value {{name}: kaldırıldı} other "
      & "{{name}: temel değer yok}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {iyileşti} regressed {geriledi} unchanged "
      & "{değişmedi} within_tolerance {tolerans içinde} outside_tolerance "
      & "{tolerans dışında} new_value {yeni} removed_value {kaldırıldı} "
      & "other {temel değer yok}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name}: {difference_text} iyileşti} "
      & "regressed {{name}: {difference_text} geriledi} unchanged {{name}: "
      & "değişmedi ({difference_text})} within_tolerance {{name}: tolerans "
      & "içinde ({difference_text})} outside_tolerance {{name}: tolerans "
      & "dışında ({difference_text})} new_value {{name}: yeni "
      & "({difference_text})} removed_value {{name}: kaldırıldı "
      & "({difference_text})} other {{name}: temel değer yok "
      & "({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name}: {difference_text} iyileşti, "
      & "tolerans: {tolerance_text}} regressed {{name}: {difference_text} "
      & "geriledi, tolerans: {tolerance_text}} unchanged {{name}: değişmedi "
      & "({difference_text}), tolerans: {tolerance_text}} within_tolerance "
      & "{{name}: tolerans içinde ({difference_text}), tolerans: "
      & "{tolerance_text}} outside_tolerance {{name}: tolerans dışında "
      & "({difference_text}), tolerans: {tolerance_text}} new_value {{name}: "
      & "yeni ({difference_text}), tolerans: {tolerance_text}} removed_value "
      & "{{name}: kaldırıldı ({difference_text}), tolerans: "
      & "{tolerance_text}} other {{name}: temel değer yok ({difference_text}), "
      & "tolerans: {tolerance_text}}}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {geçersiz satır} duplicate_record "
      & "{yinelenen kayıt} missing_column {eksik sütun} unknown_field "
      & "{bilinmeyen alan} schema_mismatch {şema uyuşmazlığı} other "
      & "{atlanan kayıt}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {deneme çalıştırması başarılı} "
      & "dry_run_failed {deneme çalıştırması başarısız} import_valid "
      & "{içe aktarma geçerli} import_invalid {içe aktarma geçersiz} other "
      & "{kısmi içe aktarma}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {deneme çalıştırması "
      & "başarılı} dry_run_failed {deneme çalıştırması başarısız} "
      & "import_valid {içe aktarma geçerli} import_invalid {içe aktarma "
      & "geçersiz} other {kısmi içe aktarma}} ({accepted, number} kabul "
      & "edildi, {rejected, number} reddedildi)");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {geçersiz satır yok} "
      & "other {{count, number} geçersiz satır}}} duplicate_record {{count, "
      & "plural, =0 {yinelenen kayıt yok} other {{count, number} yinelenen "
      & "kayıt}}} missing_column {{count, plural, =0 {eksik sütun yok} other "
      & "{{count, number} eksik sütun}}} unknown_field {{count, plural, =0 "
      & "{bilinmeyen alan yok} other {{count, number} bilinmeyen alan}}} "
      & "schema_mismatch {{count, plural, =0 {şema uyuşmazlığı yok} other "
      & "{{count, number} şema uyuşmazlığı}}} other {{count, plural, =0 "
      & "{atlanan kayıt yok} other {{count, number} atlanan kayıt}}}}");
   P ("label.data_quality.row_issue_label",
      "satır {row, number}: {issue, select, invalid_row {geçersiz satır} "
      & "duplicate_record {yinelenen kayıt} missing_column {eksik sütun} "
      & "unknown_field {bilinmeyen alan} schema_mismatch {şema "
      & "uyuşmazlığı} other {atlanan kayıt}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {geçersiz satır} "
      & "duplicate_record {yinelenen kayıt} missing_column {eksik sütun} "
      & "unknown_field {bilinmeyen alan} schema_mismatch {şema "
      & "uyuşmazlığı} other {atlanan kayıt}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {yapıt hazır} artifact_uploaded "
      & "{yapıt yüklendi} artifact_signed {yapıt imzalandı} "
      & "artifact_missing {yapıt eksik} other {yapıtın süresi doldu}}");
   P ("label.deployments.deployment_label",
      "{name} ({environment}): {state, select, queued_deployment {dağıtım "
      & "kuyrukta} deploying {dağıtılıyor} deployed {dağıtıldı} "
      & "failed_deployment {dağıtım başarısız} rolled_back {geri "
      & "alındı} blocked_deployment {dağıtım engellendi} other {dağıtım "
      & "iptal edildi}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {dağıtım kuyrukta} deploying "
      & "{dağıtılıyor} deployed {dağıtıldı} failed_deployment "
      & "{dağıtım başarısız} rolled_back {geri alındı} "
      & "blocked_deployment {dağıtım engellendi} other {dağıtım iptal "
      & "edildi}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {ortam sağlıklı} "
      & "drifting_environment {ortamda sapma var} locked_environment {ortam "
      & "kilitli} maintenance_environment {ortam bakımda} other {ortam durumu "
      & "bilinmiyor}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {taşıma yok} migration_pending "
      & "{taşıma bekliyor} migrating {taşınıyor} migration_complete "
      & "{taşıma tamamlandı} other {taşıma başarısız}}");
   P ("label.deployments.promotion_label", "{name} yükseltildi: {from_environment} → {to_environment}");
   P ("label.deployments.rollback_label", "{name}: geri alma hedefi {target}");
   P ("label.deployments.rollout_label", "{name}: kademeli dağıtım {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {etkilenen öğe yok} one {1 etkilenen öğe} other "
      & "{{count, number} etkilenen öğe}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {başarılı} failed_check "
      & "{başarısız} warning_check {uyarılarla} skipped_check {atlandı} "
      & "pending_check {bekliyor} other {çalışıyor}} ({duration_s, plural, "
      & "one {1 saniye} other {{duration_s, number} saniye}})");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {başarılı} failed_check "
      & "{başarısız} warning_check {uyarılarla} skipped_check {atlandı} "
      & "pending_check {bekliyor} other {çalışıyor}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {başarılı} failed_check "
      & "{başarısız} warning_check {uyarılar} skipped_check {atlandı} "
      & "pending_check {bekliyor} other {çalışıyor}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{subject}{position, plural, =0 {} other { (konum {position, "
      & "number})}}: {kind, select, expected_value {değer bekleniyordu} "
      & "expected_unit {birim bekleniyordu} invalid_range {geçersiz aralık} "
      & "end_before_start {aralığın sonu başlangıcından önce} "
      & "unknown_field {bilinmeyen alan} unsafe_redacted_value {güvenli "
      & "olmayan değer gizlendi} unsupported_syntax {desteklenmeyen "
      & "sözdizimi} other {tanılama açıklaması}}; önerilen: {suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{path}{line, plural, =0 {} other {, satır {line, number}}}: "
      & "{severity, select, info_severity {bilgi} notice_severity {bildirim} "
      & "warning_severity {uyarı} error_severity {hata} critical_severity "
      & "{kritik} other {engelleyici}}: {message}");
   P ("label.diagnostics.failed_at_label",
      "başarısız: {path}{line, plural, =0 {} other {, satır {line, "
      & "number}{column, plural, =0 {} other {, sütun {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{field_name}: {severity, select, info_severity {bilgi} notice_severity "
      & "{bildirim} warning_severity {uyarı} error_severity {hata} "
      & "critical_severity {kritik} other {engelleyici}}: {message}");
   P ("label.diagnostics.first_failure_label",
      "ilk başarısızlık: {check_name}, {path}{line, plural, =0 {} other "
      & "{, satır {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{sorun yok} other {{notices, plural, one {1 bildirim} other {{notices, "
      & "number} bildirim}}}}} other {{notices, plural, =0 {{warnings, plural, "
      & "one {1 uyarı} other {{warnings, number} uyarı}}} other {{warnings, "
      & "plural, one {1 uyarı} other {{warnings, number} uyarı}}, {notices, "
      & "plural, one {1 bildirim} other {{notices, number} bildirim}}}}}}} "
      & "other {{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, "
      & "one {1 hata} other {{errors, number} hata}}} other {{errors, plural, "
      & "one {1 hata} other {{errors, number} hata}}, {notices, plural, one {1 "
      & "bildirim} other {{notices, number} bildirim}}}}} other {{notices, "
      & "plural, =0 {{errors, plural, one {1 hata} other {{errors, number} "
      & "hata}}, {warnings, plural, one {1 uyarı} other {{warnings, number} "
      & "uyarı}}} other {{errors, plural, one {1 hata} other {{errors, number} "
      & "hata}}, {warnings, plural, one {1 uyarı} other {{warnings, number} "
      & "uyarı}}, {notices, plural, one {1 bildirim} other {{notices, number} "
      & "bildirim}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{path}{line, plural, =0 {} other {, satır {line, number}{column, "
      & "plural, =0 {} other {, sütun {column, number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{family, select, byte_parser {bayt ayrıştırıcısı} "
      & "duration_parser {süre ayrıştırıcısı} date_time_parser "
      & "{tarih-saat ayrıştırıcısı} color_parser {renk "
      & "ayrıştırıcısı} url_parser {URL ayrıştırıcısı} unit_parser "
      & "{birim ayrıştırıcısı} recurrence_parser {yineleme "
      & "ayrıştırıcısı} domain_label_parser {alan etiketi "
      & "ayrıştırıcısı} other {ayrıştırıcı}} için desteklenmeyen "
      & "sözdizimi: {error}{position, plural, =0 {} other { (konum {position, "
      & "number})}}; {family, select, byte_parser {B, kB, MB, GB, KiB, MiB, GiB "
      & "veya TiB kullanın} duration_parser {ms, s, min, h, d, w, month veya "
      & "year kullanın} date_time_parser {ISO tarihi, doğal dilde gün veya "
      & "saat kullanın} color_parser {hex, rgb(), hsl(), lab(), lch() veya "
      & "renk adı kullanın} url_parser {şema, ana makine, yol, sorgu veya "
      & "parça kullanın} unit_parser {desteklenen bir Humanize birim etiketi "
      & "kullanın} recurrence_parser {cron veya every/weekday yineleme biçimi "
      & "kullanın} domain_label_parser {belirlenimci bir Humanize alan etiketi "
      & "kullanın} other {desteklenen bir girdi biçimi kullanın}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {başarılı} failed_check "
      & "{başarısız} warning_check {uyarılar} skipped_check {atlandı} "
      & "pending_check {bekliyor} other {çalışıyor}}, {notices, plural, =0 "
      & "{bildirim yok} one {1 bildirim} other {{notices, number} bildirim}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {yeniden deneme 1/1} other "
      & "{yeniden deneme sınırı aşıldı ({attempt, number}/1)}}} other "
      & "{yeniden deneme {attempt, number}/{limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {bilgi} notice_severity {bildirim} "
      & "warning_severity {uyarı} error_severity {hata} critical_severity "
      & "{kritik} other {engelleyici}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {derleme tanılamaları} test_source "
      & "{test tanılamaları} lint_source {lint tanılamaları} import_source "
      & "{içe aktarma tanılamaları} validation_source {doğrulama "
      & "tanılamaları} runtime_source {çalışma zamanı tanılamaları} "
      & "security_source {güvenlik tanılamaları} other {tanılamalar}}");
   P ("label.diagnostics.source_summary_label",
      "{count, number} {source, select, build_source {derleme tanılaması} "
      & "test_source {test tanılaması} lint_source {lint tanılaması} "
      & "import_source {içe aktarma tanılaması} validation_source "
      & "{doğrulama tanılaması} runtime_source {çalışma zamanı "
      & "tanılaması} security_source {güvenlik tanılaması} other "
      & "{tanılama}}");
   P ("label.diagnostics.suggested_action_label", "sonraki adım: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {alan adı} ipv4_host {IPv4 adresi} "
      & "ipv6_host {IPv6 adresi} localhost_host {yerel ana makine} "
      & "private_network_host {özel ağ adresi} other {bilinmeyen ana makine}}");
   P ("label.events.all_day_label", "{name}: tüm gün süren etkinlik");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {yanıt verilmedi} accepted {kabul "
      & "edildi} declined {reddedildi} maybe {belki} other {bekleme "
      & "listesinde}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {katılımcı yok} one {1 katılımcı} other "
      & "{{count, number} katılımcı}}");
   P ("label.events.canceled_label", "{name}: iptal edildi");
   P ("label.events.check_in_label", "check-in: {name}");
   P ("label.events.conference_link_label", "{name}: konferans bağlantısı");
   P ("label.events.event_count_label",
      "{count, plural, =0 {etkinlik yok} one {1 etkinlik} other {{count, "
      & "number} etkinlik}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {planlanmış etkinlik} "
      & "tentative_event {kesin olmayan etkinlik} in_progress_event {devam eden "
      & "etkinlik} completed_event {tamamlanmış etkinlik} canceled_event "
      & "{iptal edilmiş etkinlik} other {ertelenmiş etkinlik}}");
   P ("label.events.event_location_label", "{name}, {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {planlanmış etkinlik} "
      & "tentative_event {kesin olmayan etkinlik} in_progress_event {devam eden "
      & "etkinlik} completed_event {tamamlanmış etkinlik} canceled_event "
      & "{iptal edilmiş etkinlik} other {ertelenmiş etkinlik}}");
   P ("label.events.event_time_label", "{name}, {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {herkese açık etkinlik} "
      & "private_event {özel etkinlik} busy_event {meşgul} other {müsait}}");
   P ("label.events.organizer_label", "düzenleyen: {name}");
   P ("label.events.rsvp_label",
      "LCV: {state, select, not_responded {yanıt verilmedi} accepted {kabul "
      & "edildi} declined {reddedildi} maybe {belki} other {bekleme "
      & "listesinde}}");
   P ("label.events.reminder_label", "anımsatıcı: {time_text}");
   P ("label.events.rescheduled_label", "{name} yeniden planlandı: {time_text}");
   P ("label.forms.character_count_label", "{used, plural, one {1 karakter} other {{used, number} karakter}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {karakter sınırı yok} one {en fazla 1 karakter} "
      & "other {en fazla {limit, number} karakter}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {1 karakter} other {{used, "
      & "number} karakter}}} other {{used, number}/{limit, number} karakter}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}, isteğe bağlı alan} other {{name}, "
      & "zorunlu alan}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {geçerli} invalid_input "
      & "{geçersiz} required_input {zorunlu} optional_input {isteğe bağlı} "
      & "disabled_input {devre dışı} other {salt okunur}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {formda sorun yok} other "
      & "{{warnings, plural, one {1 uyarı} other {{warnings, number} "
      & "uyarı}}}}} other {{warnings, plural, =0 {{errors, plural, one {1 "
      & "hata} other {{errors, number} hata}}} other {{errors, plural, one {1 "
      & "hata} other {{errors, number} hata}}, {warnings, plural, one {1 "
      & "uyarı} other {{warnings, number} uyarı}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {başlanmadı} editing_form "
      & "{düzenleniyor} dirty_form {kaydedilmemiş değişiklikler} "
      & "saving_form {kaydediliyor} saved_form {kaydedildi} submitted_form "
      & "{gönderildi} other {gönderim başarısız}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {geçerli girdi} invalid_input {geçersiz "
      & "girdi} required_input {zorunlu girdi} optional_input {isteğe bağlı "
      & "girdi} disabled_input {devre dışı girdi} other {salt okunur girdi}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {başlanmadı} editing_form "
      & "{düzenleniyor} dirty_form {kaydedilmemiş değişiklikler} "
      & "saving_form {form kaydediliyor} saved_form {form kaydedildi} "
      & "submitted_form {form gönderildi} other {{errors, plural, =0 "
      & "{gönderim başarısız} one {gönderim başarısız: 1 hata} other "
      & "{gönderim başarısız: {errors, number} hata}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {kaydedilmemiş değişiklik yok} one {1 "
      & "kaydedilmemiş değişiklik} other {{count, number} kaydedilmemiş "
      & "değişiklik}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {erişilebilir ad "
      & "eksik} low_contrast {düşük kontrast} skipped_heading_level "
      & "{başlık düzeyi atlandı} missing_form_label {form etiketi eksik} "
      & "invalid_aria {geçersiz ARIA} keyboard_trap {klavye tuzağı} other "
      & "{bilinmeyen erişilebilirlik sorunu}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title} erişilebilirlik özeti: {landmarks, plural, one {1 yer "
      & "işareti} other {{landmarks, number} yer işareti}}, {headings, "
      & "plural, one {1 başlık} other {{headings, number} başlık}}, "
      & "{issues, plural, one {1 sorun} other {{issues, number} sorun}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {erişilebilir bir ad ekleyin} "
      & "low_contrast {metin kontrastını artırın} skipped_heading_level "
      & "{sıralı başlık düzeyleri kullanın} missing_form_label {form "
      & "denetimiyle bir etiket ilişkilendirin} invalid_aria {geçerli bir "
      & "ARIA rolü veya özniteliği kullanın} keyboard_trap {klavye "
      & "odağının bileşenden çıkabildiğinden emin olun} other "
      & "{erişilebilirlik sorununu inceleyin}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target}: erişilebilirlik sorunu yok} one "
      & "{{target}: 1 erişilebilirlik sorunu} other {{target}: {issues, "
      & "number} erişilebilirlik sorunu}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id özniteliği} class_attribute {class "
      & "özniteliği} data_attribute {data özniteliği} aria_attribute {ARIA "
      & "özniteliği} role_attribute {role özniteliği} link_attribute "
      & "{bağlantı özniteliği} media_attribute {medya özniteliği} "
      & "form_attribute {form özniteliği} boolean_attribute {boole "
      & "özniteliği} event_attribute {olay işleyici özniteliği} other "
      & "{bilinmeyen öznitelik}}");
   P ("label.markup.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{form_name}: sorun yok} "
      & "other {{form_name}: {warnings, plural, one {1 uyarı} other "
      & "{{warnings, number} uyarı}}}}} other {{warnings, plural, =0 "
      & "{{form_name}: {errors, plural, one {1 hata} other {{errors, number} "
      & "hata}}} other {{form_name}: {errors, plural, one {1 hata} other "
      & "{{errors, number} hata}}, {warnings, plural, one {1 uyarı} other "
      & "{{warnings, number} uyarı}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {banner yer işareti} navigation_role "
      & "{gezinme yer işareti} main_role {ana yer işareti} complementary_role "
      & "{tamamlayıcı yer işareti} contentinfo_role {içerik bilgisi yer "
      & "işareti} search_role {arama yer işareti} form_role {form yer "
      & "işareti} region_role {bölge yer işareti} dialog_role {iletişim "
      & "kutusu} alert_role {uyarı canlı bölgesi} status_role {durum canlı "
      & "bölgesi} other {bilinmeyen yer işareti}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}, anında güncelleme: {update}} other "
      & "{{region}, sessiz güncelleme: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {metin içeriği} html_content {HTML "
      & "içeriği} json_content {JSON içeriği} xml_content {XML içeriği} "
      & "image_content {görüntü içeriği} audio_content {ses içeriği} "
      & "video_content {video içeriği} font_content {yazı tipi içeriği} "
      & "archive_content {arşiv içeriği} binary_content {ikili içerik} "
      & "form_content {form içeriği} other {bilinmeyen içerik}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {belge etiketi} metadata_tag {meta veri "
      & "etiketi} section_tag {bölüm etiketi} text_tag {metin etiketi} "
      & "link_tag {bağlantı etiketi} media_tag {medya etiketi} form_tag {form "
      & "etiketi} table_tag {tablo etiketi} interactive_tag {etkileşimli "
      & "etiket} scripting_tag {betik etiketi} other {bilinmeyen etiket}}");
   P ("label.media.duration_label", "süre: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {görüntü} video_media {video} "
      & "audio_media {ses} pdf_document {PDF belgesi} text_document {metin "
      & "belgesi} archive_media {arşiv} other {medya}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {hazır} processing_media {işleniyor} "
      & "transcoding_media {dönüştürülüyor} thumbnail_missing {küçük "
      & "resim yok} metadata_missing {meta veri eksik} locked_document {belge "
      & "kilitli} other {kullanılamıyor}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {görüntü} video_media {video} "
      & "audio_media {ses} pdf_document {PDF belgesi} text_document {metin "
      & "belgesi} archive_media {arşiv} other {medya}}): {state, select, "
      & "ready_media {hazır} processing_media {işleniyor} transcoding_media "
      & "{dönüştürülüyor} thumbnail_missing {küçük resim yok} "
      & "metadata_missing {meta veri eksik} locked_document {belge kilitli} "
      & "other {kullanılamıyor}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {sayfa yok} one {1 sayfa} other {{pages, number} "
      & "sayfa}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "{item}: itiraz, {state, select, open_report {açık şikâyet} "
      & "triaged_report {ön değerlendirmesi yapılmış şikâyet} "
      & "actioned_report {işlem yapıldı} dismissed_report {reddedilmiş "
      & "şikâyet} appealed_report {itiraz edilmiş şikâyet} other "
      & "{kapatılmış şikâyet}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {moderasyon işlemi yok} flagged "
      & "{işaretlendi} hidden {moderatör tarafından gizlendi} restored {geri "
      & "yüklendi} marked_spam {spam olarak işaretlendi} removed "
      & "{kaldırıldı} other {üst kademeye iletildi}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {moderasyon işlemi yok} flagged "
      & "{işaretlendi} hidden {moderatör tarafından gizlendi} restored {geri "
      & "yüklendi} marked_spam {spam olarak işaretlendi} removed "
      & "{kaldırıldı} other {üst kademeye iletildi}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {moderasyon kuyruğu "
      & "boş} other {{pending, number} öğe inceleme bekliyor}}} other "
      & "{{pending, number} öğe inceleme bekliyor, {escalated, number} öğe "
      & "üst kademeye iletildi}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {açık şikâyet} triaged_report "
      & "{ön değerlendirmesi yapılmış şikâyet} actioned_report {işlem "
      & "yapıldı} dismissed_report {reddedilmiş şikâyet} appealed_report "
      & "{itiraz edilmiş şikâyet} other {kapatılmış şikâyet}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {açık şikâyet} triaged_report {ön "
      & "değerlendirmesi yapılmış şikâyet} actioned_report {işlem "
      & "yapıldı} dismissed_report {reddedilmiş şikâyet} appealed_report "
      & "{itiraz edilmiş şikâyet} other {kapatılmış şikâyet}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {inceleme bekliyor} approved "
      & "{onaylandı} rejected {reddedildi} needs_changes {değişiklik "
      & "gerekiyor} other {inceleme üst kademeye iletildi}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {inceleme bekliyor} approved "
      & "{onaylandı} rejected {reddedildi} needs_changes {değişiklik "
      & "gerekiyor} other {inceleme üst kademeye iletildi}}");
   P ("label.navigation.back_label", "geri dön: {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {içerik haritası yok} other {{depth, number} "
      & "içerik haritası öğesi}}");
   P ("label.navigation.current_page_label", "geçerli sayfa: {name}");
   P ("label.navigation.external_link_label", "{name}, dış bağlantı");
   P ("label.navigation.first_label", "ilk: {target}");
   P ("label.navigation.last_label", "son: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {menü öğesi yok} other {{count, number} menü "
      & "öğesi}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {bağlantı} menu_item {menü öğesi} "
      & "tab_item {sekme} breadcrumb_item {içerik haritası öğesi} "
      & "section_item {bölüm} other {ayırıcı}}");
   P ("label.navigation.navigation_item_label",
      "{name}, {kind, select, link_item {bağlantı} menu_item {menü "
      & "öğesi} tab_item {sekme} breadcrumb_item {içerik haritası öğesi} "
      & "section_item {bölüm} other {ayırıcı}}: {state, select, "
      & "current_item {geçerli} active_item {etkin} inactive_item {etkin "
      & "değil} disabled_item {devre dışı} expanded_item {genişletilmiş} "
      & "collapsed_item {daraltılmış} visited_item {ziyaret edilmiş} other "
      & "{harici}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {geçerli} active_item {etkin} "
      & "inactive_item {etkin değil} disabled_item {devre dışı} "
      & "expanded_item {genişletilmiş} collapsed_item {daraltılmış} "
      & "visited_item {ziyaret edilmiş} other {harici}}");
   P ("label.navigation.next_label", "sonraki: {target}");
end Labels_1;
