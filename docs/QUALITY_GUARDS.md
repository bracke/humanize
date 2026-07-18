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
text and domain buckets. Its `[perf_smoke.public_api_units]` section maps
representative public API units to smoke paths used by the per-unit coverage
scorecard; `check_humanize` validates that the file stays synchronized with the
executable constants and required public API coverage mappings.
`docs/PERFORMANCE_EXEMPTION_BUDGETS.toml` records category ratchets for public
API units that are intentionally exempt from direct performance-smoke mappings;
new exemption categories or count increases must be reviewed in that manifest.
`docs/POLICY_THRESHOLDS.toml` also owns generated-data shard caps, including
`generated_data_max_shard_lines`, so generated table shard growth is reviewed
as policy data rather than hidden in checker code.
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
`docs/POLICY_REQUIREMENTS.toml` is the machine-readable source for the
top-level release-surface file inventory and required documentation text
snippets, keeping those policy lists out of the checker implementation.
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
Generated spellout tables are split into package-body subunits once an
individual table body dominates review churn. The parent body keeps shared
helpers and stable private-package entry points, while each generated shard is
listed separately in `docs/GENERATED_DATA.toml` with its own line-count and
SHA-256 snapshot.
Reviewed native catalog fragments use the same strategy: the parent native-data
body keeps shared catalog helpers and composes locale-family shards that are
tracked as separate generated-data artifacts.
When the reviewed generated data changes intentionally, maintainers can run
`./check_humanize/bin/check_humanize --print-generated-data-manifest` to print a
refreshed manifest with current line-count and SHA-256 snapshots, then review
the resulting metadata before updating `docs/GENERATED_DATA.toml`.

## Generated documentation command index

`docs/GENERATED_DOCS.toml` records every generated-maintained documentation
artifact, the `check_humanize` command that refreshes it, the maintainer owner,
and the source metadata used by the generator. `check_humanize` validates that
each listed artifact exists and that every refresh command is still exposed by
the checker, so new generated docs cannot be added without a discoverable
refresh path.

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
manifest-derived public package index, `docs/PUBLIC_API_CLASSES.toml` is the
manifest-derived public package classification map,
`docs/PUBLIC_API_COVERAGE.toml` is the area-level public API coverage
scorecard, and
`docs/PUBLIC_API_UNIT_COVERAGE.toml` is the per-unit coverage scorecard.
`docs/PUBLIC_FACADE_BUDGETS.toml` records target line ratchets, hard line and
byte budgets, plus child-package expectations for the largest root
compatibility facades, so new API families prefer focused child packages
instead of silently growing `Humanize.Parsing`, `Humanize.Strings`,
`Humanize.Durations`, `Humanize.Phrases`, or `Humanize.Numbers`. The same
manifest marks whether a child facade map is required, lists the exact child
packages that must appear in each required map, and records the exact set and
order of required `Facade section:` anchors that keep long compatibility specs
navigable. Explicit child and section counts in the same manifest make list
changes reviewable and are checked against the delimited inventories.
`humanize.gpr` exposes that surface through `Library_Interface`.
`check_humanize` validates the manifest against the project file, the source
specs, the public API index, the coverage scorecard, facade maps, facade
budgets, and the prose snapshot. It also
requires each public spec to carry a package-level purpose comment, requires
per-unit performance coverage to be classified as representative or explicitly
exempt, requires the representative API consistency test, and keeps the
existing GNATdoc policy over the curated public spec list. Adding or removing public packages
should update the surface snapshot, `docs/PUBLIC_API.toml`,
`docs/PUBLIC_API_INDEX.md`, `docs/PUBLIC_API_CLASSES.toml`,
`docs/PUBLIC_API_COVERAGE.toml`,
`docs/PUBLIC_FACADE_BUDGETS.toml`, and the release notes in the same change.
For reviewed public API changes, maintainers can run
`./check_humanize/bin/check_humanize --print-public-api-index` and
`./check_humanize/bin/check_humanize --print-public-api-classes`,
`./check_humanize/bin/check_humanize --print-public-api-coverage`, and
`./check_humanize/bin/check_humanize --print-public-api-unit-coverage` to print
the manifest-derived index, class map, and scorecards before copying reviewed
output into the tracked docs. The public API generators compute package
ordering, class rows, package counts, and per-unit coverage rows from
`docs/PUBLIC_API.toml`, and `check_humanize` compares all generated files
byte-for-byte with the tracked docs, so stale package lists, class assignments,
ordering, area totals, per-unit coverage scores, and score text are caught by
policy checks.

The public surface example is part of the release expected-output set. Its
`public-surface-demo-output` fixture gives the release checker a runtime smoke
path through representative child packages without turning every public unit
into a performance benchmark.

## Deep static profile

`./check_humanize/bin/check_humanize --deep-static` is a no-rebuild static
profile for local review. It composes manifest, required surface, source tree,
tooling-boundary, public documentation, example inventory, quality guard, and
compiler-stderr checks without running release builds. The profile is useful
after editing docs, policies, generated manifests, or checker structure because
it catches stale metadata, missing split checker packages, and nonempty stderr
logs from the last normal build.

## Fast release profile

`./check_humanize/bin/check_humanize --release-fast` is the build-backed release
profile for repeated local iterations. It runs source-policy checks, local
library and test builds, the full AUnit suite, performance smoke, examples,
public API consumers, `alr test`, GNATdoc, expected-output fixtures, and
compiler-stderr hygiene while skipping only the staged pin-free release tree.
Use the default `check_humanize` command or `--staged-release-only` before
tagging because staged publication checks remain the authoritative packaging
gate.

Broad exception handlers in both runtime `src/` code and release-tooling
`check_humanize/src/` code must carry an explicit recovery classification, such
as `parse failure normalization`, `defensive recovery`, or `intentional silent
recovery`. `docs/POLICY_THRESHOLDS.toml` keeps separate ratchets for runtime
and tooling handlers so release-policy code cannot gain broad exception
recovery without review.

## Domain package consistency

Public domain packages must expose owned `Text_Result` labels, bounded `_Into`
forms, tests, docs, and runnable examples for their representative package
families. `check_humanize` audits the public domain spec set and
`docs/EXAMPLE_COVERAGE.toml` so large product/UI/operations/security/data
families do not silently drift away from the common Humanize API shape.

## Structural baselines

`docs/STRUCTURAL_BASELINE.toml` records line ratchets, hard line/byte budgets,
reserved headroom, and optional separate-body inventories for the largest
compatibility backends, generated/native data bodies, and private support
contracts. `check_humanize` validates that large structural units stay within
their reviewed budgets and, when configured, keep their subunit split counts.
The same policy pass validates public/private API consistency, focused
downstream public API consumers, and the short
`docs/PACKAGE_GUIDE.md` import map.
`docs/TEST_SOURCE_BUDGETS.toml` records per-suite parent and subunit line
budgets for `tests/src/humanize-tests-*.adb`. The checker applies the longest
matching prefix, so large parser and generated-locale corpus files need
explicit suite budgets while ordinary test bodies inherit tighter defaults.

## Non-goal boundary

`docs/specification.md` keeps the Humanize non-goals explicit: no time zone
database, no arbitrary CLDR import at application runtime, no full CLDR
currency-formatting engine, and no application-defined runtime classifier
plugins. `check_humanize` enforces those statements so large locale/data/plugin
features stay outside Humanize unless the project deliberately changes its
scope.
