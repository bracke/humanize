separate (Humanize.Catalogs.Phrase_Data.Locale_Pl)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{name}: {state, select, active_account {konto aktywne} invited_account "
      & "{konto zaproszone} locked_account {konto zablokowane} "
      & "suspended_account {konto zawieszone} deleted_account {konto usunięte} "
      & "other {nieznany stan konta}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {konto aktywne} invited_account {konto "
      & "zaproszone} locked_account {konto zablokowane} suspended_account "
      & "{konto zawieszone} deleted_account {konto usunięte} other {nieznany "
      & "stan konta}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {zaufane urządzenie} untrusted_device "
      & "{niezaufane urządzenie} new_device {nowe urządzenie} other "
      & "{zablokowane urządzenie}}");
   P ("label.accounts.last_active_label", "{name}: ostatnia aktywność {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: logowanie nieudane} other {{name}: "
      & "logowanie udane}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA włączone} mfa_disabled {MFA "
      & "wyłączone} mfa_required {MFA wymagane} other {wymagany reset MFA}}");
   P ("label.accounts.session_label",
      "{name}: {state, select, active_session {sesja aktywna} expired_session "
      & "{sesja wygasła} revoked_session {sesja unieważniona} idle_session "
      & "{sesja bezczynna} other {nieznany stan sesji}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {sesja aktywna} expired_session {sesja "
      & "wygasła} revoked_session {sesja unieważniona} idle_session {sesja "
      & "bezczynna} other {nieznany stan sesji}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {brak załączników} one {1 załącznik} few "
      & "{{count, number} załączniki} many {{count, number} załączników} "
      & "other {{count, number} załącznika}}");
   P ("label.attachments.attachment_group_label",
      "{name}: {count, plural, =0 {brak załączników} one {1 załącznik} "
      & "few {{count, number} załączniki} many {{count, number} "
      & "załączników} other {{count, number} załącznika}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {załączony plik} image_attachment "
      & "{załączony obraz} video_attachment {załączone wideo} "
      & "audio_attachment {załączone audio} document_attachment {załączony "
      & "dokument} archive_attachment {załączone archiwum} other {załączony "
      & "link}}");
   P ("label.attachments.attachment_label",
      "{name} ({kind, select, file_attachment {plik} image_attachment {obraz} "
      & "video_attachment {wideo} audio_attachment {audio} document_attachment "
      & "{dokument} archive_attachment {archiwum} other {link}}): {state, "
      & "select, pending_attachment {oczekuje} uploading_attachment "
      & "{przesyłanie} uploaded_attachment {przesłano} failed_attachment "
      & "{niepowodzenie} removed_attachment {usunięto} other {zablokowano}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {załącznik oczekuje} "
      & "uploading_attachment {przesyłanie załącznika} uploaded_attachment "
      & "{załącznik przesłany} failed_attachment {błąd załącznika} "
      & "removed_attachment {załącznik usunięty} other {załącznik "
      & "zablokowany}}");
   P ("label.attachments.download_label", "pobierz {name}");
   P ("label.attachments.expiring_link_label", "{name}: link wygasa {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "podgląd {name}");
   P ("label.attachments.remove_label", "usuń {name}");
   P ("label.attachments.scan_result_label",
      "{name}: {state, select, not_scanned {nie przeskanowano} scanning "
      & "{skanowanie w toku} safe {brak zagrożeń} suspicious {podejrzana "
      & "zawartość} other {wykryto infekcję}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {nie przeskanowano} scanning {skanowanie w "
      & "toku} safe {skanowanie: brak zagrożeń} suspicious {skanowanie: "
      & "podejrzana zawartość} other {skanowanie: wykryto infekcję}}");
   P ("label.attachments.upload_error_label", "{name}: przesyłanie nieudane – {reason}");
   P ("label.badges.badge_label",
      "{name}: {tone, select, neutral_tone {plakietka neutralna} info_tone "
      & "{plakietka informacyjna} success_tone {plakietka sukcesu} warning_tone "
      & "{plakietka ostrzegawcza} danger_tone {plakietka zagrożenia} other "
      & "{plakietka wyciszona}}{state, select, new_badge {, nowa} updated_badge "
      & "{, zaktualizowana} deprecated_badge {, przestarzała} selected_badge "
      & "{, zaznaczona} disabled_badge {, wyłączona} dismissible_badge {, do "
      & "zamknięcia} other {}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {plakietka niskiego priorytetu} "
      & "medium_priority {plakietka średniego priorytetu} high_priority "
      & "{plakietka wysokiego priorytetu} other {plakietka krytycznego "
      & "priorytetu}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {plakietka domyślna} new_badge {nowa "
      & "plakietka} updated_badge {zaktualizowana plakietka} deprecated_badge "
      & "{przestarzała plakietka} selected_badge {zaznaczona plakietka} "
      & "disabled_badge {wyłączona plakietka} other {plakietka do "
      & "zamknięcia}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {plakietka neutralna} info_tone {plakietka "
      & "informacyjna} success_tone {plakietka sukcesu} warning_tone {plakietka "
      & "ostrzegawcza} danger_tone {plakietka zagrożenia} other {plakietka "
      & "wyciszona}}");
   P ("label.badges.chip_label", "{selected, select, false {{name}} other {{name}, zaznaczono}}");
   P ("label.badges.count_badge_label", "{count, plural, =0 {{name}: brak} other {{name}: {count, number}}}");
   P ("label.badges.deprecated_label", "{name}: przestarzałe");
   P ("label.badges.dismiss_label", "zamknij {name}");
   P ("label.badges.new_label", "{name}: nowość");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {brak ukrytych plakietek} one {+1 plakietka} "
      & "few {+{hidden_count, number} plakietki} many {+{hidden_count, number} "
      & "plakietek} other {+{hidden_count, number} plakietki}}");
   P ("label.badges.priority_badge_label",
      "{name}: {priority, select, low_priority {niski priorytet} "
      & "medium_priority {średni priorytet} high_priority {wysoki priorytet} "
      & "other {krytyczny priorytet}}");
   P ("label.badges.status_badge_label",
      "{name} – status: {tone, select, neutral_tone {neutralny} info_tone "
      & "{informacja} success_tone {sukces} warning_tone {ostrzeżenie} "
      & "danger_tone {zagrożenie} other {wyciszony}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {brak tagów} one {1 tag} few {{count, number} "
      & "tagi} many {{count, number} tagów} other {{count, number} tagu}}");
   P ("label.badges.tag_label", "tag {name}");
   P ("label.badges.updated_label", "{name}: zaktualizowano");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefakt przesłany} "
      & "artifact_missing {brak artefaktu} artifact_expired {artefakt wygasł} "
      & "other {artefakt zweryfikowany}}");
   P ("label.builds.benchmark_label", "test wydajności {name}: {result_text}");
   P ("label.builds.build_label",
      "{name}: {state, select, build_queued {kompilacja w kolejce} "
      & "build_running {kompilacja w toku} build_passed {kompilacja udana} "
      & "build_failed {kompilacja nieudana} snapshot_build {kompilacja "
      & "migawkowa} other {kompilacja wydania}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {kompilacja w kolejce} build_running "
      & "{kompilacja w toku} build_passed {kompilacja udana} build_failed "
      & "{kompilacja nieudana} snapshot_build {kompilacja migawkowa} other "
      & "{kompilacja wydania}}");
   P ("label.builds.coverage_label", "pokrycie: {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {bramka wydania zaliczona} gate_failed "
      & "{bramka wydania niezaliczona} gate_warning {bramka wydania: "
      & "ostrzeżenie} other {bramka wydania zablokowana}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {brak zaliczonych "
      & "testów} other {zaliczone testy: {count, number}}}} failed_test "
      & "{{count, plural, =0 {brak nieudanych testów} other {nieudane testy: "
      & "{count, number}}}} skipped_test {{count, plural, =0 {brak pominiętych "
      & "testów} other {pominięte testy: {count, number}}}} flaky_test "
      & "{{count, plural, =0 {brak niestabilnych testów} other {niestabilne "
      & "testy: {count, number}}}} other {{count, plural, =0 {brak testów z "
      & "oczekiwanym błędem} other {testy z oczekiwanym błędem: {count, "
      & "number}}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {zaliczony} failed_test {nieudany} "
      & "skipped_test {pominięty} flaky_test {niestabilny} other {oczekiwany "
      & "błąd}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name}: "
      & "bez zmian (wyłączone)} other {{field_name}: włączono}}} other "
      & "{{new_value, select, false {{field_name}: wyłączono} other "
      & "{{field_name}: bez zmian (włączone)}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {dodano} removed_change {usunięto} "
      & "modified_change {zmieniono} renamed_change {zmieniono nazwę} "
      & "unchanged_change {bez zmian} metadata_change {zmieniono metadane} "
      & "moved_change {przeniesiono} conflict_change {konflikt} other {nieznana "
      & "zmiana}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {zmiana informacyjna} "
      & "minor_change {drobna zmiana} major_change {istotna zmiana} other "
      & "{zmiana niezgodna wstecz}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}: bez zmian} "
      & "other {{unchanged, plural, =0 {{field_name}: dodano {added, number}} "
      & "other {{field_name}: dodano {added, number}, bez zmian {unchanged, "
      & "number}}}}}} other {{added, plural, =0 {{unchanged, plural, =0 "
      & "{{field_name}: usunięto {removed, number}} other {{field_name}: "
      & "usunięto {removed, number}, bez zmian {unchanged, number}}}} other "
      & "{{unchanged, plural, =0 {{field_name}: dodano {added, number}, "
      & "usunięto {removed, number}} other {{field_name}: dodano {added, "
      & "number}, usunięto {removed, number}, bez zmian {unchanged, "
      & "number}}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {brak konfliktów} one {1 konflikt} few {{count, "
      & "number} konflikty} many {{count, number} konfliktów} other {{count, "
      & "number} konfliktu}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name}: przesunięto na później, z "
      & "{old_label} na {new_label}} other {{field_name}: przesunięto na "
      & "wcześniej, z {old_label} na {new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name}: zmieniono z {old_label} na {new_label}");
   P ("label.changes.field_change_label", "{field_name}: zmieniono z {old_value} na {new_value}");
   P ("label.changes.item_change_label",
      "{name}: {kind, select, added_change {dodano} removed_change "
      & "{usunięto} modified_change {zmieniono} renamed_change {zmieniono "
      & "nazwę} unchanged_change {bez zmian} metadata_change {zmieniono "
      & "metadane} moved_change {przeniesiono} conflict_change {konflikt} other "
      & "{nieznana zmiana}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {zmieniono tylko metadane} one {zmieniono tylko 1 "
      & "pole metadanych} few {zmieniono tylko {count, number} pola metadanych} "
      & "many {zmieniono tylko {count, number} pól metadanych} other "
      & "{zmieniono tylko {count, number} pola metadanych}}");
   P ("label.changes.move_label", "{name}: przeniesiono z {from} do {to}");
   P ("label.changes.no_changes_label", "brak zmian");
   P ("label.changes.patch_size_label",
      "{lines_added, plural, =0 {{lines_removed, plural, =0 {brak zmian w "
      & "wierszach} one {usunięto 1 wiersz} few {usunięto {lines_removed, "
      & "number} wiersze} many {usunięto {lines_removed, number} wierszy} "
      & "other {usunięto {lines_removed, number} wiersza}}} one {dodano 1 "
      & "wiersz{lines_removed, plural, =0 {} one {, usunięto 1 wiersz} few {, "
      & "usunięto {lines_removed, number} wiersze} many {, usunięto "
      & "{lines_removed, number} wierszy} other {, usunięto {lines_removed, "
      & "number} wiersza}}} few {dodano {lines_added, number} "
      & "wiersze{lines_removed, plural, =0 {} one {, usunięto 1 wiersz} few {, "
      & "usunięto {lines_removed, number} wiersze} many {, usunięto "
      & "{lines_removed, number} wierszy} other {, usunięto {lines_removed, "
      & "number} wiersza}}} many {dodano {lines_added, number} "
      & "wierszy{lines_removed, plural, =0 {} one {, usunięto 1 wiersz} few {, "
      & "usunięto {lines_removed, number} wiersze} many {, usunięto "
      & "{lines_removed, number} wierszy} other {, usunięto {lines_removed, "
      & "number} wiersza}}} other {dodano {lines_added, number} "
      & "wiersza{lines_removed, plural, =0 {} one {, usunięto 1 wiersz} few {, "
      & "usunięto {lines_removed, number} wiersze} many {, usunięto "
      & "{lines_removed, number} wierszy} other {, usunięto {lines_removed, "
      & "number} wiersza}}}}");
   P ("label.changes.rename_label", "zmieniono nazwę z {old_name} na {new_name}");
   P ("label.comments.author_action_label",
      "{author} – {state, select, draft_comment {szkic komentarza} "
      & "published_comment {nowy komentarz} edited_comment {edycja komentarza} "
      & "deleted_comment {usunięcie komentarza} resolved_comment {rozwiązanie "
      & "komentarza} unresolved_comment {ponowne otwarcie komentarza} "
      & "pinned_comment {przypięcie komentarza} other {ukrycie komentarza}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {brak komentarzy} one {1 komentarz} few {{count, "
      & "number} komentarze} many {{count, number} komentarzy} other {{count, "
      & "number} komentarza}}");
   P ("label.comments.comment_label",
      "{author}: {state, select, draft_comment {szkic komentarza} "
      & "published_comment {opublikowany komentarz} edited_comment {edytowany "
      & "komentarz} deleted_comment {usunięty komentarz} resolved_comment "
      & "{rozwiązany komentarz} unresolved_comment {nierozwiązany komentarz} "
      & "pinned_comment {przypięty komentarz} other {ukryty komentarz}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {szkic komentarza} published_comment "
      & "{opublikowany komentarz} edited_comment {edytowany komentarz} "
      & "deleted_comment {usunięty komentarz} resolved_comment {rozwiązany "
      & "komentarz} unresolved_comment {nierozwiązany komentarz} "
      & "pinned_comment {przypięty komentarz} other {ukryty komentarz}}");
   P ("label.comments.deleted_label", "komentarz usunięty przez {author}");
   P ("label.comments.edited_label", "edytowano {time_text}");
   P ("label.comments.hide_comment_label", "ukryj komentarz: {reason}");
   P ("label.comments.lock_thread_label", "zablokuj wątek {name}");
   P ("label.comments.mention_label", "{actor} oznacza {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {brak uczestników} one {1 uczestnik} few {{count, "
      & "number} uczestnicy} many {{count, number} uczestników} other {{count, "
      & "number} uczestnika}}");
   P ("label.comments.pin_label", "przypnij {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reakcja: polubienie} dislike_reaction "
      & "{reakcja: nie lubię} heart_reaction {reakcja: serce} laugh_reaction "
      & "{reakcja: śmiech} confused_reaction {reakcja: zmieszanie} "
      & "hooray_reaction {reakcja: hura} rocket_reaction {reakcja: rakieta} "
      & "other {reakcja: oczy}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {polubienia} dislike_reaction {„nie "
      & "lubię”} heart_reaction {serca} laugh_reaction {śmiech} "
      & "confused_reaction {zmieszanie} hooray_reaction {hura} rocket_reaction "
      & "{rakiety} other {oczy}}: {count, number}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {brak odpowiedzi} one {1 odpowiedź} few {{count, "
      & "number} odpowiedzi} many {{count, number} odpowiedzi} other {{count, "
      & "number} odpowiedzi}}");
   P ("label.comments.resolved_label", "{name}: rozwiązano");
   P ("label.comments.subscribe_label", "subskrybuj {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {brak wątków} one {1 wątek} few {{count, number} "
      & "wątki} many {{count, number} wątków} other {{count, number} "
      & "wątku}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {otwarty wątek} resolved_thread "
      & "{rozwiązany wątek} locked_thread {zablokowany wątek} other "
      & "{zarchiwizowany wątek}}{count, plural, =0 {} one {, 1 komentarz} few "
      & "{, {count, number} komentarze} many {, {count, number} komentarzy} "
      & "other {, {count, number} komentarza}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {otwarty wątek} resolved_thread "
      & "{rozwiązany wątek} locked_thread {zablokowany wątek} other "
      & "{zarchiwizowany wątek}}");
   P ("label.comments.unpin_label", "odepnij {name}");
   P ("label.comments.unsubscribe_label", "anuluj subskrypcję {name}");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {poprawa} regressed {regresja} "
      & "unchanged {bez zmian} within_tolerance {w granicach tolerancji} "
      & "outside_tolerance {poza tolerancją} new_value {nowa wartość} "
      & "removed_value {usunięto} other {brak punktu odniesienia}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {poprawa} regressed {regresja} unchanged "
      & "{bez zmian} within_tolerance {w granicach tolerancji} "
      & "outside_tolerance {poza tolerancją} new_value {nowa wartość} "
      & "removed_value {usunięto} other {brak punktu odniesienia}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {poprawa o {difference_text}} "
      & "regressed {regresja o {difference_text}} unchanged {bez zmian "
      & "({difference_text})} within_tolerance {w granicach tolerancji "
      & "({difference_text})} outside_tolerance {poza tolerancją "
      & "({difference_text})} new_value {nowa wartość ({difference_text})} "
      & "removed_value {usunięto ({difference_text})} other {brak punktu "
      & "odniesienia ({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {poprawa o {difference_text}} "
      & "regressed {regresja o {difference_text}} unchanged {bez zmian "
      & "({difference_text})} within_tolerance {w granicach tolerancji "
      & "({difference_text})} outside_tolerance {poza tolerancją "
      & "({difference_text})} new_value {nowa wartość ({difference_text})} "
      & "removed_value {usunięto ({difference_text})} other {brak punktu "
      & "odniesienia ({difference_text})}}, tolerancja {tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {nieprawidłowy wiersz} duplicate_record "
      & "{zduplikowany rekord} missing_column {brakująca kolumna} "
      & "unknown_field {nieznane pole} schema_mismatch {niezgodność schematu} "
      & "other {pominięty rekord}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {próbny import udany} dry_run_failed "
      & "{próbny import nieudany} import_valid {import prawidłowy} "
      & "import_invalid {import nieprawidłowy} other {import częściowy}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {próbny import udany} "
      & "dry_run_failed {próbny import nieudany} import_valid {import "
      & "prawidłowy} import_invalid {import nieprawidłowy} other {import "
      & "częściowy}}, zaakceptowano {accepted, number}, odrzucono {rejected, "
      & "number}");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {nieprawidłowe wiersze} duplicate_record "
      & "{zduplikowane rekordy} missing_column {brakujące kolumny} "
      & "unknown_field {nieznane pola} schema_mismatch {niezgodności schematu} "
      & "other {pominięte rekordy}}: {count, number}");
   P ("label.data_quality.row_issue_label",
      "wiersz {row, number}: {issue, select, invalid_row {nieprawidłowy "
      & "wiersz} duplicate_record {zduplikowany rekord} missing_column "
      & "{brakująca kolumna} unknown_field {nieznane pole} schema_mismatch "
      & "{niezgodność schematu} other {pominięty rekord}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {nieprawidłowy wiersz} "
      & "duplicate_record {zduplikowany rekord} missing_column {brakująca "
      & "kolumna} unknown_field {nieznane pole} schema_mismatch {niezgodność "
      & "schematu} other {pominięty rekord}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefakt gotowy} artifact_uploaded "
      & "{artefakt przesłany} artifact_signed {artefakt podpisany} "
      & "artifact_missing {brak artefaktu} other {artefakt wygasł}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {wdrożenie {name} do {environment}: "
      & "w kolejce} deploying {wdrożenie {name} do {environment}: w toku} "
      & "deployed {wdrożenie {name} do {environment}: zakończone} "
      & "failed_deployment {wdrożenie {name} do {environment}: nieudane} "
      & "rolled_back {wdrożenie {name} do {environment}: wycofane} "
      & "blocked_deployment {wdrożenie {name} do {environment}: zablokowane} "
      & "other {wdrożenie {name} do {environment}: anulowane}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {wdrożenie w kolejce} deploying "
      & "{wdrażanie} deployed {wdrożono} failed_deployment {wdrożenie "
      & "nieudane} rolled_back {wycofano} blocked_deployment {wdrożenie "
      & "zablokowane} other {wdrożenie anulowane}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {środowisko sprawne} "
      & "drifting_environment {dryf środowiska} locked_environment "
      & "{środowisko zablokowane} maintenance_environment {środowisko w "
      & "konserwacji} other {nieznany stan środowiska}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {brak migracji} migration_pending "
      & "{migracja oczekuje} migrating {migracja w toku} migration_complete "
      & "{migracja zakończona} other {migracja nieudana}}");
   P ("label.deployments.promotion_label", "promocja {name} z {from_environment} do {to_environment}");
   P ("label.deployments.rollback_label", "wycofanie {name} do {target}");
   P ("label.deployments.rollout_label", "stopniowe wdrażanie {name}: {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {brak dotkniętych elementów} one {{count, number} "
      & "dotknięty element} few {{count, number} dotknięte elementy} many "
      & "{{count, number} dotkniętych elementów} other {{count, number} "
      & "dotkniętego elementu}}");
   P ("label.diagnostics.check_duration_label",
      "{status, select, passed_check {{name}: zaliczono ({duration_s, number} "
      & "s)} failed_check {{name}: nie zaliczono ({duration_s, number} s)} "
      & "warning_check {{name}: z ostrzeżeniami ({duration_s, number} s)} "
      & "skipped_check {{name}: pominięto ({duration_s, number} s)} "
      & "pending_check {{name}: oczekuje ({duration_s, number} s)} other "
      & "{{name}: w toku ({duration_s, number} s)}}");
   P ("label.diagnostics.check_result_label",
      "{status, select, passed_check {{name}: zaliczono} failed_check "
      & "{{name}: nie zaliczono} warning_check {{name}: z ostrzeżeniami} "
      & "skipped_check {{name}: pominięto} pending_check {{name}: oczekuje} "
      & "other {{name}: w toku}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {zaliczono} failed_check {nie zaliczono} "
      & "warning_check {z ostrzeżeniami} skipped_check {pominięto} "
      & "pending_check {oczekuje} other {w toku}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{kind, select, expected_value {oczekiwano "
      & "wartości dla {subject}; użyj: {suggestion}} expected_unit "
      & "{oczekiwano jednostki dla {subject}; użyj: {suggestion}} "
      & "invalid_range {nieprawidłowy zakres dla {subject}; użyj: "
      & "{suggestion}} end_before_start {koniec zakresu przed początkiem dla "
      & "{subject}; użyj: {suggestion}} unknown_field {nieznane pole dla "
      & "{subject}; użyj: {suggestion}} unsafe_redacted_value {ukryto "
      & "niebezpieczną wartość dla {subject}; użyj: {suggestion}} "
      & "unsupported_syntax {nieobsługiwana składnia dla {subject}; użyj: "
      & "{suggestion}} other {objaśnienie diagnostyki dla {subject}; użyj: "
      & "{suggestion}}}} other {{kind, select, expected_value {oczekiwano "
      & "wartości dla {subject} na pozycji {position, number}; użyj: "
      & "{suggestion}} expected_unit {oczekiwano jednostki dla {subject} na "
      & "pozycji {position, number}; użyj: {suggestion}} invalid_range "
      & "{nieprawidłowy zakres dla {subject} na pozycji {position, number}; "
      & "użyj: {suggestion}} end_before_start {koniec zakresu przed "
      & "początkiem dla {subject} na pozycji {position, number}; użyj: "
      & "{suggestion}} unknown_field {nieznane pole dla {subject} na pozycji "
      & "{position, number}; użyj: {suggestion}} unsafe_redacted_value {ukryto "
      & "niebezpieczną wartość dla {subject} na pozycji {position, number}; "
      & "użyj: {suggestion}} unsupported_syntax {nieobsługiwana składnia dla "
      & "{subject} na pozycji {position, number}; użyj: {suggestion}} other "
      & "{objaśnienie diagnostyki dla {subject} na pozycji {position, number}; "
      & "użyj: {suggestion}}}}}");
   P ("label.diagnostics.diagnostic_label",
      "{line, plural, =0 {{severity, select, info_severity {informacja w "
      & "{path}: {message}} notice_severity {uwaga w {path}: {message}} "
      & "warning_severity {ostrzeżenie w {path}: {message}} error_severity "
      & "{błąd w {path}: {message}} critical_severity {błąd krytyczny w "
      & "{path}: {message}} other {błąd blokujący w {path}: {message}}}} "
      & "other {{severity, select, info_severity {informacja w {path}, wiersz "
      & "{line, number}: {message}} notice_severity {uwaga w {path}, wiersz "
      & "{line, number}: {message}} warning_severity {ostrzeżenie w {path}, "
      & "wiersz {line, number}: {message}} error_severity {błąd w {path}, "
      & "wiersz {line, number}: {message}} critical_severity {błąd krytyczny "
      & "w {path}, wiersz {line, number}: {message}} other {błąd blokujący w "
      & "{path}, wiersz {line, number}: {message}}}}}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {niepowodzenie w {path}} other {{column, plural, =0 "
      & "{niepowodzenie w {path}, wiersz {line, number}} other {niepowodzenie w "
      & "{path}, wiersz {line, number}, kolumna {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {informacja w polu {field_name}: "
      & "{message}} notice_severity {uwaga w polu {field_name}: {message}} "
      & "warning_severity {ostrzeżenie w polu {field_name}: {message}} "
      & "error_severity {błąd w polu {field_name}: {message}} "
      & "critical_severity {błąd krytyczny w polu {field_name}: {message}} "
      & "other {błąd blokujący w polu {field_name}: {message}}}");
   P ("label.diagnostics.first_failure_label",
      "{line, plural, =0 {pierwsze niepowodzenie: {check_name}, {path}} other "
      & "{pierwsze niepowodzenie: {check_name}, {path}, wiersz {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, =0 {brak "
      & "problemów} other {{errors, plural, one {{errors, number} błąd} few "
      & "{{errors, number} błędy} many {{errors, number} błędów} other "
      & "{{errors, number} błędu}}}}} other {{errors, plural, =0 {{notices, "
      & "plural, one {{notices, number} uwaga} few {{notices, number} uwagi} "
      & "many {{notices, number} uwag} other {{notices, number} uwagi}}} other "
      & "{{errors, plural, one {{errors, number} błąd} few {{errors, number} "
      & "błędy} many {{errors, number} błędów} other {{errors, number} "
      & "błędu}}, {notices, plural, one {{notices, number} uwaga} few "
      & "{{notices, number} uwagi} many {{notices, number} uwag} other "
      & "{{notices, number} uwagi}}}}}}} other {{notices, plural, =0 {{errors, "
      & "plural, =0 {{warnings, plural, one {{warnings, number} ostrzeżenie} "
      & "few {{warnings, number} ostrzeżenia} many {{warnings, number} "
      & "ostrzeżeń} other {{warnings, number} ostrzeżenia}}} other {{errors, "
      & "plural, one {{errors, number} błąd} few {{errors, number} błędy} "
      & "many {{errors, number} błędów} other {{errors, number} błędu}}, "
      & "{warnings, plural, one {{warnings, number} ostrzeżenie} few "
      & "{{warnings, number} ostrzeżenia} many {{warnings, number} "
      & "ostrzeżeń} other {{warnings, number} ostrzeżenia}}}}} other "
      & "{{errors, plural, =0 {{warnings, plural, one {{warnings, number} "
      & "ostrzeżenie} few {{warnings, number} ostrzeżenia} many {{warnings, "
      & "number} ostrzeżeń} other {{warnings, number} ostrzeżenia}}, "
      & "{notices, plural, one {{notices, number} uwaga} few {{notices, number} "
      & "uwagi} many {{notices, number} uwag} other {{notices, number} uwagi}}} "
      & "other {{errors, plural, one {{errors, number} błąd} few {{errors, "
      & "number} błędy} many {{errors, number} błędów} other {{errors, "
      & "number} błędu}}, {warnings, plural, one {{warnings, number} "
      & "ostrzeżenie} few {{warnings, number} ostrzeżenia} many {{warnings, "
      & "number} ostrzeżeń} other {{warnings, number} ostrzeżenia}}, "
      & "{notices, plural, one {{notices, number} uwaga} few {{notices, number} "
      & "uwagi} many {{notices, number} uwag} other {{notices, number} "
      & "uwagi}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, wiersz "
      & "{line, number}} other {{path}, wiersz {line, number}, kolumna {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{position, plural, =0 {{family, select, byte_parser {nieobsługiwana "
      & "składnia (parser bajtów): {error}; użyj: B, kB, MB, GB, KiB, MiB, "
      & "GiB lub TiB} duration_parser {nieobsługiwana składnia (parser czasu "
      & "trwania): {error}; użyj: ms, s, min, h, d, w, month lub year} "
      & "date_time_parser {nieobsługiwana składnia (parser daty i godziny): "
      & "{error}; użyj: data ISO, dzień w języku naturalnym lub godzina} "
      & "color_parser {nieobsługiwana składnia (parser kolorów): {error}; "
      & "użyj: hex, rgb(), hsl(), lab(), lch() lub nazwa koloru} url_parser "
      & "{nieobsługiwana składnia (parser URL): {error}; użyj: schemat, "
      & "host, ścieżka, zapytanie lub fragment} unit_parser {nieobsługiwana "
      & "składnia (parser jednostek): {error}; użyj: obsługiwana etykieta "
      & "jednostki Humanize} recurrence_parser {nieobsługiwana składnia "
      & "(parser powtórzeń): {error}; użyj: cron lub forma powtarzania "
      & "every/weekday} domain_label_parser {nieobsługiwana składnia (parser "
      & "etykiet domenowych): {error}; użyj: deterministyczna etykieta "
      & "domenowa Humanize} other {nieobsługiwana składnia (parser): {error}; "
      & "użyj: obsługiwana forma danych wejściowych}}} other {{family, "
      & "select, byte_parser {nieobsługiwana składnia (parser bajtów) na "
      & "pozycji {position, number}: {error}; użyj: B, kB, MB, GB, KiB, MiB, "
      & "GiB lub TiB} duration_parser {nieobsługiwana składnia (parser czasu "
      & "trwania) na pozycji {position, number}: {error}; użyj: ms, s, min, h, "
      & "d, w, month lub year} date_time_parser {nieobsługiwana składnia "
      & "(parser daty i godziny) na pozycji {position, number}: {error}; użyj: "
      & "data ISO, dzień w języku naturalnym lub godzina} color_parser "
      & "{nieobsługiwana składnia (parser kolorów) na pozycji {position, "
      & "number}: {error}; użyj: hex, rgb(), hsl(), lab(), lch() lub nazwa "
      & "koloru} url_parser {nieobsługiwana składnia (parser URL) na pozycji "
      & "{position, number}: {error}; użyj: schemat, host, ścieżka, "
      & "zapytanie lub fragment} unit_parser {nieobsługiwana składnia (parser "
      & "jednostek) na pozycji {position, number}: {error}; użyj: obsługiwana "
      & "etykieta jednostki Humanize} recurrence_parser {nieobsługiwana "
      & "składnia (parser powtórzeń) na pozycji {position, number}: {error}; "
      & "użyj: cron lub forma powtarzania every/weekday} domain_label_parser "
      & "{nieobsługiwana składnia (parser etykiet domenowych) na pozycji "
      & "{position, number}: {error}; użyj: deterministyczna etykieta domenowa "
      & "Humanize} other {nieobsługiwana składnia (parser) na pozycji "
      & "{position, number}: {error}; użyj: obsługiwana forma danych "
      & "wejściowych}}}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {zaliczono, {notices, plural, =0 {bez "
      & "uwag} one {{notices, number} uwaga} few {{notices, number} uwagi} many "
      & "{{notices, number} uwag} other {{notices, number} uwagi}}} "
      & "failed_check {nie zaliczono, {notices, plural, =0 {bez uwag} one "
      & "{{notices, number} uwaga} few {{notices, number} uwagi} many "
      & "{{notices, number} uwag} other {{notices, number} uwagi}}} "
      & "warning_check {z ostrzeżeniami, {notices, plural, =0 {bez uwag} one "
      & "{{notices, number} uwaga} few {{notices, number} uwagi} many "
      & "{{notices, number} uwag} other {{notices, number} uwagi}}} "
      & "skipped_check {pominięto, {notices, plural, =0 {bez uwag} one "
      & "{{notices, number} uwaga} few {{notices, number} uwagi} many "
      & "{{notices, number} uwag} other {{notices, number} uwagi}}} "
      & "pending_check {oczekuje, {notices, plural, =0 {bez uwag} one "
      & "{{notices, number} uwaga} few {{notices, number} uwagi} many "
      & "{{notices, number} uwag} other {{notices, number} uwagi}}} other {w "
      & "toku, {notices, plural, =0 {bez uwag} one {{notices, number} uwaga} "
      & "few {{notices, number} uwagi} many {{notices, number} uwag} other "
      & "{{notices, number} uwagi}}}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {ponowna próba 1 z 1} other "
      & "{ponowna próba {attempt, number} z 1 – przekroczono limit}}} other "
      & "{ponowna próba {attempt, number} z {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {informacja} notice_severity {uwaga} "
      & "warning_severity {ostrzeżenie} error_severity {błąd} "
      & "critical_severity {błąd krytyczny} other {błąd blokujący}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {diagnostyka kompilacji} test_source "
      & "{diagnostyka testów} lint_source {diagnostyka lintera} import_source "
      & "{diagnostyka importu} validation_source {diagnostyka walidacji} "
      & "runtime_source {diagnostyka środowiska uruchomieniowego} "
      & "security_source {diagnostyka bezpieczeństwa} other {diagnostyka}}");
   P ("label.diagnostics.source_summary_label",
      "{source, select, build_source {diagnostyka kompilacji} test_source "
      & "{diagnostyka testów} lint_source {diagnostyka lintera} import_source "
      & "{diagnostyka importu} validation_source {diagnostyka walidacji} "
      & "runtime_source {diagnostyka środowiska uruchomieniowego} "
      & "security_source {diagnostyka bezpieczeństwa} other {diagnostyka}}: "
      & "{count, plural, one {{count, number} komunikat} few {{count, number} "
      & "komunikaty} many {{count, number} komunikatów} other {{count, number} "
      & "komunikatu}}");
   P ("label.diagnostics.suggested_action_label", "następny krok: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {nazwa domeny} ipv4_host {adres IPv4} "
      & "ipv6_host {adres IPv6} localhost_host {host lokalny} "
      & "private_network_host {adres sieci prywatnej} other {nieznany host}}");
   P ("label.events.all_day_label", "{name}: wydarzenie całodniowe");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {brak odpowiedzi} accepted {przyjęto} "
      & "declined {odrzucono} maybe {może} other {na liście oczekujących}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {brak uczestników} one {{count, number} uczestnik} "
      & "few {{count, number} uczestnicy} many {{count, number} uczestników} "
      & "other {{count, number} uczestnika}}");
   P ("label.events.canceled_label", "{name}: odwołano");
   P ("label.events.check_in_label", "zgłoś obecność: {name}");
   P ("label.events.conference_link_label", "{name}: link do wideokonferencji");
   P ("label.events.event_count_label",
      "{count, plural, =0 {brak wydarzeń} one {{count, number} wydarzenie} "
      & "few {{count, number} wydarzenia} many {{count, number} wydarzeń} "
      & "other {{count, number} wydarzenia}}");
   P ("label.events.event_label",
      "{state, select, scheduled_event {{name}: wydarzenie zaplanowane} "
      & "tentative_event {{name}: wydarzenie niepotwierdzone} in_progress_event "
      & "{{name}: wydarzenie w toku} completed_event {{name}: wydarzenie "
      & "zakończone} canceled_event {{name}: wydarzenie odwołane} other "
      & "{{name}: wydarzenie przełożone}}");
   P ("label.events.event_location_label", "{name}, miejsce: {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {wydarzenie zaplanowane} "
      & "tentative_event {wydarzenie niepotwierdzone} in_progress_event "
      & "{wydarzenie w toku} completed_event {wydarzenie zakończone} "
      & "canceled_event {wydarzenie odwołane} other {wydarzenie przełożone}}");
   P ("label.events.event_time_label", "{name}, termin: {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {wydarzenie publiczne} private_event "
      & "{wydarzenie prywatne} busy_event {czas zajęty} other {czas wolny}}");
   P ("label.events.organizer_label", "organizator: {name}");
   P ("label.events.rsvp_label",
      "{state, select, not_responded {odpowiedź: brak} accepted {odpowiedź: "
      & "tak} declined {odpowiedź: nie} maybe {odpowiedź: może} other "
      & "{odpowiedź: lista oczekujących}}");
   P ("label.events.reminder_label", "przypomnienie: {time_text}");
   P ("label.events.rescheduled_label", "{name}: przełożono na {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {{used, number} znak} few {{used, number} znaki} "
      & "many {{used, number} znaków} other {{used, number} znaku}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {bez limitu znaków} one {maks. {limit, number} "
      & "znak} few {maks. {limit, number} znaki} many {maks. {limit, number} "
      & "znaków} other {maks. {limit, number} znaku}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {{used, number} znak} few "
      & "{{used, number} znaki} many {{used, number} znaków} other {{used, "
      & "number} znaku}}} other {{used, number} z {limit, plural, one {{limit, "
      & "number} znaku} few {{limit, number} znaków} many {{limit, number} "
      & "znaków} other {{limit, number} znaku}}}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}: pole opcjonalne} other {{name}: pole "
      & "wymagane}}");
   P ("label.forms.field_state_label",
      "{state, select, valid_input {{name}: wartość prawidłowa} "
      & "invalid_input {{name}: wartość nieprawidłowa} required_input "
      & "{{name}: pole wymagane} optional_input {{name}: pole opcjonalne} "
      & "disabled_input {{name}: pole wyłączone} other {{name}: tylko do "
      & "odczytu}}");
   P ("label.forms.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {brak problemów w "
      & "formularzu} other {{errors, plural, one {{errors, number} błąd} few "
      & "{{errors, number} błędy} many {{errors, number} błędów} other "
      & "{{errors, number} błędu}}}}} other {{errors, plural, =0 {{warnings, "
      & "plural, one {{warnings, number} ostrzeżenie} few {{warnings, number} "
      & "ostrzeżenia} many {{warnings, number} ostrzeżeń} other {{warnings, "
      & "number} ostrzeżenia}}} other {{errors, plural, one {{errors, number} "
      & "błąd} few {{errors, number} błędy} many {{errors, number} "
      & "błędów} other {{errors, number} błędu}}, {warnings, plural, one "
      & "{{warnings, number} ostrzeżenie} few {{warnings, number} "
      & "ostrzeżenia} many {{warnings, number} ostrzeżeń} other {{warnings, "
      & "number} ostrzeżenia}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {nie rozpoczęto} editing_form {edycja} "
      & "dirty_form {niezapisane zmiany} saving_form {zapisywanie} saved_form "
      & "{zapisano} submitted_form {wysłano} other {wysyłanie nieudane}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {prawidłowe dane} invalid_input "
      & "{nieprawidłowe dane} required_input {dane wymagane} optional_input "
      & "{dane opcjonalne} disabled_input {pole wyłączone} other {pole tylko "
      & "do odczytu}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {nie rozpoczęto} editing_form {edycja} "
      & "dirty_form {niezapisane zmiany} saving_form {zapisywanie formularza} "
      & "saved_form {formularz zapisany} submitted_form {formularz wysłany} "
      & "other {{errors, plural, =0 {wysyłanie nieudane} one {wysyłanie "
      & "nieudane: {errors, number} błąd} few {wysyłanie nieudane: {errors, "
      & "number} błędy} many {wysyłanie nieudane: {errors, number} "
      & "błędów} other {wysyłanie nieudane: {errors, number} błędu}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {brak niezapisanych zmian} one {{count, number} "
      & "niezapisana zmiana} few {{count, number} niezapisane zmiany} many "
      & "{{count, number} niezapisanych zmian} other {{count, number} "
      & "niezapisanej zmiany}}");
   P ("label.markup.accessibility_issue_label",
      "{issue, select, missing_accessible_name {{target}: brak nazwy "
      & "dostępnej} low_contrast {{target}: niski kontrast} "
      & "skipped_heading_level {{target}: pominięty poziom nagłówka} "
      & "missing_form_label {{target}: brak etykiety pola formularza} "
      & "invalid_aria {{target}: nieprawidłowe ARIA} keyboard_trap {{target}: "
      & "pułapka klawiatury} other {{target}: nieznany problem z "
      & "dostępnością}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title} – podsumowanie dostępności: {landmarks, plural, one "
      & "{{landmarks, number} punkt orientacyjny} few {{landmarks, number} "
      & "punkty orientacyjne} many {{landmarks, number} punktów "
      & "orientacyjnych} other {{landmarks, number} punktu orientacyjnego}}, "
      & "{headings, plural, one {{headings, number} nagłówek} few {{headings, "
      & "number} nagłówki} many {{headings, number} nagłówków} other "
      & "{{headings, number} nagłówka}}, {issues, plural, one {{issues, "
      & "number} problem} few {{issues, number} problemy} many {{issues, "
      & "number} problemów} other {{issues, number} problemu}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {dodaj nazwę dostępną} "
      & "low_contrast {zwiększ kontrast tekstu} skipped_heading_level {używaj "
      & "kolejnych poziomów nagłówków} missing_form_label {powiąż "
      & "etykietę z polem formularza} invalid_aria {użyj prawidłowej roli "
      & "lub atrybutu ARIA} keyboard_trap {zapewnij, aby fokus klawiatury "
      & "mógł opuścić komponent} other {sprawdź problem z "
      & "dostępnością}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {brak problemów z dostępnością} one "
      & "{{issues, number} problem z dostępnością} few {{issues, number} "
      & "problemy z dostępnością} many {{issues, number} problemów z "
      & "dostępnością} other {{issues, number} problemu z dostępnością}}");
end Labels_1;
