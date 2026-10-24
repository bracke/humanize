separate (Humanize.Catalogs.Phrase_Data.Locale_Sl)
procedure Labels_4 is
begin
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {ni opazovanj} "
      & "sample_too_small_shape {vzorec je premajhen za opis oblike, {count, "
      & "plural, one {{count, number} opazovanje} two {{count, number} "
      & "opazovanji} few {{count, number} opazovanja} other {{count, number} "
      & "opazovanj}}} flat_shape {ploska porazdelitev pri {median}} "
      & "outlier_heavy_shape {porazdelitev z veliko izstopajočimi vrednostmi "
      & "okoli {median}} volatile_shape {nestanovitna porazdelitev okoli "
      & "{median}} clustered_shape {zgoščena porazdelitev okoli {median}} "
      & "wide_spread_shape {široko razpršena porazdelitev} wide_spread_range "
      & "{široko razpršena porazdelitev od {minimum} do {maximum}} "
      & "right_skewed_shape {v desno asimetrična porazdelitev, mediana "
      & "{median}} left_skewed_shape {v levo asimetrična porazdelitev, mediana "
      & "{median}} other {pretežno uravnotežena porazdelitev okoli {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {prazen e-poštni naslov} address {e-poštni "
      & "naslov} other {e-pošta na domeni {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {telefonska številka} redacted {telefonska "
      & "številka skrita} other {telefon, ki se konča na {digits}}}");
   P ("label.privacy.safe_handle_label",
      "{state, select, none {uporabniško ime} other {uporabniško ime "
      & "{shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {simbol kode} other {simbol kode {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "metapodatki naslova: {present, plural, one {1 polje prisotno} two "
      & "{{present, number} polji prisotni} few {{present, number} polja "
      & "prisotna} other {{present, number} polj prisotnih}}, {missing, plural, "
      & "one {1 polje manjka} two {{missing, number} polji manjkata} few "
      & "{{missing, number} polja manjkajo} other {{missing, number} polj "
      & "manjka}}");
   P ("label.endpoints.host_label", "{state, select, none {neznan gostitelj} other {{kind} {host}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {neznana končna točka} other {končna točka "
      & "{scheme}{host}{port} ({kind})}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {prazen URL} none {URL brez prepoznanih "
      & "komponent} other {URL s {count, plural, one {1 komponento} two "
      & "{{count, number} komponentama} few {{count, number} komponentami} "
      & "other {{count, number} komponentami}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {ni parametrov poizvedbe} one {1 parameter "
      & "poizvedbe} two {{count, number} parametra poizvedbe} few {{count, "
      & "number} parametri poizvedbe} other {{count, number} parametrov "
      & "poizvedbe}}");
   P ("label.endpoints.ip_address_label",
      "{address}: {kind, select, ipv4_host {javni naslov IPv4} ipv6_host "
      & "{javni naslov IPv6} private_network_host {naslov zasebnega omrežja} "
      & "localhost_host {lokalni gostitelj} other {ni naslov IP}}");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr}: neveljaven CIDR} other {{cidr}: "
      & "{kind}, omrežna predpona {prefix}}}");
   P ("label.resources.utilization_label",
      "uporabljeno {used, number} od {total, number} {unit} ({percent}, "
      & "{band})");
   P ("label.resources.saturation_label", "{named, select, no {vir} other {{name}}}: {percent}, {band}");
   P ("label.versions.version_label",
      "{state, select, both {različica {version}, predizdaja {prerelease}, "
      & "gradnja {build}} prerelease {različica {version}, predizdaja "
      & "{prerelease}} build {različica {version}, gradnja {build}} other "
      & "{različica {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {ista različica} major_upgrade "
      & "{nadgradnja glavne različice} minor_upgrade {nadgradnja "
      & "podrazličice} patch_upgrade {nadgradnja popravka} prerelease_change "
      & "{sprememba predizdaje} build_metadata_change {sprememba metapodatkov "
      & "gradnje} downgrade {vrnitev na starejšo različico} other {neznana "
      & "sprememba različice}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {natanko različica {version}} "
      & "minimum_range {različica {version} ali novejša} maximum_range "
      & "{različica {version} ali starejša} major_compatible_range "
      & "{združljivo z glavno različico {version}} minor_compatible_range "
      & "{združljivo s podrazličico {version}} other {obseg različic "
      & "{version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {začetna razvojna izdaja {version}} "
      & "prerelease {predizdaja {version}} major {glavna izdaja {version}} "
      & "minor {manjša izdaja {version}} other {izdaja popravkov {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {oznaka povezave} image {oznaka slike} paragraph "
      & "{oznaka odstavka} ordered_list {oznaka oštevilčenega seznama} "
      & "unordered_list {oznaka neoštevilčenega seznama} list_item {oznaka "
      & "elementa seznama} table_header_cell {oznaka celice glave tabele} "
      & "table_cell {oznaka celice tabele} table_row {oznaka vrstice tabele} "
      & "line_break {oznaka preloma vrstice} thematic_break {oznaka tematskega "
      & "preloma} heading_level_n {oznaka naslova ravni {level, number}} other "
      & "{oznaka {name}}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {atribut {name}} event {atribut za obravnavo "
      & "dogodka {name}} other {atribut {name}, nastavljen na »{value}«}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {besedilna vsebina} html_content {dokument "
      & "HTML} json_content {dokument JSON} xml_content {dokument XML} "
      & "image_content {slika} audio_content {zvok} video_content {video} "
      & "font_content {pisava} archive_content {arhiv} binary_content {binarna "
      & "vsebina} form_content {oddaja obrazca} other {neznana vsebina}} "
      & "({base})");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind}: ni nastavljeno} hidden_value {{kind}: "
      & "skrito} masked_value {{kind} {shown}} fingerprint_only {{kind}: prstni "
      & "odtis, ki se konča na {shown}} other {{kind}, ki se konča na "
      & "{shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} {kind}: ni nastavljeno} other {{name} "
      & "{kind}, ki se konča na {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {glava poverilnic {name}: ni nastavljena} other "
      & "{{name} {kind}, ki se konča na {shown}}}");
   P ("label.secrets.fingerprint_label", "prstni odtis {algorithm}, ki se konča na {shown}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label}: ni nastavljeno} redacted {{label}: "
      & "skrito} url_redacted {URL skrit} ip_redacted {naslov IP skrit} "
      & "path_ending {pot datoteke, ki se konča na {shown}} at {{label} na "
      & "{shown}} audit {{label}, dolžina {length, number}, konča se na "
      & "{shown}} debug {{label} {shown}} other {{label}, ki se konča na "
      & "{shown}}}");
   P ("label.schema.field_label",
      "polje {name}: {state, select, deprecated_field {zastarelo, } "
      & "unknown_field {neznano, } read_only_field {samo za branje, } "
      & "write_only_field {samo za pisanje, } computed_field {izračunano, } "
      & "other {}}{presence, select, required_field {obvezno} optional_field "
      & "{neobvezno} conditional_field {pogojno} other {prisotnost "
      & "neznana}}{nullable, select, non_nullable {, brez null} nullable {, "
      & "lahko null} other {}}, vrsta {kind, select, string_field {niz} "
      & "integer_field {celo število} decimal_field {decimalno število} "
      & "boolean_field {logična vrednost} date_field {datum} date_time_field "
      & "{datum in čas} object_field {objekt} array_field {polje} enum_field "
      & "{naštevni tip} binary_field {binarni podatki} null_field {null} "
      & "any_field {poljubno} other {neznano}}");
   P ("label.schema.schema_summary_label.fields",
      "{count, plural, one {1 polje} two {{count, number} polji} few {{count, "
      & "number} polja} other {{count, number} polj}}");
   P ("label.schema.schema_summary_label.required", "obvezna: {count, number}");
   P ("label.schema.schema_summary_label.optional", "neobvezna: {count, number}");
   P ("label.schema.schema_summary_label.deprecated", "zastarela: {count, number}");
   P ("label.schema.schema_summary_label.unknown", "neznana: {count, number}");
   P ("label.diagnostics.check_run_summary_label.none", "ni zagnanih preverjanj");
   P ("label.diagnostics.check_run_summary_label.passed", "uspešno: {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "neuspešno: {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 opozorilo} two {{count, number} opozorili} few "
      & "{{count, number} opozorila} other {{count, number} opozoril}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "preskočeno: {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "čaka: {count, number}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {1 element} two {{count, number} elementa} few "
      & "{{count, number} elementi} other {{count, number} elementov}}");
   P ("label.workflows.workflow_summary_label.completed", "dokončano: {count, number}");
   P ("label.workflows.workflow_summary_label.active", "aktivno: {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "blokirano: {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "neuspešno: {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "preskočeno: {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {1 element} two {{count, number} elementa} few "
      & "{{count, number} elementi} other {{count, number} elementov}}");
   P ("label.changes.change_summary_label.added", "dodano {count, number}");
   P ("label.changes.change_summary_label.removed", "odstranjeno {count, number}");
   P ("label.changes.change_summary_label.modified", "spremenjeno {count, number}");
   P ("label.changes.change_summary_label.renamed", "preimenovano {count, number}");
   P ("label.changes.change_summary_label.unchanged", "nespremenjeno {count, number}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {gumb} link_control {povezava} "
      & "tab_control {zavihek} menu_item_control {element menija} "
      & "checkbox_control {potrditveno polje} radio_control {izbirni gumb} "
      & "text_field_control {besedilno polje} progress_control {vrstica "
      & "napredka} table_cell_control {celica tabele} region_control {območje} "
      & "other {kontrolnik}} {named, select, no {brez imena} other {{name}}}");
   P ("label.markup.accessible_control_label.selected", "izbrano");
   P ("label.markup.accessible_control_label.expanded", "razširjeno");
   P ("label.markup.accessible_control_label.current", "trenutno");
   P ("label.markup.accessible_control_label.disabled", "onemogočeno");
   P ("label.markup.accessible_control_label.required", "obvezno");
   P ("label.markup.accessible_control_label.invalid", "neveljavno");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {1 element} two {{count, number} elementa} few "
      & "{{count, number} elementi} other {{count, number} elementov}}");
   P ("label.markup.accessible_control_label.position", "element {position} od {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {1 težava} two {{count, number} težavi} few "
      & "{{count, number} težave} other {{count, number} težav}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "shema");
   P ("label.endpoints.url_component.host", "gostitelj");
   P ("label.endpoints.url_component.path", "pot");
   P ("label.endpoints.url_component.query", "poizvedba");
   P ("label.endpoints.url_component.fragment", "fragment");
   P ("label.names.hue_noun.red", "rdeča");
   P ("label.names.hue_noun.orange", "oranžna");
   P ("label.names.hue_noun.yellow", "rumena");
   P ("label.names.hue_noun.green", "zelena");
   P ("label.names.hue_noun.cyan", "cijan");
   P ("label.names.hue_noun.blue", "modra");
   P ("label.names.hue_noun.purple", "vijolična");
   P ("label.names.hue_noun.magenta", "magenta");
   P ("label.names.hue_noun.neutral", "nevtralna");
   P ("label.names.hue_noun.pink", "rožnata");
   P ("label.names.hue_gender.red", "feminine");
   P ("label.names.hue_gender.orange", "feminine");
   P ("label.names.hue_gender.yellow", "feminine");
   P ("label.names.hue_gender.green", "feminine");
   P ("label.names.hue_gender.cyan", "masculine");
   P ("label.names.hue_gender.blue", "feminine");
   P ("label.names.hue_gender.purple", "feminine");
   P ("label.names.hue_gender.magenta", "feminine");
   P ("label.names.hue_gender.neutral", "feminine");
   P ("label.names.hue_gender.pink", "feminine");
   P ("label.names.agree.very_dark",
      "{gender, select, masculine {zelo temen} neuter {zelo temno} other "
      & "{zelo temna}}");
   P ("label.names.agree.dark", "{gender, select, masculine {temen} neuter {temno} other {temna}}");
   P ("label.names.agree.medium_brightness",
      "{gender, select, masculine {srednje svetel} neuter {srednje svetlo} "
      & "other {srednje svetla}}");
   P ("label.names.agree.light", "{gender, select, masculine {svetel} neuter {svetlo} other {svetla}}");
   P ("label.names.agree.very_light",
      "{gender, select, masculine {zelo svetel} neuter {zelo svetlo} other "
      & "{zelo svetla}}");
   P ("label.names.agree.desaturated",
      "{gender, select, masculine {nenasičen} neuter {nenasičeno} other "
      & "{nenasičena}}");
   P ("label.names.agree.muted",
      "{gender, select, masculine {pridušen} neuter {pridušeno} other "
      & "{pridušena}}");
   P ("label.names.agree.neutral",
      "{gender, select, masculine {nevtralen} neuter {nevtralno} other "
      & "{nevtralna}}");
   P ("label.names.agree.saturated",
      "{gender, select, masculine {nasičen} neuter {nasičeno} other "
      & "{nasičena}}");
   P ("label.names.agree.vivid", "{gender, select, masculine {živ} neuter {živo} other {živa}}");
   P ("label.names.agree.grayish",
      "{gender, select, masculine {sivkast} neuter {sivkasto} other "
      & "{sivkasta}}");
   P ("label.names.agree.soft", "{gender, select, masculine {mehek} neuter {mehko} other {mehka}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {zmerna kromatičnost}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {visoka kromatičnost}}");
   P ("label.names.agree.pastel",
      "{gender, select, masculine {pastelen} neuter {pastelno} other "
      & "{pastelna}}");
   P ("label.names.agree.warm", "{gender, select, masculine {topel} neuter {toplo} other {topla}}");
   P ("label.names.agree.cool", "{gender, select, masculine {hladen} neuter {hladno} other {hladna}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {nevtralna temperatura}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {uravnotežena temperatura}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
end Labels_4;
