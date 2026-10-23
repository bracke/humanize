separate (Humanize.Catalogs.Phrase_Data)
function Locale_Pt return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("pt", Name, Template));
begin
   return
     P ("all_count", "{total} {total, plural, one {{one}} other {{other}}} no total")
     & P ("filtered_count.none", "não há {other} correspondentes")
     & P ("filtered_count.all",
          "{total, plural, one {{total} de {total} {one} corresponde} other "
          & "{{total} de {total} {other} correspondem}}")
     & P ("filtered_count.some",
          "{matching} de {total} {total, plural, one {{one}} other {{other}}} "
          & "{matching, plural, one {corresponde} other {correspondem}}")
     & P ("more_count",
          "{visible} {visible, plural, one {visível} other {visíveis}}, mais "
          & "{remaining}")
     & P ("others_count", "{first} e mais {remaining}")
     & P ("page_count", "página {page} de {total}")
     & P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} por página")
     & P ("pagination_range",
          "{first}–{last} de {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("position_count", "{position} de {total}")
     & P ("selection_count",
          "seleção: {selected} de {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("showing_count",
          "exibindo {showing} de {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {nenhum erro} warning "
          & "{nenhum aviso} other {nenhuma observação}}} one {{count} {severity, "
          & "select, error {erro} warning {aviso} other {observação}}} other "
          & "{{count} {severity, select, error {erros} warning {avisos} other "
          & "{observações}}}}")
     & P ("collection.empty", "não há {other}")
     & P ("collection.none_shown", "não há {other} para exibir")
     & P ("collection.showing_hidden",
          "exibindo {visible} de {total} {total, plural, one {{one}} other "
          & "{{other}}}, {hidden} não {hidden, plural, one {visível} other "
          & "{visíveis}}")
     & P ("collection.showing",
          "exibindo {visible} de {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("collection.shown_hidden",
          "{visible} {visible, plural, one {{one}} other {{other}}} {visible, "
          & "plural, one {visível} other {visíveis}}, {hidden} não {hidden, "
          & "plural, one {visível} other {visíveis}}")
     & P ("collection.shown",
          "{visible} {visible, plural, one {{one}} other {{other}}} {visible, "
          & "plural, one {visível} other {visíveis}}")
     & P ("collection.visible_out_of",
          "{visible} {visible, plural, one {{one}} other {{other}}} {visible, "
          & "plural, one {visível} other {visíveis}} de {total}")
     & P ("complete_count", "{done} de {total} {done, plural, one {concluído} other {concluídos}}")
     & P ("percent_complete", "{percent}% concluído")
     & P ("step_count", "etapa {step} de {total}")
     & P ("attempt_count", "tentativa {attempt} de {total}")
     & P ("throughput_remaining",
          "{remaining, plural, one {resta} other {restam}} {remaining} {unit} a "
          & "{rate} {unit}/s")
     & P ("accessible_progress",
          "{done} de {total} {done, plural, one {concluído} other "
          & "{concluídos}}, {percent} por cento")
     & P ("business_days", "{days} {days, plural, one {dia útil} other {dias úteis}}")
     & P ("working_hours",
          "{hours} {hours, plural, one {hora de trabalho} other {horas de "
          & "trabalho}}")
     & P ("due.overdue", "com {days} {days, plural, one {dia} other {dias}} de atraso")
     & P ("due.today", "vence hoje")
     & P ("due.tomorrow", "vence amanhã")
     & P ("due.in", "vence em {days} dias")
     & P ("calendar_difference.future", "em {difference}")
     & P ("calendar_difference.past", "há {difference}")
     & P ("cpu_load", "uso da CPU {measure}")
     & P ("battery", "bateria {measure}")
     & P ("screen_size", "tela {measure}")
     & P ("refresh_rate", "taxa de atualização {measure}")
     & P ("editorial_percent.symbol", "{value}%")
     & P ("editorial_percent.word", "{value} por cento")
     & P ("recurrence.second", "{every, plural, =1 {a cada segundo} other {a cada {every} segundos}}")
     & P ("recurrence.minute", "{every, plural, =1 {a cada minuto} other {a cada {every} minutos}}")
     & P ("recurrence.hour", "{every, plural, =1 {a cada hora} other {a cada {every} horas}}")
     & P ("recurrence.day", "{every, plural, =1 {todo dia} other {a cada {every} dias}}")
     & P ("recurrence.week", "{every, plural, =1 {toda semana} other {a cada {every} semanas}}")
     & P ("recurrence.month", "{every, plural, =1 {todo mês} other {a cada {every} meses}}")
     & P ("recurrence.quarter", "{every, plural, =1 {todo trimestre} other {a cada {every} trimestres}}")
     & P ("recurrence.year", "{every, plural, =1 {todo ano} other {a cada {every} anos}}")
     & P ("cache_summary.empty", "cache: nenhuma solicitação")
     & P ("cache_summary",
          "cache: {hits} {hits, plural, one {acerto} other {acertos}}, {misses} "
          & "{misses, plural, one {falha} other {falhas}}, taxa de acertos de "
          & "{rate}%")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} other {{other}}}: {changed, "
          & "plural, one {{changed} alteração} other {{changed} alterações}}, "
          & "{added, plural, one {{added} adição} other {{added} adições}}, "
          & "{removed, plural, one {{removed} remoção} other {{removed} "
          & "remoções}}")
     & P ("field_diff", "{field}: valor alterado de {before} para {after}")
     & P ("field_added", "{field}: valor {value} adicionado")
     & P ("field_removed", "{field}: valor {value} removido")
     & P ("field_unchanged", "{field}: valor inalterado ({value})")
     & P ("number_comparison.equal", "{current} é igual a {baseline}")
     & P ("number_comparison.higher", "{current} é {quantity} maior que {baseline}")
     & P ("number_comparison.lower", "{current} é {quantity} menor que {baseline}")
     & P ("percent_comparison.equal", "{current} é igual a {baseline}")
     & P ("percent_comparison.higher", "{current} é {quantity} maior que {baseline}")
     & P ("percent_comparison.lower", "{current} é {quantity} menor que {baseline}")
     & P ("file_size_comparison.same", "{current} tem o mesmo tamanho que {baseline}")
     & P ("file_size_comparison.larger", "{current} ocupa {quantity} a mais que {baseline}")
     & P ("file_size_comparison.smaller", "{current} ocupa {quantity} a menos que {baseline}")
     & P ("date_comparison.same", "{current} cai no mesmo dia que {baseline}")
     & P ("date_comparison.after", "{current} cai {quantity} depois de {baseline}")
     & P ("date_comparison.before", "{current} cai {quantity} antes de {baseline}")
     & P ("queue_summary", "fila: {details}")
     & P ("domain_summary",
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
          & "{ignorado}}} other {{state}}}: {details}")
     & P ("summary.none", "sem {other}")
     & P ("summary.completed", "concluído: {count} {count, plural, one {{one}} other {{other}}}")
     & P ("summary.completed_of",
          "concluído: {count} de {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("summary.failed", "{count} com falha")
     & P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} na fila")
     & P ("summary.running", "{count} em execução")
     & P ("summary.complete", "{count} {count, plural, one {concluído} other {concluídos}}")
     & P ("backup.backup_running", "backup em andamento")
     & P ("backup.backup_completed", "backup concluído")
     & P ("backup.backup_failed", "falha no backup")
     & P ("backup.backup_stale", "backup desatualizado")
     & P ("incident.incident_investigating", "investigando incidente")
     & P ("incident.incident_identified", "incidente identificado")
     & P ("incident.incident_mitigated", "incidente mitigado")
     & P ("incident.incident_resolved", "incidente resolvido")
     & P ("release.release_drafting", "versão em preparação")
     & P ("release.release_ready", "versão pronta")
     & P ("release.release_published", "versão publicada")
     & P ("release.release_rolled_back", "versão revertida")
     & P ("audit.audit_created", "entrada de auditoria criada")
     & P ("audit.audit_updated", "entrada de auditoria atualizada")
     & P ("audit.audit_deleted", "entrada de auditoria excluída")
     & P ("audit.audit_restored", "entrada de auditoria restaurada")
     & P ("feature_flag.flag_enabled", "feature flag ativada")
     & P ("feature_flag.flag_disabled", "feature flag desativada")
     & P ("feature_flag.flag_rolling_out", "feature flag em implantação")
     & P ("feature_flag.flag_rolled_back", "feature flag revertida")
     & P ("webhook.webhook_pending", "webhook pendente")
     & P ("webhook.webhook_delivered", "webhook entregue")
     & P ("webhook.webhook_failed", "falha no webhook")
     & P ("webhook.webhook_retrying", "tentando reenviar webhook")
     & P ("api_key.api_key_active", "chave de API ativa")
     & P ("api_key.api_key_revoked", "chave de API revogada")
     & P ("api_key.api_key_expired", "chave de API expirada")
     & P ("api_key.api_key_rotated", "chave de API rotacionada")
     & P ("quota.quota_available", "cota disponível")
     & P ("quota.quota_near_limit", "cota quase esgotada")
     & P ("quota.quota_exceeded", "cota excedida")
     & P ("quota.quota_reset", "cota redefinida")
     & P ("invoice.invoice_draft", "rascunho de fatura")
     & P ("invoice.invoice_sent", "fatura enviada")
     & P ("invoice.invoice_paid", "fatura paga")
     & P ("invoice.invoice_refunded", "fatura reembolsada")
     & P ("invoice.invoice_overdue", "fatura vencida")
     & P ("invoice.refund_failed", "falha no reembolso")
     & P ("page_navigation.only", "página única")
     & P ("page_navigation.first", "primeira página, próxima disponível")
     & P ("page_navigation.last", "última página, anterior disponível")
     & P ("page_navigation.middle", "anterior e próxima disponíveis")
     & P ("end_of_week", "fim da semana")
     & P ("end_of_month", "fim do mês")
     & P ("end_of_quarter", "fim do trimestre")
     & P ("time_of_day.night", "madrugada")
     & P ("time_of_day.morning", "manhã")
     & P ("time_of_day.afternoon", "tarde")
     & P ("time_of_day.evening", "noite")
     & P ("calendar_difference.same_day", "mesmo dia")
     & P ("calendar_difference.zero", "0 dia")
     & P ("queue_summary.empty", "fila vazia");
end Locale_Pt;
