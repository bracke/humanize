separate (Humanize.Catalogs.Phrase_Data.Locale_Cs)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{name}: {state, select, active_account {aktivní účet} "
      & "invited_account {pozvaný účet} locked_account {uzamčený účet} "
      & "suspended_account {pozastavený účet} deleted_account {smazaný "
      & "účet} other {neznámý stav účtu}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {aktivní účet} invited_account "
      & "{pozvaný účet} locked_account {uzamčený účet} suspended_account "
      & "{pozastavený účet} deleted_account {smazaný účet} other "
      & "{neznámý stav účtu}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {důvěryhodné zařízení} "
      & "untrusted_device {nedůvěryhodné zařízení} new_device {nové "
      & "zařízení} other {blokované zařízení}}");
   P ("label.accounts.last_active_label", "{name}: naposledy aktivní {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: přihlášení se nezdařilo} other "
      & "{{name}: přihlášení úspěšné}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA zapnuto} mfa_disabled {MFA vypnuto} "
      & "mfa_required {MFA vyžadováno} other {vyžadován reset MFA}}");
   P ("label.accounts.session_label",
      "{name}: {state, select, active_session {aktivní relace} "
      & "expired_session {relace vypršela} revoked_session {relace odvolána} "
      & "idle_session {nečinná relace} other {neznámý stav relace}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {aktivní relace} expired_session "
      & "{relace vypršela} revoked_session {relace odvolána} idle_session "
      & "{nečinná relace} other {neznámý stav relace}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {žádné přílohy} one {1 příloha} few {{count, "
      & "number} přílohy} many {{count, number} přílohy} other {{count, "
      & "number} příloh}}");
   P ("label.attachments.attachment_group_label",
      "{name}: {count, plural, =0 {žádné přílohy} one {1 příloha} few "
      & "{{count, number} přílohy} many {{count, number} přílohy} other "
      & "{{count, number} příloh}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {přiložený soubor} image_attachment "
      & "{přiložený obrázek} video_attachment {přiložené video} "
      & "audio_attachment {přiložený zvuk} document_attachment {přiložený "
      & "dokument} archive_attachment {přiložený archiv} other {přiložený "
      & "odkaz}}");
   P ("label.attachments.attachment_label",
      "{name} ({kind, select, file_attachment {soubor} image_attachment "
      & "{obrázek} video_attachment {video} audio_attachment {zvuk} "
      & "document_attachment {dokument} archive_attachment {archiv} other "
      & "{odkaz}}): {state, select, pending_attachment {čeká} "
      & "uploading_attachment {nahrávání} uploaded_attachment {nahráno} "
      & "failed_attachment {selhalo} removed_attachment {odebráno} other "
      & "{zablokováno}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {příloha čeká} "
      & "uploading_attachment {nahrávání přílohy} uploaded_attachment "
      & "{příloha nahrána} failed_attachment {chyba přílohy} "
      & "removed_attachment {příloha odebrána} other {příloha "
      & "zablokována}}");
   P ("label.attachments.download_label", "stáhnout {name}");
   P ("label.attachments.expiring_link_label", "{name}: platnost odkazu vyprší {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "náhled {name}");
   P ("label.attachments.remove_label", "odebrat {name}");
   P ("label.attachments.scan_result_label",
      "{name}: {state, select, not_scanned {nekontrolováno} scanning "
      & "{probíhá kontrola} safe {bez hrozeb} suspicious {podezřelý obsah} "
      & "other {zjištěna infekce}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {nekontrolováno} scanning {probíhá "
      & "kontrola} safe {kontrola: bez hrozeb} suspicious {kontrola: "
      & "podezřelý obsah} other {kontrola: zjištěna infekce}}");
   P ("label.attachments.upload_error_label", "{name}: nahrání se nezdařilo – {reason}");
   P ("label.badges.badge_label",
      "{name}: {tone, select, neutral_tone {neutrální odznak} info_tone "
      & "{informační odznak} success_tone {odznak úspěchu} warning_tone "
      & "{varovný odznak} danger_tone {odznak nebezpečí} other {tlumený "
      & "odznak}}{state, select, new_badge {, nový} updated_badge {, "
      & "aktualizovaný} deprecated_badge {, zastaralý} selected_badge {, "
      & "vybraný} disabled_badge {, zakázaný} dismissible_badge {, lze "
      & "zavřít} other {}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {odznak nízké priority} "
      & "medium_priority {odznak střední priority} high_priority {odznak "
      & "vysoké priority} other {odznak kritické priority}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {výchozí odznak} new_badge {nový "
      & "odznak} updated_badge {aktualizovaný odznak} deprecated_badge "
      & "{zastaralý odznak} selected_badge {vybraný odznak} disabled_badge "
      & "{zakázaný odznak} other {zavíratelný odznak}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {neutrální odznak} info_tone "
      & "{informační odznak} success_tone {odznak úspěchu} warning_tone "
      & "{varovný odznak} danger_tone {odznak nebezpečí} other {tlumený "
      & "odznak}}");
   P ("label.badges.chip_label", "{selected, select, false {{name}} other {{name}, vybráno}}");
   P ("label.badges.count_badge_label", "{name}: {count, number}");
   P ("label.badges.deprecated_label", "{name}: zastaralé");
   P ("label.badges.dismiss_label", "zavřít {name}");
   P ("label.badges.new_label", "{name}: novinka");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {žádné skryté odznaky} one {+1 odznak} "
      & "few {+{hidden_count, number} odznaky} many {+{hidden_count, number} "
      & "odznaku} other {+{hidden_count, number} odznaků}}");
   P ("label.badges.priority_badge_label",
      "{name}: {priority, select, low_priority {nízká priorita} "
      & "medium_priority {střední priorita} high_priority {vysoká priorita} "
      & "other {kritická priorita}}");
   P ("label.badges.status_badge_label",
      "{name} – stav: {tone, select, neutral_tone {neutrální} info_tone "
      & "{informace} success_tone {úspěch} warning_tone {varování} "
      & "danger_tone {nebezpečí} other {tlumený}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {žádné štítky} one {1 štítek} few {{count, "
      & "number} štítky} many {{count, number} štítku} other {{count, "
      & "number} štítků}}");
   P ("label.badges.tag_label", "štítek {name}");
   P ("label.badges.updated_label", "{name}: aktualizováno");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefakt nahrán} artifact_missing "
      & "{artefakt chybí} artifact_expired {platnost artefaktu vypršela} "
      & "other {artefakt ověřen}}");
   P ("label.builds.benchmark_label", "benchmark {name}: {result_text}");
   P ("label.builds.build_label",
      "{name}: {state, select, build_queued {sestavení ve frontě} "
      & "build_running {sestavení probíhá} build_passed {sestavení "
      & "úspěšné} build_failed {sestavení selhalo} snapshot_build "
      & "{snapshot sestavení} other {sestavení vydání}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {sestavení ve frontě} build_running "
      & "{sestavení probíhá} build_passed {sestavení úspěšné} "
      & "build_failed {sestavení selhalo} snapshot_build {snapshot sestavení} "
      & "other {sestavení vydání}}");
   P ("label.builds.coverage_label", "pokrytí: {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {brána vydání prošla} gate_failed "
      & "{brána vydání neprošla} gate_warning {brána vydání: varování} "
      & "other {brána vydání zablokována}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {žádné úspěšné "
      & "testy} other {úspěšné testy: {count, number}}}} failed_test "
      & "{{count, plural, =0 {žádné neúspěšné testy} other "
      & "{neúspěšné testy: {count, number}}}} skipped_test {{count, plural, "
      & "=0 {žádné přeskočené testy} other {přeskočené testy: {count, "
      & "number}}}} flaky_test {{count, plural, =0 {žádné nestabilní testy} "
      & "other {nestabilní testy: {count, number}}}} other {{count, plural, =0 "
      & "{žádné testy s očekávaným selháním} other {testy s "
      & "očekávaným selháním: {count, number}}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {úspěšný} failed_test {neúspěšný} "
      & "skipped_test {přeskočený} flaky_test {nestabilní} other "
      & "{očekávané selhání}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name}: "
      & "beze změny (vypnuto)} other {{field_name}: zapnuto}}} other "
      & "{{new_value, select, false {{field_name}: vypnuto} other "
      & "{{field_name}: beze změny (zapnuto)}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {přidáno} removed_change {odebráno} "
      & "modified_change {změněno} renamed_change {přejmenováno} "
      & "unchanged_change {beze změny} metadata_change {změněna metadata} "
      & "moved_change {přesunuto} conflict_change {konflikt} other {neznámá "
      & "změna}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {informativní změna} "
      & "minor_change {drobná změna} major_change {zásadní změna} other "
      & "{nekompatibilní změna}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}: beze změny} "
      & "other {{unchanged, plural, =0 {{field_name}: přidáno {added, "
      & "number}} other {{field_name}: přidáno {added, number}, beze změny "
      & "{unchanged, number}}}}}} other {{added, plural, =0 {{unchanged, "
      & "plural, =0 {{field_name}: odebráno {removed, number}} other "
      & "{{field_name}: odebráno {removed, number}, beze změny {unchanged, "
      & "number}}}} other {{unchanged, plural, =0 {{field_name}: přidáno "
      & "{added, number}, odebráno {removed, number}} other {{field_name}: "
      & "přidáno {added, number}, odebráno {removed, number}, beze změny "
      & "{unchanged, number}}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {žádné konflikty} one {1 konflikt} few {{count, "
      & "number} konflikty} many {{count, number} konfliktu} other {{count, "
      & "number} konfliktů}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name}: posunuto později, z "
      & "{old_label} na {new_label}} other {{field_name}: posunuto dříve, z "
      & "{old_label} na {new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name}: změněno z {old_label} na {new_label}");
   P ("label.changes.field_change_label", "{field_name}: změněno z {old_value} na {new_value}");
   P ("label.changes.item_change_label",
      "{name}: {kind, select, added_change {přidáno} removed_change "
      & "{odebráno} modified_change {změněno} renamed_change "
      & "{přejmenováno} unchanged_change {beze změny} metadata_change "
      & "{změněna metadata} moved_change {přesunuto} conflict_change "
      & "{konflikt} other {neznámá změna}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {změněna pouze metadata} one {změněno pouze 1 "
      & "pole metadat} few {změněna pouze {count, number} pole metadat} many "
      & "{změněno pouze {count, number} pole metadat} other {změněno pouze "
      & "{count, number} polí metadat}}");
   P ("label.changes.move_label", "{name}: přesunuto z {from} do {to}");
   P ("label.changes.no_changes_label", "žádné změny");
   P ("label.changes.patch_size_label",
      "{lines_added, plural, =0 {{lines_removed, plural, =0 {žádné změny "
      & "řádků} one {odebrán 1 řádek} few {odebrány {lines_removed, "
      & "number} řádky} many {odebráno {lines_removed, number} řádku} "
      & "other {odebráno {lines_removed, number} řádků}}} one {přidán 1 "
      & "řádek{lines_removed, plural, =0 {} one {, odebrán 1 řádek} few {, "
      & "odebrány {lines_removed, number} řádky} many {, odebráno "
      & "{lines_removed, number} řádku} other {, odebráno {lines_removed, "
      & "number} řádků}}} few {přidány {lines_added, number} "
      & "řádky{lines_removed, plural, =0 {} one {, odebrán 1 řádek} few {, "
      & "odebrány {lines_removed, number} řádky} many {, odebráno "
      & "{lines_removed, number} řádku} other {, odebráno {lines_removed, "
      & "number} řádků}}} many {přidáno {lines_added, number} "
      & "řádku{lines_removed, plural, =0 {} one {, odebrán 1 řádek} few {, "
      & "odebrány {lines_removed, number} řádky} many {, odebráno "
      & "{lines_removed, number} řádku} other {, odebráno {lines_removed, "
      & "number} řádků}}} other {přidáno {lines_added, number} "
      & "řádků{lines_removed, plural, =0 {} one {, odebrán 1 řádek} few "
      & "{, odebrány {lines_removed, number} řádky} many {, odebráno "
      & "{lines_removed, number} řádku} other {, odebráno {lines_removed, "
      & "number} řádků}}}}");
   P ("label.changes.rename_label", "přejmenováno z {old_name} na {new_name}");
   P ("label.comments.author_action_label",
      "{author} – {state, select, draft_comment {koncept komentáře} "
      & "published_comment {nový komentář} edited_comment {úprava "
      & "komentáře} deleted_comment {smazání komentáře} resolved_comment "
      & "{vyřešení komentáře} unresolved_comment {znovuotevření "
      & "komentáře} pinned_comment {připnutí komentáře} other {skrytí "
      & "komentáře}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {žádné komentáře} one {1 komentář} few "
      & "{{count, number} komentáře} many {{count, number} komentáře} other "
      & "{{count, number} komentářů}}");
   P ("label.comments.comment_label",
      "{author}: {state, select, draft_comment {koncept komentáře} "
      & "published_comment {publikovaný komentář} edited_comment {upravený "
      & "komentář} deleted_comment {smazaný komentář} resolved_comment "
      & "{vyřešený komentář} unresolved_comment {nevyřešený komentář} "
      & "pinned_comment {připnutý komentář} other {skrytý komentář}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {koncept komentáře} published_comment "
      & "{publikovaný komentář} edited_comment {upravený komentář} "
      & "deleted_comment {smazaný komentář} resolved_comment {vyřešený "
      & "komentář} unresolved_comment {nevyřešený komentář} "
      & "pinned_comment {připnutý komentář} other {skrytý komentář}}");
   P ("label.comments.deleted_label", "komentář smazán uživatelem {author}");
   P ("label.comments.edited_label", "upraveno {time_text}");
   P ("label.comments.hide_comment_label", "skrýt komentář: {reason}");
   P ("label.comments.lock_thread_label", "zamknout vlákno {name}");
   P ("label.comments.mention_label", "{actor} zmiňuje {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {žádní účastníci} one {1 účastník} few "
      & "{{count, number} účastníci} many {{count, number} účastníka} "
      & "other {{count, number} účastníků}}");
   P ("label.comments.pin_label", "připnout {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reakce: líbí se} dislike_reaction "
      & "{reakce: nelíbí se} heart_reaction {reakce: srdce} laugh_reaction "
      & "{reakce: smích} confused_reaction {reakce: zmatení} hooray_reaction "
      & "{reakce: hurá} rocket_reaction {reakce: raketa} other {reakce: oči}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {líbí se} dislike_reaction {nelíbí "
      & "se} heart_reaction {srdce} laugh_reaction {smích} confused_reaction "
      & "{zmatení} hooray_reaction {hurá} rocket_reaction {rakety} other "
      & "{oči}}: {count, number}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {žádné odpovědi} one {1 odpověď} few {{count, "
      & "number} odpovědi} many {{count, number} odpovědi} other {{count, "
      & "number} odpovědí}}");
   P ("label.comments.resolved_label", "{name}: vyřešeno");
   P ("label.comments.subscribe_label", "odebírat {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {žádná vlákna} one {1 vlákno} few {{count, "
      & "number} vlákna} many {{count, number} vlákna} other {{count, number} "
      & "vláken}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {otevřené vlákno} "
      & "resolved_thread {vyřešené vlákno} locked_thread {zamčené "
      & "vlákno} other {archivované vlákno}}{count, plural, =0 {} one {, 1 "
      & "komentář} few {, {count, number} komentáře} many {, {count, "
      & "number} komentáře} other {, {count, number} komentářů}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {otevřené vlákno} resolved_thread "
      & "{vyřešené vlákno} locked_thread {zamčené vlákno} other "
      & "{archivované vlákno}}");
   P ("label.comments.unpin_label", "odepnout {name}");
   P ("label.comments.unsubscribe_label", "zrušit odběr {name}");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {zlepšení} regressed {zhoršení} "
      & "unchanged {beze změny} within_tolerance {v toleranci} "
      & "outside_tolerance {mimo toleranci} new_value {nová hodnota} "
      & "removed_value {odebráno} other {výchozí hodnota není k dispozici}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {zlepšení} regressed {zhoršení} "
      & "unchanged {beze změny} within_tolerance {v toleranci} "
      & "outside_tolerance {mimo toleranci} new_value {nová hodnota} "
      & "removed_value {odebráno} other {výchozí hodnota není k dispozici}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {zlepšení o {difference_text}} "
      & "regressed {zhoršení o {difference_text}} unchanged {beze změny "
      & "({difference_text})} within_tolerance {v toleranci "
      & "({difference_text})} outside_tolerance {mimo toleranci "
      & "({difference_text})} new_value {nová hodnota ({difference_text})} "
      & "removed_value {odebráno ({difference_text})} other {výchozí hodnota "
      & "není k dispozici ({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {zlepšení o {difference_text}} "
      & "regressed {zhoršení o {difference_text}} unchanged {beze změny "
      & "({difference_text})} within_tolerance {v toleranci "
      & "({difference_text})} outside_tolerance {mimo toleranci "
      & "({difference_text})} new_value {nová hodnota ({difference_text})} "
      & "removed_value {odebráno ({difference_text})} other {výchozí hodnota "
      & "není k dispozici ({difference_text})}}, tolerance {tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {neplatný řádek} duplicate_record "
      & "{duplicitní záznam} missing_column {chybějící sloupec} "
      & "unknown_field {neznámé pole} schema_mismatch {neshoda schématu} "
      & "other {přeskočený záznam}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {zkušební import úspěšný} "
      & "dry_run_failed {zkušební import selhal} import_valid {import "
      & "platný} import_invalid {import neplatný} other {částečný "
      & "import}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {zkušební import úspěšný} "
      & "dry_run_failed {zkušební import selhal} import_valid {import "
      & "platný} import_invalid {import neplatný} other {částečný "
      & "import}}, přijato {accepted, number}, odmítnuto {rejected, number}");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {neplatné řádky} duplicate_record "
      & "{duplicitní záznamy} missing_column {chybějící sloupce} "
      & "unknown_field {neznámá pole} schema_mismatch {neshody schématu} "
      & "other {přeskočené záznamy}}: {count, number}");
   P ("label.data_quality.row_issue_label",
      "řádek {row, number}: {issue, select, invalid_row {neplatný řádek} "
      & "duplicate_record {duplicitní záznam} missing_column {chybějící "
      & "sloupec} unknown_field {neznámé pole} schema_mismatch {neshoda "
      & "schématu} other {přeskočený záznam}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {neplatný řádek} "
      & "duplicate_record {duplicitní záznam} missing_column {chybějící "
      & "sloupec} unknown_field {neznámé pole} schema_mismatch {neshoda "
      & "schématu} other {přeskočený záznam}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefakt připraven} artifact_uploaded "
      & "{artefakt nahrán} artifact_signed {artefakt podepsán} "
      & "artifact_missing {artefakt chybí} other {platnost artefaktu "
      & "vypršela}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {nasazení {name} do {environment}: "
      & "ve frontě} deploying {nasazení {name} do {environment}: probíhá} "
      & "deployed {nasazení {name} do {environment}: dokončeno} "
      & "failed_deployment {nasazení {name} do {environment}: selhalo} "
      & "rolled_back {nasazení {name} do {environment}: vráceno zpět} "
      & "blocked_deployment {nasazení {name} do {environment}: zablokováno} "
      & "other {nasazení {name} do {environment}: zrušeno}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {nasazení ve frontě} deploying "
      & "{nasazování} deployed {nasazeno} failed_deployment {nasazení "
      & "selhalo} rolled_back {vráceno zpět} blocked_deployment {nasazení "
      & "zablokováno} other {nasazení zrušeno}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {prostředí v pořádku} "
      & "drifting_environment {odchylka prostředí} locked_environment "
      & "{prostředí uzamčeno} maintenance_environment {prostředí v "
      & "údržbě} other {neznámý stav prostředí}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {bez migrace} migration_pending {migrace "
      & "čeká} migrating {probíhá migrace} migration_complete {migrace "
      & "dokončena} other {migrace selhala}}");
   P ("label.deployments.promotion_label", "povýšení {name} z {from_environment} do {to_environment}");
   P ("label.deployments.rollback_label", "vrácení {name} na {target}");
   P ("label.deployments.rollout_label", "postupné nasazení {name}: {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {žádné dotčené položky} one {{count, number} "
      & "dotčená položka} few {{count, number} dotčené položky} many "
      & "{{count, number} dotčené položky} other {{count, number} "
      & "dotčených položek}}");
   P ("label.diagnostics.check_duration_label",
      "{status, select, passed_check {{name}: prošlo ({duration_s, number} "
      & "s)} failed_check {{name}: selhalo ({duration_s, number} s)} "
      & "warning_check {{name}: s varováními ({duration_s, number} s)} "
      & "skipped_check {{name}: přeskočeno ({duration_s, number} s)} "
      & "pending_check {{name}: čeká ({duration_s, number} s)} other {{name}: "
      & "probíhá ({duration_s, number} s)}}");
   P ("label.diagnostics.check_result_label",
      "{status, select, passed_check {{name}: prošlo} failed_check {{name}: "
      & "selhalo} warning_check {{name}: s varováními} skipped_check {{name}: "
      & "přeskočeno} pending_check {{name}: čeká} other {{name}: "
      & "probíhá}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {prošlo} failed_check {selhalo} "
      & "warning_check {s varováními} skipped_check {přeskočeno} "
      & "pending_check {čeká} other {probíhá}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{kind, select, expected_value {očekávána "
      & "hodnota pro {subject}; použijte: {suggestion}} expected_unit "
      & "{očekávána jednotka pro {subject}; použijte: {suggestion}} "
      & "invalid_range {neplatný rozsah pro {subject}; použijte: "
      & "{suggestion}} end_before_start {konec rozsahu je před začátkem pro "
      & "{subject}; použijte: {suggestion}} unknown_field {neznámé pole pro "
      & "{subject}; použijte: {suggestion}} unsafe_redacted_value "
      & "{nebezpečná hodnota pro {subject} byla skryta; použijte: "
      & "{suggestion}} unsupported_syntax {nepodporovaná syntaxe pro "
      & "{subject}; použijte: {suggestion}} other {vysvětlení diagnostiky "
      & "pro {subject}; použijte: {suggestion}}}} other {{kind, select, "
      & "expected_value {očekávána hodnota pro {subject} na pozici "
      & "{position, number}; použijte: {suggestion}} expected_unit "
      & "{očekávána jednotka pro {subject} na pozici {position, number}; "
      & "použijte: {suggestion}} invalid_range {neplatný rozsah pro {subject} "
      & "na pozici {position, number}; použijte: {suggestion}} "
      & "end_before_start {konec rozsahu je před začátkem pro {subject} na "
      & "pozici {position, number}; použijte: {suggestion}} unknown_field "
      & "{neznámé pole pro {subject} na pozici {position, number}; použijte: "
      & "{suggestion}} unsafe_redacted_value {nebezpečná hodnota pro "
      & "{subject} byla skryta na pozici {position, number}; použijte: "
      & "{suggestion}} unsupported_syntax {nepodporovaná syntaxe pro {subject} "
      & "na pozici {position, number}; použijte: {suggestion}} other "
      & "{vysvětlení diagnostiky pro {subject} na pozici {position, number}; "
      & "použijte: {suggestion}}}}}");
   P ("label.diagnostics.diagnostic_label",
      "{line, plural, =0 {{severity, select, info_severity {informace v "
      & "{path}: {message}} notice_severity {upozornění v {path}: {message}} "
      & "warning_severity {varování v {path}: {message}} error_severity "
      & "{chyba v {path}: {message}} critical_severity {kritická chyba v "
      & "{path}: {message}} other {blokující chyba v {path}: {message}}}} "
      & "other {{severity, select, info_severity {informace v {path}, řádek "
      & "{line, number}: {message}} notice_severity {upozornění v {path}, "
      & "řádek {line, number}: {message}} warning_severity {varování v "
      & "{path}, řádek {line, number}: {message}} error_severity {chyba v "
      & "{path}, řádek {line, number}: {message}} critical_severity "
      & "{kritická chyba v {path}, řádek {line, number}: {message}} other "
      & "{blokující chyba v {path}, řádek {line, number}: {message}}}}}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {selhání v {path}} other {{column, plural, =0 "
      & "{selhání v {path}, řádek {line, number}} other {selhání v "
      & "{path}, řádek {line, number}, sloupec {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {informace v poli {field_name}: "
      & "{message}} notice_severity {upozornění v poli {field_name}: "
      & "{message}} warning_severity {varování v poli {field_name}: "
      & "{message}} error_severity {chyba v poli {field_name}: {message}} "
      & "critical_severity {kritická chyba v poli {field_name}: {message}} "
      & "other {blokující chyba v poli {field_name}: {message}}}");
   P ("label.diagnostics.first_failure_label",
      "{line, plural, =0 {první selhání: {check_name}, {path}} other "
      & "{první selhání: {check_name}, {path}, řádek {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, =0 "
      & "{žádné problémy} other {{errors, plural, one {{errors, number} "
      & "chyba} few {{errors, number} chyby} many {{errors, number} chyby} "
      & "other {{errors, number} chyb}}}}} other {{errors, plural, =0 "
      & "{{notices, plural, one {{notices, number} upozornění} few {{notices, "
      & "number} upozornění} many {{notices, number} upozornění} other "
      & "{{notices, number} upozornění}}} other {{errors, plural, one "
      & "{{errors, number} chyba} few {{errors, number} chyby} many {{errors, "
      & "number} chyby} other {{errors, number} chyb}}, {notices, plural, one "
      & "{{notices, number} upozornění} few {{notices, number} upozornění} "
      & "many {{notices, number} upozornění} other {{notices, number} "
      & "upozornění}}}}}}} other {{notices, plural, =0 {{errors, plural, =0 "
      & "{{warnings, plural, one {{warnings, number} varování} few "
      & "{{warnings, number} varování} many {{warnings, number} varování} "
      & "other {{warnings, number} varování}}} other {{errors, plural, one "
      & "{{errors, number} chyba} few {{errors, number} chyby} many {{errors, "
      & "number} chyby} other {{errors, number} chyb}}, {warnings, plural, one "
      & "{{warnings, number} varování} few {{warnings, number} varování} "
      & "many {{warnings, number} varování} other {{warnings, number} "
      & "varování}}}}} other {{errors, plural, =0 {{warnings, plural, one "
      & "{{warnings, number} varování} few {{warnings, number} varování} "
      & "many {{warnings, number} varování} other {{warnings, number} "
      & "varování}}, {notices, plural, one {{notices, number} upozornění} "
      & "few {{notices, number} upozornění} many {{notices, number} "
      & "upozornění} other {{notices, number} upozornění}}} other {{errors, "
      & "plural, one {{errors, number} chyba} few {{errors, number} chyby} many "
      & "{{errors, number} chyby} other {{errors, number} chyb}}, {warnings, "
      & "plural, one {{warnings, number} varování} few {{warnings, number} "
      & "varování} many {{warnings, number} varování} other {{warnings, "
      & "number} varování}}, {notices, plural, one {{notices, number} "
      & "upozornění} few {{notices, number} upozornění} many {{notices, "
      & "number} upozornění} other {{notices, number} upozornění}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, řádek "
      & "{line, number}} other {{path}, řádek {line, number}, sloupec "
      & "{column, number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{position, plural, =0 {{family, select, byte_parser {nepodporovaná "
      & "syntaxe (parser bajtů): {error}; použijte: B, kB, MB, GB, KiB, MiB, "
      & "GiB nebo TiB} duration_parser {nepodporovaná syntaxe (parser doby "
      & "trvání): {error}; použijte: ms, s, min, h, d, w, month nebo year} "
      & "date_time_parser {nepodporovaná syntaxe (parser data a času): "
      & "{error}; použijte: datum ISO, přirozený den nebo čas} color_parser "
      & "{nepodporovaná syntaxe (parser barev): {error}; použijte: hex, "
      & "rgb(), hsl(), lab(), lch() nebo název barvy} url_parser "
      & "{nepodporovaná syntaxe (parser URL): {error}; použijte: schéma, "
      & "hostitel, cesta, dotaz nebo fragment} unit_parser {nepodporovaná "
      & "syntaxe (parser jednotek): {error}; použijte: podporovaný popisek "
      & "jednotky Humanize} recurrence_parser {nepodporovaná syntaxe (parser "
      & "opakování): {error}; použijte: cron nebo tvar opakování "
      & "every/weekday} domain_label_parser {nepodporovaná syntaxe (parser "
      & "doménových popisků): {error}; použijte: deterministický "
      & "doménový popisek Humanize} other {nepodporovaná syntaxe (parser): "
      & "{error}; použijte: podporovaný tvar vstupu}}} other {{family, "
      & "select, byte_parser {nepodporovaná syntaxe (parser bajtů) na pozici "
      & "{position, number}: {error}; použijte: B, kB, MB, GB, KiB, MiB, GiB "
      & "nebo TiB} duration_parser {nepodporovaná syntaxe (parser doby "
      & "trvání) na pozici {position, number}: {error}; použijte: ms, s, "
      & "min, h, d, w, month nebo year} date_time_parser {nepodporovaná "
      & "syntaxe (parser data a času) na pozici {position, number}: {error}; "
      & "použijte: datum ISO, přirozený den nebo čas} color_parser "
      & "{nepodporovaná syntaxe (parser barev) na pozici {position, number}: "
      & "{error}; použijte: hex, rgb(), hsl(), lab(), lch() nebo název barvy} "
      & "url_parser {nepodporovaná syntaxe (parser URL) na pozici {position, "
      & "number}: {error}; použijte: schéma, hostitel, cesta, dotaz nebo "
      & "fragment} unit_parser {nepodporovaná syntaxe (parser jednotek) na "
      & "pozici {position, number}: {error}; použijte: podporovaný popisek "
      & "jednotky Humanize} recurrence_parser {nepodporovaná syntaxe (parser "
      & "opakování) na pozici {position, number}: {error}; použijte: cron "
      & "nebo tvar opakování every/weekday} domain_label_parser "
      & "{nepodporovaná syntaxe (parser doménových popisků) na pozici "
      & "{position, number}: {error}; použijte: deterministický doménový "
      & "popisek Humanize} other {nepodporovaná syntaxe (parser) na pozici "
      & "{position, number}: {error}; použijte: podporovaný tvar vstupu}}}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {prošlo, {notices, plural, =0 {bez "
      & "upozornění} one {{notices, number} upozornění} few {{notices, "
      & "number} upozornění} many {{notices, number} upozornění} other "
      & "{{notices, number} upozornění}}} failed_check {selhalo, {notices, "
      & "plural, =0 {bez upozornění} one {{notices, number} upozornění} few "
      & "{{notices, number} upozornění} many {{notices, number} upozornění} "
      & "other {{notices, number} upozornění}}} warning_check {s "
      & "varováními, {notices, plural, =0 {bez upozornění} one {{notices, "
      & "number} upozornění} few {{notices, number} upozornění} many "
      & "{{notices, number} upozornění} other {{notices, number} "
      & "upozornění}}} skipped_check {přeskočeno, {notices, plural, =0 {bez "
      & "upozornění} one {{notices, number} upozornění} few {{notices, "
      & "number} upozornění} many {{notices, number} upozornění} other "
      & "{{notices, number} upozornění}}} pending_check {čeká, {notices, "
      & "plural, =0 {bez upozornění} one {{notices, number} upozornění} few "
      & "{{notices, number} upozornění} many {{notices, number} upozornění} "
      & "other {{notices, number} upozornění}}} other {probíhá, {notices, "
      & "plural, =0 {bez upozornění} one {{notices, number} upozornění} few "
      & "{{notices, number} upozornění} many {{notices, number} upozornění} "
      & "other {{notices, number} upozornění}}}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {opakování 1 z 1} other "
      & "{opakování {attempt, number} z 1 – limit překročen}}} other "
      & "{opakování {attempt, number} z {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {informace} notice_severity "
      & "{upozornění} warning_severity {varování} error_severity {chyba} "
      & "critical_severity {kritická chyba} other {blokující chyba}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {diagnostika sestavení} test_source "
      & "{diagnostika testů} lint_source {diagnostika linteru} import_source "
      & "{diagnostika importu} validation_source {diagnostika validace} "
      & "runtime_source {diagnostika běhu} security_source {diagnostika "
      & "zabezpečení} other {diagnostika}}");
   P ("label.diagnostics.source_summary_label",
      "{source, select, build_source {diagnostika sestavení} test_source "
      & "{diagnostika testů} lint_source {diagnostika linteru} import_source "
      & "{diagnostika importu} validation_source {diagnostika validace} "
      & "runtime_source {diagnostika běhu} security_source {diagnostika "
      & "zabezpečení} other {diagnostika}}: {count, plural, one {{count, "
      & "number} hlášení} few {{count, number} hlášení} many {{count, "
      & "number} hlášení} other {{count, number} hlášení}}");
   P ("label.diagnostics.suggested_action_label", "další krok: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {doména} ipv4_host {adresa IPv4} ipv6_host "
      & "{adresa IPv6} localhost_host {místní hostitel} private_network_host "
      & "{adresa privátní sítě} other {neznámý hostitel}}");
   P ("label.events.all_day_label", "{name}: celodenní událost");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {bez odpovědi} accepted {přijato} "
      & "declined {odmítnuto} maybe {možná} other {na čekací listině}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {žádní účastníci} one {{count, number} "
      & "účastník} few {{count, number} účastníci} many {{count, number} "
      & "účastníka} other {{count, number} účastníků}}");
   P ("label.events.canceled_label", "{name}: zrušeno");
   P ("label.events.check_in_label", "check-in: {name}");
   P ("label.events.conference_link_label", "{name}: odkaz na konferenci");
   P ("label.events.event_count_label",
      "{count, plural, =0 {žádné události} one {{count, number} událost} "
      & "few {{count, number} události} many {{count, number} události} other "
      & "{{count, number} událostí}}");
   P ("label.events.event_label",
      "{state, select, scheduled_event {{name}: naplánováno} "
      & "tentative_event {{name}: předběžně} in_progress_event {{name}: "
      & "probíhá} completed_event {{name}: dokončeno} canceled_event "
      & "{{name}: zrušeno} other {{name}: odloženo}}");
   P ("label.events.event_location_label", "{name}, místo: {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {naplánovaná událost} "
      & "tentative_event {předběžná událost} in_progress_event "
      & "{probíhající událost} completed_event {dokončená událost} "
      & "canceled_event {zrušená událost} other {odložená událost}}");
   P ("label.events.event_time_label", "{name}, čas: {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {veřejná událost} private_event "
      & "{soukromá událost} busy_event {čas obsazen} other {čas volný}}");
   P ("label.events.organizer_label", "pořadatel: {name}");
   P ("label.events.rsvp_label",
      "{state, select, not_responded {účast: nepotvrzena} accepted "
      & "{účast: přijata} declined {účast: odmítnuta} maybe {účast: "
      & "možná} other {účast: čekací listina}}");
   P ("label.events.reminder_label", "připomenutí: {time_text}");
   P ("label.events.rescheduled_label", "{name}: přesunuto na {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {{used, number} znak} few {{used, number} znaky} "
      & "many {{used, number} znaku} other {{used, number} znaků}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {bez omezení počtu znaků} one {max. {limit, "
      & "number} znak} few {max. {limit, number} znaky} many {max. {limit, "
      & "number} znaku} other {max. {limit, number} znaků}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {{used, number} znak} few "
      & "{{used, number} znaky} many {{used, number} znaku} other {{used, "
      & "number} znaků}}} other {{used, number} z {limit, plural, one {{limit, "
      & "number} znaku} few {{limit, number} znaků} many {{limit, number} "
      & "znaku} other {{limit, number} znaků}}}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}: volitelné pole} other {{name}: "
      & "povinné pole}}");
   P ("label.forms.field_state_label",
      "{state, select, valid_input {{name}: platná hodnota} invalid_input "
      & "{{name}: neplatná hodnota} required_input {{name}: povinné pole} "
      & "optional_input {{name}: volitelné pole} disabled_input {{name}: pole "
      & "zakázáno} other {{name}: jen pro čtení}}");
   P ("label.forms.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {žádné problémy ve "
      & "formuláři} other {{errors, plural, one {{errors, number} chyba} few "
      & "{{errors, number} chyby} many {{errors, number} chyby} other {{errors, "
      & "number} chyb}}}}} other {{errors, plural, =0 {{warnings, plural, one "
      & "{{warnings, number} varování} few {{warnings, number} varování} "
      & "many {{warnings, number} varování} other {{warnings, number} "
      & "varování}}} other {{errors, plural, one {{errors, number} chyba} few "
      & "{{errors, number} chyby} many {{errors, number} chyby} other {{errors, "
      & "number} chyb}}, {warnings, plural, one {{warnings, number} varování} "
      & "few {{warnings, number} varování} many {{warnings, number} "
      & "varování} other {{warnings, number} varování}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {nezahájeno} editing_form {úpravy} "
      & "dirty_form {neuložené změny} saving_form {ukládání} saved_form "
      & "{uloženo} submitted_form {odesláno} other {odeslání selhalo}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {platný vstup} invalid_input {neplatný "
      & "vstup} required_input {povinný vstup} optional_input {volitelný "
      & "vstup} disabled_input {zakázaný vstup} other {vstup jen pro "
      & "čtení}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {nezahájeno} editing_form {úpravy} "
      & "dirty_form {neuložené změny} saving_form {ukládání formuláře} "
      & "saved_form {formulář uložen} submitted_form {formulář odeslán} "
      & "other {{errors, plural, =0 {odeslání selhalo} one {odeslání "
      & "selhalo: {errors, number} chyba} few {odeslání selhalo: {errors, "
      & "number} chyby} many {odeslání selhalo: {errors, number} chyby} other "
      & "{odeslání selhalo: {errors, number} chyb}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {žádné neuložené změny} one {{count, number} "
      & "neuložená změna} few {{count, number} neuložené změny} many "
      & "{{count, number} neuložené změny} other {{count, number} "
      & "neuložených změn}}");
   P ("label.markup.accessibility_issue_label",
      "{issue, select, missing_accessible_name {{target}: chybí přístupný "
      & "název} low_contrast {{target}: nízký kontrast} "
      & "skipped_heading_level {{target}: přeskočená úroveň nadpisu} "
      & "missing_form_label {{target}: chybí popisek formulářového pole} "
      & "invalid_aria {{target}: neplatné ARIA} keyboard_trap {{target}: past "
      & "na klávesnici} other {{target}: neznámý problém přístupnosti}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title} – souhrn přístupnosti: {landmarks, plural, one "
      & "{{landmarks, number} orientační bod} few {{landmarks, number} "
      & "orientační body} many {{landmarks, number} orientačního bodu} "
      & "other {{landmarks, number} orientačních bodů}}, {headings, plural, "
      & "one {{headings, number} nadpis} few {{headings, number} nadpisy} many "
      & "{{headings, number} nadpisu} other {{headings, number} nadpisů}}, "
      & "{issues, plural, one {{issues, number} problém} few {{issues, number} "
      & "problémy} many {{issues, number} problému} other {{issues, number} "
      & "problémů}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {přidejte přístupný "
      & "název} low_contrast {zvyšte kontrast textu} skipped_heading_level "
      & "{používejte úrovně nadpisů postupně} missing_form_label "
      & "{přiřaďte k ovládacímu prvku formuláře popisek} invalid_aria "
      & "{použijte platnou roli nebo atribut ARIA} keyboard_trap {zajistěte, "
      & "aby fokus klávesnice mohl komponentu opustit} other {zkontrolujte "
      & "problém přístupnosti}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {žádné problémy přístupnosti} one "
      & "{{issues, number} problém přístupnosti} few {{issues, number} "
      & "problémy přístupnosti} many {{issues, number} problému "
      & "přístupnosti} other {{issues, number} problémů přístupnosti}}");
end Labels_1;
