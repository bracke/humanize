separate (Humanize.Catalogs.Phrase_Data.Locale_Pt)
procedure Labels_3 is
begin
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {abaixo do intervalo esperado} "
      & "within_range {dentro do intervalo esperado} above_range {acima do "
      & "intervalo esperado} below_target {abaixo da meta} at_target {na meta} "
      & "above_target {acima da meta} near_limit {próximo do limite} "
      & "warning_level {limiar de aviso} critical_level {limiar crítico} "
      & "breached {limiar ultrapassado} other {estado do limiar desconhecido}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {atualizado} one {{ahead, "
      & "number} commit à frente} many {{ahead, number} de commits à frente} "
      & "other {{ahead, number} commits à frente}}} other {{ahead, plural, =0 "
      & "{{behind, plural, one {{behind, number} commit atrás} many {{behind, "
      & "number} de commits atrás} other {{behind, number} commits atrás}}} "
      & "other {{ahead, plural, one {{ahead, number} commit à frente} many "
      & "{{ahead, number} de commits à frente} other {{ahead, number} commits "
      & "à frente}}, {behind, plural, one {{behind, number} commit atrás} "
      & "many {{behind, number} de commits atrás} other {{behind, number} "
      & "commits atrás}}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {aprovado por {approver}} other {aguardando "
      & "aprovação de {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {tentativa {attempt, "
      & "number} de {limit, number}} other {tentativa {attempt, number} de "
      & "{limit, number} (limite excedido)}}} other {tentativa {attempt, "
      & "number} de {limit, number}}}");
   P ("label.workflows.blocker_label", "bloqueado: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {nenhuma dependência bloqueadora} one {{count, "
      & "number} dependência bloqueadora} many {{count, number} de "
      & "dependências bloqueadoras} other {{count, number} dependências "
      & "bloqueadoras}}");
   P ("label.workflows.handoff_label", "transferência de {from} para {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {próximo marco} current_milestone "
      & "{marco atual} complete_milestone {marco concluído} missed_milestone "
      & "{marco perdido} other {marco bloqueado}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {próximo} "
      & "current_milestone {atual} complete_milestone {concluído} "
      & "missed_milestone {perdido} other {bloqueado}}");
   P ("label.workflows.next_action_label", "próxima ação: {action}");
   P ("label.workflows.owner_label", "responsável: {owner}");
   P ("label.workflows.resume_label", "retomar {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {pendente} active_step {ativa} "
      & "waiting_step {aguardando} blocked_step {bloqueada} done_step "
      & "{concluída} failed_step {com falha} other {ignorada}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {pendente} active_step {ativa} "
      & "waiting_step {aguardando} blocked_step {bloqueada} done_step "
      & "{concluída} failed_step {com falha} other {ignorada}}");
   P ("label.workflows.waiting_label", "aguardando {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {não iniciado} "
      & "in_progress_state {em andamento} waiting_state {aguardando} "
      & "waiting_approval_state {aguardando aprovação} blocked_state "
      & "{bloqueado} completed_state {concluído} failed_state {com falha} "
      & "cancelled_state {cancelado} skipped_state {ignorado} other {pausado}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {não iniciado} in_progress_state "
      & "{em andamento} waiting_state {aguardando} waiting_approval_state "
      & "{aguardando aprovação} blocked_state {bloqueado} completed_state "
      & "{concluído} failed_state {com falha} cancelled_state {cancelado} "
      & "skipped_state {ignorado} other {pausado}}");
end Labels_3;
