# Public API Index

Generated-maintained from `docs/PUBLIC_API.toml`. Each public unit listed here
must also be present in `humanize.gpr` `Library_Interface` and in the public API
class map and coverage scorecards.

## root

- `Humanize` - `src/humanize.ads`

## core

- `Humanize.Status` - `src/humanize-status.ads`
- `Humanize.Messages` - `src/humanize-messages.ads`
- `Humanize.Contexts` - `src/humanize-contexts.ads`
- `Humanize.Locales` - `src/humanize-locales.ads`
- `Humanize.Catalogs` - `src/humanize-catalogs.ads`
- `Humanize.Capabilities` - `src/humanize-capabilities.ads`
- `Humanize.Styles` - `src/humanize-styles.ads`
- `Humanize.Bounded_Text` - `src/humanize-bounded_text.ads`

## formatting

- `Humanize.Datetimes` - `src/humanize-datetimes.ads`
- `Humanize.Durations` - `src/humanize-durations.ads`
- `Humanize.Durations.Formatting` - `src/humanize-durations-formatting.ads`
- `Humanize.Durations.Natural` - `src/humanize-durations-natural.ads`
- `Humanize.Durations.Schedules` - `src/humanize-durations-schedules.ads`
- `Humanize.Bytes` - `src/humanize-bytes.ads`
- `Humanize.Colors` - `src/humanize-colors.ads`
- `Humanize.Colors.CSS` - `src/humanize-colors-css.ads`
- `Humanize.Colors.Contrast` - `src/humanize-colors-contrast.ads`
- `Humanize.Colors.Models` - `src/humanize-colors-models.ads`
- `Humanize.Colors.Names` - `src/humanize-colors-names.ads`
- `Humanize.Colors.Palettes` - `src/humanize-colors-palettes.ads`
- `Humanize.Numbers` - `src/humanize-numbers.ads`
- `Humanize.Numbers.Editorial` - `src/humanize-numbers-editorial.ads`
- `Humanize.Numbers.Ranges` - `src/humanize-numbers-ranges.ads`
- `Humanize.Numbers.Scales` - `src/humanize-numbers-scales.ads`
- `Humanize.Numbers.Spellout` - `src/humanize-numbers-spellout.ads`
- `Humanize.Numbers.Statistics` - `src/humanize-numbers-statistics.ads`
- `Humanize.Units` - `src/humanize-units.ads`
- `Humanize.Lists` - `src/humanize-lists.ads`
- `Humanize.Frequencies` - `src/humanize-frequencies.ads`
- `Humanize.Rates` - `src/humanize-rates.ads`
- `Humanize.Strings` - `src/humanize-strings.ads`
- `Humanize.Strings.Core` - `src/humanize-strings-core.ads`
- `Humanize.Strings.Display` - `src/humanize-strings-display.ads`
- `Humanize.Strings.Editing` - `src/humanize-strings-editing.ads`
- `Humanize.Strings.Identifiers` - `src/humanize-strings-identifiers.ads`
- `Humanize.Strings.Inflections` - `src/humanize-strings-inflections.ads`
- `Humanize.Strings.Markup` - `src/humanize-strings-markup.ads`
- `Humanize.Strings.Metadata` - `src/humanize-strings-metadata.ads`
- `Humanize.Strings.Metrics` - `src/humanize-strings-metrics.ads`
- `Humanize.Strings.Names` - `src/humanize-strings-names.ads`
- `Humanize.Strings.Paths` - `src/humanize-strings-paths.ads`
- `Humanize.Strings.Privacy` - `src/humanize-strings-privacy.ads`
- `Humanize.Strings.Prose` - `src/humanize-strings-prose.ads`
- `Humanize.Strings.Terminal` - `src/humanize-strings-terminal.ads`
- `Humanize.Strings.Types` - `src/humanize-strings-types.ads`
- `Humanize.Values` - `src/humanize-values.ads`

## parsing

- `Humanize.Parsing` - `src/humanize-parsing.ads`
- `Humanize.Parsing.Results` - `src/humanize-parsing-results.ads`
- `Humanize.Parsing.Colors` - `src/humanize-parsing-colors.ads`
- `Humanize.Parsing.Date_Times` - `src/humanize-parsing-date_times.ads`
- `Humanize.Parsing.Domain_Labels` - `src/humanize-parsing-domain_labels.ads`
- `Humanize.Parsing.Durations` - `src/humanize-parsing-durations.ads`
- `Humanize.Parsing.Numbers` - `src/humanize-parsing-numbers.ads`
- `Humanize.Parsing.Strings` - `src/humanize-parsing-strings.ads`
- `Humanize.Parsing.Units` - `src/humanize-parsing-units.ads`

## phrases

- `Humanize.Phrases` - `src/humanize-phrases.ads`
- `Humanize.Phrases.Fields` - `src/humanize-phrases-fields.ads`
- `Humanize.Phrases.Keys` - `src/humanize-phrases-keys.ads`
- `Humanize.Phrases.Locales` - `src/humanize-phrases-locales.ads`
- `Humanize.Phrases.Severity` - `src/humanize-phrases-severity.ads`
- `Humanize.Phrases.Statuses` - `src/humanize-phrases-statuses.ads`
- `Humanize.Phrases.Summaries` - `src/humanize-phrases-summaries.ads`

## domain

- `Humanize.Endpoints` - `src/humanize-endpoints.ads`
- `Humanize.Resources` - `src/humanize-resources.ads`
- `Humanize.Versions` - `src/humanize-versions.ads`
- `Humanize.Geo` - `src/humanize-geo.ads`
- `Humanize.Markup` - `src/humanize-markup.ads`
- `Humanize.Secrets` - `src/humanize-secrets.ads`
- `Humanize.Schema` - `src/humanize-schema.ads`
- `Humanize.Diagnostics` - `src/humanize-diagnostics.ads`
- `Humanize.Thresholds` - `src/humanize-thresholds.ads`
- `Humanize.Workflows` - `src/humanize-workflows.ads`
- `Humanize.Changes` - `src/humanize-changes.ads`
- `Humanize.Tables` - `src/humanize-tables.ads`
- `Humanize.Forms` - `src/humanize-forms.ads`
- `Humanize.Navigation` - `src/humanize-navigation.ads`
- `Humanize.Badges` - `src/humanize-badges.ads`
- `Humanize.Notifications` - `src/humanize-notifications.ads`
- `Humanize.Search` - `src/humanize-search.ads`
- `Humanize.Comments` - `src/humanize-comments.ads`
- `Humanize.Tasks` - `src/humanize-tasks.ads`
- `Humanize.Attachments` - `src/humanize-attachments.ads`
- `Humanize.Events` - `src/humanize-events.ads`
- `Humanize.Payments` - `src/humanize-payments.ads`
- `Humanize.System_Status` - `src/humanize-system_status.ads`
- `Humanize.Operations` - `src/humanize-operations.ads`
- `Humanize.Comparisons` - `src/humanize-comparisons.ads`
- `Humanize.Cross_Domain` - `src/humanize-cross_domain.ads`
- `Humanize.Moderation` - `src/humanize-moderation.ads`
- `Humanize.Accounts` - `src/humanize-accounts.ads`
- `Humanize.Deployments` - `src/humanize-deployments.ads`
- `Humanize.Data_Quality` - `src/humanize-data_quality.ads`
- `Humanize.Media` - `src/humanize-media.ads`
- `Humanize.Notification_Preferences` - `src/humanize-notification_preferences.ads`
- `Humanize.Permissions` - `src/humanize-permissions.ads`
- `Humanize.Builds` - `src/humanize-builds.ads`
- `Humanize.Domain_Details` - `src/humanize-domain_details.ads`
