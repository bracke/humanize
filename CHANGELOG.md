# Changelog

## Unreleased

* **`Humanize.Datetimes.Calendar_Clock_Label`**: a modified-time label from
  CLDR in every locale -- the day's name and the time today, yesterday and
  tomorrow ("today 2:30 PM", "gestern 09:05"), the weekday within a week
  ("Tuesday 6:00 PM"), the localized date beyond ("Feb 1, 2026 8:00 AM",
  "01.02.2026 08:00"), the time in the region's own hour cycle.
* **`Calendar_Relative_Label` outside English is CLDR's**: named days,
  "letzten Dienstag" / "先週の月曜日" within the weekday window, the localized
  date beyond it (not ISO), and the clock time when asked. English keeps its
  idioms (tonight, later today, this weekend), which CLDR has no form for.
* **Relative times, now/today/yesterday/tomorrow and the duration units come
  from CLDR**, in every locale CLDR covers rather than in 33 hand-kept
  catalogs. Each is one locale-neutral `und` entry ("{past_count, relative,
  hour}", "{value, unit, hour/unit-width-long}") that messages renders in the
  requested locale, and the 22 keys' hand translations are gone from every
  catalog fragment. This fixes the accentless Vietnamese, Hungarian and
  Slovak text ("2 gio truoc" is "2 giờ trước"), Arabic word order and duals
  ("قبل ساعتين", "ساعتان"), and Slovenian, Lithuanian and Czech plural
  forms, and uses CLDR's named offsets ("gestern", "í gær"). Output changes
  where CLDR differs from the old wording: French and German no-break spaces,
  Swedish "dygn", "för 2 timmar sedan", Japanese and Chinese spacing.
* **The parser reads CLDR's wording back.** A new
  `Humanize.Parsing.Implementation.CLDR_Vocabulary` learns the shipped
  locales' CLDR unit names, number-less forms and relative patterns from
  i18n (the only unit allowed to import `I18N.Unit_Format` and
  `I18N.Relative_Format`), after the hand tables for units and before them
  for relative text. No-break spaces are read as spaces, a unit written
  before its number ("sekunde 2") is turned round, and Arabic duals are
  given their count. Malay's "saat" (second) is Turkish's hour, which a
  locale-free parser cannot tell apart; that round trip is a known gap.

## 0.5.0

* Fractional unit quantities ("1.5 kilometers"), with CLDR fractional plural
  agreement — French renders "1,5 kilomètre" (singular), English
  "1.5 kilometers". Requires i18n >= 1.1 (fractional plural operands).
* Long-form compact numbers ("1.2 million", French "2,5 millions") via a
  `Compact` `Style` parameter, with plural agreement on the scale word.
* `Humanize.Numbers.Percent` ("50%", French "50 %").
* Added Portuguese (`pt`); shipped locales are now `en`, `da`, `de`, `fr`, `es`,
  `it`, `pt`.
* Added metric units: centimeter, millimeter, milligram, milliliter.

## 0.4.0

* Added `Humanize.Units` — unit-quantity humanization ("5 kilometers",
  "1 kilogram") for meter/kilometer/gram/kilogram/liter, with convenience and
  bounded APIs.
* Added Spanish (`es`) and Italian (`it`) catalog fragments; shipped locales are
  now `en`, `da`, `de`, `fr`, `es`, `it`.
* Count integers are now locale-grouped (`1234 days` → `1,234 days` /
  `1.234 days` / `1 234 jours`), matching the v0.3 value formatting.
* Compact numbers now promote the tier when rounding overflows (`999_999` →
  `1M` instead of `1000K`).
* Ordinals gained a `Gender` parameter with feminine forms for Romance locales
  (French `1re`, Spanish `1.a`, Italian `1a`).

## 0.3.0

* Locale-aware numeric formatting: `{value}` arguments now use each locale's
  decimal separator and digit grouping (`de`/`da` comma decimal + `.` grouping,
  `fr` comma decimal + space grouping). German bytes now render `1,5 KiB`.
* Added a French (`fr`) catalog fragment; shipped locales are now `en`, `da`,
  `de`, `fr`.
* Multi-unit durations now join the final component with the locale conjunction
  ("and"/"og"/"und"/"et"), e.g. "1 hour, 1 minute and 1 second".

## 0.2.0

* Added `Humanize.Numbers` with `Ordinal` (locale-aware, via i18n
  selectordinal) and `Compact` ("1.2K", "1.5M", localized suffixes).
* Added multi-unit duration rendering: `Humanize.Durations.Format_Components`
  (e.g. "1 hour, 30 minutes") with a bounded form.
* Added a civil-component datetime API: `Humanize.Datetimes.Relative_Civil`
  and `Relative_Civil_Into` (impossible dates yield `Invalid_Value`).
* Added a German (`de`) catalog fragment; shipped locales are now `en`, `da`,
  `de`.
* Expanded the AUnit suite and closed test gaps (future seconds/hours,
  `Runtime_Error` mapping, value-argument flow, no-localized-strings classifier
  scan).
* Added a GitHub Actions workflow that runs the `check_humanize` release guard.

## 0.1.0

* Initial release: relative datetime, single-unit duration, and binary/decimal
  byte-size humanization rendered through the public `i18n` runtime.
* English and Danish catalog fragments; convenience and bounded APIs for every
  formatter; a `project_tools`-based release guard (`check_humanize`).
