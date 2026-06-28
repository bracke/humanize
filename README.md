# Humanize

`humanize` is an Ada 2022 Alire library that turns machine values into
human-readable, localized text:

* relative date/times (`now`, `yesterday`, `4 hours ago`, `in 3 days`);
* simple durations (`90 seconds` → `1 minute`);
* byte sizes (`1536` → `1.5 KiB`, decimal or binary).

Humanize selects a semantic message key and arguments, then renders through the
public [`i18n`](../i18n) runtime. It owns the formatting *policy*; `i18n` owns
locale fallback, ICU-subset rendering, and plural mechanics. The dependency
direction is one-way:

```text
Humanize -> I18N
```

English and Danish catalog fragments ship built in.

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
| `Humanize.Datetimes` | `Relative` / `Relative_Into`. |
| `Humanize.Durations` | `Format` / `Format_Into`. |
| `Humanize.Bytes` | `Format` / `Format_Into`. |

Every formatter offers a convenience form returning `Humanize.Status.Text_Result`
and a bounded form (`*_Into`) writing into a caller-owned 1-based `String`.

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
