separate (Humanize.Catalogs.Phrase_Data.Locale_It)
procedure Labels_3 is
begin
   P ("label.tasks.task_state_label",
      "{state, select, open_task {attività aperta} in_progress_task "
      & "{attività in corso} blocked_task {attività bloccata} done_task "
      & "{attività completata} canceled_task {attività annullata} "
      & "deferred_task {attività rinviata} other {attività scaduta}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {limite superiore} other {limite "
      & "inferiore}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {sotto l’intervallo previsto} "
      & "within_range {entro l’intervallo previsto} above_range {sopra "
      & "l’intervallo previsto} below_target {sotto l’obiettivo} at_target "
      & "{obiettivo raggiunto} above_target {sopra l’obiettivo} near_limit "
      & "{vicino al limite} warning_level {soglia di avviso} critical_level "
      & "{soglia critica} breached {soglia superata} other {stato della soglia "
      & "sconosciuto}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {aggiornato} one {{ahead, "
      & "number} commit avanti} many {{ahead, number} di commit avanti} other "
      & "{{ahead, number} commit avanti}}} other {{ahead, plural, =0 {{behind, "
      & "plural, one {{behind, number} commit indietro} many {{behind, number} "
      & "di commit indietro} other {{behind, number} commit indietro}}} other "
      & "{{ahead, plural, one {{ahead, number} commit avanti} many {{ahead, "
      & "number} di commit avanti} other {{ahead, number} commit avanti}}, "
      & "{behind, plural, one {{behind, number} commit indietro} many {{behind, "
      & "number} di commit indietro} other {{behind, number} commit "
      & "indietro}}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {approvato da {approver}} other {in attesa di "
      & "approvazione da {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {tentativo {attempt, "
      & "number} di {limit, number}} other {tentativo {attempt, number} di "
      & "{limit, number} (limite superato)}}} other {tentativo {attempt, "
      & "number} di {limit, number}}}");
   P ("label.workflows.blocker_label", "bloccato: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {nessuna dipendenza bloccante} one {{count, number} "
      & "dipendenza bloccante} many {{count, number} di dipendenze bloccanti} "
      & "other {{count, number} dipendenze bloccanti}}");
   P ("label.workflows.handoff_label", "passaggio di consegne da {from} a {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {milestone imminente} "
      & "current_milestone {milestone attuale} complete_milestone {milestone "
      & "completata} missed_milestone {milestone mancata} other {milestone "
      & "bloccata}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {imminente} "
      & "current_milestone {attuale} complete_milestone {completata} "
      & "missed_milestone {mancata} other {bloccata}}");
   P ("label.workflows.next_action_label", "prossima azione: {action}");
   P ("label.workflows.owner_label", "responsabile: {owner}");
   P ("label.workflows.resume_label", "riprendi {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {in sospeso} active_step {attivo} "
      & "waiting_step {in attesa} blocked_step {bloccato} done_step "
      & "{completato} failed_step {non riuscito} other {saltato}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {in sospeso} active_step {attivo} "
      & "waiting_step {in attesa} blocked_step {bloccato} done_step "
      & "{completato} failed_step {non riuscito} other {saltato}}");
   P ("label.workflows.waiting_label", "in attesa di {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {non avviato} "
      & "in_progress_state {in corso} waiting_state {in attesa} "
      & "waiting_approval_state {in attesa di approvazione} blocked_state "
      & "{bloccato} completed_state {completato} failed_state {non riuscito} "
      & "cancelled_state {annullato} skipped_state {saltato} other {in pausa}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {non avviato} in_progress_state {in "
      & "corso} waiting_state {in attesa} waiting_approval_state {in attesa di "
      & "approvazione} blocked_state {bloccato} completed_state {completato} "
      & "failed_state {non riuscito} cancelled_state {annullato} skipped_state "
      & "{saltato} other {in pausa}}");
end Labels_3;
