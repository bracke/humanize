separate (Humanize.Catalogs.Phrase_Data.Locale_Es)
procedure Labels_2 is
begin
   P ("label.markup.accessibility_page_summary_label",
      "resumen de accesibilidad de {title}: {landmarks, plural, one "
      & "{{landmarks, number} punto de referencia} many {{landmarks, number} de "
      & "puntos de referencia} other {{landmarks, number} puntos de "
      & "referencia}}, {headings, plural, one {{headings, number} encabezado} "
      & "many {{headings, number} de encabezados} other {{headings, number} "
      & "encabezados}}, {issues, plural, one {{issues, number} problema} many "
      & "{{issues, number} de problemas} other {{issues, number} problemas}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {añade un nombre accesible} "
      & "low_contrast {aumenta el contraste del texto} skipped_heading_level "
      & "{usa niveles de encabezado consecutivos} missing_form_label {asocia "
      & "una etiqueta al control del formulario} invalid_aria {usa un rol o "
      & "atributo ARIA válido} keyboard_trap {asegúrate de que el foco del "
      & "teclado pueda salir del componente} other {revisa el problema de "
      & "accesibilidad}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {ningún problema de accesibilidad} one "
      & "{{issues, number} problema de accesibilidad} many {{issues, number} de "
      & "problemas de accesibilidad} other {{issues, number} problemas de "
      & "accesibilidad}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {atributo id} class_attribute {atributo "
      & "class} data_attribute {atributo data} aria_attribute {atributo ARIA} "
      & "role_attribute {atributo role} link_attribute {atributo de enlace} "
      & "media_attribute {atributo multimedia} form_attribute {atributo de "
      & "formulario} boolean_attribute {atributo booleano} event_attribute "
      & "{atributo de controlador de eventos} other {atributo desconocido}}");
   P ("label.markup.form_error_summary_label",
      "{form_name}: {errors, plural, =0 {{warnings, plural, =0 {ningún "
      & "problema en el formulario} other {{warnings, plural, one {{warnings, "
      & "number} advertencia} many {{warnings, number} de advertencias} other "
      & "{{warnings, number} advertencias}}}}} other {{warnings, plural, =0 "
      & "{{errors, plural, one {{errors, number} error} many {{errors, number} "
      & "de errores} other {{errors, number} errores}}} other {{errors, plural, "
      & "one {{errors, number} error} many {{errors, number} de errores} other "
      & "{{errors, number} errores}}, {warnings, plural, one {{warnings, "
      & "number} advertencia} many {{warnings, number} de advertencias} other "
      & "{{warnings, number} advertencias}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {punto de referencia de banner} "
      & "navigation_role {punto de referencia de navegación} main_role {punto "
      & "de referencia principal} complementary_role {punto de referencia "
      & "complementario} contentinfo_role {punto de referencia de información "
      & "del contenido} search_role {punto de referencia de búsqueda} "
      & "form_role {punto de referencia de formulario} region_role {punto de "
      & "referencia de región} dialog_role {cuadro de diálogo} alert_role "
      & "{región dinámica de alerta} status_role {región dinámica de "
      & "estado} other {punto de referencia desconocido}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}, actualización inmediata: {update}} "
      & "other {{region}, actualización discreta: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {contenido de texto} html_content "
      & "{contenido HTML} json_content {contenido JSON} xml_content {contenido "
      & "XML} image_content {contenido de imagen} audio_content {contenido de "
      & "audio} video_content {contenido de vídeo} font_content {contenido de "
      & "fuente} archive_content {contenido de archivo comprimido} "
      & "binary_content {contenido binario} form_content {contenido de "
      & "formulario} other {contenido desconocido}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {etiqueta de documento} metadata_tag "
      & "{etiqueta de metadatos} section_tag {etiqueta de sección} text_tag "
      & "{etiqueta de texto} link_tag {etiqueta de enlace} media_tag {etiqueta "
      & "multimedia} form_tag {etiqueta de formulario} table_tag {etiqueta de "
      & "tabla} interactive_tag {etiqueta interactiva} scripting_tag {etiqueta "
      & "de script} other {etiqueta desconocida}}");
   P ("label.media.duration_label", "duración: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {imagen} video_media {vídeo} audio_media "
      & "{audio} pdf_document {documento PDF} text_document {documento de "
      & "texto} archive_media {archivo comprimido} other {contenido "
      & "multimedia}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {listo} processing_media {en "
      & "procesamiento} transcoding_media {en transcodificación} "
      & "thumbnail_missing {miniatura no disponible} metadata_missing {faltan "
      & "metadatos} locked_document {documento bloqueado} other {no "
      & "disponible}}");
   P ("label.media.media_summary",
      "{name}: {kind, select, image_media {{state, select, ready_media "
      & "{imagen lista} processing_media {imagen en procesamiento} "
      & "transcoding_media {imagen en transcodificación} thumbnail_missing "
      & "{imagen, miniatura no disponible} metadata_missing {imagen, faltan "
      & "metadatos} locked_document {imagen bloqueada} other {imagen no "
      & "disponible}}} video_media {{state, select, ready_media {vídeo listo} "
      & "processing_media {vídeo en procesamiento} transcoding_media {vídeo "
      & "en transcodificación} thumbnail_missing {vídeo, miniatura no "
      & "disponible} metadata_missing {vídeo, faltan metadatos} "
      & "locked_document {vídeo bloqueado} other {vídeo no disponible}}} "
      & "audio_media {{state, select, ready_media {audio listo} "
      & "processing_media {audio en procesamiento} transcoding_media {audio en "
      & "transcodificación} thumbnail_missing {audio, miniatura no disponible} "
      & "metadata_missing {audio, faltan metadatos} locked_document {audio "
      & "bloqueado} other {audio no disponible}}} pdf_document {{state, select, "
      & "ready_media {documento PDF listo} processing_media {documento PDF en "
      & "procesamiento} transcoding_media {documento PDF en transcodificación} "
      & "thumbnail_missing {documento PDF, miniatura no disponible} "
      & "metadata_missing {documento PDF, faltan metadatos} locked_document "
      & "{documento PDF bloqueado} other {documento PDF no disponible}}} "
      & "text_document {{state, select, ready_media {documento de texto listo} "
      & "processing_media {documento de texto en procesamiento} "
      & "transcoding_media {documento de texto en transcodificación} "
      & "thumbnail_missing {documento de texto, miniatura no disponible} "
      & "metadata_missing {documento de texto, faltan metadatos} "
      & "locked_document {documento de texto bloqueado} other {documento de "
      & "texto no disponible}}} archive_media {{state, select, ready_media "
      & "{archivo comprimido listo} processing_media {archivo comprimido en "
      & "procesamiento} transcoding_media {archivo comprimido en "
      & "transcodificación} thumbnail_missing {archivo comprimido, miniatura "
      & "no disponible} metadata_missing {archivo comprimido, faltan metadatos} "
      & "locked_document {archivo comprimido bloqueado} other {archivo "
      & "comprimido no disponible}}} other {{state, select, ready_media "
      & "{contenido multimedia listo} processing_media {contenido multimedia en "
      & "procesamiento} transcoding_media {contenido multimedia en "
      & "transcodificación} thumbnail_missing {contenido multimedia, miniatura "
      & "no disponible} metadata_missing {contenido multimedia, faltan "
      & "metadatos} locked_document {contenido multimedia bloqueado} other "
      & "{contenido multimedia no disponible}}}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {ninguna página} one {{pages, number} página} "
      & "many {{pages, number} de páginas} other {{pages, number} páginas}}");
   P ("label.media.resolution_label", "{width, number} × {height, number}");
   P ("label.moderation.appeal_label",
      "{state, select, open_report {{item}: apelación abierta} "
      & "triaged_report {{item}: apelación clasificada} actioned_report "
      & "{{item}: apelación con medidas tomadas} dismissed_report {{item}: "
      & "apelación desestimada} appealed_report {{item}: apelación recurrida} "
      & "other {{item}: apelación cerrada}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {sin acción de moderación} flagged "
      & "{marcado} hidden {ocultado por un moderador} restored {restaurado} "
      & "marked_spam {marcado como spam} removed {eliminado} other {escalado}}");
   P ("label.moderation.moderation_label",
      "{action, select, no_action {{item}: sin acción de moderación} "
      & "flagged {{item}: marcado} hidden {{item}: ocultado por un moderador} "
      & "restored {{item}: restaurado} marked_spam {{item}: marcado como spam} "
      & "removed {{item}: eliminado} other {{item}: escalado}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {cola de moderación "
      & "vacía} one {{pending, number} pendiente de revisión} other "
      & "{{pending, number} pendientes de revisión}}} one {{pending, plural, "
      & "one {{pending, number} pendiente de revisión} other {{pending, "
      & "number} pendientes de revisión}}, 1 escalado} other {{pending, "
      & "plural, one {{pending, number} pendiente de revisión} other "
      & "{{pending, number} pendientes de revisión}}, {escalated, number} "
      & "escalados}}");
   P ("label.moderation.report_label",
      "{state, select, open_report {{item}: denuncia abierta} triaged_report "
      & "{{item}: denuncia clasificada} actioned_report {{item}: medidas "
      & "tomadas} dismissed_report {{item}: denuncia desestimada} "
      & "appealed_report {{item}: denuncia apelada} other {{item}: denuncia "
      & "cerrada}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {denuncia abierta} triaged_report "
      & "{denuncia clasificada} actioned_report {medidas tomadas} "
      & "dismissed_report {denuncia desestimada} appealed_report {denuncia "
      & "apelada} other {denuncia cerrada}}");
   P ("label.moderation.review_label",
      "{state, select, pending_review {{item}: pendiente de revisión} "
      & "approved {{item}: aprobado} rejected {{item}: rechazado} needs_changes "
      & "{{item}: requiere cambios} other {{item}: revisión escalada}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {pendiente de revisión} approved "
      & "{aprobado} rejected {rechazado} needs_changes {requiere cambios} other "
      & "{revisión escalada}}");
   P ("label.navigation.back_label", "volver a {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {ruta de navegación vacía} one {ruta de "
      & "navegación: 1 nivel} many {ruta de navegación: {depth, number} de "
      & "niveles} other {ruta de navegación: {depth, number} niveles}}");
   P ("label.navigation.current_page_label", "página actual: {name}");
   P ("label.navigation.external_link_label", "{name} (enlace externo)");
   P ("label.navigation.first_label", "primero: {target}");
   P ("label.navigation.last_label", "último: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {ningún elemento de menú} one {1 elemento de "
      & "menú} many {{count, number} de elementos de menú} other {{count, "
      & "number} elementos de menú}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {enlace} menu_item {elemento de menú} "
      & "tab_item {pestaña} breadcrumb_item {elemento de la ruta de "
      & "navegación} section_item {sección} other {separador}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {enlace} menu_item {elemento de "
      & "menú} tab_item {pestaña} breadcrumb_item {elemento de la ruta de "
      & "navegación} section_item {sección} other {separador}} {state, "
      & "select, current_item {actual} active_item {{kind, select, tab_item "
      & "{activa} section_item {activa} other {activo}}} inactive_item {{kind, "
      & "select, tab_item {inactiva} section_item {inactiva} other {inactivo}}} "
      & "disabled_item {{kind, select, tab_item {deshabilitada} section_item "
      & "{deshabilitada} other {deshabilitado}}} expanded_item {{kind, select, "
      & "tab_item {expandida} section_item {expandida} other {expandido}}} "
      & "collapsed_item {{kind, select, tab_item {contraída} section_item "
      & "{contraída} other {contraído}}} visited_item {{kind, select, "
      & "tab_item {visitada} section_item {visitada} other {visitado}}} other "
      & "{{kind, select, tab_item {externa} section_item {externa} other "
      & "{externo}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {actual} active_item {activo} "
      & "inactive_item {inactivo} disabled_item {deshabilitado} expanded_item "
      & "{expandido} collapsed_item {contraído} visited_item {visitado} other "
      & "{externo}}");
   P ("label.navigation.next_label", "siguiente: {target}");
   P ("label.navigation.section_state_label",
      "{name}: sección {expanded, select, false {contraída} other "
      & "{expandida}}{count, plural, =0 {} one {, 1 elemento} many {, {count, "
      & "number} de elementos} other {, {count, number} elementos}}");
   P ("label.navigation.skip_link_label", "saltar a {target}");
   P ("label.navigation.submenu_label",
      "{count, plural, one {{name}: submenú, 1 elemento} many {{name}: "
      & "submenú, {count, number} de elementos} other {{name}: submenú, "
      & "{count, number} elementos}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {todas las alertas} important_alerts "
      & "{alertas importantes} critical_alerts_only {solo alertas críticas} "
      & "other {sin alertas}}");
   P ("label.notification_preferences.channel_preference_label",
      "notificaciones de {channel} {state, select, preference_enabled "
      & "{activadas} preference_disabled {desactivadas} preference_inherited "
      & "{heredadas} other {obligatorias}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {sin resumen} instant_digest {resumen "
      & "inmediato} daily_digest {resumen diario} other {resumen semanal}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {activado} preference_disabled "
      & "{desactivado} preference_inherited {heredado} other {obligatorio}}");
   P ("label.notification_preferences.quiet_hours_label", "horas de silencio {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: suscripción {scope, select, thread_subscription {al hilo} "
      & "project_subscription {al proyecto} team_subscription {al equipo} other "
      & "{a la cuenta}} {state, select, preference_enabled {activada} "
      & "preference_disabled {desactivada} preference_inherited {heredada} "
      & "other {obligatoria}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {suscripción al hilo} "
      & "project_subscription {suscripción al proyecto} team_subscription "
      & "{suscripción al equipo} other {suscripción a la cuenta}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} te mencionó} reply_event "
      & "{{actor} respondió} assignment_event {{actor} te asignó} "
      & "approval_event {{actor} solicitó una aprobación} alert_event "
      & "{{actor} envió una alerta} digest_event {{actor} envió un resumen} "
      & "reminder_event {{actor} envió un recordatorio} other {{actor} envió "
      & "una notificación del sistema}}");
   P ("label.notifications.delivery_label",
      "notificación {channel, select, in_app_channel {en la aplicación} "
      & "email_channel {por correo electrónico} sms_channel {por SMS} "
      & "push_channel {push} webhook_channel {por webhook} other {de resumen}} "
      & "{state, select, pending_delivery {pendiente} sent_delivery {enviada} "
      & "delivered_delivery {entregada} failed_delivery {fallida} "
      & "retrying_delivery {en reintento} other {cancelada}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {notificación pendiente} "
      & "sent_delivery {notificación enviada} delivered_delivery "
      & "{notificación entregada} failed_delivery {notificación fallida} "
      & "retrying_delivery {reintentando notificación} other {notificación "
      & "cancelada}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {pendiente {time_text}} sent_delivery "
      & "{enviada {time_text}} delivered_delivery {entregada {time_text}} "
      & "failed_delivery {fallida {time_text}} retrying_delivery {reintentando "
      & "{time_text}} other {cancelada {time_text}}}");
   P ("label.notifications.digest_label",
      "{count, plural, =0 {resumen de {name}: ninguna notificación} one "
      & "{resumen de {name}: 1 notificación} many {resumen de {name}: {count, "
      & "number} de notificaciones} other {resumen de {name}: {count, number} "
      & "notificaciones}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {ninguna mención} "
      & "one {1 mención} many {{count, number} de menciones} other {{count, "
      & "number} menciones}}} reply_event {{count, plural, =0 {ninguna "
      & "respuesta} one {1 respuesta} many {{count, number} de respuestas} "
      & "other {{count, number} respuestas}}} assignment_event {{count, plural, "
      & "=0 {ninguna asignación} one {1 asignación} many {{count, number} de "
      & "asignaciones} other {{count, number} asignaciones}}} approval_event "
      & "{{count, plural, =0 {ninguna solicitud de aprobación} one {1 "
      & "solicitud de aprobación} many {{count, number} de solicitudes de "
      & "aprobación} other {{count, number} solicitudes de aprobación}}} "
      & "alert_event {{count, plural, =0 {ninguna alerta} one {1 alerta} many "
      & "{{count, number} de alertas} other {{count, number} alertas}}} "
      & "digest_event {{count, plural, =0 {ningún resumen} one {1 resumen} "
      & "many {{count, number} de resúmenes} other {{count, number} "
      & "resúmenes}}} reminder_event {{count, plural, =0 {ningún "
      & "recordatorio} one {1 recordatorio} many {{count, number} de "
      & "recordatorios} other {{count, number} recordatorios}}} other {{count, "
      & "plural, =0 {ninguna notificación del sistema} one {1 notificación "
      & "del sistema} many {{count, number} de notificaciones del sistema} "
      & "other {{count, number} notificaciones del sistema}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {marcar la notificación como leída} many {marcar "
      & "{count, number} de notificaciones como leídas} other {marcar {count, "
      & "number} notificaciones como leídas}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {marcar la notificación como no leída} many "
      & "{marcar {count, number} de notificaciones como no leídas} other "
      & "{marcar {count, number} notificaciones como no leídas}}");
   P ("label.notifications.muted_label", "{name}: notificaciones silenciadas");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {nueva mención} reply_event {nueva "
      & "respuesta} assignment_event {nueva asignación} approval_event {nueva "
      & "solicitud de aprobación} alert_event {nueva alerta} digest_event "
      & "{nuevo resumen} reminder_event {nuevo recordatorio} other {nueva "
      & "notificación del sistema}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {notificaciones en la aplicación} "
      & "email_channel {notificaciones por correo electrónico} sms_channel "
      & "{notificaciones por SMS} push_channel {notificaciones push} "
      & "webhook_channel {notificaciones por webhook} other {notificaciones de "
      & "resumen}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {ninguna notificación} one {1 notificación} many "
      & "{{count, number} de notificaciones} other {{count, number} "
      & "notificaciones}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {mención} reply_event {respuesta} "
      & "assignment_event {asignación} approval_event {solicitud de "
      & "aprobación} alert_event {alerta} digest_event {resumen} "
      & "reminder_event {recordatorio} other {notificación del sistema}}");
   P ("label.notifications.notification_group_label",
      "{count, plural, =0 {{name}: ninguna notificación} one {{name}: 1 "
      & "notificación} many {{name}: {count, number} de notificaciones} other "
      & "{{name}: {count, number} notificaciones}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {mención} reply_event "
      & "{respuesta} assignment_event {asignación} approval_event {solicitud "
      & "de aprobación} alert_event {alerta} digest_event {resumen} "
      & "reminder_event {recordatorio} other {notificación del sistema}} "
      & "{state, select, unread_state {{event, select, digest_event {no leído} "
      & "reminder_event {no leído} other {no leída}}} read_state {{event, "
      & "select, digest_event {leído} reminder_event {leído} other {leída}}} "
      & "archived_state {{event, select, digest_event {archivado} "
      & "reminder_event {archivado} other {archivada}}} muted_state {{event, "
      & "select, digest_event {silenciado} reminder_event {silenciado} other "
      & "{silenciada}}} snoozed_state {{event, select, digest_event {pospuesto} "
      & "reminder_event {pospuesto} other {pospuesta}}} other {{event, select, "
      & "digest_event {suprimido} reminder_event {suprimido} other "
      & "{suprimida}}}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {notificación no leída} read_state "
      & "{notificación leída} archived_state {notificación archivada} "
      & "muted_state {notificación silenciada} snoozed_state {notificación "
      & "pospuesta} other {notificación suprimida}}");
   P ("label.notifications.snoozed_label", "{name}: notificaciones pospuestas");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {ninguna notificación suprimida} one {1 "
      & "notificación suprimida} many {{count, number} de notificaciones "
      & "suprimidas} other {{count, number} notificaciones suprimidas}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {ninguna notificación sin leer} one {1 "
      & "notificación sin leer} many {{count, number} de notificaciones sin "
      & "leer} other {{count, number} notificaciones sin leer}}");
   P ("label.payments.amount_label", "importe: {amount_text}");
   P ("label.payments.balance_label", "saldo: {amount_text}");
   P ("label.payments.chargeback_label", "contracargo: {amount_text}");
   P ("label.payments.discount_label", "descuento: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, vence {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {ninguna factura} one {1 factura} many {{count, "
      & "number} de facturas} other {{count, number} facturas}}");
   P ("label.payments.invoice_label",
      "{state, select, draft_invoice {factura {number}: borrador} "
      & "open_invoice {factura {number}: abierta} paid_invoice {factura "
      & "{number}: pagada} overdue_invoice {factura {number}: vencida} other "
      & "{factura {number}: anulada}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {borrador de factura} open_invoice "
      & "{factura abierta} paid_invoice {factura pagada} overdue_invoice "
      & "{factura vencida} other {factura anulada}}");
   P ("label.payments.method_label",
      "{method, select, card_method {pagado con tarjeta: {detail}} "
      & "bank_transfer_method {pagado por transferencia bancaria: {detail}} "
      & "cash_method {pagado en efectivo: {detail}} wallet_method {pagado con "
      & "monedero electrónico: {detail}} check_method {pagado con cheque: "
      & "{detail}} other {pagado por otro medio: {detail}}}");
   P ("label.payments.paid_label", "{amount_text} pagado {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {ningún pago} one {1 pago} many {{count, number} "
      & "de pagos} other {{count, number} pagos}}");
   P ("label.payments.payment_label",
      "{state, select, pending_payment {{amount_text}: pago pendiente} "
      & "authorized_payment {{amount_text}: pago autorizado} paid_payment "
      & "{{amount_text}: pago realizado} failed_payment {{amount_text}: pago "
      & "fallido} refunded_payment {{amount_text}: pago reembolsado} other "
      & "{{amount_text}: pago cancelado}}");
   P ("label.payments.payment_link_label", "enlace de pago {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {tarjeta} bank_transfer_method "
      & "{transferencia bancaria} cash_method {efectivo} wallet_method "
      & "{monedero electrónico} check_method {cheque} other {otro}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {pago pendiente} authorized_payment "
      & "{pago autorizado} paid_payment {pago realizado} failed_payment {pago "
      & "fallido} refunded_payment {pago reembolsado} other {pago cancelado}}");
   P ("label.payments.receipt_label", "recibo {number}");
   P ("label.payments.refund_label",
      "{state, select, pending_payment {{amount_text}: reembolso pendiente} "
      & "authorized_payment {{amount_text}: reembolso autorizado} paid_payment "
      & "{{amount_text}: reembolso pagado} failed_payment {{amount_text}: "
      & "reembolso fallido} refunded_payment {{amount_text}: reembolso "
      & "completado} other {{amount_text}: reembolso cancelado}}");
   P ("label.payments.subtotal_label", "subtotal: {amount_text}");
   P ("label.payments.tax_label", "impuestos: {amount_text}");
   P ("label.payments.total_label", "total: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: el acceso vence {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: rol de {role, select, owner_role {propietario} admin_role "
      & "{administrador} editor_role {editor} viewer_role {lector} other "
      & "{personalizado}} concedido");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {concedido} denied "
      & "{denegado} inherited {heredado} temporary {acceso temporal} expired "
      & "{caducado} other {requiere aprobación}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {concedido} denied {denegado} inherited "
      & "{heredado} temporary {acceso temporal} expired {caducado} other "
      & "{requiere aprobación}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {permitido por la directiva} "
      & "policy_denied {denegado por la directiva} policy_warning {advertencia "
      & "de la directiva} other {directiva no aplicable}}");
   P ("label.permissions.revoke_label",
      "{subject}: rol de {role, select, owner_role {propietario} admin_role "
      & "{administrador} editor_role {editor} viewer_role {lector} other "
      & "{personalizado}} revocado");
   P ("label.permissions.role_label",
      "{role, select, owner_role {propietario} admin_role {administrador} "
      & "editor_role {editor} viewer_role {lector} other {rol personalizado}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {vacío} low_utilization {uso bajo} "
      & "normal_utilization {uso normal} high_utilization {uso alto} "
      & "critical_utilization {uso crítico} full_utilization {lleno} other "
      & "{límite superado}}");
   P ("label.schema.array_shape_label",
      "{count_known, select, false {array de {element_type, select, "
      & "string_field {cadenas} integer_field {enteros} decimal_field "
      & "{decimales} boolean_field {booleanos} date_field {fechas} "
      & "date_time_field {fechas y horas} object_field {objetos} array_field "
      & "{arrays} enum_field {enumeraciones} binary_field {valores binarios} "
      & "null_field {valores nulos} any_field {valores de cualquier tipo} other "
      & "{valores desconocidos}}} other {{count, plural, one {array de 1 "
      & "{element_type, select, string_field {cadena} integer_field {entero} "
      & "decimal_field {decimal} boolean_field {booleano} date_field {fecha} "
      & "date_time_field {fecha y hora} object_field {objeto} array_field "
      & "{array} enum_field {enumeración} binary_field {valor binario} "
      & "null_field {valor nulo} any_field {valor de cualquier tipo} other "
      & "{valor desconocido}}} many {array de {count, number} de {element_type, "
      & "select, string_field {cadenas} integer_field {enteros} decimal_field "
      & "{decimales} boolean_field {booleanos} date_field {fechas} "
      & "date_time_field {fechas y horas} object_field {objetos} array_field "
      & "{arrays} enum_field {enumeraciones} binary_field {valores binarios} "
      & "null_field {valores nulos} any_field {valores de cualquier tipo} other "
      & "{valores desconocidos}}} other {array de {count, number} "
      & "{element_type, select, string_field {cadenas} integer_field {enteros} "
      & "decimal_field {decimales} boolean_field {booleanos} date_field "
      & "{fechas} date_time_field {fechas y horas} object_field {objetos} "
      & "array_field {arrays} enum_field {enumeraciones} binary_field {valores "
      & "binarios} null_field {valores nulos} any_field {valores de cualquier "
      & "tipo} other {valores desconocidos}}}}}}");
   P ("label.schema.constraint_label", "restricción {name}: {value}");
   P ("label.schema.default_value_label", "campo {field_name}: valor predeterminado {value}");
   P ("label.schema.deprecated_field_label", "campo obsoleto {name}, usa {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 opción de enumeración} many {{count, number} "
      & "de opciones de enumeración} other {{count, number} opciones de "
      & "enumeración}}");
   P ("label.schema.example_value_label", "campo {field_name}: ejemplo {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {campo normal} deprecated_field {campo "
      & "obsoleto} unknown_field {campo desconocido} read_only_field {campo de "
      & "solo lectura} write_only_field {campo de solo escritura} other {campo "
      & "calculado}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {campo de cadena} integer_field {campo "
      & "entero} decimal_field {campo decimal} boolean_field {campo booleano} "
      & "date_field {campo de fecha} date_time_field {campo de fecha y hora} "
      & "object_field {campo de objeto} array_field {campo de array} enum_field "
      & "{campo de enumeración} binary_field {campo binario} null_field {campo "
      & "nulo} any_field {campo de cualquier tipo} other {campo de tipo "
      & "desconocido}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {ningún campo obligatorio ausente} one {falta 1 "
      & "campo obligatorio} many {faltan {count, number} de campos "
      & "obligatorios} other {faltan {count, number} campos obligatorios}}");
   P ("label.schema.object_shape_label",
      "objeto con {fields, plural, one {1 campo} many {{fields, number} de "
      & "campos} other {{fields, number} campos}}{required, plural, =0 {} one "
      & "{, 1 obligatorio} other {, {required, number} obligatorios}}{optional, "
      & "plural, =0 {} one {, 1 opcional} other {, {optional, number} "
      & "opcionales}}");
   P ("label.schema.schema_source_label", "esquema {name}, versión {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {valor escalar} object_shape {{count, "
      & "plural, =0 {objeto} one {objeto con 1 campo} many {objeto con {count, "
      & "number} de campos} other {objeto con {count, number} campos}}} "
      & "array_shape {{count, plural, =0 {array} one {array con 1 elemento} "
      & "many {array con {count, number} de elementos} other {array con {count, "
      & "number} elementos}}} map_shape {{count, plural, =0 {mapa} one {mapa "
      & "con 1 entrada} many {mapa con {count, number} de entradas} other {mapa "
      & "con {count, number} entradas}}} tuple_shape {{count, plural, =0 "
      & "{tupla} one {tupla con 1 elemento} many {tupla con {count, number} de "
      & "elementos} other {tupla con {count, number} elementos}}} union_shape "
      & "{{count, plural, =0 {unión} one {unión de 1 tipo} many {unión de "
      & "{count, number} de tipos} other {unión de {count, number} tipos}}} "
      & "empty_shape {forma vacía} other {forma desconocida}}");
   P ("label.schema.unknown_field_label", "campo desconocido {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {ningún filtro activo} one {{count, number} filtro "
      & "activo} many {{count, number} de filtros activos} other {{count, "
      & "number} filtros activos}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {borrar filtros} one {borrar el filtro activo} many "
      & "{borrar {count, number} de filtros activos} other {borrar {count, "
      & "number} filtros activos}}");
   P ("label.search.facet_label",
      "{count, plural, one {faceta {name}, {count, number} opción} many "
      & "{faceta {name}, {count, number} de opciones} other {faceta {name}, "
      & "{count, number} opciones}}");
   P ("label.search.facet_value_label",
      "{selected, select, false {{count, plural, =0 {{name}, sin resultados} "
      & "one {{name}, {count, number} resultado} many {{name}, {count, number} "
      & "de resultados} other {{name}, {count, number} resultados}}} other "
      & "{{count, plural, =0 {{name}, sin resultados, seleccionado} one "
      & "{{name}, {count, number} resultado, seleccionado} many {{name}, "
      & "{count, number} de resultados, seleccionado} other {{name}, {count, "
      & "number} resultados, seleccionado}}}}");
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {filtro activo} "
      & "inactive_filter {filtro inactivo} other {filtro de exclusión}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {filtro activo} inactive_filter {filtro "
      & "inactivo} other {filtro de exclusión}}");
   P ("label.search.no_results_label", "sin resultados para «{query}»");
   P ("label.search.recent_search_label", "búsqueda reciente: «{query}»");
   P ("label.search.saved_search_label",
      "{count, plural, =0 {búsqueda guardada: {name}} one {búsqueda "
      & "guardada: {name}, {count, number} resultado} many {búsqueda guardada: "
      & "{name}, {count, number} de resultados} other {búsqueda guardada: "
      & "{name}, {count, number} resultados}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {ninguna búsqueda reciente} one {{count, number} "
      & "búsqueda reciente} many {{count, number} de búsquedas recientes} "
      & "other {{count, number} búsquedas recientes}}");
   P ("label.search.search_query_label", "buscar «{query}»");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {sin resultados} one {{count, number} resultado} "
      & "many {{count, number} de resultados} other {{count, number} "
      & "resultados}}");
   P ("label.search.search_result_summary_label",
      "{count, plural, =0 {sin resultados para «{query}»} one {{count, "
      & "number} resultado para «{query}»} many {{count, number} de "
      & "resultados para «{query}»} other {{count, number} resultados para "
      & "«{query}»}}");
   P ("label.search.search_scope_label",
      "{count, plural, =0 {ámbito {name}, sin resultados} one {ámbito "
      & "{name}, {count, number} resultado} many {ámbito {name}, {count, "
      & "number} de resultados} other {ámbito {name}, {count, number} "
      & "resultados}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {búsqueda inactiva} searching_search "
      & "{buscando} complete_search {búsqueda completada} empty_search {la "
      & "búsqueda no obtuvo resultados} other {error en la búsqueda}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {ordenar por relevancia} ascending_sort "
      & "{ordenar de forma ascendente} descending_sort {ordenar de forma "
      & "descendente} newest_first_sort {ordenar por más recientes} other "
      & "{ordenar por más antiguos}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {relevancia} ascending_sort {ascendente} "
      & "descending_sort {descendente} newest_first_sort {más recientes "
      & "primero} other {más antiguos primero}}");
   P ("label.search.suggestion_label", "¿quisiste decir «{query}»?");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {{count, number} credencial de {source}} many "
      & "{{count, number} de credenciales de {source}} other {{count, number} "
      & "credenciales de {source}}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {valor oculto} masked_value {valor "
      & "enmascarado} suffix_only {solo sufijo} other {solo huella digital}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {público} support_profile {soporte} "
      & "audit_profile {auditoría} other {depuración}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {{days_old, plural, =0 {no requiere "
      & "rotación} one {no requiere rotación, antigüedad: {days_old, number} "
      & "día} many {no requiere rotación, antigüedad: {days_old, number} de "
      & "días} other {no requiere rotación, antigüedad: {days_old, number} "
      & "días}}} other {{days_old, plural, =0 {requiere rotación} one "
      & "{requiere rotación, antigüedad: {days_old, number} día} many "
      & "{requiere rotación, antigüedad: {days_old, number} de días} other "
      & "{requiere rotación, antigüedad: {days_old, number} días}}}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {clave de API} live_api_key {clave de API de "
      & "producción} test_api_key {clave de API de prueba} github_token {token "
      & "de GitHub} aws_access_key {clave de acceso de AWS} google_api_key "
      & "{clave de API de Google} slack_token {token de Slack} npm_token {token "
      & "de npm} bearer_token {token de portador} jwt_token {token JWT} "
      & "basic_auth_credential {credencial de autenticación básica} "
      & "password_secret {contraseña} private_key {clave privada} "
      & "ssh_private_key {clave privada SSH} webhook_secret {secreto de "
      & "webhook} oauth_token {token de OAuth} database_url_secret {secreto de "
      & "URL de base de datos} sha1_fingerprint {huella SHA-1} "
      & "sha256_fingerprint {huella SHA-256} other {secreto}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {correo electrónico} phone_value "
      & "{teléfono} url_value {URL} ip_address_value {dirección IP} "
      & "token_value {token} file_path_value {ruta de archivo} account_id_value "
      & "{ID de cuenta} payment_reference_value {referencia de pago} "
      & "log_field_value {campo de registro} other {valor confidencial}}");
   P ("label.tables.cell_label",
      "fila {row, number}, columna {column, number}: {state, select, "
      & "empty_cell {vacía} edited_cell {editada} invalid_cell {no válida} "
      & "highlighted_cell {resaltada} other {de solo lectura}}");
   P ("label.tables.cell_position_label", "fila {row, number}, columna {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {celda vacía} edited_cell {celda editada} "
      & "invalid_cell {celda no válida} highlighted_cell {celda resaltada} "
      & "other {celda de solo lectura}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {ninguna columna} one {{count, number} columna} "
      & "many {{count, number} de columnas} other {{count, number} columnas}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {columna de texto} number_column "
      & "{columna numérica} date_column {columna de fecha} status_column "
      & "{columna de estado} action_column {columna de acciones} other {columna "
      & "oculta}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {columna de texto} number_column {columna "
      & "numérica} date_column {columna de fecha} status_column {columna de "
      & "estado} action_column {columna de acciones} other {columna oculta}}");
   P ("label.tables.group_label",
      "{count, plural, one {{name}: {count, number} fila} many {{name}: "
      & "{count, number} de filas} other {{name}: {count, number} filas}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {ninguna fila} one {{count, number} fila} many "
      & "{{count, number} de filas} other {{count, number} filas}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {sin ordenar} ascending_sort {ascendente} "
      & "other {descendente}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {sin ordenar} ascending_sort {ordenado "
      & "por {column_name}, ascendente} other {ordenado por {column_name}, "
      & "descendente}}");
   P ("label.tables.subtotal_label", "subtotal de {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {{rows, number} fila} many {{rows, number} de "
      & "filas} other {{rows, number} filas}} × {columns, plural, one "
      & "{{columns, number} columna} many {{columns, number} de columnas} other "
      & "{{columns, number} columnas}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {asignación a {assignee} retirada} "
      & "assigned {tarea asignada a {assignee}} reassigned {tarea reasignada a "
      & "{assignee}} watching {tarea seguida por {assignee}} other {tarea "
      & "propiedad de {assignee}}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {sin asignar} assigned {asignada} "
      & "reassigned {reasignada} watching {en seguimiento} other {propietario "
      & "de la tarea}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {backlog vacío} one {backlog: {count, number} "
      & "tarea} many {backlog: {count, number} de tareas} other {backlog: "
      & "{count, number} tareas}}");
   P ("label.tasks.blocker_label", "bloqueada por {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {completar la tarea} many {completar {count, "
      & "number} de tareas} other {completar {count, number} tareas}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {ninguna tarea completada} one {{count, number} "
      & "tarea completada} many {{count, number} de tareas completadas} other "
      & "{{count, number} tareas completadas}}");
   P ("label.tasks.due_label", "vencimiento: {due_text}");
   P ("label.tasks.estimate_label", "estimación: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {ninguna tarea abierta} one {{count, number} tarea "
      & "abierta} many {{count, number} de tareas abiertas} other {{count, "
      & "number} tareas abiertas}}");
   P ("label.tasks.overdue_label", "vencida desde {due_text}");
   P ("label.tasks.recurring_task_label", "se repite {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {reabrir la tarea} many {reabrir {count, number} "
      & "de tareas} other {reabrir {count, number} tareas}}");
   P ("label.tasks.sprint_label",
      "{count, plural, one {{name}: {count, number} tarea} many {{name}: "
      & "{count, number} de tareas} other {{name}: {count, number} tareas}}");
   P ("label.tasks.subtask_label",
      "{count, plural, one {{name}: {count, number} subtarea} many {{name}: "
      & "{count, number} de subtareas} other {{name}: {count, number} "
      & "subtareas}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {ninguna tarea} one {{count, number} tarea} many "
      & "{{count, number} de tareas} other {{count, number} tareas}}");
end Labels_2;
