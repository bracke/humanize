separate (Humanize.Catalogs.Phrase_Data.Locale_Ja)
procedure Labels_3 is
begin
   P ("label.names.color_description", "{brightness}、{hue}（{saturation}）、{temperature}、{chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness}・{chroma}・{temperature}の{base, select, pink "
      & "{ピンク} other {{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}、{mood}、{accessibility}；{roles}");
   P ("label.groups", "{first}；{second}");
   P ("label.parts", "{first}、{second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "現在の前景色は大きな文字のコントラストを満たし"
      & "ます（{v1}:{v2, "
      & "number}）");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "現在の前景色は通常の文字のコントラストを満たし"
      & "ます（{v1}:{v2, "
      & "number}）");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "{v1}を使用：強化コントラスト {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "{v1}を使用：大きな文字のコントラスト {v2, number}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "{v1}を使用：通常の文字のコントラスト {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "{v1}を使用：大きな文字のコントラスト {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "{v1}を使用：強化コントラスト {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "現在の前景色は大きな文字のコントラストを満たし"
      & "ます（{v1, "
      & "number}:{v2, number}）");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "現在の前景色は通常の文字のコントラストを満たし"
      & "ます（{v1, "
      & "number}:{v2, number}）");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "現在の前景色は強化コントラストを満たします（{v1}:{v2, "
      & "number}）");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "現在の前景色は強化コントラストを満たします（{v1, "
      & "number}:{v2, number}）");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "1型色覚：混同リスク低、デルタ{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "2型色覚：混同リスク中、デルタ{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "3型色覚：混同リスク中、デルタ{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "全色盲：混同リスク高、デルタ{v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 デルタ{v1}、劇的な知覚差");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 デルタ{v1}、劇的な知覚差");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94（テキスタイル） デルタ{v1}、劇的な知覚差");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 デルタ{v1, number}、劇的な知覚差");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab デルタ{v1}、大きな知覚差");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "1型色覚：混同リスク中、デルタ{v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 デルタ{v1, number}、劇的な知覚差");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 デルタ{v1}、劇的な知覚差");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab デルタ{v1}、劇的な知覚差");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "全色盲：混同リスク低、デルタ{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "1型色覚：識別可能、デルタ{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "2型色覚：識別可能、デルタ{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "3型色覚：識別可能、デルタ{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "全色盲：識別可能、デルタ{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "全色盲：混同リスク中、デルタ{v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 デルタ{v1}、大きな知覚差");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 デルタ{v1}、大きな知覚差");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94（テキスタイル） デルタ{v1}、大きな知覚差");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 デルタ{v1}、大きな知覚差");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab デルタ{v1}、目立つ知覚差");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "1型色覚：混同リスク高、デルタ{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "3型色覚：混同リスク高、デルタ{v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 デルタ{v1}、目立つ知覚差");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94（テキスタイル） デルタ{v1}、目立つ知覚差");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 デルタ{v1}、目立つ知覚差");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab デルタ{v1, number}、目立つ知覚差");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "3型色覚：混同リスク低、デルタ{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "2型色覚：混同リスク低、デルタ{v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab デルタ{v1, number}、大きな知覚差");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "2型色覚：混同リスク高、デルタ{v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 デルタ{v1, number}、劇的な知覚差");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94（テキスタイル） デルタ{v1, "
      & "number}、劇的な知覚差");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab デルタ{v1, number}、劇的な知覚差");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 デルタ{v1, number}、大きな知覚差");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94（テキスタイル） デルタ{v1, "
      & "number}、大きな知覚差");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 デルタ{v1, number}、大きな知覚差");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 デルタ{v1}、目立つ知覚差");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94（テキスタイル） デルタ{v1}、わずかな知覚差");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 デルタ{v1, number}、目立つ知覚差");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94（テキスタイル） デルタ{v1, "
      & "number}、目立つ知覚差");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 デルタ{v1}、かろうじて知覚可能");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 デルタ{v1}、知覚不能");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94（テキスタイル） デルタ{v1}、知覚不能");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 デルタ{v1}、知覚不能");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab デルタ{v1}、知覚不能");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 デルタ{v1, number}、大きな知覚差");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 デルタ{v1, number}、知覚不能");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 デルタ{v1, number}、知覚不能");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94（テキスタイル） デルタ{v1, number}、知覚不能");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 デルタ{v1, number}、知覚不能");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab デルタ{v1, number}、知覚不能");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab デルタ{v1}、わずかな知覚差");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 デルタ{v1}、わずかな知覚差");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 デルタ{v1}、わずかな知覚差");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab デルタ{v1}、かろうじて知覚可能");
   P ("label.metrics.text_summary.n_words", "{v1, number}語");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, number}段落");
   P ("label.metrics.text_summary.n_minutes_spoken", "発話時間{v1, number}分");
   P ("label.metrics.text_summary.n_sentences", "{v1, number}文");
   P ("label.metrics.text_summary.n_minutes_read", "読了時間{v1, number}分");
   P ("label.metrics.text_summary.n_paragraph", "{v1, number}段落");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "発話時間{v1, number}分未満");
   P ("label.metrics.text_summary.less_than_n_minute_read", "読了時間{v1, number}分未満");
   P ("label.metrics.text_summary.n_sentence", "{v1, number}文");
   P ("label.metrics.text_summary.no_words", "単語なし");
   P ("label.metrics.text_summary.no_paragraphs", "段落なし");
   P ("label.metrics.text_summary.no_sentences", "文なし");
   P ("label.metrics.text_summary.n_word", "{v1, number}語");
   P ("label.names.hue_family_label.neutral", "ニュートラル");
   P ("label.names.saturation_label.neutral", "無彩色");
   P ("label.names.temperature_label.neutral_temperature", "ニュートラルな色温度");
   P ("label.names.chroma_label.grayish", "グレイッシュ");
   P ("label.names.nearest_color_name.black", "黒");
   P ("label.models.brightness_label.very_dark", "とても暗い");
   P ("label.names.hue_family_label.blue", "青");
   P ("label.names.saturation_label.vivid", "鮮やか");
   P ("label.names.temperature_label.cool", "寒色系");
   P ("label.names.chroma_label.moderate_chroma", "中彩度");
   P ("label.names.nearest_color_name.navy", "ネイビー");
   P ("label.names.chroma_label.high_chroma", "高彩度");
   P ("label.names.nearest_color_name.blue", "青");
   P ("label.names.hue_family_label.green", "緑");
   P ("label.names.temperature_label.balanced_temperature", "バランスの取れた色温度");
   P ("label.names.hue_family_label.cyan", "シアン");
   P ("label.names.chroma_label.soft", "ソフト");
   P ("label.models.brightness_label.dark", "暗い");
   P ("label.names.nearest_color_name.green", "緑");
   P ("label.names.nearest_color_name.teal", "ティール");
   P ("label.models.brightness_label.medium_brightness", "中程度の明るさ");
   P ("label.names.nearest_color_name.aqua", "アクア");
   P ("label.names.nearest_color_name.lime", "ライム");
   P ("label.models.brightness_label.light", "明るい");
   P ("label.names.hue_family_label.red", "赤");
   P ("label.names.temperature_label.warm", "暖色系");
   P ("label.names.hue_family_label.magenta", "マゼンタ");
   P ("label.names.hue_family_label.purple", "紫");
   P ("label.names.hue_family_label.yellow", "黄");
   P ("label.names.saturation_label.muted", "くすんだ");
   P ("label.names.nearest_color_name.rebeccapurple", "レベッカパープル");
   P ("label.names.saturation_label.saturated", "彩度高め");
   P ("label.names.nearest_color_name.maroon", "マルーン");
   P ("label.names.nearest_color_name.purple", "紫");
   P ("label.names.hue_family_label.orange", "オレンジ");
   P ("label.names.nearest_color_name.olive", "オリーブ");
   P ("label.names.nearest_color_name.gray", "グレー");
   P ("label.names.saturation_label.desaturated", "彩度低め");
   P ("label.names.nearest_color_name.silver", "シルバー");
   P ("label.names.chroma_label.pastel", "パステル");
   P ("label.models.brightness_label.very_light", "とても明るい");
   P ("label.names.nearest_color_name.fuchsia", "フューシャ");
   P ("label.names.nearest_color_name.yellow", "黄");
   P ("label.names.nearest_color_name.red", "赤");
   P ("label.names.nearest_color_name.orange", "オレンジ");
   P ("label.names.nearest_color_name.white", "白");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number} 低コントラスト");
   P ("label.contrast.readability_label.low_readability", "可読性が低い");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}、不十分、明るい背景に暗い文字");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number} 低コントラスト");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}、不十分、明るい背景に暗い文字");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "全色盲：混同リスク中");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}% 大きな差");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number} 低コントラスト（アルファ合成後）");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}、不十分、暗い背景に明るい文字");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}、不十分、暗い背景に明るい文字");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "2型色覚：混同リスク高");
   P ("label.contrast.contrast_label.d_n_large_text_contrast",
      "{v1}:{v2, number} 大きな文字向けコントラスト");
   P ("label.contrast.readability_label.readable_for_large_text_only", "大きな文字のみ読みやすい");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, "
      & "number}、大きな文字向け、暗い背景に明るい文字");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number} 大きな文字向けコントラスト");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, "
      & "number}、大きな文字向け、暗い背景に明るい文字");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk", "3型色覚：混同リスク高");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} "
      & "大きな文字向けコントラスト（アルファ合成後）");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, "
      & "number}、非テキスト要素のみ、暗い背景に明るい文字");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, "
      & "number}、非テキスト要素のみ、暗い背景に明るい文字");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "3型色覚：混同リスク中");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number} 低コントラスト");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast",
      "{v1, number}:{v2, number} 低コントラスト");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, "
      & "number}、非テキスト要素のみ、明るい背景に暗い文字");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, "
      & "number}、非テキスト要素のみ、明るい背景に暗い文字");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "2型色覚：混同リスク中");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk", "1型色覚：混同リスク高");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}% 大きく異なる");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "全色盲：混同リスク高");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "全色盲：混同リスク低");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} "
      & "低コントラスト（アルファ合成後）");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast",
      "{v1}:{v2, number} 通常の文字向けコントラスト");
   P ("label.contrast.readability_label.readable_for_normal_text", "通常の文字で読みやすい");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}、本文向け、暗い背景に明るい文字");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number} 通常の文字向けコントラスト");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}、本文向け、暗い背景に明るい文字");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, "
      & "number}、大きな文字向け、明るい背景に暗い文字");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, "
      & "number}、大きな文字向け、明るい背景に暗い文字");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}% わずかな差");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}、本文向け、明るい背景に暗い文字");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}、本文向け、明るい背景に暗い文字");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk", "3型色覚：混同リスク低");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}% 目立つ差");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number} 大きな文字向けコントラスト");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} 大きな文字向けコントラスト");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "2型色覚：混同リスク低");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number} 強化コントラスト");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "強化基準で読みやすい");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast",
      "{v1}:{v2, number} 強化コントラスト");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab デルタ{v1, number}、わずかな知覚差");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "3型色覚：識別可能");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} "
      & "通常の文字向けコントラスト（アルファ合成後）");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "1型色覚：混同リスク中");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} "
      & "通常の文字向けコントラスト（アルファ合成後）");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} "
      & "大きな文字向けコントラスト（アルファ合成後）");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}、優秀、明るい背景に暗い文字");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}、優秀、明るい背景に暗い文字");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} 通常の文字向けコントラスト");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} 通常の文字向けコントラスト");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number} 強化コントラスト");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}、優秀、暗い背景に明るい文字");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} 強化コントラスト");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}、優秀、暗い背景に明るい文字");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "2型色覚：識別可能");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number} 強化コントラスト（アルファ合成後）");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab デルタ{v1, number}、かろうじて知覚可能");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}% ほぼ同一");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk", "1型色覚：混同リスク低");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "全色盲：識別可能");
   P ("label.palettes.palette_summary.n_colors", "{v1, number}色");
   P ("label.palettes.palette_summary.mostly_gray", "主にグレー");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "コントラスト幅中");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c",
      "背景{v1}、テキスト{v2}、アクセント{v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "トライアド配色");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "最高コントラスト：{v2}上の{v1}、{v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v2, number}ペア中{v1, "
      & "number}ペアが通常の文字のコントラストに合格");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v5, number}ペア中：強化{v1, number}、通常{v2, "
      & "number}、大きな文字のみ{v3, number}、不合格{v4, number}");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, number}色、{v2, number}ペア：強化{v3, number}、通常{v4, "
      & "number}、大きな文字のみ{v5, number}、不合格{v6, number}");
   P ("label.palettes.palette_mood_label.balanced", "バランス");
   P ("label.palettes.palette_mood_label.vibrant", "鮮やか");
   P ("label.palettes.palette_mood_label.warm_mood", "暖かい雰囲気");
   P ("label.palettes.palette_summary.mostly_blue", "主に青");
   P ("label.palettes.palette_summary.low_contrast_spread", "コントラスト幅小");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "シングルアクセント配色");
   P ("label.palettes.palette_mood_label.dark", "ダーク");
   P ("label.palettes.palette_mood_label.cool_mood", "涼しげな雰囲気");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "主にレベッカパープル");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs",
      "アクセシブルなテキストペアなし");
   P ("label.palettes.palette_mood_label.subtle", "控えめ");
   P ("label.palettes.palette_summary.high_contrast_spread", "コントラスト幅大");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "最高コントラスト：{v2}上の{v1}、{v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "ニュートラルな雰囲気");
   P ("label.palettes.palette_summary.mostly_purple", "主に紫");
   P ("label.palettes.palette_harmony_label.complementary_palette", "補色配色");
   P ("label.palettes.palette_summary.mostly_green", "主に緑");
   P ("label.palettes.palette_mood_label.moderate", "穏やか");
   P ("label.palettes.palette_summary.mostly_silver", "主にシルバー");
   P ("label.palettes.palette_harmony_label.varied_palette", "多彩な配色");
   P ("label.palettes.palette_summary.mostly_olive", "主にオリーブ");
   P ("label.palettes.palette_harmony_label.analogous_palette", "類似色配色");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v2, number}ペア中{v1, number}ペアが大きな文字のみ合格");
   P ("label.palettes.palette_mood_label.light", "ライト");
   P ("label.palettes.palette_summary.mostly_teal", "主にティール");
   P ("label.palettes.palette_summary.mostly_aqua", "主にアクア");
   P ("label.palettes.palette_summary.mostly_lime", "主にライム");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "モノクロ配色");
   P ("label.palettes.palette_summary.mostly_black", "主に黒");
   P ("label.palettes.palette_summary.mostly_yellow", "主に黄");
   P ("label.palettes.palette_summary.mostly_maroon", "主にマルーン");
   P ("label.palettes.palette_summary.mostly_white", "主に白");
   P ("label.palettes.palette_summary.mostly_orange", "主にオレンジ");
   P ("label.palettes.palette_summary.mostly_fuchsia", "主にフューシャ");
   P ("label.palettes.palette_harmony_label.neutral_palette", "ニュートラル配色");
   P ("label.palettes.palette_summary.mostly_red", "主に赤");
   P ("label.metrics.word_count_summary.n_words", "{v1, number}語");
   P ("label.metrics.sentence_count_summary.n_sentences", "{v1, number}文");
   P ("label.metrics.paragraph_count_summary.n_paragraphs", "{v1, number}段落");
   P ("label.metrics.reading_time.n_minutes_read", "読了時間{v1, number}分");
   P ("label.metrics.speaking_time.n_minutes_spoken", "発話時間{v1, number}分");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, number}語");
   P ("label.metrics.text_summary_with_options.n_sentences", "{v1, number}文");
   P ("label.metrics.text_summary_with_options.n_paragraphs", "{v1, number}段落");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "読了時間{v1, number}分");
   P ("label.metrics.paragraph_count_summary.n_paragraph", "{v1, number}段落");
   P ("label.metrics.reading_time.less_than_n_minute_read", "読了時間{v1, number}分未満");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "発話時間{v1, number}分未満");
   P ("label.metrics.text_summary_with_options.n_paragraph", "{v1, number}段落");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "読了時間{v1, number}分未満");
   P ("label.metrics.sentence_count_summary.n_sentence", "{v1, number}文");
   P ("label.metrics.text_summary_with_options.n_sentence", "{v1, number}文");
   P ("label.metrics.word_count_summary.no_words", "単語なし");
   P ("label.metrics.sentence_count_summary.no_sentences", "文なし");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "段落なし");
   P ("label.metrics.text_summary_with_options.no_words", "単語なし");
   P ("label.metrics.text_summary_with_options.no_sentences", "文なし");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "段落なし");
   P ("label.metrics.word_count_summary.n_word", "{v1, number}語");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, number}語");
end Labels_3;
