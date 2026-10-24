separate (Humanize.Catalogs.Phrase_Data.Locale_Cs)
procedure Labels_3 is
begin
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {žádná pozorování} one {{count, number} "
      & "pozorování, min. {minimum} {unit}, medián {median} {unit}, max. "
      & "{maximum} {unit}} few {{count, number} pozorování, min. {minimum} "
      & "{unit}, medián {median} {unit}, max. {maximum} {unit}} many {{count, "
      & "number} pozorování, min. {minimum} {unit}, medián {median} {unit}, "
      & "max. {maximum} {unit}} other {{count, number} pozorování, min. "
      & "{minimum} {unit}, medián {median} {unit}, max. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {žádná pozorování} "
      & "other {0 odlehlých hodnot z {total, number} pozorování}}} one "
      & "{{outliers, number} odlehlá hodnota z {total, number} pozorování} "
      & "few {{outliers, number} odlehlé hodnoty z {total, number} "
      & "pozorování} many {{outliers, number} odlehlé hodnoty z {total, "
      & "number} pozorování} other {{outliers, number} odlehlých hodnot z "
      & "{total, number} pozorování}}");
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
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} nad kapacitu} other "
      & "{zbývá {count, number} z {total, number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {kvóta překročena o {count, number} {unit} "
      & "(využito {percent})} near {kvóta téměř vyčerpána: zbývá "
      & "{count, number} {unit} (využito {percent})} other {kvóta k "
      & "dispozici: zbývá {count, number} {unit} (využito {percent})}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {úspěšnost mezipaměti nedostupná: žádné "
      & "požadavky} other {úspěšnost mezipaměti {percent}: {hits, plural, "
      & "one {{hits, number} zásah} few {{hits, number} zásahy} many {{hits, "
      & "number} zásahu} other {{hits, number} zásahů}}, {misses, plural, "
      & "one {{misses, number} minutí} few {{misses, number} minutí} many "
      & "{{misses, number} minutí} other {{misses, number} minutí}}}}");
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
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {{count, number} atribut} few {{count, number} "
      & "atributy} many {{count, number} atributu} other {{count, number} "
      & "atributů}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {{count, number} datový atribut} few {{count, "
      & "number} datové atributy} many {{count, number} datového atributu} "
      & "other {{count, number} datových atributů}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {{count, number} atribut ARIA} few {{count, "
      & "number} atributy ARIA} many {{count, number} atributu ARIA} other "
      & "{{count, number} atributů ARIA}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {{count, number} obslužná rutina událostí} few "
      & "{{count, number} obslužné rutiny událostí} many {{count, number} "
      & "obslužné rutiny událostí} other {{count, number} obslužných "
      & "rutin událostí}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {textový obsah} html_content {dokument "
      & "HTML} json_content {dokument JSON} xml_content {dokument XML} "
      & "image_content {obrázek} audio_content {zvuk} video_content {video} "
      & "font_content {písmo} archive_content {archiv} binary_content "
      & "{binární obsah} form_content {odeslání formuláře} other "
      & "{neznámý obsah}} ({base})");
   P ("label.markup.heading_label", "nadpis úrovně {level, number}");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {{count, number} značka} few {{count, number} "
      & "značky} many {{count, number} značky} other {{count, number} "
      & "značek}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {{count, number} odkaz} few {{count, number} "
      & "odkazy} many {{count, number} odkazu} other {{count, number} odkazů}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} mediální prvek} few {{count, "
      & "number} mediální prvky} many {{count, number} mediálního prvku} "
      & "other {{count, number} mediálních prvků}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} ovládací prvek formuláře} few "
      & "{{count, number} ovládací prvky formuláře} many {{count, number} "
      & "ovládacího prvku formuláře} other {{count, number} ovládacích "
      & "prvků formuláře}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {{count, number} nadpis} few {{count, number} "
      & "nadpisy} many {{count, number} nadpisu} other {{count, number} "
      & "nadpisů}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {{count, number} orientační bod} few {{count, "
      & "number} orientační body} many {{count, number} orientačního bodu} "
      & "other {{count, number} orientačních bodů}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {{count, number} formulář} few {{count, number} "
      & "formuláře} many {{count, number} formuláře} other {{count, number} "
      & "formulářů}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} mediální prvek} few {{count, "
      & "number} mediální prvky} many {{count, number} mediálního prvku} "
      & "other {{count, number} mediálních prvků}}");
   P ("label.markup.table_navigation_label",
      "{caption}, řádek {row, number} z {rows, number}, sloupec {column, "
      & "number} z {columns, number}");
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
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} tajný údaj} few {{count, "
      & "number} tajné údaje} many {{count, number} tajného údaje} other "
      & "{{count, number} tajných údajů}}");
   P ("label.secrets.secret_count_label.masked", "maskováno: {count, number}");
   P ("label.secrets.secret_count_label.unset", "nenastaveno: {count, number}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} otisk} few {{count, number} "
      & "otisky} many {{count, number} otisku} other {{count, number} otisků}}");
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
   P ("label.schema.type_mismatch_label",
      "pole {field_name}: očekávaný typ {expected, select, string_field "
      & "{řetězec} integer_field {celé číslo} decimal_field {desetinné "
      & "číslo} boolean_field {logická hodnota} date_field {datum} "
      & "date_time_field {datum a čas} object_field {objekt} array_field "
      & "{pole} enum_field {výčet} binary_field {binární data} null_field "
      & "{null} any_field {libovolný} other {neznámý}}, skutečný {actual, "
      & "select, string_field {řetězec} integer_field {celé číslo} "
      & "decimal_field {desetinné číslo} boolean_field {logická hodnota} "
      & "date_field {datum} date_time_field {datum a čas} object_field "
      & "{objekt} array_field {pole} enum_field {výčet} binary_field "
      & "{binární data} null_field {null} any_field {libovolný} other "
      & "{neznámý}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} blokující problém} few {{blocking, number} blokující "
      & "problémy} many {{blocking, number} blokujícího problému} other "
      & "{{blocking, number} blokujících problémů}}} blocking {{base}, "
      & "{blocking, plural, one {{blocking, number} blokující problém} few "
      & "{{blocking, number} blokující problémy} many {{blocking, number} "
      & "blokujícího problému} other {{blocking, number} blokujících "
      & "problémů}}} only {pouze {base}} other {{base}}}");
   P ("label.diagnostics.check_run_summary_label.none", "nebyly spuštěny žádné kontroly");
   P ("label.diagnostics.check_run_summary_label.passed", "prošlo: {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "selhalo: {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 varování} few {{count, number} varování} "
      & "many {{count, number} varování} other {{count, number} varování}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "přeskočeno: {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "čeká: {count, number}");
   P ("label.thresholds.metric_value_label", "{name}: {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {cílový rozsah {low} až "
      & "{high}} other {cílové okno {low} až {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} v očekávaném rozsahu} below "
      & "{{value} pod očekávaným rozsahem} other {{value} nad očekávaným "
      & "rozsahem}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} na kritickém prahu} warning "
      & "{{value} na prahu varování} other {{value} v normálním rozsahu}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {nepřekročeno} other {překročeno o "
      & "{difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {cíl splněn} below {{difference} pod cílem} "
      & "other {{difference} nad cílem}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {limit překročen} near {blízko limitu, "
      & "zbývá {distance}} other {{distance} od limitu}}");
   P ("label.thresholds.threshold_summary_label.none", "žádné metriky");
   P ("label.thresholds.threshold_summary_label.normal", "normální: {count, number}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {{count, number} varování} few {{count, number} "
      & "varování} many {{count, number} varování} other {{count, number} "
      & "varování}}");
   P ("label.thresholds.threshold_summary_label.critical", "kritické: {count, number}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {{count, number} překročení} few {{count, "
      & "number} překročení} many {{count, number} překročení} other "
      & "{{count, number} překročení}}");
   P ("label.thresholds.target_window_label", "cíl {target} plus/minus {tolerance}");
   P ("label.thresholds.tolerance_label", "tolerance {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} limitu");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {limit překročen o {amount}} other {zbývá "
      & "{amount}}}");
   P ("label.thresholds.budget_used_label", "využito {used} z {budget}");
   P ("label.workflows.step_label", "krok {current, number} z {total, number}: {name}");
   P ("label.workflows.milestone_label", "dokončené milníky: {current, number} z {total, number}, {name}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {1 položka} few {{count, number} položky} many "
      & "{{count, number} položky} other {{count, number} položek}}");
   P ("label.workflows.workflow_summary_label.completed", "dokončeno: {count, number}");
   P ("label.workflows.workflow_summary_label.active", "aktivní: {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "blokováno: {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "selhalo: {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "přeskočeno: {count, number}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {žádné položky pracovního postupu} half "
      & "{pracovní postup v polovině} other {dokončeno {completed, number} z "
      & "{total, number}}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {pozice ve frontě {position, number}} other "
      & "{pozice ve frontě {position, number} z {total, number}}}");
   P ("label.changes.change_set_label.none", "žádné změny");
   P ("label.changes.change_set_label.added", "přidáno {count, number}");
   P ("label.changes.change_set_label.removed", "odebráno {count, number}");
   P ("label.changes.change_set_label.modified", "změněno {count, number}");
   P ("label.changes.change_set_label.unchanged", "beze změny {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {1 položka} few {{count, number} položky} many "
      & "{{count, number} položky} other {{count, number} položek}}");
   P ("label.changes.change_summary_label.added", "přidáno {count, number}");
   P ("label.changes.change_summary_label.removed", "odebráno {count, number}");
   P ("label.changes.change_summary_label.modified", "změněno {count, number}");
   P ("label.changes.change_summary_label.renamed", "přejmenováno {count, number}");
   P ("label.changes.change_summary_label.unchanged", "beze změny {count, number}");
   P ("label.changes.sync_change_label.none", "žádné změny synchronizace");
   P ("label.changes.sync_change_label.uploaded", "nahráno {count, number}");
   P ("label.changes.sync_change_label.downloaded", "staženo {count, number}");
   P ("label.changes.sync_change_label.deleted", "smazáno {count, number}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} konflikt} few {{count, number} "
      & "konflikty} many {{count, number} konfliktu} other {{count, number} "
      & "konfliktů}}");
   P ("label.changes.net_change_label",
      "{state, select, none {žádná čistá změna} up {netto +{count, "
      & "plural, one {{count, number} položka} few {{count, number} položky} "
      & "many {{count, number} položky} other {{count, number} položek}}} "
      & "other {netto -{count, plural, one {{count, number} položka} few "
      & "{{count, number} položky} many {{count, number} položky} other "
      & "{{count, number} položek}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {žádné změny ke kontrole} all {všechny "
      & "změny zkontrolovány} other {zkontrolované změny: {reviewed, "
      & "number} z {total, number}}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name}: beze změny ({new_value})} up "
      & "{{field_name}: zvýšeno z {old_value} na {new_value}} other "
      & "{{field_name}: sníženo z {old_value} na {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {žádné řádky k výběru} none {nejsou "
      & "vybrány žádné řádky} all {{total, plural, =1 {vybrán 1 řádek} "
      & "other {vybrány všechny řádky ({total, number})}}} other {vybrané "
      & "řádky: {selected, number} z {total, number}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {žádné stránky} other {{pages, plural, =0 "
      & "{žádné stránky} other {{rows, plural, =0 {stránka {page, number} "
      & "z {pages, number}} other {stránka {page, number} z {pages, number}, "
      & "{rows, plural, one {{rows, number} řádek} few {{rows, number} "
      & "řádky} many {{rows, number} řádku} other {{rows, number} "
      & "řádků}}}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {žádné řádky} none {žádné "
      & "odpovídající řádky} all {{total, plural, =1 {zobrazen 1 řádek} "
      & "other {zobrazeny všechny řádky ({total, number})}}} other "
      & "{zobrazené řádky: {visible, number} z {total, number}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {žádné řádky} single {řádek {first_row, "
      & "number} z {total, number}} other {řádky {first_row, "
      & "number}–{last_row, number} z {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {bez limitu znaků} none_left {nezbývají "
      & "žádné znaky} left {{count, plural, one {zbývá {count, number} "
      & "znak} few {zbývají {count, number} znaky} many {zbývá {count, "
      & "number} znaku} other {zbývá {count, number} znaků}}} other {limit "
      & "překročen o {count, plural, one {{count, number} znak} few {{count, "
      & "number} znaky} many {{count, number} znaku} other {{count, number} "
      & "znaků}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {žádná povinná pole} other {{missing, plural, "
      & "=0 {všechna povinná pole vyplněna} other {chybějící povinná "
      & "pole: {missing, number} z {total, number}}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {žádná pole} all {všechna pole vyplněna} "
      & "other {vyplněná pole: {completed, number} z {total, number}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: žádná pole} all {{name}: všechna "
      & "pole vyplněna} other {{name}: vyplněná pole: {completed, number} z "
      & "{total, number}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {žádné kroky formuláře} =1 {krok 1 z 1: "
      & "{name}} other {krok {current, number} z {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {žádná drobečková navigace} =1 {položka "
      & "drobečkové navigace 1 z 1: {name}} other {položka drobečkové "
      & "navigace {current, number} z {total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {žádné karty} =1 {karta 1 z 1: {name}} other "
      & "{karta {current, number} z {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {prázdná doručená pošta} other {{unread, "
      & "plural, =0 {všechna oznámení přečtena} other {nepřečtená "
      & "oznámení: {unread, number} z {total, number}}}}}");
   P ("label.notifications.delivery_attempt_label", "pokus o doručení {attempt, number} z {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {žádné položky kontrolního seznamu} other "
      & "{dokončené položky: {done, number} z {total, number}}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {žádná nahrávání} other {dokončená "
      & "nahrávání: {done, number} z {total, number}}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {žádná kapacita} other {rezervovaná místa: "
      & "{reserved, number} z {capacity, number}}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {pozice v pořadníku {position, number}} other "
      & "{pozice v pořadníku {position, number} z {total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name}: změněno {changed, "
      & "number}/{total, number}} other {{name}: změněno {changed, number}, "
      & "beze změny {unchanged, number}, celkem {total, number}}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
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
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "aktuální barva popředí splňuje kontrast pro velký text při "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "aktuální barva popředí splňuje kontrast pro běžný text při "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "použijte {v1} k dosažení vylepšeného kontrastu textu {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "použijte {v1} k dosažení kontrastu pro velký text {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "použijte {v1} k dosažení kontrastu pro běžný text {v2}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "použijte {v1} k dosažení kontrastu pro velký text {v2}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "použijte {v1} k dosažení vylepšeného kontrastu textu {v2}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "aktuální barva popředí splňuje kontrast pro velký text při {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "aktuální barva popředí splňuje kontrast pro běžný text při "
      & "{v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "aktuální barva popředí splňuje vylepšený kontrast textu při "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "aktuální barva popředí splňuje vylepšený kontrast textu při "
      & "{v1, number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopie: nízké riziko záměny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopie: střední riziko záměny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopie: střední riziko záměny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "achromatopsie: vysoké riziko záměny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 (textil) delta {v1}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, velký vjemový rozdíl");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopie: střední riziko záměny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, dramatický vjemový rozdíl");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "achromatopsie: nízké riziko záměny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopie: barvy rozlišitelné, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopie: barvy rozlišitelné, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopie: barvy rozlišitelné, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "achromatopsie: barvy rozlišitelné, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "achromatopsie: střední riziko záměny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 (textil) delta {v1}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, znatelný vjemový rozdíl");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopie: vysoké riziko záměny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopie: vysoké riziko záměny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, znatelný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 (textil) delta {v1}, znatelný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, znatelný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, znatelný vjemový rozdíl");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopie: nízké riziko záměny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopie: nízké riziko záměny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, velký vjemový rozdíl");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopie: vysoké riziko záměny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 (textil) delta {v1, number}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 (textil) delta {v1, number}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, znatelný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 (textil) delta {v1}, jemný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, znatelný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 (textil) delta {v1, number}, znatelný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, sotva postřehnutelný");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 (textil) delta {v1}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 (textil) delta {v1, number}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, jemný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, jemný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, jemný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, sotva postřehnutelný");
   P ("label.metrics.text_summary.n_words",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slova} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.metrics.text_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} odstavec} few {{v1, number} odstavce} "
      & "many {{v1, number} odstavce} other {{v1, number} odstavců}}");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} min mluvení");
   P ("label.metrics.text_summary.n_sentences",
      "{v1, plural, one {{v1, number} věta} few {{v1, number} věty} many "
      & "{{v1, number} věty} other {{v1, number} vět}}");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} min čtení");
   P ("label.metrics.text_summary.n_paragraph",
      "{v1, plural, one {{v1, number} odstavec} few {{v1, number} odstavce} "
      & "many {{v1, number} odstavce} other {{v1, number} odstavců}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "méně než {v1, number} min mluvení");
   P ("label.metrics.text_summary.less_than_n_minute_read", "méně než {v1, number} min čtení");
   P ("label.metrics.text_summary.n_sentence",
      "{v1, plural, one {{v1, number} věta} few {{v1, number} věty} many "
      & "{{v1, number} věty} other {{v1, number} vět}}");
   P ("label.metrics.text_summary.no_words", "žádná slova");
   P ("label.metrics.text_summary.no_paragraphs", "žádné odstavce");
   P ("label.metrics.text_summary.no_sentences", "žádné věty");
   P ("label.metrics.text_summary.n_word",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slova} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.names.hue_family_label.neutral", "neutrální");
   P ("label.names.saturation_label.neutral", "neutrální");
   P ("label.names.temperature_label.neutral_temperature", "neutrální teplota");
   P ("label.names.chroma_label.grayish", "našedlá");
   P ("label.names.nearest_color_name.black", "černá");
   P ("label.models.brightness_label.very_dark", "velmi tmavá");
   P ("label.names.hue_family_label.blue", "modrá");
   P ("label.names.saturation_label.vivid", "živá");
   P ("label.names.temperature_label.cool", "studená");
   P ("label.names.chroma_label.moderate_chroma", "střední pestrost");
   P ("label.names.nearest_color_name.navy", "námořnická modrá");
   P ("label.names.chroma_label.high_chroma", "vysoká pestrost");
   P ("label.names.nearest_color_name.blue", "modrá");
   P ("label.names.hue_family_label.green", "zelená");
   P ("label.names.temperature_label.balanced_temperature", "vyvážená teplota");
   P ("label.names.hue_family_label.cyan", "azurová");
end Labels_3;
