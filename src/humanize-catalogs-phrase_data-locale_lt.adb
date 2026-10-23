separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Lt (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "lt", Name, Template);
   end P;
begin
   P ("all_count",
      "iš viso {total} {total, plural, one {{one}} few {{other}} many "
      & "{{genitive_one}} other {{genitive_other}}}");
   P ("filtered_count.none", "nėra atitinkančių {genitive_other}");
   P ("filtered_count.all",
      "{total, plural, =1 {atitinka 1 {one}} other {atitinka {total} iš "
      & "{total} {total, plural, one {{genitive_one}} few {{genitive_other}} "
      & "many {{genitive_one}} other {{genitive_other}}}}}");
   P ("filtered_count.some",
      "atitinka {matching} iš {total} {total, plural, one {{genitive_one}} "
      & "few {{genitive_other}} many {{genitive_one}} other {{genitive_other}}}");
   P ("more_count", "rodoma {visible}, dar +{remaining}");
   P ("others_count", "{first} ir dar {remaining}");
   P ("page_count", "puslapis {page} iš {total}");
   P ("page_size",
      "{size} {size, plural, one {{one}} few {{other}} many {{genitive_one}} "
      & "other {{genitive_other}}} puslapyje");
   P ("pagination_range",
      "{first}–{last} iš {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}");
   P ("position_count", "{position} iš {total}");
   P ("selection_count",
      "pasirinkta {selected} iš {total} {total, plural, one {{genitive_one}} "
      & "few {{genitive_other}} many {{genitive_one}} other {{genitive_other}}}");
   P ("showing_count",
      "rodoma {showing} iš {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}");
   P ("validation_count",
      "{count, plural, =0 {{severity, select, error {klaidų} warning "
      & "{įspėjimų} other {pastabų}} nėra} one {{count} {severity, select, "
      & "error {klaida} warning {įspėjimas} other {pastaba}}} few {{count} "
      & "{severity, select, error {klaidos} warning {įspėjimai} other "
      & "{pastabos}}} many {{count} {severity, select, error {klaidos} warning "
      & "{įspėjimo} other {pastabos}}} other {{count} {severity, select, "
      & "error {klaidų} warning {įspėjimų} other {pastabų}}}}");
   P ("collection.empty", "nėra {genitive_other}");
   P ("collection.none_shown", "nerodoma jokių {genitive_other}");
   P ("collection.showing_hidden",
      "rodoma {visible} iš {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}, "
      & "paslėpta {hidden}");
   P ("collection.showing",
      "rodoma {visible} iš {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}");
   P ("collection.shown_hidden",
      "rodoma: {visible} {visible, plural, one {{one}} few {{other}} many "
      & "{{genitive_one}} other {{genitive_other}}}, paslėpta: {hidden}");
   P ("collection.shown",
      "rodoma: {visible} {visible, plural, one {{one}} few {{other}} many "
      & "{{genitive_one}} other {{genitive_other}}}");
   P ("collection.visible_out_of",
      "matoma {visible} iš {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}");
   P ("complete_count", "atlikta {done} iš {total}");
   P ("percent_complete", "atlikta {percent} %");
   P ("step_count", "žingsnis {step} iš {total}");
   P ("attempt_count", "bandymas {attempt} iš {total}");
   P ("throughput_remaining",
      "liko {remaining} {remaining, plural, one {{one}} few {{other}} many "
      & "{{genitive_one}} other {{genitive_other}}}, sparta {rate} {unit}/s");
   P ("accessible_progress",
      "atlikta {done} iš {total}, {percent} {percent, plural, one "
      & "{procentas} few {procentai} many {procento} other {procentų}}");
   P ("business_days",
      "{days} {days, plural, one {darbo diena} few {darbo dienos} many {darbo "
      & "dienos} other {darbo dienų}}");
   P ("working_hours",
      "{hours} {hours, plural, one {darbo valanda} few {darbo valandos} many "
      & "{darbo valandos} other {darbo valandų}}");
   P ("due.overdue",
      "pradelsta {days} {days, plural, one {dieną} few {dienas} many "
      & "{dienos} other {dienų}}");
   P ("due.today", "terminas – šiandien");
   P ("due.tomorrow", "terminas – rytoj");
   P ("due.in",
      "terminas po {days} {days, plural, one {dienos} few {dienų} many "
      & "{dienos} other {dienų}}");
   P ("calendar_difference.future", "po {difference}");
   P ("calendar_difference.past", "prieš {difference}");
   P ("cpu_load", "CPU apkrova {measure}");
   P ("battery", "baterija {measure}");
   P ("screen_size", "ekranas {measure}");
   P ("refresh_rate", "atnaujinimo dažnis {measure}");
   P ("editorial_percent.symbol", "{value} %");
   P ("editorial_percent.word",
      "{value} {value, plural, one {procentas} few {procentai} many "
      & "{procento} other {procentų}}");
   P ("recurrence.second",
      "{every, plural, =1 {kas sekundę} one {kas {every} sekundę} few {kas "
      & "{every} sekundes} many {kas {every} sekundės} other {kas {every} "
      & "sekundžių}}");
   P ("recurrence.minute",
      "{every, plural, =1 {kas minutę} one {kas {every} minutę} few {kas "
      & "{every} minutes} many {kas {every} minutės} other {kas {every} "
      & "minučių}}");
   P ("recurrence.hour",
      "{every, plural, =1 {kas valandą} one {kas {every} valandą} few {kas "
      & "{every} valandas} many {kas {every} valandos} other {kas {every} "
      & "valandų}}");
   P ("recurrence.day",
      "{every, plural, =1 {kasdien} one {kas {every} dieną} few {kas {every} "
      & "dienas} many {kas {every} dienos} other {kas {every} dienų}}");
   P ("recurrence.week",
      "{every, plural, =1 {kas savaitę} one {kas {every} savaitę} few {kas "
      & "{every} savaites} many {kas {every} savaitės} other {kas {every} "
      & "savaičių}}");
   P ("recurrence.month",
      "{every, plural, =1 {kas mėnesį} one {kas {every} mėnesį} few {kas "
      & "{every} mėnesius} many {kas {every} mėnesio} other {kas {every} "
      & "mėnesių}}");
   P ("recurrence.quarter",
      "{every, plural, =1 {kas ketvirtį} one {kas {every} ketvirtį} few "
      & "{kas {every} ketvirčius} many {kas {every} ketvirčio} other {kas "
      & "{every} ketvirčių}}");
   P ("recurrence.year",
      "{every, plural, =1 {kasmet} one {kas {every} metus} few {kas {every} "
      & "metus} many {kas {every} metų} other {kas {every} metų}}");
   P ("cache_summary.empty", "talpykla: užklausų nėra");
   P ("cache_summary",
      "talpykla: pataikymų {hits}, praleidimų {misses}, pataikymo dažnis "
      & "{rate} %");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} few {{other}} many "
      & "{{genitive_one}} other {{genitive_other}}}: pakeista {changed}, "
      & "pridėta {added}, pašalinta {removed}");
   P ("field_diff", "{field}: buvo {before}, dabar {after}");
   P ("field_added", "{field}: pridėta reikšmė {value}");
   P ("field_removed", "{field}: pašalinta (buvo {value})");
   P ("field_unchanged", "{field}: nepakeista ({value})");
   P ("number_comparison.equal", "{current} lygu {baseline}");
   P ("number_comparison.higher", "{current} – {quantity} daugiau nei {baseline}");
   P ("number_comparison.lower", "{current} – {quantity} mažiau nei {baseline}");
   P ("percent_comparison.equal", "{current} lygu {baseline}");
   P ("percent_comparison.higher", "{current} – {quantity} daugiau nei {baseline}");
   P ("percent_comparison.lower", "{current} – {quantity} mažiau nei {baseline}");
   P ("file_size_comparison.same", "{current} – tokio pat dydžio kaip {baseline}");
   P ("file_size_comparison.larger", "{current} – {quantity} daugiau nei {baseline}");
   P ("file_size_comparison.smaller", "{current} – {quantity} mažiau nei {baseline}");
   P ("date_comparison.same", "{current} – ta pati data kaip {baseline}");
   P ("queue_summary", "eilė: {details}");
   P ("domain_summary",
      "{domain, select, queue {eilė} job {užduotis} run {vykdymas} cache "
      & "{talpykla} sync {sinchronizavimas} import {importas} export "
      & "{eksportas} other {{domain}}} – {state, select, queued {eilėje} "
      & "running {vykdoma} waiting {laukiama} paused {pristabdyta} complete "
      & "{baigta} failed {nepavyko} stale {pasenę} skipped {praleista} other "
      & "{{state}}}: {details}");
   P ("summary.none", "nėra {genitive_other}");
   P ("summary.completed",
      "baigta: {count} {count, plural, one {{one}} few {{other}} many "
      & "{{genitive_one}} other {{genitive_other}}}");
   P ("summary.completed_of",
      "baigta {count} iš {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}");
   P ("summary.failed", "nepavyko: {count}");
   P ("summary.queued",
      "eilėje: {count} {count, plural, one {{one}} few {{other}} many "
      & "{{genitive_one}} other {{genitive_other}}}");
   P ("summary.running", "vykdoma: {count}");
   P ("summary.complete", "baigta: {count}");
   P ("backup.backup_running", "vyksta atsarginis kopijavimas");
   P ("backup.backup_completed", "atsarginis kopijavimas baigtas");
   P ("backup.backup_failed", "atsarginis kopijavimas nepavyko");
   P ("backup.backup_stale", "atsarginė kopija pasenusi");
   P ("incident.incident_investigating", "tiriamas incidentas");
   P ("incident.incident_identified", "incidentas nustatytas");
   P ("incident.incident_mitigated", "incidentas suvaldytas");
   P ("incident.incident_resolved", "incidentas išspręstas");
   P ("release.release_drafting", "rengiama versija");
   P ("release.release_ready", "versija paruošta");
   P ("release.release_published", "versija išleista");
   P ("release.release_rolled_back", "versija atšaukta");
   P ("audit.audit_created", "audito įrašas sukurtas");
   P ("audit.audit_updated", "audito įrašas atnaujintas");
   P ("audit.audit_deleted", "audito įrašas ištrintas");
   P ("audit.audit_restored", "audito įrašas atkurtas");
   P ("flag.flag_enabled", "funkcijos vėliavėlė įjungta");
   P ("flag.flag_disabled", "funkcijos vėliavėlė išjungta");
   P ("flag.flag_rolling_out", "funkcijos vėliavėlė diegiama");
   P ("flag.flag_rolled_back", "funkcijos vėliavėlė atšaukta");
   P ("webhook.webhook_pending", "webhook: laukiama");
   P ("webhook.webhook_delivered", "webhook: pristatyta");
   P ("webhook.webhook_failed", "webhook: nepavyko");
   P ("webhook.webhook_retrying", "webhook: bandoma dar kartą");
   P ("api_key.api_key_active", "API raktas aktyvus");
   P ("api_key.api_key_revoked", "API raktas atšauktas");
   P ("api_key.api_key_expired", "API rakto galiojimas baigėsi");
   P ("api_key.api_key_rotated", "API raktas pakeistas");
   P ("quota.quota_available", "kvota prieinama");
   P ("quota.quota_near_limit", "kvota beveik išnaudota");
   P ("quota.quota_exceeded", "kvota viršyta");
   P ("quota.quota_reset", "kvota atkurta");
   P ("invoice.invoice_draft", "sąskaitos juodraštis");
   P ("invoice.invoice_sent", "sąskaita išsiųsta");
   P ("invoice.invoice_paid", "sąskaita apmokėta");
   P ("invoice.invoice_refunded", "lėšos už sąskaitą grąžintos");
   P ("invoice.invoice_overdue", "sąskaita pradelsta");
   P ("invoice.refund_failed", "grąžinimas nepavyko");
   P ("page_navigation.only", "vienintelis puslapis");
   P ("page_navigation.first", "pirmas puslapis, yra kitas");
   P ("page_navigation.last", "paskutinis puslapis, yra ankstesnis");
   P ("page_navigation.middle", "yra ankstesnis ir kitas");
   P ("end_of_week", "savaitės pabaiga");
   P ("end_of_month", "mėnesio pabaiga");
   P ("end_of_quarter", "ketvirčio pabaiga");
   P ("time_of_day.night", "naktis");
   P ("time_of_day.morning", "rytas");
   P ("time_of_day.afternoon", "popietė");
   P ("time_of_day.evening", "vakaras");
   P ("calendar_difference.same_day", "tą pačią dieną");
   P ("calendar_difference.zero", "0 dienų");
   P ("queue_summary.empty", "eilė tuščia");
   P ("access.allowed", "leidžiama");
   P ("access.denied", "draudžiama");
   P ("access.owner", "savininkas");
   P ("access.admin", "administratorius");
   P ("access.viewer", "peržiūrėtojas");
   P ("access.editor", "redaguotojas");
   P ("auth.signed_in", "prisijungta");
   P ("auth.signed_out", "atsijungta");
   P ("auth.session_expired", "seansas baigėsi");
   P ("auth.locked", "užrakinta");
   P ("auth.two_factor_required", "būtinas dviejų veiksnių autentifikavimas");
   P ("billing.trialing", "bandomasis laikotarpis");
   P ("billing.payment_due", "laukiama mokėjimo");
   P ("billing.payment_failed", "mokėjimas nepavyko");
   P ("billing.paid", "apmokėta");
   P ("billing.past_due", "pradelsta");
   P ("billing.canceled", "atšaukta");
   P ("ci.pipeline_pending", "konvejeris laukia");
   P ("ci.pipeline_running", "konvejeris vykdomas");
   P ("ci.pipeline_passed", "konvejeris sėkmingas");
   P ("ci.pipeline_failed", "konvejeris nepavyko");
   P ("ci.review_required", "reikia peržiūros");
   P ("ci.deploy_blocked", "diegimas užblokuotas");
   P ("collaboration.active_now", "dabar tinkle");
   P ("collaboration.away", "nėra vietoje");
   P ("collaboration.do_not_disturb", "netrukdyti");
   P ("collaboration.typing", "rašo");
   P ("collaboration.viewing", "peržiūri");
   P ("collaboration.editing", "redaguoja");
   P ("deployment.deploying", "diegiama");
   P ("deployment.deployed", "įdiegta");
   P ("deployment.rolling_back", "grąžinama ankstesnė versija");
   P ("deployment.rolled_back", "grąžinta ankstesnė versija");
   P ("deployment.build_failed", "kompiliavimas nepavyko");
   P ("deployment.checks_passed", "patikros sėkmingos");
   P ("empty.no_items", "elementų nėra");
   P ("empty.no_results", "rezultatų nėra");
   P ("empty.no_messages", "pranešimų nėra");
   P ("empty.no_selection", "nieko nepasirinkta");
   P ("empty.nothing_to_show", "nėra ką rodyti");
   P ("file.uploading", "įkeliama");
   P ("file.downloading", "atsisiunčiama");
   P ("file.copying", "kopijuojama");
   P ("file.moving", "perkeliama");
   P ("file.deleting", "šalinama");
   P ("file.deleted", "pašalinta");
   P ("file.restoring", "atkuriama");
   P ("file.synced", "sinchronizuota");
   P ("form.valid_input", "tinkama įvestis");
   P ("form.invalid_input", "netinkama įvestis");
   P ("form.dirty", "pakeista");
   P ("form.pristine", "nepakeista");
   P ("form.submitted", "pateikta");
   P ("form.submission_failed", "pateikti nepavyko");
   P ("health.healthy", "veikia tinkamai");
   P ("health.degraded", "veikia su trikdžiais");
   P ("health.unhealthy", "neveikia");
   P ("health.incident", "incidentas");
   P ("health.maintenance", "techninė priežiūra");
   P ("health.recovering", "atkuriama");
   P ("issue.open", "atvira");
   P ("issue.closed", "uždaryta");
   P ("issue.reopened", "vėl atidaryta");
   P ("issue.assigned", "priskirta");
   P ("issue.unassigned", "nepriskirta");
   P ("issue.merged", "sulieta");
   P ("network.offline", "neprisijungus");
   P ("network.online", "prisijungus");
   P ("network.connecting", "jungiamasi");
   P ("network.syncing", "sinchronizuojama");
   P ("network.sync_failed", "sinchronizuoti nepavyko");
   P ("network.permission_denied", "prieiga uždrausta");
   P ("network.read_only", "tik skaityti");
   P ("notification.unread", "neskaityta");
   P ("notification.read", "perskaityta");
   P ("notification.muted", "nutildyta");
   P ("notification.snoozed", "atidėta");
   P ("notification.sent", "išsiųsta");
   P ("notification.delivered", "pristatyta");
   P ("payment.payment_authorized", "mokėjimas autorizuotas");
   P ("payment.payment_captured", "mokėjimas nurašytas");
   P ("payment.payment_refunded", "mokėjimas grąžintas");
   P ("payment.payment_disputed", "mokėjimas užginčytas");
   P ("payment.payment_requires_action", "mokėjimui reikia veiksmo");
   P ("payment.payment_expired", "mokėjimo galiojimas baigėsi");
   P ("ui.empty", "tuščia");
   P ("ui.loading", "įkeliama");
   P ("ui.saving", "įrašoma");
   P ("ui.saved", "įrašyta");
   P ("ui.unsaved", "neįrašyta");
   P ("ui.retrying", "bandoma dar kartą");
   P ("ui.paused", "pristabdyta");
   P ("ui.complete", "baigta");
   P ("ui.failed", "nepavyko");
   P ("ui.due_soon", "netrukus terminas");
   P ("ui.overdue", "pradelsta");
   P ("ui.last_seen", "paskutinis aktyvumas");
   P ("ui.updated_just_now", "ką tik atnaujinta");
   P ("queue.queued", "eilėje");
   P ("queue.running", "vykdoma");
   P ("queue.waiting", "laukiama");
   P ("queue.blocked", "užblokuota");
   P ("queue.canceled_job", "užduotis atšaukta");
   P ("queue.completed_job", "užduotis atlikta");
   P ("search.filtering", "filtruojama");
   P ("search.filtered", "išfiltruota");
   P ("search.no_matches", "atitikmenų nėra");
   P ("search.search_ready", "paieška parengta");
   P ("search.search_failed", "paieška nepavyko");
   P ("search.query_too_short", "užklausa per trumpa");
   P ("security.secure", "saugu");
   P ("security.insecure", "nesaugu");
   P ("security.vulnerable", "pažeidžiama");
   P ("security.encrypted", "šifruota");
   P ("security.unencrypted", "nešifruota");
   P ("security.token_expired", "prieigos rakto galiojimas baigėsi");
   P ("sync.sync_idle", "sinchronizavimas neaktyvus");
   P ("sync.syncing_now", "sinchronizuojama");
   P ("sync.sync_queued", "sinchronizavimas eilėje");
   P ("sync.sync_conflict", "sinchronizavimo konfliktas");
   P ("sync.sync_complete", "sinchronizavimas baigtas");
   P ("sync.sync_error", "sinchronizavimo klaida");
   P ("task.todo", "reikia atlikti");
   P ("task.in_progress", "vykdoma");
   P ("task.done", "atlikta");
   P ("task.skipped", "praleista");
   P ("task.blocked_task", "užblokuota");
   P ("task.waiting_on", "laukiama");
   P ("ticket.ticket_new", "nauja užklausa");
   P ("ticket.ticket_open", "užklausa atvira");
   P ("ticket.ticket_waiting", "užklausa laukia");
   P ("ticket.ticket_escalated", "užklausa eskaluota");
   P ("ticket.ticket_resolved", "užklausa išspręsta");
   P ("ticket.ticket_closed", "užklausa uždaryta");
   P ("transfer.importing", "importuojama");
   P ("transfer.imported", "importuota");
   P ("transfer.import_failed", "importuoti nepavyko");
   P ("transfer.exporting", "eksportuojama");
   P ("transfer.exported", "eksportuota");
   P ("transfer.export_failed", "eksportuoti nepavyko");
   P ("validation.required", "privaloma");
   P ("validation.optional", "neprivaloma");
   P ("validation.invalid", "netinkama");
   P ("validation.too_short", "per trumpa");
   P ("validation.too_long", "per ilga");
   P ("validation.out_of_range", "už leistino intervalo ribų");
   P ("validation.already_exists", "jau yra");
   P ("workflow.draft", "juodraštis");
   P ("workflow.in_review", "peržiūrima");
   P ("workflow.approved", "patvirtinta");
   P ("workflow.rejected", "atmesta");
   P ("workflow.published", "paskelbta");
   P ("workflow.archived", "archyvuota");
   P ("database.database_online", "duomenų bazė pasiekiama");
   P ("database.database_offline", "duomenų bazė nepasiekiama");
   P ("database.database_degraded", "duomenų bazė veikia su trikdžiais");
   P ("database.database_migrating", "vykdoma duomenų bazės migracija");
   P ("database.database_migration_failed", "duomenų bazės migracija nepavyko");
   P ("database.database_replicating", "duomenų bazė replikuojama");
   P ("database.database_replication_lagging", "duomenų bazės replikacija vėluoja");
   P ("database.database_backup_running", "kuriama duomenų bazės atsarginė kopija");
   P ("database.database_backup_failed", "nepavyko sukurti duomenų bazės atsarginės kopijos");
   P ("calendar_difference.case.future", "genitive");
   P ("calendar_difference.case.past", "accusative");
   P ("date_comparison.after", "{current} {quantity} vėliau nei {baseline}");
   P ("date_comparison.before", "{current} {quantity} anksčiau nei {baseline}");
   P ("date_comparison.case.after", "instrumental");
   P ("date_comparison.case.before", "instrumental");
   P ("count",
      "{count, plural, one {# {one}} few {# {other}} many {# {genitive_one}} "
      & "other {# {genitive_other}}}");
   P ("noun",
      "{count, plural, one {{one}} few {{other}} many {{genitive_one}} other "
      & "{{genitive_other}}}");
   P ("times_noun",
      "{count, plural, =0 {{other}: niekada} =1 {{one}: vieną kartą} =2 "
      & "{{other}: du kartus} one {{other}: {count} kartą} few {{other}: "
      & "{count} kartus} many {{other}: {count} karto} other {{other}: {count} "
      & "kartų}}");
   P ("availability.all",
      "pasiekiama {available} iš {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_one}} other "
      & "{{genitive_other}}}");
   P ("availability.none", "nėra pasiekiamų {genitive_other}");
   P ("availability.partial",
      "pasiekiama {available} iš {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_one}} other "
      & "{{genitive_other}}}, nepasiekiama {unavailable}");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "eilėje");
   P ("operation.running", "vykdoma");
   P ("operation.blocked", "užblokuota");
   P ("operation.retrying", "kartojama");
   P ("operation.succeeded", "sėkmingai");
   P ("operation.partially_succeeded", "iš dalies sėkmingai");
   P ("operation.failed", "nepavyko");
   P ("operation.canceled", "atšaukta");
   P ("operation.skipped", "praleista");
   P ("operation.stale", "pasenę");
   P ("operation.unknown_state", "nežinoma");
   P ("operation.last_success", "{name} – paskutinį kartą pavyko: {time}");
   P ("operation.next_retry", "{name} – kitas bandymas: {time}");
   P ("operation.stale_run", "{name} – neatnaujinta: {time}");
   P ("summary.skipped", "praleista: {count}");
   P ("summary.retried", "kartota: {count}");
   P ("summary.canceled", "atšaukta: {count}");
   P ("system.service.operational", "veikia");
   P ("system.service.degraded", "sumažėjęs našumas");
   P ("system.service.partial_outage", "dalinis sutrikimas");
   P ("system.service.major_outage", "didelis sutrikimas");
   P ("system.service.maintenance", "vykdoma priežiūra");
   P ("system.service.unknown", "paslaugos būsena nežinoma");
   P ("system.health.healthy", "būklė gera");
   P ("system.health.warning", "įspėjimas");
   P ("system.health.critical", "kritinė būklė");
   P ("system.health.unavailable", "nepasiekiama");
   P ("system.health.unknown_health", "būklė nežinoma");
   P ("system.readiness.ready", "parengta");
   P ("system.readiness.not_ready", "neparengta");
   P ("system.readiness.starting", "paleidžiama");
   P ("system.readiness.draining", "atlaisvinama");
   P ("system.readiness.stopped", "sustabdyta");
   P ("system.readiness.unknown_readiness", "parengtis nežinoma");
   P ("system.component.online", "tinkle");
   P ("system.component.offline", "ne tinkle");
   P ("system.component.starting", "paleidžiama");
   P ("system.component.stopping", "stabdoma");
   P ("system.component.restarting", "paleidžiama iš naujo");
   P ("system.component.unknown", "komponento būsena nežinoma");
   P ("system.check.passing", "sėkminga");
   P ("system.check.failing", "nesėkminga");
   P ("system.check.warning", "įspėjimas");
   P ("system.check.skipped", "praleista");
   P ("system.check.timed_out", "baigėsi laikas");
   P ("system.check.unknown", "patikros būsena nežinoma");
   P ("system.incident.investigating", "tiriama");
   P ("system.incident.identified", "priežastis nustatyta");
   P ("system.incident.monitoring", "stebima");
   P ("system.incident.resolved", "išspręsta");
   P ("system.incident.scheduled_maintenance", "planinė priežiūra");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "patikra {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {nėra komponentų} one {{count} komponentas} few "
      & "{{count} komponentai} many {{count} komponento} other {{count} "
      & "komponentų}}");
   P ("system.count.checks",
      "{count, plural, =0 {nėra patikrų} one {{count} patikra} few {{count} "
      & "patikros} many {{count} patikros} other {{count} patikrų}}");
   P ("system.count.incidents",
      "{count, plural, =0 {nėra incidentų} one {{count} incidentas} few "
      & "{{count} incidentai} many {{count} incidento} other {{count} "
      & "incidentų}}");
   P ("system.uptime", "pasiekiamumas: {measure}");
   P ("system.latency", "delsa: {measure}");
   P ("system.maintenance_window", "priežiūros langas: {time}");
   P ("system.last_checked", "paskutinį kartą tikrinta: {time}");
   P ("system.http.informational", "informacinis atsakas");
   P ("system.http.successful", "sėkmingas atsakas");
   P ("system.http.redirection", "peradresavimas");
   P ("system.http.client_error", "kliento klaida");
   P ("system.http.server_error", "serverio klaida");
   P ("system.exit.success", "išėjimo kodas {code}: sėkmė");
   P ("system.exit.failure", "išėjimo kodas {code}: nesėkmė");
   P ("system.exit.usage_error", "išėjimo kodas {code}: naudojimo klaida");
   P ("system.exit.not_executable", "išėjimo kodas {code}: komanda nevykdoma");
   P ("system.exit.not_found", "išėjimo kodas {code}: komanda nerasta");
   P ("system.exit.invalid_argument", "išėjimo kodas {code}: netinkamas exit argumentas");
   P ("system.exit.signal", "išėjimo kodas {code}: nutraukta signalu {signal}");
   P ("validation.problem.required", "{field}: privalomas laukas");
   P ("validation.problem.minimum", "{field}: reikšmė mažesnė už minimalią");
   P ("validation.problem.maximum", "{field}: reikšmė didesnė už maksimalią");
   P ("validation.problem.range", "{field}: reikšmė už leistino intervalo ribų");
   P ("validation.problem.pattern", "{field}: neatitinka šablono");
   P ("validation.problem.choice", "{field}: reikšmė turi būti viena iš leistinų parinkčių");
   P ("validation.problem.dependency", "{field}: priklauso nuo kito lauko");
   P ("validation.problem.custom", "{field}: netinkama reikšmė");
   P ("validation.constraint.no_relation", "{field}: reikšmė turi būti tinkama ({value})");
   P ("validation.constraint.less_than", "{field}: reikšmė turi būti mažesnė nei {value}");
   P ("validation.constraint.less_or_equal", "{field}: reikšmė turi būti ne didesnė nei {value}");
   P ("validation.constraint.greater_than", "{field}: reikšmė turi būti didesnė nei {value}");
   P ("validation.constraint.greater_or_equal", "{field}: reikšmė turi būti ne mažesnė nei {value}");
   P ("validation.constraint.equal_to", "{field}: reikšmė turi būti lygi {value}");
   P ("validation.constraint.not_equal_to", "{field}: reikšmė neturi būti lygi {value}");
   P ("validation.constraint.before_field", "{field}: reikšmė turi būti ankstesnė nei {value}");
   P ("validation.constraint.after_field", "{field}: reikšmė turi būti vėlesnė nei {value}");
   P ("validation.choices", "{field}: leistinos reikšmės: {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, gauta: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, pakartotinis bandymas po {time}");
   P ("net_diagnostic.dns", "{endpoint}: nepavyko DNS užklausa");
   P ("net_diagnostic.tcp", "{endpoint}: nepavyko užmegzti TCP ryšio");
   P ("net_diagnostic.tls", "{endpoint}: TLS sertifikato klaida");
   P ("net_diagnostic.http", "{endpoint}: HTTP užklausos klaida");
   P ("net_diagnostic.proxy", "{endpoint}: tarpinio serverio klaida");
   P ("net_diagnostic.timeout", "{endpoint}: baigėsi laukimo laikas");
   P ("net_diagnostic.reset", "{endpoint}: ryšys nutrauktas");
   P ("net_diagnostic.unknown_network", "{endpoint}: nežinoma tinklo problema");
   P ("progress.state.not_started", "nepradėta");
   P ("progress.state.running", "vykdoma");
   P ("progress.state.stalled", "sustojo");
   P ("progress.state.retrying", "kartojama");
   P ("progress.state.complete", "baigta");
   P ("progress.state.failed", "nepavyko");
   P ("progress.of", "{subject}: atlikta {done} iš {total} ({percent} %), {state}");
   P ("progress.done", "{subject}: atlikta {done}, {state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {elementas} few {elementai} many "
      & "{elemento} other {elementų}}, {unique} {unique, plural, one {unikali "
      & "reikšmė} few {unikalios reikšmės} many {unikalios reikšmės} "
      & "other {unikalių reikšmių}}, {duplicates} {duplicates, plural, one "
      & "{dublikatas} few {dublikatai} many {dublikato} other {dublikatų}}, "
      & "{outliers} {outliers, plural, one {išskirtis} few {išskirtys} many "
      & "{išskirties} other {išskirčių}}");
   P ("top_frequency",
      "{name}: dažniausiai {value} ({count} {count, plural, one {kartą} few "
      & "{kartus} many {karto} other {kartų}})");
   P ("calendar_date.fiscal_year", "{year} FM");
   P ("calendar_date.fiscal_quarter", "{year} FM {part} ketv.");
   P ("calendar_date.fiscal_half", "{year} FM {part} pusm.");
   P ("calendar_date.fiscal_year_end", "{year} FM pabaiga");
   P ("calendar_date.semester", "{year} m. {part} sem.");
   P ("calendar_date.half_year", "{year} m. {part} pusm.");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {{year} m. pirmasis pusmetis} other {{year} m. "
      & "antrasis pusmetis}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {{text} (pradžia)} mid {{text} (vidurys)} other "
      & "{{text} (pabaiga)}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {{text} pradžia} mid {{text} vidurys} other "
      & "{{text} pabaiga}}");
   P ("calendar_range.weekend.last", "praėjęs savaitgalis");
   P ("calendar_range.weekend.this", "šis savaitgalis");
   P ("calendar_range.weekend.next", "kitas savaitgalis");
   P ("calendar_range.weekend_of", "{date} savaitgalis");
   P ("calendar_range.week.last", "praėjusi savaitė");
   P ("calendar_range.week.this", "ši savaitė");
   P ("calendar_range.week.next", "kita savaitė");
   P ("calendar_range.week_of", "{date} savaitė");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "tęsti");
   P ("http.reason.101", "keičiami protokolai");
   P ("http.reason.102", "apdorojama");
   P ("http.reason.103", "ankstyvos užuominos");
   P ("http.reason.200", "OK");
   P ("http.reason.201", "sukurta");
   P ("http.reason.202", "priimta");
   P ("http.reason.203", "neautoritetinga informacija");
   P ("http.reason.204", "nėra turinio");
   P ("http.reason.205", "atstatyti turinį");
   P ("http.reason.206", "dalinis turinys");
   P ("http.reason.207", "daugybinė būsena");
   P ("http.reason.208", "jau pranešta");
   P ("http.reason.226", "IM panaudota");
   P ("http.reason.300", "keli pasirinkimai");
   P ("http.reason.301", "perkelta visam laikui");
   P ("http.reason.302", "rasta");
   P ("http.reason.303", "žiūrėti kitur");
   P ("http.reason.304", "nepakeista");
   P ("http.reason.305", "naudoti tarpinį serverį");
   P ("http.reason.307", "laikinas peradresavimas");
   P ("http.reason.308", "nuolatinis peradresavimas");
   P ("http.reason.400", "bloga užklausa");
   P ("http.reason.401", "neautorizuota");
   P ("http.reason.402", "reikalingas mokėjimas");
   P ("http.reason.403", "draudžiama");
   P ("http.reason.404", "nerasta");
   P ("http.reason.405", "metodas neleidžiamas");
   P ("http.reason.406", "nepriimtina");
   P ("http.reason.407", "reikalingas tarpinio serverio autentifikavimas");
   P ("http.reason.408", "baigėsi užklausos laukimo laikas");
   P ("http.reason.409", "konfliktas");
   P ("http.reason.410", "pašalinta");
   P ("http.reason.411", "reikalingas ilgis");
   P ("http.reason.412", "išankstinė sąlyga neįvykdyta");
   P ("http.reason.413", "turinys per didelis");
   P ("http.reason.414", "URI per ilgas");
   P ("http.reason.415", "nepalaikomas medijos tipas");
   P ("http.reason.416", "diapazonas netenkinamas");
   P ("http.reason.417", "lūkestis neįvykdytas");
   P ("http.reason.418", "aš esu arbatinukas");
   P ("http.reason.421", "klaidingai nukreipta užklausa");
   P ("http.reason.422", "neapdorojamas turinys");
   P ("http.reason.423", "užrakinta");
   P ("http.reason.424", "nepavykusi priklausomybė");
   P ("http.reason.425", "per anksti");
   P ("http.reason.426", "reikalingas atnaujinimas");
   P ("http.reason.428", "reikalinga išankstinė sąlyga");
   P ("http.reason.429", "per daug užklausų");
   P ("http.reason.431", "užklausos antraštės laukai per dideli");
   P ("http.reason.451", "nepasiekiama dėl teisinių priežasčių");
   P ("http.reason.500", "vidinė serverio klaida");
   P ("http.reason.501", "neįgyvendinta");
   P ("http.reason.502", "blogas tinklų sietuvas");
   P ("http.reason.503", "paslauga nepasiekiama");
   P ("http.reason.504", "baigėsi tinklų sietuvo laukimo laikas");
   P ("http.reason.505", "HTTP versija nepalaikoma");
   P ("http.reason.506", "variantas taip pat derasi");
   P ("http.reason.507", "nepakanka saugyklos vietos");
   P ("http.reason.508", "aptiktas ciklas");
   P ("http.reason.510", "neišplėsta");
   P ("http.reason.511", "reikalingas tinklo autentifikavimas");
   P ("errno.reason.0", "sėkmė");
   P ("errno.reason.1", "operacija neleidžiama");
   P ("errno.reason.2", "nėra tokio failo ar katalogo");
   P ("errno.reason.3", "nėra tokio proceso");
   P ("errno.reason.4", "nutrauktas sisteminis kvietimas");
   P ("errno.reason.5", "įvesties/išvesties klaida");
   P ("errno.reason.6", "nėra tokio įrenginio ar adreso");
   P ("errno.reason.9", "blogas failo deskriptorius");
   P ("errno.reason.11", "išteklius laikinai neprieinamas");
   P ("errno.reason.12", "nepakanka atminties");
   P ("errno.reason.13", "prieiga uždrausta");
   P ("errno.reason.17", "failas egzistuoja");
   P ("errno.reason.20", "ne katalogas");
   P ("errno.reason.21", "tai katalogas");
   P ("errno.reason.22", "netinkamas argumentas");
   P ("errno.reason.24", "per daug atvertų failų");
   P ("errno.reason.28", "įrenginyje neliko vietos");
   P ("errno.reason.32", "nutrūko kanalas");
   P ("errno.reason.98", "adresas jau naudojamas");
   P ("errno.reason.110", "baigėsi ryšio laukimo laikas");
   P ("errno.reason.111", "ryšys atmestas");
   P ("signal.reason.1", "ryšys nutrūko");
   P ("signal.reason.2", "pertraukimas");
   P ("signal.reason.3", "išėjimas");
   P ("signal.reason.4", "neleistina instrukcija");
   P ("signal.reason.5", "sekimo spąstai");
   P ("signal.reason.6", "avarinis nutraukimas");
   P ("signal.reason.7", "magistralės klaida");
   P ("signal.reason.8", "slankiojo kablelio išimtis");
   P ("signal.reason.9", "nužudyta");
   P ("signal.reason.10", "naudotojo signalas 1");
   P ("signal.reason.11", "segmentavimo klaida");
   P ("signal.reason.12", "naudotojo signalas 2");
   P ("signal.reason.13", "nutrūko kanalas");
   P ("signal.reason.14", "laikmačio signalas");
   P ("signal.reason.15", "prašymas baigti darbą");
   P ("signal.reason.17", "pasikeitė antrinio proceso būsena");
   P ("signal.reason.18", "tęsimas");
   P ("signal.reason.19", "sustabdyta");
   P ("signal.reason.20", "sustabdyta iš terminalo");
   P ("signal.reason.28", "pakeistas lango dydis");
   P ("sqlstate.reason.00", "sėkmingas užbaigimas");
   P ("sqlstate.reason.01", "įspėjimas");
   P ("sqlstate.reason.02", "nėra duomenų");
   P ("sqlstate.reason.08", "ryšio išimtis");
   P ("sqlstate.reason.0a", "funkcija nepalaikoma");
   P ("sqlstate.reason.22", "duomenų išimtis");
   P ("sqlstate.reason.23", "vientisumo apribojimo pažeidimas");
   P ("sqlstate.reason.24", "netinkama žymeklio būsena");
   P ("sqlstate.reason.25", "netinkama transakcijos būsena");
   P ("sqlstate.reason.28", "netinkama autorizacijos specifikacija");
   P ("sqlstate.reason.2d", "netinkamas transakcijos užbaigimas");
   P ("sqlstate.reason.3d", "netinkamas katalogo pavadinimas");
   P ("sqlstate.reason.3f", "netinkamas schemos pavadinimas");
   P ("sqlstate.reason.40", "transakcijos atšaukimas");
   P ("sqlstate.reason.42", "sintaksės klaida arba prieigos taisyklės pažeidimas");
   P ("sqlstate.reason.53", "nepakanka išteklių");
   P ("sqlstate.reason.54", "viršyta programos riba");
   P ("sqlstate.reason.55", "objektas nėra reikiamos būsenos");
   P ("sqlstate.reason.57", "operatoriaus įsikišimas");
   P ("sqlstate.reason.58", "sistemos klaida");
   P ("sqlstate.reason.hv", "išorinių duomenų apvalkalo klaida");
   P ("sqlstate.reason.p0", "PL/pgSQL klaida");
   P ("sqlstate.reason.xx", "vidinė klaida");
   P ("system.signal_numbered", "signalas {number} {name} {reason}");
   P ("http.reason.unknown", "nežinoma būsena");
   P ("errno.reason.unknown", "nežinoma klaida");
   P ("signal.reason.unknown", "nežinomas signalas");
   P ("sqlstate.reason.unknown", "nežinoma SQLSTATE klasė");
end Locale_Lt;
