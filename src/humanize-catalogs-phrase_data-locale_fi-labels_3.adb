separate (Humanize.Catalogs.Phrase_Data.Locale_Fi)
procedure Labels_3 is
begin
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} {kind} ei asetettu} other {{name} "
      & "{kind}, loppuosa {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {tunnistusotsake {name} ei asetettu} other "
      & "{{name} {kind}, loppuosa {shown}}}");
   P ("label.secrets.fingerprint_label", "{algorithm}-sormenjälki, loppuosa {shown}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {1 salaisuus} other {{count, number} salaisuutta}}");
   P ("label.secrets.secret_count_label.masked", "{count, number} peitetty");
   P ("label.secrets.secret_count_label.unset", "{count, number} asettamatta");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {1 sormenjälki} other {{count, number} "
      & "sormenjälkeä}}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label} ei asetettu} redacted {{label} "
      & "piilotettu} url_redacted {URL piilotettu} ip_redacted {IP-osoite "
      & "piilotettu} path_ending {tiedostopolku, loppuosa {shown}} at {{label}, "
      & "osoite {shown}} audit {{label}, pituus {length, number}, loppuosa "
      & "{shown}} debug {{label} {shown}} other {{label}, loppuosa {shown}}}");
   P ("label.schema.field_label",
      "{state, select, deprecated_field {vanhentunut } unknown_field "
      & "{tuntematon } read_only_field {vain luettava } write_only_field {vain "
      & "kirjoitettava } computed_field {laskettu } other {}}{presence, select, "
      & "required_field {pakollinen} optional_field {valinnainen} "
      & "conditional_field {ehdollinen} other {läsnäololtaan tuntematon}} "
      & "kenttä {name}, tyyppi {kind, select, string_field {merkkijono} "
      & "integer_field {kokonaisluku} decimal_field {desimaaliluku} "
      & "boolean_field {totuusarvo} date_field {päivämäärä} "
      & "date_time_field {päivämäärä ja aika} object_field {objekti} "
      & "array_field {taulukko} enum_field {enum} binary_field {binääri} "
      & "null_field {null} any_field {mikä tahansa} other "
      & "{tuntematon}}{nullable, select, non_nullable {, ei null} nullable {, "
      & "null sallittu} other {}}");
   P ("label.schema.schema_summary_label.fields",
      "{count, plural, one {1 kenttä} other {{count, number} kenttää}}");
   P ("label.schema.schema_summary_label.required",
      "{count, plural, one {1 pakollinen} other {{count, number} pakollista}}");
   P ("label.schema.schema_summary_label.optional",
      "{count, plural, one {1 valinnainen} other {{count, number} "
      & "valinnaista}}");
   P ("label.schema.schema_summary_label.deprecated",
      "{count, plural, one {1 vanhentunut} other {{count, number} "
      & "vanhentunutta}}");
   P ("label.schema.schema_summary_label.unknown",
      "{count, plural, one {1 tuntematon} other {{count, number} "
      & "tuntematonta}}");
   P ("label.schema.type_mismatch_label",
      "kenttä {field_name}: odotettiin {expected, select, string_field "
      & "{merkkijonoa} integer_field {kokonaislukua} decimal_field "
      & "{desimaalilukua} boolean_field {totuusarvoa} date_field "
      & "{päivämäärää} date_time_field {aikaleimaa} object_field "
      & "{objektia} array_field {taulukkoa} enum_field {enum-arvoa} "
      & "binary_field {binääriarvoa} null_field {null-arvoa} any_field {mitä "
      & "tahansa} other {tuntematonta}}, saatiin {actual, select, string_field "
      & "{merkkijono} integer_field {kokonaisluku} decimal_field "
      & "{desimaaliluku} boolean_field {totuusarvo} date_field "
      & "{päivämäärä} date_time_field {aikaleima} object_field {objekti} "
      & "array_field {taulukko} enum_field {enum-arvo} binary_field "
      & "{binääriarvo} null_field {null-arvo} any_field {mikä tahansa} other "
      & "{tuntematon}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {1 estävä "
      & "ongelma} other {{blocking, number} estävää ongelmaa}}} blocking "
      & "{{base}, {blocking, plural, one {1 estävä ongelma} other {{blocking, "
      & "number} estävää ongelmaa}}} only {vain {base}} other {{base}}}");
   P ("label.diagnostics.check_run_summary_label.none", "ei suoritettuja tarkistuksia");
   P ("label.diagnostics.check_run_summary_label.passed", "{count, number} hyväksytty");
   P ("label.diagnostics.check_run_summary_label.failed", "{count, number} epäonnistui");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 varoitus} other {{count, number} varoitusta}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "{count, number} ohitettu");
   P ("label.diagnostics.check_run_summary_label.pending", "{count, number} odottaa");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {tavoitealue {low}–{high} "
      & "(päätepisteet mukaan lukien)} other {tavoiteikkuna {low}–{high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} odotetulla vaihteluvälillä} below "
      & "{{value} alle odotetun vaihteluvälin} other {{value} yli odotetun "
      & "vaihteluvälin}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} kriittisessä kynnyksessä} warning "
      & "{{value} varoituskynnyksessä} other {{value} normaalilla alueella}}");
   P ("label.thresholds.breach_label", "{state, select, ok {ei ylitetty} other {ylitetty {difference} verran}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {tavoitteessa} below {{difference} alle tavoitteen} "
      & "other {{difference} yli tavoitteen}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {raja ylitetty} near {lähellä rajaa, "
      & "{distance} jäljellä} other {{distance} rajaan}}");
   P ("label.thresholds.threshold_summary_label.none", "ei mittareita");
   P ("label.thresholds.threshold_summary_label.normal",
      "{count, plural, one {1 normaali} other {{count, number} normaalia}}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {1 varoitus} other {{count, number} varoitusta}}");
   P ("label.thresholds.threshold_summary_label.critical",
      "{count, plural, one {1 kriittinen} other {{count, number} "
      & "kriittistä}}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {1 ylitys} other {{count, number} ylitystä}}");
   P ("label.thresholds.target_window_label", "tavoite {target} ± {tolerance}");
   P ("label.thresholds.tolerance_label", "toleranssi {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} rajasta");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {raja ylitetty {amount} verran} other "
      & "{{amount} jäljellä}}");
   P ("label.thresholds.budget_used_label", "{used} / {budget} käytetty");
   P ("label.workflows.step_label", "vaihe {current, number}/{total, number}: {name}");
   P ("label.workflows.milestone_label", "{current, number}/{total, number} välitavoitetta saavutettu: {name}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {1 kohde} other {{count, number} kohdetta}}");
   P ("label.workflows.workflow_summary_label.completed",
      "{count, plural, one {1 valmis} other {{count, number} valmista}}");
   P ("label.workflows.workflow_summary_label.active",
      "{count, plural, one {1 aktiivinen} other {{count, number} aktiivista}}");
   P ("label.workflows.workflow_summary_label.blocked", "{count, number} estetty");
   P ("label.workflows.workflow_summary_label.failed", "{count, number} epäonnistui");
   P ("label.workflows.workflow_summary_label.skipped", "{count, number} ohitettu");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {ei työnkulun kohteita} half {työnkulku "
      & "puolivälissä} other {{completed, number}/{total, number} valmiina}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {jonossa sijalla {position, number}} other {jonossa "
      & "sijalla {position, number}/{total, number}}}");
   P ("label.changes.change_set_label.none", "ei muutoksia");
   P ("label.changes.change_set_label.added", "{count, number} lisätty");
   P ("label.changes.change_set_label.removed", "{count, number} poistettu");
   P ("label.changes.change_set_label.modified", "{count, number} muutettu");
   P ("label.changes.change_set_label.unchanged", "{count, number} ennallaan");
   P ("label.changes.change_summary_label.total", "{count, plural, one {1 kohde} other {{count, number} kohdetta}}");
   P ("label.changes.change_summary_label.added", "{count, number} lisätty");
   P ("label.changes.change_summary_label.removed", "{count, number} poistettu");
   P ("label.changes.change_summary_label.modified", "{count, number} muutettu");
   P ("label.changes.change_summary_label.renamed", "{count, number} nimetty uudelleen");
   P ("label.changes.change_summary_label.unchanged", "{count, number} ennallaan");
   P ("label.changes.sync_change_label.none", "ei synkronointimuutoksia");
   P ("label.changes.sync_change_label.uploaded", "{count, number} lähetetty");
   P ("label.changes.sync_change_label.downloaded", "{count, number} ladattu");
   P ("label.changes.sync_change_label.deleted", "{count, number} poistettu");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {1 ristiriita} other {{count, number} "
      & "ristiriitaa}}");
   P ("label.changes.net_change_label",
      "{state, select, none {ei nettomuutosta} up {netto +{count, plural, one "
      & "{1 kohde} other {{count, number} kohdetta}}} other {netto -{count, "
      & "plural, one {1 kohde} other {{count, number} kohdetta}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {ei tarkistettavia muutoksia} all {kaikki "
      & "muutokset tarkistettu} other {{reviewed, number}/{total, number} "
      & "muutosta tarkistettu}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} ennallaan: {new_value}} up "
      & "{{field_name} kasvoi: {old_value} → {new_value}} other {{field_name} "
      & "pieneni: {old_value} → {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {ei valittavia rivejä} none {ei valittuja "
      & "rivejä} all {{total, plural, one {1 rivi valittu} other {kaikki "
      & "{total, number} riviä valittu}}} other {{total, plural, one "
      & "{{selected, number}/1 rivi valittu} other {{selected, number}/{total, "
      & "number} riviä valittu}}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {ei sivuja} other {{pages, plural, =0 {ei sivuja} "
      & "other {{rows, plural, =0 {sivu {page, number}/{pages, number}} one "
      & "{sivu {page, number}/{pages, number}, 1 rivi} other {sivu {page, "
      & "number}/{pages, number}, {rows, number} riviä}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {ei rivejä} none {ei vastaavia rivejä} all "
      & "{{total, plural, one {1 rivi näkyvissä} other {kaikki {total, "
      & "number} riviä näkyvissä}}} other {{total, plural, one {{visible, "
      & "number}/1 rivi näkyvissä} other {{visible, number}/{total, number} "
      & "riviä näkyvissä}}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {ei rivejä} single {rivi {first_row, "
      & "number}/{total, number}} other {rivit {first_row, number}–{last_row, "
      & "number}/{total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {ei merkkirajoitusta} none_left {ei "
      & "merkkejä jäljellä} left {{count, plural, one {1 merkki} other "
      & "{{count, number} merkkiä}} jäljellä} other {{count, plural, one {1 "
      & "merkki} other {{count, number} merkkiä}} yli rajan}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {ei pakollisia kenttiä} one {{missing, plural, =0 "
      & "{kaikki pakolliset kentät täytetty} other {1/1 pakollinen kenttä "
      & "puuttuu}}} other {{missing, plural, =0 {kaikki pakolliset kentät "
      & "täytetty} other {{missing, number}/{total, number} pakollista "
      & "kenttää puuttuu}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {ei kenttiä} all {kaikki kentät täytetty} "
      & "other {{total, plural, one {{completed, number}/1 kenttä täytetty} "
      & "other {{completed, number}/{total, number} kenttää täytetty}}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: ei kenttiä} all {{name}: kaikki kentät "
      & "täytetty} other {{name}: {total, plural, one {{completed, number}/1 "
      & "kenttä täytetty} other {{completed, number}/{total, number} "
      & "kenttää täytetty}}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {ei lomakkeen vaiheita} one {vaihe 1/1: {name}} "
      & "other {vaihe {current, number}/{total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {ei murupolkua} one {murupolun osa 1/1: {name}} "
      & "other {murupolun osa {current, number}/{total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {ei välilehtiä} one {välilehti 1/1: {name}} "
      & "other {välilehti {current, number}/{total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {saapuneet-kansio tyhjä} one {{unread, plural, =0 "
      & "{kaikki ilmoitukset luettu} other {1/1 ilmoitus lukematta}}} other "
      & "{{unread, plural, =0 {kaikki ilmoitukset luettu} other {{unread, "
      & "number}/{total, number} ilmoitusta lukematta}}}}");
   P ("label.notifications.delivery_attempt_label", "toimitusyritys {attempt, number}/{max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {ei tarkistuslistan kohteita} one {{done, plural, "
      & "=0 {0/1 kohde valmis} other {1/1 kohde valmis}}} other {{done, "
      & "number}/{total, number} kohdetta valmiina}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {ei latauksia} one {{done, plural, =0 {0/1 lähetys "
      & "valmis} other {1/1 lähetys valmis}}} other {{done, number}/{total, "
      & "number} lähetystä valmiina}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {ei kapasiteettia} one {{reserved, plural, =0 "
      & "{0/1 paikka varattu} other {1/1 paikka varattu}}} other {{reserved, "
      & "number}/{capacity, number} paikkaa varattu}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {jonotuslistalla sijalla {position, number}} other "
      & "{jonotuslistalla sijalla {position, number}/{total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} muuttunut} other {{name}: {changed, number} muuttunut, "
      & "{unchanged, number} ennallaan, yhteensä {total, number}}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.markup.accessible_control_label.control",
      "{named, select, no {nimetön {role, select, button_control {painike} "
      & "link_control {linkki} tab_control {välilehti} menu_item_control "
      & "{valikkokohde} checkbox_control {valintaruutu} radio_control "
      & "{valintanappi} text_field_control {tekstikenttä} progress_control "
      & "{edistymispalkki} table_cell_control {taulukon solu} region_control "
      & "{alue} other {ohjausobjekti}}} other {{name}, {role, select, "
      & "button_control {painike} link_control {linkki} tab_control "
      & "{välilehti} menu_item_control {valikkokohde} checkbox_control "
      & "{valintaruutu} radio_control {valintanappi} text_field_control "
      & "{tekstikenttä} progress_control {edistymispalkki} table_cell_control "
      & "{taulukon solu} region_control {alue} other {ohjausobjekti}}}}");
   P ("label.markup.accessible_control_label.selected", "valittu");
   P ("label.markup.accessible_control_label.expanded", "laajennettu");
   P ("label.markup.accessible_control_label.current", "nykyinen");
   P ("label.markup.accessible_control_label.disabled", "poistettu käytöstä");
   P ("label.markup.accessible_control_label.required", "pakollinen");
   P ("label.markup.accessible_control_label.invalid", "virheellinen");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {1 kohde} other {{count, number} kohdetta}}");
   P ("label.markup.accessible_control_label.position", "kohde {position}/{total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {1 ongelma} other {{count, number} ongelmaa}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "skeema");
   P ("label.endpoints.url_component.host", "isäntä");
   P ("label.endpoints.url_component.path", "polku");
   P ("label.endpoints.url_component.query", "kysely");
   P ("label.endpoints.url_component.fragment", "fragmentti");
   P ("label.names.hue_noun.red", "punainen");
   P ("label.names.hue_noun.orange", "oranssi");
   P ("label.names.hue_noun.yellow", "keltainen");
   P ("label.names.hue_noun.green", "vihreä");
   P ("label.names.hue_noun.cyan", "syaani");
   P ("label.names.hue_noun.blue", "sininen");
   P ("label.names.hue_noun.purple", "violetti");
   P ("label.names.hue_noun.magenta", "magenta");
   P ("label.names.hue_noun.neutral", "neutraali sävy");
   P ("label.names.hue_noun.pink", "vaaleanpunainen");
   P ("label.names.hue_gender.red", "other");
   P ("label.names.hue_gender.orange", "other");
   P ("label.names.hue_gender.yellow", "other");
   P ("label.names.hue_gender.green", "other");
   P ("label.names.hue_gender.cyan", "other");
   P ("label.names.hue_gender.blue", "other");
   P ("label.names.hue_gender.purple", "other");
   P ("label.names.hue_gender.magenta", "other");
   P ("label.names.hue_gender.neutral", "other");
   P ("label.names.hue_gender.pink", "other");
   P ("label.names.agree.very_dark", "{gender, select, other {hyvin tumma}}");
   P ("label.names.agree.dark", "{gender, select, other {tumma}}");
   P ("label.names.agree.medium_brightness", "{gender, select, other {keskikirkas}}");
   P ("label.names.agree.light", "{gender, select, other {vaalea}}");
   P ("label.names.agree.very_light", "{gender, select, other {hyvin vaalea}}");
   P ("label.names.agree.desaturated", "{gender, select, other {haalistunut}}");
   P ("label.names.agree.muted", "{gender, select, other {hillitty}}");
   P ("label.names.agree.neutral", "{gender, select, other {neutraali}}");
   P ("label.names.agree.saturated", "{gender, select, other {kylläinen}}");
   P ("label.names.agree.vivid", "{gender, select, other {kirkas}}");
   P ("label.names.agree.grayish", "{gender, select, other {harmahtava}}");
   P ("label.names.agree.soft", "{gender, select, other {pehmeä}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {kohtalaisen kromaattinen}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {voimakkaan kromaattinen}}");
   P ("label.names.agree.pastel", "{gender, select, other {pastellinen}}");
   P ("label.names.agree.warm", "{gender, select, other {lämmin}}");
   P ("label.names.agree.cool", "{gender, select, other {viileä}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {lämpötilaltaan neutraali}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {lämpötilaltaan tasapainoinen}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "nykyinen tekstin väri täyttää suuren tekstin kontrastivaatimuksen: "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "nykyinen tekstin väri täyttää normaalin tekstin "
      & "kontrastivaatimuksen: {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "käytä väriä {v1}: tehostettu tekstikontrasti {v2, number}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "käytä väriä {v1}: suuren tekstin kontrasti {v2, number}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "käytä väriä {v1}: normaalin tekstin kontrasti {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "käytä väriä {v1}: suuren tekstin kontrasti {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "käytä väriä {v1}: tehostettu tekstikontrasti {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "nykyinen tekstin väri täyttää suuren tekstin kontrastivaatimuksen: "
      & "{v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "nykyinen tekstin väri täyttää normaalin tekstin "
      & "kontrastivaatimuksen: {v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "nykyinen tekstin väri täyttää tehostetun tekstikontrastin "
      & "vaatimuksen: {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "nykyinen tekstin väri täyttää tehostetun tekstikontrastin "
      & "vaatimuksen: {v1, number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopia: pieni sekoittumisriski, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopia: kohtalainen sekoittumisriski, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopia: kohtalainen sekoittumisriski, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "akromatopsia: suuri sekoittumisriski, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, dramaattinen havaittava ero");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, dramaattinen havaittava ero");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 tekstiili delta {v1}, dramaattinen havaittava ero");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, dramaattinen havaittava ero");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, suuri havaittava ero");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopia: kohtalainen sekoittumisriski, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, dramaattinen havaittava ero");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, dramaattinen havaittava ero");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, dramaattinen havaittava ero");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "akromatopsia: pieni sekoittumisriski, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopia: erottuvat, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopia: erottuvat, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopia: erottuvat, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "akromatopsia: erottuvat, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "akromatopsia: kohtalainen sekoittumisriski, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, suuri havaittava ero");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, suuri havaittava ero");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 tekstiili delta {v1}, suuri havaittava ero");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, suuri havaittava ero");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, selvästi havaittava ero");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopia: suuri sekoittumisriski, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopia: suuri sekoittumisriski, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, selvästi havaittava ero");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 tekstiili delta {v1}, selvästi havaittava ero");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, selvästi havaittava ero");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, selvästi havaittava ero");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopia: pieni sekoittumisriski, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopia: pieni sekoittumisriski, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, suuri havaittava ero");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopia: suuri sekoittumisriski, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, dramaattinen havaittava ero");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 tekstiili delta {v1, number}, dramaattinen havaittava ero");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, dramaattinen havaittava ero");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, suuri havaittava ero");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 tekstiili delta {v1, number}, suuri havaittava ero");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, suuri havaittava ero");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, selvästi havaittava ero");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 tekstiili delta {v1}, hienovarainen havaittava ero");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, selvästi havaittava ero");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 tekstiili delta {v1, number}, selvästi havaittava ero");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, tuskin havaittava");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, ei havaittavissa");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 tekstiili delta {v1}, ei havaittavissa");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, ei havaittavissa");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, ei havaittavissa");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, suuri havaittava ero");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, ei havaittavissa");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, ei havaittavissa");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 tekstiili delta {v1, number}, ei havaittavissa");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, ei havaittavissa");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, ei havaittavissa");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, hienovarainen havaittava ero");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, hienovarainen havaittava ero");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, hienovarainen havaittava ero");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, tuskin havaittava");
   P ("label.metrics.text_summary.n_words", "{v1, plural, one {1 sana} other {{v1, number} sanaa}}");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, plural, one {1 kappale} other {{v1, number} kappaletta}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "{v1, plural, one {puheaika 1 minuutti} other {puheaika {v1, number} "
      & "minuuttia}}");
   P ("label.metrics.text_summary.n_sentences", "{v1, plural, one {1 virke} other {{v1, number} virkettä}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "{v1, plural, one {lukuaika 1 minuutti} other {lukuaika {v1, number} "
      & "minuuttia}}");
   P ("label.metrics.text_summary.n_paragraph", "{v1, plural, one {1 kappale} other {{v1, number} kappaletta}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "{v1, plural, one {puheaika alle 1 minuutin} other {puheaika alle {v1, "
      & "number} minuutin}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "{v1, plural, one {lukuaika alle 1 minuutin} other {lukuaika alle {v1, "
      & "number} minuutin}}");
   P ("label.metrics.text_summary.n_sentence", "{v1, plural, one {1 virke} other {{v1, number} virkettä}}");
   P ("label.metrics.text_summary.no_words", "ei sanoja");
   P ("label.metrics.text_summary.no_paragraphs", "ei kappaleita");
   P ("label.metrics.text_summary.no_sentences", "ei virkkeitä");
   P ("label.metrics.text_summary.n_word", "{v1, plural, one {1 sana} other {{v1, number} sanaa}}");
   P ("label.names.hue_family_label.neutral", "neutraali");
   P ("label.names.saturation_label.neutral", "neutraali");
   P ("label.names.temperature_label.neutral_temperature", "neutraali lämpötila");
   P ("label.names.chroma_label.grayish", "harmahtava");
   P ("label.names.nearest_color_name.black", "musta");
   P ("label.models.brightness_label.very_dark", "hyvin tumma");
   P ("label.names.hue_family_label.blue", "sininen");
   P ("label.names.saturation_label.vivid", "kirkas");
   P ("label.names.temperature_label.cool", "viileä");
   P ("label.names.chroma_label.moderate_chroma", "kohtalainen kroma");
   P ("label.names.nearest_color_name.navy", "laivastonsininen");
   P ("label.names.chroma_label.high_chroma", "korkea kroma");
   P ("label.names.nearest_color_name.blue", "sininen");
   P ("label.names.hue_family_label.green", "vihreä");
   P ("label.names.temperature_label.balanced_temperature", "tasapainoinen lämpötila");
   P ("label.names.hue_family_label.cyan", "syaani");
   P ("label.names.chroma_label.soft", "pehmeä");
   P ("label.models.brightness_label.dark", "tumma");
   P ("label.names.nearest_color_name.green", "vihreä");
   P ("label.names.nearest_color_name.teal", "sinivihreä");
   P ("label.models.brightness_label.medium_brightness", "keskikirkas");
   P ("label.names.nearest_color_name.aqua", "vedensininen");
   P ("label.names.nearest_color_name.lime", "limetinvihreä");
   P ("label.models.brightness_label.light", "vaalea");
   P ("label.names.hue_family_label.red", "punainen");
   P ("label.names.temperature_label.warm", "lämmin");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "violetti");
   P ("label.names.hue_family_label.yellow", "keltainen");
   P ("label.names.saturation_label.muted", "hillitty");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "kylläinen");
   P ("label.names.nearest_color_name.maroon", "viininpunainen");
   P ("label.names.nearest_color_name.purple", "purppura");
   P ("label.names.hue_family_label.orange", "oranssi");
   P ("label.names.nearest_color_name.olive", "oliivinvihreä");
   P ("label.names.nearest_color_name.gray", "harmaa");
   P ("label.names.saturation_label.desaturated", "haalistunut");
   P ("label.names.nearest_color_name.silver", "hopea");
   P ("label.names.chroma_label.pastel", "pastelli");
   P ("label.models.brightness_label.very_light", "hyvin vaalea");
   P ("label.names.nearest_color_name.fuchsia", "fuksia");
   P ("label.names.nearest_color_name.yellow", "keltainen");
   P ("label.names.nearest_color_name.red", "punainen");
   P ("label.names.nearest_color_name.orange", "oranssi");
   P ("label.names.nearest_color_name.white", "valkoinen");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number} matala kontrasti");
   P ("label.contrast.readability_label.low_readability", "heikko luettavuus");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, riittämätön, tumma teksti vaalealla taustalla");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number} matala kontrasti");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, riittämätön, tumma teksti vaalealla taustalla");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "akromatopsia: kohtalainen sekoittumisriski");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number} % voimakas ero");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number} matala kontrasti alfasekoituksen jälkeen");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, riittämätön, vaalea teksti tummalla taustalla");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, riittämätön, vaalea teksti tummalla taustalla");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopia: suuri sekoittumisriski");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number} suuren tekstin kontrasti");
   P ("label.contrast.readability_label.readable_for_large_text_only", "luettava vain suurena tekstinä");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, suuri teksti, vaalea teksti tummalla taustalla");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number} suuren tekstin kontrasti");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, suuri teksti, vaalea teksti tummalla taustalla");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopia: suuri sekoittumisriski");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} suuren tekstin kontrasti alfasekoituksen jälkeen");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, vain muu kuin teksti, vaalea teksti tummalla "
      & "taustalla");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, vain muu kuin teksti, vaalea teksti tummalla "
      & "taustalla");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopia: kohtalainen sekoittumisriski");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number} matala kontrasti");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number} matala kontrasti");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, vain muu kuin teksti, tumma teksti vaalealla "
      & "taustalla");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, vain muu kuin teksti, tumma teksti vaalealla "
      & "taustalla");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopia: kohtalainen sekoittumisriski");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopia: suuri sekoittumisriski");
   P ("label.models.color_difference_label.n_very_different", "{v1, number} % hyvin erilaiset");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "akromatopsia: suuri sekoittumisriski");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "akromatopsia: pieni sekoittumisriski");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} matala kontrasti alfasekoituksen jälkeen");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number} normaalin tekstin kontrasti");
   P ("label.contrast.readability_label.readable_for_normal_text", "luettava normaalina tekstinä");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, leipäteksti, vaalea teksti tummalla taustalla");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number} normaalin tekstin kontrasti");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, leipäteksti, vaalea teksti tummalla taustalla");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, suuri teksti, tumma teksti vaalealla taustalla");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, suuri teksti, tumma teksti vaalealla taustalla");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number} % hienovarainen ero");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, leipäteksti, tumma teksti vaalealla taustalla");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, leipäteksti, tumma teksti vaalealla taustalla");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopia: pieni sekoittumisriski");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number} % selvästi havaittava ero");
   P ("label.contrast.contrast_label.n_n_large_text_contrast", "{v1, number}:{v2, number} suuren tekstin kontrasti");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} suuren tekstin kontrasti");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopia: pieni sekoittumisriski");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number} tehostettu kontrasti");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "luettava tehostetulla kontrastilla");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number} tehostettu kontrasti");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, hienovarainen havaittava ero");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopia: erottuvat");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} normaalin tekstin kontrasti alfasekoituksen "
      & "jälkeen");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopia: kohtalainen sekoittumisriski");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} normaalin tekstin kontrasti alfasekoituksen jälkeen");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} suuren tekstin kontrasti alfasekoituksen "
      & "jälkeen");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, erinomainen, tumma teksti vaalealla taustalla");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, erinomainen, tumma teksti vaalealla taustalla");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} normaalin tekstin kontrasti");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} normaalin tekstin kontrasti");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number} tehostettu kontrasti");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, erinomainen, vaalea teksti tummalla taustalla");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} tehostettu kontrasti");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, erinomainen, vaalea teksti tummalla taustalla");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopia: erottuvat");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number} tehostettu kontrasti alfasekoituksen jälkeen");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, tuskin havaittava");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number} % lähes identtiset");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopia: pieni sekoittumisriski");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "akromatopsia: erottuvat");
   P ("label.palettes.palette_summary.n_colors", "{v1, plural, one {1 väri} other {{v1, number} väriä}}");
   P ("label.palettes.palette_summary.mostly_gray", "enimmäkseen harmaata");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "kohtalainen kontrastihajonta");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "tausta {v1}, teksti {v2}, korostus {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triadinen paletti");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "paras kontrasti: {v1} taustalla {v2}, {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number}/{v2, number} paria täyttää normaalin tekstin "
      & "kontrastivaatimuksen");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v5, plural, one {1 pari} other {{v5, number} paria}}: {v1, number} "
      & "tehostettu, {v2, number} normaali, {v3, number} vain suuri, {v4, "
      & "number} hylätty");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {1 väri} other {{v1, number} väriä}}, {v2, plural, "
      & "one {1 pari} other {{v2, number} paria}}: {v3, number} tehostettu, "
      & "{v4, number} normaali, {v5, number} vain suuri, {v6, number} hylätty");
   P ("label.palettes.palette_mood_label.balanced", "tasapainoinen");
   P ("label.palettes.palette_mood_label.vibrant", "eloisa");
   P ("label.palettes.palette_mood_label.warm_mood", "lämmin tunnelma");
   P ("label.palettes.palette_summary.mostly_blue", "enimmäkseen sinistä");
   P ("label.palettes.palette_summary.low_contrast_spread", "pieni kontrastihajonta");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "yhden korostusvärin paletti");
   P ("label.palettes.palette_mood_label.dark", "tumma");
   P ("label.palettes.palette_mood_label.cool_mood", "viileä tunnelma");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "enimmäkseen rebeccapurple-sävyä");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "ei saavutettavia tekstipareja");
   P ("label.palettes.palette_mood_label.subtle", "hienovarainen");
   P ("label.palettes.palette_summary.high_contrast_spread", "suuri kontrastihajonta");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "paras kontrasti: {v1} taustalla {v2}, {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "neutraali tunnelma");
   P ("label.palettes.palette_summary.mostly_purple", "enimmäkseen purppuraa");
   P ("label.palettes.palette_harmony_label.complementary_palette", "komplementaarinen paletti");
   P ("label.palettes.palette_summary.mostly_green", "enimmäkseen vihreää");
   P ("label.palettes.palette_mood_label.moderate", "maltillinen");
   P ("label.palettes.palette_summary.mostly_silver", "enimmäkseen hopeaa");
   P ("label.palettes.palette_harmony_label.varied_palette", "vaihteleva paletti");
   P ("label.palettes.palette_summary.mostly_olive", "enimmäkseen oliivinvihreää");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analoginen paletti");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number}/{v2, number} paria täyttää vain suuren tekstin "
      & "kontrastivaatimuksen");
   P ("label.palettes.palette_mood_label.light", "vaalea");
   P ("label.palettes.palette_summary.mostly_teal", "enimmäkseen sinivihreää");
   P ("label.palettes.palette_summary.mostly_aqua", "enimmäkseen vedensinistä");
   P ("label.palettes.palette_summary.mostly_lime", "enimmäkseen limetinvihreää");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "yksivärinen paletti");
   P ("label.palettes.palette_summary.mostly_black", "enimmäkseen mustaa");
   P ("label.palettes.palette_summary.mostly_yellow", "enimmäkseen keltaista");
   P ("label.palettes.palette_summary.mostly_maroon", "enimmäkseen viininpunaista");
   P ("label.palettes.palette_summary.mostly_white", "enimmäkseen valkoista");
   P ("label.palettes.palette_summary.mostly_orange", "enimmäkseen oranssia");
   P ("label.palettes.palette_summary.mostly_fuchsia", "enimmäkseen fuksiaa");
   P ("label.palettes.palette_harmony_label.neutral_palette", "neutraali paletti");
   P ("label.palettes.palette_summary.mostly_red", "enimmäkseen punaista");
   P ("label.metrics.word_count_summary.n_words", "{v1, plural, one {1 sana} other {{v1, number} sanaa}}");
end Labels_3;
