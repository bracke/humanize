separate (Humanize.Catalogs.Phrase_Data.Locale_Sw)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {akaunti {name} inatumika} "
      & "invited_account {akaunti {name} imealikwa} locked_account {akaunti "
      & "{name} imefungwa} suspended_account {akaunti {name} imesimamishwa} "
      & "deleted_account {akaunti {name} imefutwa} other {akaunti {name}: hali "
      & "haijulikani}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {akaunti inayotumika} invited_account "
      & "{akaunti iliyoalikwa} locked_account {akaunti iliyofungwa} "
      & "suspended_account {akaunti iliyosimamishwa} deleted_account {akaunti "
      & "iliyofutwa} other {hali ya akaunti haijulikani}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {kifaa kinachoaminika} untrusted_device "
      & "{kifaa kisichoaminika} new_device {kifaa kipya} other {kifaa "
      & "kilichozuiwa}}");
   P ("label.accounts.last_active_label", "{name}: shughuli ya mwisho {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: kuingia kumeshindwa} other {{name}: "
      & "kuingia kumefaulu}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA imewashwa} mfa_disabled {MFA "
      & "imezimwa} mfa_required {MFA inahitajika} other {MFA inahitaji kuwekwa "
      & "upya}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {kipindi {name} kinatumika} "
      & "expired_session {kipindi {name} kimeisha} revoked_session {kipindi "
      & "{name} kimebatilishwa} idle_session {kipindi {name} hakina shughuli} "
      & "other {kipindi {name}: hali haijulikani}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {kipindi kinachotumika} expired_session "
      & "{kipindi kimeisha} revoked_session {kipindi kimebatilishwa} "
      & "idle_session {kipindi kisicho na shughuli} other {hali ya kipindi "
      & "haijulikani}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {hakuna viambatisho} one {kiambatisho 1} other "
      & "{viambatisho {count, number}}}");
   P ("label.attachments.attachment_group_label",
      "{name}: {count, plural, one {kiambatisho 1} other {viambatisho {count, "
      & "number}}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {kiambatisho cha faili} "
      & "image_attachment {kiambatisho cha picha} video_attachment {kiambatisho "
      & "cha video} audio_attachment {kiambatisho cha sauti} "
      & "document_attachment {kiambatisho cha hati} archive_attachment "
      & "{kiambatisho cha faili iliyobanwa} other {kiambatisho cha kiungo}}");
   P ("label.attachments.attachment_label",
      "kiambatisho {name} ({kind, select, file_attachment {faili} "
      & "image_attachment {picha} video_attachment {video} audio_attachment "
      & "{sauti} document_attachment {hati} archive_attachment {faili "
      & "iliyobanwa} other {kiungo}}) {state, select, pending_attachment "
      & "{kinasubiri} uploading_attachment {kinapakiwa} uploaded_attachment "
      & "{kimepakiwa} failed_attachment {kimeshindwa} removed_attachment "
      & "{kimeondolewa} other {kimezuiwa}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {kiambatisho kinasubiri} "
      & "uploading_attachment {kiambatisho kinapakiwa} uploaded_attachment "
      & "{kiambatisho kimepakiwa} failed_attachment {kiambatisho kimeshindwa} "
      & "removed_attachment {kiambatisho kimeondolewa} other {kiambatisho "
      & "kimezuiwa}}");
   P ("label.attachments.download_label", "pakua {name}");
   P ("label.attachments.expiring_link_label", "kiungo {name} kinaisha muda {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "hakiki {name}");
   P ("label.attachments.remove_label", "ondoa {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: haijachanganuliwa} scanning "
      & "{{name}: inachanganuliwa} safe {{name}: salama} suspicious {{name}: "
      & "inatiliwa shaka} other {{name}: imeambukizwa}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {haijachanganuliwa} scanning "
      & "{inachanganuliwa} safe {uchanganuzi: salama} suspicious {uchanganuzi: "
      & "inatiliwa shaka} other {uchanganuzi: imeambukizwa}}");
   P ("label.attachments.upload_error_label", "kupakia {name} kumeshindwa: {reason}");
   P ("label.badges.badge_label",
      "beji {name} ({tone, select, neutral_tone {kawaida} info_tone {taarifa} "
      & "success_tone {mafanikio} warning_tone {onyo} danger_tone {hatari} "
      & "other {iliyofifia}}{state, select, default_badge {} new_badge {, mpya} "
      & "updated_badge {, imesasishwa} deprecated_badge {, haitumiki tena} "
      & "selected_badge {, imechaguliwa} disabled_badge {, imezimwa} other {, "
      & "inaweza kufungwa}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {beji ya kipaumbele cha chini} "
      & "medium_priority {beji ya kipaumbele cha wastani} high_priority {beji "
      & "ya kipaumbele cha juu} other {beji ya kipaumbele cha dharura}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {beji chaguo-msingi} new_badge {beji "
      & "mpya} updated_badge {beji iliyosasishwa} deprecated_badge {beji "
      & "isiyotumika tena} selected_badge {beji iliyochaguliwa} disabled_badge "
      & "{beji iliyozimwa} other {beji inayoweza kufungwa}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {beji ya kawaida} info_tone {beji ya "
      & "taarifa} success_tone {beji ya mafanikio} warning_tone {beji ya onyo} "
      & "danger_tone {beji ya hatari} other {beji iliyofifia}}");
   P ("label.badges.chip_label",
      "{selected, select, false {chipu {name}} other {chipu {name}, "
      & "imechaguliwa}}");
   P ("label.badges.count_badge_label", "{name}: {count, plural, =0 {hakuna} other {{count, number}}}");
   P ("label.badges.deprecated_label", "beji {name} (onyo, haitumiki tena)");
   P ("label.badges.dismiss_label", "funga {name}");
   P ("label.badges.new_label", "beji {name} (taarifa, mpya)");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {hakuna beji zilizofichwa} one {+beji 1 "
      & "zaidi} other {+beji {hidden_count, number} zaidi}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {beji {name}, kipaumbele cha chini} "
      & "medium_priority {beji {name}, kipaumbele cha wastani} high_priority "
      & "{beji {name}, kipaumbele cha juu} other {beji {name}, kipaumbele cha "
      & "dharura}}");
   P ("label.badges.status_badge_label",
      "hali ya {name}: {tone, select, neutral_tone {kawaida} info_tone "
      & "{taarifa} success_tone {mafanikio} warning_tone {onyo} danger_tone "
      & "{hatari} other {iliyofifia}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {hakuna lebo} one {lebo 1} other {lebo {count, "
      & "number}}}");
   P ("label.badges.tag_label", "lebo {name}");
   P ("label.badges.updated_label", "beji {name} (mafanikio, imesasishwa)");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {kifurushi kimepakiwa} "
      & "artifact_missing {kifurushi hakipo} artifact_expired {muda wa "
      & "kifurushi umeisha} other {kifurushi kimethibitishwa}}");
   P ("label.builds.benchmark_label", "kipimo {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {ujenzi {name} uko kwenye foleni} "
      & "build_running {ujenzi {name} unaendelea} build_passed {ujenzi {name} "
      & "umefaulu} build_failed {ujenzi {name} umeshindwa} snapshot_build "
      & "{ujenzi wa snapshot {name}} other {ujenzi wa toleo {name}}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {ujenzi uko kwenye foleni} build_running "
      & "{ujenzi unaendelea} build_passed {ujenzi umefaulu} build_failed "
      & "{ujenzi umeshindwa} snapshot_build {ujenzi wa snapshot} other {ujenzi "
      & "wa toleo}}");
   P ("label.builds.coverage_label", "ufikiaji wa majaribio {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {lango la toleo limepita} gate_failed "
      & "{lango la toleo limeshindwa} gate_warning {lango la toleo lina onyo} "
      & "other {lango la toleo limezuiwa}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {hakuna jaribio "
      & "lililofaulu} one {jaribio 1 limefaulu} other {majaribio {count, "
      & "number} yamefaulu}}} failed_test {{count, plural, =0 {hakuna jaribio "
      & "lililoshindwa} one {jaribio 1 limeshindwa} other {majaribio {count, "
      & "number} yameshindwa}}} skipped_test {{count, plural, =0 {hakuna "
      & "jaribio lililorukwa} one {jaribio 1 limerukwa} other {majaribio "
      & "{count, number} yamerukwa}}} flaky_test {{count, plural, =0 {hakuna "
      & "jaribio lisilo thabiti} one {jaribio 1 si thabiti} other {majaribio "
      & "{count, number} si thabiti}}} other {{count, plural, =0 {hakuna "
      & "jaribio lililoshindwa kama ilivyotarajiwa} one {jaribio 1 limeshindwa "
      & "kama ilivyotarajiwa} other {majaribio {count, number} yameshindwa kama "
      & "ilivyotarajiwa}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {imefaulu} failed_test {imeshindwa} "
      & "skipped_test {imerukwa} flaky_test {si thabiti} other {kushindwa "
      & "kulikotarajiwa}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "haijabadilika, imezimwa} other {{field_name} imebadilishwa kutoka "
      & "imezimwa hadi imewashwa}}} other {{new_value, select, false "
      & "{{field_name} imebadilishwa kutoka imewashwa hadi imezimwa} other "
      & "{{field_name} haijabadilika, imewashwa}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {imeongezwa} removed_change {imeondolewa} "
      & "modified_change {imebadilishwa} renamed_change {imepewa jina jipya} "
      & "unchanged_change {haijabadilika} metadata_change {metadata "
      & "imebadilishwa} moved_change {imehamishwa} conflict_change {mgongano} "
      & "other {badiliko lisilojulikana}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {badiliko la taarifa} "
      & "minor_change {badiliko dogo} major_change {badiliko kubwa} other "
      & "{badiliko linalovunja uoanifu}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} haijabadilika} "
      & "other {{unchanged, plural, =0 {{field_name} imebadilishwa: "
      & "zilizoongezwa {added, number}} other {{field_name} imebadilishwa: "
      & "zilizoongezwa {added, number}, zisizobadilika {unchanged, number}}}}}} "
      & "other {{added, plural, =0 {{unchanged, plural, =0 {{field_name} "
      & "imebadilishwa: zilizoondolewa {removed, number}} other {{field_name} "
      & "imebadilishwa: zilizoondolewa {removed, number}, zisizobadilika "
      & "{unchanged, number}}}} other {{unchanged, plural, =0 {{field_name} "
      & "imebadilishwa: zilizoongezwa {added, number}, zilizoondolewa {removed, "
      & "number}} other {{field_name} imebadilishwa: zilizoongezwa {added, "
      & "number}, zilizoondolewa {removed, number}, zisizobadilika {unchanged, "
      & "number}}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {hakuna migongano} one {mgongano 1} other "
      & "{migongano {count, number}}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} imesogezwa baadaye kutoka "
      & "{old_label} hadi {new_label}} other {{field_name} imesogezwa mapema "
      & "kutoka {old_label} hadi {new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} imebadilishwa kutoka {old_label} hadi {new_label}");
   P ("label.changes.field_change_label", "{field_name} imebadilishwa kutoka {old_value} hadi {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name} imeongezwa} removed_change {{name} "
      & "imeondolewa} modified_change {{name} imebadilishwa} renamed_change "
      & "{{name} imepewa jina jipya} unchanged_change {{name} haijabadilika} "
      & "metadata_change {{name}: metadata imebadilishwa} moved_change {{name} "
      & "imehamishwa} conflict_change {{name}: mgongano} other {{name}: "
      & "badiliko lisilojulikana}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {metadata pekee imebadilishwa} one {sehemu 1 tu ya "
      & "metadata imebadilishwa} other {sehemu {count, number} tu za metadata "
      & "zimebadilishwa}}");
   P ("label.changes.move_label", "{name} imehamishwa kutoka {from} hadi {to}");
   P ("label.changes.no_changes_label", "hakuna mabadiliko");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {hakuna mistari "
      & "iliyobadilika} one {mstari 1 umeongezwa} other {mistari {lines_added, "
      & "number} imeongezwa}}} other {{lines_added, plural, =0 {} one {mstari 1 "
      & "umeongezwa, } other {mistari {lines_added, number} imeongezwa, "
      & "}}{lines_removed, plural, one {mstari 1 umeondolewa} other {mistari "
      & "{lines_removed, number} imeondolewa}}}}");
   P ("label.changes.rename_label", "jina limebadilishwa kutoka {old_name} hadi {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} ameandaa rasimu ya maoni} "
      & "published_comment {{author} ametoa maoni} edited_comment {{author} "
      & "amehariri maoni} deleted_comment {{author} amefuta maoni} "
      & "resolved_comment {{author} ametatua maoni} unresolved_comment "
      & "{{author} amefungua upya maoni} pinned_comment {{author} amebandika "
      & "maoni} other {{author} ameficha maoni}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {hakuna maoni} one {maoni 1} other {maoni {count, "
      & "number}}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {rasimu ya maoni ya {author}} "
      & "published_comment {maoni ya {author} yamechapishwa} edited_comment "
      & "{maoni ya {author} yamehaririwa} deleted_comment {maoni ya {author} "
      & "yamefutwa} resolved_comment {maoni ya {author} yametatuliwa} "
      & "unresolved_comment {maoni ya {author} hayajatatuliwa} pinned_comment "
      & "{maoni ya {author} yamebandikwa} other {maoni ya {author} yamefichwa}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {rasimu ya maoni} published_comment "
      & "{maoni yaliyochapishwa} edited_comment {maoni yaliyohaririwa} "
      & "deleted_comment {maoni yaliyofutwa} resolved_comment {maoni "
      & "yaliyotatuliwa} unresolved_comment {maoni yasiyotatuliwa} "
      & "pinned_comment {maoni yaliyobandikwa} other {maoni yaliyofichwa}}");
   P ("label.comments.deleted_label", "{author} amefuta maoni");
   P ("label.comments.edited_label", "imehaririwa {time_text}");
   P ("label.comments.hide_comment_label", "ficha maoni: {reason}");
   P ("label.comments.lock_thread_label", "funga mazungumzo ya {name}");
   P ("label.comments.mention_label", "{actor} amemtaja {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {hakuna washiriki} one {mshiriki 1} other "
      & "{washiriki {count, number}}}");
   P ("label.comments.pin_label", "bandika {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {itikio la kupenda} dislike_reaction "
      & "{itikio la kutopenda} heart_reaction {itikio la moyo} laugh_reaction "
      & "{itikio la kucheka} confused_reaction {itikio la kuchanganyikiwa} "
      & "hooray_reaction {itikio la shangwe} rocket_reaction {itikio la roketi} "
      & "other {itikio la macho}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {kupenda} dislike_reaction {kutopenda} "
      & "heart_reaction {moyo} laugh_reaction {kucheka} confused_reaction "
      & "{kuchanganyikiwa} hooray_reaction {shangwe} rocket_reaction {roketi} "
      & "other {macho}}: {count, plural, =0 {hakuna} other {{count, number}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {hakuna majibu} one {jibu 1} other {majibu {count, "
      & "number}}}");
   P ("label.comments.resolved_label", "{name} imetatuliwa");
   P ("label.comments.subscribe_label", "jiandikishe kwa {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {hakuna mazungumzo} one {mazungumzo 1} other "
      & "{mazungumzo {count, number}}}");
   P ("label.comments.thread_label",
      "mazungumzo {name} {state, select, open_thread {yaliyo wazi} "
      & "resolved_thread {yaliyotatuliwa} locked_thread {yaliyofungwa} other "
      & "{yaliyohifadhiwa}}{count, plural, =0 {} one {, maoni 1} other {, maoni "
      & "{count, number}}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {mazungumzo yaliyo wazi} resolved_thread "
      & "{mazungumzo yaliyotatuliwa} locked_thread {mazungumzo yaliyofungwa} "
      & "other {mazungumzo yaliyohifadhiwa}}");
   P ("label.comments.unpin_label", "bandua {name}");
   P ("label.comments.unsubscribe_label", "jiondoe kwenye {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name} imeboreka} regressed {{name} "
      & "imedorora} unchanged {{name} haijabadilika} within_tolerance {{name} "
      & "iko ndani ya ustahimilivu} outside_tolerance {{name} iko nje ya "
      & "ustahimilivu} new_value {{name} mpya} removed_value {{name} "
      & "imeondolewa} other {{name}: msingi haupatikani}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {imeboreka} regressed {imedorora} unchanged "
      & "{haijabadilika} within_tolerance {ndani ya ustahimilivu} "
      & "outside_tolerance {nje ya ustahimilivu} new_value {mpya} removed_value "
      & "{imeondolewa} other {msingi haupatikani}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name} imeboreka kwa {difference_text}} "
      & "regressed {{name} imedorora kwa {difference_text}} unchanged {{name} "
      & "haijabadilika, tofauti {difference_text}} within_tolerance {{name} iko "
      & "ndani ya ustahimilivu, tofauti {difference_text}} outside_tolerance "
      & "{{name} iko nje ya ustahimilivu, tofauti {difference_text}} new_value "
      & "{{name} mpya, tofauti {difference_text}} removed_value {{name} "
      & "imeondolewa, tofauti {difference_text}} other {{name}: msingi "
      & "haupatikani, tofauti {difference_text}}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name} imeboreka kwa {difference_text}} "
      & "regressed {{name} imedorora kwa {difference_text}} unchanged {{name} "
      & "haijabadilika, tofauti {difference_text}} within_tolerance {{name} iko "
      & "ndani ya ustahimilivu, tofauti {difference_text}} outside_tolerance "
      & "{{name} iko nje ya ustahimilivu, tofauti {difference_text}} new_value "
      & "{{name} mpya, tofauti {difference_text}} removed_value {{name} "
      & "imeondolewa, tofauti {difference_text}} other {{name}: msingi "
      & "haupatikani, tofauti {difference_text}}}, ustahimilivu "
      & "{tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {safu batili} duplicate_record {rekodi "
      & "iliyorudiwa} missing_column {safu wima inayokosekana} unknown_field "
      & "{sehemu isiyojulikana} schema_mismatch {skima haioani} other {rekodi "
      & "iliyorukwa}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {jaribio la uingizaji limefaulu} "
      & "dry_run_failed {jaribio la uingizaji limeshindwa} import_valid "
      & "{uingizaji ni halali} import_invalid {uingizaji si halali} other "
      & "{uingizaji wa sehemu}}");
   P ("label.data_quality.import_result_label",
      "{name} – {state, select, dry_run_passed {jaribio la uingizaji "
      & "limefaulu} dry_run_failed {jaribio la uingizaji limeshindwa} "
      & "import_valid {uingizaji ni halali} import_invalid {uingizaji si "
      & "halali} other {uingizaji wa sehemu}}: zilizokubaliwa {accepted, "
      & "number}, zilizokataliwa {rejected, number}");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {hakuna safu batili} "
      & "one {safu 1 batili} other {safu {count, number} batili}}} "
      & "duplicate_record {{count, plural, =0 {hakuna rekodi zilizorudiwa} one "
      & "{rekodi 1 iliyorudiwa} other {rekodi {count, number} zilizorudiwa}}} "
      & "missing_column {{count, plural, =0 {hakuna safu wima zinazokosekana} "
      & "one {safu wima 1 inayokosekana} other {safu wima {count, number} "
      & "zinazokosekana}}} unknown_field {{count, plural, =0 {hakuna sehemu "
      & "zisizojulikana} one {sehemu 1 isiyojulikana} other {sehemu {count, "
      & "number} zisizojulikana}}} schema_mismatch {{count, plural, =0 {hakuna "
      & "hitilafu za skima} one {hitilafu 1 ya skima} other {hitilafu {count, "
      & "number} za skima}}} other {{count, plural, =0 {hakuna rekodi "
      & "zilizorukwa} one {rekodi 1 iliyorukwa} other {rekodi {count, number} "
      & "zilizorukwa}}}}");
   P ("label.data_quality.row_issue_label",
      "safu {row, number}: {issue, select, invalid_row {safu batili} "
      & "duplicate_record {rekodi iliyorudiwa} missing_column {safu wima "
      & "inayokosekana} unknown_field {sehemu isiyojulikana} schema_mismatch "
      & "{skima haioani} other {rekodi iliyorukwa}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {safu batili} "
      & "duplicate_record {rekodi iliyorudiwa} missing_column {safu wima "
      & "inayokosekana} unknown_field {sehemu isiyojulikana} schema_mismatch "
      & "{skima haioani} other {rekodi iliyorukwa}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {kifurushi kiko tayari} "
      & "artifact_uploaded {kifurushi kimepakiwa} artifact_signed {kifurushi "
      & "kimetiwa sahihi} artifact_missing {kifurushi hakipo} other {muda wa "
      & "kifurushi umeisha}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {usambazaji wa {name} kwenda "
      & "{environment} uko kwenye foleni} deploying {{name} inasambazwa kwenda "
      & "{environment}} deployed {{name} imesambazwa kwenda {environment}} "
      & "failed_deployment {usambazaji wa {name} kwenda {environment} "
      & "umeshindwa} rolled_back {usambazaji wa {name} kwenda {environment} "
      & "umerejeshwa nyuma} blocked_deployment {usambazaji wa {name} kwenda "
      & "{environment} umezuiwa} other {usambazaji wa {name} kwenda "
      & "{environment} umeghairiwa}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {usambazaji uko kwenye foleni} "
      & "deploying {inasambazwa} deployed {imesambazwa} failed_deployment "
      & "{usambazaji umeshindwa} rolled_back {imerejeshwa nyuma} "
      & "blocked_deployment {usambazaji umezuiwa} other {usambazaji "
      & "umeghairiwa}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {mazingira ni mazima} "
      & "drifting_environment {mazingira yamepotoka} locked_environment "
      & "{mazingira yamefungwa} maintenance_environment {mazingira yako kwenye "
      & "matengenezo} other {hali ya mazingira haijulikani}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {hakuna uhamishaji} migration_pending "
      & "{uhamishaji unasubiri} migrating {uhamishaji unaendelea} "
      & "migration_complete {uhamishaji umekamilika} other {uhamishaji "
      & "umeshindwa}}");
   P ("label.deployments.promotion_label", "{name} imepandishwa kutoka {from_environment} hadi {to_environment}");
   P ("label.deployments.rollback_label", "urejeshaji wa {name} hadi {target}");
   P ("label.deployments.rollout_label", "utoaji wa {name}: {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {hakuna vipengee vilivyoathiriwa} one {kipengee 1 "
      & "kilichoathiriwa} other {vipengee {count, number} vilivyoathiriwa}}");
   P ("label.diagnostics.check_duration_label",
      "{status, select, passed_check {{name}: imefaulu ndani ya {duration_s, "
      & "plural, one {sekunde 1} other {sekunde {duration_s, number}}}} "
      & "failed_check {{name}: imeshindwa ndani ya {duration_s, plural, one "
      & "{sekunde 1} other {sekunde {duration_s, number}}}} warning_check "
      & "{{name}: ina maonyo ndani ya {duration_s, plural, one {sekunde 1} "
      & "other {sekunde {duration_s, number}}}} skipped_check {{name}: imerukwa "
      & "ndani ya {duration_s, plural, one {sekunde 1} other {sekunde "
      & "{duration_s, number}}}} pending_check {{name}: inasubiri ndani ya "
      & "{duration_s, plural, one {sekunde 1} other {sekunde {duration_s, "
      & "number}}}} other {{name}: inaendeshwa ndani ya {duration_s, plural, "
      & "one {sekunde 1} other {sekunde {duration_s, number}}}}}");
   P ("label.diagnostics.check_result_label",
      "{status, select, passed_check {{name}: imefaulu} failed_check {{name}: "
      & "imeshindwa} warning_check {{name}: ina maonyo} skipped_check {{name}: "
      & "imerukwa} pending_check {{name}: inasubiri} other {{name}: "
      & "inaendeshwa}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {imefaulu} failed_check {imeshindwa} "
      & "warning_check {ina maonyo} skipped_check {imerukwa} pending_check "
      & "{inasubiri} other {inaendeshwa}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {thamani inatarajiwa kwa "
      & "{subject}{position, plural, =0 {} other { katika nafasi {position, "
      & "number}}}; tumia {suggestion}} expected_unit {kipimo kinatarajiwa kwa "
      & "{subject}{position, plural, =0 {} other { katika nafasi {position, "
      & "number}}}; tumia {suggestion}} invalid_range {masafa batili kwa "
      & "{subject}{position, plural, =0 {} other { katika nafasi {position, "
      & "number}}}; tumia {suggestion}} end_before_start {mwisho wa masafa uko "
      & "kabla ya mwanzo kwa {subject}{position, plural, =0 {} other { katika "
      & "nafasi {position, number}}}; tumia {suggestion}} unknown_field {sehemu "
      & "isiyojulikana kwa {subject}{position, plural, =0 {} other { katika "
      & "nafasi {position, number}}}; tumia {suggestion}} unsafe_redacted_value "
      & "{thamani isiyo salama imefichwa kwa {subject}{position, plural, =0 {} "
      & "other { katika nafasi {position, number}}}; tumia {suggestion}} "
      & "unsupported_syntax {sintaksia isiyotumika kwa {subject}{position, "
      & "plural, =0 {} other { katika nafasi {position, number}}}; tumia "
      & "{suggestion}} other {maelezo ya uchunguzi kwa {subject}{position, "
      & "plural, =0 {} other { katika nafasi {position, number}}}; tumia "
      & "{suggestion}}}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {maelezo} notice_severity {taarifa} "
      & "warning_severity {onyo} error_severity {hitilafu} critical_severity "
      & "{hatari} other {kizuizi}} katika {path}{line, plural, =0 {} other {, "
      & "mstari {line, number}}}: {message}");
   P ("label.diagnostics.failed_at_label",
      "imeshindwa katika {path}{line, plural, =0 {} other {, mstari {line, "
      & "number}{column, plural, =0 {} other {, safu wima {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {maelezo} notice_severity {taarifa} "
      & "warning_severity {onyo} error_severity {hitilafu} critical_severity "
      & "{hatari} other {kizuizi}} katika {field_name}: {message}");
   P ("label.diagnostics.first_failure_label",
      "kushindwa kwa kwanza katika {check_name} kwenye {path}{line, plural, "
      & "=0 {} other {, mstari {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{hakuna matatizo} other {{notices, plural, one {taarifa 1} other "
      & "{taarifa {notices, number}}}}}} other {{notices, plural, =0 "
      & "{{warnings, plural, one {onyo 1} other {maonyo {warnings, number}}}} "
      & "other {{warnings, plural, one {onyo 1} other {maonyo {warnings, "
      & "number}}}, {notices, plural, one {taarifa 1} other {taarifa {notices, "
      & "number}}}}}}}} other {{warnings, plural, =0 {{notices, plural, =0 "
      & "{{errors, plural, one {hitilafu 1} other {hitilafu {errors, number}}}} "
      & "other {{errors, plural, one {hitilafu 1} other {hitilafu {errors, "
      & "number}}}, {notices, plural, one {taarifa 1} other {taarifa {notices, "
      & "number}}}}}} other {{notices, plural, =0 {{errors, plural, one "
      & "{hitilafu 1} other {hitilafu {errors, number}}}, {warnings, plural, "
      & "one {onyo 1} other {maonyo {warnings, number}}}} other {{errors, "
      & "plural, one {hitilafu 1} other {hitilafu {errors, number}}}, "
      & "{warnings, plural, one {onyo 1} other {maonyo {warnings, number}}}, "
      & "{notices, plural, one {taarifa 1} other {taarifa {notices, "
      & "number}}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{path}{line, plural, =0 {} other {, mstari {line, number}{column, "
      & "plural, =0 {} other {, safu wima {column, number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{family, select, byte_parser {sintaksia isiyotumika kwa kichanganuzi "
      & "cha baiti {error}{position, plural, =0 {} other { katika nafasi "
      & "{position, number}}}; tumia B, kB, MB, GB, KiB, MiB, GiB au TiB} "
      & "duration_parser {sintaksia isiyotumika kwa kichanganuzi cha muda "
      & "{error}{position, plural, =0 {} other { katika nafasi {position, "
      & "number}}}; tumia ms, s, min, h, d, w, month au year} date_time_parser "
      & "{sintaksia isiyotumika kwa kichanganuzi cha tarehe na saa "
      & "{error}{position, plural, =0 {} other { katika nafasi {position, "
      & "number}}}; tumia tarehe ya ISO, siku kwa lugha ya kawaida au saa} "
      & "color_parser {sintaksia isiyotumika kwa kichanganuzi cha rangi "
      & "{error}{position, plural, =0 {} other { katika nafasi {position, "
      & "number}}}; tumia hex, rgb(), hsl(), lab(), lch() au jina la rangi} "
      & "url_parser {sintaksia isiyotumika kwa kichanganuzi cha URL "
      & "{error}{position, plural, =0 {} other { katika nafasi {position, "
      & "number}}}; tumia mpango, seva, njia, hoja au kipande} unit_parser "
      & "{sintaksia isiyotumika kwa kichanganuzi cha vipimo {error}{position, "
      & "plural, =0 {} other { katika nafasi {position, number}}}; tumia lebo "
      & "ya kipimo inayotumika na Humanize} recurrence_parser {sintaksia "
      & "isiyotumika kwa kichanganuzi cha marudio {error}{position, plural, =0 "
      & "{} other { katika nafasi {position, number}}}; tumia cron au muundo wa "
      & "marudio every/weekday} domain_label_parser {sintaksia isiyotumika kwa "
      & "kichanganuzi cha lebo za kikoa {error}{position, plural, =0 {} other { "
      & "katika nafasi {position, number}}}; tumia lebo ya kikoa ya Humanize "
      & "iliyobainishwa} other {sintaksia isiyotumika kwa kichanganuzi "
      & "{error}{position, plural, =0 {} other { katika nafasi {position, "
      & "number}}}; tumia muundo wa ingizo unaotumika}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {imefaulu} failed_check {imeshindwa} "
      & "warning_check {ina maonyo} skipped_check {imerukwa} pending_check "
      & "{inasubiri} other {inaendeshwa}}{notices, plural, =0 { bila taarifa} "
      & "one { na taarifa 1} other { na taarifa {notices, number}}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {jaribio upya 1 kati ya 1} "
      & "other {kikomo cha majaribio kimezidishwa ({attempt, number} kati ya "
      & "1)}}} other {jaribio upya {attempt, number} kati ya {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {maelezo} notice_severity {taarifa} "
      & "warning_severity {onyo} error_severity {hitilafu} critical_severity "
      & "{hatari} other {kizuizi}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {uchunguzi wa ujenzi} test_source "
      & "{uchunguzi wa majaribio} lint_source {uchunguzi wa lint} import_source "
      & "{uchunguzi wa uingizaji} validation_source {uchunguzi wa "
      & "uthibitishaji} runtime_source {uchunguzi wa wakati wa utekelezaji} "
      & "security_source {uchunguzi wa usalama} other {uchunguzi}}");
   P ("label.diagnostics.source_summary_label",
      "{source, select, build_source {uchunguzi wa ujenzi} test_source "
      & "{uchunguzi wa majaribio} lint_source {uchunguzi wa lint} import_source "
      & "{uchunguzi wa uingizaji} validation_source {uchunguzi wa "
      & "uthibitishaji} runtime_source {uchunguzi wa wakati wa utekelezaji} "
      & "security_source {uchunguzi wa usalama} other {uchunguzi}}: {count, "
      & "number}");
   P ("label.diagnostics.suggested_action_label", "hatua inayofuata: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {seva ya kikoa} ipv4_host {anwani ya IPv4} "
      & "ipv6_host {anwani ya IPv6} localhost_host {seva ya ndani} "
      & "private_network_host {anwani ya mtandao wa faragha} other {seva "
      & "isiyojulikana}}");
   P ("label.events.all_day_label", "{name}, tukio la siku nzima");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {hajajibu} accepted {amekubali} declined "
      & "{amekataa} maybe {huenda} other {kwenye orodha ya kusubiri}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {hakuna washiriki} one {mshiriki 1} other "
      & "{washiriki {count, number}}}");
   P ("label.events.canceled_label", "{name} imeghairiwa");
   P ("label.events.check_in_label", "jisajili kuhudhuria {name}");
   P ("label.events.conference_link_label", "kiungo cha mkutano wa {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {hakuna matukio} one {tukio 1} other {matukio "
      & "{count, number}}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {tukio lililopangwa} "
      & "tentative_event {tukio la muda} in_progress_event {tukio "
      & "linaloendelea} completed_event {tukio lililokamilika} canceled_event "
      & "{tukio lililoghairiwa} other {tukio lililoahirishwa}}");
   P ("label.events.event_location_label", "{name} katika {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {tukio lililopangwa} tentative_event "
      & "{tukio la muda} in_progress_event {tukio linaloendelea} "
      & "completed_event {tukio lililokamilika} canceled_event {tukio "
      & "lililoghairiwa} other {tukio lililoahirishwa}}");
   P ("label.events.event_time_label", "{name}, {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {tukio la umma} private_event {tukio "
      & "la faragha} busy_event {muda wenye shughuli} other {muda huru}}");
   P ("label.events.organizer_label", "mratibu: {name}");
   P ("label.events.rsvp_label",
      "jibu la mwaliko: {state, select, not_responded {hajajibu} accepted "
      & "{amekubali} declined {amekataa} maybe {huenda} other {kwenye orodha ya "
      & "kusubiri}}");
   P ("label.events.reminder_label", "kikumbusho {time_text}");
   P ("label.events.rescheduled_label", "{name} imepangwa upya hadi {time_text}");
   P ("label.forms.character_count_label", "{used, plural, one {herufi 1} other {herufi {used, number}}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {hakuna kikomo cha herufi} one {upeo wa herufi 1} "
      & "other {upeo wa herufi {limit, number}}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {herufi {used, number}} other {herufi {used, "
      & "number} kati ya {limit, number}}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}: sehemu ya hiari} other {{name}: "
      & "sehemu inayohitajika}}");
   P ("label.forms.field_state_label",
      "{state, select, valid_input {{name}: sahihi} invalid_input {{name}: si "
      & "sahihi} required_input {{name}: inahitajika} optional_input {{name}: "
      & "hiari} disabled_input {{name}: imezimwa} other {{name}: ya kusoma tu}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {hakuna matatizo kwenye "
      & "fomu} other {{warnings, plural, one {onyo 1} other {maonyo {warnings, "
      & "number}}}}}} other {{warnings, plural, =0 {{errors, plural, one "
      & "{hitilafu 1} other {hitilafu {errors, number}}}} other {{errors, "
      & "plural, one {hitilafu 1} other {hitilafu {errors, number}}}, "
      & "{warnings, plural, one {onyo 1} other {maonyo {warnings, number}}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {haijaanza} editing_form {inahaririwa} "
      & "dirty_form {mabadiliko hayajahifadhiwa} saving_form {inahifadhiwa} "
      & "saved_form {imehifadhiwa} submitted_form {imewasilishwa} other "
      & "{uwasilishaji umeshindwa}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {ingizo sahihi} invalid_input {ingizo si "
      & "sahihi} required_input {ingizo linalohitajika} optional_input {ingizo "
      & "la hiari} disabled_input {ingizo limezimwa} other {ingizo la kusoma "
      & "tu}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {haijaanza} editing_form {inahaririwa} "
      & "dirty_form {mabadiliko hayajahifadhiwa} saving_form {fomu "
      & "inahifadhiwa} saved_form {fomu imehifadhiwa} submitted_form {fomu "
      & "imewasilishwa} other {{errors, plural, =0 {uwasilishaji umeshindwa} "
      & "one {uwasilishaji umeshindwa kwa hitilafu 1} other {uwasilishaji "
      & "umeshindwa kwa hitilafu {errors, number}}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {hakuna mabadiliko ambayo hayajahifadhiwa} one "
      & "{badiliko 1 ambalo halijahifadhiwa} other {mabadiliko {count, number} "
      & "ambayo hayajahifadhiwa}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {jina linalofikika "
      & "halipo} low_contrast {utofautishaji mdogo} skipped_heading_level "
      & "{kiwango cha kichwa kimerukwa} missing_form_label {lebo ya fomu haipo} "
      & "invalid_aria {ARIA batili} keyboard_trap {mtego wa kibodi} other "
      & "{tatizo la ufikivu lisilojulikana}}");
   P ("label.markup.accessibility_page_summary_label",
      "muhtasari wa ufikivu wa {title}: {landmarks, plural, one {alama kuu 1} "
      & "other {alama kuu {landmarks, number}}}, {headings, plural, one {kichwa "
      & "1} other {vichwa {headings, number}}}, {issues, plural, one {tatizo 1} "
      & "other {matatizo {issues, number}}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {ongeza jina linalofikika} "
      & "low_contrast {ongeza utofautishaji wa maandishi} skipped_heading_level "
      & "{tumia viwango vya vichwa kwa mfuatano} missing_form_label {unganisha "
      & "lebo na kidhibiti cha fomu} invalid_aria {tumia jukumu au sifa halali "
      & "ya ARIA} keyboard_trap {hakikisha mlengo wa kibodi unaweza kutoka "
      & "kwenye kijenzi} other {kagua tatizo la ufikivu}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target} haina matatizo ya ufikivu} one {{target} "
      & "ina tatizo 1 la ufikivu} other {{target} ina matatizo {issues, number} "
      & "ya ufikivu}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {sifa ya id} class_attribute {sifa ya "
      & "class} data_attribute {sifa ya data} aria_attribute {sifa ya ARIA} "
      & "role_attribute {sifa ya role} link_attribute {sifa ya kiungo} "
      & "media_attribute {sifa ya midia} form_attribute {sifa ya fomu} "
      & "boolean_attribute {sifa ya boolean} event_attribute {sifa ya "
      & "kishughulikia tukio} other {sifa isiyojulikana}}");
   P ("label.markup.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{form_name} haina "
      & "matatizo} other {{form_name}: {warnings, plural, one {onyo 1} other "
      & "{maonyo {warnings, number}}}}}} other {{warnings, plural, =0 "
      & "{{form_name}: {errors, plural, one {hitilafu 1} other {hitilafu "
      & "{errors, number}}}} other {{form_name}: {errors, plural, one {hitilafu "
      & "1} other {hitilafu {errors, number}}}, {warnings, plural, one {onyo 1} "
      & "other {maonyo {warnings, number}}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {alama kuu ya bango} navigation_role {alama "
      & "kuu ya urambazaji} main_role {alama kuu ya msingi} complementary_role "
      & "{alama kuu ya ziada} contentinfo_role {alama kuu ya taarifa za "
      & "maudhui} search_role {alama kuu ya utafutaji} form_role {alama kuu ya "
      & "fomu} region_role {alama kuu ya eneo} dialog_role {kidirisha} "
      & "alert_role {eneo hai la tahadhari} status_role {eneo hai la hali} "
      & "other {alama kuu isiyojulikana}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region} sasisho la haraka: {update}} other "
      & "{{region} sasisho: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {maudhui ya maandishi} html_content "
      & "{maudhui ya HTML} json_content {maudhui ya JSON} xml_content {maudhui "
      & "ya XML} image_content {maudhui ya picha} audio_content {maudhui ya "
      & "sauti} video_content {maudhui ya video} font_content {maudhui ya "
      & "fonti} archive_content {maudhui ya faili iliyobanwa} binary_content "
      & "{maudhui ya binari} form_content {maudhui ya fomu} other {maudhui "
      & "yasiyojulikana}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {tagi ya hati} metadata_tag {tagi ya "
      & "metadata} section_tag {tagi ya sehemu} text_tag {tagi ya maandishi} "
      & "link_tag {tagi ya kiungo} media_tag {tagi ya midia} form_tag {tagi ya "
      & "fomu} table_tag {tagi ya jedwali} interactive_tag {tagi shirikishi} "
      & "scripting_tag {tagi ya hati za programu} other {tagi isiyojulikana}}");
   P ("label.media.duration_label", "muda {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {picha} video_media {video} audio_media "
      & "{sauti} pdf_document {hati ya PDF} text_document {hati ya maandishi} "
      & "archive_media {faili iliyobanwa} other {midia}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {iko tayari} processing_media "
      & "{inachakatwa} transcoding_media {inabadilishwa umbizo} "
      & "thumbnail_missing {kijipicha hakipatikani} metadata_missing {metadata "
      & "haipo} locked_document {hati imefungwa} other {haipatikani}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {picha} video_media {video} "
      & "audio_media {sauti} pdf_document {hati ya PDF} text_document {hati ya "
      & "maandishi} archive_media {faili iliyobanwa} other {midia}}): {state, "
      & "select, ready_media {iko tayari} processing_media {inachakatwa} "
      & "transcoding_media {inabadilishwa umbizo} thumbnail_missing {kijipicha "
      & "hakipatikani} metadata_missing {metadata haipo} locked_document {hati "
      & "imefungwa} other {haipatikani}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {hakuna kurasa} one {ukurasa 1} other {kurasa "
      & "{pages, number}}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "rufaa ya {item}: {state, select, open_report {ripoti iko wazi} "
      & "triaged_report {ripoti imepangwa} actioned_report {hatua imechukuliwa} "
      & "dismissed_report {ripoti imetupiliwa mbali} appealed_report {ripoti "
      & "imekatiwa rufaa} other {ripoti imefungwa}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {hakuna hatua ya udhibiti} flagged "
      & "{imewekewa alama} hidden {imefichwa na msimamizi} restored "
      & "{imerejeshwa} marked_spam {imewekwa alama ya barua taka} removed "
      & "{imeondolewa} other {imepandishwa ngazi}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {hakuna hatua ya udhibiti} flagged "
      & "{imewekewa alama} hidden {imefichwa na msimamizi} restored "
      & "{imerejeshwa} marked_spam {imewekwa alama ya barua taka} removed "
      & "{imeondolewa} other {imepandishwa ngazi}}");
end Labels_1;
