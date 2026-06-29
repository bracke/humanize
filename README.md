# Humanize

`humanize` is an Ada 2022 Alire library that turns machine values into
human-readable, localized text:

* relative date/times (`now`, `yesterday`, `4 hours ago`, `in 3 days`);
* durations (`90 seconds` → `1 minute`; multi-unit `1 hour, 30 minutes`);
* byte sizes (`1536` → `1.5 KiB`, decimal or binary);
* ordinals (`21` → `21st`, with feminine forms), compact numbers (`1200` → `1.2K` or `1.2 thousand`), and percentages (`50` → `50%`);
* unit quantities, whole or fractional (`5` + `Kilometer` → `5 kilometers`; `1.5` → `1.5 kilometers`, French `1,5 kilomètre`).

Seven catalog fragments ship built in — English, Danish, German, French,
Spanish, Italian, and Portuguese — with locale-aware decimal and grouping
symbols (`1536` → `1,5 KiB` in `de`/`da`/`fr`/`es`/`it`/`pt`), locale-grouped
counts (`1234` → `1,234`), and CLDR fractional plural agreement.

Humanize selects a semantic message key and arguments, then renders through the
public [`i18n`](../i18n) runtime. It owns the formatting *policy*; `i18n` owns
locale fallback, ICU-subset rendering, and plural mechanics. The dependency
direction is one-way:

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
| `Humanize.Catalogs` | `Load_Defaults` loads the built-in en/da fragments. |
| `Humanize.Datetimes` | `Relative` / `Relative_Into`, plus a civil-component (`Relative_Civil`) convenience API. |
| `Humanize.Durations` | `Format` / `Format_Into` (single unit) and `Format_Components` (multi-unit). |
| `Humanize.Bytes` | `Format` / `Format_Into`. |
| `Humanize.Numbers` | `Ordinal` (with `Gender`), `Compact` (Short/Long style), and `Percent`, with bounded forms. |
| `Humanize.Units` | `Format` for unit quantities (length/mass/volume), whole or fractional. |

Every formatter offers a convenience form returning `Humanize.Status.Text_Result`
and a bounded form (`*_Into`) writing into a caller-owned 1-based `String`.

Shipped locales: English (`en`), Danish (`da`), German (`de`), French (`fr`),
Spanish (`es`), Italian (`it`), Portuguese (`pt`). Numeric values and counts use
each locale's decimal and grouping symbols; fractional quantities agree in number
via CLDR fractional plural operands (French `1,5 kilomètre`, English
`1.5 kilometers`). Ordinal and plural correctness is delegated to `i18n`'s rules.

## Non-goals

By design (these belong in other libraries or a later major version):

* a time zone database — civil components are interpreted in the local zone via `Ada.Calendar`;
* importing arbitrary CLDR data at runtime — catalog fragments are built in for the shipped locales;
* currency and scientific-notation number formatting;
* runtime rule plugins or application-defined domain classifiers.

Rule selection, catalog construction, and the i18n boundary
(`Humanize.I18N_Rendering`) are private. The architectural boundary and the
v0.1 contract are specified in [`docs/specification.md`](docs/specification.md).

## Build and test

```sh
alr build
cd tests && alr build && ./bin/tests
```

## Release verification

Maintainers run the `project_tools`-based release guard and the commands in
[`docs/RELEASE_VERIFICATION.md`](docs/RELEASE_VERIFICATION.md):

```sh
cd check_humanize && alr build && ./bin/check_humanize
```

## License

Dual-licensed under `MIT OR Apache-2.0 WITH LLVM-exception`. See [`LICENSE`](LICENSE).
