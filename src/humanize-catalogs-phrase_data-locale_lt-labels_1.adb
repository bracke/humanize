separate (Humanize.Catalogs.Phrase_Data.Locale_Lt)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {paskyra {name}: aktyvi} "
      & "invited_account {paskyra {name}: pakviesta} locked_account {paskyra "
      & "{name}: užrakinta} suspended_account {paskyra {name}: sustabdyta} "
      & "deleted_account {paskyra {name}: ištrinta} other {paskyra {name}: "
      & "būsena nežinoma}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {aktyvi paskyra} invited_account "
      & "{pakviesta paskyra} locked_account {užrakinta paskyra} "
      & "suspended_account {sustabdyta paskyra} deleted_account {ištrinta "
      & "paskyra} other {nežinoma paskyros būsena}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {patikimas įrenginys} untrusted_device "
      & "{nepatikimas įrenginys} new_device {naujas įrenginys} other "
      & "{užblokuotas įrenginys}}");
   P ("label.accounts.last_active_label", "{name}: paskutinis aktyvumas {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: prisijungti nepavyko} other "
      & "{{name}: prisijungta sėkmingai}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA įjungta} mfa_disabled {MFA "
      & "išjungta} mfa_required {MFA privaloma} other {reikia iš naujo "
      & "nustatyti MFA}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: aktyvus seansas} "
      & "expired_session {{name}: seansas baigėsi} revoked_session {{name}: "
      & "seansas atšauktas} idle_session {{name}: neveiklus seansas} other "
      & "{{name}: seanso būsena nežinoma}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {aktyvus seansas} expired_session "
      & "{seansas baigėsi} revoked_session {seansas atšauktas} idle_session "
      & "{neveiklus seansas} other {seanso būsena nežinoma}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {priedų nėra} one {{count, number} priedas} few "
      & "{{count, number} priedai} many {{count, number} priedo} other {{count, "
      & "number} priedų}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, =0 {{name}: priedų nėra} one {{name}: {count, "
      & "number} priedas} few {{name}: {count, number} priedai} many {{name}: "
      & "{count, number} priedo} other {{name}: {count, number} priedų}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {failo priedas} image_attachment "
      & "{paveikslėlio priedas} video_attachment {vaizdo įrašo priedas} "
      & "audio_attachment {garso įrašo priedas} document_attachment "
      & "{dokumento priedas} archive_attachment {archyvo priedas} other "
      & "{nuorodos priedas}}");
   P ("label.attachments.attachment_label",
      "{kind, select, file_attachment {failas} image_attachment "
      & "{paveikslėlis} video_attachment {vaizdo įrašas} audio_attachment "
      & "{garso įrašas} document_attachment {dokumentas} archive_attachment "
      & "{archyvas} other {nuoroda}} {name}: {state, select, pending_attachment "
      & "{laukia įkėlimo} uploading_attachment {įkeliama} "
      & "uploaded_attachment {įkelta} failed_attachment {įkelti nepavyko} "
      & "removed_attachment {pašalinta} other {užblokuota}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {priedas laukia įkėlimo} "
      & "uploading_attachment {priedas įkeliamas} uploaded_attachment {priedas "
      & "įkeltas} failed_attachment {priedo įkelti nepavyko} "
      & "removed_attachment {priedas pašalintas} other {priedas užblokuotas}}");
   P ("label.attachments.download_label", "atsisiųsti {name}");
   P ("label.attachments.expiring_link_label", "{name}: nuoroda nustos galioti {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "peržiūrėti {name}");
   P ("label.attachments.remove_label", "pašalinti {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: nenuskenuota} scanning {{name}: "
      & "skenuojama} safe {{name}: skenavimas – saugu} suspicious {{name}: "
      & "skenavimas – įtartina} other {{name}: skenavimas – užkrėsta}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {nenuskenuota} scanning {skenuojama} safe "
      & "{skenavimas: saugu} suspicious {skenavimas: įtartina} other "
      & "{skenavimas: užkrėsta}}");
   P ("label.attachments.upload_error_label", "nepavyko įkelti {name}: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {numatytasis ženklelis} "
      & "new_badge {naujas ženklelis} updated_badge {atnaujintas ženklelis} "
      & "deprecated_badge {pasenęs ženklelis} selected_badge {pasirinktas "
      & "ženklelis} disabled_badge {išjungtas ženklelis} other {uždaromas "
      & "ženklelis}}, tonas: {tone, select, neutral_tone {neutralus} info_tone "
      & "{informacija} success_tone {sėkmė} warning_tone {įspėjimas} "
      & "danger_tone {pavojus} other {prislopintas}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {žemo prioriteto ženklelis} "
      & "medium_priority {vidutinio prioriteto ženklelis} high_priority "
      & "{aukšto prioriteto ženklelis} other {kritinio prioriteto "
      & "ženklelis}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {numatytasis ženklelis} new_badge "
      & "{naujas ženklelis} updated_badge {atnaujintas ženklelis} "
      & "deprecated_badge {pasenęs ženklelis} selected_badge {pasirinktas "
      & "ženklelis} disabled_badge {išjungtas ženklelis} other {uždaromas "
      & "ženklelis}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {neutralus ženklelis} info_tone "
      & "{informacinis ženklelis} success_tone {sėkmės ženklelis} "
      & "warning_tone {įspėjimo ženklelis} danger_tone {pavojaus ženklelis} "
      & "other {prislopintas ženklelis}}");
   P ("label.badges.chip_label",
      "{selected, select, false {{name}: žetonas} other {{name}: žetonas, "
      & "pasirinktas}}");
   P ("label.badges.count_badge_label", "{count, plural, =0 {{name}: nėra} other {{name}: {count, number}}}");
   P ("label.badges.deprecated_label", "{name}: nebepalaikoma");
   P ("label.badges.dismiss_label", "uždaryti {name}");
   P ("label.badges.new_label", "{name}: nauja");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {paslėptų ženklelių nėra} one {dar "
      & "+{hidden_count, number} ženklelis} few {dar +{hidden_count, number} "
      & "ženkleliai} many {dar +{hidden_count, number} ženklelio} other {dar "
      & "+{hidden_count, number} ženklelių}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: žemo prioriteto ženklelis} "
      & "medium_priority {{name}: vidutinio prioriteto ženklelis} "
      & "high_priority {{name}: aukšto prioriteto ženklelis} other {{name}: "
      & "kritinio prioriteto ženklelis}}");
   P ("label.badges.status_badge_label",
      "būsena {name}, tonas: {tone, select, neutral_tone {neutralus} "
      & "info_tone {informacija} success_tone {sėkmė} warning_tone "
      & "{įspėjimas} danger_tone {pavojus} other {prislopintas}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {žymų nėra} one {{count, number} žyma} few "
      & "{{count, number} žymos} many {{count, number} žymos} other {{count, "
      & "number} žymų}}");
   P ("label.badges.tag_label", "žyma {name}");
   P ("label.badges.updated_label", "{name}: atnaujinta");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefaktas įkeltas} "
      & "artifact_missing {artefakto nėra} artifact_expired {artefakto "
      & "galiojimas baigėsi} other {artefaktas patikrintas}}");
   P ("label.builds.benchmark_label", "našumo testas {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {surinkimas {name} eilėje} build_running "
      & "{surinkimas {name} vykdomas} build_passed {surinkimas {name} "
      & "sėkmingas} build_failed {surinkimas {name} nepavyko} snapshot_build "
      & "{{name}: tarpinis surinkimas} other {{name}: laidos surinkimas}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {surinkimas eilėje} build_running "
      & "{surinkimas vykdomas} build_passed {surinkimas sėkmingas} "
      & "build_failed {surinkimas nepavyko} snapshot_build {tarpinis "
      & "surinkimas} other {laidos surinkimas}}");
   P ("label.builds.coverage_label", "kodo aprėptis {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {laidos patikra išlaikyta} gate_failed "
      & "{laidos patikra neišlaikyta} gate_warning {laidos patikra: "
      & "įspėjimas} other {laidą užblokavo patikra}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {išlaikytų testų "
      & "nėra} other {išlaikyta testų: {count, number}}}} failed_test "
      & "{{count, plural, =0 {neišlaikytų testų nėra} other {neišlaikyta "
      & "testų: {count, number}}}} skipped_test {{count, plural, =0 "
      & "{praleistų testų nėra} other {praleista testų: {count, number}}}} "
      & "flaky_test {{count, plural, =0 {nestabilių testų nėra} other "
      & "{nestabilių testų: {count, number}}}} other {{count, plural, =0 "
      & "{numatytų nesėkmių nėra} other {numatytų nesėkmių: {count, "
      & "number}}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {išlaikytas} failed_test {neišlaikytas} "
      & "skipped_test {praleistas} flaky_test {nestabilus} other {numatyta "
      & "nesėkmė}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name}: "
      & "nepakeista, išjungta} other {{field_name}: pakeista iš "
      & "„išjungta“ į „įjungta“}}} other {{new_value, select, false "
      & "{{field_name}: pakeista iš „įjungta“ į „išjungta“} other "
      & "{{field_name}: nepakeista, įjungta}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {pridėta} removed_change {pašalinta} "
      & "modified_change {pakeista} renamed_change {pervadinta} "
      & "unchanged_change {nepakeista} metadata_change {pakeisti metaduomenys} "
      & "moved_change {perkelta} conflict_change {konfliktas} other {nežinomas "
      & "pakeitimas}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {informacinis pakeitimas} "
      & "minor_change {nedidelis pakeitimas} major_change {didelis pakeitimas} "
      & "other {nesuderinamas pakeitimas}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}: nepakeista} "
      & "other {{unchanged, plural, =0 {{field_name} – pridėta: {added, "
      & "number}} other {{field_name} – pridėta: {added, number}, "
      & "nepakeista: {unchanged, number}}}}}} other {{added, plural, =0 "
      & "{{unchanged, plural, =0 {{field_name} – pašalinta: {removed, "
      & "number}} other {{field_name} – pašalinta: {removed, number}, "
      & "nepakeista: {unchanged, number}}}} other {{unchanged, plural, =0 "
      & "{{field_name} – pridėta: {added, number}, pašalinta: {removed, "
      & "number}} other {{field_name} – pridėta: {added, number}, "
      & "pašalinta: {removed, number}, nepakeista: {unchanged, number}}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {konfliktų nėra} one {{count, number} konfliktas} "
      & "few {{count, number} konfliktai} many {{count, number} konflikto} "
      & "other {{count, number} konfliktų}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name}: perkelta vėliau, iš "
      & "„{old_label}“ į „{new_label}“} other {{field_name}: perkelta "
      & "anksčiau, iš „{old_label}“ į „{new_label}“}}");
   P ("label.changes.duration_field_change_label",
      "{field_name}: pakeista iš „{old_label}“ į „{new_label}“");
   P ("label.changes.field_change_label", "{field_name}: pakeista iš „{old_value}“ į „{new_value}“");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name}: pridėta} removed_change {{name}: "
      & "pašalinta} modified_change {{name}: pakeista} renamed_change {{name}: "
      & "pervadinta} unchanged_change {{name}: nepakeista} metadata_change "
      & "{{name}: pakeisti metaduomenys} moved_change {{name}: perkelta} "
      & "conflict_change {{name}: konfliktas} other {{name}: nežinomas "
      & "pakeitimas}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {pakeisti tik metaduomenys} other {pakeista tik "
      & "metaduomenų laukų: {count, number}}}");
   P ("label.changes.move_label", "{name}: perkelta iš {from} į {to}");
   P ("label.changes.no_changes_label", "pakeitimų nėra");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {eilutės "
      & "nepakeistos} other {pridėta eilučių: {lines_added, number}}}} other "
      & "{{lines_added, plural, =0 {pašalinta eilučių: {lines_removed, "
      & "number}} other {pridėta eilučių: {lines_added, number}, pašalinta "
      & "eilučių: {lines_removed, number}}}}}");
   P ("label.changes.rename_label", "pervadinta iš „{old_name}“ į „{new_name}“");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author}: komentaro juodraštis} "
      & "published_comment {{author}: komentaras paskelbtas} edited_comment "
      & "{{author}: komentaras redaguotas} deleted_comment {{author}: "
      & "komentaras ištrintas} resolved_comment {{author}: komentaras "
      & "išspręstas} unresolved_comment {{author}: komentaras vėl "
      & "atidarytas} pinned_comment {{author}: komentaras prisegtas} other "
      & "{{author}: komentaras paslėptas}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {komentarų nėra} one {{count, number} komentaras} "
      & "few {{count, number} komentarai} many {{count, number} komentaro} "
      & "other {{count, number} komentarų}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author}: komentaro juodraštis} "
      & "published_comment {{author}: paskelbtas komentaras} edited_comment "
      & "{{author}: redaguotas komentaras} deleted_comment {{author}: "
      & "ištrintas komentaras} resolved_comment {{author}: išspręstas "
      & "komentaras} unresolved_comment {{author}: neišspręstas komentaras} "
      & "pinned_comment {{author}: prisegtas komentaras} other {{author}: "
      & "paslėptas komentaras}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {komentaro juodraštis} "
      & "published_comment {paskelbtas komentaras} edited_comment {redaguotas "
      & "komentaras} deleted_comment {ištrintas komentaras} resolved_comment "
      & "{išspręstas komentaras} unresolved_comment {neišspręstas "
      & "komentaras} pinned_comment {prisegtas komentaras} other {paslėptas "
      & "komentaras}}");
   P ("label.comments.deleted_label", "{author}: komentaras ištrintas");
   P ("label.comments.edited_label", "redaguota {time_text}");
   P ("label.comments.hide_comment_label", "slėpti komentarą: {reason}");
   P ("label.comments.lock_thread_label", "užrakinti giją {name}");
   P ("label.comments.mention_label", "{actor} pamini {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {dalyvių nėra} one {{count, number} dalyvis} few "
      & "{{count, number} dalyviai} many {{count, number} dalyvio} other "
      & "{{count, number} dalyvių}}");
   P ("label.comments.pin_label", "prisegti {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reakcija „patinka“} dislike_reaction "
      & "{reakcija „nepatinka“} heart_reaction {reakcija „širdelė“} "
      & "laugh_reaction {reakcija „juokas“} confused_reaction {reakcija "
      & "„sutrikimas“} hooray_reaction {reakcija „valio“} "
      & "rocket_reaction {reakcija „raketa“} other {reakcija „akys“}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {reakcijų "
      & "„patinka“ nėra} other {„patinka“: {count, number}}}} "
      & "dislike_reaction {{count, plural, =0 {reakcijų „nepatinka“ nėra} "
      & "other {„nepatinka“: {count, number}}}} heart_reaction {{count, "
      & "plural, =0 {reakcijų „širdelė“ nėra} other {„širdelė“: "
      & "{count, number}}}} laugh_reaction {{count, plural, =0 {reakcijų "
      & "„juokas“ nėra} other {„juokas“: {count, number}}}} "
      & "confused_reaction {{count, plural, =0 {reakcijų „sutrikimas“ "
      & "nėra} other {„sutrikimas“: {count, number}}}} hooray_reaction "
      & "{{count, plural, =0 {reakcijų „valio“ nėra} other {„valio“: "
      & "{count, number}}}} rocket_reaction {{count, plural, =0 {reakcijų "
      & "„raketa“ nėra} other {„raketa“: {count, number}}}} other "
      & "{{count, plural, =0 {reakcijų „akys“ nėra} other {„akys“: "
      & "{count, number}}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {atsakymų nėra} one {{count, number} atsakymas} "
      & "few {{count, number} atsakymai} many {{count, number} atsakymo} other "
      & "{{count, number} atsakymų}}");
   P ("label.comments.resolved_label", "{name}: išspręsta");
   P ("label.comments.subscribe_label", "prenumeruoti {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {gijų nėra} one {{count, number} gija} few "
      & "{{count, number} gijos} many {{count, number} gijos} other {{count, "
      & "number} gijų}}");
   P ("label.comments.thread_label",
      "{state, select, open_thread {{count, plural, =0 {{name}: atvira gija} "
      & "other {{name}: atvira gija, komentarų: {count, number}}}} "
      & "resolved_thread {{count, plural, =0 {{name}: išspręsta gija} other "
      & "{{name}: išspręsta gija, komentarų: {count, number}}}} "
      & "locked_thread {{count, plural, =0 {{name}: užrakinta gija} other "
      & "{{name}: užrakinta gija, komentarų: {count, number}}}} other "
      & "{{count, plural, =0 {{name}: archyvuota gija} other {{name}: "
      & "archyvuota gija, komentarų: {count, number}}}}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {atvira gija} resolved_thread {išspręsta "
      & "gija} locked_thread {užrakinta gija} other {archyvuota gija}}");
   P ("label.comments.unpin_label", "atsegti {name}");
   P ("label.comments.unsubscribe_label", "atsisakyti prenumeratos {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name}: pagerėjo} regressed {{name}: "
      & "pablogėjo} unchanged {{name}: nepakito} within_tolerance {{name}: "
      & "neviršija leistino nuokrypio} outside_tolerance {{name}: viršija "
      & "leistiną nuokrypį} new_value {{name}: nauja reikšmė} removed_value "
      & "{{name}: reikšmė pašalinta} other {{name}: bazinės reikšmės "
      & "nėra}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {pagerėjo} regressed {pablogėjo} unchanged "
      & "{nepakito} within_tolerance {neviršija leistino nuokrypio} "
      & "outside_tolerance {viršija leistiną nuokrypį} new_value {nauja "
      & "reikšmė} removed_value {reikšmė pašalinta} other {bazinės "
      & "reikšmės nėra}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name}: pagerėjo {difference_text}} "
      & "regressed {{name}: pablogėjo {difference_text}} unchanged {{name}: "
      & "nepakito ({difference_text})} within_tolerance {{name}: neviršija "
      & "leistino nuokrypio ({difference_text})} outside_tolerance {{name}: "
      & "viršija leistiną nuokrypį ({difference_text})} new_value {{name}: "
      & "nauja reikšmė ({difference_text})} removed_value {{name}: reikšmė "
      & "pašalinta ({difference_text})} other {{name}: bazinės reikšmės "
      & "nėra ({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name}: pagerėjo {difference_text}, "
      & "leistinas nuokrypis {tolerance_text}} regressed {{name}: pablogėjo "
      & "{difference_text}, leistinas nuokrypis {tolerance_text}} unchanged "
      & "{{name}: nepakito ({difference_text}), leistinas nuokrypis "
      & "{tolerance_text}} within_tolerance {{name}: neviršija leistino "
      & "nuokrypio ({difference_text}), leistinas nuokrypis {tolerance_text}} "
      & "outside_tolerance {{name}: viršija leistiną nuokrypį "
      & "({difference_text}), leistinas nuokrypis {tolerance_text}} new_value "
      & "{{name}: nauja reikšmė ({difference_text}), leistinas nuokrypis "
      & "{tolerance_text}} removed_value {{name}: reikšmė pašalinta "
      & "({difference_text}), leistinas nuokrypis {tolerance_text}} other "
      & "{{name}: bazinės reikšmės nėra ({difference_text}), leistinas "
      & "nuokrypis {tolerance_text}}}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {netinkama eilutė} duplicate_record "
      & "{pasikartojantis įrašas} missing_column {trūksta stulpelio} "
      & "unknown_field {nežinomas laukas} schema_mismatch {schemos "
      & "neatitikimas} other {praleistas įrašas}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {bandomasis paleidimas sėkmingas} "
      & "dry_run_failed {bandomasis paleidimas nepavyko} import_valid {importas "
      & "tinkamas} import_invalid {importas netinkamas} other {dalinis "
      & "importas}}");
   P ("label.data_quality.import_result_label",
      "{state, select, dry_run_passed {{name}: bandomasis paleidimas "
      & "sėkmingas – priimta: {accepted, number}, atmesta: {rejected, "
      & "number}} dry_run_failed {{name}: bandomasis paleidimas nepavyko – "
      & "priimta: {accepted, number}, atmesta: {rejected, number}} import_valid "
      & "{{name}: importas tinkamas – priimta: {accepted, number}, atmesta: "
      & "{rejected, number}} import_invalid {{name}: importas netinkamas – "
      & "priimta: {accepted, number}, atmesta: {rejected, number}} other "
      & "{{name}: dalinis importas – priimta: {accepted, number}, atmesta: "
      & "{rejected, number}}}");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {netinkamų eilučių "
      & "nėra} other {netinkamų eilučių: {count, number}}}} "
      & "duplicate_record {{count, plural, =0 {pasikartojančių įrašų "
      & "nėra} other {pasikartojančių įrašų: {count, number}}}} "
      & "missing_column {{count, plural, =0 {trūkstamų stulpelių nėra} "
      & "other {trūkstamų stulpelių: {count, number}}}} unknown_field "
      & "{{count, plural, =0 {nežinomų laukų nėra} other {nežinomų "
      & "laukų: {count, number}}}} schema_mismatch {{count, plural, =0 "
      & "{schemos neatitikimų nėra} other {schemos neatitikimų: {count, "
      & "number}}}} other {{count, plural, =0 {praleistų įrašų nėra} other "
      & "{praleistų įrašų: {count, number}}}}}");
   P ("label.data_quality.row_issue_label",
      "{issue, select, invalid_row {eilutė {row, number}: netinkama} "
      & "duplicate_record {eilutė {row, number}: pasikartojantis įrašas} "
      & "missing_column {eilutė {row, number}: trūksta stulpelio} "
      & "unknown_field {eilutė {row, number}: nežinomas laukas} "
      & "schema_mismatch {eilutė {row, number}: schemos neatitikimas} other "
      & "{eilutė {row, number}: įrašas praleistas}}");
   P ("label.data_quality.source_file_issue_label",
      "{issue, select, invalid_row {{file_name}: netinkama eilutė} "
      & "duplicate_record {{file_name}: pasikartojantis įrašas} "
      & "missing_column {{file_name}: trūksta stulpelio} unknown_field "
      & "{{file_name}: nežinomas laukas} schema_mismatch {{file_name}: schemos "
      & "neatitikimas} other {{file_name}: praleistas įrašas}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefaktas paruoštas} "
      & "artifact_uploaded {artefaktas įkeltas} artifact_signed {artefaktas "
      & "pasirašytas} artifact_missing {artefakto nėra} other {artefaktas "
      & "nebegalioja}}");
   P ("label.deployments.deployment_label",
      "{name} → {environment}: {state, select, queued_deployment {diegimas "
      & "eilėje} deploying {diegiama} deployed {įdiegta} failed_deployment "
      & "{diegimas nepavyko} rolled_back {grąžinta ankstesnė versija} "
      & "blocked_deployment {diegimas užblokuotas} other {diegimas "
      & "atšauktas}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {diegimas eilėje} deploying "
      & "{diegiama} deployed {įdiegta} failed_deployment {diegimas nepavyko} "
      & "rolled_back {grąžinta ankstesnė versija} blocked_deployment "
      & "{diegimas užblokuotas} other {diegimas atšauktas}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {aplinka veikia tinkamai} "
      & "drifting_environment {aplinkos nukrypimas} locked_environment {aplinka "
      & "užrakinta} maintenance_environment {aplinkos priežiūra} other "
      & "{aplinkos būsena nežinoma}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {migracijos nėra} migration_pending "
      & "{migracija laukia} migrating {vykdoma migracija} migration_complete "
      & "{migracija baigta} other {migracija nepavyko}}");
   P ("label.deployments.promotion_label", "{name}: perkelta iš {from_environment} į {to_environment}");
   P ("label.deployments.rollback_label", "{name}: grąžinama į {target}");
   P ("label.deployments.rollout_label", "{name}: išleidimas {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {paveiktų elementų nėra} other {{count, plural, "
      & "one {{count, number} paveiktas elementas} few {{count, number} "
      & "paveikti elementai} many {{count, number} paveikto elemento} other "
      & "{{count, number} paveiktų elementų}}}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {sėkminga} failed_check "
      & "{nepavyko} warning_check {įspėjimai} skipped_check {praleista} "
      & "pending_check {laukiama} other {vykdoma}} ({duration_s, plural, one "
      & "{{duration_s, number} sekundė} few {{duration_s, number} sekundės} "
      & "many {{duration_s, number} sekundės} other {{duration_s, number} "
      & "sekundžių}})");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {sėkminga} failed_check "
      & "{nepavyko} warning_check {įspėjimai} skipped_check {praleista} "
      & "pending_check {laukiama} other {vykdoma}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {sėkminga} failed_check {nepavyko} "
      & "warning_check {įspėjimai} skipped_check {praleista} pending_check "
      & "{laukiama} other {vykdoma}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {tikėtasi reikšmės: {subject}} "
      & "expected_unit {tikėtasi matavimo vieneto: {subject}} invalid_range "
      & "{netinkamas intervalas: {subject}} end_before_start {intervalo pabaiga "
      & "ankstesnė už pradžią: {subject}} unknown_field {nežinomas laukas: "
      & "{subject}} unsafe_redacted_value {nesaugi reikšmė paslėpta: "
      & "{subject}} unsupported_syntax {nepalaikoma sintaksė: {subject}} other "
      & "{diagnostikos paaiškinimas: {subject}}}{position, plural, =0 {; "
      & "naudokite {suggestion}} other { (pozicija {position, number}); "
      & "naudokite {suggestion}}}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {informacija} notice_severity "
      & "{pastaba} warning_severity {įspėjimas} error_severity {klaida} "
      & "critical_severity {kritinė klaida} other {blokuojanti klaida}} "
      & "({line, plural, =0 {{path}} other {{path}, eilutė {line, number}}}): "
      & "{message}");
   P ("label.diagnostics.failed_at_label",
      "nepavyko: {line, plural, =0 {{path}} other {{column, plural, =0 "
      & "{{path}, eilutė {line, number}} other {{path}, eilutė {line, "
      & "number}, stulpelis {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {informacija} notice_severity "
      & "{pastaba} warning_severity {įspėjimas} error_severity {klaida} "
      & "critical_severity {kritinė klaida} other {blokuojanti klaida}} lauke "
      & "{field_name}: {message}");
   P ("label.diagnostics.first_failure_label",
      "pirmoji nesėkmė ({check_name}): {line, plural, =0 {{path}} other "
      & "{{path}, eilutė {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{problemų nėra} other {{notices, plural, one {{notices, number} "
      & "pastaba} few {{notices, number} pastabos} many {{notices, number} "
      & "pastabos} other {{notices, number} pastabų}}}}} other {{notices, "
      & "plural, =0 {{warnings, plural, one {{warnings, number} įspėjimas} "
      & "few {{warnings, number} įspėjimai} many {{warnings, number} "
      & "įspėjimo} other {{warnings, number} įspėjimų}}} other {{warnings, "
      & "plural, one {{warnings, number} įspėjimas} few {{warnings, number} "
      & "įspėjimai} many {{warnings, number} įspėjimo} other {{warnings, "
      & "number} įspėjimų}}, {notices, plural, one {{notices, number} "
      & "pastaba} few {{notices, number} pastabos} many {{notices, number} "
      & "pastabos} other {{notices, number} pastabų}}}}}}} other {{warnings, "
      & "plural, =0 {{notices, plural, =0 {{errors, plural, one {{errors, "
      & "number} klaida} few {{errors, number} klaidos} many {{errors, number} "
      & "klaidos} other {{errors, number} klaidų}}} other {{errors, plural, "
      & "one {{errors, number} klaida} few {{errors, number} klaidos} many "
      & "{{errors, number} klaidos} other {{errors, number} klaidų}}, "
      & "{notices, plural, one {{notices, number} pastaba} few {{notices, "
      & "number} pastabos} many {{notices, number} pastabos} other {{notices, "
      & "number} pastabų}}}}} other {{notices, plural, =0 {{errors, plural, "
      & "one {{errors, number} klaida} few {{errors, number} klaidos} many "
      & "{{errors, number} klaidos} other {{errors, number} klaidų}}, "
      & "{warnings, plural, one {{warnings, number} įspėjimas} few "
      & "{{warnings, number} įspėjimai} many {{warnings, number} įspėjimo} "
      & "other {{warnings, number} įspėjimų}}} other {{errors, plural, one "
      & "{{errors, number} klaida} few {{errors, number} klaidos} many "
      & "{{errors, number} klaidos} other {{errors, number} klaidų}}, "
      & "{warnings, plural, one {{warnings, number} įspėjimas} few "
      & "{{warnings, number} įspėjimai} many {{warnings, number} įspėjimo} "
      & "other {{warnings, number} įspėjimų}}, {notices, plural, one "
      & "{{notices, number} pastaba} few {{notices, number} pastabos} many "
      & "{{notices, number} pastabos} other {{notices, number} pastabų}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, eilutė "
      & "{line, number}} other {{path}, eilutė {line, number}, stulpelis "
      & "{column, number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "nepalaikoma sintaksė {family, select, byte_parser {baitų "
      & "analizatoriui} duration_parser {trukmės analizatoriui} "
      & "date_time_parser {datos ir laiko analizatoriui} color_parser {spalvų "
      & "analizatoriui} url_parser {URL analizatoriui} unit_parser {vienetų "
      & "analizatoriui} recurrence_parser {pasikartojimo analizatoriui} "
      & "domain_label_parser {domeno žymių analizatoriui} other "
      & "{analizatoriui}} {error}{position, plural, =0 {;} other { (pozicija "
      & "{position, number});}} {family, select, byte_parser {naudokite B, kB, "
      & "MB, GB, KiB, MiB, GiB arba TiB} duration_parser {naudokite ms, s, min, "
      & "h, d, w, month arba year} date_time_parser {naudokite ISO datą, "
      & "dieną žodžiais arba laiką} color_parser {naudokite hex, rgb(), "
      & "hsl(), lab(), lch() arba spalvos pavadinimą} url_parser {naudokite "
      & "schemą, pagrindinį kompiuterį, kelią, užklausą arba fragmentą} "
      & "unit_parser {naudokite palaikomą Humanize vienetą} recurrence_parser "
      & "{naudokite cron arba every/weekday pasikartojimo formą} "
      & "domain_label_parser {naudokite deterministinę Humanize domeno žymę} "
      & "other {naudokite palaikomą įvesties formą}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {sėkminga} failed_check {nepavyko} "
      & "warning_check {įspėjimai} skipped_check {praleista} pending_check "
      & "{laukiama} other {vykdoma}}, {notices, plural, =0 {be pastabų} other "
      & "{{notices, plural, one {{notices, number} pastaba} few {{notices, "
      & "number} pastabos} many {{notices, number} pastabos} other {{notices, "
      & "number} pastabų}}}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {bandymas 1 iš 1} other "
      & "{bandymas {attempt, number} iš 1: riba viršyta}}} other {bandymas "
      & "{attempt, number} iš {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {informacija} notice_severity "
      & "{pastaba} warning_severity {įspėjimas} error_severity {klaida} "
      & "critical_severity {kritinė klaida} other {blokuojanti klaida}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {kompiliavimo diagnostika} test_source "
      & "{testų diagnostika} lint_source {lint diagnostika} import_source "
      & "{importo diagnostika} validation_source {patvirtinimo diagnostika} "
      & "runtime_source {vykdymo diagnostika} security_source {saugos "
      & "diagnostika} other {diagnostika}}");
   P ("label.diagnostics.source_summary_label",
      "{source, select, build_source {kompiliavimo diagnostika} test_source "
      & "{testų diagnostika} lint_source {lint diagnostika} import_source "
      & "{importo diagnostika} validation_source {patvirtinimo diagnostika} "
      & "runtime_source {vykdymo diagnostika} security_source {saugos "
      & "diagnostika} other {diagnostika}}: {count, number}");
   P ("label.diagnostics.suggested_action_label", "kitas žingsnis: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {domeno vardas} ipv4_host {IPv4 adresas} "
      & "ipv6_host {IPv6 adresas} localhost_host {vietinis kompiuteris} "
      & "private_network_host {privataus tinklo adresas} other {nežinomas "
      & "kompiuteris}}");
   P ("label.events.all_day_label", "{name}: visą dieną");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {neatsakyta} accepted {priimta} declined "
      & "{atmesta} maybe {galbūt} other {laukiančiųjų sąraše}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {dalyvių nėra} other {{count, plural, one "
      & "{{count, number} dalyvis} few {{count, number} dalyviai} many {{count, "
      & "number} dalyvio} other {{count, number} dalyvių}}}}");
   P ("label.events.canceled_label", "{name}: atšaukta");
   P ("label.events.check_in_label", "registruotis: {name}");
   P ("label.events.conference_link_label", "{name}: konferencijos nuoroda");
   P ("label.events.event_count_label",
      "{count, plural, =0 {įvykių nėra} other {{count, plural, one "
      & "{{count, number} įvykis} few {{count, number} įvykiai} many {{count, "
      & "number} įvykio} other {{count, number} įvykių}}}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {suplanuota} tentative_event "
      & "{preliminaru} in_progress_event {vyksta} completed_event {baigta} "
      & "canceled_event {atšaukta} other {atidėta}}");
   P ("label.events.event_location_label", "{name}, {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {suplanuotas įvykis} tentative_event "
      & "{preliminarus įvykis} in_progress_event {vykstantis įvykis} "
      & "completed_event {baigtas įvykis} canceled_event {atšauktas įvykis} "
      & "other {atidėtas įvykis}}");
   P ("label.events.event_time_label", "{name}, {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {viešas įvykis} private_event "
      & "{privatus įvykis} busy_event {užimta} other {laisva}}");
   P ("label.events.organizer_label", "organizatorius: {name}");
   P ("label.events.rsvp_label",
      "atsakymas į kvietimą: {state, select, not_responded {neatsakyta} "
      & "accepted {priimta} declined {atmesta} maybe {galbūt} other "
      & "{laukiančiųjų sąraše}}");
   P ("label.events.reminder_label", "priminimas: {time_text}");
   P ("label.events.rescheduled_label", "{name}: perkelta į {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {{used, number} simbolis} few {{used, number} "
      & "simboliai} many {{used, number} simbolio} other {{used, number} "
      & "simbolių}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {simbolių riba nenustatyta} other {daugiausia "
      & "{limit, plural, one {{limit, number} simbolis} few {{limit, number} "
      & "simboliai} many {{limit, number} simbolio} other {{limit, number} "
      & "simbolių}}}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {{used, number} simbolis} few "
      & "{{used, number} simboliai} many {{used, number} simbolio} other "
      & "{{used, number} simbolių}}} other {{limit, plural, one {{used, "
      & "number} iš {limit, number} simbolio} few {{used, number} iš {limit, "
      & "number} simbolių} many {{used, number} iš {limit, number} simbolio} "
      & "other {{used, number} iš {limit, number} simbolių}}}}");
   P ("label.forms.field_label",
      "{name}: {required, select, false {neprivalomas laukas} other "
      & "{privalomas laukas}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {tinkama} invalid_input "
      & "{netinkama} required_input {privaloma} optional_input {neprivaloma} "
      & "disabled_input {išjungta} other {tik skaityti}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {formoje problemų nėra} "
      & "other {{warnings, plural, one {{warnings, number} įspėjimas} few "
      & "{{warnings, number} įspėjimai} many {{warnings, number} įspėjimo} "
      & "other {{warnings, number} įspėjimų}}}}} other {{warnings, plural, "
      & "=0 {{errors, plural, one {{errors, number} klaida} few {{errors, "
      & "number} klaidos} many {{errors, number} klaidos} other {{errors, "
      & "number} klaidų}}} other {{errors, plural, one {{errors, number} "
      & "klaida} few {{errors, number} klaidos} many {{errors, number} klaidos} "
      & "other {{errors, number} klaidų}}, {warnings, plural, one {{warnings, "
      & "number} įspėjimas} few {{warnings, number} įspėjimai} many "
      & "{{warnings, number} įspėjimo} other {{warnings, number} "
      & "įspėjimų}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {nepradėta} editing_form {redaguojama} "
      & "dirty_form {neįrašyti pakeitimai} saving_form {įrašoma} saved_form "
      & "{įrašyta} submitted_form {pateikta} other {pateikti nepavyko}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {tinkama įvestis} invalid_input "
      & "{netinkama įvestis} required_input {privaloma įvestis} "
      & "optional_input {neprivaloma įvestis} disabled_input {išjungta "
      & "įvestis} other {tik skaitoma įvestis}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {nepradėta} editing_form {redaguojama} "
      & "dirty_form {neįrašyti pakeitimai} saving_form {forma įrašoma} "
      & "saved_form {forma įrašyta} submitted_form {forma pateikta} other "
      & "{{errors, plural, =0 {pateikti nepavyko} other {pateikti nepavyko: "
      & "{errors, plural, one {{errors, number} klaida} few {{errors, number} "
      & "klaidos} many {{errors, number} klaidos} other {{errors, number} "
      & "klaidų}}}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {neįrašytų pakeitimų nėra} other {{count, "
      & "plural, one {{count, number} neįrašytas pakeitimas} few {{count, "
      & "number} neįrašyti pakeitimai} many {{count, number} neįrašyto "
      & "pakeitimo} other {{count, number} neįrašytų pakeitimų}}}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {trūksta prieinamo "
      & "pavadinimo} low_contrast {mažas kontrastas} skipped_heading_level "
      & "{praleistas antraštės lygis} missing_form_label {trūksta formos "
      & "lauko žymos} invalid_aria {netinkamas ARIA} keyboard_trap "
      & "{klaviatūros spąstai} other {nežinoma prieinamumo problema}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}: prieinamumo suvestinė — {landmarks, plural, one "
      & "{{landmarks, number} orientyras} few {{landmarks, number} orientyrai} "
      & "many {{landmarks, number} orientyro} other {{landmarks, number} "
      & "orientyrų}}, {headings, plural, one {{headings, number} antraštė} "
      & "few {{headings, number} antraštės} many {{headings, number} "
      & "antraštės} other {{headings, number} antraščių}}, {issues, "
      & "plural, one {{issues, number} problema} few {{issues, number} "
      & "problemos} many {{issues, number} problemos} other {{issues, number} "
      & "problemų}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {pridėkite prieinamą "
      & "pavadinimą} low_contrast {padidinkite teksto kontrastą} "
      & "skipped_heading_level {naudokite nuoseklius antraščių lygius} "
      & "missing_form_label {susiekite žymą su formos valdikliu} invalid_aria "
      & "{naudokite tinkamą ARIA vaidmenį arba atributą} keyboard_trap "
      & "{užtikrinkite, kad klaviatūros fokusas galėtų palikti komponentą} "
      & "other {peržiūrėkite prieinamumo problemą}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {prieinamumo problemų nėra} other "
      & "{{issues, plural, one {{issues, number} prieinamumo problema} few "
      & "{{issues, number} prieinamumo problemos} many {{issues, number} "
      & "prieinamumo problemos} other {{issues, number} prieinamumo "
      & "problemų}}}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id atributas} class_attribute {class "
      & "atributas} data_attribute {data atributas} aria_attribute {ARIA "
      & "atributas} role_attribute {role atributas} link_attribute {nuorodos "
      & "atributas} media_attribute {medijos atributas} form_attribute {formos "
      & "atributas} boolean_attribute {loginis atributas} event_attribute "
      & "{įvykių doroklės atributas} other {nežinomas atributas}}");
   P ("label.markup.form_error_summary_label",
      "{form_name}: {errors, plural, =0 {{warnings, plural, =0 {formoje "
      & "problemų nėra} other {{warnings, plural, one {{warnings, number} "
      & "įspėjimas} few {{warnings, number} įspėjimai} many {{warnings, "
      & "number} įspėjimo} other {{warnings, number} įspėjimų}}}}} other "
      & "{{warnings, plural, =0 {{errors, plural, one {{errors, number} klaida} "
      & "few {{errors, number} klaidos} many {{errors, number} klaidos} other "
      & "{{errors, number} klaidų}}} other {{errors, plural, one {{errors, "
      & "number} klaida} few {{errors, number} klaidos} many {{errors, number} "
      & "klaidos} other {{errors, number} klaidų}}, {warnings, plural, one "
      & "{{warnings, number} įspėjimas} few {{warnings, number} įspėjimai} "
      & "many {{warnings, number} įspėjimo} other {{warnings, number} "
      & "įspėjimų}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {orientyras: reklamjuostė} navigation_role "
      & "{orientyras: naršymas} main_role {orientyras: pagrindinis turinys} "
      & "complementary_role {orientyras: papildomas turinys} contentinfo_role "
      & "{orientyras: turinio informacija} search_role {orientyras: paieška} "
      & "form_role {orientyras: forma} region_role {orientyras: regionas} "
      & "dialog_role {dialogas} alert_role {aktyvi sritis: įspėjimas} "
      & "status_role {aktyvi sritis: būsena} other {nežinomas orientyras}}");
end Labels_1;
