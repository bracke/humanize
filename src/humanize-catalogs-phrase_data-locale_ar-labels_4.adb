separate (Humanize.Catalogs.Phrase_Data.Locale_Ar)
procedure Labels_4 is
begin
   P ("label.names.hue_gender.yellow", "masculine");
   P ("label.names.hue_gender.green", "masculine");
   P ("label.names.hue_gender.cyan", "masculine");
   P ("label.names.hue_gender.blue", "masculine");
   P ("label.names.hue_gender.purple", "masculine");
   P ("label.names.hue_gender.magenta", "masculine");
   P ("label.names.hue_gender.neutral", "masculine");
   P ("label.names.hue_gender.pink", "masculine");
   P ("label.names.agree.very_dark",
      "{gender, select, masculine {داكن جدًا} feminine {داكنة "
      & "جدًا} other {داكن جدًا}}");
   P ("label.names.agree.dark",
      "{gender, select, masculine {داكن} feminine {داكنة} other "
      & "{داكن}}");
   P ("label.names.agree.medium_brightness",
      "{gender, select, masculine {متوسط السطوع} feminine "
      & "{متوسطة السطوع} other {متوسط السطوع}}");
   P ("label.names.agree.light",
      "{gender, select, masculine {فاتح} feminine {فاتحة} other "
      & "{فاتح}}");
   P ("label.names.agree.very_light",
      "{gender, select, masculine {فاتح جدًا} feminine {فاتحة "
      & "جدًا} other {فاتح جدًا}}");
   P ("label.names.agree.desaturated",
      "{gender, select, masculine {قليل التشبع} feminine "
      & "{قليلة التشبع} other {قليل التشبع}}");
   P ("label.names.agree.muted",
      "{gender, select, masculine {باهت} feminine {باهتة} other "
      & "{باهت}}");
   P ("label.names.agree.neutral",
      "{gender, select, masculine {محايد} feminine {محايدة} other "
      & "{محايد}}");
   P ("label.names.agree.saturated",
      "{gender, select, masculine {مشبع} feminine {مشبعة} other "
      & "{مشبع}}");
   P ("label.names.agree.vivid",
      "{gender, select, masculine {زاهٍ} feminine {زاهية} other "
      & "{زاهٍ}}");
   P ("label.names.agree.grayish",
      "{gender, select, masculine {مائل إلى الرمادي} feminine "
      & "{مائلة إلى الرمادي} other {مائل إلى "
      & "الرمادي}}");
   P ("label.names.agree.soft",
      "{gender, select, masculine {ناعم} feminine {ناعمة} other "
      & "{ناعم}}");
   P ("label.names.agree.moderate_chroma",
      "{gender, select, masculine {متوسط الكروما} feminine "
      & "{متوسطة الكروما} other {متوسط الكروما}}");
   P ("label.names.agree.high_chroma",
      "{gender, select, masculine {عالي الكروما} feminine "
      & "{عالية الكروما} other {عالي الكروما}}");
   P ("label.names.agree.pastel", "{gender, select, other {باستيل}}");
   P ("label.names.agree.warm",
      "{gender, select, masculine {دافئ} feminine {دافئة} other "
      & "{دافئ}}");
   P ("label.names.agree.cool",
      "{gender, select, masculine {بارد} feminine {باردة} other "
      & "{بارد}}");
   P ("label.names.agree.neutral_temperature",
      "{gender, select, masculine {محايد الحرارة} feminine "
      & "{محايدة الحرارة} other {محايد الحرارة}}");
   P ("label.names.agree.balanced_temperature",
      "{gender, select, masculine {متوازن الحرارة} feminine "
      & "{متوازنة الحرارة} other {متوازن الحرارة}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "اللون الأمامي الحالي يحقق تباين النص "
      & "الكبير عند {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "اللون الأمامي الحالي يحقق تباين النص "
      & "العادي عند {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "استخدم {v1} لتحقيق تباين النص المحسّن {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "استخدم {v1} لتحقيق تباين النص الكبير {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "استخدم {v1} لتحقيق تباين النص العادي "
      & "{v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "استخدم {v1} لتحقيق تباين النص الكبير "
      & "{v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "استخدم {v1} لتحقيق تباين النص المحسّن "
      & "{v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "اللون الأمامي الحالي يحقق تباين النص "
      & "الكبير عند {v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "اللون الأمامي الحالي يحقق تباين النص "
      & "العادي عند {v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "اللون الأمامي الحالي يحقق تباين النص "
      & "المحسّن عند {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "اللون الأمامي الحالي يحقق تباين النص "
      & "المحسّن عند {v1, number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "عمى الأحمر: خطر التباس منخفض، دلتا {v1, "
      & "number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "عمى الأخضر: خطر التباس متوسط، دلتا {v1, "
      & "number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "عمى الأزرق: خطر التباس متوسط، دلتا {v1, "
      & "number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "عمى الألوان الكلي: خطر التباس مرتفع، "
      & "دلتا {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 دلتا {v1}، فرق إدراكي هائل");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 دلتا {v1}، فرق إدراكي هائل");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 للنسيج دلتا {v1}، فرق إدراكي هائل");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 دلتا {v1, number}، فرق إدراكي هائل");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab دلتا {v1}، فرق إدراكي كبير");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "عمى الأحمر: خطر التباس متوسط، دلتا {v1, "
      & "number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 دلتا {v1, number}، فرق إدراكي هائل");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 دلتا {v1}، فرق إدراكي هائل");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab دلتا {v1}، فرق إدراكي هائل");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "عمى الألوان الكلي: خطر التباس منخفض، "
      & "دلتا {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "عمى الأحمر: مميَّز، دلتا {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "عمى الأخضر: مميَّز، دلتا {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "عمى الأزرق: مميَّز، دلتا {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "عمى الألوان الكلي: مميَّز، دلتا {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "عمى الألوان الكلي: خطر التباس متوسط، "
      & "دلتا {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 دلتا {v1}، فرق إدراكي كبير");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 دلتا {v1}، فرق إدراكي كبير");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 للنسيج دلتا {v1}، فرق إدراكي كبير");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 دلتا {v1}، فرق إدراكي كبير");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab دلتا {v1}، فرق إدراكي ملحوظ");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "عمى الأحمر: خطر التباس مرتفع، دلتا {v1, "
      & "number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "عمى الأزرق: خطر التباس مرتفع، دلتا {v1, "
      & "number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 دلتا {v1}، فرق إدراكي ملحوظ");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 للنسيج دلتا {v1}، فرق إدراكي ملحوظ");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 دلتا {v1}، فرق إدراكي ملحوظ");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab دلتا {v1, number}، فرق إدراكي ملحوظ");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "عمى الأزرق: خطر التباس منخفض، دلتا {v1, "
      & "number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "عمى الأخضر: خطر التباس منخفض، دلتا {v1, "
      & "number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab دلتا {v1, number}، فرق إدراكي كبير");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "عمى الأخضر: خطر التباس مرتفع، دلتا {v1, "
      & "number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 دلتا {v1, number}، فرق إدراكي هائل");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 للنسيج دلتا {v1, number}، فرق إدراكي "
      & "هائل");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab دلتا {v1, number}، فرق إدراكي هائل");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 دلتا {v1, number}، فرق إدراكي كبير");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 للنسيج دلتا {v1, number}، فرق إدراكي "
      & "كبير");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 دلتا {v1, number}، فرق إدراكي كبير");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 دلتا {v1}، فرق إدراكي ملحوظ");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 للنسيج دلتا {v1}، فرق إدراكي طفيف");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 دلتا {v1, number}، فرق إدراكي ملحوظ");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 للنسيج دلتا {v1, number}، فرق إدراكي "
      & "ملحوظ");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 دلتا {v1}، بالكاد يُدرَك");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible",
      "CIE94 دلتا {v1}، غير محسوس");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 للنسيج دلتا {v1}، غير محسوس");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 دلتا {v1}، غير محسوس");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible",
      "OKLab دلتا {v1}، غير محسوس");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 دلتا {v1, number}، فرق إدراكي كبير");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 دلتا {v1, number}، غير محسوس");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 دلتا {v1, number}، غير محسوس");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 للنسيج دلتا {v1, number}، غير محسوس");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 دلتا {v1, number}، غير محسوس");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab دلتا {v1, number}، غير محسوس");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab دلتا {v1}، فرق إدراكي طفيف");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 دلتا {v1}، فرق إدراكي طفيف");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 دلتا {v1}، فرق إدراكي طفيف");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab دلتا {v1}، بالكاد يُدرَك");
   P ("label.metrics.text_summary.n_words",
      "{v1, plural, one {كلمة واحدة} two {كلمتان} few {{v1, "
      & "number} كلمات} many {{v1, number} كلمةً} other {{v1, number} "
      & "كلمة}}");
   P ("label.metrics.text_summary.n_paragraphs",
      "{v1, plural, one {فقرة واحدة} two {فقرتان} few {{v1, "
      & "number} فقرات} many {{v1, number} فقرةً} other {{v1, number} "
      & "فقرة}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "مدة التحدث: {v1, plural, one {دقيقة واحدة} two "
      & "{دقيقتان} few {{v1, number} دقائق} many {{v1, number} "
      & "دقيقةً} other {{v1, number} دقيقة}}");
   P ("label.metrics.text_summary.n_sentences",
      "{v1, plural, one {جملة واحدة} two {جملتان} few {{v1, "
      & "number} جمل} many {{v1, number} جملةً} other {{v1, number} "
      & "جملة}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "مدة القراءة: {v1, plural, one {دقيقة واحدة} two "
      & "{دقيقتان} few {{v1, number} دقائق} many {{v1, number} "
      & "دقيقةً} other {{v1, number} دقيقة}}");
   P ("label.metrics.text_summary.n_paragraph",
      "{v1, plural, one {فقرة واحدة} two {فقرتان} few {{v1, "
      & "number} فقرات} many {{v1, number} فقرةً} other {{v1, number} "
      & "فقرة}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "مدة التحدث: أقل من {v1, plural, one {دقيقة "
      & "واحدة} two {دقيقتين} few {{v1, number} دقائق} many "
      & "{{v1, number} دقيقةً} other {{v1, number} دقيقة}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "مدة القراءة: أقل من {v1, plural, one {دقيقة "
      & "واحدة} two {دقيقتين} few {{v1, number} دقائق} many "
      & "{{v1, number} دقيقةً} other {{v1, number} دقيقة}}");
   P ("label.metrics.text_summary.n_sentence",
      "{v1, plural, one {جملة واحدة} two {جملتان} few {{v1, "
      & "number} جمل} many {{v1, number} جملةً} other {{v1, number} "
      & "جملة}}");
   P ("label.metrics.text_summary.no_words", "لا توجد كلمات");
   P ("label.metrics.text_summary.no_paragraphs", "لا توجد فقرات");
   P ("label.metrics.text_summary.no_sentences", "لا توجد جمل");
   P ("label.metrics.text_summary.n_word",
      "{v1, plural, one {كلمة واحدة} two {كلمتان} few {{v1, "
      & "number} كلمات} many {{v1, number} كلمةً} other {{v1, number} "
      & "كلمة}}");
   P ("label.names.hue_family_label.neutral", "محايد");
   P ("label.names.saturation_label.neutral", "محايد");
   P ("label.names.temperature_label.neutral_temperature", "حرارة لونية محايدة");
   P ("label.names.chroma_label.grayish", "مائل إلى الرمادي");
   P ("label.names.nearest_color_name.black", "أسود");
   P ("label.models.brightness_label.very_dark", "داكن جدًا");
   P ("label.names.hue_family_label.blue", "أزرق");
   P ("label.names.saturation_label.vivid", "زاهٍ");
   P ("label.names.temperature_label.cool", "بارد");
   P ("label.names.chroma_label.moderate_chroma", "كروما متوسطة");
   P ("label.names.nearest_color_name.navy", "كحلي");
   P ("label.names.chroma_label.high_chroma", "كروما عالية");
   P ("label.names.nearest_color_name.blue", "أزرق");
   P ("label.names.hue_family_label.green", "أخضر");
   P ("label.names.temperature_label.balanced_temperature", "حرارة لونية متوازنة");
   P ("label.names.hue_family_label.cyan", "سماوي");
   P ("label.names.chroma_label.soft", "ناعم");
   P ("label.models.brightness_label.dark", "داكن");
   P ("label.names.nearest_color_name.green", "أخضر");
   P ("label.names.nearest_color_name.teal", "أزرق مخضر");
   P ("label.models.brightness_label.medium_brightness", "سطوع متوسط");
   P ("label.names.nearest_color_name.aqua", "أزرق مائي");
   P ("label.names.nearest_color_name.lime", "أخضر ليموني");
   P ("label.models.brightness_label.light", "فاتح");
   P ("label.names.hue_family_label.red", "أحمر");
   P ("label.names.temperature_label.warm", "دافئ");
   P ("label.names.hue_family_label.magenta", "أرجواني");
   P ("label.names.hue_family_label.purple", "بنفسجي");
   P ("label.names.hue_family_label.yellow", "أصفر");
   P ("label.names.saturation_label.muted", "باهت");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "مشبع");
   P ("label.names.nearest_color_name.maroon", "عنابي");
   P ("label.names.nearest_color_name.purple", "بنفسجي");
   P ("label.names.hue_family_label.orange", "برتقالي");
   P ("label.names.nearest_color_name.olive", "زيتوني");
   P ("label.names.nearest_color_name.gray", "رمادي");
   P ("label.names.saturation_label.desaturated", "قليل التشبع");
   P ("label.names.nearest_color_name.silver", "فضي");
   P ("label.names.chroma_label.pastel", "باستيل");
   P ("label.models.brightness_label.very_light", "فاتح جدًا");
   P ("label.names.nearest_color_name.fuchsia", "فوشيا");
   P ("label.names.nearest_color_name.yellow", "أصفر");
   P ("label.names.nearest_color_name.red", "أحمر");
   P ("label.names.nearest_color_name.orange", "برتقالي");
   P ("label.names.nearest_color_name.white", "أبيض");
   P ("label.contrast.contrast_label.d_n_low_contrast", "تباين منخفض {v1}:{v2, number}");
   P ("label.contrast.readability_label.low_readability", "قابلية قراءة منخفضة");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}، غير كافٍ، نص داكن على خلفية "
      & "فاتحة");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "تباين منخفض {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}، غير كافٍ، نص داكن على خلفية "
      & "فاتحة");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "عمى الألوان الكلي: خطر التباس متوسط");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}٪ فرق قوي");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "تباين منخفض {v1}:{v2, number} بعد مزج ألفا");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}، غير كافٍ، نص فاتح على خلفية "
      & "داكنة");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}، غير كافٍ، نص فاتح على خلفية "
      & "داكنة");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "عمى الأخضر: خطر التباس مرتفع");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "تباين النص الكبير {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_large_text_only", "مقروء للنص الكبير فقط");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}، نص كبير، نص فاتح على خلفية "
      & "داكنة");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "تباين النص الكبير {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}، نص كبير، نص فاتح على خلفية "
      & "داكنة");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "عمى الأزرق: خطر التباس مرتفع");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "تباين النص الكبير {v1}:{v2, number} بعد مزج "
      & "ألفا");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}، لغير النصوص فقط، نص فاتح على "
      & "خلفية داكنة");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}، لغير النصوص فقط، نص فاتح على "
      & "خلفية داكنة");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "عمى الأزرق: خطر التباس متوسط");
   P ("label.contrast.contrast_label.n_n_low_contrast", "تباين منخفض {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast",
      "تباين منخفض {v1, number}:{v2, number}");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}، لغير النصوص فقط، نص داكن على "
      & "خلفية فاتحة");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}، لغير النصوص فقط، نص داكن على "
      & "خلفية فاتحة");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "عمى الأخضر: خطر التباس متوسط");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "عمى الأحمر: خطر التباس مرتفع");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}٪ مختلف جدًا");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "عمى الألوان الكلي: خطر التباس مرتفع");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "عمى الألوان الكلي: خطر التباس منخفض");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "تباين منخفض {v1, number}:{v2, number} بعد مزج ألفا");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "تباين النص العادي {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_normal_text", "مقروء للنص العادي");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}، نص أساسي، نص فاتح على خلفية "
      & "داكنة");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "تباين النص العادي {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}، نص أساسي، نص فاتح على خلفية "
      & "داكنة");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}، نص كبير، نص داكن على خلفية "
      & "فاتحة");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}، نص كبير، نص داكن على خلفية "
      & "فاتحة");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}٪ فرق طفيف");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}، نص أساسي، نص داكن على خلفية "
      & "فاتحة");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}، نص أساسي، نص داكن على خلفية "
      & "فاتحة");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "عمى الأزرق: خطر التباس منخفض");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}٪ فرق ملحوظ");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "تباين النص الكبير {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "تباين النص الكبير {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "عمى الأخضر: خطر التباس منخفض");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "تباين محسّن {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "مقروء للنص المحسّن");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "تباين محسّن {v1}:{v2, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab دلتا {v1, number}، فرق إدراكي طفيف");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "عمى الأزرق: مميَّز");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "تباين النص العادي {v1, number}:{v2, number} بعد "
      & "مزج ألفا");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "عمى الأحمر: خطر التباس متوسط");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "تباين النص العادي {v1}:{v2, number} بعد مزج "
      & "ألفا");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "تباين النص الكبير {v1, number}:{v2, number} بعد "
      & "مزج ألفا");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}، ممتاز، نص داكن على خلفية "
      & "فاتحة");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}، ممتاز، نص داكن على خلفية "
      & "فاتحة");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "تباين النص العادي {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "تباين النص العادي {v1, number}:{v2, number}");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "تباين محسّن {v1, number}:{v2, number}");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}، ممتاز، نص فاتح على خلفية "
      & "داكنة");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "تباين محسّن {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}، ممتاز، نص فاتح على خلفية "
      & "داكنة");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "عمى الأخضر: مميَّز");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "تباين محسّن {v1}:{v2, number} بعد مزج ألفا");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab دلتا {v1, number}، بالكاد يُدرَك");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}٪ متطابق تقريبًا");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "عمى الأحمر: خطر التباس منخفض");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct",
      "عمى الألوان الكلي: مميَّز");
   P ("label.palettes.palette_summary.n_colors",
      "{v1, plural, one {لون واحد} two {لونان} few {{v1, number} "
      & "ألوان} many {{v1, number} لونًا} other {{v1, number} "
      & "لون}}");
   P ("label.palettes.palette_summary.mostly_gray", "يغلب عليها الرمادي");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "انتشار تباين متوسط");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c",
      "الخلفية {v1}، النص {v2}، لون التمييز {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "لوحة ثلاثية");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "أفضل تباين {v1} على {v2} بنسبة {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "الأزواج التي تجتاز تباين النص العادي: "
      & "{v1, number} من {v2, number}");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "محسّن {v1, number}، عادي {v2, number}، للنص "
      & "الكبير فقط {v3, number}، فاشل {v4, number} من أصل "
      & "{v5, number} من الأزواج");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "الألوان {v1, number}، الأزواج {v2, number}: محسّن "
      & "{v3, number}، عادي {v4, number}، للنص الكبير فقط "
      & "{v5, number}، فاشل {v6, number}");
   P ("label.palettes.palette_mood_label.balanced", "متوازن");
   P ("label.palettes.palette_mood_label.vibrant", "نابض بالحياة");
   P ("label.palettes.palette_mood_label.warm_mood", "طابع دافئ");
   P ("label.palettes.palette_summary.mostly_blue", "يغلب عليها الأزرق");
   P ("label.palettes.palette_summary.low_contrast_spread", "انتشار تباين منخفض");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "لوحة بلون تمييز واحد");
   P ("label.palettes.palette_mood_label.dark", "داكن");
   P ("label.palettes.palette_mood_label.cool_mood", "طابع بارد");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "يغلب عليها لون rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs",
      "لا توجد أزواج نصوص سهلة القراءة");
   P ("label.palettes.palette_mood_label.subtle", "هادئ");
   P ("label.palettes.palette_summary.high_contrast_spread", "انتشار تباين مرتفع");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "أفضل تباين {v1} على {v2} بنسبة {v3, number}:{v4, "
      & "number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "طابع محايد");
   P ("label.palettes.palette_summary.mostly_purple", "يغلب عليها البنفسجي");
   P ("label.palettes.palette_harmony_label.complementary_palette", "لوحة متكاملة");
   P ("label.palettes.palette_summary.mostly_green", "يغلب عليها الأخضر");
   P ("label.palettes.palette_mood_label.moderate", "معتدل");
   P ("label.palettes.palette_summary.mostly_silver", "يغلب عليها الفضي");
   P ("label.palettes.palette_harmony_label.varied_palette", "لوحة متنوعة");
   P ("label.palettes.palette_summary.mostly_olive", "يغلب عليها الزيتوني");
   P ("label.palettes.palette_harmony_label.analogous_palette", "لوحة متجاورة");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "الأزواج التي تجتاز تباين النص الكبير "
      & "فقط: {v1, number} من {v2, number}");
   P ("label.palettes.palette_mood_label.light", "فاتح");
   P ("label.palettes.palette_summary.mostly_teal", "يغلب عليها الأزرق المخضر");
   P ("label.palettes.palette_summary.mostly_aqua", "يغلب عليها الأزرق المائي");
   P ("label.palettes.palette_summary.mostly_lime", "يغلب عليها الأخضر الليموني");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "لوحة أحادية اللون");
   P ("label.palettes.palette_summary.mostly_black", "يغلب عليها الأسود");
   P ("label.palettes.palette_summary.mostly_yellow", "يغلب عليها الأصفر");
   P ("label.palettes.palette_summary.mostly_maroon", "يغلب عليها العنابي");
   P ("label.palettes.palette_summary.mostly_white", "يغلب عليها الأبيض");
   P ("label.palettes.palette_summary.mostly_orange", "يغلب عليها البرتقالي");
   P ("label.palettes.palette_summary.mostly_fuchsia", "يغلب عليها الفوشيا");
   P ("label.palettes.palette_harmony_label.neutral_palette", "لوحة محايدة");
   P ("label.palettes.palette_summary.mostly_red", "يغلب عليها الأحمر");
   P ("label.metrics.word_count_summary.n_words",
      "{v1, plural, one {كلمة واحدة} two {كلمتان} few {{v1, "
      & "number} كلمات} many {{v1, number} كلمةً} other {{v1, number} "
      & "كلمة}}");
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {جملة واحدة} two {جملتان} few {{v1, "
      & "number} جمل} many {{v1, number} جملةً} other {{v1, number} "
      & "جملة}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {فقرة واحدة} two {فقرتان} few {{v1, "
      & "number} فقرات} many {{v1, number} فقرةً} other {{v1, number} "
      & "فقرة}}");
   P ("label.metrics.reading_time.n_minutes_read",
      "مدة القراءة: {v1, plural, one {دقيقة واحدة} two "
      & "{دقيقتان} few {{v1, number} دقائق} many {{v1, number} "
      & "دقيقةً} other {{v1, number} دقيقة}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "مدة التحدث: {v1, plural, one {دقيقة واحدة} two "
      & "{دقيقتان} few {{v1, number} دقائق} many {{v1, number} "
      & "دقيقةً} other {{v1, number} دقيقة}}");
   P ("label.metrics.text_summary_with_options.n_words",
      "{v1, plural, one {كلمة واحدة} two {كلمتان} few {{v1, "
      & "number} كلمات} many {{v1, number} كلمةً} other {{v1, number} "
      & "كلمة}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {جملة واحدة} two {جملتان} few {{v1, "
      & "number} جمل} many {{v1, number} جملةً} other {{v1, number} "
      & "جملة}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {فقرة واحدة} two {فقرتان} few {{v1, "
      & "number} فقرات} many {{v1, number} فقرةً} other {{v1, number} "
      & "فقرة}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "مدة القراءة: {v1, plural, one {دقيقة واحدة} two "
      & "{دقيقتان} few {{v1, number} دقائق} many {{v1, number} "
      & "دقيقةً} other {{v1, number} دقيقة}}");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {فقرة واحدة} two {فقرتان} few {{v1, "
      & "number} فقرات} many {{v1, number} فقرةً} other {{v1, number} "
      & "فقرة}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "مدة القراءة: أقل من {v1, plural, one {دقيقة "
      & "واحدة} two {دقيقتين} few {{v1, number} دقائق} many "
      & "{{v1, number} دقيقةً} other {{v1, number} دقيقة}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "مدة التحدث: أقل من {v1, plural, one {دقيقة "
      & "واحدة} two {دقيقتين} few {{v1, number} دقائق} many "
      & "{{v1, number} دقيقةً} other {{v1, number} دقيقة}}");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {فقرة واحدة} two {فقرتان} few {{v1, "
      & "number} فقرات} many {{v1, number} فقرةً} other {{v1, number} "
      & "فقرة}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "مدة القراءة: أقل من {v1, plural, one {دقيقة "
      & "واحدة} two {دقيقتين} few {{v1, number} دقائق} many "
      & "{{v1, number} دقيقةً} other {{v1, number} دقيقة}}");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {جملة واحدة} two {جملتان} few {{v1, "
      & "number} جمل} many {{v1, number} جملةً} other {{v1, number} "
      & "جملة}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {جملة واحدة} two {جملتان} few {{v1, "
      & "number} جمل} many {{v1, number} جملةً} other {{v1, number} "
      & "جملة}}");
   P ("label.metrics.word_count_summary.no_words", "لا توجد كلمات");
   P ("label.metrics.sentence_count_summary.no_sentences", "لا توجد جمل");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "لا توجد فقرات");
   P ("label.metrics.text_summary_with_options.no_words", "لا توجد كلمات");
   P ("label.metrics.text_summary_with_options.no_sentences", "لا توجد جمل");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "لا توجد فقرات");
   P ("label.metrics.word_count_summary.n_word",
      "{v1, plural, one {كلمة واحدة} two {كلمتان} few {{v1, "
      & "number} كلمات} many {{v1, number} كلمةً} other {{v1, number} "
      & "كلمة}}");
   P ("label.metrics.text_summary_with_options.n_word",
      "{v1, plural, one {كلمة واحدة} two {كلمتان} few {{v1, "
      & "number} كلمات} many {{v1, number} كلمةً} other {{v1, number} "
      & "كلمة}}");
   P ("label.groups", "{first}؛ {second}");
   P ("label.parts", "{first}، {second}");
   P ("label.endpoints.url_label", "{state, select, empty {عنوان URL فارغ} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {عنوان URL فارغ} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[مستخدم محجوب]");
   P ("label.endpoints.url_label.query",
      "الاستعلام {count, plural, zero {{count, number} معامل} "
      & "one {معامل واحد} two {معاملان} few {{count, number} "
      & "معاملات} many {{count, number} معاملًا} other {{count, "
      & "number} معامل}}");
end Labels_4;
