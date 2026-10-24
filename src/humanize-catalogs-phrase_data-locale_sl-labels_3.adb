separate (Humanize.Catalogs.Phrase_Data.Locale_Sl)
procedure Labels_3 is
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
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} nad zmogljivostjo} other "
      & "{preostalo {count, number} od {total, number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {kvota presežena za {count, number} {unit} "
      & "(porabljeno {percent})} near {kvota skoraj porabljena: preostalo "
      & "{count, number} {unit} (porabljeno {percent})} other {kvota na voljo: "
      & "preostalo {count, number} {unit} (porabljeno {percent})}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {delež zadetkov predpomnilnika ni na voljo: ni "
      & "zahtev} other {delež zadetkov predpomnilnika {percent}: {hits, "
      & "plural, one {{hits, number} zadetek} two {{hits, number} zadetka} few "
      & "{{hits, number} zadetki} other {{hits, number} zadetkov}}, {misses, "
      & "plural, one {{misses, number} zgrešitev} two {{misses, number} "
      & "zgrešitvi} few {{misses, number} zgrešitve} other {{misses, number} "
      & "zgrešitev}}}}");
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
      & "dogodka {name}} other {atribut {name}, nastavljen na „{value}“}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {{count, number} atribut} two {{count, number} "
      & "atributa} few {{count, number} atributi} other {{count, number} "
      & "atributov}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {{count, number} podatkovni atribut} two {{count, "
      & "number} podatkovna atributa} few {{count, number} podatkovni atributi} "
      & "other {{count, number} podatkovnih atributov}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {{count, number} atribut ARIA} two {{count, "
      & "number} atributa ARIA} few {{count, number} atributi ARIA} other "
      & "{{count, number} atributov ARIA}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {{count, number} rokovalnik dogodkov} two {{count, "
      & "number} rokovalnika dogodkov} few {{count, number} rokovalniki "
      & "dogodkov} other {{count, number} rokovalnikov dogodkov}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {besedilna vsebina} html_content {dokument "
      & "HTML} json_content {dokument JSON} xml_content {dokument XML} "
      & "image_content {slika} audio_content {zvok} video_content {video} "
      & "font_content {pisava} archive_content {arhiv} binary_content {binarna "
      & "vsebina} form_content {oddaja obrazca} other {neznana vsebina}} "
      & "({base})");
   P ("label.markup.heading_label", "naslov ravni {level, number}");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {{count, number} oznaka} two {{count, number} "
      & "oznaki} few {{count, number} oznake} other {{count, number} oznak}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {{count, number} povezava} two {{count, number} "
      & "povezavi} few {{count, number} povezave} other {{count, number} "
      & "povezav}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} medijski element} two {{count, "
      & "number} medijska elementa} few {{count, number} medijski elementi} "
      & "other {{count, number} medijskih elementov}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} kontrolnik obrazca} two {{count, "
      & "number} kontrolnika obrazca} few {{count, number} kontrolniki obrazca} "
      & "other {{count, number} kontrolnikov obrazca}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {{count, number} naslov} two {{count, number} "
      & "naslova} few {{count, number} naslovi} other {{count, number} "
      & "naslovov}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {{count, number} orientacijska točka} two "
      & "{{count, number} orientacijski točki} few {{count, number} "
      & "orientacijske točke} other {{count, number} orientacijskih točk}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {{count, number} obrazec} two {{count, number} "
      & "obrazca} few {{count, number} obrazci} other {{count, number} "
      & "obrazcev}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} medijski element} two {{count, "
      & "number} medijska elementa} few {{count, number} medijski elementi} "
      & "other {{count, number} medijskih elementov}}");
   P ("label.markup.table_navigation_label",
      "{caption}, vrstica {row, number} od {rows, number}, stolpec {column, "
      & "number} od {columns, number}");
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
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} skrivnost} two {{count, number} "
      & "skrivnosti} few {{count, number} skrivnosti} other {{count, number} "
      & "skrivnosti}}");
   P ("label.secrets.secret_count_label.masked", "zakrito: {count, number}");
   P ("label.secrets.secret_count_label.unset", "nenastavljeno: {count, number}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} prstni odtis} two {{count, "
      & "number} prstna odtisa} few {{count, number} prstni odtisi} other "
      & "{{count, number} prstnih odtisov}}");
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
   P ("label.schema.type_mismatch_label",
      "polje {field_name}: pričakovana vrsta {expected, select, string_field "
      & "{niz} integer_field {celo število} decimal_field {decimalno število} "
      & "boolean_field {logična vrednost} date_field {datum} date_time_field "
      & "{datum in čas} object_field {objekt} array_field {polje} enum_field "
      & "{naštevni tip} binary_field {binarni podatki} null_field {null} "
      & "any_field {poljubno} other {neznano}}, dejanska {actual, select, "
      & "string_field {niz} integer_field {celo število} decimal_field "
      & "{decimalno število} boolean_field {logična vrednost} date_field "
      & "{datum} date_time_field {datum in čas} object_field {objekt} "
      & "array_field {polje} enum_field {naštevni tip} binary_field {binarni "
      & "podatki} null_field {null} any_field {poljubno} other {neznano}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} blokirajoča težava} two {{blocking, number} blokirajoči "
      & "težavi} few {{blocking, number} blokirajoče težave} other "
      & "{{blocking, number} blokirajočih težav}}} blocking {{base}, "
      & "{blocking, plural, one {{blocking, number} blokirajoča težava} two "
      & "{{blocking, number} blokirajoči težavi} few {{blocking, number} "
      & "blokirajoče težave} other {{blocking, number} blokirajočih "
      & "težav}}} only {samo {base}} other {{base}}}");
   P ("label.diagnostics.check_run_summary_label.none", "ni zagnanih preverjanj");
   P ("label.diagnostics.check_run_summary_label.passed", "uspešno: {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "neuspešno: {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 opozorilo} two {{count, number} opozorili} few "
      & "{{count, number} opozorila} other {{count, number} opozoril}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "preskočeno: {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "čaka: {count, number}");
   P ("label.thresholds.metric_value_label", "{name}: {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {ciljni obseg od {low} do {high}} "
      & "other {ciljno okno od {low} do {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} znotraj pričakovanega obsega} below "
      & "{{value} pod pričakovanim obsegom} other {{value} nad pričakovanim "
      & "obsegom}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} na kritičnem pragu} warning "
      & "{{value} na opozorilnem pragu} other {{value} v običajnem obsegu}}");
   P ("label.thresholds.breach_label", "{state, select, ok {ni preseženo} other {preseženo za {difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {cilj dosežen} below {{difference} pod ciljem} "
      & "other {{difference} nad ciljem}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {meja presežena} near {blizu meje, preostalo "
      & "{distance}} other {{distance} do meje}}");
   P ("label.thresholds.threshold_summary_label.none", "ni metrik");
   P ("label.thresholds.threshold_summary_label.normal", "običajno: {count, number}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {{count, number} opozorilo} two {{count, number} "
      & "opozorili} few {{count, number} opozorila} other {{count, number} "
      & "opozoril}}");
   P ("label.thresholds.threshold_summary_label.critical", "kritično: {count, number}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {{count, number} prekoračitev} two {{count, "
      & "number} prekoračitvi} few {{count, number} prekoračitve} other "
      & "{{count, number} prekoračitev}}");
   P ("label.thresholds.target_window_label", "cilj {target} plus/minus {tolerance}");
   P ("label.thresholds.tolerance_label", "toleranca {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} meje");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {meja presežena za {amount}} other "
      & "{preostalo {amount}}}");
   P ("label.thresholds.budget_used_label", "porabljeno {used} od {budget}");
   P ("label.workflows.step_label", "korak {current, number} od {total, number}: {name}");
   P ("label.workflows.milestone_label", "dokončani mejniki: {current, number} od {total, number}, {name}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {1 element} two {{count, number} elementa} few "
      & "{{count, number} elementi} other {{count, number} elementov}}");
   P ("label.workflows.workflow_summary_label.completed", "dokončano: {count, number}");
   P ("label.workflows.workflow_summary_label.active", "aktivno: {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "blokirano: {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "neuspešno: {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "preskočeno: {count, number}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {ni elementov poteka dela} half {potek dela na "
      & "polovici} other {dokončano {completed, number} od {total, number}}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {mesto v čakalni vrsti {position, number}} other "
      & "{mesto v čakalni vrsti {position, number} od {total, number}}}");
   P ("label.changes.change_set_label.none", "brez sprememb");
   P ("label.changes.change_set_label.added", "dodano {count, number}");
   P ("label.changes.change_set_label.removed", "odstranjeno {count, number}");
   P ("label.changes.change_set_label.modified", "spremenjeno {count, number}");
   P ("label.changes.change_set_label.unchanged", "nespremenjeno {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {1 element} two {{count, number} elementa} few "
      & "{{count, number} elementi} other {{count, number} elementov}}");
   P ("label.changes.change_summary_label.added", "dodano {count, number}");
   P ("label.changes.change_summary_label.removed", "odstranjeno {count, number}");
   P ("label.changes.change_summary_label.modified", "spremenjeno {count, number}");
   P ("label.changes.change_summary_label.renamed", "preimenovano {count, number}");
   P ("label.changes.change_summary_label.unchanged", "nespremenjeno {count, number}");
   P ("label.changes.sync_change_label.none", "brez sprememb sinhronizacije");
   P ("label.changes.sync_change_label.uploaded", "naloženo {count, number}");
   P ("label.changes.sync_change_label.downloaded", "preneseno {count, number}");
   P ("label.changes.sync_change_label.deleted", "izbrisano {count, number}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} konflikt} two {{count, number} "
      & "konflikta} few {{count, number} konflikti} other {{count, number} "
      & "konfliktov}}");
   P ("label.changes.net_change_label",
      "{state, select, none {brez neto spremembe} up {neto +{count, plural, "
      & "one {{count, number} element} two {{count, number} elementa} few "
      & "{{count, number} elementi} other {{count, number} elementov}}} other "
      & "{neto -{count, plural, one {{count, number} element} two {{count, "
      & "number} elementa} few {{count, number} elementi} other {{count, "
      & "number} elementov}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {ni sprememb za pregled} all {vse spremembe "
      & "pregledane} other {pregledane spremembe: {reviewed, number} od {total, "
      & "number}}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name}: nespremenjeno ({new_value})} up "
      & "{{field_name}: povečano iz {old_value} na {new_value}} other "
      & "{{field_name}: zmanjšano iz {old_value} na {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {ni vrstic za izbiro} none {ni izbranih "
      & "vrstic} all {{total, plural, =1 {izbrana 1 vrstica} other {izbrane vse "
      & "vrstice ({total, number})}}} other {izbrane vrstice: {selected, "
      & "number} od {total, number}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {ni strani} other {{pages, plural, =0 {ni strani} "
      & "other {{rows, plural, =0 {stran {page, number} od {pages, number}} "
      & "other {stran {page, number} od {pages, number}, {rows, plural, one "
      & "{{rows, number} vrstica} two {{rows, number} vrstici} few {{rows, "
      & "number} vrstice} other {{rows, number} vrstic}}}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {ni vrstic} none {ni ujemajočih se vrstic} "
      & "all {{total, plural, =1 {prikazana 1 vrstica} other {prikazane vse "
      & "vrstice ({total, number})}}} other {prikazane vrstice: {visible, "
      & "number} od {total, number}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {ni vrstic} single {vrstica {first_row, number} "
      & "od {total, number}} other {vrstice {first_row, number}–{last_row, "
      & "number} od {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {brez omejitve znakov} none_left {ni "
      & "preostalih znakov} left {{count, plural, one {preostane {count, "
      & "number} znak} two {preostaneta {count, number} znaka} few {preostanejo "
      & "{count, number} znaki} other {preostane {count, number} znakov}}} "
      & "other {omejitev presežena za {count, plural, one {{count, number} "
      & "znak} two {{count, number} znaka} few {{count, number} znake} other "
      & "{{count, number} znakov}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {ni obveznih polj} other {{missing, plural, =0 {vsa "
      & "obvezna polja izpolnjena} other {manjkajoča obvezna polja: {missing, "
      & "number} od {total, number}}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {ni polj} all {vsa polja izpolnjena} other "
      & "{izpolnjena polja: {completed, number} od {total, number}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: ni polj} all {{name}: vsa polja "
      & "izpolnjena} other {{name}: izpolnjena polja: {completed, number} od "
      & "{total, number}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {ni korakov obrazca} =1 {korak 1 od 1: {name}} "
      & "other {korak {current, number} od {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {ni drobtin} =1 {drobtina 1 od 1: {name}} other "
      & "{drobtina {current, number} od {total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {ni zavihkov} =1 {zavihek 1 od 1: {name}} other "
      & "{zavihek {current, number} od {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {prazen nabiralnik} other {{unread, plural, =0 {vsa "
      & "obvestila prebrana} other {neprebrana obvestila: {unread, number} od "
      & "{total, number}}}}}");
   P ("label.notifications.delivery_attempt_label", "poskus dostave {attempt, number} od {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {ni elementov kontrolnega seznama} other "
      & "{dokončani elementi: {done, number} od {total, number}}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {ni nalaganj} other {dokončana nalaganja: {done, "
      & "number} od {total, number}}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {ni zmogljivosti} other {rezervirana mesta: "
      & "{reserved, number} od {capacity, number}}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {mesto na čakalnem seznamu {position, number}} "
      & "other {mesto na čakalnem seznamu {position, number} od {total, "
      & "number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name}: spremenjeno {changed, "
      & "number}/{total, number}} other {{name}: spremenjeno {changed, number}, "
      & "nespremenjeno {unchanged, number}, skupaj {total, number}}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
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
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "trenutna barva ospredja dosega kontrast velikega besedila pri "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "trenutna barva ospredja dosega kontrast običajnega besedila pri "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "uporabite {v1} za izboljšan kontrast besedila {v2, number}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "uporabite {v1} za kontrast velikega besedila {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "uporabite {v1} za kontrast običajnega besedila {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "uporabite {v1} za kontrast velikega besedila {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "uporabite {v1} za izboljšan kontrast besedila {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "trenutna barva ospredja dosega kontrast velikega besedila pri {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "trenutna barva ospredja dosega kontrast običajnega besedila pri {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "trenutna barva ospredja dosega izboljšan kontrast besedila pri "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "trenutna barva ospredja dosega izboljšan kontrast besedila pri {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopija: nizko tveganje zamenjave, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "devteranopija: zmerno tveganje zamenjave, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopija: zmerno tveganje zamenjave, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "akromatopsija: visoko tveganje zamenjave, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, dramatična zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, dramatična zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 (tekstil) delta {v1}, dramatična zaznavna razlika");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, dramatična zaznavna razlika");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, velika zaznavna razlika");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopija: zmerno tveganje zamenjave, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, dramatična zaznavna razlika");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, dramatična zaznavna razlika");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, dramatična zaznavna razlika");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "akromatopsija: nizko tveganje zamenjave, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopija: barve razločljive, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "devteranopija: barve razločljive, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopija: barve razločljive, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "akromatopsija: barve razločljive, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "akromatopsija: zmerno tveganje zamenjave, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, velika zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, velika zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 (tekstil) delta {v1}, velika zaznavna razlika");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, velika zaznavna razlika");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, opazna zaznavna razlika");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopija: visoko tveganje zamenjave, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopija: visoko tveganje zamenjave, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, opazna zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 (tekstil) delta {v1}, opazna zaznavna razlika");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, opazna zaznavna razlika");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, opazna zaznavna razlika");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopija: nizko tveganje zamenjave, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "devteranopija: nizko tveganje zamenjave, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, velika zaznavna razlika");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "devteranopija: visoko tveganje zamenjave, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, dramatična zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 (tekstil) delta {v1, number}, dramatična zaznavna razlika");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, dramatična zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, velika zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 (tekstil) delta {v1, number}, velika zaznavna razlika");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, velika zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, opazna zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 (tekstil) delta {v1}, subtilna zaznavna razlika");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, opazna zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 (tekstil) delta {v1, number}, opazna zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, komaj zaznavna");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, nezaznavna");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 (tekstil) delta {v1}, nezaznavna");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible", "CIEDE2000 delta {v1}, nezaznavna");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, nezaznavna");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, velika zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible", "CIE76 delta {v1, number}, nezaznavna");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible", "CIE94 delta {v1, number}, nezaznavna");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 (tekstil) delta {v1, number}, nezaznavna");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, nezaznavna");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible", "OKLab delta {v1, number}, nezaznavna");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, subtilna zaznavna razlika");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, subtilna zaznavna razlika");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, subtilna zaznavna razlika");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, komaj zaznavna");
   P ("label.metrics.text_summary.n_words",
      "{v1, plural, one {{v1, number} beseda} two {{v1, number} besedi} few "
      & "{{v1, number} besede} other {{v1, number} besed}}");
   P ("label.metrics.text_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} odstavek} two {{v1, number} odstavka} "
      & "few {{v1, number} odstavki} other {{v1, number} odstavkov}}");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} min govora");
   P ("label.metrics.text_summary.n_sentences",
      "{v1, plural, one {{v1, number} poved} two {{v1, number} povedi} few "
      & "{{v1, number} povedi} other {{v1, number} povedi}}");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} min branja");
   P ("label.metrics.text_summary.n_paragraph",
      "{v1, plural, one {{v1, number} odstavek} two {{v1, number} odstavka} "
      & "few {{v1, number} odstavki} other {{v1, number} odstavkov}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "manj kot {v1, number} min govora");
   P ("label.metrics.text_summary.less_than_n_minute_read", "manj kot {v1, number} min branja");
   P ("label.metrics.text_summary.n_sentence",
      "{v1, plural, one {{v1, number} poved} two {{v1, number} povedi} few "
      & "{{v1, number} povedi} other {{v1, number} povedi}}");
   P ("label.metrics.text_summary.no_words", "ni besed");
   P ("label.metrics.text_summary.no_paragraphs", "ni odstavkov");
   P ("label.metrics.text_summary.no_sentences", "ni povedi");
   P ("label.metrics.text_summary.n_word",
      "{v1, plural, one {{v1, number} beseda} two {{v1, number} besedi} few "
      & "{{v1, number} besede} other {{v1, number} besed}}");
   P ("label.names.hue_family_label.neutral", "nevtralna");
   P ("label.names.saturation_label.neutral", "nevtralna");
   P ("label.names.temperature_label.neutral_temperature", "nevtralna temperatura");
   P ("label.names.chroma_label.grayish", "sivkasta");
   P ("label.names.nearest_color_name.black", "črna");
   P ("label.models.brightness_label.very_dark", "zelo temna");
   P ("label.names.hue_family_label.blue", "modra");
   P ("label.names.saturation_label.vivid", "živa");
   P ("label.names.temperature_label.cool", "hladna");
   P ("label.names.chroma_label.moderate_chroma", "zmerna kromatičnost");
   P ("label.names.nearest_color_name.navy", "mornarsko modra");
   P ("label.names.chroma_label.high_chroma", "visoka kromatičnost");
   P ("label.names.nearest_color_name.blue", "modra");
   P ("label.names.hue_family_label.green", "zelena");
   P ("label.names.temperature_label.balanced_temperature", "uravnotežena temperatura");
   P ("label.names.hue_family_label.cyan", "cijan");
   P ("label.names.chroma_label.soft", "mehka");
   P ("label.models.brightness_label.dark", "temna");
   P ("label.names.nearest_color_name.green", "zelena");
   P ("label.names.nearest_color_name.teal", "modrozelena");
   P ("label.models.brightness_label.medium_brightness", "srednja svetlost");
   P ("label.names.nearest_color_name.aqua", "akva");
   P ("label.names.nearest_color_name.lime", "limetna");
   P ("label.models.brightness_label.light", "svetla");
   P ("label.names.hue_family_label.red", "rdeča");
   P ("label.names.temperature_label.warm", "topla");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "vijolična");
   P ("label.names.hue_family_label.yellow", "rumena");
   P ("label.names.saturation_label.muted", "pridušena");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "nasičena");
   P ("label.names.nearest_color_name.maroon", "kostanjeva");
   P ("label.names.nearest_color_name.purple", "vijolična");
   P ("label.names.hue_family_label.orange", "oranžna");
   P ("label.names.nearest_color_name.olive", "olivna");
   P ("label.names.nearest_color_name.gray", "siva");
   P ("label.names.saturation_label.desaturated", "nenasičena");
   P ("label.names.nearest_color_name.silver", "srebrna");
   P ("label.names.chroma_label.pastel", "pastelna");
   P ("label.models.brightness_label.very_light", "zelo svetla");
end Labels_3;
