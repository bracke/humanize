# Humanize Quality Guards

This document maps non-structural quality expectations to executable guards.
Humanize keeps these in the repository because most of them protect behavior
that can regress without changing the public type shape.

## Parser/property test expansion

Parser behavior is guarded by `tests/src/humanize-tests-parsing.adb`.
`Test_Round_Trip_Parsers`, `Test_Localized_Render_Parse_Roundtrips`, and
`Test_Localized_Semantic_Parse_Roundtrips` verify rendered text can be parsed
back for representative deterministic, locale-rendered, and semantic outputs.
`Test_Parser_Malformed_Input_Matrix` checks representative malformed inputs
return non-OK statuses and stable diagnostic categories instead of silently
accepting partial nonsense. This matters for applications that accept logs,
CLI text, metric labels, or localized UI output and need predictable recovery.

## Performance/size baseline smoke checks

Humanize does not keep timing thresholds in the unit suite because they are
host-sensitive. Instead, `Test_Parser_Smoke_Baseline` repeatedly exercises the
common parser paths and verifies stable consumed lengths. The release checker
also builds and runs `tests/src/perf_smoke.adb` as `./bin/perf_smoke`, a loose
runtime smoke check for common format/parse/text/domain paths with a high enough
time limit to catch accidental pathological slowdowns without making normal
developer machines fail on noise. The same policy rejects generated Python artifacts and
source-root build artifacts so source and package size do not drift through
accidental generated output.
`docs/PERFORMANCE_BASELINE.toml` records the iteration count, loose time limit,
and public operations covered by that smoke executable, including the expanded
text and domain buckets; `check_humanize` validates that the file stays
synchronized with the executable constants.
`tests/src/perf_baseline_report.adb` is an optional local trend reporter for
developers who want per-operation timing output without tightening release
thresholds.

## API consistency checks

`tests/src/humanize-tests-architecture.adb` contains
`Test_Public_API_Consistency`, which compares owned `Text_Result` functions
with their bounded `_Into` variants for representative catalog-rendered and
deterministic APIs. Capability metadata is also checked so bounded, parse, and
scan coverage cannot silently drop below the declared public support matrix.

## Task-oriented docs/examples

`docs/TASK_GUIDE.md`, `examples/README.md`, and `examples/EXPECTED_OUTPUT.md`
describe common use cases: formatting through an application-owned i18n
runtime, rendering into caller-owned buffers, parsing untrusted human input,
and auditing locale coverage. `check_humanize` requires those files and checks
for specific task headings so they stay discoverable.
`docs/EXAMPLE_COVERAGE.toml` maps major public task areas to runnable examples
so new public API families do not silently ship without an example or an
intentional coverage entry.

## Generated-data provenance/currentness checks

Large table bodies carry a `Provenance:` comment at the top of the package
body. `check_humanize` enforces these markers for catalog fragments, unit
catalog data, native catalog data, spellout tables, schedule metadata, locale
inventory, and phrase-locale metadata. `docs/GENERATED_DATA.toml` is the
machine-readable companion manifest for those generated or table-heavy files;
it records the source, owner, coverage, currentness expectation, and required
marker for each artifact. It also records line-count and SHA-256 snapshots so
reviewers can spot accidental generated-data churn; SHA-256 verification is
implemented in the tooling with `CryptoLib.Hashes` from `../cryptolib`. The marker is deliberately
human-readable: it tells
maintainers whether the source is Humanize-owned, generated from a Humanize
template, or delegated to another Humanize metadata package.
When the reviewed generated data changes intentionally, maintainers can run
`./check_humanize/bin/check_humanize --print-generated-data-manifest` to print a
refreshed manifest with current line-count and SHA-256 snapshots, then review
the resulting metadata before updating `docs/GENERATED_DATA.toml`.

## Humanize-side locale coverage audit

Fast locale invariants live in `Test_Locale_Coverage`: every message key is
available for every tag in `Humanize.Locales.All_Shipped_Locales`, locale lists
have stable order and no duplicates, regional tags have shipped base locales,
and phrase locale metadata remains a subset of shipped locale metadata.
The slower task-level audit is `tests/src/locale_audit.adb`, run through:

```sh
cd check_humanize
./bin/check_humanize --locale-audit
```

That executable renders durations, bytes, compact numbers, units, rates, lists,
natural dates, deterministic schedules, and spellout examples for each shipped
base locale and applies native-script/currentness checks.
For focused local work, the audit executable also supports `--summary`,
`--failures-only`, and `--locale TAG`, so maintainers can check a single locale
or get compact CI-friendly output without changing the underlying coverage.

## Public API surface guardrail

`docs/API_SURFACE.md` records the intended public package surface and the
`Text_Result/_Into pairing` convention. `docs/PUBLIC_API.toml` is the
machine-readable allowlist for public specs, `docs/PUBLIC_API_INDEX.md` is the
manifest-derived public package index, and `docs/PUBLIC_API_COVERAGE.toml` is
the public API coverage scorecard. `humanize.gpr` exposes that surface through
`Library_Interface`. `check_humanize` validates the manifest against the project
file, the source specs, the public API index, the coverage scorecard, and the
prose snapshot; it also requires the representative API consistency test and
keeps the existing GNATdoc policy over the curated public spec list. Adding or
removing public packages should update the surface snapshot,
`docs/PUBLIC_API.toml`, `docs/PUBLIC_API_INDEX.md`,
`docs/PUBLIC_API_COVERAGE.toml`, and the release notes in the same change.

## Domain package consistency

Public domain packages must expose owned `Text_Result` labels, bounded `_Into`
forms, tests, docs, and runnable examples for their representative package
families. `check_humanize` audits the public domain spec set and
`docs/EXAMPLE_COVERAGE.toml` so large product/UI/operations/security/data
families do not silently drift away from the common Humanize API shape.

## Structural baselines

`docs/STRUCTURAL_BASELINE.toml` records size budgets and separate-body
inventories for the largest compatibility backends. `check_humanize` validates
that large support bodies stay within their reviewed budgets and keep their
subunit split counts. The same policy pass validates public/private API
consistency, focused downstream public API consumers, and the short
`docs/PACKAGE_GUIDE.md` import map.
