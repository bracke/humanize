separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Fr (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "fr", Name, Template);
   end P;
begin
   P ("all_count",
      "{total, plural, one {{total} {one}} many {les {total} {many}} other "
      & "{les {total} {other}}}");
   P ("filtered_count.none",
      "{gender, select, masculine {aucun {one} ne correspond} feminine "
      & "{aucune {one} ne correspond} other {aucune correspondance parmi les "
      & "{other}}}");
   P ("filtered_count.all",
      "{total, plural, one {{total} {one} sur {total} correspond} many {les "
      & "{total} {many} correspondent} other {les {total} {other} "
      & "correspondent}}");
   P ("filtered_count.some",
      "{matching, plural, one {{matching} {one} sur {total} correspond} many "
      & "{{matching} {many} sur {total} correspondent} other {{matching} "
      & "{other} sur {total} correspondent}}");
   P ("more_count",
      "{visible, plural, one {{visible} visible} other {{visible} visibles}}, "
      & "{remaining} de plus");
   P ("others_count",
      "{first} et {remaining, plural, one {1 autre} other {{remaining} "
      & "autres}}");
   P ("page_count", "page {page} sur {total}");
   P ("page_size",
      "{size} {size, plural, one {{one}} many {{many}} other {{other}}} par "
      & "page");
   P ("pagination_range",
      "{first}–{last} sur {total} {total, plural, one {{one}} many {{many}} "
      & "other {{other}}}");
   P ("position_count", "{position} sur {total}");
   P ("selection_count",
      "{gender, select, masculine {{selected} {selected, plural, one {{one}} "
      & "many {{many}} other {{other}}} sur {total} {selected, plural, one "
      & "{sélectionné} other {sélectionnés}}} feminine {{selected} "
      & "{selected, plural, one {{one}} many {{many}} other {{other}}} sur "
      & "{total} {selected, plural, one {sélectionnée} other "
      & "{sélectionnées}}} other {sélection : {selected} {selected, plural, "
      & "one {{one}} many {{many}} other {{other}}} sur {total}}}");
   P ("showing_count",
      "affichage de {showing} {showing, plural, one {{one}} many {{many}} "
      & "other {{other}}} sur {total}");
   P ("validation_count",
      "{count, plural, =0 {{severity, select, error {aucune erreur} warning "
      & "{aucun avertissement} other {aucune information}}} one {{count} "
      & "{severity, select, error {erreur} warning {avertissement} other "
      & "{information}}} other {{count} {severity, select, error {erreurs} "
      & "warning {avertissements} other {informations}}}}");
   P ("collection.empty",
      "{gender, select, masculine {aucun {one}} feminine {aucune {one}} other "
      & "{pas de {other}}}");
   P ("collection.none_shown",
      "{gender, select, masculine {aucun {one} à afficher} feminine {aucune "
      & "{one} à afficher} other {pas de {other} à afficher}}");
   P ("collection.showing_hidden",
      "affichage de {visible} {visible, plural, one {{one}} many {{many}} "
      & "other {{other}}} sur {total}, {hidden, plural, one {{hidden} non "
      & "visible} other {{hidden} non visibles}}");
   P ("collection.showing",
      "affichage de {visible} {visible, plural, one {{one}} many {{many}} "
      & "other {{other}}} sur {total}");
   P ("collection.shown_hidden",
      "{visible, plural, one {{visible} {one} visible} many {{visible} {many} "
      & "visibles} other {{visible} {other} visibles}}, {hidden, plural, one "
      & "{{hidden} non visible} other {{hidden} non visibles}}");
   P ("collection.shown",
      "{visible, plural, one {{visible} {one} visible} many {{visible} {many} "
      & "visibles} other {{visible} {other} visibles}}");
   P ("collection.visible_out_of",
      "{visible, plural, one {{visible} {one} visible} many {{visible} {many} "
      & "visibles} other {{visible} {other} visibles}} sur {total}");
   P ("complete_count", "{done} sur {total} {done, plural, one {terminé} other {terminés}}");
   P ("percent_complete", "{percent} % terminé");
   P ("step_count", "étape {step} sur {total}");
   P ("attempt_count", "tentative {attempt} sur {total}");
   P ("throughput_remaining",
      "encore {remaining} {remaining, plural, one {{one}} many {{many}} other "
      & "{{other}}} à {rate} {unit}/s");
   P ("accessible_progress",
      "{done} sur {total} {done, plural, one {terminé} other {terminés}}, "
      & "{percent} pour cent");
   P ("business_days", "{days} {days, plural, one {jour ouvré} other {jours ouvrés}}");
   P ("working_hours",
      "{hours} {hours, plural, one {heure de travail} other {heures de "
      & "travail}}");
   P ("due.overdue", "en retard de {days} {days, plural, one {jour} other {jours}}");
   P ("due.today", "échéance aujourd’hui");
   P ("due.tomorrow", "échéance demain");
   P ("due.in", "échéance dans {days} jours");
   P ("calendar_difference.future", "dans {difference}");
   P ("calendar_difference.past", "il y a {difference}");
   P ("cpu_load", "charge CPU {measure}");
   P ("battery", "batterie {measure}");
   P ("screen_size", "écran {measure}");
   P ("refresh_rate", "fréquence de rafraîchissement {measure}");
   P ("editorial_percent.symbol", "{value} %");
   P ("editorial_percent.word", "{value} pour cent");
   P ("recurrence.second",
      "{every, plural, =1 {chaque seconde} other {toutes les {every} "
      & "secondes}}");
   P ("recurrence.minute", "{every, plural, =1 {chaque minute} other {toutes les {every} minutes}}");
   P ("recurrence.hour", "{every, plural, =1 {chaque heure} other {toutes les {every} heures}}");
   P ("recurrence.day", "{every, plural, =1 {chaque jour} other {tous les {every} jours}}");
   P ("recurrence.week",
      "{every, plural, =1 {chaque semaine} other {toutes les {every} "
      & "semaines}}");
   P ("recurrence.month", "{every, plural, =1 {chaque mois} other {tous les {every} mois}}");
   P ("recurrence.quarter",
      "{every, plural, =1 {chaque trimestre} other {tous les {every} "
      & "trimestres}}");
   P ("recurrence.year", "{every, plural, =1 {chaque année} other {tous les {every} ans}}");
   P ("cache_summary.empty", "cache : aucune requête");
   P ("cache_summary",
      "cache : {hits} succès, {misses} {misses, plural, one {échec} other "
      & "{échecs}}, taux de succès {rate} %");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} many {{many}} other {{other}}} : "
      & "{changed, plural, one {{changed} modification} other {{changed} "
      & "modifications}}, {added, plural, one {{added} ajout} other {{added} "
      & "ajouts}}, {removed, plural, one {{removed} suppression} other "
      & "{{removed} suppressions}}");
   P ("field_diff", "{field} : valeur modifiée de {before} à {after}");
   P ("field_added", "{field} : valeur {value} ajoutée");
   P ("field_removed", "{field} : valeur {value} supprimée");
   P ("field_unchanged", "{field} : toujours {value}");
   P ("number_comparison.equal", "{current} est égal à {baseline}");
   P ("number_comparison.higher", "{current} est supérieur de {quantity} à {baseline}");
   P ("number_comparison.lower", "{current} est inférieur de {quantity} à {baseline}");
   P ("percent_comparison.equal", "{current} est égal à {baseline}");
   P ("percent_comparison.higher", "{current} est supérieur de {quantity} à {baseline}");
   P ("percent_comparison.lower", "{current} est inférieur de {quantity} à {baseline}");
   P ("file_size_comparison.same", "{current} a la même taille que {baseline}");
   P ("file_size_comparison.larger", "{current} fait {quantity} de plus que {baseline}");
   P ("file_size_comparison.smaller", "{current} fait {quantity} de moins que {baseline}");
   P ("date_comparison.same", "{current} tombe le même jour que {baseline}");
   P ("date_comparison.after", "{current} tombe {quantity} après {baseline}");
   P ("date_comparison.before", "{current} tombe {quantity} avant {baseline}");
   P ("queue_summary", "file d’attente : {details}");
   P ("domain_summary",
      "{domain, select, queue {file d’attente} job {tâche} run "
      & "{exécution} cache {cache} sync {synchronisation} import {importation} "
      & "export {exportation} other {{domain}}} {state, select, queued {en file "
      & "d’attente} running {en cours} waiting {en attente} paused {en pause} "
      & "complete {{domain, select, queue {terminée} job {terminée} run "
      & "{terminée} cache {terminé} sync {terminée} import {terminée} "
      & "export {terminée} other {terminé}}} failed {en échec} stale "
      & "{obsolète} skipped {{domain, select, queue {ignorée} job {ignorée} "
      & "run {ignorée} cache {ignoré} sync {ignorée} import {ignorée} "
      & "export {ignorée} other {ignoré}}} other {{state}}} : {details}");
   P ("summary.none",
      "{gender, select, masculine {aucun {one}} feminine {aucune {one}} other "
      & "{pas de {other}}}");
   P ("summary.completed",
      "{gender, select, masculine {{count} {count, plural, one {{one}} many "
      & "{{many}} other {{other}}} {count, plural, one {terminé} other "
      & "{terminés}}} feminine {{count} {count, plural, one {{one}} many "
      & "{{many}} other {{other}}} {count, plural, one {terminée} other "
      & "{terminées}}} other {terminé : {count} {count, plural, one {{one}} "
      & "many {{many}} other {{other}}}}}");
   P ("summary.completed_of",
      "{gender, select, masculine {{count} {count, plural, one {{one}} many "
      & "{{many}} other {{other}}} sur {total} {count, plural, one {terminé} "
      & "other {terminés}}} feminine {{count} {count, plural, one {{one}} many "
      & "{{many}} other {{other}}} sur {total} {count, plural, one {terminée} "
      & "other {terminées}}} other {terminé : {count} {count, plural, one "
      & "{{one}} many {{many}} other {{other}}} sur {total}}}");
   P ("summary.failed", "{count} en échec");
   P ("summary.queued",
      "{count} {count, plural, one {{one}} many {{many}} other {{other}}} en "
      & "file d’attente");
   P ("summary.running", "{count} en cours");
   P ("summary.complete", "{count} {count, plural, one {terminé} other {terminés}}");
   P ("backup.backup_running", "sauvegarde en cours");
   P ("backup.backup_completed", "sauvegarde terminée");
   P ("backup.backup_failed", "échec de la sauvegarde");
   P ("backup.backup_stale", "sauvegarde obsolète");
   P ("incident.incident_investigating", "incident en cours d’analyse");
   P ("incident.incident_identified", "incident identifié");
   P ("incident.incident_mitigated", "incident atténué");
   P ("incident.incident_resolved", "incident résolu");
   P ("release.release_drafting", "version en préparation");
   P ("release.release_ready", "version prête");
   P ("release.release_published", "version publiée");
   P ("release.release_rolled_back", "version annulée");
   P ("audit.audit_created", "entrée d’audit créée");
   P ("audit.audit_updated", "entrée d’audit mise à jour");
   P ("audit.audit_deleted", "entrée d’audit supprimée");
   P ("audit.audit_restored", "entrée d’audit restaurée");
   P ("flag.flag_enabled", "feature flag activé");
   P ("flag.flag_disabled", "feature flag désactivé");
   P ("flag.flag_rolling_out", "feature flag en cours de déploiement");
   P ("flag.flag_rolled_back", "feature flag annulé");
   P ("webhook.webhook_pending", "webhook en attente");
   P ("webhook.webhook_delivered", "webhook livré");
   P ("webhook.webhook_failed", "échec du webhook");
   P ("webhook.webhook_retrying", "webhook : nouvelle tentative");
   P ("api_key.api_key_active", "clé d’API active");
   P ("api_key.api_key_revoked", "clé d’API révoquée");
   P ("api_key.api_key_expired", "clé d’API expirée");
   P ("api_key.api_key_rotated", "clé d’API renouvelée");
   P ("quota.quota_available", "quota disponible");
   P ("quota.quota_near_limit", "quota presque atteint");
   P ("quota.quota_exceeded", "quota dépassé");
   P ("quota.quota_reset", "quota réinitialisé");
   P ("invoice.invoice_draft", "brouillon de facture");
   P ("invoice.invoice_sent", "facture envoyée");
   P ("invoice.invoice_paid", "facture payée");
   P ("invoice.invoice_refunded", "facture remboursée");
   P ("invoice.invoice_overdue", "facture en retard");
   P ("invoice.refund_failed", "échec du remboursement");
   P ("page_navigation.only", "page unique");
   P ("page_navigation.first", "première page, page suivante disponible");
   P ("page_navigation.last", "dernière page, page précédente disponible");
   P ("page_navigation.middle", "pages précédente et suivante disponibles");
   P ("end_of_week", "fin de la semaine");
   P ("end_of_month", "fin du mois");
   P ("end_of_quarter", "fin du trimestre");
   P ("time_of_day.night", "nuit");
   P ("time_of_day.morning", "matin");
   P ("time_of_day.afternoon", "après-midi");
   P ("time_of_day.evening", "soir");
   P ("calendar_difference.same_day", "le même jour");
   P ("calendar_difference.zero", "0 jour");
   P ("queue_summary.empty", "file d’attente vide");
   P ("access.allowed", "autorisé");
   P ("access.denied", "refusé");
   P ("access.owner", "propriétaire");
   P ("access.admin", "administrateur");
   P ("access.viewer", "lecteur");
   P ("access.editor", "éditeur");
   P ("auth.signed_in", "connecté");
   P ("auth.signed_out", "déconnecté");
   P ("auth.session_expired", "session expirée");
   P ("auth.locked", "verrouillé");
   P ("auth.two_factor_required", "authentification à deux facteurs requise");
   P ("billing.trialing", "période d’essai");
   P ("billing.payment_due", "paiement dû");
   P ("billing.payment_failed", "échec du paiement");
   P ("billing.paid", "payé");
   P ("billing.past_due", "en retard de paiement");
   P ("billing.canceled", "annulé");
   P ("ci.pipeline_pending", "pipeline en attente");
   P ("ci.pipeline_running", "pipeline en cours");
   P ("ci.pipeline_passed", "pipeline réussi");
   P ("ci.pipeline_failed", "échec du pipeline");
   P ("ci.review_required", "revue requise");
   P ("ci.deploy_blocked", "déploiement bloqué");
   P ("collaboration.active_now", "actif maintenant");
   P ("collaboration.away", "absent");
   P ("collaboration.do_not_disturb", "ne pas déranger");
   P ("collaboration.typing", "en train d’écrire");
   P ("collaboration.viewing", "en train de consulter");
   P ("collaboration.editing", "en train de modifier");
   P ("deployment.deploying", "déploiement en cours");
   P ("deployment.deployed", "déployé");
   P ("deployment.rolling_back", "restauration en cours");
   P ("deployment.rolled_back", "restauré");
   P ("deployment.build_failed", "échec de la compilation");
   P ("deployment.checks_passed", "vérifications réussies");
   P ("empty.no_items", "aucun élément");
   P ("empty.no_results", "aucun résultat");
   P ("empty.no_messages", "aucun message");
   P ("empty.no_selection", "aucune sélection");
   P ("empty.nothing_to_show", "rien à afficher");
   P ("file.uploading", "envoi en cours");
   P ("file.downloading", "téléchargement en cours");
   P ("file.copying", "copie en cours");
   P ("file.moving", "déplacement en cours");
   P ("file.deleting", "suppression en cours");
   P ("file.deleted", "supprimé");
   P ("file.restoring", "restauration en cours");
   P ("file.synced", "synchronisé");
   P ("form.valid_input", "saisie valide");
   P ("form.invalid_input", "saisie non valide");
   P ("form.dirty", "modifié");
   P ("form.pristine", "non modifié");
   P ("form.submitted", "envoyé");
   P ("form.submission_failed", "échec de l’envoi");
   P ("health.healthy", "sain");
   P ("health.degraded", "dégradé");
   P ("health.unhealthy", "défaillant");
   P ("health.incident", "incident");
   P ("health.maintenance", "maintenance");
   P ("health.recovering", "rétablissement en cours");
   P ("issue.open", "ouvert");
   P ("issue.closed", "fermé");
   P ("issue.reopened", "rouvert");
   P ("issue.assigned", "attribué");
   P ("issue.unassigned", "non attribué");
   P ("issue.merged", "fusionné");
   P ("network.offline", "hors ligne");
   P ("network.online", "en ligne");
   P ("network.connecting", "connexion en cours");
   P ("network.syncing", "synchronisation en cours");
   P ("network.sync_failed", "échec de la synchronisation");
   P ("network.permission_denied", "autorisation refusée");
   P ("network.read_only", "lecture seule");
   P ("notification.unread", "non lu");
   P ("notification.read", "lu");
   P ("notification.muted", "en sourdine");
   P ("notification.snoozed", "reporté");
   P ("notification.sent", "envoyé");
   P ("notification.delivered", "distribué");
   P ("payment.payment_authorized", "paiement autorisé");
   P ("payment.payment_captured", "paiement encaissé");
   P ("payment.payment_refunded", "paiement remboursé");
   P ("payment.payment_disputed", "paiement contesté");
   P ("payment.payment_requires_action", "action requise pour le paiement");
   P ("payment.payment_expired", "paiement expiré");
   P ("ui.empty", "vide");
   P ("ui.loading", "chargement");
   P ("ui.saving", "enregistrement");
   P ("ui.saved", "enregistré");
   P ("ui.unsaved", "non enregistré");
   P ("ui.retrying", "nouvelle tentative");
   P ("ui.paused", "en pause");
   P ("ui.complete", "terminé");
   P ("ui.failed", "échec");
   P ("ui.due_soon", "échéance proche");
   P ("ui.overdue", "en retard");
   P ("ui.last_seen", "vu pour la dernière fois");
   P ("ui.updated_just_now", "mis à jour à l’instant");
   P ("queue.queued", "en file d’attente");
   P ("queue.running", "en cours");
   P ("queue.waiting", "en attente");
   P ("queue.blocked", "bloqué");
   P ("queue.canceled_job", "tâche annulée");
   P ("queue.completed_job", "tâche terminée");
   P ("search.filtering", "filtrage en cours");
   P ("search.filtered", "filtré");
   P ("search.no_matches", "aucune correspondance");
   P ("search.search_ready", "recherche prête");
   P ("search.search_failed", "échec de la recherche");
   P ("search.query_too_short", "requête trop courte");
   P ("security.secure", "sécurisé");
   P ("security.insecure", "non sécurisé");
   P ("security.vulnerable", "vulnérable");
   P ("security.encrypted", "chiffré");
   P ("security.unencrypted", "non chiffré");
   P ("security.token_expired", "jeton expiré");
   P ("sync.sync_idle", "synchronisation inactive");
   P ("sync.syncing_now", "synchronisation en cours");
   P ("sync.sync_queued", "synchronisation en attente");
   P ("sync.sync_conflict", "conflit de synchronisation");
   P ("sync.sync_complete", "synchronisation terminée");
   P ("sync.sync_error", "erreur de synchronisation");
   P ("task.todo", "à faire");
   P ("task.in_progress", "en cours");
   P ("task.done", "terminé");
   P ("task.skipped", "ignoré");
   P ("task.blocked_task", "bloqué");
   P ("task.waiting_on", "en attente de");
   P ("ticket.ticket_new", "nouveau ticket");
   P ("ticket.ticket_open", "ticket ouvert");
   P ("ticket.ticket_waiting", "ticket en attente");
   P ("ticket.ticket_escalated", "ticket escaladé");
   P ("ticket.ticket_resolved", "ticket résolu");
   P ("ticket.ticket_closed", "ticket fermé");
   P ("transfer.importing", "importation en cours");
   P ("transfer.imported", "importé");
   P ("transfer.import_failed", "échec de l’importation");
   P ("transfer.exporting", "exportation en cours");
   P ("transfer.exported", "exporté");
   P ("transfer.export_failed", "échec de l’exportation");
   P ("validation.required", "obligatoire");
   P ("validation.optional", "facultatif");
   P ("validation.invalid", "non valide");
   P ("validation.too_short", "trop court");
   P ("validation.too_long", "trop long");
   P ("validation.out_of_range", "hors limites");
   P ("validation.already_exists", "existe déjà");
   P ("workflow.draft", "brouillon");
   P ("workflow.in_review", "en cours de révision");
   P ("workflow.approved", "approuvé");
   P ("workflow.rejected", "rejeté");
   P ("workflow.published", "publié");
   P ("workflow.archived", "archivé");
   P ("database.database_online", "base de données en ligne");
   P ("database.database_offline", "base de données hors ligne");
   P ("database.database_degraded", "base de données dégradée");
   P ("database.database_migrating", "migration de la base de données en cours");
   P ("database.database_migration_failed", "échec de la migration de la base de données");
   P ("database.database_replicating", "réplication de la base de données en cours");
   P ("database.database_replication_lagging", "réplication de la base de données en retard");
   P ("database.database_backup_running", "sauvegarde de la base de données en cours");
   P ("database.database_backup_failed", "échec de la sauvegarde de la base de données");
   P ("times_noun",
      "{count, plural, =0 {{other} : jamais} =1 {{one} : une fois} =2 "
      & "{{other} : deux fois} many {{many} : {count} fois} other {{other} : "
      & "{count} fois}}");
   P ("availability.all",
      "{available} {available, plural, one {{one}} many {{many}} other "
      & "{{other}}} sur {total} {available, plural, one {disponible} other "
      & "{disponibles}}");
   P ("availability.none",
      "{gender, select, masculine {aucun {one} disponible} feminine {aucune "
      & "{one} disponible} other {pas de {other} disponibles}}");
   P ("availability.partial",
      "{available} {available, plural, one {{one}} many {{many}} other "
      & "{{other}}} sur {total} {available, plural, one {disponible} other "
      & "{disponibles}}, {unavailable} {unavailable, plural, one {indisponible} "
      & "other {indisponibles}}");
   P ("operation_progress", "{name} – {state} : {details}");
   P ("operation.queued", "en file d’attente");
   P ("operation.running", "en cours");
   P ("operation.blocked", "bloqué");
   P ("operation.retrying", "nouvelle tentative");
   P ("operation.succeeded", "réussi");
   P ("operation.partially_succeeded", "partiellement réussi");
   P ("operation.failed", "en échec");
   P ("operation.canceled", "annulé");
   P ("operation.skipped", "ignoré");
   P ("operation.stale", "obsolète");
   P ("operation.unknown_state", "inconnu");
   P ("operation.last_success", "{name} – dernière réussite {time}");
   P ("operation.next_retry", "{name} – prochaine tentative {time}");
   P ("operation.stale_run", "{name} – obsolète depuis {time}");
   P ("summary.skipped", "{count} {count, plural, one {ignoré} other {ignorés}}");
   P ("summary.retried", "{count} {count, plural, one {relancé} other {relancés}}");
   P ("summary.canceled", "{count} {count, plural, one {annulé} other {annulés}}");
   P ("system.service.operational", "opérationnel");
   P ("system.service.degraded", "performances dégradées");
   P ("system.service.partial_outage", "panne partielle");
   P ("system.service.major_outage", "panne majeure");
   P ("system.service.maintenance", "en maintenance");
   P ("system.service.unknown", "état du service inconnu");
   P ("system.health.healthy", "sain");
   P ("system.health.warning", "avertissement");
   P ("system.health.critical", "critique");
   P ("system.health.unavailable", "indisponible");
   P ("system.health.unknown_health", "état de santé inconnu");
   P ("system.readiness.ready", "prêt");
   P ("system.readiness.not_ready", "pas prêt");
   P ("system.readiness.starting", "démarrage en cours");
   P ("system.readiness.draining", "vidage en cours");
   P ("system.readiness.stopped", "arrêté");
   P ("system.readiness.unknown_readiness", "état de disponibilité inconnu");
   P ("system.component.online", "en ligne");
   P ("system.component.offline", "hors ligne");
   P ("system.component.starting", "démarrage en cours");
   P ("system.component.stopping", "arrêt en cours");
   P ("system.component.restarting", "redémarrage en cours");
   P ("system.component.unknown", "état du composant inconnu");
   P ("system.check.passing", "réussie");
   P ("system.check.failing", "en échec");
   P ("system.check.warning", "avertissement");
   P ("system.check.skipped", "ignorée");
   P ("system.check.timed_out", "délai dépassé");
   P ("system.check.unknown", "état de la vérification inconnu");
   P ("system.incident.investigating", "enquête en cours");
   P ("system.incident.identified", "identifié");
   P ("system.incident.monitoring", "surveillance en cours");
   P ("system.incident.resolved", "résolu");
   P ("system.incident.scheduled_maintenance", "maintenance planifiée");
   P ("system.named", "{name} : {state}");
   P ("system.check_named", "vérification {name} : {state}");
   P ("system.count.components",
      "{count, plural, =0 {aucun composant} one {{count} composant} many "
      & "{{count} de composants} other {{count} composants}}");
   P ("system.count.checks",
      "{count, plural, =0 {aucune vérification} one {{count} vérification} "
      & "many {{count} de vérifications} other {{count} vérifications}}");
   P ("system.count.incidents",
      "{count, plural, =0 {aucun incident} one {{count} incident} many "
      & "{{count} d’incidents} other {{count} incidents}}");
   P ("system.uptime", "disponibilité : {measure}");
   P ("system.latency", "latence : {measure}");
   P ("system.maintenance_window", "fenêtre de maintenance : {time}");
   P ("system.last_checked", "dernière vérification {time}");
   P ("system.http.informational", "information");
   P ("system.http.successful", "succès");
   P ("system.http.redirection", "redirection");
   P ("system.http.client_error", "erreur client");
   P ("system.http.server_error", "erreur serveur");
   P ("system.exit.success", "code de sortie {code} : succès");
   P ("system.exit.failure", "code de sortie {code} : échec");
   P ("system.exit.usage_error", "code de sortie {code} : erreur d’utilisation");
   P ("system.exit.not_executable", "code de sortie {code} : commande non exécutable");
   P ("system.exit.not_found", "code de sortie {code} : commande introuvable");
   P ("system.exit.invalid_argument", "code de sortie {code} : argument de sortie non valide");
   P ("system.exit.signal", "code de sortie {code} : terminé par {signal}");
   P ("validation.problem.required", "{field} : est obligatoire");
   P ("validation.problem.minimum", "{field} : valeur inférieure au minimum");
   P ("validation.problem.maximum", "{field} : valeur supérieure au maximum");
   P ("validation.problem.range", "{field} : valeur hors de la plage autorisée");
   P ("validation.problem.pattern", "{field} : ne correspond pas au format attendu");
   P ("validation.problem.choice", "{field} : doit faire partie des choix autorisés");
   P ("validation.problem.dependency", "{field} : dépend d’un autre champ");
   P ("validation.problem.custom", "{field} : valeur non valide");
   P ("validation.constraint.no_relation", "{field} : doit être une valeur {value} valide");
   P ("validation.constraint.less_than", "{field} : la valeur doit être inférieure à {value}");
   P ("validation.constraint.less_or_equal", "{field} : la valeur ne doit pas dépasser {value}");
   P ("validation.constraint.greater_than", "{field} : la valeur doit être supérieure à {value}");
   P ("validation.constraint.greater_or_equal", "{field} : la valeur doit être d’au moins {value}");
   P ("validation.constraint.equal_to", "{field} : la valeur doit être égale à {value}");
   P ("validation.constraint.not_equal_to", "{field} : la valeur doit être différente de {value}");
   P ("validation.constraint.before_field", "{field} : la valeur doit être antérieure à {value}");
   P ("validation.constraint.after_field", "{field} : la valeur doit être postérieure à {value}");
   P ("validation.choices", "{field} : valeurs autorisées : {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, valeur reçue : {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, nouvelle tentative dans {time}");
   P ("net_diagnostic.dns", "{endpoint} : échec de la résolution DNS");
   P ("net_diagnostic.tcp", "{endpoint} : échec de la connexion TCP");
   P ("net_diagnostic.tls", "{endpoint} : échec de la vérification du certificat TLS");
   P ("net_diagnostic.http", "{endpoint} : échec de la requête HTTP");
   P ("net_diagnostic.proxy", "{endpoint} : échec du proxy");
   P ("net_diagnostic.timeout", "{endpoint} : délai d’attente dépassé");
   P ("net_diagnostic.reset", "{endpoint} : connexion réinitialisée");
   P ("net_diagnostic.unknown_network", "{endpoint} : erreur réseau");
   P ("progress.state.not_started", "non démarré");
   P ("progress.state.running", "en cours");
   P ("progress.state.stalled", "bloqué");
   P ("progress.state.retrying", "nouvelle tentative");
   P ("progress.state.complete", "terminé");
   P ("progress.state.failed", "échoué");
   P ("progress.of",
      "{subject} : {done} sur {total} {done, plural, one {terminé} other "
      & "{terminés}} ({percent} %), {state}");
   P ("progress.done",
      "{subject} : {done} {done, plural, one {terminé} other {terminés}}, "
      & "{state}");
   P ("collection.summary",
      "{name} : {total} {total, plural, one {élément} many "
      & "{d’éléments} other {éléments}}, {unique} {unique, plural, one "
      & "{valeur unique} many {de valeurs uniques} other {valeurs uniques}}, "
      & "{duplicates} {duplicates, plural, one {doublon} many {de doublons} "
      & "other {doublons}}, {outliers} {outliers, plural, one {valeur "
      & "aberrante} many {de valeurs aberrantes} other {valeurs aberrantes}}");
   P ("top_frequency",
      "{name}, valeur la plus fréquente : {value} ({count} {count, plural, "
      & "many {de fois} other {fois}})");
   P ("calendar_date.fiscal_year", "EX {year}");
   P ("calendar_date.fiscal_quarter", "EX {year} T{part}");
   P ("calendar_date.fiscal_half", "EX {year} S{part}");
   P ("calendar_date.fiscal_year_end", "fin de l’EX {year}");
   P ("calendar_date.semester", "S{part} {year}");
   P ("calendar_date.half_year", "S{part} {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {premier semestre {year}} other {second semestre "
      & "{year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {début {text}} mid {mi-{text}} other {fin "
      & "{text}}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {début du {text}} mid {milieu du {text}} other "
      & "{fin du {text}}}");
   P ("calendar_range.weekend.last", "le week-end dernier");
   P ("calendar_range.weekend.this", "ce week-end");
   P ("calendar_range.weekend.next", "le week-end prochain");
   P ("calendar_range.weekend_of", "week-end du {date}");
   P ("calendar_range.week.last", "la semaine dernière");
   P ("calendar_range.week.this", "cette semaine");
   P ("calendar_range.week.next", "la semaine prochaine");
   P ("calendar_range.week_of", "semaine du {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "continuer");
   P ("http.reason.101", "changement de protocole");
   P ("http.reason.102", "traitement en cours");
   P ("http.reason.103", "indications préliminaires");
   P ("http.reason.200", "ok");
   P ("http.reason.201", "créé");
   P ("http.reason.202", "accepté");
   P ("http.reason.203", "information non certifiée");
   P ("http.reason.204", "pas de contenu");
   P ("http.reason.205", "contenu réinitialisé");
   P ("http.reason.206", "contenu partiel");
   P ("http.reason.207", "statuts multiples");
   P ("http.reason.208", "déjà signalé");
   P ("http.reason.226", "IM utilisé");
   P ("http.reason.300", "choix multiples");
   P ("http.reason.301", "déplacé de façon permanente");
   P ("http.reason.302", "trouvé");
   P ("http.reason.303", "voir ailleurs");
   P ("http.reason.304", "non modifié");
   P ("http.reason.305", "utiliser le proxy");
   P ("http.reason.307", "redirection temporaire");
   P ("http.reason.308", "redirection permanente");
   P ("http.reason.400", "requête incorrecte");
   P ("http.reason.401", "non autorisé");
   P ("http.reason.402", "paiement requis");
   P ("http.reason.403", "interdit");
   P ("http.reason.404", "introuvable");
   P ("http.reason.405", "méthode non autorisée");
   P ("http.reason.406", "non acceptable");
   P ("http.reason.407", "authentification proxy requise");
   P ("http.reason.408", "délai d’attente de la requête dépassé");
   P ("http.reason.409", "conflit");
   P ("http.reason.410", "disparu");
   P ("http.reason.411", "longueur requise");
   P ("http.reason.412", "échec de la précondition");
   P ("http.reason.413", "contenu trop volumineux");
   P ("http.reason.414", "URI trop longue");
   P ("http.reason.415", "type de média non pris en charge");
   P ("http.reason.416", "plage non satisfaisable");
   P ("http.reason.417", "échec de l’attente");
   P ("http.reason.418", "je suis une théière");
   P ("http.reason.421", "requête mal dirigée");
   P ("http.reason.422", "contenu impossible à traiter");
   P ("http.reason.423", "verrouillé");
   P ("http.reason.424", "échec de dépendance");
   P ("http.reason.425", "trop tôt");
   P ("http.reason.426", "mise à niveau requise");
   P ("http.reason.428", "précondition requise");
   P ("http.reason.429", "trop de requêtes");
   P ("http.reason.431", "champs d’en-tête de requête trop volumineux");
   P ("http.reason.451", "indisponible pour raisons légales");
   P ("http.reason.500", "erreur interne du serveur");
   P ("http.reason.501", "non implémenté");
   P ("http.reason.502", "mauvaise passerelle");
   P ("http.reason.503", "service indisponible");
   P ("http.reason.504", "délai d’attente de la passerelle dépassé");
   P ("http.reason.505", "version HTTP non prise en charge");
   P ("http.reason.506", "la variante négocie aussi");
   P ("http.reason.507", "stockage insuffisant");
   P ("http.reason.508", "boucle détectée");
   P ("http.reason.510", "non étendu");
   P ("http.reason.511", "authentification réseau requise");
   P ("errno.reason.0", "succès");
   P ("errno.reason.1", "opération non permise");
   P ("errno.reason.2", "aucun fichier ou dossier de ce nom");
   P ("errno.reason.3", "aucun processus ayant ce numéro");
   P ("errno.reason.4", "appel système interrompu");
   P ("errno.reason.5", "erreur d’entrée/sortie");
   P ("errno.reason.6", "aucun périphérique ou adresse");
   P ("errno.reason.9", "mauvais descripteur de fichier");
   P ("errno.reason.11", "ressource temporairement non disponible");
   P ("errno.reason.12", "ne peut allouer de la mémoire");
   P ("errno.reason.13", "permission non accordée");
   P ("errno.reason.17", "le fichier existe");
   P ("errno.reason.20", "n’est pas un dossier");
   P ("errno.reason.21", "est un dossier");
   P ("errno.reason.22", "argument invalide");
   P ("errno.reason.24", "trop de fichiers ouverts");
   P ("errno.reason.28", "aucun espace disponible sur le périphérique");
   P ("errno.reason.32", "relais brisé (pipe)");
   P ("errno.reason.98", "adresse déjà utilisée");
   P ("errno.reason.110", "connexion terminée par expiration du délai d’attente");
   P ("errno.reason.111", "connexion refusée");
   P ("signal.reason.1", "fin de la connexion (raccroché)");
   P ("signal.reason.2", "interrompre");
   P ("signal.reason.3", "quitter");
   P ("signal.reason.4", "instruction non permise");
   P ("signal.reason.5", "trappe pour point d’arrêt et de trace");
   P ("signal.reason.6", "abandon");
   P ("signal.reason.7", "erreur du bus");
   P ("signal.reason.8", "exception en point flottant");
   P ("signal.reason.9", "processus arrêté");
   P ("signal.reason.10", "signal #1 défini par l’usager");
   P ("signal.reason.11", "erreur de segmentation");
   P ("signal.reason.12", "signal #2 défini par l’usager");
   P ("signal.reason.13", "relais brisé (pipe)");
   P ("signal.reason.14", "minuterie d’alerte");
   P ("signal.reason.15", "complété");
   P ("signal.reason.17", "le processus fils a terminé");
   P ("signal.reason.18", "poursuite");
   P ("signal.reason.19", "signal d’arrêt");
   P ("signal.reason.20", "arrêté");
   P ("signal.reason.28", "la fenêtre a changée");
   P ("sqlstate.reason.00", "exécution réussie");
   P ("sqlstate.reason.01", "avertissement");
   P ("sqlstate.reason.02", "aucune donnée");
   P ("sqlstate.reason.08", "exception de connexion");
   P ("sqlstate.reason.0a", "fonctionnalité non prise en charge");
   P ("sqlstate.reason.22", "exception de données");
   P ("sqlstate.reason.23", "violation de contrainte d’intégrité");
   P ("sqlstate.reason.24", "état de curseur invalide");
   P ("sqlstate.reason.25", "état de transaction invalide");
   P ("sqlstate.reason.28", "spécification d’autorisation invalide");
   P ("sqlstate.reason.2d", "fin de transaction invalide");
   P ("sqlstate.reason.3d", "nom de catalogue invalide");
   P ("sqlstate.reason.3f", "nom de schéma invalide");
   P ("sqlstate.reason.40", "annulation de transaction");
   P ("sqlstate.reason.42", "erreur de syntaxe ou violation de règle d’accès");
   P ("sqlstate.reason.53", "ressources insuffisantes");
   P ("sqlstate.reason.54", "limite du programme dépassée");
   P ("sqlstate.reason.55", "objet pas dans l’état prérequis");
   P ("sqlstate.reason.57", "intervention de l’opérateur");
   P ("sqlstate.reason.58", "erreur système");
   P ("sqlstate.reason.hv", "erreur d’encapsuleur de données externes");
   P ("sqlstate.reason.p0", "erreur PL/pgSQL");
   P ("sqlstate.reason.xx", "erreur interne");
   P ("system.signal_numbered", "signal {number} {name} {reason}");
   P ("http.reason.unknown", "statut inconnu");
   P ("errno.reason.unknown", "erreur inconnue");
   P ("signal.reason.unknown", "signal inconnu");
   P ("sqlstate.reason.unknown", "classe SQLSTATE inconnue");
   P ("diff.changed", "diff {path} : modifié de {before} à {after}");
   P ("diff.added", "diff {path} : ajout de {after}");
   P ("diff.removed", "diff {path} : suppression de {before}");
   P ("diff.unchanged", "diff {path} : inchangé");
   P ("diff.redacted", "diff {path} : modifié, valeurs masquées");
   P ("validation.result",
      "résultat de validation : {fields} {fields, plural, one {champ} many "
      & "{de champs} other {champs}}, {errors} {errors, plural, one {erreur} "
      & "many {d’erreurs} other {erreurs}}, {warnings} {warnings, plural, one "
      & "{avertissement} many {d’avertissements} other {avertissements}}, "
      & "{required} {required, plural, one {champ obligatoire} many {de champs "
      & "obligatoires} other {champs obligatoires}}, {hidden} {hidden, plural, "
      & "one {problème masqué} many {de problèmes masqués} other "
      & "{problèmes masqués}}");
   P ("file.kind.plain", "fichier");
   P ("file.kind.directory", "dossier");
   P ("file.kind.archive", "archive");
   P ("file.kind.compressed", "fichier compressé");
   P ("file.kind.image", "image");
   P ("file.kind.script", "script");
   P ("file.kind.executable", "exécutable");
   P ("file.kind.unknown", "fichier inconnu");
   P ("file.metadata", "fichier {name} : {kind}");
   P ("file.checksum", "{text}, somme de contrôle {checksum}");
   P ("file.signature_match", "signature de fichier {name} : {kind}, conforme à l’extension");
   P ("file.signature_mismatch",
      "signature de fichier {name} : extension de type {expected}, contenu "
      & "de type {actual}");
   P ("network_event.connecting", "connexion en cours");
   P ("network_event.connected", "connecté");
   P ("network_event.redirected", "redirigé");
   P ("network_event.retrying", "nouvelle tentative");
   P ("network_event.rate_limited", "débit limité");
   P ("network_event.tls_failed", "échec TLS");
   P ("network_event.stalled", "bloqué");
   P ("network_event.complete", "terminé");
   P ("network_event.failed", "échec");
   P ("network.session", "réseau {endpoint} : {state}");
   P ("diff_node.field", "champ");
   P ("diff_node.object", "objet");
   P ("diff_node.list", "liste");
   P ("diff.node",
      "nœud de diff {path} : {kind}, {count} {count, plural, one "
      & "{modification} many {de modifications} other {modifications}}");
   P ("checksum.not_checked", "somme de contrôle non vérifiée");
   P ("checksum.valid", "somme de contrôle valide");
   P ("checksum.mismatch", "somme de contrôle non concordante");
   P ("checksum.missing", "somme de contrôle manquante");
   P ("product_code", "code produit {kind} : {value}, {state}");
   P ("time_zone.utc", "fuseau horaire : UTC");
   P ("time_zone.offset", "fuseau horaire : {offset}");
   P ("time_zone.named", "fuseau horaire : {name} ({offset})");
   P ("time_zone.local", "fuseau horaire : heure locale");
   P ("time_zone.unknown", "fuseau horaire : fuseau inconnu");
   P ("time_zone.dst", "{text}, applique l’heure d’été");
   P ("zoned_time.plain", "heure avec fuseau : {time} {offset}");
   P ("zoned_time.named", "heure avec fuseau : {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, heure locale ambiguë");
   P ("number.under", "en dessous de {value}");
   P ("number.up_to", "jusqu’à {value}");
   P ("number.between", "entre {low} et {high}");
   P ("number.range_words", "de {low} à {high}");
   P ("number.uncertainty_words", "{value} plus ou moins {delta}");
   P ("number.range_inclusive", "de {low} à {high} inclus");
   P ("number.range_exclusive", "plus de {low} et moins de {high}");
   P ("number.range_low_inclusive", "{low} ou plus et moins de {high}");
   P ("number.range_high_inclusive", "plus de {low} et jusqu’à {high}");
   P ("number.at_least", "au moins {value}");
   P ("number.more_than", "plus de {value}");
   P ("number.at_most", "au plus {value}");
   P ("number.less_than", "moins de {value}");
   P ("number.exactly", "exactement {value}");
   P ("number.within", "{value} est dans l’intervalle {bounds}");
   P ("number.below", "{value} est en dessous de l’intervalle {bounds}");
   P ("number.above", "{value} est au-dessus de l’intervalle {bounds}");
   P ("number.per", "{numerator} par {denominator}");
   P ("number.one_in", "1 sur {whole}");
   P ("number.out_of", "{value} sur {whole}");
   P ("number.unchanged", "sans changement");
   P ("number.change_up", "en hausse de {quantity}");
   P ("number.change_down", "en baisse de {quantity}");
   P ("number.change_more", "{quantity} {tail} de plus");
   P ("number.change_fewer", "{quantity} {tail} de moins");
   P ("number.since", "{change} depuis {since}");
   P ("duration.countdown", "il reste {duration}");
   P ("duration.within", "d’ici {duration}");
   P ("duration.next", "{duration} à venir");
   P ("duration.between", "entre {low} et {high}");
   P ("duration.age", "âge : {duration}");
   P ("duration.stale_for", "obsolète depuis {duration}");
   P ("duration.backup_age", "sauvegarde vieille de {duration}");
   P ("duration.eta", "temps restant estimé : {duration}");
   P ("duration.expires", "expire {relative}");
   P ("duration.retrying", "nouvelle tentative {relative}");
   P ("duration.modified", "modifié {relative}");
   P ("duration.synced", "synchronisé {relative}");
   P ("duration.modified_now", "modifié à l’instant");
   P ("duration.synced_now", "synchronisé à l’instant");
   P ("duration.natural.less_than_minute", "moins d’une minute");
   P ("duration.natural.half_hour", "une demi-heure");
   P ("duration.natural.about_half_hour", "environ une demi-heure");
   P ("duration.natural.about", "environ {duration}");
   P ("duration.natural.almost", "presque {duration}");
   P ("duration.natural.over", "plus de {duration}");
   P ("duration.natural.just_over", "un peu plus de {duration}");
   P ("duration.natural.little_under", "un peu moins de {duration}");
   P ("duration.natural.few",
      "{unit, select, second {quelques secondes} minute {quelques minutes} "
      & "hour {quelques heures} day {quelques jours} week {quelques semaines} "
      & "month {quelques mois} year {quelques années} other {quelques "
      & "instants}}");
   P ("duration.distance.past", "il y a {duration}");
   P ("duration.distance.future", "dans {duration}");
   P ("geo.direction.north", "{style, select, short {N} other {nord}}");
   P ("geo.direction.north_north_east", "{style, select, short {NNE} other {nord-nord-est}}");
   P ("geo.direction.north_east", "{style, select, short {NE} other {nord-est}}");
   P ("geo.direction.east_north_east", "{style, select, short {ENE} other {est-nord-est}}");
   P ("geo.direction.east", "{style, select, short {E} other {est}}");
   P ("geo.direction.east_south_east", "{style, select, short {ESE} other {est-sud-est}}");
   P ("geo.direction.south_east", "{style, select, short {SE} other {sud-est}}");
   P ("geo.direction.south_south_east", "{style, select, short {SSE} other {sud-sud-est}}");
   P ("geo.direction.south", "{style, select, short {S} other {sud}}");
   P ("geo.direction.south_south_west", "{style, select, short {SSO} other {sud-sud-ouest}}");
   P ("geo.direction.south_west", "{style, select, short {SO} other {sud-ouest}}");
   P ("geo.direction.west_south_west", "{style, select, short {OSO} other {ouest-sud-ouest}}");
   P ("geo.direction.west", "{style, select, short {O} other {ouest}}");
   P ("geo.direction.west_north_west", "{style, select, short {ONO} other {ouest-nord-ouest}}");
   P ("geo.direction.north_west", "{style, select, short {NO} other {nord-ouest}}");
   P ("geo.direction.north_north_west", "{style, select, short {NNO} other {nord-nord-ouest}}");
   P ("geo.bearing", "{degrees} {direction}");
   P ("geo.distance_direction", "{distance} {direction}");
   P ("geo.about_distance_direction", "environ {distance} {direction}");
   P ("geo.coordinate", "{latitude}, {longitude}");
   P ("geo.bounding_box", "sud-ouest {southwest} ; nord-est {northeast}");
   P ("geo.inside_box", "à l’intérieur du cadre de délimitation");
   P ("geo.outside_box", "hors du cadre de délimitation");
   P ("number.about", "environ {value}");
   P ("number.almost", "presque {value}");
   P ("number.over", "plus de {value}");
   P ("number.plus_minus", "{value} ± {delta}");
   P ("number.plus_minus_parenthesized", "{value} (± {delta})");
end Locale_Fr;
