separate (Humanize.Catalogs.Phrase_Data.Locale_Pt)
procedure Labels_4 is
begin
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
      "{v5, plural, one {{v5, number} par} many {{v5, number} de pares} other "
      & "{{v5, number} pares}}: aprimorado {v1, number}, normal {v2, number}, "
      & "somente texto grande {v3, number}, reprovado {v4, number}");
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
      & "mediana {median}} other {distribuição majoritariamente equilibrada "
      & "em torno de {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {e-mail vazio} address {endereço de e-mail} "
      & "other {e-mail em {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {número de telefone} redacted {número de "
      & "telefone ocultado} other {telefone com final {digits}}}");
   P ("label.privacy.safe_handle_label", "{state, select, none {identificador} other {identificador {shown}}}");
   P ("label.privacy.code_symbol_label",
      "{state, select, none {símbolo de código} other {símbolo de código "
      & "{symbol}}}");
   P ("label.privacy.address_metadata_label",
      "metadados de endereço: {present, plural, =0 {nenhum campo presente} "
      & "one {{present, number} campo presente} many {{present, number} de "
      & "campos presentes} other {{present, number} campos presentes}}, "
      & "{missing, plural, =0 {nenhum campo ausente} one {{missing, number} "
      & "campo ausente} many {{missing, number} de campos ausentes} other "
      & "{{missing, number} campos ausentes}}");
   P ("label.endpoints.host_label", "{state, select, none {host desconhecido} other {{host} ({kind})}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {endpoint desconhecido} other {endpoint "
      & "{scheme}{host}{port} ({kind})}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {URL vazia} none {URL sem componentes "
      & "reconhecidos} other {URL com {count, plural, one {{count, number} "
      & "componente} many {{count, number} de componentes} other {{count, "
      & "number} componentes}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {nenhum parâmetro de consulta} one {{count, "
      & "number} parâmetro de consulta} many {{count, number} de parâmetros "
      & "de consulta} other {{count, number} parâmetros de consulta}}");
   P ("label.endpoints.ip_address_label",
      "{address}: {kind, select, ipv4_host {endereço IPv4 público} "
      & "ipv6_host {endereço IPv6 público} private_network_host {endereço de "
      & "rede privada} localhost_host {host local} other {não é um endereço "
      & "IP}}");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr}: CIDR inválido} other {{cidr}: "
      & "{kind}, prefixo de rede {prefix}}}");
   P ("label.resources.utilization_label", "{used, number} de {total, number} {unit} em uso ({percent}, {band})");
   P ("label.resources.saturation_label", "{named, select, no {recurso} other {{name}}}: {percent}, {band}");
   P ("label.versions.version_label",
      "{state, select, both {versão {version}, pré-lançamento "
      & "{prerelease}, build {build}} prerelease {versão {version}, "
      & "pré-lançamento {prerelease}} build {versão {version}, build "
      & "{build}} other {versão {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {mesma versão} major_upgrade "
      & "{atualização principal} minor_upgrade {atualização secundária} "
      & "patch_upgrade {atualização de patch} prerelease_change {mudança de "
      & "pré-lançamento} build_metadata_change {mudança de metadados de "
      & "build} downgrade {downgrade} other {mudança de versão "
      & "desconhecida}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {exatamente a versão {version}} "
      & "minimum_range {versão {version} ou mais recente} maximum_range "
      & "{versão {version} ou mais antiga} major_compatible_range {compatível "
      & "com a versão principal {version}} minor_compatible_range {compatível "
      & "com a versão secundária {version}} other {intervalo de versões "
      & "{version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {versão inicial de desenvolvimento {version}} "
      & "prerelease {pré-lançamento {version}} major {versão principal "
      & "{version}} minor {versão secundária {version}} other {versão de "
      & "patch {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {tag de link} image {tag de imagem} paragraph {tag "
      & "de parágrafo} ordered_list {tag de lista ordenada} unordered_list "
      & "{tag de lista não ordenada} list_item {tag de item de lista} "
      & "table_header_cell {tag de célula de cabeçalho de tabela} table_cell "
      & "{tag de célula de tabela} table_row {tag de linha de tabela} "
      & "line_break {tag de quebra de linha} thematic_break {tag de quebra "
      & "temática} heading_level_n {tag de título de nível {level, number}} "
      & "other {tag {name}}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {atributo {name}} event {atributo de manipulador "
      & "de eventos {name}} other {atributo {name} definido como "
      & "“{value}”}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {conteúdo de texto} html_content "
      & "{documento HTML} json_content {documento JSON} xml_content {documento "
      & "XML} image_content {conteúdo de imagem} audio_content {conteúdo de "
      & "áudio} video_content {conteúdo de vídeo} font_content {conteúdo de "
      & "fonte} archive_content {conteúdo de arquivo compactado} "
      & "binary_content {conteúdo binário} form_content {envio de "
      & "formulário} other {conteúdo desconhecido}} ({base})");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind}: sem valor} hidden_value {{kind}: valor "
      & "oculto} masked_value {{kind} {shown}} fingerprint_only {{kind}, "
      & "impressão digital com final {shown}} other {{kind} com final "
      & "{shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} ({kind}): sem valor} other {{name} "
      & "({kind}) com final {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {cabeçalho de credencial {name}: sem valor} "
      & "other {{name} ({kind}) com final {shown}}}");
   P ("label.secrets.fingerprint_label", "impressão digital {algorithm} com final {shown}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label}: não definido} redacted {{label}: "
      & "ocultado} url_redacted {URL ocultada} ip_redacted {endereço IP "
      & "ocultado} path_ending {caminho de arquivo com final {shown}} at "
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
      & "unknown_field {desconhecido, } read_only_field {somente leitura, } "
      & "write_only_field {somente gravação, } computed_field {calculado, } "
      & "other {}}{presence, select, required_field {obrigatório} "
      & "optional_field {opcional} conditional_field {condicional} other "
      & "{presença desconhecida}}{nullable, select, non_nullable {, não nulo} "
      & "nullable {, aceita nulo} other {}}");
   P ("label.schema.schema_summary_label.fields",
      "{count, plural, one {{count, number} campo} many {{count, number} de "
      & "campos} other {{count, number} campos}}");
   P ("label.schema.schema_summary_label.required",
      "{count, plural, one {{count, number} obrigatório} many {{count, "
      & "number} obrigatórios} other {{count, number} obrigatórios}}");
   P ("label.schema.schema_summary_label.optional",
      "{count, plural, one {{count, number} opcional} many {{count, number} "
      & "opcionais} other {{count, number} opcionais}}");
   P ("label.schema.schema_summary_label.deprecated",
      "{count, plural, one {{count, number} obsoleto} many {{count, number} "
      & "obsoletos} other {{count, number} obsoletos}}");
   P ("label.schema.schema_summary_label.unknown",
      "{count, plural, one {{count, number} desconhecido} many {{count, "
      & "number} desconhecidos} other {{count, number} desconhecidos}}");
   P ("label.diagnostics.check_run_summary_label.none", "nenhuma verificação executada");
   P ("label.diagnostics.check_run_summary_label.passed",
      "{count, plural, one {{count, number} aprovada} many {{count, number} "
      & "aprovadas} other {{count, number} aprovadas}}");
   P ("label.diagnostics.check_run_summary_label.failed",
      "{count, plural, one {{count, number} com falha} many {{count, number} "
      & "com falha} other {{count, number} com falha}}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {{count, number} aviso} many {{count, number} de "
      & "avisos} other {{count, number} avisos}}");
   P ("label.diagnostics.check_run_summary_label.skipped",
      "{count, plural, one {{count, number} ignorada} many {{count, number} "
      & "ignoradas} other {{count, number} ignoradas}}");
   P ("label.diagnostics.check_run_summary_label.pending",
      "{count, plural, one {{count, number} pendente} many {{count, number} "
      & "pendentes} other {{count, number} pendentes}}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {{count, number} item} many {{count, number} de "
      & "itens} other {{count, number} itens}}");
   P ("label.workflows.workflow_summary_label.completed",
      "{count, plural, one {{count, number} concluído} many {{count, number} "
      & "concluídos} other {{count, number} concluídos}}");
   P ("label.workflows.workflow_summary_label.active",
      "{count, plural, one {{count, number} ativo} many {{count, number} "
      & "ativos} other {{count, number} ativos}}");
   P ("label.workflows.workflow_summary_label.blocked",
      "{count, plural, one {{count, number} bloqueado} many {{count, number} "
      & "bloqueados} other {{count, number} bloqueados}}");
   P ("label.workflows.workflow_summary_label.failed",
      "{count, plural, one {{count, number} com falha} many {{count, number} "
      & "com falha} other {{count, number} com falha}}");
   P ("label.workflows.workflow_summary_label.skipped",
      "{count, plural, one {{count, number} ignorado} many {{count, number} "
      & "ignorados} other {{count, number} ignorados}}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {{count, number} item} many {{count, number} de "
      & "itens} other {{count, number} itens}}");
   P ("label.changes.change_summary_label.added",
      "{count, plural, one {{count, number} adicionado} many {{count, number} "
      & "adicionados} other {{count, number} adicionados}}");
   P ("label.changes.change_summary_label.removed",
      "{count, plural, one {{count, number} removido} many {{count, number} "
      & "removidos} other {{count, number} removidos}}");
   P ("label.changes.change_summary_label.modified",
      "{count, plural, one {{count, number} alterado} many {{count, number} "
      & "alterados} other {{count, number} alterados}}");
   P ("label.changes.change_summary_label.renamed",
      "{count, plural, one {{count, number} renomeado} many {{count, number} "
      & "renomeados} other {{count, number} renomeados}}");
   P ("label.changes.change_summary_label.unchanged",
      "{count, plural, one {{count, number} inalterado} many {{count, number} "
      & "inalterados} other {{count, number} inalterados}}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {botão} link_control {link} tab_control "
      & "{guia} menu_item_control {item de menu} checkbox_control {caixa de "
      & "seleção} radio_control {botão de opção} text_field_control {campo "
      & "de texto} progress_control {barra de progresso} table_cell_control "
      & "{célula de tabela} region_control {região} other {controle}} {named, "
      & "select, no {sem nome} other {{name}}}");
   P ("label.markup.accessible_control_label.selected", "selecionado");
   P ("label.markup.accessible_control_label.expanded", "expandido");
   P ("label.markup.accessible_control_label.current", "atual");
   P ("label.markup.accessible_control_label.disabled", "desativado");
   P ("label.markup.accessible_control_label.required", "obrigatório");
   P ("label.markup.accessible_control_label.invalid", "inválido");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {{count, number} item} many {{count, number} de "
      & "itens} other {{count, number} itens}}");
   P ("label.markup.accessible_control_label.position", "item {position} de {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {{count, number} problema} many {{count, number} "
      & "de problemas} other {{count, number} problemas}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "esquema");
   P ("label.endpoints.url_component.host", "host");
   P ("label.endpoints.url_component.path", "caminho");
   P ("label.endpoints.url_component.query", "consulta");
   P ("label.endpoints.url_component.fragment", "fragmento");
   P ("label.names.hue_noun.red", "vermelho");
   P ("label.names.hue_noun.orange", "laranja");
   P ("label.names.hue_noun.yellow", "amarelo");
   P ("label.names.hue_noun.green", "verde");
   P ("label.names.hue_noun.cyan", "ciano");
   P ("label.names.hue_noun.blue", "azul");
   P ("label.names.hue_noun.purple", "roxo");
   P ("label.names.hue_noun.magenta", "magenta");
   P ("label.names.hue_noun.neutral", "neutro");
   P ("label.names.hue_noun.pink", "rosa");
   P ("label.names.hue_gender.red", "masculine");
   P ("label.names.hue_gender.orange", "masculine");
   P ("label.names.hue_gender.yellow", "masculine");
   P ("label.names.hue_gender.green", "masculine");
   P ("label.names.hue_gender.cyan", "masculine");
   P ("label.names.hue_gender.blue", "masculine");
   P ("label.names.hue_gender.purple", "masculine");
   P ("label.names.hue_gender.magenta", "masculine");
   P ("label.names.hue_gender.neutral", "masculine");
   P ("label.names.hue_gender.pink", "masculine");
   P ("label.names.agree.very_dark",
      "{gender, select, masculine {muito escuro} feminine {muito escura} "
      & "other {muito escuro}}");
   P ("label.names.agree.dark", "{gender, select, masculine {escuro} feminine {escura} other {escuro}}");
   P ("label.names.agree.medium_brightness",
      "{gender, select, masculine {de luminosidade média} feminine {de "
      & "luminosidade média} other {de luminosidade média}}");
   P ("label.names.agree.light", "{gender, select, masculine {claro} feminine {clara} other {claro}}");
   P ("label.names.agree.very_light",
      "{gender, select, masculine {muito claro} feminine {muito clara} other "
      & "{muito claro}}");
   P ("label.names.agree.desaturated",
      "{gender, select, masculine {dessaturado} feminine {dessaturada} other "
      & "{dessaturado}}");
   P ("label.names.agree.muted",
      "{gender, select, masculine {apagado} feminine {apagada} other "
      & "{apagado}}");
   P ("label.names.agree.neutral", "{gender, select, masculine {neutro} feminine {neutra} other {neutro}}");
   P ("label.names.agree.saturated",
      "{gender, select, masculine {saturado} feminine {saturada} other "
      & "{saturado}}");
   P ("label.names.agree.vivid",
      "{gender, select, masculine {vívido} feminine {vívida} other "
      & "{vívido}}");
   P ("label.names.agree.grayish",
      "{gender, select, masculine {acinzentado} feminine {acinzentada} other "
      & "{acinzentado}}");
   P ("label.names.agree.soft", "{gender, select, masculine {suave} feminine {suave} other {suave}}");
   P ("label.names.agree.moderate_chroma",
      "{gender, select, masculine {de croma moderado} feminine {de croma "
      & "moderado} other {de croma moderado}}");
   P ("label.names.agree.high_chroma",
      "{gender, select, masculine {de croma alto} feminine {de croma alto} "
      & "other {de croma alto}}");
   P ("label.names.agree.pastel", "{gender, select, masculine {pastel} feminine {pastel} other {pastel}}");
   P ("label.names.agree.warm", "{gender, select, masculine {quente} feminine {quente} other {quente}}");
   P ("label.names.agree.cool", "{gender, select, masculine {frio} feminine {fria} other {frio}}");
   P ("label.names.agree.neutral_temperature",
      "{gender, select, masculine {de temperatura neutra} feminine {de "
      & "temperatura neutra} other {de temperatura neutra}}");
   P ("label.names.agree.balanced_temperature",
      "{gender, select, masculine {de temperatura equilibrada} feminine {de "
      & "temperatura equilibrada} other {de temperatura equilibrada}}");
   P ("label.names.color_description", "{hue} {brightness} {saturation}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{base, select, pink {{hue}} other {{hue}}} {brightness} {chroma} "
      & "{temperature}");
   P ("label.endpoints.url_label", "{state, select, empty {URL vazia} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {URL vazia} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[usuário ocultado]");
   P ("label.endpoints.url_label.query",
      "consulta {count, plural, one {{count, number} parâmetro} many "
      & "{{count, number} de parâmetros} other {{count, number} parâmetros}}");
end Labels_4;
