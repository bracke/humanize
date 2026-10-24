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
      "{waiting, select, false {approvato da {approver}} other {in attesa "
      & "dell’approvazione di {approver}}}");
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
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {trasparente} mostly_transparent "
      & "{quasi trasparente} translucent {traslucido} mostly_opaque {quasi "
      & "opaco} other {opaco}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {nessuna osservazione} one {{count, number} "
      & "osservazione, min {minimum} {unit}, mediana {median} {unit}, max "
      & "{maximum} {unit}} many {{count, number} di osservazioni, min {minimum} "
      & "{unit}, mediana {median} {unit}, max {maximum} {unit}} other {{count, "
      & "number} osservazioni, min {minimum} {unit}, mediana {median} {unit}, "
      & "max {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {nessuna osservazione} other "
      & "{0 valori anomali su {total, plural, one {{total, number} "
      & "osservazione} many {{total, number} di osservazioni} other {{total, "
      & "number} osservazioni}}}}} one {{outliers, number} valore anomalo su "
      & "{total, plural, one {{total, number} osservazione} many {{total, "
      & "number} di osservazioni} other {{total, number} osservazioni}}} many "
      & "{{outliers, number} di valori anomali su {total, plural, one {{total, "
      & "number} osservazione} many {{total, number} di osservazioni} other "
      & "{{total, number} osservazioni}}} other {{outliers, number} valori "
      & "anomali su {total, plural, one {{total, number} osservazione} many "
      & "{{total, number} di osservazioni} other {{total, number} "
      & "osservazioni}}}}");
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} oltre la capacità} other "
      & "{{count, number} di {total, number} {unit} rimanenti}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {quota superata di {count, number} {unit} "
      & "({percent} utilizzato)} near {quota vicina al limite: {count, number} "
      & "{unit} rimanenti ({percent} utilizzato)} other {quota disponibile: "
      & "{count, number} {unit} rimanenti ({percent} utilizzato)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {percentuale di hit della cache non disponibile: "
      & "nessuna richiesta} other {percentuale di hit della cache {percent}: "
      & "{hits, number} hit, {misses, number} miss}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {{count, number} attributo} many {{count, number} "
      & "di attributi} other {{count, number} attributi}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {{count, number} attributo data} many {{count, "
      & "number} di attributi data} other {{count, number} attributi data}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {{count, number} attributo ARIA} many {{count, "
      & "number} di attributi ARIA} other {{count, number} attributi ARIA}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {{count, number} gestore di eventi} many {{count, "
      & "number} di gestori di eventi} other {{count, number} gestori di "
      & "eventi}}");
   P ("label.markup.heading_label", "intestazione di livello {level, number}");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {{count, number} tag} many {{count, number} di "
      & "tag} other {{count, number} tag}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {{count, number} collegamento} many {{count, "
      & "number} di collegamenti} other {{count, number} collegamenti}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} elemento multimediale} many "
      & "{{count, number} di elementi multimediali} other {{count, number} "
      & "elementi multimediali}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} controllo del modulo} many "
      & "{{count, number} di controlli del modulo} other {{count, number} "
      & "controlli del modulo}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {{count, number} intestazione} many {{count, "
      & "number} di intestazioni} other {{count, number} intestazioni}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {{count, number} punto di riferimento} many "
      & "{{count, number} di punti di riferimento} other {{count, number} punti "
      & "di riferimento}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {{count, number} modulo} many {{count, number} di "
      & "moduli} other {{count, number} moduli}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} elemento multimediale} many "
      & "{{count, number} di elementi multimediali} other {{count, number} "
      & "elementi multimediali}}");
   P ("label.markup.table_navigation_label",
      "{caption} riga {row, number} di {rows, number}, colonna {column, "
      & "number} di {columns, number}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} segreto} many {{count, number} di "
      & "segreti} other {{count, number} segreti}}");
   P ("label.secrets.secret_count_label.masked",
      "{count, plural, one {{count, number} mascherato} many {{count, number} "
      & "mascherati} other {{count, number} mascherati}}");
   P ("label.secrets.secret_count_label.unset",
      "{count, plural, one {{count, number} non impostato} many {{count, "
      & "number} non impostati} other {{count, number} non impostati}}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} impronta} many {{count, number} "
      & "di impronte} other {{count, number} impronte}}");
   P ("label.schema.type_mismatch_label",
      "campo {field_name}: previsto {expected, select, string_field {stringa} "
      & "integer_field {intero} decimal_field {decimale} boolean_field "
      & "{booleano} date_field {data} date_time_field {data e ora} object_field "
      & "{oggetto} array_field {array} enum_field {enumerazione} binary_field "
      & "{binario} null_field {null} any_field {qualsiasi} other "
      & "{sconosciuto}}, ricevuto {actual, select, string_field {stringa} "
      & "integer_field {intero} decimal_field {decimale} boolean_field "
      & "{booleano} date_field {data} date_time_field {data e ora} object_field "
      & "{oggetto} array_field {array} enum_field {enumerazione} binary_field "
      & "{binario} null_field {null} any_field {qualsiasi} other {sconosciuto}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} problema bloccante} many {{blocking, number} di problemi "
      & "bloccanti} other {{blocking, number} problemi bloccanti}}} blocking "
      & "{{base}, {blocking, plural, one {{blocking, number} problema "
      & "bloccante} many {{blocking, number} di problemi bloccanti} other "
      & "{{blocking, number} problemi bloccanti}}} only {solo {base}} other "
      & "{{base}}}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {intervallo obiettivo da {low} a "
      & "{high}} other {finestra obiettivo da {low} a {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} entro l’intervallo previsto} below "
      & "{{value} sotto l’intervallo previsto} other {{value} sopra "
      & "l’intervallo previsto}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} alla soglia critica} warning "
      & "{{value} alla soglia di avviso} other {{value} nell’intervallo "
      & "normale}}");
   P ("label.thresholds.breach_label", "{state, select, ok {non superata} other {superata di {difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {obiettivo raggiunto} below {{difference} sotto "
      & "l’obiettivo} other {{difference} sopra l’obiettivo}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {limite superato} near {vicino al limite, "
      & "{distance} rimanenti} other {a {distance} dal limite}}");
   P ("label.thresholds.threshold_summary_label.none", "nessuna metrica");
   P ("label.thresholds.threshold_summary_label.normal",
      "{count, plural, one {{count, number} normale} many {{count, number} "
      & "normali} other {{count, number} normali}}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {{count, number} avviso} many {{count, number} di "
      & "avvisi} other {{count, number} avvisi}}");
   P ("label.thresholds.threshold_summary_label.critical",
      "{count, plural, one {{count, number} critica} many {{count, number} "
      & "critiche} other {{count, number} critiche}}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {{count, number} superamento} many {{count, "
      & "number} di superamenti} other {{count, number} superamenti}}");
   P ("label.thresholds.target_window_label", "obiettivo {target} più/meno {tolerance}");
   P ("label.thresholds.tolerance_label", "tolleranza {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} del limite");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {limite superato di {amount}} other {{amount} "
      & "rimanenti}}");
   P ("label.thresholds.budget_used_label", "{used} utilizzati su {budget}");
   P ("label.workflows.step_label", "passaggio {current, number} di {total, number}: {name}");
   P ("label.workflows.milestone_label",
      "{current, number} di {total, plural, one {{total, number} milestone "
      & "completata} many {{total, number} di milestone completate} other "
      & "{{total, number} milestone completate}}: {name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {nessun elemento del flusso di lavoro} half "
      & "{flusso di lavoro a metà} other {{completed, number} di {total, "
      & "number} completati}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {posizione {position, number} in coda} other "
      & "{posizione {position, number} di {total, number} in coda}}");
   P ("label.changes.change_set_label.none", "nessuna modifica");
   P ("label.changes.change_set_label.added",
      "{count, plural, one {{count, number} aggiunto} many {{count, number} "
      & "aggiunti} other {{count, number} aggiunti}}");
   P ("label.changes.change_set_label.removed",
      "{count, plural, one {{count, number} rimosso} many {{count, number} "
      & "rimossi} other {{count, number} rimossi}}");
   P ("label.changes.change_set_label.modified",
      "{count, plural, one {{count, number} modificato} many {{count, number} "
      & "modificati} other {{count, number} modificati}}");
   P ("label.changes.change_set_label.unchanged",
      "{count, plural, one {{count, number} invariato} many {{count, number} "
      & "invariati} other {{count, number} invariati}}");
   P ("label.changes.sync_change_label.none", "nessuna modifica di sincronizzazione");
   P ("label.changes.sync_change_label.uploaded",
      "{count, plural, one {{count, number} caricato} many {{count, number} "
      & "caricati} other {{count, number} caricati}}");
   P ("label.changes.sync_change_label.downloaded",
      "{count, plural, one {{count, number} scaricato} many {{count, number} "
      & "scaricati} other {{count, number} scaricati}}");
   P ("label.changes.sync_change_label.deleted",
      "{count, plural, one {{count, number} eliminato} many {{count, number} "
      & "eliminati} other {{count, number} eliminati}}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} conflitto} many {{count, number} "
      & "di conflitti} other {{count, number} conflitti}}");
   P ("label.changes.net_change_label",
      "{state, select, none {nessuna variazione netta} up {variazione netta: "
      & "+{count, plural, one {{count, number} elemento} many {{count, number} "
      & "di elementi} other {{count, number} elementi}}} other {variazione "
      & "netta: -{count, plural, one {{count, number} elemento} many {{count, "
      & "number} di elementi} other {{count, number} elementi}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {nessuna modifica da revisionare} all {tutte le "
      & "modifiche revisionate} other {{reviewed, number} di {total, number} "
      & "modifiche revisionate}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name}: invariato ({new_value})} up "
      & "{{field_name}: aumentato da {old_value} a {new_value}} other "
      & "{{field_name}: diminuito da {old_value} a {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {nessuna riga selezionabile} none {nessuna "
      & "riga selezionata} all {{total, plural, one {{total, number} riga "
      & "selezionata} many {tutte le {total, number} di righe selezionate} "
      & "other {tutte le {total, number} righe selezionate}}} other {{selected, "
      & "number} di {total, plural, one {{total, number} riga selezionata} many "
      & "{{total, number} di righe selezionate} other {{total, number} righe "
      & "selezionate}}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {nessuna pagina} other {{pages, plural, =0 {nessuna "
      & "pagina} other {{rows, plural, =0 {pagina {page, number} di {pages, "
      & "number}} one {pagina {page, number} di {pages, number}, {rows, number} "
      & "riga} many {pagina {page, number} di {pages, number}, {rows, number} "
      & "di righe} other {pagina {page, number} di {pages, number}, {rows, "
      & "number} righe}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {nessuna riga} none {nessuna riga "
      & "corrispondente} all {{total, plural, one {{total, number} riga "
      & "visibile} many {tutte le {total, number} di righe visibili} other "
      & "{tutte le {total, number} righe visibili}}} other {{visible, number} "
      & "di {total, plural, one {{total, number} riga visibile} many {{total, "
      & "number} di righe visibili} other {{total, number} righe visibili}}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {nessuna riga} single {riga {first_row, number} "
      & "di {total, number}} other {righe {first_row, number}-{last_row, "
      & "number} di {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {nessun limite di caratteri} none_left "
      & "{nessun carattere rimanente} left {{count, plural, one {{count, "
      & "number} carattere rimanente} many {{count, number} di caratteri "
      & "rimanenti} other {{count, number} caratteri rimanenti}}} other "
      & "{{count, plural, one {{count, number} carattere oltre il limite} many "
      & "{{count, number} di caratteri oltre il limite} other {{count, number} "
      & "caratteri oltre il limite}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {nessun campo obbligatorio} one {{missing, plural, "
      & "=0 {tutti i campi obbligatori compilati} other {manca 1 campo "
      & "obbligatorio su 1}}} other {{missing, plural, =0 {tutti i campi "
      & "obbligatori compilati} one {manca {missing, number} campo obbligatorio "
      & "su {total, number}} many {mancano {missing, number} di campi "
      & "obbligatori su {total, number}} other {mancano {missing, number} campi "
      & "obbligatori su {total, number}}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {nessun campo} all {tutti i campi compilati} "
      & "other {{completed, number} di {total, plural, one {{total, number} "
      & "campo compilato} many {{total, number} di campi compilati} other "
      & "{{total, number} campi compilati}}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: nessun campo} all {{name}: tutti i campi "
      & "compilati} other {{name}: {completed, number} di {total, plural, one "
      & "{{total, number} campo compilato} many {{total, number} di campi "
      & "compilati} other {{total, number} campi compilati}}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {nessun passaggio del modulo} one {passaggio 1 di "
      & "1: {name}} other {passaggio {current, number} di {total, number}: "
      & "{name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {nessun percorso di navigazione} one {percorso di "
      & "navigazione 1 di 1: {name}} other {percorso di navigazione {current, "
      & "number} di {total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {nessuna scheda} one {scheda 1 di 1: {name}} other "
      & "{scheda {current, number} di {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {posta in arrivo vuota} one {{unread, plural, =0 "
      & "{tutte le notifiche lette} other {1 notifica non letta su 1}}} other "
      & "{{unread, plural, =0 {tutte le notifiche lette} one {1 non letta su "
      & "{total, plural, many {{total, number} di notifiche} other {{total, "
      & "number} notifiche}}} other {{unread, number} non lette su {total, "
      & "plural, many {{total, number} di notifiche} other {{total, number} "
      & "notifiche}}}}}}");
   P ("label.notifications.delivery_attempt_label",
      "tentativo di consegna {attempt, number} di {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {nessun elemento nell’elenco di controllo} one "
      & "{{done, plural, =0 {0 di 1 elemento completato} other {1 di 1 elemento "
      & "completato}}} other {{done, number} di {total, number} elementi "
      & "completati}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {nessun caricamento} one {{done, plural, =0 {0 di 1 "
      & "caricamento completato} other {1 di 1 caricamento completato}}} other "
      & "{{done, number} di {total, number} caricamenti completati}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {nessun posto disponibile} one {{reserved, "
      & "plural, =0 {0 di 1 posto prenotato} other {1 di 1 posto prenotato}}} "
      & "other {{reserved, number} di {capacity, number} posti prenotati}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {posizione {position, number} in lista d’attesa} "
      & "other {posizione {position, number} di {total, number} in lista "
      & "d’attesa}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} modificati} other {{name}: {changed, plural, one {{changed, "
      & "number} modificato} many {{changed, number} modificati} other "
      & "{{changed, number} modificati}}, {unchanged, plural, one {{unchanged, "
      & "number} invariato} many {{unchanged, number} invariati} other "
      & "{{unchanged, number} invariati}}, {total, number} in totale}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "il primo piano attuale soddisfa il contrasto di {v1}:{v2, number} "
      & "(testo grande)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "il primo piano attuale soddisfa il contrasto di {v1}:{v2, number} "
      & "(testo normale)");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "usa {v1} per un contrasto di {v2, number}:{v3, number} (livello "
      & "avanzato)");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "usa {v1} per un contrasto di {v2, number}:{v3, number} (testo grande)");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "usa {v1} per un contrasto di {v2}:{v3, number} (testo normale)");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "usa {v1} per un contrasto di {v2}:{v3, number} (testo grande)");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "usa {v1} per un contrasto di {v2}:{v3, number} (livello avanzato)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "il primo piano attuale soddisfa il contrasto di {v1, number}:{v2, "
      & "number} (testo grande)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "il primo piano attuale soddisfa il contrasto di {v1, number}:{v2, "
      & "number} (testo normale)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "il primo piano attuale soddisfa il contrasto di {v1}:{v2, number} "
      & "(livello avanzato)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "il primo piano attuale soddisfa il contrasto di {v1, number}:{v2, "
      & "number} (livello avanzato)");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopia: rischio di confusione basso, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopia: rischio di confusione moderato, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopia: rischio di confusione moderato, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "acromatopsia: rischio di confusione alto, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, differenza percettiva drastica");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, differenza percettiva drastica");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 tessile delta {v1}, differenza percettiva drastica");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, differenza percettiva drastica");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, differenza percettiva ampia");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopia: rischio di confusione moderato, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, differenza percettiva drastica");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, differenza percettiva drastica");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, differenza percettiva drastica");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "acromatopsia: rischio di confusione basso, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopia: colori distinguibili, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopia: colori distinguibili, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopia: colori distinguibili, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "acromatopsia: colori distinguibili, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "acromatopsia: rischio di confusione moderato, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, differenza percettiva ampia");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, differenza percettiva ampia");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 tessile delta {v1}, differenza percettiva ampia");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, differenza percettiva ampia");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, differenza percettiva evidente");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopia: rischio di confusione alto, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopia: rischio di confusione alto, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, differenza percettiva evidente");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 tessile delta {v1}, differenza percettiva evidente");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, differenza percettiva evidente");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, differenza percettiva evidente");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopia: rischio di confusione basso, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopia: rischio di confusione basso, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, differenza percettiva ampia");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopia: rischio di confusione alto, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, differenza percettiva drastica");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 tessile delta {v1, number}, differenza percettiva drastica");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, differenza percettiva drastica");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, differenza percettiva ampia");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 tessile delta {v1, number}, differenza percettiva ampia");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, differenza percettiva ampia");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, differenza percettiva evidente");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 tessile delta {v1}, differenza percettiva sottile");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, differenza percettiva evidente");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 tessile delta {v1, number}, differenza percettiva evidente");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, appena percettibile");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, impercettibile");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 tessile delta {v1}, impercettibile");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, impercettibile");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, impercettibile");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, differenza percettiva ampia");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, impercettibile");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, impercettibile");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 tessile delta {v1, number}, impercettibile");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, impercettibile");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, impercettibile");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, differenza percettiva sottile");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, differenza percettiva sottile");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, differenza percettiva sottile");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, appena percettibile");
   P ("label.metrics.text_summary.n_words",
      "{v1, plural, one {{v1, number} parola} many {{v1, number} di parole} "
      & "other {{v1, number} parole}}");
   P ("label.metrics.text_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} paragrafo} many {{v1, number} di "
      & "paragrafi} other {{v1, number} paragrafi}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "{v1, plural, one {{v1, number} minuto di parlato} many {{v1, number} "
      & "di minuti di parlato} other {{v1, number} minuti di parlato}}");
   P ("label.metrics.text_summary.n_sentences",
      "{v1, plural, one {{v1, number} frase} many {{v1, number} di frasi} "
      & "other {{v1, number} frasi}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "{v1, plural, one {{v1, number} minuto di lettura} many {{v1, number} "
      & "di minuti di lettura} other {{v1, number} minuti di lettura}}");
   P ("label.metrics.text_summary.n_paragraph",
      "{v1, plural, one {{v1, number} paragrafo} many {{v1, number} di "
      & "paragrafi} other {{v1, number} paragrafi}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "{v1, plural, =1 {meno di un minuto di parlato} other {meno di {v1, "
      & "number} minuti di parlato}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "{v1, plural, =1 {meno di un minuto di lettura} other {meno di {v1, "
      & "number} minuti di lettura}}");
   P ("label.metrics.text_summary.n_sentence",
      "{v1, plural, one {{v1, number} frase} many {{v1, number} di frasi} "
      & "other {{v1, number} frasi}}");
   P ("label.metrics.text_summary.no_words", "nessuna parola");
   P ("label.metrics.text_summary.no_paragraphs", "nessun paragrafo");
   P ("label.metrics.text_summary.no_sentences", "nessuna frase");
   P ("label.metrics.text_summary.n_word",
      "{v1, plural, one {{v1, number} parola} many {{v1, number} di parole} "
      & "other {{v1, number} parole}}");
   P ("label.names.hue_family_label.neutral", "neutro");
   P ("label.names.saturation_label.neutral", "neutro");
   P ("label.names.temperature_label.neutral_temperature", "temperatura neutra");
   P ("label.names.chroma_label.grayish", "grigiastro");
   P ("label.names.nearest_color_name.black", "nero");
   P ("label.models.brightness_label.very_dark", "molto scuro");
   P ("label.names.hue_family_label.blue", "blu");
   P ("label.names.saturation_label.vivid", "vivace");
   P ("label.names.temperature_label.cool", "freddo");
   P ("label.names.chroma_label.moderate_chroma", "croma moderata");
   P ("label.names.nearest_color_name.navy", "blu marino");
   P ("label.names.chroma_label.high_chroma", "croma elevata");
   P ("label.names.nearest_color_name.blue", "blu");
   P ("label.names.hue_family_label.green", "verde");
   P ("label.names.temperature_label.balanced_temperature", "temperatura bilanciata");
   P ("label.names.hue_family_label.cyan", "ciano");
   P ("label.names.chroma_label.soft", "tenue");
   P ("label.models.brightness_label.dark", "scuro");
   P ("label.names.nearest_color_name.green", "verde");
   P ("label.names.nearest_color_name.teal", "verde petrolio");
   P ("label.models.brightness_label.medium_brightness", "luminosità media");
   P ("label.names.nearest_color_name.aqua", "acqua");
   P ("label.names.nearest_color_name.lime", "lime");
   P ("label.models.brightness_label.light", "chiaro");
   P ("label.names.hue_family_label.red", "rosso");
   P ("label.names.temperature_label.warm", "caldo");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "viola");
   P ("label.names.hue_family_label.yellow", "giallo");
   P ("label.names.saturation_label.muted", "spento");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "saturo");
   P ("label.names.nearest_color_name.maroon", "bordeaux");
   P ("label.names.nearest_color_name.purple", "porpora");
   P ("label.names.hue_family_label.orange", "arancione");
   P ("label.names.nearest_color_name.olive", "oliva");
   P ("label.names.nearest_color_name.gray", "grigio");
   P ("label.names.saturation_label.desaturated", "desaturato");
   P ("label.names.nearest_color_name.silver", "argento");
   P ("label.names.chroma_label.pastel", "pastello");
   P ("label.models.brightness_label.very_light", "molto chiaro");
   P ("label.names.nearest_color_name.fuchsia", "fucsia");
   P ("label.names.nearest_color_name.yellow", "giallo");
   P ("label.names.nearest_color_name.red", "rosso");
   P ("label.names.nearest_color_name.orange", "arancione");
   P ("label.names.nearest_color_name.white", "bianco");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number}, contrasto basso");
   P ("label.contrast.readability_label.low_readability", "leggibilità bassa");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, insufficiente, testo scuro su sfondo chiaro");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number}, contrasto basso");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, insufficiente, testo scuro su sfondo chiaro");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "acromatopsia: rischio di confusione moderato");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}%, differenza forte");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contrasto basso dopo la composizione alfa");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, insufficiente, testo chiaro su sfondo scuro");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, insufficiente, testo chiaro su sfondo scuro");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopia: rischio di confusione alto");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number}, contrasto per testo grande");
   P ("label.contrast.readability_label.readable_for_large_text_only", "leggibile solo per testo grande");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, testo grande, testo chiaro su sfondo scuro");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number}, contrasto per testo grande");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, testo grande, testo chiaro su sfondo scuro");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopia: rischio di confusione alto");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contrasto per testo grande dopo la composizione "
      & "alfa");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, solo elementi non testuali, testo chiaro su sfondo "
      & "scuro");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, solo elementi non testuali, testo chiaro su sfondo "
      & "scuro");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopia: rischio di confusione moderato");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number}, contrasto basso");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number}, contrasto basso");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, solo elementi non testuali, testo scuro su sfondo "
      & "chiaro");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, solo elementi non testuali, testo scuro su sfondo "
      & "chiaro");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopia: rischio di confusione moderato");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopia: rischio di confusione alto");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}%, molto diverso");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "acromatopsia: rischio di confusione alto");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "acromatopsia: rischio di confusione basso");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, contrasto basso dopo la composizione alfa");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number}, contrasto per testo normale");
   P ("label.contrast.readability_label.readable_for_normal_text", "leggibile per testo normale");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, testo del corpo, testo chiaro su sfondo scuro");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number}, contrasto per testo normale");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, testo del corpo, testo chiaro su sfondo scuro");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, testo grande, testo scuro su sfondo chiaro");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, testo grande, testo scuro su sfondo chiaro");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}%, differenza sottile");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, testo del corpo, testo scuro su sfondo chiaro");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, testo del corpo, testo scuro su sfondo chiaro");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopia: rischio di confusione basso");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}%, differenza evidente");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, contrasto per testo grande");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, contrasto per testo grande");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopia: rischio di confusione basso");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number}, contrasto avanzato");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "leggibile con contrasto avanzato");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number}, contrasto avanzato");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, differenza percettiva sottile");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopia: colori distinguibili");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, contrasto per testo normale dopo la "
      & "composizione alfa");
end Labels_3;
