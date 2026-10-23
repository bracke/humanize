separate (Humanize.Catalogs.Phrase_Data)
function Locale_Fr return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("fr", Name, Template));
begin
   return
     P ("all_count", "{total, plural, one {{total} {one}} other {les {total} {other}}}")
     & P ("filtered_count.none", "aucune correspondance parmi les {other}")
     & P ("filtered_count.all",
          "{total, plural, one {{total} {one} sur {total} correspond} other {les "
          & "{total} {other} correspondent}}")
     & P ("filtered_count.some",
          "{matching, plural, one {{matching} {one} sur {total} correspond} other "
          & "{{matching} {other} sur {total} correspondent}}")
     & P ("more_count",
          "{visible, plural, one {{visible} visible} other {{visible} visibles}}, "
          & "{remaining} de plus")
     & P ("others_count",
          "{first} et {remaining, plural, one {1 autre} other {{remaining} "
          & "autres}}")
     & P ("page_count", "page {page} sur {total}")
     & P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} par page")
     & P ("pagination_range",
          "{first}–{last} sur {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("position_count", "{position} sur {total}")
     & P ("selection_count",
          "sélection : {selected} {selected, plural, one {{one}} other "
          & "{{other}}} sur {total}")
     & P ("showing_count",
          "affichage de {showing} {showing, plural, one {{one}} other {{other}}} "
          & "sur {total}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {aucune erreur} warning "
          & "{aucun avertissement} other {aucune information}}} one {{count} "
          & "{severity, select, error {erreur} warning {avertissement} other "
          & "{information}}} other {{count} {severity, select, error {erreurs} "
          & "warning {avertissements} other {informations}}}}")
     & P ("collection.empty", "pas de {other}")
     & P ("collection.none_shown", "pas de {other} à afficher")
     & P ("collection.showing_hidden",
          "affichage de {visible} {visible, plural, one {{one}} other {{other}}} "
          & "sur {total}, {hidden, plural, one {{hidden} non visible} other "
          & "{{hidden} non visibles}}")
     & P ("collection.showing",
          "affichage de {visible} {visible, plural, one {{one}} other {{other}}} "
          & "sur {total}")
     & P ("collection.shown_hidden",
          "{visible, plural, one {{visible} {one} visible} other {{visible} "
          & "{other} visibles}}, {hidden, plural, one {{hidden} non visible} other "
          & "{{hidden} non visibles}}")
     & P ("collection.shown",
          "{visible, plural, one {{visible} {one} visible} other {{visible} "
          & "{other} visibles}}")
     & P ("collection.visible_out_of",
          "{visible, plural, one {{visible} {one} visible} other {{visible} "
          & "{other} visibles}} sur {total}")
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
          "{total} {total, plural, one {{one}} other {{other}}} : {changed, "
          & "plural, one {{changed} modification} other {{changed} modifications}}, "
          & "{added, plural, one {{added} ajout} other {{added} ajouts}}, {removed, "
          & "plural, one {{removed} suppression} other {{removed} suppressions}}")
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
     & P ("summary.completed", "terminé : {count} {count, plural, one {{one}} other {{other}}}")
     & P ("summary.completed_of",
          "terminé : {count} {count, plural, one {{one}} other {{other}}} sur "
          & "{total}")
     & P ("summary.failed", "{count} en échec")
     & P ("summary.queued",
          "{count} {count, plural, one {{one}} other {{other}}} en file "
          & "d’attente")
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
     & P ("feature_flag.flag_enabled", "feature flag activé")
     & P ("feature_flag.flag_disabled", "feature flag désactivé")
     & P ("feature_flag.flag_rolling_out", "feature flag en cours de déploiement")
     & P ("feature_flag.flag_rolled_back", "feature flag annulé")
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
     & P ("queue_summary.empty", "file d’attente vide");
end Locale_Fr;
