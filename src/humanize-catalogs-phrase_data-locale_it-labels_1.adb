separate (Humanize.Catalogs.Phrase_Data.Locale_It)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name}: account attivo} "
      & "invited_account {{name}: account invitato} locked_account {{name}: "
      & "account bloccato} suspended_account {{name}: account sospeso} "
      & "deleted_account {{name}: account eliminato} other {{name}: stato "
      & "dell’account sconosciuto}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {account attivo} invited_account "
      & "{account invitato} locked_account {account bloccato} suspended_account "
      & "{account sospeso} deleted_account {account eliminato} other {stato "
      & "dell’account sconosciuto}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {dispositivo attendibile} "
      & "untrusted_device {dispositivo non attendibile} new_device {nuovo "
      & "dispositivo} other {dispositivo bloccato}}");
   P ("label.accounts.last_active_label", "{name}: ultima attività {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: accesso non riuscito} other "
      & "{{name}: accesso riuscito}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA attivata} mfa_disabled {MFA "
      & "disattivata} mfa_required {MFA obbligatoria} other {reimpostazione MFA "
      & "obbligatoria}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: sessione attiva} "
      & "expired_session {{name}: sessione scaduta} revoked_session {{name}: "
      & "sessione revocata} idle_session {{name}: sessione inattiva} other "
      & "{{name}: stato della sessione sconosciuto}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {sessione attiva} expired_session "
      & "{sessione scaduta} revoked_session {sessione revocata} idle_session "
      & "{sessione inattiva} other {stato della sessione sconosciuto}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {nessun allegato} one {1 allegato} many {{count, "
      & "number} di allegati} other {{count, number} allegati}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, one {{name}: 1 allegato} many {{name}: {count, number} "
      & "di allegati} other {{name}: {count, number} allegati}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {file allegato} image_attachment "
      & "{immagine allegata} video_attachment {video allegato} audio_attachment "
      & "{audio allegato} document_attachment {documento allegato} "
      & "archive_attachment {archivio allegato} other {link allegato}}");
   P ("label.attachments.attachment_label",
      "{name}: {kind, select, file_attachment {file} image_attachment "
      & "{immagine} video_attachment {video} audio_attachment {audio} "
      & "document_attachment {documento} archive_attachment {archivio} other "
      & "{link}} {state, select, pending_attachment {in attesa} "
      & "uploading_attachment {in caricamento} uploaded_attachment {{kind, "
      & "select, image_attachment {caricata} other {caricato}}} "
      & "failed_attachment {{kind, select, image_attachment {non riuscita} "
      & "other {non riuscito}}} removed_attachment {{kind, select, "
      & "image_attachment {rimossa} other {rimosso}}} other {{kind, select, "
      & "image_attachment {bloccata} other {bloccato}}}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {allegato in attesa} "
      & "uploading_attachment {allegato in caricamento} uploaded_attachment "
      & "{allegato caricato} failed_attachment {allegato non riuscito} "
      & "removed_attachment {allegato rimosso} other {allegato bloccato}}");
   P ("label.attachments.download_label", "scarica {name}");
   P ("label.attachments.expiring_link_label", "{name}: il link scade {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "anteprima di {name}");
   P ("label.attachments.remove_label", "rimuovi {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: non analizzato} scanning {{name}: "
      & "analisi in corso} safe {{name}: nessuna minaccia} suspicious {{name}: "
      & "sospetto} other {{name}: infetto}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {non analizzato} scanning {analisi in "
      & "corso} safe {nessuna minaccia} suspicious {sospetto} other {infetto}}");
   P ("label.attachments.upload_error_label", "caricamento di {name} non riuscito: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {badge} new_badge {nuovo badge} "
      & "updated_badge {badge aggiornato} deprecated_badge {badge obsoleto} "
      & "selected_badge {badge selezionato} disabled_badge {badge disattivato} "
      & "other {badge ignorabile}} ({tone, select, neutral_tone {neutro} "
      & "info_tone {informazione} success_tone {successo} warning_tone {avviso} "
      & "danger_tone {pericolo} other {attenuato}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {badge priorità bassa} "
      & "medium_priority {badge priorità media} high_priority {badge priorità "
      & "alta} other {badge priorità critica}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {badge predefinito} new_badge {nuovo "
      & "badge} updated_badge {badge aggiornato} deprecated_badge {badge "
      & "obsoleto} selected_badge {badge selezionato} disabled_badge {badge "
      & "disattivato} other {badge ignorabile}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {badge neutro} info_tone {badge "
      & "informativo} success_tone {badge di successo} warning_tone {badge di "
      & "avviso} danger_tone {badge di pericolo} other {badge attenuato}}");
   P ("label.badges.chip_label",
      "{selected, select, false {chip {name}} other {chip {name} "
      & "selezionato}}");
   P ("label.badges.count_badge_label", "{name}: {count, number}");
   P ("label.badges.deprecated_label", "{name}: badge obsoleto (avviso)");
   P ("label.badges.dismiss_label", "ignora {name}");
   P ("label.badges.new_label", "{name}: nuovo badge (informazione)");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {nessun badge nascosto} one {+1 altro badge} "
      & "many {+{hidden_count, number} di altri badge} other {+{hidden_count, "
      & "number} altri badge}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: badge priorità bassa} "
      & "medium_priority {{name}: badge priorità media} high_priority {{name}: "
      & "badge priorità alta} other {{name}: badge priorità critica}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {{name}, stato: neutro} info_tone {{name}, "
      & "stato: informazione} success_tone {{name}, stato: successo} "
      & "warning_tone {{name}, stato: avviso} danger_tone {{name}, stato: "
      & "pericolo} other {{name}, stato: attenuato}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {nessun tag} one {1 tag} many {{count, number} di "
      & "tag} other {{count, number} tag}}");
   P ("label.badges.tag_label", "tag {name}");
   P ("label.badges.updated_label", "{name}: badge aggiornato (successo)");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefatto caricato} "
      & "artifact_missing {artefatto mancante} artifact_expired {artefatto "
      & "scaduto} other {artefatto verificato}}");
   P ("label.builds.benchmark_label", "benchmark {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {{name}: build in coda} build_running "
      & "{{name}: build in corso} build_passed {{name}: build riuscita} "
      & "build_failed {{name}: build non riuscita} snapshot_build {{name}: "
      & "build snapshot} other {{name}: build di rilascio}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {build in coda} build_running {build in "
      & "corso} build_passed {build riuscita} build_failed {build non riuscita} "
      & "snapshot_build {build snapshot} other {build di rilascio}}");
   P ("label.builds.coverage_label", "copertura: {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {controllo di rilascio superato} "
      & "gate_failed {controllo di rilascio non superato} gate_warning {avviso "
      & "del controllo di rilascio} other {controllo di rilascio bloccato}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {nessun test superato} "
      & "one {1 test superato} many {{count, number} di test superati} other "
      & "{{count, number} test superati}}} failed_test {{count, plural, =0 "
      & "{nessun test non riuscito} one {1 test non riuscito} many {{count, "
      & "number} di test non riusciti} other {{count, number} test non "
      & "riusciti}}} skipped_test {{count, plural, =0 {nessun test saltato} one "
      & "{1 test saltato} many {{count, number} di test saltati} other {{count, "
      & "number} test saltati}}} flaky_test {{count, plural, =0 {nessun test "
      & "instabile} one {1 test instabile} many {{count, number} di test "
      & "instabili} other {{count, number} test instabili}}} other {{count, "
      & "plural, =0 {nessun errore previsto} one {1 test con errore previsto} "
      & "many {{count, number} di test con errore previsto} other {{count, "
      & "number} test con errore previsto}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {superato} failed_test {non riuscito} "
      & "skipped_test {saltato} flaky_test {instabile} other {errore previsto}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name}: "
      & "disattivato (nessuna modifica)} other {{field_name}: da disattivato ad "
      & "attivato}}} other {{new_value, select, false {{field_name}: da "
      & "attivato a disattivato} other {{field_name}: attivato (nessuna "
      & "modifica)}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {aggiunto} removed_change {rimosso} "
      & "modified_change {modificato} renamed_change {rinominato} "
      & "unchanged_change {invariato} metadata_change {metadati modificati} "
      & "moved_change {spostato} conflict_change {conflitto} other {modifica "
      & "sconosciuta}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {modifica informativa} "
      & "minor_change {modifica minore} major_change {modifica importante} "
      & "other {modifica incompatibile}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}: nessuna "
      & "modifica} other {{unchanged, plural, =0 {{field_name}: +{added, "
      & "number}} other {{field_name}: +{added, number}, {unchanged, number} "
      & "invariati}}}}} other {{added, plural, =0 {{unchanged, plural, =0 "
      & "{{field_name}: -{removed, number}} other {{field_name}: -{removed, "
      & "number}, {unchanged, number} invariati}}} other {{unchanged, plural, "
      & "=0 {{field_name}: +{added, number}, -{removed, number}} other "
      & "{{field_name}: +{added, number}, -{removed, number}, {unchanged, "
      & "number} invariati}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {nessun conflitto} one {1 conflitto} many {{count, "
      & "number} di conflitti} other {{count, number} conflitti}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name}: da {old_label} a {new_label} "
      & "(posticipato)} other {{field_name}: da {old_label} a {new_label} "
      & "(anticipato)}}");
   P ("label.changes.duration_field_change_label", "{field_name}: da {old_label} a {new_label}");
   P ("label.changes.field_change_label", "{field_name}: da {old_value} a {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name}: aggiunto} removed_change {{name}: "
      & "rimosso} modified_change {{name}: modificato} renamed_change {{name}: "
      & "rinominato} unchanged_change {{name}: invariato} metadata_change "
      & "{{name}: metadati modificati} moved_change {{name}: spostato} "
      & "conflict_change {{name}: conflitto} other {{name}: modifica "
      & "sconosciuta}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {sono cambiati solo i metadati} one {è cambiato "
      & "solo 1 campo di metadati} many {sono cambiati solo {count, number} di "
      & "campi di metadati} other {sono cambiati solo {count, number} campi di "
      & "metadati}}");
   P ("label.changes.move_label", "{name}: spostato da {from} a {to}");
   P ("label.changes.no_changes_label", "nessuna modifica");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {nessuna riga "
      & "modificata} one {1 riga aggiunta} many {{lines_added, number} di righe "
      & "aggiunte} other {{lines_added, number} righe aggiunte}}} one "
      & "{{lines_added, plural, =0 {1 riga rimossa} one {1 riga aggiunta, 1 "
      & "riga rimossa} many {{lines_added, number} di righe aggiunte, 1 riga "
      & "rimossa} other {{lines_added, number} righe aggiunte, 1 riga "
      & "rimossa}}} many {{lines_added, plural, =0 {{lines_removed, number} di "
      & "righe rimosse} one {1 riga aggiunta, {lines_removed, number} di righe "
      & "rimosse} many {{lines_added, number} di righe aggiunte, "
      & "{lines_removed, number} di righe rimosse} other {{lines_added, number} "
      & "righe aggiunte, {lines_removed, number} di righe rimosse}}} other "
      & "{{lines_added, plural, =0 {{lines_removed, number} righe rimosse} one "
      & "{1 riga aggiunta, {lines_removed, number} righe rimosse} many "
      & "{{lines_added, number} di righe aggiunte, {lines_removed, number} "
      & "righe rimosse} other {{lines_added, number} righe aggiunte, "
      & "{lines_removed, number} righe rimosse}}}}");
   P ("label.changes.rename_label", "rinominato da {old_name} a {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} ha scritto una bozza di "
      & "commento} published_comment {{author} ha commentato} edited_comment "
      & "{{author} ha modificato un commento} deleted_comment {{author} ha "
      & "eliminato un commento} resolved_comment {{author} ha risolto un "
      & "commento} unresolved_comment {{author} ha riaperto un commento} "
      & "pinned_comment {{author} ha fissato un commento} other {{author} ha "
      & "nascosto un commento}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {nessun commento} one {1 commento} many {{count, "
      & "number} di commenti} other {{count, number} commenti}}");
   P ("label.comments.comment_label",
      "commento di {author} ({state, select, draft_comment {bozza} "
      & "published_comment {pubblicato} edited_comment {modificato} "
      & "deleted_comment {eliminato} resolved_comment {risolto} "
      & "unresolved_comment {non risolto} pinned_comment {fissato} other "
      & "{nascosto}})");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {bozza di commento} published_comment "
      & "{commento pubblicato} edited_comment {commento modificato} "
      & "deleted_comment {commento eliminato} resolved_comment {commento "
      & "risolto} unresolved_comment {commento non risolto} pinned_comment "
      & "{commento fissato} other {commento nascosto}}");
   P ("label.comments.deleted_label", "{author} ha eliminato un commento");
   P ("label.comments.edited_label", "modificato {time_text}");
   P ("label.comments.hide_comment_label", "nascondi commento: {reason}");
   P ("label.comments.lock_thread_label", "blocca la discussione {name}");
   P ("label.comments.mention_label", "{actor} ha menzionato {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {nessun partecipante} one {1 partecipante} many "
      & "{{count, number} di partecipanti} other {{count, number} "
      & "partecipanti}}");
   P ("label.comments.pin_label", "fissa {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reazione «mi piace»} dislike_reaction "
      & "{reazione «non mi piace»} heart_reaction {reazione cuore} "
      & "laugh_reaction {reazione risata} confused_reaction {reazione confusa} "
      & "hooray_reaction {reazione festa} rocket_reaction {reazione razzo} "
      & "other {reazione occhi}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {nessun «mi piace»} "
      & "one {1 «mi piace»} other {{count, number} «mi piace»}}} "
      & "dislike_reaction {{count, plural, =0 {nessun «non mi piace»} one {1 "
      & "«non mi piace»} other {{count, number} «non mi piace»}}} "
      & "heart_reaction {{count, plural, =0 {nessun cuore} one {1 cuore} many "
      & "{{count, number} di cuori} other {{count, number} cuori}}} "
      & "laugh_reaction {{count, plural, =0 {nessuna risata} one {1 risata} "
      & "many {{count, number} di risate} other {{count, number} risate}}} "
      & "confused_reaction {{count, plural, =0 {nessuna reazione confusa} one "
      & "{1 reazione confusa} many {{count, number} di reazioni confuse} other "
      & "{{count, number} reazioni confuse}}} hooray_reaction {{count, plural, "
      & "=0 {nessuna reazione festa} one {1 reazione festa} many {{count, "
      & "number} di reazioni festa} other {{count, number} reazioni festa}}} "
      & "rocket_reaction {{count, plural, =0 {nessun razzo} one {1 razzo} many "
      & "{{count, number} di razzi} other {{count, number} razzi}}} other "
      & "{{count, plural, =0 {nessuna reazione occhi} one {1 reazione occhi} "
      & "many {{count, number} di reazioni occhi} other {{count, number} "
      & "reazioni occhi}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {nessuna risposta} one {1 risposta} many {{count, "
      & "number} di risposte} other {{count, number} risposte}}");
   P ("label.comments.resolved_label", "{name}: risolto");
   P ("label.comments.subscribe_label", "iscriviti a {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {nessuna discussione} one {1 discussione} many "
      & "{{count, number} di discussioni} other {{count, number} discussioni}}");
   P ("label.comments.thread_label",
      "{name}: discussione {state, select, open_thread {aperta} "
      & "resolved_thread {risolta} locked_thread {bloccata} other "
      & "{archiviata}}{count, plural, =0 {} one {, 1 commento} many {, {count, "
      & "number} di commenti} other {, {count, number} commenti}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {discussione aperta} resolved_thread "
      & "{discussione risolta} locked_thread {discussione bloccata} other "
      & "{discussione archiviata}}");
   P ("label.comments.unpin_label", "non fissare più {name}");
   P ("label.comments.unsubscribe_label", "annulla l’iscrizione a {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name}: migliorato} regressed {{name}: "
      & "peggiorato} unchanged {{name}: invariato} within_tolerance {{name}: "
      & "entro la tolleranza} outside_tolerance {{name}: fuori tolleranza} "
      & "new_value {{name}: nuovo} removed_value {{name}: rimosso} other "
      & "{{name}: riferimento non disponibile}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {migliorato} regressed {peggiorato} "
      & "unchanged {invariato} within_tolerance {entro la tolleranza} "
      & "outside_tolerance {fuori tolleranza} new_value {nuovo} removed_value "
      & "{rimosso} other {riferimento non disponibile}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name}: miglioramento di {difference_text}} "
      & "regressed {{name}: peggioramento di {difference_text}} unchanged "
      & "{{name}: invariato ({difference_text})} within_tolerance {{name}: "
      & "entro la tolleranza ({difference_text})} outside_tolerance {{name}: "
      & "fuori tolleranza ({difference_text})} new_value {{name}: nuovo "
      & "({difference_text})} removed_value {{name}: rimosso "
      & "({difference_text})} other {{name}: riferimento non disponibile "
      & "({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name}: miglioramento di {difference_text}, "
      & "tolleranza {tolerance_text}} regressed {{name}: peggioramento di "
      & "{difference_text}, tolleranza {tolerance_text}} unchanged {{name}: "
      & "invariato ({difference_text}), tolleranza {tolerance_text}} "
      & "within_tolerance {{name}: entro la tolleranza ({difference_text}), "
      & "tolleranza {tolerance_text}} outside_tolerance {{name}: fuori "
      & "tolleranza ({difference_text}), tolleranza {tolerance_text}} new_value "
      & "{{name}: nuovo ({difference_text}), tolleranza {tolerance_text}} "
      & "removed_value {{name}: rimosso ({difference_text}), tolleranza "
      & "{tolerance_text}} other {{name}: riferimento non disponibile "
      & "({difference_text}), tolleranza {tolerance_text}}}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {riga non valida} duplicate_record {record "
      & "duplicato} missing_column {colonna mancante} unknown_field {campo "
      & "sconosciuto} schema_mismatch {schema non corrispondente} other {record "
      & "saltato}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {simulazione riuscita} dry_run_failed "
      & "{simulazione non riuscita} import_valid {importazione valida} "
      & "import_invalid {importazione non valida} other {importazione "
      & "parziale}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {simulazione riuscita} "
      & "dry_run_failed {simulazione non riuscita} import_valid {importazione "
      & "valida} import_invalid {importazione non valida} other {importazione "
      & "parziale}} (accettati: {accepted, number}, rifiutati: {rejected, "
      & "number})");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {nessuna riga non "
      & "valida} one {1 riga non valida} many {{count, number} di righe non "
      & "valide} other {{count, number} righe non valide}}} duplicate_record "
      & "{{count, plural, =0 {nessun record duplicato} one {1 record duplicato} "
      & "many {{count, number} di record duplicati} other {{count, number} "
      & "record duplicati}}} missing_column {{count, plural, =0 {nessuna "
      & "colonna mancante} one {1 colonna mancante} many {{count, number} di "
      & "colonne mancanti} other {{count, number} colonne mancanti}}} "
      & "unknown_field {{count, plural, =0 {nessun campo sconosciuto} one {1 "
      & "campo sconosciuto} many {{count, number} di campi sconosciuti} other "
      & "{{count, number} campi sconosciuti}}} schema_mismatch {{count, plural, "
      & "=0 {nessuna incongruenza di schema} one {1 incongruenza di schema} "
      & "many {{count, number} di incongruenze di schema} other {{count, "
      & "number} incongruenze di schema}}} other {{count, plural, =0 {nessun "
      & "record saltato} one {1 record saltato} many {{count, number} di record "
      & "saltati} other {{count, number} record saltati}}}}");
   P ("label.data_quality.row_issue_label",
      "riga {row, number}: {issue, select, invalid_row {non valida} "
      & "duplicate_record {record duplicato} missing_column {colonna mancante} "
      & "unknown_field {campo sconosciuto} schema_mismatch {schema non "
      & "corrispondente} other {record saltato}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {riga non valida} "
      & "duplicate_record {record duplicato} missing_column {colonna mancante} "
      & "unknown_field {campo sconosciuto} schema_mismatch {schema non "
      & "corrispondente} other {record saltato}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefatto pronto} artifact_uploaded "
      & "{artefatto caricato} artifact_signed {artefatto firmato} "
      & "artifact_missing {artefatto mancante} other {artefatto scaduto}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {deployment di {name} su "
      & "{environment} in coda} deploying {deployment di {name} su "
      & "{environment} in corso} deployed {deployment di {name} su "
      & "{environment} completato} failed_deployment {deployment di {name} su "
      & "{environment} non riuscito} rolled_back {rollback di {name} su "
      & "{environment} completato} blocked_deployment {deployment di {name} su "
      & "{environment} bloccato} other {deployment di {name} su {environment} "
      & "annullato}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {deployment in coda} deploying "
      & "{deployment in corso} deployed {deployment completato} "
      & "failed_deployment {deployment non riuscito} rolled_back {rollback "
      & "completato} blocked_deployment {deployment bloccato} other {deployment "
      & "annullato}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {ambiente integro} "
      & "drifting_environment {deriva dell’ambiente} locked_environment "
      & "{ambiente bloccato} maintenance_environment {ambiente in manutenzione} "
      & "other {stato dell’ambiente sconosciuto}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {nessuna migrazione} migration_pending "
      & "{migrazione in attesa} migrating {migrazione in corso} "
      & "migration_complete {migrazione completata} other {migrazione non "
      & "riuscita}}");
   P ("label.deployments.promotion_label", "{name} promosso da {from_environment} a {to_environment}");
   P ("label.deployments.rollback_label", "rollback di {name} a {target}");
   P ("label.deployments.rollout_label", "rilascio graduale di {name}: {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {nessun elemento interessato} one {{count, number} "
      & "elemento interessato} many {{count, number} di elementi interessati} "
      & "other {{count, number} elementi interessati}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {superato} failed_check {non "
      & "superato} warning_check {con avvisi} skipped_check {saltato} "
      & "pending_check {in attesa} other {in corso}} ({duration_s, plural, one "
      & "{{duration_s, number} secondo} many {{duration_s, number} di secondi} "
      & "other {{duration_s, number} secondi}})");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {superato} failed_check {non "
      & "superato} warning_check {con avvisi} skipped_check {saltato} "
      & "pending_check {in attesa} other {in corso}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {superato} failed_check {non superato} "
      & "warning_check {con avvisi} skipped_check {saltato} pending_check {in "
      & "attesa} other {in corso}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{kind, select, expected_value {previsto un "
      & "valore per {subject}} expected_unit {prevista un’unità per "
      & "{subject}} invalid_range {intervallo non valido per {subject}} "
      & "end_before_start {fine dell’intervallo precedente all’inizio per "
      & "{subject}} unknown_field {campo sconosciuto per {subject}} "
      & "unsafe_redacted_value {valore non sicuro oscurato per {subject}} "
      & "unsupported_syntax {sintassi non supportata per {subject}} other "
      & "{spiegazione della diagnostica per {subject}}}; usa {suggestion}} "
      & "other {{kind, select, expected_value {previsto un valore per {subject} "
      & "alla posizione {position, number}} expected_unit {prevista un’unità "
      & "per {subject} alla posizione {position, number}} invalid_range "
      & "{intervallo non valido per {subject} alla posizione {position, "
      & "number}} end_before_start {fine dell’intervallo precedente "
      & "all’inizio per {subject} alla posizione {position, number}} "
      & "unknown_field {campo sconosciuto per {subject} alla posizione "
      & "{position, number}} unsafe_redacted_value {valore non sicuro oscurato "
      & "per {subject} alla posizione {position, number}} unsupported_syntax "
      & "{sintassi non supportata per {subject} alla posizione {position, "
      & "number}} other {spiegazione della diagnostica per {subject} alla "
      & "posizione {position, number}}}; usa {suggestion}}}");
   P ("label.diagnostics.diagnostic_label",
      "{line, plural, =0 {{severity, select, info_severity {info in {path}: "
      & "{message}} notice_severity {nota in {path}: {message}} "
      & "warning_severity {avviso in {path}: {message}} error_severity {errore "
      & "in {path}: {message}} critical_severity {critico in {path}: {message}} "
      & "other {bloccante in {path}: {message}}}} other {{severity, select, "
      & "info_severity {info in {path}, riga {line, number}: {message}} "
      & "notice_severity {nota in {path}, riga {line, number}: {message}} "
      & "warning_severity {avviso in {path}, riga {line, number}: {message}} "
      & "error_severity {errore in {path}, riga {line, number}: {message}} "
      & "critical_severity {critico in {path}, riga {line, number}: {message}} "
      & "other {bloccante in {path}, riga {line, number}: {message}}}}}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {errore in {path}} other {{column, plural, =0 "
      & "{errore in {path}, riga {line, number}} other {errore in {path}, riga "
      & "{line, number}, colonna {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {info in {field_name}: {message}} "
      & "notice_severity {nota in {field_name}: {message}} warning_severity "
      & "{avviso in {field_name}: {message}} error_severity {errore in "
      & "{field_name}: {message}} critical_severity {critico in {field_name}: "
      & "{message}} other {bloccante in {field_name}: {message}}}");
   P ("label.diagnostics.first_failure_label",
      "{line, plural, =0 {primo errore in {check_name}: {path}} other {primo "
      & "errore in {check_name}: {path}, riga {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{nessun problema} other {{notices, plural, one {{notices, number} "
      & "nota} many {{notices, number} di note} other {{notices, number} "
      & "note}}}}} other {{notices, plural, =0 {{warnings, plural, one "
      & "{{warnings, number} avviso} many {{warnings, number} di avvisi} other "
      & "{{warnings, number} avvisi}}} other {{warnings, plural, one "
      & "{{warnings, number} avviso} many {{warnings, number} di avvisi} other "
      & "{{warnings, number} avvisi}}, {notices, plural, one {{notices, number} "
      & "nota} many {{notices, number} di note} other {{notices, number} "
      & "note}}}}}}} other {{warnings, plural, =0 {{notices, plural, =0 "
      & "{{errors, plural, one {{errors, number} errore} many {{errors, number} "
      & "di errori} other {{errors, number} errori}}} other {{errors, plural, "
      & "one {{errors, number} errore} many {{errors, number} di errori} other "
      & "{{errors, number} errori}}, {notices, plural, one {{notices, number} "
      & "nota} many {{notices, number} di note} other {{notices, number} "
      & "note}}}}} other {{notices, plural, =0 {{errors, plural, one {{errors, "
      & "number} errore} many {{errors, number} di errori} other {{errors, "
      & "number} errori}}, {warnings, plural, one {{warnings, number} avviso} "
      & "many {{warnings, number} di avvisi} other {{warnings, number} "
      & "avvisi}}} other {{errors, plural, one {{errors, number} errore} many "
      & "{{errors, number} di errori} other {{errors, number} errori}}, "
      & "{warnings, plural, one {{warnings, number} avviso} many {{warnings, "
      & "number} di avvisi} other {{warnings, number} avvisi}}, {notices, "
      & "plural, one {{notices, number} nota} many {{notices, number} di note} "
      & "other {{notices, number} note}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, riga "
      & "{line, number}} other {{path}, riga {line, number}, colonna {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{position, plural, =0 {{family, select, byte_parser {sintassi non "
      & "supportata (parser delle dimensioni): {error}; usa B, kB, MB, GB, KiB, "
      & "MiB, GiB o TiB} duration_parser {sintassi non supportata (parser delle "
      & "durate): {error}; usa ms, s, min, h, d, w, month o year} "
      & "date_time_parser {sintassi non supportata (parser di date e ore): "
      & "{error}; usa una data ISO, un giorno in linguaggio naturale o un "
      & "orario} color_parser {sintassi non supportata (parser dei colori): "
      & "{error}; usa hex, rgb(), hsl(), lab(), lch() o un nome di colore} "
      & "url_parser {sintassi non supportata (parser degli URL): {error}; usa "
      & "schema, host, percorso, query o frammento} unit_parser {sintassi non "
      & "supportata (parser delle unità): {error}; usa un’unità supportata "
      & "da Humanize} recurrence_parser {sintassi non supportata (parser delle "
      & "ricorrenze): {error}; usa cron o una ricorrenza every/weekday} "
      & "domain_label_parser {sintassi non supportata (parser delle etichette "
      & "di dominio): {error}; usa un’etichetta di dominio deterministica di "
      & "Humanize} other {sintassi non supportata (parser): {error}; usa un "
      & "formato di input supportato}}} other {{family, select, byte_parser "
      & "{sintassi non supportata (parser delle dimensioni): {error} alla "
      & "posizione {position, number}; usa B, kB, MB, GB, KiB, MiB, GiB o TiB} "
      & "duration_parser {sintassi non supportata (parser delle durate): "
      & "{error} alla posizione {position, number}; usa ms, s, min, h, d, w, "
      & "month o year} date_time_parser {sintassi non supportata (parser di "
      & "date e ore): {error} alla posizione {position, number}; usa una data "
      & "ISO, un giorno in linguaggio naturale o un orario} color_parser "
      & "{sintassi non supportata (parser dei colori): {error} alla posizione "
      & "{position, number}; usa hex, rgb(), hsl(), lab(), lch() o un nome di "
      & "colore} url_parser {sintassi non supportata (parser degli URL): "
      & "{error} alla posizione {position, number}; usa schema, host, percorso, "
      & "query o frammento} unit_parser {sintassi non supportata (parser delle "
      & "unità): {error} alla posizione {position, number}; usa un’unità "
      & "supportata da Humanize} recurrence_parser {sintassi non supportata "
      & "(parser delle ricorrenze): {error} alla posizione {position, number}; "
      & "usa cron o una ricorrenza every/weekday} domain_label_parser {sintassi "
      & "non supportata (parser delle etichette di dominio): {error} alla "
      & "posizione {position, number}; usa un’etichetta di dominio "
      & "deterministica di Humanize} other {sintassi non supportata (parser): "
      & "{error} alla posizione {position, number}; usa un formato di input "
      & "supportato}}}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {superato} failed_check {non superato} "
      & "warning_check {con avvisi} skipped_check {saltato} pending_check {in "
      & "attesa} other {in corso}}{notices, plural, =0 {, nessuna nota} one {, "
      & "{notices, number} nota} many {, {notices, number} di note} other {, "
      & "{notices, number} note}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {nuovo tentativo 1 di 1} "
      & "other {nuovo tentativo {attempt, number} di 1: limite superato}}} "
      & "other {nuovo tentativo {attempt, number} di {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {info} notice_severity {nota} "
      & "warning_severity {avviso} error_severity {errore} critical_severity "
      & "{critico} other {bloccante}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {diagnostiche di build} test_source "
      & "{diagnostiche dei test} lint_source {diagnostiche di lint} "
      & "import_source {diagnostiche di importazione} validation_source "
      & "{diagnostiche di convalida} runtime_source {diagnostiche di runtime} "
      & "security_source {diagnostiche di sicurezza} other {diagnostiche}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {{source, select, build_source {{count, number} "
      & "diagnostica di build} test_source {{count, number} diagnostica dei "
      & "test} lint_source {{count, number} diagnostica di lint} import_source "
      & "{{count, number} diagnostica di importazione} validation_source "
      & "{{count, number} diagnostica di convalida} runtime_source {{count, "
      & "number} diagnostica di runtime} security_source {{count, number} "
      & "diagnostica di sicurezza} other {{count, number} diagnostica}}} many "
      & "{{source, select, build_source {{count, number} di diagnostiche di "
      & "build} test_source {{count, number} di diagnostiche dei test} "
      & "lint_source {{count, number} di diagnostiche di lint} import_source "
      & "{{count, number} di diagnostiche di importazione} validation_source "
      & "{{count, number} di diagnostiche di convalida} runtime_source {{count, "
      & "number} di diagnostiche di runtime} security_source {{count, number} "
      & "di diagnostiche di sicurezza} other {{count, number} di "
      & "diagnostiche}}} other {{source, select, build_source {{count, number} "
      & "diagnostiche di build} test_source {{count, number} diagnostiche dei "
      & "test} lint_source {{count, number} diagnostiche di lint} import_source "
      & "{{count, number} diagnostiche di importazione} validation_source "
      & "{{count, number} diagnostiche di convalida} runtime_source {{count, "
      & "number} diagnostiche di runtime} security_source {{count, number} "
      & "diagnostiche di sicurezza} other {{count, number} diagnostiche}}}}");
   P ("label.diagnostics.suggested_action_label", "passaggio successivo: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {nome di dominio} ipv4_host {indirizzo "
      & "IPv4} ipv6_host {indirizzo IPv6} localhost_host {host locale} "
      & "private_network_host {indirizzo di rete privata} other {host "
      & "sconosciuto}}");
   P ("label.events.all_day_label", "{name} (tutto il giorno)");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {nessuna risposta} accepted {accettato} "
      & "declined {rifiutato} maybe {forse} other {in lista d’attesa}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {nessun partecipante} one {{count, number} "
      & "partecipante} many {{count, number} di partecipanti} other {{count, "
      & "number} partecipanti}}");
   P ("label.events.canceled_label", "{name}: annullato");
   P ("label.events.check_in_label", "check-in per {name}");
   P ("label.events.conference_link_label", "link della videoconferenza di {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {nessun evento} one {{count, number} evento} many "
      & "{{count, number} di eventi} other {{count, number} eventi}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {evento programmato} "
      & "tentative_event {evento provvisorio} in_progress_event {evento in "
      & "corso} completed_event {evento concluso} canceled_event {evento "
      & "annullato} other {evento rinviato}}");
   P ("label.events.event_location_label", "{name} a {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {evento programmato} tentative_event "
      & "{evento provvisorio} in_progress_event {evento in corso} "
      & "completed_event {evento concluso} canceled_event {evento annullato} "
      & "other {evento rinviato}}");
   P ("label.events.event_time_label", "{name}: {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {evento pubblico} private_event "
      & "{evento privato} busy_event {occupato} other {disponibile}}");
   P ("label.events.organizer_label", "organizzato da {name}");
   P ("label.events.rsvp_label",
      "risposta: {state, select, not_responded {in attesa} accepted "
      & "{accettata} declined {rifiutata} maybe {forse} other {lista "
      & "d’attesa}}");
   P ("label.events.reminder_label", "promemoria: {time_text}");
   P ("label.events.rescheduled_label", "{name} riprogrammato: {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {{used, number} carattere} many {{used, number} di "
      & "caratteri} other {{used, number} caratteri}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {nessun limite di caratteri} one {{limit, number} "
      & "carattere al massimo} many {{limit, number} di caratteri al massimo} "
      & "other {{limit, number} caratteri al massimo}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {{used, number} carattere} many "
      & "{{used, number} di caratteri} other {{used, number} caratteri}}} other "
      & "{{used, number} di {limit, plural, one {{limit, number} carattere} "
      & "many {{limit, number} di caratteri} other {{limit, number} "
      & "caratteri}}}}");
   P ("label.forms.field_label",
      "{name}: {required, select, false {campo facoltativo} other {campo "
      & "obbligatorio}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {valido} invalid_input {non "
      & "valido} required_input {obbligatorio} optional_input {facoltativo} "
      & "disabled_input {disattivato} other {di sola lettura}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {nessun problema nel "
      & "modulo} other {{warnings, plural, one {{warnings, number} avviso} many "
      & "{{warnings, number} di avvisi} other {{warnings, number} avvisi}}}}} "
      & "other {{warnings, plural, =0 {{errors, plural, one {{errors, number} "
      & "errore} many {{errors, number} di errori} other {{errors, number} "
      & "errori}}} other {{errors, plural, one {{errors, number} errore} many "
      & "{{errors, number} di errori} other {{errors, number} errori}}, "
      & "{warnings, plural, one {{warnings, number} avviso} many {{warnings, "
      & "number} di avvisi} other {{warnings, number} avvisi}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {non modificato} editing_form {modifica "
      & "in corso} dirty_form {modifiche non salvate} saving_form {salvataggio} "
      & "saved_form {salvato} submitted_form {inviato} other {invio non "
      & "riuscito}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {input valido} invalid_input {input non "
      & "valido} required_input {input obbligatorio} optional_input {input "
      & "facoltativo} disabled_input {input disattivato} other {input di sola "
      & "lettura}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {non modificato} editing_form {modifica "
      & "in corso} dirty_form {modifiche non salvate} saving_form {salvataggio "
      & "del modulo} saved_form {modulo salvato} submitted_form {modulo "
      & "inviato} other {{errors, plural, =0 {invio non riuscito} other {invio "
      & "non riuscito ({errors, plural, one {{errors, number} errore} many "
      & "{{errors, number} di errori} other {{errors, number} errori}})}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {nessuna modifica non salvata} one {{count, number} "
      & "modifica non salvata} many {{count, number} di modifiche non salvate} "
      & "other {{count, number} modifiche non salvate}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {nome accessibile "
      & "mancante} low_contrast {contrasto insufficiente} skipped_heading_level "
      & "{livello di intestazione saltato} missing_form_label {etichetta del "
      & "modulo mancante} invalid_aria {ARIA non valido} keyboard_trap "
      & "{trappola per la tastiera} other {problema di accessibilità "
      & "sconosciuto}}");
   P ("label.markup.accessibility_page_summary_label",
      "riepilogo accessibilità di {title}: {landmarks, plural, one "
      & "{{landmarks, number} punto di riferimento} many {{landmarks, number} "
      & "di punti di riferimento} other {{landmarks, number} punti di "
      & "riferimento}}, {headings, plural, one {{headings, number} "
      & "intestazione} many {{headings, number} di intestazioni} other "
      & "{{headings, number} intestazioni}}, {issues, plural, one {{issues, "
      & "number} problema} many {{issues, number} di problemi} other {{issues, "
      & "number} problemi}}");
end Labels_1;
