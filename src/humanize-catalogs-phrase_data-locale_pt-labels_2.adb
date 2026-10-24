separate (Humanize.Catalogs.Phrase_Data.Locale_Pt)
procedure Labels_2 is
begin
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {adicione um nome acessível} "
      & "low_contrast {aumente o contraste do texto} skipped_heading_level {use "
      & "níveis de título sequenciais} missing_form_label {associe um rótulo "
      & "ao controle do formulário} invalid_aria {use uma função ou atributo "
      & "ARIA válido} keyboard_trap {garanta que o foco do teclado possa sair "
      & "do componente} other {revise o problema de acessibilidade}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {nenhum problema de acessibilidade} one "
      & "{{issues, number} problema de acessibilidade} many {{issues, number} "
      & "de problemas de acessibilidade} other {{issues, number} problemas de "
      & "acessibilidade}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {atributo id} class_attribute {atributo "
      & "class} data_attribute {atributo data} aria_attribute {atributo ARIA} "
      & "role_attribute {atributo role} link_attribute {atributo de link} "
      & "media_attribute {atributo de mídia} form_attribute {atributo de "
      & "formulário} boolean_attribute {atributo booleano} event_attribute "
      & "{atributo de manipulador de eventos} other {atributo desconhecido}}");
   P ("label.markup.form_error_summary_label",
      "{form_name}: {errors, plural, =0 {{warnings, plural, =0 {nenhum "
      & "problema no formulário} other {{warnings, plural, one {{warnings, "
      & "number} aviso} many {{warnings, number} de avisos} other {{warnings, "
      & "number} avisos}}}}} other {{warnings, plural, =0 {{errors, plural, one "
      & "{{errors, number} erro} many {{errors, number} de erros} other "
      & "{{errors, number} erros}}} other {{errors, plural, one {{errors, "
      & "number} erro} many {{errors, number} de erros} other {{errors, number} "
      & "erros}}, {warnings, plural, one {{warnings, number} aviso} many "
      & "{{warnings, number} de avisos} other {{warnings, number} avisos}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {ponto de referência de banner} "
      & "navigation_role {ponto de referência de navegação} main_role {ponto "
      & "de referência principal} complementary_role {ponto de referência "
      & "complementar} contentinfo_role {ponto de referência de informações "
      & "do conteúdo} search_role {ponto de referência de pesquisa} form_role "
      & "{ponto de referência de formulário} region_role {ponto de "
      & "referência de região} dialog_role {caixa de diálogo} alert_role "
      & "{região dinâmica de alerta} status_role {região dinâmica de "
      & "status} other {ponto de referência desconhecido}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}, atualização imediata: {update}} "
      & "other {{region}, atualização discreta: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {conteúdo de texto} html_content "
      & "{conteúdo HTML} json_content {conteúdo JSON} xml_content {conteúdo "
      & "XML} image_content {conteúdo de imagem} audio_content {conteúdo de "
      & "áudio} video_content {conteúdo de vídeo} font_content {conteúdo de "
      & "fonte} archive_content {conteúdo de arquivo compactado} "
      & "binary_content {conteúdo binário} form_content {conteúdo de "
      & "formulário} other {conteúdo desconhecido}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {tag de documento} metadata_tag {tag de "
      & "metadados} section_tag {tag de seção} text_tag {tag de texto} "
      & "link_tag {tag de link} media_tag {tag de mídia} form_tag {tag de "
      & "formulário} table_tag {tag de tabela} interactive_tag {tag "
      & "interativa} scripting_tag {tag de script} other {tag desconhecida}}");
   P ("label.media.duration_label", "duração: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {imagem} video_media {vídeo} audio_media "
      & "{áudio} pdf_document {documento PDF} text_document {documento de "
      & "texto} archive_media {arquivo compactado} other {mídia}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {pronto} processing_media {em "
      & "processamento} transcoding_media {em transcodificação} "
      & "thumbnail_missing {miniatura indisponível} metadata_missing "
      & "{metadados ausentes} locked_document {documento bloqueado} other "
      & "{indisponível}}");
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
      & "ready_media {arquivo compactado pronto} processing_media {arquivo "
      & "compactado em processamento} transcoding_media {arquivo compactado em "
      & "transcodificação} thumbnail_missing {arquivo compactado, miniatura "
      & "indisponível} metadata_missing {arquivo compactado, metadados "
      & "ausentes} locked_document {arquivo compactado bloqueado} other "
      & "{arquivo compactado indisponível}}} other {{state, select, "
      & "ready_media {mídia pronta} processing_media {mídia em processamento} "
      & "transcoding_media {mídia em transcodificação} thumbnail_missing "
      & "{mídia, miniatura indisponível} metadata_missing {mídia, metadados "
      & "ausentes} locked_document {mídia bloqueada} other {mídia "
      & "indisponível}}}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {nenhuma página} one {{pages, number} página} "
      & "many {{pages, number} de páginas} other {{pages, number} páginas}}");
   P ("label.media.resolution_label", "{width, number} × {height, number}");
   P ("label.moderation.appeal_label",
      "{state, select, open_report {{item}: recurso aberto} triaged_report "
      & "{{item}: recurso triado} actioned_report {{item}: recurso com medida "
      & "tomada} dismissed_report {{item}: recurso indeferido} appealed_report "
      & "{{item}: recurso contestado} other {{item}: recurso encerrado}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {nenhuma ação de moderação} flagged "
      & "{sinalizado} hidden {ocultado por um moderador} restored {restaurado} "
      & "marked_spam {marcado como spam} removed {removido} other {escalonado}}");
   P ("label.moderation.moderation_label",
      "{action, select, no_action {{item}: nenhuma ação de moderação} "
      & "flagged {{item}: sinalizado} hidden {{item}: ocultado por um "
      & "moderador} restored {{item}: restaurado} marked_spam {{item}: marcado "
      & "como spam} removed {{item}: removido} other {{item}: escalonado}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {fila de moderação "
      & "vazia} other {{pending, number} aguardando revisão}}} one {{pending, "
      & "number} aguardando revisão, 1 escalonado} other {{pending, number} "
      & "aguardando revisão, {escalated, number} escalonados}}");
   P ("label.moderation.report_label",
      "{state, select, open_report {{item}: denúncia aberta} triaged_report "
      & "{{item}: denúncia triada} actioned_report {{item}: medida tomada} "
      & "dismissed_report {{item}: denúncia indeferida} appealed_report "
      & "{{item}: denúncia contestada} other {{item}: denúncia encerrada}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {denúncia aberta} triaged_report "
      & "{denúncia triada} actioned_report {medida tomada} dismissed_report "
      & "{denúncia indeferida} appealed_report {denúncia contestada} other "
      & "{denúncia encerrada}}");
   P ("label.moderation.review_label",
      "{state, select, pending_review {{item}: aguardando revisão} approved "
      & "{{item}: aprovado} rejected {{item}: rejeitado} needs_changes {{item}: "
      & "requer alterações} other {{item}: revisão escalonada}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {aguardando revisão} approved "
      & "{aprovado} rejected {rejeitado} needs_changes {requer alterações} "
      & "other {revisão escalonada}}");
   P ("label.navigation.back_label", "voltar para {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {trilha de navegação vazia} one {trilha de "
      & "navegação: 1 nível} many {trilha de navegação: {depth, number} de "
      & "níveis} other {trilha de navegação: {depth, number} níveis}}");
   P ("label.navigation.current_page_label", "página atual: {name}");
   P ("label.navigation.external_link_label", "{name} (link externo)");
   P ("label.navigation.first_label", "primeiro: {target}");
   P ("label.navigation.last_label", "último: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {nenhum item de menu} one {1 item de menu} many "
      & "{{count, number} de itens de menu} other {{count, number} itens de "
      & "menu}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {link} menu_item {item de menu} tab_item "
      & "{guia} breadcrumb_item {item da trilha de navegação} section_item "
      & "{seção} other {separador}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {link} menu_item {item de menu} "
      & "tab_item {guia} breadcrumb_item {item da trilha de navegação} "
      & "section_item {seção} other {separador}} {state, select, current_item "
      & "{atual} active_item {{kind, select, tab_item {ativa} section_item "
      & "{ativa} other {ativo}}} inactive_item {{kind, select, tab_item "
      & "{inativa} section_item {inativa} other {inativo}}} disabled_item "
      & "{{kind, select, tab_item {desativada} section_item {desativada} other "
      & "{desativado}}} expanded_item {{kind, select, tab_item {expandida} "
      & "section_item {expandida} other {expandido}}} collapsed_item {{kind, "
      & "select, tab_item {recolhida} section_item {recolhida} other "
      & "{recolhido}}} visited_item {{kind, select, tab_item {visitada} "
      & "section_item {visitada} other {visitado}}} other {{kind, select, "
      & "tab_item {externa} section_item {externa} other {externo}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {atual} active_item {ativo} inactive_item "
      & "{inativo} disabled_item {desativado} expanded_item {expandido} "
      & "collapsed_item {recolhido} visited_item {visitado} other {externo}}");
   P ("label.navigation.next_label", "próximo: {target}");
   P ("label.navigation.section_state_label",
      "{name}: seção {expanded, select, false {recolhida} other "
      & "{expandida}}{count, plural, =0 {} one {, 1 item} many {, {count, "
      & "number} de itens} other {, {count, number} itens}}");
   P ("label.navigation.skip_link_label", "pular para {target}");
   P ("label.navigation.submenu_label",
      "{count, plural, one {{name}: submenu, {count, number} item} many "
      & "{{name}: submenu, {count, number} de itens} other {{name}: submenu, "
      & "{count, number} itens}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {todos os alertas} important_alerts "
      & "{alertas importantes} critical_alerts_only {somente alertas críticos} "
      & "other {nenhum alerta}}");
   P ("label.notification_preferences.channel_preference_label",
      "notificações de {channel} {state, select, preference_enabled "
      & "{ativadas} preference_disabled {desativadas} preference_inherited "
      & "{herdadas} other {obrigatórias}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {sem resumo} instant_digest {resumo "
      & "imediato} daily_digest {resumo diário} other {resumo semanal}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {ativado} preference_disabled "
      & "{desativado} preference_inherited {herdado} other {obrigatório}}");
   P ("label.notification_preferences.quiet_hours_label", "horário de silêncio: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: inscrição {scope, select, thread_subscription {na conversa} "
      & "project_subscription {no projeto} team_subscription {na equipe} other "
      & "{na conta}} {state, select, preference_enabled {ativada} "
      & "preference_disabled {desativada} preference_inherited {herdada} other "
      & "{obrigatória}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {inscrição na conversa} "
      & "project_subscription {inscrição no projeto} team_subscription "
      & "{inscrição na equipe} other {inscrição na conta}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} mencionou você} reply_event "
      & "{{actor} respondeu} assignment_event {{actor} atribuiu a você} "
      & "approval_event {{actor} solicitou aprovação} alert_event {{actor} "
      & "enviou um alerta} digest_event {{actor} enviou um resumo} "
      & "reminder_event {{actor} enviou um lembrete} other {{actor} enviou uma "
      & "notificação do sistema}}");
   P ("label.notifications.delivery_label",
      "notificação {channel, select, in_app_channel {no aplicativo} "
      & "email_channel {por e-mail} sms_channel {por SMS} push_channel {push} "
      & "webhook_channel {por webhook} other {de resumo}} {state, select, "
      & "pending_delivery {pendente} sent_delivery {enviada} delivered_delivery "
      & "{entregue} failed_delivery {com falha} retrying_delivery {em nova "
      & "tentativa} other {cancelada}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {notificação pendente} "
      & "sent_delivery {notificação enviada} delivered_delivery "
      & "{notificação entregue} failed_delivery {falha na notificação} "
      & "retrying_delivery {tentando notificar novamente} other {notificação "
      & "cancelada}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {pendente {time_text}} sent_delivery "
      & "{enviada {time_text}} delivered_delivery {entregue {time_text}} "
      & "failed_delivery {falhou {time_text}} retrying_delivery {nova tentativa "
      & "{time_text}} other {cancelada {time_text}}}");
   P ("label.notifications.digest_label",
      "{count, plural, =0 {resumo de {name}: nenhuma notificação} one "
      & "{resumo de {name}: 1 notificação} many {resumo de {name}: {count, "
      & "number} de notificações} other {resumo de {name}: {count, number} "
      & "notificações}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {nenhuma menção} "
      & "one {1 menção} many {{count, number} de menções} other {{count, "
      & "number} menções}}} reply_event {{count, plural, =0 {nenhuma "
      & "resposta} one {1 resposta} many {{count, number} de respostas} other "
      & "{{count, number} respostas}}} assignment_event {{count, plural, =0 "
      & "{nenhuma atribuição} one {1 atribuição} many {{count, number} de "
      & "atribuições} other {{count, number} atribuições}}} approval_event "
      & "{{count, plural, =0 {nenhuma solicitação de aprovação} one {1 "
      & "solicitação de aprovação} many {{count, number} de solicitações "
      & "de aprovação} other {{count, number} solicitações de "
      & "aprovação}}} alert_event {{count, plural, =0 {nenhum alerta} one {1 "
      & "alerta} many {{count, number} de alertas} other {{count, number} "
      & "alertas}}} digest_event {{count, plural, =0 {nenhum resumo} one {1 "
      & "resumo} many {{count, number} de resumos} other {{count, number} "
      & "resumos}}} reminder_event {{count, plural, =0 {nenhum lembrete} one {1 "
      & "lembrete} many {{count, number} de lembretes} other {{count, number} "
      & "lembretes}}} other {{count, plural, =0 {nenhuma notificação do "
      & "sistema} one {1 notificação do sistema} many {{count, number} de "
      & "notificações do sistema} other {{count, number} notificações do "
      & "sistema}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {marcar notificação como lida} many {marcar "
      & "{count, number} de notificações como lidas} other {marcar {count, "
      & "number} notificações como lidas}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {marcar notificação como não lida} many {marcar "
      & "{count, number} de notificações como não lidas} other {marcar "
      & "{count, number} notificações como não lidas}}");
   P ("label.notifications.muted_label", "{name}: notificações silenciadas");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {nova menção} reply_event {nova "
      & "resposta} assignment_event {nova atribuição} approval_event {nova "
      & "solicitação de aprovação} alert_event {novo alerta} digest_event "
      & "{novo resumo} reminder_event {novo lembrete} other {nova notificação "
      & "do sistema}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {notificações no aplicativo} "
      & "email_channel {notificações por e-mail} sms_channel {notificações "
      & "por SMS} push_channel {notificações push} webhook_channel "
      & "{notificações por webhook} other {notificações de resumo}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {nenhuma notificação} one {1 notificação} many "
      & "{{count, number} de notificações} other {{count, number} "
      & "notificações}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {menção} reply_event {resposta} "
      & "assignment_event {atribuição} approval_event {solicitação de "
      & "aprovação} alert_event {alerta} digest_event {resumo} reminder_event "
      & "{lembrete} other {notificação do sistema}}");
   P ("label.notifications.notification_group_label",
      "{count, plural, =0 {{name}: nenhuma notificação} one {{name}: 1 "
      & "notificação} many {{name}: {count, number} de notificações} other "
      & "{{name}: {count, number} notificações}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {menção} reply_event "
      & "{resposta} assignment_event {atribuição} approval_event "
      & "{solicitação de aprovação} alert_event {alerta} digest_event "
      & "{resumo} reminder_event {lembrete} other {notificação do sistema}} "
      & "{state, select, unread_state {{event, select, alert_event {não lido} "
      & "digest_event {não lido} reminder_event {não lido} other {não "
      & "lida}}} read_state {{event, select, alert_event {lido} digest_event "
      & "{lido} reminder_event {lido} other {lida}}} archived_state {{event, "
      & "select, alert_event {arquivado} digest_event {arquivado} "
      & "reminder_event {arquivado} other {arquivada}}} muted_state {{event, "
      & "select, alert_event {silenciado} digest_event {silenciado} "
      & "reminder_event {silenciado} other {silenciada}}} snoozed_state "
      & "{{event, select, alert_event {adiado} digest_event {adiado} "
      & "reminder_event {adiado} other {adiada}}} other {{event, select, "
      & "alert_event {suprimido} digest_event {suprimido} reminder_event "
      & "{suprimido} other {suprimida}}}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {notificação não lida} read_state "
      & "{notificação lida} archived_state {notificação arquivada} "
      & "muted_state {notificação silenciada} snoozed_state {notificação "
      & "adiada} other {notificação suprimida}}");
   P ("label.notifications.snoozed_label", "{name}: notificações adiadas");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {nenhuma notificação suprimida} one {1 "
      & "notificação suprimida} many {{count, number} de notificações "
      & "suprimidas} other {{count, number} notificações suprimidas}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {nenhuma notificação não lida} one {1 "
      & "notificação não lida} many {{count, number} de notificações não "
      & "lidas} other {{count, number} notificações não lidas}}");
   P ("label.payments.amount_label", "valor: {amount_text}");
   P ("label.payments.balance_label", "saldo: {amount_text}");
   P ("label.payments.chargeback_label", "estorno: {amount_text}");
   P ("label.payments.discount_label", "desconto: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, vencimento {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {nenhuma fatura} one {1 fatura} many {{count, "
      & "number} de faturas} other {{count, number} faturas}}");
   P ("label.payments.invoice_label",
      "{state, select, draft_invoice {fatura {number}: rascunho} open_invoice "
      & "{fatura {number}: em aberto} paid_invoice {fatura {number}: paga} "
      & "overdue_invoice {fatura {number}: vencida} other {fatura {number}: "
      & "anulada}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {rascunho de fatura} open_invoice "
      & "{fatura em aberto} paid_invoice {fatura paga} overdue_invoice {fatura "
      & "vencida} other {fatura anulada}}");
   P ("label.payments.method_label",
      "{method, select, card_method {pago com cartão: {detail}} "
      & "bank_transfer_method {pago por transferência bancária: {detail}} "
      & "cash_method {pago em dinheiro: {detail}} wallet_method {pago com "
      & "carteira digital: {detail}} check_method {pago com cheque: {detail}} "
      & "other {pago por outro meio: {detail}}}");
   P ("label.payments.paid_label", "{amount_text} pago {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {nenhum pagamento} one {1 pagamento} many {{count, "
      & "number} de pagamentos} other {{count, number} pagamentos}}");
   P ("label.payments.payment_label",
      "{state, select, pending_payment {{amount_text}: pagamento pendente} "
      & "authorized_payment {{amount_text}: pagamento autorizado} paid_payment "
      & "{{amount_text}: pagamento efetuado} failed_payment {{amount_text}: "
      & "falha no pagamento} refunded_payment {{amount_text}: pagamento "
      & "reembolsado} other {{amount_text}: pagamento cancelado}}");
   P ("label.payments.payment_link_label", "link de pagamento {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {cartão} bank_transfer_method "
      & "{transferência bancária} cash_method {dinheiro} wallet_method "
      & "{carteira digital} check_method {cheque} other {outro}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {pagamento pendente} "
      & "authorized_payment {pagamento autorizado} paid_payment {pagamento "
      & "efetuado} failed_payment {falha no pagamento} refunded_payment "
      & "{pagamento reembolsado} other {pagamento cancelado}}");
   P ("label.payments.receipt_label", "recibo {number}");
   P ("label.payments.refund_label",
      "{state, select, pending_payment {{amount_text}: reembolso pendente} "
      & "authorized_payment {{amount_text}: reembolso autorizado} paid_payment "
      & "{{amount_text}: reembolso pago} failed_payment {{amount_text}: falha "
      & "no reembolso} refunded_payment {{amount_text}: reembolso concluído} "
      & "other {{amount_text}: reembolso cancelado}}");
   P ("label.payments.subtotal_label", "subtotal: {amount_text}");
   P ("label.payments.tax_label", "impostos: {amount_text}");
   P ("label.payments.total_label", "total: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: o acesso expira {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: função de {role, select, owner_role {proprietário} "
      & "admin_role {administrador} editor_role {editor} viewer_role {leitor} "
      & "other {personalizada}} concedida");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {concedido} denied "
      & "{negado} inherited {herdado} temporary {acesso temporário} expired "
      & "{expirado} other {requer aprovação}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {concedido} denied {negado} inherited "
      & "{herdado} temporary {acesso temporário} expired {expirado} other "
      & "{requer aprovação}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {permitido pela política} "
      & "policy_denied {negado pela política} policy_warning {aviso da "
      & "política} other {política não aplicável}}");
   P ("label.permissions.revoke_label",
      "{subject}: função de {role, select, owner_role {proprietário} "
      & "admin_role {administrador} editor_role {editor} viewer_role {leitor} "
      & "other {personalizada}} revogada");
   P ("label.permissions.role_label",
      "{role, select, owner_role {proprietário} admin_role {administrador} "
      & "editor_role {editor} viewer_role {leitor} other {função "
      & "personalizada}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {vazio} low_utilization {uso baixo} "
      & "normal_utilization {uso normal} high_utilization {uso alto} "
      & "critical_utilization {uso crítico} full_utilization {cheio} other "
      & "{limite excedido}}");
   P ("label.schema.array_shape_label",
      "{count_known, select, false {array de {element_type, select, "
      & "string_field {strings} integer_field {inteiros} decimal_field "
      & "{decimais} boolean_field {booleanos} date_field {datas} "
      & "date_time_field {datas e horas} object_field {objetos} array_field "
      & "{arrays} enum_field {enumerações} binary_field {valores binários} "
      & "null_field {valores nulos} any_field {valores de qualquer tipo} other "
      & "{valores desconhecidos}}} other {{count, plural, one {array de {count, "
      & "number} {element_type, select, string_field {string} integer_field "
      & "{inteiro} decimal_field {decimal} boolean_field {booleano} date_field "
      & "{data} date_time_field {data e hora} object_field {objeto} array_field "
      & "{array} enum_field {enumeração} binary_field {valor binário} "
      & "null_field {valor nulo} any_field {valor de qualquer tipo} other "
      & "{valor desconhecido}}} many {array de {count, number} de "
      & "{element_type, select, string_field {strings} integer_field {inteiros} "
      & "decimal_field {decimais} boolean_field {booleanos} date_field {datas} "
      & "date_time_field {datas e horas} object_field {objetos} array_field "
      & "{arrays} enum_field {enumerações} binary_field {valores binários} "
      & "null_field {valores nulos} any_field {valores de qualquer tipo} other "
      & "{valores desconhecidos}}} other {array de {count, number} "
      & "{element_type, select, string_field {strings} integer_field {inteiros} "
      & "decimal_field {decimais} boolean_field {booleanos} date_field {datas} "
      & "date_time_field {datas e horas} object_field {objetos} array_field "
      & "{arrays} enum_field {enumerações} binary_field {valores binários} "
      & "null_field {valores nulos} any_field {valores de qualquer tipo} other "
      & "{valores desconhecidos}}}}}}");
   P ("label.schema.constraint_label", "restrição {name}: {value}");
   P ("label.schema.default_value_label", "campo {field_name}: valor padrão {value}");
   P ("label.schema.deprecated_field_label", "campo obsoleto {name}, use {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {{count, number} opção de enumeração} many "
      & "{{count, number} de opções de enumeração} other {{count, number} "
      & "opções de enumeração}}");
   P ("label.schema.example_value_label", "campo {field_name}: exemplo {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {campo normal} deprecated_field {campo "
      & "obsoleto} unknown_field {campo desconhecido} read_only_field {campo "
      & "somente leitura} write_only_field {campo somente gravação} other "
      & "{campo calculado}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {campo de string} integer_field {campo de "
      & "número inteiro} decimal_field {campo decimal} boolean_field {campo "
      & "booleano} date_field {campo de data} date_time_field {campo de data e "
      & "hora} object_field {campo de objeto} array_field {campo de array} "
      & "enum_field {campo de enumeração} binary_field {campo binário} "
      & "null_field {campo nulo} any_field {campo de qualquer tipo} other "
      & "{campo de tipo desconhecido}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {nenhum campo obrigatório ausente} one {1 campo "
      & "obrigatório ausente} many {{count, number} de campos obrigatórios "
      & "ausentes} other {{count, number} campos obrigatórios ausentes}}");
   P ("label.schema.object_shape_label",
      "objeto com {fields, plural, one {{fields, number} campo} many "
      & "{{fields, number} de campos} other {{fields, number} "
      & "campos}}{required, plural, =0 {} one {, 1 obrigatório} other {, "
      & "{required, number} obrigatórios}}{optional, plural, =0 {} one {, 1 "
      & "opcional} other {, {optional, number} opcionais}}");
   P ("label.schema.schema_source_label", "esquema {name}, versão {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {valor escalar} object_shape {{count, "
      & "plural, =0 {objeto} one {objeto com 1 campo} many {objeto com {count, "
      & "number} de campos} other {objeto com {count, number} campos}}} "
      & "array_shape {{count, plural, =0 {array} one {array com 1 item} many "
      & "{array com {count, number} de itens} other {array com {count, number} "
      & "itens}}} map_shape {{count, plural, =0 {mapa} one {mapa com 1 entrada} "
      & "many {mapa com {count, number} de entradas} other {mapa com {count, "
      & "number} entradas}}} tuple_shape {{count, plural, =0 {tupla} one {tupla "
      & "com 1 item} many {tupla com {count, number} de itens} other {tupla com "
      & "{count, number} itens}}} union_shape {{count, plural, =0 {união} one "
      & "{união de 1 tipo} many {união de {count, number} de tipos} other "
      & "{união de {count, number} tipos}}} empty_shape {forma vazia} other "
      & "{forma desconhecida}}");
   P ("label.schema.unknown_field_label", "campo desconhecido {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {nenhum filtro ativo} one {{count, number} filtro "
      & "ativo} many {{count, number} de filtros ativos} other {{count, number} "
      & "filtros ativos}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {limpar filtros} one {limpar o filtro ativo} many "
      & "{limpar {count, number} de filtros ativos} other {limpar {count, "
      & "number} filtros ativos}}");
   P ("label.search.facet_label",
      "{count, plural, one {faceta {name}, {count, number} opção} many "
      & "{faceta {name}, {count, number} de opções} other {faceta {name}, "
      & "{count, number} opções}}");
   P ("label.search.facet_value_label",
      "{selected, select, false {{count, plural, =0 {{name}, nenhum "
      & "resultado} one {{name}, {count, number} resultado} many {{name}, "
      & "{count, number} de resultados} other {{name}, {count, number} "
      & "resultados}}} other {{count, plural, =0 {{name}, nenhum resultado, "
      & "selecionado} one {{name}, {count, number} resultado, selecionado} many "
      & "{{name}, {count, number} de resultados, selecionado} other {{name}, "
      & "{count, number} resultados, selecionado}}}}");
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {filtro ativo} "
      & "inactive_filter {filtro inativo} other {filtro de exclusão}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {filtro ativo} inactive_filter {filtro "
      & "inativo} other {filtro de exclusão}}");
   P ("label.search.no_results_label", "nenhum resultado para “{query}”");
   P ("label.search.recent_search_label", "pesquisa recente: “{query}”");
   P ("label.search.saved_search_label",
      "{count, plural, =0 {pesquisa salva: {name}} one {pesquisa salva: "
      & "{name}, {count, number} resultado} many {pesquisa salva: {name}, "
      & "{count, number} de resultados} other {pesquisa salva: {name}, {count, "
      & "number} resultados}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {nenhuma pesquisa recente} one {{count, number} "
      & "pesquisa recente} many {{count, number} de pesquisas recentes} other "
      & "{{count, number} pesquisas recentes}}");
   P ("label.search.search_query_label", "pesquisar “{query}”");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {nenhum resultado} one {{count, number} resultado} "
      & "many {{count, number} de resultados} other {{count, number} "
      & "resultados}}");
   P ("label.search.search_result_summary_label",
      "{count, plural, =0 {nenhum resultado para “{query}”} one {{count, "
      & "number} resultado para “{query}”} many {{count, number} de "
      & "resultados para “{query}”} other {{count, number} resultados para "
      & "“{query}”}}");
   P ("label.search.search_scope_label",
      "{count, plural, =0 {escopo {name}, nenhum resultado} one {escopo "
      & "{name}, {count, number} resultado} many {escopo {name}, {count, "
      & "number} de resultados} other {escopo {name}, {count, number} "
      & "resultados}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {pesquisa inativa} searching_search "
      & "{pesquisando} complete_search {pesquisa concluída} empty_search {a "
      & "pesquisa não retornou resultados} other {falha na pesquisa}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {ordenar por relevância} ascending_sort "
      & "{ordenar em ordem crescente} descending_sort {ordenar em ordem "
      & "decrescente} newest_first_sort {ordenar dos mais recentes} other "
      & "{ordenar dos mais antigos}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {relevância} ascending_sort {crescente} "
      & "descending_sort {decrescente} newest_first_sort {mais recentes "
      & "primeiro} other {mais antigos primeiro}}");
   P ("label.search.suggestion_label", "você quis dizer “{query}”?");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {{count, number} credencial de {source}} many "
      & "{{count, number} de credenciais de {source}} other {{count, number} "
      & "credenciais de {source}}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {valor oculto} masked_value {valor "
      & "mascarado} suffix_only {somente sufixo} other {somente impressão "
      & "digital}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {público} support_profile {suporte} "
      & "audit_profile {auditoria} other {depuração}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {{days_old, plural, =0 {rotação não "
      & "necessária} one {rotação não necessária, idade: {days_old, "
      & "number} dia} many {rotação não necessária, idade: {days_old, "
      & "number} de dias} other {rotação não necessária, idade: {days_old, "
      & "number} dias}}} other {{days_old, plural, =0 {rotação necessária} "
      & "one {rotação necessária, idade: {days_old, number} dia} many "
      & "{rotação necessária, idade: {days_old, number} de dias} other "
      & "{rotação necessária, idade: {days_old, number} dias}}}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {chave de API} live_api_key {chave de API de "
      & "produção} test_api_key {chave de API de teste} github_token {token "
      & "do GitHub} aws_access_key {chave de acesso da AWS} google_api_key "
      & "{chave de API do Google} slack_token {token do Slack} npm_token {token "
      & "do npm} bearer_token {token bearer} jwt_token {token JWT} "
      & "basic_auth_credential {credencial de autenticação básica} "
      & "password_secret {senha} private_key {chave privada} ssh_private_key "
      & "{chave privada SSH} webhook_secret {segredo de webhook} oauth_token "
      & "{token OAuth} database_url_secret {segredo de URL de banco de dados} "
      & "sha1_fingerprint {impressão digital SHA-1} sha256_fingerprint "
      & "{impressão digital SHA-256} other {segredo}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-mail} phone_value {telefone} url_value "
      & "{URL} ip_address_value {endereço IP} token_value {token} "
      & "file_path_value {caminho de arquivo} account_id_value {ID da conta} "
      & "payment_reference_value {referência de pagamento} log_field_value "
      & "{campo de log} other {valor confidencial}}");
   P ("label.tables.cell_label",
      "linha {row, number}, coluna {column, number}: {state, select, "
      & "empty_cell {vazia} edited_cell {editada} invalid_cell {inválida} "
      & "highlighted_cell {destacada} other {somente leitura}}");
   P ("label.tables.cell_position_label", "linha {row, number}, coluna {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {célula vazia} edited_cell {célula "
      & "editada} invalid_cell {célula inválida} highlighted_cell {célula "
      & "destacada} other {célula somente leitura}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {nenhuma coluna} one {{count, number} coluna} many "
      & "{{count, number} de colunas} other {{count, number} colunas}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {coluna de texto} number_column "
      & "{coluna numérica} date_column {coluna de data} status_column {coluna "
      & "de status} action_column {coluna de ações} other {coluna oculta}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {coluna de texto} number_column {coluna "
      & "numérica} date_column {coluna de data} status_column {coluna de "
      & "status} action_column {coluna de ações} other {coluna oculta}}");
   P ("label.tables.group_label",
      "{count, plural, one {{name}: {count, number} linha} many {{name}: "
      & "{count, number} de linhas} other {{name}: {count, number} linhas}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {nenhuma linha} one {{count, number} linha} many "
      & "{{count, number} de linhas} other {{count, number} linhas}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {não ordenado} ascending_sort "
      & "{crescente} other {decrescente}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {não ordenado} ascending_sort {ordenado "
      & "por {column_name}, crescente} other {ordenado por {column_name}, "
      & "decrescente}}");
   P ("label.tables.subtotal_label", "subtotal de {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {{rows, number} linha} many {{rows, number} de "
      & "linhas} other {{rows, number} linhas}} × {columns, plural, one "
      & "{{columns, number} coluna} many {{columns, number} de colunas} other "
      & "{{columns, number} colunas}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {atribuição a {assignee} removida} "
      & "assigned {tarefa atribuída a {assignee}} reassigned {tarefa "
      & "reatribuída a {assignee}} watching {tarefa acompanhada por "
      & "{assignee}} other {tarefa de propriedade de {assignee}}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {não atribuída} assigned {atribuída} "
      & "reassigned {reatribuída} watching {acompanhada} other {proprietário "
      & "da tarefa}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {backlog vazio} one {backlog: {count, number} "
      & "tarefa} many {backlog: {count, number} de tarefas} other {backlog: "
      & "{count, number} tarefas}}");
   P ("label.tasks.blocker_label", "bloqueada por {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {concluir a tarefa} many {concluir {count, number} "
      & "de tarefas} other {concluir {count, number} tarefas}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {nenhuma tarefa concluída} one {{count, number} "
      & "tarefa concluída} many {{count, number} de tarefas concluídas} other "
      & "{{count, number} tarefas concluídas}}");
   P ("label.tasks.due_label", "prazo: {due_text}");
   P ("label.tasks.estimate_label", "estimativa: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {nenhuma tarefa aberta} one {{count, number} tarefa "
      & "aberta} many {{count, number} de tarefas abertas} other {{count, "
      & "number} tarefas abertas}}");
   P ("label.tasks.overdue_label", "atrasada desde {due_text}");
   P ("label.tasks.recurring_task_label", "repete {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {reabrir a tarefa} many {reabrir {count, number} "
      & "de tarefas} other {reabrir {count, number} tarefas}}");
   P ("label.tasks.sprint_label",
      "{count, plural, one {{name}: {count, number} tarefa} many {{name}: "
      & "{count, number} de tarefas} other {{name}: {count, number} tarefas}}");
   P ("label.tasks.subtask_label",
      "{count, plural, one {{name}: {count, number} subtarefa} many {{name}: "
      & "{count, number} de subtarefas} other {{name}: {count, number} "
      & "subtarefas}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {nenhuma tarefa} one {{count, number} tarefa} many "
      & "{{count, number} de tarefas} other {{count, number} tarefas}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {tarefa aberta} in_progress_task "
      & "{tarefa em andamento} blocked_task {tarefa bloqueada} done_task "
      & "{tarefa concluída} canceled_task {tarefa cancelada} deferred_task "
      & "{tarefa adiada} other {tarefa atrasada}}{priority, select, no_priority "
      & "{} low_priority {, prioridade baixa} medium_priority {, prioridade "
      & "média} high_priority {, prioridade alta} other {, prioridade "
      & "crítica}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {sem prioridade} low_priority "
      & "{prioridade baixa} medium_priority {prioridade média} high_priority "
      & "{prioridade alta} other {prioridade crítica}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {tarefa aberta} in_progress_task {tarefa em "
      & "andamento} blocked_task {tarefa bloqueada} done_task {tarefa "
      & "concluída} canceled_task {tarefa cancelada} deferred_task {tarefa "
      & "adiada} other {tarefa atrasada}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {limite superior} other {limite "
      & "inferior}}");
end Labels_2;
