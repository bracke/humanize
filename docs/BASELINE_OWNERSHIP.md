# Baseline Ownership

This repository has three kinds of review surface:

* Source-of-truth code and prose: `src/`, `tests/src/`, `examples/`, `README.md`,
  `docs/PACKAGE_GUIDE.md`, `docs/QUALITY_GUARDS.md`, and checker sources under
  `check_humanize/src/`.
* Policy manifests: `docs/POLICY_REQUIREMENTS.toml`,
  `docs/POLICY_THRESHOLDS.toml`, `docs/STRUCTURAL_BASELINE.toml`,
  `docs/PERFORMANCE_BASELINE.toml`,
  `docs/PERFORMANCE_EXEMPTION_BUDGETS.toml`, and
  `docs/PUBLIC_FACADE_BUDGETS.toml`.
  These files are hand-maintained guardrails.
* Generated-maintained scorecards and indexes:
  `docs/PUBLIC_API_INDEX.md`, `docs/PUBLIC_API_CLASSES.toml`,
  `docs/PUBLIC_API_COVERAGE.toml`, `docs/PUBLIC_API_UNIT_COVERAGE.toml`, and
  `docs/GENERATED_DATA.toml`.
* Generated-maintained command metadata: `docs/GENERATED_DOCS.toml`. This file
  is hand-reviewed but records the refresh commands for generated-maintained
  documentation outputs.

Refresh generated-maintained API files with:

```sh
cd check_humanize
./bin/check_humanize --print-public-api-index > ../docs/PUBLIC_API_INDEX.md
./bin/check_humanize --print-public-api-classes > ../docs/PUBLIC_API_CLASSES.toml
./bin/check_humanize --print-public-api-coverage > ../docs/PUBLIC_API_COVERAGE.toml
./bin/check_humanize --print-public-api-unit-coverage > ../docs/PUBLIC_API_UNIT_COVERAGE.toml
```

Refresh generated-data manifests with:

```sh
cd check_humanize
./bin/check_humanize --print-generated-data-manifest > ../docs/GENERATED_DATA.toml
```

Review generated-doc command metadata with:

```sh
cd check_humanize
./bin/check_humanize --policy-only
```

For review, split changes by ownership: checker/policy changes first, source API
or implementation changes second, tests third, and generated-maintained
scorecards last.
