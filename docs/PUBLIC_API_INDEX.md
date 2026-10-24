# Public API Index

Generated-maintained from `docs/PUBLIC_API.toml`. Each public unit listed here
must also be present in `humanize.gpr` `Library_Interface` and in the public API
class map and coverage scorecards.

## root

- `Humanize` - `src/humanize.ads`

## core

- `Humanize.Status` - `src/humanize-status.ads`
- `Humanize.Message_Keys` - `src/humanize-message_keys.ads`
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
- `Humanize.Colors.Contrast.Localized` - `src/humanize-colors-contrast-localized.ads`
- `Humanize.Colors.Models` - `src/humanize-colors-models.ads`
- `Humanize.Colors.Models.Localized` - `src/humanize-colors-models-localized.ads`
- `Humanize.Colors.Names` - `src/humanize-colors-names.ads`
- `Humanize.Colors.Names.Localized` - `src/humanize-colors-names-localized.ads`
- `Humanize.Colors.Palettes` - `src/humanize-colors-palettes.ads`
- `Humanize.Colors.Palettes.Localized` - `src/humanize-colors-palettes-localized.ads`
- `Humanize.Numbers` - `src/humanize-numbers.ads`
- `Humanize.Numbers.Editorial` - `src/humanize-numbers-editorial.ads`
- `Humanize.Numbers.Ranges` - `src/humanize-numbers-ranges.ads`
- `Humanize.Numbers.Scales` - `src/humanize-numbers-scales.ads`
- `Humanize.Numbers.Spellout` - `src/humanize-numbers-spellout.ads`
- `Humanize.Numbers.Statistics` - `src/humanize-numbers-statistics.ads`
- `Humanize.Numbers.Statistics.Localized` - `src/humanize-numbers-statistics-localized.ads`
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
- `Humanize.Strings.Metrics.Localized` - `src/humanize-strings-metrics-localized.ads`
- `Humanize.Strings.Names` - `src/humanize-strings-names.ads`
- `Humanize.Strings.Paths` - `src/humanize-strings-paths.ads`
- `Humanize.Strings.Privacy` - `src/humanize-strings-privacy.ads`
- `Humanize.Strings.Privacy.Localized` - `src/humanize-strings-privacy-localized.ads`
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
- `Humanize.Parsing.Localized` - `src/humanize-parsing-localized.ads`
- `Humanize.Parsing.Phrases` - `src/humanize-parsing-phrases.ads`
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
- `Humanize.Endpoints.Localized` - `src/humanize-endpoints-localized.ads`
- `Humanize.Resources` - `src/humanize-resources.ads`
- `Humanize.Resources.Localized` - `src/humanize-resources-localized.ads`
- `Humanize.Versions` - `src/humanize-versions.ads`
- `Humanize.Versions.Localized` - `src/humanize-versions-localized.ads`
- `Humanize.Geo` - `src/humanize-geo.ads`
- `Humanize.Geo.Localized` - `src/humanize-geo-localized.ads`
- `Humanize.Markup` - `src/humanize-markup.ads`
- `Humanize.Markup.Localized` - `src/humanize-markup-localized.ads`
- `Humanize.Secrets` - `src/humanize-secrets.ads`
- `Humanize.Secrets.Localized` - `src/humanize-secrets-localized.ads`
- `Humanize.Schema` - `src/humanize-schema.ads`
- `Humanize.Schema.Localized` - `src/humanize-schema-localized.ads`
- `Humanize.Diagnostics` - `src/humanize-diagnostics.ads`
- `Humanize.Diagnostics.Localized` - `src/humanize-diagnostics-localized.ads`
- `Humanize.Thresholds` - `src/humanize-thresholds.ads`
- `Humanize.Thresholds.Localized` - `src/humanize-thresholds-localized.ads`
- `Humanize.Workflows` - `src/humanize-workflows.ads`
- `Humanize.Workflows.Localized` - `src/humanize-workflows-localized.ads`
- `Humanize.Changes` - `src/humanize-changes.ads`
- `Humanize.Changes.Localized` - `src/humanize-changes-localized.ads`
- `Humanize.Tables` - `src/humanize-tables.ads`
- `Humanize.Tables.Localized` - `src/humanize-tables-localized.ads`
- `Humanize.Forms` - `src/humanize-forms.ads`
- `Humanize.Forms.Localized` - `src/humanize-forms-localized.ads`
- `Humanize.Navigation` - `src/humanize-navigation.ads`
- `Humanize.Navigation.Localized` - `src/humanize-navigation-localized.ads`
- `Humanize.Badges` - `src/humanize-badges.ads`
- `Humanize.Badges.Localized` - `src/humanize-badges-localized.ads`
- `Humanize.Notifications` - `src/humanize-notifications.ads`
- `Humanize.Notifications.Localized` - `src/humanize-notifications-localized.ads`
- `Humanize.Search` - `src/humanize-search.ads`
- `Humanize.Search.Localized` - `src/humanize-search-localized.ads`
- `Humanize.Comments` - `src/humanize-comments.ads`
- `Humanize.Comments.Localized` - `src/humanize-comments-localized.ads`
- `Humanize.Tasks` - `src/humanize-tasks.ads`
- `Humanize.Tasks.Localized` - `src/humanize-tasks-localized.ads`
- `Humanize.Attachments` - `src/humanize-attachments.ads`
- `Humanize.Attachments.Localized` - `src/humanize-attachments-localized.ads`
- `Humanize.Events` - `src/humanize-events.ads`
- `Humanize.Events.Localized` - `src/humanize-events-localized.ads`
- `Humanize.Payments` - `src/humanize-payments.ads`
- `Humanize.Payments.Localized` - `src/humanize-payments-localized.ads`
- `Humanize.System_Status` - `src/humanize-system_status.ads`
- `Humanize.Cross_Domain.Localized` - `src/humanize-cross_domain-localized.ads`
- `Humanize.System_Status.Localized` - `src/humanize-system_status-localized.ads`
- `Humanize.Operations` - `src/humanize-operations.ads`
- `Humanize.Comparisons` - `src/humanize-comparisons.ads`
- `Humanize.Comparisons.Localized` - `src/humanize-comparisons-localized.ads`
- `Humanize.Cross_Domain` - `src/humanize-cross_domain.ads`
- `Humanize.Moderation` - `src/humanize-moderation.ads`
- `Humanize.Moderation.Localized` - `src/humanize-moderation-localized.ads`
- `Humanize.Accounts` - `src/humanize-accounts.ads`
- `Humanize.Accounts.Localized` - `src/humanize-accounts-localized.ads`
- `Humanize.Deployments` - `src/humanize-deployments.ads`
- `Humanize.Deployments.Localized` - `src/humanize-deployments-localized.ads`
- `Humanize.Data_Quality` - `src/humanize-data_quality.ads`
- `Humanize.Data_Quality.Localized` - `src/humanize-data_quality-localized.ads`
- `Humanize.Media` - `src/humanize-media.ads`
- `Humanize.Media.Localized` - `src/humanize-media-localized.ads`
- `Humanize.Notification_Preferences` - `src/humanize-notification_preferences.ads`
- `Humanize.Notification_Preferences.Localized` - `src/humanize-notification_preferences-localized.ads`
- `Humanize.Permissions` - `src/humanize-permissions.ads`
- `Humanize.Permissions.Localized` - `src/humanize-permissions-localized.ads`
- `Humanize.Builds` - `src/humanize-builds.ads`
- `Humanize.Builds.Localized` - `src/humanize-builds-localized.ads`
- `Humanize.Domain_Details` - `src/humanize-domain_details.ads`
