separate (Humanize.Catalogs.Phrase_Data.Locale_Fi)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{name}: {state, select, active_account {aktiivinen tili} "
      & "invited_account {kutsuttu tili} locked_account {lukittu tili} "
      & "suspended_account {jäädytetty tili} deleted_account {poistettu tili} "
      & "other {tilin tila tuntematon}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {aktiivinen tili} invited_account "
      & "{kutsuttu tili} locked_account {lukittu tili} suspended_account "
      & "{jäädytetty tili} deleted_account {poistettu tili} other {tilin tila "
      & "tuntematon}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {luotettu laite} untrusted_device "
      & "{ei-luotettu laite} new_device {uusi laite} other {estetty laite}}");
   P ("label.accounts.last_active_label", "{name} viimeksi aktiivinen {time_text}");
   P ("label.accounts.login_attempt_label",
      "{name}: {succeeded, select, false {kirjautuminen epäonnistui} other "
      & "{kirjautuminen onnistui}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA käytössä} mfa_disabled {MFA ei "
      & "käytössä} mfa_required {MFA vaaditaan} other {MFA on nollattava}}");
   P ("label.accounts.session_label",
      "{name}: {state, select, active_session {aktiivinen istunto} "
      & "expired_session {istunto vanhentunut} revoked_session {istunto "
      & "peruttu} idle_session {joutilas istunto} other {istunnon tila "
      & "tuntematon}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {aktiivinen istunto} expired_session "
      & "{istunto vanhentunut} revoked_session {istunto peruttu} idle_session "
      & "{joutilas istunto} other {istunnon tila tuntematon}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {ei liitteitä} one {1 liite} other {{count, "
      & "number} liitettä}}");
   P ("label.attachments.attachment_group_label",
      "{name}: {count, plural, one {1 liite} other {{count, number} "
      & "liitettä}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {tiedostoliite} image_attachment "
      & "{kuvaliite} video_attachment {videoliite} audio_attachment "
      & "{ääniliite} document_attachment {asiakirjaliite} archive_attachment "
      & "{arkistoliite} other {linkkiliite}}");
   P ("label.attachments.attachment_label",
      "{name} ({kind, select, file_attachment {tiedosto} image_attachment "
      & "{kuva} video_attachment {video} audio_attachment {ääni} "
      & "document_attachment {asiakirja} archive_attachment {arkisto} other "
      & "{linkki}}): {state, select, pending_attachment {odottaa} "
      & "uploading_attachment {lähetetään} uploaded_attachment {lähetetty} "
      & "failed_attachment {epäonnistui} removed_attachment {poistettu} other "
      & "{estetty}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {odottava liite} "
      & "uploading_attachment {liitettä lähetetään} uploaded_attachment "
      & "{lähetetty liite} failed_attachment {epäonnistunut liite} "
      & "removed_attachment {poistettu liite} other {estetty liite}}");
   P ("label.attachments.download_label", "lataa {name}");
   P ("label.attachments.expiring_link_label", "{name}: linkki vanhenee {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "esikatsele {name}");
   P ("label.attachments.remove_label", "poista {name}");
   P ("label.attachments.scan_result_label",
      "{name}: {state, select, not_scanned {ei tarkistettu} scanning "
      & "{tarkistetaan} safe {turvallinen} suspicious {epäilyttävä} other "
      & "{saastunut}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {ei tarkistettu} scanning {tarkistetaan} "
      & "safe {tarkistus: turvallinen} suspicious {tarkistus: epäilyttävä} "
      & "other {tarkistus: saastunut}}");
   P ("label.attachments.upload_error_label", "{name}: lähetys epäonnistui: {reason}");
   P ("label.badges.badge_label",
      "{name}, {state, select, default_badge {merkki} new_badge {uusi merkki} "
      & "updated_badge {päivitetty merkki} deprecated_badge {vanhentunut "
      & "merkki} selected_badge {valittu merkki} disabled_badge {käytöstä "
      & "poistettu merkki} other {suljettava merkki}} ({tone, select, "
      & "neutral_tone {neutraali} info_tone {tieto} success_tone {onnistuminen} "
      & "warning_tone {varoitus} danger_tone {vaara} other {himmennetty}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {matalan prioriteetin merkki} "
      & "medium_priority {keskitason prioriteetin merkki} high_priority "
      & "{korkean prioriteetin merkki} other {kriittisen prioriteetin merkki}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {oletusmerkki} new_badge {uusi merkki} "
      & "updated_badge {päivitetty merkki} deprecated_badge {vanhentunut "
      & "merkki} selected_badge {valittu merkki} disabled_badge {käytöstä "
      & "poistettu merkki} other {suljettava merkki}}");
   P ("label.badges.badge_tone_label",
      "merkki: {tone, select, neutral_tone {neutraali} info_tone {tieto} "
      & "success_tone {onnistuminen} warning_tone {varoitus} danger_tone "
      & "{vaara} other {himmennetty}}");
   P ("label.badges.chip_label",
      "{selected, select, false {{name}, valintapala} other {{name}, "
      & "valintapala, valittu}}");
   P ("label.badges.count_badge_label", "{name}: {count, plural, =0 {ei yhtään} other {{count, number}}}");
   P ("label.badges.deprecated_label", "{name}, vanhentunut merkki");
   P ("label.badges.dismiss_label", "sulje {name}");
   P ("label.badges.new_label", "{name}, uusi merkki");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {ei piilotettuja merkkejä} one {+1 merkki "
      & "lisää} other {+{hidden_count, number} merkkiä lisää}}");
   P ("label.badges.priority_badge_label",
      "{name}, {priority, select, low_priority {matalan prioriteetin merkki} "
      & "medium_priority {keskitason prioriteetin merkki} high_priority "
      & "{korkean prioriteetin merkki} other {kriittisen prioriteetin merkki}}");
   P ("label.badges.status_badge_label",
      "{name}, tila: {tone, select, neutral_tone {neutraali} info_tone "
      & "{tieto} success_tone {onnistuminen} warning_tone {varoitus} "
      & "danger_tone {vaara} other {himmennetty}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {ei tunnisteita} one {1 tunniste} other {{count, "
      & "number} tunnistetta}}");
   P ("label.badges.tag_label", "tunniste {name}");
   P ("label.badges.updated_label", "{name}, päivitetty merkki");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefakti lähetetty} "
      & "artifact_missing {artefakti puuttuu} artifact_expired {artefakti "
      & "vanhentunut} other {artefakti vahvistettu}}");
   P ("label.builds.benchmark_label", "suorituskykytesti {name}: {result_text}");
   P ("label.builds.build_label",
      "{name}: {state, select, build_queued {koonti jonossa} build_running "
      & "{koonti käynnissä} build_passed {koonti onnistui} build_failed "
      & "{koonti epäonnistui} snapshot_build {snapshot-koonti} other "
      & "{julkaisukoonti}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {koonti jonossa} build_running {koonti "
      & "käynnissä} build_passed {koonti onnistui} build_failed {koonti "
      & "epäonnistui} snapshot_build {snapshot-koonti} other {julkaisukoonti}}");
   P ("label.builds.coverage_label", "kattavuus {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {julkaisutarkistus läpäisty} gate_failed "
      & "{julkaisutarkistus hylätty} gate_warning {julkaisutarkistus: "
      & "varoitus} other {julkaisutarkistus estetty}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {ei hyväksyttyjä "
      & "testejä} one {1 testi hyväksytty} other {{count, number} testiä "
      & "hyväksytty}}} failed_test {{count, plural, =0 {ei epäonnistuneita "
      & "testejä} one {1 testi epäonnistui} other {{count, number} testiä "
      & "epäonnistui}}} skipped_test {{count, plural, =0 {ei ohitettuja "
      & "testejä} one {1 testi ohitettu} other {{count, number} testiä "
      & "ohitettu}}} flaky_test {{count, plural, =0 {ei epävakaita testejä} "
      & "one {1 epävakaa testi} other {{count, number} epävakaata testiä}}} "
      & "other {{count, plural, =0 {ei odotetusti epäonnistuneita testejä} "
      & "one {1 testi epäonnistui odotetusti} other {{count, number} testiä "
      & "epäonnistui odotetusti}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {hyväksytty} failed_test {epäonnistui} "
      & "skipped_test {ohitettu} flaky_test {epävakaa} other {odotettu "
      & "epäonnistuminen}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "ennallaan: ei käytössä} other {{field_name} muutettu: ei "
      & "käytössä → käytössä}}} other {{new_value, select, false "
      & "{{field_name} muutettu: käytössä → ei käytössä} other "
      & "{{field_name} ennallaan: käytössä}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {lisätty} removed_change {poistettu} "
      & "modified_change {muutettu} renamed_change {nimetty uudelleen} "
      & "unchanged_change {ennallaan} metadata_change {metatietoja muutettu} "
      & "moved_change {siirretty} conflict_change {ristiriita} other "
      & "{tuntematon muutos}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {tiedottava muutos} "
      & "minor_change {pieni muutos} major_change {merkittävä muutos} other "
      & "{yhteensopimaton muutos}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} ennallaan} "
      & "other {{unchanged, plural, =0 {{field_name} muutettu: {added, number} "
      & "lisätty} other {{field_name} muutettu: {added, number} lisätty, "
      & "{unchanged, number} ennallaan}}}}} other {{added, plural, =0 "
      & "{{unchanged, plural, =0 {{field_name} muutettu: {removed, number} "
      & "poistettu} other {{field_name} muutettu: {removed, number} poistettu, "
      & "{unchanged, number} ennallaan}}} other {{unchanged, plural, =0 "
      & "{{field_name} muutettu: {added, number} lisätty, {removed, number} "
      & "poistettu} other {{field_name} muutettu: {added, number} lisätty, "
      & "{removed, number} poistettu, {unchanged, number} ennallaan}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {ei ristiriitoja} one {1 ristiriita} other {{count, "
      & "number} ristiriitaa}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} siirretty myöhemmäksi: "
      & "{old_label} → {new_label}} other {{field_name} siirretty aiemmaksi: "
      & "{old_label} → {new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} muutettu: {old_label} → {new_label}");
   P ("label.changes.field_change_label", "{field_name} muutettu: {old_value} → {new_value}");
   P ("label.changes.item_change_label",
      "{name}: {kind, select, added_change {lisätty} removed_change "
      & "{poistettu} modified_change {muutettu} renamed_change {nimetty "
      & "uudelleen} unchanged_change {ennallaan} metadata_change {metatietoja "
      & "muutettu} moved_change {siirretty} conflict_change {ristiriita} other "
      & "{tuntematon muutos}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {vain metatietoja muutettu} one {vain 1 "
      & "metatietokenttä muutettu} other {vain {count, number} "
      & "metatietokenttää muutettu}}");
   P ("label.changes.move_label", "{name} siirretty: {from} → {to}");
   P ("label.changes.no_changes_label", "ei muutoksia");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {ei "
      & "rivimuutoksia} one {1 rivi lisätty} other {{lines_added, number} "
      & "riviä lisätty}}} one {{lines_added, plural, =0 {1 rivi poistettu} "
      & "one {1 rivi lisätty, 1 rivi poistettu} other {{lines_added, number} "
      & "riviä lisätty, 1 rivi poistettu}}} other {{lines_added, plural, =0 "
      & "{{lines_removed, number} riviä poistettu} one {1 rivi lisätty, "
      & "{lines_removed, number} riviä poistettu} other {{lines_added, number} "
      & "riviä lisätty, {lines_removed, number} riviä poistettu}}}}");
   P ("label.changes.rename_label", "nimetty uudelleen: {old_name} → {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} kirjoitti kommenttiluonnoksen} "
      & "published_comment {{author} kommentoi} edited_comment {{author} "
      & "muokkasi kommenttia} deleted_comment {{author} poisti kommentin} "
      & "resolved_comment {{author} ratkaisi kommentin} unresolved_comment "
      & "{{author} avasi kommentin uudelleen} pinned_comment {{author} "
      & "kiinnitti kommentin} other {{author} piilotti kommentin}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {ei kommentteja} one {1 kommentti} other {{count, "
      & "number} kommenttia}}");
   P ("label.comments.comment_label",
      "{author}: {state, select, draft_comment {kommenttiluonnos} "
      & "published_comment {julkaistu kommentti} edited_comment {muokattu "
      & "kommentti} deleted_comment {poistettu kommentti} resolved_comment "
      & "{ratkaistu kommentti} unresolved_comment {ratkaisematon kommentti} "
      & "pinned_comment {kiinnitetty kommentti} other {piilotettu kommentti}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {kommenttiluonnos} published_comment "
      & "{julkaistu kommentti} edited_comment {muokattu kommentti} "
      & "deleted_comment {poistettu kommentti} resolved_comment {ratkaistu "
      & "kommentti} unresolved_comment {ratkaisematon kommentti} pinned_comment "
      & "{kiinnitetty kommentti} other {piilotettu kommentti}}");
   P ("label.comments.deleted_label", "{author} poisti kommentin");
   P ("label.comments.edited_label", "muokattu {time_text}");
   P ("label.comments.hide_comment_label", "piilota kommentti: {reason}");
   P ("label.comments.lock_thread_label", "lukitse ketju {name}");
   P ("label.comments.mention_label", "{actor} mainitsi: {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {ei osallistujia} one {1 osallistuja} other "
      & "{{count, number} osallistujaa}}");
   P ("label.comments.pin_label", "kiinnitä {name}");
   P ("label.comments.reaction_kind_label",
      "reaktio: {kind, select, like_reaction {tykkäys} dislike_reaction "
      & "{alapeukku} heart_reaction {sydän} laugh_reaction {nauru} "
      & "confused_reaction {hämmentynyt} hooray_reaction {hurraa} "
      & "rocket_reaction {raketti} other {silmät}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {ei tykkäyksiä} one "
      & "{1 tykkäys} other {{count, number} tykkäystä}}} dislike_reaction "
      & "{{count, plural, =0 {ei alapeukkuja} one {1 alapeukku} other {{count, "
      & "number} alapeukkua}}} heart_reaction {{count, plural, =0 {ei "
      & "sydämiä} one {1 sydän} other {{count, number} sydäntä}}} "
      & "laugh_reaction {{count, plural, =0 {ei nauruja} one {1 nauru} other "
      & "{{count, number} naurua}}} confused_reaction {{count, plural, =0 {ei "
      & "hämmentyneitä reaktioita} one {1 hämmentynyt reaktio} other "
      & "{{count, number} hämmentynyttä reaktiota}}} hooray_reaction {{count, "
      & "plural, =0 {ei hurraa-reaktioita} one {1 hurraa-reaktio} other "
      & "{{count, number} hurraa-reaktiota}}} rocket_reaction {{count, plural, "
      & "=0 {ei raketteja} one {1 raketti} other {{count, number} rakettia}}} "
      & "other {{count, plural, =0 {ei silmät-reaktioita} one {1 "
      & "silmät-reaktio} other {{count, number} silmät-reaktiota}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {ei vastauksia} one {1 vastaus} other {{count, "
      & "number} vastausta}}");
   P ("label.comments.resolved_label", "{name} ratkaistu");
   P ("label.comments.subscribe_label", "tilaa {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {ei ketjuja} one {1 ketju} other {{count, number} "
      & "ketjua}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {avoin ketju} resolved_thread "
      & "{ratkaistu ketju} locked_thread {lukittu ketju} other {arkistoitu "
      & "ketju}}{count, plural, =0 {} one {, 1 kommentti} other {, {count, "
      & "number} kommenttia}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {avoin ketju} resolved_thread {ratkaistu "
      & "ketju} locked_thread {lukittu ketju} other {arkistoitu ketju}}");
   P ("label.comments.unpin_label", "irrota {name}");
   P ("label.comments.unsubscribe_label", "peru tilaus: {name}");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {parani} regressed {heikkeni} "
      & "unchanged {ennallaan} within_tolerance {toleranssin sisällä} "
      & "outside_tolerance {toleranssin ulkopuolella} new_value {uusi} "
      & "removed_value {poistettu} other {vertailukohta ei saatavilla}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {parani} regressed {heikkeni} unchanged "
      & "{ennallaan} within_tolerance {toleranssin sisällä} outside_tolerance "
      & "{toleranssin ulkopuolella} new_value {uusi} removed_value {poistettu} "
      & "other {vertailukohta ei saatavilla}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {parani} regressed {heikkeni} "
      & "unchanged {ennallaan} within_tolerance {toleranssin sisällä} "
      & "outside_tolerance {toleranssin ulkopuolella} new_value {uusi} "
      & "removed_value {poistettu} other {vertailukohta ei saatavilla}} "
      & "({difference_text})");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {parani} regressed {heikkeni} "
      & "unchanged {ennallaan} within_tolerance {toleranssin sisällä} "
      & "outside_tolerance {toleranssin ulkopuolella} new_value {uusi} "
      & "removed_value {poistettu} other {vertailukohta ei saatavilla}} "
      & "({difference_text}, toleranssi {tolerance_text})");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {virheellinen rivi} duplicate_record "
      & "{kaksoistietue} missing_column {puuttuva sarake} unknown_field "
      & "{tuntematon kenttä} schema_mismatch {skeeman ristiriita} other "
      & "{ohitettu tietue}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {testiajo onnistui} dry_run_failed "
      & "{testiajo epäonnistui} import_valid {tuonti kelvollinen} "
      & "import_invalid {tuonti virheellinen} other {osittainen tuonti}}");
   P ("label.data_quality.import_result_label",
      "{name} ({state, select, dry_run_passed {testiajo onnistui} "
      & "dry_run_failed {testiajo epäonnistui} import_valid {tuonti "
      & "kelvollinen} import_invalid {tuonti virheellinen} other {osittainen "
      & "tuonti}}): {accepted, number} hyväksytty, {rejected, number} hylätty");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {ei virheellisiä "
      & "rivejä} one {1 virheellinen rivi} other {{count, number} "
      & "virheellistä riviä}}} duplicate_record {{count, plural, =0 {ei "
      & "kaksoistietueita} one {1 kaksoistietue} other {{count, number} "
      & "kaksoistietuetta}}} missing_column {{count, plural, =0 {ei puuttuvia "
      & "sarakkeita} one {1 puuttuva sarake} other {{count, number} puuttuvaa "
      & "saraketta}}} unknown_field {{count, plural, =0 {ei tuntemattomia "
      & "kenttiä} one {1 tuntematon kenttä} other {{count, number} "
      & "tuntematonta kenttää}}} schema_mismatch {{count, plural, =0 {ei "
      & "skeeman ristiriitoja} one {1 skeeman ristiriita} other {{count, "
      & "number} skeeman ristiriitaa}}} other {{count, plural, =0 {ei "
      & "ohitettuja tietueita} one {1 ohitettu tietue} other {{count, number} "
      & "ohitettua tietuetta}}}}");
   P ("label.data_quality.row_issue_label",
      "rivi {row, number}: {issue, select, invalid_row {virheellinen} "
      & "duplicate_record {kaksoistietue} missing_column {puuttuva sarake} "
      & "unknown_field {tuntematon kenttä} schema_mismatch {skeeman "
      & "ristiriita} other {ohitettu tietue}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {virheellinen rivi} "
      & "duplicate_record {kaksoistietue} missing_column {puuttuva sarake} "
      & "unknown_field {tuntematon kenttä} schema_mismatch {skeeman "
      & "ristiriita} other {ohitettu tietue}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefakti valmis} artifact_uploaded "
      & "{artefakti ladattu} artifact_signed {artefakti allekirjoitettu} "
      & "artifact_missing {artefakti puuttuu} other {artefakti vanhentunut}}");
   P ("label.deployments.deployment_label",
      "{name} (ympäristö {environment}): {state, select, queued_deployment "
      & "{käyttöönotto jonossa} deploying {otetaan käyttöön} deployed "
      & "{otettu käyttöön} failed_deployment {käyttöönotto epäonnistui} "
      & "rolled_back {palautettu} blocked_deployment {käyttöönotto estetty} "
      & "other {käyttöönotto peruttu}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {käyttöönotto jonossa} deploying "
      & "{otetaan käyttöön} deployed {otettu käyttöön} failed_deployment "
      & "{käyttöönotto epäonnistui} rolled_back {palautettu} "
      & "blocked_deployment {käyttöönotto estetty} other {käyttöönotto "
      & "peruttu}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {ympäristö kunnossa} "
      & "drifting_environment {ympäristö poikkeaa} locked_environment "
      & "{ympäristö lukittu} maintenance_environment {ympäristö huollossa} "
      & "other {ympäristön tila tuntematon}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {ei migraatiota} migration_pending "
      & "{migraatio odottaa} migrating {migroidaan} migration_complete "
      & "{migraatio valmis} other {migraatio epäonnistui}}");
   P ("label.deployments.promotion_label", "{name} siirretty ylemmäs: {from_environment} → {to_environment}");
   P ("label.deployments.rollback_label", "{name}: palautus, kohde {target}");
   P ("label.deployments.rollout_label", "{name}: käyttöönotto {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {ei vaikutusta kohteisiin} one {vaikuttaa 1 "
      & "kohteeseen} other {vaikuttaa {count, number} kohteeseen}}");
   P ("label.diagnostics.check_duration_label",
      "{status, select, passed_check {{name}: hyväksytty ({duration_s, "
      & "plural, one {1 sekunti} other {{duration_s, number} sekuntia}})} "
      & "failed_check {{name}: epäonnistui ({duration_s, plural, one {1 "
      & "sekunti} other {{duration_s, number} sekuntia}})} warning_check "
      & "{{name}: varoituksia ({duration_s, plural, one {1 sekunti} other "
      & "{{duration_s, number} sekuntia}})} skipped_check {{name}: ohitettu "
      & "({duration_s, plural, one {1 sekunti} other {{duration_s, number} "
      & "sekuntia}})} pending_check {{name}: odottaa ({duration_s, plural, one "
      & "{1 sekunti} other {{duration_s, number} sekuntia}})} other {{name}: "
      & "käynnissä ({duration_s, plural, one {1 sekunti} other {{duration_s, "
      & "number} sekuntia}})}}");
   P ("label.diagnostics.check_result_label",
      "{status, select, passed_check {{name}: hyväksytty} failed_check "
      & "{{name}: epäonnistui} warning_check {{name}: varoituksia} "
      & "skipped_check {{name}: ohitettu} pending_check {{name}: odottaa} other "
      & "{{name}: käynnissä}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {hyväksytty} failed_check "
      & "{epäonnistui} warning_check {varoituksia} skipped_check {ohitettu} "
      & "pending_check {odottaa} other {käynnissä}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {{subject}: odotettiin arvoa} "
      & "expected_unit {{subject}: odotettiin yksikköä} invalid_range "
      & "{{subject}: virheellinen väli} end_before_start {{subject}: välin "
      & "loppu on ennen alkua} unknown_field {{subject}: tuntematon kenttä} "
      & "unsafe_redacted_value {{subject}: vaarallinen arvo peitettiin} "
      & "unsupported_syntax {{subject}: syntaksia ei tueta} other {{subject}: "
      & "diagnostiikan selitys}}{position, plural, =0 {;} other { (kohta "
      & "{position, number});}} ehdotus: {suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {tieto} notice_severity {huomautus} "
      & "warning_severity {varoitus} error_severity {virhe} critical_severity "
      & "{kriittinen} other {estävä}} ({line, plural, =0 {{path}): {message}} "
      & "other {{path}, rivi {line, number}): {message}}}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {epäonnistui: {path}} other {{column, plural, =0 "
      & "{epäonnistui: {path}, rivi {line, number}} other {epäonnistui: "
      & "{path}, rivi {line, number}, sarake {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {tieto} notice_severity {huomautus} "
      & "warning_severity {varoitus} error_severity {virhe} critical_severity "
      & "{kriittinen} other {estävä}} ({field_name}): {message}");
   P ("label.diagnostics.first_failure_label",
      "{line, plural, =0 {ensimmäinen virhe ({check_name}): {path}} other "
      & "{ensimmäinen virhe ({check_name}): {path}, rivi {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 {ei "
      & "ongelmia} one {1 huomautus} other {{notices, number} huomautusta}}} "
      & "one {{notices, plural, =0 {1 varoitus} one {1 varoitus, 1 huomautus} "
      & "other {1 varoitus, {notices, number} huomautusta}}} other {{notices, "
      & "plural, =0 {{warnings, number} varoitusta} one {{warnings, number} "
      & "varoitusta, 1 huomautus} other {{warnings, number} varoitusta, "
      & "{notices, number} huomautusta}}}}} one {{warnings, plural, =0 "
      & "{{notices, plural, =0 {1 virhe} one {1 virhe, 1 huomautus} other {1 "
      & "virhe, {notices, number} huomautusta}}} one {{notices, plural, =0 {1 "
      & "virhe, 1 varoitus} one {1 virhe, 1 varoitus, 1 huomautus} other {1 "
      & "virhe, 1 varoitus, {notices, number} huomautusta}}} other {{notices, "
      & "plural, =0 {1 virhe, {warnings, number} varoitusta} one {1 virhe, "
      & "{warnings, number} varoitusta, 1 huomautus} other {1 virhe, {warnings, "
      & "number} varoitusta, {notices, number} huomautusta}}}}} other "
      & "{{warnings, plural, =0 {{notices, plural, =0 {{errors, number} "
      & "virhettä} one {{errors, number} virhettä, 1 huomautus} other "
      & "{{errors, number} virhettä, {notices, number} huomautusta}}} one "
      & "{{notices, plural, =0 {{errors, number} virhettä, 1 varoitus} one "
      & "{{errors, number} virhettä, 1 varoitus, 1 huomautus} other {{errors, "
      & "number} virhettä, 1 varoitus, {notices, number} huomautusta}}} other "
      & "{{notices, plural, =0 {{errors, number} virhettä, {warnings, number} "
      & "varoitusta} one {{errors, number} virhettä, {warnings, number} "
      & "varoitusta, 1 huomautus} other {{errors, number} virhettä, {warnings, "
      & "number} varoitusta, {notices, number} huomautusta}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, rivi "
      & "{line, number}} other {{path}, rivi {line, number}, sarake {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "syntaksia ei tueta ({family, select, byte_parser {tavujäsennin} "
      & "duration_parser {keston jäsennin} date_time_parser {päivämäärä- "
      & "ja aikajäsennin} color_parser {värijäsennin} url_parser "
      & "{URL-jäsennin} unit_parser {yksikköjäsennin} recurrence_parser "
      & "{toistuvuusjäsennin} domain_label_parser {toimialuetunnisteen "
      & "jäsennin} other {jäsennin}}): {error}{position, plural, =0 {;} other "
      & "{ (kohta {position, number});}} {family, select, byte_parser {käytä: "
      & "B, kB, MB, GB, KiB, MiB, GiB tai TiB} duration_parser {käytä: ms, s, "
      & "min, h, d, w, month tai year} date_time_parser {käytä "
      & "ISO-päivämäärää, luonnollista päivää tai kellonaikaa} "
      & "color_parser {käytä hex-, rgb()-, hsl()-, lab()- tai lch()-muotoa "
      & "tai värin nimeä} url_parser {käytä skeemaa, isäntää, polkua, "
      & "kyselyä tai fragmenttia} unit_parser {käytä Humanizen tukemaa "
      & "yksikkönimeä} recurrence_parser {käytä cron- tai "
      & "every/weekday-toistomuotoa} domain_label_parser {käytä "
      & "determinististä Humanize-toimialuetunnistetta} other {käytä tuettua "
      & "syötemuotoa}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {hyväksytty} failed_check "
      & "{epäonnistui} warning_check {varoituksia} skipped_check {ohitettu} "
      & "pending_check {odottaa} other {käynnissä}}, {notices, plural, =0 {ei "
      & "huomautuksia} one {1 huomautus} other {{notices, number} huomautusta}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {uusintayritys 1/1} other "
      & "{uusintayritys {attempt, number}/1 – raja ylitetty}}} other "
      & "{uusintayritys {attempt, number}/{limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {tieto} notice_severity {huomautus} "
      & "warning_severity {varoitus} error_severity {virhe} critical_severity "
      & "{kriittinen} other {estävä}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {käännösdiagnostiikka} test_source "
      & "{testidiagnostiikka} lint_source {lint-diagnostiikka} import_source "
      & "{tuontidiagnostiikka} validation_source {validointidiagnostiikka} "
      & "runtime_source {ajonaikainen diagnostiikka} security_source "
      & "{tietoturvadiagnostiikka} other {diagnostiikka}}");
   P ("label.diagnostics.source_summary_label",
      "{source, select, build_source {käännösdiagnostiikka: {count, "
      & "plural, one {1 merkintä} other {{count, number} merkintää}}} "
      & "test_source {testidiagnostiikka: {count, plural, one {1 merkintä} "
      & "other {{count, number} merkintää}}} lint_source {lint-diagnostiikka: "
      & "{count, plural, one {1 merkintä} other {{count, number} "
      & "merkintää}}} import_source {tuontidiagnostiikka: {count, plural, one "
      & "{1 merkintä} other {{count, number} merkintää}}} validation_source "
      & "{validointidiagnostiikka: {count, plural, one {1 merkintä} other "
      & "{{count, number} merkintää}}} runtime_source {ajonaikainen "
      & "diagnostiikka: {count, plural, one {1 merkintä} other {{count, "
      & "number} merkintää}}} security_source {tietoturvadiagnostiikka: "
      & "{count, plural, one {1 merkintä} other {{count, number} "
      & "merkintää}}} other {diagnostiikka: {count, plural, one {1 merkintä} "
      & "other {{count, number} merkintää}}}}");
   P ("label.diagnostics.suggested_action_label", "seuraava vaihe: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {verkkotunnusisäntä} ipv4_host "
      & "{IPv4-osoite} ipv6_host {IPv6-osoite} localhost_host {paikallinen "
      & "isäntä} private_network_host {yksityisverkon osoite} other "
      & "{tuntematon isäntä}}");
   P ("label.events.all_day_label", "{name}, koko päivän tapahtuma");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {ei vastannut} accepted {hyväksytty} "
      & "declined {hylätty} maybe {ehkä} other {jonotuslistalla}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {ei osallistujia} one {1 osallistuja} other "
      & "{{count, number} osallistujaa}}");
   P ("label.events.canceled_label", "{name} peruttu");
   P ("label.events.check_in_label", "ilmoittaudu paikalle: {name}");
   P ("label.events.conference_link_label", "{name}: konferenssilinkki");
   P ("label.events.event_count_label",
      "{count, plural, =0 {ei tapahtumia} one {1 tapahtuma} other {{count, "
      & "number} tapahtumaa}}");
   P ("label.events.event_label",
      "{state, select, scheduled_event {{name}: ajoitettu} tentative_event "
      & "{{name}: alustava} in_progress_event {{name}: käynnissä} "
      & "completed_event {{name}: päättynyt} canceled_event {{name}: peruttu} "
      & "other {{name}: siirretty}}");
   P ("label.events.event_location_label", "{name}, paikka: {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {ajoitettu tapahtuma} tentative_event "
      & "{alustava tapahtuma} in_progress_event {käynnissä oleva tapahtuma} "
      & "completed_event {päättynyt tapahtuma} canceled_event {peruttu "
      & "tapahtuma} other {siirretty tapahtuma}}");
   P ("label.events.event_time_label", "{name}, aika: {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {julkinen tapahtuma} private_event "
      & "{yksityinen tapahtuma} busy_event {näkyy varattuna} other {näkyy "
      & "vapaana}}");
   P ("label.events.organizer_label", "järjestäjä: {name}");
   P ("label.events.rsvp_label",
      "vastaus: {state, select, not_responded {ei vastannut} accepted "
      & "{hyväksytty} declined {hylätty} maybe {ehkä} other "
      & "{jonotuslistalla}}");
   P ("label.events.reminder_label", "muistutus: {time_text}");
   P ("label.events.rescheduled_label", "{name} siirretty, uusi aika: {time_text}");
   P ("label.forms.character_count_label", "{used, plural, one {1 merkki} other {{used, number} merkkiä}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {ei merkkirajaa} one {enintään 1 merkki} other "
      & "{enintään {limit, number} merkkiä}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {1 merkki} other {{used, "
      & "number} merkkiä}}} other {{used, number}/{limit, number} merkkiä}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}, valinnainen kenttä} other {{name}, "
      & "pakollinen kenttä}}");
   P ("label.forms.field_state_label",
      "{state, select, valid_input {{name}: kelvollinen} invalid_input "
      & "{{name}: virheellinen} required_input {{name}: pakollinen} "
      & "optional_input {{name}: valinnainen} disabled_input {{name}: poistettu "
      & "käytöstä} other {{name}: vain luku}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {ei lomakeongelmia} one {1 "
      & "varoitus} other {{warnings, number} varoitusta}}} one {{warnings, "
      & "plural, =0 {1 virhe} one {1 virhe, 1 varoitus} other {1 virhe, "
      & "{warnings, number} varoitusta}}} other {{warnings, plural, =0 "
      & "{{errors, number} virhettä} one {{errors, number} virhettä, 1 "
      & "varoitus} other {{errors, number} virhettä, {warnings, number} "
      & "varoitusta}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {ei aloitettu} editing_form {muokataan} "
      & "dirty_form {tallentamattomia muutoksia} saving_form {tallennetaan} "
      & "saved_form {tallennettu} submitted_form {lähetetty} other {lähetys "
      & "epäonnistui}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {kelvollinen syöte} invalid_input "
      & "{virheellinen syöte} required_input {pakollinen syöte} "
      & "optional_input {valinnainen syöte} disabled_input {käytöstä "
      & "poistettu syöte} other {vain luku -syöte}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {ei aloitettu} editing_form {muokataan} "
      & "dirty_form {tallentamattomia muutoksia} saving_form {tallennetaan "
      & "lomaketta} saved_form {lomake tallennettu} submitted_form {lomake "
      & "lähetetty} other {{errors, plural, =0 {lähetys epäonnistui} one "
      & "{lähetys epäonnistui: 1 virhe} other {lähetys epäonnistui: "
      & "{errors, number} virhettä}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {ei tallentamattomia muutoksia} one {1 "
      & "tallentamaton muutos} other {{count, number} tallentamatonta "
      & "muutosta}}");
   P ("label.markup.accessibility_issue_label",
      "{issue, select, missing_accessible_name {{target}: saavutettava nimi "
      & "puuttuu} low_contrast {{target}: heikko kontrasti} "
      & "skipped_heading_level {{target}: otsikkotaso ohitettu} "
      & "missing_form_label {{target}: lomakkeen nimiö puuttuu} invalid_aria "
      & "{{target}: virheellinen ARIA} keyboard_trap {{target}: "
      & "näppäimistöansa} other {{target}: tuntematon "
      & "saavutettavuusongelma}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}, saavutettavuus: {landmarks, plural, one {1 maamerkki} other "
      & "{{landmarks, number} maamerkkiä}}, {headings, plural, one {1 otsikko} "
      & "other {{headings, number} otsikkoa}}, {issues, plural, one {1 ongelma} "
      & "other {{issues, number} ongelmaa}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {lisää saavutettava nimi} "
      & "low_contrast {lisää tekstin kontrastia} skipped_heading_level "
      & "{käytä otsikkotasoja järjestyksessä} missing_form_label {liitä "
      & "nimiö lomakkeen ohjaimeen} invalid_aria {käytä kelvollista "
      & "ARIA-roolia tai -attribuuttia} keyboard_trap {varmista, että "
      & "näppäimistön kohdistus voi poistua komponentista} other {tarkista "
      & "saavutettavuusongelma}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target}: ei saavutettavuusongelmia} one "
      & "{{target}: 1 saavutettavuusongelma} other {{target}: {issues, number} "
      & "saavutettavuusongelmaa}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id-attribuutti} class_attribute "
      & "{class-attribuutti} data_attribute {data-attribuutti} aria_attribute "
      & "{ARIA-attribuutti} role_attribute {role-attribuutti} link_attribute "
      & "{linkkiattribuutti} media_attribute {media-attribuutti} form_attribute "
      & "{lomakeattribuutti} boolean_attribute {totuusarvoattribuutti} "
      & "event_attribute {tapahtumankäsittelijäattribuutti} other {tuntematon "
      & "attribuutti}}");
   P ("label.markup.form_error_summary_label",
      "{form_name}: {errors, plural, =0 {{warnings, plural, =0 {ei "
      & "lomakeongelmia} one {1 varoitus} other {{warnings, number} "
      & "varoitusta}}} one {{warnings, plural, =0 {1 virhe} one {1 virhe, 1 "
      & "varoitus} other {1 virhe, {warnings, number} varoitusta}}} other "
      & "{{warnings, plural, =0 {{errors, number} virhettä} one {{errors, "
      & "number} virhettä, 1 varoitus} other {{errors, number} virhettä, "
      & "{warnings, number} varoitusta}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {banneri-maamerkki} navigation_role "
      & "{navigointimaamerkki} main_role {päämaamerkki} complementary_role "
      & "{täydentävä maamerkki} contentinfo_role {sisältötietomaamerkki} "
      & "search_role {hakumaamerkki} form_role {lomakemaamerkki} region_role "
      & "{aluemaamerkki} dialog_role {valintaikkuna} alert_role {hälytysten "
      & "live-alue} status_role {tilan live-alue} other {tuntematon maamerkki}}");
   P ("label.markup.live_region_update_label",
      "{region}, {polite, select, false {välitön} other {kohtelias}} "
      & "päivitys: {update}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {tekstisisältö} html_content "
      & "{HTML-sisältö} json_content {JSON-sisältö} xml_content "
      & "{XML-sisältö} image_content {kuvasisältö} audio_content "
      & "{äänisisältö} video_content {videosisältö} font_content "
      & "{fonttisisältö} archive_content {arkistosisältö} binary_content "
      & "{binäärisisältö} form_content {lomakesisältö} other {tuntematon "
      & "sisältö}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {dokumenttitagi} metadata_tag "
      & "{metatietotagi} section_tag {osiotagi} text_tag {tekstitagi} link_tag "
      & "{linkkitagi} media_tag {mediatagi} form_tag {lomaketagi} table_tag "
      & "{taulukkotagi} interactive_tag {interaktiivinen tagi} scripting_tag "
      & "{skriptitagi} other {tuntematon tagi}}");
   P ("label.media.duration_label", "kesto: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {kuva} video_media {video} audio_media "
      & "{ääni} pdf_document {PDF-dokumentti} text_document {tekstiasiakirja} "
      & "archive_media {arkisto} other {media}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {valmis} processing_media {käsitellään} "
      & "transcoding_media {transkoodataan} thumbnail_missing {pikkukuva ei "
      & "saatavilla} metadata_missing {metatiedot puuttuvat} locked_document "
      & "{asiakirja lukittu} other {ei saatavilla}}");
   P ("label.media.media_summary",
      "{name}, {kind, select, image_media {kuva} video_media {video} "
      & "audio_media {ääni} pdf_document {PDF-dokumentti} text_document "
      & "{tekstiasiakirja} archive_media {arkisto} other {media}}: {state, "
      & "select, ready_media {valmis} processing_media {käsitellään} "
      & "transcoding_media {transkoodataan} thumbnail_missing {pikkukuva ei "
      & "saatavilla} metadata_missing {metatiedot puuttuvat} locked_document "
      & "{lukittu} other {ei saatavilla}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {ei sivuja} one {1 sivu} other {{pages, number} "
      & "sivua}}");
   P ("label.media.resolution_label", "{width, number}x{height, number}");
   P ("label.moderation.appeal_label",
      "{item}: valitus, {state, select, open_report {avoin raportti} "
      & "triaged_report {luokiteltu raportti} actioned_report {toimenpiteet "
      & "tehty} dismissed_report {hylätty raportti} appealed_report "
      & "{raportista valitettu} other {suljettu raportti}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {ei moderointitoimia} flagged {liputettu} "
      & "hidden {moderaattorin piilottama} restored {palautettu} marked_spam "
      & "{merkitty roskapostiksi} removed {poistettu} other {eskaloitu}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {ei moderointitoimia} flagged "
      & "{liputettu} hidden {moderaattorin piilottama} restored {palautettu} "
      & "marked_spam {merkitty roskapostiksi} removed {poistettu} other "
      & "{eskaloitu}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {moderointijono on "
      & "tyhjä} other {{pending, number} odottaa tarkistusta}}} other "
      & "{{pending, number} odottaa tarkistusta, {escalated, number} "
      & "eskaloitu}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {avoin raportti} triaged_report "
      & "{luokiteltu raportti} actioned_report {toimenpiteet tehty} "
      & "dismissed_report {hylätty raportti} appealed_report {raportista "
      & "valitettu} other {suljettu raportti}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {avoin raportti} triaged_report "
      & "{luokiteltu raportti} actioned_report {toimenpiteet tehty} "
      & "dismissed_report {hylätty raportti} appealed_report {raportista "
      & "valitettu} other {suljettu raportti}}");
end Labels_1;
