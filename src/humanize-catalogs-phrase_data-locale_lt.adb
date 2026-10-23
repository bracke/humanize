separate (Humanize.Catalogs.Phrase_Data)
function Locale_Lt return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("lt", Name, Template));
begin
   return
     P ("all_count",
          "iš viso {total} {total, plural, one {{one}} few {{other}} many "
          & "{{genitive_one}} other {{genitive_other}}}")
     & P ("filtered_count.none", "nėra atitinkančių {genitive_other}")
     & P ("filtered_count.all",
          "{total, plural, =1 {atitinka 1 {one}} other {atitinka {total} iš "
          & "{total} {total, plural, one {{genitive_one}} few {{genitive_other}} "
          & "many {{genitive_one}} other {{genitive_other}}}}}")
     & P ("filtered_count.some",
          "atitinka {matching} iš {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("more_count", "rodoma {visible}, dar +{remaining}")
     & P ("others_count", "{first} ir dar {remaining}")
     & P ("page_count", "puslapis {page} iš {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} few {{other}} many {{genitive_one}} "
          & "other {{genitive_other}}} puslapyje")
     & P ("pagination_range",
          "{first}–{last} iš {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("position_count", "{position} iš {total}")
     & P ("selection_count",
          "pasirinkta {selected} iš {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("showing_count",
          "rodoma {showing} iš {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {klaidų} warning "
          & "{įspėjimų} other {pastabų}} nėra} one {{count} {severity, select, "
          & "error {klaida} warning {įspėjimas} other {pastaba}}} few {{count} "
          & "{severity, select, error {klaidos} warning {įspėjimai} other "
          & "{pastabos}}} many {{count} {severity, select, error {klaidos} warning "
          & "{įspėjimo} other {pastabos}}} other {{count} {severity, select, "
          & "error {klaidų} warning {įspėjimų} other {pastabų}}}}")
     & P ("collection.empty", "nėra {genitive_other}")
     & P ("collection.none_shown", "nerodoma jokių {genitive_other}")
     & P ("collection.showing_hidden",
          "rodoma {visible} iš {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}, "
          & "paslėpta {hidden}")
     & P ("collection.showing",
          "rodoma {visible} iš {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("collection.shown_hidden",
          "rodoma: {visible} {visible, plural, one {{one}} few {{other}} many "
          & "{{genitive_one}} other {{genitive_other}}}, paslėpta: {hidden}")
     & P ("collection.shown",
          "rodoma: {visible} {visible, plural, one {{one}} few {{other}} many "
          & "{{genitive_one}} other {{genitive_other}}}")
     & P ("collection.visible_out_of",
          "matoma {visible} iš {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("complete_count", "atlikta {done} iš {total}")
     & P ("percent_complete", "atlikta {percent} %")
     & P ("step_count", "žingsnis {step} iš {total}")
     & P ("attempt_count", "bandymas {attempt} iš {total}")
     & P ("throughput_remaining", "{unit}: liko {remaining}, sparta {rate} {unit}/s")
     & P ("accessible_progress",
          "atlikta {done} iš {total}, {percent} {percent, plural, one "
          & "{procentas} few {procentai} many {procento} other {procentų}}")
     & P ("business_days",
          "{days} {days, plural, one {darbo diena} few {darbo dienos} many {darbo "
          & "dienos} other {darbo dienų}}")
     & P ("working_hours",
          "{hours} {hours, plural, one {darbo valanda} few {darbo valandos} many "
          & "{darbo valandos} other {darbo valandų}}")
     & P ("due.overdue",
          "pradelsta {days} {days, plural, one {dieną} few {dienas} many "
          & "{dienos} other {dienų}}")
     & P ("due.today", "terminas – šiandien")
     & P ("due.tomorrow", "terminas – rytoj")
     & P ("due.in",
          "terminas po {days} {days, plural, one {dienos} few {dienų} many "
          & "{dienos} other {dienų}}")
     & P ("calendar_difference.future", "po {difference}")
     & P ("calendar_difference.past", "prieš {difference}")
     & P ("cpu_load", "CPU apkrova {measure}")
     & P ("battery", "baterija {measure}")
     & P ("screen_size", "ekranas {measure}")
     & P ("refresh_rate", "atnaujinimo dažnis {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word",
          "{value} {value, plural, one {procentas} few {procentai} many "
          & "{procento} other {procentų}}")
     & P ("recurrence.second",
          "{every, plural, =1 {kas sekundę} one {kas {every} sekundę} few {kas "
          & "{every} sekundes} many {kas {every} sekundės} other {kas {every} "
          & "sekundžių}}")
     & P ("recurrence.minute",
          "{every, plural, =1 {kas minutę} one {kas {every} minutę} few {kas "
          & "{every} minutes} many {kas {every} minutės} other {kas {every} "
          & "minučių}}")
     & P ("recurrence.hour",
          "{every, plural, =1 {kas valandą} one {kas {every} valandą} few {kas "
          & "{every} valandas} many {kas {every} valandos} other {kas {every} "
          & "valandų}}")
     & P ("recurrence.day",
          "{every, plural, =1 {kasdien} one {kas {every} dieną} few {kas {every} "
          & "dienas} many {kas {every} dienos} other {kas {every} dienų}}")
     & P ("recurrence.week",
          "{every, plural, =1 {kas savaitę} one {kas {every} savaitę} few {kas "
          & "{every} savaites} many {kas {every} savaitės} other {kas {every} "
          & "savaičių}}")
     & P ("recurrence.month",
          "{every, plural, =1 {kas mėnesį} one {kas {every} mėnesį} few {kas "
          & "{every} mėnesius} many {kas {every} mėnesio} other {kas {every} "
          & "mėnesių}}")
     & P ("recurrence.quarter",
          "{every, plural, =1 {kas ketvirtį} one {kas {every} ketvirtį} few "
          & "{kas {every} ketvirčius} many {kas {every} ketvirčio} other {kas "
          & "{every} ketvirčių}}")
     & P ("recurrence.year",
          "{every, plural, =1 {kasmet} one {kas {every} metus} few {kas {every} "
          & "metus} many {kas {every} metų} other {kas {every} metų}}")
     & P ("cache_summary.empty", "talpykla: užklausų nėra")
     & P ("cache_summary",
          "talpykla: pataikymų {hits}, praleidimų {misses}, pataikymo dažnis "
          & "{rate} %")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} few {{other}} many "
          & "{{genitive_one}} other {{genitive_other}}}: pakeista {changed}, "
          & "pridėta {added}, pašalinta {removed}")
     & P ("field_diff", "{field}: buvo {before}, dabar {after}")
     & P ("field_added", "{field}: pridėta reikšmė {value}")
     & P ("field_removed", "{field}: pašalinta (buvo {value})")
     & P ("field_unchanged", "{field}: nepakeista ({value})")
     & P ("number_comparison.equal", "{current} lygu {baseline}")
     & P ("number_comparison.higher", "{current} – {quantity} daugiau nei {baseline}")
     & P ("number_comparison.lower", "{current} – {quantity} mažiau nei {baseline}")
     & P ("percent_comparison.equal", "{current} lygu {baseline}")
     & P ("percent_comparison.higher", "{current} – {quantity} daugiau nei {baseline}")
     & P ("percent_comparison.lower", "{current} – {quantity} mažiau nei {baseline}")
     & P ("file_size_comparison.same", "{current} – tokio pat dydžio kaip {baseline}")
     & P ("file_size_comparison.larger", "{current} – {quantity} daugiau nei {baseline}")
     & P ("file_size_comparison.smaller", "{current} – {quantity} mažiau nei {baseline}")
     & P ("date_comparison.same", "{current} – ta pati data kaip {baseline}")
     & P ("queue_summary", "eilė: {details}")
     & P ("domain_summary",
          "{domain, select, queue {eilė} job {užduotis} run {vykdymas} cache "
          & "{talpykla} sync {sinchronizavimas} import {importas} export "
          & "{eksportas} other {{domain}}} – {state, select, queued {eilėje} "
          & "running {vykdoma} waiting {laukiama} paused {pristabdyta} complete "
          & "{baigta} failed {nepavyko} stale {pasenę} skipped {praleista} other "
          & "{{state}}}: {details}")
     & P ("summary.none", "nėra {genitive_other}")
     & P ("summary.completed",
          "baigta: {count} {count, plural, one {{one}} few {{other}} many "
          & "{{genitive_one}} other {{genitive_other}}}")
     & P ("summary.completed_of",
          "baigta {count} iš {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("summary.failed", "nepavyko: {count}")
     & P ("summary.queued",
          "eilėje: {count} {count, plural, one {{one}} few {{other}} many "
          & "{{genitive_one}} other {{genitive_other}}}")
     & P ("summary.running", "vykdoma: {count}")
     & P ("summary.complete", "baigta: {count}")
     & P ("backup.backup_running", "vyksta atsarginis kopijavimas")
     & P ("backup.backup_completed", "atsarginis kopijavimas baigtas")
     & P ("backup.backup_failed", "atsarginis kopijavimas nepavyko")
     & P ("backup.backup_stale", "atsarginė kopija pasenusi")
     & P ("incident.incident_investigating", "tiriamas incidentas")
     & P ("incident.incident_identified", "incidentas nustatytas")
     & P ("incident.incident_mitigated", "incidentas suvaldytas")
     & P ("incident.incident_resolved", "incidentas išspręstas")
     & P ("release.release_drafting", "rengiama versija")
     & P ("release.release_ready", "versija paruošta")
     & P ("release.release_published", "versija išleista")
     & P ("release.release_rolled_back", "versija atšaukta")
     & P ("audit.audit_created", "audito įrašas sukurtas")
     & P ("audit.audit_updated", "audito įrašas atnaujintas")
     & P ("audit.audit_deleted", "audito įrašas ištrintas")
     & P ("audit.audit_restored", "audito įrašas atkurtas")
     & P ("flag.flag_enabled", "funkcijos vėliavėlė įjungta")
     & P ("flag.flag_disabled", "funkcijos vėliavėlė išjungta")
     & P ("flag.flag_rolling_out", "funkcijos vėliavėlė diegiama")
     & P ("flag.flag_rolled_back", "funkcijos vėliavėlė atšaukta")
     & P ("webhook.webhook_pending", "webhook: laukiama")
     & P ("webhook.webhook_delivered", "webhook: pristatyta")
     & P ("webhook.webhook_failed", "webhook: nepavyko")
     & P ("webhook.webhook_retrying", "webhook: bandoma dar kartą")
     & P ("api_key.api_key_active", "API raktas aktyvus")
     & P ("api_key.api_key_revoked", "API raktas atšauktas")
     & P ("api_key.api_key_expired", "API rakto galiojimas baigėsi")
     & P ("api_key.api_key_rotated", "API raktas pakeistas")
     & P ("quota.quota_available", "kvota prieinama")
     & P ("quota.quota_near_limit", "kvota beveik išnaudota")
     & P ("quota.quota_exceeded", "kvota viršyta")
     & P ("quota.quota_reset", "kvota atkurta")
     & P ("invoice.invoice_draft", "sąskaitos juodraštis")
     & P ("invoice.invoice_sent", "sąskaita išsiųsta")
     & P ("invoice.invoice_paid", "sąskaita apmokėta")
     & P ("invoice.invoice_refunded", "lėšos už sąskaitą grąžintos")
     & P ("invoice.invoice_overdue", "sąskaita pradelsta")
     & P ("invoice.refund_failed", "grąžinimas nepavyko")
     & P ("page_navigation.only", "vienintelis puslapis")
     & P ("page_navigation.first", "pirmas puslapis, yra kitas")
     & P ("page_navigation.last", "paskutinis puslapis, yra ankstesnis")
     & P ("page_navigation.middle", "yra ankstesnis ir kitas")
     & P ("end_of_week", "savaitės pabaiga")
     & P ("end_of_month", "mėnesio pabaiga")
     & P ("end_of_quarter", "ketvirčio pabaiga")
     & P ("time_of_day.night", "naktis")
     & P ("time_of_day.morning", "rytas")
     & P ("time_of_day.afternoon", "popietė")
     & P ("time_of_day.evening", "vakaras")
     & P ("calendar_difference.same_day", "tą pačią dieną")
     & P ("calendar_difference.zero", "0 dienų")
     & P ("queue_summary.empty", "eilė tuščia")
     & P ("access.allowed", "leidžiama")
     & P ("access.denied", "draudžiama")
     & P ("access.owner", "savininkas")
     & P ("access.admin", "administratorius")
     & P ("access.viewer", "peržiūrėtojas")
     & P ("access.editor", "redaguotojas")
     & P ("auth.signed_in", "prisijungta")
     & P ("auth.signed_out", "atsijungta")
     & P ("auth.session_expired", "seansas baigėsi")
     & P ("auth.locked", "užrakinta")
     & P ("auth.two_factor_required", "būtinas dviejų veiksnių autentifikavimas")
     & P ("billing.trialing", "bandomasis laikotarpis")
     & P ("billing.payment_due", "laukiama mokėjimo")
     & P ("billing.payment_failed", "mokėjimas nepavyko")
     & P ("billing.paid", "apmokėta")
     & P ("billing.past_due", "pradelsta")
     & P ("billing.canceled", "atšaukta")
     & P ("ci.pipeline_pending", "konvejeris laukia")
     & P ("ci.pipeline_running", "konvejeris vykdomas")
     & P ("ci.pipeline_passed", "konvejeris sėkmingas")
     & P ("ci.pipeline_failed", "konvejeris nepavyko")
     & P ("ci.review_required", "reikia peržiūros")
     & P ("ci.deploy_blocked", "diegimas užblokuotas")
     & P ("collaboration.active_now", "dabar tinkle")
     & P ("collaboration.away", "nėra vietoje")
     & P ("collaboration.do_not_disturb", "netrukdyti")
     & P ("collaboration.typing", "rašo")
     & P ("collaboration.viewing", "peržiūri")
     & P ("collaboration.editing", "redaguoja")
     & P ("deployment.deploying", "diegiama")
     & P ("deployment.deployed", "įdiegta")
     & P ("deployment.rolling_back", "grąžinama ankstesnė versija")
     & P ("deployment.rolled_back", "grąžinta ankstesnė versija")
     & P ("deployment.build_failed", "kompiliavimas nepavyko")
     & P ("deployment.checks_passed", "patikros sėkmingos")
     & P ("empty.no_items", "elementų nėra")
     & P ("empty.no_results", "rezultatų nėra")
     & P ("empty.no_messages", "pranešimų nėra")
     & P ("empty.no_selection", "nieko nepasirinkta")
     & P ("empty.nothing_to_show", "nėra ką rodyti")
     & P ("file.uploading", "įkeliama")
     & P ("file.downloading", "atsisiunčiama")
     & P ("file.copying", "kopijuojama")
     & P ("file.moving", "perkeliama")
     & P ("file.deleting", "šalinama")
     & P ("file.deleted", "pašalinta")
     & P ("file.restoring", "atkuriama")
     & P ("file.synced", "sinchronizuota")
     & P ("form.valid_input", "tinkama įvestis")
     & P ("form.invalid_input", "netinkama įvestis")
     & P ("form.dirty", "pakeista")
     & P ("form.pristine", "nepakeista")
     & P ("form.submitted", "pateikta")
     & P ("form.submission_failed", "pateikti nepavyko")
     & P ("health.healthy", "veikia tinkamai")
     & P ("health.degraded", "veikia su trikdžiais")
     & P ("health.unhealthy", "neveikia")
     & P ("health.incident", "incidentas")
     & P ("health.maintenance", "techninė priežiūra")
     & P ("health.recovering", "atkuriama")
     & P ("issue.open", "atvira")
     & P ("issue.closed", "uždaryta")
     & P ("issue.reopened", "vėl atidaryta")
     & P ("issue.assigned", "priskirta")
     & P ("issue.unassigned", "nepriskirta")
     & P ("issue.merged", "sulieta")
     & P ("network.offline", "neprisijungus")
     & P ("network.online", "prisijungus")
     & P ("network.connecting", "jungiamasi")
     & P ("network.syncing", "sinchronizuojama")
     & P ("network.sync_failed", "sinchronizuoti nepavyko")
     & P ("network.permission_denied", "prieiga uždrausta")
     & P ("network.read_only", "tik skaityti")
     & P ("notification.unread", "neskaityta")
     & P ("notification.read", "perskaityta")
     & P ("notification.muted", "nutildyta")
     & P ("notification.snoozed", "atidėta")
     & P ("notification.sent", "išsiųsta")
     & P ("notification.delivered", "pristatyta")
     & P ("payment.payment_authorized", "mokėjimas autorizuotas")
     & P ("payment.payment_captured", "mokėjimas nurašytas")
     & P ("payment.payment_refunded", "mokėjimas grąžintas")
     & P ("payment.payment_disputed", "mokėjimas užginčytas")
     & P ("payment.payment_requires_action", "mokėjimui reikia veiksmo")
     & P ("payment.payment_expired", "mokėjimo galiojimas baigėsi")
     & P ("ui.empty", "tuščia")
     & P ("ui.loading", "įkeliama")
     & P ("ui.saving", "įrašoma")
     & P ("ui.saved", "įrašyta")
     & P ("ui.unsaved", "neįrašyta")
     & P ("ui.retrying", "bandoma dar kartą")
     & P ("ui.paused", "pristabdyta")
     & P ("ui.complete", "baigta")
     & P ("ui.failed", "nepavyko")
     & P ("ui.due_soon", "netrukus terminas")
     & P ("ui.overdue", "pradelsta")
     & P ("ui.last_seen", "paskutinis aktyvumas")
     & P ("ui.updated_just_now", "ką tik atnaujinta")
     & P ("queue.queued", "eilėje")
     & P ("queue.running", "vykdoma")
     & P ("queue.waiting", "laukiama")
     & P ("queue.blocked", "užblokuota")
     & P ("queue.canceled_job", "užduotis atšaukta")
     & P ("queue.completed_job", "užduotis atlikta")
     & P ("search.filtering", "filtruojama")
     & P ("search.filtered", "išfiltruota")
     & P ("search.no_matches", "atitikmenų nėra")
     & P ("search.search_ready", "paieška parengta")
     & P ("search.search_failed", "paieška nepavyko")
     & P ("search.query_too_short", "užklausa per trumpa")
     & P ("security.secure", "saugu")
     & P ("security.insecure", "nesaugu")
     & P ("security.vulnerable", "pažeidžiama")
     & P ("security.encrypted", "šifruota")
     & P ("security.unencrypted", "nešifruota")
     & P ("security.token_expired", "prieigos rakto galiojimas baigėsi")
     & P ("sync.sync_idle", "sinchronizavimas neaktyvus")
     & P ("sync.syncing_now", "sinchronizuojama")
     & P ("sync.sync_queued", "sinchronizavimas eilėje")
     & P ("sync.sync_conflict", "sinchronizavimo konfliktas")
     & P ("sync.sync_complete", "sinchronizavimas baigtas")
     & P ("sync.sync_error", "sinchronizavimo klaida")
     & P ("task.todo", "reikia atlikti")
     & P ("task.in_progress", "vykdoma")
     & P ("task.done", "atlikta")
     & P ("task.skipped", "praleista")
     & P ("task.blocked_task", "užblokuota")
     & P ("task.waiting_on", "laukiama")
     & P ("ticket.ticket_new", "nauja užklausa")
     & P ("ticket.ticket_open", "užklausa atvira")
     & P ("ticket.ticket_waiting", "užklausa laukia")
     & P ("ticket.ticket_escalated", "užklausa eskaluota")
     & P ("ticket.ticket_resolved", "užklausa išspręsta")
     & P ("ticket.ticket_closed", "užklausa uždaryta")
     & P ("transfer.importing", "importuojama")
     & P ("transfer.imported", "importuota")
     & P ("transfer.import_failed", "importuoti nepavyko")
     & P ("transfer.exporting", "eksportuojama")
     & P ("transfer.exported", "eksportuota")
     & P ("transfer.export_failed", "eksportuoti nepavyko")
     & P ("validation.required", "privaloma")
     & P ("validation.optional", "neprivaloma")
     & P ("validation.invalid", "netinkama")
     & P ("validation.too_short", "per trumpa")
     & P ("validation.too_long", "per ilga")
     & P ("validation.out_of_range", "už leistino intervalo ribų")
     & P ("validation.already_exists", "jau yra")
     & P ("workflow.draft", "juodraštis")
     & P ("workflow.in_review", "peržiūrima")
     & P ("workflow.approved", "patvirtinta")
     & P ("workflow.rejected", "atmesta")
     & P ("workflow.published", "paskelbta")
     & P ("workflow.archived", "archyvuota")
     & P ("database.database_online", "duomenų bazė pasiekiama")
     & P ("database.database_offline", "duomenų bazė nepasiekiama")
     & P ("database.database_degraded", "duomenų bazė veikia su trikdžiais")
     & P ("database.database_migrating", "vykdoma duomenų bazės migracija")
     & P ("database.database_migration_failed", "duomenų bazės migracija nepavyko")
     & P ("database.database_replicating", "duomenų bazė replikuojama")
     & P ("database.database_replication_lagging", "duomenų bazės replikacija vėluoja")
     & P ("database.database_backup_running", "kuriama duomenų bazės atsarginė kopija")
     & P ("database.database_backup_failed", "nepavyko sukurti duomenų bazės atsarginės kopijos")
     & P ("calendar_difference.case.future", "genitive")
     & P ("calendar_difference.case.past", "accusative")
     & P ("date_comparison.after", "{current} {quantity} vėliau nei {baseline}")
     & P ("date_comparison.before", "{current} {quantity} anksčiau nei {baseline}")
     & P ("date_comparison.case.after", "instrumental")
     & P ("date_comparison.case.before", "instrumental")
     & P ("count",
          "{count, plural, one {# {one}} few {# {other}} many {# {genitive_one}} "
          & "other {# {genitive_other}}}")
     & P ("noun",
          "{count, plural, one {{one}} few {{other}} many {{genitive_one}} other "
          & "{{genitive_other}}}")
     & P ("times_noun",
          "{count, plural, =0 {{other}: niekada} =1 {{one}: vieną kartą} =2 "
          & "{{other}: du kartus} one {{other}: {count} kartą} few {{other}: "
          & "{count} kartus} many {{other}: {count} karto} other {{other}: {count} "
          & "kartų}}")
     & P ("availability.all",
          "pasiekiama {available} iš {total} {total, plural, one "
          & "{{genitive_one}} few {{genitive_other}} many {{genitive_one}} other "
          & "{{genitive_other}}}")
     & P ("availability.none", "nėra pasiekiamų {genitive_other}")
     & P ("availability.partial",
          "pasiekiama {available} iš {total} {total, plural, one "
          & "{{genitive_one}} few {{genitive_other}} many {{genitive_one}} other "
          & "{{genitive_other}}}, nepasiekiama {unavailable}")
     & P ("operation_progress", "{name} – {state}: {details}")
     & P ("operation.queued", "eilėje")
     & P ("operation.running", "vykdoma")
     & P ("operation.blocked", "užblokuota")
     & P ("operation.retrying", "kartojama")
     & P ("operation.succeeded", "sėkmingai")
     & P ("operation.partially_succeeded", "iš dalies sėkmingai")
     & P ("operation.failed", "nepavyko")
     & P ("operation.canceled", "atšaukta")
     & P ("operation.skipped", "praleista")
     & P ("operation.stale", "pasenę")
     & P ("operation.unknown_state", "nežinoma")
     & P ("operation.last_success", "{name} – paskutinį kartą pavyko: {time}")
     & P ("operation.next_retry", "{name} – kitas bandymas: {time}")
     & P ("operation.stale_run", "{name} – neatnaujinta: {time}")
     & P ("summary.skipped", "praleista: {count}")
     & P ("summary.retried", "kartota: {count}")
     & P ("summary.canceled", "atšaukta: {count}")
     & P ("system.service.operational", "veikia")
     & P ("system.service.degraded", "sumažėjęs našumas")
     & P ("system.service.partial_outage", "dalinis sutrikimas")
     & P ("system.service.major_outage", "didelis sutrikimas")
     & P ("system.service.maintenance", "vykdoma priežiūra")
     & P ("system.service.unknown", "paslaugos būsena nežinoma")
     & P ("system.health.healthy", "būklė gera")
     & P ("system.health.warning", "įspėjimas")
     & P ("system.health.critical", "kritinė būklė")
     & P ("system.health.unavailable", "nepasiekiama")
     & P ("system.health.unknown_health", "būklė nežinoma")
     & P ("system.readiness.ready", "parengta")
     & P ("system.readiness.not_ready", "neparengta")
     & P ("system.readiness.starting", "paleidžiama")
     & P ("system.readiness.draining", "atlaisvinama")
     & P ("system.readiness.stopped", "sustabdyta")
     & P ("system.readiness.unknown_readiness", "parengtis nežinoma")
     & P ("system.component.online", "tinkle")
     & P ("system.component.offline", "ne tinkle")
     & P ("system.component.starting", "paleidžiama")
     & P ("system.component.stopping", "stabdoma")
     & P ("system.component.restarting", "paleidžiama iš naujo")
     & P ("system.component.unknown", "komponento būsena nežinoma")
     & P ("system.check.passing", "sėkminga")
     & P ("system.check.failing", "nesėkminga")
     & P ("system.check.warning", "įspėjimas")
     & P ("system.check.skipped", "praleista")
     & P ("system.check.timed_out", "baigėsi laikas")
     & P ("system.check.unknown", "patikros būsena nežinoma")
     & P ("system.incident.investigating", "tiriama")
     & P ("system.incident.identified", "priežastis nustatyta")
     & P ("system.incident.monitoring", "stebima")
     & P ("system.incident.resolved", "išspręsta")
     & P ("system.incident.scheduled_maintenance", "planinė priežiūra")
     & P ("system.named", "{name}: {state}")
     & P ("system.check_named", "patikra {name}: {state}")
     & P ("system.count.components",
          "{count, plural, =0 {nėra komponentų} one {{count} komponentas} few "
          & "{{count} komponentai} many {{count} komponento} other {{count} "
          & "komponentų}}")
     & P ("system.count.checks",
          "{count, plural, =0 {nėra patikrų} one {{count} patikra} few {{count} "
          & "patikros} many {{count} patikros} other {{count} patikrų}}")
     & P ("system.count.incidents",
          "{count, plural, =0 {nėra incidentų} one {{count} incidentas} few "
          & "{{count} incidentai} many {{count} incidento} other {{count} "
          & "incidentų}}")
     & P ("system.uptime", "pasiekiamumas: {measure}")
     & P ("system.latency", "delsa: {measure}")
     & P ("system.maintenance_window", "priežiūros langas: {time}")
     & P ("system.last_checked", "paskutinį kartą tikrinta: {time}")
     & P ("system.http.informational", "informacinis atsakas")
     & P ("system.http.successful", "sėkmingas atsakas")
     & P ("system.http.redirection", "peradresavimas")
     & P ("system.http.client_error", "kliento klaida")
     & P ("system.http.server_error", "serverio klaida")
     & P ("system.exit.success", "išėjimo kodas {code}: sėkmė")
     & P ("system.exit.failure", "išėjimo kodas {code}: nesėkmė")
     & P ("system.exit.usage_error", "išėjimo kodas {code}: naudojimo klaida")
     & P ("system.exit.not_executable", "išėjimo kodas {code}: komanda nevykdoma")
     & P ("system.exit.not_found", "išėjimo kodas {code}: komanda nerasta")
     & P ("system.exit.invalid_argument", "išėjimo kodas {code}: netinkamas exit argumentas")
     & P ("system.exit.signal", "išėjimo kodas {code}: nutraukta signalu {signal}");
end Locale_Lt;
