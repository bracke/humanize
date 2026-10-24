separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Pt_Pt (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "pt-PT", Name, Template);
   end P;
begin
   P ("showing_count",
      "a mostrar {showing} de {total} {total, plural, one {{one}} many "
      & "{{many}} other {{other}}}");
   P ("collection.none_shown", "não há {other} a mostrar");
   P ("collection.showing_hidden",
      "a mostrar {visible} de {total} {total, plural, one {{one}} many "
      & "{{many}} other {{other}}}, {hidden} não {hidden, plural, one "
      & "{visível} other {visíveis}}");
   P ("collection.showing",
      "a mostrar {visible} de {total} {total, plural, one {{one}} many "
      & "{{many}} other {{other}}}");
   P ("step_count", "passo {step} de {total}");
   P ("cpu_load", "utilização da CPU {measure}");
   P ("screen_size", "ecrã {measure}");
   P ("recurrence.day", "{every, plural, =1 {todos os dias} other {a cada {every} dias}}");
   P ("recurrence.week", "{every, plural, =1 {todas as semanas} other {a cada {every} semanas}}");
   P ("recurrence.month", "{every, plural, =1 {todos os meses} other {a cada {every} meses}}");
   P ("recurrence.quarter",
      "{every, plural, =1 {todos os trimestres} other {a cada {every} "
      & "trimestres}}");
   P ("recurrence.year", "{every, plural, =1 {todos os anos} other {a cada {every} anos}}");
   P ("cache_summary.empty", "cache: nenhum pedido");
   P ("domain_summary",
      "{domain, select, queue {fila} job {tarefa} run {execução} cache "
      & "{cache} sync {sincronização} import {importação} export "
      & "{exportação} other {{domain}}} {state, select, queued {na fila} "
      & "running {em execução} waiting {em espera} paused {{domain, select, "
      & "queue {pausada} job {pausada} run {pausada} cache {pausada} sync "
      & "{pausada} import {pausada} export {pausada} other {pausado}}} complete "
      & "{{domain, select, queue {concluída} job {concluída} run {concluída} "
      & "cache {concluída} sync {concluída} import {concluída} export "
      & "{concluída} other {concluído}}} failed {com falha} stale {{domain, "
      & "select, queue {desatualizada} job {desatualizada} run {desatualizada} "
      & "cache {desatualizada} sync {desatualizada} import {desatualizada} "
      & "export {desatualizada} other {desatualizado}}} skipped {{domain, "
      & "select, queue {ignorada} job {ignorada} run {ignorada} cache "
      & "{ignorada} sync {ignorada} import {ignorada} export {ignorada} other "
      & "{ignorado}}} other {{state}}}: {details}");
   P ("backup.backup_running", "cópia de segurança em curso");
   P ("backup.backup_completed", "cópia de segurança concluída");
   P ("backup.backup_failed", "falha na cópia de segurança");
   P ("backup.backup_stale", "cópia de segurança desatualizada");
   P ("incident.incident_investigating", "a investigar incidente");
   P ("audit.audit_deleted", "entrada de auditoria eliminada");
   P ("flag.flag_rolling_out", "feature flag em implementação");
   P ("webhook.webhook_retrying", "a tentar reenviar webhook");
   P ("api_key.api_key_rotated", "chave de API rodada");
   P ("quota.quota_available", "quota disponível");
   P ("quota.quota_near_limit", "quota quase esgotada");
   P ("quota.quota_exceeded", "quota excedida");
   P ("quota.quota_reset", "quota reposta");
   P ("page_navigation.first", "primeira página, seguinte disponível");
   P ("page_navigation.middle", "anterior e seguinte disponíveis");
   P ("auth.signed_in", "sessão iniciada");
   P ("auth.signed_out", "sessão terminada");
   P ("ci.deploy_blocked", "implementação bloqueada");
   P ("collaboration.do_not_disturb", "não incomodar");
   P ("collaboration.typing", "a escrever");
   P ("collaboration.viewing", "a visualizar");
   P ("collaboration.editing", "a editar");
   P ("deployment.deploying", "a implementar");
   P ("deployment.deployed", "implementado");
   P ("deployment.rolling_back", "a reverter");
   P ("empty.nothing_to_show", "nada a mostrar");
   P ("file.uploading", "a carregar");
   P ("file.downloading", "a transferir");
   P ("file.copying", "a copiar");
   P ("file.moving", "a mover");
   P ("file.deleting", "a eliminar");
   P ("file.deleted", "eliminado");
   P ("file.restoring", "a restaurar");
   P ("health.recovering", "a recuperar");
   P ("issue.merged", "integrado");
   P ("network.connecting", "a ligar");
   P ("network.syncing", "a sincronizar");
   P ("ui.loading", "a carregar");
   P ("ui.saving", "a guardar");
   P ("ui.saved", "guardado");
   P ("ui.unsaved", "não guardado");
   P ("ui.retrying", "a tentar novamente");
   P ("queue.waiting", "em espera");
   P ("search.filtering", "a filtrar");
   P ("security.encrypted", "encriptado");
   P ("security.unencrypted", "não encriptado");
   P ("sync.syncing_now", "a sincronizar agora");
   P ("task.in_progress", "em curso");
   P ("task.waiting_on", "a aguardar");
   P ("transfer.importing", "a importar");
   P ("transfer.exporting", "a exportar");
   P ("database.database_online", "base de dados online");
   P ("database.database_offline", "base de dados offline");
   P ("database.database_degraded", "base de dados degradada");
   P ("database.database_migrating", "migração da base de dados em curso");
   P ("database.database_migration_failed", "falha na migração da base de dados");
   P ("database.database_replicating", "replicação da base de dados em curso");
   P ("database.database_replication_lagging", "replicação da base de dados atrasada");
   P ("database.database_backup_running", "cópia de segurança da base de dados em curso");
   P ("database.database_backup_failed", "falha na cópia de segurança da base de dados");
   P ("operation.retrying", "a tentar novamente");
   P ("system.service.unknown", "estado do serviço desconhecido");
   P ("system.readiness.starting", "a iniciar");
   P ("system.readiness.draining", "a drenar");
   P ("system.component.starting", "a iniciar");
   P ("system.component.stopping", "a parar");
   P ("system.component.restarting", "a reiniciar");
   P ("system.component.unknown", "estado do componente desconhecido");
   P ("system.check.failing", "a falhar");
   P ("system.check.unknown", "estado da verificação desconhecido");
   P ("system.incident.investigating", "a investigar");
   P ("system.incident.monitoring", "a monitorizar");
   P ("net_diagnostic.tcp", "{endpoint}: falha na ligação TCP");
   P ("net_diagnostic.http", "{endpoint}: falha no pedido HTTP");
   P ("net_diagnostic.reset", "{endpoint}: ligação reposta");
   P ("progress.state.retrying", "a tentar novamente");
   P ("calendar_date.month_phase",
      "{phase, select, early {início de {text}} mid {meados de {text}} other "
      & "{finais de {text}}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {início do {text}} mid {meados do {text}} other "
      & "{finais do {text}}}");
   P ("calendar_range.weekend.last", "o fim de semana passado");
   P ("calendar_range.weekend.next", "o próximo fim de semana");
   P ("calendar_range.week.last", "a semana passada");
   P ("calendar_range.week.next", "a próxima semana");
   P ("http.reason.101", "a mudar de protocolo");
   P ("http.reason.102", "a processar");
   P ("http.reason.202", "aceite");
   P ("http.reason.400", "pedido inválido");
   P ("http.reason.408", "tempo limite do pedido esgotado");
   P ("http.reason.415", "tipo de multimédia não suportado");
   P ("http.reason.421", "pedido mal direcionado");
   P ("http.reason.429", "demasiados pedidos");
   P ("http.reason.431", "campos de cabeçalho do pedido demasiado grandes");
   P ("errno.reason.2", "ficheiro ou pasta inexistente");
   P ("errno.reason.9", "mau descritor de ficheiro");
   P ("errno.reason.17", "o ficheiro existe");
   P ("errno.reason.24", "demasiados ficheiros abertos");
   P ("errno.reason.110", "ligação expirada");
   P ("errno.reason.111", "ligação recusada");
   P ("signal.reason.10", "sinal 1 definido pelo utilizador");
   P ("signal.reason.12", "sinal 2 definido pelo utilizador");
   P ("sqlstate.reason.08", "exceção de ligação");
   P ("http.reason.unknown", "estado desconhecido");
   P ("http.reason.413", "conteúdo demasiado grande");
   P ("http.reason.414", "URI demasiado longo");
   P ("http.reason.508", "ciclo detetado");
   P ("errno.reason.0", "Sucesso");
   P ("errno.reason.1", "Operação não permitida");
   P ("errno.reason.3", "Processo inexistente");
   P ("errno.reason.4", "Chamada de sistema interrompida");
   P ("errno.reason.5", "Erro de entrada/saída");
   P ("errno.reason.6", "Dispositivo ou endereço inexistente");
   P ("errno.reason.11", "Recurso temporariamente indisponível");
   P ("errno.reason.12", "Impossível alocar memória");
   P ("errno.reason.13", "Permissão recusada");
   P ("errno.reason.20", "Não é pasta");
   P ("errno.reason.21", "É pasta");
   P ("errno.reason.22", "Argumento inválido");
   P ("errno.reason.28", "Sem espaço livre no dispositivo");
   P ("errno.reason.32", "Túnel quebrado");
   P ("errno.reason.98", "Endereço já em uso");
   P ("signal.reason.1", "Desligar");
   P ("signal.reason.2", "Interromper");
   P ("signal.reason.3", "Sair");
   P ("signal.reason.4", "Instrução ilegal");
   P ("signal.reason.5", "Armadilha de rastreio/ponto de quebra");
   P ("signal.reason.6", "Abortado");
   P ("signal.reason.7", "Erro de bus");
   P ("signal.reason.8", "Excepção de vírgula flutuante");
   P ("signal.reason.9", "Morto");
   P ("signal.reason.11", "Falta de segmentação");
   P ("signal.reason.13", "Túnel quebrado");
   P ("signal.reason.14", "Alarme");
   P ("signal.reason.15", "Terminado");
   P ("signal.reason.17", "Filho saiu");
   P ("signal.reason.18", "Continuado");
   P ("signal.reason.19", "Parado (sinal)");
   P ("signal.reason.20", "Parado");
   P ("signal.reason.28", "Janela alterada");
   P ("diff.redacted", "diff {path}: alterado; valores ocultos");
   P ("file.kind.plain", "ficheiro");
   P ("file.kind.archive", "pacote de ficheiros");
   P ("file.kind.compressed", "ficheiro comprimido");
   P ("file.kind.unknown", "ficheiro desconhecido");
   P ("file.metadata", "ficheiro {name}: {kind}");
   P ("file.signature_match", "assinatura de ficheiro {name}: {kind}, corresponde à extensão");
   P ("file.signature_mismatch",
      "assinatura de ficheiro {name}: extensão do tipo {expected}, conteúdo "
      & "do tipo {actual}");
   P ("network_event.connecting", "a ligar");
   P ("network_event.connected", "ligado");
   P ("network_event.retrying", "a tentar novamente");
   P ("network_event.stalled", "parado");
   P ("checksum.mismatch", "soma de verificação não coincidente");
   P ("checksum.missing", "soma de verificação em falta");
   P ("time_zone.local", "fuso horário: hora local");
   P ("time_zone.dst", "{text}, aplica a hora de verão");
   P ("zoned_time.plain", "hora com fuso: {time} {offset}");
   P ("zoned_time.named", "hora com fuso: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, hora local ambígua");
   P ("number.change_down", "desce {quantity}");
   P ("duration.backup_age", "a cópia de segurança tem {duration}");
   P ("duration.distance.future", "dentro de {duration}");
   P ("geo.direction.east_north_east", "{style, select, short {ENE} other {és-nordeste}}");
   P ("geo.direction.east", "{style, select, short {E} other {este}}");
   P ("geo.direction.east_south_east", "{style, select, short {ESE} other {és-sudeste}}");
end Locale_Pt_Pt;
