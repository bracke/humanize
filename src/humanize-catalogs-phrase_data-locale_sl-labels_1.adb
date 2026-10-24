separate (Humanize.Catalogs.Phrase_Data.Locale_Sl)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{name}: {state, select, active_account {aktiven račun} "
      & "invited_account {povabljen račun} locked_account {zaklenjen račun} "
      & "suspended_account {začasno ustavljen račun} deleted_account "
      & "{izbrisan račun} other {neznano stanje računa}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {aktiven račun} invited_account "
      & "{povabljen račun} locked_account {zaklenjen račun} suspended_account "
      & "{začasno ustavljen račun} deleted_account {izbrisan račun} other "
      & "{neznano stanje računa}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {zaupanja vredna naprava} "
      & "untrusted_device {nepreverjena naprava} new_device {nova naprava} "
      & "other {blokirana naprava}}");
   P ("label.accounts.last_active_label", "{name}: zadnja dejavnost {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: prijava ni uspela} other {{name}: "
      & "prijava je uspela}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA vklopljeno} mfa_disabled {MFA "
      & "izklopljeno} mfa_required {MFA zahtevano} other {zahtevana "
      & "ponastavitev MFA}}");
   P ("label.accounts.session_label",
      "{name}: {state, select, active_session {aktivna seja} expired_session "
      & "{seja je potekla} revoked_session {seja preklicana} idle_session "
      & "{nedejavna seja} other {neznano stanje seje}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {aktivna seja} expired_session {seja je "
      & "potekla} revoked_session {seja preklicana} idle_session {nedejavna "
      & "seja} other {neznano stanje seje}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {ni prilog} one {{count, number} priloga} two "
      & "{{count, number} prilogi} few {{count, number} priloge} other {{count, "
      & "number} prilog}}");
   P ("label.attachments.attachment_group_label",
      "{name}: {count, plural, =0 {ni prilog} one {{count, number} priloga} "
      & "two {{count, number} prilogi} few {{count, number} priloge} other "
      & "{{count, number} prilog}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {priložena datoteka} image_attachment "
      & "{priložena slika} video_attachment {priložen videoposnetek} "
      & "audio_attachment {priložen zvok} document_attachment {priložen "
      & "dokument} archive_attachment {priložen arhiv} other {priložena "
      & "povezava}}");
   P ("label.attachments.attachment_label",
      "{name} ({kind, select, file_attachment {datoteka} image_attachment "
      & "{slika} video_attachment {video} audio_attachment {zvok} "
      & "document_attachment {dokument} archive_attachment {arhiv} other "
      & "{povezava}}): {state, select, pending_attachment {v čakanju} "
      & "uploading_attachment {nalaganje} uploaded_attachment {naloženo} "
      & "failed_attachment {ni uspelo} removed_attachment {odstranjeno} other "
      & "{blokirano}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {priloga v čakanju} "
      & "uploading_attachment {nalaganje priloge} uploaded_attachment {priloga "
      & "naložena} failed_attachment {napaka priloge} removed_attachment "
      & "{priloga odstranjena} other {priloga blokirana}}");
   P ("label.attachments.download_label", "prenesi {name}");
   P ("label.attachments.expiring_link_label", "{name}: povezava poteče {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "predogled {name}");
   P ("label.attachments.remove_label", "odstrani {name}");
   P ("label.attachments.scan_result_label",
      "{name}: {state, select, not_scanned {ni pregledano} scanning "
      & "{pregledovanje} safe {brez groženj} suspicious {sumljiva vsebina} "
      & "other {zaznana okužba}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {ni pregledano} scanning {pregledovanje} "
      & "safe {pregled: brez groženj} suspicious {pregled: sumljiva vsebina} "
      & "other {pregled: zaznana okužba}}");
   P ("label.attachments.upload_error_label", "{name}: nalaganje ni uspelo – {reason}");
   P ("label.badges.badge_label",
      "{name}: {tone, select, neutral_tone {nevtralna značka} info_tone "
      & "{informativna značka} success_tone {značka uspeha} warning_tone "
      & "{opozorilna značka} danger_tone {značka nevarnosti} other {utišana "
      & "značka}}{state, select, new_badge {, nova} updated_badge {, "
      & "posodobljena} deprecated_badge {, zastarela} selected_badge {, "
      & "izbrana} disabled_badge {, onemogočena} dismissible_badge {, z "
      & "možnostjo zaprtja} other {}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {značka nizke prioritete} "
      & "medium_priority {značka srednje prioritete} high_priority {značka "
      & "visoke prioritete} other {značka kritične prioritete}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {privzeta značka} new_badge {nova "
      & "značka} updated_badge {posodobljena značka} deprecated_badge "
      & "{zastarela značka} selected_badge {izbrana značka} disabled_badge "
      & "{onemogočena značka} other {značka z možnostjo zaprtja}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {nevtralna značka} info_tone "
      & "{informativna značka} success_tone {značka uspeha} warning_tone "
      & "{opozorilna značka} danger_tone {značka nevarnosti} other {utišana "
      & "značka}}");
   P ("label.badges.chip_label", "{selected, select, false {{name}} other {{name}, izbrano}}");
   P ("label.badges.count_badge_label", "{name}: {count, number}");
   P ("label.badges.deprecated_label", "{name}: zastarelo");
   P ("label.badges.dismiss_label", "zapri {name}");
   P ("label.badges.new_label", "{name}: novo");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {ni skritih značk} one {+{hidden_count, "
      & "number} značka} two {+{hidden_count, number} znački} few "
      & "{+{hidden_count, number} značke} other {+{hidden_count, number} "
      & "značk}}");
   P ("label.badges.priority_badge_label",
      "{name}: {priority, select, low_priority {nizka prioriteta} "
      & "medium_priority {srednja prioriteta} high_priority {visoka prioriteta} "
      & "other {kritična prioriteta}}");
   P ("label.badges.status_badge_label",
      "{name} – stanje: {tone, select, neutral_tone {nevtralno} info_tone "
      & "{informacija} success_tone {uspeh} warning_tone {opozorilo} "
      & "danger_tone {nevarnost} other {utišano}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {ni oznak} one {{count, number} oznaka} two "
      & "{{count, number} oznaki} few {{count, number} oznake} other {{count, "
      & "number} oznak}}");
   P ("label.badges.tag_label", "oznaka {name}");
   P ("label.badges.updated_label", "{name}: posodobljeno");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefakt naložen} artifact_missing "
      & "{artefakt manjka} artifact_expired {artefakt je potekel} other "
      & "{artefakt preverjen}}");
   P ("label.builds.benchmark_label", "primerjalni test {name}: {result_text}");
   P ("label.builds.build_label",
      "{name}: {state, select, build_queued {gradnja v čakalni vrsti} "
      & "build_running {gradnja poteka} build_passed {gradnja je uspela} "
      & "build_failed {gradnja ni uspela} snapshot_build {razvojna gradnja} "
      & "other {gradnja izdaje}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {gradnja v čakalni vrsti} build_running "
      & "{gradnja poteka} build_passed {gradnja je uspela} build_failed "
      & "{gradnja ni uspela} snapshot_build {razvojna gradnja} other {gradnja "
      & "izdaje}}");
   P ("label.builds.coverage_label", "pokritost: {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {vrata izdaje: uspešno} gate_failed "
      & "{vrata izdaje: neuspešno} gate_warning {vrata izdaje: opozorilo} "
      & "other {vrata izdaje: blokirano}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {ni uspešnih testov} "
      & "other {uspešni testi: {count, number}}}} failed_test {{count, plural, "
      & "=0 {ni neuspešnih testov} other {neuspešni testi: {count, number}}}} "
      & "skipped_test {{count, plural, =0 {ni preskočenih testov} other "
      & "{preskočeni testi: {count, number}}}} flaky_test {{count, plural, =0 "
      & "{ni nestabilnih testov} other {nestabilni testi: {count, number}}}} "
      & "other {{count, plural, =0 {ni testov s pričakovano napako} other "
      & "{testi s pričakovano napako: {count, number}}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {uspešen} failed_test {neuspešen} "
      & "skipped_test {preskočen} flaky_test {nestabilen} other {pričakovana "
      & "napaka}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name}: "
      & "brez sprememb (izklopljeno)} other {{field_name}: vklopljeno}}} other "
      & "{{new_value, select, false {{field_name}: izklopljeno} other "
      & "{{field_name}: brez sprememb (vklopljeno)}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {dodano} removed_change {odstranjeno} "
      & "modified_change {spremenjeno} renamed_change {preimenovano} "
      & "unchanged_change {brez sprememb} metadata_change {spremenjeni "
      & "metapodatki} moved_change {premaknjeno} conflict_change {konflikt} "
      & "other {neznana sprememba}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {informativna sprememba} "
      & "minor_change {manjša sprememba} major_change {večja sprememba} other "
      & "{nezdružljiva sprememba}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}: brez sprememb} "
      & "other {{unchanged, plural, =0 {{field_name}: dodano {added, number}} "
      & "other {{field_name}: dodano {added, number}, brez sprememb {unchanged, "
      & "number}}}}}} other {{added, plural, =0 {{unchanged, plural, =0 "
      & "{{field_name}: odstranjeno {removed, number}} other {{field_name}: "
      & "odstranjeno {removed, number}, brez sprememb {unchanged, number}}}} "
      & "other {{unchanged, plural, =0 {{field_name}: dodano {added, number}, "
      & "odstranjeno {removed, number}} other {{field_name}: dodano {added, "
      & "number}, odstranjeno {removed, number}, brez sprememb {unchanged, "
      & "number}}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {ni konfliktov} one {{count, number} konflikt} two "
      & "{{count, number} konflikta} few {{count, number} konflikti} other "
      & "{{count, number} konfliktov}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name}: premaknjeno na pozneje, iz "
      & "{old_label} v {new_label}} other {{field_name}: premaknjeno na prej, "
      & "iz {old_label} v {new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name}: spremenjeno iz {old_label} v {new_label}");
   P ("label.changes.field_change_label", "{field_name}: spremenjeno iz {old_value} v {new_value}");
   P ("label.changes.item_change_label",
      "{name}: {kind, select, added_change {dodano} removed_change "
      & "{odstranjeno} modified_change {spremenjeno} renamed_change "
      & "{preimenovano} unchanged_change {brez sprememb} metadata_change "
      & "{spremenjeni metapodatki} moved_change {premaknjeno} conflict_change "
      & "{konflikt} other {neznana sprememba}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {spremenjeni samo metapodatki} one {spremenjeno "
      & "samo {count, number} polje metapodatkov} two {spremenjeni samo {count, "
      & "number} polji metapodatkov} few {spremenjena samo {count, number} "
      & "polja metapodatkov} other {spremenjenih samo {count, number} polj "
      & "metapodatkov}}");
   P ("label.changes.move_label", "{name}: premaknjeno iz {from} v {to}");
   P ("label.changes.no_changes_label", "brez sprememb");
   P ("label.changes.patch_size_label",
      "{lines_added, plural, =0 {{lines_removed, plural, =0 {ni sprememb "
      & "vrstic} one {odstranjena {lines_removed, number} vrstica} two "
      & "{odstranjeni {lines_removed, number} vrstici} few {odstranjene "
      & "{lines_removed, number} vrstice} other {odstranjenih {lines_removed, "
      & "number} vrstic}}} one {dodana {lines_added, number} "
      & "vrstica{lines_removed, plural, =0 {} one {, odstranjena "
      & "{lines_removed, number} vrstica} two {, odstranjeni {lines_removed, "
      & "number} vrstici} few {, odstranjene {lines_removed, number} vrstice} "
      & "other {, odstranjenih {lines_removed, number} vrstic}}} two {dodani "
      & "{lines_added, number} vrstici{lines_removed, plural, =0 {} one {, "
      & "odstranjena {lines_removed, number} vrstica} two {, odstranjeni "
      & "{lines_removed, number} vrstici} few {, odstranjene {lines_removed, "
      & "number} vrstice} other {, odstranjenih {lines_removed, number} "
      & "vrstic}}} few {dodane {lines_added, number} vrstice{lines_removed, "
      & "plural, =0 {} one {, odstranjena {lines_removed, number} vrstica} two "
      & "{, odstranjeni {lines_removed, number} vrstici} few {, odstranjene "
      & "{lines_removed, number} vrstice} other {, odstranjenih {lines_removed, "
      & "number} vrstic}}} other {dodanih {lines_added, number} "
      & "vrstic{lines_removed, plural, =0 {} one {, odstranjena {lines_removed, "
      & "number} vrstica} two {, odstranjeni {lines_removed, number} vrstici} "
      & "few {, odstranjene {lines_removed, number} vrstice} other {, "
      & "odstranjenih {lines_removed, number} vrstic}}}}");
   P ("label.changes.rename_label", "preimenovano iz {old_name} v {new_name}");
   P ("label.comments.author_action_label",
      "{author} – {state, select, draft_comment {osnutek komentarja} "
      & "published_comment {nov komentar} edited_comment {urejanje komentarja} "
      & "deleted_comment {izbris komentarja} resolved_comment {razrešitev "
      & "komentarja} unresolved_comment {ponovno odprtje komentarja} "
      & "pinned_comment {pripenjanje komentarja} other {skritje komentarja}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {ni komentarjev} one {{count, number} komentar} two "
      & "{{count, number} komentarja} few {{count, number} komentarji} other "
      & "{{count, number} komentarjev}}");
   P ("label.comments.comment_label",
      "{author}: {state, select, draft_comment {osnutek komentarja} "
      & "published_comment {objavljen komentar} edited_comment {urejen "
      & "komentar} deleted_comment {izbrisan komentar} resolved_comment "
      & "{razrešen komentar} unresolved_comment {nerazrešen komentar} "
      & "pinned_comment {pripet komentar} other {skrit komentar}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {osnutek komentarja} published_comment "
      & "{objavljen komentar} edited_comment {urejen komentar} deleted_comment "
      & "{izbrisan komentar} resolved_comment {razrešen komentar} "
      & "unresolved_comment {nerazrešen komentar} pinned_comment {pripet "
      & "komentar} other {skrit komentar}}");
   P ("label.comments.deleted_label", "komentar je izbrisal uporabnik {author}");
   P ("label.comments.edited_label", "urejeno {time_text}");
   P ("label.comments.hide_comment_label", "skrij komentar: {reason}");
   P ("label.comments.lock_thread_label", "zakleni nit {name}");
   P ("label.comments.mention_label", "{actor} omenja {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {ni udeležencev} one {{count, number} udeleženec} "
      & "two {{count, number} udeleženca} few {{count, number} udeleženci} "
      & "other {{count, number} udeležencev}}");
   P ("label.comments.pin_label", "pripni {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {odziv: všeč mi je} dislike_reaction "
      & "{odziv: ni mi všeč} heart_reaction {odziv: srce} laugh_reaction "
      & "{odziv: smeh} confused_reaction {odziv: zmedenost} hooray_reaction "
      & "{odziv: hura} rocket_reaction {odziv: raketa} other {odziv: oči}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {všeč mi je} dislike_reaction {ni mi "
      & "všeč} heart_reaction {srca} laugh_reaction {smeh} confused_reaction "
      & "{zmedenost} hooray_reaction {hura} rocket_reaction {rakete} other "
      & "{oči}}: {count, number}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {ni odgovorov} one {{count, number} odgovor} two "
      & "{{count, number} odgovora} few {{count, number} odgovori} other "
      & "{{count, number} odgovorov}}");
   P ("label.comments.resolved_label", "{name}: razrešeno");
   P ("label.comments.subscribe_label", "naroči se na {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {ni niti} one {{count, number} nit} two {{count, "
      & "number} niti} few {{count, number} niti} other {{count, number} niti}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {odprta nit} resolved_thread "
      & "{razrešena nit} locked_thread {zaklenjena nit} other {arhivirana "
      & "nit}}{count, plural, =0 {} one {, {count, number} komentar} two {, "
      & "{count, number} komentarja} few {, {count, number} komentarji} other "
      & "{, {count, number} komentarjev}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {odprta nit} resolved_thread {razrešena "
      & "nit} locked_thread {zaklenjena nit} other {arhivirana nit}}");
   P ("label.comments.unpin_label", "odpni {name}");
   P ("label.comments.unsubscribe_label", "odjavi se od {name}");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {izboljšanje} regressed "
      & "{poslabšanje} unchanged {brez sprememb} within_tolerance {znotraj "
      & "tolerance} outside_tolerance {zunaj tolerance} new_value {nova "
      & "vrednost} removed_value {odstranjeno} other {izhodiščna vrednost ni "
      & "na voljo}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {izboljšanje} regressed {poslabšanje} "
      & "unchanged {brez sprememb} within_tolerance {znotraj tolerance} "
      & "outside_tolerance {zunaj tolerance} new_value {nova vrednost} "
      & "removed_value {odstranjeno} other {izhodiščna vrednost ni na voljo}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {izboljšanje za {difference_text}} "
      & "regressed {poslabšanje za {difference_text}} unchanged {brez sprememb "
      & "({difference_text})} within_tolerance {znotraj tolerance "
      & "({difference_text})} outside_tolerance {zunaj tolerance "
      & "({difference_text})} new_value {nova vrednost ({difference_text})} "
      & "removed_value {odstranjeno ({difference_text})} other {izhodiščna "
      & "vrednost ni na voljo ({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {izboljšanje za {difference_text}} "
      & "regressed {poslabšanje za {difference_text}} unchanged {brez sprememb "
      & "({difference_text})} within_tolerance {znotraj tolerance "
      & "({difference_text})} outside_tolerance {zunaj tolerance "
      & "({difference_text})} new_value {nova vrednost ({difference_text})} "
      & "removed_value {odstranjeno ({difference_text})} other {izhodiščna "
      & "vrednost ni na voljo ({difference_text})}}, toleranca {tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {neveljavna vrstica} duplicate_record "
      & "{podvojen zapis} missing_column {manjkajoč stolpec} unknown_field "
      & "{neznano polje} schema_mismatch {neujemanje sheme} other {preskočen "
      & "zapis}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {poskusni uvoz je uspel} dry_run_failed "
      & "{poskusni uvoz ni uspel} import_valid {uvoz je veljaven} "
      & "import_invalid {uvoz ni veljaven} other {delni uvoz}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {poskusni uvoz je uspel} "
      & "dry_run_failed {poskusni uvoz ni uspel} import_valid {uvoz je "
      & "veljaven} import_invalid {uvoz ni veljaven} other {delni uvoz}}, "
      & "sprejeto {accepted, number}, zavrnjeno {rejected, number}");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {neveljavne vrstice} duplicate_record "
      & "{podvojeni zapisi} missing_column {manjkajoči stolpci} unknown_field "
      & "{neznana polja} schema_mismatch {neujemanja sheme} other {preskočeni "
      & "zapisi}}: {count, number}");
   P ("label.data_quality.row_issue_label",
      "vrstica {row, number}: {issue, select, invalid_row {neveljavna "
      & "vrstica} duplicate_record {podvojen zapis} missing_column {manjkajoč "
      & "stolpec} unknown_field {neznano polje} schema_mismatch {neujemanje "
      & "sheme} other {preskočen zapis}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {neveljavna vrstica} "
      & "duplicate_record {podvojen zapis} missing_column {manjkajoč stolpec} "
      & "unknown_field {neznano polje} schema_mismatch {neujemanje sheme} other "
      & "{preskočen zapis}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefakt pripravljen} "
      & "artifact_uploaded {artefakt naložen} artifact_signed {artefakt "
      & "podpisan} artifact_missing {artefakt manjka} other {artefakt je "
      & "potekel}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {uvedba {name} v {environment}: v "
      & "čakalni vrsti} deploying {uvedba {name} v {environment}: poteka} "
      & "deployed {uvedba {name} v {environment}: končana} failed_deployment "
      & "{uvedba {name} v {environment}: ni uspela} rolled_back {uvedba {name} "
      & "v {environment}: povrnjena} blocked_deployment {uvedba {name} v "
      & "{environment}: blokirana} other {uvedba {name} v {environment}: "
      & "preklicana}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {uvedba v čakalni vrsti} deploying "
      & "{uvajanje} deployed {uvedeno} failed_deployment {uvedba ni uspela} "
      & "rolled_back {povrnjeno} blocked_deployment {uvedba blokirana} other "
      & "{uvedba preklicana}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {okolje v redu} "
      & "drifting_environment {odmik okolja} locked_environment {okolje "
      & "zaklenjeno} maintenance_environment {okolje v vzdrževanju} other "
      & "{neznano stanje okolja}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {brez migracije} migration_pending "
      & "{migracija čaka} migrating {migracija poteka} migration_complete "
      & "{migracija končana} other {migracija ni uspela}}");
   P ("label.deployments.promotion_label", "napredovanje {name} iz {from_environment} v {to_environment}");
   P ("label.deployments.rollback_label", "povrnitev {name} na {target}");
   P ("label.deployments.rollout_label", "postopna uvedba {name}: {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {ni prizadetih elementov} one {{count, number} "
      & "prizadeti element} two {{count, number} prizadeta elementa} few "
      & "{{count, number} prizadeti elementi} other {{count, number} prizadetih "
      & "elementov}}");
   P ("label.diagnostics.check_duration_label",
      "{status, select, passed_check {{name}: uspešno ({duration_s, number} "
      & "s)} failed_check {{name}: neuspešno ({duration_s, number} s)} "
      & "warning_check {{name}: z opozorili ({duration_s, number} s)} "
      & "skipped_check {{name}: preskočeno ({duration_s, number} s)} "
      & "pending_check {{name}: čaka ({duration_s, number} s)} other {{name}: "
      & "poteka ({duration_s, number} s)}}");
   P ("label.diagnostics.check_result_label",
      "{status, select, passed_check {{name}: uspešno} failed_check {{name}: "
      & "neuspešno} warning_check {{name}: z opozorili} skipped_check {{name}: "
      & "preskočeno} pending_check {{name}: čaka} other {{name}: poteka}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {uspešno} failed_check {neuspešno} "
      & "warning_check {z opozorili} skipped_check {preskočeno} pending_check "
      & "{čaka} other {poteka}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{kind, select, expected_value {pričakovana "
      & "vrednost za {subject}; uporabite: {suggestion}} expected_unit "
      & "{pričakovana enota za {subject}; uporabite: {suggestion}} "
      & "invalid_range {neveljaven obseg za {subject}; uporabite: {suggestion}} "
      & "end_before_start {konec obsega je pred začetkom za {subject}; "
      & "uporabite: {suggestion}} unknown_field {neznano polje za {subject}; "
      & "uporabite: {suggestion}} unsafe_redacted_value {nevarna vrednost za "
      & "{subject} je bila skrita; uporabite: {suggestion}} unsupported_syntax "
      & "{nepodprta sintaksa za {subject}; uporabite: {suggestion}} other "
      & "{pojasnilo diagnostike za {subject}; uporabite: {suggestion}}}} other "
      & "{{kind, select, expected_value {pričakovana vrednost za {subject} na "
      & "položaju {position, number}; uporabite: {suggestion}} expected_unit "
      & "{pričakovana enota za {subject} na položaju {position, number}; "
      & "uporabite: {suggestion}} invalid_range {neveljaven obseg za {subject} "
      & "na položaju {position, number}; uporabite: {suggestion}} "
      & "end_before_start {konec obsega je pred začetkom za {subject} na "
      & "položaju {position, number}; uporabite: {suggestion}} unknown_field "
      & "{neznano polje za {subject} na položaju {position, number}; "
      & "uporabite: {suggestion}} unsafe_redacted_value {nevarna vrednost za "
      & "{subject} je bila skrita na položaju {position, number}; uporabite: "
      & "{suggestion}} unsupported_syntax {nepodprta sintaksa za {subject} na "
      & "položaju {position, number}; uporabite: {suggestion}} other "
      & "{pojasnilo diagnostike za {subject} na položaju {position, number}; "
      & "uporabite: {suggestion}}}}}");
   P ("label.diagnostics.diagnostic_label",
      "{line, plural, =0 {{severity, select, info_severity {informacija v "
      & "{path}: {message}} notice_severity {obvestilo v {path}: {message}} "
      & "warning_severity {opozorilo v {path}: {message}} error_severity "
      & "{napaka v {path}: {message}} critical_severity {kritična napaka v "
      & "{path}: {message}} other {blokirajoča napaka v {path}: {message}}}} "
      & "other {{severity, select, info_severity {informacija v {path}, vrstica "
      & "{line, number}: {message}} notice_severity {obvestilo v {path}, "
      & "vrstica {line, number}: {message}} warning_severity {opozorilo v "
      & "{path}, vrstica {line, number}: {message}} error_severity {napaka v "
      & "{path}, vrstica {line, number}: {message}} critical_severity "
      & "{kritična napaka v {path}, vrstica {line, number}: {message}} other "
      & "{blokirajoča napaka v {path}, vrstica {line, number}: {message}}}}}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {neuspeh v {path}} other {{column, plural, =0 "
      & "{neuspeh v {path}, vrstica {line, number}} other {neuspeh v {path}, "
      & "vrstica {line, number}, stolpec {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {informacija v polju {field_name}: "
      & "{message}} notice_severity {obvestilo v polju {field_name}: {message}} "
      & "warning_severity {opozorilo v polju {field_name}: {message}} "
      & "error_severity {napaka v polju {field_name}: {message}} "
      & "critical_severity {kritična napaka v polju {field_name}: {message}} "
      & "other {blokirajoča napaka v polju {field_name}: {message}}}");
   P ("label.diagnostics.first_failure_label",
      "{line, plural, =0 {prvi neuspeh: {check_name}, {path}} other {prvi "
      & "neuspeh: {check_name}, {path}, vrstica {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, =0 {ni "
      & "težav} other {{errors, plural, one {{errors, number} napaka} two "
      & "{{errors, number} napaki} few {{errors, number} napake} other "
      & "{{errors, number} napak}}}}} other {{errors, plural, =0 {{notices, "
      & "plural, one {{notices, number} obvestilo} two {{notices, number} "
      & "obvestili} few {{notices, number} obvestila} other {{notices, number} "
      & "obvestil}}} other {{errors, plural, one {{errors, number} napaka} two "
      & "{{errors, number} napaki} few {{errors, number} napake} other "
      & "{{errors, number} napak}}, {notices, plural, one {{notices, number} "
      & "obvestilo} two {{notices, number} obvestili} few {{notices, number} "
      & "obvestila} other {{notices, number} obvestil}}}}}}} other {{notices, "
      & "plural, =0 {{errors, plural, =0 {{warnings, plural, one {{warnings, "
      & "number} opozorilo} two {{warnings, number} opozorili} few {{warnings, "
      & "number} opozorila} other {{warnings, number} opozoril}}} other "
      & "{{errors, plural, one {{errors, number} napaka} two {{errors, number} "
      & "napaki} few {{errors, number} napake} other {{errors, number} napak}}, "
      & "{warnings, plural, one {{warnings, number} opozorilo} two {{warnings, "
      & "number} opozorili} few {{warnings, number} opozorila} other "
      & "{{warnings, number} opozoril}}}}} other {{errors, plural, =0 "
      & "{{warnings, plural, one {{warnings, number} opozorilo} two {{warnings, "
      & "number} opozorili} few {{warnings, number} opozorila} other "
      & "{{warnings, number} opozoril}}, {notices, plural, one {{notices, "
      & "number} obvestilo} two {{notices, number} obvestili} few {{notices, "
      & "number} obvestila} other {{notices, number} obvestil}}} other "
      & "{{errors, plural, one {{errors, number} napaka} two {{errors, number} "
      & "napaki} few {{errors, number} napake} other {{errors, number} napak}}, "
      & "{warnings, plural, one {{warnings, number} opozorilo} two {{warnings, "
      & "number} opozorili} few {{warnings, number} opozorila} other "
      & "{{warnings, number} opozoril}}, {notices, plural, one {{notices, "
      & "number} obvestilo} two {{notices, number} obvestili} few {{notices, "
      & "number} obvestila} other {{notices, number} obvestil}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, vrstica "
      & "{line, number}} other {{path}, vrstica {line, number}, stolpec "
      & "{column, number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{position, plural, =0 {{family, select, byte_parser {nepodprta "
      & "sintaksa (razčlenjevalnik bajtov): {error}; uporabite: B, kB, MB, GB, "
      & "KiB, MiB, GiB ali TiB} duration_parser {nepodprta sintaksa "
      & "(razčlenjevalnik trajanja): {error}; uporabite: ms, s, min, h, d, w, "
      & "month ali year} date_time_parser {nepodprta sintaksa (razčlenjevalnik "
      & "datuma in časa): {error}; uporabite: datum ISO, naravni dan ali ura} "
      & "color_parser {nepodprta sintaksa (razčlenjevalnik barv): {error}; "
      & "uporabite: hex, rgb(), hsl(), lab(), lch() ali ime barve} url_parser "
      & "{nepodprta sintaksa (razčlenjevalnik URL): {error}; uporabite: shema, "
      & "gostitelj, pot, poizvedba ali fragment} unit_parser {nepodprta "
      & "sintaksa (razčlenjevalnik enot): {error}; uporabite: podprta oznaka "
      & "enote Humanize} recurrence_parser {nepodprta sintaksa "
      & "(razčlenjevalnik ponavljanja): {error}; uporabite: cron ali oblika "
      & "ponavljanja every/weekday} domain_label_parser {nepodprta sintaksa "
      & "(razčlenjevalnik domenskih oznak): {error}; uporabite: "
      & "deterministična domenska oznaka Humanize} other {nepodprta sintaksa "
      & "(razčlenjevalnik): {error}; uporabite: podprta oblika vnosa}}} other "
      & "{{family, select, byte_parser {nepodprta sintaksa (razčlenjevalnik "
      & "bajtov) na položaju {position, number}: {error}; uporabite: B, kB, "
      & "MB, GB, KiB, MiB, GiB ali TiB} duration_parser {nepodprta sintaksa "
      & "(razčlenjevalnik trajanja) na položaju {position, number}: {error}; "
      & "uporabite: ms, s, min, h, d, w, month ali year} date_time_parser "
      & "{nepodprta sintaksa (razčlenjevalnik datuma in časa) na položaju "
      & "{position, number}: {error}; uporabite: datum ISO, naravni dan ali "
      & "ura} color_parser {nepodprta sintaksa (razčlenjevalnik barv) na "
      & "položaju {position, number}: {error}; uporabite: hex, rgb(), hsl(), "
      & "lab(), lch() ali ime barve} url_parser {nepodprta sintaksa "
      & "(razčlenjevalnik URL) na položaju {position, number}: {error}; "
      & "uporabite: shema, gostitelj, pot, poizvedba ali fragment} unit_parser "
      & "{nepodprta sintaksa (razčlenjevalnik enot) na položaju {position, "
      & "number}: {error}; uporabite: podprta oznaka enote Humanize} "
      & "recurrence_parser {nepodprta sintaksa (razčlenjevalnik ponavljanja) "
      & "na položaju {position, number}: {error}; uporabite: cron ali oblika "
      & "ponavljanja every/weekday} domain_label_parser {nepodprta sintaksa "
      & "(razčlenjevalnik domenskih oznak) na položaju {position, number}: "
      & "{error}; uporabite: deterministična domenska oznaka Humanize} other "
      & "{nepodprta sintaksa (razčlenjevalnik) na položaju {position, "
      & "number}: {error}; uporabite: podprta oblika vnosa}}}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {uspešno, {notices, plural, =0 {brez "
      & "obvestil} one {{notices, number} obvestilo} two {{notices, number} "
      & "obvestili} few {{notices, number} obvestila} other {{notices, number} "
      & "obvestil}}} failed_check {neuspešno, {notices, plural, =0 {brez "
      & "obvestil} one {{notices, number} obvestilo} two {{notices, number} "
      & "obvestili} few {{notices, number} obvestila} other {{notices, number} "
      & "obvestil}}} warning_check {z opozorili, {notices, plural, =0 {brez "
      & "obvestil} one {{notices, number} obvestilo} two {{notices, number} "
      & "obvestili} few {{notices, number} obvestila} other {{notices, number} "
      & "obvestil}}} skipped_check {preskočeno, {notices, plural, =0 {brez "
      & "obvestil} one {{notices, number} obvestilo} two {{notices, number} "
      & "obvestili} few {{notices, number} obvestila} other {{notices, number} "
      & "obvestil}}} pending_check {čaka, {notices, plural, =0 {brez obvestil} "
      & "one {{notices, number} obvestilo} two {{notices, number} obvestili} "
      & "few {{notices, number} obvestila} other {{notices, number} obvestil}}} "
      & "other {poteka, {notices, plural, =0 {brez obvestil} one {{notices, "
      & "number} obvestilo} two {{notices, number} obvestili} few {{notices, "
      & "number} obvestila} other {{notices, number} obvestil}}}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {ponovni poskus 1 od 1} other "
      & "{ponovni poskus {attempt, number} od 1 – omejitev presežena}}} "
      & "other {ponovni poskus {attempt, number} od {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {informacija} notice_severity "
      & "{obvestilo} warning_severity {opozorilo} error_severity {napaka} "
      & "critical_severity {kritična napaka} other {blokirajoča napaka}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {diagnostika gradnje} test_source "
      & "{diagnostika testov} lint_source {diagnostika linterja} import_source "
      & "{diagnostika uvoza} validation_source {diagnostika preverjanja} "
      & "runtime_source {diagnostika izvajanja} security_source {diagnostika "
      & "varnosti} other {diagnostika}}");
   P ("label.diagnostics.source_summary_label",
      "{source, select, build_source {diagnostika gradnje} test_source "
      & "{diagnostika testov} lint_source {diagnostika linterja} import_source "
      & "{diagnostika uvoza} validation_source {diagnostika preverjanja} "
      & "runtime_source {diagnostika izvajanja} security_source {diagnostika "
      & "varnosti} other {diagnostika}}: {count, plural, one {{count, number} "
      & "sporočilo} two {{count, number} sporočili} few {{count, number} "
      & "sporočila} other {{count, number} sporočil}}");
   P ("label.diagnostics.suggested_action_label", "naslednji korak: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {domena} ipv4_host {naslov IPv4} ipv6_host "
      & "{naslov IPv6} localhost_host {lokalni gostitelj} private_network_host "
      & "{naslov zasebnega omrežja} other {neznan gostitelj}}");
   P ("label.events.all_day_label", "{name}: celodnevni dogodek");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {brez odgovora} accepted {sprejeto} "
      & "declined {zavrnjeno} maybe {morda} other {na čakalnem seznamu}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {ni udeležencev} one {{count, number} udeleženec} "
      & "two {{count, number} udeleženca} few {{count, number} udeleženci} "
      & "other {{count, number} udeležencev}}");
   P ("label.events.canceled_label", "{name}: preklicano");
   P ("label.events.check_in_label", "prijava: {name}");
   P ("label.events.conference_link_label", "{name}: povezava do konference");
   P ("label.events.event_count_label",
      "{count, plural, =0 {ni dogodkov} one {{count, number} dogodek} two "
      & "{{count, number} dogodka} few {{count, number} dogodki} other {{count, "
      & "number} dogodkov}}");
   P ("label.events.event_label",
      "{state, select, scheduled_event {{name}: načrtovano} tentative_event "
      & "{{name}: pogojno} in_progress_event {{name}: poteka} completed_event "
      & "{{name}: končano} canceled_event {{name}: preklicano} other {{name}: "
      & "prestavljeno}}");
   P ("label.events.event_location_label", "{name}, kraj: {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {načrtovan dogodek} tentative_event "
      & "{pogojni dogodek} in_progress_event {dogodek v teku} completed_event "
      & "{končan dogodek} canceled_event {preklican dogodek} other "
      & "{prestavljen dogodek}}");
   P ("label.events.event_time_label", "{name}, čas: {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {javni dogodek} private_event "
      & "{zasebni dogodek} busy_event {zasedeno} other {prosto}}");
   P ("label.events.organizer_label", "organizator: {name}");
   P ("label.events.rsvp_label",
      "{state, select, not_responded {udeležba: brez odgovora} accepted "
      & "{udeležba: sprejeto} declined {udeležba: zavrnjeno} maybe "
      & "{udeležba: morda} other {udeležba: čakalni seznam}}");
   P ("label.events.reminder_label", "opomnik: {time_text}");
   P ("label.events.rescheduled_label", "{name}: prestavljeno na {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {{used, number} znak} two {{used, number} znaka} "
      & "few {{used, number} znaki} other {{used, number} znakov}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {brez omejitve znakov} one {največ {limit, number} "
      & "znak} two {največ {limit, number} znaka} few {največ {limit, number} "
      & "znaki} other {največ {limit, number} znakov}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {{used, number} znak} two "
      & "{{used, number} znaka} few {{used, number} znaki} other {{used, "
      & "number} znakov}}} other {{used, number} od {limit, plural, one "
      & "{{limit, number} znaka} two {{limit, number} znakov} few {{limit, "
      & "number} znakov} other {{limit, number} znakov}}}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}: neobvezno polje} other {{name}: "
      & "obvezno polje}}");
   P ("label.forms.field_state_label",
      "{state, select, valid_input {{name}: veljavna vrednost} invalid_input "
      & "{{name}: neveljavna vrednost} required_input {{name}: obvezno polje} "
      & "optional_input {{name}: neobvezno polje} disabled_input {{name}: "
      & "onemogočeno polje} other {{name}: samo za branje}}");
   P ("label.forms.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {ni težav v obrazcu} other "
      & "{{errors, plural, one {{errors, number} napaka} two {{errors, number} "
      & "napaki} few {{errors, number} napake} other {{errors, number} "
      & "napak}}}}} other {{errors, plural, =0 {{warnings, plural, one "
      & "{{warnings, number} opozorilo} two {{warnings, number} opozorili} few "
      & "{{warnings, number} opozorila} other {{warnings, number} opozoril}}} "
      & "other {{errors, plural, one {{errors, number} napaka} two {{errors, "
      & "number} napaki} few {{errors, number} napake} other {{errors, number} "
      & "napak}}, {warnings, plural, one {{warnings, number} opozorilo} two "
      & "{{warnings, number} opozorili} few {{warnings, number} opozorila} "
      & "other {{warnings, number} opozoril}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {ni začeto} editing_form {urejanje} "
      & "dirty_form {neshranjene spremembe} saving_form {shranjevanje} "
      & "saved_form {shranjeno} submitted_form {poslano} other {pošiljanje ni "
      & "uspelo}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {veljaven vnos} invalid_input {neveljaven "
      & "vnos} required_input {obvezen vnos} optional_input {neobvezen vnos} "
      & "disabled_input {onemogočen vnos} other {vnos samo za branje}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {ni začeto} editing_form {urejanje} "
      & "dirty_form {neshranjene spremembe} saving_form {shranjevanje obrazca} "
      & "saved_form {obrazec shranjen} submitted_form {obrazec poslan} other "
      & "{{errors, plural, =0 {pošiljanje ni uspelo} one {pošiljanje ni "
      & "uspelo: {errors, number} napaka} two {pošiljanje ni uspelo: {errors, "
      & "number} napaki} few {pošiljanje ni uspelo: {errors, number} napake} "
      & "other {pošiljanje ni uspelo: {errors, number} napak}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {ni neshranjenih sprememb} one {{count, number} "
      & "neshranjena sprememba} two {{count, number} neshranjeni spremembi} few "
      & "{{count, number} neshranjene spremembe} other {{count, number} "
      & "neshranjenih sprememb}}");
   P ("label.markup.accessibility_issue_label",
      "{issue, select, missing_accessible_name {{target}: manjka dostopno "
      & "ime} low_contrast {{target}: nizek kontrast} skipped_heading_level "
      & "{{target}: preskočena raven naslova} missing_form_label {{target}: "
      & "manjka oznaka polja obrazca} invalid_aria {{target}: neveljaven ARIA} "
      & "keyboard_trap {{target}: past za tipkovnico} other {{target}: neznana "
      & "težava z dostopnostjo}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title} – povzetek dostopnosti: {landmarks, plural, one {{landmarks, "
      & "number} orientacijska točka} two {{landmarks, number} orientacijski "
      & "točki} few {{landmarks, number} orientacijske točke} other "
      & "{{landmarks, number} orientacijskih točk}}, {headings, plural, one "
      & "{{headings, number} naslov} two {{headings, number} naslova} few "
      & "{{headings, number} naslovi} other {{headings, number} naslovov}}, "
      & "{issues, plural, one {{issues, number} težava} two {{issues, number} "
      & "težavi} few {{issues, number} težave} other {{issues, number} "
      & "težav}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {dodajte dostopno ime} "
      & "low_contrast {povečajte kontrast besedila} skipped_heading_level "
      & "{uporabljajte zaporedne ravni naslovov} missing_form_label {povežite "
      & "oznako s kontrolnikom obrazca} invalid_aria {uporabite veljavno vlogo "
      & "ali atribut ARIA} keyboard_trap {zagotovite, da lahko fokus tipkovnice "
      & "zapusti komponento} other {preglejte težavo z dostopnostjo}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {ni težav z dostopnostjo} one {{issues, "
      & "number} težava z dostopnostjo} two {{issues, number} težavi z "
      & "dostopnostjo} few {{issues, number} težave z dostopnostjo} other "
      & "{{issues, number} težav z dostopnostjo}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {atribut id} class_attribute {atribut "
      & "class} data_attribute {atribut data} aria_attribute {atribut ARIA} "
      & "role_attribute {atribut role} link_attribute {atribut povezave} "
      & "media_attribute {atribut medija} form_attribute {atribut obrazca} "
      & "boolean_attribute {logični atribut} event_attribute {atribut za "
      & "obravnavo dogodka} other {neznan atribut}}");
end Labels_1;
