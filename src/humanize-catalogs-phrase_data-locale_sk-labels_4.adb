separate (Humanize.Catalogs.Phrase_Data.Locale_Sk)
procedure Labels_4 is
begin
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "menej ako {v1, number} min hovorenia");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {{v1, number} odsek} few {{v1, number} odseky} many "
      & "{{v1, number} odseku} other {{v1, number} odsekov}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "menej ako {v1, number} min čítania");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {{v1, number} veta} few {{v1, number} vety} many "
      & "{{v1, number} vety} other {{v1, number} viet}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {{v1, number} veta} few {{v1, number} vety} many "
      & "{{v1, number} vety} other {{v1, number} viet}}");
   P ("label.metrics.word_count_summary.no_words", "žiadne slová");
   P ("label.metrics.sentence_count_summary.no_sentences", "žiadne vety");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "žiadne odseky");
   P ("label.metrics.text_summary_with_options.no_words", "žiadne slová");
   P ("label.metrics.text_summary_with_options.no_sentences", "žiadne vety");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "žiadne odseky");
   P ("label.metrics.word_count_summary.n_word",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slová} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.metrics.text_summary_with_options.n_word",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slová} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {žiadne pozorovania} "
      & "sample_too_small_shape {vzorka je príliš malá na opis tvaru, "
      & "{count, plural, one {{count, number} pozorovanie} few {{count, number} "
      & "pozorovania} many {{count, number} pozorovania} other {{count, number} "
      & "pozorovaní}}} flat_shape {ploché rozdelenie na {median}} "
      & "outlier_heavy_shape {rozdelenie s mnohými odľahlými hodnotami okolo "
      & "{median}} volatile_shape {premenlivé rozdelenie okolo {median}} "
      & "clustered_shape {zhlukované rozdelenie okolo {median}} "
      & "wide_spread_shape {široko rozptýlené rozdelenie} wide_spread_range "
      & "{široko rozptýlené rozdelenie od {minimum} do {maximum}} "
      & "right_skewed_shape {rozdelenie zošikmené doprava, medián {median}} "
      & "left_skewed_shape {rozdelenie zošikmené doľava, medián {median}} "
      & "other {prevažne vyvážené rozdelenie okolo {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {prázdny e-mail} address {e-mailová adresa} "
      & "other {e-mail v doméne {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {telefónne číslo} redacted {telefónne číslo "
      & "skryté} other {telefón s koncovkou {digits}}}");
   P ("label.privacy.safe_handle_label",
      "{state, select, none {používateľské meno} other {používateľské "
      & "meno {shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {symbol kódu} other {symbol kódu {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "metadáta adresy: {present, plural, one {1 pole uvedené} few "
      & "{{present, number} polia uvedené} many {{present, number} poľa "
      & "uvedeného} other {{present, number} polí uvedených}}, {missing, "
      & "plural, one {1 pole chýba} few {{missing, number} polia chýbajú} "
      & "many {{missing, number} poľa chýba} other {{missing, number} polí "
      & "chýba}}");
   P ("label.endpoints.host_label", "{state, select, none {neznámy hostiteľ} other {{kind} {host}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {neznámy koncový bod} other {koncový bod "
      & "{scheme}{host}{port} ({kind})}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {prázdna adresa URL} none {URL bez "
      & "rozpoznaných súčastí} other {URL s {count, plural, one {1 "
      & "súčasťou} few {{count, number} súčasťami} many {{count, number} "
      & "súčasti} other {{count, number} súčasťami}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {žiadne parametre dotazu} one {1 parameter dotazu} "
      & "few {{count, number} parametre dotazu} many {{count, number} parametra "
      & "dotazu} other {{count, number} parametrov dotazu}}");
   P ("label.endpoints.ip_address_label",
      "{address}: {kind, select, ipv4_host {verejná adresa IPv4} ipv6_host "
      & "{verejná adresa IPv6} private_network_host {adresa súkromnej siete} "
      & "localhost_host {lokálny hostiteľ} other {nie je adresa IP}}");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr}: neplatný CIDR} other {{cidr}: "
      & "{kind}, sieťový prefix {prefix}}}");
   P ("label.resources.utilization_label", "využité {used, number} z {total, number} {unit} ({percent}, {band})");
   P ("label.resources.saturation_label", "{named, select, no {prostriedok} other {{name}}}: {percent}, {band}");
   P ("label.versions.version_label",
      "{state, select, both {verzia {version}, predbežná verzia "
      & "{prerelease}, zostava {build}} prerelease {verzia {version}, "
      & "predbežná verzia {prerelease}} build {verzia {version}, zostava "
      & "{build}} other {verzia {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {rovnaká verzia} major_upgrade "
      & "{zvýšenie hlavnej verzie} minor_upgrade {zvýšenie vedľajšej "
      & "verzie} patch_upgrade {zvýšenie opravnej verzie} prerelease_change "
      & "{zmena predbežnej verzie} build_metadata_change {zmena metadát "
      & "zostavy} downgrade {zníženie verzie} other {neznáma zmena verzie}}: "
      & "{from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {presne verzia {version}} minimum_range "
      & "{verzia {version} alebo novšia} maximum_range {verzia {version} alebo "
      & "staršia} major_compatible_range {kompatibilné s hlavnou verziou "
      & "{version}} minor_compatible_range {kompatibilné s vedľajšou verziou "
      & "{version}} other {rozsah verzií {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {počiatočné vývojové vydanie {version}} "
      & "prerelease {predbežné vydanie {version}} major {hlavné vydanie "
      & "{version}} minor {vedľajšie vydanie {version}} other {opravné "
      & "vydanie {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {značka odkazu} image {značka obrázka} paragraph "
      & "{značka odseku} ordered_list {značka číslovaného zoznamu} "
      & "unordered_list {značka nečíslovaného zoznamu} list_item {značka "
      & "položky zoznamu} table_header_cell {značka bunky hlavičky tabuľky} "
      & "table_cell {značka bunky tabuľky} table_row {značka riadka "
      & "tabuľky} line_break {značka zalomenia riadka} thematic_break "
      & "{značka tematického zlomu} heading_level_n {značka nadpisu úrovne "
      & "{level, number}} other {značka {name}}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {atribút {name}} event {atribút obsluhy "
      & "udalosti {name}} other {atribút {name} nastavený na „{value}“}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {textový obsah} html_content {dokument "
      & "HTML} json_content {dokument JSON} xml_content {dokument XML} "
      & "image_content {obrázok} audio_content {zvuk} video_content {video} "
      & "font_content {písmo} archive_content {archív} binary_content "
      & "{binárny obsah} form_content {odoslanie formulára} other {neznámy "
      & "obsah}} ({base})");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind}: nenastavené} hidden_value {{kind}: "
      & "skryté} masked_value {{kind} {shown}} fingerprint_only {{kind}: "
      & "odtlačok s koncovkou {shown}} other {{kind} s koncovkou {shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} {kind}: nenastavené} other {{name} "
      & "{kind} s koncovkou {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {hlavička poverení {name}: nenastavená} other "
      & "{{name} {kind} s koncovkou {shown}}}");
   P ("label.secrets.fingerprint_label", "odtlačok {algorithm} s koncovkou {shown}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label}: nenastavené} redacted {{label}: "
      & "skryté} url_redacted {adresa URL skrytá} ip_redacted {adresa IP "
      & "skrytá} path_ending {cesta k súboru s koncovkou {shown}} at {{label} "
      & "na {shown}} audit {{label}, dĺžka {length, number}, koncovka "
      & "{shown}} debug {{label} {shown}} other {{label} s koncovkou {shown}}}");
   P ("label.schema.field_label",
      "pole {name}: {state, select, deprecated_field {zastarané, } "
      & "unknown_field {neznáme, } read_only_field {iba na čítanie, } "
      & "write_only_field {iba na zápis, } computed_field {vypočítané, } "
      & "other {}}{presence, select, required_field {povinné} optional_field "
      & "{voliteľné} conditional_field {podmienené} other {prítomnosť "
      & "neznáma}}{nullable, select, non_nullable {, bez null} nullable {, "
      & "môže byť null} other {}}, typ {kind, select, string_field "
      & "{reťazec} integer_field {celé číslo} decimal_field {desatinné "
      & "číslo} boolean_field {logická hodnota} date_field {dátum} "
      & "date_time_field {dátum a čas} object_field {objekt} array_field "
      & "{pole} enum_field {výčet} binary_field {binárne dáta} null_field "
      & "{null} any_field {ľubovoľný} other {neznámy}}");
   P ("label.schema.schema_summary_label.fields",
      "{count, plural, one {1 pole} few {{count, number} polia} many {{count, "
      & "number} poľa} other {{count, number} polí}}");
   P ("label.schema.schema_summary_label.required", "povinné: {count, number}");
   P ("label.schema.schema_summary_label.optional", "voliteľné: {count, number}");
   P ("label.schema.schema_summary_label.deprecated", "zastarané: {count, number}");
   P ("label.schema.schema_summary_label.unknown", "neznáme: {count, number}");
   P ("label.diagnostics.check_run_summary_label.none", "nespustili sa žiadne kontroly");
   P ("label.diagnostics.check_run_summary_label.passed", "prešlo: {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "zlyhalo: {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 upozornenie} few {{count, number} upozornenia} "
      & "many {{count, number} upozornenia} other {{count, number} "
      & "upozornení}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "preskočené: {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "čaká: {count, number}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {1 položka} few {{count, number} položky} many "
      & "{{count, number} položky} other {{count, number} položiek}}");
   P ("label.workflows.workflow_summary_label.completed", "dokončené: {count, number}");
   P ("label.workflows.workflow_summary_label.active", "aktívne: {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "blokované: {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "zlyhané: {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "preskočené: {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {1 položka} few {{count, number} položky} many "
      & "{{count, number} položky} other {{count, number} položiek}}");
   P ("label.changes.change_summary_label.added", "pridané {count, number}");
   P ("label.changes.change_summary_label.removed", "odstránené {count, number}");
   P ("label.changes.change_summary_label.modified", "zmenené {count, number}");
   P ("label.changes.change_summary_label.renamed", "premenované {count, number}");
   P ("label.changes.change_summary_label.unchanged", "bez zmeny {count, number}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {tlačidlo} link_control {odkaz} "
      & "tab_control {karta} menu_item_control {položka ponuky} "
      & "checkbox_control {začiarkavacie políčko} radio_control {prepínač} "
      & "text_field_control {textové pole} progress_control {indikátor "
      & "priebehu} table_cell_control {bunka tabuľky} region_control {oblasť} "
      & "other {ovládací prvok}} {named, select, no {bez názvu} other "
      & "{{name}}}");
   P ("label.markup.accessible_control_label.selected", "vybraté");
   P ("label.markup.accessible_control_label.expanded", "rozbalené");
   P ("label.markup.accessible_control_label.current", "aktuálne");
   P ("label.markup.accessible_control_label.disabled", "nedostupné");
   P ("label.markup.accessible_control_label.required", "povinné");
   P ("label.markup.accessible_control_label.invalid", "neplatné");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {1 položka} few {{count, number} položky} many "
      & "{{count, number} položky} other {{count, number} položiek}}");
   P ("label.markup.accessible_control_label.position", "položka {position} z {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {1 problém} few {{count, number} problémy} many "
      & "{{count, number} problému} other {{count, number} problémov}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "schéma");
   P ("label.endpoints.url_component.host", "hostiteľ");
   P ("label.endpoints.url_component.path", "cesta");
   P ("label.endpoints.url_component.query", "dotaz");
   P ("label.endpoints.url_component.fragment", "fragment");
   P ("label.names.hue_noun.red", "červená");
   P ("label.names.hue_noun.orange", "oranžová");
   P ("label.names.hue_noun.yellow", "žltá");
   P ("label.names.hue_noun.green", "zelená");
   P ("label.names.hue_noun.cyan", "azúrová");
   P ("label.names.hue_noun.blue", "modrá");
   P ("label.names.hue_noun.purple", "fialová");
   P ("label.names.hue_noun.magenta", "purpurová");
   P ("label.names.hue_noun.neutral", "neutrálna");
   P ("label.names.hue_noun.pink", "ružová");
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
      "{gender, select, masculine {veľmi tmavý} neuter {veľmi tmavé} "
      & "other {veľmi tmavá}}");
   P ("label.names.agree.dark", "{gender, select, masculine {tmavý} neuter {tmavé} other {tmavá}}");
   P ("label.names.agree.medium_brightness",
      "{gender, select, masculine {stredne svetlý} neuter {stredne svetlé} "
      & "other {stredne svetlá}}");
   P ("label.names.agree.light", "{gender, select, masculine {svetlý} neuter {svetlé} other {svetlá}}");
   P ("label.names.agree.very_light",
      "{gender, select, masculine {veľmi svetlý} neuter {veľmi svetlé} "
      & "other {veľmi svetlá}}");
   P ("label.names.agree.desaturated",
      "{gender, select, masculine {nenasýtený} neuter {nenasýtené} other "
      & "{nenasýtená}}");
   P ("label.names.agree.muted", "{gender, select, masculine {tlmený} neuter {tlmené} other {tlmená}}");
   P ("label.names.agree.neutral",
      "{gender, select, masculine {neutrálny} neuter {neutrálne} other "
      & "{neutrálna}}");
   P ("label.names.agree.saturated", "{gender, select, masculine {sýty} neuter {sýte} other {sýta}}");
   P ("label.names.agree.vivid", "{gender, select, masculine {živý} neuter {živé} other {živá}}");
   P ("label.names.agree.grayish",
      "{gender, select, masculine {sivastý} neuter {sivasté} other "
      & "{sivastá}}");
   P ("label.names.agree.soft", "{gender, select, masculine {jemný} neuter {jemné} other {jemná}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {stredná pestrosť}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {vysoká pestrosť}}");
   P ("label.names.agree.pastel",
      "{gender, select, masculine {pastelový} neuter {pastelové} other "
      & "{pastelová}}");
   P ("label.names.agree.warm", "{gender, select, masculine {teplý} neuter {teplé} other {teplá}}");
   P ("label.names.agree.cool",
      "{gender, select, masculine {studený} neuter {studené} other "
      & "{studená}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {neutrálna teplota}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {vyvážená teplota}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
end Labels_4;
