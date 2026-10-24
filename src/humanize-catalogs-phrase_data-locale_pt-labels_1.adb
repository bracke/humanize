separate (Humanize.Catalogs.Phrase_Data.Locale_Pt)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name}: conta ativa} invited_account "
      & "{{name}: conta convidada} locked_account {{name}: conta bloqueada} "
      & "suspended_account {{name}: conta suspensa} deleted_account {{name}: "
      & "conta excluída} other {{name}: estado da conta desconhecido}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {conta ativa} invited_account {conta "
      & "convidada} locked_account {conta bloqueada} suspended_account {conta "
      & "suspensa} deleted_account {conta excluída} other {estado da conta "
      & "desconhecido}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {dispositivo confiável} "
      & "untrusted_device {dispositivo não confiável} new_device {novo "
      & "dispositivo} other {dispositivo bloqueado}}");
   P ("label.accounts.last_active_label", "{name}: última atividade {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: falha no login} other {{name}: "
      & "login bem-sucedido}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA ativada} mfa_disabled {MFA "
      & "desativada} mfa_required {MFA obrigatória} other {redefinição de "
      & "MFA obrigatória}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: sessão ativa} expired_session "
      & "{{name}: sessão expirada} revoked_session {{name}: sessão revogada} "
      & "idle_session {{name}: sessão inativa} other {{name}: estado da "
      & "sessão desconhecido}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {sessão ativa} expired_session "
      & "{sessão expirada} revoked_session {sessão revogada} idle_session "
      & "{sessão inativa} other {estado da sessão desconhecido}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {nenhum anexo} one {1 anexo} many {{count, number} "
      & "de anexos} other {{count, number} anexos}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, one {{name}: {count, number} anexo} many {{name}: "
      & "{count, number} de anexos} other {{name}: {count, number} anexos}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {arquivo anexado} image_attachment "
      & "{imagem anexada} video_attachment {vídeo anexado} audio_attachment "
      & "{áudio anexado} document_attachment {documento anexado} "
      & "archive_attachment {arquivo compactado anexado} other {link anexado}}");
   P ("label.attachments.attachment_label",
      "{name}: {kind, select, file_attachment {arquivo} image_attachment "
      & "{imagem} video_attachment {vídeo} audio_attachment {áudio} "
      & "document_attachment {documento} archive_attachment {arquivo "
      & "compactado} other {link}} {state, select, pending_attachment "
      & "{pendente} uploading_attachment {enviando} uploaded_attachment {{kind, "
      & "select, image_attachment {enviada} other {enviado}}} failed_attachment "
      & "{com falha} removed_attachment {{kind, select, image_attachment "
      & "{removida} other {removido}}} other {{kind, select, image_attachment "
      & "{bloqueada} other {bloqueado}}}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {anexo pendente} "
      & "uploading_attachment {enviando anexo} uploaded_attachment {anexo "
      & "enviado} failed_attachment {falha no anexo} removed_attachment {anexo "
      & "removido} other {anexo bloqueado}}");
   P ("label.attachments.download_label", "baixar {name}");
   P ("label.attachments.expiring_link_label", "{name}: o link expira {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "visualizar {name}");
   P ("label.attachments.remove_label", "remover {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: não verificado} scanning "
      & "{{name}: verificando} safe {{name}: nenhuma ameaça} suspicious "
      & "{{name}: suspeito} other {{name}: infectado}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {não verificado} scanning {verificando} "
      & "safe {nenhuma ameaça} suspicious {suspeito} other {infectado}}");
   P ("label.attachments.upload_error_label", "falha ao enviar {name}: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {selo} new_badge {selo novo} "
      & "updated_badge {selo atualizado} deprecated_badge {selo obsoleto} "
      & "selected_badge {selo selecionado} disabled_badge {selo desativado} "
      & "other {selo dispensável}} ({tone, select, neutral_tone {neutro} "
      & "info_tone {informação} success_tone {sucesso} warning_tone {aviso} "
      & "danger_tone {perigo} other {atenuado}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {selo de prioridade baixa} "
      & "medium_priority {selo de prioridade média} high_priority {selo de "
      & "prioridade alta} other {selo de prioridade crítica}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {selo padrão} new_badge {selo novo} "
      & "updated_badge {selo atualizado} deprecated_badge {selo obsoleto} "
      & "selected_badge {selo selecionado} disabled_badge {selo desativado} "
      & "other {selo dispensável}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {selo neutro} info_tone {selo informativo} "
      & "success_tone {selo de sucesso} warning_tone {selo de aviso} "
      & "danger_tone {selo de perigo} other {selo atenuado}}");
   P ("label.badges.chip_label",
      "{selected, select, false {chip {name}} other {chip {name} "
      & "selecionado}}");
   P ("label.badges.count_badge_label", "{name}: {count, number}");
   P ("label.badges.deprecated_label", "{name}: selo obsoleto (aviso)");
   P ("label.badges.dismiss_label", "dispensar {name}");
   P ("label.badges.new_label", "{name}: selo novo (informação)");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {nenhum selo oculto} one {+1 selo} many "
      & "{+{hidden_count, number} de selos} other {+{hidden_count, number} "
      & "selos}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: selo de prioridade baixa} "
      & "medium_priority {{name}: selo de prioridade média} high_priority "
      & "{{name}: selo de prioridade alta} other {{name}: selo de prioridade "
      & "crítica}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {{name}, status: neutro} info_tone "
      & "{{name}, status: informação} success_tone {{name}, status: sucesso} "
      & "warning_tone {{name}, status: aviso} danger_tone {{name}, status: "
      & "perigo} other {{name}, status: atenuado}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {nenhuma tag} one {1 tag} many {{count, number} de "
      & "tags} other {{count, number} tags}}");
   P ("label.badges.tag_label", "tag {name}");
   P ("label.badges.updated_label", "{name}: selo atualizado (sucesso)");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefato enviado} artifact_missing "
      & "{artefato ausente} artifact_expired {artefato expirado} other "
      & "{artefato verificado}}");
   P ("label.builds.benchmark_label", "benchmark {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {{name}: compilação na fila} "
      & "build_running {{name}: compilação em execução} build_passed "
      & "{{name}: compilação bem-sucedida} build_failed {{name}: falha na "
      & "compilação} snapshot_build {{name}: compilação snapshot} other "
      & "{{name}: compilação de lançamento}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {compilação na fila} build_running "
      & "{compilação em execução} build_passed {compilação bem-sucedida} "
      & "build_failed {falha na compilação} snapshot_build {compilação "
      & "snapshot} other {compilação de lançamento}}");
   P ("label.builds.coverage_label", "cobertura: {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {verificação de lançamento aprovada} "
      & "gate_failed {verificação de lançamento reprovada} gate_warning "
      & "{aviso na verificação de lançamento} other {verificação de "
      & "lançamento bloqueada}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {nenhum teste "
      & "aprovado} one {1 teste aprovado} many {{count, number} de testes "
      & "aprovados} other {{count, number} testes aprovados}}} failed_test "
      & "{{count, plural, =0 {nenhum teste com falha} one {1 teste com falha} "
      & "many {{count, number} de testes com falha} other {{count, number} "
      & "testes com falha}}} skipped_test {{count, plural, =0 {nenhum teste "
      & "ignorado} one {1 teste ignorado} many {{count, number} de testes "
      & "ignorados} other {{count, number} testes ignorados}}} flaky_test "
      & "{{count, plural, =0 {nenhum teste instável} one {1 teste instável} "
      & "many {{count, number} de testes instáveis} other {{count, number} "
      & "testes instáveis}}} other {{count, plural, =0 {nenhuma falha "
      & "esperada} one {1 teste com falha esperada} many {{count, number} de "
      & "testes com falha esperada} other {{count, number} testes com falha "
      & "esperada}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {aprovado} failed_test {com falha} "
      & "skipped_test {ignorado} flaky_test {instável} other {falha esperada}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name}: "
      & "desativado (sem alteração)} other {{field_name} mudou de desativado "
      & "para ativado}}} other {{new_value, select, false {{field_name} mudou "
      & "de ativado para desativado} other {{field_name}: ativado (sem "
      & "alteração)}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {adicionado} removed_change {removido} "
      & "modified_change {alterado} renamed_change {renomeado} unchanged_change "
      & "{sem alteração} metadata_change {metadados alterados} moved_change "
      & "{movido} conflict_change {conflito} other {alteração desconhecida}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {alteração informativa} "
      & "minor_change {alteração secundária} major_change {alteração "
      & "importante} other {alteração incompatível}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}: sem "
      & "alteração} other {{unchanged, plural, =0 {{field_name}: +{added, "
      & "number}} other {{field_name}: +{added, number}, {unchanged, number} "
      & "sem alteração}}}}} other {{added, plural, =0 {{unchanged, plural, =0 "
      & "{{field_name}: -{removed, number}} other {{field_name}: -{removed, "
      & "number}, {unchanged, number} sem alteração}}} other {{unchanged, "
      & "plural, =0 {{field_name}: +{added, number}, -{removed, number}} other "
      & "{{field_name}: +{added, number}, -{removed, number}, {unchanged, "
      & "number} sem alteração}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {nenhum conflito} one {1 conflito} many {{count, "
      & "number} de conflitos} other {{count, number} conflitos}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name}: de {old_label} para {new_label} "
      & "(mais tarde)} other {{field_name}: de {old_label} para {new_label} "
      & "(mais cedo)}}");
   P ("label.changes.duration_field_change_label", "{field_name} mudou de {old_label} para {new_label}");
   P ("label.changes.field_change_label", "{field_name} mudou de {old_value} para {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name}: adicionado} removed_change "
      & "{{name}: removido} modified_change {{name}: alterado} renamed_change "
      & "{{name}: renomeado} unchanged_change {{name}: sem alteração} "
      & "metadata_change {{name}: metadados alterados} moved_change {{name}: "
      & "movido} conflict_change {{name}: conflito} other {{name}: alteração "
      & "desconhecida}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {apenas os metadados mudaram} one {apenas 1 campo "
      & "de metadados mudou} many {apenas {count, number} de campos de "
      & "metadados mudaram} other {apenas {count, number} campos de metadados "
      & "mudaram}}");
   P ("label.changes.move_label", "{name}: movido de {from} para {to}");
   P ("label.changes.no_changes_label", "nenhuma alteração");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {nenhuma linha "
      & "alterada} one {1 linha adicionada} many {{lines_added, number} de "
      & "linhas adicionadas} other {{lines_added, number} linhas adicionadas}}} "
      & "one {{lines_added, plural, =0 {1 linha removida} one {1 linha "
      & "adicionada, 1 linha removida} many {{lines_added, number} de linhas "
      & "adicionadas, 1 linha removida} other {{lines_added, number} linhas "
      & "adicionadas, 1 linha removida}}} many {{lines_added, plural, =0 "
      & "{{lines_removed, number} de linhas removidas} one {1 linha adicionada, "
      & "{lines_removed, number} de linhas removidas} many {{lines_added, "
      & "number} de linhas adicionadas, {lines_removed, number} de linhas "
      & "removidas} other {{lines_added, number} linhas adicionadas, "
      & "{lines_removed, number} de linhas removidas}}} other {{lines_added, "
      & "plural, =0 {{lines_removed, number} linhas removidas} one {1 linha "
      & "adicionada, {lines_removed, number} linhas removidas} many "
      & "{{lines_added, number} de linhas adicionadas, {lines_removed, number} "
      & "linhas removidas} other {{lines_added, number} linhas adicionadas, "
      & "{lines_removed, number} linhas removidas}}}}");
   P ("label.changes.rename_label", "renomeado de {old_name} para {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} escreveu um rascunho de "
      & "comentário} published_comment {{author} comentou} edited_comment "
      & "{{author} editou um comentário} deleted_comment {{author} excluiu um "
      & "comentário} resolved_comment {{author} resolveu um comentário} "
      & "unresolved_comment {{author} reabriu um comentário} pinned_comment "
      & "{{author} fixou um comentário} other {{author} ocultou um "
      & "comentário}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {nenhum comentário} one {1 comentário} many "
      & "{{count, number} de comentários} other {{count, number} "
      & "comentários}}");
   P ("label.comments.comment_label",
      "comentário de {author} ({state, select, draft_comment {rascunho} "
      & "published_comment {publicado} edited_comment {editado} deleted_comment "
      & "{excluído} resolved_comment {resolvido} unresolved_comment {não "
      & "resolvido} pinned_comment {fixado} other {oculto}})");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {rascunho de comentário} "
      & "published_comment {comentário publicado} edited_comment {comentário "
      & "editado} deleted_comment {comentário excluído} resolved_comment "
      & "{comentário resolvido} unresolved_comment {comentário não "
      & "resolvido} pinned_comment {comentário fixado} other {comentário "
      & "oculto}}");
   P ("label.comments.deleted_label", "{author} excluiu um comentário");
   P ("label.comments.edited_label", "editado {time_text}");
   P ("label.comments.hide_comment_label", "ocultar comentário: {reason}");
   P ("label.comments.lock_thread_label", "bloquear a conversa {name}");
   P ("label.comments.mention_label", "{actor} mencionou {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {nenhum participante} one {1 participante} many "
      & "{{count, number} de participantes} other {{count, number} "
      & "participantes}}");
   P ("label.comments.pin_label", "fixar {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reação “curtir”} dislike_reaction "
      & "{reação “não curtir”} heart_reaction {reação de coração} "
      & "laugh_reaction {reação de risada} confused_reaction {reação de "
      & "confusão} hooray_reaction {reação de comemoração} rocket_reaction "
      & "{reação de foguete} other {reação de olhos}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {nenhuma curtida} one "
      & "{1 curtida} many {{count, number} de curtidas} other {{count, number} "
      & "curtidas}}} dislike_reaction {{count, plural, =0 {nenhum “não "
      & "curti”} one {1 “não curti”} other {{count, number} “não "
      & "curti”}}} heart_reaction {{count, plural, =0 {nenhum coração} one "
      & "{1 coração} many {{count, number} de corações} other {{count, "
      & "number} corações}}} laugh_reaction {{count, plural, =0 {nenhuma "
      & "risada} one {1 risada} many {{count, number} de risadas} other "
      & "{{count, number} risadas}}} confused_reaction {{count, plural, =0 "
      & "{nenhuma reação de confusão} one {1 reação de confusão} many "
      & "{{count, number} de reações de confusão} other {{count, number} "
      & "reações de confusão}}} hooray_reaction {{count, plural, =0 {nenhuma "
      & "comemoração} one {1 comemoração} many {{count, number} de "
      & "comemorações} other {{count, number} comemorações}}} "
      & "rocket_reaction {{count, plural, =0 {nenhum foguete} one {1 foguete} "
      & "many {{count, number} de foguetes} other {{count, number} foguetes}}} "
      & "other {{count, plural, =0 {nenhuma reação de olhos} one {1 reação "
      & "de olhos} many {{count, number} de reações de olhos} other {{count, "
      & "number} reações de olhos}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {nenhuma resposta} one {1 resposta} many {{count, "
      & "number} de respostas} other {{count, number} respostas}}");
   P ("label.comments.resolved_label", "{name}: resolvido");
   P ("label.comments.subscribe_label", "inscrever-se em {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {nenhuma conversa} one {1 conversa} many {{count, "
      & "number} de conversas} other {{count, number} conversas}}");
   P ("label.comments.thread_label",
      "{name}: conversa {state, select, open_thread {aberta} resolved_thread "
      & "{resolvida} locked_thread {bloqueada} other {arquivada}}{count, "
      & "plural, =0 {} one {, 1 comentário} many {, {count, number} de "
      & "comentários} other {, {count, number} comentários}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {conversa aberta} resolved_thread "
      & "{conversa resolvida} locked_thread {conversa bloqueada} other "
      & "{conversa arquivada}}");
   P ("label.comments.unpin_label", "desafixar {name}");
   P ("label.comments.unsubscribe_label", "cancelar inscrição em {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name}: melhorou} regressed {{name}: "
      & "piorou} unchanged {{name}: sem alteração} within_tolerance {{name}: "
      & "dentro da tolerância} outside_tolerance {{name}: fora da tolerância} "
      & "new_value {{name}: novo} removed_value {{name}: removido} other "
      & "{{name}: referência indisponível}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {melhorou} regressed {piorou} unchanged {sem "
      & "alteração} within_tolerance {dentro da tolerância} "
      & "outside_tolerance {fora da tolerância} new_value {novo} removed_value "
      & "{removido} other {referência indisponível}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name}: melhorou {difference_text}} "
      & "regressed {{name}: piorou {difference_text}} unchanged {{name}: sem "
      & "alteração ({difference_text})} within_tolerance {{name}: dentro da "
      & "tolerância ({difference_text})} outside_tolerance {{name}: fora da "
      & "tolerância ({difference_text})} new_value {{name}: novo "
      & "({difference_text})} removed_value {{name}: removido "
      & "({difference_text})} other {{name}: referência indisponível "
      & "({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name}: melhorou {difference_text}, "
      & "tolerância {tolerance_text}} regressed {{name}: piorou "
      & "{difference_text}, tolerância {tolerance_text}} unchanged {{name}: "
      & "sem alteração ({difference_text}), tolerância {tolerance_text}} "
      & "within_tolerance {{name}: dentro da tolerância ({difference_text}), "
      & "tolerância {tolerance_text}} outside_tolerance {{name}: fora da "
      & "tolerância ({difference_text}), tolerância {tolerance_text}} "
      & "new_value {{name}: novo ({difference_text}), tolerância "
      & "{tolerance_text}} removed_value {{name}: removido ({difference_text}), "
      & "tolerância {tolerance_text}} other {{name}: referência indisponível "
      & "({difference_text}), tolerância {tolerance_text}}}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {linha inválida} duplicate_record "
      & "{registro duplicado} missing_column {coluna ausente} unknown_field "
      & "{campo desconhecido} schema_mismatch {esquema incompatível} other "
      & "{registro ignorado}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {simulação bem-sucedida} "
      & "dry_run_failed {falha na simulação} import_valid {importação "
      & "válida} import_invalid {importação inválida} other {importação "
      & "parcial}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {simulação bem-sucedida} "
      & "dry_run_failed {falha na simulação} import_valid {importação "
      & "válida} import_invalid {importação inválida} other {importação "
      & "parcial}} (aceitos: {accepted, number}, rejeitados: {rejected, "
      & "number})");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {nenhuma linha "
      & "inválida} one {1 linha inválida} many {{count, number} de linhas "
      & "inválidas} other {{count, number} linhas inválidas}}} "
      & "duplicate_record {{count, plural, =0 {nenhum registro duplicado} one "
      & "{1 registro duplicado} many {{count, number} de registros duplicados} "
      & "other {{count, number} registros duplicados}}} missing_column {{count, "
      & "plural, =0 {nenhuma coluna ausente} one {1 coluna ausente} many "
      & "{{count, number} de colunas ausentes} other {{count, number} colunas "
      & "ausentes}}} unknown_field {{count, plural, =0 {nenhum campo "
      & "desconhecido} one {1 campo desconhecido} many {{count, number} de "
      & "campos desconhecidos} other {{count, number} campos desconhecidos}}} "
      & "schema_mismatch {{count, plural, =0 {nenhuma incompatibilidade de "
      & "esquema} one {1 incompatibilidade de esquema} many {{count, number} de "
      & "incompatibilidades de esquema} other {{count, number} "
      & "incompatibilidades de esquema}}} other {{count, plural, =0 {nenhum "
      & "registro ignorado} one {1 registro ignorado} many {{count, number} de "
      & "registros ignorados} other {{count, number} registros ignorados}}}}");
   P ("label.data_quality.row_issue_label",
      "linha {row, number}: {issue, select, invalid_row {inválida} "
      & "duplicate_record {registro duplicado} missing_column {coluna ausente} "
      & "unknown_field {campo desconhecido} schema_mismatch {esquema "
      & "incompatível} other {registro ignorado}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {linha inválida} "
      & "duplicate_record {registro duplicado} missing_column {coluna ausente} "
      & "unknown_field {campo desconhecido} schema_mismatch {esquema "
      & "incompatível} other {registro ignorado}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefato pronto} artifact_uploaded "
      & "{artefato enviado} artifact_signed {artefato assinado} "
      & "artifact_missing {artefato ausente} other {artefato expirado}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {implantação de {name} em "
      & "{environment} na fila} deploying {implantando {name} em {environment}} "
      & "deployed {{name} implantado em {environment}} failed_deployment {falha "
      & "na implantação de {name} em {environment}} rolled_back {{name} "
      & "revertido em {environment}} blocked_deployment {implantação de "
      & "{name} em {environment} bloqueada} other {implantação de {name} em "
      & "{environment} cancelada}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {implantação na fila} deploying "
      & "{implantando} deployed {implantado} failed_deployment {falha na "
      & "implantação} rolled_back {revertido} blocked_deployment "
      & "{implantação bloqueada} other {implantação cancelada}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {ambiente íntegro} "
      & "drifting_environment {desvio do ambiente} locked_environment {ambiente "
      & "bloqueado} maintenance_environment {ambiente em manutenção} other "
      & "{estado do ambiente desconhecido}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {nenhuma migração} migration_pending "
      & "{migração pendente} migrating {migrando} migration_complete "
      & "{migração concluída} other {falha na migração}}");
   P ("label.deployments.promotion_label", "{name} promovido de {from_environment} para {to_environment}");
   P ("label.deployments.rollback_label", "reversão de {name} para {target}");
   P ("label.deployments.rollout_label", "implantação gradual de {name}: {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {nenhum item afetado} one {{count, number} item "
      & "afetado} many {{count, number} de itens afetados} other {{count, "
      & "number} itens afetados}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {aprovada} failed_check {com "
      & "falha} warning_check {com avisos} skipped_check {ignorada} "
      & "pending_check {pendente} other {em execução}} ({duration_s, plural, "
      & "one {{duration_s, number} segundo} many {{duration_s, number} de "
      & "segundos} other {{duration_s, number} segundos}})");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {aprovada} failed_check {com "
      & "falha} warning_check {com avisos} skipped_check {ignorada} "
      & "pending_check {pendente} other {em execução}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {aprovada} failed_check {com falha} "
      & "warning_check {com avisos} skipped_check {ignorada} pending_check "
      & "{pendente} other {em execução}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{kind, select, expected_value {valor esperado "
      & "para {subject}} expected_unit {unidade esperada para {subject}} "
      & "invalid_range {intervalo inválido para {subject}} end_before_start "
      & "{fim do intervalo anterior ao início para {subject}} unknown_field "
      & "{campo desconhecido para {subject}} unsafe_redacted_value {valor não "
      & "seguro ocultado para {subject}} unsupported_syntax {sintaxe sem "
      & "suporte para {subject}} other {explicação do diagnóstico para "
      & "{subject}}}; use {suggestion}} other {{kind, select, expected_value "
      & "{valor esperado para {subject} na posição {position, number}} "
      & "expected_unit {unidade esperada para {subject} na posição {position, "
      & "number}} invalid_range {intervalo inválido para {subject} na "
      & "posição {position, number}} end_before_start {fim do intervalo "
      & "anterior ao início para {subject} na posição {position, number}} "
      & "unknown_field {campo desconhecido para {subject} na posição "
      & "{position, number}} unsafe_redacted_value {valor não seguro ocultado "
      & "para {subject} na posição {position, number}} unsupported_syntax "
      & "{sintaxe sem suporte para {subject} na posição {position, number}} "
      & "other {explicação do diagnóstico para {subject} na posição "
      & "{position, number}}}; use {suggestion}}}");
   P ("label.diagnostics.diagnostic_label",
      "{line, plural, =0 {{severity, select, info_severity {informação em "
      & "{path}: {message}} notice_severity {observação em {path}: {message}} "
      & "warning_severity {aviso em {path}: {message}} error_severity {erro em "
      & "{path}: {message}} critical_severity {crítico em {path}: {message}} "
      & "other {bloqueante em {path}: {message}}}} other {{severity, select, "
      & "info_severity {informação em {path}, linha {line, number}: "
      & "{message}} notice_severity {observação em {path}, linha {line, "
      & "number}: {message}} warning_severity {aviso em {path}, linha {line, "
      & "number}: {message}} error_severity {erro em {path}, linha {line, "
      & "number}: {message}} critical_severity {crítico em {path}, linha "
      & "{line, number}: {message}} other {bloqueante em {path}, linha {line, "
      & "number}: {message}}}}}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {falha em {path}} other {{column, plural, =0 {falha "
      & "em {path}, linha {line, number}} other {falha em {path}, linha {line, "
      & "number}, coluna {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {informação em {field_name}: "
      & "{message}} notice_severity {observação em {field_name}: {message}} "
      & "warning_severity {aviso em {field_name}: {message}} error_severity "
      & "{erro em {field_name}: {message}} critical_severity {crítico em "
      & "{field_name}: {message}} other {bloqueante em {field_name}: "
      & "{message}}}");
   P ("label.diagnostics.first_failure_label",
      "{line, plural, =0 {primeira falha em {check_name}: {path}} other "
      & "{primeira falha em {check_name}: {path}, linha {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{nenhum problema} other {{notices, plural, one {{notices, number} "
      & "observação} many {{notices, number} de observações} other "
      & "{{notices, number} observações}}}}} other {{notices, plural, =0 "
      & "{{warnings, plural, one {{warnings, number} aviso} many {{warnings, "
      & "number} de avisos} other {{warnings, number} avisos}}} other "
      & "{{warnings, plural, one {{warnings, number} aviso} many {{warnings, "
      & "number} de avisos} other {{warnings, number} avisos}}, {notices, "
      & "plural, one {{notices, number} observação} many {{notices, number} "
      & "de observações} other {{notices, number} observações}}}}}}} other "
      & "{{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, one "
      & "{{errors, number} erro} many {{errors, number} de erros} other "
      & "{{errors, number} erros}}} other {{errors, plural, one {{errors, "
      & "number} erro} many {{errors, number} de erros} other {{errors, number} "
      & "erros}}, {notices, plural, one {{notices, number} observação} many "
      & "{{notices, number} de observações} other {{notices, number} "
      & "observações}}}}} other {{notices, plural, =0 {{errors, plural, one "
      & "{{errors, number} erro} many {{errors, number} de erros} other "
      & "{{errors, number} erros}}, {warnings, plural, one {{warnings, number} "
      & "aviso} many {{warnings, number} de avisos} other {{warnings, number} "
      & "avisos}}} other {{errors, plural, one {{errors, number} erro} many "
      & "{{errors, number} de erros} other {{errors, number} erros}}, "
      & "{warnings, plural, one {{warnings, number} aviso} many {{warnings, "
      & "number} de avisos} other {{warnings, number} avisos}}, {notices, "
      & "plural, one {{notices, number} observação} many {{notices, number} "
      & "de observações} other {{notices, number} observações}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, linha "
      & "{line, number}} other {{path}, linha {line, number}, coluna {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{position, plural, =0 {{family, select, byte_parser {sintaxe sem "
      & "suporte (analisador de tamanhos): {error}; use B, kB, MB, GB, KiB, "
      & "MiB, GiB ou TiB} duration_parser {sintaxe sem suporte (analisador de "
      & "durações): {error}; use ms, s, min, h, d, w, month ou year} "
      & "date_time_parser {sintaxe sem suporte (analisador de data e hora): "
      & "{error}; use uma data ISO, um dia em linguagem natural ou um horário} "
      & "color_parser {sintaxe sem suporte (analisador de cores): {error}; use "
      & "hex, rgb(), hsl(), lab(), lch() ou um nome de cor} url_parser {sintaxe "
      & "sem suporte (analisador de URL): {error}; use esquema, host, caminho, "
      & "consulta ou fragmento} unit_parser {sintaxe sem suporte (analisador de "
      & "unidades): {error}; use uma unidade compatível com o Humanize} "
      & "recurrence_parser {sintaxe sem suporte (analisador de recorrências): "
      & "{error}; use cron ou uma recorrência every/weekday} "
      & "domain_label_parser {sintaxe sem suporte (analisador de rótulos de "
      & "domínio): {error}; use um rótulo de domínio determinístico do "
      & "Humanize} other {sintaxe sem suporte (analisador): {error}; use um "
      & "formato de entrada compatível}}} other {{family, select, byte_parser "
      & "{sintaxe sem suporte (analisador de tamanhos): {error} na posição "
      & "{position, number}; use B, kB, MB, GB, KiB, MiB, GiB ou TiB} "
      & "duration_parser {sintaxe sem suporte (analisador de durações): "
      & "{error} na posição {position, number}; use ms, s, min, h, d, w, "
      & "month ou year} date_time_parser {sintaxe sem suporte (analisador de "
      & "data e hora): {error} na posição {position, number}; use uma data "
      & "ISO, um dia em linguagem natural ou um horário} color_parser {sintaxe "
      & "sem suporte (analisador de cores): {error} na posição {position, "
      & "number}; use hex, rgb(), hsl(), lab(), lch() ou um nome de cor} "
      & "url_parser {sintaxe sem suporte (analisador de URL): {error} na "
      & "posição {position, number}; use esquema, host, caminho, consulta ou "
      & "fragmento} unit_parser {sintaxe sem suporte (analisador de unidades): "
      & "{error} na posição {position, number}; use uma unidade compatível "
      & "com o Humanize} recurrence_parser {sintaxe sem suporte (analisador de "
      & "recorrências): {error} na posição {position, number}; use cron ou "
      & "uma recorrência every/weekday} domain_label_parser {sintaxe sem "
      & "suporte (analisador de rótulos de domínio): {error} na posição "
      & "{position, number}; use um rótulo de domínio determinístico do "
      & "Humanize} other {sintaxe sem suporte (analisador): {error} na "
      & "posição {position, number}; use um formato de entrada "
      & "compatível}}}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {aprovada} failed_check {com falha} "
      & "warning_check {com avisos} skipped_check {ignorada} pending_check "
      & "{pendente} other {em execução}}{notices, plural, =0 {, nenhuma "
      & "observação} one {, {notices, number} observação} many {, {notices, "
      & "number} de observações} other {, {notices, number} observações}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {nova tentativa {attempt, "
      & "number} de 1} other {nova tentativa {attempt, number} de 1: limite "
      & "excedido}}} other {nova tentativa {attempt, number} de {limit, "
      & "number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {informação} notice_severity "
      & "{observação} warning_severity {aviso} error_severity {erro} "
      & "critical_severity {crítico} other {bloqueante}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {diagnósticos de compilação} "
      & "test_source {diagnósticos de testes} lint_source {diagnósticos de "
      & "lint} import_source {diagnósticos de importação} validation_source "
      & "{diagnósticos de validação} runtime_source {diagnósticos de "
      & "execução} security_source {diagnósticos de segurança} other "
      & "{diagnósticos}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {{source, select, build_source {{count, number} "
      & "diagnóstico de compilação} test_source {{count, number} "
      & "diagnóstico de testes} lint_source {{count, number} diagnóstico de "
      & "lint} import_source {{count, number} diagnóstico de importação} "
      & "validation_source {{count, number} diagnóstico de validação} "
      & "runtime_source {{count, number} diagnóstico de execução} "
      & "security_source {{count, number} diagnóstico de segurança} other "
      & "{{count, number} diagnóstico}}} many {{source, select, build_source "
      & "{{count, number} de diagnósticos de compilação} test_source "
      & "{{count, number} de diagnósticos de testes} lint_source {{count, "
      & "number} de diagnósticos de lint} import_source {{count, number} de "
      & "diagnósticos de importação} validation_source {{count, number} de "
      & "diagnósticos de validação} runtime_source {{count, number} de "
      & "diagnósticos de execução} security_source {{count, number} de "
      & "diagnósticos de segurança} other {{count, number} de "
      & "diagnósticos}}} other {{source, select, build_source {{count, number} "
      & "diagnósticos de compilação} test_source {{count, number} "
      & "diagnósticos de testes} lint_source {{count, number} diagnósticos de "
      & "lint} import_source {{count, number} diagnósticos de importação} "
      & "validation_source {{count, number} diagnósticos de validação} "
      & "runtime_source {{count, number} diagnósticos de execução} "
      & "security_source {{count, number} diagnósticos de segurança} other "
      & "{{count, number} diagnósticos}}}}");
   P ("label.diagnostics.suggested_action_label", "próximo passo: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {nome de domínio} ipv4_host {endereço "
      & "IPv4} ipv6_host {endereço IPv6} localhost_host {host local} "
      & "private_network_host {endereço de rede privada} other {host "
      & "desconhecido}}");
   P ("label.events.all_day_label", "{name} (dia inteiro)");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {sem resposta} accepted {aceito} "
      & "declined {recusado} maybe {talvez} other {na lista de espera}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {nenhum participante} one {{count, number} "
      & "participante} many {{count, number} de participantes} other {{count, "
      & "number} participantes}}");
   P ("label.events.canceled_label", "{name}: cancelado");
   P ("label.events.check_in_label", "fazer check-in em {name}");
   P ("label.events.conference_link_label", "link da videoconferência de {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {nenhum evento} one {{count, number} evento} many "
      & "{{count, number} de eventos} other {{count, number} eventos}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {evento agendado} "
      & "tentative_event {evento provisório} in_progress_event {evento em "
      & "andamento} completed_event {evento concluído} canceled_event {evento "
      & "cancelado} other {evento adiado}}");
   P ("label.events.event_location_label", "{name} em {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {evento agendado} tentative_event "
      & "{evento provisório} in_progress_event {evento em andamento} "
      & "completed_event {evento concluído} canceled_event {evento cancelado} "
      & "other {evento adiado}}");
   P ("label.events.event_time_label", "{name}: {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {evento público} private_event "
      & "{evento privado} busy_event {ocupado} other {disponível}}");
   P ("label.events.organizer_label", "organizado por {name}");
   P ("label.events.rsvp_label",
      "resposta: {state, select, not_responded {pendente} accepted {aceita} "
      & "declined {recusada} maybe {talvez} other {lista de espera}}");
   P ("label.events.reminder_label", "lembrete: {time_text}");
   P ("label.events.rescheduled_label", "{name} reagendado para {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {{used, number} caractere} many {{used, number} de "
      & "caracteres} other {{used, number} caracteres}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {sem limite de caracteres} one {{limit, number} "
      & "caractere no máximo} many {{limit, number} de caracteres no máximo} "
      & "other {{limit, number} caracteres no máximo}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {{used, number} caractere} many "
      & "{{used, number} de caracteres} other {{used, number} caracteres}}} "
      & "other {{used, number} de {limit, plural, one {{limit, number} "
      & "caractere} many {{limit, number} de caracteres} other {{limit, number} "
      & "caracteres}}}}");
   P ("label.forms.field_label",
      "{name}: {required, select, false {campo opcional} other {campo "
      & "obrigatório}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {válido} invalid_input "
      & "{inválido} required_input {obrigatório} optional_input {opcional} "
      & "disabled_input {desativado} other {somente leitura}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {nenhum problema no "
      & "formulário} other {{warnings, plural, one {{warnings, number} aviso} "
      & "many {{warnings, number} de avisos} other {{warnings, number} "
      & "avisos}}}}} other {{warnings, plural, =0 {{errors, plural, one "
      & "{{errors, number} erro} many {{errors, number} de erros} other "
      & "{{errors, number} erros}}} other {{errors, plural, one {{errors, "
      & "number} erro} many {{errors, number} de erros} other {{errors, number} "
      & "erros}}, {warnings, plural, one {{warnings, number} aviso} many "
      & "{{warnings, number} de avisos} other {{warnings, number} avisos}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {não iniciado} editing_form {editando} "
      & "dirty_form {alterações não salvas} saving_form {salvando} "
      & "saved_form {salvo} submitted_form {enviado} other {falha no envio}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {entrada válida} invalid_input {entrada "
      & "inválida} required_input {entrada obrigatória} optional_input "
      & "{entrada opcional} disabled_input {entrada desativada} other {entrada "
      & "somente leitura}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {não iniciado} editing_form {editando} "
      & "dirty_form {alterações não salvas} saving_form {salvando o "
      & "formulário} saved_form {formulário salvo} submitted_form "
      & "{formulário enviado} other {{errors, plural, =0 {falha no envio} "
      & "other {falha no envio ({errors, plural, one {{errors, number} erro} "
      & "many {{errors, number} de erros} other {{errors, number} erros}})}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {nenhuma alteração não salva} one {{count, "
      & "number} alteração não salva} many {{count, number} de alterações "
      & "não salvas} other {{count, number} alterações não salvas}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {nome acessível "
      & "ausente} low_contrast {contraste baixo} skipped_heading_level {nível "
      & "de título pulado} missing_form_label {rótulo de formulário ausente} "
      & "invalid_aria {ARIA inválido} keyboard_trap {armadilha de teclado} "
      & "other {problema de acessibilidade desconhecido}}");
   P ("label.markup.accessibility_page_summary_label",
      "resumo de acessibilidade de {title}: {landmarks, plural, one "
      & "{{landmarks, number} ponto de referência} many {{landmarks, number} "
      & "de pontos de referência} other {{landmarks, number} pontos de "
      & "referência}}, {headings, plural, one {{headings, number} título} "
      & "many {{headings, number} de títulos} other {{headings, number} "
      & "títulos}}, {issues, plural, one {{issues, number} problema} many "
      & "{{issues, number} de problemas} other {{issues, number} problemas}}");
end Labels_1;
