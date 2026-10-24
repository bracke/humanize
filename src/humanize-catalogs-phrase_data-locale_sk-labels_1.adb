separate (Humanize.Catalogs.Phrase_Data.Locale_Sk)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{name}: {state, select, active_account {aktívny účet} "
      & "invited_account {pozvaný účet} locked_account {uzamknutý účet} "
      & "suspended_account {pozastavený účet} deleted_account {odstránený "
      & "účet} other {neznámy stav účtu}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {aktívny účet} invited_account "
      & "{pozvaný účet} locked_account {uzamknutý účet} suspended_account "
      & "{pozastavený účet} deleted_account {odstránený účet} other "
      & "{neznámy stav účtu}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {dôveryhodné zariadenie} "
      & "untrusted_device {nedôveryhodné zariadenie} new_device {nové "
      & "zariadenie} other {blokované zariadenie}}");
   P ("label.accounts.last_active_label", "{name}: posledná aktivita {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: prihlásenie zlyhalo} other "
      & "{{name}: prihlásenie úspešné}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA zapnuté} mfa_disabled {MFA vypnuté} "
      & "mfa_required {MFA vyžadované} other {vyžaduje sa reset MFA}}");
   P ("label.accounts.session_label",
      "{name}: {state, select, active_session {aktívna relácia} "
      & "expired_session {relácia vypršala} revoked_session {relácia "
      & "zrušená} idle_session {nečinná relácia} other {neznámy stav "
      & "relácie}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {aktívna relácia} expired_session "
      & "{relácia vypršala} revoked_session {relácia zrušená} idle_session "
      & "{nečinná relácia} other {neznámy stav relácie}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {žiadne prílohy} one {1 príloha} few {{count, "
      & "number} prílohy} many {{count, number} prílohy} other {{count, "
      & "number} príloh}}");
   P ("label.attachments.attachment_group_label",
      "{name}: {count, plural, =0 {žiadne prílohy} one {1 príloha} few "
      & "{{count, number} prílohy} many {{count, number} prílohy} other "
      & "{{count, number} príloh}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {priložený súbor} image_attachment "
      & "{priložený obrázok} video_attachment {priložené video} "
      & "audio_attachment {priložený zvuk} document_attachment {priložený "
      & "dokument} archive_attachment {priložený archív} other {priložený "
      & "odkaz}}");
   P ("label.attachments.attachment_label",
      "{name} ({kind, select, file_attachment {súbor} image_attachment "
      & "{obrázok} video_attachment {video} audio_attachment {zvuk} "
      & "document_attachment {dokument} archive_attachment {archív} other "
      & "{odkaz}}): {state, select, pending_attachment {čaká} "
      & "uploading_attachment {nahrávanie} uploaded_attachment {nahrané} "
      & "failed_attachment {zlyhalo} removed_attachment {odstránené} other "
      & "{zablokované}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {príloha čaká} "
      & "uploading_attachment {nahrávanie prílohy} uploaded_attachment "
      & "{príloha nahraná} failed_attachment {chyba prílohy} "
      & "removed_attachment {príloha odstránená} other {príloha "
      & "zablokovaná}}");
   P ("label.attachments.download_label", "stiahnuť {name}");
   P ("label.attachments.expiring_link_label", "{name}: platnosť odkazu vyprší {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "náhľad {name}");
   P ("label.attachments.remove_label", "odstrániť {name}");
   P ("label.attachments.scan_result_label",
      "{name}: {state, select, not_scanned {nekontrolované} scanning "
      & "{prebieha kontrola} safe {bez hrozieb} suspicious {podozrivý obsah} "
      & "other {zistená infekcia}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {nekontrolované} scanning {prebieha "
      & "kontrola} safe {kontrola: bez hrozieb} suspicious {kontrola: "
      & "podozrivý obsah} other {kontrola: zistená infekcia}}");
   P ("label.attachments.upload_error_label", "{name}: nahrávanie zlyhalo – {reason}");
   P ("label.badges.badge_label",
      "{name}: {tone, select, neutral_tone {neutrálny odznak} info_tone "
      & "{informačný odznak} success_tone {odznak úspechu} warning_tone "
      & "{varovný odznak} danger_tone {odznak nebezpečenstva} other {tlmený "
      & "odznak}}{state, select, new_badge {, nový} updated_badge {, "
      & "aktualizovaný} deprecated_badge {, zastaraný} selected_badge {, "
      & "vybraný} disabled_badge {, zakázaný} dismissible_badge {, dá sa "
      & "zavrieť} other {}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {odznak nízkej priority} "
      & "medium_priority {odznak strednej priority} high_priority {odznak "
      & "vysokej priority} other {odznak kritickej priority}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {predvolený odznak} new_badge {nový "
      & "odznak} updated_badge {aktualizovaný odznak} deprecated_badge "
      & "{zastaraný odznak} selected_badge {vybraný odznak} disabled_badge "
      & "{zakázaný odznak} other {zatvárateľný odznak}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {neutrálny odznak} info_tone "
      & "{informačný odznak} success_tone {odznak úspechu} warning_tone "
      & "{varovný odznak} danger_tone {odznak nebezpečenstva} other {tlmený "
      & "odznak}}");
   P ("label.badges.chip_label", "{selected, select, false {{name}} other {{name}, vybrané}}");
   P ("label.badges.count_badge_label", "{name}: {count, number}");
   P ("label.badges.deprecated_label", "{name}: zastarané");
   P ("label.badges.dismiss_label", "zavrieť {name}");
   P ("label.badges.new_label", "{name}: novinka");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {žiadne skryté odznaky} one {+1 odznak} "
      & "few {+{hidden_count, number} odznaky} many {+{hidden_count, number} "
      & "odznaku} other {+{hidden_count, number} odznakov}}");
   P ("label.badges.priority_badge_label",
      "{name}: {priority, select, low_priority {nízka priorita} "
      & "medium_priority {stredná priorita} high_priority {vysoká priorita} "
      & "other {kritická priorita}}");
   P ("label.badges.status_badge_label",
      "{name} – stav: {tone, select, neutral_tone {neutrálny} info_tone "
      & "{informácia} success_tone {úspech} warning_tone {varovanie} "
      & "danger_tone {nebezpečenstvo} other {tlmený}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {žiadne štítky} one {1 štítok} few {{count, "
      & "number} štítky} many {{count, number} štítka} other {{count, "
      & "number} štítkov}}");
   P ("label.badges.tag_label", "štítok {name}");
   P ("label.badges.updated_label", "{name}: aktualizované");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefakt nahraný} artifact_missing "
      & "{artefakt chýba} artifact_expired {platnosť artefaktu vypršala} "
      & "other {artefakt overený}}");
   P ("label.builds.benchmark_label", "benchmark {name}: {result_text}");
   P ("label.builds.build_label",
      "{name}: {state, select, build_queued {zostavenie vo fronte} "
      & "build_running {zostavenie prebieha} build_passed {zostavenie "
      & "úspešné} build_failed {zostavenie zlyhalo} snapshot_build {snapshot "
      & "zostavenie} other {zostavenie vydania}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {zostavenie vo fronte} build_running "
      & "{zostavenie prebieha} build_passed {zostavenie úspešné} "
      & "build_failed {zostavenie zlyhalo} snapshot_build {snapshot zostavenie} "
      & "other {zostavenie vydania}}");
   P ("label.builds.coverage_label", "pokrytie: {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {brána vydania prešla} gate_failed "
      & "{brána vydania neprešla} gate_warning {brána vydania: varovanie} "
      & "other {brána vydania zablokovaná}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {žiadne úspešné "
      & "testy} other {úspešné testy: {count, number}}}} failed_test "
      & "{{count, plural, =0 {žiadne neúspešné testy} other {neúspešné "
      & "testy: {count, number}}}} skipped_test {{count, plural, =0 {žiadne "
      & "preskočené testy} other {preskočené testy: {count, number}}}} "
      & "flaky_test {{count, plural, =0 {žiadne nestabilné testy} other "
      & "{nestabilné testy: {count, number}}}} other {{count, plural, =0 "
      & "{žiadne testy s očakávaným zlyhaním} other {testy s očakávaným "
      & "zlyhaním: {count, number}}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {úspešný} failed_test {neúspešný} "
      & "skipped_test {preskočený} flaky_test {nestabilný} other "
      & "{očakávané zlyhanie}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name}: "
      & "bez zmeny (vypnuté)} other {{field_name}: zapnuté}}} other "
      & "{{new_value, select, false {{field_name}: vypnuté} other "
      & "{{field_name}: bez zmeny (zapnuté)}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {pridané} removed_change {odstránené} "
      & "modified_change {zmenené} renamed_change {premenované} "
      & "unchanged_change {bez zmeny} metadata_change {zmenené metadáta} "
      & "moved_change {presunuté} conflict_change {konflikt} other {neznáma "
      & "zmena}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {informatívna zmena} "
      & "minor_change {drobná zmena} major_change {zásadná zmena} other "
      & "{nekompatibilná zmena}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}: bez zmeny} "
      & "other {{unchanged, plural, =0 {{field_name}: pridané {added, number}} "
      & "other {{field_name}: pridané {added, number}, bez zmeny {unchanged, "
      & "number}}}}}} other {{added, plural, =0 {{unchanged, plural, =0 "
      & "{{field_name}: odstránené {removed, number}} other {{field_name}: "
      & "odstránené {removed, number}, bez zmeny {unchanged, number}}}} other "
      & "{{unchanged, plural, =0 {{field_name}: pridané {added, number}, "
      & "odstránené {removed, number}} other {{field_name}: pridané {added, "
      & "number}, odstránené {removed, number}, bez zmeny {unchanged, "
      & "number}}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {žiadne konflikty} one {1 konflikt} few {{count, "
      & "number} konflikty} many {{count, number} konfliktu} other {{count, "
      & "number} konfliktov}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name}: posunuté neskôr, z "
      & "{old_label} na {new_label}} other {{field_name}: posunuté skôr, z "
      & "{old_label} na {new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name}: zmenené z {old_label} na {new_label}");
   P ("label.changes.field_change_label", "{field_name}: zmenené z {old_value} na {new_value}");
   P ("label.changes.item_change_label",
      "{name}: {kind, select, added_change {pridané} removed_change "
      & "{odstránené} modified_change {zmenené} renamed_change "
      & "{premenované} unchanged_change {bez zmeny} metadata_change {zmenené "
      & "metadáta} moved_change {presunuté} conflict_change {konflikt} other "
      & "{neznáma zmena}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {zmenené iba metadáta} one {zmenené iba 1 pole "
      & "metadát} few {zmenené iba {count, number} polia metadát} many "
      & "{zmenené iba {count, number} poľa metadát} other {zmenených iba "
      & "{count, number} polí metadát}}");
   P ("label.changes.move_label", "{name}: presunuté z {from} do {to}");
   P ("label.changes.no_changes_label", "žiadne zmeny");
   P ("label.changes.patch_size_label",
      "{lines_added, plural, =0 {{lines_removed, plural, =0 {žiadne zmeny "
      & "riadkov} one {odstránený 1 riadok} few {odstránené {lines_removed, "
      & "number} riadky} many {odstránené {lines_removed, number} riadka} "
      & "other {odstránených {lines_removed, number} riadkov}}} one {pridaný "
      & "1 riadok{lines_removed, plural, =0 {} one {, odstránený 1 riadok} "
      & "few {, odstránené {lines_removed, number} riadky} many {, "
      & "odstránené {lines_removed, number} riadka} other {, odstránených "
      & "{lines_removed, number} riadkov}}} few {pridané {lines_added, number} "
      & "riadky{lines_removed, plural, =0 {} one {, odstránený 1 riadok} few "
      & "{, odstránené {lines_removed, number} riadky} many {, odstránené "
      & "{lines_removed, number} riadka} other {, odstránených "
      & "{lines_removed, number} riadkov}}} many {pridané {lines_added, "
      & "number} riadka{lines_removed, plural, =0 {} one {, odstránený 1 "
      & "riadok} few {, odstránené {lines_removed, number} riadky} many {, "
      & "odstránené {lines_removed, number} riadka} other {, odstránených "
      & "{lines_removed, number} riadkov}}} other {pridaných {lines_added, "
      & "number} riadkov{lines_removed, plural, =0 {} one {, odstránený 1 "
      & "riadok} few {, odstránené {lines_removed, number} riadky} many {, "
      & "odstránené {lines_removed, number} riadka} other {, odstránených "
      & "{lines_removed, number} riadkov}}}}");
   P ("label.changes.rename_label", "premenované z {old_name} na {new_name}");
   P ("label.comments.author_action_label",
      "{author} – {state, select, draft_comment {koncept komentára} "
      & "published_comment {nový komentár} edited_comment {úprava "
      & "komentára} deleted_comment {odstránenie komentára} resolved_comment "
      & "{vyriešenie komentára} unresolved_comment {opätovné otvorenie "
      & "komentára} pinned_comment {pripnutie komentára} other {skrytie "
      & "komentára}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {žiadne komentáre} one {1 komentár} few {{count, "
      & "number} komentáre} many {{count, number} komentára} other {{count, "
      & "number} komentárov}}");
   P ("label.comments.comment_label",
      "{author}: {state, select, draft_comment {koncept komentára} "
      & "published_comment {publikovaný komentár} edited_comment {upravený "
      & "komentár} deleted_comment {odstránený komentár} resolved_comment "
      & "{vyriešený komentár} unresolved_comment {nevyriešený komentár} "
      & "pinned_comment {pripnutý komentár} other {skrytý komentár}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {koncept komentára} published_comment "
      & "{publikovaný komentár} edited_comment {upravený komentár} "
      & "deleted_comment {odstránený komentár} resolved_comment {vyriešený "
      & "komentár} unresolved_comment {nevyriešený komentár} pinned_comment "
      & "{pripnutý komentár} other {skrytý komentár}}");
   P ("label.comments.deleted_label", "komentár odstránil používateľ {author}");
   P ("label.comments.edited_label", "upravené {time_text}");
   P ("label.comments.hide_comment_label", "skryť komentár: {reason}");
   P ("label.comments.lock_thread_label", "zamknúť vlákno {name}");
   P ("label.comments.mention_label", "{actor} spomína {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {žiadni účastníci} one {1 účastník} few "
      & "{{count, number} účastníci} many {{count, number} účastníka} "
      & "other {{count, number} účastníkov}}");
   P ("label.comments.pin_label", "pripnúť {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reakcia: páči sa mi} dislike_reaction "
      & "{reakcia: nepáči sa mi} heart_reaction {reakcia: srdce} "
      & "laugh_reaction {reakcia: smiech} confused_reaction {reakcia: "
      & "zmätenie} hooray_reaction {reakcia: hurá} rocket_reaction {reakcia: "
      & "raketa} other {reakcia: oči}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {páči sa mi} dislike_reaction {nepáči "
      & "sa mi} heart_reaction {srdce} laugh_reaction {smiech} "
      & "confused_reaction {zmätenie} hooray_reaction {hurá} rocket_reaction "
      & "{rakety} other {oči}}: {count, number}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {žiadne odpovede} one {1 odpoveď} few {{count, "
      & "number} odpovede} many {{count, number} odpovede} other {{count, "
      & "number} odpovedí}}");
   P ("label.comments.resolved_label", "{name}: vyriešené");
   P ("label.comments.subscribe_label", "odoberať {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {žiadne vlákna} one {1 vlákno} few {{count, "
      & "number} vlákna} many {{count, number} vlákna} other {{count, number} "
      & "vlákien}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {otvorené vlákno} "
      & "resolved_thread {vyriešené vlákno} locked_thread {zamknuté "
      & "vlákno} other {archivované vlákno}}{count, plural, =0 {} one {, 1 "
      & "komentár} few {, {count, number} komentáre} many {, {count, number} "
      & "komentára} other {, {count, number} komentárov}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {otvorené vlákno} resolved_thread "
      & "{vyriešené vlákno} locked_thread {zamknuté vlákno} other "
      & "{archivované vlákno}}");
   P ("label.comments.unpin_label", "odopnúť {name}");
   P ("label.comments.unsubscribe_label", "zrušiť odber {name}");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {zlepšenie} regressed {zhoršenie} "
      & "unchanged {bez zmeny} within_tolerance {v rámci tolerancie} "
      & "outside_tolerance {mimo tolerancie} new_value {nová hodnota} "
      & "removed_value {odstránené} other {referenčná hodnota nie je k "
      & "dispozícii}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {zlepšenie} regressed {zhoršenie} "
      & "unchanged {bez zmeny} within_tolerance {v rámci tolerancie} "
      & "outside_tolerance {mimo tolerancie} new_value {nová hodnota} "
      & "removed_value {odstránené} other {referenčná hodnota nie je k "
      & "dispozícii}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {zlepšenie o {difference_text}} "
      & "regressed {zhoršenie o {difference_text}} unchanged {bez zmeny "
      & "({difference_text})} within_tolerance {v rámci tolerancie "
      & "({difference_text})} outside_tolerance {mimo tolerancie "
      & "({difference_text})} new_value {nová hodnota ({difference_text})} "
      & "removed_value {odstránené ({difference_text})} other {referenčná "
      & "hodnota nie je k dispozícii ({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {zlepšenie o {difference_text}} "
      & "regressed {zhoršenie o {difference_text}} unchanged {bez zmeny "
      & "({difference_text})} within_tolerance {v rámci tolerancie "
      & "({difference_text})} outside_tolerance {mimo tolerancie "
      & "({difference_text})} new_value {nová hodnota ({difference_text})} "
      & "removed_value {odstránené ({difference_text})} other {referenčná "
      & "hodnota nie je k dispozícii ({difference_text})}}, tolerancia "
      & "{tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {neplatný riadok} duplicate_record "
      & "{duplicitný záznam} missing_column {chýbajúci stĺpec} "
      & "unknown_field {neznáme pole} schema_mismatch {nezhoda schémy} other "
      & "{preskočený záznam}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {skúšobný import úspešný} "
      & "dry_run_failed {skúšobný import zlyhal} import_valid {import "
      & "platný} import_invalid {import neplatný} other {čiastočný "
      & "import}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {skúšobný import úspešný} "
      & "dry_run_failed {skúšobný import zlyhal} import_valid {import "
      & "platný} import_invalid {import neplatný} other {čiastočný "
      & "import}}, prijaté {accepted, number}, odmietnuté {rejected, number}");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {neplatné riadky} duplicate_record "
      & "{duplicitné záznamy} missing_column {chýbajúce stĺpce} "
      & "unknown_field {neznáme polia} schema_mismatch {nezhody schémy} other "
      & "{preskočené záznamy}}: {count, number}");
   P ("label.data_quality.row_issue_label",
      "riadok {row, number}: {issue, select, invalid_row {neplatný riadok} "
      & "duplicate_record {duplicitný záznam} missing_column {chýbajúci "
      & "stĺpec} unknown_field {neznáme pole} schema_mismatch {nezhoda "
      & "schémy} other {preskočený záznam}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {neplatný riadok} "
      & "duplicate_record {duplicitný záznam} missing_column {chýbajúci "
      & "stĺpec} unknown_field {neznáme pole} schema_mismatch {nezhoda "
      & "schémy} other {preskočený záznam}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefakt pripravený} "
      & "artifact_uploaded {artefakt nahraný} artifact_signed {artefakt "
      & "podpísaný} artifact_missing {artefakt chýba} other {platnosť "
      & "artefaktu vypršala}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {nasadenie {name} do {environment}: "
      & "vo fronte} deploying {nasadenie {name} do {environment}: prebieha} "
      & "deployed {nasadenie {name} do {environment}: dokončené} "
      & "failed_deployment {nasadenie {name} do {environment}: zlyhalo} "
      & "rolled_back {nasadenie {name} do {environment}: vrátené späť} "
      & "blocked_deployment {nasadenie {name} do {environment}: zablokované} "
      & "other {nasadenie {name} do {environment}: zrušené}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {nasadenie vo fronte} deploying "
      & "{nasadzovanie} deployed {nasadené} failed_deployment {nasadenie "
      & "zlyhalo} rolled_back {vrátené späť} blocked_deployment {nasadenie "
      & "zablokované} other {nasadenie zrušené}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {prostredie v poriadku} "
      & "drifting_environment {odchýlka prostredia} locked_environment "
      & "{prostredie uzamknuté} maintenance_environment {prostredie v "
      & "údržbe} other {neznámy stav prostredia}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {bez migrácie} migration_pending "
      & "{migrácia čaká} migrating {prebieha migrácia} migration_complete "
      & "{migrácia dokončená} other {migrácia zlyhala}}");
   P ("label.deployments.promotion_label", "povýšenie {name} z {from_environment} do {to_environment}");
   P ("label.deployments.rollback_label", "vrátenie {name} na {target}");
   P ("label.deployments.rollout_label", "postupné nasadenie {name}: {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {žiadne dotknuté položky} one {{count, number} "
      & "dotknutá položka} few {{count, number} dotknuté položky} many "
      & "{{count, number} dotknutej položky} other {{count, number} "
      & "dotknutých položiek}}");
   P ("label.diagnostics.check_duration_label",
      "{status, select, passed_check {{name}: prešlo ({duration_s, number} "
      & "s)} failed_check {{name}: zlyhalo ({duration_s, number} s)} "
      & "warning_check {{name}: s upozorneniami ({duration_s, number} s)} "
      & "skipped_check {{name}: preskočené ({duration_s, number} s)} "
      & "pending_check {{name}: čaká ({duration_s, number} s)} other {{name}: "
      & "prebieha ({duration_s, number} s)}}");
   P ("label.diagnostics.check_result_label",
      "{status, select, passed_check {{name}: prešlo} failed_check {{name}: "
      & "zlyhalo} warning_check {{name}: s upozorneniami} skipped_check "
      & "{{name}: preskočené} pending_check {{name}: čaká} other {{name}: "
      & "prebieha}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {prešlo} failed_check {zlyhalo} "
      & "warning_check {s upozorneniami} skipped_check {preskočené} "
      & "pending_check {čaká} other {prebieha}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{kind, select, expected_value {očakávaná "
      & "hodnota pre {subject}; použite: {suggestion}} expected_unit "
      & "{očakávaná jednotka pre {subject}; použite: {suggestion}} "
      & "invalid_range {neplatný rozsah pre {subject}; použite: {suggestion}} "
      & "end_before_start {koniec rozsahu je pred začiatkom pre {subject}; "
      & "použite: {suggestion}} unknown_field {neznáme pole pre {subject}; "
      & "použite: {suggestion}} unsafe_redacted_value {nebezpečná hodnota "
      & "pre {subject} bola skrytá; použite: {suggestion}} unsupported_syntax "
      & "{nepodporovaná syntax pre {subject}; použite: {suggestion}} other "
      & "{vysvetlenie diagnostiky pre {subject}; použite: {suggestion}}}} "
      & "other {{kind, select, expected_value {očakávaná hodnota pre "
      & "{subject} na pozícii {position, number}; použite: {suggestion}} "
      & "expected_unit {očakávaná jednotka pre {subject} na pozícii "
      & "{position, number}; použite: {suggestion}} invalid_range {neplatný "
      & "rozsah pre {subject} na pozícii {position, number}; použite: "
      & "{suggestion}} end_before_start {koniec rozsahu je pred začiatkom pre "
      & "{subject} na pozícii {position, number}; použite: {suggestion}} "
      & "unknown_field {neznáme pole pre {subject} na pozícii {position, "
      & "number}; použite: {suggestion}} unsafe_redacted_value {nebezpečná "
      & "hodnota pre {subject} bola skrytá na pozícii {position, number}; "
      & "použite: {suggestion}} unsupported_syntax {nepodporovaná syntax pre "
      & "{subject} na pozícii {position, number}; použite: {suggestion}} "
      & "other {vysvetlenie diagnostiky pre {subject} na pozícii {position, "
      & "number}; použite: {suggestion}}}}}");
   P ("label.diagnostics.diagnostic_label",
      "{line, plural, =0 {{severity, select, info_severity {informácia v "
      & "{path}: {message}} notice_severity {oznámenie v {path}: {message}} "
      & "warning_severity {upozornenie v {path}: {message}} error_severity "
      & "{chyba v {path}: {message}} critical_severity {kritická chyba v "
      & "{path}: {message}} other {blokujúca chyba v {path}: {message}}}} "
      & "other {{severity, select, info_severity {informácia v {path}, riadok "
      & "{line, number}: {message}} notice_severity {oznámenie v {path}, "
      & "riadok {line, number}: {message}} warning_severity {upozornenie v "
      & "{path}, riadok {line, number}: {message}} error_severity {chyba v "
      & "{path}, riadok {line, number}: {message}} critical_severity {kritická "
      & "chyba v {path}, riadok {line, number}: {message}} other {blokujúca "
      & "chyba v {path}, riadok {line, number}: {message}}}}}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {zlyhanie v {path}} other {{column, plural, =0 "
      & "{zlyhanie v {path}, riadok {line, number}} other {zlyhanie v {path}, "
      & "riadok {line, number}, stĺpec {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {informácia v poli {field_name}: "
      & "{message}} notice_severity {oznámenie v poli {field_name}: {message}} "
      & "warning_severity {upozornenie v poli {field_name}: {message}} "
      & "error_severity {chyba v poli {field_name}: {message}} "
      & "critical_severity {kritická chyba v poli {field_name}: {message}} "
      & "other {blokujúca chyba v poli {field_name}: {message}}}");
   P ("label.diagnostics.first_failure_label",
      "{line, plural, =0 {prvé zlyhanie: {check_name}, {path}} other {prvé "
      & "zlyhanie: {check_name}, {path}, riadok {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, =0 "
      & "{žiadne problémy} other {{errors, plural, one {{errors, number} "
      & "chyba} few {{errors, number} chyby} many {{errors, number} chyby} "
      & "other {{errors, number} chýb}}}}} other {{errors, plural, =0 "
      & "{{notices, plural, one {{notices, number} oznámenie} few {{notices, "
      & "number} oznámenia} many {{notices, number} oznámenia} other "
      & "{{notices, number} oznámení}}} other {{errors, plural, one {{errors, "
      & "number} chyba} few {{errors, number} chyby} many {{errors, number} "
      & "chyby} other {{errors, number} chýb}}, {notices, plural, one "
      & "{{notices, number} oznámenie} few {{notices, number} oznámenia} many "
      & "{{notices, number} oznámenia} other {{notices, number} "
      & "oznámení}}}}}}} other {{notices, plural, =0 {{errors, plural, =0 "
      & "{{warnings, plural, one {{warnings, number} upozornenie} few "
      & "{{warnings, number} upozornenia} many {{warnings, number} upozornenia} "
      & "other {{warnings, number} upozornení}}} other {{errors, plural, one "
      & "{{errors, number} chyba} few {{errors, number} chyby} many {{errors, "
      & "number} chyby} other {{errors, number} chýb}}, {warnings, plural, one "
      & "{{warnings, number} upozornenie} few {{warnings, number} upozornenia} "
      & "many {{warnings, number} upozornenia} other {{warnings, number} "
      & "upozornení}}}}} other {{errors, plural, =0 {{warnings, plural, one "
      & "{{warnings, number} upozornenie} few {{warnings, number} upozornenia} "
      & "many {{warnings, number} upozornenia} other {{warnings, number} "
      & "upozornení}}, {notices, plural, one {{notices, number} oznámenie} "
      & "few {{notices, number} oznámenia} many {{notices, number} oznámenia} "
      & "other {{notices, number} oznámení}}} other {{errors, plural, one "
      & "{{errors, number} chyba} few {{errors, number} chyby} many {{errors, "
      & "number} chyby} other {{errors, number} chýb}}, {warnings, plural, one "
      & "{{warnings, number} upozornenie} few {{warnings, number} upozornenia} "
      & "many {{warnings, number} upozornenia} other {{warnings, number} "
      & "upozornení}}, {notices, plural, one {{notices, number} oznámenie} "
      & "few {{notices, number} oznámenia} many {{notices, number} oznámenia} "
      & "other {{notices, number} oznámení}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, riadok "
      & "{line, number}} other {{path}, riadok {line, number}, stĺpec {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{position, plural, =0 {{family, select, byte_parser {nepodporovaná "
      & "syntax (parser bajtov): {error}; použite: B, kB, MB, GB, KiB, MiB, "
      & "GiB alebo TiB} duration_parser {nepodporovaná syntax (parser "
      & "trvania): {error}; použite: ms, s, min, h, d, w, month alebo year} "
      & "date_time_parser {nepodporovaná syntax (parser dátumu a času): "
      & "{error}; použite: dátum ISO, prirodzený deň alebo čas} "
      & "color_parser {nepodporovaná syntax (parser farieb): {error}; "
      & "použite: hex, rgb(), hsl(), lab(), lch() alebo názov farby} "
      & "url_parser {nepodporovaná syntax (parser URL): {error}; použite: "
      & "schéma, hostiteľ, cesta, dopyt alebo fragment} unit_parser "
      & "{nepodporovaná syntax (parser jednotiek): {error}; použite: "
      & "podporované označenie jednotky Humanize} recurrence_parser "
      & "{nepodporovaná syntax (parser opakovania): {error}; použite: cron "
      & "alebo tvar opakovania every/weekday} domain_label_parser "
      & "{nepodporovaná syntax (parser doménových označení): {error}; "
      & "použite: deterministické doménové označenie Humanize} other "
      & "{nepodporovaná syntax (parser): {error}; použite: podporovaný tvar "
      & "vstupu}}} other {{family, select, byte_parser {nepodporovaná syntax "
      & "(parser bajtov) na pozícii {position, number}: {error}; použite: B, "
      & "kB, MB, GB, KiB, MiB, GiB alebo TiB} duration_parser {nepodporovaná "
      & "syntax (parser trvania) na pozícii {position, number}: {error}; "
      & "použite: ms, s, min, h, d, w, month alebo year} date_time_parser "
      & "{nepodporovaná syntax (parser dátumu a času) na pozícii {position, "
      & "number}: {error}; použite: dátum ISO, prirodzený deň alebo čas} "
      & "color_parser {nepodporovaná syntax (parser farieb) na pozícii "
      & "{position, number}: {error}; použite: hex, rgb(), hsl(), lab(), lch() "
      & "alebo názov farby} url_parser {nepodporovaná syntax (parser URL) na "
      & "pozícii {position, number}: {error}; použite: schéma, hostiteľ, "
      & "cesta, dopyt alebo fragment} unit_parser {nepodporovaná syntax "
      & "(parser jednotiek) na pozícii {position, number}: {error}; použite: "
      & "podporované označenie jednotky Humanize} recurrence_parser "
      & "{nepodporovaná syntax (parser opakovania) na pozícii {position, "
      & "number}: {error}; použite: cron alebo tvar opakovania every/weekday} "
      & "domain_label_parser {nepodporovaná syntax (parser doménových "
      & "označení) na pozícii {position, number}: {error}; použite: "
      & "deterministické doménové označenie Humanize} other {nepodporovaná "
      & "syntax (parser) na pozícii {position, number}: {error}; použite: "
      & "podporovaný tvar vstupu}}}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {prešlo, {notices, plural, =0 {bez "
      & "oznámení} one {{notices, number} oznámenie} few {{notices, number} "
      & "oznámenia} many {{notices, number} oznámenia} other {{notices, "
      & "number} oznámení}}} failed_check {zlyhalo, {notices, plural, =0 {bez "
      & "oznámení} one {{notices, number} oznámenie} few {{notices, number} "
      & "oznámenia} many {{notices, number} oznámenia} other {{notices, "
      & "number} oznámení}}} warning_check {s upozorneniami, {notices, "
      & "plural, =0 {bez oznámení} one {{notices, number} oznámenie} few "
      & "{{notices, number} oznámenia} many {{notices, number} oznámenia} "
      & "other {{notices, number} oznámení}}} skipped_check {preskočené, "
      & "{notices, plural, =0 {bez oznámení} one {{notices, number} "
      & "oznámenie} few {{notices, number} oznámenia} many {{notices, number} "
      & "oznámenia} other {{notices, number} oznámení}}} pending_check "
      & "{čaká, {notices, plural, =0 {bez oznámení} one {{notices, number} "
      & "oznámenie} few {{notices, number} oznámenia} many {{notices, number} "
      & "oznámenia} other {{notices, number} oznámení}}} other {prebieha, "
      & "{notices, plural, =0 {bez oznámení} one {{notices, number} "
      & "oznámenie} few {{notices, number} oznámenia} many {{notices, number} "
      & "oznámenia} other {{notices, number} oznámení}}}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {opakovanie 1 z 1} other "
      & "{opakovanie {attempt, number} z 1 – limit prekročený}}} other "
      & "{opakovanie {attempt, number} z {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {informácia} notice_severity "
      & "{oznámenie} warning_severity {upozornenie} error_severity {chyba} "
      & "critical_severity {kritická chyba} other {blokujúca chyba}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {diagnostika zostavenia} test_source "
      & "{diagnostika testov} lint_source {diagnostika lintera} import_source "
      & "{diagnostika importu} validation_source {diagnostika validácie} "
      & "runtime_source {diagnostika behu} security_source {diagnostika "
      & "zabezpečenia} other {diagnostika}}");
   P ("label.diagnostics.source_summary_label",
      "{source, select, build_source {diagnostika zostavenia} test_source "
      & "{diagnostika testov} lint_source {diagnostika lintera} import_source "
      & "{diagnostika importu} validation_source {diagnostika validácie} "
      & "runtime_source {diagnostika behu} security_source {diagnostika "
      & "zabezpečenia} other {diagnostika}}: {count, plural, one {{count, "
      & "number} hlásenie} few {{count, number} hlásenia} many {{count, "
      & "number} hlásenia} other {{count, number} hlásení}}");
   P ("label.diagnostics.suggested_action_label", "ďalší krok: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {doména} ipv4_host {adresa IPv4} ipv6_host "
      & "{adresa IPv6} localhost_host {lokálny hostiteľ} private_network_host "
      & "{adresa súkromnej siete} other {neznámy hostiteľ}}");
   P ("label.events.all_day_label", "{name}: celodenná udalosť");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {bez odpovede} accepted {prijaté} "
      & "declined {odmietnuté} maybe {možno} other {na čakacej listine}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {žiadni účastníci} one {{count, number} "
      & "účastník} few {{count, number} účastníci} many {{count, number} "
      & "účastníka} other {{count, number} účastníkov}}");
   P ("label.events.canceled_label", "{name}: zrušené");
   P ("label.events.check_in_label", "check-in: {name}");
   P ("label.events.conference_link_label", "{name}: odkaz na konferenciu");
   P ("label.events.event_count_label",
      "{count, plural, =0 {žiadne udalosti} one {{count, number} udalosť} "
      & "few {{count, number} udalosti} many {{count, number} udalosti} other "
      & "{{count, number} udalostí}}");
   P ("label.events.event_label",
      "{state, select, scheduled_event {{name}: naplánované} "
      & "tentative_event {{name}: predbežné} in_progress_event {{name}: "
      & "prebieha} completed_event {{name}: dokončené} canceled_event "
      & "{{name}: zrušené} other {{name}: odložené}}");
   P ("label.events.event_location_label", "{name}, miesto: {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {naplánovaná udalosť} "
      & "tentative_event {predbežná udalosť} in_progress_event "
      & "{prebiehajúca udalosť} completed_event {dokončená udalosť} "
      & "canceled_event {zrušená udalosť} other {odložená udalosť}}");
   P ("label.events.event_time_label", "{name}, čas: {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {verejná udalosť} private_event "
      & "{súkromná udalosť} busy_event {čas obsadený} other {čas "
      & "voľný}}");
   P ("label.events.organizer_label", "organizátor: {name}");
   P ("label.events.rsvp_label",
      "{state, select, not_responded {účasť: nepotvrdená} accepted "
      & "{účasť: prijatá} declined {účasť: odmietnutá} maybe {účasť: "
      & "možno} other {účasť: čakacia listina}}");
   P ("label.events.reminder_label", "pripomienka: {time_text}");
   P ("label.events.rescheduled_label", "{name}: presunuté na {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {{used, number} znak} few {{used, number} znaky} "
      & "many {{used, number} znaku} other {{used, number} znakov}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {bez obmedzenia počtu znakov} one {max. {limit, "
      & "number} znak} few {max. {limit, number} znaky} many {max. {limit, "
      & "number} znaku} other {max. {limit, number} znakov}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {{used, number} znak} few "
      & "{{used, number} znaky} many {{used, number} znaku} other {{used, "
      & "number} znakov}}} other {{used, number} z {limit, plural, one {{limit, "
      & "number} znaku} few {{limit, number} znakov} many {{limit, number} "
      & "znaku} other {{limit, number} znakov}}}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}: voliteľné pole} other {{name}: "
      & "povinné pole}}");
   P ("label.forms.field_state_label",
      "{state, select, valid_input {{name}: platná hodnota} invalid_input "
      & "{{name}: neplatná hodnota} required_input {{name}: povinné pole} "
      & "optional_input {{name}: voliteľné pole} disabled_input {{name}: pole "
      & "zakázané} other {{name}: iba na čítanie}}");
   P ("label.forms.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {žiadne problémy vo "
      & "formulári} other {{errors, plural, one {{errors, number} chyba} few "
      & "{{errors, number} chyby} many {{errors, number} chyby} other {{errors, "
      & "number} chýb}}}}} other {{errors, plural, =0 {{warnings, plural, one "
      & "{{warnings, number} upozornenie} few {{warnings, number} upozornenia} "
      & "many {{warnings, number} upozornenia} other {{warnings, number} "
      & "upozornení}}} other {{errors, plural, one {{errors, number} chyba} "
      & "few {{errors, number} chyby} many {{errors, number} chyby} other "
      & "{{errors, number} chýb}}, {warnings, plural, one {{warnings, number} "
      & "upozornenie} few {{warnings, number} upozornenia} many {{warnings, "
      & "number} upozornenia} other {{warnings, number} upozornení}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {nezačaté} editing_form {úpravy} "
      & "dirty_form {neuložené zmeny} saving_form {ukladanie} saved_form "
      & "{uložené} submitted_form {odoslané} other {odoslanie zlyhalo}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {platný vstup} invalid_input {neplatný "
      & "vstup} required_input {povinný vstup} optional_input {voliteľný "
      & "vstup} disabled_input {zakázaný vstup} other {vstup iba na "
      & "čítanie}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {nezačaté} editing_form {úpravy} "
      & "dirty_form {neuložené zmeny} saving_form {ukladanie formulára} "
      & "saved_form {formulár uložený} submitted_form {formulár odoslaný} "
      & "other {{errors, plural, =0 {odoslanie zlyhalo} one {odoslanie zlyhalo: "
      & "{errors, number} chyba} few {odoslanie zlyhalo: {errors, number} "
      & "chyby} many {odoslanie zlyhalo: {errors, number} chyby} other "
      & "{odoslanie zlyhalo: {errors, number} chýb}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {žiadne neuložené zmeny} one {{count, number} "
      & "neuložená zmena} few {{count, number} neuložené zmeny} many "
      & "{{count, number} neuloženej zmeny} other {{count, number} "
      & "neuložených zmien}}");
   P ("label.markup.accessibility_issue_label",
      "{issue, select, missing_accessible_name {{target}: chýba prístupný "
      & "názov} low_contrast {{target}: nízky kontrast} skipped_heading_level "
      & "{{target}: preskočená úroveň nadpisu} missing_form_label "
      & "{{target}: chýba označenie poľa formulára} invalid_aria {{target}: "
      & "neplatné ARIA} keyboard_trap {{target}: pasca klávesnice} other "
      & "{{target}: neznámy problém prístupnosti}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title} – súhrn prístupnosti: {landmarks, plural, one {{landmarks, "
      & "number} orientačný bod} few {{landmarks, number} orientačné body} "
      & "many {{landmarks, number} orientačného bodu} other {{landmarks, "
      & "number} orientačných bodov}}, {headings, plural, one {{headings, "
      & "number} nadpis} few {{headings, number} nadpisy} many {{headings, "
      & "number} nadpisu} other {{headings, number} nadpisov}}, {issues, "
      & "plural, one {{issues, number} problém} few {{issues, number} "
      & "problémy} many {{issues, number} problému} other {{issues, number} "
      & "problémov}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {pridajte prístupný názov} "
      & "low_contrast {zvýšte kontrast textu} skipped_heading_level "
      & "{používajte úrovne nadpisov postupne} missing_form_label {priraďte "
      & "k ovládaciemu prvku formulára označenie} invalid_aria {použite "
      & "platnú rolu alebo atribút ARIA} keyboard_trap {zabezpečte, aby "
      & "fokus klávesnice mohol komponent opustiť} other {skontrolujte "
      & "problém prístupnosti}}");
end Labels_1;
