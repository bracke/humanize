separate (Humanize.Catalogs.Phrase_Data.Locale_Pt_Pt)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name}: conta ativa} invited_account "
      & "{{name}: conta convidada} locked_account {{name}: conta bloqueada} "
      & "suspended_account {{name}: conta suspensa} deleted_account {{name}: "
      & "conta eliminada} other {{name}: estado da conta desconhecido}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {conta ativa} invited_account {conta "
      & "convidada} locked_account {conta bloqueada} suspended_account {conta "
      & "suspensa} deleted_account {conta eliminada} other {estado da conta "
      & "desconhecido}}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: falha ao iniciar sessão} other "
      & "{{name}: sessão iniciada com êxito}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA ativada} mfa_disabled {MFA "
      & "desativada} mfa_required {MFA obrigatória} other {reposição de MFA "
      & "obrigatória}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {ficheiro anexado} image_attachment "
      & "{imagem anexada} video_attachment {vídeo anexado} audio_attachment "
      & "{áudio anexado} document_attachment {documento anexado} "
      & "archive_attachment {arquivo comprimido anexado} other {link anexado}}");
   P ("label.attachments.attachment_label",
      "{name}: {kind, select, file_attachment {ficheiro} image_attachment "
      & "{imagem} video_attachment {vídeo} audio_attachment {áudio} "
      & "document_attachment {documento} archive_attachment {arquivo "
      & "comprimido} other {link}} {state, select, pending_attachment "
      & "{pendente} uploading_attachment {a enviar} uploaded_attachment {{kind, "
      & "select, image_attachment {enviada} other {enviado}}} failed_attachment "
      & "{com falha} removed_attachment {{kind, select, image_attachment "
      & "{removida} other {removido}}} other {{kind, select, image_attachment "
      & "{bloqueada} other {bloqueado}}}}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {anexo pendente} "
      & "uploading_attachment {a enviar anexo} uploaded_attachment {anexo "
      & "enviado} failed_attachment {falha no anexo} removed_attachment {anexo "
      & "removido} other {anexo bloqueado}}");
   P ("label.attachments.download_label", "transferir {name}");
   P ("label.attachments.preview_label", "pré-visualizar {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: não verificado} scanning "
      & "{{name}: a verificar} safe {{name}: nenhuma ameaça} suspicious "
      & "{{name}: suspeito} other {{name}: infectado}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {não verificado} scanning {a verificar} "
      & "safe {nenhuma ameaça} suspicious {suspeito} other {infectado}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {selo predefinido} new_badge {selo novo} "
      & "updated_badge {selo atualizado} deprecated_badge {selo obsoleto} "
      & "selected_badge {selo selecionado} disabled_badge {selo desativado} "
      & "other {selo dispensável}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {{name}, estado: neutro} info_tone "
      & "{{name}, estado: informação} success_tone {{name}, estado: sucesso} "
      & "warning_tone {{name}, estado: aviso} danger_tone {{name}, estado: "
      & "perigo} other {{name}, estado: atenuado}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {nenhuma etiqueta} one {1 etiqueta} many {{count, "
      & "number} de etiquetas} other {{count, number} etiquetas}}");
   P ("label.badges.tag_label", "etiqueta {name}");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefacto enviado} artifact_missing "
      & "{artefacto ausente} artifact_expired {artefacto expirado} other "
      & "{artefacto verificado}}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} escreveu um rascunho de "
      & "comentário} published_comment {{author} comentou} edited_comment "
      & "{{author} editou um comentário} deleted_comment {{author} eliminou um "
      & "comentário} resolved_comment {{author} resolveu um comentário} "
      & "unresolved_comment {{author} reabriu um comentário} pinned_comment "
      & "{{author} fixou um comentário} other {{author} ocultou um "
      & "comentário}}");
   P ("label.comments.comment_label",
      "comentário de {author} ({state, select, draft_comment {rascunho} "
      & "published_comment {publicado} edited_comment {editado} deleted_comment "
      & "{eliminado} resolved_comment {resolvido} unresolved_comment {não "
      & "resolvido} pinned_comment {fixado} other {oculto}})");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {rascunho de comentário} "
      & "published_comment {comentário publicado} edited_comment {comentário "
      & "editado} deleted_comment {comentário eliminado} resolved_comment "
      & "{comentário resolvido} unresolved_comment {comentário não "
      & "resolvido} pinned_comment {comentário fixado} other {comentário "
      & "oculto}}");
   P ("label.comments.deleted_label", "{author} eliminou um comentário");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reação “gosto”} dislike_reaction "
      & "{reação “não gosto”} heart_reaction {reação de coração} "
      & "laugh_reaction {reação de riso} confused_reaction {reação de "
      & "confusão} hooray_reaction {reação de comemoração} rocket_reaction "
      & "{reação de foguete} other {reação de olhos}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {nenhum gosto} one {1 "
      & "gosto} many {{count, number} de gostos} other {{count, number} "
      & "gostos}}} dislike_reaction {{count, plural, =0 {nenhum “não "
      & "gosto”} one {1 “não gosto”} other {{count, number} “não "
      & "gosto”}}} heart_reaction {{count, plural, =0 {nenhum coração} one "
      & "{1 coração} many {{count, number} de corações} other {{count, "
      & "number} corações}}} laugh_reaction {{count, plural, =0 {nenhum riso} "
      & "one {1 riso} many {{count, number} de risos} other {{count, number} "
      & "risos}}} confused_reaction {{count, plural, =0 {nenhuma reação de "
      & "confusão} one {1 reação de confusão} many {{count, number} de "
      & "reações de confusão} other {{count, number} reações de "
      & "confusão}}} hooray_reaction {{count, plural, =0 {nenhuma "
      & "comemoração} one {1 comemoração} many {{count, number} de "
      & "comemorações} other {{count, number} comemorações}}} "
      & "rocket_reaction {{count, plural, =0 {nenhum foguete} one {1 foguete} "
      & "many {{count, number} de foguetes} other {{count, number} foguetes}}} "
      & "other {{count, plural, =0 {nenhuma reação de olhos} one {1 reação "
      & "de olhos} many {{count, number} de reações de olhos} other {{count, "
      & "number} reações de olhos}}}}");
   P ("label.comments.subscribe_label", "subscrever {name}");
   P ("label.comments.unsubscribe_label", "cancelar subscrição de {name}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {linha inválida} duplicate_record "
      & "{registo duplicado} missing_column {coluna ausente} unknown_field "
      & "{campo desconhecido} schema_mismatch {esquema incompatível} other "
      & "{registo ignorado}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {simulação bem-sucedida} "
      & "dry_run_failed {falha na simulação} import_valid {importação "
      & "válida} import_invalid {importação inválida} other {importação "
      & "parcial}} (aceites: {accepted, number}, rejeitados: {rejected, "
      & "number})");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {nenhuma linha "
      & "inválida} one {1 linha inválida} many {{count, number} de linhas "
      & "inválidas} other {{count, number} linhas inválidas}}} "
      & "duplicate_record {{count, plural, =0 {nenhum registo duplicado} one {1 "
      & "registo duplicado} many {{count, number} de registos duplicados} other "
      & "{{count, number} registos duplicados}}} missing_column {{count, "
      & "plural, =0 {nenhuma coluna ausente} one {1 coluna ausente} many "
      & "{{count, number} de colunas ausentes} other {{count, number} colunas "
      & "ausentes}}} unknown_field {{count, plural, =0 {nenhum campo "
      & "desconhecido} one {1 campo desconhecido} many {{count, number} de "
      & "campos desconhecidos} other {{count, number} campos desconhecidos}}} "
      & "schema_mismatch {{count, plural, =0 {nenhuma incompatibilidade de "
      & "esquema} one {1 incompatibilidade de esquema} many {{count, number} de "
      & "incompatibilidades de esquema} other {{count, number} "
      & "incompatibilidades de esquema}}} other {{count, plural, =0 {nenhum "
      & "registo ignorado} one {1 registo ignorado} many {{count, number} de "
      & "registos ignorados} other {{count, number} registos ignorados}}}}");
   P ("label.data_quality.row_issue_label",
      "linha {row, number}: {issue, select, invalid_row {inválida} "
      & "duplicate_record {registo duplicado} missing_column {coluna ausente} "
      & "unknown_field {campo desconhecido} schema_mismatch {esquema "
      & "incompatível} other {registo ignorado}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {linha inválida} "
      & "duplicate_record {registo duplicado} missing_column {coluna ausente} "
      & "unknown_field {campo desconhecido} schema_mismatch {esquema "
      & "incompatível} other {registo ignorado}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefacto pronto} artifact_uploaded "
      & "{artefacto enviado} artifact_signed {artefacto assinado} "
      & "artifact_missing {artefacto ausente} other {artefacto expirado}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {implantação de {name} em "
      & "{environment} na fila} deploying {a implantar {name} em {environment}} "
      & "deployed {{name} implantado em {environment}} failed_deployment {falha "
      & "na implantação de {name} em {environment}} rolled_back {{name} "
      & "revertido em {environment}} blocked_deployment {implantação de "
      & "{name} em {environment} bloqueada} other {implantação de {name} em "
      & "{environment} cancelada}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {implantação na fila} deploying {a "
      & "implantar} deployed {implantado} failed_deployment {falha na "
      & "implantação} rolled_back {revertido} blocked_deployment "
      & "{implantação bloqueada} other {implantação cancelada}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {nenhuma migração} migration_pending "
      & "{migração pendente} migrating {a migrar} migration_complete "
      & "{migração concluída} other {falha na migração}}");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {sem resposta} accepted {aceite} "
      & "declined {recusado} maybe {talvez} other {na lista de espera}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {evento agendado} "
      & "tentative_event {evento provisório} in_progress_event {evento em "
      & "curso} completed_event {evento concluído} canceled_event {evento "
      & "cancelado} other {evento adiado}}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {evento agendado} tentative_event "
      & "{evento provisório} in_progress_event {evento em curso} "
      & "completed_event {evento concluído} canceled_event {evento cancelado} "
      & "other {evento adiado}}");
   P ("label.events.rsvp_label",
      "resposta: {state, select, not_responded {pendente} accepted {aceite} "
      & "declined {recusada} maybe {talvez} other {lista de espera}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {válido} invalid_input "
      & "{inválido} required_input {obrigatório} optional_input {opcional} "
      & "disabled_input {desativado} other {só de leitura}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {não iniciado} editing_form {a editar} "
      & "dirty_form {alterações não guardadas} saving_form {a guardar} "
      & "saved_form {guardado} submitted_form {enviado} other {falha no envio}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {entrada válida} invalid_input {entrada "
      & "inválida} required_input {entrada obrigatória} optional_input "
      & "{entrada opcional} disabled_input {entrada desativada} other {entrada "
      & "só de leitura}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {não iniciado} editing_form {a editar} "
      & "dirty_form {alterações não guardadas} saving_form {a guardar o "
      & "formulário} saved_form {formulário guardado} submitted_form "
      & "{formulário enviado} other {{errors, plural, =0 {falha no envio} "
      & "other {falha no envio ({errors, plural, one {{errors, number} erro} "
      & "many {{errors, number} de erros} other {{errors, number} erros}})}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {nenhuma alteração não guardada} one {{count, "
      & "number} alteração não guardada} many {{count, number} de "
      & "alterações não guardadas} other {{count, number} alterações não "
      & "guardadas}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {nome acessível "
      & "ausente} low_contrast {contraste baixo} skipped_heading_level {nível "
      & "de título saltado} missing_form_label {rótulo de formulário "
      & "ausente} invalid_aria {ARIA inválido} keyboard_trap {armadilha de "
      & "teclado} other {problema de acessibilidade desconhecido}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {adicione um nome acessível} "
      & "low_contrast {aumente o contraste do texto} skipped_heading_level {use "
      & "níveis de título sequenciais} missing_form_label {associe um rótulo "
      & "ao controlo do formulário} invalid_aria {use uma função ou atributo "
      & "ARIA válido} keyboard_trap {garanta que o foco do teclado possa sair "
      & "do componente} other {revise o problema de acessibilidade}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {atributo id} class_attribute {atributo "
      & "class} data_attribute {atributo data} aria_attribute {atributo ARIA} "
      & "role_attribute {atributo role} link_attribute {atributo de link} "
      & "media_attribute {atributo multimédia} form_attribute {atributo de "
      & "formulário} boolean_attribute {atributo booleano} event_attribute "
      & "{atributo de manipulador de eventos} other {atributo desconhecido}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {ponto de referência de banner} "
      & "navigation_role {ponto de referência de navegação} main_role {ponto "
      & "de referência principal} complementary_role {ponto de referência "
      & "complementar} contentinfo_role {ponto de referência de informações "
      & "do conteúdo} search_role {ponto de referência de pesquisa} form_role "
      & "{ponto de referência de formulário} region_role {ponto de "
      & "referência de região} dialog_role {caixa de diálogo} alert_role "
      & "{região dinâmica de alerta} status_role {região dinâmica de "
      & "estado} other {ponto de referência desconhecido}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {conteúdo de texto} html_content "
      & "{conteúdo HTML} json_content {conteúdo JSON} xml_content {conteúdo "
      & "XML} image_content {conteúdo de imagem} audio_content {conteúdo de "
      & "áudio} video_content {conteúdo de vídeo} font_content {conteúdo de "
      & "fonte} archive_content {conteúdo de arquivo comprimido} "
      & "binary_content {conteúdo binário} form_content {conteúdo de "
      & "formulário} other {conteúdo desconhecido}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {tag de documento} metadata_tag {tag de "
      & "metadados} section_tag {tag de secção} text_tag {tag de texto} "
      & "link_tag {tag de link} media_tag {tag multimédia} form_tag {tag de "
      & "formulário} table_tag {tag de tabela} interactive_tag {tag "
      & "interativa} scripting_tag {tag de script} other {tag desconhecida}}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {imagem} video_media {vídeo} audio_media "
      & "{áudio} pdf_document {documento PDF} text_document {documento de "
      & "texto} archive_media {arquivo comprimido} other {conteúdo "
      & "multimédia}}");
   P ("label.media.media_summary",
      "{name}: {kind, select, image_media {{state, select, ready_media "
      & "{imagem pronta} processing_media {imagem em processamento} "
      & "transcoding_media {imagem em transcodificação} thumbnail_missing "
      & "{imagem, miniatura indisponível} metadata_missing {imagem, metadados "
      & "ausentes} locked_document {imagem bloqueada} other {imagem "
      & "indisponível}}} video_media {{state, select, ready_media {vídeo "
      & "pronto} processing_media {vídeo em processamento} transcoding_media "
      & "{vídeo em transcodificação} thumbnail_missing {vídeo, miniatura "
      & "indisponível} metadata_missing {vídeo, metadados ausentes} "
      & "locked_document {vídeo bloqueado} other {vídeo indisponível}}} "
      & "audio_media {{state, select, ready_media {áudio pronto} "
      & "processing_media {áudio em processamento} transcoding_media {áudio "
      & "em transcodificação} thumbnail_missing {áudio, miniatura "
      & "indisponível} metadata_missing {áudio, metadados ausentes} "
      & "locked_document {áudio bloqueado} other {áudio indisponível}}} "
      & "pdf_document {{state, select, ready_media {documento PDF pronto} "
      & "processing_media {documento PDF em processamento} transcoding_media "
      & "{documento PDF em transcodificação} thumbnail_missing {documento "
      & "PDF, miniatura indisponível} metadata_missing {documento PDF, "
      & "metadados ausentes} locked_document {documento PDF bloqueado} other "
      & "{documento PDF indisponível}}} text_document {{state, select, "
      & "ready_media {documento de texto pronto} processing_media {documento de "
      & "texto em processamento} transcoding_media {documento de texto em "
      & "transcodificação} thumbnail_missing {documento de texto, miniatura "
      & "indisponível} metadata_missing {documento de texto, metadados "
      & "ausentes} locked_document {documento de texto bloqueado} other "
      & "{documento de texto indisponível}}} archive_media {{state, select, "
      & "ready_media {arquivo comprimido pronto} processing_media {arquivo "
      & "comprimido em processamento} transcoding_media {arquivo comprimido em "
      & "transcodificação} thumbnail_missing {arquivo comprimido, miniatura "
      & "indisponível} metadata_missing {arquivo comprimido, metadados "
      & "ausentes} locked_document {arquivo comprimido bloqueado} other "
      & "{arquivo comprimido indisponível}}} other {{state, select, "
      & "ready_media {conteúdo multimédia pronto} processing_media {conteúdo "
      & "multimédia em processamento} transcoding_media {conteúdo multimédia "
      & "em transcodificação} thumbnail_missing {conteúdo multimédia, "
      & "miniatura indisponível} metadata_missing {conteúdo multimédia, "
      & "metadados ausentes} locked_document {conteúdo multimédia bloqueado} "
      & "other {conteúdo multimédia indisponível}}}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {fila de moderação "
      & "vazia} other {{pending, number} a aguardar revisão}}} one {{pending, "
      & "number} a aguardar revisão, 1 escalonado} other {{pending, number} a "
      & "aguardar revisão, {escalated, number} escalonados}}");
   P ("label.moderation.review_label",
      "{state, select, pending_review {{item}: a aguardar revisão} approved "
      & "{{item}: aprovado} rejected {{item}: rejeitado} needs_changes {{item}: "
      & "requer alterações} other {{item}: revisão escalonada}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {a aguardar revisão} approved "
      & "{aprovado} rejected {rejeitado} needs_changes {requer alterações} "
      & "other {revisão escalonada}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {link} menu_item {item de menu} tab_item "
      & "{separador} breadcrumb_item {item da trilha de navegação} "
      & "section_item {secção} other {divisor}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {link} menu_item {item de menu} "
      & "tab_item {separador} breadcrumb_item {item da trilha de navegação} "
      & "section_item {secção} other {divisor}} {state, select, current_item "
      & "{atual} active_item {{kind, select, section_item {ativa} other "
      & "{ativo}}} inactive_item {{kind, select, section_item {inativa} other "
      & "{inativo}}} disabled_item {{kind, select, section_item {desativada} "
      & "other {desativado}}} expanded_item {{kind, select, section_item "
      & "{expandida} other {expandido}}} collapsed_item {{kind, select, "
      & "section_item {recolhida} other {recolhido}}} visited_item {{kind, "
      & "select, section_item {visitada} other {visitado}}} other {{kind, "
      & "select, section_item {externa} other {externo}}}}");
   P ("label.navigation.section_state_label",
      "{name}: secção {expanded, select, false {recolhida} other "
      & "{expandida}}{count, plural, =0 {} one {, 1 item} many {, {count, "
      & "number} de itens} other {, {count, number} itens}}");
   P ("label.navigation.skip_link_label", "saltar para {target}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {todos os alertas} important_alerts "
      & "{alertas importantes} critical_alerts_only {apenas alertas críticos} "
      & "other {nenhum alerta}}");
   P ("label.notification_preferences.subscription_label",
      "{name}: subscrição {scope, select, thread_subscription {na conversa} "
      & "project_subscription {no projeto} team_subscription {na equipa} other "
      & "{na conta}} {state, select, preference_enabled {ativada} "
      & "preference_disabled {desativada} preference_inherited {herdada} other "
      & "{obrigatória}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {subscrição na conversa} "
      & "project_subscription {subscrição no projeto} team_subscription "
      & "{subscrição na equipa} other {subscrição na conta}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} mencionou-o} reply_event "
      & "{{actor} respondeu} assignment_event {{actor} fez-lhe uma "
      & "atribuição} approval_event {{actor} pediu aprovação} alert_event "
      & "{{actor} enviou um alerta} digest_event {{actor} enviou um resumo} "
      & "reminder_event {{actor} enviou um lembrete} other {{actor} enviou uma "
      & "notificação do sistema}}");
   P ("label.notifications.delivery_label",
      "notificação {channel, select, in_app_channel {na aplicação} "
      & "email_channel {por e-mail} sms_channel {por SMS} push_channel {push} "
      & "webhook_channel {por webhook} other {de resumo}} {state, select, "
      & "pending_delivery {pendente} sent_delivery {enviada} delivered_delivery "
      & "{entregue} failed_delivery {com falha} retrying_delivery {em nova "
      & "tentativa} other {cancelada}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {notificação pendente} "
      & "sent_delivery {notificação enviada} delivered_delivery "
      & "{notificação entregue} failed_delivery {falha na notificação} "
      & "retrying_delivery {a tentar notificar novamente} other {notificação "
      & "cancelada}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {nenhuma menção} "
      & "one {1 menção} many {{count, number} de menções} other {{count, "
      & "number} menções}}} reply_event {{count, plural, =0 {nenhuma "
      & "resposta} one {1 resposta} many {{count, number} de respostas} other "
      & "{{count, number} respostas}}} assignment_event {{count, plural, =0 "
      & "{nenhuma atribuição} one {1 atribuição} many {{count, number} de "
      & "atribuições} other {{count, number} atribuições}}} approval_event "
      & "{{count, plural, =0 {nenhum pedido de aprovação} one {1 pedido de "
      & "aprovação} many {{count, number} de pedidos de aprovação} other "
      & "{{count, number} pedidos de aprovação}}} alert_event {{count, "
      & "plural, =0 {nenhum alerta} one {1 alerta} many {{count, number} de "
      & "alertas} other {{count, number} alertas}}} digest_event {{count, "
      & "plural, =0 {nenhum resumo} one {1 resumo} many {{count, number} de "
      & "resumos} other {{count, number} resumos}}} reminder_event {{count, "
      & "plural, =0 {nenhum lembrete} one {1 lembrete} many {{count, number} de "
      & "lembretes} other {{count, number} lembretes}}} other {{count, plural, "
      & "=0 {nenhuma notificação do sistema} one {1 notificação do sistema} "
      & "many {{count, number} de notificações do sistema} other {{count, "
      & "number} notificações do sistema}}}}");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {nova menção} reply_event {nova "
      & "resposta} assignment_event {nova atribuição} approval_event {novo "
      & "pedido de aprovação} alert_event {novo alerta} digest_event {novo "
      & "resumo} reminder_event {novo lembrete} other {nova notificação do "
      & "sistema}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {notificações na aplicação} "
      & "email_channel {notificações por e-mail} sms_channel {notificações "
      & "por SMS} push_channel {notificações push} webhook_channel "
      & "{notificações por webhook} other {notificações de resumo}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {menção} reply_event {resposta} "
      & "assignment_event {atribuição} approval_event {pedido de aprovação} "
      & "alert_event {alerta} digest_event {resumo} reminder_event {lembrete} "
      & "other {notificação do sistema}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {menção} reply_event "
      & "{resposta} assignment_event {atribuição} approval_event {pedido de "
      & "aprovação} alert_event {alerta} digest_event {resumo} reminder_event "
      & "{lembrete} other {notificação do sistema}} {state, select, "
      & "unread_state {{event, select, approval_event {não lido} alert_event "
      & "{não lido} digest_event {não lido} reminder_event {não lido} other "
      & "{não lida}}} read_state {{event, select, approval_event {lido} "
      & "alert_event {lido} digest_event {lido} reminder_event {lido} other "
      & "{lida}}} archived_state {{event, select, approval_event {arquivado} "
      & "alert_event {arquivado} digest_event {arquivado} reminder_event "
      & "{arquivado} other {arquivada}}} muted_state {{event, select, "
      & "approval_event {silenciado} alert_event {silenciado} digest_event "
      & "{silenciado} reminder_event {silenciado} other {silenciada}}} "
      & "snoozed_state {{event, select, approval_event {adiado} alert_event "
      & "{adiado} digest_event {adiado} reminder_event {adiado} other "
      & "{adiada}}} other {{event, select, approval_event {suprimido} "
      & "alert_event {suprimido} digest_event {suprimido} reminder_event "
      & "{suprimido} other {suprimida}}}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {vazio} low_utilization {utilização "
      & "baixa} normal_utilization {utilização normal} high_utilization "
      & "{utilização alta} critical_utilization {utilização crítica} "
      & "full_utilization {cheio} other {limite excedido}}");
   P ("label.schema.default_value_label", "campo {field_name}: valor predefinido {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {campo normal} deprecated_field {campo "
      & "obsoleto} unknown_field {campo desconhecido} read_only_field {campo "
      & "só de leitura} write_only_field {campo só de escrita} other {campo "
      & "calculado}}");
   P ("label.search.saved_search_label",
      "{count, plural, =0 {pesquisa guardada: {name}} one {pesquisa guardada: "
      & "{name}, {count, number} resultado} many {pesquisa guardada: {name}, "
      & "{count, number} de resultados} other {pesquisa guardada: {name}, "
      & "{count, number} resultados}}");
   P ("label.search.search_scope_label",
      "{count, plural, =0 {âmbito {name}, nenhum resultado} one {âmbito "
      & "{name}, {count, number} resultado} many {âmbito {name}, {count, "
      & "number} de resultados} other {âmbito {name}, {count, number} "
      & "resultados}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {pesquisa inativa} searching_search {a "
      & "pesquisar} complete_search {pesquisa concluída} empty_search {a "
      & "pesquisa não devolveu resultados} other {falha na pesquisa}}");
   P ("label.search.suggestion_label", "quis dizer “{query}”?");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {valor oculto} masked_value {valor "
      & "mascarado} suffix_only {apenas sufixo} other {apenas impressão "
      & "digital}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {chave de API} live_api_key {chave de API de "
      & "produção} test_api_key {chave de API de teste} github_token {token "
      & "do GitHub} aws_access_key {chave de acesso da AWS} google_api_key "
      & "{chave de API do Google} slack_token {token do Slack} npm_token {token "
      & "do npm} bearer_token {token bearer} jwt_token {token JWT} "
      & "basic_auth_credential {credencial de autenticação básica} "
      & "password_secret {palavra-passe} private_key {chave privada} "
      & "ssh_private_key {chave privada SSH} webhook_secret {segredo de "
      & "webhook} oauth_token {token OAuth} database_url_secret {segredo de URL "
      & "de base de dados} sha1_fingerprint {impressão digital SHA-1} "
      & "sha256_fingerprint {impressão digital SHA-256} other {segredo}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-mail} phone_value {telefone} url_value "
      & "{URL} ip_address_value {endereço IP} token_value {token} "
      & "file_path_value {caminho de ficheiro} account_id_value {ID da conta} "
      & "payment_reference_value {referência de pagamento} log_field_value "
      & "{campo de log} other {valor confidencial}}");
   P ("label.tables.cell_label",
      "linha {row, number}, coluna {column, number}: {state, select, "
      & "empty_cell {vazia} edited_cell {editada} invalid_cell {inválida} "
      & "highlighted_cell {destacada} other {só de leitura}}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {célula vazia} edited_cell {célula "
      & "editada} invalid_cell {célula inválida} highlighted_cell {célula "
      & "destacada} other {célula só de leitura}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {coluna de texto} number_column "
      & "{coluna numérica} date_column {coluna de data} status_column {coluna "
      & "de estado} action_column {coluna de ações} other {coluna oculta}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {coluna de texto} number_column {coluna "
      & "numérica} date_column {coluna de data} status_column {coluna de "
      & "estado} action_column {coluna de ações} other {coluna oculta}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {atribuição a {assignee} removida} "
      & "assigned {tarefa atribuída a {assignee}} reassigned {tarefa "
      & "reatribuída a {assignee}} watching {tarefa acompanhada por "
      & "{assignee}} other {tarefa pertencente a {assignee}}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {tarefa aberta} in_progress_task "
      & "{tarefa em curso} blocked_task {tarefa bloqueada} done_task {tarefa "
      & "concluída} canceled_task {tarefa cancelada} deferred_task {tarefa "
      & "adiada} other {tarefa atrasada}}{priority, select, no_priority {} "
      & "low_priority {, prioridade baixa} medium_priority {, prioridade "
      & "média} high_priority {, prioridade alta} other {, prioridade "
      & "crítica}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {tarefa aberta} in_progress_task {tarefa em "
      & "curso} blocked_task {tarefa bloqueada} done_task {tarefa concluída} "
      & "canceled_task {tarefa cancelada} deferred_task {tarefa adiada} other "
      & "{tarefa atrasada}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {aprovado por {approver}} other {a aguardar "
      & "aprovação de {approver}}}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {pendente} active_step {ativa} "
      & "waiting_step {a aguardar} blocked_step {bloqueada} done_step "
      & "{concluída} failed_step {com falha} other {ignorada}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {pendente} active_step {ativa} "
      & "waiting_step {a aguardar} blocked_step {bloqueada} done_step "
      & "{concluída} failed_step {com falha} other {ignorada}}");
   P ("label.workflows.waiting_label", "a aguardar {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {não iniciado} "
      & "in_progress_state {em curso} waiting_state {a aguardar} "
      & "waiting_approval_state {a aguardar aprovação} blocked_state "
      & "{bloqueado} completed_state {concluído} failed_state {com falha} "
      & "cancelled_state {cancelado} skipped_state {ignorado} other {pausado}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {não iniciado} in_progress_state "
      & "{em curso} waiting_state {a aguardar} waiting_approval_state {a "
      & "aguardar aprovação} blocked_state {bloqueado} completed_state "
      & "{concluído} failed_state {com falha} cancelled_state {cancelado} "
      & "skipped_state {ignorado} other {pausado}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {quota excedida em {count, number} {unit} "
      & "({percent} usado)} near {quota perto do limite: restam {count, number} "
      & "{unit} ({percent} usado)} other {quota disponível: restam {count, "
      & "number} {unit} ({percent} usado)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {taxa de acertos da cache indisponível: nenhum "
      & "pedido} other {taxa de acertos da cache {percent}: {hits, plural, one "
      & "{{hits, number} acerto} many {{hits, number} de acertos} other {{hits, "
      & "number} acertos}}, {misses, plural, one {{misses, number} falha} many "
      & "{{misses, number} de falhas} other {{misses, number} falhas}}}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} elemento multimédia} many "
      & "{{count, number} de elementos multimédia} other {{count, number} "
      & "elementos multimédia}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} controlo de formulário} many "
      & "{{count, number} de controlos de formulário} other {{count, number} "
      & "controlos de formulário}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} elemento multimédia} many "
      & "{{count, number} de elementos multimédia} other {{count, number} "
      & "elementos multimédia}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} problema bloqueante} many {{blocking, number} de problemas "
      & "bloqueantes} other {{blocking, number} problemas bloqueantes}}} "
      & "blocking {{base}, {blocking, plural, one {{blocking, number} problema "
      & "bloqueante} many {{blocking, number} de problemas bloqueantes} other "
      & "{{blocking, number} problemas bloqueantes}}} only {apenas {base}} "
      & "other {{base}}}");
   P ("label.changes.sync_change_label.downloaded",
      "{count, plural, one {{count, number} transferido} many {{count, "
      & "number} transferidos} other {{count, number} transferidos}}");
   P ("label.changes.sync_change_label.deleted",
      "{count, plural, one {{count, number} eliminado} many {{count, number} "
      & "eliminados} other {{count, number} eliminados}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {nenhuma alteração para rever} all {todas as "
      & "alterações revistas} other {{reviewed, number} de {total, number} "
      & "alterações revistas}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {nenhuma separador} one {separador 1 de 1: {name}} "
      & "other {separador {current, number} de {total, number}: {name}}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {nenhum carregamento} one {{done, plural, =0 {0 de "
      & "1 carregamento concluído} other {1 de 1 carregamento concluído}}} "
      & "other {{done, number} de {total, number} carregamentos concluídos}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "o primeiro plano atual cumpre o contraste de {v1}:{v2, number} (texto "
      & "grande)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "o primeiro plano atual cumpre o contraste de {v1}:{v2, number} (texto "
      & "normal)");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "use {v1} para um contraste de {v2, number}:{v3, number} (nível "
      & "melhorado)");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "use {v1} para um contraste de {v2}:{v3, number} (nível melhorado)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "o primeiro plano atual cumpre o contraste de {v1, number}:{v2, number} "
      & "(texto grande)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "o primeiro plano atual cumpre o contraste de {v1, number}:{v2, number} "
      & "(texto normal)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "o primeiro plano atual cumpre o contraste de {v1}:{v2, number} (nível "
      & "melhorado)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "o primeiro plano atual cumpre o contraste de {v1, number}:{v2, number} "
      & "(nível melhorado)");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, diferença percetual drástica");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, diferença percetual drástica");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 têxtil delta {v1}, diferença percetual drástica");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, diferença percetual drástica");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, diferença percetual grande");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, diferença percetual drástica");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, diferença percetual drástica");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, diferença percetual drástica");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, diferença percetual grande");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, diferença percetual grande");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 têxtil delta {v1}, diferença percetual grande");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, diferença percetual grande");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, diferença percetual visível");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, diferença percetual visível");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 têxtil delta {v1}, diferença percetual visível");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, diferença percetual visível");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, diferença percetual visível");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, diferença percetual grande");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, diferença percetual drástica");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 têxtil delta {v1, number}, diferença percetual drástica");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, diferença percetual drástica");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, diferença percetual grande");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 têxtil delta {v1, number}, diferença percetual grande");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, diferença percetual grande");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, diferença percetual visível");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 têxtil delta {v1}, diferença percetual subtil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, diferença percetual visível");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 têxtil delta {v1, number}, diferença percetual visível");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, pouco percetível");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, impercetível");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 têxtil delta {v1}, impercetível");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, impercetível");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, impercetível");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, diferença percetual grande");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, impercetível");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, impercetível");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 têxtil delta {v1, number}, impercetível");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, impercetível");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, impercetível");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, diferença percetual subtil");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, diferença percetual subtil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, diferença percetual subtil");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, pouco percetível");
   P ("label.names.nearest_color_name.maroon", "grená");
   P ("label.names.nearest_color_name.gray", "cinzento");
   P ("label.contrast.readability_label.readable_for_large_text_only", "legível apenas para texto grande");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, apenas elementos não textuais, texto claro sobre "
      & "fundo escuro");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, apenas elementos não textuais, texto claro sobre "
      & "fundo escuro");
end Labels_1;
