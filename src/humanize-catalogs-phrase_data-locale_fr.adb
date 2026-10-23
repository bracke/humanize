separate (Humanize.Catalogs.Phrase_Data)
function Locale_Fr return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("fr", Name, Template));
begin
   return
     P ("all_count",
          "{total, plural, one {{total} {one}} many {les {total} {many}} other "
          & "{les {total} {other}}}")
     & P ("filtered_count.none", "aucune correspondance parmi les {other}")
     & P ("filtered_count.all",
          "{total, plural, one {{total} {one} sur {total} correspond} many {les "
          & "{total} {many} correspondent} other {les {total} {other} "
          & "correspondent}}")
     & P ("filtered_count.some",
          "{matching, plural, one {{matching} {one} sur {total} correspond} many "
          & "{{matching} {many} sur {total} correspondent} other {{matching} "
          & "{other} sur {total} correspondent}}")
     & P ("more_count",
          "{visible, plural, one {{visible} visible} other {{visible} visibles}}, "
          & "{remaining} de plus")
     & P ("others_count",
          "{first} et {remaining, plural, one {1 autre} other {{remaining} "
          & "autres}}")
     & P ("page_count", "page {page} sur {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} many {{many}} other {{other}}} par "
          & "page")
     & P ("pagination_range",
          "{first}–{last} sur {total} {total, plural, one {{one}} many {{many}} "
          & "other {{other}}}")
     & P ("position_count", "{position} sur {total}")
     & P ("selection_count",
          "sélection : {selected} {selected, plural, one {{one}} many {{many}} "
          & "other {{other}}} sur {total}")
     & P ("showing_count",
          "affichage de {showing} {showing, plural, one {{one}} many {{many}} "
          & "other {{other}}} sur {total}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {aucune erreur} warning "
          & "{aucun avertissement} other {aucune information}}} one {{count} "
          & "{severity, select, error {erreur} warning {avertissement} other "
          & "{information}}} other {{count} {severity, select, error {erreurs} "
          & "warning {avertissements} other {informations}}}}")
     & P ("collection.empty", "pas de {other}")
     & P ("collection.none_shown", "pas de {other} à afficher")
     & P ("collection.showing_hidden",
          "affichage de {visible} {visible, plural, one {{one}} many {{many}} "
          & "other {{other}}} sur {total}, {hidden, plural, one {{hidden} non "
          & "visible} other {{hidden} non visibles}}")
     & P ("collection.showing",
          "affichage de {visible} {visible, plural, one {{one}} many {{many}} "
          & "other {{other}}} sur {total}")
     & P ("collection.shown_hidden",
          "{visible, plural, one {{visible} {one} visible} many {{visible} {many} "
          & "visibles} other {{visible} {other} visibles}}, {hidden, plural, one "
          & "{{hidden} non visible} other {{hidden} non visibles}}")
     & P ("collection.shown",
          "{visible, plural, one {{visible} {one} visible} many {{visible} {many} "
          & "visibles} other {{visible} {other} visibles}}")
     & P ("collection.visible_out_of",
          "{visible, plural, one {{visible} {one} visible} many {{visible} {many} "
          & "visibles} other {{visible} {other} visibles}} sur {total}")
     & P ("complete_count", "{done} sur {total} {done, plural, one {terminé} other {terminés}}")
     & P ("percent_complete", "{percent} % terminé")
     & P ("step_count", "étape {step} sur {total}")
     & P ("attempt_count", "tentative {attempt} sur {total}")
     & P ("throughput_remaining", "encore {remaining} {unit} à {rate} {unit}/s")
     & P ("accessible_progress",
          "{done} sur {total} {done, plural, one {terminé} other {terminés}}, "
          & "{percent} pour cent")
     & P ("business_days", "{days} {days, plural, one {jour ouvré} other {jours ouvrés}}")
     & P ("working_hours",
          "{hours} {hours, plural, one {heure de travail} other {heures de "
          & "travail}}")
     & P ("due.overdue", "en retard de {days} {days, plural, one {jour} other {jours}}")
     & P ("due.today", "échéance aujourd’hui")
     & P ("due.tomorrow", "échéance demain")
     & P ("due.in", "échéance dans {days} jours")
     & P ("calendar_difference.future", "dans {difference}")
     & P ("calendar_difference.past", "il y a {difference}")
     & P ("cpu_load", "charge CPU {measure}")
     & P ("battery", "batterie {measure}")
     & P ("screen_size", "écran {measure}")
     & P ("refresh_rate", "fréquence de rafraîchissement {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word", "{value} pour cent")
     & P ("recurrence.second",
          "{every, plural, =1 {chaque seconde} other {toutes les {every} "
          & "secondes}}")
     & P ("recurrence.minute", "{every, plural, =1 {chaque minute} other {toutes les {every} minutes}}")
     & P ("recurrence.hour", "{every, plural, =1 {chaque heure} other {toutes les {every} heures}}")
     & P ("recurrence.day", "{every, plural, =1 {chaque jour} other {tous les {every} jours}}")
     & P ("recurrence.week",
          "{every, plural, =1 {chaque semaine} other {toutes les {every} "
          & "semaines}}")
     & P ("recurrence.month", "{every, plural, =1 {chaque mois} other {tous les {every} mois}}")
     & P ("recurrence.quarter",
          "{every, plural, =1 {chaque trimestre} other {tous les {every} "
          & "trimestres}}")
     & P ("recurrence.year", "{every, plural, =1 {chaque année} other {tous les {every} ans}}")
     & P ("cache_summary.empty", "cache : aucune requête")
     & P ("cache_summary",
          "cache : {hits} succès, {misses} {misses, plural, one {échec} other "
          & "{échecs}}, taux de succès {rate} %")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} many {{many}} other {{other}}} : "
          & "{changed, plural, one {{changed} modification} other {{changed} "
          & "modifications}}, {added, plural, one {{added} ajout} other {{added} "
          & "ajouts}}, {removed, plural, one {{removed} suppression} other "
          & "{{removed} suppressions}}")
     & P ("field_diff", "{field} : valeur modifiée de {before} à {after}")
     & P ("field_added", "{field} : valeur {value} ajoutée")
     & P ("field_removed", "{field} : valeur {value} supprimée")
     & P ("field_unchanged", "{field} : toujours {value}")
     & P ("number_comparison.equal", "{current} est égal à {baseline}")
     & P ("number_comparison.higher", "{current} est supérieur de {quantity} à {baseline}")
     & P ("number_comparison.lower", "{current} est inférieur de {quantity} à {baseline}")
     & P ("percent_comparison.equal", "{current} est égal à {baseline}")
     & P ("percent_comparison.higher", "{current} est supérieur de {quantity} à {baseline}")
     & P ("percent_comparison.lower", "{current} est inférieur de {quantity} à {baseline}")
     & P ("file_size_comparison.same", "{current} a la même taille que {baseline}")
     & P ("file_size_comparison.larger", "{current} fait {quantity} de plus que {baseline}")
     & P ("file_size_comparison.smaller", "{current} fait {quantity} de moins que {baseline}")
     & P ("date_comparison.same", "{current} tombe le même jour que {baseline}")
     & P ("date_comparison.after", "{current} tombe {quantity} après {baseline}")
     & P ("date_comparison.before", "{current} tombe {quantity} avant {baseline}")
     & P ("queue_summary", "file d’attente : {details}")
     & P ("domain_summary",
          "{domain, select, queue {file d’attente} job {tâche} run "
          & "{exécution} cache {cache} sync {synchronisation} import {importation} "
          & "export {exportation} other {{domain}}} {state, select, queued {en file "
          & "d’attente} running {en cours} waiting {en attente} paused {en pause} "
          & "complete {{domain, select, queue {terminée} job {terminée} run "
          & "{terminée} cache {terminé} sync {terminée} import {terminée} "
          & "export {terminée} other {terminé}}} failed {en échec} stale "
          & "{obsolète} skipped {{domain, select, queue {ignorée} job {ignorée} "
          & "run {ignorée} cache {ignoré} sync {ignorée} import {ignorée} "
          & "export {ignorée} other {ignoré}}} other {{state}}} : {details}")
     & P ("summary.none", "pas de {other}")
     & P ("summary.completed",
          "terminé : {count} {count, plural, one {{one}} many {{many}} other "
          & "{{other}}}")
     & P ("summary.completed_of",
          "terminé : {count} {count, plural, one {{one}} many {{many}} other "
          & "{{other}}} sur {total}")
     & P ("summary.failed", "{count} en échec")
     & P ("summary.queued",
          "{count} {count, plural, one {{one}} many {{many}} other {{other}}} en "
          & "file d’attente")
     & P ("summary.running", "{count} en cours")
     & P ("summary.complete", "{count} {count, plural, one {terminé} other {terminés}}")
     & P ("backup.backup_running", "sauvegarde en cours")
     & P ("backup.backup_completed", "sauvegarde terminée")
     & P ("backup.backup_failed", "échec de la sauvegarde")
     & P ("backup.backup_stale", "sauvegarde obsolète")
     & P ("incident.incident_investigating", "incident en cours d’analyse")
     & P ("incident.incident_identified", "incident identifié")
     & P ("incident.incident_mitigated", "incident atténué")
     & P ("incident.incident_resolved", "incident résolu")
     & P ("release.release_drafting", "version en préparation")
     & P ("release.release_ready", "version prête")
     & P ("release.release_published", "version publiée")
     & P ("release.release_rolled_back", "version annulée")
     & P ("audit.audit_created", "entrée d’audit créée")
     & P ("audit.audit_updated", "entrée d’audit mise à jour")
     & P ("audit.audit_deleted", "entrée d’audit supprimée")
     & P ("audit.audit_restored", "entrée d’audit restaurée")
     & P ("flag.flag_enabled", "feature flag activé")
     & P ("flag.flag_disabled", "feature flag désactivé")
     & P ("flag.flag_rolling_out", "feature flag en cours de déploiement")
     & P ("flag.flag_rolled_back", "feature flag annulé")
     & P ("webhook.webhook_pending", "webhook en attente")
     & P ("webhook.webhook_delivered", "webhook livré")
     & P ("webhook.webhook_failed", "échec du webhook")
     & P ("webhook.webhook_retrying", "webhook : nouvelle tentative")
     & P ("api_key.api_key_active", "clé d’API active")
     & P ("api_key.api_key_revoked", "clé d’API révoquée")
     & P ("api_key.api_key_expired", "clé d’API expirée")
     & P ("api_key.api_key_rotated", "clé d’API renouvelée")
     & P ("quota.quota_available", "quota disponible")
     & P ("quota.quota_near_limit", "quota presque atteint")
     & P ("quota.quota_exceeded", "quota dépassé")
     & P ("quota.quota_reset", "quota réinitialisé")
     & P ("invoice.invoice_draft", "brouillon de facture")
     & P ("invoice.invoice_sent", "facture envoyée")
     & P ("invoice.invoice_paid", "facture payée")
     & P ("invoice.invoice_refunded", "facture remboursée")
     & P ("invoice.invoice_overdue", "facture en retard")
     & P ("invoice.refund_failed", "échec du remboursement")
     & P ("page_navigation.only", "page unique")
     & P ("page_navigation.first", "première page, page suivante disponible")
     & P ("page_navigation.last", "dernière page, page précédente disponible")
     & P ("page_navigation.middle", "pages précédente et suivante disponibles")
     & P ("end_of_week", "fin de la semaine")
     & P ("end_of_month", "fin du mois")
     & P ("end_of_quarter", "fin du trimestre")
     & P ("time_of_day.night", "nuit")
     & P ("time_of_day.morning", "matin")
     & P ("time_of_day.afternoon", "après-midi")
     & P ("time_of_day.evening", "soir")
     & P ("calendar_difference.same_day", "le même jour")
     & P ("calendar_difference.zero", "0 jour")
     & P ("queue_summary.empty", "file d’attente vide")
     & P ("access.allowed", "autorisé")
     & P ("access.denied", "refusé")
     & P ("access.owner", "propriétaire")
     & P ("access.admin", "administrateur")
     & P ("access.viewer", "lecteur")
     & P ("access.editor", "éditeur")
     & P ("auth.signed_in", "connecté")
     & P ("auth.signed_out", "déconnecté")
     & P ("auth.session_expired", "session expirée")
     & P ("auth.locked", "verrouillé")
     & P ("auth.two_factor_required", "authentification à deux facteurs requise")
     & P ("billing.trialing", "période d’essai")
     & P ("billing.payment_due", "paiement dû")
     & P ("billing.payment_failed", "échec du paiement")
     & P ("billing.paid", "payé")
     & P ("billing.past_due", "en retard de paiement")
     & P ("billing.canceled", "annulé")
     & P ("ci.pipeline_pending", "pipeline en attente")
     & P ("ci.pipeline_running", "pipeline en cours")
     & P ("ci.pipeline_passed", "pipeline réussi")
     & P ("ci.pipeline_failed", "échec du pipeline")
     & P ("ci.review_required", "revue requise")
     & P ("ci.deploy_blocked", "déploiement bloqué")
     & P ("collaboration.active_now", "actif maintenant")
     & P ("collaboration.away", "absent")
     & P ("collaboration.do_not_disturb", "ne pas déranger")
     & P ("collaboration.typing", "en train d’écrire")
     & P ("collaboration.viewing", "en train de consulter")
     & P ("collaboration.editing", "en train de modifier")
     & P ("deployment.deploying", "déploiement en cours")
     & P ("deployment.deployed", "déployé")
     & P ("deployment.rolling_back", "restauration en cours")
     & P ("deployment.rolled_back", "restauré")
     & P ("deployment.build_failed", "échec de la compilation")
     & P ("deployment.checks_passed", "vérifications réussies")
     & P ("empty.no_items", "aucun élément")
     & P ("empty.no_results", "aucun résultat")
     & P ("empty.no_messages", "aucun message")
     & P ("empty.no_selection", "aucune sélection")
     & P ("empty.nothing_to_show", "rien à afficher")
     & P ("file.uploading", "envoi en cours")
     & P ("file.downloading", "téléchargement en cours")
     & P ("file.copying", "copie en cours")
     & P ("file.moving", "déplacement en cours")
     & P ("file.deleting", "suppression en cours")
     & P ("file.deleted", "supprimé")
     & P ("file.restoring", "restauration en cours")
     & P ("file.synced", "synchronisé")
     & P ("form.valid_input", "saisie valide")
     & P ("form.invalid_input", "saisie non valide")
     & P ("form.dirty", "modifié")
     & P ("form.pristine", "non modifié")
     & P ("form.submitted", "envoyé")
     & P ("form.submission_failed", "échec de l’envoi")
     & P ("health.healthy", "sain")
     & P ("health.degraded", "dégradé")
     & P ("health.unhealthy", "défaillant")
     & P ("health.incident", "incident")
     & P ("health.maintenance", "maintenance")
     & P ("health.recovering", "rétablissement en cours")
     & P ("issue.open", "ouvert")
     & P ("issue.closed", "fermé")
     & P ("issue.reopened", "rouvert")
     & P ("issue.assigned", "attribué")
     & P ("issue.unassigned", "non attribué")
     & P ("issue.merged", "fusionné")
     & P ("network.offline", "hors ligne")
     & P ("network.online", "en ligne")
     & P ("network.connecting", "connexion en cours")
     & P ("network.syncing", "synchronisation en cours")
     & P ("network.sync_failed", "échec de la synchronisation")
     & P ("network.permission_denied", "autorisation refusée")
     & P ("network.read_only", "lecture seule")
     & P ("notification.unread", "non lu")
     & P ("notification.read", "lu")
     & P ("notification.muted", "en sourdine")
     & P ("notification.snoozed", "reporté")
     & P ("notification.sent", "envoyé")
     & P ("notification.delivered", "distribué")
     & P ("payment.payment_authorized", "paiement autorisé")
     & P ("payment.payment_captured", "paiement encaissé")
     & P ("payment.payment_refunded", "paiement remboursé")
     & P ("payment.payment_disputed", "paiement contesté")
     & P ("payment.payment_requires_action", "action requise pour le paiement")
     & P ("payment.payment_expired", "paiement expiré")
     & P ("ui.empty", "vide")
     & P ("ui.loading", "chargement")
     & P ("ui.saving", "enregistrement")
     & P ("ui.saved", "enregistré")
     & P ("ui.unsaved", "non enregistré")
     & P ("ui.retrying", "nouvelle tentative")
     & P ("ui.paused", "en pause")
     & P ("ui.complete", "terminé")
     & P ("ui.failed", "échec")
     & P ("ui.due_soon", "échéance proche")
     & P ("ui.overdue", "en retard")
     & P ("ui.last_seen", "vu pour la dernière fois")
     & P ("ui.updated_just_now", "mis à jour à l’instant")
     & P ("queue.queued", "en file d’attente")
     & P ("queue.running", "en cours")
     & P ("queue.waiting", "en attente")
     & P ("queue.blocked", "bloqué")
     & P ("queue.canceled_job", "tâche annulée")
     & P ("queue.completed_job", "tâche terminée")
     & P ("search.filtering", "filtrage en cours")
     & P ("search.filtered", "filtré")
     & P ("search.no_matches", "aucune correspondance")
     & P ("search.search_ready", "recherche prête")
     & P ("search.search_failed", "échec de la recherche")
     & P ("search.query_too_short", "requête trop courte")
     & P ("security.secure", "sécurisé")
     & P ("security.insecure", "non sécurisé")
     & P ("security.vulnerable", "vulnérable")
     & P ("security.encrypted", "chiffré")
     & P ("security.unencrypted", "non chiffré")
     & P ("security.token_expired", "jeton expiré")
     & P ("sync.sync_idle", "synchronisation inactive")
     & P ("sync.syncing_now", "synchronisation en cours")
     & P ("sync.sync_queued", "synchronisation en attente")
     & P ("sync.sync_conflict", "conflit de synchronisation")
     & P ("sync.sync_complete", "synchronisation terminée")
     & P ("sync.sync_error", "erreur de synchronisation")
     & P ("task.todo", "à faire")
     & P ("task.in_progress", "en cours")
     & P ("task.done", "terminé")
     & P ("task.skipped", "ignoré")
     & P ("task.blocked_task", "bloqué")
     & P ("task.waiting_on", "en attente de")
     & P ("ticket.ticket_new", "nouveau ticket")
     & P ("ticket.ticket_open", "ticket ouvert")
     & P ("ticket.ticket_waiting", "ticket en attente")
     & P ("ticket.ticket_escalated", "ticket escaladé")
     & P ("ticket.ticket_resolved", "ticket résolu")
     & P ("ticket.ticket_closed", "ticket fermé")
     & P ("transfer.importing", "importation en cours")
     & P ("transfer.imported", "importé")
     & P ("transfer.import_failed", "échec de l’importation")
     & P ("transfer.exporting", "exportation en cours")
     & P ("transfer.exported", "exporté")
     & P ("transfer.export_failed", "échec de l’exportation")
     & P ("validation.required", "obligatoire")
     & P ("validation.optional", "facultatif")
     & P ("validation.invalid", "non valide")
     & P ("validation.too_short", "trop court")
     & P ("validation.too_long", "trop long")
     & P ("validation.out_of_range", "hors limites")
     & P ("validation.already_exists", "existe déjà")
     & P ("workflow.draft", "brouillon")
     & P ("workflow.in_review", "en cours de révision")
     & P ("workflow.approved", "approuvé")
     & P ("workflow.rejected", "rejeté")
     & P ("workflow.published", "publié")
     & P ("workflow.archived", "archivé")
     & P ("database.database_online", "base de données en ligne")
     & P ("database.database_offline", "base de données hors ligne")
     & P ("database.database_degraded", "base de données dégradée")
     & P ("database.database_migrating", "migration de la base de données en cours")
     & P ("database.database_migration_failed", "échec de la migration de la base de données")
     & P ("database.database_replicating", "réplication de la base de données en cours")
     & P ("database.database_replication_lagging", "réplication de la base de données en retard")
     & P ("database.database_backup_running", "sauvegarde de la base de données en cours")
     & P ("database.database_backup_failed", "échec de la sauvegarde de la base de données");
end Locale_Fr;
