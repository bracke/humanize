separate (Humanize.Catalogs.Phrase_Data.Locale_Cs)
procedure Labels_4 is
begin
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "méně než {v1, number} min čtení");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {{v1, number} věta} few {{v1, number} věty} many "
      & "{{v1, number} věty} other {{v1, number} vět}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {{v1, number} věta} few {{v1, number} věty} many "
      & "{{v1, number} věty} other {{v1, number} vět}}");
   P ("label.metrics.word_count_summary.no_words", "žádná slova");
   P ("label.metrics.sentence_count_summary.no_sentences", "žádné věty");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "žádné odstavce");
   P ("label.metrics.text_summary_with_options.no_words", "žádná slova");
   P ("label.metrics.text_summary_with_options.no_sentences", "žádné věty");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "žádné odstavce");
   P ("label.metrics.word_count_summary.n_word",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slova} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.metrics.text_summary_with_options.n_word",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slova} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {žádná pozorování} "
      & "sample_too_small_shape {vzorek je příliš malý pro popis tvaru, "
      & "{count, number} pozorování} flat_shape {ploché rozdělení na "
      & "{median}} outlier_heavy_shape {rozdělení s mnoha odlehlými "
      & "hodnotami kolem {median}} volatile_shape {proměnlivé rozdělení "
      & "kolem {median}} clustered_shape {shlukované rozdělení kolem "
      & "{median}} wide_spread_shape {široce rozptýlené rozdělení} "
      & "wide_spread_range {široce rozptýlené rozdělení od {minimum} do "
      & "{maximum}} right_skewed_shape {rozdělení zešikmené doprava, "
      & "medián {median}} left_skewed_shape {rozdělení zešikmené doleva, "
      & "medián {median}} other {převážně vyvážené rozdělení kolem "
      & "{median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {prázdný e-mail} address {e-mailová adresa} "
      & "other {e-mail v doméně {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {telefonní číslo} redacted {telefonní číslo "
      & "skryto} other {telefon končící na {digits}}}");
   P ("label.privacy.safe_handle_label",
      "{state, select, none {uživatelské jméno} other {uživatelské "
      & "jméno {shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {symbol kódu} other {symbol kódu {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "metadata adresy: {present, plural, one {1 pole uvedeno} few {{present, "
      & "number} pole uvedena} many {{present, number} pole uvedeno} other "
      & "{{present, number} polí uvedeno}}, {missing, plural, one {1 pole "
      & "chybí} few {{missing, number} pole chybí} many {{missing, number} "
      & "pole chybí} other {{missing, number} polí chybí}}");
   P ("label.endpoints.host_label", "{state, select, none {neznámý hostitel} other {{kind} {host}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {neznámý koncový bod} other {koncový bod "
      & "{scheme}{host}{port} ({kind})}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {prázdná adresa URL} none {URL bez "
      & "rozpoznaných součástí} other {URL s {count, plural, one {1 "
      & "součástí} few {{count, number} součástmi} many {{count, number} "
      & "součásti} other {{count, number} součástmi}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {žádné parametry dotazu} one {1 parametr dotazu} "
      & "few {{count, number} parametry dotazu} many {{count, number} parametru "
      & "dotazu} other {{count, number} parametrů dotazu}}");
   P ("label.endpoints.ip_address_label",
      "{address}: {kind, select, ipv4_host {veřejná adresa IPv4} ipv6_host "
      & "{veřejná adresa IPv6} private_network_host {adresa privátní "
      & "sítě} localhost_host {místní hostitel} other {není adresa IP}}");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr}: neplatný CIDR} other {{cidr}: "
      & "{kind}, síťový prefix {prefix}}}");
   P ("label.resources.utilization_label", "využito {used, number} z {total, number} {unit} ({percent}, {band})");
   P ("label.resources.saturation_label", "{named, select, no {prostředek} other {{name}}}: {percent}, {band}");
   P ("label.versions.version_label",
      "{state, select, both {verze {version}, předběžná verze "
      & "{prerelease}, sestavení {build}} prerelease {verze {version}, "
      & "předběžná verze {prerelease}} build {verze {version}, sestavení "
      & "{build}} other {verze {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {stejná verze} major_upgrade "
      & "{povýšení hlavní verze} minor_upgrade {povýšení vedlejší "
      & "verze} patch_upgrade {povýšení opravné verze} prerelease_change "
      & "{změna předběžné verze} build_metadata_change {změna metadat "
      & "sestavení} downgrade {snížení verze} other {neznámá změna "
      & "verze}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {přesně verze {version}} minimum_range "
      & "{verze {version} nebo novější} maximum_range {verze {version} nebo "
      & "starší} major_compatible_range {kompatibilní s hlavní verzí "
      & "{version}} minor_compatible_range {kompatibilní s vedlejší verzí "
      & "{version}} other {rozsah verzí {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {počáteční vývojové vydání {version}} "
      & "prerelease {předběžné vydání {version}} major {hlavní vydání "
      & "{version}} minor {vedlejší vydání {version}} other {opravné "
      & "vydání {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {značka odkazu} image {značka obrázku} paragraph "
      & "{značka odstavce} ordered_list {značka číslovaného seznamu} "
      & "unordered_list {značka nečíslovaného seznamu} list_item {značka "
      & "položky seznamu} table_header_cell {značka buňky záhlaví tabulky} "
      & "table_cell {značka buňky tabulky} table_row {značka řádku "
      & "tabulky} line_break {značka zalomení řádku} thematic_break "
      & "{značka tematického zlomu} heading_level_n {značka nadpisu úrovně "
      & "{level, number}} other {značka {name}}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {atribut {name}} event {atribut obsluhy události "
      & "{name}} other {atribut {name} nastavený na „{value}“}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {textový obsah} html_content {dokument "
      & "HTML} json_content {dokument JSON} xml_content {dokument XML} "
      & "image_content {obrázek} audio_content {zvuk} video_content {video} "
      & "font_content {písmo} archive_content {archiv} binary_content "
      & "{binární obsah} form_content {odeslání formuláře} other "
      & "{neznámý obsah}} ({base})");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind}: nenastaveno} hidden_value {{kind}: "
      & "skryto} masked_value {{kind} {shown}} fingerprint_only {{kind}: otisk "
      & "končící na {shown}} other {{kind} končící na {shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} {kind}: nenastaveno} other {{name} "
      & "{kind} končící na {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {hlavička pověření {name}: nenastaveno} "
      & "other {{name} {kind} končící na {shown}}}");
   P ("label.secrets.fingerprint_label", "otisk {algorithm} končící na {shown}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label}: nenastaveno} redacted {{label}: "
      & "skryto} url_redacted {adresa URL skryta} ip_redacted {adresa IP "
      & "skryta} path_ending {cesta k souboru končící na {shown}} at "
      & "{{label} na {shown}} audit {{label}, délka {length, number}, "
      & "končící na {shown}} debug {{label} {shown}} other {{label} "
      & "končící na {shown}}}");
   P ("label.schema.field_label",
      "pole {name}: {state, select, deprecated_field {zastaralé, } "
      & "unknown_field {neznámé, } read_only_field {jen pro čtení, } "
      & "write_only_field {jen pro zápis, } computed_field {vypočítané, } "
      & "other {}}{presence, select, required_field {povinné} optional_field "
      & "{volitelné} conditional_field {podmíněné} other {přítomnost "
      & "neznámá}}{nullable, select, non_nullable {, bez null} nullable {, "
      & "může být null} other {}}, typ {kind, select, string_field "
      & "{řetězec} integer_field {celé číslo} decimal_field {desetinné "
      & "číslo} boolean_field {logická hodnota} date_field {datum} "
      & "date_time_field {datum a čas} object_field {objekt} array_field "
      & "{pole} enum_field {výčet} binary_field {binární data} null_field "
      & "{null} any_field {libovolný} other {neznámý}}");
   P ("label.schema.schema_summary_label.fields",
      "{count, plural, one {1 pole} few {{count, number} pole} many {{count, "
      & "number} pole} other {{count, number} polí}}");
   P ("label.schema.schema_summary_label.required", "povinné: {count, number}");
   P ("label.schema.schema_summary_label.optional", "volitelné: {count, number}");
   P ("label.schema.schema_summary_label.deprecated", "zastaralé: {count, number}");
   P ("label.schema.schema_summary_label.unknown", "neznámé: {count, number}");
   P ("label.diagnostics.check_run_summary_label.none", "nespuštěny žádné kontroly");
   P ("label.diagnostics.check_run_summary_label.passed", "prošlo: {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "selhalo: {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 varování} few {{count, number} varování} "
      & "many {{count, number} varování} other {{count, number} varování}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "přeskočeno: {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "čeká: {count, number}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {1 položka} few {{count, number} položky} many "
      & "{{count, number} položky} other {{count, number} položek}}");
   P ("label.workflows.workflow_summary_label.completed", "dokončeno: {count, number}");
   P ("label.workflows.workflow_summary_label.active", "aktivní: {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "blokováno: {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "selhalo: {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "přeskočeno: {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {1 položka} few {{count, number} položky} many "
      & "{{count, number} položky} other {{count, number} položek}}");
   P ("label.changes.change_summary_label.added", "přidáno {count, number}");
   P ("label.changes.change_summary_label.removed", "odebráno {count, number}");
   P ("label.changes.change_summary_label.modified", "změněno {count, number}");
   P ("label.changes.change_summary_label.renamed", "přejmenováno {count, number}");
   P ("label.changes.change_summary_label.unchanged", "beze změny {count, number}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {tlačítko} link_control {odkaz} "
      & "tab_control {karta} menu_item_control {položka nabídky} "
      & "checkbox_control {zaškrtávací políčko} radio_control "
      & "{přepínač} text_field_control {textové pole} progress_control "
      & "{ukazatel průběhu} table_cell_control {buňka tabulky} "
      & "region_control {oblast} other {ovládací prvek}} {named, select, no "
      & "{bez názvu} other {{name}}}");
   P ("label.markup.accessible_control_label.selected", "vybráno");
   P ("label.markup.accessible_control_label.expanded", "rozbaleno");
   P ("label.markup.accessible_control_label.current", "aktuální");
   P ("label.markup.accessible_control_label.disabled", "nedostupné");
   P ("label.markup.accessible_control_label.required", "povinné");
   P ("label.markup.accessible_control_label.invalid", "neplatné");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {1 položka} few {{count, number} položky} many "
      & "{{count, number} položky} other {{count, number} položek}}");
   P ("label.markup.accessible_control_label.position", "položka {position} z {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {1 problém} few {{count, number} problémy} many "
      & "{{count, number} problému} other {{count, number} problémů}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "schéma");
   P ("label.endpoints.url_component.host", "hostitel");
   P ("label.endpoints.url_component.path", "cesta");
   P ("label.endpoints.url_component.query", "dotaz");
   P ("label.endpoints.url_component.fragment", "fragment");
   P ("label.names.hue_noun.red", "červená");
   P ("label.names.hue_noun.orange", "oranžová");
   P ("label.names.hue_noun.yellow", "žlutá");
   P ("label.names.hue_noun.green", "zelená");
   P ("label.names.hue_noun.cyan", "azurová");
   P ("label.names.hue_noun.blue", "modrá");
   P ("label.names.hue_noun.purple", "fialová");
   P ("label.names.hue_noun.magenta", "purpurová");
   P ("label.names.hue_noun.neutral", "neutrální");
   P ("label.names.hue_noun.pink", "růžová");
   P ("label.names.hue_gender.red", "feminine");
   P ("label.names.hue_gender.orange", "feminine");
   P ("label.names.hue_gender.yellow", "feminine");
   P ("label.names.hue_gender.green", "feminine");
   P ("label.names.hue_gender.cyan", "feminine");
   P ("label.names.hue_gender.blue", "feminine");
   P ("label.names.hue_gender.purple", "feminine");
   P ("label.names.hue_gender.magenta", "feminine");
   P ("label.names.hue_gender.neutral", "feminine");
   P ("label.names.hue_gender.pink", "feminine");
   P ("label.names.agree.very_dark",
      "{gender, select, masculine {velmi tmavý} neuter {velmi tmavé} other "
      & "{velmi tmavá}}");
   P ("label.names.agree.dark", "{gender, select, masculine {tmavý} neuter {tmavé} other {tmavá}}");
   P ("label.names.agree.medium_brightness",
      "{gender, select, masculine {středně světlý} neuter {středně "
      & "světlé} other {středně světlá}}");
   P ("label.names.agree.light",
      "{gender, select, masculine {světlý} neuter {světlé} other "
      & "{světlá}}");
   P ("label.names.agree.very_light",
      "{gender, select, masculine {velmi světlý} neuter {velmi světlé} "
      & "other {velmi světlá}}");
   P ("label.names.agree.desaturated",
      "{gender, select, masculine {nenasycený} neuter {nenasycené} other "
      & "{nenasycená}}");
   P ("label.names.agree.muted",
      "{gender, select, masculine {tlumený} neuter {tlumené} other "
      & "{tlumená}}");
   P ("label.names.agree.neutral", "{gender, select, other {neutrální}}");
   P ("label.names.agree.saturated", "{gender, select, masculine {sytý} neuter {syté} other {sytá}}");
   P ("label.names.agree.vivid", "{gender, select, masculine {živý} neuter {živé} other {živá}}");
   P ("label.names.agree.grayish",
      "{gender, select, masculine {našedlý} neuter {našedlé} other "
      & "{našedlá}}");
   P ("label.names.agree.soft", "{gender, select, masculine {jemný} neuter {jemné} other {jemná}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {střední pestrost}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {vysoká pestrost}}");
   P ("label.names.agree.pastel",
      "{gender, select, masculine {pastelový} neuter {pastelové} other "
      & "{pastelová}}");
   P ("label.names.agree.warm", "{gender, select, masculine {teplý} neuter {teplé} other {teplá}}");
   P ("label.names.agree.cool",
      "{gender, select, masculine {studený} neuter {studené} other "
      & "{studená}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {neutrální teplota}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {vyvážená teplota}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
end Labels_4;
