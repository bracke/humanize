# Humanize Task Guide

This guide groups the public API by task. The detailed contract remains in
`docs/specification.md`.

## Formatting through an application runtime

Load the built-in catalog into an application-owned `I18N.Runtime.Instance` with
`Humanize.Catalogs.Load_Defaults`, then create contexts with
`Humanize.Contexts.Create`. Use those contexts with packages such as
`Humanize.Durations`, `Humanize.Bytes`, `Humanize.Numbers`, `Humanize.Units`,
`Humanize.Lists`, `Humanize.Frequencies`, and `Humanize.Rates`.

## Rendering without allocation

Use `_Into` procedures when output must go into a caller-owned fixed buffer.
The bounded API reports how many characters were copied in `Written` and returns
`Humanize.Status.Buffer_Overflow` when the buffer is too small. This is the
preferred shape for logging, embedded callers, and terminal/status-line output.

## Parsing untrusted human input

Use `Humanize.Parsing` when accepting text from logs, CLI flags, scraped labels,
or previously rendered Humanize output. Parse results expose `Status`,
`Consumed`, and diagnostic fields. Prefer `Parse_*` when the whole input should
be consumed and `Scan_*` when a valid prefix is enough.

## Auditing locale coverage

Use `Humanize.Locales.Shipped_Locales`,
`Humanize.Locales.Regional_Shipped_Locales`, and
`Humanize.Locales.All_Shipped_Locales` for coverage tooling. The release guard
can run the task-level locale audit with `./bin/check_humanize --locale-audit`
from the `check_humanize` directory.
For focused checks after touching one catalog or generated locale table, build
the test tools and run `./bin/locale_audit --summary`,
`./bin/locale_audit --failures-only`, or
`./bin/locale_audit --locale da --summary` from the `tests` directory.

## Checking release readiness

Run `check_humanize` for the full guard and `check_humanize --policy-only` for
source-policy changes. The guard covers manifest state, public documentation,
generated-data provenance, public API surface expectations, parser smoke tests,
the `perf_smoke` executable, tooling boundaries, examples, and staged release
checks.
Public API changes should update `docs/PUBLIC_API.toml`; example-surface changes
should update `docs/EXAMPLE_COVERAGE.toml`; performance smoke changes should
update `docs/PERFORMANCE_BASELINE.toml`.
Use `docs/PACKAGE_GUIDE.md` when choosing imports for new code. Use
`tests/src/perf_baseline_report.adb` only for optional local trend reporting;
release checks keep using the looser `perf_smoke` gate.
