separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Pt (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "pt", Name, Template);
   end P;
   --  The domain labels (label.*), in nested subunits.
   procedure Labels_1 is separate;
   procedure Labels_2 is separate;
   procedure Labels_3 is separate;
begin
   P ("all_count",
      "{total} {total, plural, one {{one}} many {{many}} other {{other}}} no "
      & "total");
   P ("filtered_count.none", "não há {other} correspondentes");
   P ("filtered_count.all",
      "{total, plural, one {{total} de {total} {one} corresponde} many "
      & "{{total} de {total} {many} correspondem} other {{total} de {total} "
      & "{other} correspondem}}");
   P ("filtered_count.some",
      "{matching} de {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}} {matching, plural, one {corresponde} other {correspondem}}");
   P ("more_count",
      "{visible} {visible, plural, one {visível} other {visíveis}}, mais "
      & "{remaining}");
   P ("others_count", "{first} e mais {remaining}");
   P ("page_count", "página {page} de {total}");
   P ("page_size",
      "{size} {size, plural, one {{one}} many {{many}} other {{other}}} por "
      & "página");
   P ("pagination_range",
      "{first}–{last} de {total} {total, plural, one {{one}} many {{many}} "
      & "other {{other}}}");
   P ("position_count", "{position} de {total}");
   P ("selection_count",
      "{gender, select, masculine {{selected} de {total} {total, plural, one "
      & "{{one}} many {{many}} other {{other}}} {selected, plural, one "
      & "{selecionado} other {selecionados}}} feminine {{selected} de {total} "
      & "{total, plural, one {{one}} many {{many}} other {{other}}} {selected, "
      & "plural, one {selecionada} other {selecionadas}}} other {seleção: "
      & "{selected} de {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}}}}");
   P ("showing_count",
      "exibindo {showing} de {total} {total, plural, one {{one}} many "
      & "{{many}} other {{other}}}");
   P ("validation_count",
      "{count, plural, =0 {{severity, select, error {nenhum erro} warning "
      & "{nenhum aviso} other {nenhuma observação}}} one {{count} {severity, "
      & "select, error {erro} warning {aviso} other {observação}}} other "
      & "{{count} {severity, select, error {erros} warning {avisos} other "
      & "{observações}}}}");
   P ("collection.empty", "não há {other}");
   P ("collection.none_shown", "não há {other} para exibir");
   P ("collection.showing_hidden",
      "exibindo {visible} de {total} {total, plural, one {{one}} many "
      & "{{many}} other {{other}}}, {hidden} não {hidden, plural, one "
      & "{visível} other {visíveis}}");
   P ("collection.showing",
      "exibindo {visible} de {total} {total, plural, one {{one}} many "
      & "{{many}} other {{other}}}");
   P ("collection.shown_hidden",
      "{visible} {visible, plural, one {{one}} many {{many}} other {{other}}} "
      & "{visible, plural, one {visível} other {visíveis}}, {hidden} não "
      & "{hidden, plural, one {visível} other {visíveis}}");
   P ("collection.shown",
      "{visible} {visible, plural, one {{one}} many {{many}} other {{other}}} "
      & "{visible, plural, one {visível} other {visíveis}}");
   P ("collection.visible_out_of",
      "{visible} {visible, plural, one {{one}} many {{many}} other {{other}}} "
      & "{visible, plural, one {visível} other {visíveis}} de {total}");
   P ("complete_count", "{done} de {total} {done, plural, one {concluído} other {concluídos}}");
   P ("percent_complete", "{percent}% concluído");
   P ("step_count", "etapa {step} de {total}");
   P ("attempt_count", "tentativa {attempt} de {total}");
   P ("throughput_remaining",
      "{remaining, plural, one {resta} other {restam}} {remaining} "
      & "{remaining, plural, one {{one}} many {{many}} other {{other}}} a "
      & "{rate} {unit}/s");
   P ("accessible_progress",
      "{done} de {total} {done, plural, one {concluído} other "
      & "{concluídos}}, {percent} por cento");
   P ("business_days", "{days} {days, plural, one {dia útil} other {dias úteis}}");
   P ("working_hours",
      "{hours} {hours, plural, one {hora de trabalho} other {horas de "
      & "trabalho}}");
   P ("due.overdue", "com {days} {days, plural, one {dia} other {dias}} de atraso");
   P ("due.today", "vence hoje");
   P ("due.tomorrow", "vence amanhã");
   P ("due.in", "vence em {days} dias");
   P ("calendar_difference.future", "em {difference}");
   P ("calendar_difference.past", "há {difference}");
   P ("cpu_load", "uso da CPU {measure}");
   P ("battery", "bateria {measure}");
   P ("screen_size", "tela {measure}");
   P ("refresh_rate", "taxa de atualização {measure}");
   P ("editorial_percent.symbol", "{value}%");
   P ("editorial_percent.word", "{value} por cento");
   P ("recurrence.second", "{every, plural, =1 {a cada segundo} other {a cada {every} segundos}}");
   P ("recurrence.minute", "{every, plural, =1 {a cada minuto} other {a cada {every} minutos}}");
   P ("recurrence.hour", "{every, plural, =1 {a cada hora} other {a cada {every} horas}}");
   P ("recurrence.day", "{every, plural, =1 {todo dia} other {a cada {every} dias}}");
   P ("recurrence.week", "{every, plural, =1 {toda semana} other {a cada {every} semanas}}");
   P ("recurrence.month", "{every, plural, =1 {todo mês} other {a cada {every} meses}}");
   P ("recurrence.quarter", "{every, plural, =1 {todo trimestre} other {a cada {every} trimestres}}");
   P ("recurrence.year", "{every, plural, =1 {todo ano} other {a cada {every} anos}}");
   P ("cache_summary.empty", "cache: nenhuma solicitação");
   P ("cache_summary",
      "cache: {hits} {hits, plural, one {acerto} other {acertos}}, {misses} "
      & "{misses, plural, one {falha} other {falhas}}, taxa de acertos de "
      & "{rate}%");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} many {{many}} other {{other}}}: "
      & "{changed, plural, one {{changed} alteração} other {{changed} "
      & "alterações}}, {added, plural, one {{added} adição} other {{added} "
      & "adições}}, {removed, plural, one {{removed} remoção} other "
      & "{{removed} remoções}}");
   P ("field_diff", "{field}: valor alterado de {before} para {after}");
   P ("field_added", "{field}: valor {value} adicionado");
   P ("field_removed", "{field}: valor {value} removido");
   P ("field_unchanged", "{field}: valor inalterado ({value})");
   P ("number_comparison.equal", "{current} é igual a {baseline}");
   P ("number_comparison.higher", "{current} é {quantity} maior que {baseline}");
   P ("number_comparison.lower", "{current} é {quantity} menor que {baseline}");
   P ("percent_comparison.equal", "{current} é igual a {baseline}");
   P ("percent_comparison.higher", "{current} é {quantity} maior que {baseline}");
   P ("percent_comparison.lower", "{current} é {quantity} menor que {baseline}");
   P ("file_size_comparison.same", "{current} tem o mesmo tamanho que {baseline}");
   P ("file_size_comparison.larger", "{current} ocupa {quantity} a mais que {baseline}");
   P ("file_size_comparison.smaller", "{current} ocupa {quantity} a menos que {baseline}");
   P ("date_comparison.same", "{current} cai no mesmo dia que {baseline}");
   P ("date_comparison.after", "{current} cai {quantity} depois de {baseline}");
   P ("date_comparison.before", "{current} cai {quantity} antes de {baseline}");
   P ("queue_summary", "fila: {details}");
   P ("domain_summary",
      "{domain, select, queue {fila} job {tarefa} run {execução} cache "
      & "{cache} sync {sincronização} import {importação} export "
      & "{exportação} other {{domain}}} {state, select, queued {na fila} "
      & "running {em execução} waiting {aguardando} paused {{domain, select, "
      & "queue {pausada} job {pausada} run {pausada} cache {pausado} sync "
      & "{pausada} import {pausada} export {pausada} other {pausado}}} complete "
      & "{{domain, select, queue {concluída} job {concluída} run {concluída} "
      & "cache {concluído} sync {concluída} import {concluída} export "
      & "{concluída} other {concluído}}} failed {com falha} stale {{domain, "
      & "select, queue {desatualizada} job {desatualizada} run {desatualizada} "
      & "cache {desatualizado} sync {desatualizada} import {desatualizada} "
      & "export {desatualizada} other {desatualizado}}} skipped {{domain, "
      & "select, queue {ignorada} job {ignorada} run {ignorada} cache "
      & "{ignorado} sync {ignorada} import {ignorada} export {ignorada} other "
      & "{ignorado}}} other {{state}}}: {details}");
   P ("summary.none", "sem {other}");
   P ("summary.completed",
      "{gender, select, masculine {{count} {count, plural, one {{one}} many "
      & "{{many}} other {{other}}} {count, plural, one {concluído} other "
      & "{concluídos}}} feminine {{count} {count, plural, one {{one}} many "
      & "{{many}} other {{other}}} {count, plural, one {concluída} other "
      & "{concluídas}}} other {concluído: {count} {count, plural, one {{one}} "
      & "many {{many}} other {{other}}}}}");
   P ("summary.completed_of",
      "{gender, select, masculine {{count} de {total} {total, plural, one "
      & "{{one}} many {{many}} other {{other}}} {count, plural, one "
      & "{concluído} other {concluídos}}} feminine {{count} de {total} "
      & "{total, plural, one {{one}} many {{many}} other {{other}}} {count, "
      & "plural, one {concluída} other {concluídas}}} other {concluído: "
      & "{count} de {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}}}}");
   P ("summary.failed", "{count} com falha");
   P ("summary.queued",
      "{count} {count, plural, one {{one}} many {{many}} other {{other}}} na "
      & "fila");
   P ("summary.running", "{count} em execução");
   P ("summary.complete", "{count} {count, plural, one {concluído} other {concluídos}}");
   P ("backup.backup_running", "backup em andamento");
   P ("backup.backup_completed", "backup concluído");
   P ("backup.backup_failed", "falha no backup");
   P ("backup.backup_stale", "backup desatualizado");
   P ("incident.incident_investigating", "investigando incidente");
   P ("incident.incident_identified", "incidente identificado");
   P ("incident.incident_mitigated", "incidente mitigado");
   P ("incident.incident_resolved", "incidente resolvido");
   P ("release.release_drafting", "versão em preparação");
   P ("release.release_ready", "versão pronta");
   P ("release.release_published", "versão publicada");
   P ("release.release_rolled_back", "versão revertida");
   P ("audit.audit_created", "entrada de auditoria criada");
   P ("audit.audit_updated", "entrada de auditoria atualizada");
   P ("audit.audit_deleted", "entrada de auditoria excluída");
   P ("audit.audit_restored", "entrada de auditoria restaurada");
   P ("flag.flag_enabled", "feature flag ativada");
   P ("flag.flag_disabled", "feature flag desativada");
   P ("flag.flag_rolling_out", "feature flag em implantação");
   P ("flag.flag_rolled_back", "feature flag revertida");
   P ("webhook.webhook_pending", "webhook pendente");
   P ("webhook.webhook_delivered", "webhook entregue");
   P ("webhook.webhook_failed", "falha no webhook");
   P ("webhook.webhook_retrying", "tentando reenviar webhook");
   P ("api_key.api_key_active", "chave de API ativa");
   P ("api_key.api_key_revoked", "chave de API revogada");
   P ("api_key.api_key_expired", "chave de API expirada");
   P ("api_key.api_key_rotated", "chave de API rotacionada");
   P ("quota.quota_available", "cota disponível");
   P ("quota.quota_near_limit", "cota quase esgotada");
   P ("quota.quota_exceeded", "cota excedida");
   P ("quota.quota_reset", "cota redefinida");
   P ("invoice.invoice_draft", "rascunho de fatura");
   P ("invoice.invoice_sent", "fatura enviada");
   P ("invoice.invoice_paid", "fatura paga");
   P ("invoice.invoice_refunded", "fatura reembolsada");
   P ("invoice.invoice_overdue", "fatura vencida");
   P ("invoice.refund_failed", "falha no reembolso");
   P ("page_navigation.only", "página única");
   P ("page_navigation.first", "primeira página, próxima disponível");
   P ("page_navigation.last", "última página, anterior disponível");
   P ("page_navigation.middle", "anterior e próxima disponíveis");
   P ("end_of_week", "fim da semana");
   P ("end_of_month", "fim do mês");
   P ("end_of_quarter", "fim do trimestre");
   P ("time_of_day.night", "madrugada");
   P ("time_of_day.morning", "manhã");
   P ("time_of_day.afternoon", "tarde");
   P ("time_of_day.evening", "noite");
   P ("calendar_difference.same_day", "mesmo dia");
   P ("calendar_difference.zero", "0 dias");
   P ("queue_summary.empty", "fila vazia");
   P ("access.allowed", "permitido");
   P ("access.denied", "negado");
   P ("access.owner", "proprietário");
   P ("access.admin", "administrador");
   P ("access.viewer", "visualizador");
   P ("access.editor", "editor");
   P ("auth.signed_in", "conectado");
   P ("auth.signed_out", "desconectado");
   P ("auth.session_expired", "sessão expirada");
   P ("auth.locked", "bloqueado");
   P ("auth.two_factor_required", "autenticação de dois fatores obrigatória");
   P ("billing.trialing", "período de teste");
   P ("billing.payment_due", "pagamento pendente");
   P ("billing.payment_failed", "falha no pagamento");
   P ("billing.paid", "pago");
   P ("billing.past_due", "vencido");
   P ("billing.canceled", "cancelado");
   P ("ci.pipeline_pending", "pipeline pendente");
   P ("ci.pipeline_running", "pipeline em execução");
   P ("ci.pipeline_passed", "pipeline aprovado");
   P ("ci.pipeline_failed", "falha no pipeline");
   P ("ci.review_required", "revisão obrigatória");
   P ("ci.deploy_blocked", "implantação bloqueada");
   P ("collaboration.active_now", "ativo agora");
   P ("collaboration.away", "ausente");
   P ("collaboration.do_not_disturb", "não perturbe");
   P ("collaboration.typing", "digitando");
   P ("collaboration.viewing", "visualizando");
   P ("collaboration.editing", "editando");
   P ("deployment.deploying", "implantando");
   P ("deployment.deployed", "implantado");
   P ("deployment.rolling_back", "revertendo");
   P ("deployment.rolled_back", "revertido");
   P ("deployment.build_failed", "falha na compilação");
   P ("deployment.checks_passed", "verificações aprovadas");
   P ("empty.no_items", "nenhum item");
   P ("empty.no_results", "nenhum resultado");
   P ("empty.no_messages", "nenhuma mensagem");
   P ("empty.no_selection", "nenhuma seleção");
   P ("empty.nothing_to_show", "nada para mostrar");
   P ("file.uploading", "enviando");
   P ("file.downloading", "baixando");
   P ("file.copying", "copiando");
   P ("file.moving", "movendo");
   P ("file.deleting", "excluindo");
   P ("file.deleted", "excluído");
   P ("file.restoring", "restaurando");
   P ("file.synced", "sincronizado");
   P ("form.valid_input", "entrada válida");
   P ("form.invalid_input", "entrada inválida");
   P ("form.dirty", "alterado");
   P ("form.pristine", "inalterado");
   P ("form.submitted", "enviado");
   P ("form.submission_failed", "falha no envio");
   P ("health.healthy", "íntegro");
   P ("health.degraded", "degradado");
   P ("health.unhealthy", "não íntegro");
   P ("health.incident", "incidente");
   P ("health.maintenance", "manutenção");
   P ("health.recovering", "recuperando");
   P ("issue.open", "aberto");
   P ("issue.closed", "fechado");
   P ("issue.reopened", "reaberto");
   P ("issue.assigned", "atribuído");
   P ("issue.unassigned", "não atribuído");
   P ("issue.merged", "mesclado");
   P ("network.offline", "offline");
   P ("network.online", "online");
   P ("network.connecting", "conectando");
   P ("network.syncing", "sincronizando");
   P ("network.sync_failed", "falha na sincronização");
   P ("network.permission_denied", "permissão negada");
   P ("network.read_only", "somente leitura");
   P ("notification.unread", "não lido");
   P ("notification.read", "lido");
   P ("notification.muted", "silenciado");
   P ("notification.snoozed", "adiado");
   P ("notification.sent", "enviado");
   P ("notification.delivered", "entregue");
   P ("payment.payment_authorized", "pagamento autorizado");
   P ("payment.payment_captured", "pagamento capturado");
   P ("payment.payment_refunded", "pagamento reembolsado");
   P ("payment.payment_disputed", "pagamento contestado");
   P ("payment.payment_requires_action", "pagamento requer ação");
   P ("payment.payment_expired", "pagamento expirado");
   P ("ui.empty", "vazio");
   P ("ui.loading", "carregando");
   P ("ui.saving", "salvando");
   P ("ui.saved", "salvo");
   P ("ui.unsaved", "não salvo");
   P ("ui.retrying", "tentando novamente");
   P ("ui.paused", "pausado");
   P ("ui.complete", "concluído");
   P ("ui.failed", "falha");
   P ("ui.due_soon", "vence em breve");
   P ("ui.overdue", "atrasado");
   P ("ui.last_seen", "visto pela última vez");
   P ("ui.updated_just_now", "atualizado agora mesmo");
   P ("queue.queued", "na fila");
   P ("queue.running", "em execução");
   P ("queue.waiting", "aguardando");
   P ("queue.blocked", "bloqueado");
   P ("queue.canceled_job", "tarefa cancelada");
   P ("queue.completed_job", "tarefa concluída");
   P ("search.filtering", "filtrando");
   P ("search.filtered", "filtrado");
   P ("search.no_matches", "nenhuma correspondência");
   P ("search.search_ready", "pesquisa pronta");
   P ("search.search_failed", "falha na pesquisa");
   P ("search.query_too_short", "consulta muito curta");
   P ("security.secure", "seguro");
   P ("security.insecure", "não seguro");
   P ("security.vulnerable", "vulnerável");
   P ("security.encrypted", "criptografado");
   P ("security.unencrypted", "não criptografado");
   P ("security.token_expired", "token expirado");
   P ("sync.sync_idle", "sincronização inativa");
   P ("sync.syncing_now", "sincronizando agora");
   P ("sync.sync_queued", "sincronização na fila");
   P ("sync.sync_conflict", "conflito de sincronização");
   P ("sync.sync_complete", "sincronização concluída");
   P ("sync.sync_error", "erro de sincronização");
   P ("task.todo", "a fazer");
   P ("task.in_progress", "em andamento");
   P ("task.done", "concluído");
   P ("task.skipped", "ignorado");
   P ("task.blocked_task", "bloqueado");
   P ("task.waiting_on", "aguardando");
   P ("ticket.ticket_new", "ticket novo");
   P ("ticket.ticket_open", "ticket aberto");
   P ("ticket.ticket_waiting", "ticket em espera");
   P ("ticket.ticket_escalated", "ticket escalado");
   P ("ticket.ticket_resolved", "ticket resolvido");
   P ("ticket.ticket_closed", "ticket fechado");
   P ("transfer.importing", "importando");
   P ("transfer.imported", "importado");
   P ("transfer.import_failed", "falha na importação");
   P ("transfer.exporting", "exportando");
   P ("transfer.exported", "exportado");
   P ("transfer.export_failed", "falha na exportação");
   P ("validation.required", "obrigatório");
   P ("validation.optional", "opcional");
   P ("validation.invalid", "inválido");
   P ("validation.too_short", "muito curto");
   P ("validation.too_long", "muito longo");
   P ("validation.out_of_range", "fora do intervalo");
   P ("validation.already_exists", "já existe");
   P ("workflow.draft", "rascunho");
   P ("workflow.in_review", "em revisão");
   P ("workflow.approved", "aprovado");
   P ("workflow.rejected", "rejeitado");
   P ("workflow.published", "publicado");
   P ("workflow.archived", "arquivado");
   P ("database.database_online", "banco de dados online");
   P ("database.database_offline", "banco de dados offline");
   P ("database.database_degraded", "banco de dados degradado");
   P ("database.database_migrating", "migração do banco de dados em andamento");
   P ("database.database_migration_failed", "falha na migração do banco de dados");
   P ("database.database_replicating", "replicação do banco de dados em andamento");
   P ("database.database_replication_lagging", "replicação do banco de dados atrasada");
   P ("database.database_backup_running", "backup do banco de dados em andamento");
   P ("database.database_backup_failed", "falha no backup do banco de dados");
   P ("times_noun",
      "{count, plural, =0 {{other}: nunca} =1 {{one}: uma vez} =2 {{other}: "
      & "duas vezes} many {{many}: {count} vezes} other {{other}: {count} "
      & "vezes}}");
   P ("availability.all",
      "{available} de {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}} {available, plural, one {disponível} other {disponíveis}}");
   P ("availability.none", "sem {other} disponíveis");
   P ("availability.partial",
      "{available} de {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}} {available, plural, one {disponível} other "
      & "{disponíveis}}, {unavailable} {unavailable, plural, one "
      & "{indisponível} other {indisponíveis}}");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "na fila");
   P ("operation.running", "em execução");
   P ("operation.blocked", "bloqueado");
   P ("operation.retrying", "tentando novamente");
   P ("operation.succeeded", "bem-sucedido");
   P ("operation.partially_succeeded", "parcialmente bem-sucedido");
   P ("operation.failed", "com falha");
   P ("operation.canceled", "cancelado");
   P ("operation.skipped", "ignorado");
   P ("operation.stale", "desatualizado");
   P ("operation.unknown_state", "desconhecido");
   P ("operation.last_success", "{name}: último sucesso {time}");
   P ("operation.next_retry", "{name}: próxima tentativa {time}");
   P ("operation.stale_run", "{name}: sem atualização há {time}");
   P ("summary.skipped", "{count} {count, plural, one {ignorado} other {ignorados}}");
   P ("summary.retried", "{count} com nova tentativa");
   P ("summary.canceled", "{count} {count, plural, one {cancelado} other {cancelados}}");
   P ("system.service.operational", "operacional");
   P ("system.service.degraded", "desempenho degradado");
   P ("system.service.partial_outage", "interrupção parcial");
   P ("system.service.major_outage", "interrupção grave");
   P ("system.service.maintenance", "em manutenção");
   P ("system.service.unknown", "status do serviço desconhecido");
   P ("system.health.healthy", "íntegro");
   P ("system.health.warning", "aviso");
   P ("system.health.critical", "crítico");
   P ("system.health.unavailable", "indisponível");
   P ("system.health.unknown_health", "integridade desconhecida");
   P ("system.readiness.ready", "pronto");
   P ("system.readiness.not_ready", "não pronto");
   P ("system.readiness.starting", "iniciando");
   P ("system.readiness.draining", "drenando");
   P ("system.readiness.stopped", "parado");
   P ("system.readiness.unknown_readiness", "prontidão desconhecida");
   P ("system.component.online", "online");
   P ("system.component.offline", "offline");
   P ("system.component.starting", "iniciando");
   P ("system.component.stopping", "parando");
   P ("system.component.restarting", "reiniciando");
   P ("system.component.unknown", "status do componente desconhecido");
   P ("system.check.passing", "aprovada");
   P ("system.check.failing", "falhando");
   P ("system.check.warning", "aviso");
   P ("system.check.skipped", "ignorada");
   P ("system.check.timed_out", "tempo esgotado");
   P ("system.check.unknown", "status da verificação desconhecido");
   P ("system.incident.investigating", "investigando");
   P ("system.incident.identified", "identificado");
   P ("system.incident.monitoring", "monitorando");
   P ("system.incident.resolved", "resolvido");
   P ("system.incident.scheduled_maintenance", "manutenção programada");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "verificação de {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {nenhum componente} one {{count} componente} many "
      & "{{count} de componentes} other {{count} componentes}}");
   P ("system.count.checks",
      "{count, plural, =0 {nenhuma verificação} one {{count} verificação} "
      & "many {{count} de verificações} other {{count} verificações}}");
   P ("system.count.incidents",
      "{count, plural, =0 {nenhum incidente} one {{count} incidente} many "
      & "{{count} de incidentes} other {{count} incidentes}}");
   P ("system.uptime", "tempo de atividade {measure}");
   P ("system.latency", "latência {measure}");
   P ("system.maintenance_window", "janela de manutenção {time}");
   P ("system.last_checked", "última verificação {time}");
   P ("system.http.informational", "informativa");
   P ("system.http.successful", "sucesso");
   P ("system.http.redirection", "redirecionamento");
   P ("system.http.client_error", "erro do cliente");
   P ("system.http.server_error", "erro do servidor");
   P ("system.exit.success", "código de saída {code}: sucesso");
   P ("system.exit.failure", "código de saída {code}: falha");
   P ("system.exit.usage_error", "código de saída {code}: erro de uso");
   P ("system.exit.not_executable", "código de saída {code}: comando não executável");
   P ("system.exit.not_found", "código de saída {code}: comando não encontrado");
   P ("system.exit.invalid_argument", "código de saída {code}: argumento de saída inválido");
   P ("system.exit.signal", "código de saída {code}: encerrado por {signal}");
   P ("validation.problem.required", "{field}: é obrigatório");
   P ("validation.problem.minimum", "{field}: está abaixo do mínimo");
   P ("validation.problem.maximum", "{field}: está acima do máximo");
   P ("validation.problem.range", "{field}: está fora do intervalo");
   P ("validation.problem.pattern", "{field}: não corresponde ao padrão");
   P ("validation.problem.choice", "{field}: deve ser uma das opções permitidas");
   P ("validation.problem.dependency", "{field}: depende de outro campo");
   P ("validation.problem.custom", "{field}: é inválido");
   P ("validation.constraint.no_relation", "{field}: deve ser válido ({value})");
   P ("validation.constraint.less_than", "{field}: deve ser menor que {value}");
   P ("validation.constraint.less_or_equal", "{field}: deve ser no máximo {value}");
   P ("validation.constraint.greater_than", "{field}: deve ser maior que {value}");
   P ("validation.constraint.greater_or_equal", "{field}: deve ser no mínimo {value}");
   P ("validation.constraint.equal_to", "{field}: deve ser igual a {value}");
   P ("validation.constraint.not_equal_to", "{field}: não deve ser igual a {value}");
   P ("validation.constraint.before_field", "{field}: deve ser anterior a {value}");
   P ("validation.constraint.after_field", "{field}: deve ser posterior a {value}");
   P ("validation.choices", "{field}: valores permitidos: {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, valor recebido: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, tentar novamente em {time}");
   P ("net_diagnostic.dns", "{endpoint}: falha na consulta DNS");
   P ("net_diagnostic.tcp", "{endpoint}: falha na conexão TCP");
   P ("net_diagnostic.tls", "{endpoint}: falha no certificado TLS");
   P ("net_diagnostic.http", "{endpoint}: falha na solicitação HTTP");
   P ("net_diagnostic.proxy", "{endpoint}: falha no proxy");
   P ("net_diagnostic.timeout", "{endpoint}: tempo limite esgotado");
   P ("net_diagnostic.reset", "{endpoint}: conexão redefinida");
   P ("net_diagnostic.unknown_network", "{endpoint}: erro de rede");
   P ("progress.state.not_started", "não iniciado");
   P ("progress.state.running", "em execução");
   P ("progress.state.stalled", "parado");
   P ("progress.state.retrying", "tentando novamente");
   P ("progress.state.complete", "concluído");
   P ("progress.state.failed", "com falha");
   P ("progress.of", "{subject}: {done} de {total} concluídos ({percent}%), {state}");
   P ("progress.done",
      "{subject}: {done} {done, plural, one {concluído} other "
      & "{concluídos}}, {state}");
   P ("collection.summary",
      "{name}: {total, plural, one {{total} item} many {{total} de itens} "
      & "other {{total} itens}}, {unique, plural, one {{unique} valor único} "
      & "many {{unique} de valores únicos} other {{unique} valores únicos}}, "
      & "{duplicates, plural, one {{duplicates} duplicado} many {{duplicates} "
      & "de duplicados} other {{duplicates} duplicados}}, {outliers, plural, "
      & "one {{outliers} valor atípico} many {{outliers} de valores atípicos} "
      & "other {{outliers} valores atípicos}}");
   P ("top_frequency",
      "mais frequente em {name}: {value} ({count, plural, one {{count} vez} "
      & "many {{count} de vezes} other {{count} vezes}})");
   P ("calendar_date.fiscal_year", "AF {year}");
   P ("calendar_date.fiscal_quarter", "AF {year} T{part}");
   P ("calendar_date.fiscal_half", "AF {year} S{part}");
   P ("calendar_date.fiscal_year_end", "fim do AF {year}");
   P ("calendar_date.semester", "S{part} {year}");
   P ("calendar_date.half_year", "S{part} {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {primeiro semestre de {year}} other {segundo "
      & "semestre de {year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {início de {text}} mid {meados de {text}} other "
      & "{fim de {text}}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {início do {text}} mid {meados do {text}} other "
      & "{fim do {text}}}");
   P ("calendar_range.weekend.last", "fim de semana passado");
   P ("calendar_range.weekend.this", "este fim de semana");
   P ("calendar_range.weekend.next", "próximo fim de semana");
   P ("calendar_range.weekend_of", "fim de semana de {date}");
   P ("calendar_range.week.last", "semana passada");
   P ("calendar_range.week.this", "esta semana");
   P ("calendar_range.week.next", "próxima semana");
   P ("calendar_range.week_of", "semana de {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "continuar");
   P ("http.reason.101", "mudando de protocolo");
   P ("http.reason.102", "processando");
   P ("http.reason.103", "dicas antecipadas");
   P ("http.reason.200", "ok");
   P ("http.reason.201", "criado");
   P ("http.reason.202", "aceito");
   P ("http.reason.203", "informação não autoritativa");
   P ("http.reason.204", "sem conteúdo");
   P ("http.reason.205", "redefinir conteúdo");
   P ("http.reason.206", "conteúdo parcial");
   P ("http.reason.207", "multiestado");
   P ("http.reason.208", "já relatado");
   P ("http.reason.226", "IM usado");
   P ("http.reason.300", "múltiplas escolhas");
   P ("http.reason.301", "movido permanentemente");
   P ("http.reason.302", "encontrado");
   P ("http.reason.303", "ver outro");
   P ("http.reason.304", "não modificado");
   P ("http.reason.305", "usar proxy");
   P ("http.reason.307", "redirecionamento temporário");
   P ("http.reason.308", "redirecionamento permanente");
   P ("http.reason.400", "solicitação inválida");
   P ("http.reason.401", "não autorizado");
   P ("http.reason.402", "pagamento necessário");
   P ("http.reason.403", "proibido");
   P ("http.reason.404", "não encontrado");
   P ("http.reason.405", "método não permitido");
   P ("http.reason.406", "não aceitável");
   P ("http.reason.407", "autenticação de proxy necessária");
   P ("http.reason.408", "tempo limite da solicitação esgotado");
   P ("http.reason.409", "conflito");
   P ("http.reason.410", "não mais disponível");
   P ("http.reason.411", "comprimento necessário");
   P ("http.reason.412", "falha na pré-condição");
   P ("http.reason.413", "conteúdo muito grande");
   P ("http.reason.414", "URI muito longo");
   P ("http.reason.415", "tipo de mídia não suportado");
   P ("http.reason.416", "intervalo não satisfatório");
   P ("http.reason.417", "falha na expectativa");
   P ("http.reason.418", "sou um bule de chá");
   P ("http.reason.421", "solicitação mal direcionada");
   P ("http.reason.422", "conteúdo não processável");
   P ("http.reason.423", "bloqueado");
   P ("http.reason.424", "falha de dependência");
   P ("http.reason.425", "cedo demais");
   P ("http.reason.426", "atualização necessária");
   P ("http.reason.428", "pré-condição necessária");
   P ("http.reason.429", "solicitações demais");
   P ("http.reason.431", "campos de cabeçalho da solicitação muito grandes");
   P ("http.reason.451", "indisponível por motivos legais");
   P ("http.reason.500", "erro interno do servidor");
   P ("http.reason.501", "não implementado");
   P ("http.reason.502", "gateway inválido");
   P ("http.reason.503", "serviço indisponível");
   P ("http.reason.504", "tempo limite do gateway esgotado");
   P ("http.reason.505", "versão HTTP não suportada");
   P ("http.reason.506", "a variante também negocia");
   P ("http.reason.507", "armazenamento insuficiente");
   P ("http.reason.508", "loop detectado");
   P ("http.reason.510", "não estendido");
   P ("http.reason.511", "autenticação de rede necessária");
   P ("errno.reason.0", "sucesso");
   P ("errno.reason.1", "operação não permitida");
   P ("errno.reason.2", "arquivo ou diretório inexistente");
   P ("errno.reason.3", "processo inexistente");
   P ("errno.reason.4", "chamada de sistema interrompida");
   P ("errno.reason.5", "erro de entrada/saída");
   P ("errno.reason.6", "endereço ou dispositivo inexistente");
   P ("errno.reason.9", "descritor de arquivo inválido");
   P ("errno.reason.11", "recurso temporariamente indisponível");
   P ("errno.reason.12", "não foi possível alocar memória");
   P ("errno.reason.13", "permissão negada");
   P ("errno.reason.17", "arquivo existe");
   P ("errno.reason.20", "não é um diretório");
   P ("errno.reason.21", "é um diretório");
   P ("errno.reason.22", "argumento inválido");
   P ("errno.reason.24", "muitos arquivos abertos");
   P ("errno.reason.28", "não há espaço disponível no dispositivo");
   P ("errno.reason.32", "pipe quebrado");
   P ("errno.reason.98", "endereço já em uso");
   P ("errno.reason.110", "tempo esgotado para conexão");
   P ("errno.reason.111", "conexão recusada");
   P ("signal.reason.1", "desconexão");
   P ("signal.reason.2", "interrupção");
   P ("signal.reason.3", "sair");
   P ("signal.reason.4", "instrução ilegal");
   P ("signal.reason.5", "trace/breakpoint trap");
   P ("signal.reason.6", "abortado");
   P ("signal.reason.7", "erro no barramento");
   P ("signal.reason.8", "exceção de ponto flutuante");
   P ("signal.reason.9", "morto");
   P ("signal.reason.10", "sinal 1 definido pelo usuário");
   P ("signal.reason.11", "falha de segmentação");
   P ("signal.reason.12", "sinal 2 definido pelo usuário");
   P ("signal.reason.13", "pipe quebrado");
   P ("signal.reason.14", "alarme de tempo");
   P ("signal.reason.15", "terminado");
   P ("signal.reason.17", "filho finalizado");
   P ("signal.reason.18", "continua");
   P ("signal.reason.19", "parado (sinal)");
   P ("signal.reason.20", "parado");
   P ("signal.reason.28", "janela alterada");
   P ("sqlstate.reason.00", "conclusão bem-sucedida");
   P ("sqlstate.reason.01", "aviso");
   P ("sqlstate.reason.02", "sem dados");
   P ("sqlstate.reason.08", "exceção de conexão");
   P ("sqlstate.reason.0a", "recurso não suportado");
   P ("sqlstate.reason.22", "exceção de dados");
   P ("sqlstate.reason.23", "violação de restrição de integridade");
   P ("sqlstate.reason.24", "estado de cursor inválido");
   P ("sqlstate.reason.25", "estado de transação inválido");
   P ("sqlstate.reason.28", "especificação de autorização inválida");
   P ("sqlstate.reason.2d", "término de transação inválido");
   P ("sqlstate.reason.3d", "nome de catálogo inválido");
   P ("sqlstate.reason.3f", "nome de esquema inválido");
   P ("sqlstate.reason.40", "reversão de transação");
   P ("sqlstate.reason.42", "erro de sintaxe ou violação de regra de acesso");
   P ("sqlstate.reason.53", "recursos insuficientes");
   P ("sqlstate.reason.54", "limite do programa excedido");
   P ("sqlstate.reason.55", "objeto fora do estado pré-requisito");
   P ("sqlstate.reason.57", "intervenção do operador");
   P ("sqlstate.reason.58", "erro de sistema");
   P ("sqlstate.reason.hv", "erro do wrapper de dados externos");
   P ("sqlstate.reason.p0", "erro de PL/pgSQL");
   P ("sqlstate.reason.xx", "erro interno");
   P ("system.signal_numbered", "sinal {number} {name} {reason}");
   P ("http.reason.unknown", "status desconhecido");
   P ("errno.reason.unknown", "erro desconhecido");
   P ("signal.reason.unknown", "sinal desconhecido");
   P ("sqlstate.reason.unknown", "classe SQLSTATE desconhecida");
   P ("diff.changed", "diff {path}: alterado de {before} para {after}");
   P ("diff.added", "diff {path}: adicionado {after}");
   P ("diff.removed", "diff {path}: removido {before}");
   P ("diff.unchanged", "diff {path}: sem alterações");
   P ("diff.redacted", "diff {path}: alterado; valores ocultados");
   P ("validation.result",
      "resultado da validação: {fields} {fields, plural, one {campo} many "
      & "{de campos} other {campos}}, {errors} {errors, plural, one {erro} many "
      & "{de erros} other {erros}}, {warnings} {warnings, plural, one {aviso} "
      & "many {de avisos} other {avisos}}, {required} {required, plural, one "
      & "{campo obrigatório} many {de campos obrigatórios} other {campos "
      & "obrigatórios}}, {hidden} {hidden, plural, one {problema oculto} many "
      & "{de problemas ocultos} other {problemas ocultos}}");
   P ("file.kind.plain", "arquivo");
   P ("file.kind.directory", "pasta");
   P ("file.kind.archive", "pacote de arquivos");
   P ("file.kind.compressed", "arquivo compactado");
   P ("file.kind.image", "imagem");
   P ("file.kind.script", "script");
   P ("file.kind.executable", "executável");
   P ("file.kind.unknown", "arquivo desconhecido");
   P ("file.metadata", "arquivo {name}: {kind}");
   P ("file.checksum", "{text}, soma de verificação {checksum}");
   P ("file.signature_match", "assinatura de arquivo {name}: {kind}, corresponde à extensão");
   P ("file.signature_mismatch",
      "assinatura de arquivo {name}: extensão do tipo {expected}, conteúdo "
      & "do tipo {actual}");
   P ("network_event.connecting", "conectando");
   P ("network_event.connected", "conectado");
   P ("network_event.redirected", "redirecionado");
   P ("network_event.retrying", "tentando novamente");
   P ("network_event.rate_limited", "limite de taxa atingido");
   P ("network_event.tls_failed", "falha de TLS");
   P ("network_event.stalled", "travado");
   P ("network_event.complete", "concluído");
   P ("network_event.failed", "com falha");
   P ("network.session", "rede {endpoint}: {state}");
   P ("diff_node.field", "campo");
   P ("diff_node.object", "objeto");
   P ("diff_node.list", "lista");
   P ("diff.node",
      "nó de diff {path}: {kind}, {count} {count, plural, one {alteração} "
      & "many {de alterações} other {alterações}}");
   P ("checksum.not_checked", "soma de verificação não conferida");
   P ("checksum.valid", "soma de verificação válida");
   P ("checksum.mismatch", "soma de verificação divergente");
   P ("checksum.missing", "soma de verificação ausente");
   P ("product_code", "código de produto {kind}: {value}, {state}");
   P ("time_zone.utc", "fuso horário: UTC");
   P ("time_zone.offset", "fuso horário: {offset}");
   P ("time_zone.named", "fuso horário: {name} ({offset})");
   P ("time_zone.local", "fuso horário: horário local");
   P ("time_zone.unknown", "fuso horário: fuso desconhecido");
   P ("time_zone.dst", "{text}, adota horário de verão");
   P ("zoned_time.plain", "horário com fuso: {time} {offset}");
   P ("zoned_time.named", "horário com fuso: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, horário local ambíguo");
   P ("number.under", "abaixo de {value}");
   P ("number.up_to", "até {value}");
   P ("number.between", "entre {low} e {high}");
   P ("number.range_words", "de {low} a {high}");
   P ("number.uncertainty_words", "{value} mais ou menos {delta}");
   P ("number.range_inclusive", "de {low} a {high}, inclusive");
   P ("number.range_exclusive", "mais de {low} e menos de {high}");
   P ("number.range_low_inclusive", "{low} ou mais e menos de {high}");
   P ("number.range_high_inclusive", "mais de {low} e até {high}");
   P ("number.at_least", "pelo menos {value}");
   P ("number.more_than", "mais de {value}");
   P ("number.at_most", "no máximo {value}");
   P ("number.less_than", "menos de {value}");
   P ("number.exactly", "exatamente {value}");
   P ("number.within", "{value} está dentro do intervalo {bounds}");
   P ("number.below", "{value} está abaixo do intervalo {bounds}");
   P ("number.above", "{value} está acima do intervalo {bounds}");
   P ("number.per", "{numerator} por {denominator}");
   P ("number.one_in", "1 em cada {whole}");
   P ("number.out_of", "{value} de {whole}");
   P ("number.unchanged", "sem alterações");
   P ("number.change_up", "sobe {quantity}");
   P ("number.change_down", "cai {quantity}");
   P ("number.change_more", "{quantity} {tail} a mais");
   P ("number.change_fewer", "{quantity} {tail} a menos");
   P ("number.since", "{change} desde {since}");
   P ("duration.countdown", "tempo restante: {duration}");
   P ("duration.within", "em até {duration}");
   P ("duration.next", "próximo período de {duration}");
   P ("duration.between", "entre {low} e {high}");
   P ("duration.age", "idade: {duration}");
   P ("duration.stale_for", "desatualizado há {duration}");
   P ("duration.backup_age", "o backup tem {duration}");
   P ("duration.eta", "tempo estimado: {duration}");
   P ("duration.expires", "expira {relative}");
   P ("duration.retrying", "nova tentativa {relative}");
   P ("duration.modified", "modificado {relative}");
   P ("duration.synced", "sincronizado {relative}");
   P ("duration.modified_now", "modificado agora mesmo");
   P ("duration.synced_now", "sincronizado agora mesmo");
   P ("duration.natural.less_than_minute", "menos de um minuto");
   P ("duration.natural.half_hour", "meia hora");
   P ("duration.natural.about_half_hour", "cerca de meia hora");
   P ("duration.natural.about", "cerca de {duration}");
   P ("duration.natural.almost", "quase {duration}");
   P ("duration.natural.over", "mais de {duration}");
   P ("duration.natural.just_over", "pouco mais de {duration}");
   P ("duration.natural.little_under", "pouco menos de {duration}");
   P ("duration.natural.few",
      "{unit, select, second {alguns segundos} minute {alguns minutos} hour "
      & "{algumas horas} day {alguns dias} week {algumas semanas} month {alguns "
      & "meses} year {alguns anos} other {alguns}}");
   P ("duration.distance.past", "há {duration}");
   P ("duration.distance.future", "em {duration}");
   P ("geo.direction.north", "{style, select, short {N} other {norte}}");
   P ("geo.direction.north_north_east", "{style, select, short {NNE} other {nor-nordeste}}");
   P ("geo.direction.north_east", "{style, select, short {NE} other {nordeste}}");
   P ("geo.direction.east_north_east", "{style, select, short {LNE} other {lés-nordeste}}");
   P ("geo.direction.east", "{style, select, short {L} other {leste}}");
   P ("geo.direction.east_south_east", "{style, select, short {LSE} other {lés-sudeste}}");
   P ("geo.direction.south_east", "{style, select, short {SE} other {sudeste}}");
   P ("geo.direction.south_south_east", "{style, select, short {SSE} other {su-sudeste}}");
   P ("geo.direction.south", "{style, select, short {S} other {sul}}");
   P ("geo.direction.south_south_west", "{style, select, short {SSO} other {su-sudoeste}}");
   P ("geo.direction.south_west", "{style, select, short {SO} other {sudoeste}}");
   P ("geo.direction.west_south_west", "{style, select, short {OSO} other {oés-sudoeste}}");
   P ("geo.direction.west", "{style, select, short {O} other {oeste}}");
   P ("geo.direction.west_north_west", "{style, select, short {ONO} other {oés-noroeste}}");
   P ("geo.direction.north_west", "{style, select, short {NO} other {noroeste}}");
   P ("geo.direction.north_north_west", "{style, select, short {NNO} other {nor-noroeste}}");
   P ("geo.bearing", "{degrees} {direction}");
   P ("geo.distance_direction", "{distance} a {direction}");
   P ("geo.about_distance_direction", "cerca de {distance} a {direction}");
   P ("geo.coordinate", "{latitude}, {longitude}");
   P ("geo.bounding_box", "sudoeste {southwest}; nordeste {northeast}");
   P ("geo.inside_box", "dentro da área delimitada");
   P ("geo.outside_box", "fora da área delimitada");
   P ("number.about", "cerca de {value}");
   P ("number.almost", "quase {value}");
   P ("number.over", "mais de {value}");
   P ("number.plus_minus", "{value} ± {delta}");
   P ("number.plus_minus_parenthesized", "{value} (± {delta})");
   Labels_1;
   Labels_2;
   Labels_3;
end Locale_Pt;
