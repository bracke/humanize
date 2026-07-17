# Public API Surface

This is the public API surface snapshot for Humanize. It is a guardrail for
review: source specs remain the compiler authority, while this file records the
package families that are intentionally public.

## Public API classes

`docs/PUBLIC_API_CLASSES.toml` classifies the public surface into three
callable classes and one non-callable class:

* `primary-facade`: stable packages that callers import directly for common
  formatting, parsing, context, phrase, and deterministic domain-label work.
* `specialized-child-facade`: public child packages such as
  `src/humanize-colors-css.ads`, `src/humanize-parsing-bytes.ads`, and
  `src/humanize-strings-core.ads` that make large feature families navigable
  while keeping implementation packages private.
* `support-type-facade`: small public packages that provide shared result,
  status, style, capability, bounded-output, or metadata types used by primary
  facades.
* `internal`: implementation, support, generated-data, and tooling packages.
  These packages must remain absent from `Library_Interface`.

The explicit `Library_Interface` in `humanize.gpr` is the compiler-enforced
boundary. Documentation explains the categories, but the project file decides
which specs downstream crates can import.

`docs/PUBLIC_API.toml` is the machine-readable allowlist, while
`docs/PUBLIC_API_INDEX.md` is the generated-maintained public API index derived
from that allowlist. `docs/PUBLIC_API_COVERAGE.toml` records the coarse public
API coverage scorecard used by `check_humanize` to keep docs, tests, examples,
downstream consumers, and performance smoke coverage visible by area.

## Public API surface snapshot

Core context, status, and catalog packages:

* `src/humanize.ads`
* `src/humanize-status.ads`
* `src/humanize-messages.ads`
* `src/humanize-contexts.ads`
* `src/humanize-locales.ads`
* `src/humanize-catalogs.ads`
* `src/humanize-capabilities.ads`
* `src/humanize-styles.ads`
* `src/humanize-bounded_text.ads`

Formatting and parsing packages:

* `src/humanize-datetimes.ads`
* `src/humanize-durations.ads`
* `src/humanize-durations-formatting.ads`
* `src/humanize-durations-natural.ads`
* `src/humanize-durations-schedules.ads`
* `src/humanize-bytes.ads`
* `src/humanize-colors.ads`
* `src/humanize-colors-css.ads`
* `src/humanize-colors-contrast.ads`
* `src/humanize-colors-models.ads`
* `src/humanize-colors-names.ads`
* `src/humanize-colors-palettes.ads`
* `src/humanize-numbers.ads`
* `src/humanize-units.ads`
* `src/humanize-lists.ads`
* `src/humanize-frequencies.ads`
* `src/humanize-rates.ads`
* `src/humanize-strings.ads`
* `src/humanize-strings-core.ads`
* `src/humanize-strings-display.ads`
* `src/humanize-strings-editing.ads`
* `src/humanize-strings-identifiers.ads`
* `src/humanize-strings-inflections.ads`
* `src/humanize-strings-markup.ads`
* `src/humanize-strings-metadata.ads`
* `src/humanize-strings-metrics.ads`
* `src/humanize-strings-names.ads`
* `src/humanize-strings-paths.ads`
* `src/humanize-strings-privacy.ads`
* `src/humanize-strings-prose.ads`
* `src/humanize-strings-terminal.ads`
* `src/humanize-strings-types.ads`
* `src/humanize-values.ads`
* `src/humanize-parsing.ads`
* `src/humanize-parsing-results.ads`
* `src/humanize-parsing-colors.ads`
* `src/humanize-parsing-date_times.ads`
* `src/humanize-parsing-domain_labels.ads`
* `src/humanize-parsing-durations.ads`
* `src/humanize-parsing-numbers.ads`
* `src/humanize-parsing-strings.ads`
* `src/humanize-parsing-units.ads`
* `src/humanize-phrases.ads`
* `src/humanize-phrases-fields.ads`
* `src/humanize-phrases-keys.ads`
* `src/humanize-phrases-locales.ads`
* `src/humanize-phrases-severity.ads`
* `src/humanize-phrases-statuses.ads`
* `src/humanize-phrases-summaries.ads`

Task/domain label packages:

* `src/humanize-endpoints.ads`
* `src/humanize-resources.ads`
* `src/humanize-versions.ads`
* `src/humanize-geo.ads`
* `src/humanize-markup.ads`
* `src/humanize-secrets.ads`
* `src/humanize-schema.ads`
* `src/humanize-diagnostics.ads`
* `src/humanize-thresholds.ads`
* `src/humanize-workflows.ads`
* `src/humanize-changes.ads`
* `src/humanize-tables.ads`
* `src/humanize-forms.ads`
* `src/humanize-navigation.ads`
* `src/humanize-badges.ads`
* `src/humanize-notifications.ads`
* `src/humanize-search.ads`
* `src/humanize-comments.ads`
* `src/humanize-tasks.ads`
* `src/humanize-attachments.ads`
* `src/humanize-events.ads`
* `src/humanize-payments.ads`
* `src/humanize-system_status.ads`
* `src/humanize-operations.ads`
* `src/humanize-comparisons.ads`
* `src/humanize-cross_domain.ads`
* `src/humanize-moderation.ads`
* `src/humanize-accounts.ads`
* `src/humanize-deployments.ads`
* `src/humanize-data_quality.ads`
* `src/humanize-media.ads`
* `src/humanize-notification_preferences.ads`
* `src/humanize-permissions.ads`
* `src/humanize-builds.ads`
* `src/humanize-domain_details.ads`

## Text_Result/_Into pairing

Public formatting functions that allocate or return owned text use
`Humanize.Status.Text_Result`. Public bounded variants use the `_Into` suffix,
a caller-owned 1-based `Target`, an out `Written` count, and an out
`Humanize.Status.Status_Code`. `Test_Public_API_Consistency` verifies
representative owned and bounded outputs match.

Parser APIs are the main exception: they return typed parse-result records
instead of `Text_Result`, with `Status`, `Consumed`, `Error_Position`, and
`Error` fields where applicable.

## Source-extracted public spec inventory

The source tree is still the compiler authority, but the release guard treats
this file and `docs/PUBLIC_API.toml` as the reviewed snapshot for public `.ads`
files discovered from `src/`. `humanize.gpr` must expose exactly this public
surface through `Library_Interface`; implementation, support, and generated-data
packages are build sources only.

When a new public spec is added, keep it documented here if callers can use it
directly. If the package is private implementation support, keep it private in
the project file and do not rely on documentation to hide it.

## Internal packages

Generated data packages such as `Humanize.Catalogs.Core_Data`,
`Humanize.Catalogs.Native_Data`, `Humanize.Catalogs.Unit_Data`,
`Humanize.Durations.Schedule_Data`, and `Humanize.Numbers.Spellout_Data` are
build inputs, not caller APIs. Implementation packages under
`Humanize.Parsing.Implementation`, phrase support packages, rendering adapters,
and `Project_Tools` are also internal. The public API consumer project under
`tests/public_api_consumer/` verifies that representative downstream code can
compile using only `Library_Interface` packages.
