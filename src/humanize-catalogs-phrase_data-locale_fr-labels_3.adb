separate (Humanize.Catalogs.Phrase_Data.Locale_Fr)
procedure Labels_3 is
begin
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {aucune tâche} one {{count, number} tâche} many "
      & "{{count, number} de tâches} other {{count, number} tâches}}");
   P ("label.tasks.task_label",
      "{name} : {state, select, open_task {tâche ouverte} in_progress_task "
      & "{tâche en cours} blocked_task {tâche bloquée} done_task {tâche "
      & "terminée} canceled_task {tâche annulée} deferred_task {tâche "
      & "reportée} other {tâche en retard}}{priority, select, no_priority {} "
      & "low_priority {, priorité basse} medium_priority {, priorité moyenne} "
      & "high_priority {, priorité haute} other {, priorité critique}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {aucune priorité} low_priority "
      & "{priorité basse} medium_priority {priorité moyenne} high_priority "
      & "{priorité haute} other {priorité critique}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {tâche ouverte} in_progress_task {tâche en "
      & "cours} blocked_task {tâche bloquée} done_task {tâche terminée} "
      & "canceled_task {tâche annulée} deferred_task {tâche reportée} other "
      & "{tâche en retard}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {limite supérieure} other {limite "
      & "inférieure}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {sous la plage attendue} within_range "
      & "{dans la plage attendue} above_range {au-dessus de la plage attendue} "
      & "below_target {sous l’objectif} at_target {objectif atteint} "
      & "above_target {au-dessus de l’objectif} near_limit {proche de la "
      & "limite} warning_level {seuil d’avertissement} critical_level {seuil "
      & "critique} breached {seuil dépassé} other {état du seuil inconnu}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {à jour} one {{ahead, number} "
      & "commit d’avance} many {{ahead, number} de commits d’avance} other "
      & "{{ahead, number} commits d’avance}}} other {{ahead, plural, =0 "
      & "{{behind, plural, one {{behind, number} commit de retard} many "
      & "{{behind, number} de commits de retard} other {{behind, number} "
      & "commits de retard}}} other {{ahead, plural, one {{ahead, number} "
      & "commit d’avance} many {{ahead, number} de commits d’avance} other "
      & "{{ahead, number} commits d’avance}}, {behind, plural, one {{behind, "
      & "number} commit de retard} many {{behind, number} de commits de retard} "
      & "other {{behind, number} commits de retard}}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {approuvé par {approver}} other {en attente "
      & "de l’approbation de {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {tentative {attempt, "
      & "number} sur {limit, number}} other {tentative {attempt, number} sur "
      & "{limit, number} (limite dépassée)}}} other {tentative {attempt, "
      & "number} sur {limit, number}}}");
   P ("label.workflows.blocker_label", "blocage : {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {aucune dépendance bloquante} one {{count, number} "
      & "dépendance bloquante} many {{count, number} de dépendances "
      & "bloquantes} other {{count, number} dépendances bloquantes}}");
   P ("label.workflows.handoff_label", "transfert de {from} à {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {jalon à venir} current_milestone "
      & "{jalon en cours} complete_milestone {jalon atteint} missed_milestone "
      & "{jalon manqué} other {jalon bloqué}}");
   P ("label.workflows.milestone_status_label",
      "{name} : {state, select, upcoming_milestone {à venir} "
      & "current_milestone {en cours} complete_milestone {atteint} "
      & "missed_milestone {manqué} other {bloqué}}");
   P ("label.workflows.next_action_label", "prochaine action : {action}");
   P ("label.workflows.owner_label", "responsable : {owner}");
   P ("label.workflows.resume_label", "reprendre {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {en attente} active_step {active} "
      & "waiting_step {en suspens} blocked_step {bloquée} done_step "
      & "{terminée} failed_step {en échec} other {ignorée}}");
   P ("label.workflows.step_status_label",
      "{name} : {state, select, pending_step {en attente} active_step "
      & "{active} waiting_step {en suspens} blocked_step {bloquée} done_step "
      & "{terminée} failed_step {en échec} other {ignorée}}");
   P ("label.workflows.waiting_label", "en attente de {reason}");
   P ("label.workflows.workflow_result_label",
      "{name} : {state, select, not_started_state {non démarré} "
      & "in_progress_state {en cours} waiting_state {en attente} "
      & "waiting_approval_state {en attente d’approbation} blocked_state "
      & "{bloqué} completed_state {terminé} failed_state {en échec} "
      & "cancelled_state {annulé} skipped_state {ignoré} other {en pause}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {non démarré} in_progress_state "
      & "{en cours} waiting_state {en attente} waiting_approval_state {en "
      & "attente d’approbation} blocked_state {bloqué} completed_state "
      & "{terminé} failed_state {en échec} cancelled_state {annulé} "
      & "skipped_state {ignoré} other {en pause}}");
end Labels_3;
