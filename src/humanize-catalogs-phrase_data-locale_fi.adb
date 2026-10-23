separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Fi (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "fi", Name, Template);
   end P;
begin
   P ("all_count", "kaikki {total, plural, one {{one}} other {{other}}} ({total})");
   P ("filtered_count.none", "{other}: ei osumia");
   P ("filtered_count.all",
      "{total, plural, one {{one}: 1/1 vastaa} other {{other}: kaikki {total} "
      & "vastaavat}}");
   P ("filtered_count.some",
      "{total, plural, one {{one}} other {{other}}}: {matching}/{total} "
      & "vastaa");
   P ("more_count", "{visible} näkyvissä, +{remaining} lisää");
   P ("others_count", "{first} ja {remaining, plural, one {1 muu} other {{remaining} muuta}}");
   P ("page_count", "sivu {page}/{total}");
   P ("page_size", "{size, plural, one {{one}} other {{other}}}: {size} sivua kohden");
   P ("pagination_range",
      "{first}–{last}/{total} ({total, plural, one {{one}} other "
      & "{{other}}})");
   P ("position_count", "{position}/{total}");
   P ("selection_count",
      "{total, plural, one {{one}} other {{other}}}: {selected}/{total} "
      & "valittu");
   P ("showing_count",
      "näytetään {showing}/{total} ({total, plural, one {{one}} other "
      & "{{other}}})");
   P ("validation_count",
      "{count, plural, =0 {ei {severity, select, error {virheitä} warning "
      & "{varoituksia} other {huomautuksia}}} one {{count} {severity, select, "
      & "error {virhe} warning {varoitus} other {huomautus}}} other {{count} "
      & "{severity, select, error {virhettä} warning {varoitusta} other "
      & "{huomautusta}}}}");
   P ("collection.empty", "{other}: ei yhtään");
   P ("collection.none_shown", "{other}: ei yhtään näkyvissä");
   P ("collection.showing_hidden",
      "näytetään {visible}/{total} ({total, plural, one {{one}} other "
      & "{{other}}}), {hidden} piilotettu");
   P ("collection.showing",
      "näytetään {visible}/{total} ({total, plural, one {{one}} other "
      & "{{other}}})");
   P ("collection.shown_hidden",
      "{visible, plural, one {{one}} other {{other}}}: {visible} näkyvissä, "
      & "{hidden} piilotettu");
   P ("collection.shown", "{visible, plural, one {{one}} other {{other}}}: {visible} näkyvissä");
   P ("collection.visible_out_of",
      "{total, plural, one {{one}} other {{other}}}: {visible}/{total} "
      & "näkyvissä");
   P ("complete_count", "{done}/{total} valmiina");
   P ("percent_complete", "{percent} % valmiina");
   P ("step_count", "vaihe {step}/{total}");
   P ("attempt_count", "yritys {attempt}/{total}");
   P ("throughput_remaining",
      "{remaining, plural, one {{one}} other {{other}}}: {remaining} "
      & "jäljellä, {rate} {unit}/s");
   P ("accessible_progress", "{done}/{total} valmiina, {percent} prosenttia");
   P ("business_days", "{days, plural, one {{days} arkipäivä} other {{days} arkipäivää}}");
   P ("working_hours", "{hours, plural, one {{hours} työtunti} other {{hours} työtuntia}}");
   P ("due.overdue",
      "myöhässä {days, plural, one {{days} päivä} other {{days} "
      & "päivää}}");
   P ("due.today", "erääntyy tänään");
   P ("due.tomorrow", "erääntyy huomenna");
   P ("due.in", "erääntyy {days} päivän kuluttua");
   P ("calendar_difference.future", "{difference} kuluttua");
   P ("calendar_difference.past", "{difference} sitten");
   P ("calendar_difference.same_day", "samana päivänä");
   P ("calendar_difference.zero", "0 päivää");
   P ("cpu_load", "suoritinkuorma {measure}");
   P ("battery", "akku {measure}");
   P ("screen_size", "näyttö {measure}");
   P ("refresh_rate", "virkistystaajuus {measure}");
   P ("editorial_percent.symbol", "{value} %");
   P ("editorial_percent.word", "{value} prosenttia");
   P ("recurrence.second", "{every, plural, one {joka sekunti} other {{every} sekunnin välein}}");
   P ("recurrence.minute", "{every, plural, one {joka minuutti} other {{every} minuutin välein}}");
   P ("recurrence.hour", "{every, plural, one {joka tunti} other {{every} tunnin välein}}");
   P ("recurrence.day", "{every, plural, one {joka päivä} other {{every} päivän välein}}");
   P ("recurrence.week", "{every, plural, one {joka viikko} other {{every} viikon välein}}");
   P ("recurrence.month", "{every, plural, one {joka kuukausi} other {{every} kuukauden välein}}");
   P ("recurrence.quarter",
      "{every, plural, one {joka vuosineljännes} other {{every} "
      & "vuosineljänneksen välein}}");
   P ("recurrence.year", "{every, plural, one {joka vuosi} other {{every} vuoden välein}}");
   P ("cache_summary.empty", "välimuisti: ei pyyntöjä");
   P ("cache_summary",
      "välimuisti: {hits} {hits, plural, one {osuma} other {osumaa}}, "
      & "{misses} {misses, plural, one {huti} other {hutia}}, osumaprosentti "
      & "{rate} %");
   P ("field_change_summary",
      "{total, plural, one {{one}} other {{other}}} ({total}): {changed} "
      & "muutettu, {added} lisätty, {removed} poistettu");
   P ("field_diff", "{field} muutettu: {before} → {after}");
   P ("field_added", "{field} lisätty: {value}");
   P ("field_removed", "{field} poistettu (oli {value})");
   P ("field_unchanged", "{field} ennallaan: {value}");
   P ("number_comparison.equal", "{current} on yhtä suuri kuin {baseline}");
   P ("number_comparison.higher", "{current} on {quantity} suurempi kuin {baseline}");
   P ("number_comparison.lower", "{current} on {quantity} pienempi kuin {baseline}");
   P ("percent_comparison.equal", "{current} on yhtä suuri kuin {baseline}");
   P ("percent_comparison.higher", "{current} on {quantity} suurempi kuin {baseline}");
   P ("percent_comparison.lower", "{current} on {quantity} pienempi kuin {baseline}");
   P ("file_size_comparison.same", "{current} on samankokoinen kuin {baseline}");
   P ("file_size_comparison.larger", "{current} on {quantity} suurempi kuin {baseline}");
   P ("file_size_comparison.smaller", "{current} on {quantity} pienempi kuin {baseline}");
   P ("date_comparison.same", "{current} on sama päivämäärä kuin {baseline}");
   P ("date_comparison.after", "{current} on {quantity} myöhemmin kuin {baseline}");
   P ("date_comparison.before", "{current} on {quantity} aiemmin kuin {baseline}");
   P ("queue_summary", "jono: {details}");
   P ("queue_summary.empty", "jono tyhjä");
   P ("domain_summary",
      "{domain, select, queue {jono} job {työ} run {ajo} cache {välimuisti} "
      & "sync {synkronointi} import {tuonti} export {vienti} other {{domain}}} "
      & "{state, select, queued {jonossa} running {käynnissä} waiting "
      & "{odottaa} paused {keskeytetty} complete {valmis} failed {epäonnistui} "
      & "stale {vanhentunut} skipped {ohitettu} other {{state}}}: {details}");
   P ("summary.none", "{other}: ei yhtään");
   P ("summary.completed", "{count, plural, one {{one}} other {{other}}}: {count} valmiina");
   P ("summary.completed_of", "{total, plural, one {{one}} other {{other}}}: {count}/{total} valmiina");
   P ("summary.failed", "{count} epäonnistui");
   P ("summary.queued", "{count, plural, one {{one}} other {{other}}}: {count} jonossa");
   P ("summary.running", "{count} käynnissä");
   P ("summary.complete", "{count} valmiina");
   P ("backup.backup_running", "varmuuskopiointi käynnissä");
   P ("backup.backup_completed", "varmuuskopiointi valmis");
   P ("backup.backup_failed", "varmuuskopiointi epäonnistui");
   P ("backup.backup_stale", "varmuuskopio vanhentunut");
   P ("incident.incident_investigating", "häiriötä tutkitaan");
   P ("incident.incident_identified", "häiriö tunnistettu");
   P ("incident.incident_mitigated", "häiriötä lievennetty");
   P ("incident.incident_resolved", "häiriö ratkaistu");
   P ("release.release_drafting", "versiota valmistellaan");
   P ("release.release_ready", "versio valmis");
   P ("release.release_published", "versio julkaistu");
   P ("release.release_rolled_back", "versio peruttu");
   P ("audit.audit_created", "tarkastusmerkintä luotu");
   P ("audit.audit_updated", "tarkastusmerkintä päivitetty");
   P ("audit.audit_deleted", "tarkastusmerkintä poistettu");
   P ("audit.audit_restored", "tarkastusmerkintä palautettu");
   P ("flag.flag_enabled", "ominaisuuslippu otettu käyttöön");
   P ("flag.flag_disabled", "ominaisuuslippu poistettu käytöstä");
   P ("flag.flag_rolling_out", "ominaisuuslippua otetaan käyttöön vaiheittain");
   P ("flag.flag_rolled_back", "ominaisuuslippu peruttu");
   P ("webhook.webhook_pending", "webhook odottaa");
   P ("webhook.webhook_delivered", "webhook toimitettu");
   P ("webhook.webhook_failed", "webhook epäonnistui");
   P ("webhook.webhook_retrying", "webhookia yritetään uudelleen");
   P ("api_key.api_key_active", "API-avain aktiivinen");
   P ("api_key.api_key_revoked", "API-avain peruttu");
   P ("api_key.api_key_expired", "API-avain vanhentunut");
   P ("api_key.api_key_rotated", "API-avain vaihdettu");
   P ("quota.quota_available", "kiintiötä jäljellä");
   P ("quota.quota_near_limit", "kiintiö lähes täynnä");
   P ("quota.quota_exceeded", "kiintiö ylitetty");
   P ("quota.quota_reset", "kiintiö nollattu");
   P ("invoice.invoice_draft", "laskuluonnos");
   P ("invoice.invoice_sent", "lasku lähetetty");
   P ("invoice.invoice_paid", "lasku maksettu");
   P ("invoice.invoice_refunded", "lasku hyvitetty");
   P ("invoice.invoice_overdue", "lasku erääntynyt");
   P ("invoice.refund_failed", "hyvitys epäonnistui");
   P ("page_navigation.only", "ainoa sivu");
   P ("page_navigation.first", "ensimmäinen sivu, seuraava saatavilla");
   P ("page_navigation.last", "viimeinen sivu, edellinen saatavilla");
   P ("page_navigation.middle", "edellinen ja seuraava saatavilla");
   P ("end_of_week", "viikon loppu");
   P ("end_of_month", "kuukauden loppu");
   P ("end_of_quarter", "vuosineljänneksen loppu");
   P ("time_of_day.night", "yö");
   P ("time_of_day.morning", "aamu");
   P ("time_of_day.afternoon", "iltapäivä");
   P ("time_of_day.evening", "ilta");
   P ("access.allowed", "sallittu");
   P ("access.denied", "estetty");
   P ("access.owner", "omistaja");
   P ("access.admin", "ylläpitäjä");
   P ("access.viewer", "katselija");
   P ("access.editor", "muokkaaja");
   P ("auth.signed_in", "kirjautunut");
   P ("auth.signed_out", "kirjautunut ulos");
   P ("auth.session_expired", "istunto vanhentunut");
   P ("auth.locked", "lukittu");
   P ("auth.two_factor_required", "kaksivaiheinen tunnistus vaaditaan");
   P ("billing.trialing", "kokeilujakso");
   P ("billing.payment_due", "maksu erääntyy");
   P ("billing.payment_failed", "maksu epäonnistui");
   P ("billing.paid", "maksettu");
   P ("billing.past_due", "erääntynyt");
   P ("billing.canceled", "peruttu");
   P ("ci.pipeline_pending", "putki odottaa");
   P ("ci.pipeline_running", "putki käynnissä");
   P ("ci.pipeline_passed", "putki onnistui");
   P ("ci.pipeline_failed", "putki epäonnistui");
   P ("ci.review_required", "katselmointi vaaditaan");
   P ("ci.deploy_blocked", "käyttöönotto estetty");
   P ("collaboration.active_now", "aktiivinen nyt");
   P ("collaboration.away", "poissa");
   P ("collaboration.do_not_disturb", "älä häiritse");
   P ("collaboration.typing", "kirjoittaa");
   P ("collaboration.viewing", "katselee");
   P ("collaboration.editing", "muokkaa");
   P ("deployment.deploying", "otetaan käyttöön");
   P ("deployment.deployed", "otettu käyttöön");
   P ("deployment.rolling_back", "palautetaan");
   P ("deployment.rolled_back", "palautettu");
   P ("deployment.build_failed", "koonti epäonnistui");
   P ("deployment.checks_passed", "tarkistukset läpäisty");
   P ("empty.no_items", "ei kohteita");
   P ("empty.no_results", "ei tuloksia");
   P ("empty.no_messages", "ei viestejä");
   P ("empty.no_selection", "ei valintaa");
   P ("empty.nothing_to_show", "ei näytettävää");
   P ("file.uploading", "ladataan palvelimelle");
   P ("file.downloading", "ladataan");
   P ("file.copying", "kopioidaan");
   P ("file.moving", "siirretään");
   P ("file.deleting", "poistetaan");
   P ("file.deleted", "poistettu");
   P ("file.restoring", "palautetaan");
   P ("file.synced", "synkronoitu");
   P ("form.valid_input", "kelvollinen syöte");
   P ("form.invalid_input", "virheellinen syöte");
   P ("form.dirty", "muutettu");
   P ("form.pristine", "muuttamaton");
   P ("form.submitted", "lähetetty");
   P ("form.submission_failed", "lähetys epäonnistui");
   P ("health.healthy", "kunnossa");
   P ("health.degraded", "heikentynyt");
   P ("health.unhealthy", "ei kunnossa");
   P ("health.incident", "häiriö");
   P ("health.maintenance", "huoltokatko");
   P ("health.recovering", "palautumassa");
   P ("issue.open", "avoin");
   P ("issue.closed", "suljettu");
   P ("issue.reopened", "avattu uudelleen");
   P ("issue.assigned", "määritetty");
   P ("issue.unassigned", "määrittämätön");
   P ("issue.merged", "yhdistetty");
   P ("network.offline", "ei verkossa");
   P ("network.online", "verkossa");
   P ("network.connecting", "yhdistetään");
   P ("network.syncing", "synkronoidaan");
   P ("network.sync_failed", "synkronointi epäonnistui");
   P ("network.permission_denied", "käyttöoikeus evätty");
   P ("network.read_only", "vain luku");
   P ("notification.unread", "lukematon");
   P ("notification.read", "luettu");
   P ("notification.muted", "mykistetty");
   P ("notification.snoozed", "torkutettu");
   P ("notification.sent", "lähetetty");
   P ("notification.delivered", "toimitettu");
   P ("payment.payment_authorized", "maksu hyväksytty");
   P ("payment.payment_captured", "maksu veloitettu");
   P ("payment.payment_refunded", "maksu hyvitetty");
   P ("payment.payment_disputed", "maksu kiistetty");
   P ("payment.payment_requires_action", "maksu vaatii toimia");
   P ("payment.payment_expired", "maksu vanhentunut");
   P ("ui.empty", "tyhjä");
   P ("ui.loading", "latautuu");
   P ("ui.saving", "tallennetaan");
   P ("ui.saved", "tallennettu");
   P ("ui.unsaved", "tallentamaton");
   P ("ui.retrying", "yritetään uudelleen");
   P ("ui.paused", "keskeytetty");
   P ("ui.complete", "valmis");
   P ("ui.failed", "epäonnistui");
   P ("ui.due_soon", "erääntyy pian");
   P ("ui.overdue", "myöhässä");
   P ("ui.last_seen", "nähty viimeksi");
   P ("ui.updated_just_now", "päivitetty juuri");
   P ("queue.queued", "jonossa");
   P ("queue.running", "käynnissä");
   P ("queue.waiting", "odottaa");
   P ("queue.blocked", "estetty");
   P ("queue.canceled_job", "työ peruttu");
   P ("queue.completed_job", "työ valmis");
   P ("search.filtering", "suodatetaan");
   P ("search.filtered", "suodatettu");
   P ("search.no_matches", "ei osumia");
   P ("search.search_ready", "haku valmiina");
   P ("search.search_failed", "haku epäonnistui");
   P ("search.query_too_short", "hakusana liian lyhyt");
   P ("security.secure", "suojattu");
   P ("security.insecure", "suojaamaton");
   P ("security.vulnerable", "haavoittuva");
   P ("security.encrypted", "salattu");
   P ("security.unencrypted", "salaamaton");
   P ("security.token_expired", "tunnus vanhentunut");
   P ("sync.sync_idle", "synkronointi ei käynnissä");
   P ("sync.syncing_now", "synkronoidaan nyt");
   P ("sync.sync_queued", "synkronointi jonossa");
   P ("sync.sync_conflict", "synkronointiristiriita");
   P ("sync.sync_complete", "synkronointi valmis");
   P ("sync.sync_error", "synkronointivirhe");
   P ("task.todo", "tekemättä");
   P ("task.in_progress", "työn alla");
   P ("task.done", "valmis");
   P ("task.skipped", "ohitettu");
   P ("task.blocked_task", "estetty");
   P ("task.waiting_on", "odottaa");
   P ("ticket.ticket_new", "uusi tiketti");
   P ("ticket.ticket_open", "tiketti avoin");
   P ("ticket.ticket_waiting", "tiketti odottaa");
   P ("ticket.ticket_escalated", "tiketti eskaloitu");
   P ("ticket.ticket_resolved", "tiketti ratkaistu");
   P ("ticket.ticket_closed", "tiketti suljettu");
   P ("transfer.importing", "tuodaan");
   P ("transfer.imported", "tuotu");
   P ("transfer.import_failed", "tuonti epäonnistui");
   P ("transfer.exporting", "viedään");
   P ("transfer.exported", "viety");
   P ("transfer.export_failed", "vienti epäonnistui");
   P ("validation.required", "pakollinen");
   P ("validation.optional", "valinnainen");
   P ("validation.invalid", "virheellinen");
   P ("validation.too_short", "liian lyhyt");
   P ("validation.too_long", "liian pitkä");
   P ("validation.out_of_range", "alueen ulkopuolella");
   P ("validation.already_exists", "on jo olemassa");
   P ("workflow.draft", "luonnos");
   P ("workflow.in_review", "katselmoitavana");
   P ("workflow.approved", "hyväksytty");
   P ("workflow.rejected", "hylätty");
   P ("workflow.published", "julkaistu");
   P ("workflow.archived", "arkistoitu");
   P ("database.database_online", "tietokanta verkossa");
   P ("database.database_offline", "tietokanta ei verkossa");
   P ("database.database_degraded", "tietokanta heikentynyt");
   P ("database.database_migrating", "tietokantaa siirretään");
   P ("database.database_migration_failed", "tietokannan siirto epäonnistui");
   P ("database.database_replicating", "tietokantaa replikoidaan");
   P ("database.database_replication_lagging", "tietokannan replikointi viivästyy");
   P ("database.database_backup_running", "tietokannan varmuuskopiointi käynnissä");
   P ("database.database_backup_failed", "tietokannan varmuuskopiointi epäonnistui");
   P ("calendar_difference.case.future", "genitive");
   P ("times_noun",
      "{count, plural, =0 {{other}: ei koskaan} =1 {{one}: kerran} =2 "
      & "{{other}: kaksi kertaa} other {{other}: {count} kertaa}}");
   P ("availability.all",
      "{total, plural, one {{one}} other {{other}}}: {available}/{total} "
      & "saatavilla");
   P ("availability.none", "{other}: ei yhtään saatavilla");
   P ("availability.partial",
      "{total, plural, one {{one}} other {{other}}}: {available}/{total} "
      & "saatavilla, {unavailable} ei saatavilla");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "jonossa");
   P ("operation.running", "käynnissä");
   P ("operation.blocked", "estetty");
   P ("operation.retrying", "yritetään uudelleen");
   P ("operation.succeeded", "onnistui");
   P ("operation.partially_succeeded", "onnistui osittain");
   P ("operation.failed", "epäonnistui");
   P ("operation.canceled", "peruttu");
   P ("operation.skipped", "ohitettu");
   P ("operation.stale", "vanhentunut");
   P ("operation.unknown_state", "tuntematon");
   P ("operation.last_success", "{name} – viimeksi onnistunut: {time}");
   P ("operation.next_retry", "{name} – seuraava uusintayritys: {time}");
   P ("operation.stale_run", "{name} – vanhentunut: {time}");
   P ("summary.skipped", "{count} ohitettu");
   P ("summary.retried", "{count} yritetty uudelleen");
   P ("summary.canceled", "{count} peruttu");
   P ("system.service.operational", "toiminnassa");
   P ("system.service.degraded", "heikentynyt suorituskyky");
   P ("system.service.partial_outage", "osittainen katko");
   P ("system.service.major_outage", "laaja katko");
   P ("system.service.maintenance", "huollossa");
   P ("system.service.unknown", "palvelun tila tuntematon");
   P ("system.health.healthy", "kunnossa");
   P ("system.health.warning", "varoitus");
   P ("system.health.critical", "kriittinen");
   P ("system.health.unavailable", "ei saatavilla");
   P ("system.health.unknown_health", "kunto tuntematon");
   P ("system.readiness.ready", "valmis");
   P ("system.readiness.not_ready", "ei valmis");
   P ("system.readiness.starting", "käynnistyy");
   P ("system.readiness.draining", "tyhjennetään");
   P ("system.readiness.stopped", "pysäytetty");
   P ("system.readiness.unknown_readiness", "valmius tuntematon");
   P ("system.component.online", "verkossa");
   P ("system.component.offline", "ei verkossa");
   P ("system.component.starting", "käynnistyy");
   P ("system.component.stopping", "pysähtyy");
   P ("system.component.restarting", "käynnistyy uudelleen");
   P ("system.component.unknown", "komponentin tila tuntematon");
   P ("system.check.passing", "hyväksytty");
   P ("system.check.failing", "epäonnistuu");
   P ("system.check.warning", "varoitus");
   P ("system.check.skipped", "ohitettu");
   P ("system.check.timed_out", "aikakatkaisu");
   P ("system.check.unknown", "tarkistuksen tila tuntematon");
   P ("system.incident.investigating", "tutkitaan");
   P ("system.incident.identified", "tunnistettu");
   P ("system.incident.monitoring", "seurataan");
   P ("system.incident.resolved", "ratkaistu");
   P ("system.incident.scheduled_maintenance", "suunniteltu huolto");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "tarkistus {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {ei komponentteja} one {{count} komponentti} other "
      & "{{count} komponenttia}}");
   P ("system.count.checks",
      "{count, plural, =0 {ei tarkistuksia} one {{count} tarkistus} other "
      & "{{count} tarkistusta}}");
   P ("system.count.incidents",
      "{count, plural, =0 {ei häiriöitä} one {{count} häiriö} other "
      & "{{count} häiriötä}}");
   P ("system.uptime", "käytettävyys {measure}");
   P ("system.latency", "viive {measure}");
   P ("system.maintenance_window", "huoltoikkuna {time}");
   P ("system.last_checked", "tarkistettu viimeksi {time}");
   P ("system.http.informational", "tiedottava");
   P ("system.http.successful", "onnistunut");
   P ("system.http.redirection", "uudelleenohjaus");
   P ("system.http.client_error", "asiakasvirhe");
   P ("system.http.server_error", "palvelinvirhe");
   P ("system.exit.success", "paluukoodi {code}: onnistui");
   P ("system.exit.failure", "paluukoodi {code}: epäonnistui");
   P ("system.exit.usage_error", "paluukoodi {code}: virheellinen käyttö");
   P ("system.exit.not_executable", "paluukoodi {code}: komentoa ei voi suorittaa");
   P ("system.exit.not_found", "paluukoodi {code}: komentoa ei löydy");
   P ("system.exit.invalid_argument", "paluukoodi {code}: virheellinen exit-argumentti");
   P ("system.exit.signal", "paluukoodi {code}: lopetettu signaalilla {signal}");
   P ("validation.problem.required", "{field}: on pakollinen");
   P ("validation.problem.minimum", "{field}: on alle vähimmäisarvon");
   P ("validation.problem.maximum", "{field}: ylittää enimmäisarvon");
   P ("validation.problem.range", "{field}: on sallitun välin ulkopuolella");
   P ("validation.problem.pattern", "{field}: ei vastaa mallia");
   P ("validation.problem.choice", "{field}: on oltava jokin sallituista vaihtoehdoista");
   P ("validation.problem.dependency", "{field}: riippuu toisesta kentästä");
   P ("validation.problem.custom", "{field}: on virheellinen");
   P ("validation.constraint.no_relation", "{field}: on oltava kelvollinen {value}");
   P ("validation.constraint.less_than", "{field}: on oltava pienempi kuin {value}");
   P ("validation.constraint.less_or_equal", "{field}: saa olla enintään {value}");
   P ("validation.constraint.greater_than", "{field}: on oltava suurempi kuin {value}");
   P ("validation.constraint.greater_or_equal", "{field}: on oltava vähintään {value}");
   P ("validation.constraint.equal_to", "{field}: on oltava sama kuin {value}");
   P ("validation.constraint.not_equal_to", "{field}: ei saa olla sama kuin {value}");
   P ("validation.constraint.before_field", "{field}: on oltava aiempi kuin {value}");
   P ("validation.constraint.after_field", "{field}: on oltava myöhempi kuin {value}");
   P ("validation.choices", "{field}: sallitut arvot: {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, annettu: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, uusi yritys {time} kuluttua");
   P ("net_diagnostic.dns", "{endpoint}: DNS-haku epäonnistui");
   P ("net_diagnostic.tcp", "{endpoint}: TCP-yhteys epäonnistui");
   P ("net_diagnostic.tls", "{endpoint}: TLS-varmennevirhe");
   P ("net_diagnostic.http", "{endpoint}: HTTP-pyyntö epäonnistui");
   P ("net_diagnostic.proxy", "{endpoint}: välityspalvelinvirhe");
   P ("net_diagnostic.timeout", "{endpoint}: aikakatkaisu");
   P ("net_diagnostic.reset", "{endpoint}: yhteys katkaistiin");
   P ("net_diagnostic.unknown_network", "{endpoint}: verkkovirhe");
   P ("progress.state.not_started", "ei aloitettu");
   P ("progress.state.running", "käynnissä");
   P ("progress.state.stalled", "pysähtynyt");
   P ("progress.state.retrying", "yritetään uudelleen");
   P ("progress.state.complete", "valmis");
   P ("progress.state.failed", "epäonnistui");
   P ("progress.of", "{subject}: {done}/{total} valmiina ({percent} %), {state}");
   P ("progress.done", "{subject}: {done} valmiina, {state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {kohde} other {kohdetta}}, "
      & "{unique} {unique, plural, one {yksilöllinen arvo} other "
      & "{yksilöllistä arvoa}}, {duplicates} {duplicates, plural, one "
      & "{kaksoiskappale} other {kaksoiskappaletta}}, {outliers} {outliers, "
      & "plural, one {poikkeava arvo} other {poikkeavaa arvoa}}");
   P ("top_frequency", "{name}: {value} ({count} {count, plural, one {kerta} other {kertaa}})");
   P ("calendar_date.fiscal_year", "tilikausi {year}");
   P ("calendar_date.fiscal_quarter", "tilikausi {year} Q{part}");
   P ("calendar_date.fiscal_half", "tilikausi {year} H{part}");
   P ("calendar_date.fiscal_year_end", "tilikauden {year} loppu");
   P ("calendar_date.semester", "{part}. lukukausi {year}");
   P ("calendar_date.half_year", "H{part}/{year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {vuoden {year} alkupuolisko} other {vuoden {year} "
      & "loppupuolisko}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {{text}, alku} mid {{text}, puoliväli} other "
      & "{{text}, loppu}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {{text}, alku} mid {{text}, puoliväli} other "
      & "{{text}, loppu}}");
   P ("calendar_range.weekend.last", "viime viikonloppu");
   P ("calendar_range.weekend.this", "tämä viikonloppu");
   P ("calendar_range.weekend.next", "ensi viikonloppu");
   P ("calendar_range.weekend_of", "viikonloppu {date}");
   P ("calendar_range.week.last", "viime viikko");
   P ("calendar_range.week.this", "tämä viikko");
   P ("calendar_range.week.next", "ensi viikko");
   P ("calendar_range.week_of", "viikko {date}");
   P ("calendar_range.between", "{first}–{last}");
   P ("http.reason.100", "jatka");
   P ("http.reason.101", "vaihdetaan protokollaa");
   P ("http.reason.102", "käsitellään");
   P ("http.reason.103", "varhaiset vihjeet");
   P ("http.reason.200", "OK");
   P ("http.reason.201", "luotu");
   P ("http.reason.202", "hyväksytty");
   P ("http.reason.203", "ei-autoritatiivista tietoa");
   P ("http.reason.204", "ei sisältöä");
   P ("http.reason.205", "nollaa sisältö");
   P ("http.reason.206", "osittainen sisältö");
   P ("http.reason.207", "monitila");
   P ("http.reason.208", "jo raportoitu");
   P ("http.reason.226", "IM käytetty");
   P ("http.reason.300", "useita vaihtoehtoja");
   P ("http.reason.301", "siirretty pysyvästi");
   P ("http.reason.302", "löydetty");
   P ("http.reason.303", "katso muualta");
   P ("http.reason.304", "ei muokattu");
   P ("http.reason.305", "käytä välityspalvelinta");
   P ("http.reason.307", "tilapäinen uudelleenohjaus");
   P ("http.reason.308", "pysyvä uudelleenohjaus");
   P ("http.reason.400", "virheellinen pyyntö");
   P ("http.reason.401", "ei valtuutettu");
   P ("http.reason.402", "maksu vaaditaan");
   P ("http.reason.403", "kielletty");
   P ("http.reason.404", "ei löydy");
   P ("http.reason.405", "menetelmä ei ole sallittu");
   P ("http.reason.406", "ei hyväksyttävissä");
   P ("http.reason.407", "välityspalvelimen todennus vaaditaan");
   P ("http.reason.408", "pyynnön aikakatkaisu");
   P ("http.reason.409", "ristiriita");
   P ("http.reason.410", "poistunut");
   P ("http.reason.411", "pituus vaaditaan");
   P ("http.reason.412", "ennakkoehto ei täyttynyt");
   P ("http.reason.413", "sisältö liian suuri");
   P ("http.reason.414", "URI liian pitkä");
   P ("http.reason.415", "mediatyyppiä ei tueta");
   P ("http.reason.416", "aluetta ei voi täyttää");
   P ("http.reason.417", "odotus ei täyttynyt");
   P ("http.reason.418", "olen teekannu");
   P ("http.reason.421", "väärin ohjattu pyyntö");
   P ("http.reason.422", "käsittelykelvoton sisältö");
   P ("http.reason.423", "lukittu");
   P ("http.reason.424", "riippuvuus epäonnistui");
   P ("http.reason.425", "liian aikaisin");
   P ("http.reason.426", "päivitys vaaditaan");
   P ("http.reason.428", "ennakkoehto vaaditaan");
   P ("http.reason.429", "liian monta pyyntöä");
   P ("http.reason.431", "pyynnön otsakekentät liian suuria");
   P ("http.reason.451", "ei saatavilla oikeudellisista syistä");
   P ("http.reason.500", "sisäinen palvelinvirhe");
   P ("http.reason.501", "ei toteutettu");
   P ("http.reason.502", "virheellinen yhdyskäytävä");
   P ("http.reason.503", "palvelu ei käytettävissä");
   P ("http.reason.504", "yhdyskäytävän aikakatkaisu");
   P ("http.reason.505", "HTTP-versiota ei tueta");
   P ("http.reason.506", "variantti myös neuvottelee");
   P ("http.reason.507", "tallennustila ei riitä");
   P ("http.reason.508", "silmukka havaittu");
   P ("http.reason.510", "ei laajennettu");
   P ("http.reason.511", "verkkotodennus vaaditaan");
   P ("errno.reason.0", "onnistui");
   P ("errno.reason.1", "toiminto ei ole sallittu");
   P ("errno.reason.2", "tiedostoa tai hakemistoa ei ole");
   P ("errno.reason.3", "prosessia ei ole");
   P ("errno.reason.4", "keskeytetty järjestelmäkutsu");
   P ("errno.reason.5", "siirräntävirhe");
   P ("errno.reason.6", "laitetta tai osoitetta ei ole");
   P ("errno.reason.9", "virheellinen tiedostokahva");
   P ("errno.reason.11", "resurssi ei tilapäisesti ole käytettävissä");
   P ("errno.reason.12", "muisti ei riitä");
   P ("errno.reason.13", "lupa evätty");
   P ("errno.reason.17", "tiedosto on olemassa");
   P ("errno.reason.20", "ei ole hakemisto");
   P ("errno.reason.21", "on hakemisto");
   P ("errno.reason.22", "virheellinen argumentti");
   P ("errno.reason.24", "liian monta avointa tiedostoa");
   P ("errno.reason.28", "laitteella ei ole tilaa");
   P ("errno.reason.32", "katkennut putki");
   P ("errno.reason.98", "osoite on jo käytössä");
   P ("errno.reason.110", "yhteys aikakatkaistiin");
   P ("errno.reason.111", "yhteys hylättiin");
   P ("signal.reason.1", "katkaisu");
   P ("signal.reason.2", "keskeytys");
   P ("signal.reason.3", "lopetus");
   P ("signal.reason.4", "laiton käsky");
   P ("signal.reason.5", "jäljitysansa");
   P ("signal.reason.6", "keskeytetty");
   P ("signal.reason.7", "väylävirhe");
   P ("signal.reason.8", "liukulukupoikkeus");
   P ("signal.reason.9", "tapettu");
   P ("signal.reason.10", "käyttäjän signaali 1");
   P ("signal.reason.11", "muistialueen ylitys");
   P ("signal.reason.12", "käyttäjän signaali 2");
   P ("signal.reason.13", "katkennut putki");
   P ("signal.reason.14", "hälytys");
   P ("signal.reason.15", "lopetuspyyntö");
   P ("signal.reason.17", "lapsiprosessin tila muuttui");
   P ("signal.reason.18", "jatka");
   P ("signal.reason.19", "pysäytetty");
   P ("signal.reason.20", "päätteen pysäytys");
   P ("signal.reason.28", "ikkunan koko muuttui");
   P ("sqlstate.reason.00", "onnistunut suoritus");
   P ("sqlstate.reason.01", "varoitus");
   P ("sqlstate.reason.02", "ei tietoja");
   P ("sqlstate.reason.08", "yhteyspoikkeus");
   P ("sqlstate.reason.0a", "ominaisuutta ei tueta");
   P ("sqlstate.reason.22", "tietopoikkeus");
   P ("sqlstate.reason.23", "eheysrajoitteen rikkomus");
   P ("sqlstate.reason.24", "virheellinen kursorin tila");
   P ("sqlstate.reason.25", "virheellinen transaktion tila");
   P ("sqlstate.reason.28", "virheellinen valtuutusmääritys");
   P ("sqlstate.reason.2d", "virheellinen transaktion päättäminen");
   P ("sqlstate.reason.3d", "virheellinen katalogin nimi");
   P ("sqlstate.reason.3f", "virheellinen skeeman nimi");
   P ("sqlstate.reason.40", "transaktion peruutus");
   P ("sqlstate.reason.42", "syntaksivirhe tai käyttösäännön rikkomus");
   P ("sqlstate.reason.53", "riittämättömät resurssit");
   P ("sqlstate.reason.54", "ohjelman raja ylitetty");
   P ("sqlstate.reason.55", "objekti ei ole edellytetyssä tilassa");
   P ("sqlstate.reason.57", "operaattorin väliintulo");
   P ("sqlstate.reason.58", "järjestelmävirhe");
   P ("sqlstate.reason.hv", "vieraan datan kääreen virhe");
   P ("sqlstate.reason.p0", "PL/pgSQL-virhe");
   P ("sqlstate.reason.xx", "sisäinen virhe");
   P ("system.signal_numbered", "signaali {number} {name} {reason}");
   P ("http.reason.unknown", "tuntematon tila");
   P ("errno.reason.unknown", "tuntematon virhe");
   P ("signal.reason.unknown", "tuntematon signaali");
   P ("sqlstate.reason.unknown", "tuntematon SQLSTATE-luokka");
end Locale_Fi;
