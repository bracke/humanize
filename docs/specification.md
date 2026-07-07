# Humanize 0.5.0 Specification

## Purpose

`humanize` is an Ada 2022 Alire library crate for converting machine-oriented
values into localized, human-readable text.

Humanize 0.5.0 supports:

* relative datetimes, including elapsed and calendar-word modes, natural
  time-of-day labels, richer calendar-relative labels such as `next Friday`,
  `tomorrow morning`, `tonight`, and `this weekend`, calendar relation labels,
  compact date/time ranges, and business-time range labels;
* natural day labels, exact calendar differences, and ISO-date fallback for
  distant civil dates;
* single-unit, multi-unit, compact, clock-style, natural-wording, exact-week,
  approximate-month/year, and precise subsecond durations with unit suppression,
  plus configurable business-date and business-hour arithmetic, interval,
  common business-calendar presets, lifecycle, freshness, progress, and retry
  phrases;
* decimal, binary, and auto byte-size formatting plus file, transfer, and disk
  usage summaries;
* deterministic color and visual value labels, including full CSS named colors,
  `currentColor`, CSS Color 4 parsing into sRGB, alpha hex,
  RGB/RGBA/HSL/HWB/Lab/LCH/OKLab/OKLCH/`color()` input, `none` channels,
  simple `calc()` numeric expressions, RGB/RGBA/HSL/HSV summaries, CIE Lab and
  OKLab conversion, hue family, saturation, temperature, chroma, pastel/vivid
  descriptions, nearest color names, palette roles, harmony, contrast-pair
  suggestions, accessibility labels, contrast metadata, mood labels, advanced
  palette summaries, opacity, brightness, contrast, text-readability,
  RGB-distance, and perceptual color-difference labels;
* cardinal words, signed English and grouped locale cardinal words,
  AP/editorial number wording, deterministic currency phrases, fractional
  numbers, ordinals, compact numbers, long-form compact numbers, bounded
  numbers, number ranges, proportions, relative change phrases, and
  percentages;
* metric and selected customary unit quantities, including fractional
  quantities, abbreviation style, automatic unit selectors, practical
  engineering/display/print/signal/storage-endurance helpers, and bounded
  forms;
* human-readable conjunction/disjunction lists, limited lists, counted noun
  phrases with zero/article/word/compact policies, result/page summaries,
  compact more/others summaries, pagination ranges, frequency, and rate
  phrasing with custom nouns;
* deterministic generic queue/job/run/cache/sync/import/export summaries for
  operational counts, states, and failure totals;
* deterministic file-size, civil-date, absolute-number, and relative-percent
  comparison summaries;
* deterministic string helpers for truncation, UTF-8 boundary-safe truncation
  and counting, grapheme-cluster-safe counting, width estimation, truncation,
  and slicing, Unicode-aware text metrics, capitalization, configurable title
  casing, identifier
  conversion including demodulize/tableize/classify/foreign-key helpers,
  English inflection plus deterministic plural/singular rule sets for shipped
  Latin-script generated locales, whitespace/tag cleanup,
  configurable excerpt/highlight policies, HTML-safe highlighted excerpts,
  mask/initials/possessive helpers, person/name display helpers, compact
  people lists, fixed-width terminal table rows and tables, Unix symbolic/octal
  file permission mode labels and parsing, HTML escaping, separator cleanup,
  and line-break conversion, with direct bounded wrappers;
* parsing, scanner, and normalization helpers for Humanize-style byte sizes,
  durations and ranges including ISO 8601 duration forms, natural dates and
  date ranges including ISO calendar, ordinal, and week dates, repeated
  weekdays, time-of-day suffixes, `tonight`, `later today`, weekend ranges,
  ordinal weekdays in a month, boundaries, business days, business days before
  period boundaries, week numbers, and quarter labels,
  business-calendar phrases, countdown/SLA/age/freshness/ETA/retry phrases,
  precise durations, compact and scientific numbers, Roman numerals, bounded
  numbers, percentages, ordinals, cardinal words, counted nouns,
  progress/result/page summaries, step/attempt counts, business/working counts,
  worded decimal ranges and uncertainty labels, recurrence,
  throughput, progress bars, units and compound units, aspect ratios, CSS
  lengths, frequencies, rates, and lists;
* built-in reviewed native or native-orthography catalog fragments for `en`,
  `da`, `de`, `fr`, `es`, `it`, `pt`, `nl`, `sv`, `no`, `nb`, `fi`, `pl`,
  `cs`, `tr`, `ru`, `uk`, `ja`, `ko`, `zh`, `ar`, and `hi`;
* locale-rendered numeric values through public `i18n` number placeholders;
* CLDR fractional plural agreement through `i18n >= 1.1.0`;
* convenience APIs returning `Humanize.Status.Text_Result`;
* bounded caller-owned output APIs for every formatter.

Humanize does not implement its own localization runtime. It classifies values,
chooses semantic message keys, prepares render arguments, and delegates message
rendering to the public `i18n` runtime.

The dependency direction is:

```text
Humanize -> I18N
```

`i18n` must not depend on `humanize`.

## Crate and Namespace

Alire crate name:

```toml
name = "humanize"
```

The development manifest pins the sibling `../i18n` checkout for local work.
The release manifest template is `alire.release.toml` and must contain no local
path pins. Both manifests require:

```toml
i18n = ">=1.1.0"
```

Root Ada namespace:

```ada
Humanize
```

Public packages:

```text
Humanize
Humanize.Status
Humanize.Messages
Humanize.Contexts
Humanize.Catalogs
Humanize.Datetimes
Humanize.Durations
Humanize.Bytes
Humanize.Colors
Humanize.Numbers
Humanize.Units
Humanize.Lists
Humanize.Frequencies
Humanize.Rates
Humanize.Strings
Humanize.Parsing
Humanize.Styles
Humanize.Phrases
```

Private/internal packages:

```text
Humanize.Selections
Humanize.I18N_Rendering
Humanize.Datetime_Classification
Humanize.Duration_Classification
Humanize.Byte_Classification
Humanize.Number_Classification
Humanize.Unit_Classification
Humanize.Decimal_Images
```

## Architectural Boundary

Humanize owns:

* value normalization;
* threshold and unit-selection policy;
* duration decomposition policy;
* byte-unit policy;
* compact-number tier selection;
* list, occurrence, rate, and deterministic string-helper policy;
* unit-quantity classification;
* semantic message-key selection;
* construction of locale-neutral render arguments;
* deterministic numeric rounding/scaling before values are handed to `i18n`;
* bounded API behavior;
* Humanize catalog fragments.

`i18n` owns:

* locale identifiers and fallback;
* catalog loading and shard composition;
* message lookup;
* ICU-subset parsing, compilation, and rendering;
* locale numeric display formatting for Humanize `{value, number}` arguments;
* plural, select, and selectordinal mechanics;
* CLDR fractional plural operands;
* argument storage;
* render statuses and diagnostics.

Humanize library sources may import only the stable public `i18n` packages that
their role requires:

```ada
I18N.Arguments
I18N.Locales
I18N.Result
I18N.Runtime
```

Direct runtime calls and argument-map construction are isolated in
`Humanize.I18N_Rendering`, except catalog loading in `Humanize.Catalogs` and
non-owning context references in `Humanize.Contexts`. Domain packages such as
`Humanize.Datetimes`, `Humanize.Durations`, `Humanize.Bytes`,
`Humanize.Numbers`, and `Humanize.Units` must not import `I18N.Runtime`.

Humanize must not import private/internal `i18n` packages such as AST, parser,
compiler, cache, renderer, buffer, runtime data, errors, or validation packages.

## Text Encoding

Humanize returns UTF-8-compatible Ada `String` text, matching the current public
`i18n` result model. No `Wide_Wide_String` public API is part of 0.5.0.

## Output API Policy

Every public formatter provides:

1. a convenience API returning `Humanize.Status.Text_Result`;
2. a bounded API writing into caller-owned `String` storage.

Bounded APIs use:

```ada
Target  : in out String;
Written : out Natural;
Status  : out Humanize.Status.Status_Code;
```

Rules:

* `Target` must be 1-based, for example `String (1 .. 256)`.
* If `Target'First /= 1`, the operation returns `Invalid_Options` and
  `Written = 0`.
* On `Ok`, `Written` is the number of characters written and the rendered text
  is `Target (1 .. Written)`.
* On `Buffer_Overflow`, `Written` is the number of prefix characters copied and
  callers must treat the output as incomplete.
* On any non-overflow failure, `Written = 0`.
* Classification code must not call the `i18n` runtime directly.
* Rendering allocation behavior follows the public `i18n` API used by
  `Humanize.I18N_Rendering`.

## Public API Summary

`Humanize.Status` defines `Status_Code`, `Text_Result`, `Is_Ok`, and
`Status_Image`.

`Humanize.Messages` defines the stable semantic `Message_Id` enumeration and
`Key`, which maps every non-`No_Message` value to a non-empty `humanize.*`
catalog key.

`Humanize.Contexts` defines a non-owning formatting context bound to a
caller-owned `I18N.Runtime.Instance` and a locale identifier. The runtime must
outlive every context that references it.

`Humanize.Capabilities` defines stable area labels, rendering-source metadata,
and locale-behavior metadata. Rendering-source metadata distinguishes
catalog-rendered output from Humanize-owned deterministic text. Locale behavior
metadata further distinguishes catalog-localized areas, deterministic
locale-aware areas, deterministic English/structural areas, and mixed areas
that combine catalog output with deterministic labels or fallbacks.

`Humanize.Catalogs.Load_Defaults` loads the built-in catalog fragments into a
caller-owned `i18n` runtime using `I18N.Runtime.Load_Text` and the caller's
duplicate policy.

`Humanize.Datetimes` provides `Relative`, `Relative_Into`, `Relative_Civil`,
`Relative_Civil_Into`, `Natural_Day`, `Natural_Day_Into`,
`Natural_Time_Of_Day`, `Calendar_Relative_Label`,
`Calendar_Relative_Label_Into`, `Calendar_Relation`, `Date_Range`,
`Time_Range`, `Date_Time_Range`, `Business_Time_Range_Label`,
`Calendar_Range_Label`, `Offset_Label`, `Calendar_Date_Label`,
`Month_Day_Ordinal_Label`, `Weekday_Ordinal_Label`, `Fiscal_Year_Label`,
`Fiscal_Half_Label`, `Semester_Label`, `Half_Year_Label`,
`Calendar_Badge_Label`, and `Due_Status`.
The civil API validates impossible dates and then interprets civil components
through `Ada.Calendar`; Humanize does not own a time zone database.
`Datetime_Options` controls relative precision with floor, nearest, or ceiling
rounding, one- or two-unit output, calendar-word use, and calendar-only output
that falls back to deterministic ISO dates instead of elapsed text.
`Natural_Day` renders nearby dates as day words and distant dates as ISO
`YYYY-MM-DD` text. `Calendar_Relative_Label` adds deterministic labels for
nearby weekdays, same-day time buckets, tomorrow/yesterday time-of-day phrases,
and nearby weekend dates, falling back to ISO dates outside the configured
weekday window. `Calendar_Date_Label` supports deterministic presets for
ISO, short numeric, medium, long, weekday, month-year, year-month, quarter,
fiscal-quarter, ordinal month/day, weekday ordinal, month phase, quarter phase,
fiscal year, fiscal half, fiscal year end, semester, half-year, half-year
phrase, and compact calendar badge labels.
`Calendar_Difference_Label` decomposes civil dates into
real years, months, and days using month lengths and leap years rather than
approximate seconds. Date ranges support compact same-month elision,
month-name display, same-year elision, weekday labels, 12-hour time display,
and custom separator policy. `Calendar_Range_Label` adds semantic labels for
same-day time ranges, weekends, weeks, full months, full quarters, fiscal
quarters, and polished month-name date ranges such as `Mar 21-23, 2026`.
Combined date/time ranges can use relative same-day labels, and business-time
range labels classify intervals with caller-supplied business calendar rules.
All datetime helpers have bounded output forms.

`Humanize.Durations` provides `Format`, `Format_Into`, `Format_Components`,
`Format_Components_Into`, `Format_Compact`, `Format_Compact_Into`,
`Format_Clock`, `Format_Clock_Into`, `Format_Precise`, and
`Format_Precise_Into` for single-unit, multi-unit, compact, clock-style,
exact-week, approximate-month/year, and subsecond durations. Months are
deterministic 30-day units and years are deterministic 365-day units; calendar
month/year arithmetic belongs to date APIs. Precise duration options allow
callers to set the minimum unit and suppress selected units. `Format_Range`,
`Interval`, `Next_Window`,
`Countdown`, `SLA_Window`, `Age`, `Stale_For`, `Expires_In`, `Modified_Ago`,
`Synced_Ago`, `Backup_Age`, `Complete_Count`, `Percent_Complete`, `Retry_In`,
`Step_Count`, `Attempt_Count`, `ETA`, `Throughput_Remaining`, `Progress_Bar`,
`Business_Days`, `Working_Hours`, `End_Of_Week`, `End_Of_Month`,
`End_Of_Quarter`, `Recurrence`, `Schedule`, `Cron_Schedule`,
`Natural_Duration`, `Duration_Distance`, `Natural_Duration_Detailed`,
`Add_Business_Days`, `Add_Business_Hours`,
`Business_Date_Label`, `Business_Hour_Label`, and `Business_Calendar_Label`
provide deterministic duration-backed and configurable business/progress UI
phrases. Business-day options support caller-selected workweek days and overloads
accept date-only holiday exclusions. Rule-aware business-day helpers accept
signed offsets and honor one-off holidays, recurring holidays, shutdowns,
half-day closures, and per-weekday open days from `Business_Calendar_Rules`.
Rule construction helpers include fixed-date observed holidays and nth-weekday
holidays for common business calendars.
Preset rule constructors cover common TARGET2, UK England/Wales, Canada
federal, Germany, France, NYSE, ASX, JPX/TSE, SIX, SGX, HKEX, NSE, B3, BMV,
Australia national, Japan, Switzerland, and Singapore business calendars.
`Add_TARGET2_Holidays`
adds New Year, Good Friday, Easter Monday, May Day, Christmas, and Boxing Day
for a given year.
`Add_UK_Bank_Holidays_England_Wales` adds observed New Year, Good Friday,
Easter Monday, early May, spring, summer, Christmas, and Boxing Day bank
holidays. `Add_Canada_Federal_Holidays`, `Add_Germany_Public_Holidays`,
`Add_France_Public_Holidays`, `Add_NYSE_Holidays`, `Add_ASX_Holidays`,
`Add_JPX_Holidays`, `Add_SIX_Holidays`, and `Add_SGX_Holidays` add
deterministic observed/fixed/easter-relative holiday sets for those calendars.
Business-hour helpers add whole working hours inside a caller-supplied workday
window. Calendar-hour helpers also accept holiday exclusions and an optional
break window. Advanced calendar overloads add per-weekday business hours,
recurring month/day holidays, date-only half-days, and inclusive shutdown
periods. `Business_Calendar_Rules` collects those advanced calendar inputs into
a single fixed-capacity rule set with helper adders and direct
`Add_Business_Hours` / `Business_Calendar_Label` overloads.
Duration interval and natural-duration helpers expose option records for fixed
wording policy without involving `i18n` message syntax. Natural duration
styles include plain, brief, precise brief, approximate, almost, over,
just-over, little-under, few, and half-hour wording such as `almost 2 hours`,
`just over 3 weeks`, `a little under 1 month`, and `about half an hour`.
`Natural_Duration_Approximation_Options` lets callers tune round-up and
larger-unit thresholds for those approximate styles without changing the
existing default behavior. Named threshold presets cover default, Rails-like,
Django-like, and conversational natural duration wording, and
`Duration_Distance` wraps those phrases as plain, past, or future text.
Schedule helpers produce deterministic shipped-locale labels for interval,
weekday, weekday-set, ordinal-weekday, business-day, and common five-field cron
shapes such as every minute, daily at a time, weekdays at a time, single
weekdays, and day-of-month schedules.
`Accessible_Progress` provides a verbose non-symbolic progress phrase for
assistive output.

`Humanize.Bytes` provides `Format` and `Format_Into` for binary, decimal, and
auto byte units. `Binary_Byte_Options`, `Decimal_Byte_Options`, and
`Auto_Byte_Options` provide ready-made byte policies. `Format_Metadata`
reports the deterministic render unit, scale, and unit system chosen for a byte
value without reparsing formatted text. `File_Size_Summary`,
`Transfer_Remaining_Label`, and `Disk_Usage_Label` compose deterministic
Humanize-owned file, transfer, and storage labels from byte-size fragments; each
has a bounded output form.

`Humanize.Colors` provides `Parse_Hex_Color`, `Parse_Named_Color`,
`Parse_CSS_Color`, `Hex_Color`, `RGB_Label`, `RGBA_Label`, `CSS_Color_Label`,
`HSL`, `HSV`, `HSL_Label`, `HSV_Label`, `Lab`, `OKLab`, `Hue_Family_Label`,
`Saturation_Label`, `Temperature_Label`, `Chroma_Label`,
`Color_Description`, `Nearest_Color_Name`, `Palette_Summary`,
`Palette_Roles`, `Palette_Harmony_Label`, `Palette_Contrast_Suggestion`,
`Palette_Accessibility_Label`, `Palette_Contrast_Matrix_Label`,
`Palette_Mood_Label`, `Advanced_Palette_Summary`, `Color_Summary`,
`Brightness`, `Brightness_Label`, `Opacity_Label`, `Relative_Luminance`,
`Contrast_Ratio`, `Contrast_Level_For`, `Contrast_Label`,
`Readability_Label`, `APCA_Contrast`, `APCA_Contrast_Label`,
`Color_Vision_Deficiency_Label`, `Color_Accessibility_Summary`,
`Contrast_Metadata_For`, `Color_Difference`, `Color_Difference_Label`,
`Perceptual_Difference`, `OK_Perceptual_Difference`, and
`Perceptual_Difference_Label`, plus bounded forms. CSS
parsing covers full CSS named colors, `transparent`, `currentColor`,
3/4/6/8-digit hex, legacy comma and modern space/slash `rgb()`, `rgba()`,
`hsl()`, and `hsla()`, plus `hwb()`, `lab()`, `lch()`, `oklab()`, `oklch()`,
and `color()` input converted into the package's sRGB model. Supported
`color()` profiles are `srgb`, `srgb-linear`, `display-p3`, `rec2020`, `xyz`,
`xyz-d65`, and `xyz-d50`; numeric components may use `none` and simple
`calc()` arithmetic. The package owns deterministic visual-value wording and
WCAG-style contrast/readability labels; it does not implement browser CSS
cascade parsing, custom `@color-profile` loading, ICC profile management, or
application theming policy.

`Humanize.Numbers` provides `Cardinal`, `Signed_Cardinal`, `Locale_Cardinal`,
`Decimal_Words`, `Fraction_Words`, `Ordinal_Words`, `Currency`,
`Currency_Words`, `Percent_Words`, `Accessible_Number`,
`Spellout_Coverage`, `Approximate_Currency`, `Fractional`, `Bounded_Number`,
`Number_Range`, `Approximate_Range`, `Decimal_Range`, `Decimal_Range_Words`,
`Qualified_Range`, `Tolerance_Range`, `Uncertainty_Label`,
`Uncertainty_Words`, `Threshold`, `Range_Position`,
`Ratio`, `Ratio_Per`, `One_In`, `Out_Of`, `Direction_Of_Change`, `Change`,
`Change_Since`, `Change_From`, `Percent_Change`, `Percent_Delta`,
`Point_Change`, `Unit_Change`, `Ordinal`, `Compact`, `Percent`, `Roman`,
`Scientific_Notation`, `SI_Prefix`, `Editorial_Number`,
`Editorial_Ordinal`, `Editorial_Percent`, `Editorial_Measurement`,
`Editorial_Age`, `Approximate`, and `Approximate_To`, plus bounded forms.
Cardinal, signed cardinal, grouped locale cardinal, decimal/fraction/ordinal
word spellout, currency, currency-word, and fractional helpers provide
deterministic text. Locale cardinal, decimal, fraction, ordinal, and
caller-unit currency word spellout uses native UTF-8 orthography and
deterministic language-specific compound grammar for the shipped spellout
locales. The native spellout tier
covers English, Danish, German, French, Spanish, Italian, Portuguese, and
Dutch. The generated-locale deterministic tier additionally covers Swedish,
Norwegian, Norwegian Bokmal, Finnish, Turkish, Polish, Czech, Russian,
Ukrainian, Japanese, Korean, Chinese, Arabic, Hindi, Romanian, Lithuanian,
Slovenian, Indonesian, Malay, Esperanto, Vietnamese, Swahili, Afrikaans,
Hungarian, and Slovak cardinal, decimal, common-fraction, and direct ordinal
words. Locale cardinal words cover grouped values through quadrillions for the
shipped spellout locales, with English fallback only for unrecognized locales
or values outside the deterministic range.
Editorial helpers provide deterministic English AP-style policy: general and
headline text spell out caller-selected small numbers, while ages,
measurements, percentages, and larger ordinals use grouped digits.
Relative change helpers provide deterministic directional (`up 4`), signed
(`+4`), comparative (`4 fewer errors`), unchanged, percent, point, unit, and
current-versus-previous delta phrases.
SI-prefix formatting provides deterministic symbol or long-prefix scaling from
yocto through yotta. Bounded numbers, ordinals, compact numbers, and
percentages pass
locale-neutral numeric values to `i18n` for display. Ordinals support masculine
and feminine forms where the locale catalog distinguishes them. Compact numbers
support short and long styles. Approximation helpers provide explicit and
threshold-chosen comparison phrasing. Number range and proportion helpers
provide deterministic `1-5`, `about 10-20`, `under 5`, `up to 100`,
`between 3 and 7`, decimal ranges, inclusive/exclusive range wording,
tolerance and uncertainty labels, threshold labels, within/below/above
range-position labels, `2:1`, `2 errors per file`, `1 in 4`, and `3 out of
10` style phrases.
Word-based decimal ranges and uncertainty labels also have bounded output
forms for callers that need no allocation.
`Spellout_Coverage` reports the deterministic Humanize-owned spellout scope;
`Spellout_Locale_Tier_For` reports whether a context uses English, hand-written
native-locale, generated-locale, or English-fallback deterministic spellout.
Open-ended CLDR-grade spellout remains i18n territory.

`Humanize.Units` provides `Format` and `Format_Into` for meter, kilometer,
centimeter, millimeter, gram, kilogram, milligram, liter, milliliter,
temperature, area, speed, pressure, energy, power, frequency, angle, and
selected US customary units. Fractional quantities use CLDR fractional plural
agreement through `i18n`. Long and abbreviated unit styles are supported.
`Format_Length`, `Format_Mass`, `Format_Volume`, `Format_Speed`,
`Format_Area`, `Format_Pressure`, `Format_Energy`, `Format_Power`,
`Format_Temperature`, `Format_Frequency`, `Format_Angle`,
`Format_Data_Rate`, `Format_Bits`, `Format_Bit_Rate`,
`Format_Binary_Data_Rate`, `Format_Density`, `Format_Acceleration`,
`Format_Torque`, `Format_Fuel_Economy`, `Format_Flow_Rate`,
`Format_Electric_Current`, `Format_Voltage`, `Format_Electric_Resistance`,
`Format_Resolution`, `Format_Pixel_Density`, `Format_CSS_Length`,
`Format_Aspect_Ratio`, `Format_Electric_Capacitance`,
`Format_Electric_Inductance`, `Format_Concentration`,
`Format_Fuel_Efficiency_MPG`, `Format_Cooking_Temperature`,
`Format_Memory_Bandwidth`, `Format_Latency`, `Format_CPU_Load`,
`Format_Battery`, `Format_Screen_Size`, `Format_Typography_Size`,
`Format_IOPS`, `Format_Audio_Level`, `Format_Signal_Strength`,
`Format_Storage_Endurance`, `Format_Refresh_Rate`, `Format_Luminance`,
`Format_Print_Resolution`, and `Format_Geographic_Distance` choose practical
units from base-unit or domain-specific inputs.
Selector helpers have bounded output forms. Newly added unit domains have
native or domain-appropriate built-in labels across all shipped locales.

`Humanize.Lists` provides `Format`, `Format_Into`, `Format_Limited`,
`Format_Limited_Into`, `Count`, `Counted_Noun`, `Counted_Noun_Into`,
`Counted_Noun_Source`, `Counted_Noun_Source_Label`, `Validation_Count`,
`Validation_Summary`, `Field_Problem_Summary`, `Selection_Count`,
`Remaining_Count`, `Position_Count`, `All_Count`, `None_Count`, `Result_Count`,
`Showing_Count`, `Page_Count`, `More_Count`, `Others_Count`,
`Selection_Summary`, `Filtered_Count`, `Pagination_Range`, and
`Collection_Display` for
human-readable conjunction/disjunction lists, optional Oxford-comma punctuation,
counted noun phrases, validation/error summaries, "N others" tails, and
deterministic filtered-count, compact, summary, or screen-reader
collection/page summaries.
Counted noun options cover numeric, small-word, compact, and article counts,
zero wording, noun omission, compact thresholds, and deterministic noun-source
metadata. Validation summary options cover error/warning/notice severity,
headline-only versus detailed summaries, detail limits, empty-state suppression,
field labels, and detail-list punctuation.

`Humanize.Frequencies` provides `Times` and `Times_Into` for occurrence-count
phrasing such as `never`, `once`, `twice`, and `4 times`; overloads accept
custom singular/plural nouns.

`Humanize.Rates` provides `Pace` and `Pace_Into` for rate phrasing over second,
minute, hour, day, and week periods; overloads accept custom singular/plural
nouns. `Pace_Approximate` adds less-than threshold wording.

`Humanize.Strings` provides deterministic helpers for byte-count truncation,
UTF-8 boundary-safe truncation, word-boundary truncation, slicing, code-point
counting, grapheme-cluster counting, grapheme-safe truncation/slicing for
combining and spacing marks, prepended marks, emoji modifiers, emoji/text
variation selectors, ZWJ emoji sequences, keycaps, regional-indicator flags,
Hangul Jamo, default-ignorable format characters, and modern East Asian wide
ranges, display-width estimates, Unicode-aware reading/speaking time
estimates, word/sentence/paragraph summaries, structured text metrics,
configurable combined text summaries with caller-selected field order,
separators, natural/compact/minimal labels, zero omission, ASCII casefolding,
word truncation, capitalization, title casing, identifier transformations,
slug generation,
irregular-aware simple English inflection, smart title casing, whitespace
normalization, tag stripping, character-radius excerpts, word-context excerpts,
highlighting, configurable case-insensitive and word-boundary match policies,
first/all highlight modes, HTML-safe highlighted excerpts, masking,
opaque-token normalization/grouping/masking, initials, cleaned person names,
display-name fallback, name-part extraction, handle/email labels, compact
people lists, safe filename generation,
basename/title/extension labels, and path shortening with display policies for
case, separators, extension preservation, hidden files, reserved-name fallbacks,
stem-length limits, empty fallbacks, title extraction, missing-extension labels,
and extension-preserving path shortening, Unix symbolic/octal file mode labels,
permission summaries, symbolic/octal mode parsing, search keys, natural sort
keys, English possessives, fixed-width terminal `Table_Row_2`, `Table_Row_3`,
`Table_2`, and `Table_3` helpers, best-effort Latin-1, Latin Extended,
Hebrew, Arabic, Armenian, and Georgian ASCII transliteration, HTML
escaping, separator cleanup, and line-feed/HTML-break
conversion. Title-case
policy can be configured to preserve acronyms and lowercase small words
independently, or supplied with caller-owned acronym/small word lists.
Inflection helpers support expanded English irregulars, technical
uncountables, compound person forms, traditional animal/person forms,
classical/common suffix rules, caller-owned paired singular/plural dictionaries,
dictionary-vs-built-in precedence options, case policy, source metadata
that distinguishes dictionary, irregular, uncountable, rule, and unchanged
paths, plus explicit deterministic plural/singular rule sets for Danish,
German, French, Spanish, Italian, Portuguese, Dutch, Swedish, Norwegian,
Norwegian Bokmal, Finnish, and Turkish. These language rule sets are
Humanize-owned presentation helpers; i18n remains responsible for CLDR plural
category selection in localized message rendering.
Identifier helpers include demodulizing, deconstantizing, tableizing,
classifying, foreign-key naming, and acronym extraction.
Terminal layout helpers include fixed display-width key/value rows and two- or
three-column rows that honor ANSI-aware display width before bounded copying.
Each helper has a direct bounded `*_Into` wrapper where output is produced.

`Humanize.Parsing` provides `Parse_Bytes`, `Scan_Bytes`, `Parse_Duration`,
`Scan_Duration`, `Parse_Lenient_Duration`, `Scan_Lenient_Duration`,
`Parse_Precise_Duration`, `Scan_Precise_Duration`,
`Parse_Compact_Number`, `Scan_Compact_Number`, `Parse_Bounded_Number`,
`Scan_Bounded_Number`, `Parse_Frequency`, `Scan_Frequency`, `Parse_Rate`,
`Scan_Rate`, `Parse_List`, `Scan_List`, `Parse_Percent`, `Scan_Percent`,
`Parse_Ordinal`, `Scan_Ordinal`, `Parse_Cardinal`, `Scan_Cardinal`,
`Parse_Unit`, `Scan_Unit`, `Parse_Aspect_Ratio`, `Scan_Aspect_Ratio`,
`Parse_CSS_Length`, `Scan_CSS_Length`, `Parse_Duration_Range`,
`Scan_Duration_Range`, `Parse_Countdown`, `Parse_SLA_Window`, `Parse_Age`,
`Parse_Modified_Ago`, `Parse_Progress`, `Parse_Result_Count`,
`Parse_Counted_Noun`, `Scan_Counted_Noun`, `Parse_Showing_Count`,
`Parse_Page_Count`, `Parse_Number_Range`, `Scan_Number_Range`,
`Parse_Decimal_Range`, `Scan_Decimal_Range`,
`Parse_Decimal_Range_Words`, `Parse_Uncertainty_Label`,
`Scan_Uncertainty_Label`, `Parse_Uncertainty_Words`, `Parse_Proportion`,
`Scan_Proportion`,
`Parse_ETA`, `Scan_ETA`, `Parse_Retry_In`, `Scan_Retry_In`,
`Parse_Step_Count`, `Scan_Step_Count`, `Parse_Attempt_Count`,
`Scan_Attempt_Count`, `Parse_Business_Days`, `Scan_Business_Days`,
`Parse_Working_Hours`, `Scan_Working_Hours`, `Parse_Recurrence`,
`Scan_Recurrence`, `Parse_Recurrence_Detail`, `Scan_Recurrence_Detail`,
`Parse_Cron_Schedule`, `Scan_Cron_Schedule`, `Parse_Throughput_Remaining`,
`Scan_Throughput_Remaining`, `Parse_Progress_Bar`, `Scan_Progress_Bar`,
`Parse_Natural_Date`, `Scan_Natural_Date`, `Parse_Natural_Date_Range`,
`Scan_Natural_Date_Range`, `Parse_Business_Calendar`,
`Scan_Business_Calendar`, `Apply_Business_Calendar_Rule`,
`Parse_Business_Calendar_Rules`, `Parse_Scientific_Number`,
`Scan_Scientific_Number`, `Parse_Currency`, `Scan_Currency`,
`Parse_Approximate_Currency`, `Scan_Approximate_Currency`,
`Parse_Approximate_Number`, `Scan_Approximate_Number`, `Parse_Change`,
`Scan_Change`, `Parse_Number_Comparison`, `Parse_Percent_Comparison`,
`Parse_File_Size_Comparison`, `Parse_Date_Comparison`,
`Scan_Date_Comparison`, `Parse_Palette_Contrast_Matrix`,
`Parse_APCA_Contrast_Label`, `Parse_Color_Vision_Deficiency_Label`,
`Parse_Color_Accessibility_Summary`, `Parse_RGB_Label`,
`Parse_RGBA_Label`, `Parse_CSS_Color_Label`, `Parse_Color_Summary`,
`Parse_HSL_Label`, `Parse_HSV_Label`, `Parse_Color_Bucket_Label`,
`Parse_Color_Description`, `Parse_Opacity_Label`,
`Parse_Palette_Summary`, `Parse_Palette_Roles`,
`Parse_Palette_Harmony_Label`, `Parse_Palette_Contrast_Suggestion`,
`Parse_Palette_Accessibility_Label`, `Parse_Palette_Mood_Label`,
`Parse_Advanced_Palette_Summary`, `Parse_Alpha_Contrast_Label`,
`Parse_Contrast_Remediation_Label`, `Parse_Color_Difference_Label`,
`Parse_Perceptual_Difference_Label`, `Parse_Domain_Summary`,
`Parse_Queue_Summary`, `Parse_Cache_Summary`, `Parse_File_Size_Summary`,
`Parse_Transfer_Remaining`, `Parse_Disk_Usage`,
`Parse_Phrase_Severity_Label`, `Parse_Phrase_Tone_Label`,
`Parse_Phrase_Domain_Label`, `Parse_Phrase_State_Label`,
`Parse_Phrase_Key`, `Parse_Phrase_Pack_Summary`,
`Parse_Supported_Phrase_Locales`, `Parse_Sync_Summary`,
`Parse_Import_Summary`, `Parse_Export_Summary`,
`Parse_Validation_Summary`, `Parse_Field_Problem_Summary`,
`Parse_Selection_Summary`, `Parse_More_Count`,
`Parse_Pagination_Range`, `Parse_Collection_Display`,
`Parse_Text_Count_Summary`, `Parse_Word_Count_Summary`,
`Parse_Sentence_Count_Summary`, `Parse_Paragraph_Count_Summary`,
`Parse_Text_Time_Label`, `Parse_Reading_Time`, `Parse_Speaking_Time`,
`Parse_Text_Summary`, `Parse_Mask`, `Parse_Grouped_Token`,
`Parse_Masked_Token`, `Parse_String_Label`, `Parse_Path_Label`,
`Parse_Path_Basename`, `Parse_Path_Title`, `Parse_Extension_Label`,
`Parse_Shortened_Path`, `Parse_File_Mode_Label`, `Parse_Handle_Label`,
`Parse_Name_Label`,
`Parse_Clean_Name`, `Parse_Display_Name`, `Parse_Name_Part`,
`Parse_Initials`, `Parse_Person_Initials`, `Parse_Possessive_Label`,
`Parse_Possessive_Name`, `Parse_Email_Local_Part`,
`Parse_Safe_Filename`, `Parse_Search_Key`, `Parse_Natural_Sort_Key`,
`Parse_Identifier_Label`, `Parse_Parameterize_Label`,
`Parse_Dasherize_Label`, `Parse_Underscore_Label`,
`Parse_Camelize_Label`, `Parse_Transliteration_Label`,
`Parse_Casefold_Label`, `Parse_Escaped_HTML`, `Parse_NL_To_BR`,
`Parse_BR_To_NL`, `Parse_Normalized_Whitespace`, `Parse_Squished`,
`Parse_Stripped_Tags`, `Parse_Preserved_Separator`,
`Parse_Pluralized_Word`,
`Parse_Singularized_Word`, `Parse_Person_List`,
`Parse_Excerpt`, `Parse_Highlight`, `Parse_Highlighted_Excerpt`,
`Parse_Inflection_Source_Label`,
`Parse_Compound_Unit`, `Scan_Compound_Unit`, `Parse_Database_Throughput`,
`Scan_Database_Throughput`, `Parse_Data_Rate`, `Scan_Data_Rate`,
`Parse_Bit_Rate`, `Scan_Bit_Rate`, `Parse_Binary_Data_Rate`,
`Scan_Binary_Data_Rate`, `Parse_Memory_Bandwidth`,
`Scan_Memory_Bandwidth`, `Parse_Latency`, `Scan_Latency`, `Parse_IOPS`,
`Scan_IOPS`, `Parse_Density`, `Scan_Density`, `Parse_Acceleration`,
`Scan_Acceleration`, `Parse_Torque`, `Scan_Torque`, `Parse_Fuel_Economy`,
`Scan_Fuel_Economy`, `Parse_Flow_Rate`, `Scan_Flow_Rate`,
`Parse_Electric_Current`, `Scan_Electric_Current`, `Parse_Voltage`,
`Scan_Voltage`, `Parse_Pixel_Density`, `Scan_Pixel_Density`,
`Parse_Electric_Resistance`, `Scan_Electric_Resistance`,
`Parse_Electric_Capacitance`, `Scan_Electric_Capacitance`,
`Parse_Electric_Inductance`, `Scan_Electric_Inductance`,
`Parse_Concentration`, `Scan_Concentration`,
`Parse_Fuel_Efficiency_MPG`, `Scan_Fuel_Efficiency_MPG`,
`Parse_CPU_Load`, `Scan_CPU_Load`, `Parse_Battery`, `Scan_Battery`,
`Parse_Screen_Size`, `Scan_Screen_Size`, `Parse_Typography_Size`,
`Scan_Typography_Size`, `Parse_Audio_Level`, `Scan_Audio_Level`,
`Parse_Signal_Strength`, `Scan_Signal_Strength`,
`Parse_Storage_Endurance`, `Scan_Storage_Endurance`,
`Parse_Refresh_Rate`, `Scan_Refresh_Rate`, `Parse_Luminance`,
`Scan_Luminance`, `Parse_Print_Resolution`, and `Scan_Print_Resolution`
for Humanize-style text. Duration parsing also accepts ISO 8601 forms such as
`PT1H30M`, `P2W`, and precise fractional-second forms such as `PT1.5S`.
Natural date parsing accepts ISO calendar dates (`YYYY-MM-DD`), ordinal dates
(`YYYY-DDD`), and week dates (`YYYY-Www` / `YYYY-Www-D`); natural date-range
parsing treats bare ISO week labels as Monday-to-Monday week ranges.
Lenient duration and natural-date parsing accept English article/couple/few
quantity forms and fortnight idioms; time suffix parsing accepts approximate
noon forms such as `tomorrow around noon`, and business-calendar-aware natural
dates can resolve starts and ends of this/next/previous business month.
Cron parsing accepts five-, six-, and seven-field forms with step fields,
named weekday lists/ranges, named months, optional seconds and years, and
Quartz-style last-day, nearest-weekday, last-weekday, and nth-weekday metadata.
Parsing accepts English forms plus shipped-locale
aliases for common duration/date units, compact suffixes, frequency/rate
words, list conjunctions, and core natural-day words. Lenient duration parsing
also accepts natural approximation prefixes such as `almost 2 hours`,
`just over 3 weeks`, `a little under 1 month`, and `about half an hour`.
Natural date parsing
covers deterministic English forms such as `next friday afternoon`,
`tomorrow at 5pm`, `next month on the 3rd`, `second tuesday in march`,
`two fridays from now`, `jan 1st`, `monday the 3rd`,
`early next week`, `mid-march`, `late q2`, `end of next quarter`,
`end of fy2027`, `start of q3`, `next business day`,
`next business friday`, `in a few days`, `several business days from now`,
`3 business days from now`, `2 business days before month end`, `week 32`,
`q3 2024`, and calendar-aligned fiscal/period labels such as `fy2025 q2`,
`fy2027 h1`, `first half of 2026`, `s2 2026`, and `h2 2026`; overloads accept
`Business_Calendar_Rules` so business-day phrases honor one-off holidays,
recurring holidays, shutdown periods, and configured open weekdays.
Business-calendar parsing covers deterministic phrases such as
`holiday 2026-07-06`, `recurring holiday
december 25`, `half-day 2026-12-24 until 12`,
`shutdown 2026-12-24 to 2026-12-31`, `business hours monday 9-17`, and
`next open business hour`; rule parsing turns semicolon or newline separated
calendar phrases into executable `Humanize.Durations.Business_Calendar_Rules`.
Detailed recurrence parsing covers deterministic forms such as
`every other Tuesday`, `every weekday at 09:00`,
`first Monday of each month`, `last business day`,
`every 2 weeks until 2026-12-31`, and recurrence phrases with `from`,
`until`, `for N times`, `between HH:MM and HH:MM`, and `except Friday`
clauses. Cron schedule parsing covers common forms such as `* * * * *`,
`0 9 * * *`, `0 9 * * 1-5`, `30 8 15 * *`, `0 0 9 L * ?`,
`0 0 9 15W * ?`, `0 0 9 ? * MON#2`, and
`30 15 8 15 JAN ? 2027` as structured recurrence metadata.
`Normalize_Number_Text`, `Normalize_Unit_Text`, and `Normalize_List_Text`
prepare common user-facing input variants before parsing.
Parse results report status, value/count, exactness, consumed character count,
an error position for parser failures where available, and a stable
`Parse_Error_Kind` diagnostic category when the parser can identify the
failure. `Diagnostic` maps status/error-position pairs into fallback
categories, and its three-argument overload preserves parser-supplied
diagnostics;
`Diagnostic_Label` and `Diagnostic_Message` expose deterministic user-facing
diagnostic text. These APIs parse deterministic unit suffixes, aliases, and
separators; they do not inspect private `i18n` locale data.
Operational parser symmetry covers payment lifecycle, incident, release,
feature-flag, backup, quota, API key, webhook, audit, invoice, and
database phrase output with domain/state metadata. Field-change summary parsing
covers deterministic aggregate text such as `4 fields: 2 changed, 1 added, 1 removed`.

`Humanize.Styles` provides compact, verbose, technical, casual, screen-reader,
CLI, log, dashboard, accessibility, telemetry, and mobile option presets across
number, byte, datetime, calendar-date, range, list, and unit-style APIs.
Focused calendar-date presets cover compact badges, fiscal half/year-end,
academic semester, and early/mid/late month or quarter labels.
Override helpers let callers derive option records from a preset without
copying every field, including number fraction digits, byte fraction
digits/unit system, datetime thresholds, range separators, list Oxford-comma
policy, calendar-date style/fiscal-year start, and unit style.

`Humanize.Phrases` provides deterministic UI status phrases such as loading,
saving, saved, failed, overdue, last seen, and updated just now, plus auth,
billing, workflow, queue, file, validation, empty-state, network, security,
deployment, health, notification, form, access, sync, transfer, search,
collaboration, issue, task, CI/CD, support-ticket, payment lifecycle, backup,
incident, release, audit, feature-flag, webhook, API-key, quota, invoice,
database/storage, and
permission phrases. Phrase enum packs have Humanize-owned text for the shipped
locale prefixes reported by `Supported_Phrase_Locales`, with hand-written
English/German/French text, reviewed native-orthography Latin text for the
reviewed Latin catalog prefixes, and reviewed native-script text for the
remaining shipped native-script prefixes. It also provides generic operational
summaries for
queue/job/run/cache/sync/import/export counts, states, and failure totals.
Backup, incident, release, audit, feature-flag, webhook, API-key, quota,
invoice/refund, and database phrase packs expose text, bounded rendering,
stable phrase keys where defined, and severity metadata. Field-change helpers
summarize single-field diffs as
well as aggregate changed/added/removed counts.
File-size, civil-date, absolute-number, and relative-percent comparison
summaries compose existing Humanize byte, datetime, and number formatting with
deterministic comparison wording.
Phrase helpers are Humanize-owned convenience text.
Severity helpers and phrase-locale metadata expose stable metadata for shipped
status packs without exposing private `i18n` catalog or plural-rule behavior.

## Catalog Contract

Built-in catalog fragments define only `humanize.*` keys. The shipped reviewed
native or native-orthography locales are:

```text
en da de fr es it pt nl sv no nb fi pl cs tr ro lt sl id ms eo vi sw af hu sk ru uk ja ko zh ar hi
```

Region-tagged contexts such as `sv-SE`, `nb-NO`, `ja-JP`, and `ar-EG` resolve
through `i18n` locale fallback to those base fragments.

Native-script fragments avoid Latin fallback for the core Humanize date,
duration, compact-number, unit, frequency, rate, and list words, with long-form
wording for the broad engineering-unit tail.

Every non-`No_Message` `Message_Id` must resolve in every shipped locale after
`Humanize.Catalogs.Load_Defaults`.

Catalog strings are in source constants and are loaded through the public
`I18N.Runtime.Load_Text` API. Humanize does not parse catalog messages itself and
does not inspect private `i18n` structures.
`Humanize.Catalogs.Load_Defaults` defaults to `Reject_Duplicates`; a rejected
duplicate load is non-destructive, and callers can explicitly pass `Keep_First`
or `Override_Previous` through to the underlying `i18n` loader.

## Verification Contract

The release checker `check_humanize` is maintainer tooling only. It may depend
on `../project_tools`; the Humanize library, tests, and examples must not.

The release checker verifies:

* development and release manifest dependency policy;
* local-pin isolation between `alire.toml`, `alire.release.toml`, and
  `alire.build.toml`;
* required files and documentation references;
* AUnit registration/assertion coverage thresholds;
* generated-artifact hygiene;
* Humanize/tooling and Humanize/i18n import boundaries;
* public GNATdoc tags for public specs;
* example-main source and documentation inventory;
* library build, test build, AUnit execution, example build, `alr test`, and
  GNATdoc generation;
* empty compiler `.stderr` logs after the release build.

## Non-Goals

Humanize 0.5.0 intentionally does not provide:

* a time zone database;
* arbitrary CLDR import at application runtime;
* full CLDR currency-formatting engines; Humanize only provides deterministic
  currency phrases around caller-supplied codes or symbols;
* application-defined runtime classifier plugins.
