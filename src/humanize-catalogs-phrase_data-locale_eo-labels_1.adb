separate (Humanize.Catalogs.Phrase_Data.Locale_Eo)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {konto {name}: aktiva} invited_account "
      & "{konto {name}: invitita} locked_account {konto {name}: ŝlosita} "
      & "suspended_account {konto {name}: suspendita} deleted_account {konto "
      & "{name}: forigita} other {konto {name}: nekonata stato}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {aktiva konto} invited_account "
      & "{invitita konto} locked_account {ŝlosita konto} suspended_account "
      & "{suspendita konto} deleted_account {forigita konto} other {nekonata "
      & "kontostato}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {fidinda aparato} untrusted_device "
      & "{nefidinda aparato} new_device {nova aparato} other {blokita aparato}}");
   P ("label.accounts.last_active_label", "{name}: laste aktiva {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: ensaluto malsukcesis} other "
      & "{{name}: ensaluto sukcesis}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA ŝaltita} mfa_disabled {MFA "
      & "malŝaltita} mfa_required {MFA deviga} other {necesas restarigi MFA}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: aktiva seanco} expired_session "
      & "{{name}: seanco eksvalidiĝis} revoked_session {{name}: seanco "
      & "nuligita} idle_session {{name}: senaktiva seanco} other {{name}: "
      & "nekonata seancostato}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {aktiva seanco} expired_session {seanco "
      & "eksvalidiĝis} revoked_session {seanco nuligita} idle_session "
      & "{senaktiva seanco} other {nekonata seancostato}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {neniuj aldonaĵoj} one {1 aldonaĵo} other "
      & "{{count, number} aldonaĵoj}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, =0 {{name}: neniuj aldonaĵoj} one {{name}: 1 "
      & "aldonaĵo} other {{name}: {count, number} aldonaĵoj}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {dosiera aldonaĵo} image_attachment "
      & "{bilda aldonaĵo} video_attachment {videa aldonaĵo} audio_attachment "
      & "{sona aldonaĵo} document_attachment {dokumenta aldonaĵo} "
      & "archive_attachment {arkiva aldonaĵo} other {ligila aldonaĵo}}");
   P ("label.attachments.attachment_label",
      "{kind, select, file_attachment {dosiero} image_attachment {bildo} "
      & "video_attachment {video} audio_attachment {sondosiero} "
      & "document_attachment {dokumento} archive_attachment {arkivo} other "
      & "{ligilo}} {name}: {state, select, pending_attachment {atendas "
      & "alŝuton} uploading_attachment {alŝutata} uploaded_attachment "
      & "{alŝutita} failed_attachment {alŝuto malsukcesis} removed_attachment "
      & "{forigita} other {blokita}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {aldonaĵo atendas alŝuton} "
      & "uploading_attachment {aldonaĵo alŝutata} uploaded_attachment "
      & "{aldonaĵo alŝutita} failed_attachment {alŝuto de aldonaĵo "
      & "malsukcesis} removed_attachment {aldonaĵo forigita} other {aldonaĵo "
      & "blokita}}");
   P ("label.attachments.download_label", "elŝuti {name}");
   P ("label.attachments.expiring_link_label", "{name}: ligilo eksvalidiĝos {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "antaŭrigardi {name}");
   P ("label.attachments.remove_label", "forigi {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: ne skanita} scanning {{name}: "
      & "skanata} safe {{name}: skano – sekura} suspicious {{name}: skano – "
      & "suspektinda} other {{name}: skano – infektita}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {ne skanita} scanning {skanata} safe "
      & "{skano: sekura} suspicious {skano: suspektinda} other {skano: "
      & "infektita}}");
   P ("label.attachments.upload_error_label", "alŝuto de {name} malsukcesis: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {defaŭlta insigno} new_badge "
      & "{nova insigno} updated_badge {ĝisdatigita insigno} deprecated_badge "
      & "{malrekomendita insigno} selected_badge {elektita insigno} "
      & "disabled_badge {malŝaltita insigno} other {fermebla insigno}}, {tone, "
      & "select, neutral_tone {neŭtrala} info_tone {informa} success_tone "
      & "{sukcesa} warning_tone {averta} danger_tone {danĝera} other "
      & "{mildigita}} tono");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {insigno de malalta prioritato} "
      & "medium_priority {insigno de meza prioritato} high_priority {insigno de "
      & "alta prioritato} other {insigno de kritika prioritato}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {defaŭlta insigno} new_badge {nova "
      & "insigno} updated_badge {ĝisdatigita insigno} deprecated_badge "
      & "{malrekomendita insigno} selected_badge {elektita insigno} "
      & "disabled_badge {malŝaltita insigno} other {fermebla insigno}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {neŭtrala insigno} info_tone {informa "
      & "insigno} success_tone {sukcesa insigno} warning_tone {averta insigno} "
      & "danger_tone {danĝera insigno} other {mildigita insigno}}");
   P ("label.badges.chip_label",
      "{selected, select, false {{name}: peceto} other {{name}: peceto, "
      & "elektita}}");
   P ("label.badges.count_badge_label", "{count, plural, =0 {{name}: neniu} other {{name}: {count, number}}}");
   P ("label.badges.deprecated_label", "{name}: malrekomendita");
   P ("label.badges.dismiss_label", "fermi {name}");
   P ("label.badges.new_label", "{name}: nova");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {neniuj kaŝitaj insignoj} one {+1 plia "
      & "insigno} other {+{hidden_count, number} pliaj insignoj}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: insigno de malalta "
      & "prioritato} medium_priority {{name}: insigno de meza prioritato} "
      & "high_priority {{name}: insigno de alta prioritato} other {{name}: "
      & "insigno de kritika prioritato}}");
   P ("label.badges.status_badge_label",
      "stato {name}, {tone, select, neutral_tone {neŭtrala} info_tone "
      & "{informa} success_tone {sukcesa} warning_tone {averta} danger_tone "
      & "{danĝera} other {mildigita}} tono");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {neniuj etikedoj} one {1 etikedo} other {{count, "
      & "number} etikedoj}}");
   P ("label.badges.tag_label", "etikedo {name}");
   P ("label.badges.updated_label", "{name}: ĝisdatigita");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefakto alŝutita} "
      & "artifact_missing {artefakto mankas} artifact_expired {artefakto "
      & "eksvalidiĝis} other {artefakto kontrolita}}");
   P ("label.builds.benchmark_label", "komparmezuro {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {konstruo {name} atendas en vico} "
      & "build_running {konstruo {name} rulata} build_passed {konstruo {name} "
      & "sukcesis} build_failed {konstruo {name} malsukcesis} snapshot_build "
      & "{{name}: momentkopia konstruo} other {{name}: eldona konstruo}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {konstruo atendas en vico} build_running "
      & "{konstruo rulata} build_passed {konstruo sukcesis} build_failed "
      & "{konstruo malsukcesis} snapshot_build {momentkopia konstruo} other "
      & "{eldona konstruo}}");
   P ("label.builds.coverage_label", "kovro {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {eldona kontrolo trapasita} gate_failed "
      & "{eldona kontrolo malsukcesis} gate_warning {eldona kontrolo: averto} "
      & "other {eldono blokita de kontrolo}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {neniu testo sukcesis} "
      & "one {1 testo sukcesis} other {{count, number} testoj sukcesis}}} "
      & "failed_test {{count, plural, =0 {neniu testo malsukcesis} one {1 testo "
      & "malsukcesis} other {{count, number} testoj malsukcesis}}} skipped_test "
      & "{{count, plural, =0 {neniu testo preterlasita} one {1 testo "
      & "preterlasita} other {{count, number} testoj preterlasitaj}}} "
      & "flaky_test {{count, plural, =0 {neniuj nestabilaj testoj} one {1 "
      & "nestabila testo} other {{count, number} nestabilaj testoj}}} other "
      & "{{count, plural, =0 {neniuj atenditaj malsukcesoj} one {1 atendita "
      & "malsukceso} other {{count, number} atenditaj malsukcesoj}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {sukcesis} failed_test {malsukcesis} "
      & "skipped_test {preterlasita} flaky_test {nestabila} other {atendita "
      & "malsukceso}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name}: "
      & "senŝanĝa, malŝaltita} other {{field_name}: ŝanĝita de malŝaltita "
      & "al ŝaltita}}} other {{new_value, select, false {{field_name}: "
      & "ŝanĝita de ŝaltita al malŝaltita} other {{field_name}: senŝanĝa, "
      & "ŝaltita}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {aldonita} removed_change {forigita} "
      & "modified_change {ŝanĝita} renamed_change {renomita} unchanged_change "
      & "{senŝanĝa} metadata_change {metadatumoj ŝanĝitaj} moved_change "
      & "{movita} conflict_change {konflikto} other {nekonata ŝanĝo}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {informa ŝanĝo} minor_change "
      & "{malgranda ŝanĝo} major_change {granda ŝanĝo} other {rompa "
      & "ŝanĝo}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}: senŝanĝa} "
      & "other {{unchanged, plural, =0 {{field_name} ŝanĝita: aldonite "
      & "{added, number}} other {{field_name} ŝanĝita: aldonite {added, "
      & "number}, senŝanĝe {unchanged, number}}}}}} other {{added, plural, =0 "
      & "{{unchanged, plural, =0 {{field_name} ŝanĝita: forigite {removed, "
      & "number}} other {{field_name} ŝanĝita: forigite {removed, number}, "
      & "senŝanĝe {unchanged, number}}}} other {{unchanged, plural, =0 "
      & "{{field_name} ŝanĝita: aldonite {added, number}, forigite {removed, "
      & "number}} other {{field_name} ŝanĝita: aldonite {added, number}, "
      & "forigite {removed, number}, senŝanĝe {unchanged, number}}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {neniuj konfliktoj} one {1 konflikto} other "
      & "{{count, number} konfliktoj}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} movita pli malfrue, de "
      & "{old_label} al {new_label}} other {{field_name} movita pli frue, de "
      & "{old_label} al {new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} ŝanĝita de {old_label} al {new_label}");
   P ("label.changes.field_change_label", "{field_name} ŝanĝita de {old_value} al {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name}: aldonita} removed_change {{name}: "
      & "forigita} modified_change {{name}: ŝanĝita} renamed_change {{name}: "
      & "renomita} unchanged_change {{name}: senŝanĝa} metadata_change "
      & "{{name}: metadatumoj ŝanĝitaj} moved_change {{name}: movita} "
      & "conflict_change {{name}: konflikto} other {{name}: nekonata ŝanĝo}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {nur metadatumoj ŝanĝiĝis} one {nur 1 metadatuma "
      & "kampo ŝanĝiĝis} other {nur {count, number} metadatumaj kampoj "
      & "ŝanĝiĝis}}");
   P ("label.changes.move_label", "{name} movita de {from} al {to}");
   P ("label.changes.no_changes_label", "neniuj ŝanĝoj");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {neniuj liniaj "
      & "ŝanĝoj} one {1 linio aldonita} other {{lines_added, number} linioj "
      & "aldonitaj}}} one {{lines_added, plural, =0 {1 linio forigita} one {1 "
      & "linio aldonita, 1 linio forigita} other {{lines_added, number} linioj "
      & "aldonitaj, 1 linio forigita}}} other {{lines_added, plural, =0 "
      & "{{lines_removed, number} linioj forigitaj} one {1 linio aldonita, "
      & "{lines_removed, number} linioj forigitaj} other {{lines_added, number} "
      & "linioj aldonitaj, {lines_removed, number} linioj forigitaj}}}}");
   P ("label.changes.rename_label", "renomita de {old_name} al {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} skizis komenton} "
      & "published_comment {{author} komentis} edited_comment {{author} "
      & "redaktis komenton} deleted_comment {{author} forigis komenton} "
      & "resolved_comment {{author} solvis komenton} unresolved_comment "
      & "{{author} remalfermis komenton} pinned_comment {{author} alpinglis "
      & "komenton} other {{author} kaŝis komenton}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {neniuj komentoj} one {1 komento} other {{count, "
      & "number} komentoj}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author}: komenta malneto} "
      & "published_comment {{author}: publikigita komento} edited_comment "
      & "{{author}: redaktita komento} deleted_comment {{author}: forigita "
      & "komento} resolved_comment {{author}: solvita komento} "
      & "unresolved_comment {{author}: nesolvita komento} pinned_comment "
      & "{{author}: alpinglita komento} other {{author}: kaŝita komento}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {komenta malneto} published_comment "
      & "{publikigita komento} edited_comment {redaktita komento} "
      & "deleted_comment {forigita komento} resolved_comment {solvita komento} "
      & "unresolved_comment {nesolvita komento} pinned_comment {alpinglita "
      & "komento} other {kaŝita komento}}");
   P ("label.comments.deleted_label", "{author} forigis komenton");
   P ("label.comments.edited_label", "redaktita {time_text}");
   P ("label.comments.hide_comment_label", "kaŝi komenton: {reason}");
   P ("label.comments.lock_thread_label", "ŝlosi la fadenon {name}");
   P ("label.comments.mention_label", "{actor} menciis {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {neniuj partoprenantoj} one {1 partoprenanto} other "
      & "{{count, number} partoprenantoj}}");
   P ("label.comments.pin_label", "alpingli {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {ŝato-reago} dislike_reaction "
      & "{malŝato-reago} heart_reaction {kor-reago} laugh_reaction {rid-reago} "
      & "confused_reaction {konfuz-reago} hooray_reaction {hura-reago} "
      & "rocket_reaction {raket-reago} other {okul-reago}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {neniuj ŝatoj} one "
      & "{1 ŝato} other {{count, number} ŝatoj}}} dislike_reaction {{count, "
      & "plural, =0 {neniuj malŝatoj} one {1 malŝato} other {{count, number} "
      & "malŝatoj}}} heart_reaction {{count, plural, =0 {neniuj koroj} one {1 "
      & "koro} other {{count, number} koroj}}} laugh_reaction {{count, plural, "
      & "=0 {neniuj ridoj} one {1 rido} other {{count, number} ridoj}}} "
      & "confused_reaction {{count, plural, =0 {neniuj konfuz-reagoj} one {1 "
      & "konfuz-reago} other {{count, number} konfuz-reagoj}}} hooray_reaction "
      & "{{count, plural, =0 {neniuj huraoj} one {1 hurao} other {{count, "
      & "number} huraoj}}} rocket_reaction {{count, plural, =0 {neniuj raketoj} "
      & "one {1 raketo} other {{count, number} raketoj}}} other {{count, "
      & "plural, =0 {neniuj okul-reagoj} one {1 okul-reago} other {{count, "
      & "number} okul-reagoj}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {neniuj respondoj} one {1 respondo} other {{count, "
      & "number} respondoj}}");
   P ("label.comments.resolved_label", "{name}: solvita");
   P ("label.comments.subscribe_label", "aboni {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {neniuj fadenoj} one {1 fadeno} other {{count, "
      & "number} fadenoj}}");
   P ("label.comments.thread_label",
      "{state, select, open_thread {{count, plural, =0 {{name}: malfermita "
      & "fadeno} one {{name}: malfermita fadeno, 1 komento} other {{name}: "
      & "malfermita fadeno, {count, number} komentoj}}} resolved_thread "
      & "{{count, plural, =0 {{name}: solvita fadeno} one {{name}: solvita "
      & "fadeno, 1 komento} other {{name}: solvita fadeno, {count, number} "
      & "komentoj}}} locked_thread {{count, plural, =0 {{name}: ŝlosita "
      & "fadeno} one {{name}: ŝlosita fadeno, 1 komento} other {{name}: "
      & "ŝlosita fadeno, {count, number} komentoj}}} other {{count, plural, =0 "
      & "{{name}: arkivita fadeno} one {{name}: arkivita fadeno, 1 komento} "
      & "other {{name}: arkivita fadeno, {count, number} komentoj}}}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {malfermita fadeno} resolved_thread "
      & "{solvita fadeno} locked_thread {ŝlosita fadeno} other {arkivita "
      & "fadeno}}");
   P ("label.comments.unpin_label", "malalpingli {name}");
   P ("label.comments.unsubscribe_label", "malaboni {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name}: pliboniĝis} regressed {{name}: "
      & "malpliboniĝis} unchanged {{name}: senŝanĝa} within_tolerance "
      & "{{name}: ene de toleremo} outside_tolerance {{name}: ekster toleremo} "
      & "new_value {{name}: nova valoro} removed_value {{name}: valoro "
      & "forigita} other {{name}: bazlinio ne disponebla}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {pliboniĝis} regressed {malpliboniĝis} "
      & "unchanged {senŝanĝa} within_tolerance {ene de toleremo} "
      & "outside_tolerance {ekster toleremo} new_value {nova valoro} "
      & "removed_value {valoro forigita} other {bazlinio ne disponebla}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name} pliboniĝis je {difference_text}} "
      & "regressed {{name} malpliboniĝis je {difference_text}} unchanged "
      & "{{name}: senŝanĝa ({difference_text})} within_tolerance {{name}: ene "
      & "de toleremo ({difference_text})} outside_tolerance {{name}: ekster "
      & "toleremo ({difference_text})} new_value {{name}: nova valoro "
      & "({difference_text})} removed_value {{name}: valoro forigita "
      & "({difference_text})} other {{name}: bazlinio ne disponebla "
      & "({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name} pliboniĝis je {difference_text}, "
      & "toleremo {tolerance_text}} regressed {{name} malpliboniĝis je "
      & "{difference_text}, toleremo {tolerance_text}} unchanged {{name}: "
      & "senŝanĝa ({difference_text}), toleremo {tolerance_text}} "
      & "within_tolerance {{name}: ene de toleremo ({difference_text}), "
      & "toleremo {tolerance_text}} outside_tolerance {{name}: ekster toleremo "
      & "({difference_text}), toleremo {tolerance_text}} new_value {{name}: "
      & "nova valoro ({difference_text}), toleremo {tolerance_text}} "
      & "removed_value {{name}: valoro forigita ({difference_text}), toleremo "
      & "{tolerance_text}} other {{name}: bazlinio ne disponebla "
      & "({difference_text}), toleremo {tolerance_text}}}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {nevalida vico} duplicate_record {duobla "
      & "rikordo} missing_column {mankanta kolumno} unknown_field {nekonata "
      & "kampo} schema_mismatch {skema malkongruo} other {preterlasita "
      & "rikordo}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {provrulo sukcesis} dry_run_failed "
      & "{provrulo malsukcesis} import_valid {importo valida} import_invalid "
      & "{importo nevalida} other {parta importo}}");
   P ("label.data_quality.import_result_label",
      "{state, select, dry_run_passed {{name}: provrulo sukcesis – "
      & "akceptite {accepted, number}, rifuzite {rejected, number}} "
      & "dry_run_failed {{name}: provrulo malsukcesis – akceptite {accepted, "
      & "number}, rifuzite {rejected, number}} import_valid {{name}: importo "
      & "valida – akceptite {accepted, number}, rifuzite {rejected, number}} "
      & "import_invalid {{name}: importo nevalida – akceptite {accepted, "
      & "number}, rifuzite {rejected, number}} other {{name}: parta importo – "
      & "akceptite {accepted, number}, rifuzite {rejected, number}}}");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {neniuj nevalidaj "
      & "vicoj} one {1 nevalida vico} other {{count, number} nevalidaj vicoj}}} "
      & "duplicate_record {{count, plural, =0 {neniuj duoblaj rikordoj} one {1 "
      & "duobla rikordo} other {{count, number} duoblaj rikordoj}}} "
      & "missing_column {{count, plural, =0 {neniuj mankantaj kolumnoj} one {1 "
      & "mankanta kolumno} other {{count, number} mankantaj kolumnoj}}} "
      & "unknown_field {{count, plural, =0 {neniuj nekonataj kampoj} one {1 "
      & "nekonata kampo} other {{count, number} nekonataj kampoj}}} "
      & "schema_mismatch {{count, plural, =0 {neniuj skemaj malkongruoj} one {1 "
      & "skema malkongruo} other {{count, number} skemaj malkongruoj}}} other "
      & "{{count, plural, =0 {neniuj preterlasitaj rikordoj} one {1 "
      & "preterlasita rikordo} other {{count, number} preterlasitaj "
      & "rikordoj}}}}");
   P ("label.data_quality.row_issue_label",
      "{issue, select, invalid_row {vico {row, number}: nevalida} "
      & "duplicate_record {vico {row, number}: duobla rikordo} missing_column "
      & "{vico {row, number}: mankas kolumno} unknown_field {vico {row, "
      & "number}: nekonata kampo} schema_mismatch {vico {row, number}: skema "
      & "malkongruo} other {vico {row, number}: rikordo preterlasita}}");
   P ("label.data_quality.source_file_issue_label",
      "{issue, select, invalid_row {{file_name}: nevalida vico} "
      & "duplicate_record {{file_name}: duobla rikordo} missing_column "
      & "{{file_name}: mankanta kolumno} unknown_field {{file_name}: nekonata "
      & "kampo} schema_mismatch {{file_name}: skema malkongruo} other "
      & "{{file_name}: preterlasita rikordo}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefakto preta} artifact_uploaded "
      & "{artefakto alŝutita} artifact_signed {artefakto subskribita} "
      & "artifact_missing {artefakto mankas} other {artefakto eksvalidiĝis}}");
   P ("label.deployments.deployment_label",
      "{name} → {environment}: {state, select, queued_deployment {deplojo "
      & "envicigita} deploying {deplojata} deployed {deplojita} "
      & "failed_deployment {deplojo malsukcesis} rolled_back {malfarita} "
      & "blocked_deployment {deplojo blokita} other {deplojo nuligita}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {deplojo envicigita} deploying "
      & "{deplojata} deployed {deplojita} failed_deployment {deplojo "
      & "malsukcesis} rolled_back {malfarita} blocked_deployment {deplojo "
      & "blokita} other {deplojo nuligita}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {medio sana} drifting_environment "
      & "{medio devias} locked_environment {medio ŝlosita} "
      & "maintenance_environment {medio en prizorgado} other {stato de medio "
      & "nekonata}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {neniu migrado} migration_pending "
      & "{migrado atendanta} migrating {migrado rulas} migration_complete "
      & "{migrado finita} other {migrado malsukcesis}}");
   P ("label.deployments.promotion_label", "{name}: promociita el {from_environment} al {to_environment}");
   P ("label.deployments.rollback_label", "{name}: malfaro al {target}");
   P ("label.deployments.rollout_label", "{name}: laŭpaŝa deplojo {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {neniuj trafitaj eroj} other {{count, plural, one "
      & "{{count, number} trafita ero} other {{count, number} trafitaj eroj}}}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {sukcesis} failed_check "
      & "{malsukcesis} warning_check {avertoj} skipped_check {preterlasita} "
      & "pending_check {atendanta} other {rulas}} ({duration_s, plural, one "
      & "{{duration_s, number} sekundo} other {{duration_s, number} sekundoj}})");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {sukcesis} failed_check "
      & "{malsukcesis} warning_check {avertoj} skipped_check {preterlasita} "
      & "pending_check {atendanta} other {rulas}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {sukcesis} failed_check {malsukcesis} "
      & "warning_check {avertoj} skipped_check {preterlasita} pending_check "
      & "{atendanta} other {rulas}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {atendis valoron por {subject}} "
      & "expected_unit {atendis unuon por {subject}} invalid_range {nevalida "
      & "intervalo por {subject}} end_before_start {intervalfino antaŭ komenco "
      & "por {subject}} unknown_field {nekonata kampo {subject}} "
      & "unsafe_redacted_value {nesekura valoro kaŝita por {subject}} "
      & "unsupported_syntax {nesubtenata sintakso por {subject}} other "
      & "{diagnoza klarigo por {subject}}}{position, plural, =0 {; uzu "
      & "{suggestion}} other { (pozicio {position, number}); uzu {suggestion}}}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {informo} notice_severity {rimarko} "
      & "warning_severity {averto} error_severity {eraro} critical_severity "
      & "{kritika eraro} other {bloka eraro}} ({line, plural, =0 {{path}} other "
      & "{{path}, linio {line, number}}}): {message}");
   P ("label.diagnostics.failed_at_label",
      "malsukcesis ĉe {line, plural, =0 {{path}} other {{column, plural, =0 "
      & "{{path}, linio {line, number}} other {{path}, linio {line, number}, "
      & "kolumno {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {informo} notice_severity {rimarko} "
      & "warning_severity {averto} error_severity {eraro} critical_severity "
      & "{kritika eraro} other {bloka eraro}} en {field_name}: {message}");
   P ("label.diagnostics.first_failure_label",
      "unua malsukceso en {check_name} ĉe {line, plural, =0 {{path}} other "
      & "{{path}, linio {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{neniuj problemoj} other {{notices, plural, one {{notices, number} "
      & "rimarko} other {{notices, number} rimarkoj}}}}} other {{notices, "
      & "plural, =0 {{warnings, plural, one {{warnings, number} averto} other "
      & "{{warnings, number} avertoj}}} other {{warnings, plural, one "
      & "{{warnings, number} averto} other {{warnings, number} avertoj}}, "
      & "{notices, plural, one {{notices, number} rimarko} other {{notices, "
      & "number} rimarkoj}}}}}}} other {{warnings, plural, =0 {{notices, "
      & "plural, =0 {{errors, plural, one {{errors, number} eraro} other "
      & "{{errors, number} eraroj}}} other {{errors, plural, one {{errors, "
      & "number} eraro} other {{errors, number} eraroj}}, {notices, plural, one "
      & "{{notices, number} rimarko} other {{notices, number} rimarkoj}}}}} "
      & "other {{notices, plural, =0 {{errors, plural, one {{errors, number} "
      & "eraro} other {{errors, number} eraroj}}, {warnings, plural, one "
      & "{{warnings, number} averto} other {{warnings, number} avertoj}}} other "
      & "{{errors, plural, one {{errors, number} eraro} other {{errors, number} "
      & "eraroj}}, {warnings, plural, one {{warnings, number} averto} other "
      & "{{warnings, number} avertoj}}, {notices, plural, one {{notices, "
      & "number} rimarko} other {{notices, number} rimarkoj}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, linio "
      & "{line, number}} other {{path}, linio {line, number}, kolumno {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "nesubtenata sintakso por {family, select, byte_parser {bajta "
      & "analizilo} duration_parser {daŭra analizilo} date_time_parser "
      & "{dat-tempa analizilo} color_parser {kolora analizilo} url_parser "
      & "{URL-analizilo} unit_parser {unuo-analizilo} recurrence_parser "
      & "{ripetiĝa analizilo} domain_label_parser {domajnetikeda analizilo} "
      & "other {analizilo}} {error}{position, plural, =0 {;} other { (pozicio "
      & "{position, number});}} {family, select, byte_parser {uzu B, kB, MB, "
      & "GB, KiB, MiB, GiB aŭ TiB} duration_parser {uzu ms, s, min, h, d, w, "
      & "month aŭ year} date_time_parser {uzu ISO-daton, nomitan tagon aŭ "
      & "horon} color_parser {uzu hex, rgb(), hsl(), lab(), lch() aŭ nomitan "
      & "koloron} url_parser {uzu skemon, gastiganton, vojon, informpeton aŭ "
      & "fragmenton} unit_parser {uzu subtenatan Humanize-unuon} "
      & "recurrence_parser {uzu cron aŭ ripetiĝan formon every/weekday} "
      & "domain_label_parser {uzu determinisman Humanize-domajnetikedon} other "
      & "{uzu subtenatan enigformon}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {sukcesis} failed_check {malsukcesis} "
      & "warning_check {avertoj} skipped_check {preterlasita} pending_check "
      & "{atendanta} other {rulas}}, {notices, plural, =0 {sen rimarkoj} other "
      & "{{notices, plural, one {{notices, number} rimarko} other {{notices, "
      & "number} rimarkoj}}}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {reprovo 1 el 1} other "
      & "{reprovo {attempt, number} el 1: limo superita}}} other {reprovo "
      & "{attempt, number} el {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {informo} notice_severity {rimarko} "
      & "warning_severity {averto} error_severity {eraro} critical_severity "
      & "{kritika eraro} other {bloka eraro}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {konstruaj diagnozoj} test_source "
      & "{testaj diagnozoj} lint_source {lint-diagnozoj} import_source "
      & "{importaj diagnozoj} validation_source {validigaj diagnozoj} "
      & "runtime_source {rultempaj diagnozoj} security_source {sekurecaj "
      & "diagnozoj} other {diagnozoj}}");
   P ("label.diagnostics.source_summary_label",
      "{source, select, build_source {konstruaj diagnozoj} test_source "
      & "{testaj diagnozoj} lint_source {lint-diagnozoj} import_source "
      & "{importaj diagnozoj} validation_source {validigaj diagnozoj} "
      & "runtime_source {rultempaj diagnozoj} security_source {sekurecaj "
      & "diagnozoj} other {diagnozoj}}: {count, number}");
   P ("label.diagnostics.suggested_action_label", "sekve: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {domajna gastiganto} ipv4_host "
      & "{IPv4-adreso} ipv6_host {IPv6-adreso} localhost_host {loka gastiganto} "
      & "private_network_host {privatreta adreso} other {nekonata gastiganto}}");
   P ("label.events.all_day_label", "{name}: tuttaga evento");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {ne respondis} accepted {akceptis} "
      & "declined {rifuzis} maybe {eble} other {en atendolisto}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {neniuj partoprenantoj} other {{count, plural, one "
      & "{{count, number} partoprenanto} other {{count, number} "
      & "partoprenantoj}}}}");
   P ("label.events.canceled_label", "{name}: nuligita");
   P ("label.events.check_in_label", "registriĝi ĉe {name}");
   P ("label.events.conference_link_label", "{name}: konferenca ligilo");
   P ("label.events.event_count_label",
      "{count, plural, =0 {neniuj eventoj} other {{count, plural, one "
      & "{{count, number} evento} other {{count, number} eventoj}}}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {planita} tentative_event "
      & "{provizora} in_progress_event {okazanta} completed_event {finita} "
      & "canceled_event {nuligita} other {prokrastita}}");
   P ("label.events.event_location_label", "{name} ĉe {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {planita evento} tentative_event "
      & "{provizora evento} in_progress_event {okazanta evento} completed_event "
      & "{finita evento} canceled_event {nuligita evento} other {prokrastita "
      & "evento}}");
   P ("label.events.event_time_label", "{name} je {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {publika evento} private_event "
      & "{privata evento} busy_event {okupita} other {libera}}");
   P ("label.events.organizer_label", "organizita de {name}");
   P ("label.events.rsvp_label",
      "respondo al invito: {state, select, not_responded {ne respondis} "
      & "accepted {akceptis} declined {rifuzis} maybe {eble} other {en "
      & "atendolisto}}");
   P ("label.events.reminder_label", "memorigo {time_text}");
   P ("label.events.rescheduled_label", "{name}: movita al {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {{used, number} signo} other {{used, number} "
      & "signoj}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {neniu signolimo} other {maksimume {limit, plural, "
      & "one {{limit, number} signo} other {{limit, number} signoj}}}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {{used, number} signo} other "
      & "{{used, number} signoj}}} other {{used, number} el {limit, number} "
      & "{limit, plural, one {signo} other {signoj}}}}");
   P ("label.forms.field_label",
      "{name}: {required, select, false {nedeviga kampo} other {deviga "
      & "kampo}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {valida} invalid_input {nevalida} "
      & "required_input {deviga} optional_input {nedeviga} disabled_input "
      & "{malŝaltita} other {nur legebla}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {neniuj problemoj en "
      & "formularo} other {{warnings, plural, one {{warnings, number} averto} "
      & "other {{warnings, number} avertoj}}}}} other {{warnings, plural, =0 "
      & "{{errors, plural, one {{errors, number} eraro} other {{errors, number} "
      & "eraroj}}} other {{errors, plural, one {{errors, number} eraro} other "
      & "{{errors, number} eraroj}}, {warnings, plural, one {{warnings, number} "
      & "averto} other {{warnings, number} avertoj}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {ne komencita} editing_form {redaktata} "
      & "dirty_form {nekonservitaj ŝanĝoj} saving_form {konservata} "
      & "saved_form {konservita} submitted_form {sendita} other {sendo "
      & "malsukcesis}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {valida enigo} invalid_input {nevalida "
      & "enigo} required_input {deviga enigo} optional_input {nedeviga enigo} "
      & "disabled_input {malŝaltita enigo} other {nur legebla enigo}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {ne komencita} editing_form {redaktata} "
      & "dirty_form {nekonservitaj ŝanĝoj} saving_form {formularo konservata} "
      & "saved_form {formularo konservita} submitted_form {formularo sendita} "
      & "other {{errors, plural, =0 {sendo malsukcesis} other {sendo "
      & "malsukcesis: {errors, plural, one {{errors, number} eraro} other "
      & "{{errors, number} eraroj}}}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {neniuj nekonservitaj ŝanĝoj} other {{count, "
      & "plural, one {{count, number} nekonservita ŝanĝo} other {{count, "
      & "number} nekonservitaj ŝanĝoj}}}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {mankas alirebla "
      & "nomo} low_contrast {malalta kontrasto} skipped_heading_level "
      & "{preterlasita titolnivelo} missing_form_label {mankas formulara "
      & "etikedo} invalid_aria {nevalida ARIA} keyboard_trap {klavara kaptilo} "
      & "other {nekonata alirebleca problemo}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}: alirebleca resumo — {landmarks, plural, one {{landmarks, "
      & "number} orientilo} other {{landmarks, number} orientiloj}}, {headings, "
      & "plural, one {{headings, number} titolo} other {{headings, number} "
      & "titoloj}}, {issues, plural, one {{issues, number} problemo} other "
      & "{{issues, number} problemoj}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {aldonu alireblan nomon} "
      & "low_contrast {pliigu la tekstan kontraston} skipped_heading_level {uzu "
      & "sinsekvajn titolnivelojn} missing_form_label {ligu etikedon al la "
      & "formulara regilo} invalid_aria {uzu validan ARIA-rolon aŭ -atributon} "
      & "keyboard_trap {certigu, ke la klavara fokuso povas forlasi la "
      & "komponanton} other {kontrolu la alireblecan problemon}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {neniuj alireblecaj problemoj} other "
      & "{{issues, plural, one {{issues, number} alirebleca problemo} other "
      & "{{issues, number} alireblecaj problemoj}}}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id-atributo} class_attribute "
      & "{class-atributo} data_attribute {data-atributo} aria_attribute "
      & "{ARIA-atributo} role_attribute {role-atributo} link_attribute {ligila "
      & "atributo} media_attribute {aŭdvida atributo} form_attribute "
      & "{formulara atributo} boolean_attribute {bulea atributo} "
      & "event_attribute {eventotraktila atributo} other {nekonata atributo}}");
   P ("label.markup.form_error_summary_label",
      "{form_name}: {errors, plural, =0 {{warnings, plural, =0 {neniuj "
      & "problemoj en formularo} other {{warnings, plural, one {{warnings, "
      & "number} averto} other {{warnings, number} avertoj}}}}} other "
      & "{{warnings, plural, =0 {{errors, plural, one {{errors, number} eraro} "
      & "other {{errors, number} eraroj}}} other {{errors, plural, one "
      & "{{errors, number} eraro} other {{errors, number} eraroj}}, {warnings, "
      & "plural, one {{warnings, number} averto} other {{warnings, number} "
      & "avertoj}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {orientilo: standardo} navigation_role "
      & "{orientilo: navigado} main_role {orientilo: ĉefa enhavo} "
      & "complementary_role {orientilo: komplementa enhavo} contentinfo_role "
      & "{orientilo: enhavinformo} search_role {orientilo: serĉo} form_role "
      & "{orientilo: formularo} region_role {orientilo: regiono} dialog_role "
      & "{dialogo} alert_role {viva regiono: alarmo} status_role {viva regiono: "
      & "stato} other {nekonata orientilo}}");
   P ("label.markup.live_region_update_label",
      "{region}, {polite, select, false {urĝa ĝisdatigo} other {ĝentila "
      & "ĝisdatigo}}: {update}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {teksta enhavo} html_content {HTML-enhavo} "
      & "json_content {JSON-enhavo} xml_content {XML-enhavo} image_content "
      & "{bilda enhavo} audio_content {sona enhavo} video_content {videa "
      & "enhavo} font_content {tipara enhavo} archive_content {arkiva enhavo} "
      & "binary_content {duuma enhavo} form_content {formulara enhavo} other "
      & "{nekonata enhavo}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {dokumenta etikedo} metadata_tag "
      & "{metadatuma etikedo} section_tag {sekcia etikedo} text_tag {teksta "
      & "etikedo} link_tag {ligila etikedo} media_tag {aŭdvida etikedo} "
      & "form_tag {formulara etikedo} table_tag {tabela etikedo} "
      & "interactive_tag {interaga etikedo} scripting_tag {skripta etikedo} "
      & "other {nekonata etikedo}}");
   P ("label.media.duration_label", "daŭro {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {bildo} video_media {video} audio_media "
      & "{sono} pdf_document {PDF-dokumento} text_document {teksta dokumento} "
      & "archive_media {arkivo} other {aŭdvidaĵo}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {preta} processing_media {traktata} "
      & "transcoding_media {transkodata} thumbnail_missing {miniaturo "
      & "nedisponebla} metadata_missing {metadatumoj mankas} locked_document "
      & "{dokumento ŝlosita} other {nedisponebla}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {bildo} video_media {video} "
      & "audio_media {sono} pdf_document {PDF-dokumento} text_document {teksta "
      & "dokumento} archive_media {arkivo} other {aŭdvidaĵo}}): {state, "
      & "select, ready_media {preta} processing_media {traktata} "
      & "transcoding_media {transkodata} thumbnail_missing {miniaturo "
      & "nedisponebla} metadata_missing {metadatumoj mankas} locked_document "
      & "{ŝlosita} other {nedisponebla}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {neniuj paĝoj} other {{pages, plural, one {{pages, "
      & "number} paĝo} other {{pages, number} paĝoj}}}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "{item}: apelacio, {state, select, open_report {raporto malfermita} "
      & "triaged_report {raporto taksita} actioned_report {agoj faritaj} "
      & "dismissed_report {raporto malakceptita} appealed_report {raporto "
      & "apelaciita} other {raporto fermita}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {neniu moderiga ago} flagged {markita} "
      & "hidden {kaŝita de moderiganto} restored {restarigita} marked_spam "
      & "{markita kiel spamo} removed {forigita} other {eskaladita}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {neniu moderiga ago} flagged "
      & "{markita} hidden {kaŝita de moderiganto} restored {restarigita} "
      & "marked_spam {markita kiel spamo} removed {forigita} other "
      & "{eskaladita}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {moderiga vico malplena} "
      & "other {atendas kontrolon: {pending, number}}}} other {atendas "
      & "kontrolon: {pending, number}, eskaladitaj: {escalated, number}}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {raporto malfermita} "
      & "triaged_report {raporto taksita} actioned_report {agoj faritaj} "
      & "dismissed_report {raporto malakceptita} appealed_report {raporto "
      & "apelaciita} other {raporto fermita}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {raporto malfermita} triaged_report "
      & "{raporto taksita} actioned_report {agoj faritaj} dismissed_report "
      & "{raporto malakceptita} appealed_report {raporto apelaciita} other "
      & "{raporto fermita}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {atendas kontrolon} approved "
      & "{aprobita} rejected {malaprobita} needs_changes {bezonas ŝanĝojn} "
      & "other {kontrolo eskaladita}}");
end Labels_1;
