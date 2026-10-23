separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Ro (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "ro", Name, Template);
   end P;
begin
   P ("all_count",
      "{total} {total, plural, one {{one}} few {{few}} other {de {other}}} "
      & "în total");
   P ("filtered_count.none", "{other}: nicio potrivire");
   P ("filtered_count.all",
      "{total} din {total} {total, plural, one {{one}} few {{few}} other {de "
      & "{other}}} {total, plural, one {corespunde} other {corespund}}");
   P ("filtered_count.some",
      "{matching} din {total} {total, plural, one {{one}} few {{few}} other "
      & "{de {other}}} {matching, plural, one {corespunde} other {corespund}}");
   P ("more_count", "se afișează {visible}, încă {remaining}");
   P ("others_count", "{first} și încă {remaining}");
   P ("page_count", "pagina {page} din {total}");
   P ("page_size",
      "{size} {size, plural, one {{one}} few {{few}} other {de {other}}} pe "
      & "pagină");
   P ("pagination_range",
      "{first}–{last} din {total} {total, plural, one {{one}} few {{few}} "
      & "other {de {other}}}");
   P ("position_count", "{position} din {total}");
   P ("selection_count",
      "{selected, plural, one {s-a selectat} other {s-au selectat}} "
      & "{selected} din {total} {total, plural, one {{one}} few {{few}} other "
      & "{de {other}}}");
   P ("showing_count",
      "se afișează {showing} din {total} {total, plural, one {{one}} few "
      & "{{few}} other {de {other}}}");
   P ("validation_count",
      "{count, plural, =0 {{severity, select, error {nicio eroare} warning "
      & "{niciun avertisment} other {nicio notificare}}} one {1 {severity, "
      & "select, error {eroare} warning {avertisment} other {notificare}}} few "
      & "{{count} {severity, select, error {erori} warning {avertismente} other "
      & "{notificări}}} other {{count} de {severity, select, error {erori} "
      & "warning {avertismente} other {notificări}}}}");
   P ("collection.empty", "nu există {other}");
   P ("collection.none_shown", "nu se afișează {other}");
   P ("collection.showing_hidden",
      "{gender, select, masculine {se afișează {visible} din {total} "
      & "{total, plural, one {{one}} few {{few}} other {de {other}}}, ascunși: "
      & "{hidden}} other {se afișează {visible} din {total} {total, plural, "
      & "one {{one}} few {{few}} other {de {other}}}, ascunse: {hidden}}}");
   P ("collection.showing",
      "se afișează {visible} din {total} {total, plural, one {{one}} few "
      & "{{few}} other {de {other}}}");
   P ("collection.shown_hidden",
      "{gender, select, masculine {se afișează {visible} {visible, plural, "
      & "one {{one}} few {{few}} other {de {other}}}, ascunși: {hidden}} other "
      & "{se afișează {visible} {visible, plural, one {{one}} few {{few}} "
      & "other {de {other}}}, ascunse: {hidden}}}");
   P ("collection.shown",
      "se afișează {visible} {visible, plural, one {{one}} few {{few}} "
      & "other {de {other}}}");
   P ("collection.visible_out_of",
      "{visible, plural, one {se vede} other {se văd}} {visible} {visible, "
      & "plural, one {{one}} few {{few}} other {de {other}}} din {total} "
      & "{total, plural, one {{one}} few {{few}} other {de {other}}}");
   P ("complete_count", "finalizate: {done} din {total}");
   P ("percent_complete", "{percent} % finalizat");
   P ("step_count", "pasul {step} din {total}");
   P ("attempt_count", "încercarea {attempt} din {total}");
   P ("throughput_remaining",
      "{remaining, plural, one {mai rămâne} other {mai rămân}} "
      & "{remaining} {remaining, plural, one {{one}} few {{few}} other {de "
      & "{other}}}, la {rate} {unit}/s");
   P ("accessible_progress", "progres: {done} din {total}, {percent} la sută");
   P ("business_days",
      "{days} {days, plural, one {zi lucrătoare} few {zile lucrătoare} "
      & "other {de zile lucrătoare}}");
   P ("working_hours",
      "{hours} {hours, plural, one {oră de lucru} few {ore de lucru} other "
      & "{de ore de lucru}}");
   P ("due.overdue",
      "termen depășit cu {days} {days, plural, one {zi} few {zile} other "
      & "{de zile}}");
   P ("due.today", "scadent astăzi");
   P ("due.tomorrow", "scadent mâine");
   P ("due.in",
      "scadent peste {days} {days, plural, one {zi} few {zile} other {de "
      & "zile}}");
   P ("calendar_difference.future", "peste {difference}");
   P ("calendar_difference.past", "acum {difference}");
   P ("calendar_difference.same_day", "aceeași zi");
   P ("calendar_difference.zero", "0 zile");
   P ("cpu_load", "încărcare CPU {measure}");
   P ("battery", "baterie {measure}");
   P ("screen_size", "ecran {measure}");
   P ("refresh_rate", "rată de reîmprospătare {measure}");
   P ("editorial_percent.symbol", "{value} %");
   P ("editorial_percent.word", "{value} la sută");
   P ("recurrence.second",
      "{every, plural, one {în fiecare secundă} few {la fiecare {every} "
      & "secunde} other {la fiecare {every} de secunde}}");
   P ("recurrence.minute",
      "{every, plural, one {în fiecare minut} few {la fiecare {every} "
      & "minute} other {la fiecare {every} de minute}}");
   P ("recurrence.hour",
      "{every, plural, one {în fiecare oră} few {la fiecare {every} ore} "
      & "other {la fiecare {every} de ore}}");
   P ("recurrence.day",
      "{every, plural, one {în fiecare zi} few {la fiecare {every} zile} "
      & "other {la fiecare {every} de zile}}");
   P ("recurrence.week",
      "{every, plural, one {în fiecare săptămână} few {la fiecare "
      & "{every} săptămâni} other {la fiecare {every} de săptămâni}}");
   P ("recurrence.month",
      "{every, plural, one {în fiecare lună} few {la fiecare {every} luni} "
      & "other {la fiecare {every} de luni}}");
   P ("recurrence.quarter",
      "{every, plural, one {în fiecare trimestru} few {la fiecare {every} "
      & "trimestre} other {la fiecare {every} de trimestre}}");
   P ("recurrence.year",
      "{every, plural, one {în fiecare an} few {la fiecare {every} ani} "
      & "other {la fiecare {every} de ani}}");
   P ("cache_summary.empty", "cache: nicio cerere");
   P ("cache_summary",
      "cache: {hits} {hits, plural, one {accesare reușită} few {accesări "
      & "reușite} other {de accesări reușite}}, {misses} {misses, plural, "
      & "one {ratare} few {ratări} other {de ratări}}, rată de reușită "
      & "{rate} %");
   P ("field_change_summary",
      "{gender, select, masculine {{total} {total, plural, one {{one}} few "
      & "{{few}} other {de {other}}}: modificați {changed}, adăugați "
      & "{added}, eliminați {removed}} other {{total} {total, plural, one "
      & "{{one}} few {{few}} other {de {other}}}: modificate {changed}, "
      & "adăugate {added}, eliminate {removed}}}");
   P ("field_diff", "{field} s-a schimbat din {before} în {after}");
   P ("field_added", "s-a adăugat {field} cu valoarea {value}");
   P ("field_removed", "s-a eliminat {field} (era {value})");
   P ("field_unchanged", "{field} nu s-a schimbat, rămâne {value}");
   P ("number_comparison.equal", "{current} este egal cu {baseline}");
   P ("number_comparison.higher", "{current} este cu {quantity} mai mare decât {baseline}");
   P ("number_comparison.lower", "{current} este cu {quantity} mai mic decât {baseline}");
   P ("percent_comparison.equal", "{current} este egal cu {baseline}");
   P ("percent_comparison.higher", "{current} este cu {quantity} mai mare decât {baseline}");
   P ("percent_comparison.lower", "{current} este cu {quantity} mai mic decât {baseline}");
   P ("file_size_comparison.same", "{current} are aceeași dimensiune ca {baseline}");
   P ("file_size_comparison.larger", "{current} este cu {quantity} mai mare decât {baseline}");
   P ("file_size_comparison.smaller", "{current} este cu {quantity} mai mic decât {baseline}");
   P ("date_comparison.same", "{current} este aceeași dată ca {baseline}");
   P ("date_comparison.after", "{current} este la {quantity} după {baseline}");
   P ("date_comparison.before", "{current} este cu {quantity} înainte de {baseline}");
   P ("queue_summary", "coadă: {details}");
   P ("queue_summary.empty", "coadă goală");
   P ("domain_summary",
      "{domain, select, queue {coadă} job {sarcină} run {rulare} cache "
      & "{cache} sync {sincronizare} import {import} export {export} other "
      & "{{domain}}} {state, select, queued {în coadă} running {în curs} "
      & "waiting {în așteptare} paused {în pauză} complete {{domain, "
      & "select, queue {finalizată} job {finalizată} run {finalizată} sync "
      & "{finalizată} other {finalizat}}} failed {{domain, select, queue "
      & "{eșuată} job {eșuată} run {eșuată} sync {eșuată} other "
      & "{eșuat}}} stale {{domain, select, queue {învechită} job "
      & "{învechită} run {învechită} sync {învechită} other {învechit}}} "
      & "skipped {{domain, select, queue {omisă} job {omisă} run {omisă} "
      & "sync {omisă} other {omis}}} other {{state}}}: {details}");
   P ("summary.none", "nu există {other}");
   P ("summary.completed",
      "{count, plural, one {s-a finalizat} other {s-au finalizat}} {count} "
      & "{count, plural, one {{one}} few {{few}} other {de {other}}}");
   P ("summary.completed_of",
      "{count, plural, one {s-a finalizat} other {s-au finalizat}} {count} "
      & "din {total} {total, plural, one {{one}} few {{few}} other {de "
      & "{other}}}");
   P ("summary.failed", "eșuate: {count}");
   P ("summary.queued",
      "{count} {count, plural, one {{one}} few {{few}} other {de {other}}} "
      & "în coadă");
   P ("summary.running", "în curs: {count}");
   P ("summary.complete", "finalizate: {count}");
   P ("backup.backup_running", "backup în curs");
   P ("backup.backup_completed", "backup finalizat");
   P ("backup.backup_failed", "backup eșuat");
   P ("backup.backup_stale", "backup învechit");
   P ("incident.incident_investigating", "incident în curs de investigare");
   P ("incident.incident_identified", "incident identificat");
   P ("incident.incident_mitigated", "incident atenuat");
   P ("incident.incident_resolved", "incident rezolvat");
   P ("release.release_drafting", "versiune în pregătire");
   P ("release.release_ready", "versiune pregătită");
   P ("release.release_published", "versiune publicată");
   P ("release.release_rolled_back", "versiune retrasă");
   P ("audit.audit_created", "înregistrare de audit creată");
   P ("audit.audit_updated", "înregistrare de audit actualizată");
   P ("audit.audit_deleted", "înregistrare de audit ștearsă");
   P ("audit.audit_restored", "înregistrare de audit restaurată");
   P ("flag.flag_enabled", "flag de funcționalitate activat");
   P ("flag.flag_disabled", "flag de funcționalitate dezactivat");
   P ("flag.flag_rolling_out", "flag de funcționalitate în curs de lansare");
   P ("flag.flag_rolled_back", "flag de funcționalitate retras");
   P ("webhook.webhook_pending", "webhook în așteptare");
   P ("webhook.webhook_delivered", "webhook livrat");
   P ("webhook.webhook_failed", "webhook eșuat");
   P ("webhook.webhook_retrying", "webhook în curs de reîncercare");
   P ("api_key.api_key_active", "cheie API activă");
   P ("api_key.api_key_revoked", "cheie API revocată");
   P ("api_key.api_key_expired", "cheie API expirată");
   P ("api_key.api_key_rotated", "cheie API înlocuită");
   P ("quota.quota_available", "cotă disponibilă");
   P ("quota.quota_near_limit", "cotă aproape de limită");
   P ("quota.quota_exceeded", "cotă depășită");
   P ("quota.quota_reset", "cotă resetată");
   P ("invoice.invoice_draft", "ciornă de factură");
   P ("invoice.invoice_sent", "factură trimisă");
   P ("invoice.invoice_paid", "factură plătită");
   P ("invoice.invoice_refunded", "factură rambursată");
   P ("invoice.invoice_overdue", "factură restantă");
   P ("invoice.refund_failed", "rambursare eșuată");
   P ("page_navigation.only", "pagină unică");
   P ("page_navigation.first", "prima pagină, următoarea disponibilă");
   P ("page_navigation.last", "ultima pagină, precedenta disponibilă");
   P ("page_navigation.middle", "precedenta și următoarea disponibile");
   P ("end_of_week", "sfârșitul săptămânii");
   P ("end_of_month", "sfârșitul lunii");
   P ("end_of_quarter", "sfârșitul trimestrului");
   P ("time_of_day.night", "noapte");
   P ("time_of_day.morning", "dimineață");
   P ("time_of_day.afternoon", "după-amiază");
   P ("time_of_day.evening", "seară");
   P ("access.allowed", "permis");
   P ("access.denied", "refuzat");
   P ("access.owner", "proprietar");
   P ("access.admin", "administrator");
   P ("access.viewer", "vizualizator");
   P ("access.editor", "editor");
   P ("auth.signed_in", "conectat");
   P ("auth.signed_out", "deconectat");
   P ("auth.session_expired", "sesiune expirată");
   P ("auth.locked", "blocat");
   P ("auth.two_factor_required", "autentificare în doi pași necesară");
   P ("billing.trialing", "perioadă de probă");
   P ("billing.payment_due", "plată scadentă");
   P ("billing.payment_failed", "plată eșuată");
   P ("billing.paid", "plătit");
   P ("billing.past_due", "restant");
   P ("billing.canceled", "anulat");
   P ("ci.pipeline_pending", "pipeline în așteptare");
   P ("ci.pipeline_running", "pipeline în curs");
   P ("ci.pipeline_passed", "pipeline reușit");
   P ("ci.pipeline_failed", "pipeline eșuat");
   P ("ci.review_required", "revizuire necesară");
   P ("ci.deploy_blocked", "implementare blocată");
   P ("collaboration.active_now", "activ acum");
   P ("collaboration.away", "absent");
   P ("collaboration.do_not_disturb", "nu deranjați");
   P ("collaboration.typing", "scrie");
   P ("collaboration.viewing", "vizualizează");
   P ("collaboration.editing", "editează");
   P ("deployment.deploying", "implementare în curs");
   P ("deployment.deployed", "implementat");
   P ("deployment.rolling_back", "revenire în curs");
   P ("deployment.rolled_back", "revenire efectuată");
   P ("deployment.build_failed", "build eșuat");
   P ("deployment.checks_passed", "verificări reușite");
   P ("empty.no_items", "niciun element");
   P ("empty.no_results", "niciun rezultat");
   P ("empty.no_messages", "niciun mesaj");
   P ("empty.no_selection", "nicio selecție");
   P ("empty.nothing_to_show", "nimic de afișat");
   P ("file.uploading", "încărcare în curs");
   P ("file.downloading", "descărcare în curs");
   P ("file.copying", "copiere în curs");
   P ("file.moving", "mutare în curs");
   P ("file.deleting", "ștergere în curs");
   P ("file.deleted", "șters");
   P ("file.restoring", "restaurare în curs");
   P ("file.synced", "sincronizat");
   P ("form.valid_input", "intrare validă");
   P ("form.invalid_input", "intrare nevalidă");
   P ("form.dirty", "modificat");
   P ("form.pristine", "nemodificat");
   P ("form.submitted", "trimis");
   P ("form.submission_failed", "trimitere eșuată");
   P ("health.healthy", "funcțional");
   P ("health.degraded", "degradat");
   P ("health.unhealthy", "nefuncțional");
   P ("health.incident", "incident");
   P ("health.maintenance", "mentenanță");
   P ("health.recovering", "recuperare în curs");
   P ("issue.open", "deschis");
   P ("issue.closed", "închis");
   P ("issue.reopened", "redeschis");
   P ("issue.assigned", "atribuit");
   P ("issue.unassigned", "neatribuit");
   P ("issue.merged", "îmbinat");
   P ("network.offline", "offline");
   P ("network.online", "online");
   P ("network.connecting", "conectare în curs");
   P ("network.syncing", "sincronizare în curs");
   P ("network.sync_failed", "sincronizare eșuată");
   P ("network.permission_denied", "permisiune refuzată");
   P ("network.read_only", "doar citire");
   P ("notification.unread", "necitit");
   P ("notification.read", "citit");
   P ("notification.muted", "fără sunet");
   P ("notification.snoozed", "amânat");
   P ("notification.sent", "trimis");
   P ("notification.delivered", "livrat");
   P ("payment.payment_authorized", "plată autorizată");
   P ("payment.payment_captured", "plată încasată");
   P ("payment.payment_refunded", "plată rambursată");
   P ("payment.payment_disputed", "plată contestată");
   P ("payment.payment_requires_action", "plata necesită acțiune");
   P ("payment.payment_expired", "plată expirată");
   P ("ui.empty", "gol");
   P ("ui.loading", "se încarcă");
   P ("ui.saving", "se salvează");
   P ("ui.saved", "salvat");
   P ("ui.unsaved", "nesalvat");
   P ("ui.retrying", "se reîncearcă");
   P ("ui.paused", "întrerupt");
   P ("ui.complete", "finalizat");
   P ("ui.failed", "eșuat");
   P ("ui.due_soon", "scadent în curând");
   P ("ui.overdue", "termen depășit");
   P ("ui.last_seen", "văzut ultima dată");
   P ("ui.updated_just_now", "actualizat chiar acum");
   P ("queue.queued", "în coadă");
   P ("queue.running", "în curs");
   P ("queue.waiting", "în așteptare");
   P ("queue.blocked", "blocat");
   P ("queue.canceled_job", "sarcină anulată");
   P ("queue.completed_job", "sarcină finalizată");
   P ("search.filtering", "filtrare în curs");
   P ("search.filtered", "filtrat");
   P ("search.no_matches", "nicio potrivire");
   P ("search.search_ready", "căutare pregătită");
   P ("search.search_failed", "căutare eșuată");
   P ("search.query_too_short", "interogare prea scurtă");
   P ("security.secure", "securizat");
   P ("security.insecure", "nesecurizat");
   P ("security.vulnerable", "vulnerabil");
   P ("security.encrypted", "criptat");
   P ("security.unencrypted", "necriptat");
   P ("security.token_expired", "token expirat");
   P ("sync.sync_idle", "sincronizare inactivă");
   P ("sync.syncing_now", "se sincronizează acum");
   P ("sync.sync_queued", "sincronizare în coadă");
   P ("sync.sync_conflict", "conflict de sincronizare");
   P ("sync.sync_complete", "sincronizare finalizată");
   P ("sync.sync_error", "eroare de sincronizare");
   P ("task.todo", "de făcut");
   P ("task.in_progress", "în desfășurare");
   P ("task.done", "gata");
   P ("task.skipped", "omis");
   P ("task.blocked_task", "blocat");
   P ("task.waiting_on", "așteaptă răspuns");
   P ("ticket.ticket_new", "tichet nou");
   P ("ticket.ticket_open", "tichet deschis");
   P ("ticket.ticket_waiting", "tichet în așteptare");
   P ("ticket.ticket_escalated", "tichet escaladat");
   P ("ticket.ticket_resolved", "tichet rezolvat");
   P ("ticket.ticket_closed", "tichet închis");
   P ("transfer.importing", "import în curs");
   P ("transfer.imported", "importat");
   P ("transfer.import_failed", "import eșuat");
   P ("transfer.exporting", "export în curs");
   P ("transfer.exported", "exportat");
   P ("transfer.export_failed", "export eșuat");
   P ("validation.required", "obligatoriu");
   P ("validation.optional", "opțional");
   P ("validation.invalid", "nevalid");
   P ("validation.too_short", "prea scurt");
   P ("validation.too_long", "prea lung");
   P ("validation.out_of_range", "în afara intervalului");
   P ("validation.already_exists", "există deja");
   P ("workflow.draft", "ciornă");
   P ("workflow.in_review", "în revizuire");
   P ("workflow.approved", "aprobat");
   P ("workflow.rejected", "respins");
   P ("workflow.published", "publicat");
   P ("workflow.archived", "arhivat");
   P ("database.database_online", "bază de date online");
   P ("database.database_offline", "bază de date offline");
   P ("database.database_degraded", "bază de date degradată");
   P ("database.database_migrating", "migrare bază de date în curs");
   P ("database.database_migration_failed", "migrare bază de date eșuată");
   P ("database.database_replicating", "replicare bază de date în curs");
   P ("database.database_replication_lagging", "replicare bază de date întârziată");
   P ("database.database_backup_running", "backup bază de date în curs");
   P ("database.database_backup_failed", "backup bază de date eșuat");
   P ("times_noun",
      "{count, plural, =0 {niciodată {other}} =1 {o dată {one}} =2 {de "
      & "două ori {other}} few {de {count} ori {other}} other {de {count} de "
      & "ori {other}}}");
   P ("availability.all",
      "{available} din {total} {total, plural, one {{one}} few {{few}} other "
      & "{de {other}}} la dispoziție");
   P ("availability.none", "nu există {other} la dispoziție");
   P ("availability.partial",
      "{gender, select, masculine {{available} din {total} {total, plural, "
      & "one {{one}} few {{few}} other {de {other}}} la dispoziție, "
      & "indisponibili: {unavailable}} other {{available} din {total} {total, "
      & "plural, one {{one}} few {{few}} other {de {other}}} la dispoziție, "
      & "indisponibile: {unavailable}}}");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "în coadă");
   P ("operation.running", "în curs");
   P ("operation.blocked", "blocat");
   P ("operation.retrying", "reîncercare");
   P ("operation.succeeded", "reușit");
   P ("operation.partially_succeeded", "reușit parțial");
   P ("operation.failed", "eșuat");
   P ("operation.canceled", "anulat");
   P ("operation.skipped", "omis");
   P ("operation.stale", "învechit");
   P ("operation.unknown_state", "necunoscut");
   P ("operation.last_success", "{name} – ultima reușită: {time}");
   P ("operation.next_retry", "{name} – următoarea reîncercare: {time}");
   P ("operation.stale_run", "{name} – fără actualizare de {time}");
   P ("summary.skipped", "omise: {count}");
   P ("summary.retried", "reîncercate: {count}");
   P ("summary.canceled", "anulate: {count}");
   P ("system.service.operational", "operațional");
   P ("system.service.degraded", "performanță redusă");
   P ("system.service.partial_outage", "întrerupere parțială");
   P ("system.service.major_outage", "întrerupere majoră");
   P ("system.service.maintenance", "în mentenanță");
   P ("system.service.unknown", "stare necunoscută a serviciului");
   P ("system.health.healthy", "funcțional");
   P ("system.health.warning", "avertisment");
   P ("system.health.critical", "critic");
   P ("system.health.unavailable", "indisponibil");
   P ("system.health.unknown_health", "stare de sănătate necunoscută");
   P ("system.readiness.ready", "pregătit");
   P ("system.readiness.not_ready", "nepregătit");
   P ("system.readiness.starting", "pornire în curs");
   P ("system.readiness.draining", "golire în curs");
   P ("system.readiness.stopped", "oprit");
   P ("system.readiness.unknown_readiness", "stare de pregătire necunoscută");
   P ("system.component.online", "online");
   P ("system.component.offline", "offline");
   P ("system.component.starting", "pornire în curs");
   P ("system.component.stopping", "oprire în curs");
   P ("system.component.restarting", "repornire în curs");
   P ("system.component.unknown", "stare necunoscută a componentei");
   P ("system.check.passing", "reușită");
   P ("system.check.failing", "eșuată");
   P ("system.check.warning", "avertisment");
   P ("system.check.skipped", "omisă");
   P ("system.check.timed_out", "expirată");
   P ("system.check.unknown", "stare necunoscută a verificării");
   P ("system.incident.investigating", "investigare în curs");
   P ("system.incident.identified", "identificat");
   P ("system.incident.monitoring", "monitorizare în curs");
   P ("system.incident.resolved", "rezolvat");
   P ("system.incident.scheduled_maintenance", "mentenanță programată");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "verificarea {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {nicio componentă} one {{count} componentă} few "
      & "{{count} componente} other {{count} de componente}}");
   P ("system.count.checks",
      "{count, plural, =0 {nicio verificare} one {{count} verificare} few "
      & "{{count} verificări} other {{count} de verificări}}");
   P ("system.count.incidents",
      "{count, plural, =0 {niciun incident} one {{count} incident} few "
      & "{{count} incidente} other {{count} de incidente}}");
   P ("system.uptime", "timp de funcționare: {measure}");
   P ("system.latency", "latență: {measure}");
   P ("system.maintenance_window", "fereastră de mentenanță: {time}");
   P ("system.last_checked", "ultima verificare {time}");
   P ("system.http.informational", "informațional");
   P ("system.http.successful", "succes");
   P ("system.http.redirection", "redirecționare");
   P ("system.http.client_error", "eroare client");
   P ("system.http.server_error", "eroare server");
   P ("system.exit.success", "cod de ieșire {code}: succes");
   P ("system.exit.failure", "cod de ieșire {code}: eșec");
   P ("system.exit.usage_error", "cod de ieșire {code}: eroare de utilizare");
   P ("system.exit.not_executable", "cod de ieșire {code}: comandă neexecutabilă");
   P ("system.exit.not_found", "cod de ieșire {code}: comandă negăsită");
   P ("system.exit.invalid_argument", "cod de ieșire {code}: argument de ieșire nevalid");
   P ("system.exit.signal", "cod de ieșire {code}: terminat de {signal}");
   P ("validation.problem.required", "{field}: câmp obligatoriu");
   P ("validation.problem.minimum", "{field}: valoare sub minim");
   P ("validation.problem.maximum", "{field}: valoare peste maxim");
   P ("validation.problem.range", "{field}: valoare în afara intervalului permis");
   P ("validation.problem.pattern", "{field}: nu corespunde formatului cerut");
   P ("validation.problem.choice", "{field}: trebuie să fie una dintre opțiunile permise");
   P ("validation.problem.dependency", "{field}: depinde de alt câmp");
   P ("validation.problem.custom", "{field}: valoare nevalidă");
   P ("validation.constraint.no_relation", "{field}: trebuie să fie o valoare {value} validă");
   P ("validation.constraint.less_than", "{field}: valoarea trebuie să fie mai mică decât {value}");
   P ("validation.constraint.less_or_equal", "{field}: valoarea trebuie să fie cel mult {value}");
   P ("validation.constraint.greater_than", "{field}: valoarea trebuie să fie mai mare decât {value}");
   P ("validation.constraint.greater_or_equal", "{field}: valoarea trebuie să fie cel puțin {value}");
   P ("validation.constraint.equal_to", "{field}: valoarea trebuie să fie egală cu {value}");
   P ("validation.constraint.not_equal_to", "{field}: valoarea trebuie să fie diferită de {value}");
   P ("validation.constraint.before_field", "{field}: valoarea trebuie să fie înainte de {value}");
   P ("validation.constraint.after_field", "{field}: valoarea trebuie să fie după {value}");
   P ("validation.choices", "{field}: valori permise: {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, valoare primită: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, reîncercare peste {time}");
   P ("net_diagnostic.dns", "{endpoint}: căutarea DNS a eșuat");
   P ("net_diagnostic.tcp", "{endpoint}: conexiunea TCP a eșuat");
   P ("net_diagnostic.tls", "{endpoint}: verificarea certificatului TLS a eșuat");
   P ("net_diagnostic.http", "{endpoint}: cererea HTTP a eșuat");
   P ("net_diagnostic.proxy", "{endpoint}: eroare de proxy");
   P ("net_diagnostic.timeout", "{endpoint}: timpul de așteptare a expirat");
   P ("net_diagnostic.reset", "{endpoint}: conexiunea a fost resetată");
   P ("net_diagnostic.unknown_network", "{endpoint}: eroare de rețea");
   P ("progress.state.not_started", "nepornit");
   P ("progress.state.running", "în desfășurare");
   P ("progress.state.stalled", "blocat");
   P ("progress.state.retrying", "se reîncearcă");
   P ("progress.state.complete", "finalizat");
   P ("progress.state.failed", "eșuat");
   P ("progress.of",
      "{subject}: {done} din {total} {done, plural, one {finalizat} other "
      & "{finalizate}} ({percent} %), {state}");
   P ("progress.done",
      "{subject}: {done} {done, plural, one {finalizat} other {finalizate}}, "
      & "{state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {element} few {elemente} other {de "
      & "elemente}}, {unique} {unique, plural, one {valoare unică} few {valori "
      & "unice} other {de valori unice}}, {duplicates} {duplicates, plural, one "
      & "{duplicat} few {duplicate} other {de duplicate}}, {outliers} "
      & "{outliers, plural, one {valoare aberantă} few {valori aberante} other "
      & "{de valori aberante}}");
   P ("top_frequency",
      "{name}, cea mai frecventă valoare: {value} ({count, plural, =1 {o "
      & "dată} one {{count} dată} few {{count} ori} other {{count} de ori}})");
   P ("calendar_date.fiscal_year", "AF {year}");
   P ("calendar_date.fiscal_quarter", "AF {year} T{part}");
   P ("calendar_date.fiscal_half", "AF {year} S{part}");
   P ("calendar_date.fiscal_year_end", "sfârșitul AF {year}");
   P ("calendar_date.semester", "S{part} {year}");
   P ("calendar_date.half_year", "S{part} {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {prima jumătate a anului {year}} other {a doua "
      & "jumătate a anului {year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {începutul lunii {text}} mid {mijlocul lunii "
      & "{text}} other {sfârșitul lunii {text}}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {începutul {text}} mid {mijlocul {text}} other "
      & "{sfârșitul {text}}}");
   P ("calendar_range.weekend.last", "weekendul trecut");
   P ("calendar_range.weekend.this", "weekendul acesta");
   P ("calendar_range.weekend.next", "weekendul viitor");
   P ("calendar_range.weekend_of", "weekendul din {date}");
   P ("calendar_range.week.last", "săptămâna trecută");
   P ("calendar_range.week.this", "săptămâna aceasta");
   P ("calendar_range.week.next", "săptămâna viitoare");
   P ("calendar_range.week_of", "săptămâna din {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "continuă");
   P ("http.reason.101", "schimbare de protocol");
   P ("http.reason.102", "în procesare");
   P ("http.reason.103", "indicii timpurii");
   P ("http.reason.200", "ok");
   P ("http.reason.201", "creat");
   P ("http.reason.202", "acceptat");
   P ("http.reason.203", "informații neautoritare");
   P ("http.reason.204", "fără conținut");
   P ("http.reason.205", "resetare conținut");
   P ("http.reason.206", "conținut parțial");
   P ("http.reason.207", "stări multiple");
   P ("http.reason.208", "deja raportat");
   P ("http.reason.226", "IM folosit");
   P ("http.reason.300", "alegeri multiple");
   P ("http.reason.301", "mutat permanent");
   P ("http.reason.302", "găsit");
   P ("http.reason.303", "vezi altă resursă");
   P ("http.reason.304", "nemodificat");
   P ("http.reason.305", "folosește proxy");
   P ("http.reason.307", "redirecționare temporară");
   P ("http.reason.308", "redirecționare permanentă");
   P ("http.reason.400", "cerere greșită");
   P ("http.reason.401", "neautorizat");
   P ("http.reason.402", "plată necesară");
   P ("http.reason.403", "interzis");
   P ("http.reason.404", "negăsit");
   P ("http.reason.405", "metodă nepermisă");
   P ("http.reason.406", "inacceptabil");
   P ("http.reason.407", "autentificare la proxy necesară");
   P ("http.reason.408", "timpul de așteptare a cererii a expirat");
   P ("http.reason.409", "conflict");
   P ("http.reason.410", "dispărut");
   P ("http.reason.411", "lungime necesară");
   P ("http.reason.412", "precondiție eșuată");
   P ("http.reason.413", "conținut prea mare");
   P ("http.reason.414", "URI prea lung");
   P ("http.reason.415", "tip media neacceptat");
   P ("http.reason.416", "interval nesatisfăcător");
   P ("http.reason.417", "așteptare eșuată");
   P ("http.reason.418", "sunt un ceainic");
   P ("http.reason.421", "cerere direcționată greșit");
   P ("http.reason.422", "conținut neprocesabil");
   P ("http.reason.423", "blocat");
   P ("http.reason.424", "dependență eșuată");
   P ("http.reason.425", "prea devreme");
   P ("http.reason.426", "actualizare necesară");
   P ("http.reason.428", "precondiție necesară");
   P ("http.reason.429", "prea multe cereri");
   P ("http.reason.431", "câmpuri de antet ale cererii prea mari");
   P ("http.reason.451", "indisponibil din motive legale");
   P ("http.reason.500", "eroare internă a serverului");
   P ("http.reason.501", "neimplementat");
   P ("http.reason.502", "gateway greșit");
   P ("http.reason.503", "serviciu indisponibil");
   P ("http.reason.504", "timpul de așteptare al gateway-ului a expirat");
   P ("http.reason.505", "versiune HTTP neacceptată");
   P ("http.reason.506", "și varianta negociază");
   P ("http.reason.507", "spațiu de stocare insuficient");
   P ("http.reason.508", "buclă detectată");
   P ("http.reason.510", "neextins");
   P ("http.reason.511", "autentificare în rețea necesară");
   P ("errno.reason.0", "succes");
   P ("errno.reason.1", "operație nepermisă");
   P ("errno.reason.2", "nu există un astfel de fișier sau director");
   P ("errno.reason.3", "niciun astfel de proces");
   P ("errno.reason.4", "apel de sistem întrerupt");
   P ("errno.reason.5", "eroare de intrare/ieșire");
   P ("errno.reason.6", "nu există un astfel de dispozitiv sau adresă");
   P ("errno.reason.9", "descriptor de fișier incorect");
   P ("errno.reason.11", "resursa este temporar indisponibilă");
   P ("errno.reason.12", "nu se poate aloca memorie");
   P ("errno.reason.13", "permisiune refuzată");
   P ("errno.reason.17", "fișierul există");
   P ("errno.reason.20", "nu este un director");
   P ("errno.reason.21", "este un director");
   P ("errno.reason.22", "argument nevalid");
   P ("errno.reason.24", "prea multe fișiere deschise");
   P ("errno.reason.28", "nu a mai rămas spațiu liber pe dispozitiv");
   P ("errno.reason.32", "conductă(pipe) ruptă");
   P ("errno.reason.98", "adresa este deja utilizată");
   P ("errno.reason.110", "timpul de conectare a expirat");
   P ("errno.reason.111", "conectare refuzată");
   P ("signal.reason.1", "deconectare(Hangup)");
   P ("signal.reason.2", "întrerupere");
   P ("signal.reason.3", "ieșire");
   P ("signal.reason.4", "instrucțiune ilegală");
   P ("signal.reason.5", "capturare punct de întrerupere/traseu (al execuției)");
   P ("signal.reason.6", "abandonare");
   P ("signal.reason.7", "eroare de magistrală de date(bus)");
   P ("signal.reason.8", "excepție de virgulă mobilă");
   P ("signal.reason.9", "omorât");
   P ("signal.reason.10", "semnalul «1» definit de utilizator");
   P ("signal.reason.11", "eroare de segmentare");
   P ("signal.reason.12", "semnalul «2» definit de utilizator");
   P ("signal.reason.13", "conductă(pipe) ruptă");
   P ("signal.reason.14", "semnal temporizator");
   P ("signal.reason.15", "terminat");
   P ("signal.reason.17", "procesul-copil a terminat");
   P ("signal.reason.18", "continuat(reluat)");
   P ("signal.reason.19", "oprit (semnal)");
   P ("signal.reason.20", "oprit");
   P ("signal.reason.28", "fereastra s-a schimbat");
   P ("sqlstate.reason.00", "finalizare cu succes");
   P ("sqlstate.reason.01", "avertisment");
   P ("sqlstate.reason.02", "fără date");
   P ("sqlstate.reason.08", "excepție de conexiune");
   P ("sqlstate.reason.0a", "funcționalitate neacceptată");
   P ("sqlstate.reason.22", "excepție de date");
   P ("sqlstate.reason.23", "încălcare a constrângerii de integritate");
   P ("sqlstate.reason.24", "stare de cursor nevalidă");
   P ("sqlstate.reason.25", "stare de tranzacție nevalidă");
   P ("sqlstate.reason.28", "specificație de autorizare nevalidă");
   P ("sqlstate.reason.2d", "terminare de tranzacție nevalidă");
   P ("sqlstate.reason.3d", "nume de catalog nevalid");
   P ("sqlstate.reason.3f", "nume de schemă nevalid");
   P ("sqlstate.reason.40", "anulare a tranzacției");
   P ("sqlstate.reason.42", "eroare de sintaxă sau încălcare a regulii de acces");
   P ("sqlstate.reason.53", "resurse insuficiente");
   P ("sqlstate.reason.54", "limită a programului depășită");
   P ("sqlstate.reason.55", "obiectul nu este în starea necesară");
   P ("sqlstate.reason.57", "intervenția operatorului");
   P ("sqlstate.reason.58", "eroare de sistem");
   P ("sqlstate.reason.hv", "eroare a wrapper-ului de date externe");
   P ("sqlstate.reason.p0", "eroare PL/pgSQL");
   P ("sqlstate.reason.xx", "eroare internă");
   P ("system.signal_numbered", "semnal {number} {name} {reason}");
   P ("http.reason.unknown", "stare necunoscută");
   P ("errno.reason.unknown", "eroare necunoscută");
   P ("signal.reason.unknown", "semnal necunoscut");
   P ("sqlstate.reason.unknown", "clasă SQLSTATE necunoscută");
   P ("diff.changed", "diff {path}: modificat din {before} în {after}");
   P ("diff.added", "diff {path}: adăugat {after}");
   P ("diff.removed", "diff {path}: eliminat {before}");
   P ("diff.unchanged", "diff {path}: neschimbat");
   P ("diff.redacted", "diff {path}: modificat; valori ascunse");
   P ("validation.result",
      "rezultatul validării: {fields} {fields, plural, one {câmp} few "
      & "{câmpuri} other {de câmpuri}}, {errors} {errors, plural, one "
      & "{eroare} few {erori} other {de erori}}, {warnings} {warnings, plural, "
      & "one {avertisment} few {avertismente} other {de avertismente}}, "
      & "{required} {required, plural, one {câmp obligatoriu} few {câmpuri "
      & "obligatorii} other {de câmpuri obligatorii}}, {hidden} {hidden, "
      & "plural, one {problemă ascunsă} few {probleme ascunse} other {de "
      & "probleme ascunse}}");
   P ("file.kind.plain", "fișier");
   P ("file.kind.directory", "director");
   P ("file.kind.archive", "arhivă");
   P ("file.kind.compressed", "fișier comprimat");
   P ("file.kind.image", "imagine");
   P ("file.kind.script", "script");
   P ("file.kind.executable", "executabil");
   P ("file.kind.unknown", "fișier necunoscut");
   P ("file.metadata", "fișierul {name}: {kind}");
   P ("file.checksum", "{text}, suma de control {checksum}");
   P ("file.signature_match", "semnătura fișierului {name}: {kind}, corespunde extensiei");
   P ("file.signature_mismatch",
      "semnătura fișierului {name}: extensie de tip {expected}, conținut "
      & "de tip {actual}");
   P ("network_event.connecting", "conectare în curs");
   P ("network_event.connected", "conectat");
   P ("network_event.redirected", "redirecționat");
   P ("network_event.retrying", "reîncercare");
   P ("network_event.rate_limited", "limită de rată atinsă");
   P ("network_event.tls_failed", "TLS eșuat");
   P ("network_event.stalled", "blocat");
   P ("network_event.complete", "finalizat");
   P ("network_event.failed", "eșuat");
   P ("network.session", "rețeaua {endpoint}: {state}");
   P ("diff_node.field", "câmp");
   P ("diff_node.object", "obiect");
   P ("diff_node.list", "listă");
   P ("diff.node",
      "nodul diff {path}: {kind}, {count} {count, plural, one {modificare} "
      & "few {modificări} other {de modificări}}");
   P ("checksum.not_checked", "sumă de control neverificată");
   P ("checksum.valid", "sumă de control validă");
   P ("checksum.mismatch", "sumă de control nepotrivită");
   P ("checksum.missing", "sumă de control lipsă");
   P ("product_code", "codul de produs {kind}: {value}, {state}");
   P ("time_zone.utc", "fus orar: UTC");
   P ("time_zone.offset", "fus orar: {offset}");
   P ("time_zone.named", "fus orar: {name} ({offset})");
   P ("time_zone.local", "fus orar: oră locală");
   P ("time_zone.unknown", "fus orar: fus necunoscut");
   P ("time_zone.dst", "{text}, respectă ora de vară");
   P ("zoned_time.plain", "oră cu fus orar: {time} {offset}");
   P ("zoned_time.named", "oră cu fus orar: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, oră locală ambiguă");
end Locale_Ro;
