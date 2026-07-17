# Humanize Examples

The examples project builds runnable programs that exercise Humanize through the
public API.

## `humanize_demo`

Source: `humanize_demo.adb`

Build from the repository root:

```sh
alr exec -- gprbuild -P examples/examples.gpr
```

Run:

```sh
./examples/bin/humanize_demo
```

## `parse_demo`

Source: `parse_demo.adb`

Minimal parser-only example for byte and duration text.

## `bounded_demo`

Source: `bounded_demo.adb`

Minimal bounded-output example for caller-owned byte buffers.

## `color_demo`

Source: `color_demo.adb`

Minimal color example for parsing CSS color text and rendering normalized labels.

## `domain_demo`

Source: `domain_demo.adb`

Minimal cross-domain example for deterministic progress and product-code labels.

## `system_status_demo`

Source: `system_status_demo.adb`

Focused operational-status example for HTTP, service-health, diagnostic, and
threshold labels.

## `ui_labels_demo`

Source: `ui_labels_demo.adb`

Focused UI-label example for forms, navigation, badges, notifications, search,
comments, tasks, and tables.

## `security_data_demo`

Source: `security_data_demo.adb`

Focused security/data example for secrets, permissions, attachments, media,
data-quality, schema, and markup labels.

## `workflow_ops_demo`

Source: `workflow_ops_demo.adb`

Focused workflow/operations example for progress, comparisons, workflows,
changes, builds, and deployments.

## `product_details_demo`

Source: `product_details_demo.adb`

Focused product/detail example for accounts, payments, events, endpoints, geo,
versions, resources, moderation, notification preferences, and domain details.

The expected output is recorded in `EXPECTED_OUTPUT.md`. The demo loads the
built-in catalog into an application-owned `I18N.Runtime.Instance`, creates
English, Danish, and Spanish contexts, and formats representative durations,
byte sizes, relative datetimes, date ranges, numbers, native and
generated-locale cardinal words, decimal/fraction/ordinal words, currency
words, ranges/proportions, scientific notation, percentages,
compact and clock durations, detailed duration wording, duration-backed
freshness/progress/business/natural-duration phrases, holiday-aware business
dates, business-calendar presets, business-hour labels, metric, compound,
display, signal, bandwidth,
battery, CPU-load, luminance, and geographic-distance units, color summaries,
palette harmony/accessibility labels, palette contrast matrices, APCA-style
contrast labels, contrast metadata, color-vision-deficiency risk labels, combined color
accessibility summaries, perceptual color-difference labels,
UI/auth/security/issue, CI/CD, ticket, payment, webhook, quota, invoice, audit,
and feature-flag phrases with severity metadata, operational/database phrase keys,
field-change summaries, typed operations/account/deployment/build labels,
accessible domain-detail labels, byte render
metadata, capability metadata and coverage summaries, machine checksums,
privacy-safe address and inferred data-shape labels, collection/page/more summaries, configurable
collection display, accessible progress, bounded buffer rendering, style
presets, configurable string word lists and inflection dictionaries, UTF-8
slicing, word-boundary truncation, display width, grapheme-cluster counting,
truncation, and slicing, fixed-width terminal rows and tables, identifier,
Latin Extended/Armenian/Georgian transliteration, casefold, and cleanup
helpers, and parser scanner output for units,
percentages, ratios, proportions, progress, retry phrases, lenient durations,
scientific numbers, ranges, worded ranges and uncertainty labels, business
weekdays, Quartz-style cron metadata, operational/database phrases,
field-change summaries, recurrence time-window
metadata, database-throughput scanners, color-remediation labels, and parser
diagnostics.
