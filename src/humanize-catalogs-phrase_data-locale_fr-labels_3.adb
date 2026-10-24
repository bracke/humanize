separate (Humanize.Catalogs.Phrase_Data.Locale_Fr)
procedure Labels_3 is
begin
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {aucune tâche} one {{count, number} tâche} many "
      & "{{count, number} de tâches} other {{count, number} tâches}}");
   P ("label.tasks.task_label",
      "{name} : {state, select, open_task {tâche ouverte} in_progress_task "
      & "{tâche en cours} blocked_task {tâche bloquée} done_task {tâche "
      & "terminée} canceled_task {tâche annulée} deferred_task {tâche "
      & "reportée} other {tâche en retard}}{priority, select, no_priority {} "
      & "low_priority {, priorité basse} medium_priority {, priorité moyenne} "
      & "high_priority {, priorité haute} other {, priorité critique}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {aucune priorité} low_priority "
      & "{priorité basse} medium_priority {priorité moyenne} high_priority "
      & "{priorité haute} other {priorité critique}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {tâche ouverte} in_progress_task {tâche en "
      & "cours} blocked_task {tâche bloquée} done_task {tâche terminée} "
      & "canceled_task {tâche annulée} deferred_task {tâche reportée} other "
      & "{tâche en retard}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {limite supérieure} other {limite "
      & "inférieure}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {sous la plage attendue} within_range "
      & "{dans la plage attendue} above_range {au-dessus de la plage attendue} "
      & "below_target {sous l’objectif} at_target {objectif atteint} "
      & "above_target {au-dessus de l’objectif} near_limit {proche de la "
      & "limite} warning_level {seuil d’avertissement} critical_level {seuil "
      & "critique} breached {seuil dépassé} other {état du seuil inconnu}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {à jour} one {{ahead, number} "
      & "commit d’avance} many {{ahead, number} de commits d’avance} other "
      & "{{ahead, number} commits d’avance}}} other {{ahead, plural, =0 "
      & "{{behind, plural, one {{behind, number} commit de retard} many "
      & "{{behind, number} de commits de retard} other {{behind, number} "
      & "commits de retard}}} other {{ahead, plural, one {{ahead, number} "
      & "commit d’avance} many {{ahead, number} de commits d’avance} other "
      & "{{ahead, number} commits d’avance}}, {behind, plural, one {{behind, "
      & "number} commit de retard} many {{behind, number} de commits de retard} "
      & "other {{behind, number} commits de retard}}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {approuvé par {approver}} other {en attente "
      & "de l’approbation de {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {tentative {attempt, "
      & "number} sur {limit, number}} other {tentative {attempt, number} sur "
      & "{limit, number} (limite dépassée)}}} other {tentative {attempt, "
      & "number} sur {limit, number}}}");
   P ("label.workflows.blocker_label", "blocage : {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {aucune dépendance bloquante} one {{count, number} "
      & "dépendance bloquante} many {{count, number} de dépendances "
      & "bloquantes} other {{count, number} dépendances bloquantes}}");
   P ("label.workflows.handoff_label", "transfert de {from} à {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {jalon à venir} current_milestone "
      & "{jalon en cours} complete_milestone {jalon atteint} missed_milestone "
      & "{jalon manqué} other {jalon bloqué}}");
   P ("label.workflows.milestone_status_label",
      "{name} : {state, select, upcoming_milestone {à venir} "
      & "current_milestone {en cours} complete_milestone {atteint} "
      & "missed_milestone {manqué} other {bloqué}}");
   P ("label.workflows.next_action_label", "prochaine action : {action}");
   P ("label.workflows.owner_label", "responsable : {owner}");
   P ("label.workflows.resume_label", "reprendre {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {en attente} active_step {active} "
      & "waiting_step {en suspens} blocked_step {bloquée} done_step "
      & "{terminée} failed_step {en échec} other {ignorée}}");
   P ("label.workflows.step_status_label",
      "{name} : {state, select, pending_step {en attente} active_step "
      & "{active} waiting_step {en suspens} blocked_step {bloquée} done_step "
      & "{terminée} failed_step {en échec} other {ignorée}}");
   P ("label.workflows.waiting_label", "en attente de {reason}");
   P ("label.workflows.workflow_result_label",
      "{name} : {state, select, not_started_state {non démarré} "
      & "in_progress_state {en cours} waiting_state {en attente} "
      & "waiting_approval_state {en attente d’approbation} blocked_state "
      & "{bloqué} completed_state {terminé} failed_state {en échec} "
      & "cancelled_state {annulé} skipped_state {ignoré} other {en pause}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {non démarré} in_progress_state "
      & "{en cours} waiting_state {en attente} waiting_approval_state {en "
      & "attente d’approbation} blocked_state {bloqué} completed_state "
      & "{terminé} failed_state {en échec} cancelled_state {annulé} "
      & "skipped_state {ignoré} other {en pause}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {transparent} mostly_transparent "
      & "{plutôt transparent} translucent {translucide} mostly_opaque {plutôt "
      & "opaque} other {opaque}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {aucune observation} one {{count, number} "
      & "observation, min {minimum} {unit}, médiane {median} {unit}, max "
      & "{maximum} {unit}} many {{count, number} d’observations, min "
      & "{minimum} {unit}, médiane {median} {unit}, max {maximum} {unit}} "
      & "other {{count, number} observations, min {minimum} {unit}, médiane "
      & "{median} {unit}, max {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {aucune observation} other "
      & "{aucune valeur aberrante sur {total, plural, one {{total, number} "
      & "observation} many {{total, number} d’observations} other {{total, "
      & "number} observations}}}}} one {{outliers, number} valeur aberrante sur "
      & "{total, plural, one {{total, number} observation} many {{total, "
      & "number} d’observations} other {{total, number} observations}}} other "
      & "{{outliers, number} valeurs aberrantes sur {total, plural, one "
      & "{{total, number} observation} many {{total, number} d’observations} "
      & "other {{total, number} observations}}}}");
   P ("label.resources.remaining_label",
      "{state, select, over {capacité dépassée de {count, number} {unit}} "
      & "other {il reste {count, number} {unit} sur {total, number}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {quota dépassé de {count, number} {unit} "
      & "({percent} d’utilisation)} near {quota presque atteint : il reste "
      & "{count, number} {unit} ({percent} d’utilisation)} other {quota "
      & "disponible : il reste {count, number} {unit} ({percent} "
      & "d’utilisation)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {taux de succès du cache indisponible : aucune "
      & "requête} other {taux de succès du cache {percent} : {hits, number} "
      & "succès, {misses, plural, one {{misses, number} échec} many {{misses, "
      & "number} d’échecs} other {{misses, number} échecs}}}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {{count, number} attribut} many {{count, number} "
      & "d’attributs} other {{count, number} attributs}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {{count, number} attribut de données} many "
      & "{{count, number} d’attributs de données} other {{count, number} "
      & "attributs de données}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {{count, number} attribut ARIA} many {{count, "
      & "number} d’attributs ARIA} other {{count, number} attributs ARIA}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {{count, number} gestionnaire d’événements} "
      & "many {{count, number} de gestionnaires d’événements} other "
      & "{{count, number} gestionnaires d’événements}}");
   P ("label.markup.heading_label", "titre de niveau {level, number}");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {{count, number} balise} many {{count, number} de "
      & "balises} other {{count, number} balises}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {{count, number} lien} many {{count, number} de "
      & "liens} other {{count, number} liens}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} élément multimédia} many "
      & "{{count, number} d’éléments multimédias} other {{count, number} "
      & "éléments multimédias}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} contrôle de formulaire} many "
      & "{{count, number} de contrôles de formulaire} other {{count, number} "
      & "contrôles de formulaire}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {{count, number} titre} many {{count, number} de "
      & "titres} other {{count, number} titres}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {{count, number} repère} many {{count, number} de "
      & "repères} other {{count, number} repères}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {{count, number} formulaire} many {{count, number} "
      & "de formulaires} other {{count, number} formulaires}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} élément multimédia} many "
      & "{{count, number} d’éléments multimédias} other {{count, number} "
      & "éléments multimédias}}");
   P ("label.markup.table_navigation_label",
      "{caption} ligne {row, number} sur {rows, number}, colonne {column, "
      & "number} sur {columns, number}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} secret} many {{count, number} de "
      & "secrets} other {{count, number} secrets}}");
   P ("label.secrets.secret_count_label.masked",
      "{count, plural, one {{count, number} masqué} many {{count, number} "
      & "masqués} other {{count, number} masqués}}");
   P ("label.secrets.secret_count_label.unset",
      "{count, plural, one {{count, number} non défini} many {{count, "
      & "number} non définis} other {{count, number} non définis}}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} empreinte} many {{count, number} "
      & "d’empreintes} other {{count, number} empreintes}}");
   P ("label.schema.type_mismatch_label",
      "champ {field_name} : type attendu {expected, select, string_field "
      & "{chaîne} integer_field {entier} decimal_field {décimal} "
      & "boolean_field {booléen} date_field {date} date_time_field "
      & "{date-heure} object_field {objet} array_field {tableau} enum_field "
      & "{énumération} binary_field {binaire} null_field {null} any_field "
      & "{quelconque} other {inconnu}}, type reçu {actual, select, "
      & "string_field {chaîne} integer_field {entier} decimal_field {décimal} "
      & "boolean_field {booléen} date_field {date} date_time_field "
      & "{date-heure} object_field {objet} array_field {tableau} enum_field "
      & "{énumération} binary_field {binaire} null_field {null} any_field "
      & "{quelconque} other {inconnu}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} problème bloquant} many {{blocking, number} de problèmes "
      & "bloquants} other {{blocking, number} problèmes bloquants}}} blocking "
      & "{{base}, {blocking, plural, one {{blocking, number} problème "
      & "bloquant} many {{blocking, number} de problèmes bloquants} other "
      & "{{blocking, number} problèmes bloquants}}} only {{base} uniquement} "
      & "other {{base}}}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {plage cible de {low} à {high}} "
      & "other {fenêtre cible de {low} à {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} dans la plage attendue} below {{value} "
      & "sous la plage attendue} other {{value} au-dessus de la plage "
      & "attendue}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} au seuil critique} warning {{value} "
      & "au seuil d’avertissement} other {{value} dans la plage normale}}");
   P ("label.thresholds.breach_label", "{state, select, ok {non dépassé} other {dépassé de {difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {objectif atteint} below {{difference} sous "
      & "l’objectif} other {{difference} au-dessus de l’objectif}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {limite dépassée} near {proche de la "
      & "limite, il reste {distance}} other {à {distance} de la limite}}");
   P ("label.thresholds.threshold_summary_label.none", "aucune métrique");
   P ("label.thresholds.threshold_summary_label.normal",
      "{count, plural, one {{count, number} normale} many {{count, number} "
      & "normales} other {{count, number} normales}}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {{count, number} avertissement} many {{count, "
      & "number} d’avertissements} other {{count, number} avertissements}}");
   P ("label.thresholds.threshold_summary_label.critical",
      "{count, plural, one {{count, number} critique} many {{count, number} "
      & "critiques} other {{count, number} critiques}}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {{count, number} dépassement} many {{count, "
      & "number} de dépassements} other {{count, number} dépassements}}");
   P ("label.thresholds.target_window_label", "objectif {target} plus ou moins {tolerance}");
   P ("label.thresholds.tolerance_label", "tolérance {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} de la limite");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {limite dépassée de {amount}} other {il "
      & "reste {amount}}}");
   P ("label.thresholds.budget_used_label", "utilisation : {used} sur {budget}");
   P ("label.workflows.step_label", "étape {current, number} sur {total, number} : {name}");
   P ("label.workflows.milestone_label",
      "{current, number} sur {total, plural, one {{total, number} jalon "
      & "atteint} many {{total, number} de jalons atteints} other {{total, "
      & "number} jalons atteints}} : {name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {aucun élément de workflow} half {workflow à "
      & "mi-parcours} other {{completed, number} sur {total, number} "
      & "terminés}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {position {position, number} dans la file} other "
      & "{position {position, number} sur {total, number} dans la file}}");
   P ("label.changes.change_set_label.none", "aucune modification");
   P ("label.changes.change_set_label.added",
      "{count, plural, one {{count, number} ajouté} many {{count, number} "
      & "ajoutés} other {{count, number} ajoutés}}");
   P ("label.changes.change_set_label.removed",
      "{count, plural, one {{count, number} supprimé} many {{count, number} "
      & "supprimés} other {{count, number} supprimés}}");
   P ("label.changes.change_set_label.modified",
      "{count, plural, one {{count, number} modifié} many {{count, number} "
      & "modifiés} other {{count, number} modifiés}}");
   P ("label.changes.change_set_label.unchanged",
      "{count, plural, one {{count, number} inchangé} many {{count, number} "
      & "inchangés} other {{count, number} inchangés}}");
   P ("label.changes.sync_change_label.none", "aucune modification de synchronisation");
   P ("label.changes.sync_change_label.uploaded",
      "{count, plural, one {{count, number} envoyé} many {{count, number} "
      & "envoyés} other {{count, number} envoyés}}");
   P ("label.changes.sync_change_label.downloaded",
      "{count, plural, one {{count, number} téléchargé} many {{count, "
      & "number} téléchargés} other {{count, number} téléchargés}}");
   P ("label.changes.sync_change_label.deleted",
      "{count, plural, one {{count, number} supprimé} many {{count, number} "
      & "supprimés} other {{count, number} supprimés}}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} conflit} many {{count, number} de "
      & "conflits} other {{count, number} conflits}}");
   P ("label.changes.net_change_label",
      "{state, select, none {aucune variation nette} up {variation nette : "
      & "+{count, plural, one {{count, number} élément} many {{count, number} "
      & "d’éléments} other {{count, number} éléments}}} other {variation "
      & "nette : -{count, plural, one {{count, number} élément} many {{count, "
      & "number} d’éléments} other {{count, number} éléments}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {aucune modification à relire} all {toutes les "
      & "modifications relues} other {{reviewed, number} sur {total, number} "
      & "modifications relues}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} stable à {new_value}} up "
      & "{{field_name} en hausse de {old_value} à {new_value}} other "
      & "{{field_name} en baisse de {old_value} à {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {aucune ligne sélectionnable} none {aucune "
      & "ligne sélectionnée} all {{total, plural, one {{total, number} ligne "
      & "sélectionnée} many {les {total, number} de lignes sélectionnées} "
      & "other {les {total, number} lignes sélectionnées}}} other {sélection "
      & ": {selected, number} sur {total, plural, one {{total, number} ligne} "
      & "many {{total, number} de lignes} other {{total, number} lignes}}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {aucune page} other {{pages, plural, =0 {aucune "
      & "page} other {{rows, plural, =0 {page {page, number} sur {pages, "
      & "number}} one {page {page, number} sur {pages, number}, {rows, number} "
      & "ligne} many {page {page, number} sur {pages, number}, {rows, number} "
      & "de lignes} other {page {page, number} sur {pages, number}, {rows, "
      & "number} lignes}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {aucune ligne} none {aucune ligne ne "
      & "correspond} all {{total, plural, one {{total, number} ligne visible} "
      & "many {les {total, number} de lignes visibles} other {les {total, "
      & "number} lignes visibles}}} other {affichage de {visible, number} sur "
      & "{total, plural, one {{total, number} ligne} many {{total, number} de "
      & "lignes} other {{total, number} lignes}}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {aucune ligne} single {ligne {first_row, number} "
      & "sur {total, number}} other {lignes {first_row, number}-{last_row, "
      & "number} sur {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {aucune limite de caractères} none_left "
      & "{aucun caractère restant} left {{count, plural, one {{count, number} "
      & "caractère restant} many {{count, number} de caractères restants} "
      & "other {{count, number} caractères restants}}} other {{count, plural, "
      & "one {{count, number} caractère en trop} many {{count, number} de "
      & "caractères en trop} other {{count, number} caractères en trop}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {aucun champ obligatoire} one {{missing, plural, =0 "
      & "{tous les champs obligatoires remplis} other {1 champ obligatoire "
      & "manquant sur 1}}} other {{missing, plural, =0 {tous les champs "
      & "obligatoires remplis} other {champs obligatoires manquants : {missing, "
      & "number} sur {total, number}}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {aucun champ} all {tous les champs remplis} other "
      & "{{completed, number} sur {total, plural, one {{total, number} champ "
      & "rempli} many {{total, number} de champs remplis} other {{total, "
      & "number} champs remplis}}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name} : aucun champ} all {{name} : tous les "
      & "champs remplis} other {{name} : {completed, number} sur {total, "
      & "plural, one {{total, number} champ rempli} many {{total, number} de "
      & "champs remplis} other {{total, number} champs remplis}}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {aucune étape de formulaire} one {étape 1 sur 1 : "
      & "{name}} other {étape {current, number} sur {total, number} : {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {aucun fil d’Ariane} one {fil d’Ariane, "
      & "élément 1 sur 1 : {name}} other {fil d’Ariane, élément {current, "
      & "number} sur {total, number} : {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {aucun onglet} one {onglet 1 sur 1 : {name}} other "
      & "{onglet {current, number} sur {total, number} : {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {boîte de réception vide} one {{unread, plural, "
      & "=0 {toutes les notifications lues} other {1 notification non lue sur "
      & "1}}} other {{unread, plural, =0 {toutes les notifications lues} one "
      & "{{unread, number} non lue sur {total, number} notifications} other "
      & "{{unread, number} non lues sur {total, number} notifications}}}}");
   P ("label.notifications.delivery_attempt_label",
      "tentative d’envoi {attempt, number} sur {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {aucun élément de liste de contrôle} one {{done, "
      & "plural, =0 {0 sur 1 élément terminé} other {1 sur 1 élément "
      & "terminé}}} other {{done, number} sur {total, number} éléments "
      & "terminés}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {aucun téléversement} one {{done, plural, =0 {0 "
      & "sur 1 téléversement terminé} other {1 sur 1 téléversement "
      & "terminé}}} other {{done, number} sur {total, number} téléversements "
      & "terminés}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {aucune place} one {{reserved, plural, =0 {0 sur "
      & "1 place réservée} other {1 sur 1 place réservée}}} other "
      & "{{reserved, number} sur {capacity, number} places réservées}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {liste d’attente : position {position, number}} "
      & "other {liste d’attente : position {position, number} sur {total, "
      & "number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} modifiés} other {{name} : {changed, plural, one {{changed, "
      & "number} modifié} many {{changed, number} modifiés} other {{changed, "
      & "number} modifiés}}, {unchanged, plural, one {{unchanged, number} "
      & "inchangé} many {{unchanged, number} inchangés} other {{unchanged, "
      & "number} inchangés}}, {total, number} au total}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility} ; {roles}");
   P ("label.groups", "{first} ; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "le premier plan actuel respecte le contraste de {v1}:{v2, number} "
      & "(grand texte)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "le premier plan actuel respecte le contraste de {v1}:{v2, number} "
      & "(texte normal)");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "utiliser {v1} pour un contraste de {v2, number}:{v3, number} (niveau "
      & "renforcé)");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "utiliser {v1} pour un contraste de {v2, number}:{v3, number} (grand "
      & "texte)");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "utiliser {v1} pour un contraste de {v2}:{v3, number} (texte normal)");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "utiliser {v1} pour un contraste de {v2}:{v3, number} (grand texte)");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "utiliser {v1} pour un contraste de {v2}:{v3, number} (niveau "
      & "renforcé)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "le premier plan actuel respecte le contraste de {v1, number}:{v2, "
      & "number} (grand texte)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "le premier plan actuel respecte le contraste de {v1, number}:{v2, "
      & "number} (texte normal)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "le premier plan actuel respecte le contraste de {v1}:{v2, number} "
      & "(niveau renforcé)");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "le premier plan actuel respecte le contraste de {v1, number}:{v2, "
      & "number} (niveau renforcé)");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopie : risque de confusion faible, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deutéranopie : risque de confusion modéré, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopie : risque de confusion modéré, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "achromatopsie : risque de confusion élevé, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, différence perceptuelle considérable");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, différence perceptuelle considérable");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 textile delta {v1}, différence perceptuelle considérable");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, différence perceptuelle considérable");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, différence perceptuelle importante");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopie : risque de confusion modéré, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, différence perceptuelle considérable");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, différence perceptuelle considérable");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, différence perceptuelle considérable");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "achromatopsie : risque de confusion faible, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopie : couleurs distinctes, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deutéranopie : couleurs distinctes, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopie : couleurs distinctes, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "achromatopsie : couleurs distinctes, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "achromatopsie : risque de confusion modéré, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, différence perceptuelle importante");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, différence perceptuelle importante");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 textile delta {v1}, différence perceptuelle importante");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, différence perceptuelle importante");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, différence perceptuelle notable");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopie : risque de confusion élevé, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopie : risque de confusion élevé, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, différence perceptuelle notable");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 textile delta {v1}, différence perceptuelle notable");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, différence perceptuelle notable");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, différence perceptuelle notable");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopie : risque de confusion faible, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deutéranopie : risque de confusion faible, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, différence perceptuelle importante");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deutéranopie : risque de confusion élevé, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, différence perceptuelle considérable");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 textile delta {v1, number}, différence perceptuelle "
      & "considérable");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, différence perceptuelle considérable");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, différence perceptuelle importante");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 textile delta {v1, number}, différence perceptuelle importante");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, différence perceptuelle importante");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, différence perceptuelle notable");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 textile delta {v1}, différence perceptuelle subtile");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, différence perceptuelle notable");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 textile delta {v1, number}, différence perceptuelle notable");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, à peine perceptible");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, imperceptible");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 textile delta {v1}, imperceptible");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, imperceptible");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, imperceptible");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, différence perceptuelle importante");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 textile delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, imperceptible");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, différence perceptuelle subtile");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, différence perceptuelle subtile");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, différence perceptuelle subtile");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, à peine perceptible");
   P ("label.metrics.text_summary.n_words",
      "{v1, plural, one {{v1, number} mot} many {{v1, number} de mots} other "
      & "{{v1, number} mots}}");
   P ("label.metrics.text_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} paragraphe} many {{v1, number} de "
      & "paragraphes} other {{v1, number} paragraphes}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "{v1, plural, one {{v1, number} minute de parole} many {{v1, number} de "
      & "minutes de parole} other {{v1, number} minutes de parole}}");
   P ("label.metrics.text_summary.n_sentences",
      "{v1, plural, one {{v1, number} phrase} many {{v1, number} de phrases} "
      & "other {{v1, number} phrases}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "{v1, plural, one {{v1, number} minute de lecture} many {{v1, number} "
      & "de minutes de lecture} other {{v1, number} minutes de lecture}}");
   P ("label.metrics.text_summary.n_paragraph",
      "{v1, plural, one {{v1, number} paragraphe} many {{v1, number} de "
      & "paragraphes} other {{v1, number} paragraphes}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "{v1, plural, =1 {moins d’une minute de parole} other {moins de {v1, "
      & "number} minutes de parole}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "{v1, plural, =1 {moins d’une minute de lecture} other {moins de {v1, "
      & "number} minutes de lecture}}");
   P ("label.metrics.text_summary.n_sentence",
      "{v1, plural, one {{v1, number} phrase} many {{v1, number} de phrases} "
      & "other {{v1, number} phrases}}");
   P ("label.metrics.text_summary.no_words", "aucun mot");
   P ("label.metrics.text_summary.no_paragraphs", "aucun paragraphe");
   P ("label.metrics.text_summary.no_sentences", "aucune phrase");
   P ("label.metrics.text_summary.n_word",
      "{v1, plural, one {{v1, number} mot} many {{v1, number} de mots} other "
      & "{{v1, number} mots}}");
   P ("label.names.hue_family_label.neutral", "neutre");
   P ("label.names.saturation_label.neutral", "neutre");
   P ("label.names.temperature_label.neutral_temperature", "température neutre");
   P ("label.names.chroma_label.grayish", "grisâtre");
   P ("label.names.nearest_color_name.black", "noir");
   P ("label.models.brightness_label.very_dark", "très foncé");
   P ("label.names.hue_family_label.blue", "bleu");
   P ("label.names.saturation_label.vivid", "vif");
   P ("label.names.temperature_label.cool", "froid");
   P ("label.names.chroma_label.moderate_chroma", "chroma modéré");
   P ("label.names.nearest_color_name.navy", "bleu marine");
   P ("label.names.chroma_label.high_chroma", "chroma élevé");
   P ("label.names.nearest_color_name.blue", "bleu");
   P ("label.names.hue_family_label.green", "vert");
   P ("label.names.temperature_label.balanced_temperature", "température équilibrée");
   P ("label.names.hue_family_label.cyan", "cyan");
   P ("label.names.chroma_label.soft", "doux");
   P ("label.models.brightness_label.dark", "foncé");
   P ("label.names.nearest_color_name.green", "vert");
   P ("label.names.nearest_color_name.teal", "bleu sarcelle");
   P ("label.models.brightness_label.medium_brightness", "luminosité moyenne");
   P ("label.names.nearest_color_name.aqua", "aqua");
   P ("label.names.nearest_color_name.lime", "vert citron");
   P ("label.models.brightness_label.light", "clair");
   P ("label.names.hue_family_label.red", "rouge");
   P ("label.names.temperature_label.warm", "chaud");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "violet");
   P ("label.names.hue_family_label.yellow", "jaune");
   P ("label.names.saturation_label.muted", "atténué");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "saturé");
   P ("label.names.nearest_color_name.maroon", "bordeaux");
   P ("label.names.nearest_color_name.purple", "violet");
   P ("label.names.hue_family_label.orange", "orange");
   P ("label.names.nearest_color_name.olive", "olive");
   P ("label.names.nearest_color_name.gray", "gris");
   P ("label.names.saturation_label.desaturated", "désaturé");
   P ("label.names.nearest_color_name.silver", "argent");
   P ("label.names.chroma_label.pastel", "pastel");
   P ("label.models.brightness_label.very_light", "très clair");
   P ("label.names.nearest_color_name.fuchsia", "fuchsia");
   P ("label.names.nearest_color_name.yellow", "jaune");
   P ("label.names.nearest_color_name.red", "rouge");
   P ("label.names.nearest_color_name.orange", "orange");
   P ("label.names.nearest_color_name.white", "blanc");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number}, contraste faible");
   P ("label.contrast.readability_label.low_readability", "lisibilité faible");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, insuffisant, texte foncé sur fond clair");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number}, contraste faible");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, insuffisant, texte foncé sur fond clair");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "achromatopsie : risque de confusion modéré");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number} %, différence forte");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contraste faible après composition alpha");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, insuffisant, texte clair sur fond foncé");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, insuffisant, texte clair sur fond foncé");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deutéranopie : risque de confusion élevé");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number}, contraste pour grand texte");
   P ("label.contrast.readability_label.readable_for_large_text_only", "lisible uniquement en grand texte");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, grand texte, texte clair sur fond foncé");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number}, contraste pour grand texte");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, grand texte, texte clair sur fond foncé");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopie : risque de confusion élevé");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contraste pour grand texte après composition alpha");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, éléments non textuels uniquement, texte clair sur "
      & "fond foncé");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, éléments non textuels uniquement, texte clair sur "
      & "fond foncé");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopie : risque de confusion modéré");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number}, contraste faible");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number}, contraste faible");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, éléments non textuels uniquement, texte foncé sur "
      & "fond clair");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, éléments non textuels uniquement, texte foncé sur "
      & "fond clair");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deutéranopie : risque de confusion modéré");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopie : risque de confusion élevé");
   P ("label.models.color_difference_label.n_very_different", "{v1, number} %, très différent");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "achromatopsie : risque de confusion élevé");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "achromatopsie : risque de confusion faible");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, contraste faible après composition alpha");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number}, contraste pour texte normal");
   P ("label.contrast.readability_label.readable_for_normal_text", "lisible pour le texte normal");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, texte courant, texte clair sur fond foncé");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number}, contraste pour texte normal");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, texte courant, texte clair sur fond foncé");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, grand texte, texte foncé sur fond clair");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, grand texte, texte foncé sur fond clair");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number} %, différence subtile");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, texte courant, texte foncé sur fond clair");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, texte courant, texte foncé sur fond clair");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopie : risque de confusion faible");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number} %, différence notable");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, contraste pour grand texte");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, contraste pour grand texte");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deutéranopie : risque de confusion faible");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number}, contraste renforcé");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "lisible avec contraste renforcé");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number}, contraste renforcé");
end Labels_3;
