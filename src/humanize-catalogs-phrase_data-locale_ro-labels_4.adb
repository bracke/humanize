separate (Humanize.Catalogs.Phrase_Data.Locale_Ro)
procedure Labels_4 is
begin
   P ("label.diagnostics.check_run_summary_label.none", "nicio verificare rulată");
   P ("label.diagnostics.check_run_summary_label.passed", "reușite: {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "eșuate: {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {{count, number} avertisment} few {{count, number} "
      & "avertismente} other {{count, number} de avertismente}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "omise: {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "în așteptare: {count, number}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {{count, number} element} few {{count, number} "
      & "elemente} other {{count, number} de elemente}}");
   P ("label.workflows.workflow_summary_label.completed", "finalizate: {count, number}");
   P ("label.workflows.workflow_summary_label.active", "active: {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "blocate: {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "eșuate: {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "omise: {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {{count, number} element} few {{count, number} "
      & "elemente} other {{count, number} de elemente}}");
   P ("label.changes.change_summary_label.added", "adăugate: {count, number}");
   P ("label.changes.change_summary_label.removed", "eliminate: {count, number}");
   P ("label.changes.change_summary_label.modified", "modificate: {count, number}");
   P ("label.changes.change_summary_label.renamed", "redenumite: {count, number}");
   P ("label.changes.change_summary_label.unchanged", "nemodificate: {count, number}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {buton} link_control {link} tab_control "
      & "{filă} menu_item_control {element de meniu} checkbox_control {casetă "
      & "de selectare} radio_control {buton radio} text_field_control {câmp de "
      & "text} progress_control {indicator de progres} table_cell_control "
      & "{celulă de tabel} region_control {regiune} other {control}} {named, "
      & "select, no {fără nume} other {{name}}}");
   P ("label.markup.accessible_control_label.selected", "selectat");
   P ("label.markup.accessible_control_label.expanded", "extins");
   P ("label.markup.accessible_control_label.current", "curent");
   P ("label.markup.accessible_control_label.disabled", "dezactivat");
   P ("label.markup.accessible_control_label.required", "obligatoriu");
   P ("label.markup.accessible_control_label.invalid", "nevalid");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {{count, number} element} few {{count, number} "
      & "elemente} other {{count, number} de elemente}}");
   P ("label.markup.accessible_control_label.position", "elementul {position} din {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {{count, number} problemă} few {{count, number} "
      & "probleme} other {{count, number} de probleme}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "schemă");
   P ("label.endpoints.url_component.host", "gazdă");
   P ("label.endpoints.url_component.path", "cale");
   P ("label.endpoints.url_component.query", "interogare");
   P ("label.endpoints.url_component.fragment", "fragment");
   P ("label.names.hue_noun.red", "roșu");
   P ("label.names.hue_noun.orange", "portocaliu");
   P ("label.names.hue_noun.yellow", "galben");
   P ("label.names.hue_noun.green", "verde");
   P ("label.names.hue_noun.cyan", "cyan");
   P ("label.names.hue_noun.blue", "albastru");
   P ("label.names.hue_noun.purple", "violet");
   P ("label.names.hue_noun.magenta", "magenta");
   P ("label.names.hue_noun.neutral", "neutru");
   P ("label.names.hue_noun.pink", "roz");
   P ("label.names.hue_gender.red", "neuter");
   P ("label.names.hue_gender.orange", "neuter");
   P ("label.names.hue_gender.yellow", "neuter");
   P ("label.names.hue_gender.green", "neuter");
   P ("label.names.hue_gender.cyan", "neuter");
   P ("label.names.hue_gender.blue", "neuter");
   P ("label.names.hue_gender.purple", "neuter");
   P ("label.names.hue_gender.magenta", "neuter");
   P ("label.names.hue_gender.neutral", "neuter");
   P ("label.names.hue_gender.pink", "neuter");
   P ("label.names.agree.very_dark", "{gender, select, feminine {foarte închisă} other {foarte închis}}");
   P ("label.names.agree.dark", "{gender, select, feminine {închisă} other {închis}}");
   P ("label.names.agree.medium_brightness", "{gender, select, other {de luminozitate medie}}");
   P ("label.names.agree.light", "{gender, select, feminine {deschisă} other {deschis}}");
   P ("label.names.agree.very_light", "{gender, select, feminine {foarte deschisă} other {foarte deschis}}");
   P ("label.names.agree.desaturated", "{gender, select, feminine {desaturată} other {desaturat}}");
   P ("label.names.agree.muted", "{gender, select, feminine {estompată} other {estompat}}");
   P ("label.names.agree.neutral", "{gender, select, feminine {neutră} other {neutru}}");
   P ("label.names.agree.saturated", "{gender, select, feminine {saturată} other {saturat}}");
   P ("label.names.agree.vivid", "{gender, select, feminine {vie} other {viu}}");
   P ("label.names.agree.grayish", "{gender, select, feminine {cenușie} other {cenușiu}}");
   P ("label.names.agree.soft", "{gender, select, feminine {delicată} other {delicat}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {de cromă moderată}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {de cromă ridicată}}");
   P ("label.names.agree.pastel", "{gender, select, other {pastel}}");
   P ("label.names.agree.warm", "{gender, select, feminine {caldă} other {cald}}");
   P ("label.names.agree.cool", "{gender, select, other {rece}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {de temperatură neutră}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {de temperatură echilibrată}}");
   P ("label.names.color_description", "{hue} {brightness}, {saturation}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{base, select, pink {{hue}} other {{hue}}} {brightness} {chroma} "
      & "{temperature}");
end Labels_4;
