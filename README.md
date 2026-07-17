# Humanize

`humanize` is an Ada 2022 Alire library that turns machine values into
human-readable, localized text:

* relative date/times (`now`, `yesterday`, `4 hours ago`, `in 3 days`) with precision, rounding, two-unit, and calendar-only policies, richer calendar-relative labels (`next Friday`, `tomorrow morning`, `tonight`, `this weekend`), calendar-date presets, ordinal date phrases, early/mid/late period labels, fiscal/semester/half-year labels, exact calendar differences, and compact or semantic date/time ranges with weekday, same-year, weekend, week, month, quarter, relative same-day, and business-time labels;
* durations (`90 seconds` -> `1 minute`; multi-unit `1 hour, 30 minutes`; compact `1h 30m`; clock `01:30:05`), exact weeks, approximate 30-day months/365-day years, configurable natural approximation wording (`almost 2 hours`, `just over 3 weeks`, `a little under 1 month`, `about half an hour`), Rails/Django/conversational distance-style thresholds, intervals, shipped-locale common cron/schedule labels, configurable business-time labels with observed and nth-weekday holiday helpers plus TARGET2, UK England/Wales, Canada federal, Germany, France, NYSE, ASX, JPX/TSE, SIX, SGX, HKEX, NSE, B3, BMV, Australia national, Japan, Switzerland, and Singapore rule presets, lifecycle/freshness phrases, and progress/retry phrases;
* byte sizes (`1536` → `1.5 KiB`, decimal, binary, or auto), file-size summaries, transfer-remaining labels, and disk-usage labels;
* color and visual value labels, including full CSS named colors, `currentColor`, CSS Color 4 parsing into sRGB, alpha hex, `rgb`/`hsl`/`hwb`/`lab`/`lch`/`oklab`/`oklch`/`color()` input, `none` channels, simple `calc()` expressions, RGB/RGBA/HSL/HSV summaries, CIE Lab/OKLab conversion, hue family, saturation, temperature, chroma, and pastel/vivid descriptions, nearest and descriptive color names, palette roles, harmony, contrast suggestions, accessibility warnings, contrast metadata, structured palette metadata, mood summaries, opacity, alpha-composited contrast, contrast remediation, brightness, contrast/readability labels, RGB and perceptual color-difference labels;
* ordinals (`21` → `21st`, with feminine forms), compact numbers (`1200` → `1.2K` or `1.2 thousand`), deterministic spellout, AP/editorial number wording, number ranges/proportions including decimal ranges, inclusive/exclusive ranges, tolerances, uncertainty labels, thresholds, range-position labels, and noun ratios, relative change phrases, deterministic currency phrases, and percentages (`50` → `50%`);
* unit quantities, whole or fractional (`5` + `Kilometer` → `5 kilometers`; `21` + `Celsius` → `21 degrees Celsius`), including practical engineering, display, print, database-throughput, signal, and storage-endurance helpers;
* parser/scanner normalization helpers, boolean and tri-state value labels for UI/config/status surfaces, URL/domain/network endpoint labels with redacted URL display and query summaries, resource utilization/capacity/quota/availability labels, version/release/compatibility labels, coordinate, bearing, direction, distance-with-bearing, and bounding-box labels, markup tag/attribute/content-type/heading/landmark/document-outline labels, secret/token/credential masking and safe display labels, schema field/type/data-shape/constraint labels, diagnostic severity/count/location/check/failure labels, metric threshold/range/window/limit labels, workflow step/state/milestone/approval/blocker labels, collection difference/change-set labels, table/report/data-grid labels, form/input-state labels, navigation/menu/tab/breadcrumb labels, badge/tag/chip labels, notification/inbox/delivery labels, search/filter/facet/sort labels, comment/thread/reaction labels, task/todo/checklist labels, attachment/upload/preview labels, event/calendar/RSVP labels, payment/invoice/refund labels, HTTP/protocol/system status labels for operational diagnostics, typed operations, comparison, moderation, account/session, deployment, data-quality, media, notification-preference, permission, and build/test labels, machine checksum labels for Luhn/IBAN/ISIN/VIN identifiers, collection/page-count summaries, generic queue/job/run/cache/sync/import/export summaries, file/date/number comparison summaries, UTF-8-safe, grapheme-cluster-safe, display-width, and ANSI-aware string truncation/wrapping/slicing including styled wrapping that reopens SGR spans, Unicode-aware reading/speaking metrics, configurable combined text summaries, text-change summaries, privacy-safe address summaries, inferred data-shape summaries, opaque-token grouping/masking, person/name display helpers, safe filename/path labels, Unix file permission/mode labels and parsing, transliteration, string cleanup, and style presets for common UI and technical output policies.

Twenty-two reviewed native or native-orthography catalog fragments ship built in
— English, Danish, German, French, Spanish, Italian, Portuguese, Dutch,
Swedish, Norwegian, Norwegian Bokmal, Finnish, Polish, Czech, Turkish,
Russian, Ukrainian, Japanese, Korean, Chinese, Arabic, and Hindi. The
native-script fragments avoid Latin fallback for Humanize-owned date,
duration, compact-number, unit, frequency, rate, and list words, with
long-form wording for the broad engineering-unit tail. Numeric values are
passed to `i18n` as locale-neutral operands, so decimal separators, grouping,
numbering systems, and CLDR fractional plural agreement come from `i18n`.

Humanize selects a semantic message key and arguments, then renders through the
public [`i18n`](../i18n) runtime. It owns the humanization policy; `i18n` owns
locale fallback, ICU-subset rendering, number display, and plural mechanics.
The dependency direction is one-way:

```text
Humanize -> I18N
```

## Quick start

```ada
with I18N.Runtime;
with Humanize.Catalogs;
with Humanize.Contexts;
with Humanize.Durations;
with Humanize.Status;

procedure Demo is
   Runtime : aliased I18N.Runtime.Instance;
   Loaded  : I18N.Runtime.Load_Result;
begin
   Humanize.Catalogs.Load_Defaults (Runtime, Loaded);

   declare
      Context : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create (Runtime'Access, "en");
      Result  : constant Humanize.Status.Text_Result :=
        Humanize.Durations.Format (Context, 90);  --  "1 minute"
   begin
      null;  --  Humanize.Status.Is_Ok (Result) and the text are now available.
   end;
end Demo;
```

A complete runnable program is in [`examples/humanize_demo.adb`](examples/humanize_demo.adb).
Focused runnable examples are also provided for
[`examples/parse_demo.adb`](examples/parse_demo.adb),
[`examples/bounded_demo.adb`](examples/bounded_demo.adb),
[`examples/color_demo.adb`](examples/color_demo.adb), and
[`examples/domain_demo.adb`](examples/domain_demo.adb),
[`examples/system_status_demo.adb`](examples/system_status_demo.adb),
[`examples/ui_labels_demo.adb`](examples/ui_labels_demo.adb),
[`examples/security_data_demo.adb`](examples/security_data_demo.adb),
[`examples/workflow_ops_demo.adb`](examples/workflow_ops_demo.adb), and
[`examples/product_details_demo.adb`](examples/product_details_demo.adb).
For a shorter import map than the full feature matrix, see
[`docs/PACKAGE_GUIDE.md`](docs/PACKAGE_GUIDE.md).

## Public packages

| Package | Purpose |
| --- | --- |
| `Humanize.Status` | `Status_Code`, `Text_Result`, `Status_Image`. |
| `Humanize.Messages` | Semantic `Message_Id` enum and stable catalog `Key`. |
| `Humanize.Contexts` | Non-owning `Context` binding an `i18n` runtime + locale. |
| `Humanize.Locales` | Neutral locale-code access/array metadata types shared by catalog and phrase support lists. |
| `Humanize.Catalogs` | `Load_Defaults` loads the built-in catalog fragments. |
| `Humanize.Capabilities` | Stable metadata for public capability areas, locale behavior, rendering source, feature support such as bounded, option, parse, scan, metadata, accessibility, and cross-domain APIs, plus aggregate capability coverage summaries. |
| `Humanize.Datetimes` | `Relative`, `Relative_Civil`, `Natural_Day`, natural time-of-day, richer calendar-relative labels, calendar relation, deterministic UTC offset/date/due labels, exact calendar differences, relative precision/rounding policy, two-unit relative output, calendar-date presets, ordinal month/day and weekday phrases, early/mid/late month and quarter phrases, fiscal-year/fiscal-half/end, semester/half-year, compact calendar badge labels, configurable compact and semantic date/time ranges, weekday/same-year elision, weekend/week/month/quarter labels, relative same-day intervals, and business-time range labels, with bounded forms. |
| `Humanize.Durations` | `Format`, `Format_Components`, compact/clock durations, exact weeks, approximate 30-day months/365-day years, subsecond `Format_Precise`, natural and detailed duration wording including configurable almost/over/just-over/little-under/about-half phrases, Rails/Django/conversational presets, past/future distance wrappers, intervals, countdown/SLA, configurable workweek, holiday-aware business-date arithmetic, business-hour/calendar arithmetic with break windows, executable business-calendar rule sets, recurring holidays, half-days, shutdown ranges, per-weekday hours, TARGET2, UK England/Wales, Canada federal, Germany, France, NYSE, ASX, JPX/TSE, SIX, SGX, HKEX, NSE, B3, BMV, Australia national, Japan, Switzerland, and Singapore business-calendar presets, business-time labels, lifecycle/freshness, accessible progress, progress/retry, throughput, ETA, recurrence phrases, and shipped-locale common cron/schedule labels, with bounded forms and option records. |
| `Humanize.Bytes` | `Format`, binary/decimal/auto byte option presets, render metadata for selected byte unit/scaling, file-size summaries, transfer-remaining labels, and disk-usage labels, with bounded forms. |
| `Humanize.Colors` | Deterministic CSS color parsing for full named colors, `transparent`, `currentColor`, alpha hex, `rgb()/rgba()`, `hsl()/hsla()`, `hwb()`, `lab()`, `lch()`, `oklab()`, `oklch()`, and `color()` profiles (`srgb`, `srgb-linear`, `display-p3`, `rec2020`, `xyz`, `xyz-d65`, `xyz-d50`), including `none` channels and simple `calc()` numeric expressions; normalized RGB/RGBA/HSL/HSV labels, CIE Lab/OKLab conversion, hue family, saturation, temperature, chroma, combined color-description labels, nearest basic color names, descriptive color names, palette roles, harmony, contrast suggestions, accessibility labels, palette contrast matrices, palette contrast metadata records and labels, APCA-style polarity/strength labels, color-vision-deficiency risk labels, combined color accessibility summaries, contrast pass/fail metadata, mood labels, advanced palette summaries, opacity and brightness labels, WCAG-style contrast ratios, text-readability labels, RGB-distance and perceptual Delta-E style labels, with bounded forms. |
| `Humanize.Numbers` | `Cardinal`, signed and native-orthography locale cardinal words, locale decimal/fraction/ordinal word spellout, currency/percent word spellout, AP/editorial number wording for general text, headlines, ages, measurements, percentages, and ordinals, deterministic currency phrases, spellout coverage metadata, accessible number wording, `Fractional`, `Bounded_Number`, integer and decimal ranges, inclusive/exclusive range phrases, tolerance ranges, uncertainty labels, threshold labels, range-position labels, proportions, noun ratios, relative change/delta phrases, `Ordinal`, `Compact`, `Percent`, scientific notation, Roman numerals, SI-prefix formatting, and approximation phrases, with bounded forms. |
| `Humanize.Units` | Unit quantities, abbreviation style, and automatic length, mass, volume, speed, area, pressure, energy, power, temperature, frequency, angle, ratio, electric, concentration, fuel-efficiency, cooking-temperature, latency, bandwidth, database-throughput, display, print, signal, and storage-endurance selection. |
| `Humanize.Lists` | Human-readable conjunction/disjunction lists, Oxford-comma option, limited lists, counted noun phrases with zero/article/word/compact policies, validation/error summaries, field problem summaries, result/page summaries, compact "more"/"others" summaries, pagination ranges, selection and filtered-count summaries, collection count/empty/visible/hidden summaries, validated page position/range/navigation/page-size labels, and compact/summary/screen-reader collection display policies. |
| `Humanize.Frequencies` | Occurrence phrasing: `never`, `once`, `twice`, `n times`, plus custom nouns. |
| `Humanize.Rates` | Pace/rate phrasing such as `approximately 4 heartbeats per week` and `less than once per week`. |
| `Humanize.Strings` | Truncation, UTF-8-safe truncation/slicing/counting/display-width estimates, grapheme-cluster-safe counting/display-width estimates/truncation/slicing and display-width wrapping, ANSI-aware display-width measurement/truncation/wrapping plus styled wrapping that preserves active SGR spans across line breaks, fixed-width terminal table rows and two-/three-column tables, Unicode-aware reading/speaking time, word/sentence/paragraph summaries, structured text metrics, configurable combined text summaries with field order, separators, label styles, and zero omission, text-change labels with case-only and punctuation-only metadata, structured and privacy-safe address labels, inferred generic data-shape labels, ASCII casefolding, capitalization/title-case with configurable policy or caller-supplied word lists, identifier transforms including demodulize/tableize/classify/foreign-key helpers, expanded English inflection with irregulars, uncountables, classical/common suffix rules, caller-supplied dictionaries, dictionary-vs-built-in precedence options, case policy, source metadata, and deterministic plural/singular rule sets for Danish, German, French, Spanish, Italian, Portuguese, Dutch, Swedish, Norwegian, Norwegian Bokmal, Finnish, and Turkish, whitespace/tag cleanup, configurable excerpt/context-excerpt/highlight policies, HTML-safe highlighted excerpts, mask/initials/possessive helpers, person/name display helpers, compact people lists, opaque-token normalization/grouping/masking, safe filename generation with case, separator, extension, hidden-file, reserved-name, and stem-length policy, basename/title/extension labels, path shortening with optional extension preservation, Unix symbolic/octal file mode labels, permission summaries, and mode parsing, search keys, natural sort keys, best-effort Latin-1, Latin Extended, Hebrew, Arabic, Armenian, and Georgian ASCII transliteration, HTML escaping, separator cleanup, and newline/HTML break conversion, with bounded forms. |
| `Humanize.Values` | Deterministic boolean and tri-state labels for UI, config, status, permission, health, visibility, and completion surfaces, with stable style labels and bounded forms. |
| `Humanize.Endpoints` | Deterministic URL, host, endpoint, IP address, and CIDR labels for CLIs, logs, dashboards, and diagnostics, including redacted userinfo, query-parameter summaries, default-port elision, and host category metadata. |
| `Humanize.Resources` | Deterministic utilization, remaining capacity, quota, availability, cache hit-rate, and saturation labels for dashboards, CLIs, telemetry, and operational summaries, with threshold bands and bounded forms. |
| `Humanize.Versions` | Deterministic SemVer-like version labels, version-delta labels, release labels, compatibility range summaries, and commit-distance labels for CLIs, package displays, changelogs, and dashboards. |
| `Humanize.Geo` | Deterministic latitude/longitude, coordinate-pair, compass direction, bearing, distance-with-bearing, bounding-box, and inside/outside labels for maps, weather, logistics, asset tracking, and location-aware dashboards. |
| `Humanize.Markup` | Deterministic tag, attribute, MIME/content-type, heading, landmark, tag-count, attribute-count, and document-outline labels for documentation tools, crawlers, accessibility reports, CMS previews, and markup diagnostics. |
| `Humanize.Secrets` | Deterministic secret, token, credential, environment-secret, header-credential, fingerprint, count, exposure-policy, credential-source, rotation-status, and safe masking labels for CLIs, dashboards, audit logs, and admin screens. |
| `Humanize.Schema` | Deterministic schema field, type, required/optional, nullable, deprecated/unknown, array/object/data-shape, constraint, enum-option, default/example-value, source/version, missing-required, type-mismatch, and schema-summary labels for API docs, config UIs, inspectors, and data tooling. |
| `Humanize.Diagnostics` | Deterministic severity, check-status, diagnostic-source, issue-count, issue-summary, check-run, location, failed-at, first-failure, check-result, duration, retry, suggested-action, affected-item, field-problem, result-with-notices, diagnostic-message, and source-summary labels for build tools, linters, test runners, import jobs, and form processors. |
| `Humanize.Thresholds` | Deterministic metric value, range/window, in-range/out-of-range, warning/critical threshold, breach, target-delta, near-limit, target-window, tolerance, percent-of-limit, remaining-to-limit, budget-used, and threshold-summary labels for observability, budgets, quotas, sensors, and dashboards. |
| `Humanize.Workflows` | Deterministic workflow state, step, step-state, milestone, milestone-state, progress, summary, approval, blocker, next-action, queue-position, waiting, owner, handoff, dependency, attempt, result, and resume labels for installers, onboarding flows, CI pipelines, imports, and task trackers. |
| `Humanize.Changes` | Deterministic change-kind, change-severity, change-set, change-summary, item-change, rename, move, field-change, metadata-only, conflict, sync-change, net-change, patch-size, and review-progress labels for diff viewers, release notes, audit logs, review UIs, sync tools, and config-change summaries. |
| `Humanize.Tables` | Deterministic row-count, column-count, table-size, selection, sort, column-role, cell-position, cell-state, page, filter, row-range, group, and subtotal labels for reports, data grids, admin tables, exports, and review screens. |
| `Humanize.Forms` | Deterministic form-state, input-state, field, field-state, character-count, character-limit, required-field, form-progress, unsaved-change, submission, section-progress, form-step, and form-issue labels for forms, settings screens, wizards, and data-entry flows. |
| `Humanize.Navigation` | Deterministic navigation-state, navigation-kind, item, current-page, breadcrumb, tab, menu, submenu, external-link, skip-link, back, next, first, last, and section-state labels for menus, settings pages, documentation, dashboards, and accessibility surfaces. |
| `Humanize.Badges` | Deterministic badge-tone, badge-state, badge-priority, badge, count-badge, status-badge, tag, tag-count, chip, dismiss, new, updated, deprecated, overflow, and priority-badge labels for compact UI indicators, filters, labels, chips, and status badges. |
| `Humanize.Notifications` | Deterministic notification-channel, notification-state, delivery-state, event, new-event, event-count, count, unread, inbox, notification, delivery, delivery-time, actor-event, muted, snoozed, digest, suppressed, delivery-attempt, group, and mark-read/unread labels for notification centers, inboxes, activity feeds, alerting UIs, and messaging dashboards. |
| `Humanize.Search` | Deterministic search-state, filter-state, sort-mode, query, result-count, result-summary, no-results, active-filter-count, filter, facet, facet-value, sort, clear-filter, scope, suggestion, recent-search, saved-search, and search-history labels for search pages, filtered lists, faceted browsers, command palettes, documentation search, and admin dashboards. |
| `Humanize.Comments` | Deterministic comment-state, thread-state, reaction-kind, comment-count, reply-count, thread-count, comment, thread, author-action, edited, deleted, resolved, reaction, participant-count, mention, subscribe, unsubscribe, pin, unpin, lock-thread, and hide-comment labels for comments, review threads, discussion panels, collaboration feeds, and moderation UIs. |
| `Humanize.Tasks` | Deterministic task-state, priority, assignment-state, task-count, open/completed counts, task, assignment, due, overdue, checklist, blocker, subtask, complete, reopen, estimate, recurring-task, backlog, and sprint labels for todo lists, issue trackers, project boards, checklists, and personal task managers. |
| `Humanize.Attachments` | Deterministic attachment-state, attachment-kind, scan-state, count, attachment, upload-progress, size, preview, download, remove, scan-result, upload-error, group, image-dimensions, and expiring-link labels for upload forms, message attachments, content libraries, review tools, and moderation screens. |
| `Humanize.Events` | Deterministic event-state, attendance-state, visibility, event-count, event, event-time, event-location, attendee-count, capacity, RSVP, reminder, canceled, rescheduled, waitlist, organizer, conference-link, check-in, and all-day labels for calendars, invitations, booking forms, schedules, and meeting dashboards. |
| `Humanize.Payments` | Deterministic payment-state, invoice-state, payment-method, payment-count, invoice-count, amount, payment, invoice, due, paid, refund, method, receipt, balance, tax, subtotal, total, discount, chargeback, and payment-link labels for billing screens, checkout flows, invoices, receipts, and finance dashboards. |
| `Humanize.System_Status` | Deterministic HTTP status, errno, process-exit, signal, SQLSTATE class, service availability, health, readiness, component, check, incident, uptime, latency, maintenance-window, and last-checked labels for logs, CLIs, dashboards, status pages, and diagnostics, with class metadata and bounded forms. |
| `Humanize.Operations` | Deterministic operation-state, progress, unknown-total, last-success, next-retry, stale-run, failed/skipped/retried/canceled count labels, detailed/compact/accessibility/log output options, and progress parsers for queues, jobs, runs, sync/import/export screens, CLIs, and dashboards. |
| `Humanize.Comparisons` | Deterministic comparison-result, difference, tolerance, baseline, multi-value summaries, detailed/compact/log output options, and multi-value parsers for dashboards, benchmark reports, audits, storage reports, and release notes. |
| `Humanize.Moderation` | Deterministic review-state, moderation-action, report-state, review, moderation, report, queue, and appeal labels for CMS, marketplace, comments, and admin moderation UIs. |
| `Humanize.Accounts` | Deterministic account-state, session-state, MFA, device-trust, account, session, last-active, and login-attempt labels with account/session metadata, output options, bounded option APIs, and label parse/scan helpers for identity, admin, audit, and settings screens. |
| `Humanize.Deployments` | Deterministic deployment-state, environment-state, migration-state, artifact-state, deployment, rollout, promotion, and rollback labels with deployment metadata, output options, bounded option APIs, and deployment-label parse/scan helpers for release and CI/CD dashboards. |
| `Humanize.Data_Quality` | Deterministic data issue, import-check, issue-count, row-issue, source-file issue, and import-result labels for CSV importers, ETL tools, and bulk editors. |
| `Humanize.Media` | Deterministic media-kind, media-state, resolution, duration, page-count, and media-summary labels with media metadata, output options, bounded option APIs, and summary parse/scan helpers for asset libraries, upload previews, CMS tools, and document workflows. |
| `Humanize.Notification_Preferences` | Deterministic preference-state, digest schedule, alert-level, subscription-scope, channel preference, quiet-hours, and subscription labels for notification settings and alerting UIs. |
| `Humanize.Permissions` | Deterministic role, permission-state, policy-result, permission, access-expiry, grant, and revoke labels with permission metadata, output options, bounded option APIs, and permission-label parse/scan helpers for admin screens, access reviews, and audit logs. |
| `Humanize.Builds` | Deterministic test-state, build-state, artifact-state, gate-state, test-count, coverage, benchmark, and build labels with test/build/gate metadata, output options, bounded option APIs, and build-label parse/scan helpers for CI, test dashboards, package pipelines, and release gates. |
| `Humanize.Domain_Details` | Shared output modes, severity/tone metadata, state metadata inference, structured render results, accessible label normalization, named cross-domain summaries, full domain-surface labels, metadata/body parsing, and common named-label parse/scan helpers for the typed domain packages. |
| `Humanize.Cross_Domain` | Shared deterministic helpers for labels that span product codes, machine identifiers, contacts, states, terminal render profiles, metadata coverage, diff-tree metadata, and family capability summaries, including checksum validation for Luhn, IBAN, ISIN, and VIN identifiers. |
| `Humanize.Parsing` | Parse or scan Humanize-style byte sizes, file/transfer/disk byte summaries, strict and lenient durations including natural approximation phrases, fortnight idioms, and ISO 8601 duration forms, natural dates and date ranges including ISO calendar, ordinal, and week dates, repeated weekdays, clock time suffixes such as `tomorrow at 5pm` and `tomorrow around noon`, ordinal month/day and weekday date phrases, early/mid/late period ranges, fiscal-year/fiscal-half/end, semester/half-year labels, boundaries including business-month starts/ends, rule-aware business days and business weekdays, business days before period boundaries, week numbers, and quarter labels, business-calendar phrases and executable rule sets, ranges, countdown/SLA/age/freshness/ETA/retry phrases, counted nouns, progress/result/page summaries, validation/field/selection/pagination/collection summaries, phrase metadata, operational/database phrase summaries, field-change and field-state summaries, and sync/import/export summaries, boolean and tri-state value labels, string/text summary/token/path/name/initials/possessive/email/filename/file-mode/search-key/sort-key/identifier/cleanup/conversion/excerpt/highlight labels, step/attempt counts, business/working counts, detailed recurrence metadata including weekday sets, time suffixes, time windows, weekday exclusions, and five-, six-, and seven-field cron schedules with steps, named weekday lists/ranges, named months, seconds, years, nearest weekdays, last days, last weekdays, and nth weekdays, scanning, throughput, progress bars, precise durations, compact/scientific numbers, Roman numerals, bounded numbers, number ranges, worded decimal ranges, uncertainty labels, worded uncertainty labels, proportions, frequencies, rates, lists, percentages, ordinals, cardinal words, deterministic currency/approximation/change phrases, domain/queue/cache summaries, number/percent/file-size/date comparisons, color model/summary/palette/accessibility/palette-metadata/alpha-contrast/remediation/difference labels, units, compound units, database throughput, data/bit/binary-data rates, memory bandwidth, latency, IOPS, density, acceleration, torque, fuel economy, flow rate, electric/pixel/display/print/audio/signal/storage units, aspect ratios, and CSS lengths, with consumed/error-position metadata, diagnostic categories, and diagnostic messages. |
| `Humanize.Styles` | Style presets and focused override helpers for compact UI, verbose, technical, casual, screen-reader, CLI, log, dashboard, accessibility, telemetry, and mobile output policies, including focused calendar-date presets for compact badges, fiscal periods, academic/semester output, and early/mid/late period labels. |
| `Humanize.Phrases` | Deterministic Humanize UI status phrases such as loading, saved, failed, overdue, last seen, updated just now, auth, billing, workflow, queue, file, validation, empty-state, network, security, deployment, health, notification, form, access, sync, import/export, search/filter, collaboration, issue/PR, task, CI/CD, support-ticket, payment lifecycle, backup, incident, release, audit, feature-flag, webhook, API-key, quota, invoice/refund, and database/storage phrases, plus generic queue/job/run/cache/sync/import/export summaries and file/date/number comparison summaries, with stable severity, tone, key, phrase-pack, and phrase-locale metadata. |

Every formatter offers a convenience form returning `Humanize.Status.Text_Result`
and a bounded form (`*_Into`) writing into a caller-owned 1-based `String`.

Shipped reviewed native or native-orthography locales: English (`en`), Danish
(`da`), German (`de`), French (`fr`), Spanish (`es`), Italian (`it`),
Portuguese (`pt`), Dutch (`nl`), Swedish (`sv`), Norwegian (`no`), Norwegian
Bokmal (`nb`), Finnish (`fi`), Polish (`pl`), Czech (`cs`), and Turkish
(`tr`), Romanian (`ro`), Lithuanian (`lt`), Slovenian (`sl`), Indonesian
(`id`), Malay (`ms`), Esperanto (`eo`), Vietnamese (`vi`), Swahili (`sw`),
Afrikaans (`af`), Hungarian (`hu`), and Slovak (`sk`). Complete reviewed
native-script catalog fragments are additionally available for Russian (`ru`),
Ukrainian (`uk`), Japanese (`ja`), Korean (`ko`), Chinese (`zh`), Arabic
(`ar`), and Hindi (`hi`).
Region-tagged contexts such as `sv-SE`, `nb-NO`, `ja-JP`, and `ar-EG` resolve
through `i18n` locale fallback to those base catalog fragments.
`Humanize.Locales` provides the neutral locale-code array types and shipped
locale support lists without coupling deterministic metadata packages to catalog
loading. `Shipped_Locales` returns the base locale tags,
`Regional_Shipped_Locales` returns the region-tagged fallback aliases, and
`All_Shipped_Locales` returns both sets in deterministic order.
`Is_Base_Shipped_Locale`, `Is_Regional_Shipped_Locale`, and
`Is_Shipped_Locale` provide case-normalizing membership checks for callers that
need to gate coverage without walking those arrays themselves.
`Canonical_Shipped_Locale` returns the exact shipped tag for accepted base and
regional inputs, such as `en` or `sv-SE`, and returns an empty string for
unshipped tags. `Base_Locale` and `Language_Code` return the normalized
lowercase base language subtag before either `-` or `_`; `Region_Code` returns
the normalized regional subtag when one is present. `Locale_Prefix` preserves
its historical two-character prefix behavior while lowercasing the result.
Language-family predicates such as `Is_Norwegian` and `Is_CJK` use the same
normalized language subtag, so regional and case-varied tags are accepted
consistently.
`Humanize.Catalogs` re-exports those lists for compatibility with catalog
callers.
`Humanize.Catalogs.Load_Defaults` defaults to `Reject_Duplicates`; a duplicate
load is non-destructive, and callers may explicitly pass `Keep_First` or
`Override_Previous` through to the underlying `i18n` loader.
Numeric values and counts are rendered by `i18n` using each locale's number
data; fractional quantities agree in number via CLDR fractional plural operands.
Ordinal and plural correctness is delegated to `i18n`'s rules. Locale spellout
helpers use native UTF-8 orthography for deterministic cardinal, decimal,
fraction, ordinal, and caller-unit currency words in shipped spellout locales, including
language-specific compound grammar for deterministic cardinal forms. The native
spellout tier covers English, Danish, German, French, Spanish, Italian,
Portuguese, and Dutch; the generated-locale deterministic tier additionally
covers Swedish, Norwegian, Norwegian Bokmal, Finnish, Turkish, Polish, Czech,
Russian, Ukrainian, Japanese, Korean, Chinese, Arabic, Hindi, Romanian,
Lithuanian, Slovenian, Indonesian, Malay, Esperanto, Vietnamese, Swahili,
Afrikaans, Hungarian, and Slovak cardinal, decimal, common-fraction, and
direct ordinal words. Grouped cardinal words cover values through quadrillions
before falling back to English only for unrecognized locales or values outside
the deterministic range.

`Humanize.Units` covers metric length, mass, volume, temperature, area, speed,
pressure, energy, power, frequency, angles, and selected US customary units.
It also provides automatic selectors for lengths in meters, masses in grams,
volumes in liters, speeds in meters per second, areas in square meters,
pressures in pascals, energies in joules, powers in watts, temperatures in
Celsius, frequencies in hertz, angles in degrees, plus selected deterministic
compound selectors such as byte/bit data rates, density, acceleration, torque,
fuel economy, flow rate, electric current, voltage, electric resistance,
resolution, pixel density, CSS lengths, aspect ratios, electric capacitance,
electric inductance, concentration, miles-per-gallon fuel efficiency, cooking
temperatures, memory bandwidth, latency, CPU load, battery level, screen size,
typography size, IOPS, audio levels, signal strength, storage endurance,
refresh rates, luminance, print resolution, and geographic distances.
Added unit domains have native or domain-appropriate built-in labels across all
shipped locales.

## Additional examples

Parser results carry stable diagnostic categories in addition to status and
error-position metadata:

```ada
declare
   Result : constant Humanize.Parsing.Byte_Parse_Result :=
     Humanize.Parsing.Parse_Bytes ("42 widgets");
   Kind   : constant Humanize.Parsing.Parse_Error_Kind :=
     Humanize.Parsing.Diagnostic
       (Result.Status, Result.Error_Position, Result.Error);
begin
   --  "expected a unit at position 4"
   Put_Line
     (Ada.Strings.Unbounded.To_String
        (Humanize.Parsing.Diagnostic_Message
           (Kind, Result.Error_Position).Text));
end;
```

Bounded forms write into caller-owned 1-based buffers and report truncation
through `Humanize.Status.Status_Code`:

```ada
declare
   Buffer  : String (1 .. 16);
   Written : Natural;
   Status  : Humanize.Status.Status_Code;
begin
   Humanize.Numbers.Compact_Into (Context, 1_200_000, Buffer, Written, Status);
   --  Buffer (1 .. Written) = "1.2M" when Status = Ok.
end;
```

Capability metadata exposes stable area labels, whether an area renders via
locale catalogs or deterministic Humanize text, and the more detailed locale
behavior of mixed/deterministic areas:

```ada
Humanize.Capabilities.Area_Label (Humanize.Capabilities.Parsing_Area);
Humanize.Capabilities.Rendering_Source_Label
  (Humanize.Capabilities.Area_Rendering_Source
     (Humanize.Capabilities.Parsing_Area));
Humanize.Capabilities.Locale_Behavior_Label
  (Humanize.Capabilities.Area_Locale_Behavior
     (Humanize.Capabilities.Number_Area));
Humanize.Numbers.Spellout_Locale_Tier_Label
  (Humanize.Numbers.Spellout_Locale_Tier_For (Context));
```

Color and practical-unit helpers are deterministic and are also available as
bounded forms:

```ada
Humanize.Colors.Palette_Accessibility_Label
  (Humanize.Colors.Color_List'
     ([1 => (Red => 0, Green => 0, Blue => 0),
       2 => (Red => 255, Green => 255, Blue => 255)]));
Humanize.Colors.APCA_Contrast_Label
  ((Red => 0, Green => 0, Blue => 0),
   (Red => 255, Green => 255, Blue => 255));
Humanize.Units.Format_Memory_Bandwidth (Context, 12_500_000_000.0);
Humanize.Units.Format_Geographic_Distance (Context, 12_345.0);
```

## Non-goals

By design (these belong in other libraries or a later major version):

* a time zone database — civil components are interpreted in the local zone via `Ada.Calendar`;
* importing arbitrary CLDR data at runtime — catalog fragments are built in for the shipped locales;
* full CLDR currency engines; Humanize only provides deterministic currency
  phrases around caller-supplied codes or symbols;
* runtime rule plugins or application-defined domain classifiers.

Rule selection, catalog construction, and the i18n boundary
(`Humanize.I18N_Rendering`) are private. The architectural boundary and the
v0.1 contract are specified in [`docs/specification.md`](docs/specification.md).

## Build and test

Use Alire GNAT 15 only. The development, release, build-overlay, tests, and
tooling manifests pin `gnat_native = "=15.2.1"`. Confirm with:

```sh
alr exec -- gnatls --version
```

Do not run plain system `gnat*`, `gnatmake`, `gnatls`, `gnatprove`, or
`gprbuild` in this workspace. Use `alr exec -- ...` for compiler and builder
commands so PATH cannot select a different GNAT installation.

```sh
alr build
cd tests && alr build && ./bin/tests
```

The AUnit suite includes a compatibility corpus that pins common Humanize
expectations across dates, durations, bytes, numbers, units, lists, strings,
phrases, summaries, comparisons, colors, parsing, and invalid edge cases.

## Release verification

Maintainers run the `project_tools`-based release guard and the commands in
[`docs/RELEASE_VERIFICATION.md`](docs/RELEASE_VERIFICATION.md):

```sh
cd check_humanize && alr build && ./bin/check_humanize
```

## License

Dual-licensed under `MIT OR Apache-2.0 WITH LLVM-exception`. See [`LICENSE`](LICENSE).
