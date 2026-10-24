separate (Humanize.Catalogs.Phrase_Data.Locale_Tr)
procedure Labels_3 is
begin
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {sınır {amount} aşıldı} other {{amount} "
      & "kaldı}}");
   P ("label.thresholds.budget_used_label", "{budget} bütçeden {used} kullanıldı");
   P ("label.workflows.step_label", "adım {current, number}/{total, number}: {name}");
   P ("label.workflows.milestone_label", "{current, number}/{total, number} kilometre taşı tamamlandı: {name}");
   P ("label.workflows.workflow_summary_label.total", "{count, plural, one {1 öğe} other {{count, number} öğe}}");
   P ("label.workflows.workflow_summary_label.completed", "{count, number} tamamlandı");
   P ("label.workflows.workflow_summary_label.active", "{count, number} etkin");
   P ("label.workflows.workflow_summary_label.blocked", "{count, number} engellendi");
   P ("label.workflows.workflow_summary_label.failed", "{count, number} başarısız");
   P ("label.workflows.workflow_summary_label.skipped", "{count, number} atlandı");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {iş akışı öğesi yok} half {iş akışının "
      & "yarısı tamamlandı} other {{completed, number}/{total, number} "
      & "tamamlandı}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {kuyruk sırası {position, number}} other {kuyruk "
      & "sırası {position, number}/{total, number}}}");
   P ("label.changes.change_set_label.none", "değişiklik yok");
   P ("label.changes.change_set_label.added", "{count, number} eklendi");
   P ("label.changes.change_set_label.removed", "{count, number} kaldırıldı");
   P ("label.changes.change_set_label.modified", "{count, number} değişti");
   P ("label.changes.change_set_label.unchanged", "{count, number} değişmedi");
   P ("label.changes.change_summary_label.total", "{count, plural, one {1 öğe} other {{count, number} öğe}}");
   P ("label.changes.change_summary_label.added", "{count, number} eklendi");
   P ("label.changes.change_summary_label.removed", "{count, number} kaldırıldı");
   P ("label.changes.change_summary_label.modified", "{count, number} değişti");
   P ("label.changes.change_summary_label.renamed", "{count, number} yeniden adlandırıldı");
   P ("label.changes.change_summary_label.unchanged", "{count, number} değişmedi");
   P ("label.changes.sync_change_label.none", "eşitleme değişikliği yok");
   P ("label.changes.sync_change_label.uploaded", "{count, number} yüklendi");
   P ("label.changes.sync_change_label.downloaded", "{count, number} indirildi");
   P ("label.changes.sync_change_label.deleted", "{count, number} silindi");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {1 çakışma} other {{count, number} çakışma}}");
   P ("label.changes.net_change_label",
      "{state, select, none {net değişiklik yok} up {net +{count, plural, "
      & "one {1 öğe} other {{count, number} öğe}}} other {net -{count, "
      & "plural, one {1 öğe} other {{count, number} öğe}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {incelenecek değişiklik yok} all {tüm "
      & "değişiklikler incelendi} other {{reviewed, number}/{total, number} "
      & "değişiklik incelendi}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} değişmedi: {new_value}} up "
      & "{{field_name} {old_value} değerinden {new_value} değerine yükseldi} "
      & "other {{field_name} {old_value} değerinden {new_value} değerine "
      & "düştü}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {seçilebilir satır yok} none {satır "
      & "seçilmedi} all {{total, plural, one {1 satır} other {{total, number} "
      & "satırın tümü}} seçildi} other {{selected, number}/{total, number} "
      & "satır seçildi}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {sayfa yok} other {{pages, plural, =0 {sayfa yok} "
      & "other {{rows, plural, =0 {sayfa {page, number}/{pages, number}} one "
      & "{sayfa {page, number}/{pages, number}, 1 satır} other {sayfa {page, "
      & "number}/{pages, number}, {rows, number} satır}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {satır yok} none {eşleşen satır yok} all "
      & "{{total, plural, one {1 satır} other {{total, number} satırın "
      & "tümü}} görünür} other {{visible, number}/{total, number} satır "
      & "görünür}}");
   P ("label.tables.row_range_label",
      "{state, select, none {satır yok} single {satır {first_row, "
      & "number}/{total, number}} other {satır {first_row, number}-{last_row, "
      & "number}/{total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {karakter sınırı yok} none_left {karakter "
      & "kalmadı} left {{count, plural, one {1 karakter} other {{count, "
      & "number} karakter}} kaldı} other {sınır {count, plural, one {1 "
      & "karakter} other {{count, number} karakter}} aşıldı}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {zorunlu alan yok} one {{missing, plural, =0 {tüm "
      & "zorunlu alanlar dolu} other {1/1 zorunlu alan eksik}}} other "
      & "{{missing, plural, =0 {tüm zorunlu alanlar dolu} other {{missing, "
      & "number}/{total, number} zorunlu alan eksik}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {alan yok} all {tüm alanlar tamamlandı} other "
      & "{{completed, number}/{total, number} alan tamamlandı}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: alan yok} all {{name}: tüm alanlar "
      & "tamamlandı} other {{name}: {completed, number}/{total, number} alan "
      & "tamamlandı}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {form adımı yok} one {adım 1/1: {name}} other "
      & "{adım {current, number}/{total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {içerik haritası yok} one {içerik haritası 1/1: "
      & "{name}} other {içerik haritası {current, number}/{total, number}: "
      & "{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {sekme yok} one {sekme 1/1: {name}} other {sekme "
      & "{current, number}/{total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {gelen kutusu boş} one {{unread, plural, =0 {tüm "
      & "bildirimler okundu} other {1/1 bildirim okunmamış}}} other {{unread, "
      & "plural, =0 {tüm bildirimler okundu} other {{unread, number}/{total, "
      & "number} bildirim okunmamış}}}}");
   P ("label.notifications.delivery_attempt_label", "teslim denemesi {attempt, number}/{max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {kontrol listesi öğesi yok} one {{done, plural, "
      & "=0 {0/1 öğe tamamlandı} other {1/1 öğe tamamlandı}}} other "
      & "{{done, number}/{total, number} öğe tamamlandı}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {yükleme yok} one {{done, plural, =0 {0/1 yükleme "
      & "tamamlandı} other {1/1 yükleme tamamlandı}}} other {{done, "
      & "number}/{total, number} yükleme tamamlandı}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {kapasite yok} one {{reserved, plural, =0 {0/1 "
      & "koltuk ayrıldı} other {1/1 koltuk ayrıldı}}} other {{reserved, "
      & "number}/{capacity, number} koltuk ayrıldı}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {bekleme listesi sırası {position, number}} other "
      & "{bekleme listesi sırası {position, number}/{total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} değişti} other {{name}: {changed, number} değişti, "
      & "{unchanged, number} değişmedi, toplam {total, number}}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.markup.accessible_control_label.control",
      "{named, select, no {adsız {role, select, button_control {düğme} "
      & "link_control {bağlantı} tab_control {sekme} menu_item_control {menü "
      & "öğesi} checkbox_control {onay kutusu} radio_control {radyo "
      & "düğmesi} text_field_control {metin alanı} progress_control "
      & "{ilerleme göstergesi} table_cell_control {tablo hücresi} "
      & "region_control {bölge} other {denetim}}} other {{name} {role, select, "
      & "button_control {düğmesi} link_control {bağlantısı} tab_control "
      & "{sekmesi} menu_item_control {menü öğesi} checkbox_control {onay "
      & "kutusu} radio_control {radyo düğmesi} text_field_control {metin "
      & "alanı} progress_control {ilerleme göstergesi} table_cell_control "
      & "{tablo hücresi} region_control {bölgesi} other {denetimi}}}}");
   P ("label.markup.accessible_control_label.selected", "seçili");
   P ("label.markup.accessible_control_label.expanded", "genişletilmiş");
   P ("label.markup.accessible_control_label.current", "geçerli");
   P ("label.markup.accessible_control_label.disabled", "devre dışı");
   P ("label.markup.accessible_control_label.required", "zorunlu");
   P ("label.markup.accessible_control_label.invalid", "geçersiz");
   P ("label.markup.accessible_control_label.count", "{count, plural, one {1 öğe} other {{count, number} öğe}}");
   P ("label.markup.accessible_control_label.position", "öğe {position, number}/{total, number}");
   P ("label.markup.accessible_control_label.issues", "{count, plural, one {1 sorun} other {{count, number} sorun}}");
   P ("label.markup.accessible_control_label.with_states", "{control} {states}");
   P ("label.endpoints.url_component.scheme", "şema");
   P ("label.endpoints.url_component.host", "ana makine");
   P ("label.endpoints.url_component.path", "yol");
   P ("label.endpoints.url_component.query", "sorgu");
   P ("label.endpoints.url_component.fragment", "parça");
   P ("label.names.hue_noun.red", "kırmızı");
   P ("label.names.hue_noun.orange", "turuncu");
   P ("label.names.hue_noun.yellow", "sarı");
   P ("label.names.hue_noun.green", "yeşil");
   P ("label.names.hue_noun.cyan", "camgöbeği");
   P ("label.names.hue_noun.blue", "mavi");
   P ("label.names.hue_noun.purple", "mor");
   P ("label.names.hue_noun.magenta", "macenta");
   P ("label.names.hue_noun.neutral", "nötr");
   P ("label.names.hue_noun.pink", "pembe");
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
   P ("label.names.agree.very_dark", "{gender, select, other {çok koyu}}");
   P ("label.names.agree.dark", "{gender, select, other {koyu}}");
   P ("label.names.agree.medium_brightness", "{gender, select, other {orta parlaklıkta}}");
   P ("label.names.agree.light", "{gender, select, other {açık}}");
   P ("label.names.agree.very_light", "{gender, select, other {çok açık}}");
   P ("label.names.agree.desaturated", "{gender, select, other {doygunluğu düşük}}");
   P ("label.names.agree.muted", "{gender, select, other {soluk}}");
   P ("label.names.agree.neutral", "{gender, select, other {nötr}}");
   P ("label.names.agree.saturated", "{gender, select, other {doygun}}");
   P ("label.names.agree.vivid", "{gender, select, other {canlı}}");
   P ("label.names.agree.grayish", "{gender, select, other {grimsi}}");
   P ("label.names.agree.soft", "{gender, select, other {yumuşak}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {orta kromalı}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {yüksek kromalı}}");
   P ("label.names.agree.pastel", "{gender, select, other {pastel}}");
   P ("label.names.agree.warm", "{gender, select, other {sıcak}}");
   P ("label.names.agree.cool", "{gender, select, other {soğuk}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {nötr sıcaklıkta}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {dengeli sıcaklıkta}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "mevcut ön plan {v1}:{v2, number} oranında büyük metin "
      & "kontrastını karşılıyor");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "mevcut ön plan {v1}:{v2, number} oranında normal metin kontrastını "
      & "karşılıyor");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "{v2, number}:{v3, number} gelişmiş metin kontrastı için {v1} "
      & "kullanın");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "{v2, number}:{v3, number} büyük metin kontrastı için {v1} "
      & "kullanın");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "{v2}:{v3, number} normal metin kontrastı için {v1} kullanın");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "{v2}:{v3, number} büyük metin kontrastı için {v1} kullanın");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "{v2}:{v3, number} gelişmiş metin kontrastı için {v1} kullanın");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "mevcut ön plan {v1, number}:{v2, number} oranında büyük metin "
      & "kontrastını karşılıyor");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "mevcut ön plan {v1, number}:{v2, number} oranında normal metin "
      & "kontrastını karşılıyor");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "mevcut ön plan {v1}:{v2, number} oranında gelişmiş metin "
      & "kontrastını karşılıyor");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "mevcut ön plan {v1, number}:{v2, number} oranında gelişmiş metin "
      & "kontrastını karşılıyor");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopi düşük karışma riski, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "döteranopi orta karışma riski, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopi orta karışma riski, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "akromatopsi yüksek karışma riski, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, çok büyük algısal fark");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, çok büyük algısal fark");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 tekstil delta {v1}, çok büyük algısal fark");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, çok büyük algısal fark");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, büyük algısal fark");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopi orta karışma riski, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, çok büyük algısal fark");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, çok büyük algısal fark");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, çok büyük algısal fark");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "akromatopsi düşük karışma riski, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopi ayırt edilebilir, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "döteranopi ayırt edilebilir, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopi ayırt edilebilir, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "akromatopsi ayırt edilebilir, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "akromatopsi orta karışma riski, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, büyük algısal fark");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, büyük algısal fark");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 tekstil delta {v1}, büyük algısal fark");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, büyük algısal fark");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, fark edilir algısal fark");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopi yüksek karışma riski, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopi yüksek karışma riski, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, fark edilir algısal fark");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 tekstil delta {v1}, fark edilir algısal fark");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, fark edilir algısal fark");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, fark edilir algısal fark");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopi düşük karışma riski, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "döteranopi düşük karışma riski, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, büyük algısal fark");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "döteranopi yüksek karışma riski, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, çok büyük algısal fark");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, çok büyük algısal fark");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, çok büyük algısal fark");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, büyük algısal fark");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, büyük algısal fark");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, büyük algısal fark");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, fark edilir algısal fark");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 tekstil delta {v1}, hafif algısal fark");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, fark edilir algısal fark");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, fark edilir algısal fark");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, zar zor algılanır");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, algılanamaz");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 tekstil delta {v1}, algılanamaz");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, algılanamaz");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, algılanamaz");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, büyük algısal fark");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, algılanamaz");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, algılanamaz");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 tekstil delta {v1, number}, algılanamaz");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, algılanamaz");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, algılanamaz");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, hafif algısal fark");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, hafif algısal fark");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, hafif algısal fark");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, zar zor algılanır");
   P ("label.metrics.text_summary.n_words", "{v1, number} kelime");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, number} paragraf");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} dakikalık konuşma");
   P ("label.metrics.text_summary.n_sentences", "{v1, number} cümle");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} dakikalık okuma");
   P ("label.metrics.text_summary.n_paragraph", "{v1, number} paragraf");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "{v1, number} dakikadan kısa konuşma");
   P ("label.metrics.text_summary.less_than_n_minute_read", "{v1, number} dakikadan kısa okuma");
   P ("label.metrics.text_summary.n_sentence", "{v1, number} cümle");
   P ("label.metrics.text_summary.no_words", "kelime yok");
   P ("label.metrics.text_summary.no_paragraphs", "paragraf yok");
   P ("label.metrics.text_summary.no_sentences", "cümle yok");
   P ("label.metrics.text_summary.n_word", "{v1, number} kelime");
   P ("label.names.hue_family_label.neutral", "nötr");
   P ("label.names.saturation_label.neutral", "nötr");
   P ("label.names.temperature_label.neutral_temperature", "nötr sıcaklık");
   P ("label.names.chroma_label.grayish", "grimsi");
   P ("label.names.nearest_color_name.black", "siyah");
   P ("label.models.brightness_label.very_dark", "çok koyu");
   P ("label.names.hue_family_label.blue", "mavi");
   P ("label.names.saturation_label.vivid", "canlı");
   P ("label.names.temperature_label.cool", "soğuk");
   P ("label.names.chroma_label.moderate_chroma", "orta kroma");
   P ("label.names.nearest_color_name.navy", "lacivert");
   P ("label.names.chroma_label.high_chroma", "yüksek kroma");
   P ("label.names.nearest_color_name.blue", "mavi");
   P ("label.names.hue_family_label.green", "yeşil");
   P ("label.names.temperature_label.balanced_temperature", "dengeli sıcaklık");
   P ("label.names.hue_family_label.cyan", "camgöbeği");
   P ("label.names.chroma_label.soft", "yumuşak");
   P ("label.models.brightness_label.dark", "koyu");
   P ("label.names.nearest_color_name.green", "yeşil");
   P ("label.names.nearest_color_name.teal", "petrol mavisi");
   P ("label.models.brightness_label.medium_brightness", "orta parlaklık");
   P ("label.names.nearest_color_name.aqua", "su mavisi");
   P ("label.names.nearest_color_name.lime", "limon yeşili");
   P ("label.models.brightness_label.light", "açık");
   P ("label.names.hue_family_label.red", "kırmızı");
   P ("label.names.temperature_label.warm", "sıcak");
   P ("label.names.hue_family_label.magenta", "macenta");
   P ("label.names.hue_family_label.purple", "mor");
   P ("label.names.hue_family_label.yellow", "sarı");
   P ("label.names.saturation_label.muted", "soluk");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "doygun");
   P ("label.names.nearest_color_name.maroon", "bordo");
   P ("label.names.nearest_color_name.purple", "mor");
   P ("label.names.hue_family_label.orange", "turuncu");
   P ("label.names.nearest_color_name.olive", "zeytin yeşili");
   P ("label.names.nearest_color_name.gray", "gri");
   P ("label.names.saturation_label.desaturated", "doygunluğu düşük");
   P ("label.names.nearest_color_name.silver", "gümüş");
   P ("label.names.chroma_label.pastel", "pastel");
   P ("label.models.brightness_label.very_light", "çok açık");
   P ("label.names.nearest_color_name.fuchsia", "fuşya");
   P ("label.names.nearest_color_name.yellow", "sarı");
   P ("label.names.nearest_color_name.red", "kırmızı");
   P ("label.names.nearest_color_name.orange", "turuncu");
   P ("label.names.nearest_color_name.white", "beyaz");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number} düşük kontrast");
   P ("label.contrast.readability_label.low_readability", "düşük okunabilirlik");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, yetersiz, açık arka planda koyu metin");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number} düşük kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, yetersiz, açık arka planda koyu metin");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "akromatopsi orta karışma riski");
   P ("label.models.color_difference_label.n_strong_difference", "%{v1, number} güçlü fark");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number} düşük kontrast (alfa birleştirme sonrası)");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, yetersiz, koyu arka planda açık metin");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, yetersiz, koyu arka planda açık metin");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "döteranopi yüksek karışma riski");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number} büyük metin kontrastı");
   P ("label.contrast.readability_label.readable_for_large_text_only", "yalnızca büyük metin için okunabilir");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, büyük metin, koyu arka planda açık metin");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number} büyük metin kontrastı");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, büyük metin, koyu arka planda açık metin");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopi yüksek karışma riski");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} büyük metin kontrastı (alfa birleştirme "
      & "sonrası)");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, yalnızca metin dışı öğeler, koyu arka planda "
      & "açık metin");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, yalnızca metin dışı öğeler, koyu arka planda "
      & "açık metin");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopi orta karışma riski");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number} düşük kontrast");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number} düşük kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, yalnızca metin dışı öğeler, açık arka planda "
      & "koyu metin");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, yalnızca metin dışı öğeler, açık arka planda "
      & "koyu metin");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "döteranopi orta karışma riski");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopi yüksek karışma riski");
   P ("label.models.color_difference_label.n_very_different", "%{v1, number} çok farklı");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "akromatopsi yüksek karışma riski");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "akromatopsi düşük karışma riski");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} düşük kontrast (alfa birleştirme "
      & "sonrası)");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number} normal metin kontrastı");
   P ("label.contrast.readability_label.readable_for_normal_text", "normal metin için okunabilir");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, gövde metni, koyu arka planda açık metin");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number} normal metin kontrastı");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, gövde metni, koyu arka planda açık metin");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, büyük metin, açık arka planda koyu metin");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, büyük metin, açık arka planda koyu metin");
   P ("label.models.color_difference_label.n_subtle_difference", "%{v1, number} hafif fark");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, gövde metni, açık arka planda koyu metin");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, gövde metni, açık arka planda koyu metin");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopi düşük karışma riski");
   P ("label.models.color_difference_label.n_noticeable_difference", "%{v1, number} belirgin fark");
   P ("label.contrast.contrast_label.n_n_large_text_contrast", "{v1, number}:{v2, number} büyük metin kontrastı");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} büyük metin kontrastı");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "döteranopi düşük karışma riski");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number} gelişmiş kontrast");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "gelişmiş metin için okunabilir");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number} gelişmiş kontrast");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, hafif algısal fark");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopi ayırt edilebilir");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} normal metin kontrastı (alfa birleştirme "
      & "sonrası)");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopi orta karışma riski");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} normal metin kontrastı (alfa birleştirme sonrası)");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} büyük metin kontrastı (alfa birleştirme "
      & "sonrası)");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, mükemmel, açık arka planda koyu metin");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, mükemmel, açık arka planda koyu metin");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast", "{v1, number}:{v2, number} normal metin kontrastı");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} normal metin kontrastı");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number} gelişmiş kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, mükemmel, koyu arka planda açık metin");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} gelişmiş kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, mükemmel, koyu arka planda açık metin");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "döteranopi ayırt edilebilir");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number} gelişmiş kontrast (alfa birleştirme sonrası)");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, zar zor algılanır");
   P ("label.models.color_difference_label.n_nearly_identical", "%{v1, number} neredeyse aynı");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopi düşük karışma riski");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "akromatopsi ayırt edilebilir");
   P ("label.palettes.palette_summary.n_colors", "{v1, number} renk");
   P ("label.palettes.palette_summary.mostly_gray", "çoğunlukla gri");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "orta kontrast yayılımı");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "arka plan {v1}, metin {v2}, vurgu {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "üçlü palet");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "en iyi kontrast: {v2} üzerinde {v1}, {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v2, number} çiftten {v1, number} tanesi normal metin kontrastını "
      & "geçiyor");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v5, number} çiftten {v1, number} gelişmiş, {v2, number} normal, "
      & "{v3, number} yalnızca büyük, {v4, number} başarısız");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, number} renk, {v2, number} çift: {v3, number} gelişmiş, {v4, "
      & "number} normal, {v5, number} yalnızca büyük, {v6, number} "
      & "başarısız");
   P ("label.palettes.palette_mood_label.balanced", "dengeli");
   P ("label.palettes.palette_mood_label.vibrant", "canlı");
   P ("label.palettes.palette_mood_label.warm_mood", "sıcak ton");
   P ("label.palettes.palette_summary.mostly_blue", "çoğunlukla mavi");
   P ("label.palettes.palette_summary.low_contrast_spread", "düşük kontrast yayılımı");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "tek vurgulu palet");
   P ("label.palettes.palette_mood_label.dark", "koyu");
   P ("label.palettes.palette_mood_label.cool_mood", "soğuk ton");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "çoğunlukla rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "erişilebilir metin çifti yok");
   P ("label.palettes.palette_mood_label.subtle", "hafif");
   P ("label.palettes.palette_summary.high_contrast_spread", "yüksek kontrast yayılımı");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "en iyi kontrast: {v2} üzerinde {v1}, {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "nötr ton");
   P ("label.palettes.palette_summary.mostly_purple", "çoğunlukla mor");
   P ("label.palettes.palette_harmony_label.complementary_palette", "tamamlayıcı palet");
   P ("label.palettes.palette_summary.mostly_green", "çoğunlukla yeşil");
   P ("label.palettes.palette_mood_label.moderate", "ölçülü");
   P ("label.palettes.palette_summary.mostly_silver", "çoğunlukla gümüş");
   P ("label.palettes.palette_harmony_label.varied_palette", "çeşitli palet");
   P ("label.palettes.palette_summary.mostly_olive", "çoğunlukla zeytin yeşili");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analog palet");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v2, number} çiftten {v1, number} tanesi yalnızca büyük metin "
      & "için geçiyor");
   P ("label.palettes.palette_mood_label.light", "açık");
   P ("label.palettes.palette_summary.mostly_teal", "çoğunlukla petrol mavisi");
   P ("label.palettes.palette_summary.mostly_aqua", "çoğunlukla su mavisi");
   P ("label.palettes.palette_summary.mostly_lime", "çoğunlukla limon yeşili");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "tek renkli palet");
   P ("label.palettes.palette_summary.mostly_black", "çoğunlukla siyah");
   P ("label.palettes.palette_summary.mostly_yellow", "çoğunlukla sarı");
   P ("label.palettes.palette_summary.mostly_maroon", "çoğunlukla bordo");
   P ("label.palettes.palette_summary.mostly_white", "çoğunlukla beyaz");
   P ("label.palettes.palette_summary.mostly_orange", "çoğunlukla turuncu");
   P ("label.palettes.palette_summary.mostly_fuchsia", "çoğunlukla fuşya");
   P ("label.palettes.palette_harmony_label.neutral_palette", "nötr palet");
   P ("label.palettes.palette_summary.mostly_red", "çoğunlukla kırmızı");
   P ("label.metrics.word_count_summary.n_words", "{v1, number} kelime");
   P ("label.metrics.sentence_count_summary.n_sentences", "{v1, number} cümle");
   P ("label.metrics.paragraph_count_summary.n_paragraphs", "{v1, number} paragraf");
   P ("label.metrics.reading_time.n_minutes_read", "{v1, number} dakikalık okuma");
   P ("label.metrics.speaking_time.n_minutes_spoken", "{v1, number} dakikalık konuşma");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, number} kelime");
   P ("label.metrics.text_summary_with_options.n_sentences", "{v1, number} cümle");
   P ("label.metrics.text_summary_with_options.n_paragraphs", "{v1, number} paragraf");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "{v1, number} dakikalık okuma");
   P ("label.metrics.paragraph_count_summary.n_paragraph", "{v1, number} paragraf");
   P ("label.metrics.reading_time.less_than_n_minute_read", "{v1, number} dakikadan kısa okuma");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "{v1, number} dakikadan kısa konuşma");
   P ("label.metrics.text_summary_with_options.n_paragraph", "{v1, number} paragraf");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "{v1, number} dakikadan kısa okuma");
   P ("label.metrics.sentence_count_summary.n_sentence", "{v1, number} cümle");
   P ("label.metrics.text_summary_with_options.n_sentence", "{v1, number} cümle");
   P ("label.metrics.word_count_summary.no_words", "kelime yok");
   P ("label.metrics.sentence_count_summary.no_sentences", "cümle yok");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "paragraf yok");
   P ("label.metrics.text_summary_with_options.no_words", "kelime yok");
   P ("label.metrics.text_summary_with_options.no_sentences", "cümle yok");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "paragraf yok");
   P ("label.metrics.word_count_summary.n_word", "{v1, number} kelime");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, number} kelime");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.endpoints.url_label", "{state, select, empty {boş URL} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {boş URL} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[gizlenmiş kullanıcı]");
   P ("label.endpoints.url_label.query",
      "sorgu {count, plural, one {1 parametre} other {{count, number} "
      & "parametre}}");
end Labels_3;
