separate (Humanize.Catalogs.Phrase_Data.Locale_Pt_Pt)
procedure Labels_2 is
begin
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, apenas elementos não textuais, texto escuro sobre "
      & "fundo claro");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, apenas elementos não textuais, texto escuro sobre "
      & "fundo claro");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}%, diferença subtil");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}%, diferença percetível");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number}, contraste melhorado");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "legível com contraste melhorado");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number}, contraste melhorado");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, diferença percetual subtil");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number}, contraste melhorado");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number}, contraste melhorado");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contraste melhorado após a composição alfa");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, pouco percetível");
   P ("label.palettes.palette_summary.mostly_gray", "predominantemente cinzento");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} de {v2, plural, one {{v2, number} par} many {{v2, number} "
      & "de pares} other {{v2, number} pares}} {v1, plural, one {cumpre} other "
      & "{cumprem}} o contraste para texto normal");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v5, plural, one {{v5, number} par} many {{v5, number} de pares} other "
      & "{{v5, number} pares}}: melhorado {v1, number}, normal {v2, number}, "
      & "apenas texto grande {v3, number}, reprovado {v4, number}");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {{v1, number} cor} many {{v1, number} de cores} other "
      & "{{v1, number} cores}}, {v2, plural, one {{v2, number} par} many {{v2, "
      & "number} de pares} other {{v2, number} pares}}: melhorado {v3, number}, "
      & "normal {v4, number}, apenas texto grande {v5, number}, reprovado {v6, "
      & "number}");
   P ("label.palettes.palette_mood_label.subtle", "subtil");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} de {v2, plural, one {{v2, number} par} many {{v2, number} "
      & "de pares} other {{v2, number} pares}} {v1, plural, one {cumpre} other "
      & "{cumprem}} apenas o contraste para texto grande");
   P ("label.palettes.palette_summary.mostly_maroon", "predominantemente grená");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {nenhuma observação} "
      & "sample_too_small_shape {amostra pequena demais para descrever a forma, "
      & "{count, plural, one {{count, number} observação} many {{count, "
      & "number} de observações} other {{count, number} observações}}} "
      & "flat_shape {distribuição plana em {median}} outlier_heavy_shape "
      & "{distribuição com muitos valores atípicos em torno de {median}} "
      & "volatile_shape {distribuição volátil em torno de {median}} "
      & "clustered_shape {distribuição agrupada em torno de {median}} "
      & "wide_spread_shape {distribuição muito dispersa} wide_spread_range "
      & "{distribuição muito dispersa de {minimum} a {maximum}} "
      & "right_skewed_shape {distribuição assimétrica à direita, mediana "
      & "{median}} left_skewed_shape {distribuição assimétrica à esquerda, "
      & "mediana {median}} other {distribuição maioritariamente equilibrada "
      & "em torno de {median}}}");
   P ("label.resources.utilization_label",
      "{used, number} de {total, number} {unit} em utilização ({percent}, "
      & "{band})");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {conteúdo de texto} html_content "
      & "{documento HTML} json_content {documento JSON} xml_content {documento "
      & "XML} image_content {conteúdo de imagem} audio_content {conteúdo de "
      & "áudio} video_content {conteúdo de vídeo} font_content {conteúdo de "
      & "fonte} archive_content {conteúdo de arquivo comprimido} "
      & "binary_content {conteúdo binário} form_content {envio de "
      & "formulário} other {conteúdo desconhecido}} ({base})");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label}: não definido} redacted {{label}: "
      & "ocultado} url_redacted {URL ocultada} ip_redacted {endereço IP "
      & "ocultado} path_ending {caminho de ficheiro com final {shown}} at "
      & "{{label} em {shown}} audit {{label}, comprimento {length, number}, com "
      & "final {shown}} debug {{label} {shown}} other {{label} com final "
      & "{shown}}}");
   P ("label.schema.field_label",
      "campo {name} do tipo {kind, select, string_field {string} "
      & "integer_field {inteiro} decimal_field {decimal} boolean_field "
      & "{booleano} date_field {data} date_time_field {data e hora} "
      & "object_field {objeto} array_field {array} enum_field {enumeração} "
      & "binary_field {binário} null_field {nulo} any_field {qualquer} other "
      & "{desconhecido}}: {state, select, deprecated_field {obsoleto, } "
      & "unknown_field {desconhecido, } read_only_field {só de leitura, } "
      & "write_only_field {só de escrita, } computed_field {calculado, } other "
      & "{}}{presence, select, required_field {obrigatório} optional_field "
      & "{opcional} conditional_field {condicional} other {presença "
      & "desconhecida}}{nullable, select, non_nullable {, não nulo} nullable "
      & "{, aceita nulo} other {}}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {botão} link_control {link} tab_control "
      & "{separador} menu_item_control {item de menu} checkbox_control {caixa "
      & "de verificação} radio_control {botão de opção} text_field_control "
      & "{campo de texto} progress_control {barra de progresso} "
      & "table_cell_control {célula de tabela} region_control {região} other "
      & "{controlo}} {named, select, no {sem nome} other {{name}}}");
   P ("label.endpoints.url_label.redacted_user", "[utilizador ocultado]");
end Labels_2;
