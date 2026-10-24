separate (Humanize.Catalogs.Phrase_Data.Locale_De_Ch)
procedure Labels_1 is
begin
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {Badge} new_badge {neues Badge} "
      & "updated_badge {aktualisiertes Badge} deprecated_badge {veraltetes "
      & "Badge} selected_badge {ausgewähltes Badge} disabled_badge "
      & "{deaktiviertes Badge} other {schliessbares Badge}} ({tone, select, "
      & "neutral_tone {neutral} info_tone {Info} success_tone {Erfolg} "
      & "warning_tone {Warnung} danger_tone {Gefahr} other {gedämpft}})");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {Standard-Badge} new_badge {neues Badge} "
      & "updated_badge {aktualisiertes Badge} deprecated_badge {veraltetes "
      & "Badge} selected_badge {ausgewähltes Badge} disabled_badge "
      & "{deaktiviertes Badge} other {schliessbares Badge}}");
   P ("label.badges.dismiss_label", "{name} schliessen");
   P ("label.builds.test_count_label",
      "{count, plural, =0 {keine Tests} one {1 Test} other {{count, number} "
      & "Tests}} {state, select, passed_test {bestanden} failed_test "
      & "{fehlgeschlagen} skipped_test {übersprungen} flaky_test {instabil} "
      & "other {erwartungsgemäss fehlgeschlagen}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {bestanden} failed_test {fehlgeschlagen} "
      & "skipped_test {übersprungen} flaky_test {instabil} other "
      & "{erwartungsgemäss fehlgeschlagen}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {informative Änderung} "
      & "minor_change {kleine Änderung} major_change {grössere Änderung} "
      & "other {inkompatible Änderung}}");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {verbessert} regressed "
      & "{verschlechtert} unchanged {unverändert} within_tolerance {innerhalb "
      & "der Toleranz} outside_tolerance {ausserhalb der Toleranz} new_value "
      & "{neu} removed_value {entfernt} other {Basiswert nicht verfügbar}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {verbessert} regressed {verschlechtert} "
      & "unchanged {unverändert} within_tolerance {innerhalb der Toleranz} "
      & "outside_tolerance {ausserhalb der Toleranz} new_value {neu} "
      & "removed_value {entfernt} other {Basiswert nicht verfügbar}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {um {difference_text} verbessert} "
      & "regressed {um {difference_text} verschlechtert} unchanged "
      & "{unverändert ({difference_text})} within_tolerance {innerhalb der "
      & "Toleranz ({difference_text})} outside_tolerance {ausserhalb der "
      & "Toleranz ({difference_text})} new_value {neu ({difference_text})} "
      & "removed_value {entfernt ({difference_text})} other {Basiswert nicht "
      & "verfügbar ({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {um {difference_text} verbessert} "
      & "regressed {um {difference_text} verschlechtert} unchanged "
      & "{unverändert ({difference_text})} within_tolerance {innerhalb der "
      & "Toleranz ({difference_text})} outside_tolerance {ausserhalb der "
      & "Toleranz ({difference_text})} new_value {neu ({difference_text})} "
      & "removed_value {entfernt ({difference_text})} other {Basiswert nicht "
      & "verfügbar ({difference_text})}}, Toleranz {tolerance_text}");
   P ("label.moderation.appeal_label",
      "{item}: Einspruch, {state, select, open_report {Meldung offen} "
      & "triaged_report {Meldung gesichtet} actioned_report {Massnahme "
      & "ergriffen} dismissed_report {Meldung abgewiesen} appealed_report "
      & "{Meldung angefochten} other {Meldung geschlossen}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {keine Moderationsmassnahme} flagged "
      & "{gekennzeichnet} hidden {vom Moderator ausgeblendet} restored "
      & "{wiederhergestellt} marked_spam {als Spam markiert} removed {entfernt} "
      & "other {eskaliert}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {keine Moderationsmassnahme} "
      & "flagged {gekennzeichnet} hidden {vom Moderator ausgeblendet} restored "
      & "{wiederhergestellt} marked_spam {als Spam markiert} removed {entfernt} "
      & "other {eskaliert}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {offene Meldung} triaged_report "
      & "{gesichtete Meldung} actioned_report {Massnahme ergriffen} "
      & "dismissed_report {abgewiesene Meldung} appealed_report {angefochtene "
      & "Meldung} other {geschlossene Meldung}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {offene Meldung} triaged_report "
      & "{gesichtete Meldung} actioned_report {Massnahme ergriffen} "
      & "dismissed_report {abgewiesene Meldung} appealed_report {angefochtene "
      & "Meldung} other {geschlossene Meldung}}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {Aufgabe abschliessen} other {{count, number} "
      & "Aufgaben abschliessen}}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {keine Beobachtungen} one {0 "
      & "Ausreisser bei 1 Beobachtung} other {0 Ausreisser bei {total, number} "
      & "Beobachtungen}}} one {{total, plural, one {1 Ausreisser bei 1 "
      & "Beobachtung} other {1 Ausreisser bei {total, number} Beobachtungen}}} "
      & "other {{outliers, number} Ausreisser bei {total, number} "
      & "Beobachtungen}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "aktueller Vordergrund erfüllt den Kontrast für grossen Text mit "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "{v1} für Kontrast {v2, number}:{v3, number} bei grossem Text "
      & "verwenden");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "{v1} für Kontrast {v2}:{v3, number} bei grossem Text verwenden");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "aktueller Vordergrund erfüllt den Kontrast für grossen Text mit {v1, "
      & "number}:{v2, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab Delta {v1}, grosser Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 Delta {v1}, grosser Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 Delta {v1}, grosser Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 Textil Delta {v1}, grosser Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 Delta {v1}, grosser Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab Delta {v1, number}, grosser Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 Delta {v1, number}, grosser Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 Textil Delta {v1, number}, grosser Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 Delta {v1, number}, grosser Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 Delta {v1, number}, grosser Wahrnehmungsunterschied");
   P ("label.names.nearest_color_name.white", "Weiss");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number} Kontrast für grossen Text");
   P ("label.contrast.readability_label.readable_for_large_text_only", "nur für grossen Text lesbar");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, grosser Text, heller Text auf dunklem Hintergrund");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number} Kontrast für grossen Text");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, grosser Text, heller Text auf dunklem Hintergrund");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} Kontrast für grossen Text nach Alpha-Compositing");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, Fliesstext, heller Text auf dunklem Hintergrund");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, Fliesstext, heller Text auf dunklem Hintergrund");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, grosser Text, dunkler Text auf hellem Hintergrund");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, grosser Text, dunkler Text auf hellem Hintergrund");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, Fliesstext, dunkler Text auf hellem Hintergrund");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, Fliesstext, dunkler Text auf hellem Hintergrund");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number} Kontrast für grossen Text");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} Kontrast für grossen Text");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} Kontrast für grossen Text nach "
      & "Alpha-Compositing");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v5, number} Paare: {v1, number} erhöht, {v2, number} normal, {v3, "
      & "number} nur grosser Text, {v4, number} nicht bestanden");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {1 Farbe} other {{v1, number} Farben}}, {v2, number} "
      & "Paare: {v3, number} erhöht, {v4, number} normal, {v5, number} nur "
      & "grosser Text, {v6, number} nicht bestanden");
   P ("label.palettes.palette_mood_label.moderate", "gemässigt");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, plural, one {1 von {v2, number} Paaren nur für grossen Text "
      & "geeignet} other {{v1, number} von {v2, number} Paaren nur für grossen "
      & "Text geeignet}}");
   P ("label.palettes.palette_summary.mostly_white", "überwiegend Weiss");
end Labels_1;
