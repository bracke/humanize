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
[`examples/product_details_demo.adb`](examples/product_details_demo.adb), plus
[`examples/public_surface_demo.adb`](examples/public_surface_demo.adb) for
focused child-package imports.
For a shorter import map than the full feature matrix, see
[`docs/PACKAGE_GUIDE.md`](docs/PACKAGE_GUIDE.md).

## Public packages

The exhaustive public package list is generated from
[`docs/PUBLIC_API.toml`](docs/PUBLIC_API.toml) into
[`docs/PUBLIC_API_INDEX.md`](docs/PUBLIC_API_INDEX.md). Use that index as the
source of truth for public units, file paths, and broad API areas.

Common entry points:

* `Humanize.Contexts`, `Humanize.Catalogs`, and `Humanize.Status` set up
  locale-aware rendering and report formatter status.
* `Humanize.Datetimes`, `Humanize.Durations`, `Humanize.Bytes`,
  `Humanize.Numbers`, `Humanize.Units`, `Humanize.Lists`,
  `Humanize.Frequencies`, and `Humanize.Rates` cover common value formatting.
* `Humanize.Colors`, `Humanize.Strings`, `Humanize.Values`, and
  `Humanize.Parsing` cover richer parsing, text, color, and UI/config labels.
* Domain packages such as `Humanize.Diagnostics`, `Humanize.Workflows`,
  `Humanize.Operations`, `Humanize.Builds`, `Humanize.Permissions`, and
  `Humanize.System_Status` provide deterministic labels for product,
  operational, and admin surfaces.
* `Humanize.Styles`, `Humanize.Capabilities`, and
  `Humanize.Domain_Details` expose output policy and metadata helpers.

For task-oriented import guidance, see
[`docs/PACKAGE_GUIDE.md`](docs/PACKAGE_GUIDE.md).

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
