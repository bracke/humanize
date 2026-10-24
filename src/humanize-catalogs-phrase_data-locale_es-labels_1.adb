separate (Humanize.Catalogs.Phrase_Data.Locale_Es)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name}: cuenta activa} invited_account "
      & "{{name}: cuenta invitada} locked_account {{name}: cuenta bloqueada} "
      & "suspended_account {{name}: cuenta suspendida} deleted_account {{name}: "
      & "cuenta eliminada} other {{name}: estado de cuenta desconocido}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {cuenta activa} invited_account {cuenta "
      & "invitada} locked_account {cuenta bloqueada} suspended_account {cuenta "
      & "suspendida} deleted_account {cuenta eliminada} other {estado de cuenta "
      & "desconocido}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {dispositivo de confianza} "
      & "untrusted_device {dispositivo no fiable} new_device {dispositivo "
      & "nuevo} other {dispositivo bloqueado}}");
   P ("label.accounts.last_active_label", "{name}: última actividad {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: error de inicio de sesión} other "
      & "{{name}: inicio de sesión correcto}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA activada} mfa_disabled {MFA "
      & "desactivada} mfa_required {MFA obligatoria} other {restablecimiento de "
      & "MFA obligatorio}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: sesión activa} "
      & "expired_session {{name}: sesión caducada} revoked_session {{name}: "
      & "sesión revocada} idle_session {{name}: sesión inactiva} other "
      & "{{name}: estado de sesión desconocido}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {sesión activa} expired_session "
      & "{sesión caducada} revoked_session {sesión revocada} idle_session "
      & "{sesión inactiva} other {estado de sesión desconocido}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {ningún archivo adjunto} one {1 archivo adjunto} "
      & "many {{count, number} de archivos adjuntos} other {{count, number} "
      & "archivos adjuntos}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, one {{name}: 1 archivo adjunto} many {{name}: {count, "
      & "number} de archivos adjuntos} other {{name}: {count, number} archivos "
      & "adjuntos}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {archivo adjunto} image_attachment "
      & "{imagen adjunta} video_attachment {vídeo adjunto} audio_attachment "
      & "{audio adjunto} document_attachment {documento adjunto} "
      & "archive_attachment {archivo comprimido adjunto} other {enlace "
      & "adjunto}}");
   P ("label.attachments.attachment_label",
      "{name}: {kind, select, file_attachment {archivo} image_attachment "
      & "{imagen} video_attachment {vídeo} audio_attachment {audio} "
      & "document_attachment {documento} archive_attachment {archivo "
      & "comprimido} other {enlace}} {state, select, pending_attachment "
      & "{pendiente} uploading_attachment {subiendo} uploaded_attachment "
      & "{{kind, select, image_attachment {subida} other {subido}}} "
      & "failed_attachment {con error} removed_attachment {{kind, select, "
      & "image_attachment {quitada} other {quitado}}} other {{kind, select, "
      & "image_attachment {bloqueada} other {bloqueado}}}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {archivo adjunto pendiente} "
      & "uploading_attachment {subiendo archivo adjunto} uploaded_attachment "
      & "{archivo adjunto subido} failed_attachment {error en el archivo "
      & "adjunto} removed_attachment {archivo adjunto quitado} other {archivo "
      & "adjunto bloqueado}}");
   P ("label.attachments.download_label", "descargar {name}");
   P ("label.attachments.expiring_link_label", "{name}: el enlace caduca {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "vista previa de {name}");
   P ("label.attachments.remove_label", "quitar {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: sin analizar} scanning {{name}: "
      & "analizando} safe {{name}: sin amenazas} suspicious {{name}: "
      & "sospechoso} other {{name}: infectado}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {sin analizar} scanning {analizando} safe "
      & "{sin amenazas} suspicious {sospechoso} other {infectado}}");
   P ("label.attachments.upload_error_label", "error al subir {name}: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {insignia} new_badge {insignia "
      & "nueva} updated_badge {insignia actualizada} deprecated_badge {insignia "
      & "obsoleta} selected_badge {insignia seleccionada} disabled_badge "
      & "{insignia desactivada} other {insignia descartable}} ({tone, select, "
      & "neutral_tone {neutra} info_tone {información} success_tone {éxito} "
      & "warning_tone {advertencia} danger_tone {peligro} other {atenuada}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {insignia de prioridad baja} "
      & "medium_priority {insignia de prioridad media} high_priority {insignia "
      & "de prioridad alta} other {insignia de prioridad crítica}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {insignia predeterminada} new_badge "
      & "{insignia nueva} updated_badge {insignia actualizada} deprecated_badge "
      & "{insignia obsoleta} selected_badge {insignia seleccionada} "
      & "disabled_badge {insignia desactivada} other {insignia descartable}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {insignia neutra} info_tone {insignia "
      & "informativa} success_tone {insignia de éxito} warning_tone {insignia "
      & "de advertencia} danger_tone {insignia de peligro} other {insignia "
      & "atenuada}}");
   P ("label.badges.chip_label",
      "{selected, select, false {chip {name}} other {chip {name} "
      & "seleccionado}}");
   P ("label.badges.count_badge_label", "{name}: {count, number}");
   P ("label.badges.deprecated_label", "{name}: insignia obsoleta (advertencia)");
   P ("label.badges.dismiss_label", "descartar {name}");
   P ("label.badges.new_label", "{name}: insignia nueva (información)");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {ninguna insignia oculta} one {+1 insignia "
      & "más} many {+{hidden_count, number} de insignias más} other "
      & "{+{hidden_count, number} insignias más}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: insignia de prioridad baja} "
      & "medium_priority {{name}: insignia de prioridad media} high_priority "
      & "{{name}: insignia de prioridad alta} other {{name}: insignia de "
      & "prioridad crítica}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {{name}, estado: neutro} info_tone "
      & "{{name}, estado: información} success_tone {{name}, estado: éxito} "
      & "warning_tone {{name}, estado: advertencia} danger_tone {{name}, "
      & "estado: peligro} other {{name}, estado: atenuado}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {ninguna etiqueta} one {1 etiqueta} many {{count, "
      & "number} de etiquetas} other {{count, number} etiquetas}}");
   P ("label.badges.tag_label", "etiqueta {name}");
   P ("label.badges.updated_label", "{name}: insignia actualizada (éxito)");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefacto subido} artifact_missing "
      & "{falta el artefacto} artifact_expired {artefacto caducado} other "
      & "{artefacto verificado}}");
   P ("label.builds.benchmark_label", "prueba de rendimiento {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {{name}: compilación en cola} "
      & "build_running {{name}: compilación en curso} build_passed {{name}: "
      & "compilación correcta} build_failed {{name}: error de compilación} "
      & "snapshot_build {{name}: compilación snapshot} other {{name}: "
      & "compilación de versión}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {compilación en cola} build_running "
      & "{compilación en curso} build_passed {compilación correcta} "
      & "build_failed {error de compilación} snapshot_build {compilación "
      & "snapshot} other {compilación de versión}}");
   P ("label.builds.coverage_label", "cobertura: {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {control de versión superado} gate_failed "
      & "{control de versión no superado} gate_warning {advertencia del "
      & "control de versión} other {control de versión bloqueado}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {ninguna prueba "
      & "superada} one {1 prueba superada} many {{count, number} de pruebas "
      & "superadas} other {{count, number} pruebas superadas}}} failed_test "
      & "{{count, plural, =0 {ninguna prueba fallida} one {1 prueba fallida} "
      & "many {{count, number} de pruebas fallidas} other {{count, number} "
      & "pruebas fallidas}}} skipped_test {{count, plural, =0 {ninguna prueba "
      & "omitida} one {1 prueba omitida} many {{count, number} de pruebas "
      & "omitidas} other {{count, number} pruebas omitidas}}} flaky_test "
      & "{{count, plural, =0 {ninguna prueba inestable} one {1 prueba "
      & "inestable} many {{count, number} de pruebas inestables} other {{count, "
      & "number} pruebas inestables}}} other {{count, plural, =0 {ningún fallo "
      & "esperado} one {1 prueba con fallo esperado} many {{count, number} de "
      & "pruebas con fallo esperado} other {{count, number} pruebas con fallo "
      & "esperado}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {superada} failed_test {fallida} "
      & "skipped_test {omitida} flaky_test {inestable} other {fallo esperado}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name}: "
      & "desactivado (sin cambios)} other {{field_name} cambió de desactivado "
      & "a activado}}} other {{new_value, select, false {{field_name} cambió "
      & "de activado a desactivado} other {{field_name}: activado (sin "
      & "cambios)}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {añadido} removed_change {eliminado} "
      & "modified_change {modificado} renamed_change {renombrado} "
      & "unchanged_change {sin cambios} metadata_change {metadatos modificados} "
      & "moved_change {movido} conflict_change {conflicto} other {cambio "
      & "desconocido}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {cambio informativo} "
      & "minor_change {cambio menor} major_change {cambio importante} other "
      & "{cambio incompatible}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}: sin cambios} "
      & "other {{unchanged, plural, =0 {{field_name}: +{added, number}} other "
      & "{{field_name}: +{added, number}, {unchanged, number} sin cambios}}}}} "
      & "other {{added, plural, =0 {{unchanged, plural, =0 {{field_name}: "
      & "-{removed, number}} other {{field_name}: -{removed, number}, "
      & "{unchanged, number} sin cambios}}} other {{unchanged, plural, =0 "
      & "{{field_name}: +{added, number}, -{removed, number}} other "
      & "{{field_name}: +{added, number}, -{removed, number}, {unchanged, "
      & "number} sin cambios}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {ningún conflicto} one {1 conflicto} many {{count, "
      & "number} de conflictos} other {{count, number} conflictos}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} se retrasó de {old_label} a "
      & "{new_label}} other {{field_name} se adelantó de {old_label} a "
      & "{new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} cambió de {old_label} a {new_label}");
   P ("label.changes.field_change_label", "{field_name} cambió de {old_value} a {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name}: añadido} removed_change {{name}: "
      & "eliminado} modified_change {{name}: modificado} renamed_change "
      & "{{name}: renombrado} unchanged_change {{name}: sin cambios} "
      & "metadata_change {{name}: metadatos modificados} moved_change {{name}: "
      & "movido} conflict_change {{name}: conflicto} other {{name}: cambio "
      & "desconocido}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {solo cambiaron los metadatos} one {solo cambió 1 "
      & "campo de metadatos} many {solo cambiaron {count, number} de campos de "
      & "metadatos} other {solo cambiaron {count, number} campos de metadatos}}");
   P ("label.changes.move_label", "{name} se movió de {from} a {to}");
   P ("label.changes.no_changes_label", "sin cambios");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {ninguna línea "
      & "modificada} one {1 línea añadida} many {{lines_added, number} de "
      & "líneas añadidas} other {{lines_added, number} líneas añadidas}}} "
      & "one {{lines_added, plural, =0 {1 línea eliminada} one {1 línea "
      & "añadida, 1 línea eliminada} many {{lines_added, number} de líneas "
      & "añadidas, 1 línea eliminada} other {{lines_added, number} líneas "
      & "añadidas, 1 línea eliminada}}} many {{lines_added, plural, =0 "
      & "{{lines_removed, number} de líneas eliminadas} one {1 línea "
      & "añadida, {lines_removed, number} de líneas eliminadas} many "
      & "{{lines_added, number} de líneas añadidas, {lines_removed, number} "
      & "de líneas eliminadas} other {{lines_added, number} líneas añadidas, "
      & "{lines_removed, number} de líneas eliminadas}}} other {{lines_added, "
      & "plural, =0 {{lines_removed, number} líneas eliminadas} one {1 línea "
      & "añadida, {lines_removed, number} líneas eliminadas} many "
      & "{{lines_added, number} de líneas añadidas, {lines_removed, number} "
      & "líneas eliminadas} other {{lines_added, number} líneas añadidas, "
      & "{lines_removed, number} líneas eliminadas}}}}");
   P ("label.changes.rename_label", "renombrado de {old_name} a {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} redactó un borrador de "
      & "comentario} published_comment {{author} comentó} edited_comment "
      & "{{author} editó un comentario} deleted_comment {{author} eliminó un "
      & "comentario} resolved_comment {{author} resolvió un comentario} "
      & "unresolved_comment {{author} reabrió un comentario} pinned_comment "
      & "{{author} fijó un comentario} other {{author} ocultó un comentario}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {ningún comentario} one {1 comentario} many "
      & "{{count, number} de comentarios} other {{count, number} comentarios}}");
   P ("label.comments.comment_label",
      "comentario de {author} ({state, select, draft_comment {borrador} "
      & "published_comment {publicado} edited_comment {editado} deleted_comment "
      & "{eliminado} resolved_comment {resuelto} unresolved_comment {sin "
      & "resolver} pinned_comment {fijado} other {oculto}})");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {borrador de comentario} "
      & "published_comment {comentario publicado} edited_comment {comentario "
      & "editado} deleted_comment {comentario eliminado} resolved_comment "
      & "{comentario resuelto} unresolved_comment {comentario sin resolver} "
      & "pinned_comment {comentario fijado} other {comentario oculto}}");
   P ("label.comments.deleted_label", "{author} eliminó un comentario");
   P ("label.comments.edited_label", "editado {time_text}");
   P ("label.comments.hide_comment_label", "ocultar comentario: {reason}");
   P ("label.comments.lock_thread_label", "bloquear el hilo {name}");
   P ("label.comments.mention_label", "{actor} mencionó a {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {ningún participante} one {1 participante} many "
      & "{{count, number} de participantes} other {{count, number} "
      & "participantes}}");
   P ("label.comments.pin_label", "fijar {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reacción «me gusta»} dislike_reaction "
      & "{reacción «no me gusta»} heart_reaction {reacción de corazón} "
      & "laugh_reaction {reacción de risa} confused_reaction {reacción de "
      & "confusión} hooray_reaction {reacción de celebración} "
      & "rocket_reaction {reacción de cohete} other {reacción de ojos}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {ningún «me "
      & "gusta»} one {1 «me gusta»} many {{count, number} de «me gusta»} "
      & "other {{count, number} «me gusta»}}} dislike_reaction {{count, "
      & "plural, =0 {ningún «no me gusta»} one {1 «no me gusta»} many "
      & "{{count, number} de «no me gusta»} other {{count, number} «no me "
      & "gusta»}}} heart_reaction {{count, plural, =0 {ningún corazón} one "
      & "{1 corazón} many {{count, number} de corazones} other {{count, "
      & "number} corazones}}} laugh_reaction {{count, plural, =0 {ninguna risa} "
      & "one {1 risa} many {{count, number} de risas} other {{count, number} "
      & "risas}}} confused_reaction {{count, plural, =0 {ninguna reacción de "
      & "confusión} one {1 reacción de confusión} many {{count, number} de "
      & "reacciones de confusión} other {{count, number} reacciones de "
      & "confusión}}} hooray_reaction {{count, plural, =0 {ninguna "
      & "celebración} one {1 celebración} many {{count, number} de "
      & "celebraciones} other {{count, number} celebraciones}}} rocket_reaction "
      & "{{count, plural, =0 {ningún cohete} one {1 cohete} many {{count, "
      & "number} de cohetes} other {{count, number} cohetes}}} other {{count, "
      & "plural, =0 {ninguna reacción de ojos} one {1 reacción de ojos} many "
      & "{{count, number} de reacciones de ojos} other {{count, number} "
      & "reacciones de ojos}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {ninguna respuesta} one {1 respuesta} many {{count, "
      & "number} de respuestas} other {{count, number} respuestas}}");
   P ("label.comments.resolved_label", "{name}: resuelto");
   P ("label.comments.subscribe_label", "suscribirse a {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {ningún hilo} one {1 hilo} many {{count, number} "
      & "de hilos} other {{count, number} hilos}}");
   P ("label.comments.thread_label",
      "{name}: hilo {state, select, open_thread {abierto} resolved_thread "
      & "{resuelto} locked_thread {bloqueado} other {archivado}}{count, plural, "
      & "=0 {} one {, 1 comentario} many {, {count, number} de comentarios} "
      & "other {, {count, number} comentarios}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {hilo abierto} resolved_thread {hilo "
      & "resuelto} locked_thread {hilo bloqueado} other {hilo archivado}}");
   P ("label.comments.unpin_label", "dejar de fijar {name}");
   P ("label.comments.unsubscribe_label", "cancelar la suscripción a {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name}: mejorado} regressed {{name}: "
      & "empeorado} unchanged {{name}: sin cambios} within_tolerance {{name}: "
      & "dentro de la tolerancia} outside_tolerance {{name}: fuera de la "
      & "tolerancia} new_value {{name}: nuevo} removed_value {{name}: "
      & "eliminado} other {{name}: referencia no disponible}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {mejorado} regressed {empeorado} unchanged "
      & "{sin cambios} within_tolerance {dentro de la tolerancia} "
      & "outside_tolerance {fuera de la tolerancia} new_value {nuevo} "
      & "removed_value {eliminado} other {referencia no disponible}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name}: mejora de {difference_text}} "
      & "regressed {{name}: empeoramiento de {difference_text}} unchanged "
      & "{{name}: sin cambios ({difference_text})} within_tolerance {{name}: "
      & "dentro de la tolerancia ({difference_text})} outside_tolerance "
      & "{{name}: fuera de la tolerancia ({difference_text})} new_value "
      & "{{name}: nuevo ({difference_text})} removed_value {{name}: eliminado "
      & "({difference_text})} other {{name}: referencia no disponible "
      & "({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name}: mejora de {difference_text}, "
      & "tolerancia {tolerance_text}} regressed {{name}: empeoramiento de "
      & "{difference_text}, tolerancia {tolerance_text}} unchanged {{name}: sin "
      & "cambios ({difference_text}), tolerancia {tolerance_text}} "
      & "within_tolerance {{name}: dentro de la tolerancia ({difference_text}), "
      & "tolerancia {tolerance_text}} outside_tolerance {{name}: fuera de la "
      & "tolerancia ({difference_text}), tolerancia {tolerance_text}} new_value "
      & "{{name}: nuevo ({difference_text}), tolerancia {tolerance_text}} "
      & "removed_value {{name}: eliminado ({difference_text}), tolerancia "
      & "{tolerance_text}} other {{name}: referencia no disponible "
      & "({difference_text}), tolerancia {tolerance_text}}}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {fila no válida} duplicate_record "
      & "{registro duplicado} missing_column {falta una columna} unknown_field "
      & "{campo desconocido} schema_mismatch {el esquema no coincide} other "
      & "{registro omitido}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {simulación correcta} dry_run_failed "
      & "{error en la simulación} import_valid {importación válida} "
      & "import_invalid {importación no válida} other {importación parcial}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {simulación correcta} "
      & "dry_run_failed {error en la simulación} import_valid {importación "
      & "válida} import_invalid {importación no válida} other {importación "
      & "parcial}} (aceptados: {accepted, number}, rechazados: {rejected, "
      & "number})");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {ninguna fila no "
      & "válida} one {1 fila no válida} many {{count, number} de filas no "
      & "válidas} other {{count, number} filas no válidas}}} duplicate_record "
      & "{{count, plural, =0 {ningún registro duplicado} one {1 registro "
      & "duplicado} many {{count, number} de registros duplicados} other "
      & "{{count, number} registros duplicados}}} missing_column {{count, "
      & "plural, =0 {ninguna columna faltante} one {1 columna faltante} many "
      & "{{count, number} de columnas faltantes} other {{count, number} "
      & "columnas faltantes}}} unknown_field {{count, plural, =0 {ningún campo "
      & "desconocido} one {1 campo desconocido} many {{count, number} de campos "
      & "desconocidos} other {{count, number} campos desconocidos}}} "
      & "schema_mismatch {{count, plural, =0 {ninguna discrepancia de esquema} "
      & "one {1 discrepancia de esquema} many {{count, number} de discrepancias "
      & "de esquema} other {{count, number} discrepancias de esquema}}} other "
      & "{{count, plural, =0 {ningún registro omitido} one {1 registro "
      & "omitido} many {{count, number} de registros omitidos} other {{count, "
      & "number} registros omitidos}}}}");
   P ("label.data_quality.row_issue_label",
      "fila {row, number}: {issue, select, invalid_row {no válida} "
      & "duplicate_record {registro duplicado} missing_column {falta una "
      & "columna} unknown_field {campo desconocido} schema_mismatch {el esquema "
      & "no coincide} other {registro omitido}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {fila no válida} "
      & "duplicate_record {registro duplicado} missing_column {falta una "
      & "columna} unknown_field {campo desconocido} schema_mismatch {el esquema "
      & "no coincide} other {registro omitido}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefacto listo} artifact_uploaded "
      & "{artefacto subido} artifact_signed {artefacto firmado} "
      & "artifact_missing {falta el artefacto} other {artefacto caducado}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {implementación de {name} en "
      & "{environment} en cola} deploying {implementando {name} en "
      & "{environment}} deployed {{name} implementado en {environment}} "
      & "failed_deployment {error en la implementación de {name} en "
      & "{environment}} rolled_back {{name} revertido en {environment}} "
      & "blocked_deployment {implementación de {name} en {environment} "
      & "bloqueada} other {implementación de {name} en {environment} "
      & "cancelada}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {implementación en cola} deploying "
      & "{implementando} deployed {implementado} failed_deployment {error en la "
      & "implementación} rolled_back {revertido} blocked_deployment "
      & "{implementación bloqueada} other {implementación cancelada}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {entorno en buen estado} "
      & "drifting_environment {desviación del entorno} locked_environment "
      & "{entorno bloqueado} maintenance_environment {entorno en mantenimiento} "
      & "other {estado del entorno desconocido}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {sin migración} migration_pending "
      & "{migración pendiente} migrating {migrando} migration_complete "
      & "{migración completada} other {error en la migración}}");
   P ("label.deployments.promotion_label", "{name} promovido de {from_environment} a {to_environment}");
   P ("label.deployments.rollback_label", "reversión de {name} a {target}");
   P ("label.deployments.rollout_label", "implementación gradual de {name}: {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {ningún elemento afectado} one {{count, number} "
      & "elemento afectado} many {{count, number} de elementos afectados} other "
      & "{{count, number} elementos afectados}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {superada} failed_check "
      & "{fallida} warning_check {con advertencias} skipped_check {omitida} "
      & "pending_check {pendiente} other {en curso}} ({duration_s, plural, one "
      & "{{duration_s, number} segundo} many {{duration_s, number} de segundos} "
      & "other {{duration_s, number} segundos}})");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {superada} failed_check "
      & "{fallida} warning_check {con advertencias} skipped_check {omitida} "
      & "pending_check {pendiente} other {en curso}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {superada} failed_check {fallida} "
      & "warning_check {con advertencias} skipped_check {omitida} pending_check "
      & "{pendiente} other {en curso}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{kind, select, expected_value {se esperaba un "
      & "valor para {subject}} expected_unit {se esperaba una unidad para "
      & "{subject}} invalid_range {rango no válido para {subject}} "
      & "end_before_start {el final del rango es anterior al inicio para "
      & "{subject}} unknown_field {campo desconocido para {subject}} "
      & "unsafe_redacted_value {se ocultó un valor no seguro para {subject}} "
      & "unsupported_syntax {sintaxis no admitida para {subject}} other "
      & "{explicación del diagnóstico para {subject}}}; usa {suggestion}} "
      & "other {{kind, select, expected_value {se esperaba un valor para "
      & "{subject} en la posición {position, number}} expected_unit {se "
      & "esperaba una unidad para {subject} en la posición {position, number}} "
      & "invalid_range {rango no válido para {subject} en la posición "
      & "{position, number}} end_before_start {el final del rango es anterior "
      & "al inicio para {subject} en la posición {position, number}} "
      & "unknown_field {campo desconocido para {subject} en la posición "
      & "{position, number}} unsafe_redacted_value {se ocultó un valor no "
      & "seguro para {subject} en la posición {position, number}} "
      & "unsupported_syntax {sintaxis no admitida para {subject} en la "
      & "posición {position, number}} other {explicación del diagnóstico "
      & "para {subject} en la posición {position, number}}}; usa "
      & "{suggestion}}}");
   P ("label.diagnostics.diagnostic_label",
      "{line, plural, =0 {{severity, select, info_severity {información en "
      & "{path}: {message}} notice_severity {aviso en {path}: {message}} "
      & "warning_severity {advertencia en {path}: {message}} error_severity "
      & "{error en {path}: {message}} critical_severity {crítico en {path}: "
      & "{message}} other {bloqueante en {path}: {message}}}} other {{severity, "
      & "select, info_severity {información en {path}, línea {line, number}: "
      & "{message}} notice_severity {aviso en {path}, línea {line, number}: "
      & "{message}} warning_severity {advertencia en {path}, línea {line, "
      & "number}: {message}} error_severity {error en {path}, línea {line, "
      & "number}: {message}} critical_severity {crítico en {path}, línea "
      & "{line, number}: {message}} other {bloqueante en {path}, línea {line, "
      & "number}: {message}}}}}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {error en {path}} other {{column, plural, =0 {error "
      & "en {path}, línea {line, number}} other {error en {path}, línea "
      & "{line, number}, columna {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {información en {field_name}: "
      & "{message}} notice_severity {aviso en {field_name}: {message}} "
      & "warning_severity {advertencia en {field_name}: {message}} "
      & "error_severity {error en {field_name}: {message}} critical_severity "
      & "{crítico en {field_name}: {message}} other {bloqueante en "
      & "{field_name}: {message}}}");
   P ("label.diagnostics.first_failure_label",
      "{line, plural, =0 {primer error en {check_name}: {path}} other {primer "
      & "error en {check_name}: {path}, línea {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{ningún problema} other {{notices, plural, one {{notices, number} "
      & "aviso} many {{notices, number} de avisos} other {{notices, number} "
      & "avisos}}}}} other {{notices, plural, =0 {{warnings, plural, one "
      & "{{warnings, number} advertencia} many {{warnings, number} de "
      & "advertencias} other {{warnings, number} advertencias}}} other "
      & "{{warnings, plural, one {{warnings, number} advertencia} many "
      & "{{warnings, number} de advertencias} other {{warnings, number} "
      & "advertencias}}, {notices, plural, one {{notices, number} aviso} many "
      & "{{notices, number} de avisos} other {{notices, number} avisos}}}}}}} "
      & "other {{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, "
      & "one {{errors, number} error} many {{errors, number} de errores} other "
      & "{{errors, number} errores}}} other {{errors, plural, one {{errors, "
      & "number} error} many {{errors, number} de errores} other {{errors, "
      & "number} errores}}, {notices, plural, one {{notices, number} aviso} "
      & "many {{notices, number} de avisos} other {{notices, number} "
      & "avisos}}}}} other {{notices, plural, =0 {{errors, plural, one "
      & "{{errors, number} error} many {{errors, number} de errores} other "
      & "{{errors, number} errores}}, {warnings, plural, one {{warnings, "
      & "number} advertencia} many {{warnings, number} de advertencias} other "
      & "{{warnings, number} advertencias}}} other {{errors, plural, one "
      & "{{errors, number} error} many {{errors, number} de errores} other "
      & "{{errors, number} errores}}, {warnings, plural, one {{warnings, "
      & "number} advertencia} many {{warnings, number} de advertencias} other "
      & "{{warnings, number} advertencias}}, {notices, plural, one {{notices, "
      & "number} aviso} many {{notices, number} de avisos} other {{notices, "
      & "number} avisos}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, línea "
      & "{line, number}} other {{path}, línea {line, number}, columna {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{position, plural, =0 {{family, select, byte_parser {sintaxis no "
      & "admitida (analizador de tamaños): {error}; usa B, kB, MB, GB, KiB, "
      & "MiB, GiB o TiB} duration_parser {sintaxis no admitida (analizador de "
      & "duraciones): {error}; usa ms, s, min, h, d, w, month o year} "
      & "date_time_parser {sintaxis no admitida (analizador de fechas y horas): "
      & "{error}; usa una fecha ISO, un día en lenguaje natural o una hora} "
      & "color_parser {sintaxis no admitida (analizador de colores): {error}; "
      & "usa hex, rgb(), hsl(), lab(), lch() o un nombre de color} url_parser "
      & "{sintaxis no admitida (analizador de URL): {error}; usa esquema, host, "
      & "ruta, consulta o fragmento} unit_parser {sintaxis no admitida "
      & "(analizador de unidades): {error}; usa una unidad admitida por "
      & "Humanize} recurrence_parser {sintaxis no admitida (analizador de "
      & "recurrencias): {error}; usa cron o una recurrencia every/weekday} "
      & "domain_label_parser {sintaxis no admitida (analizador de etiquetas de "
      & "dominio): {error}; usa una etiqueta de dominio determinista de "
      & "Humanize} other {sintaxis no admitida (analizador): {error}; usa una "
      & "forma de entrada admitida}}} other {{family, select, byte_parser "
      & "{sintaxis no admitida (analizador de tamaños): {error} en la "
      & "posición {position, number}; usa B, kB, MB, GB, KiB, MiB, GiB o TiB} "
      & "duration_parser {sintaxis no admitida (analizador de duraciones): "
      & "{error} en la posición {position, number}; usa ms, s, min, h, d, w, "
      & "month o year} date_time_parser {sintaxis no admitida (analizador de "
      & "fechas y horas): {error} en la posición {position, number}; usa una "
      & "fecha ISO, un día en lenguaje natural o una hora} color_parser "
      & "{sintaxis no admitida (analizador de colores): {error} en la posición "
      & "{position, number}; usa hex, rgb(), hsl(), lab(), lch() o un nombre de "
      & "color} url_parser {sintaxis no admitida (analizador de URL): {error} "
      & "en la posición {position, number}; usa esquema, host, ruta, consulta "
      & "o fragmento} unit_parser {sintaxis no admitida (analizador de "
      & "unidades): {error} en la posición {position, number}; usa una unidad "
      & "admitida por Humanize} recurrence_parser {sintaxis no admitida "
      & "(analizador de recurrencias): {error} en la posición {position, "
      & "number}; usa cron o una recurrencia every/weekday} domain_label_parser "
      & "{sintaxis no admitida (analizador de etiquetas de dominio): {error} en "
      & "la posición {position, number}; usa una etiqueta de dominio "
      & "determinista de Humanize} other {sintaxis no admitida (analizador): "
      & "{error} en la posición {position, number}; usa una forma de entrada "
      & "admitida}}}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {superada} failed_check {fallida} "
      & "warning_check {con advertencias} skipped_check {omitida} pending_check "
      & "{pendiente} other {en curso}}{notices, plural, =0 {, sin avisos} one "
      & "{, {notices, number} aviso} many {, {notices, number} de avisos} other "
      & "{, {notices, number} avisos}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {reintento 1 de 1} other "
      & "{reintento {attempt, number} de 1: límite superado}}} other "
      & "{reintento {attempt, number} de {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {información} notice_severity "
      & "{aviso} warning_severity {advertencia} error_severity {error} "
      & "critical_severity {crítico} other {bloqueante}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {diagnósticos de compilación} "
      & "test_source {diagnósticos de pruebas} lint_source {diagnósticos de "
      & "lint} import_source {diagnósticos de importación} validation_source "
      & "{diagnósticos de validación} runtime_source {diagnósticos de "
      & "ejecución} security_source {diagnósticos de seguridad} other "
      & "{diagnósticos}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {{source, select, build_source {{count, number} "
      & "diagnóstico de compilación} test_source {{count, number} "
      & "diagnóstico de pruebas} lint_source {{count, number} diagnóstico de "
      & "lint} import_source {{count, number} diagnóstico de importación} "
      & "validation_source {{count, number} diagnóstico de validación} "
      & "runtime_source {{count, number} diagnóstico de ejecución} "
      & "security_source {{count, number} diagnóstico de seguridad} other "
      & "{{count, number} diagnóstico}}} many {{source, select, build_source "
      & "{{count, number} de diagnósticos de compilación} test_source "
      & "{{count, number} de diagnósticos de pruebas} lint_source {{count, "
      & "number} de diagnósticos de lint} import_source {{count, number} de "
      & "diagnósticos de importación} validation_source {{count, number} de "
      & "diagnósticos de validación} runtime_source {{count, number} de "
      & "diagnósticos de ejecución} security_source {{count, number} de "
      & "diagnósticos de seguridad} other {{count, number} de diagnósticos}}} "
      & "other {{source, select, build_source {{count, number} diagnósticos de "
      & "compilación} test_source {{count, number} diagnósticos de pruebas} "
      & "lint_source {{count, number} diagnósticos de lint} import_source "
      & "{{count, number} diagnósticos de importación} validation_source "
      & "{{count, number} diagnósticos de validación} runtime_source {{count, "
      & "number} diagnósticos de ejecución} security_source {{count, number} "
      & "diagnósticos de seguridad} other {{count, number} diagnósticos}}}}");
   P ("label.diagnostics.suggested_action_label", "siguiente paso: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {nombre de dominio} ipv4_host {dirección "
      & "IPv4} ipv6_host {dirección IPv6} localhost_host {host local} "
      & "private_network_host {dirección de red privada} other {host "
      & "desconocido}}");
   P ("label.events.all_day_label", "{name} (todo el día)");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {sin respuesta} accepted {aceptado} "
      & "declined {rechazado} maybe {quizás} other {en lista de espera}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {ningún asistente} one {{count, number} asistente} "
      & "many {{count, number} de asistentes} other {{count, number} "
      & "asistentes}}");
   P ("label.events.canceled_label", "{name}: cancelado");
   P ("label.events.check_in_label", "registrarse en {name}");
   P ("label.events.conference_link_label", "enlace de videoconferencia de {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {ningún evento} one {{count, number} evento} many "
      & "{{count, number} de eventos} other {{count, number} eventos}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {evento programado} "
      & "tentative_event {evento provisional} in_progress_event {evento en "
      & "curso} completed_event {evento finalizado} canceled_event {evento "
      & "cancelado} other {evento aplazado}}");
   P ("label.events.event_location_label", "{name} en {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {evento programado} tentative_event "
      & "{evento provisional} in_progress_event {evento en curso} "
      & "completed_event {evento finalizado} canceled_event {evento cancelado} "
      & "other {evento aplazado}}");
   P ("label.events.event_time_label", "{name}: {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {evento público} private_event "
      & "{evento privado} busy_event {ocupado} other {disponible}}");
   P ("label.events.organizer_label", "organizado por {name}");
   P ("label.events.rsvp_label",
      "respuesta: {state, select, not_responded {pendiente} accepted "
      & "{aceptada} declined {rechazada} maybe {quizás} other {en lista de "
      & "espera}}");
   P ("label.events.reminder_label", "recordatorio: {time_text}");
   P ("label.events.rescheduled_label", "{name} reprogramado: {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {{used, number} carácter} many {{used, number} de "
      & "caracteres} other {{used, number} caracteres}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {sin límite de caracteres} one {{limit, number} "
      & "carácter como máximo} many {{limit, number} de caracteres como "
      & "máximo} other {{limit, number} caracteres como máximo}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {{used, number} carácter} many "
      & "{{used, number} de caracteres} other {{used, number} caracteres}}} "
      & "other {{used, number} de {limit, plural, one {{limit, number} "
      & "carácter} many {{limit, number} de caracteres} other {{limit, number} "
      & "caracteres}}}}");
   P ("label.forms.field_label",
      "{name}: {required, select, false {campo opcional} other {campo "
      & "obligatorio}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {válido} invalid_input {no "
      & "válido} required_input {obligatorio} optional_input {opcional} "
      & "disabled_input {deshabilitado} other {de solo lectura}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {ningún problema en el "
      & "formulario} other {{warnings, plural, one {{warnings, number} "
      & "advertencia} many {{warnings, number} de advertencias} other "
      & "{{warnings, number} advertencias}}}}} other {{warnings, plural, =0 "
      & "{{errors, plural, one {{errors, number} error} many {{errors, number} "
      & "de errores} other {{errors, number} errores}}} other {{errors, plural, "
      & "one {{errors, number} error} many {{errors, number} de errores} other "
      & "{{errors, number} errores}}, {warnings, plural, one {{warnings, "
      & "number} advertencia} many {{warnings, number} de advertencias} other "
      & "{{warnings, number} advertencias}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {sin empezar} editing_form {editando} "
      & "dirty_form {cambios sin guardar} saving_form {guardando} saved_form "
      & "{guardado} submitted_form {enviado} other {error en el envío}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {entrada válida} invalid_input {entrada "
      & "no válida} required_input {entrada obligatoria} optional_input "
      & "{entrada opcional} disabled_input {entrada deshabilitada} other "
      & "{entrada de solo lectura}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {sin empezar} editing_form {editando} "
      & "dirty_form {cambios sin guardar} saving_form {guardando el formulario} "
      & "saved_form {formulario guardado} submitted_form {formulario enviado} "
      & "other {{errors, plural, =0 {error en el envío} other {error en el "
      & "envío ({errors, plural, one {{errors, number} error} many {{errors, "
      & "number} de errores} other {{errors, number} errores}})}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {ningún cambio sin guardar} one {{count, number} "
      & "cambio sin guardar} many {{count, number} de cambios sin guardar} "
      & "other {{count, number} cambios sin guardar}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {falta el nombre "
      & "accesible} low_contrast {contraste bajo} skipped_heading_level {nivel "
      & "de encabezado omitido} missing_form_label {falta la etiqueta del "
      & "formulario} invalid_aria {ARIA no válido} keyboard_trap {trampa de "
      & "teclado} other {problema de accesibilidad desconocido}}");
end Labels_1;
