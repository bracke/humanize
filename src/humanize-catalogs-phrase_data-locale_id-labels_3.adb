separate (Humanize.Catalogs.Phrase_Data.Locale_Id)
procedure Labels_3 is
begin
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: tidak ada bidang} all {{name}: semua "
      & "bidang lengkap} other {{name}: {completed, number} dari {total, "
      & "number} bidang lengkap}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {tidak ada langkah formulir} other {langkah "
      & "{current, number} dari {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {tidak ada breadcrumb} other {breadcrumb {current, "
      & "number} dari {total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {tidak ada tab} other {tab {current, number} dari "
      & "{total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {kotak masuk kosong} other {{unread, plural, =0 "
      & "{semua notifikasi sudah dibaca} other {{unread, number} belum dibaca "
      & "dari {total, number} notifikasi}}}}");
   P ("label.notifications.delivery_attempt_label",
      "percobaan pengiriman {attempt, number} dari {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {tidak ada item daftar periksa} other {{done, "
      & "number} dari {total, number} item selesai}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {tidak ada unggahan} other {{done, number} dari "
      & "{total, number} unggahan selesai}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {tidak ada kapasitas} other {{reserved, number} "
      & "dari {capacity, number} kursi dipesan}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {posisi daftar tunggu {position, number}} other "
      & "{posisi daftar tunggu {position, number} dari {total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} berubah} other {{name}: {changed, number} berubah, {unchanged, "
      & "number} tidak berubah, {total, number} total}}");
   P ("label.names.color_description", "{hue} {saturation}, {brightness}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{base, select, pink {merah muda} other {{hue}}} {brightness} {chroma} "
      & "{temperature}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {tombol} link_control {tautan} "
      & "tab_control {tab} menu_item_control {item menu} checkbox_control "
      & "{kotak centang} radio_control {tombol radio} text_field_control {kolom "
      & "teks} progress_control {indikator kemajuan} table_cell_control {sel "
      & "tabel} region_control {wilayah} other {kontrol}} {named, select, no "
      & "{tanpa nama} other {{name}}}");
   P ("label.markup.accessible_control_label.selected", "dipilih");
   P ("label.markup.accessible_control_label.expanded", "diperluas");
   P ("label.markup.accessible_control_label.current", "saat ini");
   P ("label.markup.accessible_control_label.disabled", "dinonaktifkan");
   P ("label.markup.accessible_control_label.required", "wajib");
   P ("label.markup.accessible_control_label.invalid", "tidak valid");
   P ("label.markup.accessible_control_label.count", "{count, number} item");
   P ("label.markup.accessible_control_label.position", "item {position} dari {total}");
   P ("label.markup.accessible_control_label.issues", "{count, number} masalah");
   P ("label.markup.accessible_control_label.with_states", "{control} {states}");
   P ("label.endpoints.url_component.scheme", "skema");
   P ("label.endpoints.url_component.host", "host");
   P ("label.endpoints.url_component.path", "jalur");
   P ("label.endpoints.url_component.query", "kueri");
   P ("label.endpoints.url_component.fragment", "fragmen");
   P ("label.names.hue_noun.red", "merah");
   P ("label.names.hue_noun.orange", "oranye");
   P ("label.names.hue_noun.yellow", "kuning");
   P ("label.names.hue_noun.green", "hijau");
   P ("label.names.hue_noun.cyan", "sian");
   P ("label.names.hue_noun.blue", "biru");
   P ("label.names.hue_noun.purple", "ungu");
   P ("label.names.hue_noun.magenta", "magenta");
   P ("label.names.hue_noun.neutral", "netral");
   P ("label.names.hue_noun.pink", "merah muda");
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
   P ("label.names.agree.medium_brightness", "{gender, select, other {kecerahan sedang}}");
   P ("label.names.agree.light", "{gender, select, other {terang}}");
   P ("label.names.agree.very_light", "{gender, select, other {sangat terang}}");
   P ("label.names.agree.desaturated", "{gender, select, other {kurang jenuh}}");
   P ("label.names.agree.muted", "{gender, select, other {redup}}");
   P ("label.names.agree.neutral", "{gender, select, other {netral}}");
   P ("label.names.agree.saturated", "{gender, select, other {jenuh}}");
   P ("label.names.agree.vivid", "{gender, select, other {mencolok}}");
   P ("label.names.agree.grayish", "{gender, select, other {keabu-abuan}}");
   P ("label.names.agree.soft", "{gender, select, other {lembut}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {kroma sedang}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {kroma tinggi}}");
   P ("label.names.agree.pastel", "{gender, select, other {pastel}}");
   P ("label.names.agree.warm", "{gender, select, other {hangat}}");
   P ("label.names.agree.cool", "{gender, select, other {dingin}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {suhu netral}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {suhu seimbang}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "warna latar depan saat ini memenuhi kontras teks besar pada {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "warna latar depan saat ini memenuhi kontras teks normal pada {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "gunakan {v1} untuk kontras teks yang ditingkatkan {v2, number}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "gunakan {v1} untuk kontras teks besar {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "gunakan {v1} untuk kontras teks normal {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "gunakan {v1} untuk kontras teks besar {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "gunakan {v1} untuk kontras teks yang ditingkatkan {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "warna latar depan saat ini memenuhi kontras teks besar pada {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "warna latar depan saat ini memenuhi kontras teks normal pada {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "warna latar depan saat ini memenuhi kontras teks yang ditingkatkan "
      & "pada {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "warna latar depan saat ini memenuhi kontras teks yang ditingkatkan "
      & "pada {v1, number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopia: risiko kerancuan rendah, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopia: risiko kerancuan sedang, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopia: risiko kerancuan sedang, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "akromatopsia: risiko kerancuan tinggi, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, perbedaan perseptual dramatis");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, perbedaan perseptual dramatis");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 tekstil delta {v1}, perbedaan perseptual dramatis");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, perbedaan perseptual dramatis");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, perbedaan perseptual besar");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopia: risiko kerancuan sedang, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, perbedaan perseptual dramatis");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, perbedaan perseptual dramatis");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, perbedaan perseptual dramatis");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "akromatopsia: risiko kerancuan rendah, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopia: dapat dibedakan, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopia: dapat dibedakan, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopia: dapat dibedakan, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "akromatopsia: dapat dibedakan, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "akromatopsia: risiko kerancuan sedang, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, perbedaan perseptual besar");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, perbedaan perseptual besar");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 tekstil delta {v1}, perbedaan perseptual besar");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, perbedaan perseptual besar");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, perbedaan perseptual nyata");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopia: risiko kerancuan tinggi, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopia: risiko kerancuan tinggi, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, perbedaan perseptual nyata");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 tekstil delta {v1}, perbedaan perseptual nyata");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, perbedaan perseptual nyata");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, perbedaan perseptual nyata");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopia: risiko kerancuan rendah, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopia: risiko kerancuan rendah, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, perbedaan perseptual besar");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopia: risiko kerancuan tinggi, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, perbedaan perseptual dramatis");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, perbedaan perseptual dramatis");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, perbedaan perseptual dramatis");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, perbedaan perseptual besar");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, perbedaan perseptual besar");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, perbedaan perseptual besar");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, perbedaan perseptual nyata");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 tekstil delta {v1}, perbedaan perseptual halus");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, perbedaan perseptual nyata");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, perbedaan perseptual nyata");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, hampir tidak terlihat");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, tidak terlihat");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 tekstil delta {v1}, tidak terlihat");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, tidak terlihat");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, tidak terlihat");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, perbedaan perseptual besar");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, tidak terlihat");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, tidak terlihat");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 tekstil delta {v1, number}, tidak terlihat");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, tidak terlihat");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, tidak terlihat");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, perbedaan perseptual halus");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, perbedaan perseptual halus");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, perbedaan perseptual halus");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, hampir tidak terlihat");
   P ("label.metrics.text_summary.n_words", "{v1, number} kata");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, number} paragraf");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} menit bicara");
   P ("label.metrics.text_summary.n_sentences", "{v1, number} kalimat");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} menit baca");
   P ("label.metrics.text_summary.n_paragraph", "{v1, number} paragraf");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "kurang dari {v1, number} menit bicara");
   P ("label.metrics.text_summary.less_than_n_minute_read", "kurang dari {v1, number} menit baca");
   P ("label.metrics.text_summary.n_sentence", "{v1, number} kalimat");
   P ("label.metrics.text_summary.no_words", "tidak ada kata");
   P ("label.metrics.text_summary.no_paragraphs", "tidak ada paragraf");
   P ("label.metrics.text_summary.no_sentences", "tidak ada kalimat");
   P ("label.metrics.text_summary.n_word", "{v1, number} kata");
   P ("label.names.hue_family_label.neutral", "netral");
   P ("label.names.saturation_label.neutral", "netral");
   P ("label.names.temperature_label.neutral_temperature", "suhu netral");
   P ("label.names.chroma_label.grayish", "keabu-abuan");
   P ("label.names.nearest_color_name.black", "hitam");
   P ("label.models.brightness_label.very_dark", "sangat gelap");
   P ("label.names.hue_family_label.blue", "biru");
   P ("label.names.saturation_label.vivid", "mencolok");
   P ("label.names.temperature_label.cool", "dingin");
   P ("label.names.chroma_label.moderate_chroma", "kroma sedang");
   P ("label.names.nearest_color_name.navy", "biru dongker");
   P ("label.names.chroma_label.high_chroma", "kroma tinggi");
   P ("label.names.nearest_color_name.blue", "biru");
   P ("label.names.hue_family_label.green", "hijau");
   P ("label.names.temperature_label.balanced_temperature", "suhu seimbang");
   P ("label.names.hue_family_label.cyan", "sian");
   P ("label.names.chroma_label.soft", "lembut");
   P ("label.models.brightness_label.dark", "gelap");
   P ("label.names.nearest_color_name.green", "hijau");
   P ("label.names.nearest_color_name.teal", "biru kehijauan");
   P ("label.models.brightness_label.medium_brightness", "kecerahan sedang");
   P ("label.names.nearest_color_name.aqua", "akua");
   P ("label.names.nearest_color_name.lime", "hijau limau");
   P ("label.models.brightness_label.light", "terang");
   P ("label.names.hue_family_label.red", "merah");
   P ("label.names.temperature_label.warm", "hangat");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "ungu");
   P ("label.names.hue_family_label.yellow", "kuning");
   P ("label.names.saturation_label.muted", "redup");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "jenuh");
   P ("label.names.nearest_color_name.maroon", "merah marun");
   P ("label.names.nearest_color_name.purple", "ungu");
   P ("label.names.hue_family_label.orange", "oranye");
   P ("label.names.nearest_color_name.olive", "hijau zaitun");
   P ("label.names.nearest_color_name.gray", "abu-abu");
   P ("label.names.saturation_label.desaturated", "kurang jenuh");
   P ("label.names.nearest_color_name.silver", "perak");
   P ("label.names.chroma_label.pastel", "pastel");
   P ("label.models.brightness_label.very_light", "sangat terang");
   P ("label.names.nearest_color_name.fuchsia", "fuksia");
   P ("label.names.nearest_color_name.yellow", "kuning");
   P ("label.names.nearest_color_name.red", "merah");
   P ("label.names.nearest_color_name.orange", "oranye");
   P ("label.names.nearest_color_name.white", "putih");
   P ("label.contrast.contrast_label.d_n_low_contrast", "kontras rendah {v1}:{v2, number}");
   P ("label.contrast.readability_label.low_readability", "keterbacaan rendah");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, tidak memadai, teks gelap pada latar terang");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "kontras rendah {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, tidak memadai, teks gelap pada latar terang");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "akromatopsia: risiko kerancuan sedang");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}% perbedaan kuat");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "kontras rendah {v1}:{v2, number} setelah komposisi alfa");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, tidak memadai, teks terang pada latar gelap");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, tidak memadai, teks terang pada latar gelap");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopia: risiko kerancuan tinggi");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "kontras teks besar {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_large_text_only", "terbaca hanya untuk teks besar");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, teks besar, teks terang pada latar gelap");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast", "kontras teks besar {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, teks besar, teks terang pada latar gelap");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopia: risiko kerancuan tinggi");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "kontras teks besar {v1}:{v2, number} setelah komposisi alfa");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, hanya non-teks, teks terang pada latar gelap");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, hanya non-teks, teks terang pada latar gelap");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopia: risiko kerancuan sedang");
   P ("label.contrast.contrast_label.n_n_low_contrast", "kontras rendah {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "kontras rendah {v1, number}:{v2, number}");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, hanya non-teks, teks gelap pada latar terang");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, hanya non-teks, teks gelap pada latar terang");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopia: risiko kerancuan sedang");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopia: risiko kerancuan tinggi");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}% sangat berbeda");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "akromatopsia: risiko kerancuan tinggi");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "akromatopsia: risiko kerancuan rendah");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "kontras rendah {v1, number}:{v2, number} setelah komposisi alfa");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "kontras teks normal {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_normal_text", "terbaca untuk teks normal");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, teks isi, teks terang pada latar gelap");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast", "kontras teks normal {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, teks isi, teks terang pada latar gelap");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, teks besar, teks gelap pada latar terang");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, teks besar, teks gelap pada latar terang");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}% perbedaan halus");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, teks isi, teks gelap pada latar terang");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, teks isi, teks gelap pada latar terang");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopia: risiko kerancuan rendah");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}% perbedaan nyata");
   P ("label.contrast.contrast_label.n_n_large_text_contrast", "kontras teks besar {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "kontras teks besar {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopia: risiko kerancuan rendah");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "kontras yang ditingkatkan {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "terbaca untuk kontras teks yang ditingkatkan");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast",
      "kontras yang ditingkatkan {v1}:{v2, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, perbedaan perseptual halus");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopia: dapat dibedakan");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "kontras teks normal {v1, number}:{v2, number} setelah komposisi alfa");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopia: risiko kerancuan sedang");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "kontras teks normal {v1}:{v2, number} setelah komposisi alfa");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "kontras teks besar {v1, number}:{v2, number} setelah komposisi alfa");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, sangat baik, teks gelap pada latar terang");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, sangat baik, teks gelap pada latar terang");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast", "kontras teks normal {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "kontras teks normal {v1, number}:{v2, number}");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "kontras yang ditingkatkan {v1, number}:{v2, number}");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, sangat baik, teks terang pada latar gelap");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "kontras yang ditingkatkan {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, sangat baik, teks terang pada latar gelap");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopia: dapat dibedakan");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "kontras yang ditingkatkan {v1}:{v2, number} setelah komposisi alfa");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, hampir tidak terlihat");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}% hampir identik");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopia: risiko kerancuan rendah");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "akromatopsia: dapat dibedakan");
   P ("label.palettes.palette_summary.n_colors", "{v1, number} warna");
   P ("label.palettes.palette_summary.mostly_gray", "dominan abu-abu");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "sebaran kontras sedang");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "latar {v1}, teks {v2}, aksen {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "palet triadik");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "kontras terbaik {v1} pada {v2} sebesar {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} dari {v2, number} pasangan lolos kontras teks normal");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v1, number} ditingkatkan, {v2, number} normal, {v3, number} hanya "
      & "teks besar, {v4, number} gagal dari {v5, number} pasangan");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, number} warna, {v2, number} pasangan: {v3, number} ditingkatkan, "
      & "{v4, number} normal, {v5, number} hanya teks besar, {v6, number} gagal");
   P ("label.palettes.palette_mood_label.balanced", "seimbang");
   P ("label.palettes.palette_mood_label.vibrant", "semarak");
   P ("label.palettes.palette_mood_label.warm_mood", "nuansa hangat");
   P ("label.palettes.palette_summary.mostly_blue", "dominan biru");
   P ("label.palettes.palette_summary.low_contrast_spread", "sebaran kontras rendah");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "palet satu aksen");
   P ("label.palettes.palette_mood_label.dark", "gelap");
   P ("label.palettes.palette_mood_label.cool_mood", "nuansa dingin");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "dominan rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs",
      "tidak ada pasangan teks yang aksesibel");
   P ("label.palettes.palette_mood_label.subtle", "halus");
   P ("label.palettes.palette_summary.high_contrast_spread", "sebaran kontras tinggi");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "kontras terbaik {v1} pada {v2} sebesar {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "nuansa netral");
   P ("label.palettes.palette_summary.mostly_purple", "dominan ungu");
   P ("label.palettes.palette_harmony_label.complementary_palette", "palet komplementer");
   P ("label.palettes.palette_summary.mostly_green", "dominan hijau");
   P ("label.palettes.palette_mood_label.moderate", "sedang");
   P ("label.palettes.palette_summary.mostly_silver", "dominan perak");
   P ("label.palettes.palette_harmony_label.varied_palette", "palet beragam");
   P ("label.palettes.palette_summary.mostly_olive", "dominan hijau zaitun");
   P ("label.palettes.palette_harmony_label.analogous_palette", "palet analog");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} dari {v2, number} pasangan lolos hanya untuk teks besar");
   P ("label.palettes.palette_mood_label.light", "terang");
   P ("label.palettes.palette_summary.mostly_teal", "dominan biru kehijauan");
   P ("label.palettes.palette_summary.mostly_aqua", "dominan akua");
   P ("label.palettes.palette_summary.mostly_lime", "dominan hijau limau");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "palet monokrom");
   P ("label.palettes.palette_summary.mostly_black", "dominan hitam");
   P ("label.palettes.palette_summary.mostly_yellow", "dominan kuning");
   P ("label.palettes.palette_summary.mostly_maroon", "dominan merah marun");
   P ("label.palettes.palette_summary.mostly_white", "dominan putih");
   P ("label.palettes.palette_summary.mostly_orange", "dominan oranye");
   P ("label.palettes.palette_summary.mostly_fuchsia", "dominan fuksia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "palet netral");
   P ("label.palettes.palette_summary.mostly_red", "dominan merah");
   P ("label.metrics.word_count_summary.n_words", "{v1, number} kata");
   P ("label.metrics.sentence_count_summary.n_sentences", "{v1, number} kalimat");
   P ("label.metrics.paragraph_count_summary.n_paragraphs", "{v1, number} paragraf");
   P ("label.metrics.reading_time.n_minutes_read", "{v1, number} menit baca");
   P ("label.metrics.speaking_time.n_minutes_spoken", "{v1, number} menit bicara");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, number} kata");
   P ("label.metrics.text_summary_with_options.n_sentences", "{v1, number} kalimat");
   P ("label.metrics.text_summary_with_options.n_paragraphs", "{v1, number} paragraf");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "{v1, number} menit baca");
   P ("label.metrics.paragraph_count_summary.n_paragraph", "{v1, number} paragraf");
   P ("label.metrics.reading_time.less_than_n_minute_read", "kurang dari {v1, number} menit baca");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "kurang dari {v1, number} menit bicara");
   P ("label.metrics.text_summary_with_options.n_paragraph", "{v1, number} paragraf");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "kurang dari {v1, number} menit baca");
   P ("label.metrics.sentence_count_summary.n_sentence", "{v1, number} kalimat");
   P ("label.metrics.text_summary_with_options.n_sentence", "{v1, number} kalimat");
   P ("label.metrics.word_count_summary.no_words", "tidak ada kata");
   P ("label.metrics.sentence_count_summary.no_sentences", "tidak ada kalimat");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "tidak ada paragraf");
   P ("label.metrics.text_summary_with_options.no_words", "tidak ada kata");
   P ("label.metrics.text_summary_with_options.no_sentences", "tidak ada kalimat");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "tidak ada paragraf");
   P ("label.metrics.word_count_summary.n_word", "{v1, number} kata");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, number} kata");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.endpoints.url_label", "{state, select, empty {URL kosong} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {URL kosong} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[pengguna disamarkan]");
   P ("label.endpoints.url_label.query", "kueri {count, plural, other {{count, number} parameter}}");
end Labels_3;
