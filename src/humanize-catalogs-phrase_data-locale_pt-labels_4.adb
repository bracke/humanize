separate (Humanize.Catalogs.Phrase_Data.Locale_Pt)
procedure Labels_4 is
begin
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contraste para texto normal após a composição "
      & "alfa");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, contraste para texto grande após a "
      & "composição alfa");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, excelente, texto escuro sobre fundo claro");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, excelente, texto escuro sobre fundo claro");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, contraste para texto normal");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, contraste para texto normal");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number}, contraste aprimorado");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, excelente, texto claro sobre fundo escuro");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number}, contraste aprimorado");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, excelente, texto claro sobre fundo escuro");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopia: cores distinguíveis");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contraste aprimorado após a composição alfa");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, pouco perceptível");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}%, quase idêntico");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopia: risco de confusão baixo");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "acromatopsia: cores distinguíveis");
   P ("label.palettes.palette_summary.n_colors",
      "{v1, plural, one {{v1, number} cor} many {{v1, number} de cores} other "
      & "{{v1, number} cores}}");
   P ("label.palettes.palette_summary.mostly_gray", "predominantemente cinza");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "amplitude de contraste moderada");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "fundo {v1}, texto {v2}, destaque {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "paleta triádica");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "melhor contraste: {v1} sobre {v2} ({v3}:{v4, number})");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} de {v2, plural, one {{v2, number} par} many {{v2, number} "
      & "de pares} other {{v2, number} pares}} {v1, plural, one {atende} other "
      & "{atendem}} ao contraste para texto normal");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "aprimorado {v1, number}, normal {v2, number}, somente texto grande "
      & "{v3, number}, reprovado {v4, number}, de {v5, plural, one {{v5, "
      & "number} par} many {{v5, number} de pares} other {{v5, number} pares}}");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {{v1, number} cor} many {{v1, number} de cores} other "
      & "{{v1, number} cores}}, {v2, plural, one {{v2, number} par} many {{v2, "
      & "number} de pares} other {{v2, number} pares}}: aprimorado {v3, "
      & "number}, normal {v4, number}, somente texto grande {v5, number}, "
      & "reprovado {v6, number}");
   P ("label.palettes.palette_mood_label.balanced", "equilibrada");
   P ("label.palettes.palette_mood_label.vibrant", "vibrante");
   P ("label.palettes.palette_mood_label.warm_mood", "tom quente");
   P ("label.palettes.palette_summary.mostly_blue", "predominantemente azul");
   P ("label.palettes.palette_summary.low_contrast_spread", "amplitude de contraste baixa");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "paleta de destaque único");
   P ("label.palettes.palette_mood_label.dark", "escura");
   P ("label.palettes.palette_mood_label.cool_mood", "tom frio");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "predominantemente rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "nenhum par de texto acessível");
   P ("label.palettes.palette_mood_label.subtle", "sutil");
   P ("label.palettes.palette_summary.high_contrast_spread", "amplitude de contraste alta");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "melhor contraste: {v1} sobre {v2} ({v3, number}:{v4, number})");
   P ("label.palettes.palette_mood_label.neutral_mood", "tom neutro");
   P ("label.palettes.palette_summary.mostly_purple", "predominantemente púrpura");
   P ("label.palettes.palette_harmony_label.complementary_palette", "paleta complementar");
   P ("label.palettes.palette_summary.mostly_green", "predominantemente verde");
   P ("label.palettes.palette_mood_label.moderate", "moderada");
   P ("label.palettes.palette_summary.mostly_silver", "predominantemente prata");
   P ("label.palettes.palette_harmony_label.varied_palette", "paleta variada");
   P ("label.palettes.palette_summary.mostly_olive", "predominantemente verde-oliva");
   P ("label.palettes.palette_harmony_label.analogous_palette", "paleta análoga");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} de {v2, plural, one {{v2, number} par} many {{v2, number} "
      & "de pares} other {{v2, number} pares}} {v1, plural, one {atende} other "
      & "{atendem}} somente ao contraste para texto grande");
   P ("label.palettes.palette_mood_label.light", "clara");
   P ("label.palettes.palette_summary.mostly_teal", "predominantemente azul-petróleo");
   P ("label.palettes.palette_summary.mostly_aqua", "predominantemente água");
   P ("label.palettes.palette_summary.mostly_lime", "predominantemente verde-limão");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "paleta monocromática");
   P ("label.palettes.palette_summary.mostly_black", "predominantemente preto");
   P ("label.palettes.palette_summary.mostly_yellow", "predominantemente amarelo");
   P ("label.palettes.palette_summary.mostly_maroon", "predominantemente bordô");
   P ("label.palettes.palette_summary.mostly_white", "predominantemente branco");
   P ("label.palettes.palette_summary.mostly_orange", "predominantemente laranja");
   P ("label.palettes.palette_summary.mostly_fuchsia", "predominantemente fúcsia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "paleta neutra");
   P ("label.palettes.palette_summary.mostly_red", "predominantemente vermelho");
   P ("label.metrics.word_count_summary.n_words",
      "{v1, plural, one {{v1, number} palavra} many {{v1, number} de "
      & "palavras} other {{v1, number} palavras}}");
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {{v1, number} frase} many {{v1, number} de frases} "
      & "other {{v1, number} frases}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} parágrafo} many {{v1, number} de "
      & "parágrafos} other {{v1, number} parágrafos}}");
   P ("label.metrics.reading_time.n_minutes_read",
      "{v1, plural, one {{v1, number} minuto de leitura} many {{v1, number} "
      & "de minutos de leitura} other {{v1, number} minutos de leitura}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "{v1, plural, one {{v1, number} minuto de fala} many {{v1, number} de "
      & "minutos de fala} other {{v1, number} minutos de fala}}");
   P ("label.metrics.text_summary_with_options.n_words",
      "{v1, plural, one {{v1, number} palavra} many {{v1, number} de "
      & "palavras} other {{v1, number} palavras}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {{v1, number} frase} many {{v1, number} de frases} "
      & "other {{v1, number} frases}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {{v1, number} parágrafo} many {{v1, number} de "
      & "parágrafos} other {{v1, number} parágrafos}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "{v1, plural, one {{v1, number} minuto de leitura} many {{v1, number} "
      & "de minutos de leitura} other {{v1, number} minutos de leitura}}");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {{v1, number} parágrafo} many {{v1, number} de "
      & "parágrafos} other {{v1, number} parágrafos}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "{v1, plural, =1 {menos de um minuto de leitura} other {menos de {v1, "
      & "number} minutos de leitura}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "{v1, plural, =1 {menos de um minuto de fala} other {menos de {v1, "
      & "number} minutos de fala}}");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {{v1, number} parágrafo} many {{v1, number} de "
      & "parágrafos} other {{v1, number} parágrafos}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "{v1, plural, =1 {menos de um minuto de leitura} other {menos de {v1, "
      & "number} minutos de leitura}}");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {{v1, number} frase} many {{v1, number} de frases} "
      & "other {{v1, number} frases}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {{v1, number} frase} many {{v1, number} de frases} "
      & "other {{v1, number} frases}}");
   P ("label.metrics.word_count_summary.no_words", "nenhuma palavra");
   P ("label.metrics.sentence_count_summary.no_sentences", "nenhuma frase");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "nenhum parágrafo");
   P ("label.metrics.text_summary_with_options.no_words", "nenhuma palavra");
   P ("label.metrics.text_summary_with_options.no_sentences", "nenhuma frase");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "nenhum parágrafo");
   P ("label.metrics.word_count_summary.n_word",
      "{v1, plural, one {{v1, number} palavra} many {{v1, number} de "
      & "palavras} other {{v1, number} palavras}}");
   P ("label.metrics.text_summary_with_options.n_word",
      "{v1, plural, one {{v1, number} palavra} many {{v1, number} de "
      & "palavras} other {{v1, number} palavras}}");
end Labels_4;
