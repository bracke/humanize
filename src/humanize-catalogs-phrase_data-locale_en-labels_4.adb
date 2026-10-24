separate (Humanize.Catalogs.Phrase_Data.Locale_En)
procedure Labels_4 is
begin
   P ("label.metrics.text_summary_with_options.no_paragraphs", "no paragraphs");
   P ("label.metrics.word_count_summary.n_word", "{v1, number} word");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, number} word");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {no observations} "
      & "sample_too_small_shape {sample too small to describe shape, {count, "
      & "number} observations} flat_shape {flat distribution at {median}} "
      & "outlier_heavy_shape {outlier-heavy distribution around {median}} "
      & "volatile_shape {volatile distribution around {median}} clustered_shape "
      & "{clustered distribution around {median}} wide_spread_shape "
      & "{wide-spread distribution} wide_spread_range {wide-spread distribution "
      & "from {minimum} to {maximum}} right_skewed_shape {right-skewed "
      & "distribution, median {median}} left_skewed_shape {left-skewed "
      & "distribution, median {median}} other {mostly balanced distribution "
      & "around {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {empty email} address {email address} other "
      & "{email at {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {phone number} redacted {phone number redacted} "
      & "other {phone ending in {digits}}}");
   P ("label.privacy.safe_handle_label", "{state, select, none {handle} other {handle {shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {code symbol} other {code symbol {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "address metadata: {present, plural, =0 {no fields present} one {1 "
      & "field present} other {{present, number} fields present}}, {missing, "
      & "plural, =0 {no fields missing} one {1 field missing} other {{missing, "
      & "number} fields missing}}");
   P ("label.endpoints.host_label", "{state, select, none {unknown host} other {{host} {kind}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {unknown endpoint} other {{scheme}{host}{port} "
      & "{kind} endpoint}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {empty URL} none {URL with no recognized "
      & "components} other {URL with {count, plural, one {1 component} other "
      & "{{count, number} components}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {no query params} one {1 query param} other "
      & "{{count, number} query params}}");
   P ("label.endpoints.ip_address_label",
      "{address} {kind, select, ipv4_host {public IPv4 address} ipv6_host "
      & "{public IPv6 address} private_network_host {private network address} "
      & "localhost_host {local host} other {not an IP address}}");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr} invalid CIDR} other {{cidr} {kind} "
      & "network prefix {prefix}}}");
   P ("label.resources.utilization_label", "{used, number} of {total, number} {unit} used ({percent}, {band})");
   P ("label.resources.saturation_label", "{named, select, no {resource} other {{name}}} {percent} {band}");
   P ("label.versions.version_label",
      "{state, select, both {version {version} prerelease {prerelease} build "
      & "{build}} prerelease {version {version} prerelease {prerelease}} build "
      & "{version {version} build {build}} other {version {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {same version} major_upgrade {major "
      & "upgrade} minor_upgrade {minor upgrade} patch_upgrade {patch upgrade} "
      & "prerelease_change {prerelease change} build_metadata_change {build "
      & "metadata change} downgrade {downgrade} other {unknown version "
      & "change}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {exactly version {version}} minimum_range "
      & "{version {version} or newer} maximum_range {version {version} or "
      & "older} major_compatible_range {compatible with major version "
      & "{version}} minor_compatible_range {compatible with minor version "
      & "{version}} other {version range {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {initial development release {version}} "
      & "prerelease {prerelease {version}} major {major release {version}} "
      & "minor {minor release {version}} other {patch release {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {link tag} image {image tag} paragraph {paragraph "
      & "tag} ordered_list {ordered list tag} unordered_list {unordered list "
      & "tag} list_item {list item tag} table_header_cell {table header cell "
      & "tag} table_cell {table cell tag} table_row {table row tag} line_break "
      & "{line break tag} thematic_break {thematic break tag} heading_level_n "
      & "{heading level {level, number} tag} other {{name} tag}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {{name} attribute} event {{name} event handler "
      & "attribute} other {{name} attribute set to ""{value}""}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {text content} html_content {HTML "
      & "document} json_content {JSON document} xml_content {XML document} "
      & "image_content {image content} audio_content {audio content} "
      & "video_content {video content} font_content {font content} "
      & "archive_content {archive content} binary_content {binary content} "
      & "form_content {form submission} other {unknown content}} ({base})");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind} unset} hidden_value {{kind} hidden} "
      & "masked_value {{kind} {shown}} fingerprint_only {{kind} fingerprint "
      & "ending in {shown}} other {{kind} ending in {shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} {kind} unset} other {{name} {kind} "
      & "ending in {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {{name} credential header unset} other {{name} "
      & "{kind} ending in {shown}}}");
   P ("label.secrets.fingerprint_label", "{algorithm} fingerprint ending in {shown}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label} not set} redacted {{label} redacted} "
      & "url_redacted {URL redacted} ip_redacted {IP address redacted} "
      & "path_ending {file path ending in {shown}} at {{label} at {shown}} "
      & "audit {{label} length {length, number}, ending in {shown}} debug "
      & "{{label} {shown}} other {{label} ending in {shown}}}");
   P ("label.schema.field_label",
      "{state, select, deprecated_field {deprecated } unknown_field {unknown "
      & "} read_only_field {read-only } write_only_field {write-only } "
      & "computed_field {computed } other {}}{presence, select, required_field "
      & "{required} optional_field {optional} conditional_field {conditional} "
      & "other {presence unknown}}{nullable, select, non_nullable { non-null} "
      & "nullable { nullable} other {}} {kind, select, string_field {string} "
      & "integer_field {integer} decimal_field {decimal} boolean_field "
      & "{boolean} date_field {date} date_time_field {date-time} object_field "
      & "{object} array_field {array} enum_field {enum} binary_field {binary} "
      & "null_field {null} any_field {any} other {unknown}} field {name}");
   P ("label.schema.schema_summary_label.fields", "{count, plural, one {1 field} other {{count, number} fields}}");
   P ("label.schema.schema_summary_label.required", "{count, number} required");
   P ("label.schema.schema_summary_label.optional", "{count, number} optional");
   P ("label.schema.schema_summary_label.deprecated", "{count, number} deprecated");
   P ("label.schema.schema_summary_label.unknown", "{count, number} unknown");
   P ("label.diagnostics.check_run_summary_label.none", "no checks run");
   P ("label.diagnostics.check_run_summary_label.passed", "{count, number} passed");
   P ("label.diagnostics.check_run_summary_label.failed", "{count, number} failed");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 warning} other {{count, number} warnings}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "{count, number} skipped");
   P ("label.diagnostics.check_run_summary_label.pending", "{count, number} pending");
   P ("label.workflows.workflow_summary_label.total", "{count, plural, one {1 item} other {{count, number} items}}");
   P ("label.workflows.workflow_summary_label.completed", "{count, number} completed");
   P ("label.workflows.workflow_summary_label.active", "{count, number} active");
   P ("label.workflows.workflow_summary_label.blocked", "{count, number} blocked");
   P ("label.workflows.workflow_summary_label.failed", "{count, number} failed");
   P ("label.workflows.workflow_summary_label.skipped", "{count, number} skipped");
   P ("label.changes.change_summary_label.total", "{count, plural, one {1 item} other {{count, number} items}}");
   P ("label.changes.change_summary_label.added", "{count, number} added");
   P ("label.changes.change_summary_label.removed", "{count, number} removed");
   P ("label.changes.change_summary_label.modified", "{count, number} changed");
   P ("label.changes.change_summary_label.renamed", "{count, number} renamed");
   P ("label.changes.change_summary_label.unchanged", "{count, number} unchanged");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {pink} other "
      & "{{hue}}}");
   P ("label.markup.accessible_control_label.control",
      "{named, select, no {unnamed} other {{name}}} {role, select, "
      & "button_control {button} link_control {link} tab_control {tab} "
      & "menu_item_control {menu item} checkbox_control {checkbox} "
      & "radio_control {radio} text_field_control {text field} progress_control "
      & "{progress} table_cell_control {table cell} region_control {region} "
      & "other {control}}");
   P ("label.markup.accessible_control_label.selected", "selected");
   P ("label.markup.accessible_control_label.expanded", "expanded");
   P ("label.markup.accessible_control_label.current", "current");
   P ("label.markup.accessible_control_label.disabled", "disabled");
   P ("label.markup.accessible_control_label.required", "required");
   P ("label.markup.accessible_control_label.invalid", "invalid");
   P ("label.markup.accessible_control_label.count", "{count, plural, one {1 item} other {{count, number} items}}");
   P ("label.markup.accessible_control_label.position", "item {position} of {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {1 issue} other {{count, number} issues}}");
   P ("label.markup.accessible_control_label.with_states", "{control} {states}");
   P ("label.endpoints.url_component.scheme", "scheme");
   P ("label.endpoints.url_component.host", "host");
   P ("label.endpoints.url_component.path", "path");
   P ("label.endpoints.url_component.query", "query");
   P ("label.endpoints.url_component.fragment", "fragment");
   P ("label.names.hue_noun.red", "red");
   P ("label.names.hue_noun.orange", "orange");
   P ("label.names.hue_noun.yellow", "yellow");
   P ("label.names.hue_noun.green", "green");
   P ("label.names.hue_noun.cyan", "cyan");
   P ("label.names.hue_noun.blue", "blue");
   P ("label.names.hue_noun.purple", "purple");
   P ("label.names.hue_noun.magenta", "magenta");
   P ("label.names.hue_noun.neutral", "neutral");
   P ("label.names.hue_noun.pink", "pink");
   P ("label.names.hue_gender.red", "other");
   P ("label.names.hue_gender.orange", "other");
   P ("label.names.hue_gender.yellow", "other");
   P ("label.names.hue_gender.green", "other");
   P ("label.names.hue_gender.cyan", "other");
   P ("label.names.hue_gender.blue", "other");
   P ("label.names.hue_gender.purple", "other");
   P ("label.names.hue_gender.magenta", "other");
   P ("label.names.hue_gender.neutral", "other");
   P ("label.names.hue_gender.pink", "other");
   P ("label.names.agree.very_dark", "{gender, select, other {very dark}}");
   P ("label.names.agree.dark", "{gender, select, other {dark}}");
   P ("label.names.agree.medium_brightness", "{gender, select, other {medium brightness}}");
   P ("label.names.agree.light", "{gender, select, other {light}}");
   P ("label.names.agree.very_light", "{gender, select, other {very light}}");
   P ("label.names.agree.desaturated", "{gender, select, other {desaturated}}");
   P ("label.names.agree.muted", "{gender, select, other {muted}}");
   P ("label.names.agree.neutral", "{gender, select, other {neutral}}");
   P ("label.names.agree.saturated", "{gender, select, other {saturated}}");
   P ("label.names.agree.vivid", "{gender, select, other {vivid}}");
   P ("label.names.agree.grayish", "{gender, select, other {grayish}}");
   P ("label.names.agree.soft", "{gender, select, other {soft}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {moderate chroma}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {high chroma}}");
   P ("label.names.agree.pastel", "{gender, select, other {pastel}}");
   P ("label.names.agree.warm", "{gender, select, other {warm}}");
   P ("label.names.agree.cool", "{gender, select, other {cool}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {neutral temperature}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {balanced temperature}}");
   P ("label.endpoints.url_label", "{state, select, empty {empty URL} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {empty URL} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[redacted user]");
   P ("label.endpoints.url_label.query", "query {count, plural, one {1 param} other {{count, number} params}}");
end Labels_4;
