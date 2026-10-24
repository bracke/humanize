separate (Humanize.Catalogs.Phrase_Data.Locale_De_Li)
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
end Labels_1;
