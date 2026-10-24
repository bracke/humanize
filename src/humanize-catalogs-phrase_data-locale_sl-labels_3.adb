separate (Humanize.Catalogs.Phrase_Data.Locale_Sl)
procedure Labels_3 is
begin
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
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
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
   P ("label.names.nearest_color_name.fuchsia", "fuksija");
   P ("label.names.nearest_color_name.yellow", "rumena");
   P ("label.names.nearest_color_name.red", "rdeča");
   P ("label.names.nearest_color_name.orange", "oranžna");
   P ("label.names.nearest_color_name.white", "bela");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number}, nizek kontrast");
   P ("label.contrast.readability_label.low_readability", "slaba berljivost");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, nezadosten, temno besedilo na svetlem ozadju");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number}, nizek kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, nezadosten, temno besedilo na svetlem ozadju");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "akromatopsija: zmerno tveganje zamenjave");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number} % – močna razlika");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, nizek kontrast po alfa mešanju");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, nezadosten, svetlo besedilo na temnem ozadju");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, nezadosten, svetlo besedilo na temnem ozadju");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "devteranopija: visoko tveganje zamenjave");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number}, kontrast velikega besedila");
   P ("label.contrast.readability_label.readable_for_large_text_only", "berljivo samo za veliko besedilo");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, veliko besedilo, svetlo besedilo na temnem ozadju");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number}, kontrast velikega besedila");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, veliko besedilo, svetlo besedilo na temnem ozadju");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopija: visoko tveganje zamenjave");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, kontrast velikega besedila po alfa mešanju");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, samo nebesedilni elementi, svetlo besedilo na temnem "
      & "ozadju");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, samo nebesedilni elementi, svetlo besedilo na temnem "
      & "ozadju");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopija: zmerno tveganje zamenjave");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number}, nizek kontrast");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number}, nizek kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, samo nebesedilni elementi, temno besedilo na svetlem "
      & "ozadju");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, samo nebesedilni elementi, temno besedilo na svetlem "
      & "ozadju");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "devteranopija: zmerno tveganje zamenjave");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopija: visoko tveganje zamenjave");
   P ("label.models.color_difference_label.n_very_different", "{v1, number} % – zelo različno");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "akromatopsija: visoko tveganje zamenjave");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "akromatopsija: nizko tveganje zamenjave");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, nizek kontrast po alfa mešanju");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number}, kontrast običajnega besedila");
   P ("label.contrast.readability_label.readable_for_normal_text", "berljivo za običajno besedilo");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, osnovno besedilo, svetlo besedilo na temnem ozadju");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number}, kontrast običajnega besedila");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, osnovno besedilo, svetlo besedilo na temnem ozadju");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, veliko besedilo, temno besedilo na svetlem ozadju");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, veliko besedilo, temno besedilo na svetlem ozadju");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number} % – subtilna razlika");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, osnovno besedilo, temno besedilo na svetlem ozadju");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, osnovno besedilo, temno besedilo na svetlem ozadju");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopija: nizko tveganje zamenjave");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number} % – opazna razlika");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, kontrast velikega besedila");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, kontrast velikega besedila");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "devteranopija: nizko tveganje zamenjave");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number}, izboljšan kontrast");
   P ("label.contrast.readability_label.readable_for_enhanced_text",
      "berljivo za besedilo z izboljšanim kontrastom");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number}, izboljšan kontrast");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, subtilna zaznavna razlika");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopija: barve razločljive");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, kontrast običajnega besedila po alfa "
      & "mešanju");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopija: zmerno tveganje zamenjave");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, kontrast običajnega besedila po alfa mešanju");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, kontrast velikega besedila po alfa mešanju");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, odličen, temno besedilo na svetlem ozadju");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, odličen, temno besedilo na svetlem ozadju");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, kontrast običajnega besedila");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, kontrast običajnega besedila");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number}, izboljšan kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, odličen, svetlo besedilo na temnem ozadju");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number}, izboljšan kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, odličen, svetlo besedilo na temnem ozadju");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "devteranopija: barve razločljive");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, izboljšan kontrast po alfa mešanju");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, komaj zaznavna");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number} % – skoraj enako");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopija: nizko tveganje zamenjave");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "akromatopsija: barve razločljive");
   P ("label.palettes.palette_summary.n_colors",
      "{v1, plural, one {{v1, number} barva} two {{v1, number} barvi} few "
      & "{{v1, number} barve} other {{v1, number} barv}}");
   P ("label.palettes.palette_summary.mostly_gray", "pretežno siva");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "zmeren razpon kontrasta");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "ozadje {v1}, besedilo {v2}, poudarek {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triadna paleta");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "najboljši kontrast: {v1} na {v2} pri {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} od {v2, plural, one {{v2, number} para} other {{v2, "
      & "number} parov}} dosega kontrast običajnega besedila");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "izboljšan {v1, number}, običajen {v2, number}, samo veliko besedilo "
      & "{v3, number}, neuspešno {v4, number} (od {v5, plural, one {{v5, "
      & "number} para} other {{v5, number} parov}})");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {{v1, number} barva} two {{v1, number} barvi} few "
      & "{{v1, number} barve} other {{v1, number} barv}}, {v2, plural, one "
      & "{{v2, number} par} two {{v2, number} para} few {{v2, number} pari} "
      & "other {{v2, number} parov}}: izboljšan {v3, number}, običajen {v4, "
      & "number}, samo veliko besedilo {v5, number}, neuspešno {v6, number}");
   P ("label.palettes.palette_mood_label.balanced", "uravnotežena");
   P ("label.palettes.palette_mood_label.vibrant", "živahna");
   P ("label.palettes.palette_mood_label.warm_mood", "toplo razpoloženje");
   P ("label.palettes.palette_summary.mostly_blue", "pretežno modra");
   P ("label.palettes.palette_summary.low_contrast_spread", "nizek razpon kontrasta");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "paleta z enim poudarkom");
   P ("label.palettes.palette_mood_label.dark", "temna");
   P ("label.palettes.palette_mood_label.cool_mood", "hladno razpoloženje");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "pretežno rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "ni dostopnih besedilnih parov");
   P ("label.palettes.palette_mood_label.subtle", "subtilna");
   P ("label.palettes.palette_summary.high_contrast_spread", "visok razpon kontrasta");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "najboljši kontrast: {v1} na {v2} pri {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "nevtralno razpoloženje");
   P ("label.palettes.palette_summary.mostly_purple", "pretežno vijolična");
   P ("label.palettes.palette_harmony_label.complementary_palette", "komplementarna paleta");
   P ("label.palettes.palette_summary.mostly_green", "pretežno zelena");
   P ("label.palettes.palette_mood_label.moderate", "zmerna");
   P ("label.palettes.palette_summary.mostly_silver", "pretežno srebrna");
   P ("label.palettes.palette_harmony_label.varied_palette", "raznolika paleta");
   P ("label.palettes.palette_summary.mostly_olive", "pretežno olivna");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analogna paleta");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} od {v2, plural, one {{v2, number} para} other {{v2, "
      & "number} parov}} dosega kontrast samo za veliko besedilo");
   P ("label.palettes.palette_mood_label.light", "svetla");
   P ("label.palettes.palette_summary.mostly_teal", "pretežno modrozelena");
   P ("label.palettes.palette_summary.mostly_aqua", "pretežno akva");
   P ("label.palettes.palette_summary.mostly_lime", "pretežno limetna");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "enobarvna paleta");
   P ("label.palettes.palette_summary.mostly_black", "pretežno črna");
   P ("label.palettes.palette_summary.mostly_yellow", "pretežno rumena");
   P ("label.palettes.palette_summary.mostly_maroon", "pretežno kostanjeva");
   P ("label.palettes.palette_summary.mostly_white", "pretežno bela");
   P ("label.palettes.palette_summary.mostly_orange", "pretežno oranžna");
   P ("label.palettes.palette_summary.mostly_fuchsia", "pretežno fuksija");
   P ("label.palettes.palette_harmony_label.neutral_palette", "nevtralna paleta");
   P ("label.palettes.palette_summary.mostly_red", "pretežno rdeča");
   P ("label.metrics.word_count_summary.n_words",
      "{v1, plural, one {{v1, number} beseda} two {{v1, number} besedi} few "
      & "{{v1, number} besede} other {{v1, number} besed}}");
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {{v1, number} poved} two {{v1, number} povedi} few "
      & "{{v1, number} povedi} other {{v1, number} povedi}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} odstavek} two {{v1, number} odstavka} "
      & "few {{v1, number} odstavki} other {{v1, number} odstavkov}}");
   P ("label.metrics.reading_time.n_minutes_read", "{v1, number} min branja");
   P ("label.metrics.speaking_time.n_minutes_spoken", "{v1, number} min govora");
   P ("label.metrics.text_summary_with_options.n_words",
      "{v1, plural, one {{v1, number} beseda} two {{v1, number} besedi} few "
      & "{{v1, number} besede} other {{v1, number} besed}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {{v1, number} poved} two {{v1, number} povedi} few "
      & "{{v1, number} povedi} other {{v1, number} povedi}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {{v1, number} odstavek} two {{v1, number} odstavka} "
      & "few {{v1, number} odstavki} other {{v1, number} odstavkov}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "{v1, number} min branja");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {{v1, number} odstavek} two {{v1, number} odstavka} "
      & "few {{v1, number} odstavki} other {{v1, number} odstavkov}}");
   P ("label.metrics.reading_time.less_than_n_minute_read", "manj kot {v1, number} min branja");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "manj kot {v1, number} min govora");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {{v1, number} odstavek} two {{v1, number} odstavka} "
      & "few {{v1, number} odstavki} other {{v1, number} odstavkov}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "manj kot {v1, number} min branja");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {{v1, number} poved} two {{v1, number} povedi} few "
      & "{{v1, number} povedi} other {{v1, number} povedi}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {{v1, number} poved} two {{v1, number} povedi} few "
      & "{{v1, number} povedi} other {{v1, number} povedi}}");
   P ("label.metrics.word_count_summary.no_words", "ni besed");
   P ("label.metrics.sentence_count_summary.no_sentences", "ni povedi");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "ni odstavkov");
   P ("label.metrics.text_summary_with_options.no_words", "ni besed");
   P ("label.metrics.text_summary_with_options.no_sentences", "ni povedi");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "ni odstavkov");
   P ("label.metrics.word_count_summary.n_word",
      "{v1, plural, one {{v1, number} beseda} two {{v1, number} besedi} few "
      & "{{v1, number} besede} other {{v1, number} besed}}");
   P ("label.metrics.text_summary_with_options.n_word",
      "{v1, plural, one {{v1, number} beseda} two {{v1, number} besedi} few "
      & "{{v1, number} besede} other {{v1, number} besed}}");
end Labels_3;
