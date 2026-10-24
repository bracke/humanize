separate (Humanize.Catalogs.Phrase_Data.Locale_Pt)
procedure Labels_3 is
begin
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {abaixo do intervalo esperado} "
      & "within_range {dentro do intervalo esperado} above_range {acima do "
      & "intervalo esperado} below_target {abaixo da meta} at_target {na meta} "
      & "above_target {acima da meta} near_limit {próximo do limite} "
      & "warning_level {limiar de aviso} critical_level {limiar crítico} "
      & "breached {limiar ultrapassado} other {estado do limiar desconhecido}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {atualizado} one {{ahead, "
      & "number} commit à frente} many {{ahead, number} de commits à frente} "
      & "other {{ahead, number} commits à frente}}} other {{ahead, plural, =0 "
      & "{{behind, plural, one {{behind, number} commit atrás} many {{behind, "
      & "number} de commits atrás} other {{behind, number} commits atrás}}} "
      & "other {{ahead, plural, one {{ahead, number} commit à frente} many "
      & "{{ahead, number} de commits à frente} other {{ahead, number} commits "
      & "à frente}}, {behind, plural, one {{behind, number} commit atrás} "
      & "many {{behind, number} de commits atrás} other {{behind, number} "
      & "commits atrás}}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {aprovado por {approver}} other {aguardando "
      & "aprovação de {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {tentativa {attempt, "
      & "number} de {limit, number}} other {tentativa {attempt, number} de "
      & "{limit, number} (limite excedido)}}} other {tentativa {attempt, "
      & "number} de {limit, number}}}");
   P ("label.workflows.blocker_label", "bloqueado: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {nenhuma dependência bloqueadora} one {{count, "
      & "number} dependência bloqueadora} many {{count, number} de "
      & "dependências bloqueadoras} other {{count, number} dependências "
      & "bloqueadoras}}");
   P ("label.workflows.handoff_label", "transferência de {from} para {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {próximo marco} current_milestone "
      & "{marco atual} complete_milestone {marco concluído} missed_milestone "
      & "{marco perdido} other {marco bloqueado}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {próximo} "
      & "current_milestone {atual} complete_milestone {concluído} "
      & "missed_milestone {perdido} other {bloqueado}}");
   P ("label.workflows.next_action_label", "próxima ação: {action}");
   P ("label.workflows.owner_label", "responsável: {owner}");
   P ("label.workflows.resume_label", "retomar {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {pendente} active_step {ativa} "
      & "waiting_step {aguardando} blocked_step {bloqueada} done_step "
      & "{concluída} failed_step {com falha} other {ignorada}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {pendente} active_step {ativa} "
      & "waiting_step {aguardando} blocked_step {bloqueada} done_step "
      & "{concluída} failed_step {com falha} other {ignorada}}");
   P ("label.workflows.waiting_label", "aguardando {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {não iniciado} "
      & "in_progress_state {em andamento} waiting_state {aguardando} "
      & "waiting_approval_state {aguardando aprovação} blocked_state "
      & "{bloqueado} completed_state {concluído} failed_state {com falha} "
      & "cancelled_state {cancelado} skipped_state {ignorado} other {pausado}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {não iniciado} in_progress_state "
      & "{em andamento} waiting_state {aguardando} waiting_approval_state "
      & "{aguardando aprovação} blocked_state {bloqueado} completed_state "
      & "{concluído} failed_state {com falha} cancelled_state {cancelado} "
      & "skipped_state {ignorado} other {pausado}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {transparente} "
      & "mostly_transparent {quase transparente} translucent {translúcido} "
      & "mostly_opaque {quase opaco} other {opaco}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {nenhuma observação} one {{count, number} "
      & "observação, mín. {minimum} {unit}, mediana {median} {unit}, máx. "
      & "{maximum} {unit}} many {{count, number} de observações, mín. "
      & "{minimum} {unit}, mediana {median} {unit}, máx. {maximum} {unit}} "
      & "other {{count, number} observações, mín. {minimum} {unit}, mediana "
      & "{median} {unit}, máx. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {nenhuma observação} other "
      & "{0 valores atípicos em {total, plural, one {{total, number} "
      & "observação} many {{total, number} de observações} other {{total, "
      & "number} observações}}}}} one {{outliers, number} valor atípico em "
      & "{total, plural, one {{total, number} observação} many {{total, "
      & "number} de observações} other {{total, number} observações}}} many "
      & "{{outliers, number} de valores atípicos em {total, plural, one "
      & "{{total, number} observação} many {{total, number} de observações} "
      & "other {{total, number} observações}}} other {{outliers, number} "
      & "valores atípicos em {total, plural, one {{total, number} "
      & "observação} many {{total, number} de observações} other {{total, "
      & "number} observações}}}}");
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} acima da capacidade} "
      & "other {restam {count, number} de {total, number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {cota excedida em {count, number} {unit} "
      & "({percent} usado)} near {cota perto do limite: restam {count, number} "
      & "{unit} ({percent} usado)} other {cota disponível: restam {count, "
      & "number} {unit} ({percent} usado)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {taxa de acertos do cache indisponível: nenhuma "
      & "solicitação} other {taxa de acertos do cache {percent}: {hits, "
      & "plural, one {{hits, number} acerto} many {{hits, number} de acertos} "
      & "other {{hits, number} acertos}}, {misses, plural, one {{misses, "
      & "number} falha} many {{misses, number} de falhas} other {{misses, "
      & "number} falhas}}}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {{count, number} atributo} many {{count, number} "
      & "de atributos} other {{count, number} atributos}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {{count, number} atributo de dados} many {{count, "
      & "number} de atributos de dados} other {{count, number} atributos de "
      & "dados}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {{count, number} atributo ARIA} many {{count, "
      & "number} de atributos ARIA} other {{count, number} atributos ARIA}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {{count, number} manipulador de eventos} many "
      & "{{count, number} de manipuladores de eventos} other {{count, number} "
      & "manipuladores de eventos}}");
   P ("label.markup.heading_label", "título de nível {level, number}");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {{count, number} tag} many {{count, number} de "
      & "tags} other {{count, number} tags}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {{count, number} link} many {{count, number} de "
      & "links} other {{count, number} links}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} elemento de mídia} many {{count, "
      & "number} de elementos de mídia} other {{count, number} elementos de "
      & "mídia}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} controle de formulário} many "
      & "{{count, number} de controles de formulário} other {{count, number} "
      & "controles de formulário}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {{count, number} título} many {{count, number} de "
      & "títulos} other {{count, number} títulos}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {{count, number} ponto de referência} many "
      & "{{count, number} de pontos de referência} other {{count, number} "
      & "pontos de referência}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {{count, number} formulário} many {{count, "
      & "number} de formulários} other {{count, number} formulários}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} elemento de mídia} many {{count, "
      & "number} de elementos de mídia} other {{count, number} elementos de "
      & "mídia}}");
   P ("label.markup.table_navigation_label",
      "{caption} linha {row, number} de {rows, number}, coluna {column, "
      & "number} de {columns, number}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} segredo} many {{count, number} de "
      & "segredos} other {{count, number} segredos}}");
   P ("label.secrets.secret_count_label.masked",
      "{count, plural, one {{count, number} mascarado} many {{count, number} "
      & "mascarados} other {{count, number} mascarados}}");
   P ("label.secrets.secret_count_label.unset",
      "{count, plural, one {{count, number} não definido} many {{count, "
      & "number} não definidos} other {{count, number} não definidos}}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} impressão digital} many {{count, "
      & "number} de impressões digitais} other {{count, number} impressões "
      & "digitais}}");
   P ("label.schema.type_mismatch_label",
      "campo {field_name}: esperado {expected, select, string_field {string} "
      & "integer_field {inteiro} decimal_field {decimal} boolean_field "
      & "{booleano} date_field {data} date_time_field {data e hora} "
      & "object_field {objeto} array_field {array} enum_field {enumeração} "
      & "binary_field {binário} null_field {nulo} any_field {qualquer} other "
      & "{desconhecido}}, recebido {actual, select, string_field {string} "
      & "integer_field {inteiro} decimal_field {decimal} boolean_field "
      & "{booleano} date_field {data} date_time_field {data e hora} "
      & "object_field {objeto} array_field {array} enum_field {enumeração} "
      & "binary_field {binário} null_field {nulo} any_field {qualquer} other "
      & "{desconhecido}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} problema bloqueante} many {{blocking, number} de problemas "
      & "bloqueantes} other {{blocking, number} problemas bloqueantes}}} "
      & "blocking {{base}, {blocking, plural, one {{blocking, number} problema "
      & "bloqueante} many {{blocking, number} de problemas bloqueantes} other "
      & "{{blocking, number} problemas bloqueantes}}} only {somente {base}} "
      & "other {{base}}}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {intervalo-alvo de {low} a "
      & "{high}} other {janela-alvo de {low} a {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} dentro do intervalo esperado} below "
      & "{{value} abaixo do intervalo esperado} other {{value} acima do "
      & "intervalo esperado}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} no limiar crítico} warning {{value} "
      & "no limiar de aviso} other {{value} dentro do intervalo normal}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {não ultrapassado} other {ultrapassado em "
      & "{difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {na meta} below {{difference} abaixo da meta} other "
      & "{{difference} acima da meta}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {limite ultrapassado} near {próximo do "
      & "limite, restam {distance}} other {a {distance} do limite}}");
   P ("label.thresholds.threshold_summary_label.none", "nenhuma métrica");
   P ("label.thresholds.threshold_summary_label.normal",
      "{count, plural, one {{count, number} normal} many {{count, number} "
      & "normais} other {{count, number} normais}}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {{count, number} aviso} many {{count, number} de "
      & "avisos} other {{count, number} avisos}}");
   P ("label.thresholds.threshold_summary_label.critical",
      "{count, plural, one {{count, number} crítica} many {{count, number} "
      & "críticas} other {{count, number} críticas}}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {{count, number} violação} many {{count, number} "
      & "de violações} other {{count, number} violações}}");
   P ("label.thresholds.target_window_label", "meta {target} mais/menos {tolerance}");
   P ("label.thresholds.tolerance_label", "tolerância {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} do limite");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {limite excedido em {amount}} other {restam "
      & "{amount}}}");
   P ("label.thresholds.budget_used_label", "{used} usados de {budget}");
   P ("label.workflows.step_label", "etapa {current, number} de {total, number}: {name}");
   P ("label.workflows.milestone_label",
      "{current, number} de {total, plural, one {{total, number} marco "
      & "concluído} many {{total, number} de marcos concluídos} other "
      & "{{total, number} marcos concluídos}}: {name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {nenhum item de fluxo de trabalho} half {fluxo de "
      & "trabalho na metade} other {{completed, number} de {total, number} "
      & "concluídos}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {posição {position, number} na fila} other "
      & "{posição {position, number} de {total, number} na fila}}");
   P ("label.changes.change_set_label.none", "nenhuma alteração");
   P ("label.changes.change_set_label.added",
      "{count, plural, one {{count, number} adicionado} many {{count, number} "
      & "adicionados} other {{count, number} adicionados}}");
   P ("label.changes.change_set_label.removed",
      "{count, plural, one {{count, number} removido} many {{count, number} "
      & "removidos} other {{count, number} removidos}}");
   P ("label.changes.change_set_label.modified",
      "{count, plural, one {{count, number} alterado} many {{count, number} "
      & "alterados} other {{count, number} alterados}}");
   P ("label.changes.change_set_label.unchanged",
      "{count, plural, one {{count, number} inalterado} many {{count, number} "
      & "inalterados} other {{count, number} inalterados}}");
   P ("label.changes.sync_change_label.none", "nenhuma alteração de sincronização");
   P ("label.changes.sync_change_label.uploaded",
      "{count, plural, one {{count, number} enviado} many {{count, number} "
      & "enviados} other {{count, number} enviados}}");
   P ("label.changes.sync_change_label.downloaded",
      "{count, plural, one {{count, number} baixado} many {{count, number} "
      & "baixados} other {{count, number} baixados}}");
   P ("label.changes.sync_change_label.deleted",
      "{count, plural, one {{count, number} excluído} many {{count, number} "
      & "excluídos} other {{count, number} excluídos}}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} conflito} many {{count, number} "
      & "de conflitos} other {{count, number} conflitos}}");
   P ("label.changes.net_change_label",
      "{state, select, none {nenhuma variação líquida} up {variação "
      & "líquida: +{count, plural, one {{count, number} item} many {{count, "
      & "number} de itens} other {{count, number} itens}}} other {variação "
      & "líquida: -{count, plural, one {{count, number} item} many {{count, "
      & "number} de itens} other {{count, number} itens}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {nenhuma alteração para revisar} all {todas as "
      & "alterações revisadas} other {{reviewed, number} de {total, number} "
      & "alterações revisadas}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} inalterado em {new_value}} up "
      & "{{field_name} aumentou de {old_value} para {new_value}} other "
      & "{{field_name} diminuiu de {old_value} para {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {nenhuma linha selecionável} none {nenhuma "
      & "linha selecionada} all {{total, plural, one {{total, number} linha "
      & "selecionada} many {todas as {total, number} de linhas selecionadas} "
      & "other {todas as {total, number} linhas selecionadas}}} other "
      & "{{selected, number} de {total, plural, one {{total, number} linha "
      & "selecionada} many {{total, number} de linhas selecionadas} other "
      & "{{total, number} linhas selecionadas}}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {nenhuma página} other {{pages, plural, =0 {nenhuma "
      & "página} other {{rows, plural, =0 {página {page, number} de {pages, "
      & "number}} one {página {page, number} de {pages, number}, {rows, "
      & "number} linha} many {página {page, number} de {pages, number}, {rows, "
      & "number} de linhas} other {página {page, number} de {pages, number}, "
      & "{rows, number} linhas}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {nenhuma linha} none {nenhuma linha "
      & "corresponde} all {{total, plural, one {{total, number} linha visível} "
      & "many {todas as {total, number} de linhas visíveis} other {todas as "
      & "{total, number} linhas visíveis}}} other {{visible, number} de "
      & "{total, plural, one {{total, number} linha visível} many {{total, "
      & "number} de linhas visíveis} other {{total, number} linhas "
      & "visíveis}}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {nenhuma linha} single {linha {first_row, number} "
      & "de {total, number}} other {linhas {first_row, number}-{last_row, "
      & "number} de {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {sem limite de caracteres} none_left {nenhum "
      & "caractere restante} left {{count, plural, one {{count, number} "
      & "caractere restante} many {{count, number} de caracteres restantes} "
      & "other {{count, number} caracteres restantes}}} other {{count, plural, "
      & "one {{count, number} caractere acima do limite} many {{count, number} "
      & "de caracteres acima do limite} other {{count, number} caracteres acima "
      & "do limite}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {nenhum campo obrigatório} one {{missing, plural, "
      & "=0 {todos os campos obrigatórios preenchidos} other {falta 1 de 1 "
      & "campo obrigatório}}} other {{missing, plural, =0 {todos os campos "
      & "obrigatórios preenchidos} one {falta {missing, number} de {total, "
      & "number} campos obrigatórios} other {faltam {missing, number} de "
      & "{total, number} campos obrigatórios}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {nenhum campo} all {todos os campos preenchidos} "
      & "other {{completed, number} de {total, plural, one {{total, number} "
      & "campo preenchido} many {{total, number} de campos preenchidos} other "
      & "{{total, number} campos preenchidos}}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: nenhum campo} all {{name}: todos os "
      & "campos preenchidos} other {{name}: {completed, number} de {total, "
      & "plural, one {{total, number} campo preenchido} many {{total, number} "
      & "de campos preenchidos} other {{total, number} campos preenchidos}}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {nenhuma etapa do formulário} one {etapa 1 de 1: "
      & "{name}} other {etapa {current, number} de {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {trilha de navegação vazia} one {item 1 de 1 da "
      & "trilha de navegação: {name}} other {item {current, number} de "
      & "{total, number} da trilha de navegação: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {nenhuma guia} one {guia 1 de 1: {name}} other "
      & "{guia {current, number} de {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {caixa de entrada vazia} one {{unread, plural, =0 "
      & "{todas as notificações lidas} other {1 não lida de 1 "
      & "notificação}}} other {{unread, plural, =0 {todas as notificações "
      & "lidas} one {{unread, number} não lida de {total, number} "
      & "notificações} other {{unread, number} não lidas de {total, number} "
      & "notificações}}}}");
   P ("label.notifications.delivery_attempt_label",
      "tentativa de entrega {attempt, number} de {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {nenhum item na lista de verificação} one {{done, "
      & "plural, =0 {0 de 1 item concluído} other {1 de 1 item concluído}}} "
      & "other {{done, number} de {total, number} itens concluídos}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {nenhum upload} one {{done, plural, =0 {0 de 1 "
      & "upload concluído} other {1 de 1 upload concluído}}} other {{done, "
      & "number} de {total, number} uploads concluídos}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {sem vagas} one {{reserved, plural, =0 {0 de 1 "
      & "vaga reservada} other {1 de 1 vaga reservada}}} other {{reserved, "
      & "number} de {capacity, number} vagas reservadas}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {posição {position, number} na lista de espera} "
      & "other {posição {position, number} de {total, number} na lista de "
      & "espera}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} alterados} other {{name}: {changed, plural, one {{changed, "
      & "number} alterado} many {{changed, number} alterados} other {{changed, "
      & "number} alterados}}, {unchanged, plural, one {{unchanged, number} "
      & "inalterado} many {{unchanged, number} inalterados} other {{unchanged, "
      & "number} inalterados}}, {total, number} no total}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "o primeiro plano atual atende ao contraste de {v1}:{v2, number} (texto "
      & "grande)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "o primeiro plano atual atende ao contraste de {v1}:{v2, number} (texto "
      & "normal)");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "use {v1} para um contraste de {v2, number}:{v3, number} (nível "
      & "aprimorado)");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "use {v1} para um contraste de {v2, number}:{v3, number} (texto grande)");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "use {v1} para um contraste de {v2}:{v3, number} (texto normal)");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "use {v1} para um contraste de {v2}:{v3, number} (texto grande)");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "use {v1} para um contraste de {v2}:{v3, number} (nível aprimorado)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "o primeiro plano atual atende ao contraste de {v1, number}:{v2, "
      & "number} (texto grande)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "o primeiro plano atual atende ao contraste de {v1, number}:{v2, "
      & "number} (texto normal)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "o primeiro plano atual atende ao contraste de {v1}:{v2, number} "
      & "(nível aprimorado)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "o primeiro plano atual atende ao contraste de {v1, number}:{v2, "
      & "number} (nível aprimorado)");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopia: risco de confusão baixo, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopia: risco de confusão moderado, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopia: risco de confusão moderado, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "acromatopsia: risco de confusão alto, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, diferença perceptual drástica");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, diferença perceptual drástica");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 têxtil delta {v1}, diferença perceptual drástica");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, diferença perceptual drástica");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, diferença perceptual grande");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopia: risco de confusão moderado, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, diferença perceptual drástica");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, diferença perceptual drástica");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, diferença perceptual drástica");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "acromatopsia: risco de confusão baixo, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopia: cores distinguíveis, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopia: cores distinguíveis, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopia: cores distinguíveis, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "acromatopsia: cores distinguíveis, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "acromatopsia: risco de confusão moderado, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, diferença perceptual grande");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, diferença perceptual grande");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 têxtil delta {v1}, diferença perceptual grande");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, diferença perceptual grande");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, diferença perceptual visível");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopia: risco de confusão alto, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopia: risco de confusão alto, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, diferença perceptual visível");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 têxtil delta {v1}, diferença perceptual visível");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, diferença perceptual visível");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, diferença perceptual visível");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopia: risco de confusão baixo, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopia: risco de confusão baixo, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, diferença perceptual grande");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopia: risco de confusão alto, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, diferença perceptual drástica");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 têxtil delta {v1, number}, diferença perceptual drástica");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, diferença perceptual drástica");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, diferença perceptual grande");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 têxtil delta {v1, number}, diferença perceptual grande");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, diferença perceptual grande");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, diferença perceptual visível");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 têxtil delta {v1}, diferença perceptual sutil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, diferença perceptual visível");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 têxtil delta {v1, number}, diferença perceptual visível");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, pouco perceptível");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, imperceptível");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 têxtil delta {v1}, imperceptível");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, imperceptível");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, imperceptível");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, diferença perceptual grande");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, imperceptível");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, imperceptível");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 têxtil delta {v1, number}, imperceptível");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, imperceptível");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, imperceptível");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, diferença perceptual sutil");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, diferença perceptual sutil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, diferença perceptual sutil");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, pouco perceptível");
   P ("label.metrics.text_summary.n_words",
      "{v1, plural, one {{v1, number} palavra} many {{v1, number} de "
      & "palavras} other {{v1, number} palavras}}");
   P ("label.metrics.text_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} parágrafo} many {{v1, number} de "
      & "parágrafos} other {{v1, number} parágrafos}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "{v1, plural, one {{v1, number} minuto de fala} many {{v1, number} de "
      & "minutos de fala} other {{v1, number} minutos de fala}}");
   P ("label.metrics.text_summary.n_sentences",
      "{v1, plural, one {{v1, number} frase} many {{v1, number} de frases} "
      & "other {{v1, number} frases}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "{v1, plural, one {{v1, number} minuto de leitura} many {{v1, number} "
      & "de minutos de leitura} other {{v1, number} minutos de leitura}}");
   P ("label.metrics.text_summary.n_paragraph",
      "{v1, plural, one {{v1, number} parágrafo} many {{v1, number} de "
      & "parágrafos} other {{v1, number} parágrafos}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "{v1, plural, =1 {menos de um minuto de fala} other {menos de {v1, "
      & "number} minutos de fala}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "{v1, plural, =1 {menos de um minuto de leitura} other {menos de {v1, "
      & "number} minutos de leitura}}");
   P ("label.metrics.text_summary.n_sentence",
      "{v1, plural, one {{v1, number} frase} many {{v1, number} de frases} "
      & "other {{v1, number} frases}}");
   P ("label.metrics.text_summary.no_words", "nenhuma palavra");
   P ("label.metrics.text_summary.no_paragraphs", "nenhum parágrafo");
   P ("label.metrics.text_summary.no_sentences", "nenhuma frase");
   P ("label.metrics.text_summary.n_word",
      "{v1, plural, one {{v1, number} palavra} many {{v1, number} de "
      & "palavras} other {{v1, number} palavras}}");
   P ("label.names.hue_family_label.neutral", "neutro");
   P ("label.names.saturation_label.neutral", "neutro");
   P ("label.names.temperature_label.neutral_temperature", "temperatura neutra");
   P ("label.names.chroma_label.grayish", "acinzentado");
   P ("label.names.nearest_color_name.black", "preto");
   P ("label.models.brightness_label.very_dark", "muito escuro");
   P ("label.names.hue_family_label.blue", "azul");
   P ("label.names.saturation_label.vivid", "vívido");
   P ("label.names.temperature_label.cool", "frio");
   P ("label.names.chroma_label.moderate_chroma", "croma moderado");
   P ("label.names.nearest_color_name.navy", "azul-marinho");
   P ("label.names.chroma_label.high_chroma", "croma alto");
   P ("label.names.nearest_color_name.blue", "azul");
   P ("label.names.hue_family_label.green", "verde");
   P ("label.names.temperature_label.balanced_temperature", "temperatura equilibrada");
   P ("label.names.hue_family_label.cyan", "ciano");
   P ("label.names.chroma_label.soft", "suave");
   P ("label.models.brightness_label.dark", "escuro");
   P ("label.names.nearest_color_name.green", "verde");
   P ("label.names.nearest_color_name.teal", "azul-petróleo");
   P ("label.models.brightness_label.medium_brightness", "luminosidade média");
   P ("label.names.nearest_color_name.aqua", "água");
   P ("label.names.nearest_color_name.lime", "verde-limão");
   P ("label.models.brightness_label.light", "claro");
   P ("label.names.hue_family_label.red", "vermelho");
   P ("label.names.temperature_label.warm", "quente");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "roxo");
   P ("label.names.hue_family_label.yellow", "amarelo");
   P ("label.names.saturation_label.muted", "apagado");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "saturado");
   P ("label.names.nearest_color_name.maroon", "bordô");
   P ("label.names.nearest_color_name.purple", "púrpura");
   P ("label.names.hue_family_label.orange", "laranja");
   P ("label.names.nearest_color_name.olive", "verde-oliva");
   P ("label.names.nearest_color_name.gray", "cinza");
   P ("label.names.saturation_label.desaturated", "dessaturado");
   P ("label.names.nearest_color_name.silver", "prata");
   P ("label.names.chroma_label.pastel", "pastel");
   P ("label.models.brightness_label.very_light", "muito claro");
   P ("label.names.nearest_color_name.fuchsia", "fúcsia");
   P ("label.names.nearest_color_name.yellow", "amarelo");
   P ("label.names.nearest_color_name.red", "vermelho");
   P ("label.names.nearest_color_name.orange", "laranja");
   P ("label.names.nearest_color_name.white", "branco");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number}, contraste baixo");
   P ("label.contrast.readability_label.low_readability", "legibilidade baixa");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, insuficiente, texto escuro sobre fundo claro");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number}, contraste baixo");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, insuficiente, texto escuro sobre fundo claro");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "acromatopsia: risco de confusão moderado");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}%, diferença forte");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contraste baixo após a composição alfa");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, insuficiente, texto claro sobre fundo escuro");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, insuficiente, texto claro sobre fundo escuro");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopia: risco de confusão alto");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number}, contraste para texto grande");
   P ("label.contrast.readability_label.readable_for_large_text_only", "legível somente para texto grande");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, texto grande, texto claro sobre fundo escuro");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number}, contraste para texto grande");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, texto grande, texto claro sobre fundo escuro");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopia: risco de confusão alto");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contraste para texto grande após a composição "
      & "alfa");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, somente elementos não textuais, texto claro sobre "
      & "fundo escuro");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, somente elementos não textuais, texto claro sobre "
      & "fundo escuro");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopia: risco de confusão moderado");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number}, contraste baixo");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number}, contraste baixo");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, somente elementos não textuais, texto escuro sobre "
      & "fundo claro");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, somente elementos não textuais, texto escuro sobre "
      & "fundo claro");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopia: risco de confusão moderado");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopia: risco de confusão alto");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}%, muito diferente");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "acromatopsia: risco de confusão alto");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "acromatopsia: risco de confusão baixo");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, contraste baixo após a composição alfa");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number}, contraste para texto normal");
   P ("label.contrast.readability_label.readable_for_normal_text", "legível para texto normal");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, corpo de texto, texto claro sobre fundo escuro");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number}, contraste para texto normal");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, corpo de texto, texto claro sobre fundo escuro");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, texto grande, texto escuro sobre fundo claro");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, texto grande, texto escuro sobre fundo claro");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}%, diferença sutil");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, corpo de texto, texto escuro sobre fundo claro");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, corpo de texto, texto escuro sobre fundo claro");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopia: risco de confusão baixo");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}%, diferença perceptível");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, contraste para texto grande");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, contraste para texto grande");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopia: risco de confusão baixo");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number}, contraste aprimorado");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "legível com contraste aprimorado");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number}, contraste aprimorado");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, diferença perceptual sutil");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopia: cores distinguíveis");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, contraste para texto normal após a "
      & "composição alfa");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopia: risco de confusão moderado");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contraste para texto normal após a composição "
      & "alfa");
end Labels_3;
