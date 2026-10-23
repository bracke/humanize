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
  Languages with more forms (few, many) still have only these two nouns.
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
above need a translation.

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

## Statuses

Each key is `<domain>.<status>`, the status as the enumeration names it in
lower case; the English is the phrase the formatter writes.

| Domain | Statuses | English |
|---|---|---|
| `backup` | backup_running, backup_completed, backup_failed, backup_stale | `backup running`, ... |
| `incident` | incident_investigating, incident_identified, incident_mitigated, incident_resolved | `investigating incident`, `incident identified`, ... |
| `release` | release_drafting, release_ready, release_published, release_rolled_back | `release drafting`, ... |
| `audit` | audit_created, audit_updated, audit_deleted, audit_restored | `audit entry created`, ... |
| `feature_flag` | flag_enabled, flag_disabled, flag_rolling_out, flag_rolled_back | `feature flag enabled`, ... |
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
