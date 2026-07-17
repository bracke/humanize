# Humanize Internal Structure

This document records the intended private structure for large implementation
bodies. The public package specifications remain the compatibility boundary;
private child packages may be introduced to keep implementation units focused.

## Source Hygiene

Build artifacts are not source. Root-level GNAT artifacts such as `.ali` and
`.o` files, plus ad hoc local debug/check executables, are ignored and rejected
by `check_humanize --policy-only`.

## Large Body Boundaries

### `Humanize.Parsing`

`Humanize.Parsing` is split by parser concern. The public parent remains the
compatibility facade, existing helper/data children keep the support code they
already owned, parser-family children expose focused internal surfaces, and
`Humanize.Parsing.Implementation` preserves the shared implementation backend
used by the parser-family packages. `Humanize.Parsing.Implementation` is also
kept as a compatibility facade over `Humanize.Parsing.Implementation.Support`
so callers and parser-family packages do not depend on the largest backend
body directly. Very large, tightly-coupled parser cores in that backend may be
compiled as Ada subunits; this keeps the implementation navigable without
changing the private helper scope that the parser family relies on.

Public and private children:

* `Humanize.Parsing.Results`: public subtype facade for parse result records
  and related enums. It preserves the root package as the canonical type owner
  while giving callers a focused import surface for result handling.

* `Humanize.Parsing.Support`: ASCII/UTF-8 helper functions, substring helpers,
  trim/lower/upper helpers, numeric token scanning, and shared result builders.
* `Humanize.Parsing.Diagnostics`: diagnostic construction, diagnostic labels,
  and bounded diagnostic rendering.
* `Humanize.Parsing.Normalization`: native-digit normalization and number,
  unit, and list text normalization.
* `Humanize.Parsing.Bytes`: byte-size parsing and scanning.
* `Humanize.Parsing.Durations`: ISO, lenient, precise, range, countdown, SLA,
  age, freshness, retry, progress, recurrence, cron, and throughput duration
  parsers.
* `Humanize.Parsing.Date_Times`: ISO dates, natural dates, natural date ranges,
  time-of-day, natural date-time, business-calendar parsing, and scheduling
  phrase classification.
* `Humanize.Parsing.Numbers`: compact, cardinal, scientific, currency,
  approximate, editorial, range, proportion, percent, ordinal, Roman, and
  comparison parsers.
* `Humanize.Parsing.Colors`: color parser round trips, palette metadata,
  contrast, accessibility, and perceptual-difference parsers.
* `Humanize.Parsing.Strings`: text, path, identifier, person/name, HTML,
  excerpt, highlight, transliteration, cleanup, and token parsers.
* `Humanize.Parsing.Units`: rate, frequency, list, unit, CSS length, compound
  unit, engineering unit, and display/print/signal parsers.
* `Humanize.Parsing.Domain_Labels`: operational, phrase, change, resource,
  validation, selection, table, and other cross-domain label parsers.
* `Humanize.Parsing.Success_Labels`: parse-success explanation labels and
  scan-success extraction.
* `Humanize.Parsing.Implementation`: compatibility facade for older internal
  callers. It delegates parser-domain APIs to focused implementation children
  plus the focused byte, diagnostic, normalization, and success-label parser
  modules.
* `Humanize.Parsing.Implementation.Date_Times`: focused implementation API for
  natural dates, natural date-times, date ranges, business-calendar parsing,
  date comparisons, and scheduling phrase classification.
* `Humanize.Parsing.Implementation.Durations`: focused implementation API for
  duration, recurrence, cron, progress, countdown, retry, SLA, business-day,
  working-hour, throughput, and precise-duration parsers.
* `Humanize.Parsing.Implementation.Numbers`: focused implementation API for
  compact/cardinal/scientific numbers, currency, approximate values, changes,
  comparisons, ranges, uncertainty, proportions, percents, ordinals, and Roman
  numerals.
* `Humanize.Parsing.Implementation.Colors`: focused implementation API for
  color labels, CSS color labels, palette summaries, contrast/accessibility
  labels, and perceptual-difference parsers.
* `Humanize.Parsing.Implementation.Strings`: focused implementation API for
  text counts, reading/speaking time, masks, paths, names, identifiers, HTML
  transforms, inflections, excerpts, and highlights.
* `Humanize.Parsing.Implementation.Units`: focused implementation API for
  rates, frequencies, lists, units, CSS lengths, compound units, engineering
  units, and display/print/signal parsers.
* `Humanize.Parsing.Implementation.Domain_Labels`: focused implementation API
  for operational labels, phrase metadata, domain summaries, queue/cache/file
  summaries, validation, selection, pagination, and boolean/ternary labels.
* `Humanize.Parsing.Implementation.Support`: compatibility backend facade for
  focused parser implementation children. Parser-domain APIs delegate to
  focused helper packages while legacy internal callers keep the same import
  path.
* `Humanize.Parsing.Implementation.Date_Time_Text_Helpers`: natural date,
  natural date-time, natural date range, ISO week date, business-calendar, and
  date-comparison parser helpers used by date/time parser surfaces.
* `Humanize.Parsing.Implementation.Number_Text_Helpers`: compact/cardinal and
  scientific number parsers, number and decimal ranges, worded decimals,
  fractions, percents, uncertainty labels, currency, approximate values,
  changes, and numeric/file-size/percent comparison parser helpers.
* `Humanize.Parsing.Implementation.String_Text_Helpers`: text-count,
  text-time, text-summary, path/name, filename, identifier, cleanup, person
  list, excerpt, highlight, and inflection-source parser helpers.
* `Humanize.Parsing.Implementation.Calendar_Helpers`: shared calendar
  arithmetic, weekday, month, week, quarter, and business-day helpers used by
  the implementation backend.
* `Humanize.Parsing.Implementation.Date_Text_Helpers`: date-token parsing,
  ISO date token helpers, localized weekday tokens, date-unit and recurrence
  vocabulary, week/month period range utilities, repeated-weekday arithmetic,
  open-hour helpers, and ordinal text helpers used by natural date,
  recurrence, and business-calendar parsing.
* `Humanize.Parsing.Implementation.Duration_Text_Helpers`: duration, lenient
  duration, duration-range, countdown, SLA, age, modified-ago, ETA, retry-in,
  precise-duration, and ISO duration parser helpers, plus localized duration
  unit vocabulary for seconds and microseconds shared by date-unit,
  rate-period, and schedule parsers.
* `Humanize.Parsing.Implementation.Domain_Label_Text_Helpers`: operational
  phrase, phrase-key/locale, field-change/state, domain summary, queue/cache,
  file-size/transfer/disk, validation/problem, selection, pagination,
  collection display, and boolean/ternary label parser helpers used by the
  domain-label parser surface.
* `Humanize.Parsing.Implementation.Numeric_Text_Helpers`: numeric token
  parsing helpers, fixed-buffer storage, worded digits/fractions, Roman helper
  predicates, validation count detail parsing, and simple natural field parsing
  shared by parser subunits.
* `Humanize.Parsing.Implementation.Color_Text_Helpers`: RGB/RGBA/CSS color
  labels, HSL/HSV model labels, color summaries and descriptions, color
  accessibility/CVD labels, palette metadata/accessibility/contrast labels,
  perceptual-difference labels, and shared color numeric-field/component
  parsing used by color parser surfaces.
* `Humanize.Parsing.Implementation.Text_Helpers`: shared text-shape helpers
  for labels, token starts, ASCII checks, spaced word counts, text count
  summaries, simple mask/grouped-token parsing, initials, possessive labels,
  and word counting used by parser implementation subunits.
* `Humanize.Parsing.Implementation.Phrase_Text_Helpers`: phrase severity,
  tone, domain, state, word-membership, and phrase-pack summary helpers used by
  domain and phrase parser surfaces.
* `Humanize.Parsing.Implementation.Count_Text_Helpers`: progress/count
  summaries, counted nouns, result/page/showing counts, step/attempt counts,
  and progress-bar parser helpers shared by duration-facing parser surfaces.
* `Humanize.Parsing.Implementation.Scalar_Text_Helpers`: bounded-number,
  frequency, rate, list, percent, ordinal, Roman numeral, and aspect-ratio
  parser helpers used by scalar parser surfaces.
* `Humanize.Parsing.Implementation.Compound_Unit_Text_Helpers`: CSS length,
  compound-unit, filtered engineering-unit, throughput, data-rate, electrical,
  display, audio, signal, and print-resolution parser helpers.
* `Humanize.Parsing.Implementation.Scheduling_Text_Helpers`: recurrence,
  recurrence-detail, cron schedule, business-day/working-hour counts,
  throughput remaining, and scheduling phrase classification parser helpers
  used by scheduling parser surfaces.
* `Humanize.Parsing.Implementation.Unit_Text_Helpers`: unit parse/scan,
  rendered localized unit alias resolution, and compound-unit vocabulary shared
  by unit and rate parsers.

### `Humanize.Strings`

`Humanize.Strings` is split by text-processing concern. The public parent
remains the compatibility facade, concern children expose focused internal
surfaces, and `Humanize.Strings.Support` owns shared core text, title-casing,
editing, privacy, prose, metadata, terminal text, and bounded text helpers used
by the remaining compatibility surfaces. `Humanize.Strings.Support` is itself
a compatibility facade over `Humanize.Strings.Support.Backend`. The backend
uses Ada subunits for long text-composition helpers whose logic still depends
on the shared local helper set.

* `Humanize.Strings.Display`: UTF-8, grapheme, display-width, ANSI, wrapping,
  slicing, and fixed-width table helpers.
* `Humanize.Strings.Metrics`: word, sentence, paragraph, reading, speaking,
  text-summary, and text-change helpers.
* `Humanize.Strings.Names`: person/name, initials, possessive, people-list,
  and privacy-safe address helpers.
* `Humanize.Strings.Paths`: safe filename, path, basename/title/extension,
  file-mode, and permission helpers.
* `Humanize.Strings.Inflections`: pluralization, singularization, dictionary
  policy, irregulars, uncountables, and locale rule sets.
* `Humanize.Strings.Identifiers`: casefolding, identifier transforms, search
  keys, natural sort keys, and transliteration.
* `Humanize.Strings.Markup`: HTML escaping, tag stripping, newline/break
  conversion, excerpt, highlight, and separator cleanup.
* `Humanize.Strings.Core`: truncation, capitalization, title-casing, editorial
  titles, and generic bounded-copy support.
* `Humanize.Strings.Editing`: excerpts, highlights, masks, normalized tokens,
  grouped tokens, and masked tokens.
* `Humanize.Strings.Privacy`: privacy-safe email, phone, handle, source
  location, code symbol, and address labels.
* `Humanize.Strings.Prose`: prose lists, sentence construction, generic ranges,
  and uncertainty labels.
* `Humanize.Strings.Metadata`: text-change metadata, data-shape labels,
  coverage/audit labels, transliteration coverage, text-boundary summaries, and
  text metadata labels.
* `Humanize.Strings.Terminal`: terminal paragraphs, sections, bullet lists,
  key/value blocks, and status blocks.
* `Humanize.Strings.Types`: public subtype/default facade for shared string
  option records, enums, metadata records, and default option constants. It
  keeps `Humanize.Strings` as the canonical owner while giving child-package
  users a smaller type import surface.
* `Humanize.Strings.Support.Backend`: shared implementation behind the support
  compatibility facade. Long title, excerpt, terminal, metadata, address,
  prose, token, and UTF-8 decoding helpers may live as subunits.

### `Humanize.Phrases`

`Humanize.Phrases` is split by phrase concern. The public parent remains the
compatibility facade, concern children expose focused internal surfaces, and
`Humanize.Phrases.Support` owns shared locale, generated phrase-pack, summary,
comparison, status text, and bounded text helpers used by those concern
packages. `Humanize.Phrases.Support` is itself a compatibility facade over
`Humanize.Phrases.Support.Backend`. Large generated-token rendering helpers in
the backend are kept as subunits so phrase tables stay isolated from the
status/summary control flow.

Private children:

* `Humanize.Phrases.Severity`: severity and tone labels plus status-to-severity
  classification.
* `Humanize.Phrases.Locales`: supported/generated phrase locale inventories
  and phrase-pack summaries.
* `Humanize.Phrases.Summaries`: domain, queue, cache, sync/import/export, file
  size, date, number, and percent summaries.
* `Humanize.Phrases.Keys`: stable status phrase keys and key buffer adapters.
* `Humanize.Phrases.Statuses`: localized UI, file, validation, empty, network,
  auth, billing, workflow, queue, security, deployment, health, notification,
  form, access, sync, transfer, search, collaboration, issue, task, CI, ticket,
  payment, backup, incident, release, audit, feature-flag, webhook, API-key,
  quota, invoice, and database phrases.
* `Humanize.Phrases.Fields`: field change/diff/add/remove/unchanged summaries
  and buffer adapters.
* `Humanize.Phrases.Support.Backend`: shared implementation behind the support
  compatibility facade. Long locale-token renderers, phrase text tables,
  severity mappings, comparison helpers, and domain phrase renderers may live
  as subunits.

### `Humanize.Numbers`

`Humanize.Numbers` is split by number-formatting concern. The public parent
remains the compatibility facade, generated spellout data stays isolated from
the facade, and concern children own deterministic English formatting,
locale-like spellout tables, rendered-number parsing, editorial style, scales,
ranges, and statistics labels.

Private children:

* `Humanize.Numbers.Spellout_Data`: generated/native spellout words,
  ordinal fragments, scale words, and locale spellout predicates.
* `Humanize.Numbers.Spellout`: cardinal, ordinal, decimal, fraction, percent,
  and currency word spellout.
* `Humanize.Numbers.Rendered_Parse`: deterministic rendered cardinal and
  ordinal parsers.
* `Humanize.Numbers.Editorial`: AP/editorial number, ordinal, percent,
  measurement, and age wording.
* `Humanize.Numbers.Scales`: compact, scientific, SI prefix, Roman, percent,
  and approximation formatting.
* `Humanize.Numbers.Ranges`: ranges, tolerances, thresholds, proportions,
  ratios, and change labels.
* `Humanize.Numbers.Statistics`: distribution, percentile, outlier, and shape
  metadata labels.

### `Humanize.Durations`

`Humanize.Durations` is split along the main behavioral surfaces. The public
parent remains the compatibility facade, while child packages own business
calendar rules, duration formatting, generated schedule data, schedule labels,
and natural duration wording.

* `Humanize.Durations.Business_Calendars`: holiday rules, business hours,
  shipped calendar presets, and business-day/hour arithmetic.
* `Humanize.Durations.Formatting`: basic duration formatting, components,
  compact, clock, precise, range, countdown, SLA, interval, lifecycle,
  freshness, progress, retry, ETA, and throughput labels.
* `Humanize.Durations.Schedule_Data`: generated weekday and schedule unit
  names.
* `Humanize.Durations.Schedules`: recurrence, schedule, cron, monthly,
  weekly, and business-day schedule labels.
* `Humanize.Durations.Natural`: natural duration wording, distance-style
  thresholds, and detailed natural duration labels.

### `Humanize.Datetimes`

`Humanize.Datetimes` is split so the public parent remains the compatibility
facade while `Humanize.Datetimes.Support` owns relative datetime
classification/rendering, civil date helpers, date/time ranges, calendar
relative labels, calendar differences, calendar presets, business-time ranges,
and bounded adapters. Locale-specific relative-time fallback forms that are
too large for the orchestration body live in focused private children.

Private children:

* `Humanize.Datetimes.Support`: shared datetime implementation behind the
  public compatibility facade.
* `Humanize.Datetimes.Support.Relative_Locales`: locale-specific relative-time
  fallback forms for languages whose runtime catalog path needs grammatical
  case/plural handling.

### `Humanize.Units`

`Humanize.Units` is split so the public parent remains the compatibility
facade while `Humanize.Units.Support` owns unit abbreviations, measurement
system resolution, locale-sensitive unit names, automatic unit selection,
engineering/unit-domain formatting, and bounded adapters. Large locale-specific
unit inflection tables are kept as subunits of the support implementation.

Private children:

* `Humanize.Units.Support`: shared unit formatting implementation and bounded
  adapters behind the public compatibility facade. Slavic unit-name forms live
  in a subunit so the main formatter body stays focused on conversion and
  routing.

### `Humanize.Catalogs`

`Humanize.Catalogs` is split between catalog data and loader behavior. The
public parent remains the compatibility facade, generated and hand-authored
catalog fragments live in data children, and `Humanize.Catalogs.Loader` owns
runtime loading and shipped-locale inventories.

* `Humanize.Catalogs.Core_Data`: hand-authored built-in locale catalog
  fragments.
* `Humanize.Catalogs.Unit_Data`: generated added unit keys and non-Latin unit
  tails.
* `Humanize.Catalogs.Native_Data`: native added keys and regional/native
  generated catalog fragments.
* `Humanize.Catalogs.Encoding`: shared UTF-8 byte constants and hex-byte
  decoding helpers used by generated catalog fragments.
* `Humanize.Catalogs.Loader`: shipped-locale inventories and runtime loading.

### Broad Domain Facades

Large broad-domain packages use support children so the public parent remains a
compatibility facade while the implementation is isolated behind a private
backend package.

Private children:

* `Humanize.Domain_Details.Support`: shared domain surface, severity, tone,
  metadata, option, and bounded-label implementation. Large heuristic metadata
  classifiers are kept as subunits.
* `Humanize.Cross_Domain.Support`: cross-domain label implementation for
  time-zone, identifier, validation, selection, table, phrase, unit, number,
  duration, date, color, byte-size, string, parsing, change, and resource
  surfaces. Product-code and machine-checksum algorithms are kept as subunits.
* `Humanize.System_Status.Support`: HTTP, errno, process, signal, SQLSTATE,
  operational state, dashboard, and bounded-label implementation. Protocol and
  OS lookup tables are kept as subunits.

### `Humanize.Colors`

`Humanize.Colors` is split by color concern. The public parent remains the
compatibility facade, concern children expose focused internal surfaces, and
`Humanize.Colors.Support` owns shared parsing, color math, phrase, bounded
text, and compatibility implementation helpers used by those concern packages.
`Humanize.Colors.Support` is itself a compatibility facade over
`Humanize.Colors.Support.Backend`. Large CSS parser and perceptual color-math
cores may be compiled as backend subunits when they would otherwise dominate
the shared backend body.

* `Humanize.Colors.CSS`: CSS named colors, lexical parsing, CSS Color 4
  functions, `calc()` numeric support, and parse diagnostics.
* `Humanize.Colors.Models`: RGB/HSL/HWB/Lab/LCH/OKLab/OKLCH conversions and
  normalized model labels.
* `Humanize.Colors.Names`: hue family, nearest names, descriptive names,
  saturation, temperature, chroma, and combined descriptions.
* `Humanize.Colors.Contrast`: WCAG/APCA-style contrast, readability,
  remediation, alpha contrast, and contrast metadata labels.
* `Humanize.Colors.Palettes`: palette roles, harmony, suggestions, mood,
  accessibility, and advanced palette summaries.
* `Humanize.Colors.Support.Backend`: shared implementation behind the support
  compatibility facade. Long color phrase tables, CSS parsing, palette,
  accessibility, remediation, color-space conversion, and perceptual-difference
  helpers may live as subunits.

## Compatibility Boundaries

Large public package specifications remain the API boundary. They may be long
when a package intentionally exposes many stable helpers, but they should not
be split into public children unless a future API version explicitly changes
the surface. Long parent bodies are acceptable only when they are facade
rename lists; implementation logic belongs in private children or backend
support packages.

Public specifications should be organized by contiguous API families inside
the existing package rather than split mechanically. Internal structure work
must not force clients to change `with` clauses, child package names, or
overload resolution. When a public spec becomes broad, prefer moving
implementation to private children, facades, or subunits; a public child split
is an API-versioning decision, not a cleanup task.

Generated and native data bodies are allowed to be large when they contain
locale tables, spellout words, aliases, or catalog fragments. Their structural
boundary is the data package itself: keep lookup/loader behavior in the
corresponding implementation package, keep encoding helpers shared in explicit
encoding/support children, and avoid moving data into public facades merely to
reduce line counts.

## Extraction Order

1. Move pure data/table helpers first; this should not alter behavior.
2. Move parser/formatter families with narrow public dependencies.
3. Keep public specs stable unless a new public API is explicitly required.
4. After each private-child extraction, run `alr exec -- gprbuild -P
   humanize.gpr`, `tests/bin/tests`, and `check_humanize/bin/check_humanize
   --policy-only`.
5. After each major body split, run the full `check_humanize/bin/check_humanize`
   gate.
