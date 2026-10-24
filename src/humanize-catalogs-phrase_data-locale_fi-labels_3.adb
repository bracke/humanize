separate (Humanize.Catalogs.Phrase_Data.Locale_Fi)
procedure Labels_3 is
begin
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
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
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
      "OKLab delta {v1}, huomattava ero");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopia: suuri sekoittumisriski, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopia: suuri sekoittumisriski, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, huomattava ero");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 tekstiili delta {v1}, huomattava ero");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, huomattava ero");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, huomattava ero");
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
      "CIE76 delta {v1}, huomattava ero");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 tekstiili delta {v1}, hienovarainen havaittava ero");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, huomattava ero");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 tekstiili delta {v1, number}, huomattava ero");
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
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number} % huomattava ero");
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
      "{v1, number}/{v2, number} parista täyttää normaalin tekstin "
      & "kontrastin");
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
      "{v1, number}/{v2, number} parista täyttää vain suuren tekstin "
      & "kontrastin");
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
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {1 virke} other {{v1, number} virkettä}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {1 kappale} other {{v1, number} kappaletta}}");
   P ("label.metrics.reading_time.n_minutes_read",
      "{v1, plural, one {lukuaika 1 minuutti} other {lukuaika {v1, number} "
      & "minuuttia}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "{v1, plural, one {puheaika 1 minuutti} other {puheaika {v1, number} "
      & "minuuttia}}");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, plural, one {1 sana} other {{v1, number} sanaa}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {1 virke} other {{v1, number} virkettä}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {1 kappale} other {{v1, number} kappaletta}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "{v1, plural, one {lukuaika 1 minuutti} other {lukuaika {v1, number} "
      & "minuuttia}}");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {1 kappale} other {{v1, number} kappaletta}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "{v1, plural, one {lukuaika alle 1 minuutin} other {lukuaika alle {v1, "
      & "number} minuutin}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "{v1, plural, one {puheaika alle 1 minuutin} other {puheaika alle {v1, "
      & "number} minuutin}}");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {1 kappale} other {{v1, number} kappaletta}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "{v1, plural, one {lukuaika alle 1 minuutin} other {lukuaika alle {v1, "
      & "number} minuutin}}");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {1 virke} other {{v1, number} virkettä}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {1 virke} other {{v1, number} virkettä}}");
   P ("label.metrics.word_count_summary.no_words", "ei sanoja");
   P ("label.metrics.sentence_count_summary.no_sentences", "ei virkkeitä");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "ei kappaleita");
   P ("label.metrics.text_summary_with_options.no_words", "ei sanoja");
   P ("label.metrics.text_summary_with_options.no_sentences", "ei virkkeitä");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "ei kappaleita");
   P ("label.metrics.word_count_summary.n_word", "{v1, plural, one {1 sana} other {{v1, number} sanaa}}");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, plural, one {1 sana} other {{v1, number} sanaa}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {ei havaintoja} "
      & "sample_too_small_shape {otos liian pieni muodon kuvaamiseen, {count, "
      & "plural, one {1 havainto} other {{count, number} havaintoa}}} "
      & "flat_shape {tasainen jakauma, arvo {median}} outlier_heavy_shape "
      & "{jakauma, jossa paljon poikkeavia arvoja, mediaani {median}} "
      & "volatile_shape {vaihteleva jakauma, mediaani {median}} clustered_shape "
      & "{ryhmittynyt jakauma, mediaani {median}} wide_spread_shape {laajalle "
      & "hajautunut jakauma} wide_spread_range {laajalle hajautunut jakauma, "
      & "{minimum}–{maximum}} right_skewed_shape {oikealle vino jakauma, "
      & "mediaani {median}} left_skewed_shape {vasemmalle vino jakauma, "
      & "mediaani {median}} other {enimmäkseen tasapainoinen jakauma, mediaani "
      & "{median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {tyhjä sähköpostiosoite} address "
      & "{sähköpostiosoite} other {sähköposti, verkkotunnus {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {puhelinnumero} redacted {puhelinnumero "
      & "piilotettu} other {puhelinnumero, loppuosa {digits}}}");
   P ("label.privacy.safe_handle_label",
      "{state, select, none {käyttäjätunnus} other {käyttäjätunnus "
      & "{shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {koodisymboli} other {koodisymboli {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "osoitteen metatiedot: {present, plural, one {1 kenttä annettu} other "
      & "{{present, number} kenttää annettu}}, {missing, plural, one {1 "
      & "kenttä puuttuu} other {{missing, number} kenttää puuttuu}}");
   P ("label.endpoints.host_label", "{state, select, none {tuntematon isäntä} other {{host} ({kind})}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {tuntematon päätepiste} other {päätepiste "
      & "{scheme}{host}{port} ({kind})}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {tyhjä URL} none {URL ilman tunnistettuja osia} "
      & "other {URL, {count, plural, one {1 osa} other {{count, number} osaa}}: "
      & "{components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {ei kyselyparametreja} one {1 kyselyparametri} "
      & "other {{count, number} kyselyparametria}}");
   P ("label.endpoints.ip_address_label",
      "{address} ({kind, select, ipv4_host {julkinen IPv4-osoite} ipv6_host "
      & "{julkinen IPv6-osoite} private_network_host {yksityisverkon osoite} "
      & "localhost_host {paikallinen isäntä} other {ei IP-osoite}})");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr}: virheellinen CIDR} other {{cidr}: "
      & "{kind}, verkkoetuliite {prefix}}}");
   P ("label.resources.utilization_label", "käytössä {used, number}/{total, number} {unit} ({percent}, {band})");
   P ("label.resources.saturation_label", "{named, select, no {resurssi} other {{name}}} {percent} {band}");
   P ("label.versions.version_label",
      "{state, select, both {versio {version}, esijulkaisu {prerelease}, "
      & "koontiversio {build}} prerelease {versio {version}, esijulkaisu "
      & "{prerelease}} build {versio {version}, koontiversio {build}} other "
      & "{versio {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {sama versio} major_upgrade {pääversion "
      & "päivitys} minor_upgrade {aliversion päivitys} patch_upgrade "
      & "{korjausversion päivitys} prerelease_change {esijulkaisun muutos} "
      & "build_metadata_change {koontimetatietojen muutos} downgrade "
      & "{siirtyminen vanhempaan versioon} other {tuntematon versiomuutos}}: "
      & "{from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {täsmälleen versio {version}} "
      & "minimum_range {versio {version} tai uudempi} maximum_range {versio "
      & "{version} tai vanhempi} major_compatible_range {yhteensopiva "
      & "pääversion {version} kanssa} minor_compatible_range {yhteensopiva "
      & "aliversion {version} kanssa} other {versioalue {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {ensimmäinen kehitysjulkaisu {version}} "
      & "prerelease {esijulkaisu {version}} major {pääjulkaisu {version}} "
      & "minor {alijulkaisu {version}} other {korjausjulkaisu {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {linkkitagi} image {kuvatagi} paragraph "
      & "{kappaletagi} ordered_list {numeroidun luettelon tagi} unordered_list "
      & "{numeroimattoman luettelon tagi} list_item {luettelokohteen tagi} "
      & "table_header_cell {taulukon otsikkosolun tagi} table_cell {taulukon "
      & "solun tagi} table_row {taulukon rivin tagi} line_break "
      & "{rivinvaihtotagi} thematic_break {teemanvaihdon tagi} heading_level_n "
      & "{otsikkotason {level, number} tagi} other {tagi {name}}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {attribuutti {name}} event "
      & "{tapahtumankäsittelijäattribuutti {name}} other {attribuutti {name}, "
      & "arvo ”{value}”}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {tekstisisältö} html_content "
      & "{HTML-dokumentti} json_content {JSON-dokumentti} xml_content "
      & "{XML-dokumentti} image_content {kuvasisältö} audio_content "
      & "{äänisisältö} video_content {videosisältö} font_content "
      & "{fonttisisältö} archive_content {arkistosisältö} binary_content "
      & "{binäärisisältö} form_content {lomakkeen lähetys} other "
      & "{tuntematon sisältö}} ({base})");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind} ei asetettu} hidden_value {{kind} "
      & "piilotettu} masked_value {{kind} {shown}} fingerprint_only {{kind}, "
      & "sormenjäljen loppuosa {shown}} other {{kind}, loppuosa {shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} {kind} ei asetettu} other {{name} "
      & "{kind}, loppuosa {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {tunnistusotsake {name} ei asetettu} other "
      & "{{name} {kind}, loppuosa {shown}}}");
   P ("label.secrets.fingerprint_label", "{algorithm}-sormenjälki, loppuosa {shown}");
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
   P ("label.diagnostics.check_run_summary_label.none", "ei suoritettuja tarkistuksia");
   P ("label.diagnostics.check_run_summary_label.passed", "{count, number} hyväksytty");
   P ("label.diagnostics.check_run_summary_label.failed", "{count, number} epäonnistui");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 varoitus} other {{count, number} varoitusta}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "{count, number} ohitettu");
   P ("label.diagnostics.check_run_summary_label.pending", "{count, number} odottaa");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {1 kohde} other {{count, number} kohdetta}}");
   P ("label.workflows.workflow_summary_label.completed",
      "{count, plural, one {1 valmis} other {{count, number} valmista}}");
   P ("label.workflows.workflow_summary_label.active",
      "{count, plural, one {1 aktiivinen} other {{count, number} aktiivista}}");
   P ("label.workflows.workflow_summary_label.blocked", "{count, number} estetty");
   P ("label.workflows.workflow_summary_label.failed", "{count, number} epäonnistui");
   P ("label.workflows.workflow_summary_label.skipped", "{count, number} ohitettu");
   P ("label.changes.change_summary_label.total", "{count, plural, one {1 kohde} other {{count, number} kohdetta}}");
   P ("label.changes.change_summary_label.added", "{count, number} lisätty");
   P ("label.changes.change_summary_label.removed", "{count, number} poistettu");
   P ("label.changes.change_summary_label.modified", "{count, number} muutettu");
   P ("label.changes.change_summary_label.renamed", "{count, number} nimetty uudelleen");
   P ("label.changes.change_summary_label.unchanged", "{count, number} ennallaan");
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
   P ("label.markup.accessible_control_label.disabled", "poissa käytöstä");
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
end Labels_3;
