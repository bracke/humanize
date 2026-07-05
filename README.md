# Humanize

`humanize` is an Ada 2022 Alire library that turns machine values into
human-readable, localized text:

* relative date/times (`now`, `yesterday`, `4 hours ago`, `in 3 days`) with precision, rounding, two-unit, and calendar-only policies, richer calendar-relative labels (`next Friday`, `tomorrow morning`, `tonight`, `this weekend`), calendar-date presets, ordinal date phrases, early/mid/late period labels, fiscal/semester/half-year labels, exact calendar differences, and compact or semantic date/time ranges with weekday, same-year, weekend, week, month, quarter, relative same-day, and business-time labels;
* durations (`90 seconds` -> `1 minute`; multi-unit `1 hour, 30 minutes`; compact `1h 30m`; clock `01:30:05`), exact weeks, approximate 30-day months/365-day years, configurable natural approximation wording (`almost 2 hours`, `just over 3 weeks`, `a little under 1 month`, `about half an hour`), intervals, configurable business-time labels, lifecycle/freshness phrases, and progress/retry phrases;
* byte sizes (`1536` → `1.5 KiB`, decimal, binary, or auto), file-size summaries, transfer-remaining labels, and disk-usage labels;
* color and visual value labels, including full CSS named colors, `currentColor`, CSS Color 4 parsing into sRGB, alpha hex, `rgb`/`hsl`/`hwb`/`lab`/`lch`/`oklab`/`oklch`/`color()` input, `none` channels, simple `calc()` expressions, RGB/RGBA/HSL/HSV summaries, CIE Lab/OKLab conversion, hue family, saturation, temperature, chroma, and pastel/vivid descriptions, nearest color names, palette roles, harmony, contrast suggestions, accessibility warnings, mood summaries, opacity, brightness, contrast/readability labels, RGB and perceptual color-difference labels;
* ordinals (`21` → `21st`, with feminine forms), compact numbers (`1200` → `1.2K` or `1.2 thousand`), deterministic spellout, AP/editorial number wording, number ranges/proportions including inclusive/exclusive ranges, tolerances, thresholds, range-position labels, and noun ratios, relative change phrases, deterministic currency phrases, and percentages (`50` → `50%`);
* unit quantities, whole or fractional (`5` + `Kilometer` → `5 kilometers`; `21` + `Celsius` → `21 degrees Celsius`), including practical engineering, display, print, signal, and storage-endurance helpers;
* parser/scanner normalization helpers, collection/page-count summaries, generic queue/job/run/cache/sync/import/export summaries, file/date/number comparison summaries, UTF-8-safe and grapheme-cluster-safe string truncation/slicing, Unicode-aware reading/speaking metrics, configurable combined text summaries, opaque-token grouping/masking, person/name display helpers, safe filename/path labels, transliteration, string cleanup, and style presets for common UI and technical output policies.

Eight native catalog fragments ship built in — English, Danish, German,
French, Spanish, Italian, Portuguese, and Dutch. Complete generated-source
fragments also ship for Swedish, Norwegian, Norwegian Bokmal, Finnish, Polish,
Czech, Turkish, Russian, Ukrainian, Japanese, Korean, Chinese, Arabic, and
Hindi locale codes. Generated-source fragments use native script or native
Latin orthography for the core Humanize date, duration, byte, compact-number,
unit, frequency, rate, and list words, and use a shared symbol layer for the
broad engineering-unit tail. Numeric values are
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

## Public packages

| Package | Purpose |
| --- | --- |
| `Humanize.Status` | `Status_Code`, `Text_Result`, `Status_Image`. |
| `Humanize.Messages` | Semantic `Message_Id` enum and stable catalog `Key`. |
| `Humanize.Contexts` | Non-owning `Context` binding an `i18n` runtime + locale. |
| `Humanize.Catalogs` | `Load_Defaults` loads the built-in catalog fragments. |
| `Humanize.Capabilities` | Stable metadata for public capability areas and whether output is locale-rendered or deterministic Humanize text. |
| `Humanize.Datetimes` | `Relative`, `Relative_Civil`, `Natural_Day`, natural time-of-day, richer calendar-relative labels, calendar relation, deterministic UTC offset/date/due labels, exact calendar differences, relative precision/rounding policy, two-unit relative output, calendar-date presets, ordinal month/day and weekday phrases, early/mid/late month and quarter phrases, fiscal-year/fiscal-half/end, semester/half-year, compact calendar badge labels, configurable compact and semantic date/time ranges, weekday/same-year elision, weekend/week/month/quarter labels, relative same-day intervals, and business-time range labels, with bounded forms. |
| `Humanize.Durations` | `Format`, `Format_Components`, compact/clock durations, exact weeks, approximate 30-day months/365-day years, subsecond `Format_Precise`, natural and detailed duration wording including configurable almost/over/just-over/little-under/about-half phrases, intervals, countdown/SLA, configurable workweek, holiday-aware business-date arithmetic, business-hour/calendar arithmetic with break windows, executable business-calendar rule sets, recurring holidays, half-days, shutdown ranges, per-weekday hours, business-time labels, lifecycle/freshness, accessible progress, progress/retry, throughput, ETA, and recurrence phrases, with bounded forms and option records. |
| `Humanize.Bytes` | `Format`, binary/decimal/auto byte option presets, file-size summaries, transfer-remaining labels, and disk-usage labels, with bounded forms. |
| `Humanize.Colors` | Deterministic CSS color parsing for full named colors, `transparent`, `currentColor`, alpha hex, `rgb()/rgba()`, `hsl()/hsla()`, `hwb()`, `lab()`, `lch()`, `oklab()`, `oklch()`, and `color()` profiles (`srgb`, `srgb-linear`, `display-p3`, `rec2020`, `xyz`, `xyz-d65`, `xyz-d50`), including `none` channels and simple `calc()` numeric expressions; normalized RGB/RGBA/HSL/HSV labels, CIE Lab/OKLab conversion, hue family, saturation, temperature, chroma, and combined color-description labels, nearest basic color names, palette roles, harmony, contrast suggestions, accessibility labels, palette contrast matrices, APCA-style polarity/strength labels, color-vision-deficiency risk labels, combined color accessibility summaries, mood labels, advanced palette summaries, opacity and brightness labels, WCAG-style contrast ratios, text-readability labels, RGB-distance and perceptual Delta-E style labels, with bounded forms. |
| `Humanize.Numbers` | `Cardinal`, signed and native-orthography locale cardinal words, locale decimal/fraction/ordinal word spellout, currency/percent word spellout, AP/editorial number wording for general text, headlines, ages, measurements, percentages, and ordinals, deterministic currency phrases, spellout coverage metadata, accessible number wording, `Fractional`, `Bounded_Number`, ranges, inclusive/exclusive range phrases, tolerance ranges, threshold labels, range-position labels, proportions, noun ratios, relative change/delta phrases, `Ordinal`, `Compact`, `Percent`, scientific notation, Roman numerals, SI-prefix formatting, and approximation phrases, with bounded forms. |
| `Humanize.Units` | Unit quantities, abbreviation style, and automatic length, mass, volume, speed, area, pressure, energy, power, temperature, frequency, angle, ratio, electric, concentration, fuel-efficiency, cooking-temperature, latency, bandwidth, display, print, signal, and storage-endurance selection. |
| `Humanize.Lists` | Human-readable conjunction/disjunction lists, Oxford-comma option, limited lists, counted noun phrases with zero/article/word/compact policies, validation/error summaries, field problem summaries, result/page summaries, compact "more"/"others" summaries, pagination ranges, selection summaries, and compact/summary/screen-reader collection display policies. |
| `Humanize.Frequencies` | Occurrence phrasing: `never`, `once`, `twice`, `n times`, plus custom nouns. |
| `Humanize.Rates` | Pace/rate phrasing such as `approximately 4 heartbeats per week` and `less than once per week`. |
| `Humanize.Strings` | Truncation, UTF-8-safe truncation/slicing/counting/display-width estimates, grapheme-cluster-safe counting/display-width estimates/truncation/slicing for combining and spacing marks, prepended marks, emoji modifiers, emoji/text variation selectors, ZWJ emoji sequences, keycaps, regional-indicator flags, Hangul Jamo, default-ignorable format characters, and modern East Asian wide ranges, Unicode-aware reading/speaking time, word/sentence/paragraph summaries, structured text metrics, configurable combined text summaries with field order, separators, label styles, and zero omission, ASCII casefolding, capitalization/title-case with configurable policy or caller-supplied word lists, identifier transforms including demodulize/tableize/classify/foreign-key helpers, expanded simple English inflection with irregulars, uncountables, classical/common suffix rules, caller-supplied dictionaries, dictionary-vs-built-in precedence options, case policy, and inflection-source metadata, whitespace/tag cleanup, configurable excerpt/context-excerpt/highlight policies, HTML-safe highlighted excerpts, mask/initials/possessive helpers, person/name display helpers, compact people lists, opaque-token normalization/grouping/masking, safe filename generation with case, separator, extension, hidden-file, reserved-name, and stem-length policy, basename/title/extension labels, path shortening with optional extension preservation, search keys, natural sort keys, best-effort Latin-1 ASCII transliteration, HTML escaping, separator cleanup, and newline/HTML break conversion, with bounded forms. |
| `Humanize.Parsing` | Parse or scan Humanize-style byte sizes, file/transfer/disk byte summaries, strict and lenient durations including natural approximation phrases, natural dates and date ranges including repeated weekdays, time-of-day suffixes, ordinal month/day and weekday date phrases, early/mid/late period ranges, fiscal-year/fiscal-half/end, semester/half-year labels, boundaries, rule-aware business days, business days before period boundaries, week numbers, and quarter labels, business-calendar phrases and executable rule sets, ranges, countdown/SLA/age/freshness/ETA/retry phrases, counted nouns, progress/result/page summaries, validation/field/selection/pagination/collection summaries, phrase metadata and sync/import/export summaries, string/text summary/token/path/name/initials/possessive/email/filename/search-key/sort-key/identifier/cleanup/conversion/excerpt/highlight labels, step/attempt counts, business/working counts, detailed recurrence metadata, throughput, progress bars, precise durations, compact/scientific numbers, Roman numerals, bounded numbers, number ranges, proportions, frequencies, rates, lists, percentages, ordinals, cardinal words, deterministic currency/approximation/change phrases, domain/queue/cache summaries, number/percent/file-size/date comparisons, color model/summary/palette/accessibility/difference labels, units, compound units, aspect ratios, and CSS lengths, with consumed/error-position metadata, diagnostic categories, and diagnostic messages. |
| `Humanize.Styles` | Style presets and focused override helpers for compact UI, verbose, technical, casual, screen-reader, CLI, log, dashboard, accessibility, telemetry, and mobile output policies, including focused calendar-date presets for compact badges, fiscal periods, academic/semester output, and early/mid/late period labels. |
| `Humanize.Phrases` | Deterministic Humanize UI status phrases such as loading, saved, failed, overdue, last seen, updated just now, auth, billing, workflow, queue, file, validation, empty-state, network, security, deployment, health, notification, form, access, sync, import/export, search/filter, collaboration, issue/PR, task, CI/CD, support-ticket, and payment lifecycle phrases, plus generic queue/job/run/cache/sync/import/export summaries and file/date/number comparison summaries, with stable severity, tone, key, phrase-pack, and phrase-locale metadata. |

Every formatter offers a convenience form returning `Humanize.Status.Text_Result`
and a bounded form (`*_Into`) writing into a caller-owned 1-based `String`.

Shipped native locales: English (`en`), Danish (`da`), German (`de`), French
(`fr`), Spanish (`es`), Italian (`it`), Portuguese (`pt`), and Dutch (`nl`).
Complete generated-source catalog fragments are additionally available for
`sv`, `no`, `nb`, `fi`, `pl`, `cs`, `tr`, `ru`, `uk`, `ja`, `ko`, `zh`, `ar`,
and `hi`.
Region-tagged contexts such as `sv-SE`, `nb-NO`, `ja-JP`, and `ar-EG` resolve
through `i18n` locale fallback to those base catalog fragments.
`Humanize.Catalogs.Load_Defaults` defaults to `Reject_Duplicates`; a duplicate
load is non-destructive, and callers may explicitly pass `Keep_First` or
`Override_Previous` through to the underlying `i18n` loader.
Numeric values and counts are rendered by `i18n` using each locale's number
data; fractional quantities agree in number via CLDR fractional plural operands.
Ordinal and plural correctness is delegated to `i18n`'s rules. Locale spellout
helpers use native UTF-8 orthography for deterministic cardinal, decimal,
fraction, and ordinal words in shipped spellout locales, including
language-specific compound grammar for deterministic cardinal forms. The native
spellout tier covers English, Danish, German, French, Spanish, Italian,
Portuguese, and Dutch; the generated-locale deterministic tier additionally
covers Swedish, Norwegian, Norwegian Bokmal, Finnish, and Turkish cardinal,
decimal, common-fraction, and direct ordinal words. Grouped cardinal words cover
values through quadrillions before falling back to English.

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
