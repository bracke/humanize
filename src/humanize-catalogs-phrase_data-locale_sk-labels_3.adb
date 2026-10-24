separate (Humanize.Catalogs.Phrase_Data.Locale_Sk)
procedure Labels_3 is
begin
   P ("label.contrast.opacity_label",
      "{percent}, {state, select, transparent {priehľadná} "
      & "mostly_transparent {prevažne priehľadná} translucent {priesvitná} "
      & "mostly_opaque {prevažne nepriehľadná} other {nepriehľadná}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {žiadne pozorovania} one {{count, number} "
      & "pozorovanie, min. {minimum} {unit}, medián {median} {unit}, max. "
      & "{maximum} {unit}} few {{count, number} pozorovania, min. {minimum} "
      & "{unit}, medián {median} {unit}, max. {maximum} {unit}} many {{count, "
      & "number} pozorovania, min. {minimum} {unit}, medián {median} {unit}, "
      & "max. {maximum} {unit}} other {{count, number} pozorovaní, min. "
      & "{minimum} {unit}, medián {median} {unit}, max. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {žiadne pozorovania} other "
      & "{0 odľahlých hodnôt z {total, number} pozorovaní}}} one "
      & "{{outliers, number} odľahlá hodnota z {total, number} pozorovaní} "
      & "few {{outliers, number} odľahlé hodnoty z {total, number} "
      & "pozorovaní} many {{outliers, number} odľahlej hodnoty z {total, "
      & "number} pozorovaní} other {{outliers, number} odľahlých hodnôt z "
      & "{total, number} pozorovaní}}");
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
      "metadáta adresy: {present, plural, one {1 uvedené pole} few "
      & "{{present, number} uvedené polia} many {{present, number} uvedeného "
      & "poľa} other {{present, number} uvedených polí}}, {missing, plural, "
      & "one {1 pole chýba} few {{missing, number} polia chýbajú} many "
      & "{{missing, number} poľa chýba} other {{missing, number} polí "
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
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} nad kapacitu} other "
      & "{zostáva {count, number} z {total, number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {kvóta prekročená o {count, number} {unit} "
      & "(využité {percent})} near {kvóta takmer vyčerpaná: zostáva "
      & "{count, number} {unit} (využité {percent})} other {kvóta k "
      & "dispozícii: zostáva {count, number} {unit} (využité {percent})}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {úspešnosť vyrovnávacej pamäte nedostupná: "
      & "žiadne požiadavky} other {úspešnosť vyrovnávacej pamäte "
      & "{percent}: {hits, plural, one {{hits, number} zásah} few {{hits, "
      & "number} zásahy} many {{hits, number} zásahu} other {{hits, number} "
      & "zásahov}}, {misses, plural, one {{misses, number} minutie} few "
      & "{{misses, number} minutia} many {{misses, number} minutia} other "
      & "{{misses, number} minutí}}}}");
   P ("label.resources.saturation_label", "{named, select, no {prostriedok} other {{name}}}: {percent}, {band}");
   P ("label.versions.version_label",
      "{state, select, both {verzia {version}, predbežná verzia "
      & "{prerelease}, zostavenie {build}} prerelease {verzia {version}, "
      & "predbežná verzia {prerelease}} build {verzia {version}, zostavenie "
      & "{build}} other {verzia {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {rovnaká verzia} major_upgrade "
      & "{zvýšenie hlavnej verzie} minor_upgrade {zvýšenie vedľajšej "
      & "verzie} patch_upgrade {zvýšenie opravnej verzie} prerelease_change "
      & "{zmena predbežnej verzie} build_metadata_change {zmena metadát "
      & "zostavenia} downgrade {zníženie verzie} other {neznáma zmena "
      & "verzie}}: {from} -> {to}");
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
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {{count, number} atribút} few {{count, number} "
      & "atribúty} many {{count, number} atribútu} other {{count, number} "
      & "atribútov}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {{count, number} dátový atribút} few {{count, "
      & "number} dátové atribúty} many {{count, number} dátového "
      & "atribútu} other {{count, number} dátových atribútov}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {{count, number} atribút ARIA} few {{count, "
      & "number} atribúty ARIA} many {{count, number} atribútu ARIA} other "
      & "{{count, number} atribútov ARIA}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {{count, number} obslužná rutina udalostí} few "
      & "{{count, number} obslužné rutiny udalostí} many {{count, number} "
      & "obslužnej rutiny udalostí} other {{count, number} obslužných "
      & "rutín udalostí}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {textový obsah} html_content {dokument "
      & "HTML} json_content {dokument JSON} xml_content {dokument XML} "
      & "image_content {obrázok} audio_content {zvuk} video_content {video} "
      & "font_content {písmo} archive_content {archív} binary_content "
      & "{binárny obsah} form_content {odoslanie formulára} other {neznámy "
      & "obsah}} ({base})");
   P ("label.markup.heading_label", "nadpis úrovne {level, number}");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {{count, number} značka} few {{count, number} "
      & "značky} many {{count, number} značky} other {{count, number} "
      & "značiek}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {{count, number} odkaz} few {{count, number} "
      & "odkazy} many {{count, number} odkazu} other {{count, number} odkazov}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} mediálny prvok} few {{count, "
      & "number} mediálne prvky} many {{count, number} mediálneho prvku} "
      & "other {{count, number} mediálnych prvkov}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} ovládací prvok formulára} few "
      & "{{count, number} ovládacie prvky formulára} many {{count, number} "
      & "ovládacieho prvku formulára} other {{count, number} ovládacích "
      & "prvkov formulára}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {{count, number} nadpis} few {{count, number} "
      & "nadpisy} many {{count, number} nadpisu} other {{count, number} "
      & "nadpisov}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {{count, number} orientačný bod} few {{count, "
      & "number} orientačné body} many {{count, number} orientačného bodu} "
      & "other {{count, number} orientačných bodov}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {{count, number} formulár} few {{count, number} "
      & "formuláre} many {{count, number} formulára} other {{count, number} "
      & "formulárov}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} mediálny prvok} few {{count, "
      & "number} mediálne prvky} many {{count, number} mediálneho prvku} "
      & "other {{count, number} mediálnych prvkov}}");
   P ("label.markup.table_navigation_label",
      "{caption}, riadok {row, number} z {rows, number}, stĺpec {column, "
      & "number} z {columns, number}");
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
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} tajný údaj} few {{count, "
      & "number} tajné údaje} many {{count, number} tajného údaja} other "
      & "{{count, number} tajných údajov}}");
   P ("label.secrets.secret_count_label.masked", "maskované: {count, number}");
   P ("label.secrets.secret_count_label.unset", "nenastavené: {count, number}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} odtlačok} few {{count, number} "
      & "odtlačky} many {{count, number} odtlačku} other {{count, number} "
      & "odtlačkov}}");
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
   P ("label.schema.type_mismatch_label",
      "pole {field_name}: očakávaný typ {expected, select, string_field "
      & "{reťazec} integer_field {celé číslo} decimal_field {desatinné "
      & "číslo} boolean_field {logická hodnota} date_field {dátum} "
      & "date_time_field {dátum a čas} object_field {objekt} array_field "
      & "{pole} enum_field {výčet} binary_field {binárne dáta} null_field "
      & "{null} any_field {ľubovoľný} other {neznámy}}, skutočný {actual, "
      & "select, string_field {reťazec} integer_field {celé číslo} "
      & "decimal_field {desatinné číslo} boolean_field {logická hodnota} "
      & "date_field {dátum} date_time_field {dátum a čas} object_field "
      & "{objekt} array_field {pole} enum_field {výčet} binary_field "
      & "{binárne dáta} null_field {null} any_field {ľubovoľný} other "
      & "{neznámy}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} blokujúci problém} few {{blocking, number} blokujúce "
      & "problémy} many {{blocking, number} blokujúceho problému} other "
      & "{{blocking, number} blokujúcich problémov}}} blocking {{base}, "
      & "{blocking, plural, one {{blocking, number} blokujúci problém} few "
      & "{{blocking, number} blokujúce problémy} many {{blocking, number} "
      & "blokujúceho problému} other {{blocking, number} blokujúcich "
      & "problémov}}} only {iba {base}} other {{base}}}");
   P ("label.diagnostics.check_run_summary_label.none", "nespustili sa žiadne kontroly");
   P ("label.diagnostics.check_run_summary_label.passed", "prešlo: {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "zlyhalo: {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 upozornenie} few {{count, number} upozornenia} "
      & "many {{count, number} upozornenia} other {{count, number} "
      & "upozornení}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "preskočené: {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "čaká: {count, number}");
   P ("label.thresholds.metric_value_label", "{name}: {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {cieľový rozsah {low} až "
      & "{high}} other {cieľové okno {low} až {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} v očakávanom rozsahu} below {{value} "
      & "pod očakávaným rozsahom} other {{value} nad očakávaným "
      & "rozsahom}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} na kritickom prahu} warning {{value} "
      & "na prahu varovania} other {{value} v normálnom rozsahu}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {neprekročené} other {prekročené o "
      & "{difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {cieľ splnený} below {{difference} pod cieľom} "
      & "other {{difference} nad cieľom}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {limit prekročený} near {blízko limitu, "
      & "zostáva {distance}} other {{distance} od limitu}}");
   P ("label.thresholds.threshold_summary_label.none", "žiadne metriky");
   P ("label.thresholds.threshold_summary_label.normal", "normálne: {count, number}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {{count, number} varovanie} few {{count, number} "
      & "varovania} many {{count, number} varovania} other {{count, number} "
      & "varovaní}}");
   P ("label.thresholds.threshold_summary_label.critical", "kritické: {count, number}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {{count, number} prekročenie} few {{count, "
      & "number} prekročenia} many {{count, number} prekročenia} other "
      & "{{count, number} prekročení}}");
   P ("label.thresholds.target_window_label", "cieľ {target} plus/mínus {tolerance}");
   P ("label.thresholds.tolerance_label", "tolerancia {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} limitu");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {limit prekročený o {amount}} other "
      & "{zostáva {amount}}}");
   P ("label.thresholds.budget_used_label", "využité {used} z {budget}");
   P ("label.workflows.step_label", "krok {current, number} z {total, number}: {name}");
   P ("label.workflows.milestone_label", "dokončené míľniky: {current, number} z {total, number}, {name}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {1 položka} few {{count, number} položky} many "
      & "{{count, number} položky} other {{count, number} položiek}}");
   P ("label.workflows.workflow_summary_label.completed", "dokončené: {count, number}");
   P ("label.workflows.workflow_summary_label.active", "aktívne: {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "blokované: {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "zlyhané: {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "preskočené: {count, number}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {žiadne položky pracovného postupu} half "
      & "{pracovný postup v polovici} other {dokončené {completed, number} z "
      & "{total, number}}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {pozícia vo fronte {position, number}} other "
      & "{pozícia vo fronte {position, number} z {total, number}}}");
   P ("label.changes.change_set_label.none", "žiadne zmeny");
   P ("label.changes.change_set_label.added", "pridané {count, number}");
   P ("label.changes.change_set_label.removed", "odstránené {count, number}");
   P ("label.changes.change_set_label.modified", "zmenené {count, number}");
   P ("label.changes.change_set_label.unchanged", "bez zmeny {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {1 položka} few {{count, number} položky} many "
      & "{{count, number} položky} other {{count, number} položiek}}");
   P ("label.changes.change_summary_label.added", "pridané {count, number}");
   P ("label.changes.change_summary_label.removed", "odstránené {count, number}");
   P ("label.changes.change_summary_label.modified", "zmenené {count, number}");
   P ("label.changes.change_summary_label.renamed", "premenované {count, number}");
   P ("label.changes.change_summary_label.unchanged", "bez zmeny {count, number}");
   P ("label.changes.sync_change_label.none", "žiadne zmeny synchronizácie");
   P ("label.changes.sync_change_label.uploaded", "nahrané {count, number}");
   P ("label.changes.sync_change_label.downloaded", "stiahnuté {count, number}");
   P ("label.changes.sync_change_label.deleted", "odstránené {count, number}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} konflikt} few {{count, number} "
      & "konflikty} many {{count, number} konfliktu} other {{count, number} "
      & "konfliktov}}");
   P ("label.changes.net_change_label",
      "{state, select, none {žiadna čistá zmena} up {netto +{count, "
      & "plural, one {{count, number} položka} few {{count, number} položky} "
      & "many {{count, number} položky} other {{count, number} položiek}}} "
      & "other {netto -{count, plural, one {{count, number} položka} few "
      & "{{count, number} položky} many {{count, number} položky} other "
      & "{{count, number} položiek}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {žiadne zmeny na kontrolu} all {všetky zmeny "
      & "skontrolované} other {skontrolované zmeny: {reviewed, number} z "
      & "{total, number}}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name}: bez zmeny ({new_value})} up "
      & "{{field_name}: zvýšené z {old_value} na {new_value}} other "
      & "{{field_name}: znížené z {old_value} na {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {žiadne riadky na výber} none {nie sú "
      & "vybrané žiadne riadky} all {{total, plural, =1 {vybraný 1 riadok} "
      & "other {vybrané všetky riadky ({total, number})}}} other {vybrané "
      & "riadky: {selected, number} z {total, number}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {žiadne strany} other {{pages, plural, =0 {žiadne "
      & "strany} other {{rows, plural, =0 {strana {page, number} z {pages, "
      & "number}} other {strana {page, number} z {pages, number}, {rows, "
      & "plural, one {{rows, number} riadok} few {{rows, number} riadky} many "
      & "{{rows, number} riadka} other {{rows, number} riadkov}}}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {žiadne riadky} none {žiadne zodpovedajúce "
      & "riadky} all {{total, plural, =1 {zobrazený 1 riadok} other "
      & "{zobrazené všetky riadky ({total, number})}}} other {zobrazené "
      & "riadky: {visible, number} z {total, number}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {žiadne riadky} single {riadok {first_row, "
      & "number} z {total, number}} other {riadky {first_row, "
      & "number}–{last_row, number} z {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {bez limitu znakov} none_left {nezostávajú "
      & "žiadne znaky} left {{count, plural, one {zostáva {count, number} "
      & "znak} few {zostávajú {count, number} znaky} many {zostáva {count, "
      & "number} znaku} other {zostáva {count, number} znakov}}} other {limit "
      & "prekročený o {count, plural, one {{count, number} znak} few {{count, "
      & "number} znaky} many {{count, number} znaku} other {{count, number} "
      & "znakov}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {žiadne povinné polia} other {{missing, plural, "
      & "=0 {všetky povinné polia vyplnené} other {chýbajúce povinné "
      & "polia: {missing, number} z {total, number}}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {žiadne polia} all {všetky polia vyplnené} "
      & "other {vyplnené polia: {completed, number} z {total, number}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: žiadne polia} all {{name}: všetky "
      & "polia vyplnené} other {{name}: vyplnené polia: {completed, number} z "
      & "{total, number}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {žiadne kroky formulára} =1 {krok 1 z 1: {name}} "
      & "other {krok {current, number} z {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {žiadna navigačná cesta} =1 {položka "
      & "navigačnej cesty 1 z 1: {name}} other {položka navigačnej cesty "
      & "{current, number} z {total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {žiadne karty} =1 {karta 1 z 1: {name}} other "
      & "{karta {current, number} z {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {prázdna doručená pošta} other {{unread, "
      & "plural, =0 {všetky oznámenia prečítané} other {neprečítané "
      & "oznámenia: {unread, number} z {total, number}}}}}");
   P ("label.notifications.delivery_attempt_label", "pokus o doručenie {attempt, number} z {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {žiadne položky kontrolného zoznamu} other "
      & "{dokončené položky: {done, number} z {total, number}}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {žiadne nahrávania} other {dokončené "
      & "nahrávania: {done, number} z {total, number}}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {žiadna kapacita} other {rezervované miesta: "
      & "{reserved, number} z {capacity, number}}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {pozícia v poradovníku {position, number}} other "
      & "{pozícia v poradovníku {position, number} z {total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name}: zmenené {changed, "
      & "number}/{total, number}} other {{name}: zmenené {changed, number}, "
      & "bez zmeny {unchanged, number}, celkom {total, number}}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {tlačidlo} link_control {odkaz} "
      & "tab_control {karta} menu_item_control {položka ponuky} "
      & "checkbox_control {začiarkavacie políčko} radio_control {prepínač} "
      & "text_field_control {textové pole} progress_control {indikátor "
      & "priebehu} table_cell_control {bunka tabuľky} region_control {oblasť} "
      & "other {ovládací prvok}} {named, select, no {bez názvu} other "
      & "{{name}}}");
   P ("label.markup.accessible_control_label.selected", "vybrané");
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
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "aktuálna farba popredia spĺňa kontrast pre veľký text pri "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "aktuálna farba popredia spĺňa kontrast pre bežný text pri "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "použite {v1} na dosiahnutie zvýšeného kontrastu textu {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "použite {v1} na dosiahnutie kontrastu pre veľký text {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "použite {v1} na dosiahnutie kontrastu pre bežný text {v2}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "použite {v1} na dosiahnutie kontrastu pre veľký text {v2}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "použite {v1} na dosiahnutie zvýšeného kontrastu textu {v2}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "aktuálna farba popredia spĺňa kontrast pre veľký text pri {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "aktuálna farba popredia spĺňa kontrast pre bežný text pri {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "aktuálna farba popredia spĺňa zvýšený kontrast textu pri "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "aktuálna farba popredia spĺňa zvýšený kontrast textu pri {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopia: nízke riziko zámeny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopia: stredné riziko zámeny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopia: stredné riziko zámeny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "achromatopsia: vysoké riziko zámeny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, dramatický vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, dramatický vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 (textil) delta {v1}, dramatický vnemový rozdiel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, dramatický vnemový rozdiel");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, veľký vnemový rozdiel");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopia: stredné riziko zámeny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, dramatický vnemový rozdiel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, dramatický vnemový rozdiel");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, dramatický vnemový rozdiel");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "achromatopsia: nízke riziko zámeny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopia: farby rozlíšiteľné, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopia: farby rozlíšiteľné, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopia: farby rozlíšiteľné, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "achromatopsia: farby rozlíšiteľné, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "achromatopsia: stredné riziko zámeny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, veľký vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, veľký vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 (textil) delta {v1}, veľký vnemový rozdiel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, veľký vnemový rozdiel");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, badateľný vnemový rozdiel");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopia: vysoké riziko zámeny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopia: vysoké riziko zámeny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, badateľný vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 (textil) delta {v1}, badateľný vnemový rozdiel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, badateľný vnemový rozdiel");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, badateľný vnemový rozdiel");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopia: nízke riziko zámeny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopia: nízke riziko zámeny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, veľký vnemový rozdiel");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopia: vysoké riziko zámeny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, dramatický vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 (textil) delta {v1, number}, dramatický vnemový rozdiel");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, dramatický vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, veľký vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 (textil) delta {v1, number}, veľký vnemový rozdiel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, veľký vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, badateľný vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 (textil) delta {v1}, jemný vnemový rozdiel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, badateľný vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 (textil) delta {v1, number}, badateľný vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, sotva postrehnuteľný");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, nepostrehnuteľný");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 (textil) delta {v1}, nepostrehnuteľný");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, nepostrehnuteľný");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, nepostrehnuteľný");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, veľký vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, nepostrehnuteľný");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, nepostrehnuteľný");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 (textil) delta {v1, number}, nepostrehnuteľný");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, nepostrehnuteľný");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, nepostrehnuteľný");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, jemný vnemový rozdiel");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, jemný vnemový rozdiel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, jemný vnemový rozdiel");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, sotva postrehnuteľný");
   P ("label.metrics.text_summary.n_words",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slová} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.metrics.text_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} odsek} few {{v1, number} odseky} many "
      & "{{v1, number} odseku} other {{v1, number} odsekov}}");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} min hovorenia");
   P ("label.metrics.text_summary.n_sentences",
      "{v1, plural, one {{v1, number} veta} few {{v1, number} vety} many "
      & "{{v1, number} vety} other {{v1, number} viet}}");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} min čítania");
   P ("label.metrics.text_summary.n_paragraph",
      "{v1, plural, one {{v1, number} odsek} few {{v1, number} odseky} many "
      & "{{v1, number} odseku} other {{v1, number} odsekov}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "menej ako {v1, number} min hovorenia");
   P ("label.metrics.text_summary.less_than_n_minute_read", "menej ako {v1, number} min čítania");
   P ("label.metrics.text_summary.n_sentence",
      "{v1, plural, one {{v1, number} veta} few {{v1, number} vety} many "
      & "{{v1, number} vety} other {{v1, number} viet}}");
   P ("label.metrics.text_summary.no_words", "žiadne slová");
   P ("label.metrics.text_summary.no_paragraphs", "žiadne odseky");
   P ("label.metrics.text_summary.no_sentences", "žiadne vety");
   P ("label.metrics.text_summary.n_word",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slová} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.names.hue_family_label.neutral", "neutrálna");
   P ("label.names.saturation_label.neutral", "neutrálna");
   P ("label.names.temperature_label.neutral_temperature", "neutrálna teplota");
   P ("label.names.chroma_label.grayish", "sivastá");
   P ("label.names.nearest_color_name.black", "čierna");
   P ("label.models.brightness_label.very_dark", "veľmi tmavá");
   P ("label.names.hue_family_label.blue", "modrá");
   P ("label.names.saturation_label.vivid", "živá");
   P ("label.names.temperature_label.cool", "studená");
   P ("label.names.chroma_label.moderate_chroma", "stredná pestrosť");
   P ("label.names.nearest_color_name.navy", "námornícka modrá");
end Labels_3;
