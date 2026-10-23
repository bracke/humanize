separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Sw (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "sw", Name, Template);
   end P;
begin
   P ("all_count", "jumla: {total, plural, one {{one}} other {{other}}} {total}");
   P ("filtered_count.none", "hakuna {other} zinazolingana");
   P ("filtered_count.all", "{total, plural, one {{one}} other {{other}}} zote {total} zinalingana");
   P ("filtered_count.some",
      "{matching} kati ya {total, plural, one {{one}} other {{other}}} "
      & "{total} zinalingana");
   P ("more_count", "{visible} zinaonyeshwa, +{remaining} zaidi");
   P ("others_count",
      "{first} na {remaining, plural, one {1 zaidi} other {{remaining} "
      & "zaidi}}");
   P ("page_count", "ukurasa {page} kati ya {total}");
   P ("page_size", "{size, plural, one {{one}} other {{other}}} {size} kwa kila ukurasa");
   P ("pagination_range",
      "{first}–{last} kati ya {total, plural, one {{one}} other {{other}}} "
      & "{total}");
   P ("position_count", "{position} kati ya {total}");
   P ("selection_count",
      "umechagua {selected} kati ya {total, plural, one {{one}} other "
      & "{{other}}} {total}");
   P ("showing_count",
      "inaonyesha {showing} kati ya {total, plural, one {{one}} other "
      & "{{other}}} {total}");
   P ("validation_count",
      "{count, plural, =0 {hakuna {severity, select, error {hitilafu} warning "
      & "{maonyo} other {taarifa}}} one {{severity, select, error {hitilafu 1} "
      & "warning {onyo 1} other {taarifa 1}}} other {{severity, select, error "
      & "{hitilafu} warning {maonyo} other {taarifa}} {count}}}");
   P ("collection.empty", "hakuna {other}");
   P ("collection.none_shown", "hakuna {other} zinazoonyeshwa");
   P ("collection.showing_hidden",
      "inaonyesha {visible} kati ya {total, plural, one {{one}} other "
      & "{{other}}} {total}, {hidden} zimefichwa");
   P ("collection.showing",
      "inaonyesha {visible} kati ya {total, plural, one {{one}} other "
      & "{{other}}} {total}");
   P ("collection.shown_hidden",
      "{visible, plural, one {{one}} other {{other}}} {visible} zinaonyeshwa, "
      & "{hidden} zimefichwa");
   P ("collection.shown", "{visible, plural, one {{one}} other {{other}}} {visible} zinaonyeshwa");
   P ("collection.visible_out_of",
      "{visible} zinaonekana kati ya {total, plural, one {{one}} other "
      & "{{other}}} {total}");
   P ("complete_count", "{done} kati ya {total} zimekamilika");
   P ("percent_complete", "{percent}% imekamilika");
   P ("step_count", "hatua {step} kati ya {total}");
   P ("attempt_count", "jaribio {attempt} kati ya {total}");
   P ("throughput_remaining",
      "zimebaki {remaining, plural, one {{one}} other {{other}}} {remaining} "
      & "kwa kasi ya {rate} {unit}/s");
   P ("accessible_progress", "{done} kati ya {total} zimekamilika, asilimia {percent}");
   P ("business_days", "siku {days} za kazi");
   P ("working_hours", "saa {hours} za kazi");
   P ("due.overdue", "imechelewa siku {days}");
   P ("due.today", "mwisho ni leo");
   P ("due.tomorrow", "mwisho ni kesho");
   P ("due.in", "mwisho ni baada ya siku {days}");
   P ("calendar_difference.future", "baada ya {difference}");
   P ("calendar_difference.past", "{difference} kabla ya sasa");
   P ("calendar_difference.same_day", "siku hiyo hiyo");
   P ("calendar_difference.zero", "siku 0");
   P ("cpu_load", "matumizi ya CPU: {measure}");
   P ("battery", "betri: {measure}");
   P ("screen_size", "skrini: {measure}");
   P ("refresh_rate", "kasi ya kuonyesha upya: {measure}");
   P ("editorial_percent.symbol", "{value}%");
   P ("editorial_percent.word", "asilimia {value}");
   P ("recurrence.second", "{every, plural, one {kila sekunde} other {kila sekunde {every}}}");
   P ("recurrence.minute", "{every, plural, one {kila dakika} other {kila dakika {every}}}");
   P ("recurrence.hour", "{every, plural, one {kila saa} other {kila baada ya saa {every}}}");
   P ("recurrence.day", "{every, plural, one {kila siku} other {kila siku {every}}}");
   P ("recurrence.week", "{every, plural, one {kila wiki} other {kila wiki {every}}}");
   P ("recurrence.month", "{every, plural, one {kila mwezi} other {kila miezi {every}}}");
   P ("recurrence.quarter", "{every, plural, one {kila robo mwaka} other {kila robo mwaka {every}}}");
   P ("recurrence.year", "{every, plural, one {kila mwaka} other {kila miaka {every}}}");
   P ("cache_summary.empty", "akiba: hakuna maombi");
   P ("cache_summary",
      "akiba: zilizopatikana {hits}, zilizokosekana {misses}, kiwango cha "
      & "upatikanaji {rate}%");
   P ("field_change_summary",
      "{total, plural, one {{one}} other {{other}}} {total}: {changed} "
      & "zimebadilishwa, {added} zimeongezwa, {removed} zimeondolewa");
   P ("field_diff", "{field} imebadilishwa kutoka {before} hadi {after}");
   P ("field_added", "{field} imeongezwa kama {value}");
   P ("field_removed", "{field} imeondolewa (ilikuwa {value})");
   P ("field_unchanged", "{field} haijabadilika: {value}");
   P ("number_comparison.equal", "{current} ni sawa na {baseline}");
   P ("number_comparison.higher", "{current} ni juu kwa {quantity} kuliko {baseline}");
   P ("number_comparison.lower", "{current} ni chini kwa {quantity} kuliko {baseline}");
   P ("percent_comparison.equal", "{current} ni sawa na {baseline}");
   P ("percent_comparison.higher", "{current} ni juu kwa {quantity} kuliko {baseline}");
   P ("percent_comparison.lower", "{current} ni chini kwa {quantity} kuliko {baseline}");
   P ("file_size_comparison.same", "{current} ina ukubwa sawa na {baseline}");
   P ("file_size_comparison.larger", "{current} ni kubwa kwa {quantity} kuliko {baseline}");
   P ("file_size_comparison.smaller", "{current} ni ndogo kwa {quantity} kuliko {baseline}");
   P ("date_comparison.same", "{current} ni tarehe sawa na {baseline}");
   P ("date_comparison.after", "{current} ni {quantity} baada ya {baseline}");
   P ("date_comparison.before", "{current} ni {quantity} kabla ya {baseline}");
   P ("queue_summary", "foleni: {details}");
   P ("queue_summary.empty", "foleni ni tupu");
   P ("domain_summary",
      "{domain, select, queue {foleni} job {kazi} run {utekelezaji} cache "
      & "{akiba} sync {usawazishaji} import {uingizaji} export {uhamishaji} "
      & "other {{domain}}} – {state, select, queued {kwenye foleni} running "
      & "{inaendelea} waiting {inasubiri} paused {imesitishwa} complete "
      & "{imekamilika} failed {imeshindwa} stale {imepitwa na wakati} skipped "
      & "{imerukwa} other {{state}}}: {details}");
   P ("summary.none", "hakuna {other}");
   P ("summary.completed", "{count, plural, one {{one}} other {{other}}} {count} zimekamilika");
   P ("summary.completed_of",
      "{count} kati ya {total, plural, one {{one}} other {{other}}} {total} "
      & "zimekamilika");
   P ("summary.failed", "{count} zimeshindwa");
   P ("summary.queued", "{count, plural, one {{one}} other {{other}}} {count} kwenye foleni");
   P ("summary.running", "{count} zinaendelea");
   P ("summary.complete", "{count} zimekamilika");
   P ("backup.backup_running", "hifadhi rudufu inaendelea");
   P ("backup.backup_completed", "hifadhi rudufu imekamilika");
   P ("backup.backup_failed", "hifadhi rudufu imeshindwa");
   P ("backup.backup_stale", "hifadhi rudufu imepitwa na wakati");
   P ("incident.incident_investigating", "tukio linachunguzwa");
   P ("incident.incident_identified", "tukio limetambuliwa");
   P ("incident.incident_mitigated", "tukio limedhibitiwa");
   P ("incident.incident_resolved", "tukio limetatuliwa");
   P ("release.release_drafting", "toleo linaandaliwa");
   P ("release.release_ready", "toleo liko tayari");
   P ("release.release_published", "toleo limechapishwa");
   P ("release.release_rolled_back", "toleo limerejeshwa nyuma");
   P ("audit.audit_created", "ingizo la ukaguzi limeundwa");
   P ("audit.audit_updated", "ingizo la ukaguzi limesasishwa");
   P ("audit.audit_deleted", "ingizo la ukaguzi limefutwa");
   P ("audit.audit_restored", "ingizo la ukaguzi limerejeshwa");
   P ("flag.flag_enabled", "alama ya kipengele imewashwa");
   P ("flag.flag_disabled", "alama ya kipengele imezimwa");
   P ("flag.flag_rolling_out", "alama ya kipengele inasambazwa");
   P ("flag.flag_rolled_back", "alama ya kipengele imerejeshwa nyuma");
   P ("webhook.webhook_pending", "webhook inasubiri");
   P ("webhook.webhook_delivered", "webhook imewasilishwa");
   P ("webhook.webhook_failed", "webhook imeshindwa");
   P ("webhook.webhook_retrying", "webhook inajaribiwa tena");
   P ("api_key.api_key_active", "ufunguo wa API unatumika");
   P ("api_key.api_key_revoked", "ufunguo wa API umebatilishwa");
   P ("api_key.api_key_expired", "muda wa ufunguo wa API umeisha");
   P ("api_key.api_key_rotated", "ufunguo wa API umebadilishwa");
   P ("quota.quota_available", "mgao unapatikana");
   P ("quota.quota_near_limit", "mgao unakaribia kikomo");
   P ("quota.quota_exceeded", "mgao umezidishwa");
   P ("quota.quota_reset", "mgao umewekwa upya");
   P ("invoice.invoice_draft", "rasimu ya ankara");
   P ("invoice.invoice_sent", "ankara imetumwa");
   P ("invoice.invoice_paid", "ankara imelipwa");
   P ("invoice.invoice_refunded", "pesa za ankara zimerejeshwa");
   P ("invoice.invoice_overdue", "ankara imechelewa");
   P ("invoice.refund_failed", "urejeshaji wa pesa umeshindwa");
   P ("page_navigation.only", "ukurasa pekee");
   P ("page_navigation.first", "ukurasa wa kwanza, unaofuata unapatikana");
   P ("page_navigation.last", "ukurasa wa mwisho, uliotangulia unapatikana");
   P ("page_navigation.middle", "uliotangulia na unaofuata vinapatikana");
   P ("end_of_week", "mwisho wa wiki");
   P ("end_of_month", "mwisho wa mwezi");
   P ("end_of_quarter", "mwisho wa robo mwaka");
   P ("time_of_day.night", "usiku");
   P ("time_of_day.morning", "asubuhi");
   P ("time_of_day.afternoon", "mchana");
   P ("time_of_day.evening", "jioni");
   P ("access.allowed", "imeruhusiwa");
   P ("access.denied", "imekataliwa");
   P ("access.owner", "mmiliki");
   P ("access.admin", "msimamizi");
   P ("access.viewer", "mtazamaji");
   P ("access.editor", "mhariri");
   P ("auth.signed_in", "umeingia");
   P ("auth.signed_out", "umetoka");
   P ("auth.session_expired", "kipindi kimeisha");
   P ("auth.locked", "imefungwa");
   P ("auth.two_factor_required", "uthibitishaji wa hatua mbili unahitajika");
   P ("billing.trialing", "kipindi cha majaribio");
   P ("billing.payment_due", "malipo yanadaiwa");
   P ("billing.payment_failed", "malipo yameshindwa");
   P ("billing.paid", "imelipwa");
   P ("billing.past_due", "muda wa malipo umepita");
   P ("billing.canceled", "imeghairiwa");
   P ("ci.pipeline_pending", "mfumo wa CI unasubiri");
   P ("ci.pipeline_running", "mfumo wa CI unaendeshwa");
   P ("ci.pipeline_passed", "mfumo wa CI umefaulu");
   P ("ci.pipeline_failed", "mfumo wa CI umeshindwa");
   P ("ci.review_required", "ukaguzi unahitajika");
   P ("ci.deploy_blocked", "usambazaji umezuiwa");
   P ("collaboration.active_now", "yupo sasa");
   P ("collaboration.away", "hayupo");
   P ("collaboration.do_not_disturb", "usisumbue");
   P ("collaboration.typing", "anaandika");
   P ("collaboration.viewing", "anatazama");
   P ("collaboration.editing", "anahariri");
   P ("deployment.deploying", "inasambazwa");
   P ("deployment.deployed", "imesambazwa");
   P ("deployment.rolling_back", "inarejeshwa nyuma");
   P ("deployment.rolled_back", "imerejeshwa nyuma");
   P ("deployment.build_failed", "ujenzi umeshindwa");
   P ("deployment.checks_passed", "ukaguzi umefaulu");
   P ("empty.no_items", "hakuna vipengee");
   P ("empty.no_results", "hakuna matokeo");
   P ("empty.no_messages", "hakuna ujumbe");
   P ("empty.no_selection", "hakuna kilichochaguliwa");
   P ("empty.nothing_to_show", "hakuna cha kuonyesha");
   P ("file.uploading", "inapakiwa");
   P ("file.downloading", "inapakuliwa");
   P ("file.copying", "inanakiliwa");
   P ("file.moving", "inahamishwa");
   P ("file.deleting", "inafutwa");
   P ("file.deleted", "imefutwa");
   P ("file.restoring", "inarejeshwa");
   P ("file.synced", "imesawazishwa");
   P ("form.valid_input", "ingizo sahihi");
   P ("form.invalid_input", "ingizo si sahihi");
   P ("form.dirty", "imebadilishwa");
   P ("form.pristine", "haijabadilishwa");
   P ("form.submitted", "imewasilishwa");
   P ("form.submission_failed", "uwasilishaji umeshindwa");
   P ("health.healthy", "hali nzuri");
   P ("health.degraded", "utendaji umeshuka");
   P ("health.unhealthy", "hali mbaya");
   P ("health.incident", "tukio");
   P ("health.maintenance", "matengenezo");
   P ("health.recovering", "inarejea");
   P ("issue.open", "wazi");
   P ("issue.closed", "imefungwa");
   P ("issue.reopened", "imefunguliwa tena");
   P ("issue.assigned", "imekabidhiwa");
   P ("issue.unassigned", "haijakabidhiwa");
   P ("issue.merged", "imeunganishwa");
   P ("network.offline", "nje ya mtandao");
   P ("network.online", "mtandaoni");
   P ("network.connecting", "inaunganisha");
   P ("network.syncing", "inasawazisha");
   P ("network.sync_failed", "usawazishaji umeshindwa");
   P ("network.permission_denied", "ruhusa imekataliwa");
   P ("network.read_only", "kusoma tu");
   P ("notification.unread", "haijasomwa");
   P ("notification.read", "imesomwa");
   P ("notification.muted", "imenyamazishwa");
   P ("notification.snoozed", "imeahirishwa");
   P ("notification.sent", "imetumwa");
   P ("notification.delivered", "imewasilishwa");
   P ("payment.payment_authorized", "malipo yameidhinishwa");
   P ("payment.payment_captured", "malipo yamepokelewa");
   P ("payment.payment_refunded", "malipo yamerejeshwa");
   P ("payment.payment_disputed", "malipo yanapingwa");
   P ("payment.payment_requires_action", "malipo yanahitaji hatua");
   P ("payment.payment_expired", "muda wa malipo umeisha");
   P ("ui.empty", "tupu");
   P ("ui.loading", "inapakia");
   P ("ui.saving", "inahifadhi");
   P ("ui.saved", "imehifadhiwa");
   P ("ui.unsaved", "haijahifadhiwa");
   P ("ui.retrying", "inajaribu tena");
   P ("ui.paused", "imesitishwa");
   P ("ui.complete", "imekamilika");
   P ("ui.failed", "imeshindwa");
   P ("ui.due_soon", "inakaribia tarehe ya mwisho");
   P ("ui.overdue", "imechelewa");
   P ("ui.last_seen", "alionekana mwisho");
   P ("ui.updated_just_now", "imesasishwa sasa hivi");
   P ("queue.queued", "iko foleni");
   P ("queue.running", "inaendeshwa");
   P ("queue.waiting", "inasubiri");
   P ("queue.blocked", "imezuiwa");
   P ("queue.canceled_job", "kazi imeghairiwa");
   P ("queue.completed_job", "kazi imekamilika");
   P ("search.filtering", "inachuja");
   P ("search.filtered", "imechujwa");
   P ("search.no_matches", "hakuna zinazolingana");
   P ("search.search_ready", "utafutaji uko tayari");
   P ("search.search_failed", "utafutaji umeshindwa");
   P ("search.query_too_short", "hoja ni fupi mno");
   P ("security.secure", "salama");
   P ("security.insecure", "si salama");
   P ("security.vulnerable", "iko hatarini");
   P ("security.encrypted", "imesimbwa kwa njia fiche");
   P ("security.unencrypted", "haijasimbwa kwa njia fiche");
   P ("security.token_expired", "muda wa tokeni umeisha");
   P ("sync.sync_idle", "usawazishaji hauna shughuli");
   P ("sync.syncing_now", "inasawazisha sasa");
   P ("sync.sync_queued", "usawazishaji uko foleni");
   P ("sync.sync_conflict", "mgongano wa usawazishaji");
   P ("sync.sync_complete", "usawazishaji umekamilika");
   P ("sync.sync_error", "hitilafu ya usawazishaji");
   P ("task.todo", "cha kufanya");
   P ("task.in_progress", "inaendelea");
   P ("task.done", "imekamilika");
   P ("task.skipped", "imerukwa");
   P ("task.blocked_task", "imezuiwa");
   P ("task.waiting_on", "inasubiri");
   P ("ticket.ticket_new", "tiketi mpya");
   P ("ticket.ticket_open", "tiketi iko wazi");
   P ("ticket.ticket_waiting", "tiketi inasubiri");
   P ("ticket.ticket_escalated", "tiketi imepandishwa");
   P ("ticket.ticket_resolved", "tiketi imetatuliwa");
   P ("ticket.ticket_closed", "tiketi imefungwa");
   P ("transfer.importing", "inaingiza");
   P ("transfer.imported", "imeingizwa");
   P ("transfer.import_failed", "uingizaji umeshindwa");
   P ("transfer.exporting", "inahamisha");
   P ("transfer.exported", "imehamishwa");
   P ("transfer.export_failed", "uhamishaji umeshindwa");
   P ("validation.required", "inahitajika");
   P ("validation.optional", "si lazima");
   P ("validation.invalid", "si sahihi");
   P ("validation.too_short", "fupi mno");
   P ("validation.too_long", "ndefu mno");
   P ("validation.out_of_range", "nje ya masafa");
   P ("validation.already_exists", "tayari ipo");
   P ("workflow.draft", "rasimu");
   P ("workflow.in_review", "inakaguliwa");
   P ("workflow.approved", "imeidhinishwa");
   P ("workflow.rejected", "imekataliwa");
   P ("workflow.published", "imechapishwa");
   P ("workflow.archived", "imehifadhiwa kwenye kumbukumbu");
   P ("database.database_online", "hifadhidata iko mtandaoni");
   P ("database.database_offline", "hifadhidata iko nje ya mtandao");
   P ("database.database_degraded", "utendaji wa hifadhidata umeshuka");
   P ("database.database_migrating", "hifadhidata inahamishwa");
   P ("database.database_migration_failed", "uhamishaji wa hifadhidata umeshindwa");
   P ("database.database_replicating", "hifadhidata inanakiliwa");
   P ("database.database_replication_lagging", "unakili wa hifadhidata unachelewa");
   P ("database.database_backup_running", "nakala rudufu ya hifadhidata inaendelea");
   P ("database.database_backup_failed", "nakala rudufu ya hifadhidata imeshindwa");
   P ("times_noun",
      "{count, plural, =0 {{other}: kamwe} =1 {{one}: mara moja} =2 {{other}: "
      & "mara mbili} other {{other}: mara {count}}}");
   P ("availability.all",
      "{available} kati ya {total, plural, one {{one}} other {{other}}} "
      & "{total} zinapatikana");
   P ("availability.none", "hakuna {other} zinazopatikana");
   P ("availability.partial",
      "{available} kati ya {total, plural, one {{one}} other {{other}}} "
      & "{total} zinapatikana, {unavailable} hazipatikani");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "kwenye foleni");
   P ("operation.running", "inaendelea");
   P ("operation.blocked", "imezuiwa");
   P ("operation.retrying", "inajaribu tena");
   P ("operation.succeeded", "imefaulu");
   P ("operation.partially_succeeded", "imefaulu kwa sehemu");
   P ("operation.failed", "imeshindwa");
   P ("operation.canceled", "imeghairiwa");
   P ("operation.skipped", "imerukwa");
   P ("operation.stale", "imepitwa na wakati");
   P ("operation.unknown_state", "haijulikani");
   P ("operation.last_success", "{name} – ilifaulu mara ya mwisho: {time}");
   P ("operation.next_retry", "{name} – jaribio linalofuata: {time}");
   P ("operation.stale_run", "{name} – imepitwa na wakati kwa {time}");
   P ("summary.skipped", "{count} zimerukwa");
   P ("summary.retried", "{count} zimejaribiwa tena");
   P ("summary.canceled", "{count} zimeghairiwa");
   P ("system.service.operational", "inafanya kazi");
   P ("system.service.degraded", "utendaji umeshuka");
   P ("system.service.partial_outage", "hitilafu ya sehemu");
   P ("system.service.major_outage", "hitilafu kubwa");
   P ("system.service.maintenance", "katika matengenezo");
   P ("system.service.unknown", "hali ya huduma haijulikani");
   P ("system.health.healthy", "hali nzuri");
   P ("system.health.warning", "onyo");
   P ("system.health.critical", "hatari");
   P ("system.health.unavailable", "haipatikani");
   P ("system.health.unknown_health", "hali ya afya haijulikani");
   P ("system.readiness.ready", "iko tayari");
   P ("system.readiness.not_ready", "haiko tayari");
   P ("system.readiness.starting", "inaanza");
   P ("system.readiness.draining", "inamaliza kazi");
   P ("system.readiness.stopped", "imesimamishwa");
   P ("system.readiness.unknown_readiness", "hali ya utayari haijulikani");
   P ("system.component.online", "mtandaoni");
   P ("system.component.offline", "nje ya mtandao");
   P ("system.component.starting", "inaanza");
   P ("system.component.stopping", "inasimama");
   P ("system.component.restarting", "inaanza upya");
   P ("system.component.unknown", "hali ya kijenzi haijulikani");
   P ("system.check.passing", "imefaulu");
   P ("system.check.failing", "imeshindwa");
   P ("system.check.warning", "onyo");
   P ("system.check.skipped", "imerukwa");
   P ("system.check.timed_out", "muda umeisha");
   P ("system.check.unknown", "hali ya ukaguzi haijulikani");
   P ("system.incident.investigating", "inachunguzwa");
   P ("system.incident.identified", "chanzo kimetambuliwa");
   P ("system.incident.monitoring", "inafuatiliwa");
   P ("system.incident.resolved", "imetatuliwa");
   P ("system.incident.scheduled_maintenance", "matengenezo yaliyoratibiwa");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "ukaguzi wa {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {hakuna vijenzi} one {kijenzi {count}} other "
      & "{vijenzi {count}}}");
   P ("system.count.checks",
      "{count, plural, =0 {hakuna ukaguzi} one {ukaguzi {count}} other "
      & "{ukaguzi {count}}}");
   P ("system.count.incidents",
      "{count, plural, =0 {hakuna matukio} one {tukio {count}} other {matukio "
      & "{count}}}");
   P ("system.uptime", "muda wa kufanya kazi {measure}");
   P ("system.latency", "muda wa kusubiri {measure}");
   P ("system.maintenance_window", "dirisha la matengenezo {time}");
   P ("system.last_checked", "ilikaguliwa mwisho {time}");
   P ("system.http.informational", "taarifa");
   P ("system.http.successful", "mafanikio");
   P ("system.http.redirection", "uelekezaji upya");
   P ("system.http.client_error", "hitilafu ya mteja");
   P ("system.http.server_error", "hitilafu ya seva");
   P ("system.exit.success", "msimbo wa kutoka {code}: imefaulu");
   P ("system.exit.failure", "msimbo wa kutoka {code}: imeshindwa");
   P ("system.exit.usage_error", "msimbo wa kutoka {code}: hitilafu ya matumizi");
   P ("system.exit.not_executable", "msimbo wa kutoka {code}: amri haitekelezeki");
   P ("system.exit.not_found", "msimbo wa kutoka {code}: amri haipatikani");
   P ("system.exit.invalid_argument", "msimbo wa kutoka {code}: hoja batili ya kutoka");
   P ("system.exit.signal", "msimbo wa kutoka {code}: imekomeshwa na {signal}");
   P ("validation.problem.required", "{field}: inahitajika");
   P ("validation.problem.minimum", "{field}: iko chini ya kiwango cha chini");
   P ("validation.problem.maximum", "{field}: iko juu ya kiwango cha juu");
   P ("validation.problem.range", "{field}: iko nje ya masafa");
   P ("validation.problem.pattern", "{field}: hailingani na muundo");
   P ("validation.problem.choice", "{field}: lazima iwe mojawapo ya chaguo zinazoruhusiwa");
   P ("validation.problem.dependency", "{field}: inategemea sehemu nyingine");
   P ("validation.problem.custom", "{field}: si sahihi");
   P ("validation.constraint.no_relation", "{field}: lazima iwe {value} halali");
   P ("validation.constraint.less_than", "{field}: lazima iwe chini ya {value}");
   P ("validation.constraint.less_or_equal", "{field}: isizidi {value}");
   P ("validation.constraint.greater_than", "{field}: lazima iwe zaidi ya {value}");
   P ("validation.constraint.greater_or_equal", "{field}: lazima iwe angalau {value}");
   P ("validation.constraint.equal_to", "{field}: lazima iwe sawa na {value}");
   P ("validation.constraint.not_equal_to", "{field}: isiwe sawa na {value}");
   P ("validation.constraint.before_field", "{field}: lazima iwe kabla ya {value}");
   P ("validation.constraint.after_field", "{field}: lazima iwe baada ya {value}");
   P ("validation.choices", "{field}: thamani zinazoruhusiwa {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, thamani iliyoingizwa {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, jaribu tena baada ya {time}");
   P ("net_diagnostic.dns", "{endpoint}: utafutaji wa DNS umeshindwa");
   P ("net_diagnostic.tcp", "{endpoint}: muunganisho wa TCP umeshindwa");
   P ("net_diagnostic.tls", "{endpoint}: cheti cha TLS kimeshindwa");
   P ("net_diagnostic.http", "{endpoint}: ombi la HTTP limeshindwa");
   P ("net_diagnostic.proxy", "{endpoint}: proksi imeshindwa");
   P ("net_diagnostic.timeout", "{endpoint}: muda umeisha");
   P ("net_diagnostic.reset", "{endpoint}: muunganisho umewekwa upya");
   P ("net_diagnostic.unknown_network", "{endpoint}: tatizo la mtandao");
   P ("progress.state.not_started", "haijaanza");
   P ("progress.state.running", "inaendelea");
   P ("progress.state.stalled", "imekwama");
   P ("progress.state.retrying", "inajaribu tena");
   P ("progress.state.complete", "imekamilika");
   P ("progress.state.failed", "imeshindwa");
   P ("progress.of", "{subject}: {done} kati ya {total} zimekamilika ({percent}%), {state}");
   P ("progress.done",
      "{subject}: {done, plural, one {{done} imekamilika} other {{done} "
      & "zimekamilika}}, {state}");
   P ("collection.summary",
      "{name}: {total, plural, one {kipengee {total}} other {vipengee "
      & "{total}}}, {unique, plural, one {thamani ya kipekee {unique}} other "
      & "{thamani za kipekee {unique}}}, {duplicates, plural, one {nakala "
      & "rudufu {duplicates}} other {nakala rudufu {duplicates}}}, {outliers, "
      & "plural, one {thamani isiyo ya kawaida {outliers}} other {thamani "
      & "zisizo za kawaida {outliers}}}");
   P ("top_frequency", "{name}: {value} (mara {count})");
   P ("calendar_date.fiscal_year", "MF {year}");
   P ("calendar_date.fiscal_quarter", "Robo ya {part} MF {year}");
   P ("calendar_date.fiscal_half", "{part, plural, =1 {Nusu ya kwanza} other {Nusu ya pili}} MF {year}");
   P ("calendar_date.fiscal_year_end", "mwisho wa MF {year}");
   P ("calendar_date.semester", "Muhula wa {part} {year}");
   P ("calendar_date.half_year", "{part, plural, =1 {Nusu ya kwanza} other {Nusu ya pili}} {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {nusu ya kwanza ya {year}} other {nusu ya pili ya "
      & "{year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {mwanzoni mwa {text}} mid {katikati ya {text}} "
      & "other {mwishoni mwa {text}}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {mwanzoni mwa {text}} mid {katikati ya {text}} "
      & "other {mwishoni mwa {text}}}");
   P ("calendar_range.weekend.last", "wikendi iliyopita");
   P ("calendar_range.weekend.this", "wikendi hii");
   P ("calendar_range.weekend.next", "wikendi ijayo");
   P ("calendar_range.weekend_of", "wikendi ya {date}");
   P ("calendar_range.week.last", "wiki iliyopita");
   P ("calendar_range.week.this", "wiki hii");
   P ("calendar_range.week.next", "wiki ijayo");
   P ("calendar_range.week_of", "wiki ya {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "endelea");
   P ("http.reason.101", "kubadilisha itifaki");
   P ("http.reason.102", "inachakata");
   P ("http.reason.103", "vidokezo vya mapema");
   P ("http.reason.200", "sawa");
   P ("http.reason.201", "imeundwa");
   P ("http.reason.202", "imekubaliwa");
   P ("http.reason.203", "taarifa isiyo na mamlaka");
   P ("http.reason.204", "hakuna maudhui");
   P ("http.reason.205", "weka upya maudhui");
   P ("http.reason.206", "maudhui kiasi");
   P ("http.reason.207", "hali nyingi");
   P ("http.reason.208", "tayari imeripotiwa");
   P ("http.reason.226", "IM imetumika");
   P ("http.reason.300", "chaguo nyingi");
   P ("http.reason.301", "imehamishwa kabisa");
   P ("http.reason.302", "imepatikana");
   P ("http.reason.303", "ona nyingine");
   P ("http.reason.304", "haijabadilishwa");
   P ("http.reason.305", "tumia proksi");
   P ("http.reason.307", "uelekezaji upya wa muda");
   P ("http.reason.308", "uelekezaji upya wa kudumu");
   P ("http.reason.400", "ombi baya");
   P ("http.reason.401", "haijaidhinishwa");
   P ("http.reason.402", "malipo yanahitajika");
   P ("http.reason.403", "imekatazwa");
   P ("http.reason.404", "haipatikani");
   P ("http.reason.405", "mbinu hairuhusiwi");
   P ("http.reason.406", "haikubaliki");
   P ("http.reason.407", "uthibitishaji wa proksi unahitajika");
   P ("http.reason.408", "muda wa ombi umeisha");
   P ("http.reason.409", "mgongano");
   P ("http.reason.410", "imeondoka");
   P ("http.reason.411", "urefu unahitajika");
   P ("http.reason.412", "sharti la awali limeshindikana");
   P ("http.reason.413", "maudhui ni makubwa mno");
   P ("http.reason.414", "URI ni ndefu mno");
   P ("http.reason.415", "aina ya midia haitumiki");
   P ("http.reason.416", "masafa hayawezi kutoshelezwa");
   P ("http.reason.417", "matarajio yameshindikana");
   P ("http.reason.418", "mimi ni birika la chai");
   P ("http.reason.421", "ombi lililoelekezwa vibaya");
   P ("http.reason.422", "maudhui hayawezi kuchakatwa");
   P ("http.reason.423", "imefungwa");
   P ("http.reason.424", "utegemezi umeshindikana");
   P ("http.reason.425", "mapema mno");
   P ("http.reason.426", "uboreshaji unahitajika");
   P ("http.reason.428", "sharti la awali linahitajika");
   P ("http.reason.429", "maombi mengi mno");
   P ("http.reason.431", "sehemu za vichwa vya ombi ni kubwa mno");
   P ("http.reason.451", "haipatikani kwa sababu za kisheria");
   P ("http.reason.500", "hitilafu ya ndani ya seva");
   P ("http.reason.501", "haijatekelezwa");
   P ("http.reason.502", "lango baya");
   P ("http.reason.503", "huduma haipatikani");
   P ("http.reason.504", "muda wa lango umeisha");
   P ("http.reason.505", "toleo la HTTP halitumiki");
   P ("http.reason.506", "kibadala pia kinajadiliana");
   P ("http.reason.507", "hifadhi haitoshi");
   P ("http.reason.508", "mzunguko umegunduliwa");
   P ("http.reason.510", "haijapanuliwa");
   P ("http.reason.511", "uthibitishaji wa mtandao unahitajika");
   P ("errno.reason.0", "imefanikiwa");
   P ("errno.reason.1", "operesheni hairuhusiwi");
   P ("errno.reason.2", "hakuna faili au saraka kama hiyo");
   P ("errno.reason.3", "hakuna mchakato kama huo");
   P ("errno.reason.4", "mwito wa mfumo umekatizwa");
   P ("errno.reason.5", "hitilafu ya ingizo/towe");
   P ("errno.reason.6", "hakuna kifaa au anwani kama hiyo");
   P ("errno.reason.9", "kifafanuzi cha faili kibaya");
   P ("errno.reason.11", "rasilimali haipatikani kwa muda");
   P ("errno.reason.12", "kumbukumbu haitoshi");
   P ("errno.reason.13", "ruhusa imekataliwa");
   P ("errno.reason.17", "faili ipo");
   P ("errno.reason.20", "si saraka");
   P ("errno.reason.21", "ni saraka");
   P ("errno.reason.22", "hoja batili");
   P ("errno.reason.24", "faili nyingi mno zilizo wazi");
   P ("errno.reason.28", "hakuna nafasi iliyobaki kwenye kifaa");
   P ("errno.reason.32", "bomba limevunjika");
   P ("errno.reason.98", "anwani tayari inatumika");
   P ("errno.reason.110", "muda wa muunganisho umeisha");
   P ("errno.reason.111", "muunganisho umekataliwa");
   P ("signal.reason.1", "muunganisho umekatika");
   P ("signal.reason.2", "ukatizaji");
   P ("signal.reason.3", "ondoka");
   P ("signal.reason.4", "agizo lisilo halali");
   P ("signal.reason.5", "mtego wa ufuatiliaji");
   P ("signal.reason.6", "kukatisha");
   P ("signal.reason.7", "hitilafu ya basi");
   P ("signal.reason.8", "hitilafu ya nukta inayoelea");
   P ("signal.reason.9", "imeuawa");
   P ("signal.reason.10", "ishara ya mtumiaji 1");
   P ("signal.reason.11", "hitilafu ya ugawaji wa kumbukumbu");
   P ("signal.reason.12", "ishara ya mtumiaji 2");
   P ("signal.reason.13", "bomba limevunjika");
   P ("signal.reason.14", "kengele");
   P ("signal.reason.15", "ombi la kukomesha");
   P ("signal.reason.17", "hali ya mchakato mtoto imebadilika");
   P ("signal.reason.18", "endelea");
   P ("signal.reason.19", "imesimamishwa");
   P ("signal.reason.20", "imesimamishwa na terminali");
   P ("signal.reason.28", "ukubwa wa dirisha umebadilika");
   P ("sqlstate.reason.00", "imekamilika kwa mafanikio");
   P ("sqlstate.reason.01", "onyo");
   P ("sqlstate.reason.02", "hakuna data");
   P ("sqlstate.reason.08", "hitilafu ya muunganisho");
   P ("sqlstate.reason.0a", "kipengele hakitumiki");
   P ("sqlstate.reason.22", "hitilafu ya data");
   P ("sqlstate.reason.23", "ukiukaji wa kizuizi cha uadilifu");
   P ("sqlstate.reason.24", "hali batili ya kishale");
   P ("sqlstate.reason.25", "hali batili ya muamala");
   P ("sqlstate.reason.28", "ubainishaji batili wa uidhinishaji");
   P ("sqlstate.reason.2d", "ukomeshaji batili wa muamala");
   P ("sqlstate.reason.3d", "jina batili la katalogi");
   P ("sqlstate.reason.3f", "jina batili la skima");
   P ("sqlstate.reason.40", "urejeshaji nyuma wa muamala");
   P ("sqlstate.reason.42", "hitilafu ya sintaksia au ukiukaji wa kanuni ya ufikiaji");
   P ("sqlstate.reason.53", "rasilimali hazitoshi");
   P ("sqlstate.reason.54", "kikomo cha programu kimezidishwa");
   P ("sqlstate.reason.55", "kitu hakiko katika hali ya sharti la awali");
   P ("sqlstate.reason.57", "uingiliaji kati wa mwendeshaji");
   P ("sqlstate.reason.58", "hitilafu ya mfumo");
   P ("sqlstate.reason.hv", "hitilafu ya kifungashio cha data ya nje");
   P ("sqlstate.reason.p0", "hitilafu ya PL/pgSQL");
   P ("sqlstate.reason.xx", "hitilafu ya ndani");
   P ("system.signal_numbered", "ishara {number} {name} {reason}");
   P ("http.reason.unknown", "hali isiyojulikana");
   P ("errno.reason.unknown", "hitilafu isiyojulikana");
   P ("signal.reason.unknown", "ishara isiyojulikana");
   P ("sqlstate.reason.unknown", "darasa la SQLSTATE lisilojulikana");
end Locale_Sw;
