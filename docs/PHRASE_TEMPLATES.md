# Phrase templates

Humanize's phrase formatters (pagination, counts, durations, domain phrases)
write their English wording in code. Every other locale renders the phrase
through a catalog key, `humanize.phrase.<name>`, when the locale's catalog has
one. Without a translation the English wording stands.

A translation is an ICU MessageFormat entry, `<locale>.humanize.phrase.<name> =
...`, in the locale's phrase catalog fragment. The arguments are the ones listed
here.

- **Numbers** arrive as plain ASCII digits. Write `{total, number}` for the
  locale's own digits and grouping, or `{total}` for the digits as given.
  Choose a plural form with `{total, plural, one {...} other {...}}`.
- **`one` / `other`** are the caller's singular and plural noun, already in the
  caller's language. Choose between them by the locale's plural rules on the
  number the phrase counts: `{total, plural, one {{one}} other {{other}}}`.
- **`zero` / `two` / `few` / `many`** are the noun's further forms, which a
  caller registers on its context
  (`Humanize.Contexts.With_Noun_Forms (Ctx, "pliki", Many => "plików")`); each
  is the plural form where none is registered. Use them in languages with those
  plural categories: `one {{one}} few {{few}} many {{many}} other {{other}}`.
- **`genitive_one` / `genitive_other` / `accusative_one` / `accusative_other`
  / `locative_one` / `locative_other` / `instrumental_one` /
  `instrumental_other`** are the noun's case forms, registered the same way,
  else the singular or plural: Polish "z {total} {total, plural, one
  {{genitive_one}} other {{genitive_other}}}" ("z 5 plików"), Slovak "pri
  všetkých {locative_other}".
- **`gender`** is the gender the caller registered for its noun
  (`With_Noun_Forms (Ctx, "lignes", Gender => "feminine")`): "masculine",
  "feminine", "neuter", "common" or "masculine_animate", else "other". A
  template agrees with it by selecting, and its `other` branch is the neutral
  wording: French `{gender, select, masculine {aucun {one}} feminine {aucune
  {one}} other {pas de {other}}}`.
- **Text arguments** (`first`, `severity`, ...) are inserted as given, or
  selected on with `{severity, select, ...}`.

The English column is what the formatter writes in English, as a template.

The translations live in `src/humanize-catalogs-phrase_data-locale_<locale>.adb`,
one function per locale. Each entry is `P ("<name>", "<template>")`, written in
UTF-8. Every non-English shipped locale must render every key here; the test
"every locale renders every phrase" checks that each one renders without
error and leaves no braces behind. Avoid the ASCII apostrophe, which ICU
reads as a quote; write U+2019 instead.

## Lists

| Key | Arguments | English |
|---|---|---|
| `all_count` | total, one, other | `all {total} {total, plural, one {{one}} other {{other}}}` |
| `filtered_count.none` | matching, total, one, other | `no {other} match` |
| `filtered_count.all` | matching, total, one, other | `all {total} {total, plural, one {{one}} other {{other}}} match` |
| `filtered_count.some` | matching, total, one, other | `{matching} of {total} {total, plural, one {{one}} other {{other}}} match` |
| `more_count` | visible, remaining | `{visible} shown, +{remaining} more` |
| `others_count` | first, remaining | `{first} and {remaining, plural, one {1 other} other {{remaining} others}}` |
| `page_count` | page, total | `page {page} of {total}` |
| `page_navigation.only` | | `only page` |
| `page_navigation.first` | | `first page, next available` |
| `page_navigation.last` | | `last page, previous available` |
| `page_navigation.middle` | | `previous and next available` |
| `page_size` | size, one, other | `{size} {size, plural, one {{one}} other {{other}}} per page` |
| `pagination_range` | first, last, total, one, other | `{first}-{last} of {total} {total, plural, one {{one}} other {{other}}}` |
| `position_count` | position, total | `{position} of {total}` |
| `selection_count` | selected, total, one, other | `{selected} of {total} {total, plural, one {{one}} other {{other}}} selected` |
| `showing_count` | showing, total, one, other | `showing {showing} of {total} {total, plural, one {{one}} other {{other}}}` |
| `validation_count` | count, severity (error, warning, info) | `{count, plural, =0 {no {severity, select, error {errors} warning {warnings} other {notices}}} one {1 {severity, select, error {error} warning {warning} other {notice}}} other {{count} {severity, select, error {errors} warning {warnings} other {notices}}}}` |
| `collection.empty` | visible, total, hidden, one, other | `no {other}` |
| `collection.none_shown` | visible, total, hidden, one, other | `no {total, plural, one {{one}} other {{other}}} shown` |
| `collection.showing_hidden` | visible, total, hidden, one, other | `showing {visible} of {total} {total, plural, one {{one}} other {{other}}}, {hidden} hidden` |
| `collection.showing` | visible, total, hidden, one, other | `showing {visible} of {total} {total, plural, one {{one}} other {{other}}}` |
| `collection.shown_hidden` | visible, total, hidden, one, other | `{visible} {visible, plural, one {{one}} other {{other}}} shown, {hidden} hidden` |
| `collection.shown` | visible, total, hidden, one, other | `{visible} {visible, plural, one {{one}} other {{other}}} shown` |
| `collection.visible_out_of` | visible, total, hidden, one, other | `{visible} {visible, plural, one {{one}} other {{other}}} visible out of {total} {total, plural, one {{one}} other {{other}}}` |

## Progress and business time

| Key | Arguments | English |
|---|---|---|
| `complete_count` | done, total | `{done} of {total} complete` |
| `percent_complete` | percent (decimal text, one place) | `{percent}% complete` |
| `step_count` | step, total | `step {step} of {total}` |
| `attempt_count` | attempt, total | `attempt {attempt} of {total}` |
| `throughput_remaining` | remaining, rate, unit (the caller's singular noun) | `{remaining} {remaining, plural, one {{unit}} other {{unit}s}} remaining at {rate} {unit}/s` |
| `accessible_progress` | done, total, percent | `{done} of {total} complete, {percent} percent` |
| `business_days` | days | `{days} business {days, plural, one {day} other {days}}` |
| `working_hours` | hours | `{hours} working {hours, plural, one {hour} other {hours}}` |
| `end_of_week` | | `end of week` |
| `end_of_month` | | `end of month` |
| `end_of_quarter` | | `end of quarter` |

## Dates

| Key | Arguments | English |
|---|---|---|
| `time_of_day.night` | | `night` |
| `time_of_day.morning` | | `morning` |
| `time_of_day.afternoon` | | `afternoon` |
| `time_of_day.evening` | | `evening` |
| `calendar_relation.week.past` | | `last week` |
| `calendar_relation.week.current` | | `this week` |
| `calendar_relation.week.next` | | `next week` |
| `calendar_relation.month.past` | | `last month` |
| `calendar_relation.month.current` | | `this month` |
| `calendar_relation.month.next` | | `next month` |
| `calendar_relation.year.past` | | `last year` |
| `calendar_relation.year.current` | | `this year` |
| `calendar_relation.year.next` | | `next year` |
| `due.overdue` | days (positive) | `overdue by {days} {days, plural, one {day} other {days}}` |
| `due.today` | days | `due today` |
| `due.tomorrow` | days | `due tomorrow` |
| `due.in` | days | `due in {days} days` |

| `calendar_difference.same_day` | | `same day` |
| `calendar_difference.zero` | | `0 days` |
| `calendar_difference.future` | difference (CLDR units and list, rendered) | `in {difference}` |
| `calendar_difference.past` | difference | `{difference} ago` |

A calendar relation more than one year away is an ISO date in every locale.
A calendar difference's parts come from CLDR in every locale
(`calendar_difference.part`, `calendar_difference.join`); only the four keys
above need a translation. A locale whose frame governs a grammatical case
names it in `calendar_difference.case.future` / `calendar_difference.case.past`
(German "in"/"vor" take the dative: "in 2 Jahren"); the parts then come in
CLDR's forms for that case. Without the key they are nominative. The date
comparisons take `date_comparison.case.after` / `.before` the same way (Polish
"o 2 lata później" accusative, Lithuanian "2 metais vėliau" instrumental).

## Measurements

The measure argument is the value in CLDR's unit for the locale
(`12,5 %`, `144 Hz`, `15,6 Zoll`), rendered.

| Key | Arguments | English |
|---|---|---|
| `cpu_load` | measure | `{measure} CPU` |
| `battery` | measure | `{measure} battery` |
| `screen_size` | measure | `{measure} screen` |
| `refresh_rate` | measure | `{measure} refresh` |
| `editorial_percent.symbol` | value (decimal text) | `{value}%` |
| `editorial_percent.word` | value | `{value} percent` |
| `recurrence.<unit>`, unit second, minute, hour, day, week, month, quarter, year | every | `every {every} {every, plural, one {<unit>} other {<unit>s}}` |

## Operations, availability and frequency

| Key | Arguments | English |
|---|---|---|
| `times_noun` | count, one, other | `{count, plural, =0 {never {other}} =1 {once {one}} =2 {twice {other}} other {{count} {other}}}` |
| `availability.all` | available, total, unavailable, one, other | `{available} of {total} {total, plural, one {{one}} other {{other}}} available` |
| `availability.none` | available, total, unavailable, one, other | `no {total, plural, one {{one}} other {{other}}} available` |
| `availability.partial` | available, total, unavailable, one, other | `{available} of {total} … available, {unavailable} unavailable` |
| `operation_progress` | name, state (a translated `operation.*` label), details (joined `summary.*` segments) | `{name} {state}: {details}` |
| `operation.<state>` | | queued, running, blocked, retrying, succeeded, partially succeeded, failed, canceled, skipped, stale, unknown |
| `operation.last_success` | name, time | `{name} last succeeded {time}` |
| `operation.next_retry` | name, time | `{name} next retry {time}` |
| `operation.stale_run` | name, time | `{name} stale for {time}` |
| `summary.skipped`, `summary.retried`, `summary.canceled` | count | `{count} skipped`, ... |

`Humanize.Operations` and `Humanize.Resources.Availability_Label` speak a
locale through the overloads that take a context. A number comparison's noun
(`Unit_Singular`/`Unit_Plural`) takes the case its frame governs
(`number_comparison.case`, `noun.<case>`), and `count`/`noun` entries per
language map plural categories to the registered noun forms.

## System status

| Key | Arguments | English |
|---|---|---|
| `system.service.<state>` | | operational, degraded performance, partial outage, major outage, under maintenance, unknown service status |
| `system.health.<state>` | | healthy, warning, critical, unavailable, unknown health |
| `system.readiness.<state>` | | ready, not ready, starting, draining, stopped, unknown readiness |
| `system.component.<state>` | | online, offline, starting, stopping, restarting, unknown component status |
| `system.check.<state>` | | passing, failing, warning, skipped, timed out, unknown check status |
| `system.incident.<state>` | | investigating, identified, monitoring, resolved, scheduled maintenance |
| `system.named` | name, state (a translated state label) | `{name} {state}` |
| `system.check_named` | name, state (a translated `system.check.*` label) | `{name} check {state}` |
| `system.count.components`, `.checks`, `.incidents` | count | `{count, plural, =0 {no components} one {{count} component} other {{count} components}}` |
| `system.uptime`, `system.latency` | measure | `uptime {measure}`, `latency {measure}` |
| `system.maintenance_window`, `system.last_checked` | time | `maintenance window {time}`, `last checked {time}` |
| `system.http.<class>` | | informational, successful, redirection, client error, server error |
| `system.exit.<reason>` | code | `exit {code} success` (failure, usage error, command not executable, command not found, invalid exit argument) |
| `system.exit.signal` | code, signal (the English signal label) | `exit {code} terminated by {signal}` |

`Humanize.System_Status.Localized` speaks a locale: the same functions as
`Humanize.System_Status`, taking a context. Errno, signal, SQLSTATE and HTTP reason texts stay the English of
their standards; `Humanize.Domain_Details` stays English too -- it is the
machine-readable metadata layer (log fields, `surface=` tags) its parsers
read back.

## Review page

The phrase review page (https://claude.ai/artifact/4gdexMdU8CmmxUaysWinzu) shows
every phrase as each locale renders it and lets reviewers suggest fixes. Its
data is `examples/bin/phrase_review_data docs/phrase_notes.tsv > data.json`,
republished beside the page whenever the catalogs or the notes change.

## Reading phrases back

`Humanize.Parsing.Phrases.Parse (Context, "page_count", "Seite 3 von 5")`
returns the arguments that render the text in the context's locale; a
translation that leaves a number out (German "heute fällig") still reads,
with that number 0 or 1. The catalog's `en` entries are the English column
here, so English output reads back too.

`Humanize.Parsing.Localized` reads the quantities back the same way:
`Parse_Number` ("1.234,5", Arabic-Indic digits), `Parse_Duration` ("2
Stunden, 30 Minuten", Swahili "dakika 5", Arabic "ساعتان"), `Parse_Relative`
("vor 3 Tagen", "gestern") and `Parse_Bytes` ("1,5 KiB"). It learns a
locale's forms by rendering sample values with `Durations.Format_Components`,
`Datetimes.Relative` and `Bytes.Format` (cached per runtime and locale, about
70 ms the first time), so it reads exactly what those write. A text the locale
writes for two offsets (Hindi "कल", yesterday and tomorrow) reads as the past
and is not `Exact`. The other English parsers in `Humanize.Parsing` stay
English.

## Regional variants

`fr-CA`, `de-CH` and `de-LI` (ss for ß) and `en-001` ("cancelled", which
en-GB, en-AU, en-IN and the other variants CLDR places under international
English reach) are overrides too; a regional English entry replaces the
formatter's own English. `en-CA` repeats en-001's "cancelled" (CLDR's parent
for en-CA is en, but Canadian usage doubles the l). `fr-CH` and `fr-BE` say
"jours ouvrables" where France says "jours ouvrés".

`zh-Hant` is a whole Traditional Chinese catalog (Taiwan usage), which zh-TW,
zh-HK and zh-MO reach through CLDR's likely scripts. zh-HK and zh-MO reach
`zh-Hant-HK` first (今日, 上載, 每星期). `pt-PT` and `es-419` hold
only the entries that differ from `pt` (Brazilian) and `es`; pt-AO, pt-MZ, ...
reach pt-PT and es-MX, es-AR, ... reach es-419 through CLDR's parent locales.
A regional file may leave any key out.

## Nouns by language

What a caller passes as the plural (`Plural`) and registers on its context
(`Humanize.Contexts.With_Noun_Forms`) so the translations come out right; an
unregistered form falls back to the singular or plural. Languages not listed
need only singular and plural.

| Language | Plural | Register |
|---|---|---|
| Polish | nominative plural ("pliki") | Genitive_One "pliku", Genitive_Other "plików"; Accusative_One/Other where they differ ("kartę") |
| Czech | nominative plural ("soubory") | Genitive_One "souboru", Genitive_Other "souborů" |
| Slovak | nominative plural ("súbory") | Genitive_One "súboru", Genitive_Other "súborov"; Locative_One "súbore", Locative_Other "súboroch" |
| Slovenian | nominative plural ("datoteke") | Two: dual ("datoteki"); Genitive_One "datoteke", Genitive_Other "datotek"; Locative_One "datoteki", Locative_Other "datotekah" |
| Russian | nominative plural ("файлы") | Few: genitive singular ("файла"); Many: genitive plural ("файлов"); Genitive_One "файла", Genitive_Other "файлов" |
| Ukrainian | nominative plural ("файли") | Many: genitive plural ("файлів"); Genitive_One "файлу", Genitive_Other "файлів" |
| Lithuanian | nominative plural ("failai") | Genitive_One "failo", Genitive_Other "failų" |
| Romanian | plural ("fișiere") | Few: plural (the template adds "de" for 20 and up) |
| Arabic | plural ("ملفات") | Two: dual; Few: plural; Many: singular accusative ("ملفًا"); Zero: singular |

## Statuses

Each key is `<domain>.<status>`, the status as the enumeration names it in
lower case, the same text the `*_Key` functions return; the English is the
phrase the formatter writes. Besides the domains below: `ui`, `file`,
`validation`, `empty`, `network`, `auth`, `billing`, `workflow`, `queue`,
`security`, `deployment`, `health`, `notification`, `form`, `access`, `sync`,
`transfer`, `search`, `collaboration`, `issue`, `task`, `ci`, `ticket`,
`payment` and `database` (`database.database_online`, ...).

| Domain | Statuses | English |
|---|---|---|
| `backup` | backup_running, backup_completed, backup_failed, backup_stale | `backup running`, ... |
| `incident` | incident_investigating, incident_identified, incident_mitigated, incident_resolved | `investigating incident`, `incident identified`, ... |
| `release` | release_drafting, release_ready, release_published, release_rolled_back | `release drafting`, ... |
| `audit` | audit_created, audit_updated, audit_deleted, audit_restored | `audit entry created`, ... |
| `flag` | flag_enabled, flag_disabled, flag_rolling_out, flag_rolled_back | `feature flag enabled`, ... |
| `webhook` | webhook_pending, webhook_delivered, webhook_failed, webhook_retrying | `webhook pending`, ... |
| `api_key` | api_key_active, api_key_revoked, api_key_expired, api_key_rotated | `API key active`, ... |
| `quota` | quota_available, quota_near_limit, quota_exceeded, quota_reset | `quota available`, ... |
| `invoice` | invoice_draft, invoice_sent, invoice_paid, invoice_refunded, invoice_overdue, refund_failed | `invoice draft`, ..., `refund failed` |

## Summaries and comparisons

| Key | Arguments | English |
|---|---|---|
| `cache_summary.empty` | hits, misses, rate | `cache: no requests` |
| `cache_summary` | hits, misses, rate | `cache: {hits} {hits, plural, one {hit} other {hits}}, {misses} {misses, plural, one {miss} other {misses}}, {rate}% hit rate` |
| `field_change_summary` | total, changed, added, removed, one, other | `{total} {total, plural, one {{one}} other {{other}}}: {changed} changed, {added} added, {removed} removed` |
| `field_diff` | field, before, after | `{field} changed from {before} to {after}` |
| `field_added` | field, value | `{field} added as {value}` |
| `field_removed` | field, value | `{field} removed (was {value})` |
| `field_unchanged` | field, value | `{field} unchanged at {value}` |
| `number_comparison.equal` | current, baseline, quantity | `{current} is equal to {baseline}` |
| `number_comparison.higher` | current, baseline, quantity | `{current} is {quantity} higher than {baseline}` |
| `number_comparison.lower` | current, baseline, quantity | `{current} is {quantity} lower than {baseline}` |
| `percent_comparison.equal`, `.higher`, `.lower` | current, baseline, quantity (a rendered percentage) | as `number_comparison` |
| `file_size_comparison.same` | current, baseline, quantity | `{current} is the same size as {baseline}` |
| `file_size_comparison.larger` | current, baseline, quantity (a rendered size) | `{current} is {quantity} larger than {baseline}` |
| `file_size_comparison.smaller` | current, baseline, quantity | `{current} is {quantity} smaller than {baseline}` |
| `date_comparison.same` | current, baseline, quantity | `{current} is the same date as {baseline}` |
| `date_comparison.after` | current, baseline, quantity (a rendered calendar difference) | `{current} is {quantity} after {baseline}` |
| `date_comparison.before` | current, baseline, quantity | `{current} is {quantity} before {baseline}` |

A queue or domain summary is segments joined by CLDR's unit list
(`summary.join`), inside a frame. A summary with any untranslated segment stays
English.

| Key | Arguments | English |
|---|---|---|
| `queue_summary.empty` | | `queue empty` |
| `queue_summary` | details | `queue: {details}` |
| `domain_summary` | domain (queue, job, run, cache, sync, import, export), state (queued, running, waiting, paused, complete, failed, stale, skipped), details | `{domain} {state}: {details}` |
| `summary.none` | count, total, one, other | `no {other}` |
| `summary.completed` | count, total, one, other | `{count} {count, plural, one {{one}} other {{other}}} complete` |
| `summary.completed_of` | count, total, one, other | `{count} of {total} {total, plural, one {{one}} other {{other}}} complete` |
| `summary.failed` | count | `{count} failed` |
| `summary.queued` | count, one, other | `{count} {count, plural, one {{one}} other {{other}}} queued` |
| `summary.running` | count | `{count} running` |
| `summary.complete` | count | `{count} complete` |
