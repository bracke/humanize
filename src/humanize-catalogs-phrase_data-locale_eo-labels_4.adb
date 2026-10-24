separate (Humanize.Catalogs.Phrase_Data.Locale_Eo)
procedure Labels_4 is
begin
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {1 alineo} other {{v1, number} alineoj}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "{v1, plural, one {malpli ol 1 minuto da legado} other {malpli ol {v1, "
      & "number} minutoj da legado}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "{v1, plural, one {malpli ol 1 minuto da parolado} other {malpli ol "
      & "{v1, number} minutoj da parolado}}");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {1 alineo} other {{v1, number} alineoj}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "{v1, plural, one {malpli ol 1 minuto da legado} other {malpli ol {v1, "
      & "number} minutoj da legado}}");
   P ("label.metrics.sentence_count_summary.n_sentence", "{v1, plural, one {1 frazo} other {{v1, number} frazoj}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {1 frazo} other {{v1, number} frazoj}}");
   P ("label.metrics.word_count_summary.no_words", "neniuj vortoj");
   P ("label.metrics.sentence_count_summary.no_sentences", "neniuj frazoj");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "neniuj alineoj");
   P ("label.metrics.text_summary_with_options.no_words", "neniuj vortoj");
   P ("label.metrics.text_summary_with_options.no_sentences", "neniuj frazoj");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "neniuj alineoj");
   P ("label.metrics.word_count_summary.n_word", "{v1, plural, one {1 vorto} other {{v1, number} vortoj}}");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, plural, one {1 vorto} other {{v1, number} vortoj}}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.endpoints.url_label", "{state, select, empty {malplena URL} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {malplena URL} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[kaŝita uzanto]");
   P ("label.endpoints.url_label.query",
      "demando {count, plural, one {1 parametro} other {{count, number} "
      & "parametroj}}");
end Labels_4;
