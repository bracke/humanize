separate (Humanize.Catalogs.Phrase_Data.Locale_Hu)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{name}: {state, select, active_account {aktív fiók} invited_account "
      & "{meghívott fiók} locked_account {zárolt fiók} suspended_account "
      & "{felfüggesztett fiók} deleted_account {törölt fiók} other "
      & "{ismeretlen fiókállapot}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {aktív fiók} invited_account "
      & "{meghívott fiók} locked_account {zárolt fiók} suspended_account "
      & "{felfüggesztett fiók} deleted_account {törölt fiók} other "
      & "{ismeretlen fiókállapot}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {megbízható eszköz} untrusted_device "
      & "{nem megbízható eszköz} new_device {új eszköz} other {letiltott "
      & "eszköz}}");
   P ("label.accounts.last_active_label", "{name} utoljára aktív: {time_text}");
   P ("label.accounts.login_attempt_label",
      "{name}: {succeeded, select, false {sikertelen bejelentkezés} other "
      & "{sikeres bejelentkezés}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA bekapcsolva} mfa_disabled {MFA "
      & "kikapcsolva} mfa_required {MFA kötelező} other {MFA "
      & "visszaállítása szükséges}}");
   P ("label.accounts.session_label",
      "{name}: {state, select, active_session {aktív munkamenet} "
      & "expired_session {a munkamenet lejárt} revoked_session {a munkamenet "
      & "visszavonva} idle_session {tétlen munkamenet} other {ismeretlen "
      & "munkamenet-állapot}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {aktív munkamenet} expired_session {a "
      & "munkamenet lejárt} revoked_session {a munkamenet visszavonva} "
      & "idle_session {tétlen munkamenet} other {ismeretlen "
      & "munkamenet-állapot}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {nincs melléklet} one {1 melléklet} other "
      & "{{count, number} melléklet}}");
   P ("label.attachments.attachment_group_label",
      "{name}: {count, plural, one {1 melléklet} other {{count, number} "
      & "melléklet}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {fájlmelléklet} image_attachment "
      & "{képmelléklet} video_attachment {videómelléklet} audio_attachment "
      & "{hangmelléklet} document_attachment {dokumentummelléklet} "
      & "archive_attachment {archívummelléklet} other "
      & "{hivatkozásmelléklet}}");
   P ("label.attachments.attachment_label",
      "{name} ({kind, select, file_attachment {fájl} image_attachment {kép} "
      & "video_attachment {videó} audio_attachment {hang} document_attachment "
      & "{dokumentum} archive_attachment {archívum} other {hivatkozás}}): "
      & "{state, select, pending_attachment {függőben} uploading_attachment "
      & "{feltöltés folyamatban} uploaded_attachment {feltöltve} "
      & "failed_attachment {sikertelen} removed_attachment {eltávolítva} "
      & "other {letiltva}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {függőben lévő melléklet} "
      & "uploading_attachment {melléklet feltöltése folyamatban} "
      & "uploaded_attachment {feltöltött melléklet} failed_attachment "
      & "{sikertelen melléklet} removed_attachment {eltávolított melléklet} "
      & "other {letiltott melléklet}}");
   P ("label.attachments.download_label", "{name} letöltése");
   P ("label.attachments.expiring_link_label", "{name}: a hivatkozás lejár {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "{name} előnézete");
   P ("label.attachments.remove_label", "{name} eltávolítása");
   P ("label.attachments.scan_result_label",
      "{name}: {state, select, not_scanned {nincs ellenőrizve} scanning "
      & "{ellenőrzés folyamatban} safe {biztonságos} suspicious {gyanús} "
      & "other {fertőzött}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {nincs ellenőrizve} scanning "
      & "{ellenőrzés folyamatban} safe {ellenőrzés: biztonságos} "
      & "suspicious {ellenőrzés: gyanús} other {ellenőrzés: fertőzött}}");
   P ("label.attachments.upload_error_label", "{name} feltöltése sikertelen: {reason}");
   P ("label.badges.badge_label",
      "{name}, {state, select, default_badge {jelvény} new_badge {új "
      & "jelvény} updated_badge {frissített jelvény} deprecated_badge "
      & "{elavult jelvény} selected_badge {kijelölt jelvény} disabled_badge "
      & "{letiltott jelvény} other {bezárható jelvény}} ({tone, select, "
      & "neutral_tone {semleges} info_tone {információ} success_tone {siker} "
      & "warning_tone {figyelmeztetés} danger_tone {veszély} other "
      & "{halványított}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {alacsony prioritású jelvény} "
      & "medium_priority {közepes prioritású jelvény} high_priority {magas "
      & "prioritású jelvény} other {kritikus prioritású jelvény}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {alapértelmezett jelvény} new_badge "
      & "{új jelvény} updated_badge {frissített jelvény} deprecated_badge "
      & "{elavult jelvény} selected_badge {kijelölt jelvény} disabled_badge "
      & "{letiltott jelvény} other {bezárható jelvény}}");
   P ("label.badges.badge_tone_label",
      "jelvény: {tone, select, neutral_tone {semleges} info_tone "
      & "{információ} success_tone {siker} warning_tone {figyelmeztetés} "
      & "danger_tone {veszély} other {halványított}}");
   P ("label.badges.chip_label",
      "{selected, select, false {{name} chip} other {{name} chip, "
      & "kijelölve}}");
   P ("label.badges.count_badge_label", "{name}: {count, plural, =0 {nincs} other {{count, number}}}");
   P ("label.badges.deprecated_label", "{name}, elavult jelvény");
   P ("label.badges.dismiss_label", "{name} elvetése");
   P ("label.badges.new_label", "{name}, új jelvény");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {nincs rejtett jelvény} one {+1 további "
      & "jelvény} other {+{hidden_count, number} további jelvény}}");
   P ("label.badges.priority_badge_label",
      "{name}, {priority, select, low_priority {alacsony prioritású "
      & "jelvény} medium_priority {közepes prioritású jelvény} "
      & "high_priority {magas prioritású jelvény} other {kritikus "
      & "prioritású jelvény}}");
   P ("label.badges.status_badge_label",
      "{name}, állapot: {tone, select, neutral_tone {semleges} info_tone "
      & "{információ} success_tone {siker} warning_tone {figyelmeztetés} "
      & "danger_tone {veszély} other {halványított}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {nincs címke} one {1 címke} other {{count, "
      & "number} címke}}");
   P ("label.badges.tag_label", "{name} címke");
   P ("label.badges.updated_label", "{name}, frissített jelvény");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefaktum feltöltve} "
      & "artifact_missing {artefaktum hiányzik} artifact_expired {artefaktum "
      & "lejárt} other {artefaktum ellenőrizve}}");
   P ("label.builds.benchmark_label", "{name} teljesítményteszt: {result_text}");
   P ("label.builds.build_label",
      "{name}: {state, select, build_queued {fordítás sorban áll} "
      & "build_running {fordítás fut} build_passed {sikeres fordítás} "
      & "build_failed {sikertelen fordítás} snapshot_build {snapshot "
      & "fordítás} other {kiadási fordítás}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {fordítás sorban áll} build_running "
      & "{fordítás fut} build_passed {sikeres fordítás} build_failed "
      & "{sikertelen fordítás} snapshot_build {snapshot fordítás} other "
      & "{kiadási fordítás}}");
   P ("label.builds.coverage_label", "lefedettség: {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {kiadási kapu: sikeres} gate_failed "
      & "{kiadási kapu: sikertelen} gate_warning {kiadási kapu: "
      & "figyelmeztetés} other {kiadási kapu: blokkolva}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {nincs sikeres teszt} "
      & "one {1 sikeres teszt} other {{count, number} sikeres teszt}}} "
      & "failed_test {{count, plural, =0 {nincs sikertelen teszt} one {1 "
      & "sikertelen teszt} other {{count, number} sikertelen teszt}}} "
      & "skipped_test {{count, plural, =0 {nincs kihagyott teszt} one {1 "
      & "kihagyott teszt} other {{count, number} kihagyott teszt}}} flaky_test "
      & "{{count, plural, =0 {nincs instabil teszt} one {1 instabil teszt} "
      & "other {{count, number} instabil teszt}}} other {{count, plural, =0 "
      & "{nincs várhatóan sikertelen teszt} one {1 várhatóan sikertelen "
      & "teszt} other {{count, number} várhatóan sikertelen teszt}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {sikeres} failed_test {sikertelen} "
      & "skipped_test {kihagyva} flaky_test {instabil} other {várhatóan "
      & "sikertelen}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "változatlan: kikapcsolva} other {{field_name} módosítva: "
      & "kikapcsolva → bekapcsolva}}} other {{new_value, select, false "
      & "{{field_name} módosítva: bekapcsolva → kikapcsolva} other "
      & "{{field_name} változatlan: bekapcsolva}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {hozzáadva} removed_change "
      & "{eltávolítva} modified_change {módosítva} renamed_change "
      & "{átnevezve} unchanged_change {változatlan} metadata_change "
      & "{metaadatok módosítva} moved_change {áthelyezve} conflict_change "
      & "{ütközés} other {ismeretlen változás}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {tájékoztató változás} "
      & "minor_change {kisebb változás} major_change {jelentős változás} "
      & "other {kompatibilitástörő változás}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} változatlan} "
      & "other {{unchanged, plural, =0 {{field_name} módosítva: {added, "
      & "number} hozzáadva} other {{field_name} módosítva: {added, number} "
      & "hozzáadva, {unchanged, number} változatlan}}}}} other {{added, "
      & "plural, =0 {{unchanged, plural, =0 {{field_name} módosítva: "
      & "{removed, number} eltávolítva} other {{field_name} módosítva: "
      & "{removed, number} eltávolítva, {unchanged, number} változatlan}}} "
      & "other {{unchanged, plural, =0 {{field_name} módosítva: {added, "
      & "number} hozzáadva, {removed, number} eltávolítva} other "
      & "{{field_name} módosítva: {added, number} hozzáadva, {removed, "
      & "number} eltávolítva, {unchanged, number} változatlan}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {nincs ütközés} one {1 ütközés} other "
      & "{{count, number} ütközés}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} későbbre helyezve: {old_label} "
      & "→ {new_label}} other {{field_name} korábbra helyezve: {old_label} "
      & "→ {new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} módosítva: {old_label} → {new_label}");
   P ("label.changes.field_change_label", "{field_name} módosítva: {old_value} → {new_value}");
   P ("label.changes.item_change_label",
      "{name}: {kind, select, added_change {hozzáadva} removed_change "
      & "{eltávolítva} modified_change {módosítva} renamed_change "
      & "{átnevezve} unchanged_change {változatlan} metadata_change "
      & "{metaadatok módosítva} moved_change {áthelyezve} conflict_change "
      & "{ütközés} other {ismeretlen változás}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {csak a metaadatok módosultak} one {csak 1 "
      & "metaadatmező módosult} other {csak {count, number} metaadatmező "
      & "módosult}}");
   P ("label.changes.move_label", "{name} áthelyezve: {from} → {to}");
   P ("label.changes.no_changes_label", "nincs változás");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {nincs "
      & "sorváltozás} one {1 sor hozzáadva} other {{lines_added, number} sor "
      & "hozzáadva}}} one {{lines_added, plural, =0 {1 sor eltávolítva} one "
      & "{1 sor hozzáadva, 1 sor eltávolítva} other {{lines_added, number} "
      & "sor hozzáadva, 1 sor eltávolítva}}} other {{lines_added, plural, =0 "
      & "{{lines_removed, number} sor eltávolítva} one {1 sor hozzáadva, "
      & "{lines_removed, number} sor eltávolítva} other {{lines_added, "
      & "number} sor hozzáadva, {lines_removed, number} sor eltávolítva}}}}");
   P ("label.changes.rename_label", "átnevezve: {old_name} → {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} megjegyzésvázlatot írt} "
      & "published_comment {{author} megjegyzést írt} edited_comment "
      & "{{author} szerkesztett egy megjegyzést} deleted_comment {{author} "
      & "törölt egy megjegyzést} resolved_comment {{author} megoldottnak "
      & "jelölt egy megjegyzést} unresolved_comment {{author} újranyitott "
      & "egy megjegyzést} pinned_comment {{author} kitűzött egy "
      & "megjegyzést} other {{author} elrejtett egy megjegyzést}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {nincs megjegyzés} one {1 megjegyzés} other "
      & "{{count, number} megjegyzés}}");
   P ("label.comments.comment_label",
      "{author}: {state, select, draft_comment {megjegyzésvázlat} "
      & "published_comment {közzétett megjegyzés} edited_comment "
      & "{szerkesztett megjegyzés} deleted_comment {törölt megjegyzés} "
      & "resolved_comment {megoldott megjegyzés} unresolved_comment "
      & "{megoldatlan megjegyzés} pinned_comment {kitűzött megjegyzés} "
      & "other {rejtett megjegyzés}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {megjegyzésvázlat} published_comment "
      & "{közzétett megjegyzés} edited_comment {szerkesztett megjegyzés} "
      & "deleted_comment {törölt megjegyzés} resolved_comment {megoldott "
      & "megjegyzés} unresolved_comment {megoldatlan megjegyzés} "
      & "pinned_comment {kitűzött megjegyzés} other {rejtett megjegyzés}}");
   P ("label.comments.deleted_label", "{author} törölt egy megjegyzést");
   P ("label.comments.edited_label", "szerkesztve: {time_text}");
   P ("label.comments.hide_comment_label", "megjegyzés elrejtése: {reason}");
   P ("label.comments.lock_thread_label", "{name} szál zárolása");
   P ("label.comments.mention_label", "{actor} megemlítette: {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {nincs résztvevő} one {1 résztvevő} other "
      & "{{count, number} résztvevő}}");
   P ("label.comments.pin_label", "{name} kitűzése");
   P ("label.comments.reaction_kind_label",
      "reakció: {kind, select, like_reaction {tetszik} dislike_reaction {nem "
      & "tetszik} heart_reaction {szív} laugh_reaction {nevetés} "
      & "confused_reaction {zavart} hooray_reaction {hurrá} rocket_reaction "
      & "{rakéta} other {szemek}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {nincs kedvelés} one "
      & "{1 kedvelés} other {{count, number} kedvelés}}} dislike_reaction "
      & "{{count, plural, =0 {nincs nemtetszés} one {1 nemtetszés} other "
      & "{{count, number} nemtetszés}}} heart_reaction {{count, plural, =0 "
      & "{nincs szív} one {1 szív} other {{count, number} szív}}} "
      & "laugh_reaction {{count, plural, =0 {nincs nevetés} one {1 nevetés} "
      & "other {{count, number} nevetés}}} confused_reaction {{count, plural, "
      & "=0 {nincs zavart reakció} one {1 zavart reakció} other {{count, "
      & "number} zavart reakció}}} hooray_reaction {{count, plural, =0 {nincs "
      & "hurrá} one {1 hurrá} other {{count, number} hurrá}}} "
      & "rocket_reaction {{count, plural, =0 {nincs rakéta} one {1 rakéta} "
      & "other {{count, number} rakéta}}} other {{count, plural, =0 {nincs "
      & "szemek-reakció} one {1 szemek-reakció} other {{count, number} "
      & "szemek-reakció}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {nincs válasz} one {1 válasz} other {{count, "
      & "number} válasz}}");
   P ("label.comments.resolved_label", "{name} megoldva");
   P ("label.comments.subscribe_label", "feliratkozás: {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {nincs szál} one {1 szál} other {{count, number} "
      & "szál}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {nyitott szál} resolved_thread "
      & "{megoldott szál} locked_thread {zárolt szál} other {archivált "
      & "szál}}{count, plural, =0 {} one {, 1 megjegyzés} other {, {count, "
      & "number} megjegyzés}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {nyitott szál} resolved_thread {megoldott "
      & "szál} locked_thread {zárolt szál} other {archivált szál}}");
   P ("label.comments.unpin_label", "{name} kitűzésének megszüntetése");
   P ("label.comments.unsubscribe_label", "leiratkozás: {name}");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {javult} regressed {romlott} "
      & "unchanged {változatlan} within_tolerance {tűréshatáron belül} "
      & "outside_tolerance {tűréshatáron kívül} new_value {új} "
      & "removed_value {eltávolítva} other {nincs alapérték}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {javult} regressed {romlott} unchanged "
      & "{változatlan} within_tolerance {tűréshatáron belül} "
      & "outside_tolerance {tűréshatáron kívül} new_value {új} "
      & "removed_value {eltávolítva} other {nincs alapérték}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {javult} regressed {romlott} "
      & "unchanged {változatlan} within_tolerance {tűréshatáron belül} "
      & "outside_tolerance {tűréshatáron kívül} new_value {új} "
      & "removed_value {eltávolítva} other {nincs alapérték}} "
      & "({difference_text})");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {javult} regressed {romlott} "
      & "unchanged {változatlan} within_tolerance {tűréshatáron belül} "
      & "outside_tolerance {tűréshatáron kívül} new_value {új} "
      & "removed_value {eltávolítva} other {nincs alapérték}} "
      & "({difference_text}, tűréshatár: {tolerance_text})");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {érvénytelen sor} duplicate_record "
      & "{ismétlődő rekord} missing_column {hiányzó oszlop} unknown_field "
      & "{ismeretlen mező} schema_mismatch {sémaeltérés} other {kihagyott "
      & "rekord}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {próbafuttatás sikeres} "
      & "dry_run_failed {próbafuttatás sikertelen} import_valid {az "
      & "importálás érvényes} import_invalid {az importálás "
      & "érvénytelen} other {részleges importálás}}");
   P ("label.data_quality.import_result_label",
      "{name} ({state, select, dry_run_passed {próbafuttatás sikeres} "
      & "dry_run_failed {próbafuttatás sikertelen} import_valid {az "
      & "importálás érvényes} import_invalid {az importálás "
      & "érvénytelen} other {részleges importálás}}): {accepted, number} "
      & "elfogadva, {rejected, number} elutasítva");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {nincs érvénytelen "
      & "sor} one {1 érvénytelen sor} other {{count, number} érvénytelen "
      & "sor}}} duplicate_record {{count, plural, =0 {nincs ismétlődő "
      & "rekord} one {1 ismétlődő rekord} other {{count, number} "
      & "ismétlődő rekord}}} missing_column {{count, plural, =0 {nincs "
      & "hiányzó oszlop} one {1 hiányzó oszlop} other {{count, number} "
      & "hiányzó oszlop}}} unknown_field {{count, plural, =0 {nincs "
      & "ismeretlen mező} one {1 ismeretlen mező} other {{count, number} "
      & "ismeretlen mező}}} schema_mismatch {{count, plural, =0 {nincs "
      & "sémaeltérés} one {1 sémaeltérés} other {{count, number} "
      & "sémaeltérés}}} other {{count, plural, =0 {nincs kihagyott rekord} "
      & "one {1 kihagyott rekord} other {{count, number} kihagyott rekord}}}}");
   P ("label.data_quality.row_issue_label",
      "{row, number}. sor: {issue, select, invalid_row {érvénytelen} "
      & "duplicate_record {ismétlődő rekord} missing_column {hiányzó "
      & "oszlop} unknown_field {ismeretlen mező} schema_mismatch "
      & "{sémaeltérés} other {kihagyott rekord}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {érvénytelen sor} "
      & "duplicate_record {ismétlődő rekord} missing_column {hiányzó "
      & "oszlop} unknown_field {ismeretlen mező} schema_mismatch "
      & "{sémaeltérés} other {kihagyott rekord}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefaktum kész} artifact_uploaded "
      & "{artefaktum feltöltve} artifact_signed {artefaktum aláírva} "
      & "artifact_missing {artefaktum hiányzik} other {artefaktum lejárt}}");
   P ("label.deployments.deployment_label",
      "{name} ({environment} környezet): {state, select, queued_deployment "
      & "{telepítés várólistán} deploying {telepítés folyamatban} "
      & "deployed {telepítve} failed_deployment {telepítés sikertelen} "
      & "rolled_back {visszaállítva} blocked_deployment {telepítés "
      & "blokkolva} other {telepítés megszakítva}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {telepítés várólistán} "
      & "deploying {telepítés folyamatban} deployed {telepítve} "
      & "failed_deployment {telepítés sikertelen} rolled_back "
      & "{visszaállítva} blocked_deployment {telepítés blokkolva} other "
      & "{telepítés megszakítva}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {környezet rendben} "
      & "drifting_environment {környezet eltér} locked_environment "
      & "{környezet zárolva} maintenance_environment {környezet "
      & "karbantartás alatt} other {ismeretlen környezetállapot}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {nincs migráció} migration_pending "
      & "{migráció függőben} migrating {migrálás folyamatban} "
      & "migration_complete {migráció kész} other {migráció sikertelen}}");
   P ("label.deployments.promotion_label", "{name} előléptetve: {from_environment} → {to_environment}");
   P ("label.deployments.rollback_label", "{name}: visszaállítás, cél: {target}");
   P ("label.deployments.rollout_label", "{name}: bevezetés {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {nincs érintett elem} one {1 érintett elem} other "
      & "{{count, number} érintett elem}}");
   P ("label.diagnostics.check_duration_label",
      "{status, select, passed_check {{name}: sikeres ({duration_s, plural, "
      & "one {1 másodperc} other {{duration_s, number} másodperc}})} "
      & "failed_check {{name}: sikertelen ({duration_s, plural, one {1 "
      & "másodperc} other {{duration_s, number} másodperc}})} warning_check "
      & "{{name}: figyelmeztetések ({duration_s, plural, one {1 másodperc} "
      & "other {{duration_s, number} másodperc}})} skipped_check {{name}: "
      & "kihagyva ({duration_s, plural, one {1 másodperc} other {{duration_s, "
      & "number} másodperc}})} pending_check {{name}: függőben ({duration_s, "
      & "plural, one {1 másodperc} other {{duration_s, number} másodperc}})} "
      & "other {{name}: fut ({duration_s, plural, one {1 másodperc} other "
      & "{{duration_s, number} másodperc}})}}");
   P ("label.diagnostics.check_result_label",
      "{status, select, passed_check {{name}: sikeres} failed_check {{name}: "
      & "sikertelen} warning_check {{name}: figyelmeztetések} skipped_check "
      & "{{name}: kihagyva} pending_check {{name}: függőben} other {{name}: "
      & "fut}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {sikeres} failed_check {sikertelen} "
      & "warning_check {figyelmeztetések} skipped_check {kihagyva} "
      & "pending_check {függőben} other {fut}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {{subject}: érték szükséges} "
      & "expected_unit {{subject}: mértékegység szükséges} invalid_range "
      & "{{subject}: érvénytelen tartomány} end_before_start {{subject}: a "
      & "tartomány vége a kezdete előtt van} unknown_field {{subject}: "
      & "ismeretlen mező} unsafe_redacted_value {{subject}: nem biztonságos "
      & "érték kitakarva} unsupported_syntax {{subject}: nem támogatott "
      & "szintaxis} other {{subject}: diagnosztikai magyarázat}}{position, "
      & "plural, =0 {;} other { ({position, number}. pozíció);}} javaslat: "
      & "{suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {információ} notice_severity "
      & "{megjegyzés} warning_severity {figyelmeztetés} error_severity {hiba} "
      & "critical_severity {kritikus} other {blokkoló}} ({line, plural, =0 "
      & "{{path}): {message}} other {{path}, {line, number}. sor): {message}}}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {sikertelen: {path}} other {{column, plural, =0 "
      & "{sikertelen: {path}, {line, number}. sor} other {sikertelen: {path}, "
      & "{line, number}. sor, {column, number}. oszlop}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {információ} notice_severity "
      & "{megjegyzés} warning_severity {figyelmeztetés} error_severity {hiba} "
      & "critical_severity {kritikus} other {blokkoló}} ({field_name}): "
      & "{message}");
   P ("label.diagnostics.first_failure_label",
      "{line, plural, =0 {első hiba ({check_name}): {path}} other {első "
      & "hiba ({check_name}): {path}, {line, number}. sor}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{nincs probléma} one {1 megjegyzés} other {{notices, number} "
      & "megjegyzés}}} one {{notices, plural, =0 {1 figyelmeztetés} one {1 "
      & "figyelmeztetés, 1 megjegyzés} other {1 figyelmeztetés, {notices, "
      & "number} megjegyzés}}} other {{notices, plural, =0 {{warnings, number} "
      & "figyelmeztetés} one {{warnings, number} figyelmeztetés, 1 "
      & "megjegyzés} other {{warnings, number} figyelmeztetés, {notices, "
      & "number} megjegyzés}}}}} one {{warnings, plural, =0 {{notices, plural, "
      & "=0 {1 hiba} one {1 hiba, 1 megjegyzés} other {1 hiba, {notices, "
      & "number} megjegyzés}}} one {{notices, plural, =0 {1 hiba, 1 "
      & "figyelmeztetés} one {1 hiba, 1 figyelmeztetés, 1 megjegyzés} other "
      & "{1 hiba, 1 figyelmeztetés, {notices, number} megjegyzés}}} other "
      & "{{notices, plural, =0 {1 hiba, {warnings, number} figyelmeztetés} one "
      & "{1 hiba, {warnings, number} figyelmeztetés, 1 megjegyzés} other {1 "
      & "hiba, {warnings, number} figyelmeztetés, {notices, number} "
      & "megjegyzés}}}}} other {{warnings, plural, =0 {{notices, plural, =0 "
      & "{{errors, number} hiba} one {{errors, number} hiba, 1 megjegyzés} "
      & "other {{errors, number} hiba, {notices, number} megjegyzés}}} one "
      & "{{notices, plural, =0 {{errors, number} hiba, 1 figyelmeztetés} one "
      & "{{errors, number} hiba, 1 figyelmeztetés, 1 megjegyzés} other "
      & "{{errors, number} hiba, 1 figyelmeztetés, {notices, number} "
      & "megjegyzés}}} other {{notices, plural, =0 {{errors, number} hiba, "
      & "{warnings, number} figyelmeztetés} one {{errors, number} hiba, "
      & "{warnings, number} figyelmeztetés, 1 megjegyzés} other {{errors, "
      & "number} hiba, {warnings, number} figyelmeztetés, {notices, number} "
      & "megjegyzés}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, {line, "
      & "number}. sor} other {{path}, {line, number}. sor, {column, number}. "
      & "oszlop}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "nem támogatott szintaxis ({family, select, byte_parser {bájtelemző} "
      & "duration_parser {időtartam-elemző} date_time_parser {dátum- és "
      & "időelemző} color_parser {színelemző} url_parser {URL-elemző} "
      & "unit_parser {mértékegység-elemző} recurrence_parser "
      & "{ismétlődéselemző} domain_label_parser {tartománycímke-elemző} "
      & "other {elemző}}): {error}{position, plural, =0 {;} other { "
      & "({position, number}. pozíció);}} {family, select, byte_parser "
      & "{használható: B, kB, MB, GB, KiB, MiB, GiB vagy TiB} duration_parser "
      & "{használható: ms, s, min, h, d, w, month vagy year} date_time_parser "
      & "{használjon ISO-dátumot, természetes napmegjelölést vagy "
      & "időpontot} color_parser {használjon hex, rgb(), hsl(), lab(), lch() "
      & "formát vagy színnevet} url_parser {használjon sémát, gazdagépet, "
      & "elérési utat, lekérdezést vagy töredéket} unit_parser "
      & "{használjon a Humanize által támogatott mértékegység-címkét} "
      & "recurrence_parser {használjon cron vagy every/weekday ismétlődési "
      & "formát} domain_label_parser {használjon determinisztikus "
      & "Humanize-tartománycímkét} other {használjon támogatott beviteli "
      & "formát}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {sikeres} failed_check {sikertelen} "
      & "warning_check {figyelmeztetések} skipped_check {kihagyva} "
      & "pending_check {függőben} other {fut}}, {notices, plural, =0 {nincs "
      & "megjegyzés} one {1 megjegyzés} other {{notices, number} "
      & "megjegyzés}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {újrapróbálkozás: 1/1} "
      & "other {újrapróbálkozás: {attempt, number}/1 – korlát "
      & "túllépve}}} other {újrapróbálkozás: {attempt, number}/{limit, "
      & "number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {információ} notice_severity "
      & "{megjegyzés} warning_severity {figyelmeztetés} error_severity {hiba} "
      & "critical_severity {kritikus} other {blokkoló}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {fordítási diagnosztika} test_source "
      & "{tesztdiagnosztika} lint_source {lint-diagnosztika} import_source "
      & "{importálási diagnosztika} validation_source {validálási "
      & "diagnosztika} runtime_source {futásidejű diagnosztika} "
      & "security_source {biztonsági diagnosztika} other {diagnosztika}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {1} other {{count, number}}} {source, select, "
      & "build_source {fordítási diagnosztikai üzenet} test_source "
      & "{tesztdiagnosztikai üzenet} lint_source {lint-diagnosztikai üzenet} "
      & "import_source {importálási diagnosztikai üzenet} validation_source "
      & "{validálási diagnosztikai üzenet} runtime_source {futásidejű "
      & "diagnosztikai üzenet} security_source {biztonsági diagnosztikai "
      & "üzenet} other {diagnosztikai üzenet}}");
   P ("label.diagnostics.suggested_action_label", "következő lépés: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {tartománynév} ipv4_host {IPv4-cím} "
      & "ipv6_host {IPv6-cím} localhost_host {helyi gép} private_network_host "
      & "{magánhálózati cím} other {ismeretlen gazdagép}}");
   P ("label.events.all_day_label", "{name} – egész napos esemény");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {nem válaszolt} accepted {elfogadva} "
      & "declined {elutasítva} maybe {talán} other {várólistán}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {nincs résztvevő} one {1 résztvevő} other "
      & "{{count, number} résztvevő}}");
   P ("label.events.canceled_label", "{name} – lemondva");
   P ("label.events.check_in_label", "becsekkolás: {name}");
   P ("label.events.conference_link_label", "{name} – konferencia-hivatkozás");
   P ("label.events.event_count_label",
      "{count, plural, =0 {nincs esemény} one {1 esemény} other {{count, "
      & "number} esemény}}");
   P ("label.events.event_label",
      "{state, select, scheduled_event {{name}: ütemezett} tentative_event "
      & "{{name}: feltételes} in_progress_event {{name}: folyamatban} "
      & "completed_event {{name}: befejezve} canceled_event {{name}: lemondva} "
      & "other {{name}: elhalasztva}}");
   P ("label.events.event_location_label", "{name}, helyszín: {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {ütemezett esemény} tentative_event "
      & "{feltételes esemény} in_progress_event {folyamatban lévő esemény} "
      & "completed_event {befejezett esemény} canceled_event {lemondott "
      & "esemény} other {elhalasztott esemény}}");
   P ("label.events.event_time_label", "{name}, időpont: {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {nyilvános esemény} private_event "
      & "{privát esemény} busy_event {foglaltként jelenik meg} other "
      & "{szabadként jelenik meg}}");
   P ("label.events.organizer_label", "szervező: {name}");
   P ("label.events.rsvp_label",
      "visszajelzés: {state, select, not_responded {nem válaszolt} accepted "
      & "{elfogadva} declined {elutasítva} maybe {talán} other "
      & "{várólistán}}");
   P ("label.events.reminder_label", "emlékeztető: {time_text}");
   P ("label.events.rescheduled_label", "{name} áthelyezve, új időpont: {time_text}");
   P ("label.forms.character_count_label", "{used, plural, one {1 karakter} other {{used, number} karakter}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {nincs karakterkorlát} one {legfeljebb 1 karakter} "
      & "other {legfeljebb {limit, number} karakter}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {1 karakter} other {{used, "
      & "number} karakter}}} other {{used, number}/{limit, number} karakter}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}, nem kötelező mező} other {{name}, "
      & "kötelező mező}}");
   P ("label.forms.field_state_label",
      "{state, select, valid_input {{name}: érvényes} invalid_input "
      & "{{name}: érvénytelen} required_input {{name}: kötelező} "
      & "optional_input {{name}: nem kötelező} disabled_input {{name}: "
      & "letiltva} other {{name}: csak olvasható}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {nincs űrlapprobléma} one "
      & "{1 figyelmeztetés} other {{warnings, number} figyelmeztetés}}} one "
      & "{{warnings, plural, =0 {1 hiba} one {1 hiba, 1 figyelmeztetés} other "
      & "{1 hiba, {warnings, number} figyelmeztetés}}} other {{warnings, "
      & "plural, =0 {{errors, number} hiba} one {{errors, number} hiba, 1 "
      & "figyelmeztetés} other {{errors, number} hiba, {warnings, number} "
      & "figyelmeztetés}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {még nincs kitöltve} editing_form "
      & "{szerkesztés alatt} dirty_form {nem mentett módosítások} "
      & "saving_form {mentés folyamatban} saved_form {mentve} submitted_form "
      & "{elküldve} other {beküldés sikertelen}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {érvényes bevitel} invalid_input "
      & "{érvénytelen bevitel} required_input {kötelező bevitel} "
      & "optional_input {nem kötelező bevitel} disabled_input {letiltott "
      & "bevitel} other {csak olvasható bevitel}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {még nincs kitöltve} editing_form "
      & "{szerkesztés alatt} dirty_form {nem mentett módosítások} "
      & "saving_form {űrlap mentése folyamatban} saved_form {űrlap mentve} "
      & "submitted_form {űrlap elküldve} other {{errors, plural, =0 "
      & "{beküldés sikertelen} one {beküldés sikertelen, 1 hiba} other "
      & "{beküldés sikertelen, {errors, number} hiba}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {nincs nem mentett módosítás} one {1 nem mentett "
      & "módosítás} other {{count, number} nem mentett módosítás}}");
   P ("label.markup.accessibility_issue_label",
      "{issue, select, missing_accessible_name {{target}: hiányzó "
      & "akadálymentes név} low_contrast {{target}: alacsony kontraszt} "
      & "skipped_heading_level {{target}: kihagyott címsorszint} "
      & "missing_form_label {{target}: hiányzó űrlapcímke} invalid_aria "
      & "{{target}: érvénytelen ARIA} keyboard_trap {{target}: "
      & "billentyűzetcsapda} other {{target}: ismeretlen akadálymentességi "
      & "probléma}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}, akadálymentesség: {landmarks, plural, one {1 "
      & "tájékozódási pont} other {{landmarks, number} tájékozódási "
      & "pont}}, {headings, plural, one {1 címsor} other {{headings, number} "
      & "címsor}}, {issues, plural, one {1 probléma} other {{issues, number} "
      & "probléma}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {adjon meg akadálymentes "
      & "nevet} low_contrast {növelje a szöveg kontrasztját} "
      & "skipped_heading_level {használjon egymást követő címsorszinteket} "
      & "missing_form_label {rendeljen címkét az űrlapvezérlőhöz} "
      & "invalid_aria {használjon érvényes ARIA-szerepkört vagy "
      & "-attribútumot} keyboard_trap {gondoskodjon róla, hogy a "
      & "billentyűzetfókusz elhagyhassa az összetevőt} other {vizsgálja "
      & "meg az akadálymentességi problémát}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target}: nincs akadálymentességi probléma} "
      & "one {{target}: 1 akadálymentességi probléma} other {{target}: "
      & "{issues, number} akadálymentességi probléma}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id attribútum} class_attribute {class "
      & "attribútum} data_attribute {data attribútum} aria_attribute "
      & "{ARIA-attribútum} role_attribute {role attribútum} link_attribute "
      & "{hivatkozásattribútum} media_attribute {médiaattribútum} "
      & "form_attribute {űrlapattribútum} boolean_attribute {logikai "
      & "attribútum} event_attribute {eseménykezelő attribútum} other "
      & "{ismeretlen attribútum}}");
   P ("label.markup.form_error_summary_label",
      "{form_name}: {errors, plural, =0 {{warnings, plural, =0 {nincs "
      & "űrlapprobléma} one {1 figyelmeztetés} other {{warnings, number} "
      & "figyelmeztetés}}} one {{warnings, plural, =0 {1 hiba} one {1 hiba, 1 "
      & "figyelmeztetés} other {1 hiba, {warnings, number} figyelmeztetés}}} "
      & "other {{warnings, plural, =0 {{errors, number} hiba} one {{errors, "
      & "number} hiba, 1 figyelmeztetés} other {{errors, number} hiba, "
      & "{warnings, number} figyelmeztetés}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {banner tájékozódási pont} "
      & "navigation_role {navigációs tájékozódási pont} main_role {fő "
      & "tájékozódási pont} complementary_role {kiegészítő "
      & "tájékozódási pont} contentinfo_role {tartalominformációs "
      & "tájékozódási pont} search_role {keresési tájékozódási pont} "
      & "form_role {űrlap tájékozódási pont} region_role {régió "
      & "tájékozódási pont} dialog_role {párbeszédablak} alert_role "
      & "{riasztási élő régió} status_role {állapot élő régió} other "
      & "{ismeretlen tájékozódási pont}}");
   P ("label.markup.live_region_update_label",
      "{region}, {polite, select, false {azonnali} other {udvarias}} "
      & "frissítés: {update}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {szöveges tartalom} html_content "
      & "{HTML-tartalom} json_content {JSON-tartalom} xml_content "
      & "{XML-tartalom} image_content {képtartalom} audio_content "
      & "{hangtartalom} video_content {videótartalom} font_content "
      & "{betűtípus-tartalom} archive_content {archívumtartalom} "
      & "binary_content {bináris tartalom} form_content {űrlaptartalom} other "
      & "{ismeretlen tartalom}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {dokumentumcímke} metadata_tag "
      & "{metaadat-címke} section_tag {szakaszcímke} text_tag {szövegcímke} "
      & "link_tag {hivatkozáscímke} media_tag {médiacímke} form_tag "
      & "{űrlapcímke} table_tag {táblázatcímke} interactive_tag "
      & "{interaktív címke} scripting_tag {szkriptcímke} other {ismeretlen "
      & "címke}}");
   P ("label.media.duration_label", "időtartam: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {kép} video_media {videó} audio_media "
      & "{hang} pdf_document {PDF-dokumentum} text_document {szöveges "
      & "dokumentum} archive_media {archívum} other {média}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {kész} processing_media {feldolgozás "
      & "alatt} transcoding_media {átkódolás alatt} thumbnail_missing "
      & "{bélyegkép nem érhető el} metadata_missing {hiányzó metaadatok} "
      & "locked_document {dokumentum zárolva} other {nem érhető el}}");
   P ("label.media.media_summary",
      "{name}, {kind, select, image_media {kép} video_media {videó} "
      & "audio_media {hang} pdf_document {PDF-dokumentum} text_document "
      & "{szöveges dokumentum} archive_media {archívum} other {média}}: "
      & "{state, select, ready_media {kész} processing_media {feldolgozás "
      & "alatt} transcoding_media {átkódolás alatt} thumbnail_missing "
      & "{bélyegkép nem érhető el} metadata_missing {hiányzó metaadatok} "
      & "locked_document {zárolva} other {nem érhető el}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {nincs oldal} one {1 oldal} other {{pages, number} "
      & "oldal}}");
   P ("label.media.resolution_label", "{width, number}x{height, number}");
   P ("label.moderation.appeal_label",
      "{item}: fellebbezés, {state, select, open_report {nyitott "
      & "bejelentés} triaged_report {osztályozott bejelentés} "
      & "actioned_report {intézkedés történt} dismissed_report "
      & "{elutasított bejelentés} appealed_report {megfellebbezett "
      & "bejelentés} other {lezárt bejelentés}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {nincs moderálási művelet} flagged "
      & "{megjelölve} hidden {moderátor elrejtette} restored "
      & "{visszaállítva} marked_spam {spamként megjelölve} removed "
      & "{eltávolítva} other {eszkalálva}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {nincs moderálási művelet} "
      & "flagged {megjelölve} hidden {moderátor elrejtette} restored "
      & "{visszaállítva} marked_spam {spamként megjelölve} removed "
      & "{eltávolítva} other {eszkalálva}}");
end Labels_1;
