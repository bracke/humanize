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
      "{state, select, no_rows {žiadne riadky na výber} none {nevybrané "
      & "žiadne riadky} all {{total, plural, =1 {vybraný 1 riadok} other "
      & "{vybrané všetky riadky ({total, number})}}} other {vybrané riadky: "
      & "{selected, number} z {total, number}}}");
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
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
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
   P ("label.names.chroma_label.high_chroma", "vysoká pestrosť");
   P ("label.names.nearest_color_name.blue", "modrá");
   P ("label.names.hue_family_label.green", "zelená");
   P ("label.names.temperature_label.balanced_temperature", "vyvážená teplota");
   P ("label.names.hue_family_label.cyan", "azúrová");
   P ("label.names.chroma_label.soft", "jemná");
   P ("label.models.brightness_label.dark", "tmavá");
   P ("label.names.nearest_color_name.green", "zelená");
   P ("label.names.nearest_color_name.teal", "modrozelená");
   P ("label.models.brightness_label.medium_brightness", "stredný jas");
   P ("label.names.nearest_color_name.aqua", "azúrová");
   P ("label.names.nearest_color_name.lime", "limetková");
   P ("label.models.brightness_label.light", "svetlá");
   P ("label.names.hue_family_label.red", "červená");
   P ("label.names.temperature_label.warm", "teplá");
   P ("label.names.hue_family_label.magenta", "purpurová");
   P ("label.names.hue_family_label.purple", "fialová");
   P ("label.names.hue_family_label.yellow", "žltá");
   P ("label.names.saturation_label.muted", "tlmená");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "sýta");
   P ("label.names.nearest_color_name.maroon", "gaštanová");
   P ("label.names.nearest_color_name.purple", "fialová");
   P ("label.names.hue_family_label.orange", "oranžová");
   P ("label.names.nearest_color_name.olive", "olivová");
   P ("label.names.nearest_color_name.gray", "sivá");
   P ("label.names.saturation_label.desaturated", "nenasýtená");
   P ("label.names.nearest_color_name.silver", "strieborná");
   P ("label.names.chroma_label.pastel", "pastelová");
   P ("label.models.brightness_label.very_light", "veľmi svetlá");
   P ("label.names.nearest_color_name.fuchsia", "fuchsiová");
   P ("label.names.nearest_color_name.yellow", "žltá");
   P ("label.names.nearest_color_name.red", "červená");
   P ("label.names.nearest_color_name.orange", "oranžová");
   P ("label.names.nearest_color_name.white", "biela");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number}, nízky kontrast");
   P ("label.contrast.readability_label.low_readability", "nízka čitateľnosť");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, nedostatočný, tmavý text na svetlom pozadí");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number}, nízky kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, nedostatočný, tmavý text na svetlom pozadí");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "achromatopsia: stredné riziko zámeny");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number} % – výrazný rozdiel");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, nízky kontrast po alfa kompozícii");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, nedostatočný, svetlý text na tmavom pozadí");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, nedostatočný, svetlý text na tmavom pozadí");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopia: vysoké riziko zámeny");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number}, kontrast pre veľký text");
   P ("label.contrast.readability_label.readable_for_large_text_only", "čitateľné len pre veľký text");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, veľký text, svetlý text na tmavom pozadí");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number}, kontrast pre veľký text");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, veľký text, svetlý text na tmavom pozadí");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopia: vysoké riziko zámeny");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, kontrast pre veľký text po alfa kompozícii");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, iba netextové prvky, svetlý text na tmavom pozadí");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, iba netextové prvky, svetlý text na tmavom pozadí");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopia: stredné riziko zámeny");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number}, nízky kontrast");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number}, nízky kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, iba netextové prvky, tmavý text na svetlom pozadí");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, iba netextové prvky, tmavý text na svetlom pozadí");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopia: stredné riziko zámeny");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopia: vysoké riziko zámeny");
   P ("label.models.color_difference_label.n_very_different", "{v1, number} % – veľmi odlišné");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "achromatopsia: vysoké riziko zámeny");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "achromatopsia: nízke riziko zámeny");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, nízky kontrast po alfa kompozícii");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number}, kontrast pre bežný text");
   P ("label.contrast.readability_label.readable_for_normal_text", "čitateľné pre bežný text");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, základný text, svetlý text na tmavom pozadí");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number}, kontrast pre bežný text");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, základný text, svetlý text na tmavom pozadí");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, veľký text, tmavý text na svetlom pozadí");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, veľký text, tmavý text na svetlom pozadí");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number} % – jemný rozdiel");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, základný text, tmavý text na svetlom pozadí");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, základný text, tmavý text na svetlom pozadí");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopia: nízke riziko zámeny");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number} % – badateľný rozdiel");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, kontrast pre veľký text");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, kontrast pre veľký text");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopia: nízke riziko zámeny");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number}, zvýšený kontrast");
   P ("label.contrast.readability_label.readable_for_enhanced_text",
      "čitateľné pre text so zvýšeným kontrastom");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number}, zvýšený kontrast");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, jemný vnemový rozdiel");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopia: farby rozlíšiteľné");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, kontrast pre bežný text po alfa "
      & "kompozícii");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopia: stredné riziko zámeny");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, kontrast pre bežný text po alfa kompozícii");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, kontrast pre veľký text po alfa "
      & "kompozícii");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, výborný, tmavý text na svetlom pozadí");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, výborný, tmavý text na svetlom pozadí");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, kontrast pre bežný text");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, kontrast pre bežný text");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number}, zvýšený kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, výborný, svetlý text na tmavom pozadí");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number}, zvýšený kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, výborný, svetlý text na tmavom pozadí");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopia: farby rozlíšiteľné");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, zvýšený kontrast po alfa kompozícii");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, sotva postrehnuteľný");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number} % – takmer totožné");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopia: nízke riziko zámeny");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "achromatopsia: farby rozlíšiteľné");
   P ("label.palettes.palette_summary.n_colors",
      "{v1, plural, one {{v1, number} farba} few {{v1, number} farby} many "
      & "{{v1, number} farby} other {{v1, number} farieb}}");
   P ("label.palettes.palette_summary.mostly_gray", "prevažne sivá");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "stredný rozptyl kontrastu");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "pozadie {v1}, text {v2}, akcent {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triadická paleta");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "najlepší kontrast: {v1} na {v2} pri {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} z {v2, plural, one {1 páru} other {{v2, number} párov}} "
      & "spĺňa kontrast pre bežný text");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "zvýšený {v1, number}, bežný {v2, number}, len veľký text {v3, "
      & "number}, nevyhovuje {v4, number} (z {v5, plural, one {1 páru} other "
      & "{{v5, number} párov}})");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {{v1, number} farba} few {{v1, number} farby} many "
      & "{{v1, number} farby} other {{v1, number} farieb}}, {v2, plural, one "
      & "{{v2, number} pár} few {{v2, number} páry} many {{v2, number} páru} "
      & "other {{v2, number} párov}}: zvýšený {v3, number}, bežný {v4, "
      & "number}, len veľký text {v5, number}, nevyhovuje {v6, number}");
   P ("label.palettes.palette_mood_label.balanced", "vyvážená");
   P ("label.palettes.palette_mood_label.vibrant", "živá");
   P ("label.palettes.palette_mood_label.warm_mood", "teplá nálada");
   P ("label.palettes.palette_summary.mostly_blue", "prevažne modrá");
   P ("label.palettes.palette_summary.low_contrast_spread", "nízky rozptyl kontrastu");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "paleta s jedným akcentom");
   P ("label.palettes.palette_mood_label.dark", "tmavá");
   P ("label.palettes.palette_mood_label.cool_mood", "chladná nálada");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "prevažne rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "žiadne prístupné textové páry");
   P ("label.palettes.palette_mood_label.subtle", "jemná");
   P ("label.palettes.palette_summary.high_contrast_spread", "vysoký rozptyl kontrastu");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "najlepší kontrast: {v1} na {v2} pri {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "neutrálna nálada");
   P ("label.palettes.palette_summary.mostly_purple", "prevažne fialová");
   P ("label.palettes.palette_harmony_label.complementary_palette", "komplementárna paleta");
   P ("label.palettes.palette_summary.mostly_green", "prevažne zelená");
   P ("label.palettes.palette_mood_label.moderate", "umiernená");
   P ("label.palettes.palette_summary.mostly_silver", "prevažne strieborná");
   P ("label.palettes.palette_harmony_label.varied_palette", "rôznorodá paleta");
   P ("label.palettes.palette_summary.mostly_olive", "prevažne olivová");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analogická paleta");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} z {v2, plural, one {1 páru} other {{v2, number} párov}} "
      & "spĺňa kontrast len pre veľký text");
   P ("label.palettes.palette_mood_label.light", "svetlá");
   P ("label.palettes.palette_summary.mostly_teal", "prevažne modrozelená");
   P ("label.palettes.palette_summary.mostly_aqua", "prevažne azúrová");
   P ("label.palettes.palette_summary.mostly_lime", "prevažne limetková");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "monochromatická paleta");
   P ("label.palettes.palette_summary.mostly_black", "prevažne čierna");
   P ("label.palettes.palette_summary.mostly_yellow", "prevažne žltá");
   P ("label.palettes.palette_summary.mostly_maroon", "prevažne gaštanová");
   P ("label.palettes.palette_summary.mostly_white", "prevažne biela");
   P ("label.palettes.palette_summary.mostly_orange", "prevažne oranžová");
   P ("label.palettes.palette_summary.mostly_fuchsia", "prevažne fuchsiová");
   P ("label.palettes.palette_harmony_label.neutral_palette", "neutrálna paleta");
   P ("label.palettes.palette_summary.mostly_red", "prevažne červená");
   P ("label.metrics.word_count_summary.n_words",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slová} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {{v1, number} veta} few {{v1, number} vety} many "
      & "{{v1, number} vety} other {{v1, number} viet}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} odsek} few {{v1, number} odseky} many "
      & "{{v1, number} odseku} other {{v1, number} odsekov}}");
   P ("label.metrics.reading_time.n_minutes_read", "{v1, number} min čítania");
   P ("label.metrics.speaking_time.n_minutes_spoken", "{v1, number} min hovorenia");
   P ("label.metrics.text_summary_with_options.n_words",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slová} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {{v1, number} veta} few {{v1, number} vety} many "
      & "{{v1, number} vety} other {{v1, number} viet}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {{v1, number} odsek} few {{v1, number} odseky} many "
      & "{{v1, number} odseku} other {{v1, number} odsekov}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "{v1, number} min čítania");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {{v1, number} odsek} few {{v1, number} odseky} many "
      & "{{v1, number} odseku} other {{v1, number} odsekov}}");
   P ("label.metrics.reading_time.less_than_n_minute_read", "menej ako {v1, number} min čítania");
end Labels_3;
