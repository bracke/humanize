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

The expected output is recorded in `EXPECTED_OUTPUT.md`. The demo loads the
built-in catalog into an application-owned `I18N.Runtime.Instance`, creates
English, Danish, and Spanish contexts, and formats representative durations,
byte sizes, relative datetimes, date ranges, numbers, native and
generated-locale cardinal words, decimal/fraction/ordinal words, currency
words, ranges/proportions, scientific notation, percentages,
compact and clock durations, detailed duration wording, duration-backed
freshness/progress/business/natural-duration phrases, holiday-aware business
dates, business-hour labels, metric, compound, display, signal, bandwidth,
battery, CPU-load, luminance, and geographic-distance units, color summaries,
palette harmony/accessibility labels, palette contrast matrices, APCA-style
contrast labels, color-vision-deficiency risk labels, combined color
accessibility summaries, perceptual color-difference labels,
UI/auth/security/issue, CI/CD, ticket, and payment phrases with severity
metadata, capability metadata, collection/page/more summaries, configurable
collection display, accessible progress, bounded buffer rendering, style
presets, configurable string word lists and inflection dictionaries, UTF-8
slicing, word-boundary truncation, display width, grapheme-cluster counting,
truncation, and slicing, identifier, transliteration, casefold, and cleanup
helpers, and parser scanner output for units,
percentages, ratios, proportions, progress, retry phrases, lenient durations,
scientific numbers, ranges, recurrence metadata, and parser diagnostics.
