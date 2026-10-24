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
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {transparente} "
      & "mostly_transparent {casi transparente} translucent {translúcido} "
      & "mostly_opaque {casi opaco} other {opaco}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {sin observaciones} one {{count, number} "
      & "observación, mín. {minimum} {unit}, mediana {median} {unit}, máx. "
      & "{maximum} {unit}} many {{count, number} de observaciones, mín. "
      & "{minimum} {unit}, mediana {median} {unit}, máx. {maximum} {unit}} "
      & "other {{count, number} observaciones, mín. {minimum} {unit}, mediana "
      & "{median} {unit}, máx. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {sin observaciones} other {0 "
      & "valores atípicos de {total, plural, one {{total, number} "
      & "observación} many {{total, number} de observaciones} other {{total, "
      & "number} observaciones}}}}} one {{outliers, number} valor atípico de "
      & "{total, plural, one {{total, number} observación} many {{total, "
      & "number} de observaciones} other {{total, number} observaciones}}} many "
      & "{{outliers, number} de valores atípicos de {total, plural, one "
      & "{{total, number} observación} many {{total, number} de observaciones} "
      & "other {{total, number} observaciones}}} other {{outliers, number} "
      & "valores atípicos de {total, plural, one {{total, number} "
      & "observación} many {{total, number} de observaciones} other {{total, "
      & "number} observaciones}}}}");
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} por encima de la "
      & "capacidad} other {quedan {count, number} de {total, number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {cuota superada en {count, number} {unit} "
      & "({percent} usado)} near {cuota cerca del límite: quedan {count, "
      & "number} {unit} ({percent} usado)} other {cuota disponible: quedan "
      & "{count, number} {unit} ({percent} usado)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {tasa de aciertos de caché no disponible: sin "
      & "solicitudes} other {tasa de aciertos de caché {percent}: {hits, "
      & "plural, one {{hits, number} acierto} many {{hits, number} de aciertos} "
      & "other {{hits, number} aciertos}}, {misses, plural, one {{misses, "
      & "number} fallo} many {{misses, number} de fallos} other {{misses, "
      & "number} fallos}}}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {{count, number} atributo} many {{count, number} "
      & "de atributos} other {{count, number} atributos}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {{count, number} atributo de datos} many {{count, "
      & "number} de atributos de datos} other {{count, number} atributos de "
      & "datos}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {{count, number} atributo ARIA} many {{count, "
      & "number} de atributos ARIA} other {{count, number} atributos ARIA}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {{count, number} controlador de eventos} many "
      & "{{count, number} de controladores de eventos} other {{count, number} "
      & "controladores de eventos}}");
   P ("label.markup.heading_label", "encabezado de nivel {level, number}");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {{count, number} etiqueta} many {{count, number} "
      & "de etiquetas} other {{count, number} etiquetas}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {{count, number} enlace} many {{count, number} de "
      & "enlaces} other {{count, number} enlaces}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} elemento multimedia} many "
      & "{{count, number} de elementos multimedia} other {{count, number} "
      & "elementos multimedia}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} control de formulario} many "
      & "{{count, number} de controles de formulario} other {{count, number} "
      & "controles de formulario}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {{count, number} encabezado} many {{count, number} "
      & "de encabezados} other {{count, number} encabezados}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {{count, number} punto de referencia} many "
      & "{{count, number} de puntos de referencia} other {{count, number} "
      & "puntos de referencia}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {{count, number} formulario} many {{count, number} "
      & "de formularios} other {{count, number} formularios}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} elemento multimedia} many "
      & "{{count, number} de elementos multimedia} other {{count, number} "
      & "elementos multimedia}}");
   P ("label.markup.table_navigation_label",
      "{caption} fila {row, number} de {rows, number}, columna {column, "
      & "number} de {columns, number}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} secreto} many {{count, number} de "
      & "secretos} other {{count, number} secretos}}");
   P ("label.secrets.secret_count_label.masked",
      "{count, plural, one {{count, number} enmascarado} many {{count, "
      & "number} enmascarados} other {{count, number} enmascarados}}");
   P ("label.secrets.secret_count_label.unset",
      "{count, plural, one {{count, number} sin definir} many {{count, "
      & "number} sin definir} other {{count, number} sin definir}}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} huella digital} many {{count, "
      & "number} de huellas digitales} other {{count, number} huellas "
      & "digitales}}");
   P ("label.schema.type_mismatch_label",
      "campo {field_name}: se esperaba {expected, select, string_field "
      & "{cadena} integer_field {entero} decimal_field {decimal} boolean_field "
      & "{booleano} date_field {fecha} date_time_field {fecha y hora} "
      & "object_field {objeto} array_field {matriz} enum_field {enumeración} "
      & "binary_field {binario} null_field {nulo} any_field {cualquiera} other "
      & "{desconocido}}, se obtuvo {actual, select, string_field {cadena} "
      & "integer_field {entero} decimal_field {decimal} boolean_field "
      & "{booleano} date_field {fecha} date_time_field {fecha y hora} "
      & "object_field {objeto} array_field {matriz} enum_field {enumeración} "
      & "binary_field {binario} null_field {nulo} any_field {cualquiera} other "
      & "{desconocido}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} problema bloqueante} many {{blocking, number} de problemas "
      & "bloqueantes} other {{blocking, number} problemas bloqueantes}}} "
      & "blocking {{base}, {blocking, plural, one {{blocking, number} problema "
      & "bloqueante} many {{blocking, number} de problemas bloqueantes} other "
      & "{{blocking, number} problemas bloqueantes}}} only {solo {base}} other "
      & "{{base}}}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {rango objetivo de {low} a "
      & "{high}} other {ventana objetivo de {low} a {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} dentro del rango esperado} below "
      & "{{value} por debajo del rango esperado} other {{value} por encima del "
      & "rango esperado}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} en el umbral crítico} warning "
      & "{{value} en el umbral de advertencia} other {{value} dentro del rango "
      & "normal}}");
   P ("label.thresholds.breach_label", "{state, select, ok {no superado} other {superado en {difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {en el objetivo} below {{difference} por debajo del "
      & "objetivo} other {{difference} por encima del objetivo}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {límite superado} near {cerca del límite, "
      & "quedan {distance}} other {a {distance} del límite}}");
   P ("label.thresholds.threshold_summary_label.none", "sin métricas");
   P ("label.thresholds.threshold_summary_label.normal",
      "{count, plural, one {{count, number} normal} many {{count, number} "
      & "normales} other {{count, number} normales}}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {{count, number} advertencia} many {{count, "
      & "number} de advertencias} other {{count, number} advertencias}}");
   P ("label.thresholds.threshold_summary_label.critical",
      "{count, plural, one {{count, number} crítica} many {{count, number} "
      & "críticas} other {{count, number} críticas}}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {{count, number} superación} many {{count, "
      & "number} de superaciones} other {{count, number} superaciones}}");
   P ("label.thresholds.target_window_label", "objetivo {target} más/menos {tolerance}");
   P ("label.thresholds.tolerance_label", "tolerancia {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} del límite");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {límite superado en {amount}} other {quedan "
      & "{amount}}}");
   P ("label.thresholds.budget_used_label", "{used} usado de {budget}");
   P ("label.workflows.step_label", "paso {current, number} de {total, number}: {name}");
   P ("label.workflows.milestone_label",
      "{current, number} de {total, plural, one {{total, number} hito "
      & "completado} many {{total, number} de hitos completados} other {{total, "
      & "number} hitos completados}}: {name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {sin elementos de flujo de trabajo} half {flujo "
      & "de trabajo a mitad de camino} other {{completed, number} de {total, "
      & "number} completados}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {posición {position, number} en la cola} other "
      & "{posición {position, number} de {total, number} en la cola}}");
   P ("label.changes.change_set_label.none", "sin cambios");
   P ("label.changes.change_set_label.added",
      "{count, plural, one {{count, number} añadido} many {{count, number} "
      & "añadidos} other {{count, number} añadidos}}");
   P ("label.changes.change_set_label.removed",
      "{count, plural, one {{count, number} eliminado} many {{count, number} "
      & "eliminados} other {{count, number} eliminados}}");
   P ("label.changes.change_set_label.modified",
      "{count, plural, one {{count, number} modificado} many {{count, number} "
      & "modificados} other {{count, number} modificados}}");
   P ("label.changes.change_set_label.unchanged",
      "{count, plural, one {{count, number} sin cambios} many {{count, "
      & "number} sin cambios} other {{count, number} sin cambios}}");
   P ("label.changes.sync_change_label.none", "sin cambios de sincronización");
   P ("label.changes.sync_change_label.uploaded",
      "{count, plural, one {{count, number} subido} many {{count, number} "
      & "subidos} other {{count, number} subidos}}");
   P ("label.changes.sync_change_label.downloaded",
      "{count, plural, one {{count, number} descargado} many {{count, number} "
      & "descargados} other {{count, number} descargados}}");
   P ("label.changes.sync_change_label.deleted",
      "{count, plural, one {{count, number} eliminado} many {{count, number} "
      & "eliminados} other {{count, number} eliminados}}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} conflicto} many {{count, number} "
      & "de conflictos} other {{count, number} conflictos}}");
   P ("label.changes.net_change_label",
      "{state, select, none {sin cambio neto} up {cambio neto: +{count, "
      & "plural, one {{count, number} elemento} many {{count, number} de "
      & "elementos} other {{count, number} elementos}}} other {cambio neto: "
      & "-{count, plural, one {{count, number} elemento} many {{count, number} "
      & "de elementos} other {{count, number} elementos}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {no hay cambios que revisar} all {todos los "
      & "cambios revisados} other {{reviewed, number} de {total, number} "
      & "cambios revisados}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} sin cambios en {new_value}} up "
      & "{{field_name} aumentó de {old_value} a {new_value}} other "
      & "{{field_name} disminuyó de {old_value} a {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {ninguna fila seleccionable} none {ninguna "
      & "fila seleccionada} all {{total, plural, one {{total, number} fila "
      & "seleccionada} many {las {total, number} de filas seleccionadas} other "
      & "{las {total, number} filas seleccionadas}}} other {{selected, number} "
      & "de {total, plural, one {{total, number} fila seleccionada} many "
      & "{{total, number} de filas seleccionadas} other {{total, number} filas "
      & "seleccionadas}}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {sin páginas} other {{pages, plural, =0 {sin "
      & "páginas} other {{rows, plural, =0 {página {page, number} de {pages, "
      & "number}} one {página {page, number} de {pages, number}, {rows, "
      & "number} fila} many {página {page, number} de {pages, number}, {rows, "
      & "number} de filas} other {página {page, number} de {pages, number}, "
      & "{rows, number} filas}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {sin filas} none {ninguna fila coincide} all "
      & "{{total, plural, one {{total, number} fila visible} many {las {total, "
      & "number} de filas visibles} other {las {total, number} filas "
      & "visibles}}} other {{visible, number} de {total, plural, one {{total, "
      & "number} fila visible} many {{total, number} de filas visibles} other "
      & "{{total, number} filas visibles}}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {sin filas} single {fila {first_row, number} de "
      & "{total, number}} other {filas {first_row, number}-{last_row, number} "
      & "de {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {sin límite de caracteres} none_left {no "
      & "quedan caracteres} left {{count, plural, one {queda {count, number} "
      & "carácter} many {quedan {count, number} de caracteres} other {quedan "
      & "{count, number} caracteres}}} other {{count, plural, one {{count, "
      & "number} carácter por encima del límite} many {{count, number} de "
      & "caracteres por encima del límite} other {{count, number} caracteres "
      & "por encima del límite}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {sin campos obligatorios} one {{missing, plural, =0 "
      & "{todos los campos obligatorios completos} other {falta 1 de 1 campo "
      & "obligatorio}}} other {{missing, plural, =0 {todos los campos "
      & "obligatorios completos} one {falta {missing, number} de {total, "
      & "number} campos obligatorios} other {faltan {missing, number} de "
      & "{total, number} campos obligatorios}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {sin campos} all {todos los campos completos} "
      & "other {{completed, number} de {total, plural, one {{total, number} "
      & "campo completo} many {{total, number} de campos completos} other "
      & "{{total, number} campos completos}}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: sin campos} all {{name}: todos los "
      & "campos completos} other {{name}: {completed, number} de {total, "
      & "plural, one {{total, number} campo completo} many {{total, number} de "
      & "campos completos} other {{total, number} campos completos}}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {sin pasos de formulario} one {paso 1 de 1: {name}} "
      & "other {paso {current, number} de {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {sin ruta de navegación} one {ruta de navegación "
      & "1 de 1: {name}} other {ruta de navegación {current, number} de "
      & "{total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {sin pestañas} one {pestaña 1 de 1: {name}} other "
      & "{pestaña {current, number} de {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {bandeja de entrada vacía} one {{unread, plural, "
      & "=0 {todas las notificaciones leídas} other {1 sin leer de 1 "
      & "notificación}}} other {{unread, plural, =0 {todas las notificaciones "
      & "leídas} other {{unread, number} sin leer de {total, number} "
      & "notificaciones}}}}");
   P ("label.notifications.delivery_attempt_label", "intento de entrega {attempt, number} de {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {sin elementos en la lista de verificación} one "
      & "{{done, plural, =0 {0 de 1 elemento completado} other {1 de 1 elemento "
      & "completado}}} other {{done, number} de {total, number} elementos "
      & "completados}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {sin subidas} one {{done, plural, =0 {0 de 1 subida "
      & "completada} other {1 de 1 subida completada}}} other {{done, number} "
      & "de {total, number} subidas completadas}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {sin plazas} one {{reserved, plural, =0 {0 de 1 "
      & "plaza reservada} other {1 de 1 plaza reservada}}} other {{reserved, "
      & "number} de {capacity, number} plazas reservadas}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {posición {position, number} en la lista de "
      & "espera} other {posición {position, number} de {total, number} en la "
      & "lista de espera}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} cambiados} other {{name}: {changed, plural, one {{changed, "
      & "number} cambiado} many {{changed, number} cambiados} other {{changed, "
      & "number} cambiados}}, {unchanged, number} sin cambios, {total, number} "
      & "en total}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "el primer plano actual cumple el contraste de {v1}:{v2, number} (texto "
      & "grande)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "el primer plano actual cumple el contraste de {v1}:{v2, number} (texto "
      & "normal)");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "usa {v1} para un contraste de {v2, number}:{v3, number} (nivel "
      & "mejorado)");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "usa {v1} para un contraste de {v2, number}:{v3, number} (texto grande)");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "usa {v1} para un contraste de {v2}:{v3, number} (texto normal)");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "usa {v1} para un contraste de {v2}:{v3, number} (texto grande)");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "usa {v1} para un contraste de {v2}:{v3, number} (nivel mejorado)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "el primer plano actual cumple el contraste de {v1, number}:{v2, "
      & "number} (texto grande)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "el primer plano actual cumple el contraste de {v1, number}:{v2, "
      & "number} (texto normal)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "el primer plano actual cumple el contraste de {v1}:{v2, number} (nivel "
      & "mejorado)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "el primer plano actual cumple el contraste de {v1, number}:{v2, "
      & "number} (nivel mejorado)");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopía: riesgo de confusión bajo, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopía: riesgo de confusión moderado, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopía: riesgo de confusión moderado, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "acromatopsia: riesgo de confusión alto, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, diferencia perceptual drástica");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, diferencia perceptual drástica");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 textil delta {v1}, diferencia perceptual drástica");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, diferencia perceptual drástica");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, diferencia perceptual grande");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopía: riesgo de confusión moderado, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, diferencia perceptual drástica");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, diferencia perceptual drástica");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, diferencia perceptual drástica");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "acromatopsia: riesgo de confusión bajo, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopía: colores distinguibles, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopía: colores distinguibles, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopía: colores distinguibles, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "acromatopsia: colores distinguibles, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "acromatopsia: riesgo de confusión moderado, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, diferencia perceptual grande");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, diferencia perceptual grande");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 textil delta {v1}, diferencia perceptual grande");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, diferencia perceptual grande");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, diferencia perceptual apreciable");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopía: riesgo de confusión alto, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopía: riesgo de confusión alto, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, diferencia perceptual apreciable");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 textil delta {v1}, diferencia perceptual apreciable");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, diferencia perceptual apreciable");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, diferencia perceptual apreciable");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopía: riesgo de confusión bajo, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopía: riesgo de confusión bajo, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, diferencia perceptual grande");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopía: riesgo de confusión alto, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, diferencia perceptual drástica");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 textil delta {v1, number}, diferencia perceptual drástica");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, diferencia perceptual drástica");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, diferencia perceptual grande");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 textil delta {v1, number}, diferencia perceptual grande");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, diferencia perceptual grande");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, diferencia perceptual apreciable");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 textil delta {v1}, diferencia perceptual sutil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, diferencia perceptual apreciable");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 textil delta {v1, number}, diferencia perceptual apreciable");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, apenas perceptible");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, imperceptible");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 textil delta {v1}, imperceptible");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, imperceptible");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, imperceptible");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, diferencia perceptual grande");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 textil delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, diferencia perceptual sutil");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, diferencia perceptual sutil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, diferencia perceptual sutil");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, apenas perceptible");
   P ("label.metrics.text_summary.n_words",
      "{v1, plural, one {{v1, number} palabra} many {{v1, number} de "
      & "palabras} other {{v1, number} palabras}}");
   P ("label.metrics.text_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} párrafo} many {{v1, number} de "
      & "párrafos} other {{v1, number} párrafos}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "{v1, plural, one {{v1, number} minuto de habla} many {{v1, number} de "
      & "minutos de habla} other {{v1, number} minutos de habla}}");
   P ("label.metrics.text_summary.n_sentences",
      "{v1, plural, one {{v1, number} oración} many {{v1, number} de "
      & "oraciones} other {{v1, number} oraciones}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "{v1, plural, one {{v1, number} minuto de lectura} many {{v1, number} "
      & "de minutos de lectura} other {{v1, number} minutos de lectura}}");
   P ("label.metrics.text_summary.n_paragraph",
      "{v1, plural, one {{v1, number} párrafo} many {{v1, number} de "
      & "párrafos} other {{v1, number} párrafos}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "{v1, plural, =1 {menos de un minuto de habla} other {menos de {v1, "
      & "number} minutos de habla}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "{v1, plural, =1 {menos de un minuto de lectura} other {menos de {v1, "
      & "number} minutos de lectura}}");
   P ("label.metrics.text_summary.n_sentence",
      "{v1, plural, one {{v1, number} oración} many {{v1, number} de "
      & "oraciones} other {{v1, number} oraciones}}");
   P ("label.metrics.text_summary.no_words", "ninguna palabra");
   P ("label.metrics.text_summary.no_paragraphs", "ningún párrafo");
   P ("label.metrics.text_summary.no_sentences", "ninguna oración");
   P ("label.metrics.text_summary.n_word",
      "{v1, plural, one {{v1, number} palabra} many {{v1, number} de "
      & "palabras} other {{v1, number} palabras}}");
   P ("label.names.hue_family_label.neutral", "neutro");
   P ("label.names.saturation_label.neutral", "neutro");
   P ("label.names.temperature_label.neutral_temperature", "temperatura neutra");
   P ("label.names.chroma_label.grayish", "grisáceo");
   P ("label.names.nearest_color_name.black", "negro");
   P ("label.models.brightness_label.very_dark", "muy oscuro");
   P ("label.names.hue_family_label.blue", "azul");
   P ("label.names.saturation_label.vivid", "vivo");
   P ("label.names.temperature_label.cool", "frío");
   P ("label.names.chroma_label.moderate_chroma", "croma moderado");
   P ("label.names.nearest_color_name.navy", "azul marino");
   P ("label.names.chroma_label.high_chroma", "croma alto");
   P ("label.names.nearest_color_name.blue", "azul");
   P ("label.names.hue_family_label.green", "verde");
   P ("label.names.temperature_label.balanced_temperature", "temperatura equilibrada");
   P ("label.names.hue_family_label.cyan", "cian");
   P ("label.names.chroma_label.soft", "suave");
   P ("label.models.brightness_label.dark", "oscuro");
   P ("label.names.nearest_color_name.green", "verde");
   P ("label.names.nearest_color_name.teal", "verde azulado");
   P ("label.models.brightness_label.medium_brightness", "luminosidad media");
   P ("label.names.nearest_color_name.aqua", "aguamarina");
   P ("label.names.nearest_color_name.lime", "lima");
   P ("label.models.brightness_label.light", "claro");
   P ("label.names.hue_family_label.red", "rojo");
   P ("label.names.temperature_label.warm", "cálido");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "morado");
   P ("label.names.hue_family_label.yellow", "amarillo");
   P ("label.names.saturation_label.muted", "apagado");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "saturado");
   P ("label.names.nearest_color_name.maroon", "granate");
   P ("label.names.nearest_color_name.purple", "púrpura");
   P ("label.names.hue_family_label.orange", "naranja");
   P ("label.names.nearest_color_name.olive", "oliva");
   P ("label.names.nearest_color_name.gray", "gris");
   P ("label.names.saturation_label.desaturated", "desaturado");
   P ("label.names.nearest_color_name.silver", "plateado");
   P ("label.names.chroma_label.pastel", "pastel");
   P ("label.models.brightness_label.very_light", "muy claro");
   P ("label.names.nearest_color_name.fuchsia", "fucsia");
   P ("label.names.nearest_color_name.yellow", "amarillo");
   P ("label.names.nearest_color_name.red", "rojo");
   P ("label.names.nearest_color_name.orange", "naranja");
   P ("label.names.nearest_color_name.white", "blanco");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number}, contraste bajo");
   P ("label.contrast.readability_label.low_readability", "legibilidad baja");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, insuficiente, texto oscuro sobre fondo claro");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number}, contraste bajo");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, insuficiente, texto oscuro sobre fondo claro");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "acromatopsia: riesgo de confusión moderado");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number} %, diferencia fuerte");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contraste bajo tras la composición alfa");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, insuficiente, texto claro sobre fondo oscuro");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, insuficiente, texto claro sobre fondo oscuro");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopía: riesgo de confusión alto");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number}, contraste para texto grande");
   P ("label.contrast.readability_label.readable_for_large_text_only", "legible solo para texto grande");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, texto grande, texto claro sobre fondo oscuro");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number}, contraste para texto grande");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, texto grande, texto claro sobre fondo oscuro");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopía: riesgo de confusión alto");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contraste para texto grande tras la composición "
      & "alfa");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, solo elementos no textuales, texto claro sobre fondo "
      & "oscuro");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, solo elementos no textuales, texto claro sobre fondo "
      & "oscuro");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopía: riesgo de confusión moderado");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number}, contraste bajo");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number}, contraste bajo");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, solo elementos no textuales, texto oscuro sobre fondo "
      & "claro");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, solo elementos no textuales, texto oscuro sobre fondo "
      & "claro");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopía: riesgo de confusión moderado");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopía: riesgo de confusión alto");
   P ("label.models.color_difference_label.n_very_different", "{v1, number} %, muy diferente");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "acromatopsia: riesgo de confusión alto");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "acromatopsia: riesgo de confusión bajo");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, contraste bajo tras la composición alfa");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number}, contraste para texto normal");
   P ("label.contrast.readability_label.readable_for_normal_text", "legible para texto normal");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, texto de cuerpo, texto claro sobre fondo oscuro");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number}, contraste para texto normal");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, texto de cuerpo, texto claro sobre fondo oscuro");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, texto grande, texto oscuro sobre fondo claro");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, texto grande, texto oscuro sobre fondo claro");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number} %, diferencia sutil");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, texto de cuerpo, texto oscuro sobre fondo claro");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, texto de cuerpo, texto oscuro sobre fondo claro");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopía: riesgo de confusión bajo");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number} %, diferencia apreciable");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, contraste para texto grande");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, contraste para texto grande");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopía: riesgo de confusión bajo");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number}, contraste mejorado");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "legible con contraste mejorado");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number}, contraste mejorado");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, diferencia perceptual sutil");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopía: colores distinguibles");
end Labels_3;
