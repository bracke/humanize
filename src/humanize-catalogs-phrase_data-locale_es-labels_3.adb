separate (Humanize.Catalogs.Phrase_Data.Locale_Es)
procedure Labels_3 is
begin
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {sin prioridad} low_priority {prioridad "
      & "baja} medium_priority {prioridad media} high_priority {prioridad alta} "
      & "other {prioridad crítica}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {tarea abierta} in_progress_task {tarea en "
      & "curso} blocked_task {tarea bloqueada} done_task {tarea completada} "
      & "canceled_task {tarea cancelada} deferred_task {tarea aplazada} other "
      & "{tarea vencida}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {límite superior} other {límite "
      & "inferior}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {por debajo del rango esperado} "
      & "within_range {dentro del rango esperado} above_range {por encima del "
      & "rango esperado} below_target {por debajo del objetivo} at_target {en "
      & "el objetivo} above_target {por encima del objetivo} near_limit {cerca "
      & "del límite} warning_level {umbral de advertencia} critical_level "
      & "{umbral crítico} breached {umbral superado} other {estado del umbral "
      & "desconocido}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {al día} one {{ahead, number} "
      & "commit por delante} many {{ahead, number} de commits por delante} "
      & "other {{ahead, number} commits por delante}}} other {{ahead, plural, "
      & "=0 {{behind, plural, one {{behind, number} commit por detrás} many "
      & "{{behind, number} de commits por detrás} other {{behind, number} "
      & "commits por detrás}}} other {{ahead, plural, one {{ahead, number} "
      & "commit por delante} many {{ahead, number} de commits por delante} "
      & "other {{ahead, number} commits por delante}}, {behind, plural, one "
      & "{{behind, number} commit por detrás} many {{behind, number} de "
      & "commits por detrás} other {{behind, number} commits por detrás}}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {aprobado por {approver}} other {esperando la "
      & "aprobación de {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {intento {attempt, number} "
      & "de {limit, number}} other {intento {attempt, number} de {limit, "
      & "number} (límite superado)}}} other {intento {attempt, number} de "
      & "{limit, number}}}");
   P ("label.workflows.blocker_label", "bloqueado: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {ninguna dependencia bloqueante} one {{count, "
      & "number} dependencia bloqueante} many {{count, number} de dependencias "
      & "bloqueantes} other {{count, number} dependencias bloqueantes}}");
   P ("label.workflows.handoff_label", "traspaso de {from} a {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {próximo hito} current_milestone "
      & "{hito actual} complete_milestone {hito completado} missed_milestone "
      & "{hito no alcanzado} other {hito bloqueado}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {próximo} "
      & "current_milestone {actual} complete_milestone {completado} "
      & "missed_milestone {no alcanzado} other {bloqueado}}");
   P ("label.workflows.next_action_label", "siguiente acción: {action}");
   P ("label.workflows.owner_label", "responsable: {owner}");
   P ("label.workflows.resume_label", "reanudar {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {pendiente} active_step {activo} "
      & "waiting_step {en espera} blocked_step {bloqueado} done_step "
      & "{completado} failed_step {fallido} other {omitido}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {pendiente} active_step {activo} "
      & "waiting_step {en espera} blocked_step {bloqueado} done_step "
      & "{completado} failed_step {fallido} other {omitido}}");
   P ("label.workflows.waiting_label", "a la espera de {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {sin iniciar} "
      & "in_progress_state {en curso} waiting_state {en espera} "
      & "waiting_approval_state {esperando aprobación} blocked_state "
      & "{bloqueado} completed_state {completado} failed_state {fallido} "
      & "cancelled_state {cancelado} skipped_state {omitido} other {en pausa}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {sin iniciar} in_progress_state {en "
      & "curso} waiting_state {en espera} waiting_approval_state {esperando "
      & "aprobación} blocked_state {bloqueado} completed_state {completado} "
      & "failed_state {fallido} cancelled_state {cancelado} skipped_state "
      & "{omitido} other {en pausa}}");
end Labels_3;
