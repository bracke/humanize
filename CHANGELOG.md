# Changelog

## Unreleased

* The rest of `Calendar_Date_Label`'s presets and `Calendar_Range_Label`
  speak the locale outside English: fiscal years, quarters and halves,
  semesters, early/mid/late phases ("Anfang Oktober 2026"), month-day and
  compact badges (CLDR), "diese Woche", "Woche vom …" and date spans. 18
  phrase keys, translated.

* `Calendar_Date_Label`'s short, medium, long, weekday, month-year and
  quarter presets are CLDR's dates outside English ("09.10.26", "Freitag,
  9. Oktober 2026", "2026年10月"), where they were US order with mixed
  English ("10/09/2026", "Friday, Oktober 9, 2026"). English keeps its own.

* **`Humanize.Cross_Domain.Localized`**: validation problems, constraints and
  choices, network diagnostics, progress, collection statistics and the most
  frequent value in every shipped locale (40 phrase keys, translated), with
  bounded `_Into` forms.

* `Parsing.Localized.Parse_Measure` reads the 14 `Humanize.Units` families
  back at any scale the formatter picks (affine units such as Fahrenheit
  fitted from two samples), and `Parse_Date` reads `Calendar_Date_Label`'s
  ISO/short/medium/long dates and `Natural_Day`'s words; both round-trip in
  34 locales.

* **The caller's noun has a gender.** `With_Noun_Forms (..., Gender =>
  "feminine")` reaches every phrase that takes the noun as `{gender}`, and
  languages with grammatical gender agree with it (French "aucune ligne ne
  correspond", Swedish "tillgängligt", Spanish "seleccionadas", Hindi verb
  forms, Arabic adjectives); without a gender the wording is unchanged.
* `Durations.Formatting.Throughput_Remaining (Context, Remaining, Rate,
  Singular, Plural)` gives the remaining count its plural and the
  registered noun forms ("noch 5 Dateien"); the singular-only form is kept.
* `Parsing.Localized` learns again after humanize loads catalogs into a
  runtime, and no longer raises reading in a runtime with nothing loaded.

* **Translation review.** An independent second pass over every locale
  fixed 115 phrases: agreement and case (Afrikaans double negation,
  Slovenian "dnevi", Arabic accusative after 11-99), wrong meanings (Swedish
  "ohälsosam", Slovenian "nevarno", Turkish "bekleniyor", Korean "주요"),
  inconsistent terms across keys, and no-break spaces before "%" where CLDR
  has them. Open questions are notes on the review page.

* **`Humanize.Parsing.Localized`** reads numbers, durations, relative times
  and byte sizes back in the locale that wrote them, by what the localized
  formatters write: round-trips in 36 locales (Arabic number-less duals,
  Swahili unit-first order, native digits and separators included).
  `Humanize.Parsing.Locale_Digits` now holds the digit normalization phrase
  reading used.

* **System status speaks the locale.** `Humanize.System_Status.Localized`
  has context-taking forms of the state labels of all six families, the
  name frames, the component/check/incident counts, uptime, latency,
  maintenance window and last-checked labels, HTTP status classes and process
  exit labels: 55 phrase keys, translated into every shipped locale.

* **Locative and instrumental noun forms.** `With_Noun_Forms` takes
  `Locative_One/Other` and `Instrumental_One/Other`; Slovak and Slovenian
  "matches in all N files" use the locative ("zhoda pri všetkých 5
  súboroch").
* A phrase selection holds 32 arguments (was 16, and the 17th was dropped
  without a word, which broke availability phrases once the noun had 14
  forms); a repeated name replaces its value, and overflowing raises.
* The phrase review data covers en-CA, de-LI, fr-CH, fr-BE and zh-HK.

* Regional overrides for en-CA ("cancelled"), fr-CH and fr-BE ("jours
  ouvrables") and zh-Hant-HK (今日, 上載, 每星期), which zh-HK and zh-MO now
  reach; en-001 gains the British spelling of the operation and summary
  "canceled" labels.

* **Operations, availability and frequency speak the locale.**
  `Humanize.Operations` (state label, progress and unknown-total summaries,
  last success, next retry, stale run) and `Resources.Availability_Label`
  gain context-taking overloads; `Frequencies.Times` with a noun and
  `Numbers.Ratio_Per` localize their wording and nouns. 22 new phrase keys,
  translated into every shipped locale.
* Number comparisons decline the caller's noun in the case their frame
  governs (Polish "o 5 plików więcej", Russian "на 5 файлов больше").
* British spellings moved to `en-001`, which en-GB, en-AU, en-IN and the
  other Commonwealth variants reach; `de-LI` writes ss like `de-CH`.
* Czech/Slovak "none" labels are gender-free; Arabic counts take the
  singular for 100 and up.
* Phrase reading tries 2 among the unshown counts ("twice") and compares a
  rendering in the locale's own digits normalized.

* `Humanize.Parsing.Phrases.Phrase_Count` / `Phrase_Name` list every phrase;
  `examples/phrase_review_data` writes the phrase review page's data from the
  catalogs and `docs/phrase_notes.tsv`.

* **Case forms of the caller's noun.** `With_Noun_Forms` takes
  `Genitive_One/Other` and `Accusative_One/Other`; Polish, Czech, Slovak,
  Slovenian, Russian, Ukrainian and Lithuanian phrases use them ("z 5
  plików", "выбрано 2 из 5 файлов") and take the nominative plural as the
  plural, one convention throughout (table in `docs/PHRASE_TEMPLATES.md`).
  Plain counts follow the same convention per language.
* Regional overrides for fr-CA, de-CH and en-GB; a regional English entry
  replaces the formatter's own English ("cancelled").
* Translation fixes: weak labels in pl, sl, cs, sk, ro, tr, sw and fi; the
  Slovenian recurrence for 101, 201, ....
* Fractions: Japanese "四分の三", Chinese "四分之三", Korean "사분의 삼" (the
  denominator particle was wrong), and figures ("3/7") instead of English
  "over" where a locale has no denominator word.

* Phrase reading accepts the locale's own digits and grouping ("Seite 1.234
  von 5.000", Arabic-Indic digits), learnt from how the locale writes
  1234567890, and tries the numbers in the order the phrase shows its
  arguments first.
* A test reads every English formatter's output back through its `en`
  template, so code and catalog English cannot drift apart.

* **`Humanize.Parsing.Phrases` reads phrases back in every shipped locale**
  ("Seite 3 von 5", a translated status label) by the catalog that wrote
  them: `Parse` for one phrase, `Parse_Any` to identify one under a prefix
  ("backup."). A reading is one that renders the text exactly. English reads
  through `en` phrase templates, now in the catalog.
* `Humanize.Selections.Max_Named` is 16 (was 8).

* **Regional phrase variants**: Traditional Chinese (zh-TW, zh-HK through
  CLDR's likely script), European Portuguese and Latin-American Spanish
  overrides; they load with their language.
* **`Load_Phrases (Runtime, Result, Locale)`** adds one more language's phrases
  to a runtime holding the defaults, for applications that switch language.

* **Registered noun forms reach the plain counts too.** `Lists.Count` and
  `Counted_Noun` outside English, and `Unit_Change`'s noun, take the locale's
  plural category with the forms registered on the context (Polish "5
  plików", "22 pliki"; Russian 21 the singular).
* **Date comparisons in the governed case**: Polish "o 2 lata później",
  Russian "на 2 года 3 месяца позже", Lithuanian "2 metais vėliau".

* **Every status phrase family goes through the phrase catalog.** UI, file,
  validation, network, auth, billing, workflow, queue, CI, ticket, payment,
  database and the other domain statuses (162 labels) render through
  `humanize.phrase.<domain>.<status>` keys in all 32 locales. They replace the
  older word-by-word generated packs, which covered 21 locales and dropped
  diacritics ("bald fallig"). `Phrase_Locales` now lists all 33 shipped
  locales; `Generated_Phrase_Locales` the 32 whose phrases come from the
  catalog. The feature-flag phrase keys are `flag.*`, as `Feature_Flag_Key`
  names them.
* **Nouns with more than two forms.** `Humanize.Contexts.With_Noun_Forms`
  registers a noun's zero/two/few/many forms; phrases in languages with those
  categories use them (Polish "5 plików"). `docs/PHRASE_TEMPLATES.md` lists what
  to pass per language.
* **Date differences in the case their frame governs**: German "in 2 Jahren",
  "vor 2 Jahren", Russian "через 1 неделю", Czech "před 2 lety", from CLDR's
  case forms.
* **`Load_Defaults (Runtime, Result, Locale)`** loads the phrase translations
  of one language only: 16 MB and 10 ms instead of 46 MB and 50 ms for all.
* Measurement phrases fall back to English whole when CLDR cannot render the
  measure.

* **Phrase formatters speak every shipped locale.** List, pagination,
  progress, business-time, due-date, status, summary, comparison and
  measurement phrases render through `humanize.phrase.<name>` catalog keys
  outside English; English keeps its own wording. 128 phrases are
  translated into the 32 shipped non-English locales
  (`Humanize.Catalogs.Phrase_Data`, one subunit per locale).
  `docs/PHRASE_TEMPLATES.md` lists each key's arguments and English.
  - Calendar differences and relations ("2 Jahre, 3 Monate und 2 Tage",
    "letzte Woche") come from CLDR's units, unit list and relative names in
    every locale.
  - The caller's singular/plural nouns are only two forms, so languages
    with more number forms (Polish "5 plików") use label shapes or the
    plural form; frames around a rendered difference take its nominative
    (Russian "через 1 неделя").
  - Loading the default catalogs costs about 15 ms and 16 MB more.

* **Number words and currency amounts outside English come from CLDR.**
  - `Locale_Cardinal`, `Ordinal_Words` and `Decimal_Words` spell by CLDR's
    rules. The hand tables matched ICU in only 60% of cases (Finnish
    "kolmesataa", Swedish word breaks, Danish "tusind"). Ordinals keep
    humanize's own words where CLDR has no rules (Czech).
  - `Percent_Words` puts the words inside CLDR's percent unit ("yüzde ...")
    instead of appending "percent".
  - `Currency` formats by the locale's currency pattern and symbol ("1.234,50
    €", "€1.234,50" in Turkish) for every code i18n knows, and keeps
    "12.50 USD" in English.
* **The parser reads CLDR's spelled-out numbers back** in the shipped
  locales (cardinals and ordinals, soft hyphens included), through
  `I18N.Spellout.Parse` in the CLDR vocabulary. For non-ASCII text the CLDR
  reading comes before the hand vocabulary.

* **Measurements, spelled-out numbers, counts and compact durations outside
  English come from CLDR.** These formatters ignored their context and wrote
  English. Outside English they now render through locale-neutral entries;
  English keeps its own output.
  - Units use CLDR's unit and per pattern ("25 Мбит/c", "٣٫٣ فولت",
    "12,5 N⋅m", 34 units). SI symbols CLDR has no unit for (kV, kΩ, nF, dB)
    follow the locale's number.
  - `Spellout.Cardinal` / `Signed_Cardinal` use CLDR's rules ("минус сорок
    два").
  - `Lists.Count` / `Counted_Noun` use the locale's digits, and its plural
    category picks the caller's noun (Russian 21 takes the singular).
  - `Format_Compact` uses CLDR's narrow units and narrow unit list ("1 ч 30
    мин", "1h30m", "١ س و٣٠ د").
  - Phrase formatters whose wording CLDR has no form for stay English.
* The staged release check reads i18n's data from the pinned checkout, as a
  consumer ships it; outside the workspace the CLDR-backed entries found no
  data and every formatter came back empty.

* **Decimal byte sizes use CLDR's unit names** -- "4,5 Mo" in French,
  "2 кБ" in Russian, "٤٫٥ م.ب" in Arabic, "1바이트" in Korean -- through
  locale-neutral entries, so every CLDR locale has them (an unshipped one
  such as Icelandic rendered nothing). The binary KiB family, which CLDR does
  not name, keeps its per-locale entries. The byte parser reads CLDR's names
  back, no-break spaces included, and a unit before its number ("baiti 1").
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
