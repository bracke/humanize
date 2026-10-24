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
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink "
      & "{vaaleanpunainen} other {{hue}}}");
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
end Labels_3;
