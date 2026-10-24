separate (Humanize.Catalogs.Phrase_Data.Locale_Lt)
procedure Labels_4 is
begin
   P ("label.metrics.reading_time.less_than_n_minute_read", "mažiau nei {v1, number} min. skaitymo");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "mažiau nei {v1, number} min. kalbėjimo");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {{v1, number} pastraipa} few {{v1, number} "
      & "pastraipos} many {{v1, number} pastraipos} other {{v1, number} "
      & "pastraipų}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "mažiau nei {v1, number} min. skaitymo");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {{v1, number} sakinys} few {{v1, number} sakiniai} "
      & "many {{v1, number} sakinio} other {{v1, number} sakinių}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {{v1, number} sakinys} few {{v1, number} sakiniai} "
      & "many {{v1, number} sakinio} other {{v1, number} sakinių}}");
   P ("label.metrics.word_count_summary.no_words", "žodžių nėra");
   P ("label.metrics.sentence_count_summary.no_sentences", "sakinių nėra");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "pastraipų nėra");
   P ("label.metrics.text_summary_with_options.no_words", "žodžių nėra");
   P ("label.metrics.text_summary_with_options.no_sentences", "sakinių nėra");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "pastraipų nėra");
   P ("label.metrics.word_count_summary.n_word",
      "{v1, plural, one {{v1, number} žodis} few {{v1, number} žodžiai} "
      & "many {{v1, number} žodžio} other {{v1, number} žodžių}}");
   P ("label.metrics.text_summary_with_options.n_word",
      "{v1, plural, one {{v1, number} žodis} few {{v1, number} žodžiai} "
      & "many {{v1, number} žodžio} other {{v1, number} žodžių}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {stebėjimų nėra} "
      & "sample_too_small_shape {imtis per maža formai apibūdinti, "
      & "stebėjimų: {count, number}} flat_shape {plokščias skirstinys ties "
      & "{median}} outlier_heavy_shape {skirstinys su daug išskirčių apie "
      & "{median}} volatile_shape {nepastovus skirstinys apie {median}} "
      & "clustered_shape {sankaupinis skirstinys apie {median}} "
      & "wide_spread_shape {plačiai išsibarstęs skirstinys} "
      & "wide_spread_range {plačiai išsibarstęs skirstinys nuo {minimum} iki "
      & "{maximum}} right_skewed_shape {į dešinę asimetriškas skirstinys, "
      & "mediana {median}} left_skewed_shape {į kairę asimetriškas "
      & "skirstinys, mediana {median}} other {daugiausia subalansuotas "
      & "skirstinys apie {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {tuščias el. pašto adresas} address {el. "
      & "pašto adresas} other {el. pašto adresas domene {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {telefono numeris} redacted {telefono numeris "
      & "paslėptas} other {telefono numeris, kurio pabaiga {digits}}}");
   P ("label.privacy.safe_handle_label",
      "{state, select, none {naudotojo vardas} other {naudotojo vardas "
      & "{shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {kodo simbolis} other {kodo simbolis {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "adreso metaduomenys: užpildyta laukų: {present, number}, trūksta "
      & "laukų: {missing, number}");
   P ("label.endpoints.host_label", "{state, select, none {nežinomas kompiuteris} other {{kind} {host}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {nežinomas galinis taškas} other {galinis "
      & "taškas {scheme}{host}{port} ({kind})}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {tuščias URL} none {URL be atpažintų "
      & "komponentų} other {URL, {count, plural, one {{count, number} "
      & "komponentas} few {{count, number} komponentai} many {{count, number} "
      & "komponento} other {{count, number} komponentų}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {užklausos parametrų nėra} one {{count, number} "
      & "užklausos parametras} few {{count, number} užklausos parametrai} "
      & "many {{count, number} užklausos parametro} other {{count, number} "
      & "užklausos parametrų}}");
   P ("label.endpoints.ip_address_label",
      "{address} – {kind, select, ipv4_host {viešasis IPv4 adresas} "
      & "ipv6_host {viešasis IPv6 adresas} private_network_host {privataus "
      & "tinklo adresas} localhost_host {vietinis kompiuteris} other {ne IP "
      & "adresas}}");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr}: netinkamas CIDR} other {{cidr}: "
      & "{kind}, tinklo prefiksas {prefix}}}");
   P ("label.resources.utilization_label",
      "naudojama {used, number} iš {total, number} {unit} ({percent}, "
      & "{band})");
   P ("label.resources.saturation_label", "{named, select, no {išteklius} other {{name}}}: {percent}, {band}");
   P ("label.versions.version_label",
      "{state, select, both {versija {version}, išankstinė laida "
      & "{prerelease}, surinkimas {build}} prerelease {versija {version}, "
      & "išankstinė laida {prerelease}} build {versija {version}, surinkimas "
      & "{build}} other {versija {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {ta pati versija} major_upgrade "
      & "{pagrindinės versijos naujinimas} minor_upgrade {šalutinės versijos "
      & "naujinimas} patch_upgrade {pataisos naujinimas} prerelease_change "
      & "{išankstinės laidos pakeitimas} build_metadata_change {surinkimo "
      & "metaduomenų pakeitimas} downgrade {versijos sumažinimas} other "
      & "{nežinomas versijos pakeitimas}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {tiksliai versija {version}} minimum_range "
      & "{versija {version} arba naujesnė} maximum_range {versija {version} "
      & "arba senesnė} major_compatible_range {suderinama su pagrindine "
      & "versija {version}} minor_compatible_range {suderinama su šalutine "
      & "versija {version}} other {versijų intervalas {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {pradinė kūrimo laida {version}} prerelease "
      & "{išankstinė laida {version}} major {pagrindinė laida {version}} "
      & "minor {šalutinė laida {version}} other {pataisos laida {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {nuorodos žymė} image {paveikslėlio žymė} "
      & "paragraph {pastraipos žymė} ordered_list {numeruoto sąrašo žymė} "
      & "unordered_list {nenumeruoto sąrašo žymė} list_item {sąrašo "
      & "elemento žymė} table_header_cell {lentelės antraštės langelio "
      & "žymė} table_cell {lentelės langelio žymė} table_row {lentelės "
      & "eilutės žymė} line_break {eilutės lūžio žymė} thematic_break "
      & "{teminio lūžio žymė} heading_level_n {{level, number} lygio "
      & "antraštės žymė} other {žymė {name}}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {atributas {name}} event {įvykių doroklės "
      & "atributas {name}} other {atributas {name}, kurio reikšmė "
      & "„{value}“}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {tekstinis turinys} html_content {HTML "
      & "dokumentas} json_content {JSON dokumentas} xml_content {XML "
      & "dokumentas} image_content {paveikslėlis} audio_content {garso "
      & "įrašas} video_content {vaizdo įrašas} font_content {šriftas} "
      & "archive_content {archyvas} binary_content {dvejetainiai duomenys} "
      & "form_content {formos pateikimas} other {nežinomas turinys}} ({base})");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind}: nenustatyta} hidden_value {{kind}: "
      & "paslėpta} masked_value {{kind} {shown}} fingerprint_only {{kind}: "
      & "kontrolinis kodas, pabaiga {shown}} other {{kind}: pabaiga {shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} ({kind}): nenustatyta} other {{name} "
      & "({kind}): pabaiga {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {{name}: prisijungimo duomenų antraštė "
      & "nenustatyta} other {{name} ({kind}): pabaiga {shown}}}");
   P ("label.secrets.fingerprint_label", "{algorithm} kontrolinis kodas: pabaiga {shown}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label}: nenustatyta} redacted {{label}: "
      & "paslėpta} url_redacted {URL paslėptas} ip_redacted {IP adresas "
      & "paslėptas} path_ending {failo kelias, pabaiga {shown}} at {{label} "
      & "ties {shown}} audit {{label}: ilgis {length, number}, pabaiga {shown}} "
      & "debug {{label} {shown}} other {{label}: pabaiga {shown}}}");
   P ("label.schema.field_label",
      "laukas {name} ({kind, select, string_field {eilutė} integer_field "
      & "{sveikasis skaičius} decimal_field {dešimtainis skaičius} "
      & "boolean_field {loginė reikšmė} date_field {data} date_time_field "
      & "{data ir laikas} object_field {objektas} array_field {masyvas} "
      & "enum_field {išvardijimas} binary_field {dvejetainiai duomenys} "
      & "null_field {null} any_field {bet koks tipas} other {nežinomas "
      & "tipas}}): {state, select, deprecated_field {pasenęs, } unknown_field "
      & "{nežinomas, } read_only_field {tik skaitomas, } write_only_field {tik "
      & "rašomas, } computed_field {apskaičiuojamas, } other {}}{presence, "
      & "select, required_field {privalomas} optional_field {neprivalomas} "
      & "conditional_field {sąlyginis} other {privalomumas "
      & "nežinomas}}{nullable, select, non_nullable {, negali būti null} "
      & "nullable {, gali būti null} other {}}");
   P ("label.schema.schema_summary_label.fields",
      "{count, plural, one {{count, number} laukas} few {{count, number} "
      & "laukai} many {{count, number} lauko} other {{count, number} laukų}}");
   P ("label.schema.schema_summary_label.required", "privalomų: {count, number}");
   P ("label.schema.schema_summary_label.optional", "neprivalomų: {count, number}");
   P ("label.schema.schema_summary_label.deprecated", "pasenusių: {count, number}");
   P ("label.schema.schema_summary_label.unknown", "nežinomų: {count, number}");
   P ("label.diagnostics.check_run_summary_label.none", "patikrų nevykdyta");
   P ("label.diagnostics.check_run_summary_label.passed", "sėkminga: {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "nepavyko: {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {{count, number} įspėjimas} few {{count, number} "
      & "įspėjimai} many {{count, number} įspėjimo} other {{count, number} "
      & "įspėjimų}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "praleista: {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "laukiama: {count, number}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {{count, number} elementas} few {{count, number} "
      & "elementai} many {{count, number} elemento} other {{count, number} "
      & "elementų}}");
   P ("label.workflows.workflow_summary_label.completed", "užbaigta: {count, number}");
   P ("label.workflows.workflow_summary_label.active", "aktyvu: {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "užblokuota: {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "nepavyko: {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "praleista: {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {{count, number} elementas} few {{count, number} "
      & "elementai} many {{count, number} elemento} other {{count, number} "
      & "elementų}}");
   P ("label.changes.change_summary_label.added", "pridėta: {count, number}");
   P ("label.changes.change_summary_label.removed", "pašalinta: {count, number}");
   P ("label.changes.change_summary_label.modified", "pakeista: {count, number}");
   P ("label.changes.change_summary_label.renamed", "pervadinta: {count, number}");
   P ("label.changes.change_summary_label.unchanged", "nepakeista: {count, number}");
   P ("label.markup.accessible_control_label.control",
      "{named, select, no {{role, select, button_control {bevardis mygtukas} "
      & "link_control {bevardė nuoroda} tab_control {bevardis skirtukas} "
      & "menu_item_control {bevardis meniu elementas} checkbox_control "
      & "{bevardis žymimasis langelis} radio_control {bevardis parinkties "
      & "mygtukas} text_field_control {bevardis teksto laukas} progress_control "
      & "{bevardis eigos indikatorius} table_cell_control {bevardis lentelės "
      & "langelis} region_control {bevardė sritis} other {bevardis "
      & "valdiklis}}} other {{role, select, button_control {mygtukas} "
      & "link_control {nuoroda} tab_control {skirtukas} menu_item_control "
      & "{meniu elementas} checkbox_control {žymimasis langelis} radio_control "
      & "{parinkties mygtukas} text_field_control {teksto laukas} "
      & "progress_control {eigos indikatorius} table_cell_control {lentelės "
      & "langelis} region_control {sritis} other {valdiklis}} {name}}}");
   P ("label.markup.accessible_control_label.selected", "pažymėta");
   P ("label.markup.accessible_control_label.expanded", "išskleista");
   P ("label.markup.accessible_control_label.current", "dabartinis");
   P ("label.markup.accessible_control_label.disabled", "neprieinama");
   P ("label.markup.accessible_control_label.required", "privaloma");
   P ("label.markup.accessible_control_label.invalid", "netinkama reikšmė");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {{count, number} elementas} few {{count, number} "
      & "elementai} many {{count, number} elemento} other {{count, number} "
      & "elementų}}");
   P ("label.markup.accessible_control_label.position", "{position} elementas iš {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {{count, number} problema} few {{count, number} "
      & "problemos} many {{count, number} problemos} other {{count, number} "
      & "problemų}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "schema");
   P ("label.endpoints.url_component.host", "pagrindinis kompiuteris");
   P ("label.endpoints.url_component.path", "kelias");
   P ("label.endpoints.url_component.query", "užklausa");
   P ("label.endpoints.url_component.fragment", "fragmentas");
   P ("label.names.hue_noun.red", "raudona");
   P ("label.names.hue_noun.orange", "oranžinė");
   P ("label.names.hue_noun.yellow", "geltona");
   P ("label.names.hue_noun.green", "žalia");
   P ("label.names.hue_noun.cyan", "žydra");
   P ("label.names.hue_noun.blue", "mėlyna");
   P ("label.names.hue_noun.purple", "violetinė");
   P ("label.names.hue_noun.magenta", "purpurinė");
   P ("label.names.hue_noun.neutral", "neutrali");
   P ("label.names.hue_noun.pink", "rožinė");
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
   P ("label.names.agree.very_dark", "{gender, select, masculine {labai tamsus} other {labai tamsi}}");
   P ("label.names.agree.dark", "{gender, select, masculine {tamsus} other {tamsi}}");
   P ("label.names.agree.medium_brightness", "{gender, select, other {vidutinio šviesumo}}");
   P ("label.names.agree.light", "{gender, select, masculine {šviesus} other {šviesi}}");
   P ("label.names.agree.very_light", "{gender, select, masculine {labai šviesus} other {labai šviesi}}");
   P ("label.names.agree.desaturated", "{gender, select, masculine {išblukęs} other {išblukusi}}");
   P ("label.names.agree.muted", "{gender, select, masculine {prislopintas} other {prislopinta}}");
   P ("label.names.agree.neutral", "{gender, select, masculine {neutralus} other {neutrali}}");
   P ("label.names.agree.saturated", "{gender, select, masculine {sodrus} other {sodri}}");
   P ("label.names.agree.vivid", "{gender, select, masculine {ryškus} other {ryški}}");
   P ("label.names.agree.grayish", "{gender, select, masculine {pilkšvas} other {pilkšva}}");
   P ("label.names.agree.soft", "{gender, select, masculine {švelnus} other {švelni}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {vidutinio chromatiškumo}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {didelio chromatiškumo}}");
   P ("label.names.agree.pastel", "{gender, select, masculine {pastelinis} other {pastelinė}}");
   P ("label.names.agree.warm", "{gender, select, masculine {šiltas} other {šilta}}");
   P ("label.names.agree.cool", "{gender, select, masculine {šaltas} other {šalta}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {neutralios temperatūros}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {subalansuotos temperatūros}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
   P ("label.endpoints.url_label", "{state, select, empty {tuščias URL} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {tuščias URL} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[paslėptas naudotojas]");
   P ("label.endpoints.url_label.query",
      "užklausa {count, plural, one {{count, number} parametras} few "
      & "{{count, number} parametrai} many {{count, number} parametro} other "
      & "{{count, number} parametrų}}");
end Labels_4;
