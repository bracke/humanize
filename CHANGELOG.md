# Changelog

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
