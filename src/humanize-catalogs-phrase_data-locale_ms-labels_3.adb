separate (Humanize.Catalogs.Phrase_Data.Locale_Ms)
procedure Labels_3 is
begin
   P ("label.forms.form_step_label",
      "{total, plural, =0 {tiada langkah borang} other {langkah {current, "
      & "number} daripada {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {tiada serbuk roti} other {serbuk roti {current, "
      & "number} daripada {total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {tiada tab} other {tab {current, number} daripada "
      & "{total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {peti masuk kosong} other {{unread, plural, =0 "
      & "{semua pemberitahuan telah dibaca} other {{unread, number} belum "
      & "dibaca daripada {total, number} pemberitahuan}}}}");
   P ("label.notifications.delivery_attempt_label",
      "percubaan penghantaran {attempt, number} daripada {max_attempts, "
      & "number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {tiada item senarai semak} other {{done, number} "
      & "daripada {total, number} item selesai}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {tiada muat naik} other {{done, number} daripada "
      & "{total, number} muat naik selesai}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {tiada kapasiti} other {{reserved, number} "
      & "daripada {capacity, number} tempat duduk ditempah}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {kedudukan senarai menunggu {position, number}} "
      & "other {kedudukan senarai menunggu {position, number} daripada {total, "
      & "number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} berubah} other {{name}: {changed, number} berubah, {unchanged, "
      & "number} tidak berubah, jumlah {total, number}}}");
   P ("label.names.color_description", "{hue} {saturation}, {brightness}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{base, select, pink {merah jambu} other {{hue}}} {brightness} {chroma} "
      & "{temperature}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {butang} link_control {pautan} "
      & "tab_control {tab} menu_item_control {item menu} checkbox_control "
      & "{kotak semak} radio_control {butang radio} text_field_control {medan "
      & "teks} progress_control {penunjuk kemajuan} table_cell_control {sel "
      & "jadual} region_control {kawasan} other {kawalan}} {named, select, no "
      & "{tanpa nama} other {{name}}}");
   P ("label.markup.accessible_control_label.selected", "dipilih");
   P ("label.markup.accessible_control_label.expanded", "dikembangkan");
   P ("label.markup.accessible_control_label.current", "semasa");
   P ("label.markup.accessible_control_label.disabled", "dinyahdayakan");
   P ("label.markup.accessible_control_label.required", "wajib");
   P ("label.markup.accessible_control_label.invalid", "tidak sah");
   P ("label.markup.accessible_control_label.count", "{count, number} item");
   P ("label.markup.accessible_control_label.position", "item {position} daripada {total}");
   P ("label.markup.accessible_control_label.issues", "{count, number} isu");
   P ("label.markup.accessible_control_label.with_states", "{control} {states}");
   P ("label.endpoints.url_component.scheme", "skema");
   P ("label.endpoints.url_component.host", "hos");
   P ("label.endpoints.url_component.path", "laluan");
   P ("label.endpoints.url_component.query", "pertanyaan");
   P ("label.endpoints.url_component.fragment", "serpihan");
   P ("label.names.hue_noun.red", "merah");
   P ("label.names.hue_noun.orange", "jingga");
   P ("label.names.hue_noun.yellow", "kuning");
   P ("label.names.hue_noun.green", "hijau");
   P ("label.names.hue_noun.cyan", "sian");
   P ("label.names.hue_noun.blue", "biru");
   P ("label.names.hue_noun.purple", "ungu");
   P ("label.names.hue_noun.magenta", "magenta");
   P ("label.names.hue_noun.neutral", "neutral");
   P ("label.names.hue_noun.pink", "merah jambu");
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
   P ("label.names.agree.very_dark", "{gender, select, other {sangat gelap}}");
   P ("label.names.agree.dark", "{gender, select, other {gelap}}");
   P ("label.names.agree.medium_brightness", "{gender, select, other {kecerahan sederhana}}");
   P ("label.names.agree.light", "{gender, select, other {cerah}}");
   P ("label.names.agree.very_light", "{gender, select, other {sangat cerah}}");
   P ("label.names.agree.desaturated", "{gender, select, other {kurang tepu}}");
   P ("label.names.agree.muted", "{gender, select, other {pudar}}");
   P ("label.names.agree.neutral", "{gender, select, other {neutral}}");
   P ("label.names.agree.saturated", "{gender, select, other {tepu}}");
   P ("label.names.agree.vivid", "{gender, select, other {menyerlah}}");
   P ("label.names.agree.grayish", "{gender, select, other {kekelabuan}}");
   P ("label.names.agree.soft", "{gender, select, other {lembut}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {kroma sederhana}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {kroma tinggi}}");
   P ("label.names.agree.pastel", "{gender, select, other {pastel}}");
   P ("label.names.agree.warm", "{gender, select, other {hangat}}");
   P ("label.names.agree.cool", "{gender, select, other {sejuk}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {suhu neutral}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {suhu seimbang}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "warna latar depan semasa memenuhi kontras teks besar pada {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "warna latar depan semasa memenuhi kontras teks biasa pada {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "gunakan {v1} untuk kontras teks dipertingkat {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "gunakan {v1} untuk kontras teks besar {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "gunakan {v1} untuk kontras teks biasa {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "gunakan {v1} untuk kontras teks besar {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "gunakan {v1} untuk kontras teks dipertingkat {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "warna latar depan semasa memenuhi kontras teks besar pada {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "warna latar depan semasa memenuhi kontras teks biasa pada {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "warna latar depan semasa memenuhi kontras teks dipertingkat pada "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "warna latar depan semasa memenuhi kontras teks dipertingkat pada {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopia: risiko kekeliruan rendah, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopia: risiko kekeliruan sederhana, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopia: risiko kekeliruan sederhana, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "akromatopsia: risiko kekeliruan tinggi, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 tekstil delta {v1}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, perbezaan persepsi besar");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopia: risiko kekeliruan sederhana, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, perbezaan persepsi dramatik");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "akromatopsia: risiko kekeliruan rendah, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopia: boleh dibezakan, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopia: boleh dibezakan, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopia: boleh dibezakan, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "akromatopsia: boleh dibezakan, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "akromatopsia: risiko kekeliruan sederhana, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, perbezaan persepsi besar");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, perbezaan persepsi besar");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 tekstil delta {v1}, perbezaan persepsi besar");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, perbezaan persepsi besar");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, perbezaan persepsi ketara");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopia: risiko kekeliruan tinggi, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopia: risiko kekeliruan tinggi, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, perbezaan persepsi ketara");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 tekstil delta {v1}, perbezaan persepsi ketara");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, perbezaan persepsi ketara");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, perbezaan persepsi ketara");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopia: risiko kekeliruan rendah, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopia: risiko kekeliruan rendah, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, perbezaan persepsi besar");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopia: risiko kekeliruan tinggi, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, perbezaan persepsi dramatik");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, perbezaan persepsi besar");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, perbezaan persepsi besar");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, perbezaan persepsi besar");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, perbezaan persepsi ketara");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 tekstil delta {v1}, perbezaan persepsi halus");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, perbezaan persepsi ketara");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, perbezaan persepsi ketara");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, hampir tidak ketara");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, tidak ketara");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 tekstil delta {v1}, tidak ketara");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, tidak ketara");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, tidak ketara");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, perbezaan persepsi besar");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, tidak ketara");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, tidak ketara");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 tekstil delta {v1, number}, tidak ketara");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, tidak ketara");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, tidak ketara");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, perbezaan persepsi halus");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, perbezaan persepsi halus");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, perbezaan persepsi halus");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, hampir tidak ketara");
   P ("label.metrics.text_summary.n_words", "{v1, number} perkataan");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, number} perenggan");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} minit pertuturan");
   P ("label.metrics.text_summary.n_sentences", "{v1, number} ayat");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} minit bacaan");
   P ("label.metrics.text_summary.n_paragraph", "{v1, number} perenggan");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "kurang daripada {v1, number} minit pertuturan");
   P ("label.metrics.text_summary.less_than_n_minute_read", "kurang daripada {v1, number} minit bacaan");
   P ("label.metrics.text_summary.n_sentence", "{v1, number} ayat");
   P ("label.metrics.text_summary.no_words", "tiada perkataan");
   P ("label.metrics.text_summary.no_paragraphs", "tiada perenggan");
   P ("label.metrics.text_summary.no_sentences", "tiada ayat");
   P ("label.metrics.text_summary.n_word", "{v1, number} perkataan");
   P ("label.names.hue_family_label.neutral", "neutral");
   P ("label.names.saturation_label.neutral", "neutral");
   P ("label.names.temperature_label.neutral_temperature", "suhu neutral");
   P ("label.names.chroma_label.grayish", "kekelabuan");
   P ("label.names.nearest_color_name.black", "hitam");
   P ("label.models.brightness_label.very_dark", "sangat gelap");
   P ("label.names.hue_family_label.blue", "biru");
   P ("label.names.saturation_label.vivid", "menyerlah");
   P ("label.names.temperature_label.cool", "sejuk");
   P ("label.names.chroma_label.moderate_chroma", "kroma sederhana");
   P ("label.names.nearest_color_name.navy", "biru laut");
   P ("label.names.chroma_label.high_chroma", "kroma tinggi");
   P ("label.names.nearest_color_name.blue", "biru");
   P ("label.names.hue_family_label.green", "hijau");
   P ("label.names.temperature_label.balanced_temperature", "suhu seimbang");
   P ("label.names.hue_family_label.cyan", "sian");
   P ("label.names.chroma_label.soft", "lembut");
   P ("label.models.brightness_label.dark", "gelap");
   P ("label.names.nearest_color_name.green", "hijau");
   P ("label.names.nearest_color_name.teal", "biru kehijauan");
   P ("label.models.brightness_label.medium_brightness", "kecerahan sederhana");
   P ("label.names.nearest_color_name.aqua", "akua");
   P ("label.names.nearest_color_name.lime", "hijau limau");
   P ("label.models.brightness_label.light", "cerah");
   P ("label.names.hue_family_label.red", "merah");
   P ("label.names.temperature_label.warm", "hangat");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "ungu");
   P ("label.names.hue_family_label.yellow", "kuning");
   P ("label.names.saturation_label.muted", "pudar");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "tepu");
   P ("label.names.nearest_color_name.maroon", "merah marun");
   P ("label.names.nearest_color_name.purple", "ungu");
   P ("label.names.hue_family_label.orange", "jingga");
   P ("label.names.nearest_color_name.olive", "hijau zaitun");
   P ("label.names.nearest_color_name.gray", "kelabu");
   P ("label.names.saturation_label.desaturated", "kurang tepu");
   P ("label.names.nearest_color_name.silver", "perak");
   P ("label.names.chroma_label.pastel", "pastel");
   P ("label.models.brightness_label.very_light", "sangat cerah");
   P ("label.names.nearest_color_name.fuchsia", "fusia");
   P ("label.names.nearest_color_name.yellow", "kuning");
   P ("label.names.nearest_color_name.red", "merah");
   P ("label.names.nearest_color_name.orange", "jingga");
   P ("label.names.nearest_color_name.white", "putih");
   P ("label.contrast.contrast_label.d_n_low_contrast", "kontras rendah {v1}:{v2, number}");
   P ("label.contrast.readability_label.low_readability", "kebolehbacaan rendah");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, tidak mencukupi, teks gelap pada latar cerah");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "kontras rendah {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, tidak mencukupi, teks gelap pada latar cerah");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "akromatopsia: risiko kekeliruan sederhana");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}% perbezaan kuat");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "kontras rendah {v1}:{v2, number} selepas pengkomposan alfa");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, tidak mencukupi, teks cerah pada latar gelap");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, tidak mencukupi, teks cerah pada latar gelap");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopia: risiko kekeliruan tinggi");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "kontras teks besar {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_large_text_only", "boleh dibaca untuk teks besar sahaja");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, teks besar, teks cerah pada latar gelap");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast", "kontras teks besar {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, teks besar, teks cerah pada latar gelap");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopia: risiko kekeliruan tinggi");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "kontras teks besar {v1}:{v2, number} selepas pengkomposan alfa");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, bukan teks sahaja, teks cerah pada latar gelap");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, bukan teks sahaja, teks cerah pada latar gelap");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopia: risiko kekeliruan sederhana");
   P ("label.contrast.contrast_label.n_n_low_contrast", "kontras rendah {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "kontras rendah {v1, number}:{v2, number}");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, bukan teks sahaja, teks gelap pada latar cerah");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, bukan teks sahaja, teks gelap pada latar cerah");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopia: risiko kekeliruan sederhana");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopia: risiko kekeliruan tinggi");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}% sangat berbeza");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "akromatopsia: risiko kekeliruan tinggi");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "akromatopsia: risiko kekeliruan rendah");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "kontras rendah {v1, number}:{v2, number} selepas pengkomposan alfa");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "kontras teks biasa {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_normal_text", "boleh dibaca untuk teks biasa");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, teks badan, teks cerah pada latar gelap");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast", "kontras teks biasa {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, teks badan, teks cerah pada latar gelap");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, teks besar, teks gelap pada latar cerah");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, teks besar, teks gelap pada latar cerah");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}% perbezaan halus");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, teks badan, teks gelap pada latar cerah");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, teks badan, teks gelap pada latar cerah");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopia: risiko kekeliruan rendah");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}% perbezaan ketara");
   P ("label.contrast.contrast_label.n_n_large_text_contrast", "kontras teks besar {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "kontras teks besar {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopia: risiko kekeliruan rendah");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "kontras dipertingkat {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "boleh dibaca untuk kontras teks dipertingkat");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "kontras dipertingkat {v1}:{v2, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, perbezaan persepsi halus");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopia: boleh dibezakan");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "kontras teks biasa {v1, number}:{v2, number} selepas pengkomposan alfa");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopia: risiko kekeliruan sederhana");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "kontras teks biasa {v1}:{v2, number} selepas pengkomposan alfa");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "kontras teks besar {v1, number}:{v2, number} selepas pengkomposan alfa");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, cemerlang, teks gelap pada latar cerah");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, cemerlang, teks gelap pada latar cerah");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast", "kontras teks biasa {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "kontras teks biasa {v1, number}:{v2, number}");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "kontras dipertingkat {v1, number}:{v2, number}");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, cemerlang, teks cerah pada latar gelap");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "kontras dipertingkat {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, cemerlang, teks cerah pada latar gelap");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopia: boleh dibezakan");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "kontras dipertingkat {v1}:{v2, number} selepas pengkomposan alfa");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, hampir tidak ketara");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}% hampir serupa");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopia: risiko kekeliruan rendah");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "akromatopsia: boleh dibezakan");
   P ("label.palettes.palette_summary.n_colors", "{v1, number} warna");
   P ("label.palettes.palette_summary.mostly_gray", "kebanyakannya kelabu");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "sebaran kontras sederhana");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "latar {v1}, teks {v2}, aksen {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "palet triadik");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "kontras terbaik {v1} pada {v2} sebanyak {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} daripada {v2, number} pasangan lulus kontras teks biasa");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v1, number} dipertingkat, {v2, number} biasa, {v3, number} teks besar "
      & "sahaja, {v4, number} gagal daripada {v5, number} pasangan");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, number} warna, {v2, number} pasangan: {v3, number} dipertingkat, "
      & "{v4, number} biasa, {v5, number} teks besar sahaja, {v6, number} gagal");
   P ("label.palettes.palette_mood_label.balanced", "seimbang");
   P ("label.palettes.palette_mood_label.vibrant", "meriah");
   P ("label.palettes.palette_mood_label.warm_mood", "suasana hangat");
   P ("label.palettes.palette_summary.mostly_blue", "kebanyakannya biru");
   P ("label.palettes.palette_summary.low_contrast_spread", "sebaran kontras rendah");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "palet aksen tunggal");
   P ("label.palettes.palette_mood_label.dark", "gelap");
   P ("label.palettes.palette_mood_label.cool_mood", "suasana sejuk");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "kebanyakannya rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "tiada pasangan teks boleh capai");
   P ("label.palettes.palette_mood_label.subtle", "halus");
   P ("label.palettes.palette_summary.high_contrast_spread", "sebaran kontras tinggi");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "kontras terbaik {v1} pada {v2} sebanyak {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "suasana neutral");
   P ("label.palettes.palette_summary.mostly_purple", "kebanyakannya ungu");
   P ("label.palettes.palette_harmony_label.complementary_palette", "palet pelengkap");
   P ("label.palettes.palette_summary.mostly_green", "kebanyakannya hijau");
   P ("label.palettes.palette_mood_label.moderate", "sederhana");
   P ("label.palettes.palette_summary.mostly_silver", "kebanyakannya perak");
   P ("label.palettes.palette_harmony_label.varied_palette", "palet pelbagai");
   P ("label.palettes.palette_summary.mostly_olive", "kebanyakannya hijau zaitun");
   P ("label.palettes.palette_harmony_label.analogous_palette", "palet analog");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} daripada {v2, number} pasangan lulus untuk teks besar "
      & "sahaja");
   P ("label.palettes.palette_mood_label.light", "cerah");
   P ("label.palettes.palette_summary.mostly_teal", "kebanyakannya biru kehijauan");
   P ("label.palettes.palette_summary.mostly_aqua", "kebanyakannya akua");
   P ("label.palettes.palette_summary.mostly_lime", "kebanyakannya hijau limau");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "palet monokrom");
   P ("label.palettes.palette_summary.mostly_black", "kebanyakannya hitam");
   P ("label.palettes.palette_summary.mostly_yellow", "kebanyakannya kuning");
   P ("label.palettes.palette_summary.mostly_maroon", "kebanyakannya merah marun");
   P ("label.palettes.palette_summary.mostly_white", "kebanyakannya putih");
   P ("label.palettes.palette_summary.mostly_orange", "kebanyakannya jingga");
   P ("label.palettes.palette_summary.mostly_fuchsia", "kebanyakannya fusia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "palet neutral");
   P ("label.palettes.palette_summary.mostly_red", "kebanyakannya merah");
   P ("label.metrics.word_count_summary.n_words", "{v1, number} perkataan");
   P ("label.metrics.sentence_count_summary.n_sentences", "{v1, number} ayat");
   P ("label.metrics.paragraph_count_summary.n_paragraphs", "{v1, number} perenggan");
   P ("label.metrics.reading_time.n_minutes_read", "{v1, number} minit bacaan");
   P ("label.metrics.speaking_time.n_minutes_spoken", "{v1, number} minit pertuturan");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, number} perkataan");
   P ("label.metrics.text_summary_with_options.n_sentences", "{v1, number} ayat");
   P ("label.metrics.text_summary_with_options.n_paragraphs", "{v1, number} perenggan");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "{v1, number} minit bacaan");
   P ("label.metrics.paragraph_count_summary.n_paragraph", "{v1, number} perenggan");
   P ("label.metrics.reading_time.less_than_n_minute_read", "kurang daripada {v1, number} minit bacaan");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "kurang daripada {v1, number} minit pertuturan");
   P ("label.metrics.text_summary_with_options.n_paragraph", "{v1, number} perenggan");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "kurang daripada {v1, number} minit bacaan");
   P ("label.metrics.sentence_count_summary.n_sentence", "{v1, number} ayat");
   P ("label.metrics.text_summary_with_options.n_sentence", "{v1, number} ayat");
   P ("label.metrics.word_count_summary.no_words", "tiada perkataan");
   P ("label.metrics.sentence_count_summary.no_sentences", "tiada ayat");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "tiada perenggan");
   P ("label.metrics.text_summary_with_options.no_words", "tiada perkataan");
   P ("label.metrics.text_summary_with_options.no_sentences", "tiada ayat");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "tiada perenggan");
   P ("label.metrics.word_count_summary.n_word", "{v1, number} perkataan");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, number} perkataan");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.endpoints.url_label", "{state, select, empty {URL kosong} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {URL kosong} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[pengguna disembunyikan]");
   P ("label.endpoints.url_label.query", "pertanyaan {count, plural, other {{count, number} parameter}}");
end Labels_3;
