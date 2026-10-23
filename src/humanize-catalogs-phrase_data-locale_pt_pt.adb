separate (Humanize.Catalogs.Phrase_Data)
function Locale_Pt_Pt return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("pt-PT", Name, Template));
begin
   return
     P ("showing_count",
          "a mostrar {showing} de {total} {total, plural, one {{one}} many "
          & "{{many}} other {{other}}}")
     & P ("collection.none_shown", "não há {other} a mostrar")
     & P ("collection.showing_hidden",
          "a mostrar {visible} de {total} {total, plural, one {{one}} many "
          & "{{many}} other {{other}}}, {hidden} não {hidden, plural, one "
          & "{visível} other {visíveis}}")
     & P ("collection.showing",
          "a mostrar {visible} de {total} {total, plural, one {{one}} many "
          & "{{many}} other {{other}}}")
     & P ("step_count", "passo {step} de {total}")
     & P ("cpu_load", "utilização da CPU {measure}")
     & P ("screen_size", "ecrã {measure}")
     & P ("recurrence.day", "{every, plural, =1 {todos os dias} other {a cada {every} dias}}")
     & P ("recurrence.week", "{every, plural, =1 {todas as semanas} other {a cada {every} semanas}}")
     & P ("recurrence.month", "{every, plural, =1 {todos os meses} other {a cada {every} meses}}")
     & P ("recurrence.quarter",
          "{every, plural, =1 {todos os trimestres} other {a cada {every} "
          & "trimestres}}")
     & P ("recurrence.year", "{every, plural, =1 {todos os anos} other {a cada {every} anos}}")
     & P ("cache_summary.empty", "cache: nenhum pedido")
     & P ("domain_summary",
          "{domain, select, queue {fila} job {tarefa} run {execução} cache "
          & "{cache} sync {sincronização} import {importação} export "
          & "{exportação} other {{domain}}} {state, select, queued {na fila} "
          & "running {em execução} waiting {em espera} paused {{domain, select, "
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
     & P ("backup.backup_running", "cópia de segurança em curso")
     & P ("backup.backup_completed", "cópia de segurança concluída")
     & P ("backup.backup_failed", "falha na cópia de segurança")
     & P ("backup.backup_stale", "cópia de segurança desatualizada")
     & P ("incident.incident_investigating", "a investigar incidente")
     & P ("audit.audit_deleted", "entrada de auditoria eliminada")
     & P ("flag.flag_rolling_out", "feature flag em implementação")
     & P ("webhook.webhook_retrying", "a tentar reenviar webhook")
     & P ("api_key.api_key_rotated", "chave de API rodada")
     & P ("quota.quota_available", "quota disponível")
     & P ("quota.quota_near_limit", "quota quase esgotada")
     & P ("quota.quota_exceeded", "quota excedida")
     & P ("quota.quota_reset", "quota reposta")
     & P ("page_navigation.first", "primeira página, seguinte disponível")
     & P ("page_navigation.middle", "anterior e seguinte disponíveis")
     & P ("auth.signed_in", "sessão iniciada")
     & P ("auth.signed_out", "sessão terminada")
     & P ("ci.deploy_blocked", "implementação bloqueada")
     & P ("collaboration.do_not_disturb", "não incomodar")
     & P ("collaboration.typing", "a escrever")
     & P ("collaboration.viewing", "a visualizar")
     & P ("collaboration.editing", "a editar")
     & P ("deployment.deploying", "a implementar")
     & P ("deployment.deployed", "implementado")
     & P ("deployment.rolling_back", "a reverter")
     & P ("empty.nothing_to_show", "nada a mostrar")
     & P ("file.uploading", "a carregar")
     & P ("file.downloading", "a transferir")
     & P ("file.copying", "a copiar")
     & P ("file.moving", "a mover")
     & P ("file.deleting", "a eliminar")
     & P ("file.deleted", "eliminado")
     & P ("file.restoring", "a restaurar")
     & P ("health.recovering", "a recuperar")
     & P ("issue.merged", "integrado")
     & P ("network.connecting", "a ligar")
     & P ("network.syncing", "a sincronizar")
     & P ("ui.loading", "a carregar")
     & P ("ui.saving", "a guardar")
     & P ("ui.saved", "guardado")
     & P ("ui.unsaved", "não guardado")
     & P ("ui.retrying", "a tentar novamente")
     & P ("queue.waiting", "em espera")
     & P ("search.filtering", "a filtrar")
     & P ("security.encrypted", "encriptado")
     & P ("security.unencrypted", "não encriptado")
     & P ("sync.syncing_now", "a sincronizar agora")
     & P ("task.in_progress", "em curso")
     & P ("task.waiting_on", "a aguardar")
     & P ("transfer.importing", "a importar")
     & P ("transfer.exporting", "a exportar")
     & P ("database.database_online", "base de dados online")
     & P ("database.database_offline", "base de dados offline")
     & P ("database.database_degraded", "base de dados degradada")
     & P ("database.database_migrating", "migração da base de dados em curso")
     & P ("database.database_migration_failed", "falha na migração da base de dados")
     & P ("database.database_replicating", "replicação da base de dados em curso")
     & P ("database.database_replication_lagging", "replicação da base de dados atrasada")
     & P ("database.database_backup_running", "cópia de segurança da base de dados em curso")
     & P ("database.database_backup_failed", "falha na cópia de segurança da base de dados")
     & P ("operation.retrying", "a tentar novamente")
     & P ("system.service.unknown", "estado do serviço desconhecido")
     & P ("system.readiness.starting", "a iniciar")
     & P ("system.readiness.draining", "a drenar")
     & P ("system.component.starting", "a iniciar")
     & P ("system.component.stopping", "a parar")
     & P ("system.component.restarting", "a reiniciar")
     & P ("system.component.unknown", "estado do componente desconhecido")
     & P ("system.check.failing", "a falhar")
     & P ("system.check.unknown", "estado da verificação desconhecido")
     & P ("system.incident.investigating", "a investigar")
     & P ("system.incident.monitoring", "a monitorizar");
end Locale_Pt_Pt;
